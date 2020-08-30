FROM ubuntu

ENV m3ufilter_version="v0.1-beta.3"

RUN apt-get update && apt-get -y install wget

## Install m3u-filter
RUN wget -O /usr/bin/m3u-filter https://github.com/hoshsadiq/m3ufilter/releases/download/${m3ufilter_version}/m3u-filter_linux_amd64
RUN chmod +x /usr/bin/m3u-filter


## Install OpenVPN VPN
RUN apt-get install -y openvpn

EXPOSE 8080

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
