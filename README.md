# Image-feature-detection-and-recognition
Using LBP, Global LBP image algorithms and VGG16, ResNet18 neural networks for image recognition of objects and colors and designing a simple UI/UX interface with MATLAB to allow users to input their own database for image classification.  
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
```
## Define target image
Push the botto "Target" to enter a number of target image
