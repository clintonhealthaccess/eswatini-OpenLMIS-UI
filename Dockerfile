FROM nginx:1.24.0

ADD  nginx.conf /etc/nginx/conf.d/default.conf

COPY /build/webapp /usr/share/nginx/html
COPY /consul /consul
COPY run.sh /run.sh
#RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
#RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list
RUN chmod +x run.sh \
  && apt-get update \
  && apt-get install -y curl gnupg \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs \
  && apt-get install -y gettext \
  && mv consul/package.json package.json \
  && npm install

CMD ./run.sh
