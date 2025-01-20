@interface CRLBitmapImageProvider
+ (CGImage)CGImageForImageData:(id)a3;
+ (CGSize)naturalSizeForImageData:(id)a3;
+ (id)CRLImageForImageData:(id)a3;
+ (void)drawImage:(CGImage *)a3 inContext:(CGContext *)a4 rect:(CGRect)a5 orientation:(int64_t)a6;
- (BOOL)i_hasFlushableContent;
- (BOOL)isOpaque;
- (BOOL)isValid;
- (BOOL)p_shouldScaleRetinaImages;
- (CGImage)CGImageForNaturalSize;
- (CGImage)CGImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orContentsScaleProvider:(id)a5;
- (CGImage)CGImageOfAnySize;
- (CGImage)CGImageOfLargestSafeSize;
- (CGImage)CGImageResampledToSize:(CGSize)a3 lowQuality:(BOOL)a4 assetOwner:(id)a5;
- (CGImage)cachedCGImageOfNearestSizeOrNULLPreferringSize:(CGSize)a3 withContentsScaleProvider:(id)a4;
- (CGImage)p_createResampledImageWithReciprocalScale:(unint64_t)a3;
- (CGImage)p_newImageFromSource:(CGImageSource *)a3;
- (CGImage)p_newImageOfSize:(CGSize)a3 fromSource:(CGImageSource *)a4;
- (CGImage)p_resampledImageOfReciprocalScale:(unint64_t)a3;
- (CGImageSource)CGImageSource;
- (CGImageSource)p_newCGImageSource;
- (CGImageSource)p_newCGImageSourceForTemporaryUse;
- (CGImageSource)p_newImageOfSize:(CGSize)a3;
- (CGSize)dpiAdjustedNaturalSize;
- (CGSize)naturalSize;
- (int64_t)orientation;
- (int64_t)p_reciprocalScaleForImageSize:(CGSize)a3;
- (unint64_t)i_flushableMemoryEstimate;
- (unint64_t)imageDPI;
- (unint64_t)imageGamut;
- (unint64_t)validationStatus;
- (void)dealloc;
- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4;
- (void)flush;
- (void)i_commonInit;
- (void)p_configureOrientationAndSizeFromImageSource:(CGImageSource *)a3 andImage:(CGImage *)a4;
- (void)p_loadFullSizedImageIfNecessary;
- (void)p_loadLargestSafeImageIfNecessary;
- (void)p_loadSourceRefIfNecessary;
- (void)p_updateEstimatedSize;
@end

@implementation CRLBitmapImageProvider

+ (CGImage)CGImageForImageData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = +[CRLImageProviderPool sharedPool];
  v6 = [v5 temporaryProviderForAsset:v3 shouldValidate:1];

  v7 = sub_1002469D0(v4, v6);

  v8 = (CGImage *)[v7 CGImageForNaturalSize];
  return v8;
}

+ (id)CRLImageForImageData:(id)a3
{
  id v3 = [a1 CGImageForImageData:a3];
  if (v3)
  {
    id v3 = +[CRLImage imageWithCGImage:v3];
  }

  return v3;
}

+ (CGSize)naturalSizeForImageData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = +[CRLImageProviderPool sharedPool];
  v6 = [v5 temporaryProviderForAsset:v3 shouldValidate:1];

  v7 = sub_1002469D0(v4, v6);

  if (v7)
  {
    [v7 naturalSize];
    CGFloat width = v8;
    CGFloat height = v10;
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v12 = width;
  double v13 = height;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (void)i_commonInit
{
  v12.receiver = self;
  v12.super_class = (Class)CRLBitmapImageProvider;
  [(CRLImageProvider *)&v12 i_commonInit];
  if (self->mImageQueue)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD3D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069148();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD3F8);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010690A0(v3);
    }
    uint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider i_commonInit]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:100 isFatal:0 description:"called i_common init twice on same object!"];
  }
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.freeform.CRLBitmapImageProvider", 0);
  mImageQueue = self->mImageQueue;
  self->mImageQueue = v6;

  double v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  mFlushableContentLock = self->mFlushableContentLock;
  self->mFlushableContentLock = v8;

  double v10 = objc_alloc_init(CRLOnce);
  mCheckIfValidOnce = self->mCheckIfValidOnce;
  self->mCheckIfValidOnce = v10;
}

- (void)dealloc
{
  CGImageRelease(self->mImage);
  CGImageRelease(self->mLargestSafeImage);
  mImageSource = self->mImageSource;
  if (mImageSource) {
    CFRelease(mImageSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLBitmapImageProvider;
  [(CRLImageProvider *)&v4 dealloc];
}

- (CGSize)naturalSize
{
  [(CRLBitmapImageProvider *)self p_loadImageMetadata];
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  objc_super v12 = "";
  mImageQueue = self->mImageQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000405A0;
  v8[3] = &unk_1014CB090;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(mImageQueue, v8);
  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (BOOL)isValid
{
  [(CRLBitmapImageProvider *)self p_loadSourceRefIfNecessary];
  mCheckIfValidOnce = self->mCheckIfValidOnce;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100040650;
  v5[3] = &unk_1014CBBB0;
  v5[4] = self;
  [(CRLOnce *)mCheckIfValidOnce performBlockOnce:v5];
  return self->mIsValid;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (![(CRLBitmapImageProvider *)self isValid])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD478);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069290();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD498);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010690A0(v10);
    }
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider drawImageInContext:rect:]");
    objc_super v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:185 isFatal:0 description:"shouldn't be drawing an invalid image provider"];
  }
  if ([(CRLBitmapImageProvider *)self isValid]) {
    [objc_opt_class() drawImage: -[self CGImageForSize:inContext:orContentsScaleProvider:](self, "CGImageForSize:inContext:orContentsScaleProvider:", a3, 0, width, height) inContext:a3 orientation:[self orientation] x:x y:y width:width height:height];
  }
}

+ (void)drawImage:(CGImage *)a3 inContext:(CGContext *)a4 rect:(CGRect)a5 orientation:(int64_t)a6
{
  if (a3)
  {
    CGFloat height = a5.size.height;
    CGFloat width = a5.size.width;
    CGFloat y = a5.origin.y;
    CGFloat x = a5.origin.x;
    CGContextSaveGState(a4);
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v16);
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGFloat MaxY = CGRectGetMaxY(v17);
    CGContextTranslateCTM(a4, 0.0, MinY + MaxY);
    CGContextScaleCTM(a4, 1.0, -1.0);
    sub_10043A6BC((CGAffineTransform *)a6, 1, (uint64_t)&v15, x, y, width, height);
    CGContextConcatCTM(a4, &v15);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGContextDrawImage(a4, v18, a3);
    CGContextRestoreGState(a4);
  }
}

- (CGImage)cachedCGImageOfNearestSizeOrNULLPreferringSize:(CGSize)a3 withContentsScaleProvider:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ([(CRLBitmapImageProvider *)self isValid])
  {
    if (v7)
    {
      [v7 contentsScale];
      double width = sub_1000646A4(width, height, v8);
      double height = v9;
      if (qword_101719A48 != -1) {
        dispatch_once(&qword_101719A48, &stru_1014CD538);
      }
      double v10 = off_10166A158;
      if (os_log_type_enabled((os_log_t)off_10166A158, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v10;
        [v7 contentsScale];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%p scaling image for contentsScaleProvider by %f", buf, 0x16u);
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CD4F8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010693C8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CD518);
      }
      CGRect v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101069318(v17);
      }
      CGRect v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider cachedCGImageOfNearestSizeOrNULLPreferringSize:withContentsScaleProvider:]");
      v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 230, 0, "invalid nil value for '%{public}s'", "contentsScaleProvider");
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v26 = 0;
    if (width == 0.0) {
      int64_t v20 = 0;
    }
    else {
      int64_t v20 = -[CRLBitmapImageProvider p_reciprocalScaleForImageSize:](self, "p_reciprocalScaleForImageSize:", width, height);
    }
    mImageQueue = self->mImageQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100041500;
    block[3] = &unk_1014CC6B8;
    block[5] = buf;
    block[6] = v20;
    block[4] = self;
    dispatch_sync(mImageQueue, block);
    v22 = *(const void **)(*(void *)&buf[8] + 24);
    if (v22)
    {
      CFAutorelease(v22);
      CGRect v16 = *(CGImage **)(*(void *)&buf[8] + 24);
    }
    else
    {
      CGRect v16 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD4B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069520();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD4D8);
    }
    uint64_t v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069470(v13);
    }
    uint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider cachedCGImageOfNearestSizeOrNULLPreferringSize:withContentsScaleProvider:]");
    CGAffineTransform v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:226 isFatal:0 description:"Invalid image provider trying to render an image at natural size"];

    CGRect v16 = 0;
  }

  return v16;
}

- (CGImage)CGImageOfAnySize
{
  id v3 = +[CALayer layer];
  [v3 setContentsScale:1.0];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v14 = -[CRLBitmapImageProvider cachedCGImageOfNearestSizeOrNULLPreferringSize:withContentsScaleProvider:](self, "cachedCGImageOfNearestSizeOrNULLPreferringSize:withContentsScaleProvider:", v3, CGSizeZero.width, CGSizeZero.height);
  double v4 = (CGImage *)v12[3];
  if (!v4)
  {
    [(CRLBitmapImageProvider *)self naturalSize];
    if (v6 > 100.0 || v5 > 100.0)
    {
      double v4 = -[CRLBitmapImageProvider p_resampledImageOfReciprocalScale:](self, "p_resampledImageOfReciprocalScale:", (unint64_t)(double)-[CRLBitmapImageProvider p_reciprocalScaleForImageSize:](self, "p_reciprocalScaleForImageSize:", 100.0, 100.0));
      v12[3] = (uint64_t)v4;
    }
    else
    {
      [(CRLBitmapImageProvider *)self p_loadFullSizedImageIfNecessary];
      mImageQueue = self->mImageQueue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10004190C;
      v10[3] = &unk_1014CB090;
      v10[4] = self;
      v10[5] = &v11;
      dispatch_sync(mImageQueue, v10);
      double v8 = (const void *)v12[3];
      if (v8) {
        CFAutorelease(v8);
      }
      double v4 = (CGImage *)v12[3];
    }
  }
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (CGImage)CGImageOfLargestSafeSize
{
  if ([(CRLBitmapImageProvider *)self isValid])
  {
    int v3 = CRLWPShapeLayout.columnsAreLeftToRight.getter();
    [(CRLBitmapImageProvider *)self naturalSize];
    if (v3 && v4 * v5 > (double)sub_1004549A8())
    {
      uint64_t v17 = 0;
      CGRect v18 = &v17;
      uint64_t v19 = 0x2020000000;
      uint64_t v20 = 0;
      [(CRLBitmapImageProvider *)self p_loadLargestSafeImageIfNecessary];
      mImageQueue = self->mImageQueue;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100041CB8;
      v15[3] = &unk_1014CB090;
      v15[4] = self;
      v15[5] = &v17;
      dispatch_sync(mImageQueue, v15);
      id v7 = (const void *)v18[3];
      if (v7) {
        CFAutorelease(v7);
      }
    }
    else
    {
      uint64_t v17 = 0;
      CGRect v18 = &v17;
      uint64_t v19 = 0x2020000000;
      uint64_t v20 = 0;
      [(CRLBitmapImageProvider *)self p_loadFullSizedImageIfNecessary];
      uint64_t v12 = self->mImageQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100041C90;
      block[3] = &unk_1014CB090;
      block[4] = self;
      block[5] = &v17;
      dispatch_sync(v12, block);
      uint64_t v13 = (const void *)v18[3];
      if (v13) {
        CFAutorelease(v13);
      }
    }
    uint64_t v11 = (CGImage *)v18[3];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD558);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069658();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD578);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010695A8(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider CGImageOfLargestSafeSize]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:320 isFatal:0 description:"Trying to get an image out of an invalid image provider."];

    return 0;
  }
  return v11;
}

- (CGImage)CGImageForNaturalSize
{
  if ([(CRLBitmapImageProvider *)self isValid])
  {
    [(CRLBitmapImageProvider *)self p_loadFullSizedImageIfNecessary];
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    mImageQueue = self->mImageQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100041F80;
    v10[3] = &unk_1014CB090;
    v10[4] = self;
    v10[5] = &v11;
    dispatch_sync(mImageQueue, v10);
    double v4 = (const void *)v12[3];
    if (v4)
    {
      CFAutorelease(v4);
      double v5 = (CGImage *)v12[3];
    }
    else
    {
      double v5 = 0;
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD598);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069790();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD5B8);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010696E0(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider CGImageForNaturalSize]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:360 isFatal:0 description:"Invalid image provider trying to render an image at natural size"];

    return 0;
  }
  return v5;
}

- (CGImage)CGImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orContentsScaleProvider:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  if ([(CRLBitmapImageProvider *)self isValid])
  {
    [(CRLBitmapImageProvider *)self p_loadImageMetadata];
    if (a4)
    {
      if (v9)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CD618);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010698C8();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CD638);
        }
        double v10 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101069818(v10);
        }
        uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider CGImageForSize:inContext:orContentsScaleProvider:]");
        uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"];
        +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:390 isFatal:0 description:"using context to determine requested image size. contents scale provider should be nil"];
      }
      if ((sub_100458174((uint64_t)a4) & 1) != 0 || sub_1004583EC((uint64_t)a4))
      {
        uint64_t v13 = [(CRLBitmapImageProvider *)self CGImageOfLargestSafeSize];
        goto LABEL_50;
      }
      double v22 = sub_100458664((uint64_t)a4);
      double v23 = sub_1000646A4(width, height, v22);
      double v25 = v24;
      CGContextGetCTM(&v55, a4);
      double v26 = sub_10007F808(&v55.a);
      double width = sub_1000646A4(v23, v25, v26);
      double height = v27;
      if (qword_101719A48 != -1) {
        dispatch_once(&qword_101719A48, &stru_1014CD658);
      }
      v28 = off_10166A158;
      if (os_log_type_enabled((os_log_t)off_10166A158, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        double v30 = sub_100458664((uint64_t)a4);
        CGContextGetCTM(&v54, a4);
        double v31 = sub_10007F808(&v54.a);
        double v32 = sub_100458664((uint64_t)a4);
        CGContextGetCTM(&v53, a4);
        double v33 = sub_10007F808(&v53.a);
        *(_DWORD *)buf = 134218752;
        v57 = self;
        __int16 v58 = 2048;
        double v59 = v30 * v31;
        __int16 v60 = 2048;
        double v61 = v32;
        __int16 v62 = 2048;
        double v63 = v33;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%p scaling image for context by %f = %f * %f", buf, 0x2Au);
      }
    }
    else if (v9)
    {
      [v9 contentsScale];
      double width = sub_1000646A4(width, height, v17);
      double height = v18;
      if (qword_101719A48 != -1) {
        dispatch_once(&qword_101719A48, &stru_1014CD678);
      }
      uint64_t v19 = off_10166A158;
      if (os_log_type_enabled((os_log_t)off_10166A158, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = v19;
        [v9 contentsScale];
        *(_DWORD *)buf = 134218240;
        v57 = self;
        __int16 v58 = 2048;
        double v59 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%p scaling image for contentsScaleProvider by %f", buf, 0x16u);
      }
    }
    double v34 = COERCE_DOUBLE((id)-[CRLBitmapImageProvider p_reciprocalScaleForImageSize:](self, "p_reciprocalScaleForImageSize:", width, height));
    if (qword_101719A48 != -1) {
      dispatch_once(&qword_101719A48, &stru_1014CD698);
    }
    v35 = off_10166A158;
    if (os_log_type_enabled((os_log_t)off_10166A158, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      v66.double width = width;
      v66.double height = height;
      NSStringFromCGSize(v66);
      double v37 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      [(CRLBitmapImageProvider *)self naturalSize];
      v38 = NSStringFromCGSize(v67);
      *(_DWORD *)buf = 134218754;
      v57 = self;
      __int16 v58 = 2112;
      double v59 = v37;
      __int16 v60 = 2112;
      double v61 = *(double *)&v38;
      __int16 v62 = 2048;
      double v63 = v34;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%p requesting image of size: %@. Full: %@ scale %zi", buf, 0x2Au);
    }
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    uint64_t v52 = 0;
    if (*(void *)&v34 < 2uLL)
    {
      [(CRLBitmapImageProvider *)self p_loadFullSizedImageIfNecessary];
      mImageQueue = self->mImageQueue;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100042944;
      v48[3] = &unk_1014CB090;
      v48[4] = self;
      v48[5] = &v49;
      dispatch_sync(mImageQueue, v48);
      v41 = (const void *)v50[3];
      if (v41) {
        CFAutorelease(v41);
      }
    }
    else
    {
      v39 = [(CRLBitmapImageProvider *)self p_resampledImageOfReciprocalScale:*(void *)&v34];
      v50[3] = (uint64_t)v39;
    }
    if (qword_101719A50 != -1) {
      dispatch_once(&qword_101719A50, &stru_1014CD6B8);
    }
    v42 = off_10166A160;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_INFO))
    {
      v68.double width = width;
      v68.double height = height;
      NSStringFromCGSize(v68);
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      [(CRLBitmapImageProvider *)self naturalSize];
      NSStringFromCGSize(v69);
      double v44 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (self->mImage) {
        v45 = @"YES";
      }
      else {
        v45 = @"NO";
      }
      v46 = v45;
      *(_DWORD *)buf = 134219010;
      v57 = self;
      __int16 v58 = 2048;
      double v59 = v34;
      __int16 v60 = 2112;
      double v61 = *(double *)&v43;
      __int16 v62 = 2112;
      double v63 = v44;
      __int16 v64 = 2112;
      v65 = v46;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v42, OS_LOG_TYPE_INFO, "provider:%p renderScale:%zu requestedSize:%@ naturalSize:%@ mImageExists:%@", buf, 0x34u);
    }
    uint64_t v13 = (CGImage *)v50[3];
    _Block_object_dispose(&v49, 8);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD5D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069A00();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD5F8);
    }
    uint64_t v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069950(v14);
    }
    CGAffineTransform v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider CGImageForSize:inContext:orContentsScaleProvider:]");
    CGRect v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:381 isFatal:0 description:"Invalid image provider trying to render an image at natural size"];

    uint64_t v13 = 0;
  }
LABEL_50:

  return v13;
}

- (int64_t)p_reciprocalScaleForImageSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [(CRLBitmapImageProvider *)self naturalSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v32 = 0;
  double v33 = (double *)&v32;
  uint64_t v34 = 0x3010000000;
  v35 = "";
  double v36 = v5;
  double v37 = v7;
  uint64_t v26 = 0;
  double v27 = (double *)&v26;
  uint64_t v28 = 0x3010000000;
  v29 = "";
  double v30 = sub_1000646A4(v5, v7, 0.5);
  uint64_t v31 = v9;
  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    unint64_t v10 = sub_1004549A8();
    double v11 = sub_10006727C(v6, v8, (double)v10);
    double v6 = sub_10006538C(v11);
    double v8 = v12;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100042C4C;
  v25[3] = &unk_1014CD6E0;
  *(CGFloat *)&v25[5] = width;
  *(CGFloat *)&v25[6] = height;
  v25[4] = &v26;
  uint64_t v13 = objc_retainBlock(v25);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100042C80;
  v24[3] = &unk_1014CD708;
  v24[4] = &v26;
  uint64_t v14 = objc_retainBlock(v24);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100042CB0;
  v23[3] = &unk_1014CD6E0;
  v23[4] = &v32;
  *(double *)&v23[5] = v6;
  *(double *)&v23[6] = v8;
  CGAffineTransform v15 = objc_retainBlock(v23);
  int64_t v16 = 1;
  uint64_t v17 = 2;
  while (1)
  {
    int64_t v18 = v17;
    if ((((uint64_t (*)(void *))v13[2])(v13) & 1) == 0
      && !((unsigned int (*)(void *))v15[2])(v15))
    {
      break;
    }
    if (!((unsigned int (*)(void *))v14[2])(v14)) {
      break;
    }
    uint64_t v19 = v33;
    uint64_t v20 = v27;
    *((_OWORD *)v33 + 2) = *((_OWORD *)v27 + 2);
    v20[4] = sub_1000646A4(v19[4], v19[5], 0.5);
    *((void *)v20 + 5) = v21;
    uint64_t v17 = 2 * v18;
    int64_t v16 = v18;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v16;
}

- (CGImage)CGImageResampledToSize:(CGSize)a3 lowQuality:(BOOL)a4 assetOwner:(id)a5
{
  BOOL v5 = a4;
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  [(CRLBitmapImageProvider *)self naturalSize];
  double v12 = v11;
  if (width >= v10)
  {
    if (height >= v11)
    {
      double width = v10;
      if (![(CRLBitmapImageProvider *)self isOpaque])
      {
        double v24 = [(CRLBitmapImageProvider *)self CGImageForNaturalSize];
        goto LABEL_11;
      }
    }
    else
    {
      double width = v10;
    }
  }
  float v13 = width;
  double v14 = ceilf(v13);
  if (height >= v12) {
    double v15 = v12;
  }
  else {
    double v15 = height;
  }
  float v16 = v15;
  double v17 = ceilf(v16);
  int64_t v18 = [(CRLImageProvider *)self imageData];
  uint64_t v19 = [v18 filename];
  uint64_t v20 = [v19 lastPathComponent];
  uint64_t v21 = sub_100454AB4(self, v20, v5 | 0x14, v9, v14, v17);

  id v22 = v18;
  double v23 = v22;
  if (v21)
  {
    double v23 = [v21 synchronouslyCreateReadonlyAsset];
  }
  double v24 = +[CRLBitmapImageProvider CGImageForImageData:v23];

LABEL_11:
  return v24;
}

- (CGImage)p_createResampledImageWithReciprocalScale:(unint64_t)a3
{
  [(CRLBitmapImageProvider *)self naturalSize];
  double v7 = sub_1000646A4(v5, v6, 1.0 / (double)a3);
  double v9 = v8;
  if (qword_101719A48 != -1) {
    dispatch_once(&qword_101719A48, &stru_1014CD728);
  }
  double v10 = off_10166A158;
  if (os_log_type_enabled((os_log_t)off_10166A158, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = v10;
    v23.double width = v7;
    v23.double height = v9;
    double v12 = NSStringFromCGSize(v23);
    int v17 = 134218498;
    int64_t v18 = self;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%p making image of size %@ for scale %zi", (uint8_t *)&v17, 0x20u);
  }
  float v13 = -[CRLBitmapImageProvider p_newImageOfSize:](self, "p_newImageOfSize:", v7, v9);
  if (!v13) {
    return 0;
  }
  double v14 = v13;
  double v15 = [(CRLBitmapImageProvider *)self p_newImageFromSource:v13];
  CFRelease(v14);
  if (v15) {
    CFAutorelease(v15);
  }
  return v15;
}

- (CGImage)p_resampledImageOfReciprocalScale:(unint64_t)a3
{
  uint64_t v22 = 0;
  CGSize v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  double v5 = +[CRLImageProviderPool sharedPool];
  [v5 flushProvidersToFreeMemoryIfNecessaryExcludingProvider:self];

  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000431D8;
  block[3] = &unk_1014CC790;
  block[4] = self;
  block[5] = &v22;
  void block[6] = a3;
  dispatch_sync(mImageQueue, block);
  double v7 = (const void *)v23[3];
  if (!v7 || (CFAutorelease(v7), (double v8 = (CGImage *)v23[3]) == 0))
  {
    double v9 = [(CRLBitmapImageProvider *)self p_createResampledImageWithReciprocalScale:a3];
    v23[3] = (uint64_t)v9;
    if (!v9) {
      goto LABEL_5;
    }
    double v10 = +[CRLImage imageWithCGImage:v9];
    double v11 = self->mImageQueue;
    double v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    float v16 = sub_100043398;
    int v17 = &unk_1014CD770;
    id v19 = v10;
    unint64_t v20 = a3;
    int64_t v18 = self;
    id v12 = v10;
    dispatch_async(v11, &v14);

    double v8 = (CGImage *)v23[3];
    if (!v8)
    {
LABEL_5:
      double v8 = [(CRLBitmapImageProvider *)self CGImageOfLargestSafeSize];
      v23[3] = (uint64_t)v8;
    }
  }
  _Block_object_dispose(&v22, 8);
  return v8;
}

- (int64_t)orientation
{
  [(CRLBitmapImageProvider *)self p_loadImageMetadata];
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  mImageQueue = self->mImageQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100043580;
  v6[3] = &unk_1014CB090;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(mImageQueue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isOpaque
{
  v2 = self;
  [(CRLBitmapImageProvider *)self p_loadImageMetadata];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mImageQueue = v2->mImageQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100043654;
  v5[3] = &unk_1014CB090;
  v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(mImageQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (unint64_t)imageGamut
{
  [(CRLBitmapImageProvider *)self p_loadImageMetadata];
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000437C4;
  block[3] = &unk_1014CB090;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(mImageQueue, block);
  unint64_t v4 = v11[3];
  if (!v4)
  {
    CGColorSpaceRef ColorSpace = CGImageGetColorSpace([(CRLBitmapImageProvider *)self CGImageOfAnySize]);
    uint64_t v6 = self->mImageQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000437E0;
    v8[3] = &unk_1014CC790;
    v8[4] = self;
    v8[5] = &v10;
    void v8[6] = ColorSpace;
    dispatch_sync(v6, v8);
    unint64_t v4 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (unint64_t)imageDPI
{
  if (self->mDPI) {
    return self->mDPI;
  }
  int v3 = [(CRLBitmapImageProvider *)self p_newCGImageSourceForTemporaryUse];
  if (!v3) {
    return self->mDPI;
  }
  unint64_t v4 = v3;
  uint64_t v13 = kCGImageSourceSkipMetadata;
  double v14 = &__kCFBooleanTrue;
  CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(v4, 0, v5);
  CFRelease(v4);
  uint64_t v7 = [(__CFDictionary *)v6 objectForKey:kCGImagePropertyDPIHeight];
  uint64_t v8 = v7;
  if (!v7)
  {
    double v10 = 0.0;
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [v7 doubleValue];
  double v10 = v9;
  if (v6) {
LABEL_5:
  }
    CFRelease(v6);
LABEL_6:
  double v11 = 72.0;
  if (v10 != 0.0) {
    double v11 = v10;
  }
  self->mDPI = llround(v11);

  return self->mDPI;
}

- (CGSize)dpiAdjustedNaturalSize
{
  if ([(CRLBitmapImageProvider *)self p_shouldScaleRetinaImages])
  {
    int v3 = [(CRLImageProvider *)self imageData];
    unint64_t v4 = [v3 filename];

    unint64_t v5 = [(CRLBitmapImageProvider *)self imageDPI];
    double v6 = 0.5;
    if ((double)v5 != 144.0
      && vabdd_f64((double)v5, 144.0) >= fabs(144.0 * 0.000000999999997)
      && (objc_msgSend(v4, "crl_containsSubstring:", @"@2x") & 1) == 0)
    {
      unint64_t v7 = [(CRLBitmapImageProvider *)self imageDPI];
      if ((double)v7 == 216.0
        || vabdd_f64((double)v7, 216.0) < fabs(216.0 * 0.000000999999997)
        || (double v6 = 1.0, objc_msgSend(v4, "crl_containsSubstring:", @"@3x")))
      {
        double v6 = 0.333333333;
      }
    }

    [(CRLBitmapImageProvider *)self naturalSize];
    if (v6 != 1.0 && fabs(v6 + -1.0) >= 0.000000999999997)
    {
      double v10 = sub_1000646A4(v8, v9, v6);
      double v8 = sub_1000674B8(v10);
    }
  }
  else
  {
    [(CRLBitmapImageProvider *)self naturalSize];
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (BOOL)p_shouldScaleRetinaImages
{
  return 1;
}

- (void)flush
{
  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043B94;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(mImageQueue, block);
}

- (BOOL)i_hasFlushableContent
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mFlushableContentLock, 0xFFFFFFFFFFFFFFFFLL);
  BOOL mHasFlushableContent = self->mHasFlushableContent;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mFlushableContentLock);
  return mHasFlushableContent;
}

- (unint64_t)i_flushableMemoryEstimate
{
  return self->mEstimatedSize;
}

- (void)p_updateEstimatedSize
{
  mImage = self->mImage;
  if (mImage)
  {
    size_t BytesPerRow = CGImageGetBytesPerRow(mImage);
    unint64_t v5 = CGImageGetHeight(self->mImage) * BytesPerRow;
  }
  else
  {
    unint64_t v5 = 0;
  }
  mLargestSafeImage = self->mLargestSafeImage;
  if (mLargestSafeImage)
  {
    size_t v7 = CGImageGetBytesPerRow(mLargestSafeImage);
    v5 += CGImageGetHeight(self->mLargestSafeImage) * v7;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v8 = [(NSMutableDictionary *)self->mResampledImages allValues];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (CGImage *)[*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) CGImage];
        size_t v14 = CGImageGetBytesPerRow(v13);
        v5 += CGImageGetHeight(v13) * v14;
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  self->mEstimatedSize = v5;
}

- (void)p_loadFullSizedImageIfNecessary
{
  if (qword_101719A50 != -1) {
    dispatch_once(&qword_101719A50, &stru_1014CD7B0);
  }
  int v3 = off_10166A160;
  if (os_log_type_enabled((os_log_t)off_10166A160, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = v3;
    [(CRLBitmapImageProvider *)self naturalSize];
    unint64_t v5 = NSStringFromCGSize(v13);
    *(_DWORD *)buf = 134218242;
    id v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "provider:%p loading full-sized image if necessary naturalSize:%@ ", buf, 0x16u);
  }
  double v6 = +[CRLImageProviderPool sharedPool];
  [v6 flushProvidersToFreeMemoryIfNecessaryExcludingProvider:self];

  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044124;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(mImageQueue, block);
}

- (void)p_loadLargestSafeImageIfNecessary
{
  [(CRLBitmapImageProvider *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  if (qword_101719A50 != -1) {
    dispatch_once(&qword_101719A50, &stru_1014CD810);
  }
  size_t v7 = off_10166A160;
  if (os_log_type_enabled((os_log_t)off_10166A160, OS_LOG_TYPE_INFO))
  {
    double v8 = v7;
    v21.double width = v4;
    v21.double height = v6;
    id v9 = NSStringFromCGSize(v21);
    *(_DWORD *)buf = 134218242;
    long long v18 = self;
    __int16 v19 = 2112;
    unint64_t v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "provider:%p loading largest safe image if necessary naturalSize:%@ ", buf, 0x16u);
  }
  id v10 = +[CRLImageProviderPool sharedPool];
  [v10 flushProvidersToFreeMemoryIfNecessaryExcludingProvider:self];

  unint64_t v11 = sub_1004549A8();
  double v12 = sub_10006727C(v4, v6, (double)v11);
  double v13 = sub_10006538C(v12);
  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000445D8;
  block[3] = &unk_1014CD898;
  block[4] = self;
  *(double *)&void block[5] = v13;
  void block[6] = v15;
  dispatch_async(mImageQueue, block);
}

- (void)p_loadSourceRefIfNecessary
{
  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044A34;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(mImageQueue, block);
}

- (CGImageSource)p_newCGImageSource
{
  v2 = [(CRLImageProvider *)self imageData];
  double v3 = (CGImageSource *)[v2 newCGImageSource];

  return v3;
}

- (CGImage)p_newImageFromSource:(CGImageSource *)a3
{
  ImageAtIndeCGFloat x = a3;
  if (a3)
  {
    v6[0] = kCGImageSourceSkipMetadata;
    v6[1] = kCGImageSourceShouldCache;
    v7[0] = &__kCFBooleanTrue;
    v7[1] = &__kCFBooleanFalse;
    CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
    ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(ImageAtIndex, 0, v4);
  }
  return ImageAtIndex;
}

- (void)p_configureOrientationAndSizeFromImageSource:(CGImageSource *)a3 andImage:(CGImage *)a4
{
  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    size_t v7 = [(CRLImageProvider *)self imageData];
    int v8 = sub_10045670C(v7, a3);

    if (!v8) {
      return;
    }
  }
  uint64_t v30 = kCGImageSourceSkipMetadata;
  uint64_t v31 = &__kCFBooleanTrue;
  CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(a3, 0, v9);
  if (v10)
  {
    CFDictionaryRef v11 = v10;
    double v12 = [(__CFDictionary *)v10 objectForKey:kCGImagePropertyOrientation];
    unsigned int v13 = [v12 intValue];

    Value = (void *)CFDictionaryGetValue(v11, kCGImagePropertyPixelWidth);
    double Height = 0.0;
    double v16 = 0.0;
    if (Value)
    {
      [Value crl_CGFloatValue];
      double v16 = v17;
    }
    long long v18 = (void *)CFDictionaryGetValue(v11, kCGImagePropertyPixelHeight);
    if (v18)
    {
      [v18 crl_CGFloatValue];
      double Height = v19;
    }
    unint64_t v20 = CFDictionaryGetValue(v11, kCGImagePropertyHasAlpha);
    if (v20) {
      BOOL v21 = CFEqual(v20, kCFBooleanFalse) != 0;
    }
    else {
      BOOL v21 = 1;
    }
    self->mIsOpaque = v21;
    CFRelease(v11);
    if (v16 != 0.0 && Height != 0.0) {
      goto LABEL_21;
    }
  }
  else
  {
    unsigned int v13 = 0;
  }
  if (!a4)
  {
    a4 = [(CRLBitmapImageProvider *)self p_newImageFromSource:a3];
    if (CRLWPShapeLayout.columnsAreLeftToRight.getter()
      && (Width = CGImageGetWidth(a4), unint64_t v23 = CGImageGetHeight(a4) * Width, v23 > sub_1004549A8()))
    {
      if (a4) {
        CFAutorelease(a4);
      }
    }
    else
    {
      mImageQueue = self->mImageQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100044F58;
      block[3] = &unk_1014CC768;
      block[4] = self;
      void block[5] = a4;
      dispatch_async(mImageQueue, block);
    }
  }
  double v16 = (double)CGImageGetWidth(a4);
  double Height = (double)CGImageGetHeight(a4);
LABEL_21:
  if (v13 - 1 > 7) {
    unint64_t v25 = 0;
  }
  else {
    unint64_t v25 = qword_101174F70[v13 - 1];
  }
  self->mOrientation = v25;
  int v26 = sub_10043A9EC(v25);
  if (v26) {
    double v27 = Height;
  }
  else {
    double v27 = v16;
  }
  if (v26) {
    double v28 = v16;
  }
  else {
    double v28 = Height;
  }
  self->mNaturalSize.double width = v27;
  self->mNaturalSize.double height = v28;
}

- (CGImageSource)p_newCGImageSourceForTemporaryUse
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  mImageQueue = self->mImageQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1000450D0;
  v6[3] = &unk_1014CB140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(mImageQueue, v6);
  CFDictionaryRef v4 = (CGImageSource *)v8[3];
  if (!v4)
  {
    CFDictionaryRef v4 = [(CRLBitmapImageProvider *)self p_newCGImageSource];
    v8[3] = (uint64_t)v4;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (CGImage)p_newImageOfSize:(CGSize)a3 fromSource:(CGImageSource *)a4
{
  if (a4)
  {
    v11[0] = kCGImageSourceCreateThumbnailFromImageAlways;
    v11[1] = kCGImageSourceCreateThumbnailWithTransform;
    v12[0] = &__kCFBooleanTrue;
    v12[1] = &__kCFBooleanFalse;
    v11[2] = kCGImageSourceThumbnailMaxPixelSize;
    if (a3.width < a3.height) {
      a3.double width = a3.height;
    }
    double v5 = +[NSNumber numberWithDouble:a3.width];
    v11[3] = kCGImageSourceSkipMetadata;
    v12[2] = v5;
    v12[3] = &__kCFBooleanTrue;
    CFDictionaryRef v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

    ThumbnailAtIndeCGFloat x = CGImageSourceCreateThumbnailAtIndex(a4, 0, v6);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD8B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069B98();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD8D8);
    }
    int v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010690A0(v8);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider p_newImageOfSize:fromSource:]");
    CFDictionaryRef v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v9, 1001, 0, "invalid nil value for '%{public}s'", "sourceRef");

    ThumbnailAtIndeCGFloat x = 0;
  }

  return ThumbnailAtIndex;
}

- (CGImageSource)p_newImageOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CFDictionaryRef v6 = [(CRLBitmapImageProvider *)self p_newCGImageSourceForTemporaryUse];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  int v8 = -[CRLBitmapImageProvider p_newImageOfSize:fromSource:](self, "p_newImageOfSize:fromSource:", v6, width, height);
  CFRelease(v7);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = (__CFData *)objc_alloc_init((Class)NSMutableData);
  uint64_t v10 = [UTTypePNG identifier];

  CFDictionaryRef v11 = CGImageDestinationCreateWithData(v9, v10, 1uLL, 0);
  double v12 = v11;
  if (v11)
  {
    CGImageDestinationAddImage(v11, v8, 0);
    BOOL v13 = CGImageDestinationFinalize(v12);
    CFRelease(v12);
    double v12 = 0;
    if (v13) {
      double v12 = CGImageSourceCreateWithData(v9, 0);
    }
  }

  CGImageRelease(v8);
  return v12;
}

- (CGImageSource)CGImageSource
{
  [(CRLBitmapImageProvider *)self p_loadSourceRefIfNecessary];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  mImageQueue = self->mImageQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1000455B4;
  v7[3] = &unk_1014CB090;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(mImageQueue, v7);
  CFDictionaryRef v4 = (const void *)v9[3];
  if (v4)
  {
    CFAutorelease(v4);
    double v5 = (CGImageSource *)v9[3];
  }
  else
  {
    double v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unint64_t)validationStatus
{
  return self->mValidationStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFlushableContentLock, 0);
  objc_storeStrong((id *)&self->mCheckIfValidOnce, 0);
  objc_storeStrong((id *)&self->mImageQueue, 0);

  objc_storeStrong((id *)&self->mResampledImages, 0);
}

@end