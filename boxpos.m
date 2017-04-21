function [xmin,ymin,xmax,ymax,width,height,depth]=boxpos(img)
img = imread(img);
[height,width,depth]=size(img);
% map = gbvs(img); % map.master_map contains the actual saliency map 
map_itti = ittikochmap(img); % map_itti.master_map contains the actual saliency map 
% show_imgnmap( img , map ); 

try
    % map = gbvs(img); % map.master_map contains the actual saliency map 
    map_itti = ittikochmap(img); % map_itti.master_map contains the actual saliency map 
    % show_imgnmap( img , map )
    threshold=map_itti.master_map_resized;; 
catch err
     xmin=10;
     ymin=10;
     xmax=width-10;
     ymax=height-10;
     return
end


threshold=threshold>0.2;
stats = regionprops(threshold, 'basic');
[C,area_index]=max([stats.Area]);
pos=stats(area_index).BoundingBox;



xmin=round(pos(1));
ymin=round(pos(2));
xmax=round(pos(1)+pos(3));
ymax=round(pos(2)+pos(4));