#!/bin/bash
sed -i "s/123456/$BOTQQ/g" /workspace/gocqfile/config.yml
sed -i "s/123456/$BOTQQ/g" /workspace/OlivOS/conf/account.json
sed -i "s/100000/$MASTER/g" /workspace/OlivOS/plugin/data/OlivaDice/unity/console/switch.json
cd /workspace/OlivOS && nohup python3 main.py >/dev/null 2>&1 &
cd /workspace && ./go-cqhttp -w gocqfile faststart
