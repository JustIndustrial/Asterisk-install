#!/bin/bash
apt install net-tools -y
apt install openssh-server -y
apt install traceroute -y
apt install build-essential -y
apt install libedit-dev -y
apt install libssl-dev -y
apt install libncurses5-dev -y
apt install libnewt-dev -y
apt install libxml2-dev -y
apt install libsqlite3-dev -y
apt install libjansson-dev -y
apt install uuid-dev -y


groupadd asterisk
useradd -r -d /var/lib/asterisk -g asterisk asterisk


cd /usr/local/src
wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz
tar xf asterisk-*-current.tar.gz
rm asterisk-*-current.tar.gz
cd asterisk-*
./configure
make
make install
make samples
make config
ldconfig


cd /usr/local/src/asterisk-*/contrib/init.d

cp etc_default_asterisk /etc/default/asterisk
sed '8,9s/^#//' -i /etc/default/asterisk/etc_default_asterisk

cp rc.debian.asterisk /etc/init.d/asterisk
sed "s+DAEMON=.*+DAEMON=/usr/sbin/asterisk+" -i /etc/init.d/asterisk/rc.debian.asterisk
sed "s+ASTVARRUNDIR=.*+ASTVARRUNDIR=/var/run/asterisk+" -i /etc/init.d/asterisk/rc.debian.asterisk
sed "s+ASTETCDIR=.*+ASTETCDIR=/etc/asterisk+" -i /etc/init.d/asterisk/rc.debian.asterisk


chown -R asterisk.asterisk /etc/asterisk
chown -R asterisk.asterisk /var/{lib,log,spool}/asterisk
chown -R asterisk.asterisk /usr/lib/asterisk


systemctl enable asterisk
systemctl start asterisk
