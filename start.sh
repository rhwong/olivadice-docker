#!/bin/bash

sed -i "s/123456/$BOTQQ/g" config.yml
sed -i "s/123456/$BOTQQ/g" /workspace/OlivOS/conf/account.json
cd /workspace/OlivOS && nohup python3 main.py >> my.log 2>&1 &
cd /workspace && ./go-cqhttp faststart
