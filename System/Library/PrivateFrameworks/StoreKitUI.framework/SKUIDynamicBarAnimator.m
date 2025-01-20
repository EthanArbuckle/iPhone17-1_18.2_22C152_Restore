@interface SKUIDynamicBarAnimator
- (BOOL)canTransitionToState:(int64_t)a3;
- (SKUIDynamicBarAnimator)init;
- (SKUIDynamicBarAnimatorDelegate)delegate;
- (double)_bottomBarOffsetForTopBarHeight:(double)a3;
- (double)_constrainTopBarHeight:(double)a3;
- (double)_topBarHeightForBottomBarOffset:(double)a3;
- (double)bottomBarOffset;
- (double)maximumBottomBarOffset;
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
- (void)beginDraggingWithOffset:(double)a3;
- (void)dealloc;
- (void)endDraggingWithTargetOffset:(double)a3 velocity:(double)a4;
- (void)init;
- (void)setBottomBarOffset:(double)a3 forState:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setMaximumBottomBarOffset:(double)a3;
- (void)setMinimumTopBarHeight:(double)a3;
- (void)setTopBarHeight:(double)a3 forState:(int64_t)a4;
- (void)updateDraggingWithOffset:(double)a3;
@end

@implementation SKUIDynamicBarAnimator

- (SKUIDynamicBarAnimator)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDynamicBarAnimator init]();
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIDynamicBarAnimator;
  result = [(SKUIDynamicBarAnimator *)&v4 init];
  if (result)
  {
    result->_state = 1;
    result->_inSteadyState = 1;
  }
  return result;
}

- (void)dealloc
{
}

- (void)_moveBarsWithDelta:(double)a3
{
  double unroundedTopBarHeight = self->_unroundedTopBarHeight;
  double v6 = self->_targetTopBarHeight - a3;
  self->_targetTopBarHeight = v6;
  double v7 = self->_topBarHeightForState[1] - self->_topBarHeightForState[0];
  double v8 = vabdd_f64(unroundedTopBarHeight, v6);
  self->_double unroundedTopBarHeight = unroundedTopBarHeight - exp(-(v8 * 3.0 / v7 * (v8 * 3.0 / v7))) * a3;

  [(SKUIDynamicBarAnimator *)self _updateOutputs];
}

- (void)attemptTransitionToState:(int64_t)a3 animated:(BOOL)a4
{
  if ((unint64_t)a3 >= 2) {
    -[SKUIDynamicBarAnimator attemptTransitionToState:animated:]();
  }
  if (-[SKUIDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:"))
  {
    self->_didHideOrShowBarsExplicitly = 1;
    self->_targetTopBarHeight = self->_topBarHeightForState[a3];
    if (!a4) {
      self->_double unroundedTopBarHeight = self->_topBarHeightForState[a3];
    }
    [(SKUIDynamicBarAnimator *)self _updateOutputs];
  }
}

- (void)_transitionToSteadyState
{
  if (self->_topBarHeight >= self->_topBarHeightForState[1] * 0.9
    || (v3 = [(SKUIDynamicBarAnimator *)self canTransitionToState:0], uint64_t v4 = 0, !v3))
  {
    uint64_t v4 = 1;
  }

  [(SKUIDynamicBarAnimator *)self attemptTransitionToState:v4 animated:1];
}

- (double)_bottomBarOffsetForTopBarHeight:(double)a3
{
  double v3 = (a3 - self->_topBarHeightForState[0]) / (self->_topBarHeightForState[1] - self->_topBarHeightForState[0]);
  return v3 * self->_bottomBarOffsetForState[1] + (1.0 - v3) * self->_bottomBarOffsetForState[0];
}

- (double)_topBarHeightForBottomBarOffset:(double)a3
{
  double v3 = (a3 - self->_bottomBarOffsetForState[0])
     / (self->_bottomBarOffsetForState[1] - self->_bottomBarOffsetForState[0]);
  return v3 * self->_topBarHeightForState[1] + (1.0 - v3) * self->_topBarHeightForState[0];
}

- (void)_updateOutputs
{
  [(SKUIDynamicBarAnimator *)self _constrainTopBarHeight:self->_unroundedTopBarHeight];
  self->_double unroundedTopBarHeight = v3;
  [(SKUIDynamicBarAnimator *)self _constrainTopBarHeight:self->_targetTopBarHeight];
  self->_targetTopBarHeight = v4;
  if (!self->_dragging && v4 != self->_topBarHeightForState[0]) {
    self->_targetTopBarHeight = self->_topBarHeightForState[1];
  }
  [(SKUIDynamicBarAnimator *)self _updateDisplayLink];
  double v5 = __40__SKUIDynamicBarAnimator__updateOutputs__block_invoke(self->_unroundedTopBarHeight);
  [(SKUIDynamicBarAnimator *)self _bottomBarOffsetForTopBarHeight:self->_unroundedTopBarHeight];
  double v7 = __40__SKUIDynamicBarAnimator__updateOutputs__block_invoke(v6);
  BOOL v8 = v7 == self->_bottomBarOffsetForState[0] && v5 == self->_topBarHeightForState[0];
  BOOL v9 = v7 == self->_bottomBarOffsetForState[1] && v5 == self->_topBarHeightForState[1];
  BOOL v10 = v8 || v9;
  BOOL v11 = (v8 || v9) && self->_displayLink == 0;
  [(SKUIDynamicBarAnimator *)self _setInSteadyState:v11];
  int64_t v12 = !v8;
  if (v5 != self->_topBarHeight || v7 != self->_bottomBarOffset || self->_state != v12)
  {
    self->_state = v12;
    self->_topBarHeight = v5;
    self->_bottomBarOffset = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dynamicBarAnimatorDidUpdate:self];

    if (!v10 && !self->_dragging && !self->_displayLink)
    {
      [(SKUIDynamicBarAnimator *)self _transitionToSteadyState];
    }
  }
}

double __40__SKUIDynamicBarAnimator__updateOutputs__block_invoke(double a1)
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  double v4 = v3;

  return round(v4 * a1) / v4;
}

- (void)_setInSteadyState:(BOOL)a3
{
  if (self->_inSteadyState != a3)
  {
    BOOL v3 = a3;
    self->_inSteadyState = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (v3)
    {
      if (objc_opt_respondsToSelector()) {
        [WeakRetained dynamicBarAnimatorWillEnterSteadyState:self];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [WeakRetained dynamicBarAnimatorWillLeaveSteadyState:self];
    }
  }
}

- (int64_t)targetState
{
  return self->_targetTopBarHeight != self->_topBarHeightForState[0];
}

- (BOOL)canTransitionToState:(int64_t)a3
{
  if ((unint64_t)a3 >= 2) {
    -[SKUIDynamicBarAnimator canTransitionToState:]();
  }
  BOOL v3 = (double *)(&self->super.isa + a3);
  [(SKUIDynamicBarAnimator *)self _constrainTopBarHeight:v3[1]];
  return v4 == v3[1];
}

- (double)_constrainTopBarHeight:(double)a3
{
  double minimumTopBarHeight = self->_minimumTopBarHeight;
  [(SKUIDynamicBarAnimator *)self _topBarHeightForBottomBarOffset:self->_maximumBottomBarOffset];
  if (minimumTopBarHeight >= result) {
    double result = minimumTopBarHeight;
  }
  if (result < self->_topBarHeightForState[0]) {
    double result = self->_topBarHeightForState[0];
  }
  if (result <= a3) {
    double result = a3;
  }
  if (result >= self->_topBarHeightForState[1]) {
    return self->_topBarHeightForState[1];
  }
  return result;
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

  [(SKUIDynamicBarAnimator *)self _updateOutputs];
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

      BOOL v8 = self->_displayLink;
      BOOL v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

      self->_lastUnroundedTopBarHeight = self->_unroundedTopBarHeight;
    }
  }
  else
  {
    BOOL v3 = self->_displayLink;
    if (v3)
    {
      [(CADisplayLink *)v3 invalidate];
      double v4 = self->_displayLink;
      self->_displayLink = 0;

      double topBarHeight = self->_topBarHeight;
      self->_targetTopBarHeight = topBarHeight;
      self->_double unroundedTopBarHeight = topBarHeight;
      self->_lastUnroundedTopBarHeight = topBarHeight;
      [(SKUIDynamicBarAnimator *)self _updateOutputs];
    }
  }
}

- (void)beginDraggingWithOffset:(double)a3
{
  self->_dragging = 1;
  *(_WORD *)&self->_didHideBarsByMoving = 0;
  self->_lastOffset = a3;
}

- (void)updateDraggingWithOffset:(double)a3
{
  if (self->_state == 1 && !self->_didHideOrShowBarsExplicitly)
  {
    double v5 = a3 - self->_lastOffset;
    double v6 = fmax(self->_topBarHeight - self->_topBarHeightForState[0] - v5, 0.0);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v8 = [WeakRetained dynamicBarAnimator:self canHideBarsByDraggingWithOffset:v6];

    if (v8)
    {
      [(SKUIDynamicBarAnimator *)self _moveBarsWithDelta:v5];
      if (!self->_state) {
        self->_didHideBarsByMoving = 1;
      }
    }
  }
  self->_lastOffset = a3;
}

- (void)endDraggingWithTargetOffset:(double)a3 velocity:(double)a4
{
  self->_dragging = 0;
  if (self->_didHideOrShowBarsExplicitly)
  {
    if (![(SKUIDynamicBarAnimator *)self targetState]
      && [(SKUIDynamicBarAnimator *)self canTransitionToState:0])
    {
      double v5 = self;
      uint64_t v6 = 0;
LABEL_7:
      [(SKUIDynamicBarAnimator *)v5 attemptTransitionToState:v6 animated:1];
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

  [(SKUIDynamicBarAnimator *)self _transitionToSteadyState];
}

- (void)setTopBarHeight:(double)a3 forState:(int64_t)a4
{
  if ((unint64_t)a4 >= 2) {
    -[SKUIDynamicBarAnimator setTopBarHeight:forState:]();
  }
  if (self->_topBarHeightForState[a4] != a3)
  {
    self->_topBarHeightForState[a4] = a3;
    if (self->_state == a4)
    {
      self->_targetTopBarHeight = a3;
      self->_double unroundedTopBarHeight = a3;
      [(SKUIDynamicBarAnimator *)self _updateOutputs];
    }
  }
}

- (void)setBottomBarOffset:(double)a3 forState:(int64_t)a4
{
  if ((unint64_t)a4 >= 2) {
    -[SKUIDynamicBarAnimator setBottomBarOffset:forState:]();
  }
  if (self->_bottomBarOffsetForState[a4] != a3)
  {
    self->_bottomBarOffsetForState[a4] = a3;
    if (self->_state == a4)
    {
      [(SKUIDynamicBarAnimator *)self _updateOutputs];
    }
  }
}

- (void)setMinimumTopBarHeight:(double)a3
{
  if (self->_minimumTopBarHeight != a3)
  {
    self->_double minimumTopBarHeight = a3;
    [(SKUIDynamicBarAnimator *)self _updateOutputs];
  }
}

- (void)setMaximumBottomBarOffset:(double)a3
{
  if (self->_maximumBottomBarOffset != a3)
  {
    self->_maximumBottomBarOffset = a3;
    [(SKUIDynamicBarAnimator *)self _updateOutputs];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (double)topBarHeight
{
  return self->_topBarHeight;
}

- (double)bottomBarOffset
{
  return self->_bottomBarOffset;
}

- (double)minimumTopBarHeight
{
  return self->_minimumTopBarHeight;
}

- (double)maximumBottomBarOffset
{
  return self->_maximumBottomBarOffset;
}

- (SKUIDynamicBarAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIDynamicBarAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDynamicBarAnimator init]";
}

- (void)attemptTransitionToState:animated:.cold.1()
{
}

- (void)canTransitionToState:.cold.1()
{
}

- (void)setTopBarHeight:forState:.cold.1()
{
}

- (void)setBottomBarOffset:forState:.cold.1()
{
}

@end