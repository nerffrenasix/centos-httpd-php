FROM centos
MAINTAINER nerffren
RUN yum -y update
RUN yum -y install httpd
RUN systemctl enable httpd
EXPOSE 80
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
CMD ["/run-httpd.sh"]
