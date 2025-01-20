@interface UIScrollViewPanGestureRecognizer
- (BOOL)_allowsBounce;
- (BOOL)_beganCaughtDeceleratingScrollViewAndMoved;
- (BOOL)_canTransferTrackingFromParentPagingScrollView;
- (BOOL)_caughtDeceleratingScrollView;
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_isParentScrollView:(id)a3 consideringEvent:(id)a4;
- (BOOL)_shouldContinueToWaitToTransferTrackingFromParentScrollView;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)_shouldTransferTrackingFromParentScrollViewForCurrentOffset;
- (BOOL)_shouldTryToBeginWithEvent:(id)a3;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)delaysTouchesBegan;
- (BOOL)isDirectionalLockEnabled;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)a3;
- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4;
- (CGPoint)_convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4;
- (CGPoint)_velocityIncludingDiscreteScrollInView:(id)a3;
- (CGPoint)translationInView:(id)a3;
- (CGPoint)velocityInView:(id)a3;
- (UIScrollView)scrollView;
- (UIScrollViewDirectionalPressGestureRecognizer)directionalPressGestureRecognizer;
- (UIScrollViewPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)_discreteFastScrollMultiplier;
- (double)_hysteresis;
- (double)translationScaleFactor;
- (id)_asyncDeliveryTargetForScrollEvent:(id)a3;
- (int64_t)_modifierFlags;
- (void)_beginScroll;
- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 affectingTranslation:(BOOL)a5;
- (void)_handleCaughtDeceleratingScrollViewWithEvent:(id)a3;
- (void)_resetGestureRecognizer;
- (void)_scrollViewDidEndZooming;
- (void)_scrollingChangedWithEvent:(id)a3;
- (void)_setDiscreteFastScrollMultiplier:(double)a3;
- (void)removeTarget:(id)a3 action:(SEL)a4;
- (void)setAllowedTouchTypes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectionalLockEnabled:(BOOL)a3;
- (void)setDirectionalPressGestureRecognizer:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setTranslationScaleFactor:(double)a3;
- (void)setView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIScrollViewPanGestureRecognizer

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  if (self->_scrollViewCanScrubWithTouch)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    unsigned __int8 v5 = isKindOfClass ^ 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIScrollViewPanGestureRecognizer;
    id v6 = a3;
    unsigned __int8 v5 = [(UIGestureRecognizer *)&v8 shouldBeRequiredToFailByGestureRecognizer:v6];
  }
  return v5 & 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ((*((char *)self + 480) & 0x80000000) == 0) {
    goto LABEL_14;
  }
  unsigned __int8 v5 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
  id v6 = [v5 _parentScrollView];
  id v7 = [v6 _panGestureRecognizer];

  if (v7 == v4)
  {
    char v11 = 0;
  }
  else
  {
LABEL_14:
    if (self->_scrollViewCanScrubWithTouch)
    {
      objc_super v8 = [v4 view];
      v9 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
      if ([v8 isDescendantOfView:v9])
      {
        objc_opt_class();
        int v10 = objc_opt_isKindOfClass() ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
    char v11 = v10 ^ 1;
  }

  return v11 & 1;
}

- (void)setView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIScrollViewPanGestureRecognizer;
  [(UIGestureRecognizer *)&v8 setView:v4];
  int64_t indirectScrollingState = self->_indirectScrollingState;
  if (indirectScrollingState)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_directionalPressGestureRecognizer);
    id v7 = WeakRetained;
    if (v4 && indirectScrollingState == 1) {
      [WeakRetained _addToViewIfAllowed:v4];
    }
    else {
      [WeakRetained _resetToOriginalViewIfAllowed];
    }
  }
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 10)
  {
    unsigned __int8 v5 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
    v7.receiver = self;
    v7.super_class = (Class)UIScrollViewPanGestureRecognizer;
    LODWORD(self) = [(UIPanGestureRecognizer *)&v7 shouldReceiveEvent:v4];
    if (self && ([v5 isTracking] & 1) == 0) {
      [v5 _beginTrackingWithEvent:v4];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIScrollViewPanGestureRecognizer;
    LOBYTE(self) = [(UIPanGestureRecognizer *)&v8 shouldReceiveEvent:v4];
  }

  return (char)self;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 8;
}

- (void)setScrollView:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
  id v6 = (void *)v5;
  if (v5 && (id)v5 != v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"UIScrollView's built-in pan gesture recognizer must have its scroll view as its delegate."];
  }
  v7.receiver = self;
  v7.super_class = (Class)UIScrollViewPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v7 setDelegate:v4];
}

- (void)setAllowedTouchTypes:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = [(UIGestureRecognizer *)self allowedTouchTypes];
  char v7 = [v5 isEqualToArray:v6];

  if ((v7 & 1) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)UIScrollViewPanGestureRecognizer;
    [(UIGestureRecognizer *)&v14 setAllowedTouchTypes:v5];
    objc_super v8 = [(UIGestureRecognizer *)self allowedTouchTypes];
    v9 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
    [v9 _setAllowedTouchTypesForScrolling:v8];
  }
  uint64_t v10 = [v5 containsObject:&unk_1ED3F7458];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_directionalPressGestureRecognizer);
  [WeakRetained _setEnabledIfAllowed:v10];

  if (v10)
  {
    self->_int64_t indirectScrollingState = 1;
    id v12 = objc_loadWeakRetained((id *)&self->_directionalPressGestureRecognizer);
    v13 = [(UIGestureRecognizer *)self view];
    [v12 _addToViewIfAllowed:v13];
  }
  else if (self->_indirectScrollingState)
  {
    self->_int64_t indirectScrollingState = 2;
  }
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (CGPoint)translationInView:(id)a3
{
  if ((*((unsigned char *)self + 480) & 0x20) != 0)
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
    [(UIPanGestureRecognizer *)&v9 translationInView:a3];
    double discreteFastScrollMultiplier = self->_discreteFastScrollMultiplier;
    double v6 = v5 * discreteFastScrollMultiplier;
    double v8 = v7 * discreteFastScrollMultiplier;
  }
  result.y = v8;
  result.x = v6;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_super v9 = [WeakRetained _relativePanView];

  id v10 = [(UIGestureRecognizer *)self view];

  if (v10 == v7 && v9)
  {
    id v11 = v9;

    id v7 = v11;
  }
  v18.receiver = self;
  v18.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](&v18, sel__convertPoint_toSceneReferenceCoordinatesFromView_, v7, x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_super v9 = [WeakRetained _relativePanView];

  id v10 = [(UIGestureRecognizer *)self view];

  if (v10 == v7 && v9)
  {
    id v11 = v9;

    id v7 = v11;
  }
  v18.receiver = self;
  v18.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](&v18, sel__convertPoint_fromSceneReferenceCoordinatesToView_, v7, x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (BOOL)delaysTouchesBegan
{
  v6.receiver = self;
  v6.super_class = (Class)UIScrollViewPanGestureRecognizer;
  if ([(UIGestureRecognizer *)&v6 delaysTouchesBegan]) {
    return 1;
  }
  if (![(UIGestureRecognizer *)self cancelsTouchesInView]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  char v3 = [WeakRetained isDecelerating];

  return v3;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->super._lastTouchCount)
  {
    double v8 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
    self->_scrollViewCanScrubWithTouch = [v8 _canScrubWithTouch:v6];
  }
  if ([v7 _containsHIDPointerEvent])
  {
    if (!self->_scrollViewCanScrubWithTouch)
    {
      objc_super v9 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
      char v10 = [v9 _supportsPointerDragScrolling];

      if ((v10 & 1) == 0)
      {
        double v13 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
        if ([v13 isDecelerating])
        {
          double v14 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
          char v15 = [v14 _isBouncing];

          if (v15)
          {
LABEL_12:
            BOOL v11 = 0;
            goto LABEL_7;
          }
          double v13 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
          [v13 _stopScrollingNotify:1 pin:0];
        }

        goto LABEL_12;
      }
    }
  }
  BOOL v11 = 1;
LABEL_7:

  return v11;
}

- (UIScrollViewPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UIScrollViewPanGestureRecognizer;
  double v5 = -[UIPanGestureRecognizer initWithTarget:action:](&v10, sel_initWithTarget_action_, a3);
  id v6 = v5;
  if (v5)
  {
    if (a4) {
      SEL v7 = a4;
    }
    else {
      SEL v7 = 0;
    }
    v5->_scrollViewAction = v7;
    *((unsigned char *)v5 + 480) &= ~0x40u;
    *((unsigned char *)v5 + 480) &= 0xF3u;
    v5->_int64_t indirectScrollingState = 0;
    [(UIPanGestureRecognizer *)v5 setFailsPastMaxTouches:0];
    [(UIScrollViewPanGestureRecognizer *)v6 setTranslationScaleFactor:1.0];
    [(UIPanGestureRecognizer *)v6 setAllowedScrollTypesMask:3];
    v6->_double discreteFastScrollMultiplier = 1.0;
    double v8 = v6;
  }

  return v6;
}

- (void)setTranslationScaleFactor:(double)a3
{
  self->_translationScaleFactor = a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  unint64_t lastTouchCount = self->super._lastTouchCount;
  id v8 = a3;
  self->_modifierFlags = [v6 _modifierFlags];
  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v9 touchesBegan:v8 withEvent:v6];

  if (!lastTouchCount) {
    [(UIScrollViewPanGestureRecognizer *)self _beginScroll];
  }
  *((unsigned char *)self + 480) &= 0xFCu;
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible
    && [(UIScrollViewPanGestureRecognizer *)self _shouldTryToBeginWithEvent:v6])
  {
    [(UIPanGestureRecognizer *)self _removeHysteresisFromTranslation];
    [(UIGestureRecognizer *)self setState:1];
  }
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)UIScrollViewPanGestureRecognizer;
  if ([(UIPanGestureRecognizer *)&v59 _shouldTryToBeginWithEvent:v4])
  {
    double v5 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
    if ([v5 _canScrollX]) {
      BOOL v6 = [(UIPanGestureRecognizer *)self _canPanHorizontally];
    }
    else {
      BOOL v6 = 0;
    }
    if ([v5 _canScrollY]) {
      BOOL v8 = [(UIPanGestureRecognizer *)self _canPanVertically];
    }
    else {
      BOOL v8 = 0;
    }
    BOOL v9 = [(UIPanGestureRecognizer *)self _willScrollX];
    BOOL v10 = [(UIPanGestureRecognizer *)self _willScrollY];
    BOOL v11 = [(UIGestureRecognizer *)self view];
    [(UIScrollViewPanGestureRecognizer *)self translationInView:v11];
    double v13 = v12;
    double v15 = v14;

    if (!v6 && !v8 || v8 && !v6 && !v10 || !v8 && v6 && !v9) {
      goto LABEL_59;
    }
    if ((*((unsigned char *)self + 480) & 0x10) != 0)
    {
      double v16 = [v5 _actingParentScrollView];
      double v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [v5 _parentScrollView];
      }
      v19 = v18;

      if ([(UIScrollViewPanGestureRecognizer *)self _isParentScrollView:v19 consideringEvent:v4])
      {
        unsigned int v20 = [v5 _currentlyAbuttedContentEdges];
        int v57 = (v20 >> 1) & 1;
        int v54 = (v20 >> 3) & 1;
        int v55 = v20 & 1;
        int v53 = (v20 >> 2) & 1;
        if (*((char *)self + 480) < 0)
        {
          if ([(UIScrollViewPanGestureRecognizer *)self _shouldTransferTrackingFromParentScrollViewForCurrentOffset])
          {
            [v19 contentOffset];
            double v22 = v21;
            double v24 = v23;
            [v19 _pinContentOffsetToClosestPageBoundary];
            v25 = [v19 panGestureRecognizer];
            v26 = v25;
            if (v25 && (v25[1] & 0x200000000) != 0) {
              [v25 setState:5];
            }

            v27 = [v19 pinchGestureRecognizer];
            v28 = v27;
            if (v27 && (v27[1] & 0x200000000) != 0) {
              [v27 setState:5];
            }

            double v29 = *MEMORY[0x1E4F1DAD8];
            double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
            [v19 contentOffset];
            double v33 = v24 - v32;
            if (v55 | v53) {
              double v34 = 0.0;
            }
            else {
              double v34 = v29;
            }
            if (!(v55 | v53)) {
              double v33 = v30;
            }
            double v35 = v22 - v31;
            if (v57 | v54) {
              double v33 = 0.0;
            }
            else {
              double v35 = v34;
            }
            -[UIPanGestureRecognizer setTranslation:inView:](self, "setTranslation:inView:", v5, v35, v33, 0.0, v34);
          }
          else if ([(UIScrollViewPanGestureRecognizer *)self _shouldContinueToWaitToTransferTrackingFromParentScrollView]|| (*((unsigned char *)self + 480) &= ~0x80u, v58.receiver = self, v58.super_class = (Class)UIScrollViewPanGestureRecognizer, ![(UIPanGestureRecognizer *)&v58 _shouldTryToBeginWithEvent:v4]))
          {
LABEL_58:

LABEL_59:
            char v7 = 0;
LABEL_60:

            goto LABEL_61;
          }
        }
        if ([v5 isPagingEnabled])
        {
          unsigned int v36 = [v5 _abuttedPagingEdges];
          int v57 = (v36 >> 1) & 1;
          int v54 = (v36 >> 3) & 1;
          int v55 = v36 & 1;
          int v53 = (v36 >> 2) & 1;
        }
        int v37 = [v5 _canScrollX];
        int v38 = [v5 _canScrollY];
        int v56 = v37;
        if ([v19 _canScrollX]) {
          int v39 = [v19 isScrollEnabled] ^ 1;
        }
        else {
          int v39 = 1;
        }
        if ([v19 _canScrollY]) {
          int v40 = [v19 isScrollEnabled] ^ 1;
        }
        else {
          int v40 = 1;
        }
        int v52 = v40;
        int v41 = [v5 transfersHorizontalScrollingToParent];
        int v51 = [v5 transfersVerticalScrollingToParent];
        v42 = [(UIGestureRecognizer *)self view];
        [(UIScrollViewPanGestureRecognizer *)self _hysteresis];
        double v44 = v43;
        [(UIScrollViewPanGestureRecognizer *)self _hysteresis];
        objc_msgSend(v42, "convertSize:fromView:", 0, v44, v45);
        double v47 = v46;
        double v49 = v48;

        if (((v38 & v10 | v39) & 1) == 0 && v41 && (!v56 || v13 >= v47 && v57 || v13 <= -v47 && v54)
          || ((v56 & v9 | v52) & 1) == 0 && ((v51 ^ 1) & 1) == 0 && (!v38 || v15 >= v49 && v55 || v15 <= -v49 && v53))
        {
          goto LABEL_58;
        }
      }
    }
    char v7 = [v5 _delegateShouldPanGestureTryToBegin];
    goto LABEL_60;
  }
  char v7 = 0;
LABEL_61:

  return v7;
}

- (void)_beginScroll
{
  id v5 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
  if (([v5 isDecelerating] & 1) != 0 || objc_msgSend(v5, "_isBouncing"))
  {
    if ([v5 _shouldTrackImmediatelyWhileDecelerating])
    {
      *((unsigned char *)self + 480) |= 0x20u;
      [(UIGestureRecognizer *)self setState:1];
    }
    else
    {
      [v5 _clearParentAdjustment];
    }
    *((unsigned char *)self + 480) = *((unsigned char *)self + 480) & 0xF3 | (4 * (*((unsigned char *)self + 480) & 3));
  }
  if ([(UIScrollViewPanGestureRecognizer *)self _canTransferTrackingFromParentPagingScrollView])
  {
    *((unsigned char *)self + 480) |= 0x80u;
  }
  char v3 = [v5 _parentScrollView];
  if (v3)
  {
    *((unsigned char *)self + 480) |= 0x10u;
  }
  else
  {
    id v4 = [v5 _actingParentScrollView];
    *((unsigned char *)self + 480) = *((unsigned char *)self + 480) & 0xEF | (16 * (v4 != 0));
  }
  *((unsigned char *)self + 480) &= 0xFCu;
}

- (BOOL)_canTransferTrackingFromParentPagingScrollView
{
  char v3 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
  id v4 = [v3 _parentScrollView];
  if (![v4 isPagingEnabled]
    || ![v3 _transfersScrollToContainer])
  {
    goto LABEL_15;
  }
  id v5 = [(UIGestureRecognizer *)self view];
  [(UIScrollViewPanGestureRecognizer *)self translationInView:v5];
  uint64_t v33 = v7;
  double v35 = v6;

  int v8 = [v3 _canScrollX];
  int v9 = [v3 _canScrollY];
  if ([v4 _canScrollX]) {
    int v10 = [v4 isScrollEnabled] ^ 1;
  }
  else {
    int v10 = 1;
  }
  if (objc_msgSend(v4, "_canScrollY", v33)) {
    int v11 = [v4 isScrollEnabled];
  }
  else {
    int v11 = 0;
  }
  [v3 contentInset];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [v3 bounds];
  double v21 = v20;
  double v23 = v22;
  [v3 contentSize];
  double v25 = v24;
  double v27 = v26;
  unsigned int v28 = [v3 _currentlyAbuttedContentEdges];
  if (((v10 | v8 ^ 1) & 1) != 0 || v19 + v15 + v25 <= v21 || (((v28 >> 1) | (v28 >> 3)) & 1) == 0)
  {
    LOBYTE(v29) = 0;
    if ((v11 & v9) != 1 || v17 + v13 + v27 <= v23) {
      goto LABEL_16;
    }
    if (((v28 | (v28 >> 2)) & 1) == 0)
    {
LABEL_15:
      LOBYTE(v29) = 0;
      goto LABEL_16;
    }
  }
  LOBYTE(v29) = 1;
  BOOL v31 = ((v28 >> 1) & 1) == 0;
  if (v35 <= 0.0) {
    BOOL v31 = 1;
  }
  if ((v31 | v10) == 1)
  {
    BOOL v32 = ((v28 >> 3) & 1) == 0;
    if (v35 >= 0.0) {
      BOOL v32 = 1;
    }
    if ((v32 | v10) == 1 && ((v28 & 1) == 0 || v34 <= 0.0 || v11 != 1)) {
      BOOL v29 = (v34 < 0.0) & (v28 >> 2) & v11;
    }
  }
LABEL_16:

  return v29;
}

- (double)_hysteresis
{
  double result = 0.0;
  if ((*((char *)self + 480) & 0x80000000) == 0
    && (self->super._lastTouchCount != 1 || !self->_scrollViewCanScrubWithTouch))
  {
    v3.receiver = self;
    v3.super_class = (Class)UIScrollViewPanGestureRecognizer;
    [(UIPanGestureRecognizer *)&v3 _hysteresis];
  }
  return result;
}

- (void)_resetGestureRecognizer
{
  *((unsigned char *)self + 480) = *((unsigned char *)self + 480) & 0xFC | (*((unsigned char *)self + 480) >> 2) & 3;
  *((unsigned char *)self + 480) &= 0xF3u;
  *((unsigned char *)self + 480) &= ~0x10u;
  *((unsigned char *)self + 480) &= ~0x20u;
  *((unsigned char *)self + 480) &= ~0x80u;
  *((unsigned char *)self + 481) &= ~1u;
  self->_scrollViewCanScrubWithTouch = 0;
  self->_double discreteFastScrollMultiplier = 1.0;
  v4.receiver = self;
  v4.super_class = (Class)UIScrollViewPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v4 _resetGestureRecognizer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  [WeakRetained _resetScrollableAncestor];
}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
  if (v7 == v6)
  {
    if (self->_scrollViewAction) {
      scrollViewAction = self->_scrollViewAction;
    }
    else {
      scrollViewAction = 0;
    }

    if (scrollViewAction == a4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"You can't remove the scroll view's target/action pair from its built-in pan gesture recognizer."];
    }
  }
  else
  {
  }
  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
  [(UIGestureRecognizer *)&v9 removeTarget:v6 action:a4];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_directionalPressGestureRecognizer);
  objc_destroyWeak((id *)&self->_scrollView);
}

- (void)setDirectionalLockEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 480) = *((unsigned char *)self + 480) & 0xBF | v3;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  UIGestureRecognizerState v8 = [(UIGestureRecognizer *)self state];
  self->_modifierFlags = [v6 _modifierFlags];
  v12.receiver = self;
  v12.super_class = (Class)UIScrollViewPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v12 touchesMoved:v7 withEvent:v6];

  [(UIScrollViewPanGestureRecognizer *)self _handleCaughtDeceleratingScrollViewWithEvent:v6];
  if (v8 == UIGestureRecognizerStatePossible
    && [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateBegan)
  {
    objc_super v9 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
    int v10 = [v6 touchesForGestureRecognizer:self];
    char v11 = [v9 _canCancelContentTouches:v10];

    if ((v11 & 1) == 0) {
      [(UIGestureRecognizer *)self setState:5];
    }
  }
}

- (void)_handleCaughtDeceleratingScrollViewWithEvent:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)self + 480) & 0x20) != 0)
  {
    *((unsigned char *)self + 480) &= ~0x20u;
    id v6 = v4;
    if ([(UIScrollViewPanGestureRecognizer *)self _shouldTryToBeginWithEvent:v4])
    {
      if ((*(void *)&self->super.super._gestureFlags & 0x400000000) != 0)
      {
        [(UIPanGestureRecognizer *)self _removeHysteresisFromTranslation];
        id v5 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
        [v5 _adjustStartOffsetForGrabbedBouncingScrollView];
      }
      else
      {
        *((unsigned char *)self + 481) |= 1u;
      }
    }
    else
    {
      *((unsigned char *)self + 480) |= 0x20u;
    }
    id v4 = v6;
  }
}

- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 affectingTranslation:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  if ((*((unsigned char *)self + 480) & 0x40) == 0
    || !a5
    || (unint64_t)(self->super.super._state - 1) <= 2
    && self->_reconsideredLockingLocation.x == 9.22337204e18
    && a4 - self->super._lastTouchTime < 0.6)
  {
    goto LABEL_30;
  }
  double v10 = -[UIPanGestureRecognizer _offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:](self, self->super._lastUnadjustedSceneReferenceLocation.x, self->super._lastUnadjustedSceneReferenceLocation.y, a3.x, a3.y);
  double v12 = v11;
  double v13 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
  if (v10 != 0.0 && v12 != 0.0)
  {
    float v14 = v12 / v10;
    float v15 = atanf(fabsf(v14));
    if (![(UIPanGestureRecognizer *)self _canPanHorizontally]
      || ![v13 _canScrollX]
      || v15 > 0.34906585)
    {
      if (![(UIPanGestureRecognizer *)self _canPanVertically]
        || ![v13 _canScrollY]
        || v15 < 1.22173048)
      {
        goto LABEL_26;
      }
      goto LABEL_24;
    }
LABEL_19:
    char v16 = 4;
LABEL_25:
    *((unsigned char *)self + 480) = *((unsigned char *)self + 480) & 0xF3 | v16;
    goto LABEL_26;
  }
  if (v12 == 0.0
    && v10 != 0.0
    && [(UIPanGestureRecognizer *)self _canPanHorizontally]
    && ([v13 _canScrollX] & 1) != 0)
  {
    goto LABEL_19;
  }
  if (v10 == 0.0
    && v12 != 0.0
    && [(UIPanGestureRecognizer *)self _canPanVertically]
    && [v13 _canScrollY])
  {
LABEL_24:
    char v16 = 8;
    goto LABEL_25;
  }
LABEL_26:

  if (self->_reconsideredLockingLocation.x != 9.22337204e18)
  {
    double v17 = vabdd_f64(x, self->_reconsideredLockingLocation.x);
    [(UIScrollViewPanGestureRecognizer *)self _hysteresis];
    if (v17 >= v18
      || (double v19 = vabdd_f64(y, self->_reconsideredLockingLocation.y),
          [(UIScrollViewPanGestureRecognizer *)self _hysteresis],
          v19 >= v20))
    {
      self->_reconsideredLockingLocation = (CGPoint)vdupq_n_s64(0x43E0000000000000uLL);
    }
  }
LABEL_30:
  v21.receiver = self;
  v21.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer _centroidMovedTo:atTime:affectingTranslation:](&v21, sel__centroidMovedTo_atTime_affectingTranslation_, v5, x, y, a4);
}

- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)a3
{
  unint64_t v3 = ((unint64_t)*((unsigned __int8 *)self + 480) >> 2) & 3;
  if (v3)
  {
    double v4 = [(UIPanGestureRecognizer *)(double *)self _shiftPanLocationToNewSceneReferenceLocation:a3.x lockingToAxis:a3.y];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIScrollViewPanGestureRecognizer;
    -[UIPanGestureRecognizer _adjustSceneReferenceLocation:](&v6, sel__adjustSceneReferenceLocation_, a3.x, a3.y);
  }
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (BOOL)_shouldContinueToWaitToTransferTrackingFromParentScrollView
{
  unint64_t v3 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
  double v4 = [v3 _parentScrollView];
  if ([v4 isDragging] & 1) != 0 || (objc_msgSend(v4, "isDecelerating")) {
    goto LABEL_15;
  }
  [(UIScrollViewPanGestureRecognizer *)self translationInView:v3];
  double v6 = v5;
  double v8 = v7;
  int v9 = [v3 _canScrollX];
  unsigned __int8 v10 = [v3 _canScrollY];
  int v11 = [v4 _canScrollX] ? objc_msgSend(v4, "isScrollEnabled") : 0;
  unsigned __int8 v12 = [v4 _canScrollY] ? objc_msgSend(v4, "isScrollEnabled") : 0;
  if ((unsigned int v13 = [v3 _currentlyAbuttedContentEdges], (v9 & (v13 >> 1) & v11) == 1) && v6 > 0.0
    || (v9 & (v13 >> 3) & v11) == 1 && v6 < 0.0
    || (v13 & v10 & v12) == 1 && v8 < 0.0)
  {
LABEL_15:
    BOOL v14 = 1;
  }
  else if ((*(_DWORD *)&v10 & (v13 >> 2)) == 1)
  {
    if (v8 > 0.0) {
      BOOL v14 = v12;
    }
    else {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldTransferTrackingFromParentScrollViewForCurrentOffset
{
  v2 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
  unint64_t v3 = [v2 _parentScrollView];
  [v3 _rectForPageContainingView:v2];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 contentOffset];
  double v13 = v12;
  double v15 = v14;
  char v16 = [v2 _currentlyAbuttedContentEdges];
  v23.origin.double x = v5;
  v23.origin.double y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  if (!CGRectIsEmpty(v23))
  {
    if ((v16 & 2) != 0)
    {
      v24.origin.double x = v5;
      v24.origin.double y = v7;
      v24.size.width = v9;
      v24.size.height = v11;
      if (v13 > CGRectGetMinX(v24)) {
        goto LABEL_9;
      }
    }
    if ((v16 & 8) != 0)
    {
      [v3 bounds];
      CGFloat v19 = v13 + v18;
      v25.origin.double x = v5;
      v25.origin.double y = v7;
      v25.size.width = v9;
      v25.size.height = v11;
      if (v19 < CGRectGetMaxX(v25)) {
        goto LABEL_9;
      }
    }
    if (v16)
    {
      v26.origin.double x = v5;
      v26.origin.double y = v7;
      v26.size.width = v9;
      v26.size.height = v11;
      if (v15 > CGRectGetMinY(v26))
      {
LABEL_9:
        BOOL v17 = 1;
        goto LABEL_12;
      }
    }
    if ((v16 & 4) != 0)
    {
      [v3 bounds];
      CGFloat v21 = v15 + v20;
      v27.origin.double x = v5;
      v27.origin.double y = v7;
      v27.size.width = v9;
      v27.size.height = v11;
      BOOL v17 = v21 < CGRectGetMaxY(v27);
      goto LABEL_12;
    }
  }
  BOOL v17 = 0;
LABEL_12:

  return v17;
}

- (CGPoint)velocityInView:(id)a3
{
  if ((*((unsigned char *)self + 480) & 0x20) != 0)
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v5 = v7;
    double v4 = *MEMORY[0x1E4F1DAD8];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIScrollViewPanGestureRecognizer;
    [(UIPanGestureRecognizer *)&v8 velocityInView:a3];
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  if (self->_activeEventIsDiscrete)
  {
    double v5 = v7;
    double v4 = v6;
  }
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)_velocityIncludingDiscreteScrollInView:(id)a3
{
  if ((*((unsigned char *)self + 480) & 0x20) != 0)
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIScrollViewPanGestureRecognizer;
    [(UIPanGestureRecognizer *)&v5 velocityInView:a3];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)_isParentScrollView:(id)a3 consideringEvent:(id)a4
{
  id v6 = a4;
  double v7 = [a3 _panGestureRecognizer];
  if (!v7) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = 1 << [v6 _scrollType];
      char v10 = ([v7 allowedScrollTypesMask] & v11) != 0;
      goto LABEL_7;
    }
LABEL_6:
    char v10 = 0;
    goto LABEL_7;
  }
  objc_super v8 = [v6 touchesForGestureRecognizer:v7];
  CGFloat v9 = [MEMORY[0x1E4F1CAD0] setWithArray:self->super._touches];
  char v10 = [v8 intersectsSet:v9];

LABEL_7:
  return v10;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIScrollViewPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v6 touchesCancelled:a3 withEvent:a4];
  if (![(UIPanGestureRecognizer *)self numberOfTouches])
  {
    objc_super v5 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
    [v5 cancelTouchTracking];
  }
}

- (void)_scrollViewDidEndZooming
{
  double v3 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
  -[UIPanGestureRecognizer setTranslation:inView:](self, "setTranslation:inView:", v3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  if ((*((unsigned char *)self + 480) & 0x40) != 0)
  {
    self->_reconsideredLockingLocation = self->super._lastUnadjustedSceneReferenceLocation;
    *((unsigned char *)self + 480) &= 0xFCu;
    *((unsigned char *)self + 480) &= 0xF3u;
  }
  velocitySample = self->super._velocitySample;
  self->super._velocitySample = 0;

  previousVelocitySample = self->super._previousVelocitySample;
  self->super._previousVelocitySample = 0;
}

- (BOOL)isDirectionalLockEnabled
{
  return (*((unsigned __int8 *)self + 480) >> 6) & 1;
}

- (BOOL)_caughtDeceleratingScrollView
{
  return (*((unsigned __int8 *)self + 480) >> 5) & 1;
}

- (BOOL)_beganCaughtDeceleratingScrollViewAndMoved
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateBegan) {
    return *((unsigned char *)self + 481) & 1;
  }
  else {
    return 0;
  }
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 phase];
  UIGestureRecognizerState v6 = [(UIGestureRecognizer *)self state];
  if (v6 == UIGestureRecognizerStateBegan && v5 == 5)
  {
    if ((!self || (*(void *)&self->super.super._gestureFlags & 0x400000000) == 0)
      && (*((unsigned char *)self + 480) & 0x20) != 0)
    {
      [(UIGestureRecognizer *)self setState:3];
    }
    v9.receiver = self;
    v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
    [(UIPanGestureRecognizer *)&v9 _scrollingChangedWithEvent:v4];
LABEL_10:
    UIGestureRecognizerState v7 = [(UIGestureRecognizer *)self state];
    if ((unint64_t)(v7 - 1) >= 2)
    {
      if (v7)
      {
LABEL_15:
        if (v5 == 5) {
          [(UIPanGestureRecognizer *)self numberOfTouches];
        }
        self->_activeEventIsDiscrete = 0;
        goto LABEL_18;
      }
      uint64_t v8 = 5;
    }
    else
    {
      uint64_t v8 = 3;
    }
    [(UIGestureRecognizer *)self setState:v8];
    goto LABEL_15;
  }
  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v9 _scrollingChangedWithEvent:v4];
  if ((unint64_t)(v5 - 1) < 2)
  {
    if (v6 == UIGestureRecognizerStatePossible)
    {
      self->_activeEventIsDiscrete = [v4 _scrollType] == 0;
      [(UIScrollViewPanGestureRecognizer *)self _beginScroll];
    }
  }
  else
  {
    if ((unint64_t)(v5 - 4) < 2) {
      goto LABEL_10;
    }
    if (v5 == 3) {
      [(UIScrollViewPanGestureRecognizer *)self _handleCaughtDeceleratingScrollViewWithEvent:v4];
    }
  }
LABEL_18:
}

- (id)_asyncDeliveryTargetForScrollEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIScrollViewPanGestureRecognizer *)self scrollView];
  UIGestureRecognizerState v6 = [v5 _asyncDeliveryTargetForScrollEvent:v4];

  return v6;
}

- (int64_t)_modifierFlags
{
  return self->_modifierFlags;
}

- (BOOL)_allowsBounce
{
  return 1;
}

- (double)translationScaleFactor
{
  return self->_translationScaleFactor;
}

- (UIScrollViewDirectionalPressGestureRecognizer)directionalPressGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_directionalPressGestureRecognizer);
  return (UIScrollViewDirectionalPressGestureRecognizer *)WeakRetained;
}

- (void)setDirectionalPressGestureRecognizer:(id)a3
{
}

- (double)_discreteFastScrollMultiplier
{
  return self->_discreteFastScrollMultiplier;
}

- (void)_setDiscreteFastScrollMultiplier:(double)a3
{
  self->_double discreteFastScrollMultiplier = a3;
}

@end