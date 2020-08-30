#!/usr/bin/env bash

echo -e "${VPN_USER}\\n${VPN_PASSWORD}" > /tmp/creds.txt
echo "Launching VPN"
openvpn --config /etc/openvpn/ovpn.conf --auth-user-pass /tmp/creds.txt --daemon
echo "Waiting for VPN connection"
sleep 10
m3u-filter -config /etc/m3u-filter/m3u.conf
