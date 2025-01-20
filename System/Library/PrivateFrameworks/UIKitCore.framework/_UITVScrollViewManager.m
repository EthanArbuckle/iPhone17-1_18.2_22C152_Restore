@interface _UITVScrollViewManager
- (BOOL)ignoreScrollAnimationDidEnd;
- (BOOL)useCustomMaskForScrolling;
- (CASpringAnimation)scrollAnimation;
- (CGPoint)targetOffset;
- (UIScrollView)scrollView;
- (UIView)snapshotViewForWindow;
- (_UITVScrollViewManager)initWithScrollView:(id)a3 scrollStyle:(int64_t)a4;
- (_UITVScrollViewManagerDelegate)delegate;
- (id)_customScrollingMaskForScrollView:(id)a3 frame:(CGRect)a4;
- (int64_t)scrollStyle;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_removeScreenshotViewIfNeeded;
- (void)_scroll:(id)a3 toContentOffset:(CGPoint)a4;
- (void)_scrollAnimationDidEnd:(id)a3;
- (void)_tearDown:(id)a3;
- (void)dealloc;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setIgnoreScrollAnimationDidEnd:(BOOL)a3;
- (void)setScrollAnimation:(id)a3;
- (void)setScrollStyle:(int64_t)a3;
- (void)setScrollView:(id)a3;
- (void)setSnapshotViewForWindow:(id)a3;
- (void)setTargetOffset:(CGPoint)a3;
- (void)setUseCustomMaskForScrolling:(BOOL)a3;
@end

@implementation _UITVScrollViewManager

- (_UITVScrollViewManager)initWithScrollView:(id)a3 scrollStyle:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UITVScrollViewManager.m", 40, @"Invalid parameter not satisfying: %@", @"scrollView != nil" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)_UITVScrollViewManager;
  v8 = [(_UITVScrollViewManager *)&v16 init];
  v9 = v8;
  if (v8)
  {
    id v10 = objc_storeWeak((id *)&v8->_scrollView, v7);
    v9->_scrollStyle = a4;
    id v11 = v10;
    [v7 _addScrollViewScrollObserver:v9];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_scrollView);
    [v12 addObserver:v9 selector:sel__scrollAnimationDidEnd_ name:0x1ED184800 object:WeakRetained];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0x1ED184800 object:0];

  v4 = [(_UITVScrollViewManager *)self scrollView];
  unsigned int v5 = objc_msgSend(v4, sel_allowsWeakReference);

  v6 = 0;
  if (v5)
  {
    id v7 = [(_UITVScrollViewManager *)self scrollView];
    v6 = v7;
    if (v7)
    {
      [v7 _removeScrollViewScrollObserver:self];
      [(_UITVScrollViewManager *)self _tearDown:v6];
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)_UITVScrollViewManager;
  [(_UITVScrollViewManager *)&v8 dealloc];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateScrollViewManagerDidFinishScrolling = p_delegate & 1;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  objc_super v8 = [(_UITVScrollViewManager *)self scrollView];
  unsigned int v9 = objc_msgSend(v8, sel_allowsWeakReference);

  if (!v9)
  {
    id v10 = 0;
    goto LABEL_20;
  }
  id v10 = [(_UITVScrollViewManager *)self scrollView];
  if (!v10) {
    goto LABEL_20;
  }
  id v22 = v10;
  [v10 contentOffset];
  if (v12 != x || v11 != y)
  {
    -[_UITVScrollViewManager setTargetOffset:](self, "setTargetOffset:", x, y);
    [v22 contentOffset];
    double v15 = v14;
    [v22 frame];
    double v17 = v16;
    if ([(_UITVScrollViewManager *)self scrollStyle] != 1)
    {
      v21 = [(_UITVScrollViewManager *)self scrollAnimation];
      objc_msgSend(v22, "_animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 0, 1, v21, x, y);

      goto LABEL_19;
    }
    if ((uint64_t)vcvtpd_s64_f64(v15 / v17) >= 4 && v4)
    {
      -[_UITVScrollViewManager _scroll:toContentOffset:](self, "_scroll:toContentOffset:", v22, x, y);
      goto LABEL_19;
    }
    if (!v4)
    {
      objc_msgSend(v22, "setContentOffset:animated:", 0, x, y);
      goto LABEL_19;
    }
    v13 = +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:v22];
    v19 = [v13 scrollManager];
    [v19 cancelScrollingForScrollableContainer:v22];

    v20 = [(_UITVScrollViewManager *)self scrollAnimation];
    objc_msgSend(v22, "_animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 0, 1, v20, x, y);

    goto LABEL_7;
  }
  if (self->_delegateScrollViewManagerDidFinishScrolling)
  {
    v13 = [(_UITVScrollViewManager *)self delegate];
    [v13 _scrollViewManagerDidFinishScrolling:self];
LABEL_7:
  }
LABEL_19:
  id v10 = v22;
LABEL_20:
}

- (CASpringAnimation)scrollAnimation
{
  scrollAnimation = self->_scrollAnimation;
  if (!scrollAnimation)
  {
    BOOL v4 = (CASpringAnimation *)objc_alloc_init(MEMORY[0x1E4F39C90]);
    id v5 = self->_scrollAnimation;
    self->_scrollAnimation = v4;

    [(CASpringAnimation *)self->_scrollAnimation setMass:1.0];
    [(CASpringAnimation *)self->_scrollAnimation setStiffness:100.0];
    [(CASpringAnimation *)self->_scrollAnimation setDamping:20.0];
    [(CASpringAnimation *)self->_scrollAnimation setInitialVelocity:0.0];
    [(CASpringAnimation *)self->_scrollAnimation settlingDuration];
    -[CASpringAnimation setDuration:](self->_scrollAnimation, "setDuration:");
    scrollAnimation = self->_scrollAnimation;
  }
  return scrollAnimation;
}

- (void)_tearDown:(id)a3
{
  id v5 = a3;
  [(_UITVScrollViewManager *)self _removeScreenshotViewIfNeeded];
  if ([(_UITVScrollViewManager *)self useCustomMaskForScrolling])
  {
    BOOL v4 = [v5 layer];
    [v4 setMask:0];
  }
}

- (void)_scrollAnimationDidEnd:(id)a3
{
  if (![(_UITVScrollViewManager *)self ignoreScrollAnimationDidEnd])
  {
    BOOL v4 = [(_UITVScrollViewManager *)self scrollView];
    unsigned int v5 = objc_msgSend(v4, sel_allowsWeakReference);

    if (v5)
    {
      v6 = [(_UITVScrollViewManager *)self scrollView];
      if (v6)
      {
        objc_super v8 = v6;
        if (self->_delegateScrollViewManagerDidFinishScrolling)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained _scrollViewManagerDidFinishScrolling:self];
        }
        [(_UITVScrollViewManager *)self targetOffset];
        objc_msgSend(v8, "setContentOffset:");
        v6 = v8;
      }
    }
    else
    {
      v6 = 0;
    }
  }
}

- (void)_scroll:(id)a3 toContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v26 = a3;
  if ([(_UITVScrollViewManager *)self allowsWeakReference]) {
    id v7 = self;
  }
  else {
    id v7 = 0;
  }
  objc_super v8 = v7;
  unsigned int v9 = v8;
  if (v8)
  {
    [(_UITVScrollViewManager *)v8 _removeScreenshotViewIfNeeded];
    id v10 = [v26 snapshotViewAfterScreenUpdates:0];
    [(_UITVScrollViewManager *)v9 setSnapshotViewForWindow:v10];

    double v11 = [(_UITVScrollViewManager *)v9 snapshotViewForWindow];

    if (v11)
    {
      [v26 bounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = [(_UITVScrollViewManager *)v9 snapshotViewForWindow];
      objc_msgSend(v18, "setFrame:", 0.0, 0.0, v15, v17);

      v19 = [v26 window];
      v20 = [(_UITVScrollViewManager *)v9 snapshotViewForWindow];
      [v19 addSubview:v20];

      v21 = [v26 layer];
      id v22 = [v21 mask];
      [(_UITVScrollViewManager *)v9 setUseCustomMaskForScrolling:v22 == 0];

      if ([(_UITVScrollViewManager *)v9 useCustomMaskForScrolling])
      {
        v23 = -[_UITVScrollViewManager _customScrollingMaskForScrollView:frame:](v9, "_customScrollingMaskForScrollView:frame:", v26, v13, v17 * 3.0, v15, v17);
        v24 = [v26 layer];
        [v24 setMask:v23];
      }
      [(_UITVScrollViewManager *)self setIgnoreScrollAnimationDidEnd:1];
      objc_msgSend(v26, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 0, 3, 1, 0, x, v17 * 3.0);
      [(_UITVScrollViewManager *)self setIgnoreScrollAnimationDidEnd:0];
    }
    v25 = [(_UITVScrollViewManager *)self scrollAnimation];
    objc_msgSend(v26, "_animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 0, 1, v25, x, y);
  }
}

- (void)_removeScreenshotViewIfNeeded
{
  v3 = [(UIView *)self->_snapshotViewForWindow superview];

  if (v3)
  {
    snapshotViewForWindow = self->_snapshotViewForWindow;
    [(UIView *)snapshotViewForWindow removeFromSuperview];
  }
}

- (id)_customScrollingMaskForScrollView:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  objc_super v8 = (objc_class *)MEMORY[0x1E4F39C88];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  [v9 contentSize];
  double v12 = v11;
  double v14 = v13;
  [v9 frame];
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v10, "setFrame:", v16, v18, v12, v14);
  v19 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, y, width, height);
  v20 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v16, v18, v12, v14);
  [v19 appendPath:v20];

  id v21 = v19;
  objc_msgSend(v10, "setPath:", objc_msgSend(v21, "CGPath"));
  [v10 setFillRule:*MEMORY[0x1E4F39FB8]];

  return v10;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v26 = a3;
  BOOL v4 = [(_UITVScrollViewManager *)self snapshotViewForWindow];
  unsigned int v5 = [v4 superview];

  if (v5)
  {
    [v26 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v14 = v12 * 3.0;
    [v26 contentOffset];
    CGFloat v16 = v14 - v15;
    double v17 = [(_UITVScrollViewManager *)self snapshotViewForWindow];
    [v17 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    v24 = [(_UITVScrollViewManager *)self snapshotViewForWindow];
    objc_msgSend(v24, "setFrame:", v19, v16, v21, v23);

    v28.origin.double x = v19;
    v28.origin.double y = v16;
    v28.size.double width = v21;
    v28.size.double height = v23;
    double MinY = CGRectGetMinY(v28);
    v29.origin.double x = v7;
    v29.origin.double y = v9;
    v29.size.double width = v11;
    v29.size.double height = v13;
    if (MinY > CGRectGetMaxY(v29)) {
      [(_UITVScrollViewManager *)self _tearDown:v26];
    }
  }
}

- (_UITVScrollViewManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITVScrollViewManagerDelegate *)WeakRetained;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (int64_t)scrollStyle
{
  return self->_scrollStyle;
}

- (void)setScrollStyle:(int64_t)a3
{
  self->_scrollStyle = a3;
}

- (void)setScrollAnimation:(id)a3
{
}

- (UIView)snapshotViewForWindow
{
  return self->_snapshotViewForWindow;
}

- (void)setSnapshotViewForWindow:(id)a3
{
}

- (BOOL)useCustomMaskForScrolling
{
  return self->_useCustomMaskForScrolling;
}

- (void)setUseCustomMaskForScrolling:(BOOL)a3
{
  self->_useCustomMaskForScrolling = a3;
}

- (BOOL)ignoreScrollAnimationDidEnd
{
  return self->_ignoreScrollAnimationDidEnd;
}

- (void)setIgnoreScrollAnimationDidEnd:(BOOL)a3
{
  self->_ignoreScrollAnimationDidEnd = a3;
}

- (CGPoint)targetOffset
{
  double x = self->_targetOffset.x;
  double y = self->_targetOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTargetOffset:(CGPoint)a3
{
  self->_targetOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotViewForWindow, 0);
  objc_storeStrong((id *)&self->_scrollAnimation, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end