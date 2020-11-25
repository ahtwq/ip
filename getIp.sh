#!/bin/bash

#初始化ip
cd /home/asus/tang/addmore/getIp
date > serverIP.txt
echo "IP: " >> serverIP.txt

curl www.trackip.net/i > iptemp.txt
ip=$(grep -Po '(1\d{2}|2[0-4]\d|25[0-5]|[1-9]\d|[1-9])(\.(1\d{2}|2[0-4]\d|25[0-5]|[1-9]\d|\d)){3}' iptemp.txt | head -1)

echo $ip >> serverIP.txt

git add . 
git commit -m 'capture IP'
git push -u origin master


while true
do
    date > serverIP.txt
    echo "IP: " >> serverIP.txt
    curl www.trackip.net/i > iptemp.txt
    ip_new=$(grep -Po '(1\d{2}|2[0-4]\d|25[0-5]|[1-9]\d|[1-9])(\.(1\d{2}|2[0-4]\d|25[0-5]|[1-9]\d|\d)){3}' iptemp.txt | head -1)
    
	if [ "$ip" != "$ip_new" ]; then
		ip=$ip_new
        echo $ip >> serverIP.txt
        git add . 
        git commit -m 'capture IP'
        git push -u origin master
        # commit

	fi
	sleep 10m
done
