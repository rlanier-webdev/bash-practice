#!/bin/bash

# A script that will determine if a number is event

number=15

if [ $((number % 2)) -eq 0 ];
then
    echo "The number $number is even!";
else
    echo "The number $number is odd!";
fi