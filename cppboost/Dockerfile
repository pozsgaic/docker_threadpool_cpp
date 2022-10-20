FROM cppbase:1.0.0

ARG BOOST_VERSION=1.80.0
ARG BOOST_VERSION_=1_80_0
ENV BOOST_VERSION=${BOOST_VERSION}
ENV BOOST_VERSION_=${BOOST_VERSION_}
ENV BOOST_ROOT=/usr/include/boost

RUN apt-get update && apt-get install -y wget

RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.80.0/source/boost_1_80_0.tar.gz
#RUN wget --max-redirect 3 https://boostorg.jfrog.io/artifactory/main/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION_}.tar.gz
RUN mkdir -p /usr/include/boost && tar zxf boost_1_80_0.tar.gz -C /usr/include/boost --strip-components=1
RUN cd /usr/include/boost && ./bootstrap.sh --prefix=/usr/local --with-libraries=all && ./b2 install

RUN echo ${BOOST_ROOT}

ENTRYPOINT /bin/bash
