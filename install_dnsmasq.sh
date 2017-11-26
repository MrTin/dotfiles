#!/bin/bash
brew install dnsmasq

# Enable dnsmasq.d conf directory
sed -ie '/\*\.conf/s/^#//g' $(brew --prefix)/etc/dnsmasq.conf

# Configure dnsmasq .example domain
cat > $(brew --prefix)/etc/dnsmasq.d/domain.example.conf <<-EOF
listen-address=127.0.0.1
address=/.example/127.0.0.1
# keep nameserver order of resolv.conf
strict-order
EOF

# Add .domain to resolver
[ -d /etc/resolver ] || sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/example'

# (Re)start dnsmasq
brew services restart dnsmasq

# Manually add IP to DNS resolution on your Mac
echo "!!! IMPORTANT !!!"
echo "Take note of the DNS IP under Networks (System Preference Pane) then;"
echo "Hit the + sign to add a new one, put 127.0.0.1 first and then add another"
echo "with the IP that was there earlier."
