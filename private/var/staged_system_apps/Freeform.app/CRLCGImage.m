@interface CRLCGImage
- (CGImage)CGImage;
- (CGImage)CGImageForSize:(CGSize)a3;
- (CGSize)size;
- (CRLCGImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)imageOrientation;
- (void)dealloc;
@end

@implementation CRLCGImage

- (CRLCGImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CRLCGImage;
  v8 = [(CRLImage *)&v10 init];
  if (v8)
  {
    v8->mCGImage = CGImageRetain(a3);
    v8->mOrientation = a5;
    v8->mScale = a4;
    if (!v8->mCGImage)
    {

      return 0;
    }
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  mCGImage = self->mCGImage;
  double mScale = self->mScale;
  int64_t mOrientation = self->mOrientation;

  return [v4 initWithCGImage:mCGImage scale:mOrientation orientation:mScale];
}

- (CGImage)CGImage
{
  CGImageRef v2 = CGImageRetain(self->mCGImage);

  return (CGImage *)CFAutorelease(v2);
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  CGImageRef v3 = CGImageRetain(self->mCGImage);

  return (CGImage *)CFAutorelease(v3);
}

- (CGSize)size
{
  [(CRLCGImage *)self scale];
  double v4 = v3;
  double Width = (double)CGImageGetWidth(self->mCGImage);
  size_t Height = CGImageGetHeight(self->mCGImage);
  double v7 = (double)Height;
  int64_t mOrientation = self->mOrientation;
  if ((mOrientation & 2) != 0) {
    double v9 = (double)Height;
  }
  else {
    double v9 = Width;
  }
  if ((mOrientation & 2) != 0) {
    double v7 = Width;
  }
  double v10 = v7 / v4;
  double v11 = v9 / v4;
  result.height = v10;
  result.width = v11;
  return result;
}

- (double)scale
{
  double result = self->mScale;
  if (result == 0.0) {
    return 1.0;
  }
  return result;
}

- (int64_t)imageOrientation
{
  return self->mOrientation;
}

- (void)dealloc
{
  CGImageRelease(self->mCGImage);
  v3.receiver = self;
  v3.super_class = (Class)CRLCGImage;
  [(CRLImage *)&v3 dealloc];
}

@end