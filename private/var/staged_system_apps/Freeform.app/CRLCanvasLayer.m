@interface CRLCanvasLayer
+ (double)zoomAnimationDefaultDuration;
+ (id)zoomAnimationDefaultCAAnimation;
- (BOOL)allowsPinchZoom;
- (BOOL)centeredInScrollView;
- (BOOL)horizontallyCenteredInScrollView;
- (BOOL)isInfinite;
- (BOOL)isLayoutDisabled;
- (BOOL)shouldExtendBeyondSafeArea;
- (BOOL)showsScaleFeedback;
- (BOOL)verticallyCenteredInScrollView;
- (CGPoint)contentOffsetForUnscaledContentCenter:(CGPoint)a3;
- (CGPoint)p_scrollViewContentOffsetForUnscaledContentCenter:(CGPoint)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5;
- (CGPoint)unscaledContentCenter;
- (CGRect)p_fixedScaledBoundsForScrollViewSize:(CGSize)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5;
- (CGSize)unscaledSize;
- (CRLCanvasLayer)init;
- (CRLCanvasLayer)initWithCoder:(id)a3;
- (CRLCanvasView)canvasView;
- (CRLInteractiveCanvasController)controller;
- (UIEdgeInsets)contentInset;
- (_TtC8Freeform24CRLCanvasBackgroundLayer)associatedBackgroundLayer;
- (double)maximumPinchViewScale;
- (double)minimumPinchViewScale;
- (double)viewScale;
- (id)crl_sublayersForTilingLayerSupport;
- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 animation:(id)a6 completionBlock:(id)a7;
- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 duration:(double)a6 completionBlock:(id)a7;
- (void)fixFrameAndScrollView;
- (void)layoutIfNeededIgnoringDisabledLayout;
- (void)layoutSublayers;
- (void)p_commonInit;
- (void)p_fixFrameAndScrollView;
- (void)p_scrollViewContentInsetDidChange:(id)a3;
- (void)p_scrollViewSafeAreaInsetsDidChange:(id)a3;
- (void)p_setEnclosingScrollViewZoomParameters;
- (void)p_setViewScale:(double)a3;
- (void)p_setViewScale:(double)a3 preservingScrollOffset:(BOOL)a4;
- (void)setAllowsPinchZoom:(BOOL)a3;
- (void)setAssociatedBackgroundLayer:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenteredInScrollView:(BOOL)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setController:(id)a3;
- (void)setDisableLayout:(BOOL)a3;
- (void)setHorizontallyCenteredInScrollView:(BOOL)a3;
- (void)setHorizontallyCenteredInScrollView:(BOOL)a3 verticallyCenteredInScrollView:(BOOL)a4 fixFrame:(BOOL)a5;
- (void)setInfinite:(BOOL)a3;
- (void)setMaximumPinchViewScale:(double)a3;
- (void)setMinimumPinchViewScale:(double)a3;
- (void)setNeedsLayout;
- (void)setScrollViewFrameMaintainingApparentScrollPosition:(CGRect)a3 animated:(BOOL)a4;
- (void)setShouldExtendBeyondSafeArea:(BOOL)a3;
- (void)setShowsScaleFeedback:(BOOL)a3;
- (void)setUnscaledSize:(CGSize)a3;
- (void)setUnscaledSize:(CGSize)a3 fixFrame:(BOOL)a4;
- (void)setVerticallyCenteredInScrollView:(BOOL)a3;
- (void)setViewScale:(double)a3;
- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 maintainPosition:(BOOL)a5 animated:(BOOL)a6;
- (void)teardown;
- (void)updateCanvasEdgeLayersIfNecessary;
@end

@implementation CRLCanvasLayer

+ (id)zoomAnimationDefaultCAAnimation
{
  id v2 = objc_alloc_init((Class)CABasicAnimation);
  [v2 setKeyPath:@"transform"];
  v3 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v2 setTimingFunction:v3];

  +[CRLCanvasLayer zoomAnimationDefaultDuration];
  [v2 setDuration:];

  return v2;
}

+ (double)zoomAnimationDefaultDuration
{
  return 0.200000003;
}

- (void)p_commonInit
{
  self->mViewScale = 1.0;
  +[CRLInteractiveCanvasController maximumRecommendedViewScale];
  self->mMaximumPinchViewScale = v3;
  +[CRLInteractiveCanvasController minimumRecommendedViewScale];
  self->mMinimumPinchViewScale = v4;
  self->mAllowsPinchZoom = 0;
  self->mHorizontallyCenteredInScrollView = 0;
  self->mVerticallyCenteredInScrollView = 0;
  long long v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->mContentInset.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->mContentInset.bottom = v5;
  [(CRLCanvasLayer *)self bounds];
  self->mUnscaledSize.width = v6;
  self->mUnscaledSize.height = v7;
  self->mShowsScaleFeedback = 1;
  mAnimateToViewScaleActiveDisplayLink = self->mAnimateToViewScaleActiveDisplayLink;
  self->mAnimateToViewScaleActiveDisplayLink = 0;

  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.c = v9;
  *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(CRLCanvasLayer *)self setAllowsEdgeAntialiasing:1];
  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"p_scrollViewScrollerStyleDidChange:" name:@"CRLScrollViewScrollerStyleDidChange" object:0];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"p_scrollViewSafeAreaInsetsDidChange:" name:@"CRLScrollViewSafeAreaInsetsDidChangeNotification" object:0];

  id v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"p_scrollViewContentInsetDidChange:" name:@"CRLScrollViewContentInsetDidChangeNotification" object:0];
}

- (CRLCanvasLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasLayer;
  id v2 = [(CRLCanvasLayer *)&v5 init];
  double v3 = v2;
  if (v2) {
    [(CRLCanvasLayer *)v2 p_commonInit];
  }
  return v3;
}

- (CRLCanvasLayer)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasLayer;
  double v3 = [(CRLCanvasLayer *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(CRLCanvasLayer *)v3 p_commonInit];
  }
  return v4;
}

- (void)setController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mController);

  if (WeakRetained)
  {
    int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1140);
    }
    CGFloat v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070958(v6, v7);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1160);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v8);
    }
    long long v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayer setController:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:193 isFatal:0 description:"shouldn't try to set canvasLayer's controller more than once"];
  }
  id v11 = objc_loadWeakRetained((id *)&self->mController);

  if (!v11)
  {
    id v12 = objc_storeWeak((id *)&self->mController, v4);
    double width = self->mUnscaledSize.width;
    double height = self->mUnscaledSize.height;
    id v15 = v12;
    v16 = [v4 canvas];
    [v16 setUnscaledSize:width height];

    double mViewScale = self->mViewScale;
    id v18 = objc_loadWeakRetained((id *)&self->mController);
    v19 = [v18 canvas];
    [v19 setViewScale:mViewScale];
  }
}

- (void)teardown
{
  objc_storeWeak((id *)&self->mController, 0);
  [(CRLCanvasLayer *)self p_clearAllLayerDelegates];
  self->double mViewScale = 1.0;
  [(CRLCanvasBackgroundLayer *)self->mCanvasBackgroundLayer tearDown];
  mCanvasBackgroundLayer = self->mCanvasBackgroundLayer;
  self->mCanvasBackgroundLayer = 0;

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)setUnscaledSize:(CGSize)a3
{
}

- (void)setUnscaledSize:(CGSize)a3 fixFrame:(BOOL)a4
{
  if (a3.width > 0.0)
  {
    double height = a3.height;
    if (a3.height > 0.0)
    {
      double width = a3.width;
      if (a3.width != self->mUnscaledSize.width || a3.height != self->mUnscaledSize.height)
      {
        BOOL v8 = a4;
        self->mUnscaledSize = a3;
        id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
        v10 = [WeakRetained canvas];
        [v10 setUnscaledSize:width, height];

        if (v8)
        {
          [(CRLCanvasLayer *)self fixFrameAndScrollView];
          id v11 = objc_loadWeakRetained((id *)&self->mController);
          [v11 layoutInvalidated];
        }
      }
    }
  }
}

- (BOOL)centeredInScrollView
{
  BOOL v3 = [(CRLCanvasLayer *)self horizontallyCenteredInScrollView];
  if (v3)
  {
    LOBYTE(v3) = [(CRLCanvasLayer *)self verticallyCenteredInScrollView];
  }
  return v3;
}

- (void)setCenteredInScrollView:(BOOL)a3
{
  if (self->mHorizontallyCenteredInScrollView != a3)
  {
    self->mHorizontallyCenteredInScrollView = a3;
    p_mVerticallyCenteredInScrollView = &self->mVerticallyCenteredInScrollView;
    if (self->mVerticallyCenteredInScrollView == a3)
    {
LABEL_6:
      [(CRLCanvasLayer *)self fixFrameAndScrollView];
      return;
    }
LABEL_5:
    BOOL *p_mVerticallyCenteredInScrollView = a3;
    goto LABEL_6;
  }
  p_mVerticallyCenteredInScrollView = &self->mVerticallyCenteredInScrollView;
  if (self->mVerticallyCenteredInScrollView != a3) {
    goto LABEL_5;
  }
}

- (void)setHorizontallyCenteredInScrollView:(BOOL)a3
{
}

- (void)setVerticallyCenteredInScrollView:(BOOL)a3
{
}

- (void)setHorizontallyCenteredInScrollView:(BOOL)a3 verticallyCenteredInScrollView:(BOOL)a4 fixFrame:(BOOL)a5
{
  BOOL mHorizontallyCenteredInScrollView = self->mHorizontallyCenteredInScrollView;
  if (mHorizontallyCenteredInScrollView != a3) {
    self->BOOL mHorizontallyCenteredInScrollView = a3;
  }
  if (self->mVerticallyCenteredInScrollView == a4)
  {
    if (mHorizontallyCenteredInScrollView != a3 && a5) {
      goto LABEL_8;
    }
  }
  else
  {
    self->mVerticallyCenteredInScrollView = a4;
    if (a5) {
LABEL_8:
    }
      [(CRLCanvasLayer *)self fixFrameAndScrollView];
  }
}

- (void)fixFrameAndScrollView
{
  if ((self->mUnscaledSize.width != CGSizeZero.width || self->mUnscaledSize.height != CGSizeZero.height)
    && !self->mViewScaleAnimationCount)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mController);

    if (WeakRetained)
    {
      [(CRLCanvasLayer *)self p_fixFrameAndScrollView];
    }
  }
}

- (void)setNeedsLayout
{
  unsigned __int8 v3 = [(CRLCanvasLayer *)self needsLayout];
  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasLayer;
  [(CRLCanvasLayer *)&v6 setNeedsLayout];
  if ((v3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    unsigned __int8 v5 = [WeakRetained i_currentlySuppressingLayerUpdates];

    if ((v5 & 1) == 0) {
      [(CRLCanvasLayer *)self crl_setNeedsLayoutForTilingLayers];
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CRLCanvasLayer *)self bounds];
  v15.origin.double x = v8;
  v15.origin.double y = v9;
  v15.size.double width = v10;
  v15.size.double height = v11;
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  BOOL v12 = CGRectEqualToRect(v14, v15);
  v13.receiver = self;
  v13.super_class = (Class)CRLCanvasLayer;
  -[CRLCanvasLayer setBounds:](&v13, "setBounds:", x, y, width, height);
  if (!v12) {
    [(CRLCanvasBackgroundLayer *)self->mCanvasBackgroundLayer setNeedsLayout];
  }
}

- (id)crl_sublayersForTilingLayerSupport
{
  unsigned __int8 v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CRLCanvasLayer *)self sublayers];
  id v5 = [v4 copy];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)layoutIfNeededIgnoringDisabledLayout
{
  BOOL mDisableLayout = self->mDisableLayout;
  self->BOOL mDisableLayout = 0;
  [(CRLCanvasLayer *)self layoutIfNeeded];
  self->BOOL mDisableLayout = mDisableLayout;
}

- (void)layoutSublayers
{
  if (!self->mDisableLayout)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    [WeakRetained i_layout];

    [(CRLCanvasLayer *)self viewScale];
    double v5 = v4;
    id v6 = objc_loadWeakRetained((id *)&self->mAssociatedBackgroundLayer);
    [v6 setViewScale:v5];

    id v7 = objc_loadWeakRetained((id *)&self->mAssociatedBackgroundLayer);
    LOBYTE(v6) = [v7 scalesWithCanvas];

    if ((v6 & 1) == 0) {
      [(CRLCanvasLayer *)self fixFrameAndScrollView];
    }
    [(CRLCanvasLayer *)self updateCanvasEdgeLayersIfNecessary];
  }
}

- (CRLCanvasView)canvasView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
  unsigned __int8 v3 = [WeakRetained layerHost];
  double v4 = [v3 canvasView];

  return (CRLCanvasView *)v4;
}

- (void)setViewScale:(double)a3
{
}

- (void)setAllowsPinchZoom:(BOOL)a3
{
  if (self->mAllowsPinchZoom != a3)
  {
    self->mAllowsPinchZoom = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    double v5 = [WeakRetained layerHost];
    id v6 = [v5 asiOSCVC];
    [v6 i_updateZoomGestureRecognizer];

    [(CRLCanvasLayer *)self p_setEnclosingScrollViewZoomParameters];
  }
}

- (void)setMinimumPinchViewScale:(double)a3
{
  if (self->mMinimumPinchViewScale != a3)
  {
    self->mMinimumPinchViewScale = a3;
    [(CRLCanvasLayer *)self p_setEnclosingScrollViewZoomParameters];
  }
}

- (void)setMaximumPinchViewScale:(double)a3
{
  if (self->mMaximumPinchViewScale != a3)
  {
    self->mMaximumPinchViewScale = a3;
    [(CRLCanvasLayer *)self p_setEnclosingScrollViewZoomParameters];
  }
}

- (CGPoint)unscaledContentCenter
{
  unsigned __int8 v3 = [(CRLCanvasLayer *)self canvasView];
  double v4 = [v3 enclosingScrollView];

  if (v4)
  {
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [v4 adjustedContentInset];
    CGFloat v14 = v6 + v13;
    CGFloat v16 = v8 + v15;
    CGFloat v18 = v10 - (v13 + v17);
    CGFloat v20 = v12 - (v15 + v19);
    v21 = [(CRLCanvasLayer *)self canvasView];
    [v21 convertPoint:v4 fromView:sub_100065738(v14, v16, v18, v20)];
    double v23 = v22;
    double v25 = v24;

    double x = sub_1000646A4(v23, v25, 1.0 / self->mViewScale);
    CGFloat y = v27;
  }
  else
  {
    double x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
  }

  double v29 = x;
  double v30 = y;
  result.CGFloat y = v30;
  result.double x = v29;
  return result;
}

- (CGPoint)contentOffsetForUnscaledContentCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double mViewScale = self->mViewScale;
  [(CRLCanvasLayer *)self contentInset];

  -[CRLCanvasLayer p_scrollViewContentOffsetForUnscaledContentCenter:viewScale:contentInset:](self, "p_scrollViewContentOffsetForUnscaledContentCenter:viewScale:contentInset:", x, y, mViewScale, v7, v8, v9, v10);
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)p_scrollViewContentOffsetForUnscaledContentCenter:(CGPoint)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v13 = [(CRLCanvasLayer *)self canvasView];
  CGFloat v14 = [v13 enclosingScrollView];

  if (v14)
  {
    double rect_16 = x;
    double rect_24 = y;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    [WeakRetained unobscuredFrameOfView:v14];
    double v17 = v16;
    double v19 = v18;

    -[CRLCanvasLayer p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:", v17, v19, a4, top, left, bottom, right);
    double rect_8 = v20;
    id v21 = objc_loadWeakRetained((id *)&self->mController);
    LODWORD(WeakRetained) = [v21 shouldCanvasScrollingSizeGrowToFitBoardContent];

    if (!WeakRetained) {
      sub_1000646A4(self->mUnscaledSize.width, self->mUnscaledSize.height, a4);
    }
    double rect = sub_100064070();
    CGFloat v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v28 = sub_1000646A4(rect_16, rect_24, a4);
    double v30 = sub_100064680(v28, v29, rect_8);
    double v32 = v31;
    double v33 = -0.5;
    double v34 = 0.0;
    double v35 = 0.0;
    if (v25 > v17)
    {
      double v36 = v30 + v17 * -0.5;
      v52.origin.CGFloat x = rect;
      v52.origin.CGFloat y = v23;
      v52.size.double width = v25;
      v52.size.double height = v27;
      double MinX = CGRectGetMinX(v52);
      double v38 = sub_100407E48(v36, MinX, v25 - v17);
      double v33 = -0.5;
      double v35 = v38;
    }
    if (v27 > v19)
    {
      double v39 = v32 + v19 * v33;
      v53.origin.CGFloat x = rect;
      v53.origin.CGFloat y = v23;
      v53.size.double width = v25;
      v53.size.double height = v27;
      double MinY = CGRectGetMinY(v53);
      double v34 = sub_100407E48(v39, MinY, v27 - v19);
    }
    [v14 adjustedContentInset:rect];
    double v42 = v35 - v41;
    double v44 = v34 - v43;
  }
  else
  {
    double v42 = CGPointZero.x;
    double v44 = CGPointZero.y;
  }

  double v45 = v42;
  double v46 = v44;
  result.CGFloat y = v46;
  result.CGFloat x = v45;
  return result;
}

- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 maintainPosition:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v14 = [(CRLCanvasLayer *)self canvasView];
  id v31 = [v14 enclosingScrollView];

  if (v6)
  {
    if (v31)
    {
      [v31 frame];
      v35.origin.double x = x;
      v35.origin.double y = y;
      v35.size.double width = width;
      v35.size.double height = height;
      if (!CGRectEqualToRect(v33, v35)) {
        [v31 setFrame:CGRectMake(x, y, width, height)];
      }
    }
    if (v7)
    {
      [(CRLCanvasLayer *)self unscaledContentCenter];
      double v16 = v15;
      double v18 = v17;
    }
    else
    {
      double v16 = CGPointZero.x;
      double v18 = CGPointZero.y;
    }
    [(CRLCanvasLayer *)self contentInset];
    -[CRLCanvasLayer animateToViewScale:contentCenter:contentInset:duration:completionBlock:](self, "animateToViewScale:contentCenter:contentInset:duration:completionBlock:", 0, a3, v16, v18, v20, v21, v22, v23, 0.2);
  }
  else
  {
    if (v31
      && ([v31 frame],
          v36.origin.double x = x,
          v36.origin.double y = y,
          v36.size.double width = width,
          v36.size.double height = height,
          !CGRectEqualToRect(v34, v36)))
    {
      [v31 setFrame:x, y, width, height];
      int v19 = 1;
    }
    else
    {
      int v19 = 0;
    }
    [(CRLCanvasLayer *)self unscaledContentCenter];
    double v25 = v24;
    double v27 = v26;
    double mViewScale = self->mViewScale;
    if (mViewScale != a3) {
      [(CRLCanvasLayer *)self p_setViewScale:a3];
    }
    [(CRLCanvasLayer *)self fixFrameAndScrollView];
    if (v7)
    {
      -[CRLCanvasLayer contentOffsetForUnscaledContentCenter:](self, "contentOffsetForUnscaledContentCenter:", v25, v27);
      [v31 setContentOffset:0];
    }
    if (mViewScale != a3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
      [WeakRetained i_viewScaleDidChange];
    }
    if (v19)
    {
      id v30 = objc_loadWeakRetained((id *)&self->mController);
      [v30 i_viewScrollDidChange];
    }
  }
}

- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 duration:(double)a6 completionBlock:(id)a7
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double y = a4.y;
  double x = a4.x;
  id v16 = a7;
  id v17 = +[CRLCanvasLayer zoomAnimationDefaultCAAnimation];
  [v17 setDuration:a6];
  -[CRLCanvasLayer animateToViewScale:contentCenter:contentInset:animation:completionBlock:](self, "animateToViewScale:contentCenter:contentInset:animation:completionBlock:", v17, v16, a3, x, y, top, left, bottom, right);
}

- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 animation:(id)a6 completionBlock:(id)a7
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double y = a4.y;
  double x = a4.x;
  id v13 = a6;
  CGFloat v14 = (void (**)(id, BOOL))a7;
  double v15 = [(CRLCanvasLayer *)self canvasView];
  id v16 = [v15 enclosingScrollView];

  if (a3 <= 0.0
    || self->mViewScale == a3
    && ([(CRLCanvasLayer *)self contentInset], left == v50)
    && top == v47
    && right == v49
    && bottom == v48
    && ([(CRLCanvasLayer *)self unscaledContentCenter], sub_1000640F4(x, y, v51, v52))
    && !self->mViewScaleAnimationCount)
  {
    if (v14) {
      v14[2](v14, self->mViewScaleAnimationCount == 0);
    }
  }
  else
  {
    unint64_t mViewScaleAnimationCount = self->mViewScaleAnimationCount;
    self->unint64_t mViewScaleAnimationCount = mViewScaleAnimationCount + 1;
    if (!mViewScaleAnimationCount)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
      [WeakRetained i_viewWillBeginZooming];
    }
    p_mController = (id *)&self->mController;
    id v19 = objc_loadWeakRetained((id *)&self->mController);
    double v20 = a3;
    [v19 i_viewDidZoomToViewScale:0 notify:a3];

    unsigned __int8 v21 = [(CRLCanvasLayer *)self isLayoutDisabled];
    [(CRLCanvasLayer *)self setDisableLayout:1];
    if (!v13)
    {
      id v13 = +[CRLCanvasLayer zoomAnimationDefaultCAAnimation];
    }
    [v13 duration];
    v81 = v22;
    long long v88 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v89 = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v120.CATransform3D a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v120.c = v88;
    long long v87 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v120.tdouble x = v87;
    [(CRLCanvasLayer *)self bounds];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v83 = v28;
    CGFloat v84 = v27;
    double v29 = CGPointZero.x;
    CGFloat v90 = CGPointZero.x;
    double v91 = CGPointZero.y;
    double v85 = x;
    double v86 = left;
    double v82 = top;
    if (v16)
    {
      double v30 = sub_100064680(CGPointZero.x, CGPointZero.y, v23);
      double v79 = v31;
      double v80 = v30;
      [v16 frame];
      -[CRLCanvasLayer p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:", v32, v33, v20, top, left, bottom, right);
      double v35 = v34;
      -[CRLCanvasLayer p_scrollViewContentOffsetForUnscaledContentCenter:viewScale:contentInset:](self, "p_scrollViewContentOffsetForUnscaledContentCenter:viewScale:contentInset:", x, y, v20, top, left, bottom, right);
      double v37 = v36;
      double v39 = v38;
      double v40 = sub_100064680(CGPointZero.x, v91, v35);
      double v92 = v41;
      [v16 contentOffset];
      double v29 = sub_100064680(v80, v79, v42);
      double v44 = v43;
      double v45 = sub_100064680(v40, v92, v37);
      CGFloat v90 = v37;
      double v91 = v39;
    }
    else
    {
      double v46 = CGPointZero.y;
      double v45 = CGPointZero.x;
      double v44 = v46;
    }
    *(_OWORD *)&v117.m11 = v89;
    *(_OWORD *)&v117.m13 = v88;
    *(_OWORD *)&v117.m21 = v87;
    CGAffineTransformTranslate(&v120, (CGAffineTransform *)&v117, v45 - v29, v46 - v44);
    double mViewScale = self->mViewScale;
    memset(&v119, 0, sizeof(v119));
    CGAffineTransformMakeScale(&v119, v20 / mViewScale, v20 / mViewScale);
    [(CRLCanvasLayer *)self anchorPoint];
    double v55 = v54;
    double v57 = v56;
    v121.origin.double x = v24;
    v121.origin.double y = v26;
    v121.size.double width = v84;
    v121.size.double height = v83;
    double MinX = CGRectGetMinX(v121);
    v122.origin.double x = v24;
    v122.origin.double y = v26;
    v122.size.double width = v84;
    v122.size.double height = v83;
    CGFloat v59 = MinX + v55 * CGRectGetWidth(v122);
    v123.origin.double x = v24;
    v123.origin.double y = v26;
    v123.size.double width = v84;
    v123.size.double height = v83;
    double MinY = CGRectGetMinY(v123);
    v124.origin.double x = v24;
    v124.origin.double y = v26;
    v124.size.double width = v84;
    v124.size.double height = v83;
    CGFloat Height = CGRectGetHeight(v124);
    *(_OWORD *)&t1.m11 = *(_OWORD *)&v119.a;
    *(_OWORD *)&t1.m13 = *(_OWORD *)&v119.c;
    *(_OWORD *)&t1.m21 = *(_OWORD *)&v119.tx;
    sub_10007FCC0(&t1, (CGAffineTransform *)&v117, v59, MinY + v57 * Height);
    *(_OWORD *)&v119.c = *(_OWORD *)&v117.m13;
    *(_OWORD *)&v119.tdouble x = *(_OWORD *)&v117.m21;
    *(_OWORD *)&v119.CATransform3D a = *(_OWORD *)&v117.m11;
    *(_OWORD *)&t1.m11 = *(_OWORD *)&v117.m11;
    *(_OWORD *)&t1.m13 = *(_OWORD *)&v117.m13;
    *(_OWORD *)&t1.m21 = *(_OWORD *)&v117.m21;
    CGAffineTransform t2 = v120;
    CGAffineTransformConcat((CGAffineTransform *)&v117, (CGAffineTransform *)&t1, &t2);
    *(_OWORD *)&v120.CATransform3D a = *(_OWORD *)&v117.m11;
    *(_OWORD *)&v120.c = *(_OWORD *)&v117.m13;
    *(_OWORD *)&v120.tdouble x = *(_OWORD *)&v117.m21;
    memset(&v117, 0, sizeof(v117));
    *(_OWORD *)&t1.m11 = *(_OWORD *)&v120.a;
    *(_OWORD *)&t1.m13 = *(_OWORD *)&v120.c;
    *(_OWORD *)&t1.m21 = *(_OWORD *)&v120.tx;
    CATransform3DMakeAffineTransform(&v117, (CGAffineTransform *)&t1);
    v117.m33 = v117.m11;
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472;
    CATransform3D v115 = v117;
    v114[2] = sub_100094E5C;
    v114[3] = &unk_1014D1188;
    v114[4] = self;
    unsigned __int8 v116 = v21;
    v62 = objc_retainBlock(v114);
    objc_initWeak((id *)&t2, self);
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_100094ECC;
    v111[3] = &unk_1014D11B0;
    objc_copyWeak(v113, (id *)&t2);
    v112 = v14;
    v113[1] = *(id *)&v20;
    v113[2] = *(id *)&v82;
    v113[3] = *(id *)&v86;
    v113[4] = *(id *)&bottom;
    v113[5] = *(id *)&right;
    v113[6] = *(id *)&v90;
    v113[7] = *(id *)&v91;
    v113[8] = *(id *)&v85;
    v113[9] = *(id *)&y;
    v63 = objc_retainBlock(v111);
    [(CRLCanvasLayer *)self transform];
    CATransform3D t1 = v117;
    if (CATransform3DEqualToTransform(&a, &t1))
    {
      ((void (*)(void *))v62[2])(v62);
      ((void (*)(void *))v63[2])(v63);
    }
    else
    {
      CFTimeInterval v64 = CACurrentMediaTime();
      *(_OWORD *)&t1.m11 = v89;
      *(_OWORD *)&t1.m13 = v88;
      *(_OWORD *)&t1.m21 = v87;
      mAnimateToViewScaleActiveDisplayLink = self->mAnimateToViewScaleActiveDisplayLink;
      if (mAnimateToViewScaleActiveDisplayLink)
      {
        [(CRLDisplayLink *)mAnimateToViewScaleActiveDisplayLink setPaused:1];
        long long v66 = *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.c;
        *(_OWORD *)&t1.m11 = *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.a;
        *(_OWORD *)&t1.m13 = v66;
        *(_OWORD *)&t1.m21 = *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.tx;
      }
      v95 = v16;
      v67 = [CRLDisplayLink alloc];
      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472;
      v102[2] = sub_1000950A4;
      v102[3] = &unk_1014D11D8;
      v104[1] = v81;
      objc_copyWeak(v104, (id *)&t2);
      v104[2] = *(id *)&v64;
      id v68 = v13;
      id v103 = v68;
      CGAffineTransform v105 = v120;
      long long v106 = *(_OWORD *)&t1.m11;
      long long v107 = *(_OWORD *)&t1.m13;
      long long v108 = *(_OWORD *)&t1.m21;
      v69 = [(CRLDisplayLink *)v67 initWithHandler:v102];
      objc_storeStrong((id *)&self->mAnimateToViewScaleActiveDisplayLink, v69);
      objc_initWeak(&location, v69);
      v98[0] = _NSConcreteStackBlock;
      v98[1] = 3221225472;
      v98[2] = sub_1000951A8;
      v98[3] = &unk_1014D1200;
      objc_copyWeak(&v100, &location);
      v98[4] = self;
      v99 = v63;
      v70 = objc_retainBlock(v98);
      [(CRLDisplayLink *)v69 setPaused:0];
      id v71 = objc_loadWeakRetained(p_mController);
      [v71 beginAnimations:&stru_101538650];

      id v72 = objc_loadWeakRetained(p_mController);
      v73 = [v72 i_currentAnimation];
      [v73 setDuration:*(double *)&v81];

      id v74 = objc_loadWeakRetained(p_mController);
      v75 = [v74 i_currentAnimation];
      [v75 setAnimation:v68 forLayer:self forKey:@"transform"];

      id v76 = objc_loadWeakRetained(p_mController);
      v77 = [v76 i_currentAnimation];
      [v77 setCompletionBlock:v70];

      ((void (*)(void *))v62[2])(v62);
      id v78 = objc_loadWeakRetained(p_mController);
      [v78 commitAnimations];

      objc_destroyWeak(&v100);
      objc_destroyWeak(&location);

      objc_destroyWeak(v104);
      id v16 = v95;
    }

    objc_destroyWeak(v113);
    objc_destroyWeak((id *)&t2);
  }
}

- (void)setScrollViewFrameMaintainingApparentScrollPosition:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(CRLCanvasLayer *)self canvasView];
  id v23 = [v10 enclosingScrollView];

  if (v23)
  {
    [v23 frame];
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    if (!CGRectEqualToRect(v25, v26))
    {
      double v11 = [(CRLCanvasLayer *)self canvasView];
      [v23 bounds];
      [v11 convertPoint:v23 fromView:sub_100065738(v12, v13, v14, v15)];
      double v17 = v16;
      double v19 = v18;

      double v20 = sub_1000646A4(v17, v19, 1.0 / self->mViewScale);
      double v22 = v21;
      [v23 setFrame:CGRectMake(x, y, width, height)];
      -[CRLCanvasLayer contentOffsetForUnscaledContentCenter:](self, "contentOffsetForUnscaledContentCenter:", v20, v22);
      [v23 setContentOffset:v4 animated:];
    }
  }
  [(CRLCanvasLayer *)self fixFrameAndScrollView];
}

- (void)p_setViewScale:(double)a3
{
  [(CRLCanvasLayer *)self willChangeValueForKey:@"viewScale"];
  self->double mViewScale = a3;
  [(CRLCanvasLayer *)self didChangeValueForKey:@"viewScale"];
  double mViewScale = self->mViewScale;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
  BOOL v7 = [WeakRetained canvas];
  [v7 setViewScale:mViewScale];

  double v8 = self->mViewScale;
  mCanvasBackgroundLayer = self->mCanvasBackgroundLayer;

  [(CRLCanvasBackgroundLayer *)mCanvasBackgroundLayer setViewScale:v8];
}

- (void)p_setViewScale:(double)a3 preservingScrollOffset:(BOOL)a4
{
  double mViewScale = self->mViewScale;
  if (a3 > 0.0 && mViewScale != a3)
  {
    if (a4
      && ([(CRLCanvasLayer *)self canvasView],
          double v8 = objc_claimAutoreleasedReturnValue(),
          [v8 enclosingScrollView],
          id v24 = (id)objc_claimAutoreleasedReturnValue(),
          v8,
          v24))
    {
      [v24 contentOffset];
      double v10 = v9;
      double v12 = v11;
      [v24 contentSize];
      char v13 = 0;
      double x = v10 / v14;
      double y = v12 / v16;
    }
    else
    {
      id v24 = 0;
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      char v13 = 1;
    }
    [(CRLCanvasLayer *)self p_setViewScale:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    unsigned int v19 = [WeakRetained shouldCanvasScrollingSizeGrowToFitBoardContent];

    if (v19)
    {
      id v20 = objc_loadWeakRetained((id *)&self->mController);
      [v20 i_canvasDidUpdateVisibleBounds];
    }
    [(CRLCanvasLayer *)self p_setEnclosingScrollViewZoomParameters];
    [(CRLCanvasLayer *)self fixFrameAndScrollView];
    if ((v13 & 1) == 0)
    {
      [v24 contentSize];
      [v24 setContentOffset:0, sub_1000674F0(x * v21, y * v22)];
    }
    id v23 = objc_loadWeakRetained((id *)&self->mController);
    [v23 i_viewScaleDidChange];
  }
}

- (void)p_setEnclosingScrollViewZoomParameters
{
  id v2 = [(CRLCanvasLayer *)self canvasView];
  id v3 = [v2 enclosingScrollView];

  if (v3)
  {
    [v3 setMinimumZoomScale:1.0];
    [v3 setMaximumZoomScale:1.0];
    [v3 setZoomScale:1.0];
  }
}

- (CGRect)p_fixedScaledBoundsForScrollViewSize:(CGSize)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5
{
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  p_mUnscaledSize = &self->mUnscaledSize;
  if (self->mUnscaledSize.width == CGSizeZero.width && self->mUnscaledSize.height == CGSizeZero.height)
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  else
  {
    double right = a5.right;
    double bottom = a5.bottom;
    double v10 = sub_100064070();
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    double v18 = [WeakRetained canvas];
    unsigned int v19 = [v18 isAnchoredAtRight];

    double v115 = left;
    double v116 = top;
    if (v19)
    {
      CGAffineTransformMakeScale(&v119, -1.0, 1.0);
      v133.origin.CGFloat x = v10;
      v133.origin.CGFloat y = v12;
      v133.size.CGFloat width = v14;
      v133.size.CGFloat height = v16;
      CGRect v134 = CGRectApplyAffineTransform(v133, &v119);
      double v10 = v134.origin.x;
      double v12 = v134.origin.y;
      double v14 = v134.size.width;
      double v16 = v134.size.height;
    }
    id v20 = objc_loadWeakRetained((id *)&self->mController);
    [v20 growUnscaledCanvasLayerRect:v10 withViewScale:v12, v14, v16, a4];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    CGFloat v109 = v12;
    double v110 = v10;
    CGFloat v108 = v14;
    double v29 = v14;
    CGFloat v30 = v16;
    if (!sub_100064278(v22, v24, v26, v28, v10, v12, v29, v16))
    {
      unsigned int v31 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1220);
      }
      double v32 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        CGFloat v100 = p_mUnscaledSize->width;
        CGFloat v101 = p_mUnscaledSize->height;
        v102 = v32;
        v132.CGFloat width = v100;
        v132.CGFloat height = v101;
        id v103 = NSStringFromCGSize(v132);
        v138.origin.CGFloat x = v22;
        v138.origin.CGFloat y = v24;
        v138.size.CGFloat width = v26;
        v138.size.CGFloat height = v28;
        v104 = NSStringFromCGRect(v138);
        *(_DWORD *)buf = 67110402;
        unsigned int v121 = v31;
        __int16 v122 = 2082;
        CGRect v123 = "-[CRLCanvasLayer p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:]";
        __int16 v124 = 2082;
        v125 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayer.m";
        __int16 v126 = 1024;
        int v127 = 862;
        __int16 v128 = 2112;
        v129 = v103;
        __int16 v130 = 2112;
        v131 = v104;
        _os_log_error_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected canvas layer not to shrink in -growUnscaledCanvasLayerRect:, but jumped from %@ to %@, ignoring provided rect.", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1240);
      }
      double v33 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v33);
      }
      double v34 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayer p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:]");
      double v35 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayer.m"];
      double v36 = NSStringFromCGSize(*p_mUnscaledSize);
      v135.origin.CGFloat x = v22;
      v135.origin.CGFloat y = v24;
      v135.size.CGFloat width = v26;
      v135.size.CGFloat height = v28;
      double v37 = NSStringFromCGRect(v135);
      +[CRLAssertionHandler handleFailureInFunction:v34, v35, 862, 0, "expected canvas layer not to shrink in -growUnscaledCanvasLayerRect:, but jumped from %@ to %@, ignoring provided rect.", v36, v37 file lineNumber isFatal description];

      double v24 = v109;
      double v22 = v110;
      double v26 = v108;
      double v28 = v16;
    }
    double v38 = v115 + sub_1000652FC(v22, v24, v26, v28, a4);
    double v40 = v116 + v39;
    double v41 = v115 + right;
    double v43 = v42 - (v115 + right);
    double v44 = v116 + bottom;
    double v46 = v45 - (v116 + bottom);
    double v47 = [(CRLCanvasLayer *)self canvasView];
    double v48 = [v47 enclosingScrollView];

    if (v48)
    {
      id v49 = objc_loadWeakRetained((id *)&self->mController);
      unsigned int v50 = [v49 shouldResizeCanvasToScrollView];

      if (v50)
      {
        double v106 = v46;
        CGFloat r2 = v43;
        CGFloat v112 = v38;
        double v114 = v40;
        id v51 = objc_loadWeakRetained((id *)&self->mController);
        double v52 = [v51 canvas];
        [v52 contentsScale];
        double v105 = v53;

        double v54 = sub_100064070();
        double v56 = v55;
        double v58 = v57;
        [v48 scrollableAreaContentInsets:v54];
        CGFloat v61 = v56 - (v59 + v60);
        double v64 = v58 - (v62 + v63);
        double v65 = sub_1000652FC(v110, v109, v108, v30, a4);
        double v118 = v66;
        double v67 = v115 + v65;
        double v69 = v68 - v41;
        double v71 = v70 - v44;
        CGFloat v72 = v61;
        double v73 = sub_100064680(v61, v64, v68 - v41);
        if (v73 <= 0.0)
        {
          CGFloat v72 = v69;
          double v81 = v116;
          CGFloat v82 = v106;
        }
        else
        {
          double v75 = v73;
          double v76 = v74;
          v77 = [(CRLCanvasLayer *)self controller];
          id v78 = [v77 canvas];
          unsigned int v79 = [v78 isAnchoredAtRight];

          double v80 = 0.0;
          if (v79) {
            double v80 = v75;
          }
          double v67 = v67 - v80;
          double v81 = v116;
          if ([(CRLCanvasLayer *)self horizontallyCenteredInScrollView]) {
            double v67 = sub_1000674C4(v67 + v75 * -0.5, v105);
          }
          CGFloat v82 = v106;
          double v74 = v76;
        }
        double v87 = v81 + v118;
        if (v74 <= 0.0)
        {
          double v64 = v71;
          CGFloat v89 = v114;
        }
        else
        {
          double v88 = v74;
          CGFloat v89 = v114;
          if ([(CRLCanvasLayer *)self verticallyCenteredInScrollView]) {
            double v87 = sub_1000674C4(v87 + v88 * -0.5, v105);
          }
        }
        v140.origin.CGFloat x = v112;
        v136.origin.CGFloat x = v67;
        v136.origin.CGFloat y = v87;
        v136.size.CGFloat width = v72;
        v136.size.CGFloat height = v64;
        v140.origin.CGFloat y = v89;
        v140.size.CGFloat width = r2;
        v140.size.CGFloat height = v82;
        CGRect v137 = CGRectUnion(v136, v140);
        double v38 = v137.origin.x;
        double v40 = v137.origin.y;
        double v43 = v137.size.width;
        double v46 = v137.size.height;
      }
    }
    id v90 = objc_loadWeakRetained((id *)&self->mController);
    double v91 = [v90 canvas];
    [v91 contentsScale];
    CGFloat x = sub_100067584(v38, v40, v43, v46, v92);
    CGFloat y = v93;
    CGFloat width = v94;
    CGFloat height = v95;
  }
  double v96 = x;
  double v97 = y;
  double v98 = width;
  double v99 = height;
  result.size.CGFloat height = v99;
  result.size.CGFloat width = v98;
  result.origin.CGFloat y = v97;
  result.origin.CGFloat x = v96;
  return result;
}

- (void)p_fixFrameAndScrollView
{
  id v3 = [(CRLCanvasLayer *)self controller];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->mController);
  [WeakRetained sizeOfScrollViewEnclosingCanvas];
  double v10 = v9;
  double v12 = v11;
  double mViewScale = self->mViewScale;
  [(CRLCanvasLayer *)self contentInset];
  -[CRLCanvasLayer p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:", v10, v12, mViewScale, v14, v15, v16, v17);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  id v74 = [(CRLCanvasLayer *)self canvasView];
  [v74 bounds];
  v77.origin.CGFloat x = v26;
  v77.origin.CGFloat y = v27;
  v77.size.CGFloat width = v28;
  v77.size.CGFloat height = v29;
  v76.origin.CGFloat x = v19;
  v76.origin.CGFloat y = v21;
  v76.size.CGFloat width = v23;
  v76.size.CGFloat height = v25;
  if (!CGRectEqualToRect(v76, v77)
    || (id v30 = objc_loadWeakRetained((id *)&self->mController),
        unsigned __int8 v31 = [v30 currentlyScrolling],
        v30,
        (v31 & 1) == 0))
  {
    [v74 setBounds:v19, v21, v23, v25];
    double v32 = sub_100064070();
    [(CRLCanvasLayer *)self setPosition:sub_100065738(v32, v33, v34, v35)];
    double v36 = [(CRLCanvasLayer *)self canvasView];
    double v37 = [v36 enclosingScrollView];

    double v38 = [(CRLCanvasLayer *)self controller];
    unsigned int v39 = [v38 i_shouldAttemptToPreserveContentOffsetAfterFixFrame];

    if (v39)
    {
      double v40 = [(CRLCanvasLayer *)self controller];
      double v41 = [v40 canvas];
      unsigned int v42 = [v41 isAnchoredAtRight];

      double v43 = [(CRLCanvasLayer *)self controller];
      double v44 = v43;
      if (v42)
      {
        [v43 contentOffset];
        double v7 = v45;

        [v37 scrollableAreaBounds];
        double v47 = v46;
        double v49 = v48;
        [v37 adjustedContentInset];
        double v52 = v47 - (v50 + v51);
        double v55 = v49 - (v53 + v54);
        [(CRLCanvasLayer *)self viewScale];
        double v57 = sub_1000646A4(v52, v55, 1.0 / v56);
        [(CRLCanvasLayer *)self contentInset];
        double v59 = -v58;
        [(CRLCanvasLayer *)self viewScale];
        double v61 = v59 / v60 - v57;
      }
      else
      {
        unsigned __int8 v62 = [v43 shouldCanvasScrollingSizeGrowToFitBoardContent];

        if (v62)
        {
          double v61 = v5;
        }
        else
        {
          [v37 contentSize];
          double v64 = v63;
          [v37 scrollableAreaBounds];
          double v66 = v64 - v65;
          double v67 = [v37 contentView];
          [v74 convertPoint:v67 fromView:v66];
          double v69 = v68;

          [v37 adjustedContentInset];
          double v71 = v69 + v70;
          [(CRLCanvasLayer *)self viewScale];
          double v61 = v71 / v72;
        }
      }
      if (v5 > v61) {
        double v5 = v61;
      }
      double v73 = [(CRLCanvasLayer *)self controller];
      [v73 setContentOffset:@"CRLCanvasLayerFixFrameInteractionSource" source:0 scrollOptions:v5 v7];
    }
    if (v37)
    {
      [v37 setZoomScale:1.0];
      [v37 setContentSize:v23, v25];
    }
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->mContentInset = a3;
}

- (UIEdgeInsets)contentInset
{
  double top = self->mContentInset.top;
  double left = self->mContentInset.left;
  double bottom = self->mContentInset.bottom;
  double right = self->mContentInset.right;
  if ([(CRLCanvasLayer *)self shouldExtendBeyondSafeArea])
  {
    double v7 = [(CRLCanvasLayer *)self canvasView];
    double v8 = [v7 enclosingScrollView];

    [v8 adjustedContentInset];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [v8 safeAreaInsets];
    double top = top - fmax(v17 - v10, 0.0);
    double left = left - fmax(v18 - v12, 0.0);
    double bottom = bottom - fmax(v19 - v14, 0.0);
    double right = right - fmax(v20 - v16, 0.0);
  }
  double v21 = top;
  double v22 = left;
  double v23 = bottom;
  double v24 = right;
  result.double right = v24;
  result.double bottom = v23;
  result.double left = v22;
  result.double top = v21;
  return result;
}

- (void)p_scrollViewSafeAreaInsetsDidChange:(id)a3
{
  id v7 = [a3 object];
  double v4 = [(CRLCanvasLayer *)self canvasView];
  id v5 = [v4 enclosingScrollView];
  if (v7 == v5)
  {
    unsigned int v6 = [(CRLCanvasLayer *)self shouldExtendBeyondSafeArea];

    if (v6)
    {
      [(CRLCanvasLayer *)self fixFrameAndScrollView];
    }
  }
  else
  {
  }
}

- (void)p_scrollViewContentInsetDidChange:(id)a3
{
  id v8 = [a3 object];
  double v4 = [(CRLCanvasLayer *)self canvasView];
  id v5 = [v4 enclosingScrollView];
  if (v8 == v5 && [(CRLCanvasLayer *)self shouldExtendBeyondSafeArea])
  {
    unsigned int v6 = [(CRLCanvasLayer *)self controller];
    unsigned __int8 v7 = [v6 animatingViewScale];

    if ((v7 & 1) == 0)
    {
      [(CRLCanvasLayer *)self fixFrameAndScrollView];
    }
  }
  else
  {
  }
}

- (void)updateCanvasEdgeLayersIfNecessary
{
  p_mAssociatedBackgroundLayer = &self->mAssociatedBackgroundLayer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mAssociatedBackgroundLayer);
  unsigned int v5 = [WeakRetained scalesWithCanvas];

  mLeftEdgeLayer = self->mLeftEdgeLayer;
  if (v5)
  {
    if (mLeftEdgeLayer)
    {
      [(CALayer *)mLeftEdgeLayer removeFromSuperlayer];
      unsigned __int8 v7 = self->mLeftEdgeLayer;
      self->mLeftEdgeLayer = 0;
    }
    mRightEdgeLayer = self->mRightEdgeLayer;
    if (mRightEdgeLayer)
    {
      [(CALayer *)mRightEdgeLayer removeFromSuperlayer];
      double v9 = self->mRightEdgeLayer;
      self->mRightEdgeLayer = 0;
    }
    mTopEdgeLayer = self->mTopEdgeLayer;
    if (mTopEdgeLayer)
    {
      [(CALayer *)mTopEdgeLayer removeFromSuperlayer];
      double v11 = self->mTopEdgeLayer;
      self->mTopEdgeLayer = 0;
    }
    mBottomEdgeLayer = self->mBottomEdgeLayer;
    if (mBottomEdgeLayer)
    {
      [(CALayer *)mBottomEdgeLayer removeFromSuperlayer];
      double v13 = self->mBottomEdgeLayer;
      self->mBottomEdgeLayer = 0;
    }
    double y = CGPointZero.y;
    id v15 = objc_loadWeakRetained((id *)p_mAssociatedBackgroundLayer);
    [v15 setAnchorPoint:CGPointZero.x, y];

    [(CRLCanvasLayer *)self bounds];
    double v20 = sub_100065858(v16, v17, v18, v19);
    double v22 = v21;
    id v23 = objc_loadWeakRetained((id *)p_mAssociatedBackgroundLayer);
    [v23 setPosition:v20, v22];

    [(CRLCanvasLayer *)self bounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    id v60 = objc_loadWeakRetained((id *)p_mAssociatedBackgroundLayer);
    [v60 setBounds:v25, v27, v29, v31];
  }
  else
  {
    if (!mLeftEdgeLayer)
    {
      double v32 = objc_alloc_init(CRLNoDefaultImplicitActionLayer);
      CGFloat v33 = self->mLeftEdgeLayer;
      self->mLeftEdgeLayer = &v32->super;

      [(CRLCanvasLayer *)self addSublayer:self->mLeftEdgeLayer];
    }
    if (!self->mRightEdgeLayer)
    {
      CGFloat v34 = objc_alloc_init(CRLNoDefaultImplicitActionLayer);
      CGFloat v35 = self->mRightEdgeLayer;
      self->mRightEdgeLayer = &v34->super;

      [(CRLCanvasLayer *)self addSublayer:self->mRightEdgeLayer];
    }
    if (!self->mTopEdgeLayer)
    {
      double v36 = objc_alloc_init(CRLNoDefaultImplicitActionLayer);
      double v37 = self->mTopEdgeLayer;
      self->mTopEdgeLayer = &v36->super;

      [(CRLCanvasLayer *)self addSublayer:self->mTopEdgeLayer];
    }
    if (!self->mBottomEdgeLayer)
    {
      double v38 = objc_alloc_init(CRLNoDefaultImplicitActionLayer);
      unsigned int v39 = self->mBottomEdgeLayer;
      self->mBottomEdgeLayer = &v38->super;

      [(CRLCanvasLayer *)self addSublayer:self->mBottomEdgeLayer];
    }
    [(CRLCanvasLayer *)self bounds];
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    id v48 = objc_loadWeakRetained((id *)&self->mController);
    id v49 = [v48 canvasEdgeBackgroundColor];

    [(CALayer *)self->mLeftEdgeLayer setBackgroundColor:v49];
    v62.origin.CGFloat x = v41;
    v62.origin.double y = v43;
    v62.size.CGFloat width = v45;
    v62.size.CGFloat height = v47;
    CGFloat v50 = CGRectGetMinX(v62) + -5000.0;
    v63.origin.CGFloat x = v41;
    v63.origin.double y = v43;
    v63.size.CGFloat width = v45;
    v63.size.CGFloat height = v47;
    CGFloat v51 = CGRectGetMinY(v63) + -5000.0;
    v64.origin.CGFloat x = v41;
    v64.origin.double y = v43;
    v64.size.CGFloat width = v45;
    v64.size.CGFloat height = v47;
    CGRectGetHeight(v64);
    -[CALayer setFrame:](self->mLeftEdgeLayer, "setFrame:", v50, v51);
    [(CALayer *)self->mRightEdgeLayer setBackgroundColor:v49];
    v65.origin.CGFloat x = v41;
    v65.origin.double y = v43;
    v65.size.CGFloat width = v45;
    v65.size.CGFloat height = v47;
    double MaxX = CGRectGetMaxX(v65);
    v66.origin.CGFloat x = v41;
    v66.origin.double y = v43;
    v66.size.CGFloat width = v45;
    v66.size.CGFloat height = v47;
    CGFloat v52 = CGRectGetMinY(v66) + -5000.0;
    v67.origin.CGFloat x = v41;
    v67.origin.double y = v43;
    v67.size.CGFloat width = v45;
    v67.size.CGFloat height = v47;
    -[CALayer setFrame:](self->mRightEdgeLayer, "setFrame:", MaxX, v52, 5000.0, CGRectGetHeight(v67) + 10000.0);
    [(CALayer *)self->mTopEdgeLayer setBackgroundColor:v49];
    v68.origin.CGFloat x = v41;
    v68.origin.double y = v43;
    v68.size.CGFloat width = v45;
    v68.size.CGFloat height = v47;
    CGFloat v53 = CGRectGetMinX(v68) + -5000.0;
    v69.origin.CGFloat x = v41;
    v69.origin.double y = v43;
    v69.size.CGFloat width = v45;
    v69.size.CGFloat height = v47;
    CGFloat v54 = CGRectGetMinY(v69) + -5000.0;
    v70.origin.CGFloat x = v41;
    v70.origin.double y = v43;
    v70.size.CGFloat width = v45;
    v70.size.CGFloat height = v47;
    -[CALayer setFrame:](self->mTopEdgeLayer, "setFrame:", v53, v54, CGRectGetWidth(v70) + 10000.0, 5000.0);
    [(CALayer *)self->mBottomEdgeLayer setBackgroundColor:v49];
    v71.origin.CGFloat x = v41;
    v71.origin.double y = v43;
    v71.size.CGFloat width = v45;
    v71.size.CGFloat height = v47;
    double v55 = CGRectGetMinX(v71) + -5000.0;
    v72.origin.CGFloat x = v41;
    v72.origin.double y = v43;
    v72.size.CGFloat width = v45;
    v72.size.CGFloat height = v47;
    double MaxY = CGRectGetMaxY(v72);
    v73.origin.CGFloat x = v41;
    v73.origin.double y = v43;
    v73.size.CGFloat width = v45;
    v73.size.CGFloat height = v47;
    double Width = CGRectGetWidth(v73);
    double v58 = self->mBottomEdgeLayer;
    -[CALayer setFrame:](v58, "setFrame:", v55, MaxY, Width + 10000.0, 5000.0);
  }
}

- (double)viewScale
{
  return self->mViewScale;
}

- (double)minimumPinchViewScale
{
  return self->mMinimumPinchViewScale;
}

- (double)maximumPinchViewScale
{
  return self->mMaximumPinchViewScale;
}

- (BOOL)allowsPinchZoom
{
  return self->mAllowsPinchZoom;
}

- (BOOL)showsScaleFeedback
{
  return self->mShowsScaleFeedback;
}

- (void)setShowsScaleFeedback:(BOOL)a3
{
  self->mShowsScaleFeedback = a3;
}

- (BOOL)isInfinite
{
  return self->mIsInfinite;
}

- (void)setInfinite:(BOOL)a3
{
  self->mIsInfinite = a3;
}

- (CRLInteractiveCanvasController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (CGSize)unscaledSize
{
  double width = self->mUnscaledSize.width;
  double height = self->mUnscaledSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)shouldExtendBeyondSafeArea
{
  return self->mShouldExtendBeyondSafeArea;
}

- (void)setShouldExtendBeyondSafeArea:(BOOL)a3
{
  self->mShouldExtendBeyondSafeAreCATransform3D a = a3;
}

- (BOOL)isLayoutDisabled
{
  return self->mDisableLayout;
}

- (void)setDisableLayout:(BOOL)a3
{
  self->BOOL mDisableLayout = a3;
}

- (BOOL)horizontallyCenteredInScrollView
{
  return self->mHorizontallyCenteredInScrollView;
}

- (BOOL)verticallyCenteredInScrollView
{
  return self->mVerticallyCenteredInScrollView;
}

- (_TtC8Freeform24CRLCanvasBackgroundLayer)associatedBackgroundLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mAssociatedBackgroundLayer);

  return (_TtC8Freeform24CRLCanvasBackgroundLayer *)WeakRetained;
}

- (void)setAssociatedBackgroundLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mAssociatedBackgroundLayer);
  objc_storeStrong((id *)&self->mAnimateToViewScaleActiveDisplayLink, 0);
  objc_storeStrong((id *)&self->mRightEdgeLayer, 0);
  objc_storeStrong((id *)&self->mLeftEdgeLayer, 0);
  objc_storeStrong((id *)&self->mBottomEdgeLayer, 0);
  objc_storeStrong((id *)&self->mTopEdgeLayer, 0);
  objc_storeStrong((id *)&self->mCanvasBackgroundLayer, 0);

  objc_destroyWeak((id *)&self->mController);
}

@end