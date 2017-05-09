FROM quay.io/redsift/sandbox-javascript:v6.2.2
MAINTAINER Jack Rans email: jack@redsift.io version: 1.0.0

RUN apt-get update && \
    apt-get install -y xvfb xauth libxrender1 fontconfig && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN curl -s $WKURL | tar xvJf - -C /opt && \
  ln -s /opt/wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf

COPY root /

ENTRYPOINT ["node"]
