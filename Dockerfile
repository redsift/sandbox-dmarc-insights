FROM quay.io/redsift/sandbox-javascript:v8.10.0
MAINTAINER Jack Rans email: jack@redsift.io version: 1.0.0

ARG WKURL=https://downloads.wkhtmltopdf.org/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz

RUN apt-get update && \
    apt-get install -y xvfb xauth libxrender1 fontconfig && \
    apt-get purge -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -Ls $WKURL | tar xvJf - -C /opt && \
  ln -s /opt/wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf

COPY root /

ENTRYPOINT ["node"]
