@interface UIPageControlTimerProgress
- (BOOL)_canInstallTimer;
- (BOOL)_shouldAdvanceToPage:(int64_t)a3;
- (BOOL)enableTimer;
- (BOOL)isRunning;
- (BOOL)resetsToInitialPageAfterEnd;
- (CADisplayLink)displayLink;
- (NSMutableDictionary)customDurationByPage;
- (NSTimeInterval)durationForPage:(NSInteger)page;
- (NSTimeInterval)preferredDuration;
- (UIPageControlTimerProgress)initWithPreferredDuration:(NSTimeInterval)preferredDuration;
- (void)_didChangeCurrentPage;
- (void)_displayLinkTicked:(id)a3;
- (void)_progressVisibilityChanged:(BOOL)a3;
- (void)_updateTimer;
- (void)dealloc;
- (void)pauseTimer;
- (void)resumeTimer;
- (void)setCurrentProgress:(float)a3;
- (void)setCustomDurationByPage:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDisplayLink:(id)a3;
- (void)setDuration:(NSTimeInterval)duration forPage:(NSInteger)page;
- (void)setEnableTimer:(BOOL)a3;
- (void)setPageControl:(id)a3;
- (void)setPreferredDuration:(NSTimeInterval)preferredDuration;
- (void)setResetsToInitialPageAfterEnd:(BOOL)resetsToInitialPageAfterEnd;
@end

@implementation UIPageControlTimerProgress

- (UIPageControlTimerProgress)initWithPreferredDuration:(NSTimeInterval)preferredDuration
{
  if (preferredDuration <= 0.0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIPageControlProgress.m", 110, @"preferredDuration (%f) must be greater than zero.", *(void *)&preferredDuration);
  }
  v8.receiver = self;
  v8.super_class = (Class)UIPageControlTimerProgress;
  result = [(UIPageControlProgress *)&v8 init];
  if (result) {
    result->_preferredDuration = preferredDuration;
  }
  return result;
}

- (void)setPageControl:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPageControlTimerProgress;
  [(UIPageControlProgress *)&v4 setPageControl:a3];
  [(UIPageControlTimerProgress *)self _updateTimer];
}

- (void)setCurrentProgress:(float)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIPageControlTimerProgress;
  -[UIPageControlProgress setCurrentProgress:](&v6, sel_setCurrentProgress_);
  double currentDuration = self->_currentDuration;
  [(UIPageControlProgress *)self currentProgress];
  self->_currentDurationProgress = currentDuration * v5;
}

- (void)setDelegate:(id)delegate
{
  v7.receiver = self;
  v7.super_class = (Class)UIPageControlTimerProgress;
  id v4 = delegate;
  [(UIPageControlProgress *)&v7 setDelegate:v4];
  *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
  char v5 = objc_opt_respondsToSelector();

  if (v5) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFD | v6;
}

- (void)setPreferredDuration:(NSTimeInterval)preferredDuration
{
  if (preferredDuration <= 0.0)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIPageControlProgress.m", 138, @"preferredDuration (%f) must be greater than zero.", *(void *)&preferredDuration);
  }
  self->_preferredDuration = preferredDuration;
  [(UIPageControlTimerProgress *)self _updateTimer];
}

- (void)setDuration:(NSTimeInterval)duration forPage:(NSInteger)page
{
  customDurationByPage = self->_customDurationByPage;
  if (duration <= 0.0)
  {
    id v7 = [NSNumber numberWithInteger:page];
    -[NSMutableDictionary removeObjectForKey:](customDurationByPage, "removeObjectForKey:");
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    char v6 = [NSNumber numberWithInteger:page];
    [(NSMutableDictionary *)customDurationByPage setObject:v7 forKey:v6];
  }
}

- (NSTimeInterval)durationForPage:(NSInteger)page
{
  customDurationByPage = self->_customDurationByPage;
  char v5 = [NSNumber numberWithInteger:page];
  char v6 = [(NSMutableDictionary *)customDurationByPage objectForKey:v5];

  if (v6) {
    [v6 doubleValue];
  }
  else {
    [(UIPageControlTimerProgress *)self preferredDuration];
  }
  double v8 = v7;

  return v8;
}

- (void)_didChangeCurrentPage
{
  v3 = [(UIPageControlProgress *)self pageControl];
  -[UIPageControlTimerProgress durationForPage:](self, "durationForPage:", [v3 currentPage]);
  self->_double currentDuration = v4;

  v5.receiver = self;
  v5.super_class = (Class)UIPageControlTimerProgress;
  [(UIPageControlProgress *)&v5 _didChangeCurrentPage];
}

- (BOOL)isRunning
{
  return self->_displayLink != 0;
}

- (void)resumeTimer
{
  self->_enableTimer = 1;
  [(UIPageControlTimerProgress *)self _updateTimer];
}

- (void)pauseTimer
{
  self->_enableTimer = 0;
  [(UIPageControlTimerProgress *)self _updateTimer];
}

- (BOOL)_canInstallTimer
{
  v3 = [(UIPageControlProgress *)self pageControl];
  double v4 = [v3 window];
  BOOL v5 = v4
    && [(UIPageControlProgress *)self isProgressVisible]
    && [(UIPageControlTimerProgress *)self enableTimer];

  return v5;
}

- (void)_updateTimer
{
  BOOL v3 = [(UIPageControlTimerProgress *)self _canInstallTimer];
  double v4 = [(UIPageControlTimerProgress *)self displayLink];

  if (v3)
  {
    if (!v4)
    {
      BOOL v5 = [(UIPageControlProgress *)self pageControl];
      char v6 = [v5 _screen];
      id v12 = [v6 displayLinkWithTarget:self selector:sel__displayLinkTicked_];

      double v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v12 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

      double v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v12 addToRunLoop:v8 forMode:@"UITrackingRunLoopMode"];

      [(UIPageControlTimerProgress *)self setDisplayLink:v12];
      self->_previousTime = CFAbsoluteTimeGetCurrent();
      v9 = [(UIPageControlProgress *)self pageControl];
      -[UIPageControlTimerProgress durationForPage:](self, "durationForPage:", [v9 currentPage]);
      self->_double currentDuration = v10;
    }
  }
  else if (v4)
  {
    v11 = [(UIPageControlTimerProgress *)self displayLink];
    [v11 invalidate];

    [(UIPageControlTimerProgress *)self setDisplayLink:0];
  }
}

- (void)_displayLinkTicked:(id)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFAbsoluteTime v5 = Current - self->_previousTime;
  char v6 = [(UIPageControlProgress *)self pageControl];
  double v7 = v5 + self->_currentDurationProgress;
  id v10 = v6;
  if (v7 >= self->_currentDuration)
  {
    uint64_t v9 = [v6 currentPage] + 1;
    if (v9 == [v10 numberOfPages]
      && [(UIPageControlTimerProgress *)self resetsToInitialPageAfterEnd])
    {
      uint64_t v9 = 0;
    }
    if (v9 < [v10 numberOfPages]
      && [(UIPageControlTimerProgress *)self _shouldAdvanceToPage:v9])
    {
      [v10 _setPage:v9 interactionState:1];
    }
    else
    {
      [(UIPageControlTimerProgress *)self pauseTimer];
    }
  }
  else
  {
    self->_currentDurationProgress = v7;
    double v8 = v7 / self->_currentDuration;
    *(float *)&double v8 = v8;
    [(UIPageControlTimerProgress *)self setCurrentProgress:v8];
  }
  self->_previousTime = Current;
}

- (BOOL)_shouldAdvanceToPage:(int64_t)a3
{
  if ((*(unsigned char *)&self->_delegateImplements & 2) == 0) {
    return 1;
  }
  char v6 = [(UIPageControlProgress *)self delegate];
  LOBYTE(a3) = [v6 pageControlTimerProgress:self shouldAdvanceToPage:a3];

  return a3;
}

- (void)_progressVisibilityChanged:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPageControlTimerProgress;
  [(UIPageControlProgress *)&v4 _progressVisibilityChanged:a3];
  [(UIPageControlTimerProgress *)self _updateTimer];
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UIPageControlTimerProgress;
  [(UIPageControlTimerProgress *)&v3 dealloc];
}

- (BOOL)resetsToInitialPageAfterEnd
{
  return self->_resetsToInitialPageAfterEnd;
}

- (void)setResetsToInitialPageAfterEnd:(BOOL)resetsToInitialPageAfterEnd
{
  self->_resetsToInitialPageAfterEnd = resetsToInitialPageAfterEnd;
}

- (NSTimeInterval)preferredDuration
{
  return self->_preferredDuration;
}

- (NSMutableDictionary)customDurationByPage
{
  return self->_customDurationByPage;
}

- (void)setCustomDurationByPage:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (BOOL)enableTimer
{
  return self->_enableTimer;
}

- (void)setEnableTimer:(BOOL)a3
{
  self->_enableTimer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_customDurationByPage, 0);
}

@end