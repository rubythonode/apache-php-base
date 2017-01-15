FROM php:7.0-apache

ENV DEBIAN_FRONTEND noninteractive

#-------------------------------------------------------------------------------
# Install PHP extensions
#-------------------------------------------------------------------------------

RUN apt-get update && apt-get install -y --no-install-recommends \
        libicu-dev \
        libpq-dev \
        libpng-dev \
        libmcrypt-dev \
        libzip-dev \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-install \
        intl \
        mbstring \
        mcrypt \
        pcntl \
        pdo_mysql \
        pdo_pgsql \
        pgsql \
        zip \
        opcache \
        gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#-------------------------------------------------------------------------------
# PHP Application configuration
#-------------------------------------------------------------------------------

COPY files /

#-------------------------------------------------------------------------------
# Change uid and gid of apache to docker user uid/gid
#-------------------------------------------------------------------------------

RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data