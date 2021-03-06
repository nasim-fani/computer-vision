function img = pepperOrSalt(varargin)
if length(varargin) == 1
img = varargin{1};
ND = 0.2;
type_noise = 3;

class_img = class(img);
min_val = 0;
if(isa(class_img ,'uint8'))
max_val = 255;
else
max_val = 255;
end
elseif length(varargin) < 3
img = varargin{1};
ND = varargin{2};
type_noise = 3;
class_img = class(img);
min_val = 0;
if(isa(class_img ,'uint8'))
max_val = 255;
else
max_val = 1;
end
elseif length(varargin) == 3
img = varargin{1};
ND = varargin{2};
type_noise = varargin{3};

class_img = class(img);
min_val = 0;
if(isa(class_img ,'uint8'))
max_val = 255;
else
max_val = 1;
end
elseif length(varargin) == 4
img = varargin{1};
ND = varargin{2};
type_noise = varargin{3};
min_val = varargin{4};
class_img = class(img);
if(isa(class_img ,'uint8'))
max_val = 255;
else
max_val = 1;
end
max_val = max(img(:));
elseif length(varargin) >= 5
img = varargin{1};
ND = varargin{2};
type_noise = varargin{3};
min_val = varargin{4};
max_val = varargin{5};
else
disp('not enough input parameter');
img = 0;
return;
end
Narr = rand(size(img));
if type_noise == 1

img(Narr<ND) = min_val;

elseif type_noise == 2

img(Narr<ND) = max_val;

else

img(Narr<ND/2) = min_val;
img((Narr>=ND/2)&(Narr<ND)) = max_val;

end