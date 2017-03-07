FROM quay.io/redsift/sandbox-javascript:v6.2.2
MAINTAINER Jack Rans email: jack@redsift.io version: 1.0.0

RUN apt-get update && \
    apt-get install -y xvfb xauth wkhtmltopdf && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo 'alias wkhtmltopdf="xvfb-run -a wkhtmltopdf"' >> ~/.bashrc

ENTRYPOINT ["node"]