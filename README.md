ath9k_watchdog
==============

a ath9k watchdog script for dd-wrt

I have a TP-Link TL-WR841ND v8 router,everthing works ok except wifi freezes sometimes. 

When the wifi freezes,dmesg command shows that "ath: phy0: Failed to stop TX DMA, queues=0x004!" 

As far as I see,much device have this problem with ath9k driver.So I wrote an ugly script to solve this problem temporarily.This is a long-standing problem,I hope that dd-wrt would fix it. 

Save the command below as Startup and then reboot the router,dd-wrt would reset wireless service if necessary.BTW,you should enable syslogd service. 
