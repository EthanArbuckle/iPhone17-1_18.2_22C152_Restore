@interface UIMorphingLabelImage
- (CGRect)contentsRect;
- (CGSize)size;
- (UIImage)image;
- (void)setContentsRect:(CGRect)a3;
- (void)setImage:(id)a3;
@end

@implementation UIMorphingLabelImage

- (CGSize)size
{
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  self->_contentsRect = a3;
}

- (void).cxx_destruct
{
}

@end