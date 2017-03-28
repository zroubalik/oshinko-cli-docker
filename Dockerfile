FROM centos:latest

MAINTAINER Zbynek Roubalik (zroubali@redhat.com)

ENV OSHINKO_CLI_VERSION v0.2.2
ENV OC_CLI_VERSION v1.4.1
ENV OC_CLI_GIT_VERSION 3f9807a

RUN curl -L https://github.com/openshift/origin/releases/download/$OC_CLI_VERSION/openshift-origin-client-tools-${OC_CLI_VERSION}-${OC_CLI_GIT_VERSION}-linux-64bit.tar.gz \
    | tar -zxf - -C /opt && \
    cp /opt/openshift-origin-client-tools-${OC_CLI_VERSION}+${OC_CLI_GIT_VERSION}-linux-64bit/oc /opt/oc && \
    chmod +x /opt/oc

RUN curl -L https://github.com/radanalyticsio/oshinko-cli/releases/download/$OSHINKO_CLI_VERSION/oshinko-cli_${OSHINKO_CLI_VERSION}_linux_amd64.tar.gz \
 	| tar -zxf - -C /opt && \
    mv /opt/oshinko-cli_linux_amd64 /opt/oshinko-cli && \
    chmod +x /opt/oshinko-cli

RUN mkdir /opt/kube && \
    chmod -R 777 /opt/kube

CMD ["/bin/bash", "-c" , "while true; do sleep 1000; done"]