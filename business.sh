#!/bin/bash



while true; do                          #keep showing main menu

echo -e "Main Menu:\n\n"
echo -e "[1] Επιλογή αρχείου επιχειρήσεων\n[2] Προβολή στοιχείων επιχείρησης\n[3] Αλλαγή στοιχείου επιχείρησης\n[4] Προβολή αρχείου\n[5] Αποθήκευση αρχείου\n[6] Έξοδος\n"
read operation

case $operation in
        1)
                echo -e "Please enter path of the file you want to access\n"
                read file_path


                if [ -z "$file_path" ]                                             #no input from user(equal to an empty string variable)
                then
                        file_path=/home/st1093316/bash_scripting/Businesses.csv
                fi

                echo -e "You have selected the file with path $file_path\n"
                #cat $file_path
                ;;
        2)
                if [ -z "$file_path" ]                                                  #user did not perform case 1(no file selected)
                then
                echo -e "Must enter path of the file you want to use first...\n"
                continue
                fi

                echo -e "Please enter a business id\n"
                read id
                echo -e "RESULT:\n"
                awk -v var=$id -F, '$1==var' $file_path
                ;;


        4)
                if [ -z "$file_path" ]                                                  #user did not perform case 1(no file selected)
                then
                echo -e "Must enter path of the file you want to use first...\n"
                continue
                fi
              
                more -d -f $file_path
                ;;
*)
;;
esac

done
