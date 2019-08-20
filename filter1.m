function assignment1()
%Load images
img_barbara = imread('barbara.tif');
img_einstein = imread('einstein.tif');
img_lena = imread('lena.tif');
img_top = imread('top.tif');

% apply noise
%barbara
%apply salt and pepper noise of images
noise_barbara_salt = imnoise(img_barbara,'salt & pepper', 0.02);
%apply gaussian noise of images 
noise_barbara_gaussian = imnoise(img_barbara, 'gaussian', 0.02);

%einstein
%apply salt and pepper noise of images
noise_einstein_salt = imnoise(img_einstein,'salt & pepper', 0.02);
%apply gaussian noise of images 
noise_einstein_gaussian = imnoise(img_einstein, 'gaussian', 0.02);

%lena
%apply salt and pepper noise of images
noise_lena_salt = imnoise(img_lena,'salt & pepper', 0.02);
%apply gaussian noise of images 
noise_lena_gaussian = imnoise(img_lena, 'gaussian', 0.02);

%top
%apply salt and pepper noise of images
noise_top_salt = imnoise(img_top,'salt & pepper', 0.02);
%apply gaussian noise of images 
noise_top_gaussian = imnoise(img_top, 'gaussian', 0.02);


%apply filters
%median filter of barbara images
filter_med_salt_barbara =  medfilt2(noise_barbara_salt, [3,3]);
filter_med_gaus_barbara =  medfilt2(noise_barbara_gaussian, [3,3]);

%median filter of einstein images
filter_med_salt_einstein =  medfilt2(noise_einstein_salt, [3,3]);
filter_med_gaus_einstein =  medfilt2(noise_einstein_gaussian, [3,3]);

%median filter of lena images
filter_med_salt_lena =  medfilt2(noise_lena_salt, [3,3]);
filter_med_gaus_lena =  medfilt2(noise_lena_gaussian, [3,3]);

%median filter of top images
filter_med_salt_top =  medfilt2(noise_top_salt, [3,3]);
filter_med_gaus_top =  medfilt2(noise_top_gaussian, [3,3]);

%mean filter
%barbara 
hsize = 3;
h1 = fspecial('average',hsize); 
meanfilter_barbara_salt = imfilter(noise_barbara_salt,h1);
meanfilter_barbara_gaus = imfilter(noise_barbara_gaussian,h1);

%einstein
meanfilter_einstein_salt = imfilter(noise_einstein_salt,h1);
meanfilter_einstein_gaus = imfilter(noise_einstein_gaussian,h1);

%lena
meanfilter_lena_salt = imfilter(noise_lena_salt,h1);
meanfilter_lena_gaus = imfilter(noise_lena_gaussian,h1);

%top
meanfilter_top_salt = imfilter(noise_top_salt,h1);
meanfilter_top_gaus = imfilter(noise_top_gaussian,h1);

%calculate mse
%calculate mean square error of barbara image 
[rows1, columns1] = size(img_barbara);
%calculate mean square error of einstein image 
[rows2, columns2] = size(img_einstein);
%calculate mean square error of lena image 
[rows3, columns3] = size(img_lena);
%calculate mean square error of top image 
[rows4, columns4] = size(img_top);

%gaussian low pass filter 
%barbara image

sigma = 0.5;

h2 =fspecial('gaussian', hsize, sigma);
gaussian_barbara_salt = imfilter(noise_barbara_salt,h2);

gaussian_barbara_gaus = imfilter(noise_barbara_gaussian,h2);

%einstein
gaussian_einstein_salt = imfilter(noise_einstein_salt,h2);

gaussian_einstein_gaus = imfilter(noise_einstein_gaussian,h2);

%lena
gaussian_lena_salt = imfilter(noise_lena_salt,h2);

gaussian_lena_gaus = imfilter(noise_lena_gaussian,h2);

%top

gaussian_top_salt = imfilter(noise_top_salt,h2);

gaussian_top_gaus  = imfilter(noise_top_gaussian,h2);


%calculate square error of barbara image 
squaredErrorImage_barbara_salt = (double(img_barbara) - double(noise_barbara_salt)) .^ 2;
squaredErrorImage_barbara_gaus = (double(img_barbara) - double(noise_barbara_gaussian)) .^ 2;

squaredErrorImage_barbara_salt_med = (double(img_barbara) - double(filter_med_salt_barbara)) .^ 2;
squaredErrorImage_barbara_gaus_med = (double(img_barbara) - double(filter_med_gaus_barbara)) .^ 2;

squaredErrorImage_barbara_salt_meanfilt = (double(img_barbara) - double(meanfilter_barbara_salt)) .^ 2;
squaredErrorImage_barbara_gaus_meanfilt = (double(img_barbara) - double(meanfilter_barbara_gaus)) .^ 2;

squaredErrorImage_barbara_salt_gausfilt = (double(img_barbara) - double(gaussian_barbara_salt)) .^ 2;
squaredErrorImage_barbara_gaus_gausfilt = (double(img_barbara) - double(gaussian_barbara_gaus)) .^ 2;

%calculate square error of einstein image 
squaredErrorImage_einstein_salt = (double(img_einstein) - double(noise_einstein_salt)) .^ 2;
squaredErrorImage_einstein_gaus = (double(img_einstein) - double(noise_einstein_gaussian)) .^ 2;

squaredErrorImage_einstein_salt_med = (double(img_einstein) - double(filter_med_salt_einstein)) .^ 2;
squaredErrorImage_einstein_gaus_med = (double(img_einstein) - double(filter_med_gaus_einstein)) .^ 2;

squaredErrorImage_einstein_salt_meanfilt = (double(img_einstein) - double(meanfilter_einstein_salt)) .^ 2;
squaredErrorImage_einstein_gaus_meanfilt = (double(img_einstein) - double(meanfilter_einstein_gaus)) .^ 2;

squaredErrorImage_einstein_salt_gausfilt = (double(img_einstein) - double(gaussian_einstein_salt)) .^ 2;
squaredErrorImage_einstein_gaus_gausfilt = (double(img_einstein) - double(gaussian_einstein_gaus)) .^ 2;

%calculate square error of lena image 
squaredErrorImage_lena_salt = (double(img_lena) - double(noise_lena_salt)) .^ 2;
squaredErrorImage_lena_gaus = (double(img_lena) - double(noise_lena_gaussian)) .^ 2;

squaredErrorImage_lena_salt_med = (double(img_lena) - double(filter_med_salt_lena)) .^ 2;
squaredErrorImage_lena_gaus_med = (double(img_lena) - double(filter_med_gaus_lena)) .^ 2;

squaredErrorImage_lena_salt_meanfilt = (double(img_lena) - double(meanfilter_lena_salt)) .^ 2;
squaredErrorImage_lena_gaus_meanfilt = (double(img_lena) - double(meanfilter_lena_gaus)) .^ 2;

squaredErrorImage_lena_salt_gausfilt = (double(img_lena) - double(gaussian_lena_salt)) .^ 2;
squaredErrorImage_lena_gaus_gausfilt = (double(img_lena) - double(gaussian_lena_gaus)) .^ 2;

squaredErrorImage_lena_salt_med_scale = imresize(squaredErrorImage_lena_salt_med, 0.5);

%calculate square error of top image 
squaredErrorImage_top_salt = (double(img_top) - double(noise_top_salt)) .^ 2;
squaredErrorImage_top_gaus = (double(img_top) - double(noise_top_gaussian)) .^ 2;

squaredErrorImage_top_salt_med = (double(img_top) - double(filter_med_salt_top)) .^ 2;
squaredErrorImage_top_gaus_med = (double(img_top) - double(filter_med_gaus_top)) .^ 2;

squaredErrorImage_top_salt_meanfilt = (double(img_top) - double(meanfilter_top_salt)) .^ 2;
squaredErrorImage_top_gaus_meanfilt = (double(img_top) - double(meanfilter_top_gaus)) .^ 2;

squaredErrorImage_top_salt_gausfilt = (double(img_top) - double(gaussian_top_salt)) .^ 2;
squaredErrorImage_top_gaus_gausfilt = (double(img_top) - double(gaussian_top_gaus)) .^ 2;

%calculate mean square error of barbara image 
mse_barbara_salt = sum(sum(squaredErrorImage_barbara_salt)) / (rows1 * columns1);
mse_barbara_gaus = sum(sum(squaredErrorImage_barbara_gaus)) / (rows1 * columns1);

mse_barbara_salt_med = sum(sum(squaredErrorImage_barbara_salt_med)) / (rows1 * columns1);
mse_barbara_gaus_med = sum(sum(squaredErrorImage_barbara_gaus_med)) / (rows1 * columns1);

mse_barbara_salt_meanfilt = sum(sum(squaredErrorImage_barbara_salt_meanfilt)) / (rows1 * columns1);
mse_barbara_gaus_meanfilt = sum(sum(squaredErrorImage_barbara_gaus_meanfilt)) / (rows1 * columns1);

mse_barbara_salt_gausfilt = sum(sum(squaredErrorImage_barbara_salt_gausfilt)) / (rows1 * columns1);
mse_barbara_gaus_gausfilt = sum(sum(squaredErrorImage_barbara_gaus_gausfilt)) / (rows1 * columns1);

%calculate mean square error of einstein image 
mse_einstein_salt = sum(sum(squaredErrorImage_einstein_salt)) / (rows2 * columns2);
mse_einstein_gaus = sum(sum(squaredErrorImage_einstein_gaus)) / (rows2 * columns2);

mse_einstein_salt_med = sum(sum(squaredErrorImage_einstein_salt_med)) / (rows2 * columns2);
mse_einstein_gaus_med = sum(sum(squaredErrorImage_einstein_gaus_med)) / (rows2 * columns2);

mse_einstein_salt_meanfilt = sum(sum(squaredErrorImage_einstein_salt_meanfilt)) / (rows2 * columns2);
mse_einstein_gaus_meanfilt = sum(sum(squaredErrorImage_einstein_gaus_meanfilt)) / (rows2 * columns2);

mse_einstein_salt_gausfilt = sum(sum(squaredErrorImage_einstein_salt_gausfilt)) / (rows2 * columns2);
mse_einstein_gaus_gausfilt = sum(sum(squaredErrorImage_einstein_gaus_gausfilt)) / (rows2 * columns2);

%calculate mean square error of lena image 
mse_lena_salt = sum(sum(squaredErrorImage_lena_salt)) / (rows3 * columns3);
mse_lena_gaus = sum(sum(squaredErrorImage_lena_gaus)) / (rows3 * columns3);

mse_lena_salt_med = sum(sum(squaredErrorImage_lena_salt_med)) / (rows3 * columns3);
mse_lena_gaus_med = sum(sum(squaredErrorImage_lena_gaus_med)) / (rows3 * columns3);

mse_lena_salt_meanfilt = sum(sum(squaredErrorImage_lena_salt_meanfilt)) / (rows3 * columns3);
mse_lena_gaus_meanfilt = sum(sum(squaredErrorImage_lena_gaus_meanfilt)) / (rows3 * columns3);

mse_lena_salt_gausilt = sum(sum(squaredErrorImage_lena_salt_gausfilt)) / (rows3 * columns3);
mse_lena_gaus_gausfilt = sum(sum(squaredErrorImage_lena_gaus_gausfilt)) / (rows3 * columns3);

%calculate mean square error of top image 
mse_top_salt = sum(sum(squaredErrorImage_top_salt)) / (rows4 * columns4);
mse_top_gaus = sum(sum(squaredErrorImage_top_gaus)) / (rows4 * columns4);

mse_top_salt_med = sum(sum(squaredErrorImage_top_salt_med)) / (rows4 * columns4);
mse_top_gaus_med = sum(sum(squaredErrorImage_top_gaus_med)) / (rows4 * columns4);

mse_top_salt_meanfilt = sum(sum(squaredErrorImage_top_salt_meanfilt)) / (rows4 * columns4);
mse_top_gaus_meanfilt = sum(sum(squaredErrorImage_top_gaus_meanfilt)) / (rows4 * columns4);

mse_top_salt_gausfilt = sum(sum(squaredErrorImage_top_salt_gausfilt)) / (rows4 * columns4);
mse_top_gaus_gausfilt = sum(sum(squaredErrorImage_top_gaus_gausfilt)) / (rows4 * columns4);


%Barbara,einstein, lena and top original image
figure(1)
subplot(1,4,1), imshow(img_barbara);
title('Original Barbara');
subplot(1,4,2), imshow(img_einstein);
title('Original Einstein');
subplot(1,4,3), imshow(img_lena);
title('Original lena');
subplot(1,4,4), imshow(img_top);
title('Original top');

%Salt and pepper image 
figure(2)
subplot(1,4,1), imshow(noise_barbara_salt);
title('Salt & pepper of barbara');

subplot(1,4,2), imshow(noise_einstein_salt);
title('Salt & pepper of einstein');

subplot(1,4,3), imshow(noise_lena_salt);
title('Salt & pepper of lena');

subplot(1,4,4), imshow(noise_top_salt);
title('Salt & pepper of top');

%Gaussian image
figure(3)
subplot(1,4,1), imshow(noise_barbara_gaussian);
title('Gaussian noise of barbara');

subplot(1,4,2), imshow(noise_einstein_gaussian);
title('Gaussian noise of einstein');

subplot(1,4,3), imshow(noise_lena_gaussian);
title('Gaussian noise of lena');

subplot(1,4,4), imshow(noise_top_gaussian);
title('Gaussian noise of top');

%filters-median salt and pepper noise
figure(4)
subplot(1,4,1), imshow(filter_med_salt_barbara);
title('Median filter(salt & pepper)');
subplot(1,4,2), imshow(filter_med_salt_einstein);
title('Median filter(salt & pepper)');

subplot(1,4,3), imshow(filter_med_salt_lena);
title('Median filter(salt & pepper)');

subplot(1,4,4), imshow(filter_med_salt_top);
title('Median filter(salt & pepper)');

%filters-median gaussian noise
figure(5)
subplot(1,4,1), imshow(filter_med_gaus_barbara);
title('Median filter(Gaussian)');

subplot(1,4,2), imshow(filter_med_gaus_einstein);
title('Median filter(Gaussian)');

subplot(1,4,3), imshow(filter_med_gaus_lena);
title('Median filter(Gaussian)');

subplot(1,4,4), imshow(filter_med_gaus_top);
title('Median filter(Gaussian)');

%mean filter for salt and pepper
figure(6)
subplot(1,4,1), imshow(meanfilter_barbara_salt);
title('Mean filter(salt & pepper)');

subplot(1,4,2), imshow(meanfilter_einstein_salt);
title('Mean filter(salt & pepper)');

subplot(1,4,3), imshow(meanfilter_lena_salt);
title('Mean filter(salt & pepper)');

subplot(1,4,4), imshow(meanfilter_top_salt);
title('Mean filter(salt & pepper)');

%mean filter for gaussian
figure(7)
subplot(1,4,1), imshow(meanfilter_barbara_gaus);
title('Mean filter(Gaussian)');

subplot(1,4,2), imshow(meanfilter_einstein_gaus);
title('Mean filter(Gaussian)');

subplot(1,4,3), imshow(meanfilter_lena_gaus);
title('Mean filter(Gaussian)');

subplot(1,4,4), imshow(meanfilter_top_gaus);
title('Mean filter(Gaussian)');

%laplacian filter
figure(8)
subplot(1,4,1), imshow(gaussian_barbara_salt);
title('Gaussian Low Pass(salt & pepper)');

subplot(1,4,2), imshow(gaussian_einstein_salt);
title('Gaussian Low Pass(salt & pepper)');

subplot(1,4,3), imshow(gaussian_lena_salt);
title('Gaussian Low Pass(salt & pepper)');

subplot(1,4,4), imshow(gaussian_top_salt);
title('Gaussian Low Pass(salt & pepper)');

figure(9)
subplot(1,4,1), imshow(gaussian_barbara_gaus);
title('Gaussian Low Pass(Gaussian)');


subplot(1,4,2), imshow(gaussian_einstein_gaus);
title('Gaussian Low Pass(Gaussian)');


subplot(1,4,3), imshow(gaussian_lena_gaus);
title('Gaussian Low Pass(Gaussian)');


subplot(1,4,4), imshow(gaussian_top_gaus);
title('Gaussian Low Pass(Gaussian)');

figure(10);

subplot(1,2,1), imshow(squaredErrorImage_lena_salt_med, []);
title('The best possible before scale');

subplot(1,2,2), imshow(squaredErrorImage_lena_salt_med_scale, []);
title('The best possible after scale');

%mse answers of noises:salt & pepper

fprintf('***Mean square error of salt and pepper noise ***\n');
fprintf('\n Barbara image is %0.3f\n', mse_barbara_salt);
fprintf('\n Eistein image is %0.3f\n', mse_einstein_salt);
fprintf('\n Lena image is %0.3f\n', mse_lena_salt);
fprintf('\n Top image is %0.3f\n', mse_top_salt);


%mse answers of noises:Gaussian

fprintf('***Mean square error of Gaussian noise ***\n');
fprintf('\n Barbara image is %0.3f\n', mse_barbara_gaus);
fprintf('\n Einstein image is %0.3f\n', mse_einstein_gaus);
fprintf('\n Lena image is %0.3f\n', mse_lena_gaus);
fprintf('\n Top image is %0.3f\n', mse_top_gaus);

%mse answers of filter salt & pepper:Median
fprintf('***Mean square error of Median filter for salt and pepper noise ***\n');
fprintf('\n Barbara image is %0.3f\n', mse_barbara_salt_med);
fprintf('\n Einstein image is %0.3f\n', mse_einstein_salt_med);
fprintf('\n Lena image is %0.3f\n', mse_lena_salt_med);
fprintf('\n Top image is %0.3f\n', mse_top_salt_med);


%mse answers of filter Gaussian :Median
fprintf('***Mean square error of Median filter for gaussian noise ***\n');
fprintf('\n Barbara image is %0.3f\n', mse_barbara_gaus_med);
fprintf('\n Einstein image is %0.3f\n', mse_einstein_gaus_med);
fprintf('\n Lena image is %0.3f\n', mse_lena_gaus_med);
fprintf('\n Top image is %0.3f\n', mse_top_gaus_med);

%mse answers of filter salt & pepper:Mean
fprintf('***Mean square error of Mean filter for salt and pepper noise ***\n');
fprintf('\n Barbara image is %0.3f\n', mse_barbara_salt_meanfilt);
fprintf('\n Eistein image is %0.3f\n', mse_einstein_salt_meanfilt);
fprintf('\n Lena image is %0.3f\n', mse_lena_salt_meanfilt);
fprintf('\n Top image is %0.3f\n', mse_top_salt_meanfilt');

%mse answers of filter Gaussian:Mean
fprintf('***Mean square error of Mean filter for gaussian noise ***\n');
fprintf('\n Barbara image is %0.3f\n', mse_barbara_gaus_meanfilt);
fprintf('\n Einstein image %0.3f\n', mse_einstein_gaus_meanfilt);
fprintf('\n Lena image is %0.3f\n', mse_lena_gaus_meanfilt);
fprintf('\n Top image is %0.3f\n', mse_top_gaus_meanfilt);

%mse answers of filter salt & pepper:Gaussian
fprintf('***Mean square error of Gaussian filter for salt and pepper noise ***\n');
fprintf('\n Barbara image is %0.3f\n', mse_barbara_salt_gausfilt);
fprintf('\n Einstein image is %0.3f\n', mse_einstein_salt_gausfilt);
fprintf('\n Lena image is %0.3f\n', mse_lena_salt_gausilt);
fprintf('\n Top image is %0.3f\n', mse_top_salt_gausfilt);


%mse answers of filter Gaussian:Gaussian

fprintf('***Mean square error of Gaussian filter for gaussian noise ***\n');
fprintf('\n Barbara image is %0.3f\n', mse_barbara_gaus_gausfilt );
fprintf('\n Einstein image %0.3f\n', mse_einstein_gaus_gausfilt);
fprintf('\n Lena image is %0.3f\n', mse_lena_gaus_gausfilt);
fprintf('\n Top image is %0.3f\n', mse_top_gaus_gausfilt);

end