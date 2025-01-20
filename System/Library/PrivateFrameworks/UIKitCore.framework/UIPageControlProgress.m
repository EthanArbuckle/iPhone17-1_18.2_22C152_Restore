@interface UIPageControlProgress
- (BOOL)isProgressVisible;
- (UIPageControl)pageControl;
- (UIPageControlProgress)init;
- (float)_initialProgressForPage:(int64_t)a3;
- (float)currentProgress;
- (id)delegate;
- (void)_didChangeCurrentPage;
- (void)_progressVisibilityChanged:(BOOL)a3;
- (void)setCurrentProgress:(float)currentProgress;
- (void)setDelegate:(id)delegate;
- (void)setPageControl:(id)a3;
@end

@implementation UIPageControlProgress

- (UIPageControlProgress)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIPageControlProgress;
  v2 = [(UIPageControlProgress *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UIPageControlProgress *)v2 _didChangeCurrentPage];
  }
  return v3;
}

- (void)setCurrentProgress:(float)currentProgress
{
  float v3 = fmax(fmin(currentProgress, 1.0), 0.0);
  if (self->_currentProgress != v3)
  {
    self->_currentProgress = v3;
    id v4 = [(UIPageControlProgress *)self pageControl];
    [v4 _updateCurrentPageProgress];
  }
}

- (void)setDelegate:(id)delegate
{
  p_delegate = &self->_delegate;
  id v5 = delegate;
  objc_storeWeak((id *)p_delegate, v5);
  *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  if (p_delegate) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFD | v6;
}

- (void)_progressVisibilityChanged:(BOOL)a3
{
  self->_progressVisible = a3;
  if ((*(unsigned char *)&self->_delegateImplements & 2) != 0)
  {
    id v4 = [(UIPageControlProgress *)self delegate];
    [v4 pageControlProgressVisibilityDidChange:self];
  }
}

- (void)_didChangeCurrentPage
{
  float v3 = [(UIPageControlProgress *)self pageControl];
  -[UIPageControlProgress _initialProgressForPage:](self, "_initialProgressForPage:", [v3 currentPage]);
  -[UIPageControlProgress setCurrentProgress:](self, "setCurrentProgress:");

  id v4 = [(UIPageControlProgress *)self pageControl];
  [v4 _updateCurrentPageProgress];
}

- (float)_initialProgressForPage:(int64_t)a3
{
  if ((*(unsigned char *)&self->_delegateImplements & 1) == 0) {
    return 0.0;
  }
  char v6 = [(UIPageControlProgress *)self delegate];
  [v6 pageControlProgress:self initialProgressForPage:a3];
  float v8 = v7;

  return v8;
}

- (void)setPageControl:(id)a3
{
  id obj = a3;
  p_pageControl = &self->_pageControl;
  id WeakRetained = objc_loadWeakRetained((id *)p_pageControl);

  char v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_pageControl, obj);
    char v6 = obj;
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (float)currentProgress
{
  return self->_currentProgress;
}

- (BOOL)isProgressVisible
{
  return self->_progressVisible;
}

- (UIPageControl)pageControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageControl);
  return (UIPageControl *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageControl);
  objc_destroyWeak((id *)&self->_delegate);
}

@end