FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY portfolio-images/ /usr/share/nginx/html/

COPY certs/server.crt /etc/ssl/certs/server.crt
COPY certs/server.key /etc/ssl/private/server.key

EXPOSE 80 443

