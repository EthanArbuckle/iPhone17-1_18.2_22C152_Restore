@interface TSDBitmapImageProvider
+ (CGImage)CGImageForImageData:(id)a3;
+ (CGImage)temporaryCGImageForImageData:(id)a3;
+ (CGImageSource)p_newImageSourceFromCacheForData:(id)a3 withFilenameSuffix:(id)a4;
+ (CGImageSource)p_newImageSourceFromFilePath:(id)a3;
+ (CGImageSource)temporaryCGImageSourceForImageData:(id)a3;
+ (CGSize)naturalSizeForImageData:(id)a3;
+ (id)TSUImageForImageData:(id)a3;
+ (id)p_cacheStringForData:(id)a3;
+ (void)clearCacheForData:(id)a3;
- (BOOL)hasFlushableContent;
- (BOOL)isOpaque;
- (BOOL)isValid;
- (CGImage)CGImageForNaturalSize;
- (CGImage)CGImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orLayer:(id)a5;
- (CGImage)CGImageForSize:(CGSize)a3 lowQuality:(BOOL)a4;
- (CGImage)p_loadOrCreateResampledImageWithScale:(unint64_t)a3 andCGImage:(CGImage *)a4;
- (CGImage)p_newImageFromSource:(CGImageSource *)a3;
- (CGImage)p_resampledImageOfSizeType:(int)a3;
- (CGImageSource)CGImageSource;
- (CGImageSource)p_newCGImageSource;
- (CGImageSource)p_newCGImageSourceForTemporaryUse;
- (CGImageSource)p_newImageOfSize:(CGSize)a3 andWriteToCacheWithSuffix:(id)a4;
- (CGSize)dpiAdjustedFillSize;
- (CGSize)dpiAdjustedNaturalSize;
- (CGSize)naturalSize;
- (int64_t)orientation;
- (unint64_t)imageDPI;
- (unint64_t)imageGamut;
- (void)dealloc;
- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4;
- (void)flush;
- (void)i_commonInit;
- (void)p_configureOrientationAndSizeFromImageSource:(CGImageSource *)a3 andImage:(CGImage *)a4;
- (void)p_loadFullSizedImageIfNecessary;
- (void)p_loadSourceRefIfNecessary;
@end

@implementation TSDBitmapImageProvider

+ (CGImage)CGImageForImageData:(id)a3
{
  objc_opt_class();
  objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", a3, 1);
  v4 = (void *)TSUDynamicCast();

  return (CGImage *)[v4 CGImageForNaturalSize];
}

+ (CGImage)temporaryCGImageForImageData:(id)a3
{
  CFStringRef v4 = (const __CFString *)[a3 type];
  if (UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x263F01A68])) {
    v5 = [(TSDImageProvider *)[TSDBitmapImageProvider alloc] initWithImageData:a3];
  }
  else {
    v5 = 0;
  }

  return [(TSDBitmapImageProvider *)v5 CGImageForNaturalSize];
}

+ (CGImageSource)temporaryCGImageSourceForImageData:(id)a3
{
  CFStringRef v4 = (const __CFString *)[a3 type];
  if (UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x263F01A68])) {
    v5 = [(TSDImageProvider *)[TSDBitmapImageProvider alloc] initWithImageData:a3];
  }
  else {
    v5 = 0;
  }

  return [(TSDBitmapImageProvider *)v5 CGImageSource];
}

+ (id)TSUImageForImageData:(id)a3
{
  id result = (id)[a1 CGImageForImageData:a3];
  if (result)
  {
    id v4 = result;
    v5 = (void *)MEMORY[0x263F7C858];
    return (id)[v5 imageWithCGImage:v4];
  }
  return result;
}

+ (CGSize)naturalSizeForImageData:(id)a3
{
  objc_opt_class();
  objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", a3, 1);
  id v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    [v4 naturalSize];
  }
  else
  {
    double v5 = *MEMORY[0x263F001B0];
    double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)i_commonInit
{
  v5.receiver = self;
  v5.super_class = (Class)TSDBitmapImageProvider;
  [(TSDImageProvider *)&v5 i_commonInit];
  if (self->mImageLock)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDBitmapImageProvider i_commonInit]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapImageProvider.m"), 181, @"called i_common init twice on same object!");
  }
  self->mImageLock = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  __dmb(0xBu);
}

- (void)dealloc
{
  CGImageRelease(self->mImage);
  mImageSource = self->mImageSource;
  if (mImageSource) {
    CFRelease(mImageSource);
  }
  CGImageRelease(self->mHalfSizeImage);
  CGImageRelease(self->mQuarterSizeImage);
  mImageLock = self->mImageLock;
  if (mImageLock) {
    dispatch_release(mImageLock);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDBitmapImageProvider;
  [(TSDImageProvider *)&v5 dealloc];
}

- (CGSize)naturalSize
{
  [(TSDBitmapImageProvider *)self p_loadImageMetadata];
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isValid
{
  [(TSDBitmapImageProvider *)self p_loadSourceRefIfNecessary];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__TSDBitmapImageProvider_isValid__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  if (self->mCheckIfValidToken != -1) {
    dispatch_once(&self->mCheckIfValidToken, block);
  }
  return self->mIsValid;
}

void __33__TSDBitmapImageProvider_isValid__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 56) || *(void *)(v2 + 128) || *(void *)(v2 + 136))
  {
    *(unsigned char *)(v2 + 97) = 1;
  }
  else
  {
    v3 = (CGImage *)objc_msgSend((id)v2, "p_newImageFromSource:", *(void *)(v2 + 48));
    *(unsigned char *)(*(void *)(a1 + 32) + 97) = v3 != 0;
    CGImageRelease(v3);
  }
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (![(TSDBitmapImageProvider *)self isValid])
  {
    v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDBitmapImageProvider drawImageInContext:rect:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapImageProvider.m"), 234, @"shouldn't be drawing an invalid image provider");
  }
  v12 = -[TSDBitmapImageProvider CGImageForSize:inContext:orLayer:](self, "CGImageForSize:inContext:orLayer:", a3, 0, width, height);
  if (v12)
  {
    v13 = v12;
    CGContextSaveGState(a3);
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    double MinY = CGRectGetMinY(v17);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    CGFloat MaxY = CGRectGetMaxY(v18);
    CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
    CGContextScaleCTM(a3, 1.0, -1.0);
    [(TSDBitmapImageProvider *)self orientation];
    TSUImageOrientationTransform();
    CGContextConcatCTM(a3, &v16);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    CGContextDrawImage(a3, v19, v13);
    CGContextRestoreGState(a3);
  }
}

- (CGImage)CGImageForNaturalSize
{
  return self->mImage;
}

- (CGImage)CGImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orLayer:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  [(TSDBitmapImageProvider *)self p_loadImageMetadata];
  BitmapQualityInfo = (void *)TSDCGContextGetBitmapQualityInfo((uint64_t)a4);
  if (a4)
  {
    if (a5)
    {
      uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSDBitmapImageProvider CGImageForSize:inContext:orLayer:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapImageProvider.m"), 288, @"using context to determine requested image size. layer should be nil");
    }
    if ((TSDCGContextIsPrintContext((uint64_t)a4) & 1) != 0 || TSDCGContextIsPDFContext((uint64_t)a4))
    {
      [(TSDBitmapImageProvider *)self p_loadFullSizedImageIfNecessary];
      if (!BitmapQualityInfo) {
        return self->mImage;
      }
    }
    double v13 = TSDCGContextAssociatedScreenScale((uint64_t)a4);
    double v14 = TSDMultiplySizeScalar(width, height, v13);
    double v16 = v15;
    CGContextGetCTM(&v34, a4);
    double v17 = TSDTransformScale(&v34.a);
    double v18 = v14;
    double v19 = v16;
  }
  else
  {
    if (!a5) {
      goto LABEL_11;
    }
    [a5 contentsScale];
    double v17 = v20;
    double v18 = width;
    double v19 = height;
  }
  double width = TSDMultiplySizeScalar(v18, v19, v17);
  double height = v21;
LABEL_11:
  if (BitmapQualityInfo) {
    return (CGImage *)objc_msgSend(BitmapQualityInfo, "degradedImageRefForProvider:ofSize:", self, width, height);
  }
  [(TSDBitmapImageProvider *)self naturalSize];
  double v24 = v23;
  double v26 = v25;
  double v27 = TSDMultiplySizeScalar(v23, v25, 0.25);
  double v29 = v28;
  double v30 = TSDMultiplySizeScalar(v24, v26, 0.5);
  if (width > v27 || v29 < 1.0 || height > v29 || v27 < 1.0)
  {
    if (width <= v30 && v31 >= 1.0 && height <= v31 && v30 >= 1.0)
    {
      v32 = self;
      uint64_t v33 = 1;
      return -[TSDBitmapImageProvider p_resampledImageOfSizeType:](v32, "p_resampledImageOfSizeType:", v33, v30);
    }
    [(TSDBitmapImageProvider *)self p_loadFullSizedImageIfNecessary];
    return self->mImage;
  }
  v32 = self;
  uint64_t v33 = 2;
  return -[TSDBitmapImageProvider p_resampledImageOfSizeType:](v32, "p_resampledImageOfSizeType:", v33, v30);
}

- (CGImage)CGImageForSize:(CGSize)a3 lowQuality:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  [(TSDBitmapImageProvider *)self naturalSize];
  double v10 = v9;
  if (width < v8)
  {
LABEL_5:
    float v11 = width;
    double v12 = ceilf(v11);
    if (height >= v10) {
      double v13 = v10;
    }
    else {
      double v13 = height;
    }
    float v14 = v13;
    double v15 = ceilf(v14);
    id v16 = [(TSDImageProvider *)self imageData];
    id v17 = TSDResampledImageFromProvider(self, 0, objc_msgSend((id)objc_msgSend(v16, "filename"), "lastPathComponent"), objc_msgSend(v16, "context"), v4 | 0x14, v12, v15);
    if (v17) {
      id v18 = v17;
    }
    else {
      id v18 = v16;
    }
    return +[TSDBitmapImageProvider CGImageForImageData:v18];
  }
  if (height < v9)
  {
    double width = v8;
    goto LABEL_5;
  }
  double width = v8;
  if ([(TSDBitmapImageProvider *)self isOpaque]) {
    goto LABEL_5;
  }

  return [(TSDBitmapImageProvider *)self CGImageForNaturalSize];
}

- (CGImage)p_loadOrCreateResampledImageWithScale:(unint64_t)a3 andCGImage:(CGImage *)a4
{
  v19[3] = *MEMORY[0x263EF8340];
  [(TSDBitmapImageProvider *)self naturalSize];
  double v9 = TSDMultiplySizeScalar(v7, v8, (double)a3 / 100.0);
  if (v9 <= v10) {
    double v9 = v10;
  }
  float v11 = v9;
  uint64_t v12 = *MEMORY[0x263F0F5B8];
  v18[0] = *MEMORY[0x263F0F5A8];
  v18[1] = v12;
  v19[0] = MEMORY[0x263EFFA88];
  v19[1] = MEMORY[0x263EFFA80];
  v18[2] = *MEMORY[0x263F0F638];
  v19[2] = [NSNumber numberWithUnsignedInteger:vcvtps_u32_f32(v11)];
  CFDictionaryRef v13 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  float v14 = [(TSDBitmapImageProvider *)self p_newCGImageSourceForTemporaryUse];
  if (v14)
  {
    double v15 = v14;
    ThumbnailAtIndeCGFloat x = CGImageSourceCreateThumbnailAtIndex(v14, 0, v13);
    CFRelease(v15);
  }
  else
  {
    ThumbnailAtIndeCGFloat x = 0;
  }
  *a4 = ThumbnailAtIndex;
  return ThumbnailAtIndex;
}

- (CGImage)p_resampledImageOfSizeType:(int)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mImageLock, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 != 2)
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->mImageLock);
LABEL_13:
        double v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v9 = [NSString stringWithUTF8String:"-[TSDBitmapImageProvider p_resampledImageOfSizeType:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapImageProvider.m"), 466, @"Couldn't resample image for faster rendering");
        return self->mImage;
      }
      mQuarterSizeImage = self->mQuarterSizeImage;
      if (!mQuarterSizeImage)
      {
        double v6 = self;
        uint64_t v7 = 25;
        goto LABEL_12;
      }
LABEL_9:
      dispatch_semaphore_signal((dispatch_semaphore_t)self->mImageLock);
      return mQuarterSizeImage;
    }
    mQuarterSizeImage = self->mHalfSizeImage;
    if (mQuarterSizeImage) {
      goto LABEL_9;
    }
    double v6 = self;
    uint64_t v7 = 50;
  }
  else
  {
    mQuarterSizeImage = self->mImage;
    if (mQuarterSizeImage) {
      goto LABEL_9;
    }
    double v6 = self;
    uint64_t v7 = 100;
  }
LABEL_12:
  mQuarterSizeImage = -[TSDBitmapImageProvider p_loadOrCreateResampledImageWithScale:andCGImage:](v6, "p_loadOrCreateResampledImageWithScale:andCGImage:", v7);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mImageLock);
  if (!mQuarterSizeImage) {
    goto LABEL_13;
  }
  return mQuarterSizeImage;
}

- (int64_t)orientation
{
  return self->mOrientation;
}

- (BOOL)isOpaque
{
  return self->mIsOpaque;
}

- (unint64_t)imageGamut
{
  [(TSDBitmapImageProvider *)self p_loadImageMetadata];
  unint64_t result = self->mImageGamut;
  if (!result)
  {
    [(TSDBitmapImageProvider *)self p_loadFullSizedImageIfNecessary];
    unint64_t result = (unint64_t)self->mImage;
    if (result)
    {
      ColorSpace = CGImageGetColorSpace((CGImageRef)result);
      if (CGColorSpaceIsWideGamutRGB(ColorSpace)) {
        unint64_t result = 1;
      }
      else {
        unint64_t result = 2;
      }
      self->mImageGamut = result;
    }
  }
  return result;
}

- (unint64_t)imageDPI
{
  unint64_t result = self->mDPI;
  if (!result)
  {
    BOOL v4 = [(TSDBitmapImageProvider *)self p_newCGImageSourceForTemporaryUse];
    if (v4)
    {
      objc_super v5 = v4;
      CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(v4, 0, 0);
      CFRelease(v5);
      unint64_t v7 = objc_msgSend((id)-[__CFDictionary objectForKey:](v6, "objectForKey:", *MEMORY[0x263F0F198]), "unsignedIntegerValue");
      if (v6) {
        CFRelease(v6);
      }
      if (v7) {
        unint64_t result = v7;
      }
      else {
        unint64_t result = 72;
      }
      self->mDPI = result;
    }
    else
    {
      return self->mDPI;
    }
  }
  return result;
}

- (CGSize)dpiAdjustedFillSize
{
  unint64_t v3 = [(TSDBitmapImageProvider *)self imageDPI];
  [(TSDBitmapImageProvider *)self naturalSize];
  if (v3 >= 0x49)
  {
    double v6 = TSDMultiplySizeScalar(v4, v5, 72.0 / (double)v3);
    double v4 = TSDCeilSize(v6);
  }
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)dpiAdjustedNaturalSize
{
  unint64_t v3 = [(TSDBitmapImageProvider *)self imageDPI];
  double v4 = 1.0;
  if (v3 >= 0x79) {
    double v4 = 72.0 / (double)v3;
  }
  if (objc_msgSend((id)objc_msgSend(-[TSDImageProvider imageData](self, "imageData"), "filename"), "tsu_containsSubstring:", @"@2x"))double v4 = 0.5; {
  [(TSDBitmapImageProvider *)self naturalSize];
  }
  if (v4 != 1.0 && fabs(v4 + -1.0) >= 0.000000999999997)
  {
    double v7 = TSDMultiplySizeScalar(v5, v6, v4);
    double v5 = TSDCeilSize(v7);
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (BOOL)hasFlushableContent
{
  return self->mImage || self->mImageSource || self->mHalfSizeImage || self->mQuarterSizeImage != 0;
}

- (void)flush
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mImageLock, 0xFFFFFFFFFFFFFFFFLL);
  mImage = self->mImage;
  if (mImage)
  {
    CGImageRelease(mImage);
    self->mImage = 0;
  }
  mImageSource = self->mImageSource;
  if (mImageSource)
  {
    CFRelease(mImageSource);
    self->mImageSource = 0;
  }
  if (self->super.mLoadState == 1) {
    self->super.mLoadState = 0;
  }
  mHalfSizeImage = self->mHalfSizeImage;
  if (mHalfSizeImage)
  {
    CGImageRelease(mHalfSizeImage);
    self->mHalfSizeImage = 0;
  }
  mQuarterSizeImage = self->mQuarterSizeImage;
  if (mQuarterSizeImage)
  {
    CGImageRelease(mQuarterSizeImage);
    self->mQuarterSizeImage = 0;
  }
  mImageLock = self->mImageLock;

  dispatch_semaphore_signal(mImageLock);
}

- (void)p_loadFullSizedImageIfNecessary
{
  if (self->mImage || self->super.mLoadState == 2) {
    return;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mImageLock, 0xFFFFFFFFFFFFFFFFLL);
  if (!self->mImage && self->super.mLoadState != 2)
  {
    mImageSource = self->mImageSource;
    if (mImageSource)
    {
      CFRetain(self->mImageSource);
    }
    else
    {
      mImageSource = [(TSDBitmapImageProvider *)self p_newCGImageSource];
      if (!mImageSource)
      {
        double v4 = 0;
LABEL_12:
        self->mImage = v4;
        if (v4) {
          int v5 = 1;
        }
        else {
          int v5 = 2;
        }
        self->super.mLoadState = v5;
        goto LABEL_16;
      }
    }
    double v4 = [(TSDBitmapImageProvider *)self p_newImageFromSource:mImageSource];
    if (v4) {
      [(TSDBitmapImageProvider *)self p_configureOrientationAndSizeFromImageSource:mImageSource andImage:v4];
    }
    CFRelease(mImageSource);
    goto LABEL_12;
  }
LABEL_16:
  mImageLock = self->mImageLock;

  dispatch_semaphore_signal(mImageLock);
}

- (void)p_loadSourceRefIfNecessary
{
  if (!self->mImageSource && self->super.mLoadState != 2)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->mImageLock, 0xFFFFFFFFFFFFFFFFLL);
    if (!self->mImageSource && self->super.mLoadState != 2)
    {
      unint64_t v3 = [(TSDBitmapImageProvider *)self p_newCGImageSource];
      if (v3)
      {
        [(TSDBitmapImageProvider *)self p_configureOrientationAndSizeFromImageSource:v3 andImage:0];
        int v4 = 1;
      }
      else
      {
        int v4 = 2;
      }
      self->mImageSource = v3;
      self->super.mLoadState = v4;
    }
    mImageLock = self->mImageLock;
    dispatch_semaphore_signal(mImageLock);
  }
}

- (CGImageSource)p_newCGImageSource
{
  id v2 = [(TSDImageProvider *)self imageData];

  return (CGImageSource *)[v2 newCGImageSource];
}

- (CGImage)p_newImageFromSource:(CGImageSource *)a3
{
  if (!a3) {
    return 0;
  }
  int v4 = NSDictionary;
  uint64_t v5 = [NSNumber numberWithBool:0];
  CFDictionaryRef v6 = (const __CFDictionary *)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, *MEMORY[0x263F0F600], 0);

  return CGImageSourceCreateImageAtIndex(a3, 0, v6);
}

- (void)p_configureOrientationAndSizeFromImageSource:(CGImageSource *)a3 andImage:(CGImage *)a4
{
  CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  if (!v7)
  {
    int v9 = 0;
LABEL_12:
    if (!a4)
    {
      a4 = [(TSDBitmapImageProvider *)self p_newImageFromSource:a3];
      self->mImage = a4;
    }
    double Width = (double)CGImageGetWidth(a4);
    double Height = (double)CGImageGetHeight(a4);
    goto LABEL_15;
  }
  CFDictionaryRef v8 = v7;
  int v9 = objc_msgSend((id)-[__CFDictionary objectForKey:](v7, "objectForKey:", *MEMORY[0x263F0F4C8]), "intValue");
  Value = (void *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x263F0F4F8]);
  double Height = 0.0;
  double Width = 0.0;
  if (Value)
  {
    objc_msgSend(Value, "tsu_CGFloatValue");
    double Width = v13;
  }
  float v14 = (void *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x263F0F4F0]);
  if (v14)
  {
    objc_msgSend(v14, "tsu_CGFloatValue");
    double Height = v15;
  }
  id v16 = CFDictionaryGetValue(v8, (const void *)*MEMORY[0x263F0F458]);
  if (v16) {
    BOOL v17 = CFEqual(v16, (CFTypeRef)*MEMORY[0x263EFFB38]) != 0;
  }
  else {
    BOOL v17 = 1;
  }
  self->mIsOpaque = v17;
  CFRelease(v8);
  if (Width == 0.0 || Height == 0.0) {
    goto LABEL_12;
  }
LABEL_15:
  unsigned int v18 = v9 - 1;
  if ((v9 - 1) >= 8)
  {
    self->mOrientation = 0;
  }
  else
  {
    self->mOrientation = p_configureOrientationAndSizeFromImageSource_andImage____orientationMapping[v18];
    if (v18 >= 4) {
      double v19 = Height;
    }
    else {
      double v19 = Width;
    }
    if (v18 >= 4) {
      double Height = Width;
    }
    double Width = v19;
  }
  self->mNaturalSize.double width = Width;
  self->mNaturalSize.double height = Height;
}

+ (id)p_cacheStringForData:(id)a3
{
  return 0;
}

+ (void)clearCacheForData:(id)a3
{
  if (([a3 isApplicationData] & 1) == 0)
  {
    uint64_t v5 = objc_msgSend(a1, "p_cacheStringForData:", a3);
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      uint64_t v7 = [v5 stringByAppendingString:@"-50.png"];
      uint64_t v8 = [v6 stringByAppendingString:@"-25.png"];
      if ([v6 isAbsolutePath])
      {
        int v9 = (void *)[MEMORY[0x263F08850] defaultManager];
        [v9 removeItemAtPath:v7 error:0];
        [v9 removeItemAtPath:v8 error:0];
      }
      else
      {
        double v10 = objc_msgSend((id)objc_msgSend(a3, "context"), "documentRoot");
        [v10 writeData:0 atDocumentCachePath:v7];
        [v10 writeData:0 atDocumentCachePath:v8];
      }
    }
  }
}

+ (CGImageSource)p_newImageSourceFromCacheForData:(id)a3 withFilenameSuffix:(id)a4
{
  CGSize result = (CGImageSource *)objc_msgSend(a1, "p_cacheStringForData:");
  if (result)
  {
    uint64_t v8 = (void *)[(CGImageSource *)result stringByAppendingString:a4];
    if ([v8 isAbsolutePath])
    {
      return (CGImageSource *)objc_msgSend(a1, "p_newImageSourceFromFilePath:", v8);
    }
    else
    {
      int v9 = objc_msgSend((id)objc_msgSend(a3, "context"), "documentRoot");
      return (CGImageSource *)[v9 newImageSourceForDocumentCachePath:v8];
    }
  }
  return result;
}

+ (CGImageSource)p_newImageSourceFromFilePath:(id)a3
{
  CGSize result = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)a3, kCFURLPOSIXPathStyle, 0);
  if (result)
  {
    int v4 = result;
    uint64_t v5 = NSDictionary;
    uint64_t v6 = [NSNumber numberWithBool:1];
    uint64_t v7 = CGImageSourceCreateWithURL(v4, (CFDictionaryRef)objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x263F0F600], 0));
    CFRelease(v4);
    return v7;
  }
  return result;
}

- (CGImageSource)p_newCGImageSourceForTemporaryUse
{
  mImageSource = self->mImageSource;
  if (mImageSource)
  {
    CFRetain(self->mImageSource);
    return mImageSource;
  }
  else
  {
    return [(TSDBitmapImageProvider *)self p_newCGImageSource];
  }
}

- (CGImageSource)p_newImageOfSize:(CGSize)a3 andWriteToCacheWithSuffix:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = NSDictionary;
  uint64_t v9 = [NSNumber numberWithBool:1];
  uint64_t v10 = *MEMORY[0x263F0F5A8];
  uint64_t v11 = [NSNumber numberWithBool:0];
  uint64_t v12 = *MEMORY[0x263F0F5B8];
  if (width <= height) {
    double v13 = height;
  }
  else {
    double v13 = width;
  }
  float v14 = v13;
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:vcvtps_u32_f32(v14)];
  CFDictionaryRef v16 = (const __CFDictionary *)objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, v10, v11, v12, v15, *MEMORY[0x263F0F638], 0);
  BOOL v17 = [(TSDBitmapImageProvider *)self p_newCGImageSourceForTemporaryUse];
  if (v17)
  {
    unsigned int v18 = v17;
    ThumbnailAtIndeCGFloat x = CGImageSourceCreateThumbnailAtIndex(v17, 0, v16);
    CFRelease(v18);
    if (ThumbnailAtIndex)
    {
      double v20 = (id *)MEMORY[0x263F1DC08];
      if (a4
        && (double v21 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "p_cacheStringForData:", -[TSDImageProvider imageData](self, "imageData")), "stringByAppendingString:", a4), (a4 = v21) != 0))
      {
        if ([v21 isAbsolutePath])
        {
          CFStringRef v22 = (const __CFString *)[*v20 identifier];
          CFURLRef v23 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)a4, kCFURLPOSIXPathStyle, 0);
          double v24 = CGImageDestinationCreateWithURL(v23, v22, 1uLL, 0);
          if (v24)
          {
            double v25 = v24;
            CGImageDestinationAddImage(v24, ThumbnailAtIndex, 0);
            CGImageDestinationFinalize(v25);
            CFRelease(v25);
            double v26 = NSDictionary;
            uint64_t v27 = [NSNumber numberWithBool:1];
            double v28 = CGImageSourceCreateWithURL(v23, (CFDictionaryRef)objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v27, *MEMORY[0x263F0F600], 0));
            CFRelease(v23);
LABEL_19:
            CGImageRelease(ThumbnailAtIndex);
            return v28;
          }
          CFRelease(v23);
        }
        char v29 = 0;
      }
      else
      {
        char v29 = 1;
      }
      double v30 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
      double v31 = CGImageDestinationCreateWithData(v30, (CFStringRef)[*v20 identifier], 1uLL, 0);
      CGImageDestinationAddImage(v31, ThumbnailAtIndex, 0);
      CGImageDestinationFinalize(v31);
      CFRelease(v31);
      double v28 = CGImageSourceCreateWithData(v30, 0);
      if ((v29 & 1) == 0 && ([a4 isAbsolutePath] & 1) == 0) {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDImageProvider imageData](self, "imageData"), "context"), "documentRoot"), "writeData:atDocumentCachePath:", v30, a4);
      }

      goto LABEL_19;
    }
  }
  return 0;
}

- (CGImageSource)CGImageSource
{
  return self->mImageSource;
}

@end