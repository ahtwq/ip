#!/bin/bash

#初始化ip
cd /home/asus/tang/addmore/getIp
date > serverIP.txt
echo -n "IP: " >> serverIP.txt

curl www.trackip.net/i > include_ip.txt
ip=$(grep -Po '(1\d{2}|2[0-4]\d|25[0-5]|[1-9]\d|[1-9])(\.(1\d{2}|2[0-4]\d|25[0-5]|[1-9]\d|\d)){3}' include_ip.txt | head -1)

echo $ip >> serverIP.txt

git add . 
git commit -m 'capture IP'
git push -u origin master


#while true
#do
#    date > serverIP.txt
#    echo -n "IP: " >> serverIP.txt
#    curl www.trackip.net/i > include_ip.txt
#    ip_new=$(grep -Po '(1\d{2}|2[0-4]\d|25[0-5]|[1-9]\d|[1-9])(\.(1\d{2}|2[0-4]\d|25[0-5]|[1-9]\d|\d)){3}' include_ip.txt | head -1)
#
#	if [ "$ip" != "$ip_new" ]; then
#		ip=$ip_new
#        echo $ip >> serverIP.txt
#        git add .
#        git commit -m 'capture IP'
#        git push -u origin master
#	fi
#	sleep 10m
#done
