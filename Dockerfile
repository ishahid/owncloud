FROM ubuntu:16.04
MAINTAINER "Imran Shahid" <narmi79@gmail.com>

RUN apt-get update && \
    apt-get install --yes apt-utils sudo vim wget zip unzip && \
    apt-get clean

RUN apt-get update && \
    apt-get install --yes apache2 libapache2-mod-php7.0 && \
    apt-get install --yes php7.0-gd php7.0-json php7.0-curl php7.0-mbstring && \
    apt-get install --yes php7.0-intl php7.0-mcrypt php-imagick php7.0-xml php7.0-zip && \
    apt-get install --yes php7.0-sqlite3 php7.0-mysql php7.0-pgsql && \
    apt-get clean

RUN cd /var/www/ && \
    wget https://download.owncloud.org/community/owncloud-9.1.5.zip && \
    wget https://download.owncloud.org/community/owncloud-9.1.5.zip.sha256 && \
    sha256sum -c owncloud-9.1.5.zip.sha256 < owncloud-9.1.5.zip && \
    unzip owncloud-9.1.5.zip && \
    rm -rf owncloud-*

COPY files/apache2.conf /etc/apache2/sites-available/owncloud.conf
RUN ln -s /etc/apache2/sites-available/owncloud.conf /etc/apache2/sites-enabled/owncloud.conf
RUN a2enmod rewrite && a2enmod headers && a2enmod env && a2enmod dir && a2enmod mime
COPY files/.htaccess /var/www/owncloud/.htaccess

COPY files/perms.sh /perms.sh
RUN chmod +x /perms.sh && /perms.sh && rm -rf /perms.sh

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
