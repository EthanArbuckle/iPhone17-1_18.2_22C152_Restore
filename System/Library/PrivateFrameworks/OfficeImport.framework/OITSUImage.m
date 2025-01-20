@interface OITSUImage
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)imageNamed:(id)a3;
+ (id)imageWithCGImage:(CGImage *)a3;
+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
+ (id)imageWithContentsOfFile:(id)a3;
+ (id)imageWithData:(id)a3;
+ (id)imageWithUIImage:(id)a3;
+ (id)noisePatternWithWidth:(unint64_t)a3 height:(unint64_t)a4 factor:(double)a5;
- (BOOL)isEmpty;
- (CGImage)CGImage;
- (CGImage)CGImageForSize:(CGSize)a3;
- (CGSize)size;
- (OITSUImage)init;
- (OITSUImage)initWithCGImage:(CGImage *)a3;
- (OITSUImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
- (OITSUImage)initWithContentsOfFile:(id)a3;
- (OITSUImage)initWithData:(id)a3;
- (OITSUImage)initWithImageSourceRef:(CGImageSource *)a3;
- (OITSUImage)initWithUIImage:(id)a3;
- (UIImage)UIImage;
- (double)scale;
- (id)JPEGRepresentationWithCompressionQuality:(double)a3;
- (id)PNGRepresentation;
- (id)TIFFRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stretchedImageOfSize:(CGSize)a3 leftCapWidth:(double)a4 rightCapWidth:(double)a5 topCapHeight:(double)a6 bottomCapHeight:(double)a7;
- (int64_t)imageOrientation;
- (void)dealloc;
- (void)drawInRect:(CGRect)a3 context:(CGContext *)a4 stretchingCenterWidthBy:(double)a5;
- (void)drawInRect:(CGRect)a3 fromRect:(CGRect)a4 isFlipped:(BOOL)a5;
@end

@implementation OITSUImage

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[OI_TSUImageM allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___OITSUImage;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

+ (id)imageNamed:(id)a3
{
  return +[OITSUUIImage imageNamed:a3];
}

+ (id)imageWithContentsOfFile:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithContentsOfFile:a3];
  return v3;
}

+ (id)imageWithData:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithData:a3];
  return v3;
}

+ (id)imageWithCGImage:(CGImage *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCGImage:a3];
  return v3;
}

+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithCGImage:a3 scale:a5 orientation:a4];
  return v5;
}

- (OITSUImage)init
{
  v4.receiver = self;
  v4.super_class = (Class)OITSUImage;
  v2 = [(OITSUImage *)&v4 init];
  if (v2)
  {
    v2->mImageSlicesOnce = objc_alloc_init(TSUOnce);
    v2->mCachedImageOnce = objc_alloc_init(TSUOnce);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"-[OITSUImage copyWithZone:]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v3, v4, 721, 0, "Abstract method not overridden by %@", NSStringFromClass(v5) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  objc_super v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)[v6 exceptionWithName:v7, objc_msgSend(v8, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v9), "-[OITSUImage copyWithZone:]"), 0 reason userInfo];
  objc_exception_throw(v10);
}

- (OITSUImage)initWithContentsOfFile:(id)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"-[OITSUImage initWithContentsOfFile:]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v3, v4, 726, 0, "Abstract method not overridden by %@", NSStringFromClass(v5) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  objc_super v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)[v6 exceptionWithName:v7, objc_msgSend(v8, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v9), "-[OITSUImage initWithContentsOfFile:]"), 0 reason userInfo];
  objc_exception_throw(v10);
}

- (OITSUImage)initWithData:(id)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"-[OITSUImage initWithData:]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v3, v4, 731, 0, "Abstract method not overridden by %@", NSStringFromClass(v5) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  objc_super v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)[v6 exceptionWithName:v7, objc_msgSend(v8, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v9), "-[OITSUImage initWithData:]"), 0 reason userInfo];
  objc_exception_throw(v10);
}

- (OITSUImage)initWithCGImage:(CGImage *)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"-[OITSUImage initWithCGImage:]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v3, v4, 736, 0, "Abstract method not overridden by %@", NSStringFromClass(v5) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  objc_super v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)[v6 exceptionWithName:v7, objc_msgSend(v8, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v9), "-[OITSUImage initWithCGImage:]"), 0 reason userInfo];
  objc_exception_throw(v10);
}

- (OITSUImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "-[OITSUImage initWithCGImage:scale:orientation:]", a5, a4);
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  uint64_t v7 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v5, v6, 741, 0, "Abstract method not overridden by %@", NSStringFromClass(v7) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF498];
  v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v12 = (void *)[v8 exceptionWithName:v9, objc_msgSend(v10, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v11), "-[OITSUImage initWithCGImage:scale:orientation:]"), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (OITSUImage)initWithImageSourceRef:(CGImageSource *)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"-[OITSUImage initWithImageSourceRef:]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  uint64_t v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v3, v4, 746, 0, "Abstract method not overridden by %@", NSStringFromClass(v5) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  uint64_t v9 = (objc_class *)objc_opt_class();
  v10 = (void *)[v6 exceptionWithName:v7, objc_msgSend(v8, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v9), "-[OITSUImage initWithImageSourceRef:]"), 0 reason userInfo];
  objc_exception_throw(v10);
}

- (CGSize)size
{
  uint64_t v2 = [NSString stringWithUTF8String:"-[OITSUImage size]"];
  uint64_t v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  uint64_t v4 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 752, 0, "Abstract method not overridden by %@", NSStringFromClass(v4) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = (void *)[v5 exceptionWithName:v6, objc_msgSend(v7, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v8), "-[OITSUImage size]"), 0 reason userInfo];
  objc_exception_throw(v9);
}

- (double)scale
{
  uint64_t v2 = [NSString stringWithUTF8String:"-[OITSUImage scale]"];
  uint64_t v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  uint64_t v4 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 756, 0, "Abstract method not overridden by %@", NSStringFromClass(v4) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = (void *)[v5 exceptionWithName:v6, objc_msgSend(v7, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v8), "-[OITSUImage scale]"), 0 reason userInfo];
  objc_exception_throw(v9);
}

- (void)dealloc
{
  CGImageRelease(self->mCachedSliceableImage);
  mImageSlices = self->mImageSlices;
  if (mImageSlices) {
    CFRelease(mImageSlices);
  }

  v4.receiver = self;
  v4.super_class = (Class)OITSUImage;
  [(OITSUImage *)&v4 dealloc];
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  uint64_t v3 = objc_msgSend(NSString, "stringWithUTF8String:", "-[OITSUImage CGImageForSize:]", a3.width, a3.height);
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  uint64_t v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v3, v4, 771, 0, "Abstract method not overridden by %@", NSStringFromClass(v5) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  uint64_t v9 = (objc_class *)objc_opt_class();
  v10 = (void *)[v6 exceptionWithName:v7, objc_msgSend(v8, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v9), "-[OITSUImage CGImageForSize:]"), 0 reason userInfo];
  objc_exception_throw(v10);
}

- (CGImage)CGImage
{
  uint64_t v2 = [NSString stringWithUTF8String:"-[OITSUImage CGImage]"];
  uint64_t v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  uint64_t v4 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 775, 0, "Abstract method not overridden by %@", NSStringFromClass(v4) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = (void *)[v5 exceptionWithName:v6, objc_msgSend(v7, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v8), "-[OITSUImage CGImage]"), 0 reason userInfo];
  objc_exception_throw(v9);
}

- (int64_t)imageOrientation
{
  uint64_t v2 = [NSString stringWithUTF8String:"-[OITSUImage imageOrientation]"];
  uint64_t v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  uint64_t v4 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 779, 0, "Abstract method not overridden by %@", NSStringFromClass(v4) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = (void *)[v5 exceptionWithName:v6, objc_msgSend(v7, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v8), "-[OITSUImage imageOrientation]"), 0 reason userInfo];
  objc_exception_throw(v9);
}

- (BOOL)isEmpty
{
  uint64_t v2 = [(OITSUImage *)self CGImage];
  return TSUCGImageIsEmpty(v2);
}

- (id)TIFFRepresentation
{
  uint64_t v2 = [(OITSUImage *)self CGImage];
  return CGImageTIFFRepresentation(v2);
}

- (id)JPEGRepresentationWithCompressionQuality:(double)a3
{
  uint64_t v4 = [(OITSUImage *)self CGImage];
  return CGImageJPEGRepresentation((uint64_t)v4, a3);
}

- (id)PNGRepresentation
{
  uint64_t v2 = [(OITSUImage *)self CGImage];
  return (id)CGImagePNGRepresentation(v2);
}

- (id)stretchedImageOfSize:(CGSize)a3 leftCapWidth:(double)a4 rightCapWidth:(double)a5 topCapHeight:(double)a6 bottomCapHeight:(double)a7
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__OITSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke;
  v12[3] = &unk_264D61050;
  CGSize v13 = a3;
  v12[4] = self;
  double v14 = a6;
  double v15 = a7;
  double v16 = a4;
  double v17 = a5;
  v8 = __91__OITSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke((uint64_t)v12, -[OITSUImage CGImageForSize:](self, "CGImageForSize:"), 1.0);
  [(OITSUImage *)self scale];
  v10 = +[OITSUImage imageWithCGImage:v8 scale:[(OITSUImage *)self imageOrientation] orientation:v9];
  CGImageRelease(v8);
  return v10;
}

CGImageRef __91__OITSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke(uint64_t a1, CGImageRef image, double a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  double Width = (double)CGImageGetWidth(image);
  double Height = (double)CGImageGetHeight(image);
  double v8 = fabs(*(double *)(a1 + 40));
  [*(id *)(a1 + 32) scale];
  double v10 = ceil(v8 * v9 * a3);
  double v11 = fabs(*(double *)(a1 + 48));
  [*(id *)(a1 + 32) scale];
  double v13 = ceil(v11 * v12 * a3);
  double v14 = *(double *)(a1 + 64);
  if (*(double *)(a1 + 56) * a3 >= Height) {
    double v15 = Height;
  }
  else {
    double v15 = *(double *)(a1 + 56) * a3;
  }
  if (v14 * a3 >= Height - v15) {
    double v16 = Height - v15;
  }
  else {
    double v16 = v14 * a3;
  }
  double v17 = *(double *)(a1 + 80);
  if (*(double *)(a1 + 72) * a3 >= Width) {
    double v18 = Width;
  }
  else {
    double v18 = *(double *)(a1 + 72) * a3;
  }
  if (v17 * a3 >= Width - v18) {
    double v19 = Width - v18;
  }
  else {
    double v19 = v17 * a3;
  }
  TSUSplitRectIntoSlices((uint64_t)v37, 0.0, 0.0, Width, Height, v18, v19, v15, v16);
  TSUSplitRectIntoSlices((uint64_t)v36, 0.0, 0.0, v10, v13, v18, v19, v15, v16);
  v20 = TSUCreateRGBABitmapContext(1, v10, v13, 1.0);
  for (uint64_t i = 0; i != 288; i += 32)
  {
    CGFloat v22 = *(double *)&v37[i];
    CGFloat v23 = *(double *)&v37[i + 8];
    CGFloat v24 = *(double *)&v37[i + 16];
    CGFloat v25 = *(double *)&v37[i + 24];
    CGFloat v26 = *(double *)&v36[i];
    CGFloat v27 = *(double *)&v36[i + 8];
    CGFloat v28 = *(double *)&v36[i + 16];
    CGFloat v29 = *(double *)&v36[i + 24];
    v39.origin.x = v22;
    v39.origin.y = v23;
    v39.size.width = v24;
    v39.size.height = v25;
    if (!CGRectIsEmpty(v39))
    {
      v40.origin.x = v22;
      v40.origin.y = v23;
      v40.size.width = v24;
      v40.size.height = v25;
      if (!CGRectIsNull(v40))
      {
        v41.origin.x = v26;
        v41.origin.y = v27;
        v41.size.width = v28;
        v41.size.height = v29;
        if (!CGRectIsEmpty(v41))
        {
          v42.origin.x = v26;
          v42.origin.y = v27;
          v42.size.width = v28;
          v42.size.height = v29;
          if (!CGRectIsNull(v42))
          {
            v43.origin.x = v22;
            v43.origin.y = v23;
            v43.size.width = v24;
            v43.size.height = v25;
            CGImageRef v30 = CGImageCreateWithImageInRect(image, v43);
            if (v30)
            {
              v31 = v30;
              CGContextSaveGState(v20);
              v44.origin.x = v26;
              v44.origin.y = v27;
              v44.size.width = v28;
              v44.size.height = v29;
              double MaxY = CGRectGetMaxY(v44);
              v45.origin.x = v26;
              v45.origin.y = v27;
              v45.size.width = v28;
              v45.size.height = v29;
              CGFloat MinY = CGRectGetMinY(v45);
              CGContextTranslateCTM(v20, 0.0, MaxY + MinY);
              CGContextScaleCTM(v20, 1.0, -1.0);
              v46.origin.x = v26;
              v46.origin.y = v27;
              v46.size.width = v28;
              v46.size.height = v29;
              CGContextDrawImage(v20, v46, v31);
              CGImageRelease(v31);
              CGContextRestoreGState(v20);
            }
          }
        }
      }
    }
  }
  CGImageRef v34 = CGBitmapContextCreateImage(v20);
  CGContextRelease(v20);
  return v34;
}

- (void)drawInRect:(CGRect)a3 context:(CGContext *)a4 stretchingCenterWidthBy:(double)a5
{
  CGFloat height = a3.size.height;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = -[OITSUImage CGImageForSize:](self, "CGImageForSize:", a3.size.width, a3.size.height);
  size_t Width = CGImageGetWidth(v10);
  int v12 = Width;
  double v13 = (double)Width;
  size_t v14 = CGImageGetHeight(v10);
  if ((v12 & 0x80000001) == 1) {
    double v15 = 1.0;
  }
  else {
    double v15 = 2.0;
  }
  double v16 = floor(v13 * 0.5) - (v15 + -1.0);
  double v17 = v13 - (v15 + v16);
  mImageSlicesOnce = self->mImageSlicesOnce;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __57__OITSUImage_drawInRect_context_stretchingCenterWidthBy___block_invoke;
  v28[3] = &unk_264D60B18;
  v28[4] = self;
  [(TSUOnce *)mImageSlicesOnce performBlockOnce:v28];
  mCachedSliceableImage = self->mCachedSliceableImage;
  if (!mCachedSliceableImage || !CFEqual(v10, mCachedSliceableImage))
  {
    CGFloat v20 = (double)v14;
    self->mCachedSliceableImage = CGImageRetain(v10);
    CFDictionaryRemoveAllValues(self->mImageSlices);
    v29.origin.double x = 0.0;
    v29.origin.CGFloat y = 0.0;
    v29.size.width = v16;
    v29.size.CGFloat height = (double)v14;
    CGImageRef v21 = CGImageCreateWithImageInRect(v10, v29);
    v30.origin.CGFloat y = 0.0;
    v30.origin.double x = v15 + v16;
    v30.size.width = v17;
    v30.size.CGFloat height = v20;
    CGImageRef v22 = CGImageCreateWithImageInRect(v10, v30);
    v31.origin.CGFloat y = 0.0;
    v31.origin.double x = v16;
    v31.size.width = v15;
    v31.size.CGFloat height = v20;
    CGImageRef v23 = CGImageCreateWithImageInRect(v10, v31);
    CFDictionarySetValue(self->mImageSlices, &unk_26EC80C30, v21);
    CFDictionarySetValue(self->mImageSlices, &unk_26EC80C48, v23);
    CFDictionarySetValue(self->mImageSlices, &unk_26EC80C60, v22);
    CGImageRelease(v21);
    CGImageRelease(v22);
    CGImageRelease(v23);
  }
  Value = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_26EC80C30);
  CGFloat v25 = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_26EC80C48);
  CGFloat v26 = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_26EC80C60);
  v32.origin.double x = x;
  v32.origin.CGFloat y = y;
  v32.size.width = v16;
  v32.size.CGFloat height = height;
  CGContextDrawImage(a4, v32, Value);
  v33.origin.double x = x + v16;
  v33.origin.CGFloat y = y;
  v33.size.width = a5;
  v33.size.CGFloat height = height;
  CGContextDrawImage(a4, v33, v25);
  v34.origin.double x = x + v16 + a5;
  v34.origin.CGFloat y = y;
  v34.size.width = v17;
  v34.size.CGFloat height = height;
  CGContextDrawImage(a4, v34, v26);
}

CFMutableDictionaryRef __57__OITSUImage_drawInRect_context_stretchingCenterWidthBy___block_invoke(uint64_t a1)
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 12, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

+ (id)imageWithUIImage:(id)a3
{
  uint64_t v3 = [[OITSUUIImage alloc] initWithUIImage:a3];
  return v3;
}

- (OITSUImage)initWithUIImage:(id)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"-[OITSUImage(UIKitAdditions) initWithUIImage:]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m"];
  uint64_t v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:v3, v4, 989, 0, "Abstract method not overridden by %@", NSStringFromClass(v5) file lineNumber isFatal description];
  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  double v8 = NSString;
  double v9 = (objc_class *)objc_opt_class();
  double v10 = (void *)[v6 exceptionWithName:v7, objc_msgSend(v8, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v9), "-[OITSUImage(UIKitAdditions) initWithUIImage:]"), 0 reason userInfo];
  objc_exception_throw(v10);
}

- (UIImage)UIImage
{
  mCachedImageOnce = self->mCachedImageOnce;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__OITSUImage_UIKitAdditions__UIImage__block_invoke;
  v5[3] = &unk_264D60B18;
  v5[4] = self;
  [(TSUOnce *)mCachedImageOnce performBlockOnce:v5];
  return (UIImage *)self->mCachedSystemImage;
}

uint64_t __37__OITSUImage_UIKitAdditions__UIImage__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F1C6B0]);
  uint64_t v3 = [*(id *)(a1 + 32) CGImage];
  [*(id *)(a1 + 32) scale];
  uint64_t result = objc_msgSend(v2, "initWithCGImage:scale:orientation:", v3, objc_msgSend(*(id *)(a1 + 32), "imageOrientation"), v4);
  *(void *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

+ (id)noisePatternWithWidth:(unint64_t)a3 height:(unint64_t)a4 factor:(double)a5
{
  unint64_t v9 = a4 * a3;
  double v10 = malloc_type_malloc(a4 * a3, 0x54B432FAuLL);
  srand(0x7Cu);
  if (v9)
  {
    double v11 = v10;
    do
    {
      int v12 = rand();
      if (v12 <= 0) {
        int v13 = --(char)v12;
      }
      else {
        int v13 = v12;
      }
      double v14 = (double)v13 * a5;
      if (v14 > 255.0) {
        double v14 = 255.0;
      }
      *v11++ = (int)v14;
      --v9;
    }
    while (v9);
  }
  DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
  double v16 = CGBitmapContextCreate(v10, a3, a4, 8uLL, a3, DeviceGray, 0);
  Image = CGBitmapContextCreateImage(v16);
  CGColorSpaceRelease(DeviceGray);
  free(v10);
  CGContextRelease(v16);
  double v18 = (void *)[a1 imageWithCGImage:Image];
  CGImageRelease(Image);
  return v18;
}

- (void)drawInRect:(CGRect)a3 fromRect:(CGRect)a4 isFlipped:(BOOL)a5
{
  double width = -0.0;
  if (a4.size.width < 0.0) {
    double width = a4.size.width;
  }
  double v7 = a4.origin.x + width;
  if (a4.size.width >= 0.0) {
    double v8 = a4.size.width;
  }
  else {
    double v8 = -a4.size.width;
  }
  CGFloat v33 = v8;
  if (a3.size.width < 0.0) {
    BOOL v9 = a4.size.width >= 0.0;
  }
  else {
    BOOL v9 = a4.size.width < 0.0;
  }
  if (a3.size.width < 0.0) {
    double x = a3.origin.x + a3.size.width;
  }
  else {
    double x = a3.origin.x;
  }
  if (a3.size.width < 0.0) {
    double v11 = -a3.size.width;
  }
  else {
    double v11 = a3.size.width;
  }
  BOOL v12 = !a5;
  double height = -a4.size.height;
  if (a4.size.height < 0.0)
  {
    double y = a4.origin.y + a4.size.height;
  }
  else
  {
    BOOL v12 = a5;
    double y = a4.origin.y;
  }
  if (a4.size.height >= 0.0) {
    double height = a4.size.height;
  }
  CGFloat rect = height;
  if (a3.size.height < 0.0) {
    int v15 = !v12;
  }
  else {
    int v15 = v12;
  }
  if (a3.size.height < 0.0) {
    double v16 = a3.origin.y + a3.size.height;
  }
  else {
    double v16 = a3.origin.y;
  }
  if (a3.size.height < 0.0) {
    double v17 = -a3.size.height;
  }
  else {
    double v17 = a3.size.height;
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v36.origin.double x = x;
  v36.origin.double y = v16;
  v36.size.double width = v11;
  v36.size.double height = v17;
  CGFloat MidX = CGRectGetMidX(v36);
  v37.origin.double x = x;
  v37.origin.double y = v16;
  v37.size.double width = v11;
  v37.size.double height = v17;
  CGFloat MidY = CGRectGetMidY(v37);
  CGContextTranslateCTM(CurrentContext, MidX, MidY);
  double v21 = 1.0;
  if (v9) {
    double v22 = -1.0;
  }
  else {
    double v22 = 1.0;
  }
  if (v15) {
    double v21 = -1.0;
  }
  CGContextScaleCTM(CurrentContext, v22, v21);
  v38.origin.double x = x;
  v38.origin.double y = v16;
  v38.size.double width = v11;
  v38.size.double height = v17;
  CGFloat v23 = -CGRectGetMidX(v38);
  v39.origin.double x = x;
  v39.origin.double y = v16;
  v39.size.double width = v11;
  v39.size.double height = v17;
  CGFloat v24 = CGRectGetMidY(v39);
  CGContextTranslateCTM(CurrentContext, v23, -v24);
  CGFloat v25 = *MEMORY[0x263F00148];
  CGFloat v26 = *(double *)(MEMORY[0x263F00148] + 8);
  [(OITSUImage *)self size];
  v44.size.double width = v27;
  v44.size.double height = v28;
  v40.origin.double x = v7;
  v40.origin.double y = y;
  v40.size.double width = v33;
  v40.size.double height = rect;
  v44.origin.double x = v25;
  v44.origin.double y = v26;
  BOOL v29 = CGRectEqualToRect(v40, v44);
  CGRect v30 = [(OITSUImage *)self CGImage];
  if (v29)
  {
    v41.origin.double x = x;
    v41.origin.double y = v16;
    v41.size.double width = v11;
    v41.size.double height = v17;
    CGContextDrawImage(CurrentContext, v41, v30);
  }
  else
  {
    v42.origin.double x = v7;
    v42.origin.double y = y;
    v42.size.double width = v33;
    v42.size.double height = rect;
    CGRect v31 = CGImageCreateWithImageInRect(v30, v42);
    if (v31)
    {
      CGRect v32 = v31;
      v43.origin.double x = x;
      v43.origin.double y = v16;
      v43.size.double width = v11;
      v43.size.double height = v17;
      CGContextDrawImage(CurrentContext, v43, v31);
      CFRelease(v32);
    }
  }
  CGContextRestoreGState(CurrentContext);
}

@end