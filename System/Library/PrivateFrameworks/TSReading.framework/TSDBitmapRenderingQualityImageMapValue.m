@interface TSDBitmapRenderingQualityImageMapValue
- (CGImage)degradedImageRefForForProvider:(id)a3 quality:(int)a4 canvasScale:(float)a5;
- (void)addSize:(CGSize)a3;
- (void)dealloc;
@end

@implementation TSDBitmapRenderingQualityImageMapValue

- (void)dealloc
{
  CGImageRelease(self->mDegradedImageRef);
  v3.receiver = self;
  v3.super_class = (Class)TSDBitmapRenderingQualityImageMapValue;
  [(TSDBitmapRenderingQualityImageMapValue *)&v3 dealloc];
}

- (void)addSize:(CGSize)a3
{
  double v4 = TSDCeilSize(a3.width);
  double width = self->mMaxSize.width;
  double height = self->mMaxSize.height;
  if (v4 > width || v5 > height)
  {
    if (width > v4) {
      double v4 = self->mMaxSize.width;
    }
    if (height > v5) {
      double v5 = self->mMaxSize.height;
    }
    self->mMaxSize.double width = v4;
    self->mMaxSize.double height = v5;
    mDegradedImageRef = self->mDegradedImageRef;
    if (mDegradedImageRef)
    {
      CGImageRelease(mDegradedImageRef);
      self->mDegradedImageRef = 0;
    }
  }
}

- (CGImage)degradedImageRefForForProvider:(id)a3 quality:(int)a4 canvasScale:(float)a5
{
  result = self->mDegradedImageRef;
  if (!result)
  {
    if (a4 == 2)
    {
      v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSDBitmapRenderingQualityImageMapValue degradedImageRefForForProvider:quality:canvasScale:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapRenderingQualityInfo.m"), 116, @"Shouldn't be called for high DPI");
    }
    BOOL v12 = a4 == 1;
    BOOL v13 = a4 != 1;
    float v14 = 2.0833;
    if (!v12) {
      float v14 = 1.0;
    }
    double v15 = TSDMultiplySizeScalar(self->mMaxSize.width, self->mMaxSize.height, (float)(v14 * a5));
    v16 = (CGImage *)[a3 CGImageForSize:v13 lowQuality:TSDCeilSize(v15)];
    self->mDegradedImageRef = v16;
    CGImageRetain(v16);
    return self->mDegradedImageRef;
  }
  return result;
}

@end