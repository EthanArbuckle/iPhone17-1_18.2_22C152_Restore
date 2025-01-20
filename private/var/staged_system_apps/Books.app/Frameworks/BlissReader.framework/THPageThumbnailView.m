@interface THPageThumbnailView
+ (CGImage)thumbnailPlaceholder;
+ (id)thumbnailQueue;
- (BOOL)hasLeftBorder;
- (BOOL)hasRightBorder;
- (BOOL)willSetImageFromQueue;
- (CALayer)imageLayer;
- (CGRect)highlightedRelativeRect;
- (NSString)description;
- (THPageThumbnailView)initWithFrame:(CGRect)a3 isFirstThumbnail:(BOOL)a4 delegate:(id)a5;
- (THPageThumbnailViewDelegate)delegate;
- (THWFreeTransformController)freeTransformController;
- (THWFreeTransformGestureRecognizer)freeTransformGestureRecognizer;
- (TSPData)imageData;
- (UIView)highlightView;
- (id)p_createSideBorderView;
- (unint64_t)chapterIndex;
- (unint64_t)pageIndex;
- (void)clearHighlightRect;
- (void)dealloc;
- (void)gestureReset:(id)a3;
- (void)hideExtrasAnimated:(BOOL)a3 duration:(double)a4;
- (void)p_clearTimer;
- (void)p_handleTap:(id)a3;
- (void)p_setBorderMode:(int)mBorderMode;
- (void)p_tapGestureTimerFired:(id)a3;
- (void)setBorderVisible:(BOOL)a3;
- (void)setCanvasScrollView:(id)a3 rasterize:(BOOL)a4;
- (void)setChapterIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFreeTransformController:(id)a3;
- (void)setFreeTransformGestureRecognizer:(id)a3;
- (void)setHasLeftBorder:(BOOL)a3;
- (void)setHasRightBorder:(BOOL)a3;
- (void)setHighlightRelativeRect:(CGRect)a3;
- (void)setHighlightView:(id)a3;
- (void)setImage:(CGImage *)a3;
- (void)setImageData:(id)a3 immediate:(BOOL)a4;
- (void)setIsCurrentPage:(BOOL)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setPageNumberText:(id)a3;
- (void)setShowCanvas:(BOOL)a3 animated:(BOOL)a4;
- (void)setWillSetImageFromQueue:(BOOL)a3;
- (void)setupFreeTransformWithDelegate:(id)a3;
- (void)showExtrasAnimated:(BOOL)a3 duration:(double)a4;
- (void)teardown;
- (void)touchesBeganFromTap:(id)a3;
- (void)updateFreeTransformUnmovingParentView;
@end

@implementation THPageThumbnailView

+ (id)thumbnailQueue
{
  if (qword_573208 != -1) {
    dispatch_once(&qword_573208, &stru_458D60);
  }
  return (id)qword_573200;
}

+ (CGImage)thumbnailPlaceholder
{
  if (qword_573218 != -1) {
    dispatch_once(&qword_573218, &stru_458D80);
  }
  return (CGImage *)qword_573210;
}

- (THPageThumbnailView)initWithFrame:(CGRect)a3 isFirstThumbnail:(BOOL)a4 delegate:(id)a5
{
  BOOL v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)THPageThumbnailView;
  v7 = -[THPageThumbnailView initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->mChapterIndex = 0x7FFFFFFFFFFFFFFFLL;
    v9 = [[THPageThumbnailViewTapGestureRecognizer alloc] initWithTarget:v7 action:"p_handleTap:"];
    v8->mSingleTapGR = v9;
    uint64_t v10 = 1;
    [(THPageThumbnailViewTapGestureRecognizer *)v9 setNumberOfTapsRequired:1];
    [(THPageThumbnailViewTapGestureRecognizer *)v8->mSingleTapGR setDelegate:v8];
    [(THPageThumbnailView *)v8 addGestureRecognizer:v8->mSingleTapGR];
    v8->mImageLayer = (CALayer *)objc_alloc_init((Class)CALayer);
    [(THPageThumbnailView *)v8 bounds];
    -[CALayer setFrame:](v8->mImageLayer, "setFrame:");
    [v8 layer]->addSublayer:v8->mImageLayer;
    [(CALayer *)v8->mImageLayer setHidden:1];

    v8->mDelegate = (THPageThumbnailViewDelegate *)a5;
    if (v6)
    {
      [v8 layer].zPosition = 1.0;
      uint64_t v10 = 2;
    }
    [(THPageThumbnailView *)v8 p_setBorderMode:v10];
    [(THPageThumbnailView *)v8 frame];
    v8->mPageNumberView = -[THPageNumberView initWithPosition:]([THPageNumberView alloc], "initWithPosition:", v11 + -3.0, 23.0 + 3.0);
    [(UILabel *)[(THPageNumberView *)v8->mPageNumberView label] setTextColor:+[UIColor colorWithWhite:0.156862745 alpha:1.0]];
    [(THPageThumbnailView *)v8 addSubview:v8->mPageNumberView];

    [(THPageThumbnailView *)v8 setOpaque:1];
    CGSize size = CGRectZero.size;
    v8->mHighlightedRelativeRect.origin = CGRectZero.origin;
    v8->mHighlightedRelativeRect.CGSize size = size;
    CGSize v13 = CGRectZero.size;
    v8->mHighlightedActualRect.origin = CGRectZero.origin;
    v8->mHighlightedActualRect.CGSize size = v13;
  }
  return v8;
}

- (void)setPageNumberText:(id)a3
{
}

- (void)setIsCurrentPage:(BOOL)a3
{
}

- (void)dealloc
{
  [(THPageThumbnailView *)self p_clearTimer];
  [(THWFreeTransformController *)self->mFreeTransformController setTargetLayer:0];
  [(THWFreeTransformController *)self->mFreeTransformController setTransformGR:0];
  [(THWFreeTransformController *)self->mFreeTransformController clearGestureRecognizer];

  self->mFreeTransformController = 0;
  [-[THWFreeTransformGestureRecognizer view](-[THPageThumbnailView freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"), "view") removeGestureRecognizer: -[THPageThumbnailView freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer")];
  [(THPageThumbnailView *)self setFreeTransformGestureRecognizer:0];

  self->mSingleTapGR = 0;
  self->mBorderView = 0;
  [(UIView *)self->mLeftBorderView removeFromSuperview];

  self->mLeftBorderView = 0;
  [(UIView *)self->mRightBorderView removeFromSuperview];

  self->mRightBorderView = 0;
  self->mCanvasWrapperView = 0;
  [(UIView *)self->mHighlightView removeFromSuperview];

  self->mHighlightView = 0;
  self->_freeTransformController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageThumbnailView;
  [(THPageThumbnailView *)&v3 dealloc];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)THPageThumbnailView;
  return [(NSString *)[(THPageThumbnailView *)&v3 description] stringByAppendingString:+[NSString stringWithFormat:@" ch: %lu p: %lu", self->mChapterIndex, self->mPageIndex]];
}

- (void)setupFreeTransformWithDelegate:(id)a3
{
  if (self->mFreeTransformController) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView setupFreeTransformWithDelegate:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm") lineNumber:203 description:@"expected nil value for '%s'", "mFreeTransformController"];
  }
  v5 = objc_alloc_init(THWFreeTransformController);
  self->mFreeTransformController = v5;
  [(THWFreeTransformController *)v5 setDelegate:a3];
  [(THWFreeTransformController *)self->mFreeTransformController setScaleThreshold:1.5];
  [(THWFreeTransformController *)self->mFreeTransformController setTargetLayer:[(THPageThumbnailView *)self layer]];
  [(THWFreeTransformController *)self->mFreeTransformController setSmoothEdges:1];
  [self superview].frame
  double v7 = v6;
  [(THPageThumbnailView *)self frame];
  [(THWFreeTransformController *)self->mFreeTransformController setTransformScale:v7 / v8];
  [(THPageThumbnailView *)self setFreeTransformGestureRecognizer:[[THWFreeTransformGestureRecognizer alloc] initWithTarget:self->mFreeTransformController action:"transformGRChanged:"]];
  [(THPageThumbnailView *)self addGestureRecognizer:[(THPageThumbnailView *)self freeTransformGestureRecognizer]];
  -[THWFreeTransformGestureRecognizer setUnmovingParentView:](-[THPageThumbnailView freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"), "setUnmovingParentView:", [a3 unmovingParentViewForFreeTransformController:self->mFreeTransformController]);
  [(THWFreeTransformGestureRecognizer *)[(THPageThumbnailView *)self freeTransformGestureRecognizer] setFreeTransformDelegate:self->mFreeTransformController];
  [(THWFreeTransformGestureRecognizer *)[(THPageThumbnailView *)self freeTransformGestureRecognizer] setUseGestureViewForReCentering:1];
  v9 = [(THPageThumbnailView *)self freeTransformGestureRecognizer];
  mFreeTransformController = self->mFreeTransformController;

  [(THWFreeTransformController *)mFreeTransformController setTransformGR:v9];
}

- (void)updateFreeTransformUnmovingParentView
{
}

- (void)teardown
{
  [(THPageThumbnailView *)self setDelegate:0];
  [(THWFreeTransformController *)self->mFreeTransformController setTargetLayer:0];
  mFreeTransformController = self->mFreeTransformController;

  [(THWFreeTransformController *)mFreeTransformController clearGestureRecognizer];
}

- (void)setBorderVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  [(UIView *)self->mBorderView setAlpha:v5];
  [(UIView *)self->mLeftBorderView setAlpha:v5];
  [(UIView *)self->mRightBorderView setAlpha:v5];
  mPageNumberView = self->mPageNumberView;

  [(THPageNumberView *)mPageNumberView setHidden:!v3];
}

- (void)p_setBorderMode:(int)mBorderMode
{
  if (self->mBorderMode != mBorderMode)
  {
    self->mBorderMode = mBorderMode;
    if (!self->mBorderView)
    {
      v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      self->mBorderView = v4;
      [(THPageThumbnailView *)self addSubview:v4];
      mBorderMode = self->mBorderMode;
    }
    if (mBorderMode == 1)
    {
      [(THPageThumbnailView *)self bounds];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      TSUScreenScale();
      double v26 = v22 - 1.0 / v25;
      TSUScreenScale();
      -[UIView setFrame:](self->mBorderView, "setFrame:", v20, v26, v24, 1.0 / v27);
      [(CALayer *)[(UIView *)self->mBorderView layer] setBorderWidth:0.0];
      v18 = +[UIColor colorWithWhite:0.0 alpha:0.3];
    }
    else
    {
      if (mBorderMode != 2)
      {
        [(UIView *)self->mBorderView removeFromSuperview];

        self->mBorderView = 0;
        return;
      }
      [(THPageThumbnailView *)self bounds];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      TSUScreenScale();
      CGFloat v14 = -1.0 / v13;
      TSUScreenScale();
      CGFloat v16 = -1.0 / v15;
      v31.origin.x = v6;
      v31.origin.y = v8;
      v31.size.width = v10;
      v31.size.height = v12;
      CGRect v32 = CGRectInset(v31, v14, v16);
      -[UIView setFrame:](self->mBorderView, "setFrame:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
      [(CALayer *)[(UIView *)self->mBorderView layer] setBorderColor:[+[UIColor colorWithWhite:0.0 alpha:0.3] CGColor]];
      TSUScreenScale();
      [(CALayer *)[(UIView *)self->mBorderView layer] setBorderWidth:1.0 / v17];
      v18 = +[UIColor clearColor];
    }
    v28 = v18;
    mBorderView = self->mBorderView;
    [(UIView *)mBorderView setBackgroundColor:v28];
  }
}

- (id)p_createSideBorderView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(THPageThumbnailView *)self addSubview:v3];
  [v3 setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.3]];
  return v3;
}

- (BOOL)hasLeftBorder
{
  return self->mLeftBorderView != 0;
}

- (void)setHasLeftBorder:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(THPageThumbnailView *)self hasLeftBorder] != a3)
  {
    if (v3)
    {
      if (self->mBorderMode == 2) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView setHasLeftBorder:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm") lineNumber:306 description:@"shouldn't have a side border and a full border"];
      }
      self->mLeftBorderView = (UIView *)[(THPageThumbnailView *)self p_createSideBorderView];
      [(THPageThumbnailView *)self bounds];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      TSUScreenScale();
      double v12 = v6 - 1.0 / v11;
      TSUScreenScale();
      double v14 = 1.0 / v13;
      TSUScreenScale();
      double v16 = v8 - 1.0 / v15;
      TSUScreenScale();
      mLeftBorderView = self->mLeftBorderView;
      -[UIView setFrame:](mLeftBorderView, "setFrame:", v12, v16, v14, v10 + 1.0 / v17);
    }
    else
    {
      [(UIView *)self->mLeftBorderView removeFromSuperview];

      self->mLeftBorderView = 0;
    }
  }
}

- (BOOL)hasRightBorder
{
  return self->mRightBorderView != 0;
}

- (void)setHasRightBorder:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(THPageThumbnailView *)self hasRightBorder] != a3)
  {
    if (v3)
    {
      if (self->mBorderMode == 2) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView setHasRightBorder:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm") lineNumber:338 description:@"shouldn't have a side border and a full border"];
      }
      self->mRightBorderView = (UIView *)[(THPageThumbnailView *)self p_createSideBorderView];
      [(THPageThumbnailView *)self bounds];
      double y = v15.origin.y;
      double height = v15.size.height;
      double MaxX = CGRectGetMaxX(v15);
      TSUScreenScale();
      double v9 = 1.0 / v8;
      TSUScreenScale();
      double v11 = y - 1.0 / v10;
      TSUScreenScale();
      mRightBorderView = self->mRightBorderView;
      -[UIView setFrame:](mRightBorderView, "setFrame:", MaxX, v11, v9, height + 1.0 / v12);
    }
    else
    {
      [(UIView *)self->mRightBorderView removeFromSuperview];

      self->mRightBorderView = 0;
    }
  }
}

- (void)setImage:(CGImage *)a3
{
  +[CATransaction begin];
  +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
  [(CALayer *)self->mImageLayer setContents:a3];
  [(CALayer *)self->mImageLayer setHidden:0];

  +[CATransaction commit];
}

- (void)setImageData:(id)a3 immediate:(BOOL)a4
{
  BOOL v4 = a4;
  objc_sync_enter(self);
  if (v4)
  {
    [(THPageThumbnailView *)self setWillSetImageFromQueue:0];
    [(THPageThumbnailView *)self setImage:+[TSDBitmapImageProvider CGImageForImageData:a3]];

    self->mImageData = 0;
    objc_sync_exit(self);
  }
  else
  {
    +[CATransaction begin];
    +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
    [(CALayer *)self->mImageLayer setHidden:1];
    +[CATransaction commit];
    id v7 = a3;

    self->mImageData = (TSPData *)a3;
    [(THPageThumbnailView *)self setWillSetImageFromQueue:1];
    objc_sync_exit(self);
    double v8 = [(id)objc_opt_class() thumbnailQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B1E80;
    block[3] = &unk_456DE0;
    block[4] = self;
    dispatch_async(v8, block);
  }
}

- (void)setCanvasScrollView:(id)a3 rasterize:(BOOL)a4
{
  BOOL v4 = a4;
  if (!self->mCanvasWrapperView)
  {
    id v7 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    self->mCanvasWrapperView = v7;
    [(THPageThumbnailView *)self addSubview:v7];
  }
  double v8 = [(UIView *)self->mCanvasWrapperView layer];
  if (v4)
  {
    [(CALayer *)v8 setShouldRasterize:1];
    [a3 bounds];
    double v10 = v9;
    [(THPageThumbnailView *)self bounds];
    [(CALayer *)[(UIView *)self->mCanvasWrapperView layer] setRasterizationScale:v10 / v11];
  }
  else
  {
    [(CALayer *)v8 setShouldRasterize:0];
  }
  mCanvasWrapperView = self->mCanvasWrapperView;

  [(UIView *)mCanvasWrapperView addSubview:a3];
}

- (void)setShowCanvas:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  [(UIView *)self->mCanvasWrapperView alpha];
  if (v7 != v6)
  {
    double v8 = 0.15;
    if (!v4) {
      double v8 = 0.0;
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_B21A8;
    v9[3] = &unk_457250;
    v9[4] = self;
    *(double *)&v9[5] = v6;
    +[UIView animateWithDuration:v9 animations:v8];
  }
}

- (CGRect)highlightedRelativeRect
{
  double x = self->mHighlightedRelativeRect.origin.x;
  double y = self->mHighlightedRelativeRect.origin.y;
  double width = self->mHighlightedRelativeRect.size.width;
  double height = self->mHighlightedRelativeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHighlightRelativeRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    [(THPageThumbnailView *)self clearHighlightRect];
  }
  else
  {
    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    if (!CGRectEqualToRect(v20, self->mHighlightedRelativeRect))
    {
      [(THPageThumbnailView *)self clearHighlightRect];
      [(THPageThumbnailView *)self frame];
      self->mHighlightedRelativeRect.origin.double x = x;
      self->mHighlightedRelativeRect.origin.double y = y;
      self->mHighlightedRelativeRect.size.double width = width;
      self->mHighlightedRelativeRect.size.double height = height;
      CGFloat v9 = x * v8;
      double v11 = y * v10;
      double v12 = width * v8;
      double v13 = height * v10;
      p_mHighlightedActualRect = &self->mHighlightedActualRect;
      self->mHighlightedActualRect.origin.double x = v9;
      self->mHighlightedActualRect.origin.double y = v11;
      self->mHighlightedActualRect.size.double width = v12;
      self->mHighlightedActualRect.size.double height = v13;
      if (fabs(height + -1.0) >= 0.00999999978) {
        *(CGRect *)&CGFloat v9 = CGRectInset(*(CGRect *)&v9, 0.0, -3.0);
      }
      p_mHighlightedActualRect->origin.double x = v9;
      self->mHighlightedActualRect.origin.double y = v11;
      self->mHighlightedActualRect.size.double width = v12;
      self->mHighlightedActualRect.size.double height = v13;
      double v15 = fabs(width + -1.0);
      double v16 = 0.0;
      if (v15 >= 0.00999999978)
      {
        *(CGRect *)&CGFloat v9 = CGRectInset(*(CGRect *)&v9, -3.0, 0.0);
        double v16 = 3.0;
      }
      p_mHighlightedActualRect->origin.double x = v9;
      self->mHighlightedActualRect.origin.double y = v11;
      self->mHighlightedActualRect.size.double width = v12;
      self->mHighlightedActualRect.size.double height = v13;
      id v17 = [objc_alloc((Class)UIView) initWithFrame:p_mHighlightedActualRect->origin.x, self->mHighlightedActualRect.origin.y, self->mHighlightedActualRect.size.width, self->mHighlightedActualRect.size.height];
      [v17 setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.200000003]];
      objc_msgSend(objc_msgSend(v17, "layer"), "setCornerRadius:", v16);
      objc_msgSend(objc_msgSend(v17, "layer"), "setMasksToBounds:", 1);
      [v17 setAlpha:0.0];
      [(THPageThumbnailView *)self setHighlightView:v17];
      [(THPageThumbnailView *)self addSubview:v17];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_B2408;
      v18[3] = &unk_456DE0;
      v18[4] = self;
      +[UIView animateWithDuration:v18 animations:0.150000006];
    }
  }
}

- (void)clearHighlightRect
{
  if ([(THPageThumbnailView *)self highlightView])
  {
    [(UIView *)[(THPageThumbnailView *)self highlightView] removeFromSuperview];
    [(THPageThumbnailView *)self setHighlightView:0];
    CGSize size = CGRectZero.size;
    self->mHighlightedRelativeRect.origin = CGRectZero.origin;
    self->mHighlightedRelativeRect.CGSize size = size;
    CGSize v4 = CGRectZero.size;
    self->mHighlightedActualRect.origin = CGRectZero.origin;
    self->mHighlightedActualRect.CGSize size = v4;
  }
}

- (void)hideExtrasAnimated:(BOOL)a3 duration:(double)a4
{
  if (a3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_B2598;
    v6[3] = &unk_456DE0;
    v6[4] = self;
    +[UIView animateWithDuration:v6 animations:a4];
  }
  else
  {
    [(UIView *)self->mBorderView setAlpha:0.0];
    [(UIView *)self->mLeftBorderView setAlpha:0.0];
    [(UIView *)self->mRightBorderView setAlpha:0.0];
    mPageNumberView = self->mPageNumberView;
    [(THPageNumberView *)mPageNumberView setAlpha:0.0];
  }
}

- (void)showExtrasAnimated:(BOOL)a3 duration:(double)a4
{
  if (a3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_B2714;
    v6[3] = &unk_456DE0;
    v6[4] = self;
    +[UIView animateWithDuration:v6 animations:a4];
  }
  else
  {
    [(UIView *)self->mBorderView setAlpha:1.0];
    [(UIView *)self->mLeftBorderView setAlpha:1.0];
    [(UIView *)self->mRightBorderView setAlpha:1.0];
    mPageNumberView = self->mPageNumberView;
    [(THPageNumberView *)mPageNumberView setAlpha:1.0];
  }
}

- (void)p_clearTimer
{
  self->mTapTimer = 0;
}

- (void)p_tapGestureTimerFired:(id)a3
{
  mSingleTapGR = self->mSingleTapGR;
  if (![(THPageThumbnailViewTapGestureRecognizer *)mSingleTapGR state]
    || [(THPageThumbnailViewTapGestureRecognizer *)mSingleTapGR state] == (char *)&dword_0 + 1
    || [(THPageThumbnailViewTapGestureRecognizer *)mSingleTapGR state] == (char *)&dword_0 + 2)
  {
    [(THPageThumbnailViewTapGestureRecognizer *)mSingleTapGR locationInView:self];
    -[THPageThumbnailViewDelegate thumbnailWasPressed:atPoint:forLong:](self->mDelegate, "thumbnailWasPressed:atPoint:forLong:", self, 1);
  }

  [(THPageThumbnailView *)self p_clearTimer];
}

- (void)p_handleTap:(id)a3
{
  double v5 = (char *)[a3 state];
  if ((unint64_t)(v5 - 1) >= 2)
  {
    if ((unint64_t)(v5 - 4) >= 2)
    {
      if (v5 == (unsigned char *)&dword_0 + 3)
      {
        if (self->mTapTimer)
        {
          [(THPageThumbnailView *)self p_clearTimer];
          mDelegate = self->mDelegate;
          [a3 locationInView:self];
          double v7 = mDelegate;
          double v8 = self;
          uint64_t v9 = 0;
        }
        else
        {
          double v13 = self->mDelegate;
          [a3 locationInView:self];
          double v7 = v13;
          double v8 = self;
          uint64_t v9 = 1;
        }
        -[THPageThumbnailViewDelegate thumbnailWasTapped:atPoint:forLong:](v7, "thumbnailWasTapped:atPoint:forLong:", v8, v9);
      }
      else
      {
        id v10 = +[TSUAssertionHandler currentHandler];
        double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView p_handleTap:]");
        double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm"];
        [v10 handleFailureInFunction:v11 file:v12 lineNumber:608 description:@"Unexpected gesture state"];
      }
    }
    else
    {
      [(THPageThumbnailView *)self p_clearTimer];
      [(THPageThumbnailView *)self clearHighlightRect];
    }
  }
}

- (void)touchesBeganFromTap:(id)a3
{
  [a3 locationInView:[self superview]];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [(THPageThumbnailView *)self frame];
  v11.double x = v6;
  v11.double y = v8;
  if (CGRectContainsPoint(v12, v11))
  {
    if (!self->mTapTimer
      || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView touchesBeganFromTap:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm"), 619, @"started another tap recognition while one is in progress"), !self->mTapTimer))
    {
      self->mTapTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"p_tapGestureTimerFired:" selector:0 userInfo:0 repeats:0.5];
    }
    mDelegate = self->mDelegate;
    [a3 locationInView:self];
    -[THPageThumbnailViewDelegate thumbnailWasPressed:atPoint:forLong:](mDelegate, "thumbnailWasPressed:atPoint:forLong:", self, 0);
  }
  else
  {
    [(THPageThumbnailView *)self clearHighlightRect];
  }
}

- (void)gestureReset:(id)a3
{
  if (self->mTapTimer && [a3 state] != (char *)&dword_4 + 1) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView gestureReset:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm") lineNumber:635 description:@"expected timer to have been cleared by the time we reset this GR"];
  }
  [(THPageThumbnailView *)self p_clearTimer];
  if ([a3 state] != (char *)&dword_0 + 3)
  {
    [(THPageThumbnailView *)self clearHighlightRect];
  }
}

- (THPageThumbnailViewDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THPageThumbnailViewDelegate *)a3;
}

- (TSPData)imageData
{
  return self->mImageData;
}

- (unint64_t)pageIndex
{
  return self->mPageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->mPageIndedouble x = a3;
}

- (unint64_t)chapterIndex
{
  return self->mChapterIndex;
}

- (void)setChapterIndex:(unint64_t)a3
{
  self->mChapterIndedouble x = a3;
}

- (CALayer)imageLayer
{
  return self->mImageLayer;
}

- (UIView)highlightView
{
  return self->mHighlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (THWFreeTransformController)freeTransformController
{
  return self->_freeTransformController;
}

- (void)setFreeTransformController:(id)a3
{
}

- (THWFreeTransformGestureRecognizer)freeTransformGestureRecognizer
{
  return self->_freeTransformGestureRecognizer;
}

- (void)setFreeTransformGestureRecognizer:(id)a3
{
}

- (BOOL)willSetImageFromQueue
{
  return self->_willSetImageFromQueue;
}

- (void)setWillSetImageFromQueue:(BOOL)a3
{
  self->_willSetImageFromQueue = a3;
}

@end