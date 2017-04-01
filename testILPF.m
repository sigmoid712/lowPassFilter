%filename = 'picture/background.jpg';
filename = 'picture/classical.jpg';
I0= rgb2gray(imread(filename));
I1 = imnoise(I0,'gaussian');       %给图像添加均值m为0，方差var为0.01的高斯噪声
I2 = imnoise(I0,'salt & pepper');  %给图像添加噪声密度为0.05的椒盐噪声
I3 = imnoise(I0,'speckle');        %给图像添加方差为0.04的乘性噪声
I4 = imnoise(I0,'poisson');        %给图像添加泊松噪声

n = 10;
for i=1:20
F1 = ILPF(I1,i*n);
figure(i);
set(figure(i),'visible','off','Name',['理想低通滤波器D0=',num2str(i*n)]);
subplot(2,3,1);
imshow(I0);
title('原图');
subplot(2,3,4);
imshow(real(fftshift(fft2(I0))));
title('原图频谱')
subplot(2,3,2);
imshow(I1);
title('加高斯噪声图像');
subplot(2,3,5);
imshow(real(fftshift(fft2(I1))));
title('加噪频谱')
subplot(2,3,3);
imshow(F1);
title('滤波后图像');
subplot(2,3,6);
imshow(real(fftshift(fft2(F1))));
title('滤波后频谱');
saveas(gcf,['result/ILPF/GaussianNoise/理想低通滤波器D0=',num2str(i*n),'.jpg'])
end

n = 10;
for i=1:20
F2 = ILPF(I2,i*n);
figure(i);
set(figure(i),'visible','off','Name',['理想低通滤波器D0=',num2str(i*n)]);
subplot(2,3,1);
imshow(I0);
title('原图');
subplot(2,3,4);
imshow(real(fftshift(fft2(I0))));
title('原图频谱')
subplot(2,3,2);
imshow(I1);
title('加椒盐噪声图像');
subplot(2,3,5);
imshow(real(fftshift(fft2(I1))));
title('加噪频谱')
subplot(2,3,3);
imshow(F2);
title('滤波后图像');
subplot(2,3,6);
imshow(real(fftshift(fft2(F2))));
title('滤波后频谱');
saveas(gcf,['result/ILPF/SaltNoise/理想低通滤波器D0=',num2str(i*n),'.jpg'])
end

n = 10;
for i=1:20
F3 = ILPF(I3,i*n);
figure(i);
set(figure(i),'visible','off','Name',['理想低通滤波器D0=',num2str(i*n)]);
subplot(2,3,1);
imshow(I0);
title('原图');
subplot(2,3,4);
imshow(real(fftshift(fft2(I0))));
title('原图频谱')
subplot(2,3,2);
imshow(I1);
title('加乘性噪声图像');
subplot(2,3,5);
imshow(real(fftshift(fft2(I1))));
title('加噪频谱')
subplot(2,3,3);
imshow(F3);
title('滤波后图像');
subplot(2,3,6);
imshow(real(fftshift(fft2(F3))));
title('滤波后频谱');
saveas(gcf,['result/ILPF/SpeckleNoise/理想低通滤波器D0=',num2str(i*n),'.jpg'])
end

n = 10;
for i=1:20
F4 = ILPF(I4,i*n);
figure(i);
set(figure(i),'visible','off','Name',['理想低通滤波器D0=',num2str(i*n)]);
subplot(2,3,1);
imshow(I0);
title('原图');
subplot(2,3,4);
imshow(real(fftshift(fft2(I0))));
title('原图频谱')
subplot(2,3,2);
imshow(I1);
title('加泊松噪声图像');
subplot(2,3,5);
imshow(real(fftshift(fft2(I1))));
title('加噪频谱')
subplot(2,3,3);
imshow(F4);
title('滤波后图像');
subplot(2,3,6);
imshow(real(fftshift(fft2(F4))));
title('滤波后频谱');
saveas(gcf,['result/ILPF/PoissonNoise/理想低通滤波器D0=',num2str(i*n),'.jpg'])
end