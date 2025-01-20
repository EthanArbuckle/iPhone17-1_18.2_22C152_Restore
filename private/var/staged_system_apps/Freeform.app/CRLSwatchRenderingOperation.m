@interface CRLSwatchRenderingOperation
- (BOOL)deliversImageAutomatically;
- (BOOL)isReadyToRender;
- (BOOL)needsPressedStateBackground;
- (BOOL)renderForWideGamut;
- (BOOL)suppressesAnimation;
- (CGImage)deliveredImage;
- (CGImage)p_newSwatchPressedStateBackgroundFromCGImage:(CGImage *)a3;
- (CGRect)swatchFrame;
- (CGSize)imageSize;
- (CRLSwatchRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 swatchFrame:(CGRect)a5 editingCoordinator:(id)a6;
- (CRLSwatchRenderingOperationDelegate)delegate;
- (NSIndexPath)targetIndexPath;
- (UIEdgeInsets)swatchEdgeInsets;
- (UIView)view;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (double)imageScale;
- (void)cancel;
- (void)dealloc;
- (void)deliverCGImage:(CGImage *)a3;
- (void)deliverSwatch;
- (void)doWorkWithReadLock;
- (void)main;
- (void)p_deliverResultOnMainThread:(id)a3;
- (void)p_didFinishRendering;
- (void)p_showSwatchInViewAnimated:(BOOL)a3;
- (void)provideSwatchForLaterDelivery:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeliversImageAutomatically:(BOOL)a3;
- (void)setSuppressesAnimation:(BOOL)a3;
- (void)setTargetIndexPath:(id)a3;
- (void)setView:(id)a3;
@end

@implementation CRLSwatchRenderingOperation

- (CRLSwatchRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 swatchFrame:(CGRect)a5 editingCoordinator:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v12 = a3.height;
  CGFloat v13 = a3.width;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CRLSwatchRenderingOperation;
  v16 = [(CRLSwatchRenderingOperation *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_imageSize.CGFloat width = v13;
    v16->_imageSize.CGFloat height = v12;
    v16->_imageScale = a4;
    v16->_swatchFrame.origin.CGFloat x = x;
    v16->_swatchFrame.origin.CGFloat y = y;
    v16->_swatchFrame.size.CGFloat width = width;
    v16->_swatchFrame.size.CGFloat height = height;
    objc_storeStrong((id *)&v16->_editingCoordinator, a6);
    v17->_deliversImageAutomaticallCGFloat y = 1;
  }

  return v17;
}

- (void)dealloc
{
  CGImageRelease(self->_deliveredImage);
  v3.receiver = self;
  v3.super_class = (Class)CRLSwatchRenderingOperation;
  [(CRLSwatchRenderingOperation *)&v3 dealloc];
}

- (BOOL)isReadyToRender
{
  return 1;
}

- (void)p_showSwatchInViewAnimated:(BOOL)a3
{
  if (self->_view)
  {
    BOOL v3 = a3;
    if (([(CRLSwatchRenderingOperation *)self isCancelled] & 1) == 0)
    {
      v5 = [(UIView *)self->_view layer];
      v6 = v5;
      if (v3)
      {
        uint64_t v7 = [v5 valueForKey:@"CRLSwatchRenderingOperationLayerKey"];
        if (!v7
          || (v8 = (void *)v7,
              [v6 valueForKey:@"CRLSwatchRenderingOperationLayerKey"],
              v9 = (CRLSwatchRenderingOperation *)objc_claimAutoreleasedReturnValue(),
              v9,
              v8,
              v9 == self))
        {
          [v6 crl_addSpringScaleInAnimationWithDelay:0.05];
          [v6 setValue:0 forKey:@"CRLSwatchRenderingOperationLayerKey"];
        }
      }
    }
    view = self->_view;
    [(UIView *)view setHidden:0];
  }
}

- (CGImage)p_newSwatchPressedStateBackgroundFromCGImage:(CGImage *)a3
{
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  double v7 = sub_100064070();
  double v11 = sub_1000652FC(v7, v8, v9, v10, self->_imageScale);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = sub_100455AA8(3, (double)Width, (double)Height);
  objc_super v19 = +[CRLColor colorWithWhite:0.1 alpha:0.3];
  CGContextSetFillColorWithColor(v18, (CGColorRef)[v19 CGColor]);

  [(CRLSwatchRenderingOperation *)self swatchEdgeInsets];
  CGFloat v21 = v13 + v20;
  CGFloat v24 = v15 - (v22 + v23);
  v28.size.CGFloat height = v17 - (v20 + v25);
  v28.origin.CGFloat x = v11 + v22;
  v28.origin.CGFloat y = v21;
  v28.size.CGFloat width = v24;
  CGContextFillRect(v18, v28);
  Image = CGBitmapContextCreateImage(v18);
  CGContextRelease(v18);
  return Image;
}

- (void)p_deliverResultOnMainThread:(id)a3
{
  id v4 = a3;
  view = self->_view;
  if (view)
  {
    double v15 = v4;
    v6 = [(UIView *)view layer];
    double v7 = objc_getAssociatedObject(self->_view, "CRLSwatchRenderingOperationTargetIndexPathKey");
    CGFloat v8 = [(CRLSwatchRenderingOperation *)self targetIndexPath];
    CGFloat v9 = v8;
    if (!v8 || [v8 isEqual:v7])
    {
      uint64_t v10 = objc_opt_class();
      double v11 = sub_1002469D0(v10, self->_view);
      if (v11)
      {
        double v12 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v15 foreground], 0, self->_imageScale);
        [v11 setImage:v12 forState:0];
        if ([(CRLSwatchRenderingOperation *)self needsPressedStateBackground])
        {
          if ([v15 background])
          {
            double v13 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v15 background], 0, self->_imageScale);
            [v11 setBackgroundImage:v13 forState:1];
          }
        }
        else
        {
          double v14 = [v11 backgroundImageForState:1];

          if (v14) {
            [v11 setBackgroundImage:0 forState:1];
          }
        }
      }
      else
      {
        [v6 setContentsScale:self->_imageScale];
        [v6 setContents:[v15 foreground]];
      }
      [v6 setShouldRasterize:1];
      [v6 setRasterizationScale:self->_imageScale];
      [(CRLSwatchRenderingOperation *)self p_showSwatchInViewAnimated:!self->_suppressesAnimation];
    }
    [(CRLSwatchRenderingOperation *)self setTargetIndexPath:0];
    [(CRLSwatchRenderingOperation *)self p_didFinishRendering];

    id v4 = v15;
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  self->_renderForWideGamut = 1;
  if (objc_opt_respondsToSelector()) {
    self->_renderForWideGamut = [v4 shouldRenderUsingWideGamutForSwatchRenderingOperation:self];
  }
}

- (void)p_didFinishRendering
{
  BOOL v3 = [(CRLSwatchRenderingOperation *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CRLSwatchRenderingOperation *)self delegate];
    [v5 swatchRenderingOperation:self didFinishRenderingForView:self->_view];
  }
}

- (void)deliverCGImage:(CGImage *)a3
{
  if ([(CRLSwatchRenderingOperation *)self needsPressedStateBackground]) {
    id v5 = [(CRLSwatchRenderingOperation *)self p_newSwatchPressedStateBackgroundFromCGImage:a3];
  }
  else {
    id v5 = 0;
  }
  id v6 = +[CRLSwatchRenderingResult renderingResultWithForeground:a3 background:v5];
  if (v5) {
    CGImageRelease(v5);
  }
  self->_deliveredImage = CGImageRetain(a3);
  if (+[NSThread isMainThread]) {
    [(CRLSwatchRenderingOperation *)self p_deliverResultOnMainThread:v6];
  }
  else {
    [(CRLSwatchRenderingOperation *)self performSelectorOnMainThread:"p_deliverResultOnMainThread:" withObject:v6 waitUntilDone:0];
  }
}

- (void)deliverSwatch
{
  swatch = self->_swatch;
  if (swatch)
  {
    [(CRLSwatchRenderingOperation *)self deliverCGImage:[(CRLImage *)swatch CGImage]];
    char v4 = self->_swatch;
    self->_swatch = 0;
  }
}

- (void)provideSwatchForLaterDelivery:(id)a3
{
  char v4 = (CRLImage *)a3;
  if (self->_swatch)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE3C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106B2E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE3E0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSwatchRenderingOperation provideSwatchForLaterDelivery:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSwatchRenderingOperation.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:286 isFatal:0 description:"Should not have two swatches!"];
  }
  swatch = self->_swatch;
  self->_swatch = v4;
}

- (CGImage)deliveredImage
{
  return self->_deliveredImage;
}

- (BOOL)needsPressedStateBackground
{
  return 0;
}

- (UIEdgeInsets)swatchEdgeInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)doWorkWithReadLock
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CE400);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106B374();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CE420);
  }
  v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v2);
  }
  BOOL v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSwatchRenderingOperation doWorkWithReadLock]");
  char v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSwatchRenderingOperation.m"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:303 isFatal:0 description:"Subclasses must override"];
}

- (void)main
{
  if ([(CRLSwatchRenderingOperation *)self isReadyToRender])
  {
    [(CRLSwatchRenderingOperation *)self doWorkWithReadLock];
  }
  else
  {
    swatch = self->_swatch;
    self->_swatch = 0;

    view = self->_view;
    [(UIView *)view crl_setPresetRenderingInvalid:1];
  }
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)CRLSwatchRenderingOperation;
  [(CRLSwatchRenderingOperation *)&v2 cancel];
}

- (NSIndexPath)targetIndexPath
{
  return self->_targetIndexPath;
}

- (void)setTargetIndexPath:(id)a3
{
}

- (UIView)view
{
  return (UIView *)objc_getProperty(self, a2, 8, 1);
}

- (void)setView:(id)a3
{
}

- (CGSize)imageSize
{
  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (double)imageScale
{
  return self->_imageScale;
}

- (CGRect)swatchFrame
{
  objc_copyStruct(v6, &self->_swatchFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CRLSwatchRenderingOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLSwatchRenderingOperationDelegate *)WeakRetained;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  return (_TtC8Freeform21CRLEditingCoordinator *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)renderForWideGamut
{
  return self->_renderForWideGamut;
}

- (BOOL)deliversImageAutomatically
{
  return self->_deliversImageAutomatically;
}

- (void)setDeliversImageAutomatically:(BOOL)a3
{
  self->_deliversImageAutomaticallCGFloat y = a3;
}

- (BOOL)suppressesAnimation
{
  return self->_suppressesAnimation;
}

- (void)setSuppressesAnimation:(BOOL)a3
{
  self->_suppressesAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_swatch, 0);
  objc_storeStrong((id *)&self->_editingCoordinator, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end