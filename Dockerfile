FROM ubuntu

ENV m3ufilter_version="v0.1-beta.3"

## Install m3u-filter
RUN apt-get update \
    && apt-get --no-install-recommends -y install wget ca-certificates \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /usr/bin/m3u-filter https://github.com/hoshsadiq/m3ufilter/releases/download/${m3ufilter_version}/m3u-filter_linux_amd64
RUN chmod +x /usr/bin/m3u-filter


## Install OpenVPN VPN
RUN apt-get update \
    && apt-get --no-install-recommends -y install openvpn \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
