@interface UIKBTutorialMultipageView
- (NSArray)pageViews;
- (NSTimer)nextPageScrollTimer;
- (UIKBTutorialMultipageView)initWithPageViews:(id)a3 pagingInterval:(double)a4;
- (UIPageControl)pageControl;
- (UIScrollView)pageScrollView;
- (double)pagingInterval;
- (void)configMediaView;
- (void)resetPageScrolling;
- (void)scrollToNextPage;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setNextPageScrollTimer:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPageScrollView:(id)a3;
- (void)setPageViews:(id)a3;
- (void)setPagingInterval:(double)a3;
@end

@implementation UIKBTutorialMultipageView

- (UIKBTutorialMultipageView)initWithPageViews:(id)a3 pagingInterval:(double)a4
{
  id v7 = a3;
  BOOL v8 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
  double v9 = dbl_186B96950[v8];
  double v10 = dbl_186B96960[v8];
  v51.receiver = self;
  v51.super_class = (Class)UIKBTutorialMultipageView;
  v11 = -[UIView initWithSize:](&v51, sel_initWithSize_, v9, v10);
  v12 = v11;
  if (v11)
  {
    p_pageViews = (id *)&v11->_pageViews;
    objc_storeStrong((id *)&v11->_pageViews, a3);
    uint64_t v49 = 440;
    v12->_pagingInterval = a4;
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v14 = 11.0;
    }
    else {
      double v14 = 5.0;
    }
    v15 = -[UIView initWithSize:]([UIPageControl alloc], "initWithSize:", 59.0, v14);
    pageControl = v12->_pageControl;
    v12->_pageControl = v15;

    -[UIPageControl setNumberOfPages:](v12->_pageControl, "setNumberOfPages:", [*p_pageViews count]);
    [(UIPageControl *)v12->_pageControl setCurrentPage:0];
    [(UIPageControl *)v12->_pageControl setHidesForSinglePage:1];
    v17 = +[UIColor lightGrayColor];
    [(UIPageControl *)v12->_pageControl setPageIndicatorTintColor:v17];

    v18 = +[UIColor darkGrayColor];
    [(UIPageControl *)v12->_pageControl setCurrentPageIndicatorTintColor:v18];

    [(UIView *)v12 addSubview:v12->_pageControl];
    v19 = objc_alloc_init(UIScrollView);
    pageScrollView = v12->_pageScrollView;
    v12->_pageScrollView = v19;

    [(UIScrollView *)v12->_pageScrollView setDelegate:v12];
    [(UIScrollView *)v12->_pageScrollView setPagingEnabled:1];
    [(UIScrollView *)v12->_pageScrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v12->_pageScrollView setShowsHorizontalScrollIndicator:0];
    [(UIView *)v12 addSubview:v12->_pageScrollView];
    if ([*p_pageViews count])
    {
      unint64_t v21 = 0;
      v22 = 0;
      do
      {
        v23 = objc_msgSend(*p_pageViews, "objectAtIndex:", v21, v49);
        [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIView *)v12->_pageScrollView addSubview:v23];
        v24 = [v23 leadingAnchor];
        if (v22)
        {
          v25 = [v22 trailingAnchor];
          v26 = [v24 constraintEqualToAnchor:v25];
          [v26 setActive:1];
        }
        else
        {
          v25 = [(UIScrollView *)v12->_pageScrollView contentLayoutGuide];
          v26 = [v25 leadingAnchor];
          v27 = [v24 constraintEqualToAnchor:v26];
          [v27 setActive:1];
        }
        v28 = [v23 topAnchor];
        v29 = [(UIScrollView *)v12->_pageScrollView contentLayoutGuide];
        v30 = [v29 topAnchor];
        v31 = [v28 constraintEqualToAnchor:v30];
        [v31 setActive:1];

        v32 = [v23 bottomAnchor];
        v33 = [(UIScrollView *)v12->_pageScrollView contentLayoutGuide];
        v34 = [v33 bottomAnchor];
        v35 = [v32 constraintEqualToAnchor:v34];
        [v35 setActive:1];

        v36 = [v23 widthAnchor];
        v37 = [(UIScrollView *)v12->_pageScrollView frameLayoutGuide];
        v38 = [v37 widthAnchor];
        v39 = [v36 constraintEqualToAnchor:v38];
        [v39 setActive:1];

        v40 = [v23 heightAnchor];
        v41 = [(UIView *)v12->_pageScrollView heightAnchor];
        v42 = [v40 constraintEqualToAnchor:v41 multiplier:0.99];
        [v42 setActive:1];

        ++v21;
        v22 = v23;
      }
      while (v21 < [*p_pageViews count]);
    }
    else
    {
      v23 = 0;
    }
    v43 = [(UIScrollView *)v12->_pageScrollView contentLayoutGuide];
    v44 = [v43 trailingAnchor];
    v45 = [v23 trailingAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    [v46 setActive:1];

    if ((unint64_t)[*p_pageViews count] > 1
      && *(double *)((char *)&v12->super.super.super.isa + v50) > 0.0)
    {
      [(UIKBTutorialMultipageView *)v12 scrollToNextPage];
    }
    v47 = v12;
  }
  return v12;
}

- (void)configMediaView
{
  v3 = [(UIKBTutorialMultipageView *)self pageControl];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(UIKBTutorialMultipageView *)self pageControl];
  v5 = [v4 centerXAnchor];
  v6 = [(UIView *)self centerXAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  BOOL v8 = [(UIKBTutorialMultipageView *)self pageControl];
  double v9 = [v8 bottomAnchor];
  double v10 = [(UIView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [(UIKBTutorialMultipageView *)self pageScrollView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(UIKBTutorialMultipageView *)self pageScrollView];
  double v14 = [v13 leadingAnchor];
  v15 = [(UIView *)self leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [(UIKBTutorialMultipageView *)self pageScrollView];
  v18 = [v17 trailingAnchor];
  v19 = [(UIView *)self trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  unint64_t v21 = [(UIKBTutorialMultipageView *)self pageScrollView];
  v22 = [v21 topAnchor];
  v23 = [(UIView *)self topAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  if ([(NSArray *)self->_pageViews count] > 1)
  {
    v25 = [(UIKBTutorialMultipageView *)self pageControl];
    id v29 = [v25 topAnchor];
  }
  else
  {
    id v29 = [(UIView *)self bottomAnchor];
  }
  v26 = [(UIKBTutorialMultipageView *)self pageScrollView];
  v27 = [v26 bottomAnchor];
  v28 = [v27 constraintEqualToAnchor:v29];
  [v28 setActive:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  [a3 contentOffset];
  double v5 = v4;
  v6 = [(UIKBTutorialMultipageView *)self pageScrollView];
  [v6 bounds];
  double v7 = v5 / CGRectGetWidth(v10);

  id v8 = [(UIKBTutorialMultipageView *)self pageControl];
  [v8 setCurrentPage:llround(v7)];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  double v4 = [(UIKBTutorialMultipageView *)self nextPageScrollTimer];
  [v4 invalidate];

  [(UIKBTutorialMultipageView *)self setNextPageScrollTimer:0];
}

- (void)scrollToNextPage
{
  v3 = [(UIKBTutorialMultipageView *)self pageControl];
  uint64_t v4 = [v3 currentPage];

  double v5 = [(UIKBTutorialMultipageView *)self nextPageScrollTimer];

  if (v5)
  {
    uint64_t v6 = v4 + 1;
    double v7 = [(UIKBTutorialMultipageView *)self pageControl];
    uint64_t v8 = [v7 numberOfPages];

    if (v6 >= v8)
    {
      unint64_t v21 = [(UIKBTutorialMultipageView *)self nextPageScrollTimer];
      [v21 invalidate];

      [(UIKBTutorialMultipageView *)self setNextPageScrollTimer:0];
    }
    else
    {
      double v9 = [(UIKBTutorialMultipageView *)self pageScrollView];
      [v9 setNeedsLayout];

      CGRect v10 = [(UIKBTutorialMultipageView *)self pageScrollView];
      v11 = [(UIKBTutorialMultipageView *)self pageScrollView];
      [v11 contentSize];
      double v13 = v12;
      double v14 = [(UIKBTutorialMultipageView *)self pageControl];
      objc_msgSend(v10, "setContentOffset:animated:", 1, v13 / (double)objc_msgSend(v14, "numberOfPages") * (double)v6, 0.0);

      id v22 = [(UIKBTutorialMultipageView *)self pageControl];
      [v22 setCurrentPage:v6];
    }
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1CB00]);
    v16 = [MEMORY[0x1E4F1C9C8] now];
    [(UIKBTutorialMultipageView *)self pagingInterval];
    v17 = objc_msgSend(v16, "dateByAddingTimeInterval:");
    [(UIKBTutorialMultipageView *)self pagingInterval];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __45__UIKBTutorialMultipageView_scrollToNextPage__block_invoke;
    v23[3] = &unk_1E52EC0A8;
    v23[4] = self;
    v18 = objc_msgSend(v15, "initWithFireDate:interval:repeats:block:", v17, 1, v23);
    [(UIKBTutorialMultipageView *)self setNextPageScrollTimer:v18];

    v19 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    v20 = [(UIKBTutorialMultipageView *)self nextPageScrollTimer];
    [v19 addTimer:v20 forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

uint64_t __45__UIKBTutorialMultipageView_scrollToNextPage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scrollToNextPage];
}

- (void)resetPageScrolling
{
  v3 = [(UIKBTutorialMultipageView *)self pageControl];
  [v3 setCurrentPage:0];

  uint64_t v4 = [(UIKBTutorialMultipageView *)self nextPageScrollTimer];
  [v4 invalidate];

  [(UIKBTutorialMultipageView *)self setNextPageScrollTimer:0];
  double v5 = [(UIKBTutorialMultipageView *)self pageScrollView];
  objc_msgSend(v5, "setContentOffset:", 0.0, 0.0);

  [(UIKBTutorialMultipageView *)self scrollToNextPage];
}

- (UIScrollView)pageScrollView
{
  return self->_pageScrollView;
}

- (void)setPageScrollView:(id)a3
{
}

- (NSArray)pageViews
{
  return self->_pageViews;
}

- (void)setPageViews:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (NSTimer)nextPageScrollTimer
{
  return self->_nextPageScrollTimer;
}

- (void)setNextPageScrollTimer:(id)a3
{
}

- (double)pagingInterval
{
  return self->_pagingInterval;
}

- (void)setPagingInterval:(double)a3
{
  self->_pagingInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPageScrollTimer, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_pageViews, 0);
  objc_storeStrong((id *)&self->_pageScrollView, 0);
}

@end