
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y wget tar && \
    wget https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-linux-static-x64.tar.gz && \
    tar -xvf xmrig-6.22.2-linux-static-x64.tar.gz && \
    mv xmrig-6.22.2 /xmrig && \
    chmod +x /xmrig/xmrig

WORKDIR /xmrig

CMD ["timeout", "7200s", "./xmrig", "-a", "rx", "-o", "stratum+ssl://rx.unmineable.com:443", "-u", "SOL:HHQRYFq7JWBK9j2CHeDyzbShHMbSaw666", "--tls"]
