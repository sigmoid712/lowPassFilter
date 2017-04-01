function [ returnImageArray ] = TLPF( imageArray,D0,D1  )
%   created by qiyue  2017/4/1
%   对图像进行梯形低通滤波
%   参数分别为 图像的二维灰度数组  阶数  截止频率
%   返回值为  滤波后的图像二维灰度数组

[M,N] = size(imageArray); %获取图片大小

H = zeros(M,N);           %滤波器
G = zeros(M,N);           %滤波后频谱图

F = fft2(imageArray);     %进行快速傅里叶变换
F = fftshift(F);          %将零频率位置移到频谱中心

X0 = floor(M/2);          %零频率在频率中的位置
Y0 = floor(N/2);

%构造滤波器  并进行滤波
 for i=1:M
     for j=1:N
         d = sqrt((i-X0)^2 + (j - Y0)^2);
         if d < D0
             H(i,j) = 1;
         elseif d < D1
             H(i,j) = (d - D1)/(D1 - D0);
         else
             H(i,j) = 0;
         end
         G(i,j) = F(i,j)*H(i,j);
     end
 end
 
G = ifftshift(G);     %反傅里叶变换
G = ifft2(G);         %反FFT移动
G = uint8(real(G));   %取复数的实部转化为8位无符号整数
returnImageArray = G; %返回滤波后图片数组
end