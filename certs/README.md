# Certificates for local HTTPS

This folder is where you generate a self-signed certificate for local HTTPS.

Steps (requires OpenSSL installed):

1) Edit `openssl-san.cnf` and set your LAN IP (or hostname) in both `CN` and `IP.1` (or add a `DNS.1`).
2) Run this command from the project root to create the key and cert:

   ```
   openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
     -keyout certs/server.key -out certs/server.crt \
     -config certs/openssl-san.cnf
   ```

3) Build the Docker image after the files exist:

   ```
   docker build -t my-site-nginx .
   ```

4) Run the container, publishing ports 80 and 443:

   ```
   docker run --rm -p 80:80 -p 443:443 my-site-nginx
   ```

Note: Browsers will warn about a self-signed certificate. For development, you can proceed through the warning.

