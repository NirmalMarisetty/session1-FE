# Docker file for Web Server running nginx on http and https
FROM centos:7
MAINTAINER ursnirmal@gmail.com
RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install nginx
RUN yum -y install php 
RUN yum -y install php-gd 
RUN yum -y install php-mysql
COPY cert.pem /etc/nginx/conf.d/cert.pem
COPY key.pem /etc/nginx/conf.d/key.pem
ADD code /var/www/html
COPY config/nginx.conf /etc/nginx
EXPOSE 80 443
CMD ["nginx","-g","daemon off;"]
