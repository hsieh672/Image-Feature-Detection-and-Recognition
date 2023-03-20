function varargout = people(varargin)
% PEOPLE MATLAB code for people.fig
%      PEOPLE, by itself, creates a new PEOPLE or raises the existing
%      singleton*.
%
%      H = PEOPLE returns the handle to a new PEOPLE or the handle to
%      the existing singleton*.
%
%      PEOPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PEOPLE.M with the given input arguments.
%
%      PEOPLE('Property','Value',...) creates a new PEOPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before people_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to people_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help people

% Last Modified by GUIDE v2.5 04-Jun-2021 15:36:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @people_OpeningFcn, ...
                   'gui_OutputFcn',  @people_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before people is made visible.
function people_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to people (see VARARGIN)

% Choose default command line output for people
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes people wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = people_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global index point index_new index_ori point_color
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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global index point idx_q index_new index_ori
load data_pp.mat;
load data_img.mat;
index_new=index;
if pp == 44
   pp =0;
else
   pp = pp +1;
end
 
if pp==44
    set(handles.edit11,'String',['page ' num2str(pp) ' of 44']);
    if point==1
        for i=1:4
            index_new(i)=idx_q( pp*10 + i);
        end
    elseif point~=1
        for i=1:4
            index_new(i)=index(i)+10*pp;
        end
    end

    for i=1:10
        axes(handles.(['axes',num2str(i)]));
        imshow(uint8(img(:,:,:,index_new(i))));
        set(handles.(['edit',num2str(i)]),'String',[index_new(i)]);
    end
else %pp ~= 32
    set(handles.edit11,'String',['page ' num2str(pp) ' of 44']);
    if point ~= 1
        for i=1:10
            index_new(i)=index(i)+10*pp;
        end   
    elseif point==1
        for i=1:10
            index_new(i)=idx_q(pp*10 + i);
        end
    end
    
    for i=1:10
        axes(handles.(['axes',num2str(i)]));
        imshow(uint8(img(:,:,:,index_new(i))));
        set(handles.(['edit',num2str(i)]),'String',[index_new(i)]);
    end   

end

save data_pp.mat pp;



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double



% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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

%Query
if w_query>0
    for i=1:440
        im(:,:,:)=imresize(imread(['E:\collection_for_1082\1 (' num2str(i) ').jpg']),[row,col]);
        [n loc]=imhist(rgb2gray(im),16); %loc:橫軸 n:縱軸
        normal=n/(row*col); %標準化
        if i==1
            f_db=normal;
        else
            f_db=[f_db,normal];
        end
    end

    for i=1:440
        norm_query(i)=sum(abs(f_db(:,tar)-f_db(:,i))); %比較與所選圖的距離
    end
end

%Color layout
if w_color_layout>0
    img_color=zeros(70,70,3,440);
    for i=1:440 %365張M*N圖存入img_color
        img_color(:,:,:,i)=imresize(img(:,:,:,i),[70 70]);
        norm_color(i)=sum(sum(sum(abs(img_color(:,:,:,tar)-img_color(:,:,:,i))))); %rgb
    end   
end

%LBP
if w_globallbp>0 | w_locallbp>0
num=0;
img=uint8(img);
for i=1:440 %gray
    if i==1
       img_gray1=rgb2gray(img(:,:,:,1));
    else
       img_gray1=[img_gray1,rgb2gray(img(:,:,:,i))];
    end
end

for i=1:440
    a=img_gray1(:,num+1:num+300);
    if i==1
        img_gray=cat(3,a);
    else
        img_gray=cat(3,img_gray,a);
    end
    num=num+300;
end

%glogal Lbp
if w_globallbp>0
    for i=1:440
        LBPfeatures = extractLBPFeatures(img_gray(:,:,i),'Upright',false);
        if i==1
            global_lbp=[LBPfeatures];
        else
            global_lbp=[global_lbp;LBPfeatures];
        end
    end
    for i=1:440
        norm_global(i)=sum(abs(global_lbp(tar,:)-global_lbp(i,:)));
    end
end

%local Lbp
if w_locallbp>0
    for i=1:440
        LBPfeatures = extractLBPFeatures(img_gray(:,:,i), 'Cellsize' ,[38 38], 'Upright',false);
        if i==1
            local_lbp=[LBPfeatures];
        else
            local_lbp=[local_lbp;LBPfeatures];
        end
    end
    for i=1:440
        norm_local(i)=sum(abs(local_lbp(tar,:)-local_lbp(i,:)));
    end
end
end

%Correlation
if w_correlation>0
    dis=8; %str2num(get(handles.edit58,'String')); %比對距離

    for i=1:440
        img_q(:,:,:,i)=imquantize(imresize(img(:,:,:,i),[30 20]),0:16:255); %顏色重新分類成16種
    end
    img_tar=img_q(:,:,:,tar);

    for x=1:30
        for y=1:20
            for i=1:30 %計算每個pixel與目標pixel的距離
                for j=1:20
                    dist_q(x,y,i,j)=floor(sqrt((x-i)^2+(y-j)^2));
                end
            end
        end
    end

    count=zeros(30,20,441,dis);
    count(30,20,441,:)=[1:dis];
    ori=zeros(30,20,1,dis);

    for x=1:30
        for y=1:20
            for num=1:440 %檢查每張圖的每個pixel與目標pixel的RGB
                for k=1:dis
                    for i=1:30
                        for j=1:20
                            for m=1:3
                                if dist_q(x,y,i,j)==k
                                    if img_tar(x,y,m,1)==img_q(i,j,m,num) %檢查RGB是否相等
                                        count(x,y,num,k)=count(x,y,num,k)+1;
                                    end
                                    if num==1 
                                        ori(x,y,1,k)=ori(x,y,1,k)+1;%儲存每個距離共有多少個
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    for x=1:30
        for y=1:20
            for num=1:440
                for k=1:dis
                    r(x,y,num,k)=count(x,y,num,k)/ori(x,y,1,k); %計算每張圖與目標圖pixel對應的比例
                end
            end
        end
    end

    for i=1:440 %計算每張圖與目標圖的距離
        for x=1:30
            for y=1:20
                norm_correlation(i)=sum(sum(abs(r(x,y,tar,:)-r(x,y,i,:)))/sum((1+r(x,y,tar,:)+r(x,y,i,:))));
            end
        end
    end
end

%數據標準化 (x-min)/(max-min)
for i=1:440
    if w_query>0
        norm_Query(i)=norm_query(i)/max(norm_query);
    elseif w_query==0
        norm_Query(i)=0;
    end
    if w_color_layout>0
        norm_Color(i)=norm_color(i)/max(norm_color);
    elseif w_color_layout==0
        norm_Color(i)=0;
    end
    if w_correlation>0
        norm_Correlation(i)=norm_correlation(i)/max(norm_correlation);
    elseif w_correlation==0
        norm_Correlation(i)=0;
    end
    if w_globallbp>0
        norm_Global(i)=norm_global(i)/max(norm_global);
    elseif w_globallbp==0
        norm_Global(i)=0;
    end
    if w_locallbp>0
        norm_Local(i)=norm_local(i)/max(norm_local);
    elseif w_locallbp==0
        norm_Local(i)=0;
    end
end

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



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
