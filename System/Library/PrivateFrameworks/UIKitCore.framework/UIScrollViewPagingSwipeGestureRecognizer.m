@interface UIScrollViewPagingSwipeGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
- (UIScrollView)scrollView;
- (void)_processNewLocation:(CGPoint)a3;
- (void)_resetGestureRecognizer;
- (void)clearTimer;
- (void)dealloc;
- (void)enoughTimeElapsed:(id)a3;
- (void)setScrollView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIScrollViewPagingSwipeGestureRecognizer

- (void)setScrollView:(id)a3
{
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [(UIScrollViewPagingSwipeGestureRecognizer *)self scrollView];
  [(UIScrollViewPagingSwipeGestureRecognizer *)self clearTimer];
  if ((([v7 _pagingLeft] & 1) != 0
     || ([v7 _pagingRight] & 1) != 0
     || ([v7 _pagingUp] & 1) != 0
     || [v7 _pagingDown])
    && [v14 count] == 1
    && !self->_swipeFailureDelay)
  {
    v8 = [UIDelayedAction alloc];
    v9 = [(UIDelayedAction *)v8 initWithTarget:self action:sel_enoughTimeElapsed_ userInfo:0 delay:*MEMORY[0x1E4F1C4B0] mode:0.0833333333];
    swipeFailureDelay = self->_swipeFailureDelay;
    self->_swipeFailureDelay = v9;

    v11 = [v6 touchesForGestureRecognizer:self];
    [(UIGestureRecognizer *)self _centroidOfTouches:v11 excludingEnded:0];
    self->_startLocation.x = v12;
    self->_startLocation.y = v13;

    self->_lastLocation = self->_startLocation;
    self->_lastTime = CACurrentMediaTime();
  }
  else
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)_resetGestureRecognizer
{
  [(UIScrollViewPagingSwipeGestureRecognizer *)self clearTimer];
  self->_directionalFailureCount = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIScrollViewPagingSwipeGestureRecognizer;
  [(UIGestureRecognizer *)&v3 _resetGestureRecognizer];
}

- (void)clearTimer
{
  [(UIDelayedAction *)self->_swipeFailureDelay unschedule];
  swipeFailureDelay = self->_swipeFailureDelay;
  self->_swipeFailureDelay = 0;
}

- (void)enoughTimeElapsed:(id)a3
{
}

- (void)dealloc
{
  [(UIScrollViewPagingSwipeGestureRecognizer *)self clearTimer];
  v3.receiver = self;
  v3.super_class = (Class)UIScrollViewPagingSwipeGestureRecognizer;
  [(UIGestureRecognizer *)&v3 dealloc];
}

- (void)_processNewLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v20 = [(UIScrollViewPagingSwipeGestureRecognizer *)self scrollView];
  id v6 = [(UIGestureRecognizer *)self view];
  CFTimeInterval v7 = CACurrentMediaTime();
  v8 = [v6 window];
  objc_msgSend(v8, "_convertOffsetFromSceneReferenceSpace:", x - self->_lastLocation.x, y - self->_lastLocation.y);
  double v11 = [(UIView *)v6 _convertOffset:v9 fromView:v10];
  double v13 = v12;

  double v14 = self->_lastTime - v7;
  [v20 _horizontalVelocity];
  double v16 = fabs(v15);
  [v20 _verticalVelocity];
  if (v16 < 1.0 && fabs(v11 / v14 / 1000.0) >= v16) {
    goto LABEL_14;
  }
  double v18 = fabs(v17);
  if (v18 < 1.0 && fabs(v13 / v14 / 1000.0) >= v18) {
    goto LABEL_14;
  }
  if ([v20 _pagingLeft] && v11 < 0.0
    || [v20 _pagingRight] && v11 > 0.0
    || [v20 _pagingUp] && v13 < 0.0
    || [v20 _pagingDown] && v13 > 0.0)
  {
    int directionalFailureCount = self->_directionalFailureCount;
    if (directionalFailureCount >= 1)
    {
LABEL_14:
      [(UIGestureRecognizer *)self setState:5];
      goto LABEL_16;
    }
    self->_int directionalFailureCount = directionalFailureCount + 1;
    [(UIDelayedAction *)self->_swipeFailureDelay touch];
  }
  else
  {
    [(UIDelayedAction *)self->_swipeFailureDelay touch];
    self->_int directionalFailureCount = 0;
  }
LABEL_16:
  self->_lastLocation.double x = x;
  self->_lastLocation.double y = y;
  self->_lastTime = v7;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v5 = [a4 touchesForGestureRecognizer:self];
  [(UIGestureRecognizer *)self _centroidOfTouches:v5 excludingEnded:0];
  double v7 = v6;
  double v9 = v8;

  if (self->_lastLocation.x != v7 || self->_lastLocation.y != v9)
  {
    -[UIScrollViewPagingSwipeGestureRecognizer _processNewLocation:](self, "_processNewLocation:", v7, v9);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v21 = [(UIGestureRecognizer *)self view];
  double v6 = [v5 touchesForGestureRecognizer:self];

  [(UIGestureRecognizer *)self _centroidOfTouches:v6 excludingEnded:0];
  double v8 = v7;
  double v10 = v9;

  double v11 = [v21 window];
  objc_msgSend(v11, "_convertOffsetFromSceneReferenceSpace:", v8 - self->_startLocation.x, v10 - self->_startLocation.y);
  double v14 = [(UIView *)v21 _convertOffset:v12 fromView:v13];
  double v16 = v15;

  -[UIScrollViewPagingSwipeGestureRecognizer _processNewLocation:](self, "_processNewLocation:", v8, v10);
  if (!self->_swipeFailureDelay
    || [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateFailed
    || ((v18 = fabs(v16), double v17 = 50.0, fabs(v14) <= 50.0) ? (v19 = v18 <= 50.0) : (v19 = 0), v19))
  {
    uint64_t v20 = 5;
  }
  else
  {
    uint64_t v20 = 3;
  }
  -[UIGestureRecognizer setState:](self, "setState:", v20, v17, v18);
  [(UIScrollViewPagingSwipeGestureRecognizer *)self clearTimer];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  [(UIScrollViewPagingSwipeGestureRecognizer *)self clearTimer];
  [(UIGestureRecognizer *)self setState:5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeFailureDelay, 0);
  objc_destroyWeak((id *)&self->_scrollView);
}

@end