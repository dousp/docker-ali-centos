FROM centos:centos7

LABEL name="CentOS7 latest"

MAINTAINER Douspeng "douspeng@sina.cn"
# 安装wget工具
RUN yum install -y wget
# 切换阿里源
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/epel-7.repo
# 生成缓存
RUN yum update -y && yum makecache

#########################################中文乱码处理################################################
# 时区设置
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 安装中文支持
RUN yum -y install kde-l10n-Chinese && yum -y reinstall glibc-common
# 配置显示中文
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
# 设置环境变量
ENV LC_ALL zh_CN.utf8
RUN echo "export LC_ALL=zh_CN.utf8" >> /etc/profile

# 清理，也可以先卸载一些不需要的软件 这样build出来的镜像会更小
RUN yum clean all


EXPOSE 22