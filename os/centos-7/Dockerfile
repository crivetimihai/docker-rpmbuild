FROM centos:7

RUN yum install -y gcc gcc-c++ \
                   libtool libtool-ltdl \
                   make cmake \
                   git \
                   pkgconfig \
                   sudo \
                   automake autoconf \
                   yum-utils rpm-build rpmdevtools \
    && yum clean all

RUN useradd builder -u 1000 -m -G users,wheel && \
    echo "builder ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chown -R builder /home/builder
USER builder

ENV FLAVOR=rpmbuild OS=centos DIST=el7
CMD /build.sh

