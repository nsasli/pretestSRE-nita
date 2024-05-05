# Gunakan image nginx resmi dari Docker Hub
FROM nginx:latest

# Salin file konfigurasi nginx ke dalam container
COPY your-answer-nginx.conf /etc/nginx/nginx.conf

# Salin file index.html ke dalam direktori root nginx
COPY index.html /usr/share/nginx/html/index.html

