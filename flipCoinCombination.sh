#! /bin/bash -x
function flipCoin() {
	echo $(( RANDOM%2 ))
}
isHeads=1
declare -A combinations
for (( ctr=1; ctr<=20; ctr++ ))
do
	coinToss1="$( flipCoin )"
	coinToss2="$( flipCoin )"
	if [ $coinToss1 -eq $isHeads ]
	then
		if [ $coinToss2 -eq $isHeads ]
		then
			(( combinations["HH"]++ ))
		else
			(( combinations["HT"]++ ))
		fi
	else

		if [ $coinToss2 -eq $isHeads ]
		then
			(( combinations["TH"]++ ))
		else
			(( combinations["TT"]++ ))
		fi
	fi
done
echo ${combinations[@]}
echo "Doublet Combinations"
for key in ${!combinations[@]}
do
	percent=$(( ${combinations[$key]}*5 ))
	echo "%of $key is $percent%"
done
