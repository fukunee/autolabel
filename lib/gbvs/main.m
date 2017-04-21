img = imread('000021.jpg');
map = gbvs(img); % map.master_map contains the actual saliency map 
map_itti = ittikochmap(img); % map_itti.master_map contains the actual saliency map 
show_imgnmap( img , map ); 
threshold=map.master_map_resized;
threshold=threshold>0.2;

stats = regionprops(threshold, 'basic');
[C,area_index]=max([stats.Area]);
rectangle('Position',[stats(area_index).BoundingBox],'LineWidth',2,'LineStyle','--','EdgeColor','r'),
pos=stats(area_index).BoundingBox;