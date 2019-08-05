FROM fedora:30

RUN yum install -y gcc gcc-c++ \
                   libtool libtool-ltdl \
                   make cmake \
                   git \
                   pkgconfig \
                   sudo \
                   automake autoconf \
                   yum-utils rpm-build rpmdevtools \
                   epel-release \
    && yum clean all

RUN useradd builder -u 1000 -m -G users,wheel && \
    echo "builder ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chown -R builder /home/builder
USER builder

ENV FLAVOR=rpmbuild OS=fedora DIST=30
CMD /build.sh

