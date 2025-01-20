@interface CRLCanvasImager
- (BOOL)distortedToMatch;
- (BOOL)drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4 includeMargin:(BOOL)a5;
- (BOOL)imageMustHaveEvenDimensions;
- (BOOL)isCanvasDrawingIntoPDF:(id)a3;
- (BOOL)isPrinting;
- (BOOL)isPrintingCanvas;
- (BOOL)mayBeReused;
- (BOOL)p_configureCanvas;
- (BOOL)shouldReuseBitmapContext;
- (BOOL)shouldShowInstructionalText;
- (BOOL)shouldSuppressBackgrounds;
- (CGImage)newImage;
- (CGImage)p_newImageInReusableContext;
- (CGRect)actualScaledClipRect;
- (CGRect)unscaledClipRect;
- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3;
- (CGSize)maximumImagePixelSize;
- (CGSize)p_evenDimensionsWithSize:(CGSize)a3;
- (CGSize)scaledImageSize;
- (CRLCanvas)canvas;
- (CRLCanvasImager)initWithBoard:(id)a3;
- (CRLCanvasImager)initWithBoard:(id)a3 renderForWideGamut:(BOOL)a4;
- (CRLColor)backgroundColor;
- (NSArray)infos;
- (NSSet)previousRenderDatasNeedingDownload;
- (NSString)boardTitle;
- (double)contentsScale;
- (double)viewScale;
- (id)boardItemOwnerForCanvas:(id)a3;
- (id)generateImage;
- (id)getBoardItemForUUID:(id)a3;
- (id)pdfData;
- (id)pngData;
- (void)dealloc;
- (void)i_setDrawsOnlyBelowInfo:(id)a3;
- (void)p_drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4 includeMargin:(BOOL)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentsScale:(double)a3;
- (void)setDistortedToMatch:(BOOL)a3;
- (void)setImageMustHaveEvenDimensions:(BOOL)a3;
- (void)setInfos:(id)a3;
- (void)setInfos:(id)a3 allowLayoutIfNeeded:(BOOL)a4;
- (void)setIsPrinting:(BOOL)a3;
- (void)setMaximumImagePixelSize:(CGSize)a3;
- (void)setMayBeReused:(BOOL)a3;
- (void)setPostRenderAction:(id)a3;
- (void)setPreviousRenderDatasNeedingDownload:(id)a3;
- (void)setScaledImageSize:(CGSize)a3;
- (void)setShouldReuseBitmapContext:(BOOL)a3;
- (void)setShouldShowInstructionalText:(BOOL)a3;
- (void)setShouldSuppressBackgrounds:(BOOL)a3;
- (void)setUnscaledClipRect:(CGRect)a3;
- (void)setViewScale:(double)a3;
@end

@implementation CRLCanvasImager

- (CRLCanvasImager)initWithBoard:(id)a3
{
  return [(CRLCanvasImager *)self initWithBoard:a3 renderForWideGamut:1];
}

- (CRLCanvasImager)initWithBoard:(id)a3 renderForWideGamut:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0090);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E780();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D00B0);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager initWithBoard:renderForWideGamut:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 83, 0, "invalid nil value for '%{public}s'", "board");
  }
  v21.receiver = self;
  v21.super_class = (Class)CRLCanvasImager;
  v10 = [(CRLCanvasImager *)&v21 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->mBoard, v6);
    CGSize size = CGRectInfinite.size;
    v11->mUnscaledClipRect.origin = CGRectInfinite.origin;
    v11->mUnscaledClipRect.CGSize size = size;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v11->mViewScale = _Q0;
    v18 = objc_alloc_init(CRLCanvas);
    mCanvas = v11->mCanvas;
    v11->mCanvas = v18;

    [(CRLCanvas *)v11->mCanvas i_setCanvasIsWideGamut:v4];
    [(CRLCanvas *)v11->mCanvas setDelegate:v11];
  }

  return v11;
}

- (void)dealloc
{
  [(CRLCanvas *)self->mCanvas teardown];
  sub_1004552DC((uint64_t)self->mReusableBitmapContext);
  CGContextRelease(self->mReusableBitmapContext);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasImager;
  [(CRLCanvasImager *)&v3 dealloc];
}

- (NSString)boardTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mBoard);
  objc_super v3 = [WeakRetained title];

  return (NSString *)v3;
}

- (void)setPostRenderAction:(id)a3
{
  id v4 = [a3 copy];
  id mPostRenderAction = self->mPostRenderAction;
  self->id mPostRenderAction = v4;
}

- (void)setInfos:(id)a3
{
}

- (void)setInfos:(id)a3 allowLayoutIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (NSArray *)a3;
  v8 = v7;
  p_mInfos = &self->mInfos;
  if (self->mInfos != v7)
  {
    BOOL v32 = v4;
    if (v7 && [(NSArray *)v7 count] && self->mHasBeenUsed && !self->mMayBeReused)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      v10 = self;
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D00D0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106E830();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D00F0);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setInfos:allowLayoutIfNeeded:]");
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:123 isFatal:0 description:"Should not reuse an imager unless it has been explicitly marked as safe to reuse"];

      self = v10;
    }
    v33 = self;
    objc_storeStrong((id *)p_mInfos, a3);
    v14 = +[NSMutableDictionary dictionary];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v34 = v8;
    obj = v8;
    id v15 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v36 = *(void *)v42;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v42 != v36) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v19 = objc_opt_class();
          v20 = sub_1002469D0(v19, v18);
          objc_super v21 = v20;
          if (v20)
          {
            v22 = [v20 id];
            [v14 setObject:v21 forKeyedSubscript:v22];

            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            v23 = [v21 additionalBoardItemsForUUIDBookkeepingForTemporaryCanvases];
            id v24 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v24)
            {
              id v25 = v24;
              uint64_t v26 = *(void *)v38;
              do
              {
                for (j = 0; j != v25; j = (char *)j + 1)
                {
                  if (*(void *)v38 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  v28 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
                  v29 = [v28 id];
                  [v14 setObject:v28 forKeyedSubscript:v29];
                }
                id v25 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
              }
              while (v25);
            }
          }
        }
        id v16 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v16);
    }

    v30 = (NSDictionary *)[v14 copy];
    mItemsByUUID = v33->mItemsByUUID;
    v33->mItemsByUUID = v30;

    if (![(NSArray *)v33->mInfos count])
    {
      [(CRLCanvas *)v33->mCanvas setInfosToDisplay:v33->mInfos];
      if (v32) {
        [(CRLCanvas *)v33->mCanvas nonInteractiveLayoutIfNeeded];
      }
    }

    v8 = v34;
  }
}

- (double)viewScale
{
  if (self->mUseScaledImageSize)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0110);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E8B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0130);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager viewScale]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:153 isFatal:0 description:"Cannot call viewScale if scaledImageSize has been set."];
  }
  return self->mViewScale;
}

- (void)setViewScale:(double)a3
{
  if (a3 <= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0150);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E940();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0170);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setViewScale:]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:159 isFatal:0 description:"viewScale must be > 0.0"];
  }
  else
  {
    self->mViewScale = a3;
    self->mScaledImageSize = CGSizeZero;
    self->mUseScaledImageSize = 0;
  }
}

- (double)contentsScale
{
  if (self->mUseScaledImageSize)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0190);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E9C8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D01B0);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager contentsScale]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:169 isFatal:0 description:"Cannot call contentsScale if scaledImageSize has been set."];
  }
  return self->mContentsScale;
}

- (void)setContentsScale:(double)a3
{
  if (a3 <= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D01D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106EA50();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D01F0);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setContentsScale:]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:175 isFatal:0 description:"contentsScale must be > 0.0"];
  }
  else
  {
    self->mContentsScale = a3;
    self->mScaledImageSize = CGSizeZero;
    self->mUseScaledImageSize = 0;
  }
}

- (CGSize)scaledImageSize
{
  if (!self->mUseScaledImageSize)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0210);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106EAD8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0230);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager scaledImageSize]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:185 isFatal:0 description:"Cannot call scaledImageSize if viewScale or contentsScale has been set."];
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
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0250);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106EBE8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0270);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setScaledImageSize:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:190 isFatal:0 description:"can't make an image with 0 width or height"];
  }
  double v10 = sub_1000674B8(width);
  CGFloat v11 = v9;
  if (width != v10 || height != v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0290);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106EB60();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D02B0);
    }
    v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setScaledImageSize:]");
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:192 isFatal:0 description:"given a non-integral scaled image size"];
  }
  self->mScaledImageSize.double width = v10;
  self->mScaledImageSize.double height = v11;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->mViewScale = _Q0;
  self->mUseScaledImageSize = 1;
}

- (CGSize)maximumImagePixelSize
{
  double width = self->mMaximumImagePixelSize.width;
  double height = self->mMaximumImagePixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumImagePixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v7 = sub_1000674B8(a3.width);
  CGFloat v8 = v6;
  if (width != v7 || height != v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D02D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106EC70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D02F0);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    CGFloat v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setMaximumImagePixelSize:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:205 isFatal:0 description:"given a non-integral maximum image size"];
  }
  self->mMaximumImagePixelSize.double width = v7;
  self->mMaximumImagePixelSize.double height = v8;
}

- (void)i_setDrawsOnlyBelowInfo:(id)a3
{
}

- (CGImage)newImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mBoard);
  if (!WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0310);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106ECF8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0330);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager newImage]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 221, 0, "invalid nil value for '%{public}s'", "board");

    goto LABEL_15;
  }
  if (![(CRLCanvasImager *)self p_configureCanvas])
  {
LABEL_15:
    BOOL v4 = 0;
    goto LABEL_21;
  }
  if (self->mUseScaledImageSize)
  {
    if ([(CRLCanvasImager *)self shouldReuseBitmapContext])
    {
      BOOL v4 = [(CRLCanvasImager *)self p_newImageInReusableContext];
      goto LABEL_19;
    }
    CGFloat v8 = -[CRLCanvas i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:keepingChildrenPassingTest:](self->mCanvas, "i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:keepingChildrenPassingTest:", self->mDistortedToMatch, self->mInfoToDrawBeneathFilter, self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height, self->mScaledImageSize.width, self->mScaledImageSize.height);
  }
  else
  {
    CGFloat v8 = -[CRLCanvas i_imageInScaledRect:keepingChildrenPassingTest:](self->mCanvas, "i_imageInScaledRect:keepingChildrenPassingTest:", self->mInfoToDrawBeneathFilter, self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height);
  }
  BOOL v4 = v8;
  double v9 = [(CRLCanvas *)self->mCanvas i_previousRenderDatasNeedingDownload];
  [(CRLCanvasImager *)self setPreviousRenderDatasNeedingDownload:v9];

LABEL_19:
  id mPostRenderAction = (void (**)(id, void, CRLCanvas *))self->mPostRenderAction;
  if (mPostRenderAction) {
    mPostRenderAction[2](mPostRenderAction, 0, self->mCanvas);
  }
LABEL_21:
  self->mHasBeenUsed = 1;

  return v4;
}

- (id)generateImage
{
  v2 = [(CRLCanvasImager *)self newImage];
  if (v2)
  {
    objc_super v3 = v2;
    BOOL v4 = +[CRLImage imageWithCGImage:v2];
    CGImageRelease(v3);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)pngData
{
  v2 = [(CRLCanvasImager *)self newImage];
  if (v2)
  {
    objc_super v3 = v2;
    BOOL v4 = sub_10047EC98(v2);
    CGImageRelease(v3);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)pdfData
{
  if ([(CRLCanvasImager *)self p_configureCanvas])
  {
    objc_super v3 = (__CFData *)objc_alloc_init((Class)NSMutableData);
    BOOL v4 = v3;
    if (v3 && (CGDataConsumerRef v5 = CGDataConsumerCreateWithCFData(v3)) != 0)
    {
      double v6 = v5;
      v13.origin.x = sub_100064070();
      v13.origin.y = v7;
      v13.size.double width = v8;
      v13.size.double height = v9;
      double v10 = CGPDFContextCreate(v6, &v13, 0);
      [(CRLCanvasImager *)self p_drawPageInContext:v10 createPage:1 includeMargin:0];
      CGPDFContextClose(v10);
      CGContextRelease(v10);
      CGFloat v11 = v4;
      CGDataConsumerRelease(v6);
    }
    else
    {
      CGFloat v11 = 0;
    }
  }
  else
  {
    CGFloat v11 = 0;
  }
  self->mHasBeenUsed = 1;

  return v11;
}

- (BOOL)drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4 includeMargin:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v9 = [(CRLCanvasImager *)self p_configureCanvas];
  if (v9) {
    [(CRLCanvasImager *)self p_drawPageInContext:a3 createPage:v6 includeMargin:v5];
  }
  return v9;
}

- (id)boardItemOwnerForCanvas:(id)a3
{
  if (self->mCanvas != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0350);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106EDA8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0370);
    }
    BOOL v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    BOOL v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager boardItemOwnerForCanvas:]");
    BOOL v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:346 isFatal:0 description:"wrong canvas"];
  }
  return self;
}

- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3
{
  mCanvas = (CRLCanvas *)a3;
  BOOL v5 = mCanvas;
  if (self->mCanvas != mCanvas)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0390);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106EE30();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D03B0);
    }
    BOOL v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    CGFloat v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager visibleScaledBoundsForClippingRepsOnCanvas:]");
    CGFloat v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:352 isFatal:0 description:"wrong canvas"];

    mCanvas = self->mCanvas;
  }
  [(CRLCanvas *)mCanvas viewScale];
  double v10 = sub_1000652FC(self->mUnscaledClipRect.origin.x, self->mUnscaledClipRect.origin.y, self->mUnscaledClipRect.size.width, self->mUnscaledClipRect.size.height, v9);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)isCanvasDrawingIntoPDF:(id)a3
{
  if (self->mCanvas != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D03D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106EEB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D03F0);
    }
    BOOL v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    BOOL v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager isCanvasDrawingIntoPDF:]");
    BOOL v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:358 isFatal:0 description:"wrong canvas"];
  }
  return self->mDrawingIntoPDF;
}

- (BOOL)isPrintingCanvas
{
  return self->mIsPrinting;
}

- (id)getBoardItemForUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSDictionary *)self->mItemsByUUID objectForKeyedSubscript:v4];
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mBoard);
    BOOL v5 = [WeakRetained getBoardItemForUUID:v4];
  }

  return v5;
}

- (CGRect)actualScaledClipRect
{
  [(CRLCanvasImager *)self p_configureCanvas];
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

- (BOOL)p_configureCanvas
{
  [(CRLCanvas *)self->mCanvas setBackgroundColor:self->mBackgroundColor];
  [(CRLCanvas *)self->mCanvas setInfosToDisplay:self->mInfos];
  [(CRLCanvas *)self->mCanvas setEnableInstructionalText:[(CRLCanvasImager *)self shouldShowInstructionalText]];
  if ([(CRLCanvasImager *)self mayBeReused]) {
    [(CRLCanvas *)self->mCanvas recreateAllLayoutsAndReps];
  }
  [(CRLCanvas *)self->mCanvas nonInteractiveLayoutIfNeeded];
  double x = self->mUnscaledClipRect.origin.x;
  CGFloat y = self->mUnscaledClipRect.origin.y;
  double width = self->mUnscaledClipRect.size.width;
  double height = self->mUnscaledClipRect.size.height;
  v78.origin.double x = CGRectInfinite.origin.x;
  v78.origin.CGFloat y = CGRectInfinite.origin.y;
  v78.size.double width = CGRectInfinite.size.width;
  v78.size.double height = CGRectInfinite.size.height;
  v73.origin.double x = x;
  v73.origin.CGFloat y = y;
  v73.size.double width = width;
  v73.size.double height = height;
  if (CGRectEqualToRect(v73, v78))
  {
    [(CRLCanvas *)self->mCanvas unscaledRectOfLayouts];
    double x = v7;
    CGFloat y = v8;
    double width = v9;
    double height = v10;
  }
  v74.origin.double x = x;
  v74.origin.CGFloat y = y;
  v74.size.double width = width;
  v74.size.double height = height;
  float MinX = CGRectGetMinX(v74);
  double v12 = fminf(MinX, 0.0);
  v75.origin.double x = x;
  v75.origin.CGFloat y = y;
  v75.size.double width = width;
  v75.size.double height = height;
  float MinY = CGRectGetMinY(v75);
  double v14 = fminf(MinY, 0.0);
  v76.origin.double x = x;
  v76.origin.CGFloat y = y;
  v76.size.double width = width;
  v76.size.double height = height;
  float MaxX = CGRectGetMaxX(v76);
  double v16 = fmaxf(MaxX, 0.0);
  v77.origin.double x = x;
  v77.origin.CGFloat y = y;
  v77.size.double width = width;
  v77.size.double height = height;
  float MaxY = CGRectGetMaxY(v77);
  double v18 = v16 - v12;
  double v19 = fmaxf(MaxY, 0.0) - v14;
  BOOL v20 = v19 > 0.0 && v18 > 0.0;
  if (v20)
  {
    [(CRLCanvas *)self->mCanvas unscaledSize];
    if (v22 != v18 || v21 != v19)
    {
      -[CRLCanvas setUnscaledSize:](self->mCanvas, "setUnscaledSize:", v18, v19);
      [(CRLCanvas *)self->mCanvas nonInteractiveLayoutIfNeeded];
    }
    if (self->mUseScaledImageSize)
    {
      float v24 = self->mScaledImageSize.width / width;
      float v25 = self->mScaledImageSize.height / height;
      double mViewScale = fminf(v24, v25);
      double mContentsScale = 1.0;
    }
    else
    {
      double mViewScale = self->mViewScale;
      double mContentsScale = self->mContentsScale;
    }
    double v28 = self->mMaximumImagePixelSize.width;
    if (v28 != 0.0 || self->mMaximumImagePixelSize.height != 0.0)
    {
      if (self->mUseScaledImageSize)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D0410);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106EFC8();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D0430);
        }
        v29 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v29);
        }
        v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager p_configureCanvas]");
        v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
        +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:444 isFatal:0 description:"Using a specific scaled image size and max image size at the same time is unsupported."];

        double v28 = self->mMaximumImagePixelSize.width;
      }
      double v32 = sub_1000646A4(width, height, mViewScale);
      double v34 = sub_1000646A4(v32, v33, mContentsScale);
      double v36 = self->mMaximumImagePixelSize.height;
      if (v34 > v28 || v35 > v36)
      {
        double v38 = v34 / v28;
        if (v28 == 0.0) {
          double v39 = 0.0;
        }
        else {
          double v39 = v38;
        }
        if (v36 == 0.0) {
          double v40 = 0.0;
        }
        else {
          double v40 = v35 / v36;
        }
        if (v39 == 0.0 && v40 == 0.0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D0450);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106EF40();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D0470);
          }
          long long v41 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v41);
          }
          long long v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager p_configureCanvas]");
          long long v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
          +[CRLAssertionHandler handleFailureInFunction:v42 file:v43 lineNumber:451 isFatal:0 description:"both ratios in imager are zero!"];
        }
        if (v39 <= v40) {
          double v44 = v40;
        }
        else {
          double v44 = v39;
        }
        double mViewScale = mViewScale * (1.0 / v44);
      }
    }
    [(CRLCanvas *)self->mCanvas setViewScale:mViewScale];
    [(CRLCanvas *)self->mCanvas i_setContentsScale:mContentsScale];
    [(CRLCanvas *)self->mCanvas viewScale];
    self->mActualScaledClipRect.origin.double x = sub_1000652FC(x, y, width, height, v45);
    self->mActualScaledClipRect.origin.CGFloat y = v46;
    self->mActualScaledClipRect.size.double width = v47;
    self->mActualScaledClipRect.size.double height = v48;
    if (self->mUseScaledImageSize && self->mImageMustHaveEvenDimensions)
    {
      -[CRLCanvasImager p_evenDimensionsWithSize:](self, "p_evenDimensionsWithSize:", v47, v48);
      self->mActualScaledClipRect.size.double width = v49;
      self->mActualScaledClipRect.size.double height = v50;
      -[CRLCanvasImager p_evenDimensionsWithSize:](self, "p_evenDimensionsWithSize:", self->mScaledImageSize.width, self->mScaledImageSize.height);
      self->mScaledImageSize.double width = v51;
      self->mScaledImageSize.double height = v52;
    }
    if (self->mInfoToDrawBeneath)
    {
      id v53 = objc_alloc_init((Class)NSMutableSet);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v54 = [(CRLCanvas *)self->mCanvas allRepsOrdered];
      id v55 = [v54 countByEnumeratingWithState:&v68 objects:v72 count:16];
      if (v55)
      {
        id v56 = v55;
        uint64_t v57 = *(void *)v69;
LABEL_60:
        uint64_t v58 = 0;
        while (1)
        {
          if (*(void *)v69 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void **)(*((void *)&v68 + 1) + 8 * v58);
          v60 = [v59 info];
          mInfoToDrawBeneath = self->mInfoToDrawBeneath;

          if (v60 == mInfoToDrawBeneath) {
            break;
          }
          [v53 addObject:v59];
          if (v56 == (id)++v58)
          {
            id v56 = [v54 countByEnumeratingWithState:&v68 objects:v72 count:16];
            if (v56) {
              goto LABEL_60;
            }
            break;
          }
        }
      }

      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_10007EE20;
      v66[3] = &unk_1014D0498;
      id v67 = v53;
      id v62 = v53;
      id v63 = [v66 copy];
      id mInfoToDrawBeneathFilter = self->mInfoToDrawBeneathFilter;
      self->id mInfoToDrawBeneathFilter = v63;
    }
    else
    {
      id v62 = self->mInfoToDrawBeneathFilter;
      self->id mInfoToDrawBeneathFilter = 0;
    }
  }
  return v20;
}

- (CGSize)p_evenDimensionsWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  long double v5 = sub_1000674F0(a3.width, a3.height);
  double v7 = v6;
  double v8 = fmod(v6, 2.0);
  double v9 = fmod(v5, 2.0);
  if (v8 == 0.0)
  {
    double v10 = v7;
    if (v9 == 0.0)
    {
      double v10 = height;
      goto LABEL_22;
    }
  }
  else
  {
    double v10 = v7 + -1.0;
  }
  if (v9 == 0.0) {
    double width = v5;
  }
  else {
    double width = v5 + -1.0;
  }
  if (width > v5 || v10 > v7)
  {
    unsigned int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D04B8);
    }
    double v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110914;
      unsigned int v20 = v12;
      __int16 v21 = 2082;
      double v22 = "-[CRLCanvasImager p_evenDimensionsWithSize:]";
      __int16 v23 = 2082;
      float v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m";
      __int16 v25 = 1024;
      int v26 = 505;
      __int16 v27 = 2048;
      double v28 = width;
      __int16 v29 = 2048;
      double v30 = v10;
      __int16 v31 = 2048;
      long double v32 = v5;
      __int16 v33 = 2048;
      double v34 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New image dimensions (%f, %f) not calculated as expected from original size (%f, %f)! Image may be the wrong size.", buf, 0x4Au);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D04D8);
    }
    double v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    double v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager p_evenDimensionsWithSize:]");
    double v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 505, 0, "New image dimensions (%f, %f) not calculated as expected from original size (%f, %f)! Image may be the wrong size.", *(void *)&width, *(void *)&v10, *(void *)&v5, *(void *)&v7);
  }
LABEL_22:
  double v17 = width;
  double v18 = v10;
  result.CGFloat height = v18;
  result.double width = v17;
  return result;
}

- (void)p_drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4 includeMargin:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  self->mDrawingIntoPDF = 1;
  sub_1004559A4((uint64_t)a3, [(CRLCanvasImager *)self isPrinting], self->mDrawingIntoPDF, 0, [(CRLCanvas *)self->mCanvas shouldSuppressBackgrounds], 1.0);
  double v9 = 36.0;
  if (!v5) {
    double v9 = 0.0;
  }
  double v10 = self->mActualScaledClipRect.origin.x - v9;
  double v11 = self->mActualScaledClipRect.origin.y - v9;
  double v12 = self->mActualScaledClipRect.size.width + v9 * 2.0;
  double v13 = self->mActualScaledClipRect.size.height + v9 * 2.0;
  if (v6)
  {
    v19.origin.double x = sub_100064070();
    v19.origin.CGFloat y = v14;
    v19.size.double width = v15;
    v19.size.CGFloat height = v16;
    CGContextBeginPage(a3, &v19);
  }
  CGContextTranslateCTM(a3, 0.0, v13);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGContextTranslateCTM(a3, -v10, -v11);
  v20.origin.double x = v10;
  v20.origin.CGFloat y = v11;
  v20.size.double width = v12;
  v20.size.CGFloat height = v13;
  CGContextClipToRect(a3, v20);
  sub_100458964(a3);
  [(CRLCanvas *)self->mCanvas i_drawBackgroundInContext:a3];
  [(CRLCanvas *)self->mCanvas i_drawRepsInContext:a3 passingTest:self->mInfoToDrawBeneathFilter];
  double v17 = sub_100458FC8(a3);
  [(CRLCanvasImager *)self setPreviousRenderDatasNeedingDownload:v17];

  id mPostRenderAction = (void (**)(id, CGContext *, CRLCanvas *))self->mPostRenderAction;
  if (mPostRenderAction) {
    mPostRenderAction[2](mPostRenderAction, a3, self->mCanvas);
  }
  if (v6) {
    CGContextEndPage(a3);
  }
  sub_1004552DC((uint64_t)a3);
  self->mDrawingIntoPDF = 0;
}

- (CGImage)p_newImageInReusableContext
{
  if (![(CRLCanvasImager *)self shouldReuseBitmapContext])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D04F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106F050();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0518);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager p_newImageInReusableContext]");
    BOOL v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:563 isFatal:0 description:"shouldn't be reusing context"];
  }
  if (!self->mReusableBitmapContext) {
    goto LABEL_19;
  }
  if (!CGRectEqualToRect(self->mReusableActualScaledClipRect, self->mActualScaledClipRect)
    || (self->mReusableScaledImageSize.width == self->mScaledImageSize.width
      ? (BOOL v6 = self->mReusableScaledImageSize.height == self->mScaledImageSize.height)
      : (BOOL v6 = 0),
        !v6))
  {
    mReusableBitmapContext = self->mReusableBitmapContext;
    if (mReusableBitmapContext)
    {
      sub_1004552DC((uint64_t)mReusableBitmapContext);
      CGContextRelease(self->mReusableBitmapContext);
      self->mReusableBitmapContext = 0;
    }
LABEL_19:
    double v8 = -[CRLCanvas i_createContextToDrawImageInScaledRect:withTargetIntegralSize:distortedToMatch:returningBounds:integralBounds:](self->mCanvas, "i_createContextToDrawImageInScaledRect:withTargetIntegralSize:distortedToMatch:returningBounds:integralBounds:", self->mDistortedToMatch, &self->mReusableBounds, &self->mReusableIntegralBounds, self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height, self->mScaledImageSize.width, self->mScaledImageSize.height);
    self->mReusableBitmapContext = v8;
    sub_1004559A4((uint64_t)v8, [(CRLCanvasImager *)self isPrinting], self->mDrawingIntoPDF, 0, [(CRLCanvas *)self->mCanvas shouldSuppressBackgrounds], 1.0);
    CGSize size = self->mActualScaledClipRect.size;
    self->mReusableActualScaledClipRect.origin = self->mActualScaledClipRect.origin;
    self->mReusableActualScaledClipRect.CGSize size = size;
    self->mReusableScaledImageSize = self->mScaledImageSize;
    goto LABEL_20;
  }
  mBackgroundColor = self->mBackgroundColor;
  if (!mBackgroundColor || ([(CRLColor *)mBackgroundColor alphaComponent], v14 < 1.0))
  {
    v15.origin.double x = CGRectInfinite.origin.x;
    v15.origin.CGFloat y = CGRectInfinite.origin.y;
    v15.size.double width = CGRectInfinite.size.width;
    v15.size.CGFloat height = CGRectInfinite.size.height;
    CGContextClearRect(self->mReusableBitmapContext, v15);
  }
LABEL_20:
  sub_100458964(self->mReusableBitmapContext);
  double v10 = -[CRLCanvas i_newImageInContext:bounds:integralBounds:distortedToMatch:keepingChildrenPassingTest:](self->mCanvas, "i_newImageInContext:bounds:integralBounds:distortedToMatch:keepingChildrenPassingTest:", self->mReusableBitmapContext, self->mDistortedToMatch, self->mInfoToDrawBeneathFilter, self->mReusableBounds.origin.x, self->mReusableBounds.origin.y, self->mReusableBounds.size.width, self->mReusableBounds.size.height, self->mReusableIntegralBounds.origin.x, self->mReusableIntegralBounds.origin.y, self->mReusableIntegralBounds.size.width, self->mReusableIntegralBounds.size.height);
  double v11 = sub_100458FC8(self->mReusableBitmapContext);
  [(CRLCanvasImager *)self setPreviousRenderDatasNeedingDownload:v11];

  return v10;
}

- (CRLCanvas)canvas
{
  return self->mCanvas;
}

- (NSArray)infos
{
  return self->mInfos;
}

- (CRLColor)backgroundColor
{
  return self->mBackgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
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

- (BOOL)distortedToMatch
{
  return self->mDistortedToMatch;
}

- (void)setDistortedToMatch:(BOOL)a3
{
  self->mDistortedToMatch = a3;
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

- (BOOL)shouldShowInstructionalText
{
  return self->mShouldShowInstructionalText;
}

- (void)setShouldShowInstructionalText:(BOOL)a3
{
  self->mShouldShowInstructionalText = a3;
}

- (BOOL)isPrinting
{
  return self->mIsPrinting;
}

- (void)setIsPrinting:(BOOL)a3
{
  self->mIsPrinting = a3;
}

- (NSSet)previousRenderDatasNeedingDownload
{
  return self->mPreviousRenderDatasNeedingDownload;
}

- (void)setPreviousRenderDatasNeedingDownload:(id)a3
{
}

- (BOOL)mayBeReused
{
  return self->mMayBeReused;
}

- (void)setMayBeReused:(BOOL)a3
{
  self->mMayBeReused = a3;
}

- (BOOL)shouldSuppressBackgrounds
{
  return self->mShouldSuppressBackgrounds;
}

- (void)setShouldSuppressBackgrounds:(BOOL)a3
{
  self->mShouldSuppressBackgrounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mInfoToDrawBeneathFilter, 0);
  objc_storeStrong((id *)&self->mInfoToDrawBeneath, 0);
  objc_storeStrong(&self->mPostRenderAction, 0);
  objc_storeStrong((id *)&self->mPreviousRenderDatasNeedingDownload, 0);
  objc_storeStrong((id *)&self->mCanvas, 0);
  objc_destroyWeak((id *)&self->mBoard);
  objc_storeStrong((id *)&self->mBackgroundColor, 0);
  objc_storeStrong((id *)&self->mItemsByUUID, 0);

  objc_storeStrong((id *)&self->mInfos, 0);
}

@end