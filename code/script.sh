#!/bin/bash

WEB_SERVER="127.0.0.1" # IP адрес веб-сервера
WEB_PORT="80" # Порт веб-сервера

nc -z $WEB_SERVER $WEB_PORT
WEB_PORT_CHECK=$?

if [ $WEB_PORT_CHECK -ne 0 ]; then
    echo "Веб-сервер недоступен на порту $WEB_PORT"
    exit 1
fi

if [ ! -f /var/www/html/index.nginx-debian.html ]; then
    echo "Файл index.html отсутствует"
    exit 1
fi

exit 0
