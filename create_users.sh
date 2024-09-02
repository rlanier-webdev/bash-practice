#!/bin/bash

# This script will create users based on user input and set with a default password

numberOfUsers=$1
index=1
password="password"

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
    # Set to default password
    read username
    sudo useradd $username
    sudo passwd $username
    ((index++))
done