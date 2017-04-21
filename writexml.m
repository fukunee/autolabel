function writexml(filename,meta,object,dir)
% Sample:
% name='000001.jpg';
% meta={'1','1','20','31','640','480','3'};
% object='akita';   

filename = filename(1:6);

% create document
docNode = com.mathworks.xml.XMLUtils.createDocument('annotation');

% document element
docRootNode = docNode.getDocumentElement();

% folder
folderNode = docNode.createElement('folder');
folderNode.appendChild(docNode.createTextNode(sprintf('VOC2007')));
docRootNode.appendChild(folderNode);

% filename
filenameNode = docNode.createElement('filename');
filenameNode.appendChild(docNode.createTextNode(sprintf(filename)));
docRootNode.appendChild(filenameNode);

% source
sourceElement = docNode.createElement('source'); 
docRootNode.appendChild(sourceElement);

databaseNode = docNode.createElement('database');
databaseNode.appendChild(docNode.createTextNode('DRdevkit'));
sourceElement.appendChild(databaseNode);

% size
sizeElement = docNode.createElement('size'); 
docRootNode.appendChild(sizeElement);

widthNode = docNode.createElement('width');
widthNode.appendChild(docNode.createTextNode(meta{5}));
sizeElement.appendChild(widthNode);

heightNode = docNode.createElement('height');
heightNode.appendChild(docNode.createTextNode(meta{6}));
sizeElement.appendChild(heightNode);

depthNode = docNode.createElement('depth');
depthNode.appendChild(docNode.createTextNode(meta{7}));
sizeElement.appendChild(depthNode);

% segmented
segmentedNode = docNode.createElement('segmented');
segmentedNode.appendChild(docNode.createTextNode('0'));
docRootNode.appendChild(segmentedNode);

% object
objectElement = docNode.createElement('object'); 
docRootNode.appendChild(objectElement);

objectnameNode = docNode.createElement('name');
objectnameNode.appendChild(docNode.createTextNode(object));
objectElement.appendChild(objectnameNode);

poseNode = docNode.createElement('pose');
poseNode.appendChild(docNode.createTextNode('Unspecified'));
objectElement.appendChild(poseNode);

truncatedNode = docNode.createElement('truncated');
truncatedNode.appendChild(docNode.createTextNode('0'));
objectElement.appendChild(truncatedNode);

difficultNode = docNode.createElement('difficult');
difficultNode.appendChild(docNode.createTextNode('0'));
objectElement.appendChild(difficultNode);

bndboxElement = docNode.createElement('bndbox'); 
objectElement.appendChild(bndboxElement);

xminNode = docNode.createElement('xmin');
xminNode.appendChild(docNode.createTextNode(meta{1}));
bndboxElement.appendChild(xminNode);

yminNode = docNode.createElement('ymin');
yminNode.appendChild(docNode.createTextNode(meta{2}));
bndboxElement.appendChild(yminNode);

xmaxNode = docNode.createElement('xmax');
xmaxNode.appendChild(docNode.createTextNode(meta{3}));
bndboxElement.appendChild(xmaxNode);

ymaxNode = docNode.createElement('ymax');
ymaxNode.appendChild(docNode.createTextNode(meta{4}));
bndboxElement.appendChild(ymaxNode);

% xmlwrite
xmlFileName = [dir,filename,'.xml'];
xmlwrite(xmlFileName,docNode);
