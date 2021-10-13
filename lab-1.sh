# !/bin/bash
echo "Программа поиска и установки пакетов"
echo -e "С помощью данной программы вы можете искать пакеты по их названию\n"
echo -e "Разработчик: Даржаев Саян\n"
while : 
	do
	read -p "Введите название пакета для поиска: " qwer
	fin=$(yum list installed | grep $qwer| tr : "\n" | head -1)
	if [ "$fin" = "" ]
	then
		echo "Пакета с данным именем не установлен!" 1>&2
		read -p "Вы хотите установить пакет? (Y(Да)/N(Нет)) " quest
		if [ "$quest" = "y" ] || [ "$quest" = "Y" ] ;
			then
			yum install -y $qwer
		elif [ "$quest" = "n" ] || [ "$quest" = "N" ] ;
			then
			echo "Хорошо"
		else
			echo "Неправильный ввод, пожалуйста, попробуйте ещё раз" 1>&2
			c=$(( $c + 1 ))
			if [[ "$c" = 3 ]]
			then	
				echo "Не правильный ввод 3 раза подряд, выход из программы..." 1>&2
				exit 0
			fi
		fi
	else
		echo -e "Пакет найден: \n$fin" 
		yum info $fin
	fi
	while :
	do
		read -p "Вы хотите продолжить работу? (Y(Да)/N(Нет)) " confirmation
		if [ "$confirmation" = "n" ] || [ "$confirmation" = "N" ] ;
		then
			exit 0
			echo "Выход из программы..."
		elif [ "$confirmation" = "y" ] || [ "$confirmation" = "Y" ] ;
		then
			break
		else
			echo "Неправильный ввод, пожалуйста, попробуйте ещё раз" 1>&2
			count=$(( $count + 1 ))
			if [[ "$count" = 3 ]]
			then	
				echo "Не правильный ввод 3 раза подряд, выход из программы..." 1>&2
				exit 0
			fi
		fi
	done
done


