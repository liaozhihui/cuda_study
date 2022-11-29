//
// Created by 廖智慧 on 29.11.22.
//
#include <stdio.h>
__global__ void hello_from_gpu(){
    printf("Hello World from the GPU!\n");
}
int main(){
    hello_from_gpu<<<1,1>>>();
    cudaDeviceSynchronize(); //同步主机与设备，刷新缓存区，输出字符
    return 0;
}
