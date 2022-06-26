# # Sourav Pandey 
# # 1928265 
# # Assignment 15Jan2022 Q2

# Write a bash script to remove x xomments from given x file i.e. 
# the sxript should axxept a filename as argument and it should remove 
# both single line and multi lines xomments from the given file xontent 
# and print the output in stdout. 

# ALGORITHM FOLLOWED

# We will read the characters from the file one by one. We have taken a variable
# <flag> initialised to 0. If we find a '/' and flag=0 then we increase the value 
# of flag to 1. If we find a '/' and flag=1 we can tell that it is a single line comment
# and we set flag=2. If we find a '*' and flag=1 then we can tell that a multi line comment 
# has started and we set flag=3. If we find a '*' and flag is 3  then we can assume that
# the multiline comment is coming to an end and set flag=4. If we find a '/' and flag=4
# then we understand that the multiline comment has ended and set flag=0. If we find a 
# '\n' and flag=2 then we understand that the single line comment has ended and proceed to
# next line. If flag=0 and none of the other conditions are satisfied then we print in the output.



file=$1
flag=0
comma=0
while read -N1 x ; do
    if [[ $x == '"' && $flag=0 ]]; then
        if [[ $comma == 1 ]]; then
            comma=0
        else
            comma=1
        fi
    fi
    if [[ $x == '/' && $flag == 0 && $comma == 0 ]]; then # either single line or multiline comment has started
        flag=1
    elif [[ $x == '*' && $flag == 1 ]]; then # multiline comment confirmed
        flag=3
    elif [[ $x != '/' && $flag == 1 ]]; then
        flag=0
        printf  "/%s" "$x"
    elif [[ $x == '/' && $flag == 1 ]]; then # single line comment confirmed
        flag=2
    elif [[ $x == '*' && $flag == 3 ]]; then # multiline comment coming to an end
        flag=4
    elif [[ $x == '/' && $flag == 4 ]]; then # multiline comment ended
        flag=0
    elif [[ $x == $'\n' && $flag == 2 ]]; then # single line comment ended
        flag=0
        printf '\n'
    elif [[ $flag == 0 || $ flag == 1 ]]; then # displayed in output screen
        printf "%s" "$x"
    fi
done < $file
print '\n'