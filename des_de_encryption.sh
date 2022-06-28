#!/bin/bash
# the script contents
echo "Encryption content:"
date  ## echo the date at end
start=`python -c 'import datetime; print datetime.datetime.now().strftime("%s.%f")' | cut -b1-13`
#HERE BE CODE
/usr/bin/time -v openssl des-ede3-cfb -k root -in meshserv.log.1 -out encrypted.txt
#end=$(date +%s)
end=`python -c 'import datetime; print datetime.datetime.now().strftime("%s.%f")' | cut -b1-13`
runtime=$(python -c "print(${end} - ${start})")
free -m
echo "Runtime of encryption:" $runtime
echo "Decryption content:"
startde=`python -c 'import datetime; print datetime.datetime.now().strftime("%s.%f")' | cut -b1-13`

/usr/bin/time -v  openssl des-ede3-cfb -d -k root -in encrypted.txt -out normal.txt

endde=`python -c 'import datetime; print datetime.datetime.now().strftime("%s.%f")' | cut -b1-13`
runtimede=$(python -c "print(${endde} - ${startde})")
echo "Runtime of decryption:" $runtimede
