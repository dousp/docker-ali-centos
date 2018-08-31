FROM centos:centos7

LABEL name="CentOS7 latest"

MAINTAINER Douspeng "douspeng@sina.cn"

RUN  \
        yum install -y wget && \
        mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup && \
        wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
        wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/epel-7.repo && \
        yum update -y && yum makecache && \
        rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
        yum -y install kde-l10n-Chinese && yum -y reinstall glibc-common && \
        localedef -c -f UTF-8 -i zh_CN zh_CN.utf8   && \
        echo "export LC_ALL=zh_CN.utf8" >> /etc/profile && \
        yum clean all

ENV LC_ALL zh_CN.utf8

EXPOSE 22
