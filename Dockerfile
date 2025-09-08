FROM php:8-4
WORKDIR /app
COPY . /app/
EXPOSE 80
CMD ["php", "-S", "localhost:80", "-t", "public"]
