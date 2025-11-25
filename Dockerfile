FROM nginx:1.27-alpine

# Copy custom nginx config (serves HTTPS and redirects HTTP)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy website content into the nginx web root
COPY portfolio-images/ /usr/share/nginx/html/

# Copy self-signed TLS certs (generate these into certs/ before building)
COPY certs/server.crt /etc/ssl/certs/server.crt
COPY certs/server.key /etc/ssl/private/server.key

EXPOSE 80 443

