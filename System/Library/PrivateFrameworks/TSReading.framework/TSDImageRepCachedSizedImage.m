@interface TSDImageRepCachedSizedImage
- (BOOL)imageHasAdjustmentsBakedImage;
- (BOOL)imageHasMaskBakedIn;
- (CGImage)imageRef;
- (CGPath)imageMaskPath;
- (CGSize)imageSize;
- (int64_t)imageOrientation;
- (void)dealloc;
- (void)setImageHasAdjustmentsBakedImage:(BOOL)a3;
- (void)setImageHasMaskBakedIn:(BOOL)a3;
- (void)setImageMaskPath:(CGPath *)a3;
- (void)setImageOrientation:(int64_t)a3;
- (void)setImageRef:(CGImage *)a3;
- (void)setImageSize:(CGSize)a3;
@end

@implementation TSDImageRepCachedSizedImage

- (void)dealloc
{
  CGImageRelease(self->mImageRef);
  CGPathRelease(self->mImageMaskPath);
  v3.receiver = self;
  v3.super_class = (Class)TSDImageRepCachedSizedImage;
  [(TSDImageRepCachedSizedImage *)&v3 dealloc];
}

- (CGImage)imageRef
{
  return self->mImageRef;
}

- (void)setImageRef:(CGImage *)a3
{
  mImageRef = self->mImageRef;
  if (mImageRef != a3)
  {
    if (mImageRef)
    {
      CFRelease(mImageRef);
      self->mImageRef = 0;
    }
    self->mImageRef = CGImageRetain(a3);
  }
}

- (CGPath)imageMaskPath
{
  return self->mImageMaskPath;
}

- (void)setImageMaskPath:(CGPath *)a3
{
  mImageMaskPath = self->mImageMaskPath;
  if (mImageMaskPath != a3)
  {
    if (mImageMaskPath)
    {
      CFRelease(mImageMaskPath);
      self->mImageMaskPath = 0;
    }
    self->mImageMaskPath = CGPathRetain(a3);
  }
}

- (CGSize)imageSize
{
  double width = self->mImageSize.width;
  double height = self->mImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->mImageSize = a3;
}

- (int64_t)imageOrientation
{
  return self->mImageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->mImageOrientation = a3;
}

- (BOOL)imageHasMaskBakedIn
{
  return self->mImageHasMaskBakedIn;
}

- (void)setImageHasMaskBakedIn:(BOOL)a3
{
  self->mImageHasMaskBakedIn = a3;
}

- (BOOL)imageHasAdjustmentsBakedImage
{
  return self->mImageHasAdjustmentsBakedImage;
}

- (void)setImageHasAdjustmentsBakedImage:(BOOL)a3
{
  self->mImageHasAdjustmentsBakedImage = a3;
}

@end