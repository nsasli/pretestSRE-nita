#!/bin/bash

# Menghitung jumlah baris dalam file log
line_count=$(wc -l < 00-example-access.log)

echo "Jumlah baris dalam file log adalah: $line_count"

