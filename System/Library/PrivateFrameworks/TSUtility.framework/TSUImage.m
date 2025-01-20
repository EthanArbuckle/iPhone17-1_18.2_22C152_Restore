@interface TSUImage
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)imageNamed:(id)a3 inBundle:(id)a4;
+ (id)imageWithCGImage:(CGImage *)a3;
+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
+ (id)imageWithContentsOfFile:(id)a3;
+ (id)imageWithData:(id)a3;
+ (id)imageWithSize:(CGSize)a3 drawnUsingBlock:(id)a4;
+ (id)imageWithUIImage:(id)a3;
+ (id)noisePatternWithWidth:(unint64_t)a3 height:(unint64_t)a4 factor:(double)a5;
- (BOOL)isEmpty;
- (CGImage)CGImage;
- (CGImage)CGImageForSize:(CGSize)a3;
- (CGSize)size;
- (TSUImage)init;
- (TSUImage)initWithCGImage:(CGImage *)a3;
- (TSUImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
- (TSUImage)initWithContentsOfFile:(id)a3;
- (TSUImage)initWithData:(id)a3;
- (TSUImage)initWithImageSourceRef:(CGImageSource *)a3;
- (TSUImage)initWithUIImage:(id)a3;
- (UIImage)UIImage;
- (double)scale;
- (id)JPEGRepresentationWithCompressionQuality:(double)a3;
- (id)PNGRepresentation;
- (id)TIFFRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imagePartsWithLeftCapWidth:(double)a3 rightCapWidth:(double)a4 topCapHeight:(double)a5 bottomCapHeight:(double)a6;
- (id)stretchedImageOfSize:(CGSize)a3 leftCapWidth:(double)a4 rightCapWidth:(double)a5 topCapHeight:(double)a6 bottomCapHeight:(double)a7;
- (int64_t)imageOrientation;
- (void)dealloc;
- (void)drawInRect:(CGRect)a3;
- (void)drawInRect:(CGRect)a3 context:(CGContext *)a4 stretchingCenterWidthBy:(double)a5;
@end

@implementation TSUImage

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[_TSUImageM allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___TSUImage;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  return +[TSUUIImage imageNamed:a3 inBundle:a4];
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

- (TSUImage)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSUImage;
  result = [(TSUImage *)&v3 init];
  if (result) {
    __dmb(0xBu);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSUImage copyWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 733, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage copyWithZone:]"), 0 reason userInfo]);
}

- (TSUImage)initWithContentsOfFile:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSUImage initWithContentsOfFile:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 739, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage initWithContentsOfFile:]"), 0 reason userInfo]);
}

- (TSUImage)initWithData:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSUImage initWithData:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 745, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage initWithData:]"), 0 reason userInfo]);
}

- (TSUImage)initWithCGImage:(CGImage *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSUImage initWithCGImage:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 751, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage initWithCGImage:]"), 0 reason userInfo]);
}

- (TSUImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  id v5 = +[TSUAssertionHandler currentHandler];
  uint64_t v6 = [NSString stringWithUTF8String:"-[TSUImage initWithCGImage:scale:orientation:]"];
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 757, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage initWithCGImage:scale:orientation:]"), 0 reason userInfo]);
}

- (TSUImage)initWithImageSourceRef:(CGImageSource *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSUImage initWithImageSourceRef:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 763, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage initWithImageSourceRef:]"), 0 reason userInfo]);
}

- (CGSize)size
{
  id v2 = +[TSUAssertionHandler currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSUImage size]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 770, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage size]"), 0 reason userInfo]);
}

- (double)scale
{
  id v2 = +[TSUAssertionHandler currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSUImage scale]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 775, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage scale]"), 0 reason userInfo]);
}

- (void)dealloc
{
  CGImageRelease(self->mCachedSliceableImage);
  mImageSlices = self->mImageSlices;
  if (mImageSlices) {
    CFRelease(mImageSlices);
  }

  v4.receiver = self;
  v4.super_class = (Class)TSUImage;
  [(TSUImage *)&v4 dealloc];
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSUImage CGImageForSize:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 790, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage CGImageForSize:]"), 0 reason userInfo]);
}

- (CGImage)CGImage
{
  id v2 = +[TSUAssertionHandler currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSUImage CGImage]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 795, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage CGImage]"), 0 reason userInfo]);
}

- (int64_t)imageOrientation
{
  id v2 = +[TSUAssertionHandler currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSUImage imageOrientation]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 800, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage imageOrientation]"), 0 reason userInfo]);
}

- (BOOL)isEmpty
{
  id v2 = [(TSUImage *)self CGImage];
  return TSUCGImageIsEmpty(v2);
}

- (id)imagePartsWithLeftCapWidth:(double)a3 rightCapWidth:(double)a4 topCapHeight:(double)a5 bottomCapHeight:(double)a6
{
  v38[34] = *MEMORY[0x263EF8340];
  if ([(TSUImage *)self imageOrientation])
  {
    id v11 = +[TSUAssertionHandler currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSUImage imagePartsWithLeftCapWidth:rightCapWidth:topCapHeight:bottomCapHeight:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 813, @"Method may not produce desired output if image orientation is not facing up.");
  }
  [(TSUImage *)self scale];
  double v14 = v13;
  v15 = -[TSUImage CGImageForContentsScale:](self, "CGImageForContentsScale:");
  double v16 = v14 * a3;
  double v17 = v14 * a4;
  double v18 = v14 * a5;
  double v19 = v14 * a6;
  double Width = (double)CGImageGetWidth(v15);
  size_t Height = CGImageGetHeight(v15);
  double v22 = (double)Height;
  if (v18 >= (double)Height) {
    double v23 = (double)Height;
  }
  else {
    double v23 = v18;
  }
  if (v19 >= v22 - v23) {
    double v24 = v22 - v23;
  }
  else {
    double v24 = v19;
  }
  if (v16 >= Width) {
    double v25 = Width;
  }
  else {
    double v25 = v16;
  }
  if (v17 >= Width - v25) {
    double v26 = Width - v25;
  }
  else {
    double v26 = v17;
  }
  TSUSplitRectIntoSlices((uint64_t)v37, 0.0, 0.0, Width, v22, v25, v26, v23, v24);
  v27 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:9];
  uint64_t v28 = 0;
  v29 = (double *)v38;
  do
  {
    CGFloat v30 = *(v29 - 2);
    CGFloat v31 = *(v29 - 1);
    CGFloat v32 = *v29;
    CGFloat v33 = v29[1];
    v39.origin.x = v30;
    v39.origin.y = v31;
    v39.size.width = *v29;
    v39.size.height = v33;
    if (CGRectIsEmpty(v39)
      || (v40.origin.x = v30, v40.origin.y = v31, v40.size.width = v32, v40.size.height = v33, CGRectIsNull(v40)))
    {
      objc_msgSend(v27, "insertObject:atIndex:", objc_msgSend(MEMORY[0x263EFF9D0], "null"), v28);
    }
    else
    {
      v41.origin.x = v30;
      v41.origin.y = v31;
      v41.size.width = v32;
      v41.size.height = v33;
      v34 = CGImageCreateWithImageInRect(v15, v41);
      [(TSUImage *)self scale];
      objc_msgSend(v27, "insertObject:atIndex:", +[TSUImage imageWithCGImage:scale:orientation:](TSUImage, "imageWithCGImage:scale:orientation:", v34, -[TSUImage imageOrientation](self, "imageOrientation"), v35), v28);
      CGImageRelease(v34);
    }
    ++v28;
    v29 += 4;
  }
  while (v28 != 9);
  return v27;
}

- (id)TIFFRepresentation
{
  id v2 = [(TSUImage *)self CGImage];
  return TSUCGImageTIFFRepresentation(v2);
}

- (id)JPEGRepresentationWithCompressionQuality:(double)a3
{
  uint64_t v4 = [(TSUImage *)self CGImage];
  return TSUCGImageJPEGRepresentation((uint64_t)v4, a3);
}

- (id)PNGRepresentation
{
  id v2 = [(TSUImage *)self CGImage];
  return (id)TSUCGImagePNGRepresentation(v2);
}

- (id)stretchedImageOfSize:(CGSize)a3 leftCapWidth:(double)a4 rightCapWidth:(double)a5 topCapHeight:(double)a6 bottomCapHeight:(double)a7
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __89__TSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke;
  v12[3] = &unk_26462A458;
  CGSize v13 = a3;
  v12[4] = self;
  double v14 = a6;
  double v15 = a7;
  double v16 = a4;
  double v17 = a5;
  v8 = __89__TSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke((uint64_t)v12, -[TSUImage CGImageForSize:](self, "CGImageForSize:"), 1.0);
  [(TSUImage *)self scale];
  v10 = +[TSUImage imageWithCGImage:v8 scale:[(TSUImage *)self imageOrientation] orientation:v9];
  CGImageRelease(v8);
  return v10;
}

CGImageRef __89__TSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke(uint64_t a1, CGImageRef image, double a3)
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
              CGFloat v31 = v30;
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
  double v10 = -[TSUImage CGImageForSize:](self, "CGImageForSize:", a3.size.width, a3.size.height);
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
  int64_t mImageSliceCacheLock = self->mImageSliceCacheLock;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__TSUImage_drawInRect_context_stretchingCenterWidthBy___block_invoke;
  block[3] = &unk_26462A048;
  block[4] = self;
  if (mImageSliceCacheLock != -1) {
    dispatch_once(&self->mImageSliceCacheLock, block);
  }
  double v18 = v13 - (v15 + v16);
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
    v30.size.width = v18;
    v30.size.CGFloat height = v20;
    CGImageRef v22 = CGImageCreateWithImageInRect(v10, v30);
    v31.origin.CGFloat y = 0.0;
    v31.origin.double x = v16;
    v31.size.width = v15;
    v31.size.CGFloat height = v20;
    CGImageRef v23 = CGImageCreateWithImageInRect(v10, v31);
    CFDictionarySetValue(self->mImageSlices, &unk_26D508E88, v21);
    CFDictionarySetValue(self->mImageSlices, &unk_26D508EA0, v23);
    CFDictionarySetValue(self->mImageSlices, &unk_26D508EB8, v22);
    CGImageRelease(v21);
    CGImageRelease(v22);
    CGImageRelease(v23);
  }
  Value = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_26D508E88);
  CGFloat v25 = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_26D508EA0);
  CGFloat v26 = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_26D508EB8);
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
  v34.size.width = v18;
  v34.size.CGFloat height = height;
  CGContextDrawImage(a4, v34, v26);
}

CFMutableDictionaryRef __55__TSUImage_drawInRect_context_stretchingCenterWidthBy___block_invoke(uint64_t a1)
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 12, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

+ (id)imageWithSize:(CGSize)a3 drawnUsingBlock:(id)a4
{
  UIGraphicsBeginImageContextWithOptions(a3, 0, 0.0);
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  (*((void (**)(id, CGContextRef))a4 + 2))(a4, CurrentContext);
  uint64_t v6 = +[TSUImage imageWithUIImage:UIGraphicsGetImageFromCurrentImageContext()];
  UIGraphicsEndImageContext();
  return v6;
}

- (void)drawInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(TSUImage *)self UIImage];
  -[UIImage drawInRect:](v7, "drawInRect:", x, y, width, height);
}

+ (id)imageWithUIImage:(id)a3
{
  uint64_t v3 = [[TSUUIImage alloc] initWithUIImage:a3];
  return v3;
}

- (TSUImage)initWithUIImage:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSUImage(UIKitAdditions) initWithUIImage:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 1089, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSUImage(UIKitAdditions) initWithUIImage:]"), 0 reason userInfo]);
}

- (UIImage)UIImage
{
  int64_t mCachedImageLock = self->mCachedImageLock;
  p_int64_t mCachedImageLock = &self->mCachedImageLock;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__TSUImage_UIKitAdditions__UIImage__block_invoke;
  block[3] = &unk_26462A048;
  block[4] = self;
  if (mCachedImageLock != -1) {
    dispatch_once(p_mCachedImageLock, block);
  }
  return (UIImage *)self->mCachedSystemImage;
}

uint64_t __35__TSUImage_UIKitAdditions__UIImage__block_invoke(uint64_t a1)
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
  double v10 = malloc_type_malloc(a4 * a3, 0xF5F456F5uLL);
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
  DeviceGradouble y = CGColorSpaceCreateDeviceGray();
  double v16 = CGBitmapContextCreate(v10, a3, a4, 8uLL, a3, DeviceGray, 0);
  Image = CGBitmapContextCreateImage(v16);
  CGColorSpaceRelease(DeviceGray);
  free(v10);
  CGContextRelease(v16);
  double v18 = (void *)[a1 imageWithCGImage:Image];
  CGImageRelease(Image);
  return v18;
}

@end