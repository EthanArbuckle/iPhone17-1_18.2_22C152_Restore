@interface _SMUStackedImageNamedLayerImage
- (BOOL)fixedFrame;
- (CGImage)image;
- (CGRect)frame;
- (NSString)name;
- (UIImage)imageObj;
- (double)opacity;
- (int)blendMode;
- (void)setBlendMode:(int)a3;
- (void)setFixedFrame:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(CGImage *)a3;
- (void)setImageObj:(id)a3;
- (void)setName:(id)a3;
- (void)setOpacity:(double)a3;
@end

@implementation _SMUStackedImageNamedLayerImage

- (CGImage)image
{
  return self->_image;
}

- (void)setImage:(CGImage *)a3
{
  self->_image = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacitdouble y = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (BOOL)fixedFrame
{
  return self->_fixedFrame;
}

- (void)setFixedFrame:(BOOL)a3
{
  self->_fixedFrame = a3;
}

- (UIImage)imageObj
{
  return self->_imageObj;
}

- (void)setImageObj:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageObj, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end