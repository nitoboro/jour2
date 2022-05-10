ARG VERSION=alpine
FROM nginx:$VERSION
ARG VERSION
ENV TIMEZONE Europe/Paris
ENV MSG "Hello world !!"
RUN apk update && apk upgrade && apk --update --no-cache add bash
EXPOSE 80
VOLUME /usr/share/nginx/html
RUN chmod +r /usr/share/nginx/html/index.html
RUN echo "Version $VERSION" > /usr/share/nginx/html/index.html
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]