@interface _UIPageViewControllerContentView
- (BOOL)canBecomeFocused;
- (CGRect)_scrollViewFrame;
- (UIPageControl)pageControl;
- (_UIPageViewControllerContentView)initWithFrame:(CGRect)a3 andPageViewController:(id)a4;
- (_UIQueuingScrollView)scrollView;
- (double)_pageSpacing;
- (id)preferredFocusedView;
- (void)_setupPageControl:(id)a3;
- (void)invalidatePageViewController;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation _UIPageViewControllerContentView

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)preferredFocusedView
{
  return self->_scrollView;
}

- (_UIPageViewControllerContentView)initWithFrame:(CGRect)a3 andPageViewController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)_UIPageViewControllerContentView;
  v10 = -[UIView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_pageViewController, v9);
    [(UIView *)v11 setAutoresizingMask:18];
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_pageViewController);
    uint64_t v13 = [WeakRetained _transitionStyle];

    if (v13 == 1)
    {
      [(UIView *)v11 setClipsToBounds:1];
      id v14 = objc_loadWeakRetained((id *)&v11->_pageViewController);
      int v15 = [v14 _isPageControlVisible];

      if (v15)
      {
        v16 = [UIPageControl alloc];
        uint64_t v17 = -[UIPageControl initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        pageControl = v11->_pageControl;
        v11->_pageControl = (UIPageControl *)v17;

        [(_UIPageViewControllerContentView *)v11 _setupPageControl:v11->_pageControl];
      }
      v19 = [_UIQueuingScrollView alloc];
      [(UIView *)v11 bounds];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      id v28 = objc_loadWeakRetained((id *)&v11->_pageViewController);
      uint64_t v29 = -[_UIQueuingScrollView initWithFrame:navigationOrientation:](v19, "initWithFrame:navigationOrientation:", [v28 navigationOrientation], v21, v23, v25, v27);
      scrollView = v11->_scrollView;
      v11->_scrollView = (_UIQueuingScrollView *)v29;

      v31 = v11->_scrollView;
      id v32 = objc_loadWeakRetained((id *)&v11->_pageViewController);
      [(_UIQueuingScrollView *)v31 setQDelegate:v32];

      v33 = v11->_scrollView;
      id v34 = objc_loadWeakRetained((id *)&v11->_pageViewController);
      [(_UIQueuingScrollView *)v33 setQDataSource:v34];

      [(UIScrollView *)v11->_scrollView _setResetsBoundingPathForSubtree:0];
      [(UIView *)v11 addSubview:v11->_scrollView];
    }
  }

  return v11;
}

- (void)invalidatePageViewController
{
  [(_UIQueuingScrollView *)self->_scrollView setQDelegate:0];
  [(_UIQueuingScrollView *)self->_scrollView setQDataSource:0];
  objc_storeWeak((id *)&self->_pageViewController, 0);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v25.receiver = self;
  v25.super_class = (Class)_UIPageViewControllerContentView;
  -[UIView setBounds:](&v25, sel_setBounds_, x, y, width, height);
  p_pageViewController = &self->_pageViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);
  if (WeakRetained)
  {
    v18 = WeakRetained;
    [(UIView *)self bounds];
    v27.origin.double x = v19;
    v27.origin.double y = v20;
    v27.size.double width = v21;
    v27.size.double height = v22;
    v26.origin.double x = v9;
    v26.origin.double y = v11;
    v26.size.double width = v13;
    v26.size.double height = v15;
    BOOL v23 = CGRectEqualToRect(v26, v27);

    if (!v23)
    {
      id v24 = objc_loadWeakRetained((id *)p_pageViewController);
      [v24 _contentViewFrameOrBoundsDidChange];
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v25.receiver = self;
  v25.super_class = (Class)_UIPageViewControllerContentView;
  -[UIView setFrame:](&v25, sel_setFrame_, x, y, width, height);
  p_pageViewController = &self->_pageViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);
  if (WeakRetained)
  {
    v18 = WeakRetained;
    [(UIView *)self frame];
    v27.origin.double x = v19;
    v27.origin.double y = v20;
    v27.size.double width = v21;
    v27.size.double height = v22;
    v26.origin.double x = v9;
    v26.origin.double y = v11;
    v26.size.double width = v13;
    v26.size.double height = v15;
    BOOL v23 = CGRectEqualToRect(v26, v27);

    if (!v23)
    {
      id v24 = objc_loadWeakRetained((id *)p_pageViewController);
      [v24 _contentViewFrameOrBoundsDidChange];
    }
  }
}

- (double)_pageSpacing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);
  [WeakRetained _pageSpacing];
  double v4 = v3;

  return v4;
}

- (CGRect)_scrollViewFrame
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  pageControl = self->_pageControl;
  if (pageControl)
  {
    [(UIView *)pageControl frame];
    double v10 = v10 - CGRectGetHeight(v17);
    if (dyld_program_sdk_at_least())
    {
      [(UIView *)self safeAreaInsets];
      double v10 = v10 - v12;
    }
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)_setupPageControl:(id)a3
{
  id v5 = a3;
  [v5 _setFlickToEndGestureEnabled:0];
  [v5 setAutoresizingMask:10];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);
  [v5 addTarget:WeakRetained action:sel__pageControlValueChanged_ forControlEvents:4096];

  [(UIView *)self addSubview:v5];
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)_UIPageViewControllerContentView;
  [(UIView *)&v33 layoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);
  int v4 = [WeakRetained _isPageControlVisible];

  pageControl = self->_pageControl;
  if (v4)
  {
    if (!pageControl)
    {
      double v6 = [UIPageControl alloc];
      double v7 = -[UIPageControl initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v8 = self->_pageControl;
      self->_pageControl = v7;

      [(_UIPageViewControllerContentView *)self _setupPageControl:self->_pageControl];
      pageControl = self->_pageControl;
    }
    if (![(UIPageControl *)pageControl numberOfPages])
    {
      id v9 = objc_loadWeakRetained((id *)&self->_pageViewController);
      [v9 _updatePageControlViaDataSourceIfNecessary];
    }
    [(UIView *)self->_pageControl sizeToFit];
    [(UIView *)self->_pageControl frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [(UIView *)self bounds];
    double Height = CGRectGetHeight(v34);
    if (dyld_program_sdk_at_least())
    {
      [(UIView *)self safeAreaInsets];
      double Height = Height - v19;
    }
    v35.origin.double x = v11;
    v35.origin.double y = v13;
    v35.size.double width = v15;
    v35.size.double height = v17;
    CGFloat v20 = Height - CGRectGetHeight(v35);
    [(UIView *)self center];
    double v22 = v21;
    double v24 = v23;
    objc_super v25 = [(UIView *)self superview];
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v25, v22, v24);
    double v27 = v26;
    v36.origin.double x = v11;
    v36.origin.double y = v20;
    v36.size.double width = v15;
    v36.size.double height = v17;
    double v28 = v27 + CGRectGetWidth(v36) * -0.5;

    -[UIView setFrame:](self->_pageControl, "setFrame:", v28, v20, v15, v17);
  }
  else
  {
    [(UIView *)pageControl removeFromSuperview];
    uint64_t v29 = self->_pageControl;
    self->_pageControl = 0;
  }
  scrollView = self->_scrollView;
  [(_UIPageViewControllerContentView *)self _scrollViewFrame];
  -[_UIQueuingScrollView _setFrameAndApplyPageSpacing:](scrollView, "_setFrameAndApplyPageSpacing:");
  v31 = self->_scrollView;
  [(_UIPageViewControllerContentView *)self _pageSpacing];
  [(_UIQueuingScrollView *)v31 setPageSpacing:v32 * 0.5];
}

- (_UIQueuingScrollView)scrollView
{
  return self->_scrollView;
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_pageViewController);
}

@end