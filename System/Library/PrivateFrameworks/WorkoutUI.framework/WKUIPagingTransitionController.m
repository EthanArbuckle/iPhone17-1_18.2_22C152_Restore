@interface WKUIPagingTransitionController
- (BOOL)_isValidPage:(int64_t)a3;
- (CGRect)contentFrameForPage:(int64_t)a3;
- (CGSize)pageSize;
- (UIPageControl)pageControl;
- (UIScrollView)scrollView;
- (WKUIPagingTransitionController)initWithScrollView:(id)a3 pageSize:(CGSize)a4 numberOfPages:(int64_t)a5 startingPage:(int64_t)a6 pagingAxis:(int64_t)a7 delegate:(id)a8;
- (WKUIPagingTransitionControllerAnimationDelegate)animationDelegate;
- (WKUIPagingTransitionControllerDelegate)delegate;
- (double)increaseMusicControlBottomOffset;
- (double)topPadding;
- (id)_pageViewForPage:(unint64_t)a3;
- (int64_t)_currentPage;
- (int64_t)_pageForOffset:(double)a3;
- (int64_t)currentPage;
- (int64_t)dominantPage;
- (int64_t)musicControlPageIndex;
- (int64_t)numberOfPages;
- (void)_cancelAnimatedTransitionFromPage:(int64_t)a3;
- (void)_endAnimatedTransitionToPage:(int64_t)a3;
- (void)_endTransitionAnimationForPage:(int64_t)a3 visible:(BOOL)a4;
- (void)_handleScrollViewScrollEnd;
- (void)_prepareViewForPage:(unint64_t)a3 pagingDirection:(int64_t)a4;
- (void)_setActualPageNumber:(int64_t)a3;
- (void)reanimateCurrentView;
- (void)resetCurrentView;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setCurrentPage:(int64_t)a3;
- (void)setCurrentPage:(int64_t)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setIncreaseMusicControlBottomOffset:(double)a3;
- (void)setMusicControlPageIndex:(int64_t)a3;
- (void)setPageControl:(id)a3;
- (void)setPageSize:(CGSize)a3;
- (void)setTopPadding:(double)a3;
@end

@implementation WKUIPagingTransitionController

- (WKUIPagingTransitionController)initWithScrollView:(id)a3 pageSize:(CGSize)a4 numberOfPages:(int64_t)a5 startingPage:(int64_t)a6 pagingAxis:(int64_t)a7 delegate:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v16 = a3;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)WKUIPagingTransitionController;
  v18 = [(WKUIPagingTransitionController *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_delegate, v17);
    objc_storeStrong((id *)&v19->_scrollView, a3);
    [(UIScrollView *)v19->_scrollView setDelegate:v19];
    [(UIScrollView *)v19->_scrollView setPagingEnabled:1];
    [(UIScrollView *)v19->_scrollView setClipsToBounds:0];
    v19->_actualPageNumber = a6;
    v19->_currentPage = a6;
    v19->_numberOfPages = a5;
    v19->_pagingAxis = a7;
    -[WKUIPagingTransitionController setPageSize:](v19, "setPageSize:", width, height);
  }

  return v19;
}

- (void)setAnimationDelegate:(id)a3
{
  id obj = a3;
  self->_animationDelegateCache.supportsTransitioningView = objc_opt_respondsToSelector() & 1;
  self->_animationDelegateCache.supportsTransitioningPage = objc_opt_respondsToSelector() & 1;
  self->_animationDelegateCache.supportsDidFinishTransitionForView = objc_opt_respondsToSelector() & 1;
  objc_storeWeak((id *)&self->_animationDelegate, obj);
}

- (int64_t)dominantPage
{
  return self->_actualPageNumber;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
  id v5 = a3;
  [(UIPageControl *)self->_pageControl setNumberOfPages:self->_numberOfPages];
  [(UIPageControl *)self->_pageControl setCurrentPage:self->_currentPage];
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:");
}

- (void)setCurrentPage:(int64_t)a3 animated:(BOOL)a4
{
  if (a4)
  {
    scrollView = self->_scrollView;
    [(WKUIPagingTransitionController *)self contentFrameForPage:a3];
    -[UIScrollView scrollRectToVisible:animated:](scrollView, "scrollRectToVisible:animated:", 1);
  }
  else
  {
    p_currentPageView = &self->_currentPageView;
    v19 = self->_currentPageView;
    v8 = [(WKUIPagingTransitionController *)self delegate];
    v9 = [v8 pagingTransitionController:self viewForPage:a3];

    if (v9 != *p_currentPageView)
    {
      [(UIView *)*p_currentPageView removeFromSuperview];
      [(UIScrollView *)self->_scrollView addSubview:v9];
      objc_storeStrong((id *)&self->_currentPageView, v9);
    }
    [(WKUIPagingTransitionController *)self contentFrameForPage:a3];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    -[UIView setFrame:](v9, "setFrame:");
    -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 0, v11, v13, v15, v17);
    [(WKUIPagingTransitionController *)self setCurrentPage:a3];
    [(WKUIPagingTransitionController *)self _setActualPageNumber:a3];
    self->_lastVisibleRange.location = a3;
    self->_lastVisibleRange.length = 1;
    v18 = [(WKUIPagingTransitionController *)self delegate];
    [v18 pagingTransitionController:self didFinishTransitionFromView:v19 toView:v9 page:a3 animated:0];
  }
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
  int64_t pagingAxis = self->_pagingAxis;
  double numberOfPages = (double)self->_numberOfPages;
  if (pagingAxis) {
    double v6 = 1.0;
  }
  else {
    double v6 = (double)self->_numberOfPages;
  }
  double v7 = a3.width * v6;
  if (!pagingAxis) {
    double numberOfPages = 1.0;
  }
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v7, a3.height * numberOfPages);
  int64_t currentPage = self->_currentPage;
  [(WKUIPagingTransitionController *)self setCurrentPage:currentPage animated:0];
}

- (void)_setActualPageNumber:(int64_t)a3
{
  if ((a3 & 0x8000000000000000) == 0 && self->_numberOfPages > a3 && self->_actualPageNumber != a3)
  {
    self->_actualPageNumber = a3;
    id v5 = [(WKUIPagingTransitionController *)self delegate];
    [v5 pagingTransitionController:self didTransitionToPage:self->_actualPageNumber];

    [(WKUIPagingTransitionController *)self setCurrentPage:a3];
  }
}

- (CGRect)contentFrameForPage:(int64_t)a3
{
  [(UIScrollView *)self->_scrollView bounds];
  double v6 = v5;
  double v8 = v7;
  int64_t numberOfPages = self->_numberOfPages;
  double v10 = [(WKUIPagingTransitionController *)self scrollView];
  if (([v10 _shouldReverseLayoutDirection] & (self->_pagingAxis == 0)) != 0) {
    int64_t v11 = numberOfPages + ~a3;
  }
  else {
    int64_t v11 = a3;
  }

  double v12 = (double)v11;
  if (self->_pagingAxis)
  {
    double v13 = self->_pageSize.height * v12;
    double v14 = 0.0;
  }
  else
  {
    double v14 = self->_pageSize.width * v12;
    double v13 = 0.0;
  }
  if (self->_musicControlPageIndex == a3) {
    double v8 = v8 + self->_increaseMusicControlBottomOffset;
  }
  double v15 = v6;
  double v16 = v8;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (BOOL)_isValidPage:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0 && self->_numberOfPages > a3;
}

- (void)_prepareViewForPage:(unint64_t)a3 pagingDirection:(int64_t)a4
{
  if (-[WKUIPagingTransitionController _isValidPage:](self, "_isValidPage:"))
  {
    double v7 = [(WKUIPagingTransitionController *)self delegate];
    id v16 = [v7 pagingTransitionController:self viewForPage:a3];

    double v8 = [v16 superview];

    if (!v8) {
      [(UIScrollView *)self->_scrollView addSubview:v16];
    }
    [(WKUIPagingTransitionController *)self contentFrameForPage:a3];
    objc_msgSend(v16, "setFrame:");
    v9 = [(WKUIPagingTransitionController *)self delegate];
    [v9 pagingTransitionController:self willDisplayPageView:v16];

    if (a4 == 1) {
      unint64_t v10 = a3 - 1;
    }
    else {
      unint64_t v10 = a3 + 1;
    }
    if ([(WKUIPagingTransitionController *)self _isValidPage:v10])
    {
      int64_t v11 = [(WKUIPagingTransitionController *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        double v13 = [(WKUIPagingTransitionController *)self delegate];
        double v14 = [v13 pagingTransitionController:self viewForPage:v10];

        double v15 = [(WKUIPagingTransitionController *)self delegate];
        [v15 pagingTransitionController:self willTransitionFromView:v14 toView:v16];
      }
    }
  }
}

- (id)_pageViewForPage:(unint64_t)a3
{
  double v5 = [(WKUIPagingTransitionController *)self delegate];
  double v6 = [v5 pagingTransitionController:self viewForPage:a3];

  return v6;
}

- (int64_t)_currentPage
{
  [(UIScrollView *)self->_scrollView contentOffset];
  if (self->_pagingAxis) {
    double v3 = v4;
  }
  return [(WKUIPagingTransitionController *)self _pageForOffset:v3];
}

- (int64_t)_pageForOffset:(double)a3
{
  p_pageSize = &self->_pageSize;
  if (self->_pagingAxis) {
    p_pageSize = (CGSize *)&self->_pageSize.height;
  }
  uint64_t v5 = (uint64_t)(a3 / p_pageSize->width);
  int64_t numberOfPages = self->_numberOfPages;
  double v7 = [(WKUIPagingTransitionController *)self scrollView];
  if (([v7 _shouldReverseLayoutDirection] & (self->_pagingAxis == 0)) != 0) {
    int64_t v8 = numberOfPages + ~v5;
  }
  else {
    int64_t v8 = v5;
  }

  return v8;
}

- (void)resetCurrentView
{
  double v3 = [(WKUIPagingTransitionController *)self delegate];
  id v6 = [v3 pagingTransitionController:self viewForPage:self->_currentPage];

  double v4 = [(WKUIPagingTransitionController *)self delegate];
  [v4 pagingTransitionController:self willDisplayPageView:v6];

  currentPageView = self->_currentPageView;
  self->_currentPageView = 0;

  [(WKUIPagingTransitionController *)self setCurrentPage:self->_currentPage animated:0];
}

- (void)reanimateCurrentView
{
  int64_t v3 = [(WKUIPagingTransitionController *)self currentPage];
  [(WKUIPagingTransitionController *)self _endAnimatedTransitionToPage:v3];
}

- (void)_endAnimatedTransitionToPage:(int64_t)a3
{
  uint64_t v5 = self->_currentPageView;
  id v6 = [(WKUIPagingTransitionController *)self _pageViewForPage:a3];
  currentPageView = self->_currentPageView;
  self->_currentPageView = v6;

  id v8 = [(WKUIPagingTransitionController *)self delegate];
  [v8 pagingTransitionController:self didFinishTransitionFromView:v5 toView:self->_currentPageView page:a3 animated:1];
}

- (void)_cancelAnimatedTransitionFromPage:(int64_t)a3
{
  uint64_t v5 = [(WKUIPagingTransitionController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(WKUIPagingTransitionController *)self delegate];
    double v7 = [(WKUIPagingTransitionController *)self _pageViewForPage:a3];
    [v8 pagingTransitionController:self didCancelTransitionFromView:v7];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(WKUIPagingTransitionController *)self _handleScrollViewScrollEnd];
  }
}

- (void)_handleScrollViewScrollEnd
{
  int64_t v3 = [(WKUIPagingTransitionController *)self _currentPage];
  [(WKUIPagingTransitionController *)self _setActualPageNumber:v3];
  if (v3 == [(WKUIPagingTransitionController *)self currentPage])
  {
    [(WKUIPagingTransitionController *)self _cancelAnimatedTransitionFromPage:v3];
  }
  else
  {
    [(WKUIPagingTransitionController *)self _endAnimatedTransitionToPage:v3];
    [(WKUIPagingTransitionController *)self setCurrentPage:v3];
  }
  [(WKUIPagingTransitionController *)self _endTransitionAnimationForPage:v3 visible:1];
}

- (void)_endTransitionAnimationForPage:(int64_t)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(WKUIPagingTransitionController *)self _pageViewForPage:a3];
  if (self->_animationDelegateCache.supportsDidFinishTransitionForView)
  {
    char v6 = [(WKUIPagingTransitionController *)self animationDelegate];
    [v6 pagingTransitionController:self didFinishTransitionForView:v7 visible:v4];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  int64_t v4 = [(WKUIPagingTransitionController *)self _currentPage];
  [(WKUIPagingTransitionController *)self _endAnimatedTransitionToPage:v4];
}

- (void)scrollViewDidScroll:(id)a3
{
  int64_t v4 = [(WKUIPagingTransitionController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(WKUIPagingTransitionController *)self delegate];
    [v6 pagingTransitionControllerDidScroll:self];
  }
  [(UIScrollView *)self->_scrollView contentOffset];
  if (self->_pagingAxis) {
    double v9 = v8;
  }
  else {
    double v9 = v7;
  }
  int v10 = [(UIScrollView *)self->_scrollView _shouldReverseLayoutDirection];
  double v11 = v9;
  if (v10)
  {
    [(UIScrollView *)self->_scrollView contentSize];
    double v11 = v12 - v9 - self->_pageSize.width;
  }
  if (v11 != self->_lastContentOffset)
  {
    uint64_t v13 = [(WKUIPagingTransitionController *)self _pageForOffset:v9];
    uint64_t v14 = v13 & ~(v13 >> 63);
    int64_t numberOfPages = self->_numberOfPages;
    uint64_t v16 = numberOfPages - 1;
    if (v14 >= numberOfPages - 1) {
      uint64_t v17 = numberOfPages - 1;
    }
    else {
      uint64_t v17 = v13 & ~(v13 >> 63);
    }
    p_pageSize = &self->_pageSize;
    if (self->_pagingAxis) {
      p_pageSize = (CGSize *)&self->_pageSize.height;
    }
    BOOL v19 = fmod(v11, p_pageSize->width) != 0.0 && v16 > v14;
    BOOL v26 = !v19;
    uint64_t v20 = v10 & v19;
    if (v26) {
      NSUInteger v21 = 1;
    }
    else {
      NSUInteger v21 = 2;
    }
    NSUInteger v22 = v17 - v20;
    double v23 = v9 - self->_lastContentOffset;
    BOOL v24 = v23 > 0.0;
    NSRange lastVisibleRange = self->_lastVisibleRange;
    BOOL v26 = lastVisibleRange.location == v17 - v20 && lastVisibleRange.length == v21;
    if (!v26)
    {
      v48.NSUInteger location = v17 - v20;
      v48.NSUInteger length = v21;
      NSRange v27 = NSIntersectionRange(lastVisibleRange, v48);
      v49.NSUInteger location = v22;
      v49.NSUInteger length = v21;
      NSRange v28 = NSUnionRange(self->_lastVisibleRange, v49);
      if (v28.location < v28.location + v28.length)
      {
        NSUInteger location = v28.location;
        NSUInteger length = v28.length;
        do
        {
          if (v27.location > location || location - v27.location >= v27.length)
          {
            if (v22 > location || location - v22 >= v21) {
              [(WKUIPagingTransitionController *)self _endTransitionAnimationForPage:location visible:0];
            }
            else {
              [(WKUIPagingTransitionController *)self _prepareViewForPage:location pagingDirection:v24];
            }
          }
          ++location;
          --length;
        }
        while (length);
      }
    }
    if (v22 < v22 + v21)
    {
      NSUInteger v31 = v21;
      unint64_t v32 = v22;
      do
      {
        v33 = [(WKUIPagingTransitionController *)self _pageViewForPage:v32];
        v34 = [(WKUIPagingTransitionController *)self animationDelegate];

        if (v34)
        {
          if (self->_pagingAxis) {
            p_double height = (CGSize *)&self->_pageSize.height;
          }
          else {
            p_double height = &self->_pageSize;
          }
          double v36 = (v11 - (double)v32 * p_height->width) / p_height->width;
          if ((v32 || v36 > 0.0) && (v32 != self->_numberOfPages - 1 || v36 <= 0.0)) {
            double v37 = (1.0 - fabs(v36)) * 100.0;
          }
          else {
            double v37 = 100.0;
          }
          BOOL v38 = v36 >= 0.0;
          BOOL v39 = v36 < 0.0;
          if (v23 > 0.0) {
            BOOL v39 = 1;
          }
          else {
            BOOL v38 = 1;
          }
          uint64_t v40 = v38 & v39;
          if (self->_animationDelegateCache.supportsTransitioningView)
          {
            v41 = [(WKUIPagingTransitionController *)self animationDelegate];
            [v41 pagingTransitionController:self transitioningView:v33 percentageComplete:v40 isTransitioningOut:v37];
          }
          if (self->_animationDelegateCache.supportsTransitioningPage)
          {
            v42 = [(WKUIPagingTransitionController *)self animationDelegate];
            [v42 pagingTransitionController:self transitioningPage:v32 percentageComplete:v24 pagingDirection:v40 isTransitioningOut:v37];
          }
        }

        ++v32;
        --v31;
      }
      while (v31);
    }
    if (self->_pagingAxis) {
      v43 = (CGSize *)&self->_pageSize.height;
    }
    else {
      v43 = &self->_pageSize;
    }
    int64_t v44 = self->_numberOfPages;
    uint64_t v45 = (uint64_t)((v9 + v43->width * 0.5) / (v43->width * (double)v44) * (double)v44);
    v46 = [(WKUIPagingTransitionController *)self scrollView];
    if (([v46 _shouldReverseLayoutDirection] & (self->_pagingAxis == 0)) != 0) {
      uint64_t v47 = v44 + ~v45;
    }
    else {
      uint64_t v47 = v45;
    }

    if (self->_actualPageNumber != v47) {
      [(WKUIPagingTransitionController *)self _setActualPageNumber:v47];
    }
    self->_lastContentOffset = v11;
    self->_lastVisibleRange.NSUInteger location = v22;
    self->_lastVisibleRange.NSUInteger length = v21;
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (CGSize)pageSize
{
  double width = self->_pageSize.width;
  double height = self->_pageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
}

- (WKUIPagingTransitionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WKUIPagingTransitionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WKUIPagingTransitionControllerAnimationDelegate)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
  return (WKUIPagingTransitionControllerAnimationDelegate *)WeakRetained;
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (double)increaseMusicControlBottomOffset
{
  return self->_increaseMusicControlBottomOffset;
}

- (void)setIncreaseMusicControlBottomOffset:(double)a3
{
  self->_increaseMusicControlBottomOffset = a3;
}

- (int64_t)musicControlPageIndex
{
  return self->_musicControlPageIndex;
}

- (void)setMusicControlPageIndex:(int64_t)a3
{
  self->_musicControlPageIndex = a3;
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_currentPageView, 0);
}

@end