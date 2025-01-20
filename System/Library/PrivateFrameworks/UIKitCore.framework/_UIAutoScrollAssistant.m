@interface _UIAutoScrollAssistant
- (BOOL)_scrollContinuous;
- (BOOL)isActive;
- (BOOL)started;
- (CADisplayLink)displayLink;
- (CGPoint)point;
- (CGPoint)referenceContentOffsetForPoint;
- (UIEdgeInsets)touchInsets;
- (UIScrollView)scrollView;
- (_UIAutoScrollAssistant)initWithScrollView:(id)a3;
- (_UIAutoScrollBehavior)behavior;
- (double)lastTimestamp;
- (int64_t)mode;
- (unint64_t)allowedDirections;
- (void)_adjustPointToCurrentContentOffset;
- (void)_handleAutoScrollerWithContentOffset:(CGPoint)a3 direction:(unint64_t)a4;
- (void)autoScrollFromPoint:(CGPoint)a3;
- (void)displayLinkFired:(id)a3;
- (void)setAllowedDirections:(unint64_t)a3;
- (void)setBehavior:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setLastTimestamp:(double)a3;
- (void)setMode:(int64_t)a3;
- (void)setPoint:(CGPoint)a3 forContentOffset:(CGPoint)a4;
- (void)setReferenceContentOffsetForPoint:(CGPoint)a3;
- (void)setStarted:(BOOL)a3;
- (void)setTouchInsets:(UIEdgeInsets)a3;
- (void)stop;
@end

@implementation _UIAutoScrollAssistant

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (void)setAllowedDirections:(unint64_t)a3
{
  self->_allowedDirections = a3;
}

- (_UIAutoScrollAssistant)initWithScrollView:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIAutoScrollAssistant;
  v5 = [(_UIAutoScrollAssistant *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrollView, v4);
    uint64_t v7 = objc_opt_new();
    behavior = v6->_behavior;
    v6->_behavior = (_UIAutoScrollBehavior *)v7;

    v6->_allowedDirections = 30;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_scrollView);
    [WeakRetained contentOffset];
    v6->_referenceContentOffsetForPoint.x = v10;
    v6->_referenceContentOffsetForPoint.y = v11;

    v12 = [v4 traitCollection];
    uint64_t v13 = [v12 userInterfaceIdiom];
    if (v13 == 6 || v13 == 1) {
      double v15 = -50.0;
    }
    else {
      double v15 = -25.0;
    }

    v6->_touchInsets.double top = -50.0;
    v6->_touchInsets.double left = v15;
    v6->_touchInsets.double bottom = -50.0;
    v6->_touchInsets.double right = v15;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_scrollView);
}

- (void)autoScrollFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(_UIAutoScrollAssistant *)self point];
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  [WeakRetained contentOffset];
  -[_UIAutoScrollAssistant setPoint:forContentOffset:](self, "setPoint:forContentOffset:", x, y, v11, v12);

  if (!self->_displayLink)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_scrollView);
    v14 = [v13 _screen];
    double v15 = [v14 displayLinkWithTarget:self selector:sel_displayLinkFired_];

    CAFrameRateRange v21 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v15, "setPreferredFrameRateRange:", *(double *)&v21.minimum, *(double *)&v21.maximum, *(double *)&v21.preferred);
    [v15 setHighFrameRateReason:1048631];
    v16 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v15 addToRunLoop:v16 forMode:*MEMORY[0x1E4F1C4B0]];

    objc_super v17 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v15 addToRunLoop:v17 forMode:@"UITrackingRunLoopMode"];

    [(_UIAutoScrollAssistant *)self setDisplayLink:v15];
    _UIQOSManagedCommitsBegin(self, @"AutoScroll");
  }
  double v18 = sqrt((x - v7) * (x - v7) + (y - v9) * (y - v9));
  if ([(_UIAutoScrollAssistant *)self started] && v18 > 40.0)
  {
    [(_UIAutoScrollAssistant *)self setStarted:0];
  }
  else if (![(_UIAutoScrollAssistant *)self started] && v18 > 20.0)
  {
    double v19 = CACurrentMediaTime();
    [(_UIAutoScrollAssistant *)self setLastTimestamp:v19];
  }
}

- (void)stop
{
  v3 = [(_UIAutoScrollAssistant *)self displayLink];
  [v3 invalidate];

  [(_UIAutoScrollAssistant *)self setDisplayLink:0];
  [(_UIAutoScrollAssistant *)self setStarted:0];
  _UIQOSManagedCommitsEnd(self, @"AutoScroll");
}

- (BOOL)isActive
{
  v2 = [(_UIAutoScrollAssistant *)self displayLink];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_scrollContinuous
{
  int64_t v3 = [(_UIAutoScrollAssistant *)self mode];
  if (v3 == 2)
  {
    LOBYTE(v5) = 0;
  }
  else if (v3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    id v4 = [(_UIAutoScrollAssistant *)self scrollView];
    int v5 = [v4 isPagingEnabled] ^ 1;
  }
  return v5;
}

- (void)displayLinkFired:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIAutoScrollAssistant *)self _scrollContinuous];
  [(_UIAutoScrollAssistant *)self lastTimestamp];
  double v7 = v6 + 0.75;
  [v4 timestamp];
  double v9 = v8;
  [v4 timestamp];
  double v11 = v10;
  [(_UIAutoScrollAssistant *)self lastTimestamp];
  double v13 = v11 - v12;
  if ([(_UIAutoScrollAssistant *)self started] || v7 >= v9)
  {
    if (v7 >= v9 && (!v5 || ![(_UIAutoScrollAssistant *)self started])) {
      goto LABEL_11;
    }
  }
  else
  {
    [(_UIAutoScrollAssistant *)self setStarted:1];
    if (v5)
    {
      [v4 duration];
      double v13 = v14;
    }
  }
  double v15 = [(_UIAutoScrollAssistant *)self behavior];
  v16 = v15;
  if (v15) {
    [v15 offsetForAutoScroller:self timeDelta:v13];
  }

  -[_UIAutoScrollAssistant _handleAutoScrollerWithContentOffset:direction:](self, "_handleAutoScrollerWithContentOffset:direction:", 0, 0.0, 0.0);
  [v4 timestamp];
  -[_UIAutoScrollAssistant setLastTimestamp:](self, "setLastTimestamp:");
LABEL_11:
  [(_UIAutoScrollAssistant *)self lastTimestamp];
  if (v17 == 0.0)
  {
    [v4 timestamp];
    -[_UIAutoScrollAssistant setLastTimestamp:](self, "setLastTimestamp:");
  }
}

- (void)_handleAutoScrollerWithContentOffset:(CGPoint)a3 direction:(unint64_t)a4
{
  if (a4 == 1)
  {
    -[_UIAutoScrollAssistant setStarted:](self, "setStarted:", 0, a3.x, a3.y);
  }
  else
  {
    double y = a3.y;
    double x = a3.x;
    id v7 = [(_UIAutoScrollAssistant *)self scrollView];
    objc_msgSend(v7, "_autoScrollAssistantUpdateContentOffset:", x, y);
  }
}

- (void)_adjustPointToCurrentContentOffset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  [WeakRetained contentOffset];
  double v5 = v4;
  double v7 = v6;

  double x = self->_referenceContentOffsetForPoint.x;
  double y = self->_referenceContentOffsetForPoint.y;
  if (x != v5 || y != v7)
  {
    CGFloat v11 = v7 - y + self->_point.y;
    self->_point.double x = v5 - x + self->_point.x;
    self->_point.double y = v11;
    self->_referenceContentOffsetForPoint.double x = v5;
    self->_referenceContentOffsetForPoint.double y = v7;
  }
}

- (void)setPoint:(CGPoint)a3 forContentOffset:(CGPoint)a4
{
  self->_point = a3;
  self->_referenceContentOffsetForPoint = a4;
}

- (CGPoint)point
{
  [(_UIAutoScrollAssistant *)self _adjustPointToCurrentContentOffset];
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)allowedDirections
{
  return self->_allowedDirections;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (CGPoint)referenceContentOffsetForPoint
{
  double x = self->_referenceContentOffsetForPoint.x;
  double y = self->_referenceContentOffsetForPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setReferenceContentOffsetForPoint:(CGPoint)a3
{
  self->_referenceContentOffsetForPoint = a3;
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(double)a3
{
  self->_lastTimestamp = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (_UIAutoScrollBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
}

@end