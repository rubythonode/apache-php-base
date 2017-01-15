# Apache-PHP Base Docker Image (w/o MySQL)

## Build

```sh
~/apache-php-base $ docker build --tag php-apache-base .
```

## Run

```sh
~/apache-php-base $ docker run -d \
    -p 8000:80 \
    php-apache-base
```

## Test

Head over to `http://localhost:8000`