@interface UITextRangeAdjustmentInteraction
- (BOOL)_gestureTuningEnabledForTouches:(id)a3;
- (BOOL)_pointCloserToEnd:(CGPoint)a3;
- (BOOL)_shouldApplyOffsetForTouchType:(int64_t)a3;
- (BOOL)_shouldDisplayLoupeForTouchType:(int64_t)a3;
- (BOOL)baseIsStart;
- (BOOL)doesControlDelegate;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasActiveTouch;
- (CGPoint)_convertPointToViewCoordinateSpace:(CGPoint)a3;
- (CGPoint)basePoint;
- (CGPoint)extentPoint;
- (CGPoint)initialBasePoint;
- (CGPoint)initialExtentPoint;
- (CGPoint)initialPoint;
- (CGRect)_activeAdjustmentEdgeRect;
- (UITextRangeAdjustmentGestureRecognizer)adjustmentGestureRecognizer;
- (UITextRangeAdjustmentInteraction)initWithAdjustmentDelegate:(id)a3 gestureHostView:(id)a4;
- (UITextRangeAdjustmentInteractionDelegate)adjustmentDelegate;
- (UITouch)activeTouch;
- (double)firstMovedTime;
- (double)initialDistance;
- (id)_gestureView;
- (id)gestureRecognizerHostView;
- (id)selectionWidgetForPoint:(CGPoint)a3;
- (void)_activeTouchEnded;
- (void)_adjustmentInteractionBeganWithLocation:(CGPoint)a3 startPoint:(CGPoint)a4 forTouchType:(int64_t)a5;
- (void)_adjustmentInteractionCancelled;
- (void)_adjustmentInteractionChangedWithLocation:(CGPoint)a3 forTouchType:(int64_t)a4;
- (void)_adjustmentInteractionEndedAtLocation:(CGPoint)a3 forTouchType:(int64_t)a4;
- (void)_createGestureTuningIfNecessary;
- (void)_didRecognizeAdjustmentGesture:(id)a3;
- (void)_loupeSessionDidInvalidate:(id)a3;
- (void)_updateAdjustmentInteractionWithState:(int64_t)a3 location:(CGPoint)a4 locationOfFirstTouch:(CGPoint)a5 forTouchType:(int64_t)a6;
- (void)manuallyUpdateInteractionWithGestureState:(int64_t)a3 location:(CGPoint)a4 locationOfFirstTouch:(CGPoint)a5 forTouchType:(int64_t)a6;
- (void)setActiveTouch:(id)a3;
- (void)setAdjustmentDelegate:(id)a3;
- (void)setBaseIsStart:(BOOL)a3;
- (void)setBasePoint:(CGPoint)a3;
- (void)setExtentPoint:(CGPoint)a3;
- (void)setFirstMovedTime:(double)a3;
- (void)setInitialBasePoint:(CGPoint)a3;
- (void)setInitialDistance:(double)a3;
- (void)setInitialPoint:(CGPoint)a3;
- (void)setModelPosition:(CGPoint)a3;
- (void)updateBaseAndExtentPointsFromEdges;
@end

@implementation UITextRangeAdjustmentInteraction

- (id)gestureRecognizerHostView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureHostView);
  return WeakRetained;
}

- (BOOL)doesControlDelegate
{
  return 0;
}

- (UITextRangeAdjustmentInteraction)initWithAdjustmentDelegate:(id)a3 gestureHostView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITextRangeAdjustmentInteraction;
  v8 = [(UITextInteraction *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_adjustmentDelegate, v6);
    objc_storeWeak((id *)&v9->_gestureHostView, v7);
    v10 = [(UIPanGestureRecognizer *)[UITextRangeAdjustmentGestureRecognizer alloc] initWithTarget:v9 action:sel__didRecognizeAdjustmentGesture_];
    adjustmentGestureRecognizer = v9->_adjustmentGestureRecognizer;
    v9->_adjustmentGestureRecognizer = v10;

    [(UIPanGestureRecognizer *)v9->_adjustmentGestureRecognizer _setHysteresis:1.0];
    [(UIPanGestureRecognizer *)v9->_adjustmentGestureRecognizer setDelegate:v9];
    [(UIGestureRecognizer *)v9->_adjustmentGestureRecognizer setName:@"UITextRangeAdjustmentGestureRecognizer"];
    [(UITextInteraction *)v9 addGestureRecognizer:v9->_adjustmentGestureRecognizer withName:0x1ED174160];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTouch, 0);
  objc_storeStrong((id *)&self->_adjustmentGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_adjustmentDelegate);
  objc_storeStrong((id *)&self->_loupeSession, 0);
  objc_storeStrong((id *)&self->_gestureTuning, 0);
  objc_destroyWeak((id *)&self->_gestureHostView);
}

- (void)_didRecognizeAdjustmentGesture:(id)a3
{
  id v25 = a3;
  v4 = [v25 _allActiveTouches];
  [(UITextRangeAdjustmentInteraction *)self _createGestureTuningIfNecessary];
  if ([(UITextRangeAdjustmentInteraction *)self _gestureTuningEnabledForTouches:v4])
  {
    -[UITextGestureTuning updateWithTouches:gestureState:](self->_gestureTuning, "updateWithTouches:gestureState:", v4, [v25 state]);
  }
  if ([v25 state] == 1)
  {
    v5 = [v4 anyObject];
    [(UITextRangeAdjustmentInteraction *)self setActiveTouch:v5];
  }
  [v25 startPoint];
  -[UITextRangeAdjustmentInteraction _convertPointToViewCoordinateSpace:](self, "_convertPointToViewCoordinateSpace:");
  double v7 = v6;
  double v9 = v8;
  v10 = [(UITextRangeAdjustmentInteraction *)self activeTouch];
  v11 = [(UITextRangeAdjustmentInteraction *)self _gestureView];
  [v10 locationInView:v11];
  double v13 = v12;
  double v15 = v14;

  -[UITextRangeAdjustmentInteraction _convertPointToViewCoordinateSpace:](self, "_convertPointToViewCoordinateSpace:", v13, v15);
  double v17 = v16;
  double v19 = v18;
  v20 = [(UITextRangeAdjustmentInteraction *)self activeTouch];
  uint64_t v21 = [v20 type];

  v22 = [(UITextRangeAdjustmentInteraction *)self activeTouch];
  int v23 = [v22 _isPointerTouch];

  if (v23) {
    uint64_t v24 = 3;
  }
  else {
    uint64_t v24 = v21;
  }
  -[UITextRangeAdjustmentInteraction _updateAdjustmentInteractionWithState:location:locationOfFirstTouch:forTouchType:](self, "_updateAdjustmentInteractionWithState:location:locationOfFirstTouch:forTouchType:", [v25 state], v24, v17, v19, v7, v9);
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v4 = a4;
  if ([v4 _isGestureType:10] & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_createGestureTuningIfNecessary
{
  if (!self->_gestureTuning)
  {
    v3 = objc_alloc_init(UITextGestureTuning);
    gestureTuning = self->_gestureTuning;
    self->_gestureTuning = v3;

    [(UITextGestureTuning *)self->_gestureTuning setShouldUseLineThreshold:1];
    [(UITextGestureTuning *)self->_gestureTuning setStrongerBiasAgainstUp:1];
    v5 = [(UITextInteraction *)self view];
    [(UITextGestureTuning *)self->_gestureTuning setGestureCoordinateSpace:v5];

    id v7 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
    double v6 = [v7 containerCoordinateSpaceForTextRangeAdjustmentInteraction:self];
    [(UITextGestureTuning *)self->_gestureTuning setContainerCoordinateSpace:v6];
  }
}

- (BOOL)_gestureTuningEnabledForTouches:(id)a3
{
  if (!self->_gestureTuning) {
    return 0;
  }
  v3 = self;
  id v4 = [a3 anyObject];
  LOBYTE(v3) = -[UITextRangeAdjustmentInteraction _shouldApplyOffsetForTouchType:](v3, "_shouldApplyOffsetForTouchType:", [v4 type]);

  return (char)v3;
}

- (id)_gestureView
{
  v2 = [(UITextInteraction *)self view];
  v3 = [v2 textInputView];

  return v3;
}

- (CGPoint)_convertPointToViewCoordinateSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITextRangeAdjustmentInteraction *)self _gestureView];
  if ([(id)UIApp _isSpringBoard])
  {
    id v7 = [v6 window];
    double v8 = [v7 _hostingWindow];

    if (v8)
    {
      uint64_t v9 = [(UITextRangeAdjustmentInteraction *)self activeTouch];
      v10 = (void *)v9;
      if (v9) {
        v11 = *(void **)(v9 + 360);
      }
      else {
        v11 = 0;
      }
      id v12 = v11;
      objc_msgSend(v6, "convertPoint:toView:", v12, x, y);
      double v14 = v13;
      double v16 = v15;

      double v17 = [v6 window];
      objc_msgSend(v17, "convertPoint:toView:", v6, v14, v16);
      double x = v18;
      double y = v19;
    }
  }

  double v20 = x;
  double v21 = y;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (BOOL)_pointCloserToEnd:(CGPoint)a3
{
  p_adjustmentDelegate = &self->_adjustmentDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  [WeakRetained paddedTextRangeAdjustmentHitRegionForEdge:0 precision:0];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = objc_loadWeakRetained((id *)p_adjustmentDelegate);
  [v13 paddedTextRangeAdjustmentHitRegionForEdge:1 precision:0];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  v34.origin.double x = v6;
  v34.origin.double y = v8;
  v34.size.width = v10;
  v34.size.height = v12;
  if (CGRectIsNull(v34)
    || (v35.origin.x = v15, v35.origin.double y = v17, v35.size.width = v19, v35.size.height = v21, CGRectIsNull(v35)))
  {
    id v22 = objc_loadWeakRetained((id *)p_adjustmentDelegate);
    [v22 textRangeAdjustmentRectForEdge:0];
    double v6 = v23;
    double v8 = v24;
    double v10 = v25;
    double v12 = v26;

    id v27 = objc_loadWeakRetained((id *)p_adjustmentDelegate);
    [v27 textRangeAdjustmentRectForEdge:1];
    double v15 = v28;
    double v17 = v29;
    double v19 = v30;
    double v21 = v31;
  }
  return sqrt((v15 + v19 * 0.5 - a3.x) * (v15 + v19 * 0.5 - a3.x) + (v17 + v21 * 0.5 - a3.y) * (v17 + v21 * 0.5 - a3.y)) < sqrt((v6 + v10 * 0.5 - a3.x) * (v6 + v10 * 0.5 - a3.x) + (v8 + v12 * 0.5 - a3.y) * (v8 + v12 * 0.5 - a3.y));
}

- (void)updateBaseAndExtentPointsFromEdges
{
  v3 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
  [v3 textRangeAdjustmentRectForEdge:0];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
  [v12 textRangeAdjustmentRectForEdge:1];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  BOOL v21 = [(UITextRangeAdjustmentInteraction *)self baseIsStart];
  if (v21) {
    double v22 = v5;
  }
  else {
    double v22 = v14;
  }
  if (v21) {
    double v23 = v7;
  }
  else {
    double v23 = v16;
  }
  if (v21) {
    double v24 = v9;
  }
  else {
    double v24 = v18;
  }
  if (v21) {
    double v25 = v11;
  }
  else {
    double v25 = v20;
  }
  if (v21)
  {
    double v5 = v14;
    double v7 = v16;
    double v9 = v18;
    double v11 = v20;
  }
  -[UITextRangeAdjustmentInteraction setBasePoint:](self, "setBasePoint:", v22 + v24 * 0.5, v23 + v25 * 0.5);
  -[UITextRangeAdjustmentInteraction setExtentPoint:](self, "setExtentPoint:", v5 + v9 * 0.5, v7 + v11 * 0.5);
}

- (BOOL)_shouldApplyOffsetForTouchType:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  char v6 = [WeakRetained textRangeAdjustmentInteractionShouldApplyTouchOffset:self];

  if (a3 == 3) {
    return 0;
  }
  else {
    return v6;
  }
}

- (BOOL)_shouldDisplayLoupeForTouchType:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  LOBYTE(a3) = [WeakRetained textRangeAdjustmentInteraction:self shouldDisplayLoupeForTouchType:a3];

  return a3;
}

- (void)_updateAdjustmentInteractionWithState:(int64_t)a3 location:(CGPoint)a4 locationOfFirstTouch:(CGPoint)a5 forTouchType:(int64_t)a6
{
  switch(a3)
  {
    case 1:
      -[UITextRangeAdjustmentInteraction _adjustmentInteractionBeganWithLocation:startPoint:forTouchType:](self, "_adjustmentInteractionBeganWithLocation:startPoint:forTouchType:", a6, a4.x, a4.y, a5.x, a5.y);
      break;
    case 2:
      -[UITextRangeAdjustmentInteraction _adjustmentInteractionChangedWithLocation:forTouchType:](self, "_adjustmentInteractionChangedWithLocation:forTouchType:", a6, a4.x, a4.y, a5.x, a5.y);
      break;
    case 3:
      -[UITextRangeAdjustmentInteraction _adjustmentInteractionEndedAtLocation:forTouchType:](self, "_adjustmentInteractionEndedAtLocation:forTouchType:", a6, a4.x, a4.y, a5.x, a5.y);
      break;
    case 4:
    case 5:
      [(UITextRangeAdjustmentInteraction *)self _adjustmentInteractionCancelled];
      break;
    default:
      return;
  }
}

- (CGRect)_activeAdjustmentEdgeRect
{
  BOOL baseIsStart = self->_baseIsStart;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  [WeakRetained textRangeAdjustmentRectForEdge:baseIsStart];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  if (a3) {
    a3 = (id)*((void *)a3 + 23);
  }
  p_adjustmentDelegate = &self->_adjustmentDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  double v9 = [WeakRetained containerCoordinateSpaceForTextRangeAdjustmentInteraction:self];

  [v6 locationInView:v9];
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  id v14 = objc_loadWeakRetained((id *)p_adjustmentDelegate);
  [v14 paddedTextRangeAdjustmentHitRegionForEdge:0 precision:a3];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v36.origin.double x = v16;
  v36.origin.double y = v18;
  v36.size.width = v20;
  v36.size.height = v22;
  v34.double x = v11;
  v34.double y = v13;
  if (CGRectContainsPoint(v36, v34))
  {
    BOOL v23 = 1;
  }
  else
  {
    id v24 = objc_loadWeakRetained((id *)p_adjustmentDelegate);
    [v24 paddedTextRangeAdjustmentHitRegionForEdge:1 precision:a3];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    v37.origin.double x = v26;
    v37.origin.double y = v28;
    v37.size.width = v30;
    v37.size.height = v32;
    v35.double x = v11;
    v35.double y = v13;
    BOOL v23 = CGRectContainsPoint(v37, v35);
  }

  return v23;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [(UITextRangeAdjustmentInteraction *)self _gestureView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  LOBYTE(self) = objc_msgSend(WeakRetained, "textRangeAdjustmentInteraction:shouldBeginAtPoint:", self, v7, v9);

  return (char)self;
}

- (void)_adjustmentInteractionBeganWithLocation:(CGPoint)a3 startPoint:(CGPoint)a4 forTouchType:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  -[UITextRangeAdjustmentInteraction setInitialPoint:](self, "setInitialPoint:", a4.x, a4.y);
  double v9 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
  id v40 = [v9 containerCoordinateSpaceForTextRangeAdjustmentInteraction:self];

  double v10 = [(UITextRangeAdjustmentInteraction *)self _gestureView];
  objc_msgSend(v40, "convertPoint:fromCoordinateSpace:", v10, x, y);
  double v12 = v11;
  double v14 = v13;

  self->_BOOL baseIsStart = -[UITextRangeAdjustmentInteraction _pointCloserToEnd:](self, "_pointCloserToEnd:", v12, v14);
  [(UITextRangeAdjustmentInteraction *)self updateBaseAndExtentPointsFromEdges];
  [(UITextRangeAdjustmentInteraction *)self extentPoint];
  self->_initialExtentPoint.double x = v15;
  self->_initialExtentPoint.double y = v16;
  [(UITextRangeAdjustmentInteraction *)self basePoint];
  -[UITextRangeAdjustmentInteraction setInitialBasePoint:](self, "setInitialBasePoint:");
  [(UITextRangeAdjustmentInteraction *)self initialBasePoint];
  double v18 = v17;
  double v20 = v19;
  [(UITextRangeAdjustmentInteraction *)self initialExtentPoint];
  [(UITextRangeAdjustmentInteraction *)self setInitialDistance:sqrt((v21 - v18) * (v21 - v18) + (v22 - v20) * (v22 - v20))];
  [(UITextRangeAdjustmentInteraction *)self setFirstMovedTime:-1.0];
  -[UITextRangeAdjustmentInteraction setExtentPoint:](self, "setExtentPoint:", x, y);
  BOOL v23 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
  objc_msgSend(v23, "textRangeAdjustmentInteraction:didBeginAtPoint:", self, x, y);

  [(UITextRangeAdjustmentInteraction *)self _activeAdjustmentEdgeRect];
  -[UITextGestureTuning assertInitialPositionFromTopOfCaret:distanceFromCaret:](self->_gestureTuning, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", y - v27, x - (v25 + v24 * 0.5), y - (v27 + v26 * 0.5));
  if ([(UITextRangeAdjustmentInteraction *)self _shouldDisplayLoupeForTouchType:a5])
  {
    CGFloat v28 = [(UITextRangeAdjustmentInteraction *)self _gestureView];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v29 = [v28 _rangeAdjustmentGestureView];

      CGFloat v28 = (void *)v29;
    }
    if ([(UITextRangeAdjustmentInteraction *)self _shouldApplyOffsetForTouchType:a5])
    {
      gestureTuning = self->_gestureTuning;
      [(UITextRangeAdjustmentInteraction *)self initialPoint];
      -[UITextGestureTuning touchAlignedPointForPoint:translation:](gestureTuning, "touchAlignedPointForPoint:translation:", x, y, x - v31, y - v32);
      double x = v33;
      double y = v34;
    }
    CGPoint v35 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
    uint64_t v36 = [v35 loupeOrientationForTextRangeAdjustmentInteraction:self];

    CGRect v37 = -[UITextRangeAdjustmentInteraction selectionWidgetForPoint:](self, "selectionWidgetForPoint:", x, y);
    +[UITextLoupeSession _beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:](UITextLoupeSession, "_beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:", v37, v28, v36, x, y);
    v38 = (UITextLoupeSession *)objc_claimAutoreleasedReturnValue();
    loupeSession = self->_loupeSession;
    self->_loupeSession = v38;

    [(UITextLoupeSession *)self->_loupeSession setDelegate:self];
    [(UITextLoupeSession *)self->_loupeSession setGestureTuning:self->_gestureTuning];
  }
}

- (void)setModelPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITextLoupeSession *)self->_loupeSession delegate];

  if (!v6) {
    [(UITextLoupeSession *)self->_loupeSession setDelegate:self];
  }
  loupeSession = self->_loupeSession;
  -[UITextLoupeSession setModelPosition:](loupeSession, "setModelPosition:", x, y);
}

- (void)_loupeSessionDidInvalidate:(id)a3
{
  id v4 = (UITextLoupeSession *)a3;
  if (self->_loupeSession == v4)
  {
    self->_loupeSession = 0;
    double v5 = v4;

    id v4 = v5;
  }
}

- (id)selectionWidgetForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
  double v7 = [v6 containerCoordinateSpaceForTextRangeAdjustmentInteraction:self];

  double v8 = [(UITextRangeAdjustmentInteraction *)self _gestureView];
  objc_msgSend(v7, "convertPoint:fromCoordinateSpace:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  LODWORD(v8) = -[UITextRangeAdjustmentInteraction _pointCloserToEnd:](self, "_pointCloserToEnd:", v10, v12);
  double v13 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  CGFloat v15 = [WeakRetained textRangeAdjustmentViewForEdge:v8];

  return v15;
}

- (void)_adjustmentInteractionChangedWithLocation:(CGPoint)a3 forTouchType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if ([(UITextRangeAdjustmentInteraction *)self _shouldApplyOffsetForTouchType:a4])
  {
    gestureTuning = self->_gestureTuning;
    [(UITextRangeAdjustmentInteraction *)self initialPoint];
    -[UITextGestureTuning touchAlignedPointForPoint:translation:](gestureTuning, "touchAlignedPointForPoint:translation:", x, y, x - v8, y - v9);
    double x = v10;
    double y = v11;
  }
  -[UITextRangeAdjustmentInteraction selectionWidgetForPoint:](self, "selectionWidgetForPoint:", x, y);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  loupeSession = self->_loupeSession;
  [(UITextRangeAdjustmentInteraction *)self _activeAdjustmentEdgeRect];
  -[UITextLoupeSession _moveToPoint:withCaretRect:selectionWidget:trackingCaret:](loupeSession, "_moveToPoint:withCaretRect:selectionWidget:trackingCaret:", v18, 1, x, y, v13, v14, v15, v16);
  -[UITextRangeAdjustmentInteraction setExtentPoint:](self, "setExtentPoint:", x, y);
  double v17 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
  [(UITextRangeAdjustmentInteraction *)self extentPoint];
  objc_msgSend(v17, "textRangeAdjustmentInteraction:selectionMoved:withTouchPoint:", self);
}

- (void)_adjustmentInteractionEndedAtLocation:(CGPoint)a3 forTouchType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if ([(UITextRangeAdjustmentInteraction *)self _shouldApplyOffsetForTouchType:a4])
  {
    -[UITextGestureTuning pointIfPlacedCarefully:](self->_gestureTuning, "pointIfPlacedCarefully:", x, y);
    double v8 = v7;
    double v10 = v9;
    gestureTuning = self->_gestureTuning;
    [(UITextRangeAdjustmentInteraction *)self initialPoint];
    -[UITextGestureTuning touchAlignedPointForPoint:translation:](gestureTuning, "touchAlignedPointForPoint:translation:", v8, v10, v8 - v12, v10 - v13);
    double x = v14;
    double y = v15;
  }
  double v16 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
  objc_msgSend(v16, "textRangeAdjustmentInteraction:didEndAtPoint:", self, x, y);

  [(UITextRangeAdjustmentInteraction *)self _activeTouchEnded];
}

- (BOOL)hasActiveTouch
{
  return self->_activeTouch != 0;
}

- (void)_adjustmentInteractionCancelled
{
  v3 = [(UITextRangeAdjustmentInteraction *)self adjustmentDelegate];
  [v3 textRangeAdjustmentInteractionWasCancelled:self];

  [(UITextRangeAdjustmentInteraction *)self _activeTouchEnded];
}

- (void)_activeTouchEnded
{
  [(UITextLoupeSession *)self->_loupeSession invalidate];
  v3 = [(UITextLoupeSession *)self->_loupeSession delegate];

  if (!v3)
  {
    loupeSession = self->_loupeSession;
    self->_loupeSession = 0;
  }
  activeTouch = self->_activeTouch;
  self->_activeTouch = 0;
}

- (void)manuallyUpdateInteractionWithGestureState:(int64_t)a3 location:(CGPoint)a4 locationOfFirstTouch:(CGPoint)a5 forTouchType:(int64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  [(UITextRangeAdjustmentInteraction *)self _createGestureTuningIfNecessary];
  if ([(UITextRangeAdjustmentInteraction *)self _shouldApplyOffsetForTouchType:a6]) {
    -[UITextGestureTuning updateVisibilityOffsetForGestureState:touchType:locationInSceneReferenceSpace:majorRadius:](self->_gestureTuning, "updateVisibilityOffsetForGestureState:touchType:locationInSceneReferenceSpace:majorRadius:", a3, 0, v10, v9, 1.0);
  }
  -[UITextRangeAdjustmentInteraction _updateAdjustmentInteractionWithState:location:locationOfFirstTouch:forTouchType:](self, "_updateAdjustmentInteractionWithState:location:locationOfFirstTouch:forTouchType:", a3, a6, v10, v9, x, y);
}

- (BOOL)baseIsStart
{
  return self->_baseIsStart;
}

- (void)setBaseIsStart:(BOOL)a3
{
  self->_BOOL baseIsStart = a3;
}

- (CGPoint)initialExtentPoint
{
  double x = self->_initialExtentPoint.x;
  double y = self->_initialExtentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)extentPoint
{
  double x = self->_extentPoint.x;
  double y = self->_extentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setExtentPoint:(CGPoint)a3
{
  self->_extentPoint = a3;
}

- (UITextRangeAdjustmentInteractionDelegate)adjustmentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  return (UITextRangeAdjustmentInteractionDelegate *)WeakRetained;
}

- (void)setAdjustmentDelegate:(id)a3
{
}

- (UITextRangeAdjustmentGestureRecognizer)adjustmentGestureRecognizer
{
  return self->_adjustmentGestureRecognizer;
}

- (CGPoint)initialPoint
{
  double x = self->_initialPoint.x;
  double y = self->_initialPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialPoint:(CGPoint)a3
{
  self->_initialPoint = a3;
}

- (CGPoint)basePoint
{
  double x = self->_basePoint.x;
  double y = self->_basePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBasePoint:(CGPoint)a3
{
  self->_basePoint = a3;
}

- (CGPoint)initialBasePoint
{
  double x = self->_initialBasePoint.x;
  double y = self->_initialBasePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialBasePoint:(CGPoint)a3
{
  self->_initialBasePoint = a3;
}

- (double)initialDistance
{
  return self->_initialDistance;
}

- (void)setInitialDistance:(double)a3
{
  self->_initialDistance = a3;
}

- (double)firstMovedTime
{
  return self->_firstMovedTime;
}

- (void)setFirstMovedTime:(double)a3
{
  self->_firstMovedTime = a3;
}

- (UITouch)activeTouch
{
  return self->_activeTouch;
}

- (void)setActiveTouch:(id)a3
{
}

@end