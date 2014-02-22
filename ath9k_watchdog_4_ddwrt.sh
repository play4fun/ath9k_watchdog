#!/bin/sh 
tail -F -n 1 /var/log/messages | while read line 
do 
   case "$line" in 
   *"Failed to stop TX DMA"*) 
         #Restart lan service(including wirelss service) 
         startservice_f lan 
      ;; 
   *) 
      ;; 
   esac 
done