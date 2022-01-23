# ovoenv 直连
FROM rhwong/ovoenv:1.2
WORKDIR /workspace
# 添加环境
ENV BOTQQ 123456
ENV MASTER 100000
# 安装OlivOS框架及运行环境
RUN git clone https://github.com/OlivOS-Team/OlivOS.git
RUN pip install -r /workspace/OlivOS/requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/
# 安装基础插件
RUN wget -P /workspace/OlivOS/plugin/app/ https://github.com/OlivOS-Team/OlivaDiceCore/releases/latest/download/OlivaDiceCore.opk
RUN wget -P /workspace/OlivOS/plugin/app/ https://github.com/OlivOS-Team/OlivaDiceJoy/releases/latest/download/OlivaDiceJoy.opk
RUN wget -P /workspace/OlivOS/plugin/app/ https://github.com/OlivOS-Team/OlivaDiceLogger/releases/latest/download/OlivaDiceLogger.opk
RUN wget -P /workspace/OlivOS/plugin/app/ https://github.com/OlivOS-Team/OlivaDiceMaster/releases/latest/download/OlivaDiceMaster.opk
# 安装go-cqhttp
RUN wget https://github.com/Mrs4s/go-cqhttp/releases/latest/download/go-cqhttp_linux_amd64.tar.gz
RUN tar -zxvf go-cqhttp_linux_amd64.tar.gz
# 下载运行脚本及配置文件
RUN wget https://raw.githubusercontent.com/rhwong/olivadice-docker/main/bat/start.sh
RUN wget -P /workspace/gocqfile https://raw.githubusercontent.com/rhwong/olivadice-docker/main/gocqconfig/config.yml -N
RUN wget -P /workspace/OlivOS/conf https://raw.githubusercontent.com/rhwong/olivadice-docker/main/ovoconfig/account.json -N
RUN wget -P /workspace/OlivOS/plugin/data/OlivaDice/unity/console https://raw.githubusercontent.com/rhwong/olivadice-docker/main/ovoconfig/switch.json -N
# 给予权限
RUN chmod -R 766 /workspace
# 启动
CMD /workspace/start.sh && bash