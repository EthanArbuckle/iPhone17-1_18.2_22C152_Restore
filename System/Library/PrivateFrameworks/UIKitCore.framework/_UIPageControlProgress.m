@interface _UIPageControlProgress
- (void)_pausePageProgress;
- (void)_progressVisibilityChanged:(BOOL)a3;
- (void)_resumePageProgress;
- (void)setDelegate:(id)a3;
@end

@implementation _UIPageControlProgress

- (void)setDelegate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIPageControlProgress;
  id v4 = a3;
  [(UIPageControlProgress *)&v8 setDelegate:v4];
  *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFD | v5;
  char v6 = objc_opt_respondsToSelector();

  if (v6) {
    char v7 = 4;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFB | v7;
}

- (void)_progressVisibilityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIPageControlProgress;
  -[UIPageControlProgress _progressVisibilityChanged:](&v5, sel__progressVisibilityChanged_);
  if (v3) {
    [(_UIPageControlProgress *)self _resumePageProgress];
  }
  else {
    [(_UIPageControlProgress *)self _pausePageProgress];
  }
}

- (void)_pausePageProgress
{
  if ((*(unsigned char *)&self->_delegateImplements & 2) != 0)
  {
    id v3 = [(UIPageControlProgress *)self delegate];
    [v3 _pageControlProgressDidPause:self];
  }
}

- (void)_resumePageProgress
{
  if ((*(unsigned char *)&self->_delegateImplements & 4) != 0)
  {
    id v3 = [(UIPageControlProgress *)self delegate];
    [v3 _pageControlProgressDidResume:self];
  }
}

@end