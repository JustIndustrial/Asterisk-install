#!/bin/bash



mv /etc/asterisk/pjsip.conf /etc/asterisk/pjsip.old
mv /etc/asterisk/extensions.conf /etc/asterisk/extensions.old

cp *.conf /etc/asterisk

sed "s/CHANGEUSER/$1/g" -i /etc/asterisk/voipms.conf
sed "s/CHANGEPASS/$2/g" -i /etc/asterisk/voipms.conf
sed "s/CHANGEPASS/$2/g" -i /etc/asterisk/pjsip.conf
sed "s/PUBLICIP/$3/g" -i /etc/asterisk/pjsip.conf

asterisk -rx "core restart now"





