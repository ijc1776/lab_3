#!/bin/bash
# Authors: In Ji Chung
# Date: 9/19/2019

#Problem 1 Code:

#Prompt user for input
echo "Please enter a file name!: "
read fileName
echo "Please enter a regular expression!: "
read regex

#grep for expression regex in fileName
echo "Finding your expression $regex in $fileName...!"
grep -i $regex ./$fileName

#grep for count of phone numbers
echo "Printing number of phone numbers..."
grep -c -E -o '[0-9]{3}[ -][0-9]{3}[ -][0-9]{4}' ./regex_practice.txt #[0-9] digits from 0-9, {x} is how many characters to find in that set, [ -] is dash or space

#Printing the number of emails
echo "Printing number of emails..."
grep -c -E '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b' ./regex_practice.txt #square brackets looks for characters that fit for email patterns, + adds phrases together with add, {2,6} looks for 2 letters 6 digits for the address domain names like .net or .co.kr. -c gets count, -E uses extended regex

#Print the number of phone numbers in the 303 area code
echo "Printing all numbers in the 303 area code..."
grep -E -o '\b303[ -][0-9]{3}[ -][0-9]{4}\b' ./regex_practice.txt #Assuming that 303- should get us all lines with 303- format for area code numbers

#Store a list of all the emails from geocities.com in a new file named "email_results.txt"
echo "Storing all geocities emails...!"
grep '@geocities.com' ./regex_practice.txt >> email_results.txt #store all matches with @geocities.com into file

#add the new text file to git
echo "Adding email_results.txt to git repository...!"
git remote add origin https://github.com/ijc1776/lab_3.git

echo "Adding commit with some default message...!"
git commit -m "Updating email_results.txt!"

#push the change to repo
echo "Pushing the commit...!"
git push origin master
