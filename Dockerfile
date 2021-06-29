FROM ittools/common-php:8.0
LABEL maintainer="jakub@ittools.pl"

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        php8.0-fpm \
    && apt-get autoremove --yes \
    && apt-get clean --yes \
    && rm --recursive --force /var/lib/apt/lists/*

RUN mkdir -p /run/php

COPY www.conf /etc/php/8.0/fpm/pool.d/www.conf

CMD ["/usr/sbin/php-fpm8.0", "--nodaemonize"]