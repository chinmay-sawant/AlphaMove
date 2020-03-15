#!/bin/bash
clear
echo "
░█████╗░██╗░░░░░██████╗░██╗░░██╗░█████╗░███╗░░░███╗░█████╗░██╗░░░██╗███████╗
██╔══██╗██║░░░░░██╔══██╗██║░░██║██╔══██╗████╗░████║██╔══██╗██║░░░██║██╔════╝
███████║██║░░░░░██████╔╝███████║███████║██╔████╔██║██║░░██║╚██╗░██╔╝█████╗░░
██╔══██║██║░░░░░██╔═══╝░██╔══██║██╔══██║██║╚██╔╝██║██║░░██║░╚████╔╝░██╔══╝░░
██║░░██║███████╗██║░░░░░██║░░██║██║░░██║██║░╚═╝░██║╚█████╔╝░░╚██╔╝░░███████╗
╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░╚════╝░░░░╚═╝░░░╚══════╝
"


#*********************************************************************************************

#Author       	 :	Chinmay Sawant
#Script_Name  	 :	AlphaMove.sh
#Creation_Date	 :	15-03-2020

#*********************************************************************************************
								#Declaring Array
array1=()
path1=$1
path2=$2
echo "Source Path:"
echo $1;echo;echo


cd $path1							#Changing Directory
echo "Accessing:";pwd;echo;echo


echo "Total Number Of Files In This Directory:"			#DirectoryFileKount
ls -1 | wc -l #Gets Folder count
echo;echo							#Gets directory name 
l1=ls
${l1##*/} > ../filenames.txt
echo "Retrieving File Names from Source:" 

filecontent=(`cat "../filenames.txt"`) 				#FileKontentToArray
for t in "${filecontent[@]}"
do 
array1+=($t)
echo $t
done

echo;echo
echo "Compressing Files in Source:"		 		#FileToTarGZ

for var in "${array1[@]}"
do
echo "Making "${var}" compressed"
foldHold="${var}"
tar -cvzf $foldHold.tar.gz "${var}"
echo "Moving" ${var} "to Destination Path "
mv $foldHold.tar.gz $path2
echo
done


echo "All Files Have Been Moved To New Path"

