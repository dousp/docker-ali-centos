FROM centos:7.4.1708

MAINTAINER Douspeng "douspeng@sina.cn"

RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN yum install -y wget
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/epel-7.repo
RUN yum clean all
# RUN yum makecache
EXPOSE 22