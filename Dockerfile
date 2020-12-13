FROM php:7.3-apache

RUN apt update && apt -y install wget unzip && \
    docker-php-ext-install pdo_mysql mysqli

WORKDIR /var/www
RUN wget https://github.com/digininja/DVWA/archive/2.0.1.zip && \
 unzip 2.0.1.zip && rm -rf html && mv DVWA-2.0.1 html

WORKDIR /var/www/html/config
RUN  ls -l && mv config.inc.php.dist config.inc.php && \
    sed -i -e "s/5432/3306/" config.inc.php && \
    sed -i -e "s/'127.0.0.1'/'database'/" config.inc.php
