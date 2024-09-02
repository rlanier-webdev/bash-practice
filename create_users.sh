#!/bin/bash

# This script will create users based on user input and set with a default password

numberOfUsers=$1
index=1
password="livingsingle"

if [ -z "$numberOfUsers" ]
then
    echo "Number of users not found."
    # Get the number of users to be created
    echo "How many users would you like to create? "
    read numberOfUsers
fi

while [ $index -le $numberOfUsers ]; do
    # Enter username
    echo "Enter username"
    read username
    
    # Check if the username already exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists. Please choose a different username."
        continue
    fi
    
    # Create the new user
    sudo useradd $username

    # Set the password for the user
    echo "$username:$password" | sudo chpasswd

    ((index++))
done