@interface _NTKTransientPhoto
- (CGRect)originalCrop;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setOriginalCrop:(CGRect)a3;
@end

@implementation _NTKTransientPhoto

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CGRect)originalCrop
{
  double x = self->_originalCrop.origin.x;
  double y = self->_originalCrop.origin.y;
  double width = self->_originalCrop.size.width;
  double height = self->_originalCrop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalCrop:(CGRect)a3
{
  self->_originalCrop = a3;
}

- (void).cxx_destruct
{
}

@end