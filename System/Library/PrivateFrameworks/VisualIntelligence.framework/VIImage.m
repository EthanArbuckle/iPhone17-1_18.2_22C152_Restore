@interface VIImage
+ (VIImage)imageWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoaded;
- (CGSize)imageSize;
- (VIImage)initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4;
- (__CVBuffer)pixelBuffer;
- (unint64_t)hash;
- (unsigned)orientation;
- (void)dealloc;
@end

@implementation VIImage

- (VIImage)initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VIImage;
  v6 = [(VIImage *)&v8 init];
  if (v6)
  {
    v6->_pixelBuffer = CVPixelBufferRetain(a3);
    v6->_orientation = a4;
  }
  return v6;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)VIImage;
  [(VIImage *)&v3 dealloc];
}

+ (VIImage)imageWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPixelBuffer:a3 orientation:*(void *)&a4];
  return (VIImage *)v4;
}

- (CGSize)imageSize
{
  double Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
  double Height = (double)CVPixelBufferGetHeight(self->_pixelBuffer);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)isLoaded
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIImage *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
    v6 = v5;
    BOOL v7 = [(VIImage *)v6 pixelBuffer] == self->_pixelBuffer
      && [(VIImage *)v6 orientation] == self->_orientation;
  }
  return v7;
}

- (unint64_t)hash
{
  return (2654435761 * self->_orientation) ^ CFHash(self->_pixelBuffer);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (unsigned)orientation
{
  return self->_orientation;
}

@end