@interface BICImage
+ (id)imageWithCGImage:(CGImage *)a3;
- (CGImage)CGImage;
- (void)dealloc;
- (void)setCGImage:(CGImage *)a3;
@end

@implementation BICImage

+ (id)imageWithCGImage:(CGImage *)a3
{
  v4 = objc_alloc_init(BICImage);
  [(BICImage *)v4 setCGImage:a3];

  return v4;
}

- (void)dealloc
{
  CGImageRelease(self->_CGImage);
  v3.receiver = self;
  v3.super_class = (Class)BICImage;
  [(BICImage *)&v3 dealloc];
}

- (void)setCGImage:(CGImage *)a3
{
  self->_CGImage = CGImageRetain(a3);
}

- (CGImage)CGImage
{
  result = self->_CGImage;
  if (result)
  {
    CGImageRef v3 = CGImageRetain(result);
    return (CGImage *)CFAutorelease(v3);
  }
  return result;
}

@end