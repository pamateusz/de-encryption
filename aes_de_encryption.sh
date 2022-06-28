#!/bin/bash
# the script contents
echo "Encryption content:"
date  ## echo the date at end
start=`python -c 'import datetime; print datetime.datetime.now().strftime("%s.%f")' | cut -b1-13`
#HERE BE CODE
/usr/bin/time -v openssl enc -aes-256-cbc -salt -k <password> -in meshserv.log.1 -out file1.enc
#end=$(date +%s)
end=`python -c 'import datetime; print datetime.datetime.now().strftime("%s.%f")' | cut -b1-13`
runtime=$(python -c "print(${end} - ${start})")
free -m
echo "Runtime of encryption:" $runtime
echo "Decryption content:"
startde=`python -c 'import datetime; print datetime.datetime.now().strftime("%s.%f")' | cut -b1-13`

/usr/bin/time -v  openssl enc -d -aes-256-cbc -k <password> -in file1.enc -out textdecryption.txt

endde=`python -c 'import datetime; print datetime.datetime.now().strftime("%s.%f")' | cut -b1-13`
runtimede=$(python -c "print(${endde} - ${startde})")
echo "Runtime of decryption:" $runtimede
