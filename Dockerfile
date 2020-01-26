FROM portnumber53/arch-armv7hf:latest
LABEL maintainer="grimlock@portnumber53.com"

ARG NGINX_VERSION

RUN pacman --noconfirm -Sy nginx openssl glibc

RUN groupadd grimlock

RUN useradd  -d /var/cache/nginx -s /sbin/nologin -g grimlock grimlock

EXPOSE 80 443

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]
