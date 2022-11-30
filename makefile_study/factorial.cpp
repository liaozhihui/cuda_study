//
// Created by 廖智慧 on 30.11.22.
//
#include "functions.h"

int factorial(int n){

    if (n==1)
        return 1;
    else
        return n* factorial(n-1);

}