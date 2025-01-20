@interface TSDImager
- (BOOL)distortedToMatch;
- (BOOL)drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4;
- (BOOL)imageMustHaveEvenDimensions;
- (BOOL)isCanvasDrawingIntoPDF:(id)a3;
- (BOOL)isPrinting;
- (BOOL)isPrintingCanvas;
- (BOOL)p_configureCanvas;
- (BOOL)shouldReuseBitmapContext;
- (CGColor)backgroundColor;
- (CGImage)newImage;
- (CGImage)p_newImageInReusableContext;
- (CGRect)actualScaledClipRect;
- (CGRect)unscaledClipRect;
- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)mCanvas;
- (CGSize)maximumScaledImageSize;
- (CGSize)scaledImageSize;
- (NSArray)infos;
- (TSDCanvas)canvas;
- (TSDImager)initWithDocumentRoot:(id)a3;
- (UIEdgeInsets)contentInset;
- (double)viewScale;
- (id)documentRoot;
- (id)pdfData;
- (void)dealloc;
- (void)p_drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDistortedToMatch:(BOOL)a3;
- (void)setImageMustHaveEvenDimensions:(BOOL)a3;
- (void)setInfos:(id)a3;
- (void)setIsPrinting:(BOOL)a3;
- (void)setMaximumScaledImageSize:(CGSize)a3;
- (void)setPostRenderAction:(id)a3;
- (void)setScaledImageSize:(CGSize)a3;
- (void)setShouldReuseBitmapContext:(BOOL)a3;
- (void)setUnscaledClipRect:(CGRect)a3;
- (void)setViewScale:(double)a3;
@end

@implementation TSDImager

- (TSDImager)initWithDocumentRoot:(id)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDImager initWithDocumentRoot:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 51, @"invalid nil value for '%s'", "documentRoot");
  }
  v12.receiver = self;
  v12.super_class = (Class)TSDImager;
  v7 = [(TSDImager *)&v12 init];
  v8 = (TSDImager *)v7;
  if (v7)
  {
    long long v9 = *(_OWORD *)(MEMORY[0x263F00190] + 16);
    *(_OWORD *)(v7 + 24) = *MEMORY[0x263F00190];
    *(_OWORD *)(v7 + 40) = v9;
    *(_OWORD *)(v7 + 104) = TSDEdgeInsetsZero;
    *((void *)v7 + 17) = a3;
    *((void *)v7 + 7) = 0x3FF0000000000000;
    *(_OWORD *)(v7 + 120) = *(_OWORD *)&qword_223839588;
    v10 = objc_alloc_init(TSDCanvas);
    v8->mCanvas = v10;
    [(TSDCanvas *)v10 setDelegate:v8];
    v8->mPostRenderAction = 0;
  }
  return v8;
}

- (void)dealloc
{
  [(TSDCanvas *)self->mCanvas teardown];
  [(TSDCanvas *)self->mCanvas setDelegate:0];

  CGColorRelease(self->mBackgroundColor);
  TSDClearCGContextInfo((uint64_t)self->mReusableBitmapContext);
  CGContextRelease(self->mReusableBitmapContext);
  v3.receiver = self;
  v3.super_class = (Class)TSDImager;
  [(TSDImager *)&v3 dealloc];
}

- (void)setPostRenderAction:(id)a3
{
  self->mPostRenderAction = (id)[a3 copy];
}

- (void)setInfos:(id)a3
{
  if (self->mInfos != a3)
  {
    id v5 = a3;

    self->mInfos = (NSArray *)a3;
    if (![a3 count])
    {
      [(TSDCanvas *)self->mCanvas setInfosToDisplay:self->mInfos];
      mCanvas = self->mCanvas;
      [(TSDCanvas *)mCanvas layoutIfNeeded];
    }
  }
}

- (void)setBackgroundColor:(CGColor *)a3
{
  mBackgroundColor = self->mBackgroundColor;
  if (mBackgroundColor != a3)
  {
    CGColorRelease(mBackgroundColor);
    if (a3) {
      Copy = CGColorCreateCopy(a3);
    }
    else {
      Copy = 0;
    }
    self->mBackgroundColor = Copy;
  }
}

- (double)viewScale
{
  if (self->mUseScaledImageSize)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImager viewScale]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 125, @"Cannot call viewScale if scaledImageSize has been set.");
  }
  return self->mViewScale;
}

- (void)setViewScale:(double)a3
{
  if (a3 <= 0.0)
  {
    id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDImager setViewScale:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 131, @"Scale must be > 0.");
  }
  self->mViewScale = a3;
  self->mScaledImageSize = (CGSize)*MEMORY[0x263F001B0];
  self->mUseScaledImageSize = 0;
}

- (CGSize)scaledImageSize
{
  if (!self->mUseScaledImageSize)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImager scaledImageSize]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 139, @"Cannot call scaledImageSize if viewScale has been set.");
  }
  double width = self->mScaledImageSize.width;
  double height = self->mScaledImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScaledImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width <= 0.0 || a3.height <= 0.0)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDImager setScaledImageSize:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 145, @"can't make an image with 0 width or height");
  }
  double v9 = TSDCeilSize(width);
  CGFloat v10 = v8;
  if (width != v9 || height != v8)
  {
    objc_super v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDImager setScaledImageSize:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 147, @"given a non-integral scaled image size");
  }
  self->mScaledImageSize.double width = v9;
  self->mScaledImageSize.double height = v10;
  self->mViewScale = -1.0;
  self->mUseScaledImageSize = 1;
}

- (CGSize)maximumScaledImageSize
{
  double width = self->mMaximumScaledImageSize.width;
  double height = self->mMaximumScaledImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumScaledImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v7 = TSDCeilSize(a3.width);
  CGFloat v8 = v6;
  if (width != v7 || height != v6)
  {
    CGFloat v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDImager setMaximumScaledImageSize:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 161, @"given a non-integral maximum image size");
  }
  self->mMaximumScaledImageSize.double width = v7;
  self->mMaximumScaledImageSize.double height = v8;
}

- (CGImage)newImage
{
  mDocumentRoot = self->mDocumentRoot;
  uint64_t v4 = mDocumentRoot;
  if ([(TSDImager *)self p_configureCanvas])
  {
    if (self->mUseScaledImageSize)
    {
      if ([(TSDImager *)self shouldReuseBitmapContext]) {
        id v5 = [(TSDImager *)self p_newImageInReusableContext];
      }
      else {
        id v5 = -[TSDCanvas i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:](self->mCanvas, "i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:", self->mDistortedToMatch, self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height, self->mScaledImageSize.width, self->mScaledImageSize.height);
      }
      double v6 = v5;
    }
    else
    {
      [(TSDCanvas *)self->mCanvas i_clipsImagesToBounds:0];
      double v6 = -[TSDCanvas i_imageInScaledRect:](self->mCanvas, "i_imageInScaledRect:", self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height);
      [(TSDCanvas *)self->mCanvas i_clipsImagesToBounds:1];
    }
    mPostRenderAction = (void (**)(id, void, TSDCanvas *))self->mPostRenderAction;
    if (mPostRenderAction) {
      mPostRenderAction[2](mPostRenderAction, 0, self->mCanvas);
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)pdfData
{
  if (![(TSDImager *)self p_configureCanvas]) {
    return 0;
  }
  objc_super v3 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  CGDataConsumerRef v5 = CGDataConsumerCreateWithCFData(v3);
  if (v5)
  {
    double v6 = v5;
    v13.origin.x = TSDRectWithSize();
    v13.origin.y = v7;
    v13.size.double width = v8;
    v13.size.double height = v9;
    CGFloat v10 = CGPDFContextCreate(v6, &v13, 0);
    [(TSDImager *)self p_drawPageInContext:v10 createPage:1];
    CGPDFContextClose(v10);
    CGContextRelease(v10);
    uint64_t v11 = v4;
    CGDataConsumerRelease(v6);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(TSDImager *)self p_configureCanvas];
  if (v7)
  {
    uint64_t BitmapQualityInfo = TSDCGContextGetBitmapQualityInfo((uint64_t)a3);
    if (BitmapQualityInfo) {
      [(TSDCanvas *)self->mCanvas addBitmapsToRenderingQualityInfo:BitmapQualityInfo inContext:a3];
    }
    [(TSDImager *)self p_drawPageInContext:a3 createPage:v4];
  }
  return v7;
}

- (id)documentRoot
{
  return self->mDocumentRoot;
}

- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)mCanvas
{
  if (self->mCanvas != mCanvas)
  {
    BOOL v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDImager visibleScaledBoundsForClippingRepsOnCanvas:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 293, @"wrong canvas");
    mCanvas = self->mCanvas;
  }
  [mCanvas viewScale];
  double v7 = v6;
  double x = self->mUnscaledClipRect.origin.x;
  CGFloat y = self->mUnscaledClipRect.origin.y;
  CGFloat width = self->mUnscaledClipRect.size.width;
  CGFloat height = self->mUnscaledClipRect.size.height;

  double v12 = TSDMultiplyRectScalar(x, y, width, height, v7);
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)isCanvasDrawingIntoPDF:(id)a3
{
  if (self->mCanvas != a3)
  {
    BOOL v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDImager isCanvasDrawingIntoPDF:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 300, @"wrong canvas");
  }
  return self->mDrawingIntoPDF;
}

- (BOOL)isPrintingCanvas
{
  return self->mIsPrinting;
}

- (BOOL)p_configureCanvas
{
  [(TSDCanvas *)self->mCanvas setBackgroundColor:self->mBackgroundColor];
  -[TSDCanvas setContentInset:](self->mCanvas, "setContentInset:", self->mContentInset.top, self->mContentInset.left, self->mContentInset.bottom, self->mContentInset.right);
  [(TSDCanvas *)self->mCanvas setInfosToDisplay:self->mInfos];
  [(TSDCanvas *)self->mCanvas layoutInvalidated];
  [(TSDCanvas *)self->mCanvas layoutIfNeeded];
  double x = self->mUnscaledClipRect.origin.x;
  CGFloat y = self->mUnscaledClipRect.origin.y;
  double width = self->mUnscaledClipRect.size.width;
  double height = self->mUnscaledClipRect.size.height;
  v46.origin.double x = x;
  v46.origin.CGFloat y = y;
  v46.size.double width = width;
  v46.size.double height = height;
  if (CGRectEqualToRect(v46, *MEMORY[0x263F00190]))
  {
    [(TSDCanvas *)self->mCanvas i_unscaledRectOfLayouts];
    double x = v7;
    CGFloat y = v8;
    double width = v9;
    double height = v10;
  }
  v47.origin.double x = x;
  v47.origin.CGFloat y = y;
  v47.size.double width = width;
  v47.size.double height = height;
  float MinX = CGRectGetMinX(v47);
  double v12 = fminf(MinX, 0.0);
  v48.origin.double x = x;
  v48.origin.CGFloat y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  float MinY = CGRectGetMinY(v48);
  double v14 = fminf(MinY, 0.0);
  v49.origin.double x = x;
  v49.origin.CGFloat y = y;
  v49.size.double width = width;
  v49.size.double height = height;
  float MaxX = CGRectGetMaxX(v49);
  double v16 = fmaxf(MaxX, 0.0);
  v50.origin.double x = x;
  v50.origin.CGFloat y = y;
  v50.size.double width = width;
  v50.size.double height = height;
  float MaxY = CGRectGetMaxY(v50);
  double v18 = v16 - v12;
  double v19 = fmaxf(MaxY, 0.0) - v14;
  BOOL v20 = v19 > 0.0 && v18 > 0.0;
  if (v20)
  {
    [(TSDCanvas *)self->mCanvas unscaledSize];
    if (v22 != v18 || v21 != v19)
    {
      -[TSDCanvas setUnscaledSize:](self->mCanvas, "setUnscaledSize:", v18, v19);
      [(TSDCanvas *)self->mCanvas layoutIfNeeded];
    }
    if (self->mUseScaledImageSize)
    {
      float v24 = self->mScaledImageSize.width / width;
      float v25 = self->mScaledImageSize.height / height;
      double mViewScale = fminf(v24, v25);
    }
    else
    {
      double mViewScale = self->mViewScale;
    }
    double v27 = self->mMaximumScaledImageSize.width;
    if (v27 != 0.0 || self->mMaximumScaledImageSize.height != 0.0)
    {
      double v28 = self->mMaximumScaledImageSize.height;
      if (width > v27 || height > v28)
      {
        if (v27 == 0.0) {
          double v29 = 0.0;
        }
        else {
          double v29 = width / v27;
        }
        if (v28 == 0.0) {
          double v30 = 0.0;
        }
        else {
          double v30 = height / v28;
        }
        if (v29 == 0.0 && v30 == 0.0)
        {
          v31 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v32 = [NSString stringWithUTF8String:"-[TSDImager p_configureCanvas]"];
          objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 374, @"both ratios in imager are zero!");
        }
        if (v29 <= v30) {
          double v33 = v30;
        }
        else {
          double v33 = v29;
        }
        double mViewScale = 1.0 / v33;
      }
    }
    [(TSDCanvas *)self->mCanvas setViewScale:mViewScale];
    [(TSDCanvas *)self->mCanvas viewScale];
    self->mActualScaledClipRect.origin.double x = TSDMultiplyRectScalar(x, y, width, height, v34);
    self->mActualScaledClipRect.origin.CGFloat y = v35;
    self->mActualScaledClipRect.size.double width = v36;
    self->mActualScaledClipRect.size.double height = v37;
    if (self->mUseScaledImageSize && self->mImageMustHaveEvenDimensions)
    {
      CGFloat v38 = TSDRoundedSize();
      double v40 = v39;
      double v41 = fmod(v39, 2.0);
      double v42 = fmod(v38, 2.0);
      if (v41 != 0.0 || v42 != 0.0)
      {
        if (v41 != 0.0) {
          double v40 = v40 + -1.0;
        }
        if (v42 != 0.0) {
          CGFloat v38 = v38 + -1.0;
        }
        if (v38 > self->mScaledImageSize.width || v40 > self->mScaledImageSize.height)
        {
          v43 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v44 = [NSString stringWithUTF8String:"-[TSDImager p_configureCanvas]"];
          objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 401, @"new image dimensions not calculated as expected! Image may be the wrong size.");
        }
        self->mActualScaledClipRect.size.double width = v38;
        self->mActualScaledClipRect.size.double height = v40;
      }
    }
  }
  return v20;
}

- (void)p_drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4
{
  BOOL v4 = a4;
  self->mDrawingIntoPDF = 1;
  TSDSetCGContextInfo((uint64_t)a3, [(TSDImager *)self isPrinting], self->mDrawingIntoPDF, 0, [(TSDCanvas *)self->mCanvas shouldSuppressBackgrounds], 1.0);
  double x = self->mActualScaledClipRect.origin.x;
  double y = self->mActualScaledClipRect.origin.y;
  CGFloat width = self->mActualScaledClipRect.size.width;
  CGFloat height = self->mActualScaledClipRect.size.height;
  if (v4)
  {
    v15.origin.double x = TSDRectWithSize();
    v15.origin.double y = v11;
    v15.size.CGFloat width = v12;
    v15.size.CGFloat height = v13;
    CGContextBeginPage(a3, &v15);
  }
  CGContextTranslateCTM(a3, 0.0, height);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGContextTranslateCTM(a3, -x, -y);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGContextClipToRect(a3, v16);
  [(TSDCanvas *)self->mCanvas i_drawBackgroundInContext:a3];
  [(TSDCanvas *)self->mCanvas i_drawRepsInContext:a3];
  mPostRenderAction = (void (**)(id, CGContext *, TSDCanvas *))self->mPostRenderAction;
  if (mPostRenderAction) {
    mPostRenderAction[2](mPostRenderAction, a3, self->mCanvas);
  }
  if (v4) {
    CGContextEndPage(a3);
  }
  TSDClearCGContextInfo((uint64_t)a3);
  self->mDrawingIntoPDF = 0;
}

- (CGImage)p_newImageInReusableContext
{
  if (![(TSDImager *)self shouldReuseBitmapContext])
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImager p_newImageInReusableContext]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 451, @"shouldn't be reusing context");
  }
  if (!self->mReusableBitmapContext) {
    goto LABEL_11;
  }
  if (!CGRectEqualToRect(self->mReusableActualScaledClipRect, self->mActualScaledClipRect)
    || (self->mReusableScaledImageSize.width == self->mScaledImageSize.width
      ? (BOOL v5 = self->mReusableScaledImageSize.height == self->mScaledImageSize.height)
      : (BOOL v5 = 0),
        !v5))
  {
    mReusableBitmapContext = self->mReusableBitmapContext;
    if (mReusableBitmapContext)
    {
      TSDClearCGContextInfo((uint64_t)mReusableBitmapContext);
      CGContextRelease(self->mReusableBitmapContext);
      self->mReusableBitmapContext = 0;
    }
LABEL_11:
    double v7 = -[TSDCanvas i_createContextToDrawImageInScaledRect:withTargetIntegralSize:returningBounds:integralBounds:](self->mCanvas, "i_createContextToDrawImageInScaledRect:withTargetIntegralSize:returningBounds:integralBounds:", &self->mReusableBounds, &self->mReusableIntegralBounds, self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height, self->mScaledImageSize.width, self->mScaledImageSize.height);
    self->mReusableBitmapContext = v7;
    TSDSetCGContextInfo((uint64_t)v7, [(TSDImager *)self isPrinting], self->mDrawingIntoPDF, 0, [(TSDCanvas *)self->mCanvas shouldSuppressBackgrounds], 1.0);
    CGSize size = self->mActualScaledClipRect.size;
    self->mReusableActualScaledClipRect.origin = self->mActualScaledClipRect.origin;
    self->mReusableActualScaledClipRect.CGSize size = size;
    self->mReusableScaledImageSize = self->mScaledImageSize;
    goto LABEL_12;
  }
  mBackgroundColor = self->mBackgroundColor;
  if (!mBackgroundColor || CGColorGetAlpha(mBackgroundColor) < 1.0) {
    CGContextClearRect(self->mReusableBitmapContext, *MEMORY[0x263F00190]);
  }
LABEL_12:
  mCanvas = self->mCanvas;
  double v10 = self->mReusableBitmapContext;
  BOOL mDistortedToMatch = self->mDistortedToMatch;
  double x = self->mReusableBounds.origin.x;
  double y = self->mReusableBounds.origin.y;
  double width = self->mReusableBounds.size.width;
  double height = self->mReusableBounds.size.height;
  double v16 = self->mReusableIntegralBounds.origin.x;
  double v17 = self->mReusableIntegralBounds.origin.y;
  double v18 = self->mReusableIntegralBounds.size.width;
  double v19 = self->mReusableIntegralBounds.size.height;

  return -[TSDCanvas i_newImageInContext:bounds:integralBounds:distortedToMatch:](mCanvas, "i_newImageInContext:bounds:integralBounds:distortedToMatch:", v10, mDistortedToMatch, x, y, width, height, v16, v17, v18, v19);
}

- (NSArray)infos
{
  return self->mInfos;
}

- (CGColor)backgroundColor
{
  return self->mBackgroundColor;
}

- (CGRect)unscaledClipRect
{
  double x = self->mUnscaledClipRect.origin.x;
  double y = self->mUnscaledClipRect.origin.y;
  double width = self->mUnscaledClipRect.size.width;
  double height = self->mUnscaledClipRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUnscaledClipRect:(CGRect)a3
{
  self->mUnscaledClipRect = a3;
}

- (UIEdgeInsets)contentInset
{
  double top = self->mContentInset.top;
  double left = self->mContentInset.left;
  double bottom = self->mContentInset.bottom;
  double right = self->mContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->mContentInset = a3;
}

- (CGRect)actualScaledClipRect
{
  double x = self->mActualScaledClipRect.origin.x;
  double y = self->mActualScaledClipRect.origin.y;
  double width = self->mActualScaledClipRect.size.width;
  double height = self->mActualScaledClipRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)distortedToMatch
{
  return self->mDistortedToMatch;
}

- (void)setDistortedToMatch:(BOOL)a3
{
  self->BOOL mDistortedToMatch = a3;
}

- (BOOL)imageMustHaveEvenDimensions
{
  return self->mImageMustHaveEvenDimensions;
}

- (void)setImageMustHaveEvenDimensions:(BOOL)a3
{
  self->mImageMustHaveEvenDimensions = a3;
}

- (BOOL)shouldReuseBitmapContext
{
  return self->mShouldReuseBitmapContext;
}

- (void)setShouldReuseBitmapContext:(BOOL)a3
{
  self->mShouldReuseBitmapContext = a3;
}

- (BOOL)isPrinting
{
  return self->mIsPrinting;
}

- (void)setIsPrinting:(BOOL)a3
{
  self->mIsPrinting = a3;
}

- (TSDCanvas)canvas
{
  return self->mCanvas;
}

@end