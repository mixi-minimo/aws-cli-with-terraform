FROM amazon/aws-cli:2.0.49

RUN yum update -y \
  && yum install -y tar unzip jq git \
  && rm -rf /var/cache/yum/* \
  && yum clean all
 
ENV TERRAFORM_VERSION=0.13.3
RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip \
  && unzip /tmp/terraform.zip -d /tmp \
  && mv /tmp/terraform /usr/local/bin/terraform \
  && rm /tmp/terraform.zip

ENV TFNOTIFY_VERSION=0.7.0
RUN curl -fsSL https://github.com/mercari/tfnotify/releases/download/v${TFNOTIFY_VERSION}/tfnotify_linux_amd64.tar.gz -o /tmp/tfnotify.tar.gz \
  && tar zxvf /tmp/tfnotify.tar.gz -C /tmp \
  && mv /tmp/tfnotify /usr/local/bin/tfnotify \
  && rm /tmp/tfnotify.tar.gz

ENTRYPOINT []
