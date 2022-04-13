close all;
clear all;
clc;

% Define a starting folder.
start_path = 'train';
% Ask user to confirm or change.
topLevelFolder = start_path;
if topLevelFolder == 0
  return;
end
% Get list of all subfolders.
allSubFolders = genpath(topLevelFolder);
% Parse into a cell array.
remain = allSubFolders;
listOfFolderNames = {};
while true
  [singleSubFolder, remain] = strtok(remain, ';');%#ok (suppres m-lint warning)
  if isempty(singleSubFolder)
    break;
  end
  listOfFolderNames = [listOfFolderNames singleSubFolder];%#ok (suppres m-lint warning)
end
numberOfFolders = length(listOfFolderNames);
totalFileList={};%this will contain all file names of jpg files

% Process all image files in those folders.
for k = 28:73
  % Get this folder and print it out.
  thisFolder = listOfFolderNames{k};
  fprintf('Processing folder %s\n', thisFolder);
  
  % Get JPG files.
  filePattern = sprintf('%s/*.jpg', thisFolder);
  baseFileNames = dir(filePattern);
  numberOfImageFiles = length(baseFileNames);
  % Now we have a list of all files in this folder.
  number = 168-numberOfImageFiles;
  if numberOfImageFiles >= 1
    % Go through all those image files.
    for f = 1 : number
      fullFileName = fullfile(thisFolder, baseFileNames(f).name);
      image =imread(fullFileName);
      imR=image(:,:,1);
      imG=image(:,:,2);
      imB=image(:,:,3);
      img=cat(3,imR,imG,imB);

%       I2 = imresize(img,[224 224],'nearest');
      % imshow(img)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % (1)
%            I2 = imsharpen(img);
%            I2 = flipud(I2);
        % (2)
%           I2 = imreducehaze(img);
%           I2 = fliplr(I2);
        % (3) % first 50 images blue and augment. 
        % (4) Add noise to all and augment.
%           I2 = imnoise(img,'salt & pepper');
%           I2 = fliplr(I2);

%         rgbImage = img; % Sample image.
%         windowWidth = 5; % Whatever you want.  More blur for larger numbers.
%         kernel = ones(windowWidth) / windowWidth ^ 2;
%         blurredImage = imfilter(rgbImage, kernel); % Blur the image.
% % %         blurredImage = imresize(blurredImage,[224 224],'nearest');
%         I2 = fliplr(blurredImage);
%         figure,imshow(blurredImage); % Display it.
      
%        I2 = histeq(img);
%        I2 = flipud(I2);

        rect=[5 5 219 219];
        I2 = imcrop(img,rect);
        I2 = imresize(I2,[224 224],'nearest');
        I2 = flipud(I2);
       
       ImgStoreName = sprintf('%d.jpg',f+numberOfImageFiles);
       ImgStoreName_im = fullfile(thisFolder,ImgStoreName);
%      
       imwrite(I2,ImgStoreName_im);
%        delete(fullFileName)
%       imshow(I)

%             totalFileList{end+1}=fullFileName;%#ok (suppres m-lint warning)
      %fprintf('     Processing image file %s\n', fullFileName);
    end
  else
    %fprintf('     Folder %s has no image files in it.\n', thisFolder);
  end
end


% folder_read_from='Nadeem/';
% 
% till=2;
% for ff=1:1
%    ff
%     I =imread('78.jpg');
%     I = imresize(I,[512 512],'nearest');
%     
% %     flip=flipud(I)
% %     figure, imshow(flip)
% %     title('Horizental flip');
% %    set(gca,'Visible','on');
% 
% %    
% % %% Random rotation (-8 to 8)
% %    rotate = imrotate(I,-8,'nearest', 'crop');
% %    figure
% %    imshow(rotate);
% 
% %% Translation -30 to 30
% % 
% % J = imtranslate(I,[0, 10],'FillValues',0);
% % 
% % figure
% % imshow(I);
% % title('Original Image');
% % set(gca,'Visible','on');
% % 
% % 
% % figure
% % imshow(J);
% % title('Translated Image');
% % set(gca,'Visible','on');
% % 
% % %%
% rect=[10 -10 502 502];
% I2 = imcrop(I,rect);
% I2 = imresize(I2,[512 512],'nearest');
% % 
% % figure
% % imshow(I2);
% % % title('Translated Image');
% % % set(gca,'Visible','on');
% % 
% % 
% % %  I2 = imresize(I2,[150 150],'nearest');
% % 
% % tform = maketform('affine',[1 0 0; .5 1 0; 0 0 1]);
% % J = imtransform(I,tform);
% % figure
% % imshow(J);
% % title('sheared Image');
% % set(gca,'Visible','on'); 
% % %%
% % 
% % 
% % %    
% % %%    % Random rotation -8 to +8
% % %    J = imrotate(I,8,'nearest', 'crop');
% % %    K = imrotate(I,-8,'nearest', 'crop');
% % %    img=I;
% % 
% %    % check how to handle with black regions.
% % %     figure,imshow(J);
% % %% Random horizental translation
% %  rect=[-30 0 150 150];
% %  I2 = imcrop(I,rect);
% % %  I2 = imresize(I2,[150 150],'nearest');
% %  
% %  figure,imshow(I2);
% %  
% %  a = imtranslate(I,[-30, 0]);
% %    figure,
% %    imshow(a)
% 
%  
%   
% 
% StoreDrive1='F:\Data_augmentation_unit\Nadeem';
% ImgStoreName1 = sprintf('%d.png',ff+till);
% ImgStoreName_im = fullfile(StoreDrive1,ImgStoreName1);
% 
% imwrite(I2,ImgStoreName_im);
%       
% end