FROM centos:6.6
MAINTAINER kyawphyonaing

# update yum
RUN yum update -y && \
    yum clean all

# EPEL
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
# Add repo
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

# install php, mysql, httpd
RUN yum -y install php56w php56w-opcache php56w-common php56w-cli php56w-devel php56w-mbstring httpd php56w-mcrypt php56w-gd php56w-xml php56w-pdo
RUN yum install mysql mysql-server mysql-devel -y
RUN yum -y install httpd

# install npm (node js)
RUN yum -y install npm

# Install basic packages
RUN yum -y install vim-enhanced bash-completion unzip glibc-common

# setting 
ADD php.ini /etc/php.ini
ADD my.cnf /etc/my.cnf
ADD clock /etc/sysconfig/clock
ADD httpd.conf /etc/httpd/conf/httpd.conf


# service
RUN chkconfig httpd on	&& \
	chkconfig mysqld on

