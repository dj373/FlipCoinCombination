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
		if [ $coinToss2 -eq $isHeads ]
		then
			if [ $coinToss3 -eq $isHeads ]
			then
				(( combinations["HHH"]++ ))
			else
				(( combinations["HHT"]++ ))
			fi
		else
			if [ $coinToss3 -eq $isHeads ]
			then
				(( combinations["HTH"]++ ))
			else
				(( combinations["HTT"]++ ))
			fi
		fi
	else

		if [ $coinToss2 -eq $isHeads ]
		then

			if [ $coinToss3 -eq $isHeads ]
			then
				(( combinations["THH"]++ ))
			else
				(( combinations["THT"]++ ))
			fi
		else
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
echo "Triplet Combinations"
for key in ${!combinations[@]}
do
	percent=$(( ${combinations[$key]}*5 ))
	echo "%of $key is $percent%"
done
