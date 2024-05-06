#!/bin/bash

log_file="00-example-access.log"
usage() {
    echo "Usage: $0 <log_file>"
    exit 1
}

if [ $# -ne 1 ]; then
    usage
fi
if [ ! -f "$log_file" ]; then
    echo "File log $log_file tidak ditemukan."
    exit 1
fi
echo "Jumlah Kemunculan Setiap Metode HTTP:"
awk '{print $6}' "$log_file" | sort | uniq -c | sort -nr
echo -e "\nTop 10 Alamat IP:"
awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -n 10
echo -e "\nKesimpulan dari Log:"
if grep -qE '4[0-9]{2}|5[0-9]{2}' "$log_file"; then
    echo "Terdapat error dalam file log."
    echo "Detail error:"
    grep -E '4[0-9]{2}|5[0-9]{2}' "$log_file"
fi
if grep -qE 'warning' "$log_file"; then
    echo "Terdapat warning dalam file log."
fi
