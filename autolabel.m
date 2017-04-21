% function autolabel(img_dir,annotation_dir,object_name)
clear;
clc;
img_dir='C:\Users\fukun\Desktop\segment\data\';
annotation_dir='C:\Users\fukun\Desktop\segment\annotations\';
object_name='akita';

% 获取图像文件
imgs=dir(img_dir);
for i=3:length(imgs)
    a{i-2}=imgs(i).name;
end

for i=1:length(a)
    [xmin,ymin,xmax,ymax,width,height,depth]=boxpos([img_dir,a{i}]);
    filename=a{i};
    meta{1}=num2str(xmin);
    meta{2}=num2str(ymin);
    meta{3}=num2str(xmax);
    meta{4}=num2str(ymax);
    meta{5}=num2str(width);
    meta{6}=num2str(height);
    meta{7}=num2str(depth);
    object=object_name;
    dir=annotation_dir;
    writexml(filename,meta,object,dir)
end
