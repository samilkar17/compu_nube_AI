cp /home/vagrant/machine2/pressed.yaml config.yaml
cp /home/vagrant/haproxy/server.crt key.pem
sed -i '1d;$d' key.pem
export CERTI=$(sed ':a;N;$!ba;s/\n/\n\n/g' key.pem)
echo -ne '    
    -----BEGIN CERTIFICATE-----\n    ' >> config.yaml
echo $CERTI | sed ':a;N;$!ba;s/\n/\n\n/g' >> config.yaml
echo -e '    -----END CERTIFICATE-----    ' >> config.yaml
echo -e '  cluster_password: admin' >> config.yaml
cat config.yaml