@interface PXCGImage
- (BOOL)isEqual:(id)a3;
- (CGImage)image;
- (PXCGImage)init;
- (PXCGImage)initWithCGImage:(CGImage *)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation PXCGImage

- (CGImage)image
{
  return self->_image;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXCGImage *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(PXCGImage *)v4 image];
      BOOL v6 = v5 == [(PXCGImage *)self image];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(PXCGImage *)self image];
  return CFHash(v2);
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)PXCGImage;
  [(PXCGImage *)&v3 dealloc];
}

- (PXCGImage)initWithCGImage:(CGImage *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXCGImage;
  v4 = [(PXCGImage *)&v6 init];
  if (v4) {
    v4->_image = CGImageRetain(a3);
  }
  return v4;
}

- (PXCGImage)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCGImage.m", 16, @"%s is not available as initializer", "-[PXCGImage init]");

  abort();
}

@end