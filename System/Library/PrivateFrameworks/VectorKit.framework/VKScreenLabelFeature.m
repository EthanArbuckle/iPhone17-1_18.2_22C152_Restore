@interface VKScreenLabelFeature
- (CGImage)image;
- (CGPoint)position;
- (VKScreenLabelFeature)initWithCGImage:(CGImage *)a3 scale:(double)a4 type:(unsigned int)a5;
- (double)scale;
- (unsigned)type;
- (void)dealloc;
- (void)setPosition:(CGPoint)a3;
@end

@implementation VKScreenLabelFeature

- (double)scale
{
  return self->_scale;
}

- (CGImage)image
{
  return self->_image;
}

- (void)setPosition:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_position, &v3, 16, 1, 0);
}

- (CGPoint)position
{
  objc_copyStruct(v4, &self->_position, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (unsigned)type
{
  return self->_type;
}

- (void)dealloc
{
  image = self->_image;
  if (image) {
    CGImageRelease(image);
  }
  v4.receiver = self;
  v4.super_class = (Class)VKScreenLabelFeature;
  [(VKScreenLabelFeature *)&v4 dealloc];
}

- (VKScreenLabelFeature)initWithCGImage:(CGImage *)a3 scale:(double)a4 type:(unsigned int)a5
{
  v11.receiver = self;
  v11.super_class = (Class)VKScreenLabelFeature;
  v8 = [(VKScreenLabelFeature *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a5;
    v8->_image = CGImageRetain(a3);
    v9->_scale = a4;
  }
  return v9;
}

@end