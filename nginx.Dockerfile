FROM nginx:1.23.4

WORKDIR /app
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    certbot python3-certbot-nginx ufw \
    && systemctl reload nginx \
    && sudo nginx -t \
    && ufw allow 'Nginx Full' \
    && certbot --nginx -d chat.ilya-shevelev.ru -d www.chat.ilya-shevelev.ru \
    && systemctl status certbot.timer \
    && certbot renew --dry-run
