@interface TSDCanvasLayer
- (BOOL)allowsPinchZoom;
- (BOOL)avoidKeyboardWhenVerticallyCenteredInScrollView;
- (BOOL)centeredInScrollView;
- (BOOL)createdAsCopy;
- (BOOL)horizontallyCenteredInScrollView;
- (BOOL)isInfinite;
- (BOOL)isLayoutDisabled;
- (BOOL)showsScaleFeedback;
- (BOOL)torndown;
- (BOOL)verticallyCenteredInScrollView;
- (CGPoint)contentOffsetForUnscaledContentCenter:(CGPoint)a3;
- (CGPoint)p_contentOffsetForUnscaledContentCenter:(CGPoint)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5;
- (CGPoint)unscaledContentCenter;
- (CGRect)p_boundsRect;
- (CGRect)p_fixedBoundsForScrollViewSize:(CGSize)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5;
- (CGSize)unscaledSize;
- (TSDCanvasLayer)init;
- (TSDCanvasLayer)initWithCoder:(id)a3;
- (TSDCanvasLayer)initWithLayer:(id)a3;
- (TSDCanvasView)canvasView;
- (TSDInteractiveCanvasController)controller;
- (UIEdgeInsets)contentInset;
- (double)maximumPinchViewScale;
- (double)minimumPinchViewScale;
- (double)viewScale;
- (void)_adjustContentInsetsForKeyboard;
- (void)adjustContentInsets;
- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 duration:(double)a6 animation:(id)a7 completionBlock:(id)a8;
- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 duration:(double)a6 completionBlock:(id)a7;
- (void)dealloc;
- (void)fixFrameAndScrollView;
- (void)keyboardWillChangeFrame:(id)a3;
- (void)layoutIfNeededIgnoringDisabledLayout;
- (void)layoutSublayers;
- (void)p_commonInit;
- (void)p_fixFrameAndScrollView;
- (void)p_reenableDrawingAfterResumingFromBackground;
- (void)p_setEnclosingScrollViewZoomParameters;
- (void)p_setViewScale:(double)a3;
- (void)p_setViewScale:(double)a3 preservingScrollOffset:(BOOL)a4;
- (void)popLayoutDisabled;
- (void)pushLayoutDisabled;
- (void)setAllowsPinchZoom:(BOOL)a3;
- (void)setAvoidKeyboardWhenVerticallyCenteredInScrollView:(BOOL)a3;
- (void)setCenteredInScrollView:(BOOL)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setController:(id)a3;
- (void)setCreatedAsCopy:(BOOL)a3;
- (void)setHorizontallyCenteredInScrollView:(BOOL)a3;
- (void)setInfinite:(BOOL)a3;
- (void)setMaximumPinchViewScale:(double)a3;
- (void)setMinimumPinchViewScale:(double)a3;
- (void)setNeedsLayout;
- (void)setNeedsLayoutForTilingLayers;
- (void)setScrollViewFrameMaintainingApparentScrollPosition:(CGRect)a3;
- (void)setScrollViewFrameMaintainingApparentScrollPosition:(CGRect)a3 animated:(BOOL)a4;
- (void)setShowsScaleFeedback:(BOOL)a3;
- (void)setTorndown:(BOOL)a3;
- (void)setUnscaledSize:(CGSize)a3;
- (void)setUnscaledSizeOnLayer:(CGSize)a3;
- (void)setVerticallyCenteredInScrollView:(BOOL)a3;
- (void)setViewScale:(double)a3;
- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 maintainPosition:(BOOL)a5 animated:(BOOL)a6;
- (void)teardown;
- (void)teardownWithoutClearingLayerDelegates;
@end

@implementation TSDCanvasLayer

- (void)p_commonInit
{
  self->mViewScale = 1.0;
  self->mMaximumPinchViewScale = 4.0;
  self->mMinimumPinchViewScale = 0.25;
  self->mAllowsPinchZoom = 0;
  self->mHorizontallyCenteredInScrollView = 0;
  self->mVerticallyCenteredInScrollView = 0;
  self->mAvoidKeyboardWhenVerticallyCenteredInScrollView = 0;
  self->mContentInset = *(UIEdgeInsets *)TSDEdgeInsetsZero;
  p_mUnscaledSize = &self->mUnscaledSize;
  [(TSDCanvasLayer *)self bounds];
  p_mUnscaledSize->width = v4;
  p_mUnscaledSize->height = v5;
  self->mShowsScaleFeedback = 1;
  [(TSDCanvasLayer *)self setAllowsEdgeAntialiasing:1];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_scrollViewScrollerStyleDidChange_, @"TSKScrollViewScrollerStyleDidChange", 0);
  id v6 = +[TSKKeyboardMonitor sharedKeyboardMonitor];

  [v6 addKeyboardObserver:self];
}

- (TSDCanvasLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasLayer;
  v2 = [(TSDCanvasLayer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TSDCanvasLayer *)v2 p_commonInit];
  }
  return v3;
}

- (TSDCanvasLayer)initWithLayer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDCanvasLayer;
  v3 = [(TSDCanvasLayer *)&v6 initWithLayer:a3];
  CGFloat v4 = v3;
  if (v3)
  {
    [(TSDCanvasLayer *)v3 p_commonInit];
    [(TSDCanvasLayer *)v4 setCreatedAsCopy:1];
  }
  return v4;
}

- (TSDCanvasLayer)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDCanvasLayer;
  v3 = [(TSDCanvasLayer *)&v6 initWithCoder:a3];
  CGFloat v4 = v3;
  if (v3) {
    [(TSDCanvasLayer *)v3 p_commonInit];
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "removeKeyboardObserver:", self);
  if (![(TSDCanvasLayer *)self torndown]) {
    [(TSDCanvasLayer *)self teardown];
  }
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasLayer;
  [(TSDCanvasLayer *)&v3 dealloc];
}

- (void)setController:(id)a3
{
  mController = self->mController;
  if (a3 && mController)
  {
    objc_super v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDCanvasLayer setController:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasLayer.m"), 220, @"shouldn't try to set canvasLayer's controller more than once");
    mController = self->mController;
  }
  if (!a3 || !mController)
  {
    self->mController = (TSDInteractiveCanvasController *)a3;
    objc_msgSend((id)objc_msgSend(a3, "canvas"), "setUnscaledSize:", self->mUnscaledSize.width, self->mUnscaledSize.height);
    double mViewScale = self->mViewScale;
    v9 = [(TSDInteractiveCanvasController *)self->mController canvas];
    [(TSDCanvas *)v9 setViewScale:mViewScale];
  }
}

- (void)teardown
{
  [(TSDCanvasLayer *)self setTorndown:1];
  self->mController = 0;
  [(CALayer *)self p_clearAllLayerDelegates];
  self->double mViewScale = 1.0;
  objc_super v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v3 removeObserver:self];
}

- (void)teardownWithoutClearingLayerDelegates
{
  self->mController = 0;
  [(TSDCanvasLayer *)self setDelegate:0];
}

- (void)setUnscaledSize:(CGSize)a3
{
  if (a3.width > 0.0
    && a3.height > 0.0
    && (a3.width != self->mUnscaledSize.width || a3.height != self->mUnscaledSize.height))
  {
    self->mUnscaledSize = a3;
    -[TSDCanvas setUnscaledSize:]([(TSDInteractiveCanvasController *)self->mController canvas], "setUnscaledSize:", a3.width, a3.height);
    [(TSDCanvasLayer *)self fixFrameAndScrollView];
    mController = self->mController;
    [(TSDInteractiveCanvasController *)mController layoutInvalidated];
  }
}

- (BOOL)centeredInScrollView
{
  BOOL v3 = [(TSDCanvasLayer *)self horizontallyCenteredInScrollView];
  if (v3)
  {
    LOBYTE(v3) = [(TSDCanvasLayer *)self verticallyCenteredInScrollView];
  }
  return v3;
}

- (void)setUnscaledSizeOnLayer:(CGSize)a3
{
  if (a3.width > 0.0
    && a3.height > 0.0
    && (a3.width != self->mUnscaledSize.width || a3.height != self->mUnscaledSize.height))
  {
    self->mUnscaledSize = a3;
    -[TSDCanvas setUnscaledSize:]([(TSDInteractiveCanvasController *)self->mController canvas], "setUnscaledSize:", a3.width, a3.height);
    [(TSDCanvasLayer *)self p_boundsRect];
    -[TSDCanvasLayer setBounds:](self, "setBounds:");
    double v5 = TSDRectWithSize();
    double v9 = TSDCenterOfRect(v5, v6, v7, v8);
    [(TSDCanvasLayer *)self setPosition:v9];
  }
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
      [(TSDCanvasLayer *)self fixFrameAndScrollView];
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
  if (self->mHorizontallyCenteredInScrollView != a3)
  {
    self->mHorizontallyCenteredInScrollView = a3;
    [(TSDCanvasLayer *)self fixFrameAndScrollView];
  }
}

- (void)setVerticallyCenteredInScrollView:(BOOL)a3
{
  if (self->mVerticallyCenteredInScrollView != a3)
  {
    self->mVerticallyCenteredInScrollView = a3;
    [(TSDCanvasLayer *)self fixFrameAndScrollView];
  }
}

- (void)setAvoidKeyboardWhenVerticallyCenteredInScrollView:(BOOL)a3
{
  if (self->mAvoidKeyboardWhenVerticallyCenteredInScrollView != a3)
  {
    self->mAvoidKeyboardWhenVerticallyCenteredInScrollView = a3;
    [(TSDCanvasLayer *)self fixFrameAndScrollView];
  }
}

- (void)fixFrameAndScrollView
{
  BOOL v2 = self->mUnscaledSize.width == *MEMORY[0x263F001B0]
    && self->mUnscaledSize.height == *(double *)(MEMORY[0x263F001B0] + 8);
  if (!v2 && !self->mViewScaleAnimationCount)
  {
    if (self->mController) {
      [(TSDCanvasLayer *)self p_fixFrameAndScrollView];
    }
  }
}

- (void)setNeedsLayout
{
  if (!-[TSDInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](self->mController, "currentlyWaitingOnThreadedLayoutAndRender")|| ([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    char v3 = [(TSDCanvasLayer *)self needsLayout];
    v4.receiver = self;
    v4.super_class = (Class)TSDCanvasLayer;
    [(TSDCanvasLayer *)&v4 setNeedsLayout];
    if ((v3 & 1) == 0) {
      [(TSDCanvasLayer *)self setNeedsLayoutForTilingLayers];
    }
  }
}

- (void)setNeedsLayoutForTilingLayers
{
  id v3 = [(TSDInteractiveCanvasController *)self->mController i_topLevelLayersForTiling];

  [v3 makeObjectsPerformSelector:a2];
}

- (void)layoutIfNeededIgnoringDisabledLayout
{
  unint64_t mLayoutDisabledDepth = self->mLayoutDisabledDepth;
  self->unint64_t mLayoutDisabledDepth = 0;
  [(TSDCanvasLayer *)self layoutIfNeeded];
  self->unint64_t mLayoutDisabledDepth = mLayoutDisabledDepth;
}

- (void)layoutSublayers
{
  if (objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "isActivating"))
  {
    [(TSDInteractiveCanvasController *)self->mController setShouldSuppressRendering:1];
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_p_reenableDrawingAfterResumingFromBackground object:0];
    [(TSDCanvasLayer *)self performSelector:sel_p_reenableDrawingAfterResumingFromBackground withObject:0 afterDelay:0.0];
  }
  else if (![(TSDCanvasLayer *)self isLayoutDisabled])
  {
    mController = self->mController;
    [(TSDInteractiveCanvasController *)mController i_layout];
  }
}

- (void)p_reenableDrawingAfterResumingFromBackground
{
  if (objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "isActivating"))
  {
    [(TSDCanvasLayer *)self performSelector:sel_p_reenableDrawingAfterResumingFromBackground withObject:0 afterDelay:0.0];
  }
  else
  {
    [(TSDInteractiveCanvasController *)self->mController setShouldSuppressRendering:0];
    [(TSDCanvasLayer *)self setNeedsLayout];
  }
}

- (CGRect)p_boundsRect
{
  TSDMultiplySizeScalar(self->mUnscaledSize.width, self->mUnscaledSize.height, self->mViewScale);
  double v3 = TSDRectWithSize();
  double top = self->mContentInset.top;
  double left = self->mContentInset.left;
  double v6 = v3 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->mContentInset.right);
  double v12 = v11 - (top + self->mContentInset.bottom);

  double v13 = TSDRoundedRectForMainScreen(v6, v8, v10, v12);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (TSDCanvasView)canvasView
{
  BOOL v2 = [(TSDInteractiveCanvasController *)self->mController layerHost];

  return (TSDCanvasView *)[(TSDCanvasLayerHosting *)v2 canvasView];
}

- (BOOL)isLayoutDisabled
{
  return self->mLayoutDisabledDepth != 0;
}

- (void)pushLayoutDisabled
{
}

- (void)popLayoutDisabled
{
  unint64_t mLayoutDisabledDepth = self->mLayoutDisabledDepth;
  if (mLayoutDisabledDepth
    || (objc_super v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSDCanvasLayer popLayoutDisabled]"],
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasLayer.m"), 441, @"layout is not disabled"), (unint64_t mLayoutDisabledDepth = self->mLayoutDisabledDepth) != 0))
  {
    self->unint64_t mLayoutDisabledDepth = mLayoutDisabledDepth - 1;
    if ([(TSDInteractiveCanvasController *)self->mController i_needsLayout])
    {
      [(TSDCanvasLayer *)self setNeedsLayout];
    }
  }
}

- (void)setViewScale:(double)a3
{
}

- (void)setAllowsPinchZoom:(BOOL)a3
{
  if (self->mAllowsPinchZoom != a3)
  {
    self->mAllowsPinchZoom = a3;
    objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->mController, "layerHost"), "asiOSCVC"), "i_updateZoomGestureRecognizer");
    [(TSDCanvasLayer *)self p_setEnclosingScrollViewZoomParameters];
  }
}

- (void)setMinimumPinchViewScale:(double)a3
{
  if (self->mMinimumPinchViewScale != a3)
  {
    self->mMinimumPinchViewScale = a3;
    [(TSDCanvasLayer *)self p_setEnclosingScrollViewZoomParameters];
  }
}

- (void)setMaximumPinchViewScale:(double)a3
{
  if (self->mMaximumPinchViewScale != a3)
  {
    self->mMaximumPinchViewScale = a3;
    [(TSDCanvasLayer *)self p_setEnclosingScrollViewZoomParameters];
  }
}

- (CGPoint)unscaledContentCenter
{
  double v3 = [(TSDCanvasView *)[(TSDCanvasLayer *)self canvasView] enclosingScrollView];
  if (v3)
  {
    objc_super v4 = v3;
    uint64_t v5 = [(TSDCanvasLayer *)self canvasView];
    [(TSKScrollView *)v4 bounds];
    [(TSDCanvasView *)v5 convertPoint:v4 fromView:TSDCenterOfRect(v6, v7, v8, v9)];
    double v12 = TSDMultiplyPointScalar(v10, v11, 1.0 / self->mViewScale);
  }
  else
  {
    double v12 = *MEMORY[0x263F00148];
    double v13 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)contentOffsetForUnscaledContentCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double mViewScale = self->mViewScale;
  [(TSDCanvasLayer *)self contentInset];

  -[TSDCanvasLayer p_contentOffsetForUnscaledContentCenter:viewScale:contentInset:](self, "p_contentOffsetForUnscaledContentCenter:viewScale:contentInset:", x, y, mViewScale, v7, v8, v9, v10);
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)p_contentOffsetForUnscaledContentCenter:(CGPoint)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  CGFloat y = a3.y;
  double x = a3.x;
  double v13 = [(TSDCanvasView *)[(TSDCanvasLayer *)self canvasView] enclosingScrollView];
  if (v13)
  {
    [(TSKScrollView *)v13 bounds];
    double v15 = v14;
    double v29 = y;
    double v17 = v16;
    double v30 = TSDMultiplySizeScalar(self->mUnscaledSize.width, self->mUnscaledSize.height, a4);
    double v31 = v18;
    -[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedBoundsForScrollViewSize:viewScale:contentInset:", v15, v17, a4, top, left, bottom, right);
    double v20 = v19;
    double v21 = TSDMultiplyPointScalar(x, v29, a4);
    TSDAddPoints(v21, v22, v20);
    double v23 = 0.0;
    double v24 = 0.0;
    if (v30 > v15)
    {
      TSUClamp();
      double v24 = v25;
    }
    if (v31 > v17)
    {
      TSUClamp();
      double v23 = v26;
    }
  }
  else
  {
    double v24 = *MEMORY[0x263F00148];
    double v23 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  double v27 = v24;
  double v28 = v23;
  result.CGFloat y = v28;
  result.double x = v27;
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
  double v14 = [(TSDCanvasView *)[(TSDCanvasLayer *)self canvasView] enclosingScrollView];
  double v15 = v14;
  if (v6)
  {
    if (v14)
    {
      [(TSKScrollView *)v14 frame];
      v34.origin.double x = x;
      v34.origin.double y = y;
      v34.size.double width = width;
      v34.size.double height = height;
      if (!CGRectEqualToRect(v32, v34)) {
        -[TSKScrollView setFrame:](v15, "setFrame:", x, y, width, height);
      }
    }
    if (v7)
    {
      [(TSDCanvasLayer *)self unscaledContentCenter];
      double v17 = v16;
      double v19 = v18;
    }
    else
    {
      double v17 = *MEMORY[0x263F00148];
      double v19 = *(double *)(MEMORY[0x263F00148] + 8);
    }
    [(TSDCanvasLayer *)self contentInset];
    -[TSDCanvasLayer animateToViewScale:contentCenter:contentInset:duration:completionBlock:](self, "animateToViewScale:contentCenter:contentInset:duration:completionBlock:", 0, a3, v17, v19, v21, v22, v23, v24, 0.2);
  }
  else
  {
    if (v14
      && ([(TSKScrollView *)v14 frame],
          v35.origin.double x = x,
          v35.origin.double y = y,
          v35.size.double width = width,
          v35.size.double height = height,
          !CGRectEqualToRect(v33, v35)))
    {
      -[TSKScrollView setFrame:](v15, "setFrame:", x, y, width, height);
      int v20 = 1;
    }
    else
    {
      int v20 = 0;
    }
    [(TSDCanvasLayer *)self unscaledContentCenter];
    double v26 = v25;
    double v28 = v27;
    double mViewScale = self->mViewScale;
    if (mViewScale != a3) {
      [(TSDCanvasLayer *)self p_setViewScale:a3];
    }
    [(TSDCanvasLayer *)self fixFrameAndScrollView];
    if (v7)
    {
      -[TSDCanvasLayer contentOffsetForUnscaledContentCenter:](self, "contentOffsetForUnscaledContentCenter:", v26, v28);
      -[TSKScrollView setContentOffset:animated:](v15, "setContentOffset:animated:", 0);
    }
    if (mViewScale != a3) {
      [(TSDInteractiveCanvasController *)self->mController i_viewScaleDidChange];
    }
    if (v20)
    {
      mController = self->mController;
      [(TSDInteractiveCanvasController *)mController i_viewScrollDidChange];
    }
  }
}

- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 duration:(double)a6 completionBlock:(id)a7
{
}

- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 duration:(double)a6 animation:(id)a7 completionBlock:(id)a8
{
  double bottom = a5.bottom;
  double right = a5.right;
  double left = a5.left;
  double top = a5.top;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double v17 = [(TSDCanvasView *)[(TSDCanvasLayer *)self canvasView] enclosingScrollView];
  if (a3 <= 0.0
    || (double v19 = v17, self->mViewScale == a3)
    && ([(TSDCanvasLayer *)self contentInset], left == v52)
    && top == v18.n128_f64[0]
    && right == v51
    && (v18.n128_f64[0] = bottom, bottom == v50)
    && !self->mViewScaleAnimationCount)
  {
    if (a8)
    {
      BOOL v53 = self->mViewScaleAnimationCount == 0;
      v54 = (void (*)(id, BOOL, __n128))*((void *)a8 + 2);
      v54(a8, v53, v18);
    }
  }
  else
  {
    if (v19)
    {
      [(TSKScrollView *)v19 contentOffset];
      -[TSKScrollView setContentOffset:animated:](v19, "setContentOffset:animated:", 0);
    }
    double v76 = top;
    double v77 = left;
    unint64_t mViewScaleAnimationCount = self->mViewScaleAnimationCount;
    if (!mViewScaleAnimationCount)
    {
      [(TSDInteractiveCanvasController *)self->mController i_viewWillBeginZooming];
      unint64_t mViewScaleAnimationCount = self->mViewScaleAnimationCount;
    }
    self->unint64_t mViewScaleAnimationCount = mViewScaleAnimationCount + 1;
    [(TSDInteractiveCanvasController *)self->mController i_viewDidZoomToViewScale:a3];
    [(TSDCanvasLayer *)self pushLayoutDisabled];
    long long v68 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v69 = *MEMORY[0x263F000D0];
    *(_OWORD *)&v103.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v103.c = v68;
    long long v67 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&v103.tCGFloat x = v67;
    [(TSDCanvasLayer *)self bounds];
    double v23 = v22;
    double v24 = a3;
    double v26 = *MEMORY[0x263F00148];
    double v25 = *(double *)(MEMORY[0x263F00148] + 8);
    double v74 = y;
    double v75 = x;
    double v72 = right;
    double v73 = v24;
    CGFloat v70 = v28;
    CGFloat v71 = v27;
    if (v19)
    {
      double v29 = right;
      double v30 = v24;
      CGFloat v31 = v21;
      [(TSKScrollView *)v19 contentOffset];
      double v33 = v32;
      double v34 = TSDSubtractPoints(v26, v25, v23);
      double v36 = TSDSubtractPoints(v34, v35, v33);
      double v65 = v37;
      double v66 = v36;
      [(TSKScrollView *)v19 frame];
      CGFloat v38 = v23;
      -[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedBoundsForScrollViewSize:viewScale:contentInset:", v39, v40, v30, v76, v77, bottom, v29);
      double v64 = v41;
      -[TSDCanvasLayer p_contentOffsetForUnscaledContentCenter:viewScale:contentInset:](self, "p_contentOffsetForUnscaledContentCenter:viewScale:contentInset:", v75, v74, v30, v76, v77, bottom, v29);
      double v43 = v42;
      double v44 = TSDSubtractPoints(v26, v25, v64);
      double v46 = TSDSubtractPoints(v44, v45, v43);
      double v47 = v65;
      double v48 = v66;
      double v26 = v46;
      double v25 = v49;
    }
    else
    {
      double v47 = *(double *)(MEMORY[0x263F00148] + 8);
      double v48 = *MEMORY[0x263F00148];
      CGFloat v38 = v23;
      CGFloat v31 = v21;
    }
    *(_OWORD *)&v102.a = v69;
    *(_OWORD *)&v102.c = v68;
    *(_OWORD *)&v102.tCGFloat x = v67;
    CGAffineTransformTranslate(&v103, &v102, v26 - v48, v25 - v47);
    double mViewScale = self->mViewScale;
    memset(&v102, 0, sizeof(v102));
    CGAffineTransformMakeScale(&v102, v73 / mViewScale, v73 / mViewScale);
    [(TSDCanvasLayer *)self anchorPoint];
    double v57 = v56;
    double v59 = v58;
    v105.origin.CGFloat x = v38;
    v105.origin.CGFloat y = v31;
    v105.size.double width = v71;
    v105.size.double height = v70;
    double MinX = CGRectGetMinX(v105);
    v106.origin.CGFloat x = v38;
    v106.origin.CGFloat y = v31;
    v106.size.double width = v71;
    v106.size.double height = v70;
    CGFloat v61 = MinX + v57 * CGRectGetWidth(v106);
    v107.origin.CGFloat x = v38;
    v107.origin.CGFloat y = v31;
    v107.size.double width = v71;
    v107.size.double height = v70;
    double MinY = CGRectGetMinY(v107);
    v108.origin.CGFloat x = v38;
    v108.origin.CGFloat y = v31;
    v108.size.double width = v71;
    v108.size.double height = v70;
    CGFloat Height = CGRectGetHeight(v108);
    CGAffineTransform t1 = v102;
    TSDTransformConvertForNewOrigin(&t1, &v101, v61, MinY + v59 * Height);
    CGAffineTransform v102 = v101;
    CGAffineTransform t1 = v101;
    CGAffineTransform t2 = v103;
    CGAffineTransformConcat(&v101, &t1, &t2);
    CGAffineTransform v103 = v101;
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v95 = __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke;
    v96 = &unk_2646B1FE8;
    v97 = self;
    CGAffineTransform v98 = v101;
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v83 = __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke_2;
    v84 = &unk_2646B2010;
    double v87 = v73;
    double v88 = v76;
    double v89 = v77;
    double v90 = bottom;
    double v91 = v72;
    double v92 = v75;
    double v93 = v74;
    v85 = self;
    id v86 = a8;
    [(TSDCanvasLayer *)self affineTransform];
    CGAffineTransform v101 = v103;
    if (CGAffineTransformEqualToTransform(&v81, &v101))
    {
      v95((uint64_t)v94);
      v83((uint64_t)v82);
    }
    else if (a7)
    {
      [(TSDInteractiveCanvasController *)self->mController beginAnimations:&stru_26D688A48 context:0];
      [(TSDInteractiveCanvasController *)self->mController setAnimationDuration:a6];
      [(TSDInteractiveCanvasController *)self->mController setAnimation:a7 forLayer:self forKey:@"transform"];
      [(TSDInteractiveCanvasController *)self->mController setAnimationCompletionBlock:v82];
      v95((uint64_t)v94);
      [(TSDInteractiveCanvasController *)self->mController commitAnimations];
    }
    else
    {
      v80[0] = MEMORY[0x263EF8330];
      v80[1] = 3221225472;
      v80[2] = __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke_3;
      v80[3] = &unk_2646B2038;
      v80[4] = v82;
      [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v94 options:v80 animations:a6 completion:0.0];
    }
  }
}

uint64_t __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  [v2 setAffineTransform:v5];
  return [*(id *)(a1 + 32) popLayoutDisabled];
}

uint64_t __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 96) - 1;
  *(void *)(v2 + 96) = v3;
  if (!v3)
  {
    objc_super v4 = *(void **)(a1 + 32);
    long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v8[0] = *MEMORY[0x263F000D0];
    v8[1] = v5;
    v8[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v4 setAffineTransform:v8];
    objc_msgSend(*(id *)(a1 + 32), "p_setViewScale:", *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setContentInset:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    [*(id *)(a1 + 32) fixFrameAndScrollView];
    BOOL v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "canvasView"), "enclosingScrollView");
    objc_msgSend(*(id *)(a1 + 32), "contentOffsetForUnscaledContentCenter:", *(double *)(a1 + 88), *(double *)(a1 + 96));
    objc_msgSend(v6, "setContentOffset:animated:", 0);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "i_viewScaleDidChange");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "i_viewScrollDidChange");
    [*(id *)(*(void *)(a1 + 32) + 32) viewDidEndZooming];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 96) == 0);
  }
  return result;
}

uint64_t __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setScrollViewFrameMaintainingApparentScrollPosition:(CGRect)a3
{
}

- (void)setScrollViewFrameMaintainingApparentScrollPosition:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(TSDCanvasView *)[(TSDCanvasLayer *)self canvasView] enclosingScrollView];
  if (v10)
  {
    double v11 = v10;
    [(TSKScrollView *)v10 frame];
    v24.origin.double x = x;
    v24.origin.double y = y;
    v24.size.double width = width;
    v24.size.double height = height;
    if (!CGRectEqualToRect(v23, v24))
    {
      double v12 = [(TSDCanvasLayer *)self canvasView];
      [(TSKScrollView *)v11 bounds];
      [(TSDCanvasView *)v12 convertPoint:v11 fromView:TSDCenterOfRect(v13, v14, v15, v16)];
      double v19 = TSDMultiplyPointScalar(v17, v18, 1.0 / self->mViewScale);
      double v21 = v20;
      -[TSKScrollView setFrame:](v11, "setFrame:", x, y, width, height);
      [(TSDCanvasLayer *)self fixFrameAndScrollView];
      -[TSDCanvasLayer contentOffsetForUnscaledContentCenter:](self, "contentOffsetForUnscaledContentCenter:", v19, v21);
      -[TSKScrollView setContentOffset:animated:](v11, "setContentOffset:animated:", v4);
    }
  }
}

- (void)p_setViewScale:(double)a3
{
  [(TSDCanvasLayer *)self willChangeValueForKey:@"viewScale"];
  self->double mViewScale = a3;
  [(TSDCanvasLayer *)self didChangeValueForKey:@"viewScale"];
  double mViewScale = self->mViewScale;
  BOOL v6 = [(TSDInteractiveCanvasController *)self->mController canvas];

  [(TSDCanvas *)v6 setViewScale:mViewScale];
}

- (void)p_setViewScale:(double)a3 preservingScrollOffset:(BOOL)a4
{
  double mViewScale = self->mViewScale;
  if (a3 <= 0.0 || mViewScale == a3) {
    return;
  }
  if (!a4)
  {
    double v9 = 0;
    goto LABEL_11;
  }
  double v8 = [(TSDCanvasView *)[(TSDCanvasLayer *)self canvasView] enclosingScrollView];
  double v9 = v8;
  if (!v8)
  {
LABEL_11:
    char v10 = 1;
    goto LABEL_12;
  }
  [(TSKScrollView *)v8 contentOffset];
  [(TSKScrollView *)v9 contentSize];
  char v10 = 0;
LABEL_12:
  [(TSDCanvasLayer *)self p_setViewScale:a3];
  [(TSDCanvasLayer *)self p_setEnclosingScrollViewZoomParameters];
  [(TSDCanvasLayer *)self fixFrameAndScrollView];
  if ((v10 & 1) == 0)
  {
    [(TSKScrollView *)v9 contentSize];
    [(TSKScrollView *)v9 setContentOffset:0 animated:TSDRoundedPoint()];
  }
  mController = self->mController;

  [(TSDInteractiveCanvasController *)mController i_viewScaleDidChange];
}

- (void)p_setEnclosingScrollViewZoomParameters
{
  uint64_t v2 = [(TSDCanvasView *)[(TSDCanvasLayer *)self canvasView] enclosingScrollView];
  if (v2)
  {
    uint64_t v3 = v2;
    [(TSKScrollView *)v2 setMinimumZoomScale:1.0];
    [(TSKScrollView *)v3 setMaximumZoomScale:1.0];
    [(TSKScrollView *)v3 setZoomScale:1.0];
  }
}

- (CGRect)p_fixedBoundsForScrollViewSize:(CGSize)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5
{
  double top = a5.top;
  double height = a3.height;
  double width = a3.width;
  p_mUnscaledSize = &self->mUnscaledSize;
  if (self->mUnscaledSize.width == *MEMORY[0x263F001B0]
    && self->mUnscaledSize.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v35 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v36 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v37 = *MEMORY[0x263F001A8];
    double v38 = *(double *)(MEMORY[0x263F001A8] + 8);
  }
  else
  {
    double right = a5.right;
    double bottom = a5.bottom;
    double left = a5.left;
    -[TSDInteractiveCanvasController growUnscaledCanvasLayerSize:](self->mController, "growUnscaledCanvasLayerSize:");
    double v15 = v14;
    double v17 = v16;
    if (v14 < p_mUnscaledSize->width)
    {
      double v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v19 = [NSString stringWithUTF8String:"-[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:]"];
      [v18 handleFailureInFunction:v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasLayer.m"), 958, @"expected canvas layer not to shrink in -growUnscaledCanvasLayerSize:, ignoring width" file lineNumber description];
      double v15 = p_mUnscaledSize->width;
    }
    if (v17 < p_mUnscaledSize->height)
    {
      double v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v21 = [NSString stringWithUTF8String:"-[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:]"];
      [v20 handleFailureInFunction:v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasLayer.m"), 962, @"expected canvas layer not to shrink in -growUnscaledCanvasLayerSize:, ignoring height" file lineNumber description];
      double v17 = p_mUnscaledSize->height;
    }
    TSDMultiplySizeScalar(v15, v17, a4);
    double v22 = left + TSDRectWithSize();
    double v24 = top + v23;
    double v26 = v25 - (left + right);
    double v28 = v27 - (top + bottom);
    if ([(TSDCanvasView *)[(TSDCanvasLayer *)self canvasView] enclosingScrollView]
      && [(TSDInteractiveCanvasController *)self->mController shouldResizeCanvasToScrollView])
    {
      [(TSDCanvas *)[(TSDInteractiveCanvasController *)self->mController canvas] contentsScale];
      double v30 = v29;
      double v31 = TSDSubtractSizes(width, height, v26);
      double v33 = v32;
      if (v31 <= 0.0)
      {
        double width = v26;
      }
      else
      {
        double v34 = v31;
        if ([(TSDCanvasLayer *)self horizontallyCenteredInScrollView]) {
          double v22 = TSDFloorForScale(v22 + v34 * -0.5, v30);
        }
      }
      if (v33 > 0.0)
      {
        double v28 = height;
        if ([(TSDCanvasLayer *)self verticallyCenteredInScrollView]) {
          double v24 = TSDFloorForScale(v24 + v33 * -0.5, v30);
        }
      }
    }
    else
    {
      double width = v26;
    }
    [(TSDCanvas *)[(TSDInteractiveCanvasController *)self->mController canvas] contentsScale];
    double v37 = TSDRoundedRectForScale(v22, v24, width, v28, v39);
  }
  mController = self->mController;

  -[TSDInteractiveCanvasController canvasViewBoundsWithBounds:](mController, "canvasViewBoundsWithBounds:", v37, v38, v35, v36, a5.left, a5.bottom, a5.right);
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (void)adjustContentInsets
{
  if ([(TSDCanvasLayer *)self verticallyCenteredInScrollView])
  {
    uint64_t v3 = [(TSDCanvasView *)[(TSDCanvasLayer *)self canvasView] enclosingScrollView];
    if (v3)
    {
      BOOL v4 = v3;
      [(TSDInteractiveCanvasController *)self->mController sizeOfScrollViewEnclosingCanvas];
      double v6 = v5;
      double v8 = v7;
      double mViewScale = self->mViewScale;
      [(TSDCanvasLayer *)self contentInset];
      -[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedBoundsForScrollViewSize:viewScale:contentInset:", v6, v8, mViewScale, v10, v11, v12, v13);
      double v15 = v14;
      if ([(TSKScrollView *)v4 superview])
      {
        objc_msgSend((id)-[TSKScrollView superview](v4, "superview"), "frame");
        double v17 = v16;
        [(TSKScrollView *)v4 frame];
        if (v15 >= v17) {
          double v19 = v17;
        }
        else {
          double v19 = v15;
        }
        double v20 = (v18 - v19) * 0.5;
        if ([(TSDCanvasLayer *)self avoidKeyboardWhenVerticallyCenteredInScrollView])
        {
          objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "keyboardHeightInView:", v4);
          double v22 = v21;
          BOOL v26 = v20 < v21;
          double v23 = v20;
          if (v26)
          {
            [(TSKScrollView *)v4 frame];
            double v25 = v24 - (v15 + v22);
            BOOL v26 = v25 < 0.0;
            double v23 = v25 * 0.5;
            double v20 = v26 ? v22 : v22 + v23;
            if (v26) {
              double v23 = 0.0;
            }
          }
        }
        else
        {
          double v23 = v20;
        }
        -[TSKScrollView setContentInset:](v4, "setContentInset:", v23, 0.0, v20, 0.0);
      }
    }
  }
}

- (void)p_fixFrameAndScrollView
{
  [(TSDInteractiveCanvasController *)self->mController sizeOfScrollViewEnclosingCanvas];
  double v4 = v3;
  double v6 = v5;
  double mViewScale = self->mViewScale;
  [(TSDCanvasLayer *)self contentInset];
  -[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedBoundsForScrollViewSize:viewScale:contentInset:", v4, v6, mViewScale, v8, v9, v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [(TSDCanvasView *)[(TSDCanvasLayer *)self canvasView] enclosingScrollView];
  if (v20)
  {
    double v21 = v20;
    [(TSKScrollView *)v20 setZoomScale:1.0];
    -[TSKScrollView setContentSize:](v21, "setContentSize:", v17, v19);
    [(TSDCanvasLayer *)self adjustContentInsets];
  }
  double v22 = [(TSDCanvasLayer *)self canvasView];
  if (!v22) {
    double v22 = (TSDCanvasView *)self;
  }
  -[TSDCanvasView setBounds:](v22, "setBounds:", v13, v15, v17, v19);
  double v23 = TSDRectWithSize();
  double v27 = TSDCenterOfRect(v23, v24, v25, v26);

  [(TSDCanvasLayer *)self setPosition:v27];
}

- (void)_adjustContentInsetsForKeyboard
{
  if ([(TSDCanvasLayer *)self verticallyCenteredInScrollView]
    && [(TSDCanvasLayer *)self avoidKeyboardWhenVerticallyCenteredInScrollView])
  {
    [(TSDCanvasLayer *)self adjustContentInsets];
  }
}

- (void)keyboardWillChangeFrame:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  double v6 = __42__TSDCanvasLayer_keyboardWillChangeFrame___block_invoke;
  double v7 = &unk_2646AF7B8;
  double v8 = self;
  id v3 = +[TSKKeyboardMonitor sharedKeyboardMonitor];
  if ([v3 keyboardIsAnimating])
  {
    double v4 = (void *)MEMORY[0x263F1CB60];
    [v3 keyboardAnimationDuration];
    objc_msgSend(v4, "animateWithDuration:animations:", v5);
  }
  else
  {
    v6((uint64_t)v5);
  }
}

uint64_t __42__TSDCanvasLayer_keyboardWillChangeFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _adjustContentInsetsForKeyboard];
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

- (TSDInteractiveCanvasController)controller
{
  return self->mController;
}

- (CGSize)unscaledSize
{
  double width = self->mUnscaledSize.width;
  double height = self->mUnscaledSize.height;
  result.double height = height;
  result.double width = width;
  return result;
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

- (BOOL)horizontallyCenteredInScrollView
{
  return self->mHorizontallyCenteredInScrollView;
}

- (BOOL)verticallyCenteredInScrollView
{
  return self->mVerticallyCenteredInScrollView;
}

- (BOOL)avoidKeyboardWhenVerticallyCenteredInScrollView
{
  return self->mAvoidKeyboardWhenVerticallyCenteredInScrollView;
}

- (BOOL)torndown
{
  return self->_torndown;
}

- (void)setTorndown:(BOOL)a3
{
  self->_torndown = a3;
}

- (BOOL)createdAsCopy
{
  return self->_createdAsCopy;
}

- (void)setCreatedAsCopy:(BOOL)a3
{
  self->_createdAsCopdouble y = a3;
}

@end