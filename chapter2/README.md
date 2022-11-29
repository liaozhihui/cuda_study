# 编译.cu文件，使用命令 nvcc **.cu -o ***

# 1、调用核函数的格式 hello2.cu
## hello_from_gpu<<<1,1>>>();
### 调用核函数为什么需要三个尖括号？
一块GPU有很多块计算核心，可以支持很多thread。主机调用核函数必须指明需要在设备中指派多少个线程。
核函数中的线程常组织为若干线程块(thread block)。三个括号中第一个数字是线程块(thread block)
第二个数字是线程块的线程数。一个核函数的全部线程块构成一个网格(grid)。线程块的个数就记为grid size。
每个线程块含有相同的个数线程数，称为block size。因此<<<网格大小,线程块大小>>>

# 2、使用多个线程的核函数 hello3.cu
## hello_from_gpu<<<2,4>>>();
在使用核函数是通过<<<>>>指定多个线程。在hello3.cu中就会调用8次 

# 3.使用线程索引 hello4.cu
每个线程在核函数中的都有一个唯一的身份标识。而核函数内部，程序是知道执行配置参数grid_size和block_size的值的。

这两个值分别保存在gridDim.x和blockDim.x。

blockIdx.x：指定一个线程在网格中的线程块指标，范围0-gridDim.x-1

threadIdx.x：指定一个线程在线程块中的线程指标，范围0-blockDim.x-1

# 4、推广至多维网格 hello5.cu
gridDim和blockDim都是unit3的变量。unit3是一个结构体，具有x,y,z三个成员，是在vector_types.h中定义。
在girdDim和blockDim中没有被指定的成员取默认值1。
#### 用结构体dim3定义"多维"的网格和线程块:
dim3 grid_size(Gx,Gy,Gz); <br>
dim3 block_size(Bx,By,Bz); <br>
如果第三维是1，则可以不写  



