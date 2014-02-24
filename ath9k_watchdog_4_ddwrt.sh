#!/bin/sh
INTERFACE=`nvram get wl0_ifname`
echo "0" > /tmp/ath9k_watchdog_reset_lock
watchdog_reset_wifi ()
{
	read RESET_WIFI_LOCK < /tmp/ath9k_watchdog_reset_lock
	if [ "${RESET_WIFI_LOCK}" = "0" ]; then
		echo "1" > /tmp/ath9k_watchdog_reset_lock
		#Restart lan service(including wirelss service)
		startservice lan
		sleep 5
		echo "0" > /tmp/ath9k_watchdog_reset_lock
	fi
}
watchdog_main()
{
tail -F -n 1 /var/log/messages | while read line 
do
	case "$line" in 
	*"Failed to stop TX DMA"*)
		watchdog_reset_wifi &
		;;   
	*"disconnected due to excessive missing ACKs"*) 
		iw dev ${INTERFACE} scan
		;; 
	*) 
		;; 
	esac 
done
}
watchdog_main &
