@interface UITextGestureTuning
- (BOOL)didBreakLineThreshold;
- (BOOL)includeTipProjection;
- (BOOL)shouldIncludeConstantOffset;
- (BOOL)shouldUseLineThreshold;
- (BOOL)strongerBiasAgainstUp;
- (CGPoint)pointForGestureState:(int64_t)a3 point:(CGPoint)a4 translation:(CGPoint)a5;
- (CGPoint)pointIfPlacedCarefully:(CGPoint)a3;
- (CGPoint)touchAlignedPointForPoint:(CGPoint)a3 translation:(CGPoint)a4;
- (UICoordinateSpace)containerCoordinateSpace;
- (UICoordinateSpace)gestureCoordinateSpace;
- (UITextGestureTuning)init;
- (double)initialPosition;
- (double)lineBreakProgress;
- (void)_reset;
- (void)assertInitialPositionFromTopOfCaret:(double)a3 distanceFromCaret:(CGPoint)a4;
- (void)setContainerCoordinateSpace:(id)a3;
- (void)setGestureCoordinateSpace:(id)a3;
- (void)setIncludeTipProjection:(BOOL)a3;
- (void)setShouldIncludeConstantOffset:(BOOL)a3;
- (void)setShouldUseLineThreshold:(BOOL)a3;
- (void)setStrongerBiasAgainstUp:(BOOL)a3;
- (void)updateVisibilityOffsetForGestureState:(int64_t)a3 touchType:(int64_t)a4 locationInSceneReferenceSpace:(CGPoint)a5 majorRadius:(double)a6;
- (void)updateWeightedPointWithGestureState:(int64_t)a3 location:(CGPoint)a4;
- (void)updateWithTouches:(id)a3 gestureState:(int64_t)a4;
@end

@implementation UITextGestureTuning

- (UITextGestureTuning)init
{
  v7.receiver = self;
  v7.super_class = (Class)UITextGestureTuning;
  v2 = [(UITextGestureTuning *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldIncludeConstantOffset = 1;
    v4 = objc_alloc_init(UITextMagnifierTimeWeightedPoint);
    weightedPoint = v3->_weightedPoint;
    v3->_weightedPoint = v4;

    v3->_lastTouchType = 0;
  }
  return v3;
}

- (CGPoint)pointForGestureState:(int64_t)a3 point:(CGPoint)a4 translation:(CGPoint)a5
{
  if (a3 == 3) {
    -[UITextGestureTuning pointIfPlacedCarefully:](self, "pointIfPlacedCarefully:", a4.x, a4.y);
  }
  -[UITextGestureTuning touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:");
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)_reset
{
  self->_initialPosition = 0.0;
  self->_didBreakLineThreshold = 0;
}

- (void)assertInitialPositionFromTopOfCaret:(double)a3 distanceFromCaret:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  [(UITextGestureTuning *)self _reset];
  self->_caretDistance.CGFloat x = x;
  self->_caretDistance.CGFloat y = y;
  self->_initialOffsetFromTopOfCaret = a3;
}

- (void)updateWithTouches:(id)a3 gestureState:(int64_t)a4
{
  double v6 = [a3 anyObject];
  if (v6)
  {
    id v13 = v6;
    [v6 _locationInSceneReferenceSpace];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = [v13 type];
    [v13 majorRadius];
    -[UITextGestureTuning updateVisibilityOffsetForGestureState:touchType:locationInSceneReferenceSpace:majorRadius:](self, "updateVisibilityOffsetForGestureState:touchType:locationInSceneReferenceSpace:majorRadius:", a4, v11, v8, v10, v12);
    double v6 = v13;
  }
}

- (void)updateVisibilityOffsetForGestureState:(int64_t)a3 touchType:(int64_t)a4 locationInSceneReferenceSpace:(CGPoint)a5 majorRadius:(double)a6
{
  self->_lastTouchType = a4;
  -[UITextGestureTuning updateWeightedPointWithGestureState:location:](self, "updateWeightedPointWithGestureState:location:", a3, a5.x, a5.y, a6);
}

- (CGPoint)touchAlignedPointForPoint:(CGPoint)a3 translation:(CGPoint)a4
{
  CGFloat y = a3.y;
  double x = a3.x;
  if (!self->_lastTouchType)
  {
    double v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v8 = [v7 preferencesActions];
    int v9 = [v8 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

    if (v9)
    {
      if ([(UITextGestureTuning *)self includeTipProjection]
        && self->_initialOffsetFromTopOfCaret < 8.0)
      {
        CGFloat y = y + -8.0;
      }
      double initialPosition = self->_initialPosition;
      if (initialPosition == 0.0)
      {
        self->_double initialPosition = y;
        double initialPosition = y;
      }
      double v11 = y - initialPosition;
      if (v11 + self->_initialOffsetFromTopOfCaret < -2.0)
      {
        self->_double initialPosition = y;
        self->_initialOffsetFromTopOfCaret = 0.0;
      }
      if (v11 <= 39.0)
      {
        double v12 = -v11;
        if (self->_didBreakLineThreshold) {
          double v12 = -39.0;
        }
      }
      else
      {
        self->_didBreakLineThreshold = 1;
        double v12 = -39.0;
      }
      double x = x - self->_caretDistance.x;
      CGFloat y = y + v12 - self->_caretDistance.y;
      self->_lineBreakProgress = fmax(v11 / 39.0, 0.0);
      id v13 = [(UITextGestureTuning *)self containerCoordinateSpace];

      if (v13)
      {
        v14 = [(UITextGestureTuning *)self gestureCoordinateSpace];

        if (v14)
        {
          v15 = [(UITextGestureTuning *)self gestureCoordinateSpace];
          v16 = [(UITextGestureTuning *)self containerCoordinateSpace];
          objc_msgSend(v15, "convertPoint:toCoordinateSpace:", v16, x, y);
          double x = v17;
          CGFloat y = v18;
        }
        v19 = [(UITextGestureTuning *)self containerCoordinateSpace];
        [v19 bounds];
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;

        v39.origin.double x = v21;
        v39.origin.CGFloat y = v23;
        v39.size.width = v25;
        v39.size.height = v27;
        CGFloat v28 = fmax(CGRectGetMinY(v39), 0.0);
        v40.origin.double x = v21;
        v40.origin.CGFloat y = v23;
        v40.size.width = v25;
        v40.size.height = v27;
        double MaxY = CGRectGetMaxY(v40);
        double v30 = v28 + 1.0;
        if (y >= v28) {
          double v30 = y;
        }
        if (v30 <= MaxY) {
          CGFloat y = v30;
        }
        else {
          CGFloat y = MaxY + -1.0;
        }
        v31 = [(UITextGestureTuning *)self gestureCoordinateSpace];

        if (v31)
        {
          v32 = [(UITextGestureTuning *)self gestureCoordinateSpace];
          v33 = [(UITextGestureTuning *)self containerCoordinateSpace];
          objc_msgSend(v32, "convertPoint:fromCoordinateSpace:", v33, x, y);
          double x = v34;
          CGFloat y = v35;
        }
      }
    }
  }
  double v36 = x;
  double v37 = y;
  result.CGFloat y = v37;
  result.double x = v36;
  return result;
}

- (void)updateWeightedPointWithGestureState:(int64_t)a3 location:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 != 1) {
      return;
    }
    [(UITextMagnifierTimeWeightedPoint *)self->_weightedPoint clearHistory];
  }
  weightedPoint = self->_weightedPoint;
  -[UITextMagnifierTimeWeightedPoint addPoint:](weightedPoint, "addPoint:", x, y);
}

- (CGPoint)pointIfPlacedCarefully:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(UITextMagnifierTimeWeightedPoint *)self->_weightedPoint isPlacedCarefully])
  {
    [(UITextMagnifierTimeWeightedPoint *)self->_weightedPoint diffFromLastPoint];
    double x = x + v6;
    double y = y + v7;
  }
  double v8 = x;
  double v9 = y;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (UICoordinateSpace)containerCoordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerCoordinateSpace);
  return (UICoordinateSpace *)WeakRetained;
}

- (void)setContainerCoordinateSpace:(id)a3
{
}

- (UICoordinateSpace)gestureCoordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureCoordinateSpace);
  return (UICoordinateSpace *)WeakRetained;
}

- (void)setGestureCoordinateSpace:(id)a3
{
}

- (BOOL)shouldUseLineThreshold
{
  return self->_shouldUseLineThreshold;
}

- (void)setShouldUseLineThreshold:(BOOL)a3
{
  self->_shouldUseLineThreshold = a3;
}

- (BOOL)shouldIncludeConstantOffset
{
  return self->_shouldIncludeConstantOffset;
}

- (void)setShouldIncludeConstantOffset:(BOOL)a3
{
  self->_shouldIncludeConstantOffset = a3;
}

- (BOOL)includeTipProjection
{
  return self->_includeTipProjection;
}

- (void)setIncludeTipProjection:(BOOL)a3
{
  self->_includeTipProjection = a3;
}

- (BOOL)strongerBiasAgainstUp
{
  return self->_strongerBiasAgainstUp;
}

- (void)setStrongerBiasAgainstUp:(BOOL)a3
{
  self->_strongerBiasAgainstUp = a3;
}

- (BOOL)didBreakLineThreshold
{
  return self->_didBreakLineThreshold;
}

- (double)initialPosition
{
  return self->_initialPosition;
}

- (double)lineBreakProgress
{
  return self->_lineBreakProgress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_gestureCoordinateSpace);
  objc_destroyWeak((id *)&self->_containerCoordinateSpace);
  objc_storeStrong((id *)&self->_weightedPoint, 0);
}

@end