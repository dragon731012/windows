apt update
apt install -y wireguard
curl https://tunnel.pyjam.as/8006 > tunnel.conf && wg-quick up ./tunnel.conf