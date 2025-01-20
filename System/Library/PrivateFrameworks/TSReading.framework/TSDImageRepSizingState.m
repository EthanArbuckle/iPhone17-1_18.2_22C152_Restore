@interface TSDImageRepSizingState
- (BOOL)sizedImageHasMask;
- (BOOL)sizedImageIncludesAdjustments;
- (BOOL)wideGamut;
- (CGImage)sizedImage;
- (CGPath)maskPath;
- (CGSize)desiredSize;
- (TSDImageProvider)provider;
- (TSDImageRepSizingState)initWithDesiredSize:(CGSize)a3 provider:(id)a4 maskPath:(CGPath *)a5 wideGamutCanvas:(BOOL)a6;
- (int)status;
- (int64_t)sizedImageOrientation;
- (void)dealloc;
- (void)generateSizedImage;
- (void)setDesiredSize:(CGSize)a3;
- (void)setProvider:(id)a3;
- (void)setSizedImage:(CGImage *)a3;
- (void)setSizedImageIncludesAdjustments:(BOOL)a3;
- (void)setSizedImageOrientation:(int64_t)a3;
- (void)setStatus:(int)a3;
@end

@implementation TSDImageRepSizingState

- (TSDImageRepSizingState)initWithDesiredSize:(CGSize)a3 provider:(id)a4 maskPath:(CGPath *)a5 wideGamutCanvas:(BOOL)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (!a4)
  {
    v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDImageRepSizingState initWithDesiredSize:provider:maskPath:wideGamutCanvas:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRepSizingState.m"), 23, @"invalid nil value for '%s'", "provider");
  }
  v17.receiver = self;
  v17.super_class = (Class)TSDImageRepSizingState;
  v14 = [(TSDImageRepSizingState *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->mDesiredSize.CGFloat width = width;
    v14->mDesiredSize.CGFloat height = height;
    v14->mProvider = (TSDImageProvider *)a4;
    v15->mStatus = 0;
    v15->mWideGamutCanvas = a6;
    if (a5) {
      v15->mMaskPath = CGPathRetain(a5);
    }
  }
  return v15;
}

- (void)dealloc
{
  CGImageRelease(self->mSizedImage);
  mMaskPath = self->mMaskPath;
  if (mMaskPath) {
    CGPathRelease(mMaskPath);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDImageRepSizingState;
  [(TSDImageRepSizingState *)&v4 dealloc];
}

- (void)setSizedImage:(CGImage *)a3
{
  mSizedImage = self->mSizedImage;
  if (mSizedImage != a3)
  {
    CGImageRelease(mSizedImage);
    self->mSizedImage = CGImageRetain(a3);
  }
}

- (BOOL)sizedImageHasMask
{
  return self->mMaskPath != 0;
}

- (void)generateSizedImage
{
  CGImageRelease(self->mSizedImage);
  self->mSizedImage = 0;
  if (!self->mStatus)
  {
    double width = self->mDesiredSize.width;
    double height = self->mDesiredSize.height;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (([(TSDImageProvider *)self->mProvider naturalSize], width == v6)
        ? (BOOL v7 = height == v5)
        : (BOOL v7 = 0),
          v7 && !self->mMaskPath))
    {
      self->mSizedImage = CGImageRetain((CGImageRef)[(TSDImageProvider *)self->mProvider CGImageForNaturalSize]);
      self->mSizedImageOrientation = [(TSDImageProvider *)self->mProvider orientation];
    }
    else
    {
      char v8 = 11;
      if (self->mWideGamutCanvas
        && ![(TSDImageProvider *)self->mProvider isError]
        && [(TSDImageProvider *)self->mProvider imageGamut] != 2)
      {
        char v8 = 43;
      }
      v9 = TSDBitmapContextCreate(v8, width);
      if (v9)
      {
        v10 = v9;
        CGContextSetInterpolationQuality(v9, kCGInterpolationHigh);
        double v11 = TSDRectWithSize();
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        mMaskPath = self->mMaskPath;
        if (mMaskPath)
        {
          CGContextAddPath(v10, mMaskPath);
          CGContextClip(v10);
        }
        -[TSDImageProvider drawImageInContext:rect:](self->mProvider, "drawImageInContext:rect:", v10, v11, v13, v15, v17);
        self->mSizedImage = CGBitmapContextCreateImage(v10);
        self->mSizedImageOrientation = 0;
        CGContextRelease(v10);
      }
    }
  }
}

- (BOOL)wideGamut
{
  return self->mWideGamutCanvas;
}

- (CGSize)desiredSize
{
  double width = self->mDesiredSize.width;
  double height = self->mDesiredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDesiredSize:(CGSize)a3
{
  self->mDesiredSize = a3;
}

- (TSDImageProvider)provider
{
  return self->mProvider;
}

- (void)setProvider:(id)a3
{
}

- (int)status
{
  return self->mStatus;
}

- (void)setStatus:(int)a3
{
  self->mStatus = a3;
}

- (CGImage)sizedImage
{
  return self->mSizedImage;
}

- (int64_t)sizedImageOrientation
{
  return self->mSizedImageOrientation;
}

- (void)setSizedImageOrientation:(int64_t)a3
{
  self->mSizedImageOrientation = a3;
}

- (CGPath)maskPath
{
  return self->mMaskPath;
}

- (BOOL)sizedImageIncludesAdjustments
{
  return self->mIncludesAdjustments;
}

- (void)setSizedImageIncludesAdjustments:(BOOL)a3
{
  self->mIncludesAdjustments = a3;
}

@end