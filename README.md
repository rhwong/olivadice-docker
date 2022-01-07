# ovodice_docker
Docker Hub: https://hub.docker.com/repository/docker/rhwong/oliva-dice
# oliva-dice docker部署教程
## 简介
本项目基于AMD64平台

通过本镜像，你可以快速启用基于OlivOS的QQ投骰机器人。

本项目旨在快速启用与go-cqhttp对接，并未考虑其他平台。

若需要对接其他平台，你可手动设置挂载出来的配置文件。
## 全新启用
首先返回用户目录（你也可以指定其他位置）
```shell
cd ~
```
创建挂载文件夹及简易配置
```shell
mkdir -p OlivOS/logfile
wget -P ./OlivOS/gocqfile https://www.aobacore.com/Git/ovo/config.yml -N
wget -P ./OlivOS/plugin/data/OlivaDice/unity/console https://www.aobacore.com/Git/ovo/switch.json -N
```
拉取镜像

```shell
docker pull rhwong/oliva-dice:3.1.6.1011
```
### 启动容器
```shell
docker run -it --name="oliva" -m 512M \
-e BOTQQ="123456" -e MASTER="100000" \
-v "$(pwd)"/OlivOS/logfile:/workspace/OlivOS/logfile \
-v "$(pwd)"/OlivOS/plugin/data:/workspace/OlivOS/plugin/data  \
-v "$(pwd)"/OlivOS/gocqfile:/workspace/gocqfile \
--restart=always rhwong/oliva-dice:3.1.6.1011
```

1008611处自行替换成你bot的QQ号码，1000000处替换主人QQ。扫码登录即可正常运行bot

如果你的终端支持显示字符二维码，就可以直接扫码。如果不支持，打开此文件来扫码：`./OlivOS/gocqfile/qrcode.png`

扫码完成并登录成功后，按 `CTRL+P+Q` 保持后台运行Docker容器

### 容器停止

 `docker stop oliva` 

### 容器重启

 `docker restart oliva` 

### 例外处置和说明

若有其他配置文件和插件，可以在创建docker的时候挂载进去

若出现登录失效、冻结等情况，可以直接删除该容器

 `docker stop oliva & docker rm oliva` 

数据文件已经保存在"$(pwd)"/oliva/data，重复最开始的容器创建操作即可



## 安装新插件

```shell
docker exec -it oliva bash -c "wget -P /workspace/OlivOS/plugin/app/ https://插件的下载地址/
```

## 更新版本

先停止删除旧的容器
 `docker stop oliva & docker rm oliva` 

旧的镜像可以不删除，拉取新版本会更快

```shell
docker pull rhwong/oliva-dice:3.1.6.1011
```
### 启动容器

还是先返回到最上级目录(或文章开头处你设置的其他位置)
```shell
cd ~
```
启动新的容器并挂载数据
```shell
docker run -it --name="oliva" -m 512M \
-e BOTQQ="123456" -e MASTER="100000" \
-v "$(pwd)"/OlivOS/logfile:/workspace/OlivOS/logfile \
-v "$(pwd)"/OlivOS/plugin/data:/workspace/OlivOS/plugin/data  \
-v "$(pwd)"/OlivOS/gocqfile:/workspace/gocqfile \
--restart=always rhwong/oliva-dice:3.1.6.1011
```

Froked by 
https://github.com/Mrs4s/go-cqhttp
https://github.com/OlivOS-Team/OlivOS
https://github.com/OlivOS-Team/OlivaDiceCore
