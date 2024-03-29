# Image-feature-detection-and-recognition
Using LBP, Global LBP image algorithms, and VGG16, ResNet18 neural networks for image recognition of objects and colors and designing a simple UI/UX interface with MATLAB to allow users to input their database for image classification.  
## Interface 
![interface](https://github.com/hsieh672/Image-feature-detection-and-recognition/blob/main/imag/interface.png)  
## Load all images 
Push the " Display " button to load the image you want to search.  
The data I used contains 440 images, and each page of the interface contains ten images
```sh
function pushbutton1_Callback(hObject, eventdata, handles)

row=240;
col=300;
img=zeros(row,col,3,440);
pp=0;
point_color=0;
index=[1 2 3 4 5 6 7 8 9 10];
index_ori=[1:440]; %原始排序

for i=1:440
    img(:,:,:,i)=imresize(imread(['E:\collection_for_1082\1 (' num2str(i) ').jpg']),[row col]);
    index_new(i)=i;
end

for i=1:10
    axes(handles.(['axes',num2str(i)]));
    imshow(uint8(img(:,:,:,index(i))));
end

for i=1:10
    set(handles.(['edit',num2str(i)]),'String',[index(i)+10*pp]);
end
  
pp=0;
set(handles.edit11,'String',['page ' num2str(pp) ' of 44']);

point=0;
save data_pp.mat pp;
save data_img.mat img;
```
## Define target image
Push the button "Target" to enter the number of target images.  
```sh
function pushbutton2_Callback(hObject, eventdata, handles)

global index point idx_q index_new index_ori
load data_pp.mat;
load data_img.mat;

if pp == 0
   pp =44;
else
   pp = pp -1;
end
 
                  
set(handles.edit11,'String',['page ' num2str(pp) ' of 44']);

index_new=index;
if pp ~= 44 && point ~= 1
    for i=1:10
       index_new(i)=index(i)+10*pp;
    end   
elseif pp == 44 & point==1
    for i=1:4
       index_new(i)=idx_q( pp*10 + i);
    end
elseif pp == 44 & point~=1
    for i=1:4
       index_new(i)=index(i)+10*pp;
    end
elseif pp ~= 44 & point==1
    for i=1:10
       index_new(i)=idx_q(pp*10 + i);
    end
end


if pp<44 && pp>=0 
    for i=1:10
        axes(handles.(['axes',num2str(i)]));
        imshow(uint8(img(:,:,:,index_new(i))));
        set(handles.(['edit',num2str(i)]),'String',[index_new(i)]);
    end       
elseif pp==44
       set(handles.edit11,'String',['page ' num2str(pp) ' of 44']);

    for i=1:10
        axes(handles.(['axes',num2str(i)]));
        img(:,:,:,i)=imshow(uint8(img(:,:,:,index_new(i))));
        set(handles.(['edit',num2str(i)]),'String',[index_new(i)]);
    end
end

save data_pp.mat pp;
```
## Define the weights of each feature
There are five buttons under "weights".  
Enter the number of the weights you need to use for each feature.  
```sh
function pushbutton5_Callback(hObject, eventdata, handles)

global index point idx_q index_new point_color
load data_img.mat img;
load data_pp.mat pp;
row=240;
col=300;
tar=str2num(get(handles.edit15,'String')); %定義所選圖
w_query=str2num(get(handles.edit12,'String')); %定義Query權重
w_color_layout=str2num(get(handles.edit13,'String')); %定義color layout權重
w_correlation=str2num(get(handles.edit14,'String')); %定義correlation權重
w_globallbp=str2num(get(handles.edit17,'String')); %定義globallbp權重
w_locallbp=str2num(get(handles.edit18,'String')); %定義locallbp權重
```
## Search images
Push the button "Search" and start searching for the closest images to the target image.  
```sh
%與target距離加權
for i=1:440
    norm_total(i)=w_query*norm_Query(i)+w_color_layout*norm_Color(i)+w_correlation*norm_Correlation(i)+w_globallbp*norm_Global(i)+w_locallbp*norm_Local(i);
end

[v idx]=sort(norm_total); %排列與目標圖最相關
    
pp=0;
set(handles.edit11,'String',['page ' num2str(pp) ' of 44']);

for i=1:10
    axes(handles.(['axes',num2str(i)])); %重新放入與目標圖最相關的圖片
    imshow(uint8(img(:,:,:,idx(i))));
    set(handles.(['edit',num2str(i)]),'String',[idx(i)]);   
end

index_new=idx;
idx_q=idx;
point=1;
save data_pp.mat pp;
```
## Simulation Results
![bus](https://github.com/hsieh672/Image-feature-detection-and-recognition/blob/main/imag/bus.png)  
#### Discussion
1. When searching for this image, it was found that using a Query analysis of image color produced the most similar results from a single feature. In contrast, GlobalLBP and Local LBP analysis produced more consistent results in analyzing image motion. Therefore, when integrating features, Query, GlobalLBP, and Local LBP were chosen to analyze this image, resulting in the above figure.  

2. From a single feature analysis perspective, Correlation performed the worst. It is speculated that this method requires comparison with the 3-dimensional RGB values of neighboring pixels, causing similar results in essential areas of the entire image. Still, insignificant regions like the background may result in significant differences if one pixel is compared similarly. If each pixel is summed up, it can cause a considerable difference.  
 
3. GlobalLBP and Local LBP first converted the image to grayscale before image processing. When comparing the differences in surrounding pixels, they only needed to compare the differences between 1-dimensional [0 1], which is more straightforward than Correlation, resulting in better comparison results.  

![food](https://github.com/hsieh672/Image-feature-detection-and-recognition/blob/main/imag/food.png)  
#### Discussion
1. When searching for this image, it was found that GlobalLBP and Local LBP analysis of image color produced the most similar results to the target image from a single feature. Therefore, GlobalLBP and Local LBP were chosen to analyze this image when integrating features. Since the results of both analysis methods were similar, the weights were adjusted to 1:1, resulting in the above figure.  

2. From a single feature analysis perspective, because this image is cluttered in both color and object, when using Query, Color Layout, or Correlation to compare the differences between each pixel, regardless of whether image resizing or color quantization was performed, it wasn't easy to distinguish between the background and the object, resulting in more significant differences in the analysis results.  

3. In the Correlation analysis method, as long as one pixel is the same as the target pixel and is marked, it may produce significant differences compared to other points similar to the target image but not marked in that pixel.  
