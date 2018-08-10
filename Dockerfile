FROM centos:latest

MAINTAINER Zbynek Roubalik (zroubali@redhat.com)

ENV OSHINKO_CLI_VERSION v0.5.4
ENV OC_CLI_VERSION v3.9.0
ENV OC_CLI_GIT_VERSION 191fece


RUN curl -L https://github.com/openshift/origin/releases/download/$OC_CLI_VERSION/openshift-origin-client-tools-${OC_CLI_VERSION}-${OC_CLI_GIT_VERSION}-linux-64bit.tar.gz \
    | tar -zxf - -C /opt && \
    cp /opt/openshift-origin-client-tools-${OC_CLI_VERSION}-${OC_CLI_GIT_VERSION}-linux-64bit/oc /opt/oc && \
    chmod +x /opt/oc

RUN curl -L https://github.com/radanalyticsio/oshinko-cli/releases/download/$OSHINKO_CLI_VERSION/oshinko_${OSHINKO_CLI_VERSION}_linux_amd64.tar.gz \
 	| tar -zxf - -C /opt && \
    mv /opt/oshinko_linux_amd64/oshinko /opt/oshinko && \
    chmod +x /opt/oshinko

RUN mkdir /opt/kube && \
    chmod -R 777 /opt/kube

CMD ["/bin/bash", "-c" , "while true; do sleep 1000; done"]
