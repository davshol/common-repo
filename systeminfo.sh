#!/bin/sh
#get cpu load usage
top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}' 

#get memory usage
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

#get disk usage
df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n\n", $3,$2,$5}'

#get info on network usage
echo network usage information 
ifconfig|grep -i "RX Packets"


#get info on logged in usage
echo signed in users 
w -i | awk 'NR>=3{printf "\n user name: %s from %s  login %s \n", $1,$3,$4}'
