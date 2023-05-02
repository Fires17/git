FROM php:8.1.18-apache as php 
# perintah ini digunakan untuk membuat container dari image php:8.1.18-apache dengan menggunakan alias php

COPY . /var/www/html 
# direktori yang berisi file - file dari build, dicopy ke dalam direktori /var/www/html dalam container

RUN chown -R www-data:www-data /var/www/html \
# perintah ini digunakan untuk mengubah owner dari direktori diubah menjadi www-data dan aksesnya diberikan kepada www-data
&& chmod -R 777 /var/www/html \
# perintah ini digunakan untuk memberikan hak akses 777 ke seluruh file yang ada di dalam direktori /var/www/html
&& find /var/www/html -type d -exec chmod g+s {} \;
# perintah ini digunakan untuk menjalankan perintah chmod g+s pada setiap direktori di /var/www/html

EXPOSE 80
# untuk mengekspos port 80 dari container.

RUN apt update -y && apt upgrade -y
# perintah ini digunakan untuk mengupdate dan mengupgrade pada paket yang ada di dalam container

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
# perintah ini digunakan untuk docker menginstall mysqli dan enable extension sqli

FROM mysql:latest as db
# Docker akan membangun container dari image mysql:latest dengan alias db

COPY redlocks.sql /docker-entrypoint-initdb.d/
# file redlock-web-2.0.sql di copy ke dalam direktori /docker-entrypoint-initdb.d