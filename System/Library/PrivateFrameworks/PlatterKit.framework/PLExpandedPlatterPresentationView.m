@interface PLExpandedPlatterPresentationView
- (BOOL)respondsToSelector:(SEL)a3;
- (CGSize)contentSizeForSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3;
- (PLClickPresentationInteractionPresentable)presentableViewController;
- (PLExpandedPlatter)expandedPlatterView;
- (PLExpandedPlatterPresentationView)initWithFrame:(CGRect)a3;
- (PLExpandedPlatterPresentationViewDelegate)delegate;
- (UIScrollView)scrollView;
- (double)_translationWithVelocity:(double)a3 acceleration:(double)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_configureExpandedPlatterViewIfNecessary;
- (void)_configureScrollViewIfNecessary;
- (void)_dismissExpandedPlatterWithTrigger:(int64_t)a3;
- (void)_handleDismissButton:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentableViewController:(id)a3;
@end

@implementation PLExpandedPlatterPresentationView

- (PLExpandedPlatterPresentationView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLExpandedPlatterPresentationView;
  v3 = -[PLExpandedPlatterPresentationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PLExpandedPlatterPresentationView *)v3 setAutoresizesSubviews:1];
    [(PLExpandedPlatterPresentationView *)v4 _setIgnoresLayerTransformForSafeAreaInsets:1];
  }
  return v4;
}

- (PLExpandedPlatter)expandedPlatterView
{
  [(PLExpandedPlatterPresentationView *)self _configureExpandedPlatterViewIfNecessary];
  expandedPlatterView = self->_expandedPlatterView;
  return expandedPlatterView;
}

- (UIScrollView)scrollView
{
  [(PLExpandedPlatterPresentationView *)self _configureScrollViewIfNecessary];
  scrollView = self->_scrollView;
  return scrollView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PLExpandedPlatterPresentationView contentSizeForSize:](self, "contentSizeForSize:", a3.width, a3.height);
  -[PLExpandedPlatterPresentationView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PLExpandedPlatterPresentationView;
  [(PLExpandedPlatterPresentationView *)&v4 layoutSubviews];
  [(PLExpandedPlatterPresentationView *)self _configureScrollViewIfNecessary];
  [(PLExpandedPlatterPresentationView *)self _configureExpandedPlatterViewIfNecessary];
  expandedPlatterView = self->_expandedPlatterView;
  [(UIScrollView *)self->_scrollView bounds];
  -[PLExpandedPlatter setFrame:](expandedPlatterView, "setFrame:");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PLExpandedPlatterPresentationView;
  -[PLExpandedPlatterPresentationView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (PLExpandedPlatterPresentationView *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v5;
  if (v5 == self) {
    double v5 = 0;
  }
  v7 = v5;

  return v7;
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PLExpandedPlatterPresentationView *)self _configureExpandedPlatterViewIfNecessary];
  expandedPlatterView = self->_expandedPlatterView;
  -[PLExpandedPlatter sizeThatFitsContentWithSize:](expandedPlatterView, "sizeThatFitsContentWithSize:", width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (width > 0.0 && height > 0.0)
  {
    [(PLExpandedPlatterPresentationView *)self _configureExpandedPlatterViewIfNecessary];
    -[PLExpandedPlatter contentSizeForSize:](self->_expandedPlatterView, "contentSizeForSize:", width, height);
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLExpandedPlatterPresentationView;
  if (-[PLExpandedPlatterPresentationView respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else if ([(UIView *)self pl_isScrollViewDelegateMethod:a3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (-[UIView pl_isScrollViewDelegateMethod:](self, "pl_isScrollViewDelegateMethod:", [v4 selector]))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [v4 invokeWithTarget:WeakRetained];
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)PLExpandedPlatterPresentationView;
      [(PLExpandedPlatterPresentationView *)&v6 forwardInvocation:v4];
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableViewController);
  [v13 contentOffset];
  if (v5 < 0.0 && ([WeakRetained isBeingDismissed] & 1) == 0)
  {
    [v13 contentOffset];
    double v7 = v6 >= 0.0 ? v6 : -v6;
    [(PLExpandedPlatterPresentationView *)self bounds];
    double v8 = fmax(v7 / CGRectGetHeight(v15), 0.0);
    if (v8 < 1.0)
    {
      [v13 contentOffset];
      double v10 = fmin(fmax(1.0 - (v9 + 60.0) / 60.0, 0.0), 1.0);
      v11 = [WeakRetained expandedPlatterPresentationController];
      [v11 hintDismissalWithCommitProgress:v10 overallProgress:v8];
    }
  }
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [v12 scrollViewDidScroll:v13];
  }
}

- (double)_translationWithVelocity:(double)a3 acceleration:(double)a4
{
  float v4 = a3;
  double v5 = (float)-(float)(v4 * v4) / (a4 + a4);
  if (a3 <= 0.0) {
    double v6 = -v5;
  }
  else {
    double v6 = v5;
  }
  return v6 / PLMainScreenScale();
}

- (void)_dismissExpandedPlatterWithTrigger:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableViewController);
  if (objc_opt_respondsToSelector())
  {
    id v4 = WeakRetained;
    double v5 = [v4 dismisser];
    [v5 expandedPlatterPresentable:v4 requestsDismissalWithTrigger:a3];
  }
  else
  {
    double v5 = [WeakRetained presenter];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v5 clickPresentationInteractionManager];
    }
    else
    {
      id v4 = 0;
    }
    [v4 _dismissIfPossibleWithTrigger:a3];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = a3;
  [v19 contentOffset];
  double v7 = v6 + 60.0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableViewController);
  if (v7 < 0.0 || !v4)
  {
    if (v7 >= 0.0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v11 = [v19 panGestureRecognizer];
  id v12 = [WeakRetained expandedPlatterPresentationController];
  id v13 = [v12 containerView];
  [v11 velocityInView:v13];
  double v15 = v14;

  [(PLExpandedPlatterPresentationView *)self _translationWithVelocity:v15 acceleration:*MEMORY[0x1E4F43CE0] * -10000.0];
  double v17 = v16;
  [v19 contentOffset];
  if (v18 - v17 + 60.0 < 0.0) {
LABEL_7:
  }
    [(PLExpandedPlatterPresentationView *)self _dismissExpandedPlatterWithTrigger:1];
LABEL_8:
  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [v10 scrollViewDidEndDragging:v19 willDecelerate:v4];
  }
}

- (void)_configureScrollViewIfNecessary
{
  if (!self->_scrollView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42DB0]);
    [(PLExpandedPlatterPresentationView *)self bounds];
    BOOL v4 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:");
    scrollView = self->_scrollView;
    self->_scrollView = v4;

    [(UIScrollView *)self->_scrollView setAutoresizingMask:18];
    [(UIScrollView *)self->_scrollView setAlwaysBounceHorizontal:0];
    [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)self->_scrollView setClipsToBounds:0];
    [(UIScrollView *)self->_scrollView setDelegate:self];
    [(UIScrollView *)self->_scrollView setBounces:1];
    [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
    double v6 = self->_scrollView;
    [(PLExpandedPlatterPresentationView *)self addSubview:v6];
  }
}

- (void)_configureExpandedPlatterViewIfNecessary
{
  if (!self->_expandedPlatterView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      id v3 = [WeakRetained expandedPlatterViewForPresentationView:self];
    }
    else
    {
      id v3 = 0;
    }
    expandedPlatterView = self->_expandedPlatterView;
    self->_expandedPlatterView = v3;

    double v5 = self->_expandedPlatterView;
    if (v5)
    {
      [(PLExpandedPlatter *)v5 setAdjustsFontForContentSizeCategory:1];
      if ([(PLExpandedPlatter *)self->_expandedPlatterView conformsToProtocol:&unk_1F336CC50])double v6 = self->_expandedPlatterView; {
      else
      }
        double v6 = 0;
      double v7 = v6;
      double v8 = [(PLExpandedPlatter *)v7 dismissControl];
      [v8 addTarget:self action:sel__handleDismissButton_ forControlEvents:0x2000];

      [(PLExpandedPlatterPresentationView *)self _configureScrollViewIfNecessary];
      [(UIScrollView *)self->_scrollView addSubview:self->_expandedPlatterView];
    }
  }
}

- (void)_handleDismissButton:(id)a3
{
}

- (PLClickPresentationInteractionPresentable)presentableViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableViewController);
  return (PLClickPresentationInteractionPresentable *)WeakRetained;
}

- (void)setPresentableViewController:(id)a3
{
}

- (PLExpandedPlatterPresentationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLExpandedPlatterPresentationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentableViewController);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_expandedPlatterView, 0);
}

@end