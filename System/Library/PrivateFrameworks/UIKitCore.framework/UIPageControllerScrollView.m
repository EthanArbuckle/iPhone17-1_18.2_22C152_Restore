@interface UIPageControllerScrollView
- (UIPageController)pageController;
- (unint64_t)_abuttedPagingEdges;
- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4;
- (void)_scrollViewDidEndDecelerating;
- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3;
- (void)_scrollViewWillBeginDragging;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPageController:(id)a3;
@end

@implementation UIPageControllerScrollView

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UIPageControllerScrollView;
  -[UIScrollView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11) {
    -[UIPageController _scrollView:boundsDidChangeToSize:](self->_pageController, "_scrollView:boundsDidChangeToSize:", self, width, height);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)UIPageControllerScrollView;
  -[UIScrollView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    pageController = self->_pageController;
    [(UIView *)self bounds];
    -[UIPageController _scrollView:boundsDidChangeToSize:](pageController, "_scrollView:boundsDidChangeToSize:", self, v14, v15);
  }
}

- (void)layoutSubviews
{
  if (![(UIWindow *)[(UIView *)self window] isRotating])
  {
    [(UIPageController *)self->_pageController _scrollViewDidScroll:self forceUpdate:0];
    v3.receiver = self;
    v3.super_class = (Class)UIPageControllerScrollView;
    [(UIScrollView *)&v3 layoutSubviews];
  }
}

- (void)_scrollViewWillBeginDragging
{
  [(UIPageController *)self->_pageController _scrollViewWillBeginPaging];
  v3.receiver = self;
  v3.super_class = (Class)UIPageControllerScrollView;
  [(UIScrollView *)&v3 _scrollViewWillBeginDragging];
}

- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    [(UIPageController *)self->_pageController _scrollViewDidScroll:self forceUpdate:1];
    [(UIPageController *)self->_pageController _scrollViewDidEndPaging];
  }
  v5.receiver = self;
  v5.super_class = (Class)UIPageControllerScrollView;
  [(UIScrollView *)&v5 _scrollViewDidEndDraggingWithDeceleration:v3];
}

- (void)_scrollViewDidEndDecelerating
{
  [(UIPageController *)self->_pageController _scrollViewDidScroll:self forceUpdate:1];
  [(UIPageController *)self->_pageController _scrollViewDidEndPaging];
  v3.receiver = self;
  v3.super_class = (Class)UIPageControllerScrollView;
  [(UIScrollView *)&v3 _scrollViewDidEndDecelerating];
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIPageController *)self->_pageController _scrollViewDidScroll:self forceUpdate:1];
  [(UIPageController *)self->_pageController _scrollViewDidEndPaging];
  v7.receiver = self;
  v7.super_class = (Class)UIPageControllerScrollView;
  [(UIScrollView *)&v7 _scrollViewAnimationEnded:a3 finished:v4];
}

- (unint64_t)_abuttedPagingEdges
{
  v16.receiver = self;
  v16.super_class = (Class)UIPageControllerScrollView;
  unint64_t v3 = [(UIScrollView *)&v16 _abuttedPagingEdges];
  if (![(UIScrollView *)self _isHorizontalBouncing])
  {
    [(UIPageController *)self->_pageController delegate];
    if (objc_opt_respondsToSelector())
    {
      int64_t v4 = [(UIPageController *)self->_pageController visibleIndex];
      [(UIScrollView *)self _pageDecelerationTarget];
      double v6 = v5;
      [(UIScrollView *)self contentOffset];
      double v8 = v7;
      if ([(UIScrollView *)self isDecelerating])
      {
        double v9 = v6 - v8;
        double v10 = fabs(v6 - v8);
        if (v10 >= 2.22044605e-16)
        {
          uint64_t v11 = *(void *)&v9;
          [(UIView *)self bounds];
          float v13 = v10 / v12;
          float v14 = ceilf(v13);
          if (v11 < 0) {
            float v14 = -v14;
          }
          int64_t v4 = (uint64_t)(float)(v14 + (float)v4);
        }
      }
      return v3 & 0xFFFFFFFFFFFFFFF5 | (2 * (v4 < 1)) | (8
                                                           * (v4 >= [(UIPageController *)self->_pageController pageCount]- 1));
    }
  }
  return v3;
}

- (UIPageController)pageController
{
  return self->_pageController;
}

- (void)setPageController:(id)a3
{
  self->_pageController = (UIPageController *)a3;
}

@end