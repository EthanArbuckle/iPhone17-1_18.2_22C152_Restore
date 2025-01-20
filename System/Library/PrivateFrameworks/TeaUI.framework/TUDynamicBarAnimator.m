@interface TUDynamicBarAnimator
- (BOOL)canTransitionToState:(int64_t)a3;
- (TUDynamicBarAnimator)init;
- (TUDynamicBarAnimatorDelegate)delegate;
- (double)_bottomBarOffsetForTopBarHeight:(double)a3;
- (double)_constrainTopBarHeight:(double)a3;
- (double)bottomBarOffset;
- (double)maximumBottomBarOffset;
- (double)maximumTopBarHeight;
- (double)minimumBottomBarOffset;
- (double)minimumTopBarHeight;
- (double)topBarHeight;
- (int64_t)state;
- (int64_t)targetState;
- (void)_displayLinkFired:(id)a3;
- (void)_moveBarsWithDelta:(double)a3;
- (void)_setInSteadyState:(BOOL)a3;
- (void)_transitionToSteadyState;
- (void)_updateDisplayLink;
- (void)_updateOutputs;
- (void)attemptTransitionToState:(int64_t)a3 animated:(BOOL)a4;
- (void)beginScrollingWithOffset:(double)a3;
- (void)endScrollingWithTargetOffset:(double)a3 velocity:(double)a4;
- (void)setBottomBarOffset:(double)a3 forState:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setMaximumBottomBarOffset:(double)a3;
- (void)setMinimumTopBarHeight:(double)a3;
- (void)setTopBarHeight:(double)a3 forState:(int64_t)a4;
- (void)updateScrollingWithOffset:(double)a3;
@end

@implementation TUDynamicBarAnimator

- (int64_t)state
{
  return self->_state;
}

- (void)setTopBarHeight:(double)a3 forState:(int64_t)a4
{
  if (self->_topBarHeightForState[a4] != a3)
  {
    self->_topBarHeightForState[a4] = a3;
    if (self->_state == a4)
    {
      self->_targetTopBarHeight = a3;
      self->_unroundedTopBarHeight = a3;
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (TUDynamicBarAnimator)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUDynamicBarAnimator;
  v2 = [(TUDynamicBarAnimator *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 1;
    v2->_inSteadyState = 1;
    v4 = v2;
  }

  return v3;
}

- (void)attemptTransitionToState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[TUDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:"))
  {
    self->_didHideOrShowBarsExplicitly = 1;
    self->_targetTopBarHeight = self->_topBarHeightForState[a3];
    if (!v4 || ([MEMORY[0x1E4FB1EB0] areAnimationsEnabled] & 1) == 0) {
      self->_unroundedTopBarHeight = self->_topBarHeightForState[a3];
    }
    [(TUDynamicBarAnimator *)self _updateOutputs];
  }
}

- (BOOL)canTransitionToState:(int64_t)a3
{
  v3 = (double *)(&self->super.isa + a3);
  [(TUDynamicBarAnimator *)self _constrainTopBarHeight:v3[1]];
  return v4 == v3[1];
}

- (void)_updateOutputs
{
  [(TUDynamicBarAnimator *)self _constrainTopBarHeight:self->_unroundedTopBarHeight];
  self->_float unroundedTopBarHeight = v3;
  [(TUDynamicBarAnimator *)self _constrainTopBarHeight:self->_targetTopBarHeight];
  self->_targetTopBarHeight = v4;
  if (!self->_dragging && v4 != self->_topBarHeightForState[0]) {
    self->_targetTopBarHeight = self->_topBarHeightForState[1];
  }
  [(TUDynamicBarAnimator *)self _updateDisplayLink];
  float unroundedTopBarHeight = self->_unroundedTopBarHeight;
  double v6 = (double)(uint64_t)llroundf(unroundedTopBarHeight);
  -[TUDynamicBarAnimator _bottomBarOffsetForTopBarHeight:](self, "_bottomBarOffsetForTopBarHeight:");
  *(float *)&double v7 = v7;
  double v8 = (double)(uint64_t)llroundf(*(float *)&v7);
  BOOL v9 = vabdd_f64(v8, self->_bottomBarOffsetForState[0]) < 0.001 && vabdd_f64(v6, self->_topBarHeightForState[0]) < 0.001;
  BOOL v10 = vabdd_f64(v8, self->_bottomBarOffsetForState[1]) < 0.001
     && vabdd_f64(v6, self->_topBarHeightForState[1]) < 0.001;
  BOOL v11 = v9 || v10;
  BOOL v12 = (v9 || v10) && self->_displayLink == 0;
  [(TUDynamicBarAnimator *)self _setInSteadyState:v12];
  int64_t v13 = !v9;
  if (self->_topBarHeight != v6 || self->_bottomBarOffset != v8 || self->_state != v13)
  {
    self->_state = v13;
    self->_topBarHeight = v6;
    self->_bottomBarOffset = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dynamicBarAnimatorOutputsDidChange:self];

    if (!v11 && !self->_dragging && !self->_displayLink)
    {
      [(TUDynamicBarAnimator *)self _transitionToSteadyState];
    }
  }
}

- (double)_constrainTopBarHeight:(double)a3
{
  return fmin(fmax(a3, self->_topBarHeightForState[0]), self->_topBarHeightForState[1]);
}

- (void)_updateDisplayLink
{
  if (vabdd_f64(self->_topBarHeight, self->_targetTopBarHeight) >= 0.1
    || vabdd_f64(self->_lastUnroundedTopBarHeight, self->_unroundedTopBarHeight) >= 10.0)
  {
    if (!self->_displayLink)
    {
      double v6 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFired_];
      displayLink = self->_displayLink;
      self->_displayLink = v6;

      double v8 = self->_displayLink;
      BOOL v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

      self->_lastUnroundedTopBarHeight = self->_unroundedTopBarHeight;
    }
  }
  else
  {
    double v3 = self->_displayLink;
    if (v3)
    {
      [(CADisplayLink *)v3 invalidate];
      double v4 = self->_displayLink;
      self->_displayLink = 0;

      double topBarHeight = self->_topBarHeight;
      self->_targetTopBarHeight = topBarHeight;
      self->_float unroundedTopBarHeight = topBarHeight;
      self->_lastUnroundedTopBarHeight = topBarHeight;
      [(TUDynamicBarAnimator *)self _updateOutputs];
    }
  }
}

- (void)_setInSteadyState:(BOOL)a3
{
  if (((!self->_inSteadyState ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_inSteadyState = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = WeakRetained;
    if (v3) {
      [WeakRetained dynamicBarAnimatorWillEnterSteadyState:self];
    }
    else {
      [WeakRetained dynamicBarAnimatorWillLeaveSteadyState:self];
    }
  }
}

- (double)_bottomBarOffsetForTopBarHeight:(double)a3
{
  double v3 = self->_topBarHeightForState[0];
  double v4 = a3 - v3;
  double v5 = self->_topBarHeightForState[1] - v3;
  BOOL v6 = v5 == 0.0 && v4 == 0.0;
  double v7 = v4 / v5;
  if (v6) {
    double v7 = 1.0;
  }
  return self->_bottomBarOffsetForState[1] * v7 + (1.0 - v7) * self->_bottomBarOffsetForState[0];
}

- (void)_moveBarsWithDelta:(double)a3
{
  double unroundedTopBarHeight = self->_unroundedTopBarHeight;
  double v6 = self->_targetTopBarHeight - a3;
  self->_targetTopBarHeight = v6;
  double v7 = self->_topBarHeightForState[1] - self->_topBarHeightForState[0];
  double v8 = vabdd_f64(unroundedTopBarHeight, v6);
  self->_double unroundedTopBarHeight = unroundedTopBarHeight - exp(-(v8 * 3.0 / v7 * (v8 * 3.0 / v7))) * a3;
  [(TUDynamicBarAnimator *)self _updateOutputs];
}

- (void)_transitionToSteadyState
{
  if (self->_topBarHeight >= self->_topBarHeightForState[1] * 0.9
    || (v3 = [(TUDynamicBarAnimator *)self canTransitionToState:0], uint64_t v4 = 0, !v3))
  {
    uint64_t v4 = 1;
  }
  [(TUDynamicBarAnimator *)self attemptTransitionToState:v4 animated:1];
}

- (int64_t)targetState
{
  return self->_targetTopBarHeight != self->_topBarHeightForState[0];
}

- (void)_displayLinkFired:(id)a3
{
  [a3 duration];
  double unroundedTopBarHeight = self->_unroundedTopBarHeight;
  self->_double unroundedTopBarHeight = unroundedTopBarHeight
                               - ((self->_lastUnroundedTopBarHeight - unroundedTopBarHeight) / v5
                                + ((self->_lastUnroundedTopBarHeight - unroundedTopBarHeight) / v5 * -50.0
                                 + (unroundedTopBarHeight - self->_targetTopBarHeight) * 900.0)
                                * v5)
                               * v5;
  self->_lastUnroundedTopBarHeight = unroundedTopBarHeight;
  [(TUDynamicBarAnimator *)self _updateOutputs];
}

- (void)beginScrollingWithOffset:(double)a3
{
  self->_dragging = 1;
  *(_WORD *)&self->_didHideBarsByMoving = 0;
  self->_lastOffset = a3;
}

- (void)updateScrollingWithOffset:(double)a3
{
  if (!self->_didHideOrShowBarsExplicitly)
  {
    double v5 = a3 - self->_lastOffset;
    double v6 = fmax(self->_topBarHeight - self->_topBarHeightForState[0] - v5, 0.0);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v8 = [WeakRetained dynamicBarAnimator:self canHideBarsByDraggingWithOffset:v6];

    if (v8)
    {
      [(TUDynamicBarAnimator *)self _moveBarsWithDelta:v5];
      if (!self->_state) {
        self->_didHideBarsByMoving = 1;
      }
    }
  }
  self->_lastOffset = a3;
}

- (void)endScrollingWithTargetOffset:(double)a3 velocity:(double)a4
{
  self->_dragging = 0;
  if (self->_didHideOrShowBarsExplicitly)
  {
    if (![(TUDynamicBarAnimator *)self targetState]
      && [(TUDynamicBarAnimator *)self canTransitionToState:0])
    {
      double v5 = self;
      uint64_t v6 = 0;
LABEL_7:
      [(TUDynamicBarAnimator *)v5 attemptTransitionToState:v6 animated:1];
      return;
    }
LABEL_6:
    double v5 = self;
    uint64_t v6 = 1;
    goto LABEL_7;
  }
  if (a4 < -250.0) {
    goto LABEL_6;
  }
  [(TUDynamicBarAnimator *)self _transitionToSteadyState];
}

- (double)maximumTopBarHeight
{
  return self->_topBarHeightForState[1];
}

- (double)minimumTopBarHeight
{
  return self->_topBarHeightForState[0];
}

- (double)minimumBottomBarOffset
{
  return self->_bottomBarOffsetForState[0];
}

- (void)setBottomBarOffset:(double)a3 forState:(int64_t)a4
{
  if (self->_bottomBarOffsetForState[a4] != a3)
  {
    self->_bottomBarOffsetForState[a4] = a3;
    if (self->_state == a4) {
      [(TUDynamicBarAnimator *)self _updateOutputs];
    }
  }
}

- (void)setMaximumBottomBarOffset:(double)a3
{
  if (self->_maximumBottomBarOffset != a3)
  {
    self->_maximumBottomBarOffset = a3;
    [(TUDynamicBarAnimator *)self _updateOutputs];
  }
}

- (double)topBarHeight
{
  return self->_topBarHeight;
}

- (double)bottomBarOffset
{
  return self->_bottomBarOffset;
}

- (void)setMinimumTopBarHeight:(double)a3
{
  self->_minimumTopBarHeight = a3;
}

- (double)maximumBottomBarOffset
{
  return self->_maximumBottomBarOffset;
}

- (TUDynamicBarAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUDynamicBarAnimatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end