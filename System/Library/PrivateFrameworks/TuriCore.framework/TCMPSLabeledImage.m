@interface TCMPSLabeledImage
- (CGRect)bounds;
- (CIImage)image;
- (NSArray)annotations;
- (void)setAnnotations:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setImage:(id)a3;
@end

@implementation TCMPSLabeledImage

- (CIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end