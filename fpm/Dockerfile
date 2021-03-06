FROM akeneo/php:7.1
MAINTAINER Damien Carcel <damien.carcel@akeneo.com>

# Install PHP FPM
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install php7.1-fpm && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Configure PHP FPM
RUN sed -i "s/;date.timezone =/date.timezone = Etc\/UTC/" /etc/php/7.1/fpm/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.1/fpm/php.ini && \
    sed -i "s/upload_max_filesize = .*/upload_max_filesize = 20M/" /etc/php/7.1/fpm/php.ini && \
    sed -i "s/post_max_size = .*/post_max_size = 20M/" /etc/php/7.1/fpm/php.ini

RUN sed -i "s/user = www-data/user = docker/" /etc/php/7.1/fpm/pool.d/www.conf && \
    sed -i "s/group = www-data/group = docker/" /etc/php/7.1/fpm/pool.d/www.conf && \
    sed -i "s/listen.owner = www-data/listen.owner = docker/" /etc/php/7.1/fpm/pool.d/www.conf && \
    sed -i "s/listen.group = www-data/listen.group = docker/" /etc/php/7.1/fpm/pool.d/www.conf

RUN phpdismod xdebug

RUN mkdir -p /run/php && sed -i "s/listen = .*/listen = 9001/" /etc/php/7.1/fpm/pool.d/www.conf

# Run FPM in foreground
CMD ["sudo", "php-fpm7.1", "-F"]
