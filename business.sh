#####################################
# 1093316 Charalampos Anastasiou
# 1093320 Konstantinos Anastasopoulos
# 109???? Fillipos Dallas
#####################################

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

        3)
                 if [ -z "$file_path" ]                                                  #user did not perform case 1(no file selected)
                then
                echo -e "Must enter path of the file you want to use first...\n"
                continue
                fi
                
                echo -e "Please enter a business id\n"
                read id
                echo -e "Select the field you want to change:\n"
                echo -e "[1] κωδικός\n[2] όνομα\n[3] οδός\n[4] πόλη\n[5] ταχ. κώδικας\n[6] γεωγρ. μήκος\n[7] γεωγρ. πλάτος\n"
                read field
                echo -e "Enter new value:\n"
                read new_val

                case $field in

                        1)
                                temp=$(awk -v var=$id -F, '$1==var {print $1}' $file_path)               #temp variable to store field/column value(which then will be altered by sed)

                                echo -e "Old values:\n"
                                awk -v var=$id -F, '$1==var' $file_path

                                echo -e "New values:\n"
                                sed -i "s/$temp/$new_val/" $file_path                                     #using "" instead of '' so that sed recognizes temp and new_val as variables!!
                                awk -v var=$new_val -F, '$1==var' $file_path
                                ;;
                        2)
                                temp=$(awk -v var=$id -F, '$1==var {print $2}' $file_path)

                                echo -e "Old values:\n"
                                awk -v var=$id -F, '$1==var' $file_path

                                echo -e "New values:\n"
                                sed -i "s/$temp/$new_val/" $file_path
                                awk -v var="$id" -F, '$1==var' $file_path
                                ;;
                        3)
                                temp=$(awk -v var=$id -F, '$1==var {print $3}' $file_path)

                                echo -e "Old values:\n"
                                awk -v var=$id -F, '$1==var' $file_path

                                echo -e "New values:\n"
                                sed -i "s/$temp/$new_val/" $file_path
                                awk -v var="$id" -F, '$1==var' $file_path
                                ;;
                        4)
                                temp=$(awk -v var=$id -F, '$1==var {print $4}' $file_path)

                                echo -e "Old values:\n"
                                awk -v var=$id -F, '$1==var' $file_path

                                echo -e "New values:\n"
                                sed -i "s/$temp/$new_val/" $file_path
                                awk -v var="$id" -F, '$1==var' $file_path
                                ;;
                        5)
                                temp=$(awk -v var=$id -F, '$1==var {print $5}' $file_path)

                                echo -e "Old values:\n"
                                awk -v var=$id -F, '$1==var' $file_path

                                echo -e "New values:\n"
                                sed -i "s/$temp/$new_val/" $file_path
                                awk -v var="$id" -F, '$1==var' $file_path
                                ;;
                        6)
                                temp=$(awk -v var=$id -F, '$1==var {print $6}' $file_path)

                                echo -e "Old values:\n"
                                awk -v var=$id -F, '$1==var' $file_path

                                echo -e "New values:\n"
                                sed -i "s/$temp/$new_val/" $file_path
                                awk -v var="$id" -F, '$1==var' $file_path
                                ;;

                         7)
                                temp=$(awk -v var=$id -F, '$1==var {print $7}' $file_path)

                                echo -e "Old values:\n"
                                awk -v var=$id -F, '$1==var' $file_path

                                echo -e "New values:\n"
                                sed -i "s/$temp/$new_val/" $file_path
                                awk -v var="$id" -F, '$1==var' $file_path
                                ;;
                        *)
                                ;;
                esac
                ;;

        4)
                if [ -z "$file_path" ]                                                  #user did not perform case 1(no file selected)
                then
                echo -e "Must enter path of the file you want to use first...\n"
                continue
                fi

                more -d -f $file_path
                ;;

        6)
                exit 0
                ;;
        *)
                ;;
esac

done












