# Image-feature-detection-and-recognition
Using LBP, Global LBP image algorithms and VGG16, ResNet18 neural networks for image recognition of objects and colors and designing a simple UI/UX interface with MATLAB to allow users to input their own database for image classification.  
## Interface 
![interface](https://github.com/hsieh672/Image-feature-detection-and-recognition/blob/main/imag/interface.png)  
## Load all images 
Push the botton "Display" to load the image which you want to search.  
The data I used contain 440 images and each page of the interface contains 10 images
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
Push the botton "Target" to enter the number of target image.  
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
## Define the weights of each features
There are five bottons under "weights", enter a number of the weights you need to use for each features.  
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
Push the botton "Search" start searching for the closest images to the target image.  
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
![food](https://github.com/hsieh672/Image-feature-detection-and-recognition/blob/main/imag/food.png)
