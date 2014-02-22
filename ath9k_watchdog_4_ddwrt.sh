#!/bin/sh
INTERFACE=`nvram get wl0_ifname`
tail -F -n 1 /var/log/messages | while read line 
do
   case "$line" in 
   *"Failed to stop TX DMA"*) 
         #Restart lan service(including wirelss service) 
         startservice_f lan 
      ;;   
   *"disconnected due to excessive missing ACKs"*) 
         iw dev ${INTERFACE} scan
      ;; 
   *) 
      ;; 
   esac 
done
