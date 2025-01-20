@interface _UIPageControlDurationProgress
- (BOOL)_shouldAdvanceToPage:(int64_t)a3;
- (_UIPageControlDurationProgress)initWithPageDuration:(double)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UIPageControlDurationProgress

- (_UIPageControlDurationProgress)initWithPageDuration:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPageControlDurationProgress;
  return [(UIPageControlTimerProgress *)&v4 initWithPreferredDuration:a3];
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPageControlDurationProgress;
  id v4 = a3;
  [(UIPageControlTimerProgress *)&v6 setDelegate:v4];
  char v5 = objc_opt_respondsToSelector();

  *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFE | v5 & 1;
}

- (BOOL)_shouldAdvanceToPage:(int64_t)a3
{
  if (*(unsigned char *)&self->_delegateImplements)
  {
    objc_super v6 = [(UIPageControlProgress *)self delegate];
    char v7 = [v6 _pageControlDurationProgress:self shouldAdvanceToPage:a3];

    return v7;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIPageControlDurationProgress;
    return [(UIPageControlTimerProgress *)&v8 _shouldAdvanceToPage:a3];
  }
}

@end