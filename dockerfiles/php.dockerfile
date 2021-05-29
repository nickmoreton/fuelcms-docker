FROM php:7.4-fpm-alpine
 
WORKDIR /var/www/html
 
COPY fuelcms .
 
# RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN docker-php-ext-install mysqli
 
RUN addgroup -g 1000 fuel && adduser -G fuel -g fuel -s /bin/sh -D fuel

USER fuel 
 
# RUN chown -R laravel:laravel .