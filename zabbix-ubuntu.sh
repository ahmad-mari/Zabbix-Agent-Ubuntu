#!/bin/bash
wget https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_latest+ubuntu24.04_all.deb
sudo apt-get update
sudo apt-get install zabbix-agent -y
sed -i 's/ServerActive=127.0.0.1/ServerActive=10.26.3.165/g' /etc/zabbix/zabbix_agentd.conf
sed -i 's/Server=127.0.0.1/Server=10.26.3.165/g' /etc/zabbix/zabbix_agentd.conf
sudo ufw allow 10050/tcp
sudo systemctl restart zabbix-agent
sudo systemctl status zabbix-agent


