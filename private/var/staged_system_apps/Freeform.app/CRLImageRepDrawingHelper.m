@interface CRLImageRepDrawingHelper
- (BOOL)canRenderDirectlyManagedForRenderable:(id)a3;
- (BOOL)drawsBitmap;
- (BOOL)drawsError;
- (BOOL)imagePrefersDrawing;
- (BOOL)isDesiredImageSizePerceptuallyMuchBiggerThanGeneratedImageSize;
- (BOOL)isGeneratingSizedImageWithBakedMask;
- (BOOL)p_canDrawThumbnailAsSizedImage;
- (BOOL)p_generateSizedImage:(id)a3;
- (BOOL)shouldShowLoadingUI;
- (CGImage)sizedImage;
- (CGRect)imageRectInContext:(CGContext *)a3;
- (CGRect)p_antialiasingDefeatedRectForRect:(CGRect)a3 inContext:(CGContext *)a4;
- (CGSize)p_desiredSizedImageSize;
- (CGSize)p_imagePixelSize;
- (CRLImageRepDrawingDataSource)rep;
- (CRLImageRepDrawingHelper)initWithRep:(id)a3;
- (_TtC8Freeform8CRLAsset)imageDataForDrawing;
- (id)contentsRecipeForDirectlyManagedRenderable:(id)a3;
- (id)p_contentsRecipeForDirectlyManagedRenderable:(id)a3 requiringProperlySizedImage:(BOOL)a4;
- (id)p_desiredSizedImageDescription;
- (id)p_imageProvider;
- (id)p_validatedBitmapImageProvider;
- (id)p_validatedImageProvider;
- (id)p_validatedThumbnailImageProvider;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 forLayer:(BOOL)a4 forShadowOrHitTest:(BOOL)a5;
- (void)generateSizedImageIfNeeded;
- (void)invalidateSizedImage;
- (void)invalidateSizedImageIfItHasBakedMask;
- (void)invalidateSizedImageIfNeededForBakedMaskPathFromBlock:(id)a3;
- (void)p_invalidateSizedImageOnAccessQueue;
- (void)p_prepareToGenerateSizedImageWithDescription:(id)a3;
- (void)p_retryGeneratingSizedImageIfPossible;
- (void)p_startGeneratingSizedImage;
- (void)p_takeSizedImageFromStateIfReady;
- (void)retryGeneratingSizedImageIfNeeded;
- (void)teardown;
@end

@implementation CRLImageRepDrawingHelper

- (CRLImageRepDrawingHelper)initWithRep:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLImageRepDrawingHelper;
  v5 = [(CRLImageRepDrawingHelper *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_rep, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.freeform.CRLImageRepDrawingHelper.sizedImage", 0);
    sizedImageAccessQueue = v6->_sizedImageAccessQueue;
    v6->_sizedImageAccessQueue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

- (void)dealloc
{
  CGImageRelease(self->_sizedImage);
  CGPathRelease(self->_sizedImageMaskPath);
  v3.receiver = self;
  v3.super_class = (Class)CRLImageRepDrawingHelper;
  [(CRLImageRepDrawingHelper *)&v3 dealloc];
}

- (void)teardown
{
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100459910;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_sync(sizedImageAccessQueue, block);
}

- (CGRect)imageRectInContext:(CGContext *)a3
{
  v5 = [(CRLImageRepDrawingHelper *)self rep];
  v6 = v5;
  if (v5)
  {
    [v5 imageDrawingHelperImageRect:self];
    double x = v7;
    double y = v9;
    double width = v11;
    double height = v13;
    v15 = [(CRLImageRepDrawingHelper *)self rep];
    v16 = [v15 canvas];
    if ([v16 isDrawingIntoPDF])
    {
    }
    else
    {
      v20 = [(CRLImageRepDrawingHelper *)self rep];
      v21 = [v20 canvas];
      unsigned __int8 v22 = [v21 isPrinting];

      if ((v22 & 1) == 0)
      {
        -[CRLImageRepDrawingHelper p_antialiasingDefeatedRectForRect:inContext:](self, "p_antialiasingDefeatedRectForRect:inContext:", a3, x, y, width, height);
        double x = v23;
        double y = v24;
        double width = v25;
        double height = v26;
      }
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB070);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4638();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB090);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper imageRectInContext:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 83, 0, "invalid nil value for '%{public}s'", "rep");

    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (void)drawInContext:(CGContext *)a3 forLayer:(BOOL)a4 forShadowOrHitTest:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double v9 = [(CRLImageRepDrawingHelper *)self rep];
  if (v9)
  {
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = 0;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v51 = 0;
    sizedImageAccessQueue = self->_sizedImageAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10045A300;
    block[3] = &unk_1014E5CA0;
    block[4] = self;
    void block[5] = &v52;
    block[6] = &v48;
    dispatch_sync(sizedImageAccessQueue, block);
    [(CRLImageRepDrawingHelper *)self imageRectInContext:a3];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    if (!v5 || ([v9 imageDrawingHelperImageHasAlpha:self] & 1) != 0)
    {
      if (v53[3] && ![(CRLImageRepDrawingHelper *)self imagePrefersDrawing])
      {
        v57.origin.double x = v12;
        v57.origin.double y = v14;
        v57.size.double width = v16;
        v57.size.double height = v18;
        double MinY = CGRectGetMinY(v57);
        v58.origin.double x = v12;
        v58.origin.double y = v14;
        v58.size.double width = v16;
        v58.size.double height = v18;
        CGFloat MaxY = CGRectGetMaxY(v58);
        CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
        CGContextScaleCTM(a3, 1.0, -1.0);
        sub_10043A6BC((CGAffineTransform *)v49[3], 1, (uint64_t)&transform, v12, v14, v16, v18);
        CGContextConcatCTM(a3, &transform);
        v59.origin.double x = v12;
        v59.origin.double y = v14;
        v59.size.double width = v16;
        v59.size.double height = v18;
        CGContextDrawImage(a3, v59, (CGImageRef)v53[3]);
        goto LABEL_34;
      }
      if (![(CRLImageRepDrawingHelper *)self shouldShowLoadingUI])
      {
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2020000000;
        char v45 = 0;
        unsigned __int8 v22 = self->_sizedImageAccessQueue;
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10045A350;
        v41[3] = &unk_1014CB090;
        v41[4] = self;
        v41[5] = &v42;
        dispatch_sync(v22, v41);
        if ([(CRLImageRepDrawingHelper *)self p_canDrawThumbnailAsSizedImage]
          || v6 && *((unsigned char *)v43 + 24))
        {
          double v23 = [(CRLImageRepDrawingHelper *)self p_validatedThumbnailImageProvider];
          if (v23 && ![(CRLImageRepDrawingHelper *)self imagePrefersDrawing])
          {
            v37 = [v23 CGImageForSize:a3 inContext:0 orContentsScaleProvider:v16, v18];
            v60.origin.double x = v12;
            v60.origin.double y = v14;
            v60.size.double width = v16;
            v60.size.double height = v18;
            double v38 = CGRectGetMinY(v60);
            v61.origin.double x = v12;
            v61.origin.double y = v14;
            v61.size.double width = v16;
            v61.size.double height = v18;
            CGFloat v39 = CGRectGetMaxY(v61);
            CGContextTranslateCTM(a3, 0.0, v38 + v39);
            CGContextScaleCTM(a3, 1.0, -1.0);
            sub_10043A6BC((CGAffineTransform *)v49[3], 1, (uint64_t)&v40, v12, v14, v16, v18);
            CGContextConcatCTM(a3, &v40);
            v62.origin.double x = v12;
            v62.origin.double y = v14;
            v62.size.double width = v16;
            v62.size.double height = v18;
            CGContextDrawImage(a3, v62, v37);
          }
          else
          {
            double v24 = [(CRLImageRepDrawingHelper *)self p_validatedImageProvider];
            [v24 drawImageInContext:a3 rect:v12, v14, v16, v18];
          }
        }
        else
        {
          double v23 = [(CRLImageRepDrawingHelper *)self p_validatedImageProvider];
          if ([v23 isError])
          {
            v34 = [(CRLImageRepDrawingHelper *)self p_validatedThumbnailImageProvider];
            v35 = v34;
            if (v34)
            {
              id v36 = v34;

              double v23 = v36;
            }
          }
          [v23 drawImageInContext:a3 rect:v12, v14, v16, v18];
        }

        _Block_object_dispose(&v42, 8);
        goto LABEL_34;
      }
      if (!v5)
      {
        uint64_t v28 = objc_opt_class();
        double v29 = [(CRLImageRepDrawingHelper *)self rep];
        double v30 = sub_1002469D0(v28, v29);

        v31 = [_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper alloc];
        v32 = [(CRLImageRepDrawingHelper *)self imageDataForDrawing];
        v33 = [(CRLImageUndownloadedAssetDrawingHelper *)v31 initWithImageRep:v30 asset:v32];

        -[CRLImageUndownloadedAssetDrawingHelper drawInConext:withOriginalImageRect:](v33, "drawInConext:withOriginalImageRect:", a3, v12, v14, v16, v18);
        goto LABEL_34;
      }
    }
    double v25 = +[CRLColor blackColor];
    CGContextSetFillColorWithColor(a3, (CGColorRef)[v25 CGColor]);

    v56.origin.double x = v12;
    v56.origin.double y = v14;
    v56.size.double width = v16;
    v56.size.double height = v18;
    CGContextFillRect(a3, v56);
LABEL_34:
    CGImageRelease((CGImageRef)v53[3]);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);
    goto LABEL_35;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FB0B0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B4774();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FB0D0);
  }
  v19 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B46CC(v19);
  }
  v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper drawInContext:forLayer:forShadowOrHitTest:]");
  v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 101, 0, "invalid nil value for '%{public}s'", "rep");

LABEL_35:
}

- (CGRect)p_antialiasingDefeatedRectForRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_super v10 = [(CRLImageRepDrawingHelper *)self rep];
  double v11 = v10;
  if (v10)
  {
    memset(&v36, 0, sizeof(v36));
    [v10 imageDrawingHelperImageTransformInRootForAntialiasingDefeat:self];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB0F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4808();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB110);
    }
    CGFloat v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_antialiasingDefeatedRectForRect:inContext:]");
    CGFloat v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 184, 0, "invalid nil value for '%{public}s'", "rep");

    memset(&v36, 0, sizeof(v36));
  }
  CGAffineTransform v35 = v36;
  if (sub_10007F964(&v35.a))
  {
    CGAffineTransform v35 = v36;
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    CGRect v38 = CGRectApplyAffineTransform(v37, &v35);
    double v15 = v38.origin.x;
    CGFloat v16 = v38.origin.y;
    CGFloat v17 = v38.size.width;
    CGFloat v18 = v38.size.height;
    double v19 = sub_100458664((uint64_t)a4);
    v20 = [v11 canvas];
    [v20 viewScale];
    double v22 = v21;

    double v23 = sub_100067584(v15, v16, v17, v18, v19 * v22);
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGAffineTransform v35 = v36;
    CGAffineTransformInvert(&v34, &v35);
    v39.origin.CGFloat x = v23;
    v39.origin.CGFloat y = v25;
    v39.size.CGFloat width = v27;
    v39.size.CGFloat height = v29;
    CGRect v40 = CGRectApplyAffineTransform(v39, &v34);
    CGFloat x = v40.origin.x;
    CGFloat y = v40.origin.y;
    CGFloat width = v40.size.width;
    CGFloat height = v40.size.height;
  }

  double v30 = x;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (BOOL)p_canDrawThumbnailAsSizedImage
{
  objc_super v3 = [(CRLImageRepDrawingHelper *)self rep];
  id v4 = v3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB130);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B489C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB150);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    BOOL v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_canDrawThumbnailAsSizedImage]");
    BOOL v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 207, 0, "invalid nil value for '%{public}s'", "rep");
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v5 = [v3 canvas];
  if ([v5 isCanvasInteractive])
  {
    BOOL v6 = [(CRLImageRepDrawingHelper *)self p_validatedBitmapImageProvider];
    if ([v6 isError])
    {
      BOOL v7 = 1;
    }
    else
    {
      [v6 naturalSize];
      double v10 = v9;
      double v12 = v11;
      double v13 = sub_100454A60();
      double v15 = sub_1000646A4(v13, v14, 0.5);
      BOOL v7 = v10 * v12 >= v15 * v16;
    }
LABEL_16:

    goto LABEL_17;
  }
  BOOL v7 = 0;
LABEL_17:

  return v7;
}

- (id)contentsRecipeForDirectlyManagedRenderable:(id)a3
{
  return [(CRLImageRepDrawingHelper *)self p_contentsRecipeForDirectlyManagedRenderable:a3 requiringProperlySizedImage:1];
}

- (BOOL)canRenderDirectlyManagedForRenderable:(id)a3
{
  objc_super v3 = [(CRLImageRepDrawingHelper *)self p_contentsRecipeForDirectlyManagedRenderable:a3 requiringProperlySizedImage:0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)p_contentsRecipeForDirectlyManagedRenderable:(id)a3 requiringProperlySizedImage:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(CRLImageRepDrawingHelper *)self rep];
  if (v7)
  {
    [(CRLImageRepDrawingHelper *)self p_takeSizedImageFromStateIfReady];
    uint64_t v32 = 0;
    double v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    uint64_t v28 = 0;
    CGFloat v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    uint64_t v24 = 0;
    CGFloat v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    char v23 = 1;
    sizedImageAccessQueue = self->_sizedImageAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10045AD04;
    block[3] = &unk_1014FB1B8;
    block[4] = self;
    CGFloat v17 = &v32;
    CGFloat v18 = &v28;
    double v19 = &v24;
    BOOL v21 = a4;
    id v16 = v6;
    v20 = v22;
    dispatch_sync(sizedImageAccessQueue, block);
    if (v33[3])
    {
      double v9 = [CRLImageRepLayerContentsRecipe alloc];
      double v10 = [(CRLImageRepLayerContentsRecipe *)v9 initWithImage:v33[3] orientation:v29[3] hasBakedMask:*((unsigned __int8 *)v25 + 24)];
    }
    else
    {
      double v10 = 0;
    }

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB170);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B49D8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB190);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4930(v11);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_contentsRecipeForDirectlyManagedRenderable:requiringProperlySizedImage:]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 245, 0, "invalid nil value for '%{public}s'", "rep");

    double v10 = 0;
  }

  return v10;
}

- (_TtC8Freeform8CRLAsset)imageDataForDrawing
{
  objc_super v3 = [(CRLImageRepDrawingHelper *)self rep];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB1D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4A6C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB1F8);
    }
    BOOL v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    BOOL v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper imageDataForDrawing]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 300, 0, "invalid nil value for '%{public}s'", "rep");
  }
  BOOL v7 = [v3 imageDrawingHelperImageData:self];
  if (([v7 needsDownload] & 1) != 0
    || (+[CRLAsset null],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7 == v8))
  {
    double v9 = [v3 imageDrawingHelperThumbnailImageData:self];
    double v10 = v9;
    if (v9)
    {
      id v11 = v9;

      BOOL v7 = v11;
    }
  }

  return (_TtC8Freeform8CRLAsset *)v7;
}

- (BOOL)drawsError
{
  v2 = [(CRLImageRepDrawingHelper *)self p_validatedImageProvider];
  unsigned __int8 v3 = [v2 isError];

  return v3;
}

- (BOOL)drawsBitmap
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10045B240;
  v9[3] = &unk_1014CB090;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(sizedImageAccessQueue, v9);
  if (!*((unsigned char *)v11 + 24))
  {
    unsigned int v5 = [(CRLImageRepDrawingHelper *)self p_canDrawThumbnailAsSizedImage];
    if (v5
      && ([(CRLImageRepDrawingHelper *)self p_validatedThumbnailImageProvider],
          (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      BOOL v4 = 1;
    }
    else
    {
      BOOL v7 = [(CRLImageRepDrawingHelper *)self p_validatedBitmapImageProvider];
      BOOL v4 = v7 != 0;

      if (!v5) {
        goto LABEL_9;
      }
      id v6 = 0;
    }

    goto LABEL_9;
  }
  BOOL v4 = 1;
LABEL_9:
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (BOOL)imagePrefersDrawing
{
  unsigned __int8 v3 = [(CRLImageRepDrawingHelper *)self rep];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB218);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4B00();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB238);
    }
    BOOL v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    unsigned int v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper imagePrefersDrawing]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 330, 0, "invalid nil value for '%{public}s'", "rep");
  }
  [(CRLImageRepDrawingHelper *)self p_imagePixelSize];
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CRLImageRepDrawingHelper *)self p_validatedImageProvider];
  [v11 naturalSize];
  double v13 = v12;
  double v15 = v14;

  BOOL v16 = v8 <= v13 && v10 <= v15;
  BOOL v20 = 0;
  if (!v16)
  {
    CGFloat v17 = [(CRLImageRepDrawingHelper *)self p_imageProvider];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (v8 > sub_100454A60() || (sub_100454A60(), v10 > v19)) {
        BOOL v20 = 1;
      }
    }
  }

  return v20;
}

- (BOOL)shouldShowLoadingUI
{
  v2 = [(CRLImageRepDrawingHelper *)self imageDataForDrawing];
  unsigned __int8 v3 = [v2 needsDownload];

  return v3;
}

- (CGSize)p_imagePixelSize
{
  unsigned __int8 v3 = [(CRLImageRepDrawingHelper *)self rep];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB258);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4B94();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB278);
    }
    BOOL v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    unsigned int v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_imagePixelSize]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 358, 0, "invalid nil value for '%{public}s'", "rep");
  }
  double v7 = [v3 canvas];
  [v3 imageDrawingHelperImageRect:self];
  double v9 = v8;
  double v11 = v10;
  [v7 viewScale];
  double v13 = v12;
  [v7 contentsScale];
  double v15 = sub_1000646A4(v9, v11, v13 * v14);
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (id)p_imageProvider
{
  unsigned __int8 v3 = +[CRLImageProviderPool sharedPool];
  BOOL v4 = [(CRLImageRepDrawingHelper *)self imageDataForDrawing];
  unsigned int v5 = [v3 providerForAsset:v4 shouldValidate:0];

  return v5;
}

- (id)p_validatedImageProvider
{
  unsigned __int8 v3 = +[CRLImageProviderPool sharedPool];
  BOOL v4 = [(CRLImageRepDrawingHelper *)self imageDataForDrawing];
  unsigned int v5 = [v3 providerForAsset:v4 shouldValidate:1];

  return v5;
}

- (id)p_validatedBitmapImageProvider
{
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(CRLImageRepDrawingHelper *)self p_validatedImageProvider];
  unsigned int v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (id)p_validatedThumbnailImageProvider
{
  uint64_t v3 = [(CRLImageRepDrawingHelper *)self rep];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB298);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4C28();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB2B8);
    }
    BOOL v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    unsigned int v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_validatedThumbnailImageProvider]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 393, 0, "invalid nil value for '%{public}s'", "rep");
  }
  double v7 = [v3 imageDrawingHelperThumbnailImageData:self];
  double v8 = +[CRLImageProviderPool sharedPool];
  double v9 = [v8 providerForAsset:v7 shouldValidate:1];

  uint64_t v10 = objc_opt_class();
  double v11 = sub_1002469D0(v10, v9);

  return v11;
}

- (BOOL)isDesiredImageSizePerceptuallyMuchBiggerThanGeneratedImageSize
{
  v2 = self;
  [(CRLImageRepDrawingHelper *)self p_desiredSizedImageSize];
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  sizedImageAccessQueue = v2->_sizedImageAccessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10045BC28;
  v7[3] = &unk_1014FB2E0;
  v7[4] = v2;
  v7[5] = &v8;
  v7[6] = v4;
  v7[7] = v5;
  dispatch_sync(sizedImageAccessQueue, v7);
  LOBYTE(v2) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

- (void)generateSizedImageIfNeeded
{
  uint64_t v3 = [(CRLImageRepDrawingHelper *)self p_imageProvider];
  if ([v3 isValid] && (objc_msgSend(v3, "isError") & 1) == 0)
  {
    uint64_t v4 = [(CRLImageRepDrawingHelper *)self p_desiredSizedImageDescription];
    uint64_t v15 = 0;
    double v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    sizedImageAccessQueue = self->_sizedImageAccessQueue;
    double v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    double v9 = sub_10045BDFC;
    uint64_t v10 = &unk_1014D38F8;
    char v11 = self;
    id v6 = v4;
    id v12 = v6;
    id v13 = v3;
    double v14 = &v15;
    dispatch_sync(sizedImageAccessQueue, &v7);
    if (*((unsigned char *)v16 + 24)) {
      [(CRLImageRepDrawingHelper *)self p_startGeneratingSizedImage];
    }

    _Block_object_dispose(&v15, 8);
  }
}

- (id)p_desiredSizedImageDescription
{
  uint64_t v3 = [(CRLImageRepDrawingHelper *)self rep];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB300);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4CBC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB320);
    }
    uint64_t v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_desiredSizedImageDescription]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 459, 0, "invalid nil value for '%{public}s'", "rep");
  }
  [(CRLImageRepDrawingHelper *)self p_desiredSizedImageSize];
  double v8 = v7;
  double v10 = v9;
  char v11 = [v3 canvas];
  id v12 = [v11 canvasIsWideGamut];

  id v13 = -[TSDSizedImageDescription initWithSize:isWideGamut:hasBakedMask:]([TSDSizedImageDescription alloc], "initWithSize:isWideGamut:hasBakedMask:", v12, [v3 imageDrawingHelperShouldBakeMaskIntoSizedImage:self], v8, v10);

  return v13;
}

- (CGSize)p_desiredSizedImageSize
{
  uint64_t v3 = [(CRLImageRepDrawingHelper *)self rep];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB340);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4D50();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB360);
    }
    uint64_t v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_desiredSizedImageSize]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 470, 0, "invalid nil value for '%{public}s'", "rep");
  }
  double v7 = [(CRLImageRepDrawingHelper *)self p_validatedImageProvider];
  [v7 naturalSize];
  double v9 = v8;
  double v11 = v10;

  [(CRLImageRepDrawingHelper *)self p_imagePixelSize];
  double v13 = v12;
  double v15 = v14;
  double v16 = v11;
  double v17 = v9;
  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    double v16 = v11;
    double v17 = v9;
    if (v9 * v11 > (double)sub_1004549A8())
    {
      unint64_t v18 = sub_1004549A8();
      double v19 = sub_10006727C(v9, v11, (double)v18);
      double v17 = sub_10006538C(v19);
      double v16 = v20;
    }
  }
  BOOL v21 = [(CRLImageRepDrawingHelper *)self p_imageProvider];
  unsigned __int8 v22 = [v21 isError];

  if ((v22 & 1) != 0 || v13 <= v17 && v15 <= v16)
  {
    double v9 = v13;
  }
  else
  {
    uint64_t v28 = [(CRLImageRepDrawingHelper *)self p_imageProvider];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v30 = sub_100454A60();
      double v9 = sub_100067234(v13, v15, v30, v31);
    }
  }
  double v23 = sub_1000674B8(v9);
  double v25 = v24;

  double v26 = v23;
  double v27 = v25;
  result.CGFloat height = v27;
  result.CGFloat width = v26;
  return result;
}

- (void)p_prepareToGenerateSizedImageWithDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_sizedImageAccessQueue;
  if (v5 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  }

  id v6 = [(CRLImageRepDrawingHelper *)self rep];
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB380);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4E78();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB3A0);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_prepareToGenerateSizedImageWithDescription:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 517, 0, "invalid nil value for '%{public}s'", "rep");
  }
  if (self->_sizingState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB3C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4DE4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB3E0);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_prepareToGenerateSizedImageWithDescription:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 519, 0, "expected nil value for '%{public}s'", "_sizingState");
  }
  [v4 size];
  double v14 = v13;
  double v16 = v15;
  if ([v4 hasBakedMask])
  {
    if (self->_sizedImage)
    {
      id sizedImageOrientation = self->_sizedImageOrientation;
    }
    else
    {
      double v19 = [(CRLImageRepDrawingHelper *)self p_validatedBitmapImageProvider];
      id sizedImageOrientation = [v19 orientation];
    }
    unint64_t v18 = [v6 imageDrawingHelper:self newMaskPathForSizedImageWithSize:v14 orientation:v16];
  }
  else
  {
    unint64_t v18 = 0;
  }
  double v20 = [CRLImageRepSizingState alloc];
  BOOL v21 = [(CRLImageRepDrawingHelper *)self p_imageProvider];
  unsigned __int8 v22 = -[CRLImageRepSizingState initWithDesiredSize:provider:maskPath:wideGamutCanvas:](v20, "initWithDesiredSize:provider:maskPath:wideGamutCanvas:", v21, v18, [v4 isWideGamut], v14, v16);
  sizingState = self->_sizingState;
  self->_sizingState = v22;

  if (v18)
  {
    CGPathRelease(self->_sizedImageMaskPath);
    self->_sizedImageMaskPath = v18;
  }
}

- (void)p_startGeneratingSizedImage
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sizedImageAccessQueue);
  uint64_t v3 = [(CRLImageRepDrawingHelper *)self rep];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB400);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B4F0C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB420);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_startGeneratingSizedImage]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 540, 0, "invalid nil value for '%{public}s'", "rep");
  }
  unsigned __int8 v7 = [v3 imageDrawingHelperShouldGenerateSizedImageSynchronously:self];
  sizingState = self->_sizingState;
  if (v7)
  {
    if ([(CRLImageRepDrawingHelper *)self p_generateSizedImage:sizingState]) {
      [v3 imageDrawingHelper:self didGenerateSizedImageSynchronously:1];
    }
  }
  else
  {
    double v9 = sizingState;
    double v10 = dispatch_get_global_queue(-2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10045CC70;
    block[3] = &unk_1014CBE50;
    id v13 = v3;
    double v14 = self;
    double v15 = v9;
    double v11 = v9;
    dispatch_async(v10, block);
  }
}

- (BOOL)p_generateSizedImage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sizedImageAccessQueue);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  [v4 generateSizedImage];
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10045CE58;
  block[3] = &unk_1014F0358;
  id v9 = v4;
  double v10 = self;
  double v11 = &v12;
  id v6 = v4;
  dispatch_sync(sizedImageAccessQueue, block);
  LOBYTE(v4) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (void)p_takeSizedImageFromStateIfReady
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sizedImageAccessQueue);
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10045CF58;
  v4[3] = &unk_1014CB140;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(sizedImageAccessQueue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(CRLImageRepDrawingHelper *)self p_retryGeneratingSizedImageIfPossible];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)p_retryGeneratingSizedImageIfPossible
{
  uint64_t v3 = [(CRLImageRepDrawingHelper *)self p_imageProvider];
  if ([v3 isValid])
  {
    sizedImageAccessQueue = self->_sizedImageAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10045D34C;
    block[3] = &unk_1014CBBB0;
    void block[4] = self;
    dispatch_sync(sizedImageAccessQueue, block);
    [(CRLImageRepDrawingHelper *)self p_startGeneratingSizedImage];
  }
}

- (CGImage)sizedImage
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  [(CRLImageRepDrawingHelper *)self p_takeSizedImageFromStateIfReady];
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10045D484;
  v7[3] = &unk_1014CB090;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(sizedImageAccessQueue, v7);
  id v4 = (const void *)v9[3];
  if (v4)
  {
    CFAutorelease(v4);
    uint64_t v5 = (CGImage *)v9[3];
  }
  else
  {
    uint64_t v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)invalidateSizedImage
{
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10045D530;
  block[3] = &unk_1014CBBB0;
  void block[4] = self;
  dispatch_sync(sizedImageAccessQueue, block);
}

- (void)invalidateSizedImageIfItHasBakedMask
{
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10045D5AC;
  block[3] = &unk_1014CBBB0;
  void block[4] = self;
  dispatch_sync(sizedImageAccessQueue, block);
}

- (void)invalidateSizedImageIfNeededForBakedMaskPathFromBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLImageRepDrawingHelper *)self rep];
  if (v5)
  {
    sizedImageAccessQueue = self->_sizedImageAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10045D888;
    block[3] = &unk_1014D0AB0;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(sizedImageAccessQueue, block);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB480);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B5034();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB4A0);
    }
    uint64_t v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper invalidateSizedImageIfNeededForBakedMaskPathFromBlock:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 691, 0, "invalid nil value for '%{public}s'", "rep");
  }
}

- (void)p_invalidateSizedImageOnAccessQueue
{
  uint64_t v3 = self->_sizedImageAccessQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v3);
  }

  sizingState = self->_sizingState;
  self->_sizingState = 0;

  CGImageRelease(self->_sizedImage);
  sizedImageDescription = self->_sizedImageDescription;
  self->_sizedImage = 0;
  self->_sizedImageDescription = 0;

  CGPathRelease(self->_sizedImageMaskPath);
  self->_sizedImageMaskPath = 0;
}

- (BOOL)isGeneratingSizedImageWithBakedMask
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10045DCA4;
  v5[3] = &unk_1014CB090;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sizedImageAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)retryGeneratingSizedImageIfNeeded
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10045DDBC;
  v4[3] = &unk_1014CB140;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(sizedImageAccessQueue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(CRLImageRepDrawingHelper *)self generateSizedImageIfNeeded];
  }
  _Block_object_dispose(&v5, 8);
}

- (CRLImageRepDrawingDataSource)rep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);

  return (CRLImageRepDrawingDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rep);
  objc_storeStrong((id *)&self->_sizedImageDescription, 0);
  objc_storeStrong((id *)&self->_sizingState, 0);

  objc_storeStrong((id *)&self->_sizedImageAccessQueue, 0);
}

@end