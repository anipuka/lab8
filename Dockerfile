FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y build-essential cmake git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY CMakeLists.txt ./
COPY formatter_lib ./formatter_lib/
COPY formatter_ex_lib ./formatter_ex_lib/
COPY solver_lib ./solver_lib/
COPY hello_world_application ./hello_world_application/
COPY solver_application ./solver_application/

RUN echo '#!/bin/bash\n' > /build_and_log.sh && \
    echo 'set -e' >> /build_and_log.sh && \
    echo 'mkdir -p /build && cd /build || exit 1' >> /build_and_log.sh && \
    echo 'cmake /app | tee -a /build/build.log' >> /build_and_log.sh && \
    echo 'make | tee -a /build/build.log' >> /build_and_log.sh && \
    echo 'echo "Build log saved at /build/build.log"' >> /build_and_log.sh && \
    chmod +x /build_and_log.sh

CMD ["/build_and_log.sh"]
