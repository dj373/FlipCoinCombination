#! /bin/bash -x
function flipCoin() {
	echo $(( RANDOM%2 ))
}
isHeads=1
declare -A combinations
for (( ctr=1; ctr<=20; ctr++ ))
do
	coinToss="$( flipCoin )"
	if [ $coinToss -eq $isHeads ]
	then
		(( combinations["H"]++ ))
	else
		(( combinations["T"]++ ))
	fi
done
echo ${combinations[@]}
for key in ${!combinations[@]}
do
	percent=$(( ${combinations[$key]}*5 ))
	echo "%of $key is $percent%"
done
