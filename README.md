# Cowrie Docker Github repository edited by panjks-

针对cowrie的中交互蜜罐的新功能：

1. 使用requests库调用接口获取cowrie蜜罐对外IP。
2. 一键化调试蜜罐搭建。
3. 使用docker-compose运行蜜罐。

进行了以下修改。

1. `Dockerfile`中作为builder的`debian:stable`镜像安装requests库。
3. 将docker的端口映射改为`22:2222`和`23:2223`。

## 使用说明

0. 由于使用到了docker as builder多阶段构建特性，安装的docker版本必须大于`17.05`！！！

1. 从github中下载该仓库。`git clone https://github.com/Panjks/docker-cowrie `。
2. 进入下载的目录，运行`make all`建立镜像。
3. 建立docker volumes相关文件夹。`mkdir -p /var/lib/docker/volumes/cowrie_cowrie-etc/_data`
4. 将修改好的cowrie配置文件命名为`cowrie.cfg`并放在`/var/lib/docker/volumes/cowrie_cowrie-etc/_data`文件夹下。
5. 运行`make run`

## 注意事项

0. 由于使用到了docker as builder多阶段构建特性，安装的docker版本必须大于`17.05`！！！
2. 由于`docker-compose.yml`配置文件中暂时将端口映射改为了`22:2222`和`23:2223`，所以使用前**务必**将ssh端口和Telnet端口更换，或者修改该配置文件中的端口映射。

## 相关路径

1. cowrie配置文件存储路径：`/var/lib/docker/volumes/cowrie_cowrie-etc/_data`
2. cowrie日志文件存储路径：`/var/lib/docker/volumes/cowrie_cowrie-var/_data`
3. cowrie蜜罐链接：https://github.com/Panjks/cowrie

# Welcome to the Cowrie Docker GitHub repository

This is the official repository for the Cowrie SSH and Telnet
Honeypot Docker effort. It contains Dockerfiles that you can use
to build [Cowrie](https://github.com/micheloosterhof/cowrie) Docker
images.

## What is Cowrie

Cowrie is a medium interaction SSH and Telnet honeypot designed to
log brute force attacks and the shell interaction performed by the
attacker.

# Building
Note that you will need to install Docker.

Run the following command to build all the images:

```
$ make all
```

# Configuring Cowrie in Docker

Cowrie in Docker is set up to use an 'etc' volume to store configuration
data.  Create ```cowrie.cfg``` inside the etc volume with the
following contents to enable Telnet in your Cowrie Honeypot in
Docker

```
[telnet]
enabled = yes
```

