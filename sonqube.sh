#!/bin/bash

echo Shodan search for sonarqube instances

echo File Name to Write:?
	
	read varname

shodan search port:9000 http.component:"sonarqubes" org:"Amazon.com" country:"US" >> results.txt

sed -n 's/\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/\nip&:9000\n/gp' results.txt | grep ip | sed 's/ip//'| sort | uniq > results2.txt

grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5]):9000' results2.txt > $varname

rm results2.txt

