@interface _UIScrollViewScrollingAnimator
- (BOOL)_handlePressIfInterested:(id)a3;
- (BOOL)_keyboardHandlesPressEventForKeyInput:(id)a3;
- (BOOL)finishHandlingPressEvent:(id)a3;
- (BOOL)handlePressEventIfInterested:(id)a3;
- (BOOL)isHandlingPressEvent:(id)a3;
- (BOOL)isInterestedInPress:(id)a3;
- (BOOL)isScrollingInteractively;
- (CGPoint)_interactiveScrollVelocity;
- (UIScrollView)scrollView;
- (_UIScrollViewScrollingAnimator)initWithScrollView:(id)a3;
- (double)_distanceForIncrement:(unint64_t)a3 inDirection:(unint64_t)a4;
- (id)_scrollStateForDirection:(unint64_t)a3 granularity:(unint64_t)a4;
- (id)_scrollStateForPress:(id)a3;
- (unint64_t)_rubberbandableDirections;
- (unint64_t)_scrollableDirectionsFromOffset:(CGPoint)a3;
- (void)_beginInteractiveAnimationForScrollState:(id)a3;
- (void)_displayLinkFired:(id)a3;
- (void)_scrollToContentOffset:(CGPoint)a3;
- (void)_scrollWithScrollToExtentAnimationTo:(CGPoint)a3;
- (void)_startDisplayLinkIfNeeded;
- (void)_stopAnimatedScroll;
- (void)_stopDisplayLink;
- (void)animateScrollInDirection:(unint64_t)a3 withGranularity:(unint64_t)a4;
- (void)cancelInteractiveScroll;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _UIScrollViewScrollingAnimator

- (_UIScrollViewScrollingAnimator)initWithScrollView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIScrollViewScrollingAnimator;
  v5 = [(_UIScrollViewScrollingAnimator *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrollView, v4);
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    trackedPressEvents = v6->_trackedPressEvents;
    v6->_trackedPressEvents = (NSHashTable *)v7;
  }
  return v6;
}

- (void)dealloc
{
  [(_UIScrollViewScrollingAnimator *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewScrollingAnimator;
  [(_UIScrollViewScrollingAnimator *)&v3 dealloc];
}

- (BOOL)isInterestedInPress:(id)a3
{
  return scrollingKeyForPress(a3) != 0;
}

- (BOOL)handlePressEventIfInterested:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIScrollViewScrollingAnimator *)self _keyboardHandlesPressEventForKeyInput:v4])
  {
    goto LABEL_12;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(v4, "allPresses", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v6)
  {

LABEL_12:
    BOOL v11 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  int v8 = 0;
  uint64_t v9 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      v8 |= [(_UIScrollViewScrollingAnimator *)self _handlePressIfInterested:*(void *)(*((void *)&v13 + 1) + 8 * i)];
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v7);

  if ((v8 & 1) == 0) {
    goto LABEL_12;
  }
  [(NSHashTable *)self->_trackedPressEvents addObject:v4];
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)isHandlingPressEvent:(id)a3
{
  return [(NSHashTable *)self->_trackedPressEvents containsObject:a3];
}

- (BOOL)finishHandlingPressEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isScrollingInteractively
    && [(NSHashTable *)self->_trackedPressEvents containsObject:v4])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = objc_msgSend(v4, "allPresses", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_super v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          BOOL v11 = [(_UIScrollViewScrollingAnimator *)self _scrollStateForPress:v10];
          if (!v11
            || [v10 phase] == 3
            || [v10 phase] == 4
            || ([v10 key],
                v12 = objc_claimAutoreleasedReturnValue(),
                int v13 = [v12 modifierFlags],
                v12,
                (v13 & 0x100000) != 0))
          {
            [(_UIScrollViewScrollingAnimator *)self _stopAnimatedScroll];
            self->_isScrollingInteractively = 0;

            goto LABEL_17;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    [(NSHashTable *)self->_trackedPressEvents removeObject:v4];
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)animateScrollInDirection:(unint64_t)a3 withGranularity:(unint64_t)a4
{
  [(_UIScrollViewScrollingAnimator *)self cancelInteractiveScroll];
  id v7 = [(_UIScrollViewScrollingAnimator *)self _scrollStateForDirection:a3 granularity:a4];
  [(_UIScrollViewScrollingAnimator *)self _beginInteractiveAnimationForScrollState:v7];
  [(_UIScrollViewScrollingAnimator *)self _stopAnimatedScroll];
}

- (void)cancelInteractiveScroll
{
  if (!self->_isAdjustingScrollViewOffset)
  {
    self->_velocity = (CGPoint)*MEMORY[0x1E4F1DAD8];
    [(_UIScrollViewScrollingAnimator *)self _stopAnimatedScroll];
    [(_UIScrollViewScrollingAnimator *)self _stopDisplayLink];
  }
}

- (void)invalidate
{
  [(_UIScrollViewScrollingAnimator *)self _stopAnimatedScroll];
  [(_UIScrollViewScrollingAnimator *)self _stopDisplayLink];
  objc_storeWeak((id *)&self->_scrollView, 0);
}

- (void)_beginInteractiveAnimationForScrollState:(id)a3
{
  id v23 = a3;
  objc_storeStrong((id *)&self->_currentScroll, a3);
  if ([v23 granularity] == 3)
  {
    [(_UIScrollViewScrollingAnimator *)self cancelInteractiveScroll];
    [v23 offset];
    CGFloat v6 = self->_modelPosition.x + v5;
    double v8 = v7 + self->_modelPosition.y;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(WeakRetained, "_adjustedContentOffsetForContentOffset:", v6, v8);
    double v11 = v10;
    double v13 = v12;

    -[_UIScrollViewScrollingAnimator _scrollWithScrollToExtentAnimationTo:](self, "_scrollWithScrollToExtentAnimationTo:", v11, v13);
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)&self->_scrollView);
    [v14 contentOffset];
    self->_modelPosition.x = v15;
    self->_modelPosition.y = v16;

    [(_UIScrollViewScrollingAnimator *)self _interactiveScrollVelocity];
    CGFloat v19 = v18 + self->_velocity.y;
    self->_velocity.x = self->_velocity.x + v17;
    self->_velocity.y = v19;
    [(_UIScrollViewScrollingAnimatorState *)self->_currentScroll offset];
    CGFloat v22 = v21 + self->_modelPosition.y;
    self->_idealPositionForMinimumTravel.x = self->_modelPosition.x + v20;
    self->_idealPositionForMinimumTravel.y = v22;
    [(_UIScrollViewScrollingAnimator *)self _startDisplayLinkIfNeeded];
  }
}

- (BOOL)_keyboardHandlesPressEventForKeyInput:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  if (v4 && [v3 type] == 4)
  {
    if ([v4 delegateRequiresKeyEvents])
    {
      BOOL v5 = 1;
    }
    else
    {
      id v7 = v3;
      if ([v4 _isKeyCommand:v7])
      {
        BOOL v5 = 1;
      }
      else
      {
        double v8 = [v7 _unmodifiedInput];
        uint64_t v9 = [v8 length];

        if (v9 == 1)
        {
          double v10 = [v4 inputDelegateManager];
          double v11 = [v10 keyInputDelegate];
          BOOL v5 = v11 != 0;
        }
        else
        {
          BOOL v5 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_handlePressIfInterested:(id)a3
{
  id v4 = a3;
  if (![v4 phase])
  {
    CGFloat v6 = [(_UIScrollViewScrollingAnimator *)self _scrollStateForPress:v4];
    if (v6)
    {
      if (self->_isScrollingInteractively)
      {
        BOOL v5 = 1;
LABEL_12:

        goto LABEL_13;
      }
      unint64_t v7 = [(_UIScrollViewScrollingAnimator *)self _rubberbandableDirections];
      uint64_t v8 = [v6 direction];
      if ((unint64_t)(v8 - 1) > 3) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = qword_186B98E88[v8 - 1];
      }
      if ((v9 & v7) != 0)
      {
        BOOL v5 = 1;
        self->_isScrollingInteractively = 1;
        [(_UIScrollViewScrollingAnimator *)self _beginInteractiveAnimationForScrollState:v6];
        goto LABEL_12;
      }
    }
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = 0;
LABEL_13:

  return v5;
}

- (id)_scrollStateForDirection:(unint64_t)a3 granularity:(unint64_t)a4
{
  [(_UIScrollViewScrollingAnimator *)self _distanceForIncrement:a4 inDirection:a3];
  double v7 = v6;
  uint64_t v8 = (double *)((char *)&unk_186B98DD8 + 8 * a3 - 8);
  if (a3 - 1 >= 4) {
    uint64_t v9 = (double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else {
    uint64_t v9 = (double *)((char *)&unk_186B98DF8 + 8 * a3 - 8);
  }
  if (a3 - 1 >= 4) {
    uint64_t v8 = (double *)MEMORY[0x1E4F1DAD8];
  }
  double v10 = *v8;
  double v11 = *v9;
  double v12 = objc_alloc_init(_UIScrollViewScrollingAnimatorState);
  -[_UIScrollViewScrollingAnimatorState setOffset:](v12, "setOffset:", v7 * v10, v7 * v11);
  [(_UIScrollViewScrollingAnimatorState *)v12 offset];
  -[_UIScrollViewScrollingAnimatorState setMaximumVelocity:](v12, "setMaximumVelocity:", v13 * 25.0, v14 * 25.0);
  [(_UIScrollViewScrollingAnimatorState *)v12 setDirection:a3];
  [(_UIScrollViewScrollingAnimatorState *)v12 setGranularity:a4];
  [(_UIScrollViewScrollingAnimatorState *)v12 maximumVelocity];
  -[_UIScrollViewScrollingAnimatorState setForce:](v12, "setForce:");
  return v12;
}

- (id)_scrollStateForPress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = scrollingKeyForPress(v4);
  if (v5
    && (v6 = v5, unsigned int v7 = [v4 modifierFlags], ((v7 >> 17) & 1) + ((v7 >> 19) & 1) + ((v7 >> 20) & 1) <= 1)
    && (v6 > 6 ? (LODWORD(v8) = -1) : (uint64_t v8 = qword_186B98E18[v6 - 1]), (v7 & v8 & 0x1A0000) == 0))
  {
    uint64_t v11 = 2;
    switch(v6)
    {
      case 1uLL:
      case 2uLL:
        if ((*(void *)&v7 & 0x80000) != 0) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = 1;
        }
        break;
      case 3uLL:
      case 4uLL:
        uint64_t v12 = 3;
        if ((*(void *)&v7 & 0x100000) == 0) {
          uint64_t v12 = 1;
        }
        if ((*(void *)&v7 & 0x80000) != 0) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = v12;
        }
        break;
      case 5uLL:
      case 6uLL:
        break;
      case 7uLL:
      case 8uLL:
        uint64_t v11 = 3;
        break;
      default:
        goto LABEL_7;
    }
    uint64_t v9 = [(_UIScrollViewScrollingAnimator *)self _scrollStateForDirection:qword_186B98E48[v6 - 1] granularity:v11];
  }
  else
  {
LABEL_7:
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_stopAnimatedScroll
{
  currentScroll = self->_currentScroll;
  if (currentScroll)
  {
    double x = self->_velocity.x;
    double y = self->_velocity.y;
    double v6 = sqrt(x * x * 0.00917431193);
    if (x >= 0.0) {
      double v7 = v6;
    }
    else {
      double v7 = -v6;
    }
    double v8 = sqrt(y * y * 0.00917431193);
    if (y >= 0.0) {
      double v9 = v8;
    }
    else {
      double v9 = -v8;
    }
    double v10 = self->_modelPosition.x;
    double v11 = self->_modelPosition.y;
    uint64_t v12 = [(_UIScrollViewScrollingAnimatorState *)currentScroll direction];
    double v13 = v10 + v7;
    double v14 = v11 + v9;
    double v15 = self->_idealPositionForMinimumTravel.x;
    double v16 = self->_idealPositionForMinimumTravel.y;
    switch(v12)
    {
      case 1:
        if (v14 >= v16) {
          double v14 = self->_idealPositionForMinimumTravel.y;
        }
        break;
      case 2:
        if (v14 < v16) {
          double v14 = self->_idealPositionForMinimumTravel.y;
        }
        break;
      case 3:
        if (v13 >= v15) {
          double v13 = self->_idealPositionForMinimumTravel.x;
        }
        break;
      case 4:
        if (v13 < v15) {
          double v13 = self->_idealPositionForMinimumTravel.x;
        }
        break;
      default:
        double v13 = *MEMORY[0x1E4F1DAD8];
        double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        break;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(WeakRetained, "_adjustedContentOffsetForContentOffset:", v13, v14);
    self->_idealPosition.double x = v18;
    self->_idealPosition.double y = v19;

    double v20 = self->_currentScroll;
    self->_currentScroll = 0;
  }
}

- (void)_startDisplayLinkIfNeeded
{
  if (!self->_displayLink)
  {
    p_scrollView = &self->_scrollView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    uint64_t v5 = [WeakRetained window];

    if (v5)
    {
      double v6 = objc_loadWeakRetained((id *)p_scrollView);
      double v7 = [v6 window];
      double v8 = [v7 screen];
      double v9 = [v8 displayLinkWithTarget:self selector:sel__displayLinkFired_];
      displayLink = self->_displayLink;
      self->_displayLink = v9;
    }
    else
    {
      double v11 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__smoothScrollDisplayLink_];
      double v6 = self->_displayLink;
      self->_displayLink = v11;
    }

    uint64_t v12 = self->_displayLink;
    id v13 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v12 addToRunLoop:v13 forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)_stopDisplayLink
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)_displayLinkFired:(id)a3
{
  id v41 = a3;
  id v4 = (CGPoint *)MEMORY[0x1E4F1DAD8];
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (!self->_currentScroll)
  {
    double v11 = 1.0;
    double v12 = 1.0;
LABEL_21:
    p_idealPosition = &self->_idealPosition;
    p_double y = &self->_idealPosition.y;
    goto LABEL_22;
  }
  p_double y = &self->_modelPosition.y;
  unint64_t v8 = -[_UIScrollViewScrollingAnimator _scrollableDirectionsFromOffset:](self, "_scrollableDirectionsFromOffset:", self->_modelPosition.x, self->_modelPosition.y);
  unint64_t v9 = [(_UIScrollViewScrollingAnimatorState *)self->_currentScroll direction] - 1;
  if (v9 > 3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_186B98E88[v9];
  }
  if ((v10 & v8) != 0)
  {
    if (v9 <= 3)
    {
      double v5 = dbl_186B98EA8[v9];
      double v6 = dbl_186B98EC8[v9];
    }
    [(_UIScrollViewScrollingAnimatorState *)self->_currentScroll force];
    double v14 = v13;
    double v16 = v15;
    double v12 = v6;
    double v11 = v5;
  }
  else
  {
    if (v9 >= 4)
    {
      double v14 = v5 * 5000.0;
      double v16 = v6 * 5000.0;
    }
    else
    {
      double v14 = dbl_186B98EE8[v9];
      double v16 = dbl_186B98F08[v9];
    }
    double v12 = 1.0;
    double v11 = 1.0;
  }
  double v17 = fabs(self->_velocity.x);
  [(_UIScrollViewScrollingAnimatorState *)self->_currentScroll maximumVelocity];
  double v6 = 0.0;
  if (v17 >= fabs(v18)) {
    double v5 = 0.0;
  }
  else {
    double v5 = v14;
  }
  double v19 = fabs(self->_velocity.y);
  [(_UIScrollViewScrollingAnimatorState *)self->_currentScroll maximumVelocity];
  if (v19 < fabs(v20)) {
    double v6 = v16;
  }
  if (!self->_currentScroll) {
    goto LABEL_21;
  }
  p_idealPosition = &self->_modelPosition;
LABEL_22:
  double x = p_idealPosition->x;
  double v23 = *p_y;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "_adjustedContentOffsetForContentOffset:", x, v23);
  double v26 = v25;
  double v28 = v27;

  p_velocitdouble y = &self->_velocity;
  double v30 = v12 * ((self->_modelPosition.y - v28) * -109.0 - self->_velocity.y * 20.0);
  double v31 = v5 + v11 * ((self->_modelPosition.x - v26) * -109.0 - self->_velocity.x * 20.0);
  double v32 = v6 + v30;
  [v41 targetTimestamp];
  double v34 = v33;
  [v41 timestamp];
  double v36 = v34 - v35;
  CGFloat v37 = self->_velocity.x + v31 * v36;
  double v38 = self->_modelPosition.x;
  CGFloat v39 = self->_velocity.y + v36 * v32;
  self->_velocity.double x = v37;
  double y = self->_modelPosition.y;
  self->_velocity.double y = v39;
  self->_modelPosition.double x = v36 * v37 + v38;
  self->_modelPosition.double y = v36 * v39 + y;
  -[_UIScrollViewScrollingAnimator _scrollToContentOffset:](self, "_scrollToContentOffset:");
  if (!self->_isScrollingInteractively && p_velocity->x * p_velocity->x + self->_velocity.y * self->_velocity.y < 1.0)
  {
    [(_UIScrollViewScrollingAnimator *)self _stopDisplayLink];
    *p_velocitdouble y = *v4;
  }
}

- (double)_distanceForIncrement:(unint64_t)a3 inDirection:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  double v7 = WeakRetained;
  double v8 = 0.0;
  if (!WeakRetained) {
    goto LABEL_14;
  }
  if (a3 == 1)
  {
    [WeakRetained zoomScale];
    double v13 = 40.0;
LABEL_13:
    double v8 = v12 * v13;
    goto LABEL_14;
  }
  unint64_t v9 = a4 - 3;
  if (a3 == 2)
  {
    [WeakRetained frame];
    if (v9 >= 2) {
      double v12 = v15;
    }
    else {
      double v12 = v14;
    }
    double v13 = 0.8;
    goto LABEL_13;
  }
  if (a3 == 3)
  {
    [WeakRetained contentSize];
    if (v9 <= 1) {
      double v8 = v10;
    }
    else {
      double v8 = v11;
    }
  }
LABEL_14:

  return v8;
}

- (void)_scrollToContentOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  self->_isAdjustingScrollViewOffset = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57___UIScrollViewScrollingAnimator__scrollToContentOffset___block_invoke;
  v7[3] = &unk_1E52DD178;
  v7[4] = self;
  *(CGFloat *)&v7[5] = x;
  *(CGFloat *)&v7[6] = y;
  [WeakRetained withScrollIndicatorsShownForContentOffsetChanges:v7];

  self->_isAdjustingScrollViewOffset = 0;
}

- (void)_scrollWithScrollToExtentAnimationTo:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71___UIScrollViewScrollingAnimator__scrollWithScrollToExtentAnimationTo___block_invoke;
  v7[3] = &unk_1E52DD178;
  v7[4] = self;
  *(CGFloat *)&v7[5] = x;
  *(CGFloat *)&v7[6] = y;
  [WeakRetained withScrollIndicatorsShownForContentOffsetChanges:v7];
}

- (CGPoint)_interactiveScrollVelocity
{
  p_scrollView = &self->_scrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  [WeakRetained _horizontalVelocity];
  double v5 = v4 * 1000.0;
  id v6 = objc_loadWeakRetained((id *)p_scrollView);
  [v6 _verticalVelocity];
  double v8 = v7 * 1000.0;

  double v9 = v5;
  double v10 = v8;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (unint64_t)_scrollableDirectionsFromOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_scrollView = &self->_scrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  [WeakRetained adjustedContentInset];
  double v28 = v7;
  double v29 = v8;
  double v10 = v9;
  double v12 = v11;

  id v13 = objc_loadWeakRetained((id *)p_scrollView);
  [v13 contentSize];
  double v15 = v14;
  double v17 = v16;

  id v18 = objc_loadWeakRetained((id *)p_scrollView);
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;

  double v23 = -v28;
  double v24 = v12 + v15 - v20;
  if (v24 <= -v10) {
    double v24 = -v10;
  }
  double v25 = v29 + v17 - v22;
  if (v25 <= v23) {
    double v25 = -v28;
  }
  unint64_t v26 = y > v23;
  if (y < v25) {
    v26 |= 4uLL;
  }
  if (x > -v10) {
    v26 |= 2uLL;
  }
  if (x >= v24) {
    return v26;
  }
  else {
    return v26 | 8;
  }
}

- (unint64_t)_rubberbandableDirections
{
  p_scrollView = &self->_scrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  int v4 = [WeakRetained _canScrollWithoutBouncingY];

  if (v4) {
    unint64_t v5 = 5;
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_scrollView);
  int v7 = [v6 _canScrollWithoutBouncingX];

  if (v7) {
    return v5 | 0xA;
  }
  else {
    return v5;
  }
}

- (BOOL)isScrollingInteractively
{
  return self->_isScrollingInteractively;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPressEvents, 0);
  objc_storeStrong((id *)&self->_currentScroll, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_scrollView);
}

@end