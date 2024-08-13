#!/bin/bash

rm -f $0
apt update
apt install curl -y
apt install jq -y

curl -sL "https://raw.githubusercontent.com/izzstores/slowdns/main/slowdns.sh" -o /tmp/slowdns.sh
chmod +x /tmp/slowdns.sh
bash /tmp/slowdns.sh

clear
echo " Prosess Installasi Slowdns"

curl -sL "https://raw.githubusercontent.com/izzstores/slowdns/main/sd.sh" -o /usr/bin/sd
chmod +x /usr/bin/sd

clear
echo -e " Prosess Installasi Slowdns Success"
echo -e " Silahkan ketik ( sd ) tanpa tanda kurung"
