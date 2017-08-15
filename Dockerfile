FROM docker:latest

## 设置alpine linux 阿里云源
RUN cp /etc/apk/repositories /etc/apk/repositories.bak
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main/" > /etc/apk/repositories

## 设置时区
RUN apk update && apk add curl bash tree tzdata && cp -r -f /usr/share/zoneinfo/PRC /etc/localtime && echo -ne "Alpine Linux 3.6 image. (`uname -rsv`)\n" >> /root/.built

## 添加工具
RUN apk add nodejs nodejs-npm git

## 添加阿里云
RUN npm config set registry https://registry.npm.taobao.org/

## 添加和显示npm配置
RUN npm config list

## 检查信息
CMD ['node','--version']
CMD ['docker','info']
