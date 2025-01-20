@interface WLLockScreenView
- (BOOL)_hasVisiblePageForIndex:(unint64_t)a3;
- (BOOL)isAnimatingPresentation;
- (BOOL)isPassFooterViewInGroup:(id)a3;
- (CGRect)_footerViewFrameForPassView:(id)a3;
- (NSData)externalizedAuthenticationContext;
- (UIView)translatedView;
- (WLLockScreenView)initWithFrame:(CGRect)a3;
- (WLLockScreenViewDataSource)dataSource;
- (WLLockScreenViewDelegate)delegate;
- (id)_createPassFooterConfigurationForPassView:(id)a3;
- (id)_dequeueRecycledPage;
- (id)_visiblePageForIndex:(unint64_t)a3;
- (unint64_t)currentIndex;
- (unint64_t)suppressedContentForPassFooter:(id)a3;
- (void)_configurePage:(id)a3 forIndex:(unint64_t)a4;
- (void)_dismissIfAppropriate;
- (void)_handleDidReceiveSuccessfulTransaction:(id)a3;
- (void)_jumpToPage:(unint64_t)a3;
- (void)_jumpToPage:(unint64_t)a3 animated:(BOOL)a4;
- (void)_refreshBrightnessForFrontmostPass;
- (void)_tilePagesEagerly:(BOOL)a3;
- (void)_updateAlphasAndBacklight;
- (void)_updateNumberOfPages;
- (void)_updatePageControl;
- (void)_updatePageScrollViewContentSize;
- (void)_updatePassFooterView;
- (void)_updatePassFooterViewIfNecessary;
- (void)_updatePassFooterViewWithReload:(BOOL)a3;
- (void)dealloc;
- (void)didAppear;
- (void)invalidate;
- (void)layoutSubviews;
- (void)pageChanged;
- (void)reloadCardAtIndex:(unint64_t)a3;
- (void)safeAreaInsetsDidChange;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAnimatingPresentation:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalizedAuthenticationContext:(id)a3;
- (void)setFadeAlpha:(double)a3;
- (void)setOffscreen:(BOOL)a3;
- (void)setSubviewAlpha:(double)a3;
- (void)willDisappear;
@end

@implementation WLLockScreenView

- (WLLockScreenView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)WLLockScreenView;
  v3 = -[WLLockScreenView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    fadeView = v3->_fadeView;
    v3->_fadeView = v8;

    v10 = v3->_fadeView;
    v11 = +[PKPassGroupStackView backgroundColor];
    [(UIView *)v10 setBackgroundColor:v11];

    [(WLLockScreenView *)v3 addSubview:v3->_fadeView];
    v12 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    verticalScrollView = v3->_verticalScrollView;
    v3->_verticalScrollView = v12;

    [(UIScrollView *)v3->_verticalScrollView setContentInsetAdjustmentBehavior:2];
    [(UIScrollView *)v3->_verticalScrollView setPagingEnabled:1];
    [(UIScrollView *)v3->_verticalScrollView setScrollsToTop:0];
    [(UIScrollView *)v3->_verticalScrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v3->_verticalScrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v3->_verticalScrollView setDelegate:v3];
    [(WLLockScreenView *)v3 addSubview:v3->_verticalScrollView];
    v14 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    pageScrollView = v3->_pageScrollView;
    v3->_pageScrollView = v14;

    [(UIScrollView *)v3->_pageScrollView setClipsToBounds:0];
    [(UIScrollView *)v3->_pageScrollView setPagingEnabled:1];
    [(UIScrollView *)v3->_pageScrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v3->_pageScrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v3->_pageScrollView setDelegate:v3];
    [(UIScrollView *)v3->_verticalScrollView addSubview:v3->_pageScrollView];
    v16 = +[UIColor labelColor];
    v17 = [v16 colorWithAlphaComponent:0.3];
    v18 = (UIPageControl *)objc_msgSend(objc_alloc((Class)UIPageControl), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    pageControl = v3->_pageControl;
    v3->_pageControl = v18;

    [(UIPageControl *)v3->_pageControl setCurrentPageIndicatorTintColor:v16];
    [(UIPageControl *)v3->_pageControl setPageIndicatorTintColor:v17];
    [(UIPageControl *)v3->_pageControl setHidesForSinglePage:1];
    [(UIPageControl *)v3->_pageControl addTarget:v3 action:"pageChanged" forControlEvents:4096];
    [(WLLockScreenView *)v3 addSubview:v3->_pageControl];
    v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    visiblePages = v3->_visiblePages;
    v3->_visiblePages = v20;

    v22 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    recycledPages = v3->_recycledPages;
    v3->_recycledPages = v22;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_wantsBacklightRamping)
  {
    v3 = +[PKBacklightController sharedInstance];
    [v3 endRequestingBacklightRamping:self];
  }
  [(UIScrollView *)self->_verticalScrollView setDelegate:0];
  [(UIScrollView *)self->_pageScrollView setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)WLLockScreenView;
  [(WLLockScreenView *)&v4 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v3 = self->_visiblePages;
    id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * (void)v7) setPass:0];
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v5);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = self->_recycledPages;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v12), "setPass:", 0, (void)v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);

  [(WLLockScreenView *)self _updateNumberOfPages];
}

- (UIView)translatedView
{
  return (UIView *)self->_verticalScrollView;
}

- (void)setFadeAlpha:(double)a3
{
}

- (void)setSubviewAlpha:(double)a3
{
  -[UIPageControl setAlpha:](self->_pageControl, "setAlpha:");
  if (self->_passFooterViewVisible)
  {
    passFooterView = self->_passFooterView;
    [(PKPassFooterView *)passFooterView setAlpha:a3];
  }
}

- (void)setOffscreen:(BOOL)a3
{
  verticalScrollView = self->_verticalScrollView;
  if (a3)
  {
    [(WLLockScreenView *)self bounds];
    double v5 = 0.0;
    CGAffineTransformMakeTranslation(&v9, 0.0, v6);
    [(UIScrollView *)verticalScrollView setTransform:&v9];
  }
  else
  {
    long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v8[1] = v7;
    v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(UIScrollView *)verticalScrollView setTransform:v8];
    double v5 = 1.0;
  }
  [(UIView *)self->_fadeView setAlpha:v5];
  [(UIPageControl *)self->_pageControl setAlpha:v5];
}

- (void)didAppear
{
  v3 = (PKSecureElement *)objc_alloc_init((Class)PKSecureElement);
  secureElement = self->_secureElement;
  self->_secureElement = v3;

  [(WLLockScreenView *)self _updateNumberOfPages];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = self->_visiblePages;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      CGAffineTransform v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        v12 = objc_msgSend(WeakRetained, "diffForCardAtIndex:", objc_msgSend(v10, "index", (void)v14));
        [v10 setDiff:v12];

        CGAffineTransform v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if (![(UIScrollView *)self->_pageScrollView isTracking]
    && ![(UIScrollView *)self->_pageScrollView isDecelerating])
  {
    [(WLLockScreenView *)self _tilePagesEagerly:1];
  }
  self->_disappeared = 0;
  [(WLLockScreenView *)self _updatePassFooterViewIfNecessary];
  long long v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_handleDidReceiveSuccessfulTransaction:" name:PKPaymentDidReceiveSuccessfulTransactionNotification object:0];
}

- (void)willDisappear
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  self->_disappeared = 1;
  [(WLLockScreenView *)self _updatePassFooterViewIfNecessary];
  secureElement = self->_secureElement;
  self->_secureElement = 0;
}

- (void)pageChanged
{
  NSInteger v3 = [(UIPageControl *)self->_pageControl currentPage];

  [(WLLockScreenView *)self _jumpToPage:v3 animated:1];
}

- (void)layoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)WLLockScreenView;
  [(WLLockScreenView *)&v45 layoutSubviews];
  [(WLLockScreenView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_fadeView, "setFrame:");
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  verticalScrollView = self->_verticalScrollView;
  if (verticalScrollView)
  {
    [(UIScrollView *)verticalScrollView transform];
    verticalScrollView = self->_verticalScrollView;
  }
  long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v39 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v40 = v12;
  long long v41 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(UIScrollView *)verticalScrollView setTransform:&v39];
  -[UIScrollView setFrame:](self->_verticalScrollView, "setFrame:", v4, v6, v8, v10);
  long long v13 = self->_verticalScrollView;
  v46.origin.x = v4;
  v46.origin.double y = v6;
  v46.size.double width = v8;
  v46.size.double height = v10;
  double Width = CGRectGetWidth(v46);
  v47.origin.x = v4;
  v47.origin.double y = v6;
  v47.size.double width = v8;
  v47.size.double height = v10;
  CGFloat Height = CGRectGetHeight(v47);
  -[UIScrollView setContentSize:](v13, "setContentSize:", Width, Height + Height);
  v48.origin.x = v4;
  v48.origin.double y = v6;
  v48.size.double width = v8;
  v48.size.double height = v10;
  -[UIScrollView setContentOffset:](self->_verticalScrollView, "setContentOffset:", 0.0, CGRectGetHeight(v48));
  long long v16 = self->_verticalScrollView;
  long long v39 = v42;
  long long v40 = v43;
  long long v41 = v44;
  [(UIScrollView *)v16 setTransform:&v39];
  long long v17 = [(WLLockScreenView *)self _visiblePageForIndex:[(UIPageControl *)self->_pageControl currentPage]];
  long long v18 = [v17 passView];
  [(UIScrollView *)self->_verticalScrollView bounds];
  double v19 = CGRectGetWidth(v49) + 8.0;
  PKPassMaxFrontSize();
  double v21 = v20;
  v22 = [v18 pass];
  if ([v22 style] == (char *)&dword_8 + 1)
  {
    [(WLLockScreenView *)self safeAreaInsets];
    double v24 = v23;
    [(UIScrollView *)self->_verticalScrollView contentOffset];
    double v26 = v24 + v25 + 16.0;
    double v27 = -4.0;
  }
  else
  {
    [(UIScrollView *)self->_verticalScrollView bounds];
    UIRectCenteredIntegralRect();
    double v27 = v28;
    double v30 = v29;
    double v19 = v31;
    double v21 = v32;
    unint64_t v33 = PKUIGetMinScreenType();
    double v34 = -30.0;
    if (v33 >= 4) {
      double v34 = 0.0;
    }
    double v26 = v30 + v34;
  }
  -[UIScrollView setFrame:](self->_pageScrollView, "setFrame:", v27, v26, v19, v21);
  [(WLLockScreenView *)self _updatePageScrollViewContentSize];
  [(WLLockScreenView *)self _tilePagesEagerly:0];
  passFooterView = self->_passFooterView;
  v36 = [(PKPassFooterView *)passFooterView configuration];
  v37 = [v36 passView];
  [(WLLockScreenView *)self _footerViewFrameForPassView:v37];
  -[PKPassFooterView setFrame:](passFooterView, "setFrame:");

  [(UIPageControl *)self->_pageControl sizeToFit];
  [(UIPageControl *)self->_pageControl frame];
  [(UIScrollView *)self->_pageScrollView frame];
  -[WLLockScreenView convertPoint:fromView:](self, "convertPoint:fromView:", self->_verticalScrollView);
  [v18 sizeOfFront];
  pageControl = self->_pageControl;
  UIRectCenteredXInRect();
  -[UIPageControl setFrame:](pageControl, "setFrame:");
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WLLockScreenView;
  [(WLLockScreenView *)&v3 safeAreaInsetsDidChange];
  [(WLLockScreenView *)self setNeedsLayout];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (self->_verticalScrollView == a3)
  {
    double y = a4.y;
    objc_msgSend(a3, "bounds", a4.x);
    if (y >= 0.0 || a5->y >= v7 / 1.5)
    {
      a5->x = 0.0;
      a5->double y = v7;
    }
    else
    {
      *a5 = CGPointZero;
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4 = (UIScrollView *)a3;
  if (self->_pageScrollView == v4)
  {
    [(WLLockScreenView *)self _tilePagesEagerly:0];
    if ([(UIScrollView *)self->_pageScrollView isDragging]) {
      [(WLLockScreenView *)self _updatePageControl];
    }
  }
  else if ([(UIScrollView *)self->_verticalScrollView isDragging] {
         || [(UIScrollView *)self->_verticalScrollView isDecelerating])
  }
  {
    [(WLLockScreenView *)self _updateAlphasAndBacklight];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  double v6 = (UIScrollView *)a3;
  if (!a4)
  {
    double v7 = v6;
    if (self->_pageScrollView == v6)
    {
      [(WLLockScreenView *)self _tilePagesEagerly:1];
      [(WLLockScreenView *)self _updatePageControl];
    }
    else
    {
      [(WLLockScreenView *)self _dismissIfAppropriate];
    }
    double v6 = v7;
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_pageScrollView == a3)
  {
    [(WLLockScreenView *)self _tilePagesEagerly:1];
    [(WLLockScreenView *)self _updatePageControl];
  }
  else
  {
    [(WLLockScreenView *)self _dismissIfAppropriate];
  }
}

- (void)_dismissIfAppropriate
{
  [(UIScrollView *)self->_verticalScrollView bounds];
  double v4 = v3;
  [(UIScrollView *)self->_verticalScrollView contentOffset];
  if (v4 - v5 >= v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dismissAnimated:0];
  }
}

- (void)_updateAlphasAndBacklight
{
  [(UIScrollView *)self->_verticalScrollView bounds];
  double v4 = v3;
  [(UIScrollView *)self->_verticalScrollView contentOffset];
  double v6 = v4 - v5;
  double v7 = (v4 - v5) / v4;
  double v8 = 1.0 - v7;
  BOOL v9 = 1.0 - v7 > 1.0 || 1.0 - v7 < 0.0;
  if (1.0 - v7 < 0.0 && 1.0 - v7 <= 1.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = 1.0;
  }
  if (v9) {
    double v8 = v10;
  }
  [(WLLockScreenView *)self setFadeAlpha:v8];
  if (self->_passFooterViewVisible)
  {
    [(PKPassFooterView *)self->_passFooterView frame];
    if (1.0 - v6 / v11 > 1.0
      || ([(PKPassFooterView *)self->_passFooterView frame], double v13 = 0.0, 1.0 - v6 / v12 >= 0.0))
    {
      [(PKPassFooterView *)self->_passFooterView frame];
      double v13 = 1.0;
      if (1.0 - v6 / v14 <= 1.0)
      {
        [(PKPassFooterView *)self->_passFooterView frame];
        double v13 = 1.0 - v6 / v15;
      }
    }
    [(PKPassFooterView *)self->_passFooterView setAlpha:v13];
  }
  BOOL v16 = v7 > 1.0 || v7 < 0.0;
  if (v7 < 0.0 && v7 <= 1.0) {
    double v17 = 0.0;
  }
  else {
    double v17 = 1.0;
  }
  if (v16) {
    double v7 = v17;
  }
  long long v18 = [(WLLockScreenView *)self delegate];
  [v18 updateBacklightWithProgress:v7];

  double v19 = v6 / -80.0 + 1.0;
  BOOL v20 = v19 > 1.0 || v19 < 0.0;
  if (v19 < 0.0 && v19 <= 1.0) {
    double v21 = 0.0;
  }
  else {
    double v21 = 1.0;
  }
  if (v20) {
    double v19 = v21;
  }

  [(WLLockScreenView *)self setSubviewAlpha:v19];
}

- (void)_updateNumberOfPages
{
  pageControl = self->_pageControl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  -[UIPageControl setNumberOfPages:](pageControl, "setNumberOfPages:", [WeakRetained cardCount]);

  [(WLLockScreenView *)self _updatePageScrollViewContentSize];
  [(WLLockScreenView *)self _refreshBrightnessForFrontmostPass];

  [(WLLockScreenView *)self setNeedsLayout];
}

- (void)_jumpToPage:(unint64_t)a3
{
}

- (void)_jumpToPage:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(WLLockScreenView *)self _visiblePageForIndex:[(WLLockScreenView *)self currentIndex]];
  double v8 = [v7 passView];
  [v8 setModalShadowVisibility:!self->_animatingPresentation animated:1.0];

  [(UIScrollView *)self->_pageScrollView bounds];
  -[UIScrollView setContentOffset:animated:](self->_pageScrollView, "setContentOffset:animated:", v4, v9 * (double)a3, 0.0);
  id v11 = [(WLLockScreenView *)self _visiblePageForIndex:a3];
  double v10 = [v11 passView];
  [v10 setModalShadowVisibility:!self->_animatingPresentation animated:1.0];
}

- (void)_updatePageScrollViewContentSize
{
  [(UIScrollView *)self->_pageScrollView bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIScrollView *)self->_pageScrollView contentSize];
  double v8 = v7;
  double v10 = v9;
  double v11 = v4 * (double)[(UIPageControl *)self->_pageControl numberOfPages];
  if (v8 != v11 || v10 != v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v14 = [WeakRetained startIndex];

    -[UIScrollView setContentSize:](self->_pageScrollView, "setContentSize:", v11, v6);
    [(UIPageControl *)self->_pageControl setCurrentPage:v14];
    [(WLLockScreenView *)self _jumpToPage:v14];
  }
}

- (unint64_t)currentIndex
{
  [(UIScrollView *)self->_pageScrollView bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  float v14 = (float)((unint64_t)[WeakRetained cardCount] - 1);
  v29.origin.x = v5;
  v29.origin.double y = v7;
  v29.size.double width = v9;
  v29.size.double height = v11;
  double MidX = CGRectGetMidX(v29);
  v30.origin.x = v5;
  v30.origin.double y = v7;
  v30.size.double width = v9;
  v30.size.double height = v11;
  float v16 = MidX / CGRectGetWidth(v30);
  float v17 = floorf(v16);
  if (v17 <= v14)
  {
    v31.origin.x = v5;
    v31.origin.double y = v7;
    v31.size.double width = v9;
    v31.size.double height = v11;
    double v18 = CGRectGetMidX(v31);
    v32.origin.x = v5;
    v32.origin.double y = v7;
    v32.size.double width = v9;
    v32.size.double height = v11;
    float v19 = v18 / CGRectGetWidth(v32);
    float v20 = 0.0;
    if (floorf(v19) < 0.0) {
      goto LABEL_9;
    }
  }
  else
  {
    id v2 = objc_loadWeakRetained((id *)p_dataSource);
    [v2 cardCount];
  }
  id v21 = objc_loadWeakRetained((id *)p_dataSource);
  float v22 = (float)((unint64_t)[v21 cardCount] - 1);
  v33.origin.x = v5;
  v33.origin.double y = v7;
  v33.size.double width = v9;
  v33.size.double height = v11;
  double v23 = CGRectGetMidX(v33);
  v34.origin.x = v5;
  v34.origin.double y = v7;
  v34.size.double width = v9;
  v34.size.double height = v11;
  float v24 = v23 / CGRectGetWidth(v34);
  if (floorf(v24) <= v22)
  {
    v35.origin.x = v5;
    v35.origin.double y = v7;
    v35.size.double width = v9;
    v35.size.double height = v11;
    double v26 = CGRectGetMidX(v35);
    v36.origin.x = v5;
    v36.origin.double y = v7;
    v36.size.double width = v9;
    v36.size.double height = v11;
    float v27 = v26 / CGRectGetWidth(v36);
    float v20 = floorf(v27);
  }
  else
  {
    id v25 = objc_loadWeakRetained((id *)p_dataSource);
    float v20 = (float)((unint64_t)[v25 cardCount] - 1);
  }
  if (v17 > v14) {

  }
LABEL_9:
  return (unint64_t)v20;
}

- (void)reloadCardAtIndex:(unint64_t)a3
{
  uint64_t v5 = -[WLLockScreenView _visiblePageForIndex:](self, "_visiblePageForIndex:");
  if (v5) {
    [(WLLockScreenView *)self _configurePage:v5 forIndex:a3];
  }

  _objc_release_x1();
}

- (void)_updatePageControl
{
  double v3 = [(WLLockScreenView *)self currentIndex];
  if ((void *)[(UIPageControl *)self->_pageControl currentPage] != v3)
  {
    double v4 = [(WLLockScreenView *)self _visiblePageForIndex:[(UIPageControl *)self->_pageControl currentPage]];
    uint64_t v5 = [v4 passView];
    [v5 setModalShadowVisibility:!self->_animatingPresentation animated:0.0];
    [(WLLockScreenView *)self _updatePassFooterViewIfNecessary];
    double v6 = [(WLLockScreenView *)self _visiblePageForIndex:v3];
    CGFloat v7 = [v6 passView];
    [v7 setModalShadowVisibility:!self->_animatingPresentation animated:1.0];
  }
  [(UIPageControl *)self->_pageControl setCurrentPage:v3];

  [(WLLockScreenView *)self _refreshBrightnessForFrontmostPass];
}

- (id)_visiblePageForIndex:(unint64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = self->_visiblePages;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        CGFloat v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "index", (void)v12) == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_hasVisiblePageForIndex:(unint64_t)a3
{
  double v3 = [(WLLockScreenView *)self _visiblePageForIndex:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_dequeueRecycledPage
{
  double v3 = [(NSMutableSet *)self->_recycledPages anyObject];
  if (v3) {
    [(NSMutableSet *)self->_recycledPages removeObject:v3];
  }

  return v3;
}

- (void)_configurePage:(id)a3 forIndex:(unint64_t)a4
{
  id v12 = a3;
  [v12 setIndex:a4];
  if (!self->_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v7 = [WeakRetained cardAtIndex:a4];
    [v12 setPass:v7];
  }
  double v8 = [v12 passView];
  NSInteger v9 = [(UIPageControl *)self->_pageControl currentPage];
  double v10 = 0.0;
  if (v9 == a4) {
    double v10 = 1.0;
  }
  [v8 setModalShadowVisibility:0 animated:v10];

  [(UIScrollView *)self->_pageScrollView bounds];
  objc_msgSend(v12, "setFrame:", v11 * (double)a4, 0.0);
}

- (void)_tilePagesEagerly:(BOOL)a3
{
  BOOL v52 = a3;
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ([WeakRetained cardCount])
  {
    id v6 = objc_loadWeakRetained((id *)p_dataSource);
    uint64_t v7 = (char *)[v6 cardCount] - 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  [(UIScrollView *)self->_pageScrollView bounds];
  CGFloat x = v63.origin.x;
  CGFloat y = v63.origin.y;
  CGFloat width = v63.size.width;
  CGFloat height = v63.size.height;
  double v12 = (double)(unint64_t)v7;
  double MinX = CGRectGetMinX(v63);
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.CGFloat width = width;
  v64.size.CGFloat height = height;
  float v14 = MinX / CGRectGetWidth(v64);
  if (floorf(v14) < 0.0) {
    goto LABEL_50;
  }
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  double v15 = CGRectGetMinX(v65);
  v66.origin.CGFloat x = x;
  v66.origin.CGFloat y = y;
  v66.size.CGFloat width = width;
  v66.size.CGFloat height = height;
  float v16 = v15 / CGRectGetWidth(v66);
  BOOL v17 = floorf(v16) <= v12;
  double v18 = (double)(unint64_t)v7;
  if (v17)
  {
LABEL_50:
    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.CGFloat height = height;
    double v19 = CGRectGetMinX(v67);
    v68.origin.CGFloat x = x;
    v68.origin.CGFloat y = y;
    v68.size.CGFloat width = width;
    v68.size.CGFloat height = height;
    float v20 = v19 / CGRectGetWidth(v68);
    float v21 = floorf(v20);
    double v18 = 0.0;
    if (v21 >= 0.0)
    {
      v69.origin.CGFloat x = x;
      v69.origin.CGFloat y = y;
      v69.size.CGFloat width = width;
      v69.size.CGFloat height = height;
      double v22 = CGRectGetMinX(v69);
      v70.origin.CGFloat x = x;
      v70.origin.CGFloat y = y;
      v70.size.CGFloat width = width;
      v70.size.CGFloat height = height;
      float v23 = v22 / CGRectGetWidth(v70);
      double v18 = floorf(v23);
    }
  }
  unint64_t v24 = (unint64_t)v18;
  v71.origin.CGFloat x = x;
  v71.origin.CGFloat y = y;
  v71.size.CGFloat width = width;
  v71.size.CGFloat height = height;
  CGFloat v25 = CGRectGetMaxX(v71) + -1.0;
  v72.origin.CGFloat x = x;
  v72.origin.CGFloat y = y;
  v72.size.CGFloat width = width;
  v72.size.CGFloat height = height;
  float v26 = v25 / CGRectGetWidth(v72);
  if (floorf(v26) < 0.0) {
    goto LABEL_51;
  }
  v73.origin.CGFloat x = x;
  v73.origin.CGFloat y = y;
  v73.size.CGFloat width = width;
  v73.size.CGFloat height = height;
  CGFloat v27 = CGRectGetMaxX(v73) + -1.0;
  v74.origin.CGFloat x = x;
  v74.origin.CGFloat y = y;
  v74.size.CGFloat width = width;
  v74.size.CGFloat height = height;
  float v28 = v27 / CGRectGetWidth(v74);
  if (floorf(v28) <= v12)
  {
LABEL_51:
    v75.origin.CGFloat x = x;
    v75.origin.CGFloat y = y;
    v75.size.CGFloat width = width;
    v75.size.CGFloat height = height;
    CGFloat v29 = CGRectGetMaxX(v75) + -1.0;
    v76.origin.CGFloat x = x;
    v76.origin.CGFloat y = y;
    v76.size.CGFloat width = width;
    v76.size.CGFloat height = height;
    float v30 = v29 / CGRectGetWidth(v76);
    double v12 = 0.0;
    if (floorf(v30) >= 0.0)
    {
      v77.origin.CGFloat x = x;
      v77.origin.CGFloat y = y;
      v77.size.CGFloat width = width;
      v77.size.CGFloat height = height;
      CGFloat v31 = CGRectGetMaxX(v77) + -1.0;
      v78.origin.CGFloat x = x;
      v78.origin.CGFloat y = y;
      v78.size.CGFloat width = width;
      v78.size.CGFloat height = height;
      float v32 = v31 / CGRectGetWidth(v78);
      double v12 = floorf(v32);
    }
  }
  unint64_t v33 = (unint64_t)v12;
  unint64_t v51 = (unint64_t)v12;
  unint64_t v34 = v24 - 4;
  if (v24 < 4) {
    unint64_t v34 = 0;
  }
  if ((unint64_t)v7 >= v34) {
    unint64_t v35 = v34;
  }
  else {
    unint64_t v35 = (unint64_t)v7;
  }
  if ((unint64_t)v7 >= v33 + 4) {
    unint64_t v36 = v33 + 4;
  }
  else {
    unint64_t v36 = (unint64_t)v7;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v37 = self->_visiblePages;
  id v38 = [(NSMutableSet *)v37 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v58;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v58 != v40) {
          objc_enumerationMutation(v37);
        }
        long long v42 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v42, "index", v51) < v35
          || (unint64_t)[v42 index] > v36)
        {
          [v42 prepareForReuse];
          [(NSMutableSet *)self->_recycledPages addObject:v42];
          [v42 removeFromSuperview];
        }
      }
      id v39 = [(NSMutableSet *)v37 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v39);
  }

  [(NSMutableSet *)self->_visiblePages minusSet:self->_recycledPages];
  if (v52)
  {
    unint64_t v24 = v35;
    unint64_t v43 = v36;
  }
  else
  {
    unint64_t v43 = v51;
  }
  for (; v24 <= v43; ++v24)
  {
    if (!-[WLLockScreenView _hasVisiblePageForIndex:](self, "_hasVisiblePageForIndex:", v24, v51))
    {
      long long v44 = [(WLLockScreenView *)self _dequeueRecycledPage];
      if (!v44) {
        long long v44 = objc_alloc_init(WLLockScreenCardView);
      }
      [(WLLockScreenView *)self _configurePage:v44 forIndex:v24];
      [(UIScrollView *)self->_pageScrollView addSubview:v44];
      [(NSMutableSet *)self->_visiblePages addObject:v44];
    }
  }
  id v45 = [(WLLockScreenView *)self currentIndex];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  CGRect v46 = self->_visiblePages;
  id v47 = [(NSMutableSet *)v46 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v54;
    do
    {
      for (j = 0; j != v48; j = (char *)j + 1)
      {
        if (*(void *)v54 != v49) {
          objc_enumerationMutation(v46);
        }
        objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)j), "setModallyPresented:", objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)j), "index") == v45);
      }
      id v48 = [(NSMutableSet *)v46 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v48);
  }
}

- (BOOL)isPassFooterViewInGroup:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  BOOL v4 = (unint64_t)[WeakRetained cardCount] > 1;

  return v4;
}

- (unint64_t)suppressedContentForPassFooter:(id)a3
{
  return 275;
}

- (void)_refreshBrightnessForFrontmostPass
{
  id v23 = [(WLLockScreenView *)self _visiblePageForIndex:[(WLLockScreenView *)self currentIndex]];
  double v3 = [v23 pass];
  uint64_t v4 = [v3 barcode];
  if (v4)
  {
    id v5 = (void *)v4;
    int v6 = PKValueAddedServicesEnabledForPass();

    if (!v6)
    {
      double v10 = v3;
LABEL_17:
      if ([v10 passType] == (char *)&dword_0 + 1)
      {
        float v20 = [v10 secureElementPass];
        unsigned int v21 = [v20 isAccessPass];
        char v22 = v21;
        int v19 = v21 ^ 1;

        p_wantsBacklightRamping = &self->_wantsBacklightRamping;
        if ((!self->_wantsBacklightRamping ^ v19)) {
          goto LABEL_23;
        }
        if (v22)
        {
LABEL_13:
          double v18 = +[PKBacklightController sharedInstance];
          [v18 endRequestingBacklightRamping:self];
          LOBYTE(v19) = 0;
LABEL_14:

          goto LABEL_23;
        }
      }
      else
      {
        p_wantsBacklightRamping = &self->_wantsBacklightRamping;
        if (self->_wantsBacklightRamping)
        {
          LOBYTE(v19) = 1;
          goto LABEL_23;
        }
      }
      double v18 = +[PKBacklightController sharedInstance];
      [v18 beginRequestingBacklightRamping:self];
      LOBYTE(v19) = 1;
      goto LABEL_14;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = [WeakRetained cardCount];

  if (v8)
  {
    NSInteger v9 = 0;
    while (1)
    {
      if (v9 == (char *)[(WLLockScreenView *)self currentIndex])
      {
        double v10 = v3;
      }
      else
      {
        id v11 = objc_loadWeakRetained((id *)&self->_dataSource);
        double v10 = [v11 cardAtIndex:v9];

        uint64_t v12 = [v10 barcode];
        if (v12)
        {
          long long v13 = (void *)v12;
          int v14 = PKValueAddedServicesEnabledForPass();

          if (!v14) {
            goto LABEL_17;
          }
        }
      }
      ++v9;
      id v15 = objc_loadWeakRetained((id *)&self->_dataSource);
      float v16 = (char *)[v15 cardCount];

      double v3 = v10;
      if (v9 >= v16) {
        goto LABEL_12;
      }
    }
  }
  double v10 = v3;
LABEL_12:
  p_wantsBacklightRamping = &self->_wantsBacklightRamping;
  if (self->_wantsBacklightRamping) {
    goto LABEL_13;
  }
  LOBYTE(v19) = 0;
LABEL_23:
  BOOL *p_wantsBacklightRamping = v19;
}

- (id)_createPassFooterConfigurationForPassView:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [v4 pass];
  if (PKValueAddedServicesEnabledForPass())
  {
    if ([(PKSecureElement *)self->_secureElement isInRestrictedMode]) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 2;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v8 = [objc_alloc((Class)PKPassFooterViewConfiguration) initWithPassView:v4 state:v6];

  return v8;
}

- (void)_updatePassFooterViewIfNecessary
{
}

- (void)_updatePassFooterView
{
}

- (void)_updatePassFooterViewWithReload:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WLLockScreenView *)self _visiblePageForIndex:[(WLLockScreenView *)self currentIndex]];
  uint64_t v6 = [v5 passView];

  id v7 = [(WLLockScreenView *)self _createPassFooterConfigurationForPassView:v6];
  id v8 = v7;
  if (self->_disappeared || self->_transacted)
  {

    int v9 = 0;
    id v8 = 0;
    BOOL v3 = 0;
  }
  else
  {
    int v9 = 1;
  }
  int passFooterViewVisible = self->_passFooterViewVisible;
  [(PKPassFooterView *)self->_passFooterView alpha];
  double v12 = v11;
  long long v13 = [(PKPassFooterView *)self->_passFooterView configuration];
  int v14 = PKEqualObjects();

  BOOL v15 = passFooterViewVisible != v9;
  if ((v9 & v3 & 1) != 0
    || (passFooterViewVisible == v9 ? (BOOL v16 = v14 == 0) : (BOOL v16 = 1), !v16 ? (v17 = v12 == 1.0) : (v17 = 0), !v17))
  {
    [(WLLockScreenView *)self layoutIfNeeded];
    self->_int passFooterViewVisible = v9;
    unsigned int passFooterViewVisibilityToken = self->_passFooterViewVisibilityToken;
    if (passFooterViewVisible == v9)
    {
      if (!v9) {
        goto LABEL_39;
      }
    }
    else
    {
      self->_unsigned int passFooterViewVisibilityToken = ++passFooterViewVisibilityToken;
      if ((v9 & 1) == 0)
      {
        [(PKPassFooterView *)self->_passFooterView willBecomeHiddenAnimated:1];
LABEL_39:
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_A058;
        v36[3] = &unk_10670;
        BOOL v38 = v15;
        unsigned int v37 = passFooterViewVisibilityToken;
        char v39 = v9;
        float v28 = objc_retainBlock(v36);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_A134;
        v35[3] = &unk_10548;
        v35[4] = self;
        CGFloat v29 = objc_retainBlock(v35);
        objc_initWeak((id *)buf, self);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_A198;
        v32[3] = &unk_10698;
        objc_copyWeak(&v34, (id *)buf);
        float v30 = v28;
        id v33 = v30;
        +[UIView animateWithDuration:6 delay:v29 options:v32 animations:0.25 completion:0.0];

        objc_destroyWeak(&v34);
        objc_destroyWeak((id *)buf);

        goto LABEL_40;
      }
    }
    if (self->_passFooterView)
    {
      if (v14) {
        goto LABEL_36;
      }
    }
    else
    {
      int v19 = (PKPassFooterView *)objc_alloc_init((Class)PKPassFooterView);
      passFooterView = self->_passFooterView;
      self->_passFooterView = v19;

      [(PKPassFooterView *)self->_passFooterView setDelegate:self];
      [(PKPassFooterView *)self->_passFooterView setAlpha:0.0];
      [(WLLockScreenView *)self insertSubview:self->_passFooterView aboveSubview:self->_verticalScrollView];
      [(WLLockScreenView *)self layoutIfNeeded];
      if (v14)
      {
LABEL_36:
        [(WLLockScreenView *)self setNeedsLayout];
        if (passFooterViewVisible != v9) {
          [(PKPassFooterView *)self->_passFooterView willBecomeVisibleAnimated:1];
        }
        BOOL v15 = passFooterViewVisible != v9;
        goto LABEL_39;
      }
    }
    unsigned int v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      char v22 = self->_passFooterView;
      *(_DWORD *)buf = 134349312;
      long long v41 = self;
      __int16 v42 = 2050;
      unint64_t v43 = v22;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "PKPassGroupStackView (%{public}p): configuring PKPassFooterView %{public}p.", buf, 0x16u);
    }

    BOOL v24 = v12 > 0.0 && passFooterViewVisible != 0 || self->_passFooterViewOutstandingAnimations != 0;
    if (v3) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = 0;
    }
    if (self->_externalizedAuthenticationContext)
    {
      uint64_t v31 = v25;
      id v26 = objc_alloc_init((Class)PKPassPresentationContext);
      [v26 setExternalizedAuthenticationContext:self->_externalizedAuthenticationContext];
      externalizedAuthenticationContext = self->_externalizedAuthenticationContext;
      self->_externalizedAuthenticationContext = 0;

      uint64_t v25 = v31;
    }
    else
    {
      id v26 = 0;
    }
    -[PKPassFooterView configureWithConfiguration:context:options:](self->_passFooterView, "configureWithConfiguration:context:options:", v8, v26, v24 | v25, v31);

    goto LABEL_36;
  }
LABEL_40:
}

- (CGRect)_footerViewFrameForPassView:(id)a3
{
  id v4 = [a3 pass];
  [v4 style];

  [(UIScrollView *)self->_pageScrollView frame];
  -[WLLockScreenView convertRect:fromView:](self, "convertRect:fromView:", self->_verticalScrollView);
  double MinY = CGRectGetMinY(v17);
  PKPassViewFrontSize();
  double v7 = MinY + v6;
  PKPassHeightAdjustmentForStyle();
  CGFloat v9 = v7 - v8;
  [(WLLockScreenView *)self bounds];
  memset(&remainder, 0, sizeof(remainder));
  memset(&v15, 0, sizeof(v15));
  CGRectDivide(v18, &v15, &remainder, v9, CGRectMinYEdge);
  [(WLLockScreenView *)self safeAreaInsets];
  CGRectDivide(remainder, &v15, &remainder, v10, CGRectMaxYEdge);
  PKPassFrontFaceContentSize();
  PKSizeAlignedInRect();
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)_handleDidReceiveSuccessfulTransaction:(id)a3
{
  id v8 = a3;
  id v4 = [v8 object];
  if ([(PKPassFooterView *)self->_passFooterView isViewCurrentContentView:v4])
  {
    id v5 = [v8 userInfo];
    unsigned __int8 v6 = [v5 PKBoolForKey:PKPaymentDidReceiveSuccessfulTransactionPersistUI];

    if ((v6 & 1) == 0)
    {
      self->_transacted = 1;
      [(WLLockScreenView *)self _updatePassFooterViewIfNecessary];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained dismissAnimated:1];
    }
  }
}

- (WLLockScreenViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (WLLockScreenViewDataSource *)WeakRetained;
}

- (WLLockScreenViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WLLockScreenViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAnimatingPresentation
{
  return self->_animatingPresentation;
}

- (void)setAnimatingPresentation:(BOOL)a3
{
  self->_animatingPresentation = a3;
}

- (NSData)externalizedAuthenticationContext
{
  return self->_externalizedAuthenticationContext;
}

- (void)setExternalizedAuthenticationContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalizedAuthenticationContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_passFooterView, 0);
  objc_storeStrong((id *)&self->_recycledPages, 0);
  objc_storeStrong((id *)&self->_visiblePages, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_pageScrollView, 0);
  objc_storeStrong((id *)&self->_verticalScrollView, 0);

  objc_storeStrong((id *)&self->_fadeView, 0);
}

@end