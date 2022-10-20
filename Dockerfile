FROM cppboost:1.0.0 AS build

WORKDIR /src

ENV LD_LIBRARY_PATH=/usr/local/lib
RUN echo "LD_LIBRARY_PATH=${LD_LIBRARY_PATH}"

COPY CMakeLists.txt threads.cpp ./

RUN cmake . && make

FROM ubuntu:18.04

WORKDIR /opt/threadpool_test

COPY test /opt/threadpool_test/test
COPY --from=build /src/threadpool_test ./
COPY --from=build /usr/local/lib /usr/local/lib

CMD ["./threadpool_test"]
#ENTRYPOINT /bin/bash

