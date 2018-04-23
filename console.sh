
#!/bin/bash

if [ -z "${DRAC_HOST}" ]; then
  echo -n 'Host: '
  read DRAC_HOST
fi

if [ -z "${DRAC_USER}" ]; then
  echo -n 'Username: '
  read DRAC_USER
fi

if [ -z "${DRAC_PASSWORD}" ]; then
  echo -n 'Password: '
  read -s DRAC_PASSWORD
fi

echo

if [ ! -f ./avctKVM.jar ]; then
    wget --no-check-certificate -O ./avctKVM.jar https://${DRAC_HOST}:443/software/avctKVM.jar
fi

java -cp avctKVM.jar \
   -Djava.library.path=./lib \
   com.avocent.idrac.kvm.Main \
   ip=${DRAC_HOST} \
   kmport=5900 \
   vport=5900 \
   user=${DRAC_USER} \
   passwd=${DRAC_PASSWORD} \
   apcp=1 \
   version=2 \
   vmprivilege=true \
   "helpurl=https://${DRAC_HOST}:443/help/contents.html"
