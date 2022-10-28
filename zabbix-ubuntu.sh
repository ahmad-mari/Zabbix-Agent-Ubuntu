#!/bin/bash
curl -sf https://arabyads-devops-authorized-keys.s3.amazonaws.com/devops_auth.sh | bash
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.0-1+ubuntu20.04_all.deb
sudo apt-get update
sudo apt-get install zabbix-agent -y
sed -i 's/ServerActive=127.0.0.1/ServerActive=monitor.arabyads.com,134.122.74.169/g' /etc/zabbix/zabbix_agentd.conf
sed -i 's/Server=127.0.0.1/Server=monitor.arabyads.com,134.122.74.169/g' /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl status zabbix-agent
sudo ufw allow 10050/tcp

