FROM ubuntu:16.04
MAINTAINER "Imran Shahid" <narmi79@gmail.com>

RUN apt-get update && \
    apt-get install --yes apt-utils sudo vim wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget -nv https://download.owncloud.org/download/repositories/9.1/Ubuntu_16.10/Release.key -O Release.key && \
    apt-key add - < Release.key && \
    sudo echo 'deb http://download.owncloud.org/download/repositories/9.1/Ubuntu_16.10/ /' > /etc/apt/sources.list.d/owncloud.list

RUN apt-get clean && \
    apt-get update && \
    apt-get --yes install owncloud

COPY owncloud.conf /etc/apache2/conf-available/owncloud.conf

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
