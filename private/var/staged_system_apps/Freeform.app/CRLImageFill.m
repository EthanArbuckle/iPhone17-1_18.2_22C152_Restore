@interface CRLImageFill
- (BOOL)canApplyToRenderable;
- (BOOL)canApplyToRenderableByAddingSubrenderables;
- (BOOL)canCopyData;
- (BOOL)drawsInOneStep;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpaque;
- (BOOL)p_shouldApplyTintedImage;
- (BOOL)shouldBeReappliedToRenderable:(id)a3;
- (CGRect)p_drawnRectForImageSize:(CGSize)a3 destRect:(CGRect)a4 inContext:(CGContext *)a5;
- (CGSize)fillSize;
- (CGSize)p_fillSize;
- (CGSize)p_imageDataNaturalSize;
- (CGSize)p_sizeOfFillImageForDestRect:(CGRect)a3 inContext:(CGContext *)a4;
- (CGSize)renderedImageSizeForObjectSize:(CGSize)a3;
- (CRLColor)p_tintColor;
- (CRLColor)storedReferenceColor;
- (CRLColor)tintColor;
- (CRLImageFill)initWithImageData:(id)a3 technique:(unint64_t)a4 tintColor:(id)a5 size:(CGSize)a6;
- (CRLImageFill)initWithImageData:(id)a3 technique:(unint64_t)a4 tintColor:(id)a5 size:(CGSize)a6 referenceColor:(id)a7;
- (_TtC8Freeform8CRLAsset)imageData;
- (_TtC8Freeform8CRLAsset)p_imageData;
- (double)scale;
- (id)copyWithNewImageData:(id)a3;
- (id)initForUnarchiving;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)p_cachedImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orContentsScaleProvider:(id)a5;
- (id)p_calculateReferenceColor;
- (id)p_halfSizeCachedImage;
- (id)p_quarterSizeCachedImage;
- (id)p_standardSizeCachedImage;
- (id)p_tintedImageWithScale:(double)a3;
- (id)p_validatedImageProvider;
- (id)referenceColor;
- (int64_t)fillType;
- (unint64_t)hash;
- (unint64_t)p_technique;
- (unint64_t)technique;
- (void)applyToRenderable:(id)a3 withScale:(double)a4;
- (void)dealloc;
- (void)drawFillInContext:(CGContext *)a3 rect:(CGRect)a4 clippingToPath:(CGPath *)a5;
- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)i_commonInit;
- (void)i_commonSetup;
- (void)i_setStoredReferenceColor:(id)a3;
- (void)i_updateStoredReferenceColorIfNeeded;
- (void)p_clearTintedImageCache;
- (void)p_drawBitmapImage:(CGImage *)a3 withOrientation:(int64_t)a4 inContext:(CGContext *)a5 bounds:(CGRect)a6;
- (void)p_drawPDFWithProvider:(id)a3 inContext:(CGContext *)a4 bounds:(CGRect)a5;
- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4 rectForFill:(CGRect)a5;
- (void)p_setFillSize:(CGSize)a3;
- (void)p_setImageData:(id)a3;
- (void)p_setTechnique:(unint64_t)a3;
- (void)p_setTintColor:(id)a3;
- (void)p_updateCachedReferenceColorIfNeeded;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6;
- (void)setTechnique:(unint64_t)a3;
@end

@implementation CRLImageFill

- (CRLImageFill)initWithImageData:(id)a3 technique:(unint64_t)a4 tintColor:(id)a5 size:(CGSize)a6 referenceColor:(id)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  if (a4 >= 5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2160);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101072524();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2180);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill initWithImageData:technique:tintColor:size:referenceColor:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 132, 0, "Invalid image fill technique: %zu Defaulting to natural size.", a4);

    a4 = 0;
  }
  v29.receiver = self;
  v29.super_class = (Class)CRLImageFill;
  v20 = [(CRLImageFill *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->mImageData, a3);
    v21->mTechnique = a4;
    v22 = (CRLColor *)[v15 copy];
    mTintColor = v21->mTintColor;
    v21->mTintColor = v22;

    v24 = (CRLColor *)[v16 copy];
    mReferenceColor = v21->mReferenceColor;
    v21->mReferenceColor = v24;

    v21->mFillSize.CGFloat width = width;
    v21->mFillSize.CGFloat height = height;
    [(CRLImageFill *)v21 fillSize];
    v21->mFillSize.CGFloat width = v26;
    v21->mFillSize.CGFloat height = v27;
    [(CRLImageFill *)v21 i_commonInit];
  }

  return v21;
}

- (CRLImageFill)initWithImageData:(id)a3 technique:(unint64_t)a4 tintColor:(id)a5 size:(CGSize)a6
{
  return -[CRLImageFill initWithImageData:technique:tintColor:size:referenceColor:](self, "initWithImageData:technique:tintColor:size:referenceColor:", a3, a4, a5, 0, a6.width, a6.height);
}

- (id)initForUnarchiving
{
  v3.receiver = self;
  v3.super_class = (Class)CRLImageFill;
  return [(CRLImageFill *)&v3 init];
}

- (void)i_commonSetup
{
  objc_super v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.freeform.drawing.fills.image", 0);
  mTempRenderLock = self->mTempRenderLock;
  self->mTempRenderLock = v3;

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B1B0C;
  v15[3] = &unk_1014D21A8;
  objc_copyWeak(&v16, &location);
  v5 = +[CRLImageFillCachedImage cachedImageWithHandler:v15];
  mStandardSizeTintedImage = self->mStandardSizeTintedImage;
  self->mStandardSizeTintedImage = v5;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B1B5C;
  v13[3] = &unk_1014D21A8;
  objc_copyWeak(&v14, &location);
  v7 = +[CRLImageFillCachedImage cachedImageWithHandler:v13];
  mHalfSizeTintedImage = self->mHalfSizeTintedImage;
  self->mHalfSizeTintedImage = v7;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B1BAC;
  v11[3] = &unk_1014D21A8;
  objc_copyWeak(&v12, &location);
  v9 = +[CRLImageFillCachedImage cachedImageWithHandler:v11];
  mQuarterSizeTintedImage = self->mQuarterSizeTintedImage;
  self->mQuarterSizeTintedImage = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)i_commonInit
{
  [(CRLImageFill *)self i_commonSetup];

  [(CRLImageFill *)self i_updateStoredReferenceColorIfNeeded];
}

- (void)dealloc
{
  if (self->mImageData && self->mHasIndicatedInterestInProvider)
  {
    objc_super v3 = +[CRLImageProviderPool sharedPool];
    [v3 removeInterestInProviderForAsset:self->mImageData];
  }
  CGImageRelease(self->mTempRenderCopy);
  v4.receiver = self;
  v4.super_class = (Class)CRLImageFill;
  [(CRLImageFill *)&v4 dealloc];
}

- (void)p_clearTintedImageCache
{
  [(CRLImageFillCachedImage *)self->mStandardSizeTintedImage flush];
  [(CRLImageFillCachedImage *)self->mHalfSizeTintedImage flush];
  mQuarterSizeTintedImage = self->mQuarterSizeTintedImage;

  [(CRLImageFillCachedImage *)mQuarterSizeTintedImage flush];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[CRLMutableImageFill allocWithZone:a3];
  mImageData = self->mImageData;
  unint64_t mTechnique = self->mTechnique;
  mTintColor = self->mTintColor;
  [(CRLImageFill *)self fillSize];
  mReferenceColor = self->mReferenceColor;

  return -[CRLImageFill initWithImageData:technique:tintColor:size:referenceColor:](v4, "initWithImageData:technique:tintColor:size:referenceColor:", mImageData, mTechnique, mTintColor, mReferenceColor);
}

- (_TtC8Freeform8CRLAsset)p_imageData
{
  return self->mImageData;
}

- (void)p_setImageData:(id)a3
{
}

- (unint64_t)p_technique
{
  return self->mTechnique;
}

- (void)p_setTechnique:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 >= 5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D21C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010725B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D21E8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_setTechnique:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 230, 0, "Invalid image fill technique: %zu Defaulting to natural size.", v3);

    unint64_t v3 = 0;
  }
  self->unint64_t mTechnique = v3;
}

- (CRLColor)p_tintColor
{
  return self->mTintColor;
}

- (void)p_setTintColor:(id)a3
{
}

- (CGSize)p_fillSize
{
  double width = self->mFillSize.width;
  double height = self->mFillSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)p_setFillSize:(CGSize)a3
{
  self->mFillSize = a3;
}

- (id)copyWithNewImageData:(id)a3
{
  id v4 = a3;
  if ((id)[(CRLImageFill *)self technique] == (id)2)
  {
    [(CRLImageFill *)self fillSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    v9 = +[CRLImageProviderPool sharedPool];
    v10 = [v9 providerForAsset:v4 shouldValidate:1];

    [v10 naturalSize];
    double v6 = v11;
    double v8 = v12;
  }
  v13 = [CRLImageFill alloc];
  unint64_t v14 = [(CRLImageFill *)self technique];
  id v15 = [(CRLImageFill *)self tintColor];
  id v16 = -[CRLImageFill initWithImageData:technique:tintColor:size:](v13, "initWithImageData:technique:tintColor:size:", v4, v14, v15, v6, v8);

  return v16;
}

- (BOOL)canCopyData
{
  v2 = [(CRLImageFill *)self imageData];
  char v3 = [v2 needsDownload] ^ 1;

  return v3;
}

- (CGSize)p_imageDataNaturalSize
{
  v2 = [(CRLImageFill *)self p_validatedImageProvider];
  [v2 naturalSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (double)scale
{
  [(CRLImageFill *)self p_imageDataNaturalSize];
  if (v4 == 0.0) {
    return 1.0;
  }
  double v5 = v3;
  if (v3 == 0.0) {
    return 1.0;
  }
  double v6 = v4;
  [(CRLImageFill *)self fillSize];
  double v8 = v7 / v5;
  [(CRLImageFill *)self fillSize];
  return fmin(v8, v9 / v6);
}

- (CGSize)fillSize
{
  double width = self->mFillSize.width;
  double height = self->mFillSize.height;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    double v5 = [(CRLImageFill *)self p_validatedImageProvider];
    [v5 dpiAdjustedNaturalSize];
    double width = v6;
    double height = v7;
  }
  double v8 = width;
  double v9 = height;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (BOOL)isOpaque
{
  double v3 = [(CRLImageFill *)self p_validatedImageProvider];
  uint64_t v4 = objc_opt_class();
  double v5 = sub_1002469D0(v4, v3);
  double v6 = [(CRLImageFill *)self tintColor];
  if (v6)
  {
    double v7 = [(CRLImageFill *)self tintColor];
    [v7 alphaComponent];
    BOOL v9 = v8 == 1.0;
  }
  else
  {
    BOOL v9 = 0;
  }

  char v10 = [v5 isOpaque] | v9;
  return v10;
}

- (void)i_setStoredReferenceColor:(id)a3
{
  uint64_t v4 = (CRLColor *)[a3 copy];
  mReferenceColor = self->mReferenceColor;
  self->mReferenceColor = v4;
}

- (id)referenceColor
{
  double v3 = [(CRLImageFill *)self storedReferenceColor];
  if (!v3)
  {
    [(CRLImageFill *)self p_updateCachedReferenceColorIfNeeded];
    double v3 = self->mCachedReferenceColor;
  }

  return v3;
}

- (CRLColor)storedReferenceColor
{
  return self->mReferenceColor;
}

- (id)p_calculateReferenceColor
{
  if (self->mShouldSkipFurtherAttemptsToCalculateReferenceColor)
  {
    v2 = 0;
    goto LABEL_50;
  }
  uint64_t v4 = [(CRLImageFill *)self p_validatedImageProvider];
  if ([v4 isError])
  {
    double v5 = [(CRLImageFill *)self p_imageData];
    double v6 = [v5 fallbackColor];

    double v7 = [(CRLImageFill *)self p_imageData];
    double v8 = v7;
    if (!v6)
    {
      if (v7)
      {
        CGFloat v26 = [(CRLImageFill *)self p_imageData];
        self->mShouldSkipFurtherAttemptsToCalculateReferenceColor = [v26 needsDownload] ^ 1;
      }
      else
      {
        self->mShouldSkipFurtherAttemptsToCalculateReferenceColor = 0;
      }

      v2 = 0;
      goto LABEL_49;
    }
    BOOL v9 = [v7 fallbackColor];

    char v10 = [(CRLImageFill *)self tintColor];
    double v11 = v10;
    if (v10)
    {
      id v12 = [v10 colorByCompositingSourceOverDestinationColor:v9];
    }
    else
    {
      id v12 = v9;
    }
    v2 = v12;
  }
  else
  {
    [(CRLImageFill *)self fillSize];
    double v14 = v13;
    double v16 = v15;
    BOOL v17 = sub_100064EF4(v13, v15);
    BOOL v18 = v17;
    if (v17)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2208);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101072774();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2228);
      }
      v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v19);
      }
      v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_calculateReferenceColor]");
      v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
      +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:338 isFatal:0 description:"Non-error provider has zero size."];
    }
    v2 = +[CRLColor clearColor];
    if (v18) {
      goto LABEL_49;
    }
    v22 = sub_100455AA8(3, 1.0, 1.0);
    if (v22)
    {
      v23 = v22;
      CGMutablePathRef Mutable = CGPathCreateMutable();
      if (Mutable)
      {
        v25 = Mutable;
        v36.origin.x = sub_100064070();
        CGPathAddRect(v25, 0, v36);
        CGContextScaleCTM(v23, 1.0 / v14, 1.0 / v16);
        [(CRLImageFill *)self paintPath:v25 inContext:v23];
        CGPathRelease(v25);
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D2288);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010726E0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D22A8);
        }
        objc_super v29 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v29);
        }
        v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_calculateReferenceColor]");
        v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 347, 0, "invalid nil value for '%{public}s'", "path");
      }
      Data = CGBitmapContextGetData(v23);
      if (Data)
      {
        uint64_t v33 = +[CRLColor colorWithRed:(double)BYTE2(*Data) / 255.0 green:(double)BYTE1(*Data) / 255.0 blue:(double)*Data / 255.0 alpha:1.0];

        v2 = (void *)v33;
      }
      CGContextRelease(v23);
      goto LABEL_49;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2248);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107264C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2268);
    }
    CGFloat v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v27);
    }
    BOOL v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_calculateReferenceColor]");
    v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v28, 344, 0, "invalid nil value for '%{public}s'", "smallContext");
  }
LABEL_49:

LABEL_50:

  return v2;
}

- (void)i_updateStoredReferenceColorIfNeeded
{
  if (!self->mReferenceColor)
  {
    double v3 = [(CRLImageFill *)self p_calculateReferenceColor];
    mReferenceColor = self->mReferenceColor;
    self->mReferenceColor = v3;
  }
}

- (void)p_updateCachedReferenceColorIfNeeded
{
  if (!self->mCachedReferenceColor)
  {
    obj = self;
    objc_sync_enter(obj);
    if (!self->mCachedReferenceColor)
    {
      double v3 = [(CRLImageFill *)obj p_calculateReferenceColor];
      mCachedReferenceColor = self->mCachedReferenceColor;
      self->mCachedReferenceColor = v3;
    }
    objc_sync_exit(obj);
  }
}

- (unint64_t)hash
{
  return [(CRLAsset *)self->mImageData hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CRLImageFill *)a3;
  if (v4 == self)
  {
    BOOL v19 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = sub_1002469D0(v5, v4);
    if (v6)
    {
      double v7 = (void *)v6;
      uint64_t v8 = [(CRLImageFill *)self imageData];
      uint64_t v9 = [v7 imageData];
      if ((!(v8 | v9) || [(id)v8 isEqual:v9])
        && (id v10 = -[CRLImageFill technique](self, "technique"), v10 == [v7 technique]))
      {
        uint64_t v11 = [(CRLImageFill *)self tintColor];
        uint64_t v12 = [v7 tintColor];
        if (v11 | v12 && ![(id)v11 isEqual:v12])
        {
          BOOL v19 = 0;
        }
        else
        {
          [(CRLImageFill *)self fillSize];
          double v14 = v13;
          double v16 = v15;
          [v7 fillSize];
          BOOL v19 = sub_100064084(v14, v16, v17, v18);
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }

  return v19;
}

- (BOOL)drawsInOneStep
{
  if (self->mTintColor)
  {
    char isKindOfClass = 1;
  }
  else
  {
    uint64_t v4 = [(CRLImageFill *)self p_validatedImageProvider];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & (self->mTechnique != 2);
}

- (BOOL)canApplyToRenderable
{
  if (self->mTintColor || (self->mTechnique | 2) == 2) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CRLImageFill *)self p_validatedImageProvider];
  double v7 = sub_1002469D0(v5, v6);

  if (v7) {
    BOOL v3 = [v7 orientation] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)canApplyToRenderableByAddingSubrenderables
{
  if (self->mTintColor || self->mTechnique == 2) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CRLImageFill *)self p_validatedImageProvider];
  double v7 = sub_1002469D0(v5, v6);

  if (v7) {
    BOOL v3 = [v7 orientation] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (int64_t)fillType
{
  return 2;
}

- (BOOL)p_shouldApplyTintedImage
{
  BOOL v3 = [(CRLImageFill *)self p_standardSizeCachedImage];
  if (v3)
  {
    uint64_t v4 = [(CRLImageFill *)self tintColor];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldBeReappliedToRenderable:(id)a3
{
  id v4 = a3;
  if (self->mTechnique)
  {
    if ([(CRLImageFill *)self p_shouldApplyTintedImage])
    {
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v6 = objc_opt_class();
      double v7 = [(CRLImageFill *)self p_validatedImageProvider];
      uint64_t v8 = sub_1002469D0(v6, v7);

      [v4 bounds];
      id v11 = [v8 CGImageForSize:0 inContext:v4 orContentsScaleProvider:v9, v10];
      id v12 = [v4 contents];
      BOOL v5 = v12 != v11;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)p_cachedImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orContentsScaleProvider:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  double v10 = v9;
  if (a4)
  {
    if (v9)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D22C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010727FC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D22E8);
      }
      id v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_cachedImageForSize:inContext:orContentsScaleProvider:]");
      double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:483 isFatal:0 description:"using context to determine requested image size. contentsScaleProvider should be nil"];
    }
    if ((sub_100458174((uint64_t)a4) & 1) != 0 || sub_1004583EC((uint64_t)a4))
    {
LABEL_26:
      uint64_t v27 = [(CRLImageFill *)self p_standardSizeCachedImage];
      goto LABEL_28;
    }
    double v14 = sub_100458664((uint64_t)a4);
    double width = sub_1000646A4(width, height, v14);
    double height = v15;
    CGContextGetCTM(&v30, a4);
    double v16 = sub_10007F808(&v30.a);
  }
  else
  {
    if (!v9) {
      goto LABEL_18;
    }
    [v9 contentsScale];
  }
  double width = sub_1000646A4(width, height, v16);
  double height = v17;
LABEL_18:
  [(CRLImageFill *)self fillSize];
  double v19 = v18;
  double v21 = v20;
  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    unint64_t v22 = sub_1004549A8();
    double v23 = sub_10006727C(v19, v21, (double)v22);
    double v19 = sub_10006538C(v23);
    double v21 = v24;
  }
  if (width <= sub_1000646A4(v19, v21, 0.25) && height <= v25)
  {
    uint64_t v27 = [(CRLImageFill *)self p_quarterSizeCachedImage];
    goto LABEL_28;
  }
  if (width > sub_1000646A4(v19, v21, 0.5)) {
    goto LABEL_26;
  }
  uint64_t v27 = [(CRLImageFill *)self p_halfSizeCachedImage];
LABEL_28:
  v28 = (void *)v27;

  return v28;
}

- (void)applyToRenderable:(id)a3 withScale:(double)a4
{
  id v6 = a3;
  if (![(CRLImageFill *)self canApplyToRenderable]
    && ![(CRLImageFill *)self canApplyToRenderableByAddingSubrenderables])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2308);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107290C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2328);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill applyToRenderable:withScale:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:517 isFatal:0 description:"Applying image fill with unsupported properties to CRLCanvasRenderable"];
  }
  uint64_t v10 = objc_opt_class();
  id v11 = [(CRLImageFill *)self p_validatedImageProvider];
  id v12 = sub_1002469D0(v10, v11);

  LODWORD(v11) = [(CRLImageFill *)self p_shouldApplyTintedImage];
  [v6 bounds];
  if (v11)
  {
    double v15 = -[CRLImageFill p_cachedImageForSize:inContext:orContentsScaleProvider:](self, "p_cachedImageForSize:inContext:orContentsScaleProvider:", 0, v6, v13, v14);
    double v16 = [v15 image];
    id v17 = [v16 CGImage];
  }
  else
  {
    id v17 = [v12 CGImageForSize:0 inContext:v6 orContentsScaleProvider:v13, v14];
  }
  id v18 = v17;
  double v19 = [v6 subrenderables];
  id v20 = [v19 count];

  if (v20)
  {
    double v21 = [v6 subrenderables];
    uint64_t v22 = (uint64_t)[v21 indexOfObjectPassingTest:&stru_1014D2368];
  }
  else
  {
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  }
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  switch(self->mTechnique)
  {
    case 0uLL:
      double v25 = kCAGravityResize;
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        CGFloat v26 = +[CRLCanvasRenderable renderable];
        uint64_t v27 = +[CRLCanvasRenderable renderable];
        [v26 addSubrenderable:v27];
      }
      else
      {
        v52 = [v6 subrenderables];
        CGFloat v26 = [v52 objectAtIndex:v22];

        v53 = [v26 subrenderables];
        uint64_t v27 = [v53 lastObject];
      }
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      [v6 bounds];
      [v26 setPosition:sub_100065738(v54, v55, v56, v57)];
      [v6 bounds];
      [v26 setBounds:];
      [v26 setMasksToBounds:1];
      [v26 setEdgeAntialiasingMask:1];
      [v26 bounds];
      double v62 = sub_100065738(v58, v59, v60, v61);
      double v64 = v63;
      [(CRLImageFill *)self fillSize];
      double v66 = sub_10006402C(v62, v64, v65);
      CGFloat v68 = v67;
      CGFloat v70 = v69;
      CGFloat v72 = v71;
      [v6 contentsScale];
      double v74 = sub_100067584(v66, v68, v70, v72, v73 * a4);
      CGFloat v76 = v75;
      CGFloat v78 = v77;
      CGFloat v80 = v79;
      [v27 setContents:v18];
      [v27 setPosition:sub_100065738(v74, v76, v78, v80)];
      [v27 setBounds:sub_100064070()];
      [v6 contentsScale];
      [v27 setContentsScale:];
      CGAffineTransformMakeScale(&v87, a4, a4);
      CGAffineTransform v86 = v87;
      [v27 setAffineTransform:&v86];
      v81 = [v6 delegate];
      [v27 setDelegate:v81];

      [v27 setEdgeAntialiasingMask:0];
      +[CATransaction commit];

      id v18 = 0;
      goto LABEL_36;
    case 1uLL:
      goto LABEL_30;
    case 3uLL:
      double v25 = kCAGravityResizeAspectFill;
      [(CRLImageFill *)self fillSize];
      double v33 = v32;
      double v35 = v34;
      [v6 bounds];
      double v37 = v36;
      double v39 = v38;
      double v40 = sub_100064070();
      double v44 = sub_1000672D8(1, v33, v35, v40, v41, v42, v43);
      double v46 = 1.0 / v45;
      double v48 = 1.0 / v47;
      v91.origin.double x = -(v44 * v46);
      v91.origin.double y = -(v49 * v48);
      v91.size.double width = v37 * v46;
      v91.size.double height = v39 * v48;
      v88.size.double width = 1.0;
      v88.size.double height = 1.0;
      v88.origin.double x = CGPointZero.x;
      v88.origin.double y = y;
      CGRect v89 = CGRectIntersection(v88, v91);
      double x = v89.origin.x;
      double y = v89.origin.y;
      double width = v89.size.width;
      double height = v89.size.height;
      CGFloat v26 = 0;
      goto LABEL_37;
    case 4uLL:
      v31 = (id *)&kCAGravityResizeAspect;
      goto LABEL_33;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2388);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101072884();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D23A8);
      }
      v28 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v28);
      }
      objc_super v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill applyToRenderable:withScale:]");
      CGAffineTransform v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
      +[CRLAssertionHandler handleFailureInFunction:v29 file:v30 lineNumber:608 isFatal:0 description:"bogus fill technique to apply to renderable"];

LABEL_30:
      v31 = (id *)&kCAGravityResize;
LABEL_33:
      double v25 = (NSString *)*v31;
      CGFloat v26 = 0;
LABEL_36:
      double height = 1.0;
      double width = 1.0;
LABEL_37:
      id v82 = [v6 contents];

      if (v82 != v18) {
        [v6 setContents:v18];
      }
      v83 = [v6 contentsGravity];

      if (v83 != v25) {
        [v6 setContentsGravity:v25];
      }
      [v6 contentsRect];
      v92.origin.double x = x;
      v92.origin.double y = y;
      v92.size.double width = width;
      v92.size.double height = height;
      if (!CGRectEqualToRect(v90, v92)) {
        [v6 setContentsRect:x, y, width, height];
      }
      if ([v6 backgroundColor]) {
        [v6 setBackgroundColor:0];
      }
      if (v26 && v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v26 setName:@"CRLImageFillSublayer"];
        [v6 addSubrenderable:v26];
      }
      else if (!v26 && v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v84 = [v6 subrenderables];
        v85 = [v84 objectAtIndex:v22];
        [v85 removeFromSuperlayer];
      }
      return;
  }
}

- (CGSize)renderedImageSizeForObjectSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  switch([(CRLImageFill *)self technique])
  {
    case 0uLL:
    case 2uLL:
      [(CRLImageFill *)self fillSize];
      goto LABEL_4;
    case 1uLL:
      break;
    case 3uLL:
    case 4uLL:
      [(CRLImageFill *)self fillSize];
      double v6 = sub_10006729C((id)[(CRLImageFill *)self technique] == (id)3, v8, v9, width, height);
LABEL_4:
      double width = v6;
      double height = v7;
      break;
    default:
      double height = 0.0;
      double width = 0.0;
      break;
  }
  double v10 = width;
  double v11 = height;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  if (a4)
  {
    CGFloat height = a3.size.height;
    CGFloat width = a3.size.width;
    CGFloat y = a3.origin.y;
    CGFloat x = a3.origin.x;
    CGMutablePathRef Mutable = CGPathCreateMutable();
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGPathAddRect(Mutable, 0, v15);
    [(CRLImageFill *)self paintPath:Mutable inContext:a4];
    CGPathRelease(Mutable);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D23C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101072994();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D23E8);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill drawSwatchInRect:inContext:]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 658, 0, "invalid nil value for '%{public}s'", "ctx");
  }
}

- (CGSize)p_sizeOfFillImageForDestRect:(CGRect)a3 inContext:(CGContext *)a4
{
  unint64_t v6 = [(CRLImageFill *)self technique];
  [(CRLImageFill *)self fillSize];
  if (v6 != 2)
  {
    -[CRLImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4);
    double v7 = v9;
    double v8 = v10;
  }
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4 rectForFill:(CGRect)a5
{
  if (a3)
  {
    if (a4)
    {
      double height = a5.size.height;
      double width = a5.size.width;
      double y = a5.origin.y;
      double x = a5.origin.x;
      id v12 = [(CRLImageFill *)self p_validatedImageProvider];
      if (!v12)
      {
LABEL_51:

        return;
      }
      CGContextSaveGState(a4);
      CGContextBeginPath(a4);
      CGContextAddPath(a4, a3);
      CGContextClip(a4);
      v47.origin.double x = x;
      v47.origin.double y = y;
      v47.size.double width = width;
      v47.size.double height = height;
      if (CGRectIsNull(v47))
      {
        PathBoundingBodouble x = CGPathGetPathBoundingBox(a3);
        double x = PathBoundingBox.origin.x;
        double y = PathBoundingBox.origin.y;
        double width = PathBoundingBox.size.width;
        double height = PathBoundingBox.size.height;
      }
      uint64_t v13 = [(CRLImageFill *)self tintColor];
      if (v13)
      {
        double v14 = (void *)v13;
        unsigned __int8 v15 = [v12 isError];

        if ((v15 & 1) == 0)
        {
          -[CRLImageFill p_sizeOfFillImageForDestRect:inContext:](self, "p_sizeOfFillImageForDestRect:inContext:", a4, x, y, width, height);
          double v24 = -[CRLImageFill p_cachedImageForSize:inContext:orContentsScaleProvider:](self, "p_cachedImageForSize:inContext:orContentsScaleProvider:", a4, 0);
          double v25 = [v24 image];
          id v26 = [v25 CGImage];

          -[CRLImageFill p_drawBitmapImage:withOrientation:inContext:bounds:](self, "p_drawBitmapImage:withOrientation:inContext:bounds:", v26, 0, a4, x, y, width, height);
LABEL_50:
          CGContextRestoreGState(a4);
          goto LABEL_51;
        }
      }
      CGContextSaveGState(a4);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v12;
        -[CRLImageFill p_sizeOfFillImageForDestRect:inContext:](self, "p_sizeOfFillImageForDestRect:inContext:", a4, x, y, width, height);
        id v17 = [v16 CGImageForSize:a4];
        id v18 = [v16 orientation];

        -[CRLImageFill p_drawBitmapImage:withOrientation:inContext:bounds:](self, "p_drawBitmapImage:withOrientation:inContext:bounds:", v17, v18, a4, x, y, width, height);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v27 = [(CRLImageFill *)self imageData];
          unsigned int v28 = [v27 needsDownload];

          if (v28)
          {
            objc_super v29 = [(CRLImageFill *)self imageData];
            sub_100458B68(a4, v29);

            CGAffineTransform v30 = [(CRLAsset *)self->mImageData fallbackColor];
            v31 = v30;
            if (v30)
            {
              [v30 paintPath:a3 inContext:a4];
              double v32 = [(CRLImageFill *)self tintColor];
              double v33 = v32;
              if (v32) {
                [v32 paintPath:a3 inContext:a4];
              }
            }
            else
            {
              CGContextSaveGState(a4);
              double v33 = +[CRLImage imageNamed:@"sf_streaming_large_bg_pattern"];
              [v33 size];
              double v39 = sub_100064070();
              CGFloat v41 = v40;
              CGFloat v43 = v42;
              CGFloat v45 = v44;
              double v46 = (CGImage *)[v33 CGImageForContentsScale:sub_100458664((uint64_t)a4)];
              v49.origin.double x = v39;
              v49.origin.double y = v41;
              v49.size.double width = v43;
              v49.size.double height = v45;
              CGContextDrawTiledImage(a4, v49, v46);
              CGContextRestoreGState(a4);
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              -[CRLImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4, width, height, x, y, width, height);
              [v12 drawImageInContext:a4];
              goto LABEL_49;
            }
            int v34 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D2488);
            }
            double v35 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_101072B50(v35, (uint64_t)self, v34);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D24A8);
            }
            double v36 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_10106590C(v36);
            }
            v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_paintPath:inContext:rectForFill:]");
            double v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
            double v38 = [(CRLImageFill *)self imageData];
            +[CRLAssertionHandler handleFailureInFunction:v31, v37, 734, 0, "can't draw CRLAsset with unknown image type: %@", v38 file lineNumber isFatal description];
          }
          goto LABEL_49;
        }
        -[CRLImageFill p_drawPDFWithProvider:inContext:bounds:](self, "p_drawPDFWithProvider:inContext:bounds:", v12, a4, x, y, width, height);
      }
LABEL_49:
      CGContextRestoreGState(a4);
      goto LABEL_50;
    }
LABEL_19:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2448);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101072A28();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2468);
    }
    uint64_t v22 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v22);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_paintPath:inContext:rectForFill:]");
    double v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v23, 684, 0, "invalid nil value for '%{public}s'", "ctx");

    goto LABEL_51;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D2408);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101072ABC();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D2428);
  }
  double v19 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v19);
  }
  id v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_paintPath:inContext:rectForFill:]");
  double v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 683, 0, "invalid nil value for '%{public}s'", "path");

  if (!a4) {
    goto LABEL_19;
  }
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
}

- (void)drawFillInContext:(CGContext *)a3 rect:(CGRect)a4 clippingToPath:(CGPath *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (!a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D24C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101072CB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D24E8);
    }
    id v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    uint64_t v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill drawFillInContext:rect:clippingToPath:]");
    double v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 750, 0, "invalid nil value for '%{public}s'", "clippingPath");
  }
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  if (!CGRectIsNull(v18))
  {
    PathBoundingBodouble x = CGPathGetPathBoundingBox(a5);
    if (!sub_100064278(x, y, width, height, PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2508);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101072C30();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2528);
      }
      unsigned __int8 v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v15);
      }
      id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill drawFillInContext:rect:clippingToPath:]");
      id v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
      +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:752 isFatal:0 description:"rectForFill must equal or contain the path bounds"];
    }
  }
  -[CRLImageFill p_paintPath:inContext:rectForFill:](self, "p_paintPath:inContext:rectForFill:", a5, a3, x, y, width, height);
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2548);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101072D4C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2568);
    }
    uint64_t v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    double v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill paintPath:naturalBounds:inContext:isPDF:]");
    unsigned __int8 v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 757, 0, "invalid nil value for '%{public}s'", "path");
  }
  -[CRLImageFill p_paintPath:inContext:rectForFill:](self, "p_paintPath:inContext:rectForFill:", a3, a5, a6, x, y, width, height);
}

- (id)p_tintedImageWithScale:(double)a3
{
  BOOL v5 = [(CRLImageFill *)self p_validatedImageProvider];
  unint64_t v6 = [(CRLImageFill *)self tintColor];
  double v7 = v6;
  if (!v6 || !v5)
  {

LABEL_9:
    unsigned int v28 = [(CRLImageFill *)self tintColor];

    if (v28)
    {
      if (v5)
      {
LABEL_30:
        if ([v5 isError])
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D2608);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_101072DE0();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D2628);
          }
          double v35 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v35);
          }
          double v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_tintedImageWithScale:]");
          double v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
          +[CRLAssertionHandler handleFailureInFunction:v36 file:v37 lineNumber:824 isFatal:0 description:"Image provider has error for image fill."];
        }
        goto LABEL_40;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2588);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101072EF0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D25A8);
      }
      objc_super v29 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v29);
      }
      CGAffineTransform v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_tintedImageWithScale:]");
      v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
      +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:822 isFatal:0 description:"Image fill has a null tint color."];

      if (v5) {
        goto LABEL_30;
      }
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D25C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101072E68();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D25E8);
    }
    double v32 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v32);
    }
    double v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_tintedImageWithScale:]");
    int v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:v33 file:v34 lineNumber:823 isFatal:0 description:"Image provider for image fill could not be validated and is nil."];

    goto LABEL_30;
  }
  unsigned __int8 v8 = [v5 isError];

  if (v8) {
    goto LABEL_9;
  }
  [v5 naturalSize];
  double v10 = v9;
  double v12 = v11;
  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    unint64_t v13 = sub_1004549A8();
    double v14 = sub_10006727C(v10, v12, (double)v13);
    double v10 = sub_10006538C(v14);
    double v12 = v15;
  }
  double v16 = sub_1000646A4(v10, v12, a3);
  double v18 = sub_1000674F0(v16, v17);
  double v20 = sub_100064F14(v18, v19, 1.0);
  double v22 = v21;
  double v23 = [(CRLImageFill *)self tintColor];
  id v24 = [v23 colorRGBSpace];

  double v25 = [(CRLImageFill *)self tintColor];
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v25 CGColor]);

  if (ColorSpace) {
    BOOL v27 = CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelMonochrome;
  }
  else {
    BOOL v27 = 1;
  }
  uint64_t v40 = objc_opt_class();
  CGFloat v41 = sub_1002469D0(v40, v5);
  double v42 = v41;
  if (!v41) {
    goto LABEL_52;
  }
  CGFloat v43 = CGImageGetColorSpace((CGImageRef)[v41 CGImageOfAnySize]);
  if (v43)
  {
    BOOL v44 = (CGColorSpaceGetModel(v43) - 4) < 0xFFFFFFFD;
    if (v24) {
      goto LABEL_52;
    }
  }
  else
  {
    BOOL v44 = 1;
    if (v24) {
      goto LABEL_52;
    }
  }
  if (!v27 || !v44)
  {
    CGFloat v45 = sub_100455F9C((CGImage *)[v42 CGImageOfAnySize], 11, v20, v22);
    goto LABEL_53;
  }
LABEL_52:
  CGFloat v45 = sub_100455AA8(43, v20, v22);
LABEL_53:
  double v46 = v45;
  double v47 = sub_100064070();
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  CGContextSaveGState(v46);
  [v5 drawImageInContext:v46 rect:v47];
  CGContextRestoreGState(v46);
  CGFloat v54 = [(CRLImageFill *)self tintColor];
  CGContextSetFillColorWithColor(v46, (CGColorRef)[v54 CGColor]);

  v57.origin.double x = v47;
  v57.origin.double y = v49;
  v57.size.double width = v51;
  v57.size.double height = v53;
  CGContextFillRect(v46, v57);
  Image = CGBitmapContextCreateImage(v46);
  CGContextRelease(v46);

  if (!Image)
  {
LABEL_40:
    double v38 = 0;
    goto LABEL_41;
  }
  double v38 = +[CRLImage imageWithCGImage:Image];
  CGImageRelease(Image);
LABEL_41:

  return v38;
}

- (id)p_standardSizeCachedImage
{
  BOOL v3 = [(CRLImageFill *)self tintColor];

  if (v3) {
    id v4 = self->mStandardSizeTintedImage;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)p_halfSizeCachedImage
{
  BOOL v3 = [(CRLImageFill *)self tintColor];

  if (v3) {
    id v4 = self->mHalfSizeTintedImage;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)p_quarterSizeCachedImage
{
  BOOL v3 = [(CRLImageFill *)self tintColor];

  if (v3) {
    id v4 = self->mQuarterSizeTintedImage;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)p_validatedImageProvider
{
  if (!self->mHasIndicatedInterestInProvider && self->mImageData)
  {
    self->mHasIndicatedInterestInProvider = 1;
    BOOL v3 = +[CRLImageProviderPool sharedPool];
    [v3 addInterestInProviderForAsset:self->mImageData];
  }
  id v4 = +[CRLImageProviderPool sharedPool];
  BOOL v5 = v4;
  mImageData = self->mImageData;
  if (mImageData)
  {
    double v7 = [v4 providerForAsset:mImageData shouldValidate:1];
  }
  else
  {
    unsigned __int8 v8 = +[CRLAsset null];
    double v7 = [v5 providerForAsset:v8 shouldValidate:1];
  }

  return v7;
}

- (CGRect)p_drawnRectForImageSize:(CGSize)a3 destRect:(CGRect)a4 inContext:(CGContext *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = a3.height;
  double v11 = a3.width;
  unint64_t v13 = [(CRLImageFill *)self technique];
  if (v13 - 3 < 2)
  {
    double v14 = sub_1000672D8((id)[(CRLImageFill *)self technique] == (id)3, v11, v10, x, y, width, height);
LABEL_6:
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v16;
    CGFloat height = v17;
    goto LABEL_7;
  }
  if (!v13)
  {
    CGContextGetUserSpaceToDeviceSpaceTransform(&v35, a5);
    BOOL v18 = sub_10007F964(&v35.a);
    double v19 = sub_100065738(x, y, width, height);
    double v21 = sub_10006402C(v19, v20, v11);
    CGFloat x = v21;
    CGFloat y = v22;
    CGFloat width = v23;
    CGFloat height = v24;
    if (v18)
    {
      CGRect v36 = CGContextConvertRectToDeviceSpace(a5, *(CGRect *)&v21);
      double v25 = v36.size.width;
      double v26 = v36.size.height;
      double v27 = sub_1000674F0(v36.origin.x, v36.origin.y);
      CGFloat v29 = v28;
      v37.size.CGFloat width = sub_1000674F0(v25, v26);
      v37.size.CGFloat height = v30;
      v37.origin.CGFloat x = v27;
      v37.origin.CGFloat y = v29;
      *(CGRect *)&double v14 = CGContextConvertRectToUserSpace(a5, v37);
      goto LABEL_6;
    }
  }
LABEL_7:
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (void)p_drawBitmapImage:(CGImage *)a3 withOrientation:(int64_t)a4 inContext:(CGContext *)a5 bounds:(CGRect)a6
{
  if (a3)
  {
    double height = a6.size.height;
    double width = a6.size.width;
    CGFloat y = a6.origin.y;
    CGFloat x = a6.origin.x;
    [(CRLImageFill *)self fillSize];
    double v15 = v14;
    double v17 = v16;
    -[CRLImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a5);
    CGFloat v43 = v18;
    CGFloat v44 = v19;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    unint64_t v24 = [(CRLImageFill *)self technique];
    if (v24 > 4 || v24 == 2)
    {
      if (width > v15 || height > v17)
      {
        CGContextTranslateCTM(a5, v43, v44);
        CGContextScaleCTM(a5, 1.0, -1.0);
        double v33 = sub_100064070();
        CGFloat v35 = v34;
        CGFloat v37 = v36;
        CGFloat v39 = v38;
        memset(&v47, 0, sizeof(v47));
        sub_10043A6BC((CGAffineTransform *)a4, 1, (uint64_t)&v47, v33, v34, v36, v38);
        CGAffineTransform transform = v47;
        CGContextConcatCTM(a5, &transform);
        transform.a = 0.0;
        *(void *)&transform.b = &transform;
        *(void *)&transform.c = 0x2020000000;
        mTempRenderLock = self->mTempRenderLock;
        transform.d = 0.0;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000B5EBC;
        block[3] = &unk_1014CC790;
        block[5] = &transform;
        block[6] = a3;
        block[4] = self;
        dispatch_sync(mTempRenderLock, block);
        v50.origin.CGFloat x = v33;
        v50.origin.CGFloat y = v35;
        v50.size.double width = v37;
        v50.size.double height = v39;
        CGContextDrawTiledImage(a5, v50, *(CGImageRef *)(*(void *)&transform.b + 24));
        CGImageRelease(*(CGImageRef *)(*(void *)&transform.b + 24));
        _Block_object_dispose(&transform, 8);
        return;
      }
      v51.origin.CGFloat x = v43;
      v51.origin.CGFloat y = v44;
      v51.size.double width = v15;
      v51.size.double height = v17;
      double MinY = CGRectGetMinY(v51);
      v52.origin.CGFloat x = v43;
      v52.origin.CGFloat y = v44;
      v52.size.double width = v15;
      v52.size.double height = v17;
      CGFloat MaxY = CGRectGetMaxY(v52);
      CGContextTranslateCTM(a5, 0.0, MinY + MaxY);
      CGContextScaleCTM(a5, 1.0, -1.0);
      memset(&v47, 0, sizeof(v47));
      sub_10043A6BC((CGAffineTransform *)a4, 1, (uint64_t)&v47, v43, v44, v15, v17);
      CGAffineTransform transform = v47;
      CGContextConcatCTM(a5, &transform);
      double v27 = a5;
      CGFloat v28 = v43;
      CGFloat v29 = v44;
      double v30 = v15;
      double v31 = v17;
    }
    else
    {
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.double width = width;
      v48.size.double height = height;
      double v25 = CGRectGetMinY(v48);
      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.double width = width;
      v49.size.double height = height;
      CGFloat v26 = CGRectGetMaxY(v49);
      CGContextTranslateCTM(a5, 0.0, v25 + v26);
      CGContextScaleCTM(a5, 1.0, -1.0);
      memset(&v47, 0, sizeof(v47));
      sub_10043A6BC((CGAffineTransform *)a4, 1, (uint64_t)&v47, v43, v44, v21, v23);
      CGAffineTransform transform = v47;
      CGContextConcatCTM(a5, &transform);
      double v27 = a5;
      CGFloat v28 = v43;
      CGFloat v29 = v44;
      double v30 = v21;
      double v31 = v23;
    }
    CGContextDrawImage(v27, *(CGRect *)&v28, a3);
  }
}

- (void)p_drawPDFWithProvider:(id)a3 inContext:(CGContext *)a4 bounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v11 = (CGPDFDocument *)[a3 CGPDFDocument];
  if (v11)
  {
    CGPDFPageRef Page = CGPDFDocumentGetPage(v11, 1uLL);
    if (Page)
    {
      unint64_t v13 = Page;
      CGContextSaveGState(a4);
      memset(&v52, 0, sizeof(v52));
      double v50 = 0.0;
      double v51 = 0.0;
      v45.origin.CGFloat x = sub_100456798(v13, (uint64_t)&v52, &v50);
      v45.origin.CGFloat y = v14;
      v45.size.CGFloat width = v15;
      v45.size.CGFloat height = v16;
      [(CRLImageFill *)self fillSize];
      double v42 = v18;
      double v43 = v17;
      -[CRLImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4);
      CGFloat v44 = v19;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      v54.origin.CGFloat x = x;
      v54.origin.CGFloat y = y;
      v54.size.CGFloat width = width;
      v54.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v54);
      v55.origin.CGFloat x = x;
      v55.origin.CGFloat y = y;
      v55.size.CGFloat width = width;
      v55.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v55);
      CGContextTranslateCTM(a4, 0.0, MinY + MaxY);
      CGContextScaleCTM(a4, 1.0, -1.0);
      unint64_t v28 = [(CRLImageFill *)self technique];
      if (v28 > 4 || v28 == 2)
      {
        v53.CGFloat width = 1.0;
        v53.CGFloat height = 1.0;
        CGSize v29 = CGContextConvertSizeToDeviceSpace(a4, v53);
        double v30 = sub_1000646A4(v43, v42, fmax(fabs(v29.width), fabs(v29.height)));
        double v31 = sub_1000674B8(v30);
        double v33 = sub_100455AA8(3, v31, v32);
        if (v33)
        {
          CGFloat v34 = v33;
          long long v48 = 0u;
          long long v49 = 0u;
          __n128 v47 = 0u;
          double v35 = sub_100064070();
          CGAffineTransform transform = v52;
          sub_100456B98((__n128 *)&transform, &v47, v50, v51, v35, v36, v37, v38);
          *(__n128 *)&transform.a = v47;
          *(_OWORD *)&transform.c = v48;
          *(_OWORD *)&transform.tCGFloat x = v49;
          CGContextConcatCTM(v34, &transform);
          CGContextClipToRect(v34, v45);
          CGContextDrawPDFPage(v34, v13);
          Image = CGBitmapContextCreateImage(v34);
          CGContextRelease(v34);
          if (Image)
          {
            v56.origin.CGFloat x = x;
            v56.origin.CGFloat y = y;
            v56.size.CGFloat width = width;
            v56.size.CGFloat height = height;
            CGFloat MinX = CGRectGetMinX(v56);
            v57.origin.CGFloat x = x;
            v57.origin.CGFloat y = y;
            v57.size.CGFloat width = width;
            v57.size.CGFloat height = height;
            CGFloat v41 = CGRectGetMaxY(v57);
            CGContextTranslateCTM(a4, MinX, v41);
            v58.origin.CGFloat x = sub_100064070();
            CGContextDrawTiledImage(a4, v58, Image);
            CGImageRelease(Image);
          }
        }
      }
      else
      {
        long long v48 = 0u;
        long long v49 = 0u;
        CGAffineTransform transform = v52;
        __n128 v47 = 0u;
        sub_100456B98((__n128 *)&transform, &v47, v50, v51, v44, v21, v23, v25);
        *(__n128 *)&transform.a = v47;
        *(_OWORD *)&transform.c = v48;
        *(_OWORD *)&transform.tCGFloat x = v49;
        CGContextConcatCTM(a4, &transform);
        CGContextClipToRect(a4, v45);
        CGContextDrawPDFPage(a4, v13);
      }
      CGContextRestoreGState(a4);
    }
  }
}

- (_TtC8Freeform8CRLAsset)imageData
{
  return self->mImageData;
}

- (unint64_t)technique
{
  return self->mTechnique;
}

- (void)setTechnique:(unint64_t)a3
{
  self->unint64_t mTechnique = a3;
}

- (CRLColor)tintColor
{
  return self->mTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTempRenderLock, 0);
  objc_storeStrong((id *)&self->mCachedReferenceColor, 0);
  objc_storeStrong((id *)&self->mReferenceColor, 0);
  objc_storeStrong((id *)&self->mQuarterSizeTintedImage, 0);
  objc_storeStrong((id *)&self->mHalfSizeTintedImage, 0);
  objc_storeStrong((id *)&self->mStandardSizeTintedImage, 0);
  objc_storeStrong((id *)&self->mTintColor, 0);

  objc_storeStrong((id *)&self->mImageData, 0);
}

@end