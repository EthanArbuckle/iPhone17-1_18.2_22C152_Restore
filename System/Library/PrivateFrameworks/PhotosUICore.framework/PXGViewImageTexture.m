@interface PXGViewImageTexture
- (BOOL)isOpaque;
- (CGImage)imageRef;
- (CGSize)pixelSize;
- (PXGViewImageTexture)initWithImage:(CGImage *)a3 orientation:(unsigned int)a4 alpha:(float)a5;
- (id)copyWithOrientationTransform:(float)a3 alpha:;
- (int64_t)estimatedByteSize;
- (unsigned)orientation;
- (unsigned)presentationType;
- (void)dealloc;
@end

@implementation PXGViewImageTexture

- (unsigned)orientation
{
  return self->_orientation;
}

- (CGImage)imageRef
{
  return self->_imageRef;
}

- (id)copyWithOrientationTransform:(float)a3 alpha:
{
}

- (BOOL)isOpaque
{
  return self->_isContentOpaque && self->_alpha >= 1.0;
}

- (CGSize)pixelSize
{
  double Width = (double)CGImageGetWidth(self->_imageRef);
  double Height = (double)CGImageGetHeight(self->_imageRef);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (int64_t)estimatedByteSize
{
  [(PXGViewImageTexture *)self pixelSize];
  return (uint64_t)(v3 * v4 * (double)(CGImageGetBitsPerPixel(self->_imageRef) >> 3));
}

- (unsigned)presentationType
{
  return 1;
}

- (void)dealloc
{
  CGImageRelease(self->_imageRef);
  v3.receiver = self;
  v3.super_class = (Class)PXGViewImageTexture;
  [(PXGImageTexture *)&v3 dealloc];
}

- (PXGViewImageTexture)initWithImage:(CGImage *)a3 orientation:(unsigned int)a4 alpha:(float)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PXGViewImageTexture;
  v8 = [(PXGImageTexture *)&v10 init];
  if (v8)
  {
    v8->_imageRef = CGImageRetain(a3);
    v8->_orientation = a4;
    v8->_alpha = a5;
    PXGCGImageGetOpaque();
  }
  return 0;
}

@end