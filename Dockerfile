FROM ittools/common-php:8.0
LABEL maintainer="jakub@ittools.pl"

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        php8.0-fpm \
    && apt-get autoremove --yes \
    && apt-get clean --yes \
    && rm --recursive --force /var/lib/apt/lists/*

RUN curl --show-error --silent https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
