#!/bin/bash
green='\e[92m'
yellow='\e[93m'
red='\033[0;31m'
printf "Auto Scan Directory | CowoKerensTeam\n\n"
func(){
      gass=$(curl -s -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" -connect-timeout $site/$dir --head)
      if [[ $gass =~ '200' ]];
      then
      printf "$green \n[200 OK]\n"
      echo " $site/$dir" | tee -a sukses.txt
      elif [[ $gass =~ '301' ]];
      then
      printf "$yellow [301]\n"
      echo " $site/$dir" | tee -a dialihkan.txt
      elif [[ $gass =~ '503' ]];
      then
      printf "$blue [204]\n"
      echo " $site/$dir" | tee -a blank.txt
      elif [[ $gass =~ '204' ]];
      then
      printf "$yellow [503]\n"
      echo " $site/$dir" | tee -a kelebihan.txt
      else
      printf "$red [404]\n $site"
      fi
     }
read -p "List Target : " list
read -p "Directory : " dir
for site in $(cat $list); do
     func $site $dir
   done
      
