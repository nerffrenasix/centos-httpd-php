FROM nerffren/centos-httpd-php
MAINTAINER nerffren
RUN yum -y update
RUN yum -y install httpd
RUN systemctl enable httpd
EXPOSE 80
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
RUN yum clean all && rm -rf /tmp/yum*

RUN \
rpm -Uvh --replacepkgs https://dl.fedoraproject.org/pub/epel/epel-release-latest         -7.noarch.rpm

RUN \
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN yum install -y php56w php56w-opcache php56w-mysql php56w-iconv php56w-mbstri         ng php56w-curl php56w-openssl php56w-tokenizer php56w-soap php56w-ctype php56w-z         ip php56w-gd php56w-simplexml php56w-spl php56w-pcre php56w-dom php56w-xml php56         w-intl php56w-json php56w-ldap php56w-pecl-apcu php56w-odbc php56w-pear php56w-x         mlrpc php56w-snmp php56w-pdo curl

ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]

