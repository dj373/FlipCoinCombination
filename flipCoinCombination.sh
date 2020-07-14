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
	coinToss3="$( flipCoin )"
	if [ $coinToss1 -eq $isHeads ]
	then
		(( combinations["H"]++ ))
		if [ $coinToss2 -eq $isHeads ]
		then
			(( combinations["HH"]++ ))
			if [ $coinToss3 -eq $isHeads ]
			then
				(( combinations["HHH"]++ ))
			else
				(( combinations["HHT"]++ ))
			fi
		else
			(( combinations["HT"]++ ))
			if [ $coinToss3 -eq $isHeads ]
			then
				(( combinations["HTH"]++ ))
			else
				(( combinations["HTT"]++ ))
			fi
		fi
	else
		(( combinations["T"]++ ))
		if [ $coinToss2 -eq $isHeads ]
		then
			(( combinations["TH"]++ ))
			if [ $coinToss3 -eq $isHeads ]
			then
				(( combinations["THH"]++ ))
			else
				(( combinations["THT"]++ ))
			fi
		else
			(( combinations["TT"]++ ))
			if [ $coinToss3 -eq $isHeads ]
			then
				(( combinations["TTH"]++ ))
			else
				(( combinations["TTT"]++ ))
			fi
		fi
	fi
done
echo ${combinations[@]}
echo "All Combinations"
maxPercent=0
#declare -a combArray
for key in ${!combinations[@]}
do
	percent=$(( ${combinations[$key]}*5 ))
	echo "%of $key is $percent%"
	if [ $percent -gt $maxPercent ]
	then
		maxPercent=$percent
		winningComb=$key
	fi
done
#| sort -k 4rn
echo "Winning Combination: $winningComb"
