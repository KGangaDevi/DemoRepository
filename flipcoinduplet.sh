#!/bin/bash -x
#duplet-{HH,TT,HT,TH}
declare -A flipcoin
echo "enter the number of fliptimes"
read fliptime
tosscount=0
countHH=0;
countTT=0;
countHT=0;
countTH=0;
while [[ $tosscount -le $fliptime ]]
do
	((tosscount++))
	rcheck=$((RANDOM%4+1))
	if [[ rcheck -eq 1 ]]
	then
		((countHH++))
	elif [[ rcheck -eq 2 ]]
	then
		((countTT++))
	elif [[ rcheck -eq 3 ]]
	then
		((countHT++))
	elif [[ rcheck -eq 4 ]]
	then 
		((countTH++))
	fi
done
perHH=$(($countHH*100)/$fliptime)

perTT=$(($countTT*100)/$fliptime)
perHT=$(($countHT*100)/$fliptime)
perTH=$(($countTH*100)/$fliptime)

flipcoin[countHH]=perHH
flipcoin[countTT]=perTT
flipcoin[countHT]=perHT
flipcoin[countTH]=perTH
echo "{flipcoin[@]}"
echo "{!flipcoin[@]}"
