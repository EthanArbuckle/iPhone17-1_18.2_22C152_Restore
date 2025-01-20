@interface TSDErrorImageProvider
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (BOOL)isError;
- (BOOL)isValid;
- (CGPDFDocument)p_iconPDFDocument;
- (CGSize)naturalSize;
- (unint64_t)retainCount;
- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4;
@end

@implementation TSDErrorImageProvider

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSDErrorImageProvider;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedInstance
{
  id result = (id)sharedInstance_sSingletonInstance;
  if (!sharedInstance_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedInstance_sSingletonInstance)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedInstance_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSDErrorImageProvider sharedInstance]"];
        [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDErrorImageProvider.m"), 29, @"Couldn't create singleton instance of %@", a1 file lineNumber description];
      }
    }
    objc_sync_exit(a1);
    return (id)sharedInstance_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSDErrorImageProvider allocWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDErrorImageProvider.m"), 29, @"Don't alloc a singleton");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (CGSize)naturalSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isError
{
  return 1;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGContextSetShouldAntialias(a3, 1);
  DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
  CGContextSetFillColorWithColor(a3, DeviceRGB);
  CGColorRelease(DeviceRGB);
  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.double width = width;
  v58.size.double height = height;
  CGContextFillRect(a3, v58);
  v11 = (CGColor *)TSUCGColorCreateDeviceRGB();
  CGContextSetStrokeColorWithColor(a3, v11);
  CGColorRelease(v11);
  memset(&v57, 0, sizeof(v57));
  CGContextGetCTM(&v57, a3);
  double v12 = 1.0
      / TSDDistance(v57.tx + v57.a + v57.c * 0.0, v57.ty + v57.b + v57.d * 0.0, v57.tx + v57.c * *(double *)(MEMORY[0x263F00148] + 8) + v57.a * *MEMORY[0x263F00148], v57.ty + v57.d * *(double *)(MEMORY[0x263F00148] + 8) + v57.b * *MEMORY[0x263F00148]);
  CGContextSetLineWidth(a3, v12);
  CGFloat v48 = x;
  CGFloat v49 = y;
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.double width = width;
  v59.size.double height = height;
  CGRect v60 = CGRectInset(v59, v12 * 0.5, v12 * 0.5);
  CGFloat v13 = v60.origin.x;
  CGFloat v14 = v60.origin.y;
  CGFloat v15 = v60.size.width;
  CGFloat v16 = v60.size.height;
  CGContextBeginPath(a3);
  v61.origin.CGFloat x = v13;
  v61.origin.CGFloat y = v14;
  v61.size.double width = v15;
  v61.size.double height = v16;
  CGContextAddRect(a3, v61);
  v62.origin.CGFloat x = v13;
  v62.origin.CGFloat y = v14;
  v62.size.double width = v15;
  v62.size.double height = v16;
  CGFloat MinX = CGRectGetMinX(v62);
  v63.origin.CGFloat x = v13;
  v63.origin.CGFloat y = v14;
  v63.size.double width = v15;
  v63.size.double height = v16;
  CGFloat MinY = CGRectGetMinY(v63);
  CGContextMoveToPoint(a3, MinX, MinY);
  v64.origin.CGFloat x = v13;
  v64.origin.CGFloat y = v14;
  v64.size.double width = v15;
  v64.size.double height = v16;
  CGFloat MaxX = CGRectGetMaxX(v64);
  v65.origin.CGFloat x = v13;
  v65.origin.CGFloat y = v14;
  v65.size.double width = v15;
  v65.size.double height = v16;
  CGFloat MaxY = CGRectGetMaxY(v65);
  CGContextAddLineToPoint(a3, MaxX, MaxY);
  v66.origin.CGFloat x = v13;
  v66.origin.CGFloat y = v14;
  v66.size.double width = v15;
  v66.size.double height = v16;
  CGFloat v21 = CGRectGetMaxX(v66);
  v67.origin.CGFloat x = v13;
  v67.origin.CGFloat y = v14;
  v67.size.double width = v15;
  v67.size.double height = v16;
  CGFloat v22 = CGRectGetMinY(v67);
  CGContextMoveToPoint(a3, v21, v22);
  v68.origin.CGFloat x = v13;
  v68.origin.CGFloat y = v14;
  v68.size.double width = v15;
  v68.size.double height = v16;
  CGFloat v23 = CGRectGetMinX(v68);
  v69.origin.CGFloat x = v13;
  v69.origin.CGFloat y = v14;
  v69.size.double width = v15;
  v69.size.double height = v16;
  CGFloat v24 = CGRectGetMaxY(v69);
  CGContextAddLineToPoint(a3, v23, v24);
  CGContextStrokePath(a3);
  v25 = [(TSDErrorImageProvider *)self p_iconPDFDocument];
  if (v25)
  {
    Page = CGPDFDocumentGetPage(v25, 1uLL);
    if (Page)
    {
      v27 = Page;
      memset(&v56, 0, sizeof(v56));
      double v54 = 0.0;
      double v55 = 0.0;
      double v28 = TSDComputeBoxTransformAndSizeForPDFPage(Page, (uint64_t)&v56, &v54);
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v47 = v33;
      double v34 = v54;
      double v35 = v55;
      if (TSDMultiplySizeScalar(v54, v55, v12) <= width && v36 <= height)
      {
        double v38 = TSDRectWithSize();
        double v42 = TSDCenterRectOverRect(v38, v39, v40, v41, v48, v49, width, height);
        long long v52 = 0u;
        long long v53 = 0u;
        __n128 v51 = 0u;
        CGAffineTransform transform = v56;
        TSDComputeDrawTransformForPDFPage((__n128 *)&transform, &v51, v34, v35, v42, v43, v44, v45);
        *(__n128 *)&transform.a = v51;
        *(_OWORD *)&transform.c = v52;
        *(_OWORD *)&transform.tCGFloat x = v53;
        CGContextConcatCTM(a3, &transform);
        v70.origin.CGFloat x = v28;
        v70.origin.CGFloat y = v30;
        v70.size.double width = v32;
        v70.size.double height = v47;
        CGContextClipToRect(a3, v70);
        v71.origin.CGFloat x = v28;
        v71.origin.CGFloat y = v30;
        v71.size.double width = v32;
        v71.size.double height = v47;
        CGFloat v46 = CGRectGetMaxY(v71);
        CGContextTranslateCTM(a3, 0.0, v46);
        CGContextScaleCTM(a3, 1.0, -1.0);
        CGContextDrawPDFPage(a3, v27);
      }
    }
  }
}

- (CGPDFDocument)p_iconPDFDocument
{
  if (p_iconPDFDocument_onceToken != -1) {
    dispatch_once(&p_iconPDFDocument_onceToken, &__block_literal_global_37);
  }
  double v2 = (void *)p_iconPDFDocument_sIconProvider;

  return (CGPDFDocument *)[v2 CGPDFDocument];
}

TSDPDFImageProvider *__42__TSDErrorImageProvider_p_iconPDFDocument__block_invoke()
{
  CGSize result = -[TSDImageProvider initWithImageData:]([TSDPDFImageProvider alloc], "initWithImageData:", +[TSPData readOnlyDataFromURL:context:](TSPData, "readOnlyDataFromURL:context:", [(id)TSDBundle() URLForResource:@"TSDErrorImageIcon" withExtension:@"pdf"], 0));
  p_iconPDFDocument_sIconProvider = (uint64_t)result;
  return result;
}

@end