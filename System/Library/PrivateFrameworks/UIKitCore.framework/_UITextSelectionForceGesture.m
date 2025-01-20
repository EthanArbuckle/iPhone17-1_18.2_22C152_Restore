@interface _UITextSelectionForceGesture
- (BOOL)_shouldDelayUntilForceLevelRequirementIsMet;
- (BOOL)didLongPress;
- (BOOL)forceHasIncreasedForTimeInterval:(double)a3;
- (BOOL)shouldFailWithoutForce;
- (BOOL)shouldResetRangeForVelocity:(CGPoint)a3 previousVelocity:(CGPoint)a4;
- (BOOL)touchEclipsesVelocity;
- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)result;
- (CGPoint)_centroidInView:(id)a3;
- (CGPoint)_convertVelocitySample:(id)a3 fromSceneReferenceCoordinatesToView:(id)a4;
- (CGPoint)_locationOfTouches:(id)a3;
- (CGPoint)_shiftPanLocationToNewSceneReferenceLocation:(CGPoint)a3;
- (CGPoint)lastSceneReferenceLocation;
- (CGPoint)lastUnadjustedSceneReferenceLocation;
- (CGPoint)velocityInView:(id)a3;
- (CGRect)velocityRange;
- (UIKBPanGestureVelocitySample)_liftOffSample;
- (UIKBPanGestureVelocitySample)_previousVelocitySample;
- (UIKBPanGestureVelocitySample)_velocitySample;
- (UIOffset)_offsetInViewFromSceneReferenceLocation:(CGPoint)a3 toSceneReferenceLocation:(CGPoint)a4;
- (_UITextSelectionForceGesture)initWithTarget:(id)a3 action:(SEL)a4;
- (double)increasingForceTimestamp;
- (double)lastTouchTime;
- (int64_t)increasingForceState;
- (int64_t)liftOffState;
- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 physicalTouch:(id)a5;
- (void)_resetVelocitySamples;
- (void)_updateLiftOffState;
- (void)enoughTimeElapsed:(id)a3;
- (void)reset;
- (void)setDidLongPress:(BOOL)a3;
- (void)setIncreasingForceState:(int64_t)a3;
- (void)setIncreasingForceTimestamp:(double)a3;
- (void)setLastSceneReferenceLocation:(CGPoint)a3;
- (void)setLastTouchTime:(double)a3;
- (void)setLastUnadjustedSceneReferenceLocation:(CGPoint)a3;
- (void)setLiftOffState:(int64_t)a3;
- (void)setShouldFailWithoutForce:(BOOL)a3;
- (void)setTouchEclipsesVelocity:(BOOL)a3;
- (void)setVelocityRange:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UITextSelectionForceGesture

- (_UITextSelectionForceGesture)initWithTarget:(id)a3 action:(SEL)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_UITextSelectionForceGesture;
  v4 = [(UILongPressGestureRecognizer *)&v14 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIGestureRecognizer *)v4 setAllowedTouchTypes:&unk_1ED3F09D0];
    [(UIGestureRecognizer *)v5 setName:@"com.apple.UIKit.textSelectionForce"];
    [(UILongPressGestureRecognizer *)v5 set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:1];
    v6 = objc_alloc_init(UIKBPanGestureVelocitySample);
    velocitySample = v5->_velocitySample;
    v5->_velocitySample = v6;

    v8 = objc_alloc_init(UIKBPanGestureVelocitySample);
    previousVelocitySample = v5->_previousVelocitySample;
    v5->_previousVelocitySample = v8;

    v10 = objc_alloc_init(UIKBPanGestureVelocitySample);
    liftOffSample = v5->_liftOffSample;
    v5->_liftOffSample = v10;

    CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v5->_velocityRange.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v5->_velocityRange.size = v12;
    v5->_touchEclipsesVelocity = 0;
  }
  return v5;
}

- (void)enoughTimeElapsed:(id)a3
{
  id v4 = a3;
  if (![(_UITextSelectionForceGesture *)self shouldFailWithoutForce]
    || self && self->super.super._forcePressCount)
  {
    [(_UITextSelectionForceGesture *)self setDidLongPress:1];
    v5.receiver = self;
    v5.super_class = (Class)_UITextSelectionForceGesture;
    [(UILongPressGestureRecognizer *)&v5 enoughTimeElapsed:v4];
  }
  else
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (BOOL)_shouldDelayUntilForceLevelRequirementIsMet
{
  BOOL v3 = [(_UITextSelectionForceGesture *)self shouldFailWithoutForce];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UITextSelectionForceGesture;
    LOBYTE(v3) = [(UIGestureRecognizer *)&v5 _shouldDelayUntilForceLevelRequirementIsMet];
  }
  return v3;
}

- (void)_resetVelocitySamples
{
  BOOL v3 = [(_UITextSelectionForceGesture *)self _velocitySample];
  [v3 resetValues];

  id v4 = [(_UITextSelectionForceGesture *)self _previousVelocitySample];
  [v4 resetValues];

  id v5 = [(_UITextSelectionForceGesture *)self _liftOffSample];
  [v5 resetValues];
}

- (void)reset
{
  [(_UITextSelectionForceGesture *)self setTouchEclipsesVelocity:0];
  -[_UITextSelectionForceGesture setVelocityRange:](self, "setVelocityRange:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_UITextSelectionForceGesture *)self setLiftOffState:0];
  [(_UITextSelectionForceGesture *)self setIncreasingForceState:0];
  [(_UITextSelectionForceGesture *)self setIncreasingForceTimestamp:0.0];
  [(_UITextSelectionForceGesture *)self setDidLongPress:0];
  [(_UITextSelectionForceGesture *)self _resetVelocitySamples];
  v3.receiver = self;
  v3.super_class = (Class)_UITextSelectionForceGesture;
  [(UIGestureRecognizer *)&v3 reset];
}

- (CGPoint)_convertVelocitySample:(id)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 dt];
  if (v8 >= 0.001)
  {
    [v6 start];
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v7);
    double v12 = v11;
    double v14 = v13;
    [v6 end];
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v7);
    double v16 = v15;
    double v18 = v17 - v12;
    [v6 dt];
    double v9 = v18 / v19;
    [v6 dt];
    double v10 = (v16 - v14) / v20;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v21 = v9;
  double v22 = v10;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  id v4 = a3;
  [(_UITextSelectionForceGesture *)self _convertVelocitySample:self->_velocitySample fromSceneReferenceCoordinatesToView:v4];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(_UITextSelectionForceGesture *)self _previousVelocitySample];
  [v9 dt];
  double v11 = v10;

  if (v11 > 0.00000011920929)
  {
    [(_UITextSelectionForceGesture *)self _convertVelocitySample:self->_previousVelocitySample fromSceneReferenceCoordinatesToView:v4];
    double v6 = v6 * 0.25 + v12 * 0.75;
    double v8 = v8 * 0.25 + v13 * 0.75;
  }

  double v14 = v6;
  double v15 = v8;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)_locationOfTouches:(id)a3
{
  objc_super v3 = [a3 anyObject];
  id v4 = [v3 window];
  [v3 locationInView:0];
  objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (UIOffset)_offsetInViewFromSceneReferenceLocation:(CGPoint)a3 toSceneReferenceLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  double v9 = [(UIGestureRecognizer *)self view];
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v9, v7, v6);
  double v11 = v10;
  double v13 = v12;

  double v14 = [(UIGestureRecognizer *)self view];
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v14, x, y);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16 - v11;
  double v20 = v18 - v13;
  result.vertical = v20;
  result.horizontal = v19;
  return result;
}

- (CGPoint)_shiftPanLocationToNewSceneReferenceLocation:(CGPoint)a3
{
  -[_UITextSelectionForceGesture _offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:](self, "_offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:", self->_lastUnadjustedSceneReferenceLocation.x, self->_lastUnadjustedSceneReferenceLocation.y, a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(UIGestureRecognizer *)self view];
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v8, self->_lastSceneReferenceLocation.x, self->_lastSceneReferenceLocation.y);
  double v10 = v9;
  double v12 = v11;

  double v13 = [(UIGestureRecognizer *)self view];
  -[UIGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", v13, v5 + v10, v7 + v12);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)result
{
  if (self->_lastSceneReferenceLocation.x != self->_lastUnadjustedSceneReferenceLocation.x
    || self->_lastSceneReferenceLocation.y != self->_lastUnadjustedSceneReferenceLocation.y)
  {
    -[_UITextSelectionForceGesture _shiftPanLocationToNewSceneReferenceLocation:](self, "_shiftPanLocationToNewSceneReferenceLocation:", result.x, result.y);
  }
  return result;
}

- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 physicalTouch:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  -[_UITextSelectionForceGesture _adjustSceneReferenceLocation:](self, "_adjustSceneReferenceLocation:", x, y);
  double v11 = v10;
  double v13 = v12;
  double v14 = a4 - self->_lastTouchTime;
  double v15 = [(_UITextSelectionForceGesture *)self _previousVelocitySample];
  double v16 = [(_UITextSelectionForceGesture *)self _velocitySample];
  [v15 pullValuesFrom:v16];

  double v17 = self->_lastSceneReferenceLocation.x;
  double v18 = self->_lastSceneReferenceLocation.y;
  double v19 = [(_UITextSelectionForceGesture *)self _velocitySample];
  objc_msgSend(v19, "setStart:", v17, v18);

  double v20 = [(_UITextSelectionForceGesture *)self _velocitySample];
  objc_msgSend(v20, "setEnd:", v11, v13);

  double v21 = [(_UITextSelectionForceGesture *)self _velocitySample];
  [v21 setDt:v14];

  [v9 force];
  double v23 = v22;
  v24 = [(_UITextSelectionForceGesture *)self _velocitySample];
  [v24 setForce:v23];

  [v9 majorRadius];
  double v26 = v25;

  v27 = [(_UITextSelectionForceGesture *)self _velocitySample];
  [v27 setMajorRadius:v26];

  self->_lastUnadjustedSceneReferenceLocation.double x = x;
  self->_lastUnadjustedSceneReferenceLocation.double y = y;
  self->_lastSceneReferenceLocation.double x = v11;
  self->_lastSceneReferenceLocation.double y = v13;
  self->_lastTouchTime = a4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UILongPressGestureRecognizer *)self touches];
  uint64_t v9 = [v8 count];

  v13.receiver = self;
  v13.super_class = (Class)_UITextSelectionForceGesture;
  [(UILongPressGestureRecognizer *)&v13 touchesBegan:v6 withEvent:v7];
  if (!v9)
  {
    [(_UITextSelectionForceGesture *)self _locationOfTouches:v6];
    self->_lastSceneReferenceLocation.double x = v10;
    self->_lastSceneReferenceLocation.double y = v11;
    self->_lastUnadjustedSceneReferenceLocation = self->_lastSceneReferenceLocation;
    [v7 timestamp];
    self->_lastTouchTime = v12;
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(UIGestureRecognizer *)self view];
  [(_UITextSelectionForceGesture *)self velocityInView:v8];
  double v10 = v9;
  double v12 = v11;

  v46.receiver = self;
  v46.super_class = (Class)_UITextSelectionForceGesture;
  [(UILongPressGestureRecognizer *)&v46 touchesMoved:v7 withEvent:v6];
  [(_UITextSelectionForceGesture *)self _locationOfTouches:v7];
  double v14 = v13;
  double v16 = v15;
  [v6 timestamp];
  double v18 = v17;

  double v19 = [v7 anyObject];

  -[_UITextSelectionForceGesture _centroidMovedTo:atTime:physicalTouch:](self, "_centroidMovedTo:atTime:physicalTouch:", v19, v14, v16, v18);
  if (!self
    || (unint64_t)(self->super.super._state - 1) > 2
    || (*(void *)&self->super.super._gestureFlags & 0x4000000000000) != 0)
  {
    double v20 = floor(v10);
    double v21 = floor(v12);
    double v22 = [(UIGestureRecognizer *)self view];
    [(_UITextSelectionForceGesture *)self velocityInView:v22];
    double v24 = floor(v23);
    double v26 = floor(v25);

    v27 = [(UIGestureRecognizer *)self view];
    [(UILongPressGestureRecognizer *)self locationInView:v27];
    double x = v28;
    double y = v30;
    double width = *MEMORY[0x1E4F1DB30];
    double height = *(double *)(MEMORY[0x1E4F1DB30] + 8);

    if (!-[_UITextSelectionForceGesture shouldResetRangeForVelocity:previousVelocity:](self, "shouldResetRangeForVelocity:previousVelocity:", v24, v26, v20, v21))
    {
      [(_UITextSelectionForceGesture *)self velocityRange];
      v49.origin.double x = x;
      v49.origin.double y = y;
      v49.size.double width = width;
      v49.size.double height = height;
      CGRect v48 = CGRectUnion(v47, v49);
      double x = v48.origin.x;
      double y = v48.origin.y;
      double width = v48.size.width;
      double height = v48.size.height;
    }
    -[_UITextSelectionForceGesture setVelocityRange:](self, "setVelocityRange:", x, y, width, height);
    v34 = [(_UITextSelectionForceGesture *)self _velocitySample];
    [v34 majorRadius];
    double v36 = v35 * 0.3;

    [(_UITextSelectionForceGesture *)self velocityRange];
    if (v37 <= v36)
    {
      [(_UITextSelectionForceGesture *)self velocityRange];
      BOOL v38 = v39 <= v36;
    }
    else
    {
      BOOL v38 = 0;
    }
    [(_UITextSelectionForceGesture *)self setTouchEclipsesVelocity:v38];
    [(UIKBPanGestureVelocitySample *)self->_velocitySample force];
    double v41 = v40;
    [(UIKBPanGestureVelocitySample *)self->_previousVelocitySample force];
    double v43 = v42;
    int64_t v44 = [(_UITextSelectionForceGesture *)self increasingForceState];
    if (v41 >= v43)
    {
      if (v44) {
        return;
      }
      [(_UITextSelectionForceGesture *)self setIncreasingForceTimestamp:CFAbsoluteTimeGetCurrent()];
      uint64_t v45 = 1;
    }
    else
    {
      if (v44 != 1) {
        return;
      }
      uint64_t v45 = 0;
    }
    [(_UITextSelectionForceGesture *)self setIncreasingForceState:v45];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)_UITextSelectionForceGesture;
  id v6 = a4;
  id v7 = a3;
  [(UILongPressGestureRecognizer *)&v31 touchesEnded:v7 withEvent:v6];
  -[_UITextSelectionForceGesture _locationOfTouches:](self, "_locationOfTouches:", v7, v31.receiver, v31.super_class);
  double v9 = v8;
  double v11 = v10;
  [v6 timestamp];
  double v13 = v12;

  double v14 = [v7 anyObject];

  -[_UITextSelectionForceGesture _centroidMovedTo:atTime:physicalTouch:](self, "_centroidMovedTo:atTime:physicalTouch:", v14, v9, v11, v13);
  if ([(_UITextSelectionForceGesture *)self liftOffState] == 1)
  {
    double v15 = [(UIGestureRecognizer *)self view];
    [(_UITextSelectionForceGesture *)self velocityInView:v15];
    double v17 = v16;
    double v19 = v18;

    double v20 = [(_UITextSelectionForceGesture *)self _liftOffSample];
    [v20 majorRadius];
    double v22 = v21;

    if (v17 * v17 + v19 * v19 >= v22 * v22)
    {
      double v23 = atan2(-v19, -v17);
      double v24 = [(_UITextSelectionForceGesture *)self _liftOffSample];
      [v24 end];
      double v26 = v25;
      double v28 = v27;

      __double2 v29 = __sincos_stret(v23);
      double v30 = [(_UITextSelectionForceGesture *)self _liftOffSample];
      objc_msgSend(v30, "setEnd:", v22 * v29.__cosval * 0.1 + v26, v22 * v29.__sinval * 0.1 + v28);
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (BOOL)shouldResetRangeForVelocity:(CGPoint)a3 previousVelocity:(CGPoint)a4
{
  long double y = a3.y;
  long double x = a3.x;
  if (a4.x == 0.0 && a3.x != 0.0 || a4.y == 0.0 && a3.y != 0.0) {
    return 1;
  }
  double v7 = atan2(a4.y, a4.x) + 3.14159265 + 3.14159265;
  double v8 = atan2(y, x) + 3.14159265 + 3.14159265;
  return v8 >= v7 + 0.785398163 || v8 <= v7 + -0.785398163;
}

- (void)_updateLiftOffState
{
  objc_super v3 = [(_UITextSelectionForceGesture *)self _velocitySample];
  [v3 majorRadius];
  double v5 = v4;
  id v6 = [(_UITextSelectionForceGesture *)self _previousVelocitySample];
  [v6 majorRadius];
  double v8 = v7;

  int64_t v9 = [(_UITextSelectionForceGesture *)self liftOffState];
  if (v9 == 1)
  {
    [(_UITextSelectionForceGesture *)self setLiftOffState:v5 < v8];
  }
  else if (!v9 && v5 < v8)
  {
    [(_UITextSelectionForceGesture *)self setLiftOffState:1];
    id v11 = [(_UITextSelectionForceGesture *)self _liftOffSample];
    double v10 = [(_UITextSelectionForceGesture *)self _previousVelocitySample];
    [v11 pullValuesFrom:v10];
  }
}

- (CGPoint)_centroidInView:(id)a3
{
  id v4 = a3;
  if ([(_UITextSelectionForceGesture *)self liftOffState] == 1)
  {
    double v5 = [(_UITextSelectionForceGesture *)self _liftOffSample];
    [v5 end];
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v4);
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UITextSelectionForceGesture;
    [(UILongPressGestureRecognizer *)&v14 _centroidInView:v4];
    double v7 = v10;
    double v9 = v11;
  }

  double v12 = v7;
  double v13 = v9;
  result.long double y = v13;
  result.long double x = v12;
  return result;
}

- (BOOL)forceHasIncreasedForTimeInterval:(double)a3
{
  if ([(_UITextSelectionForceGesture *)self increasingForceState] != 1
    || [(UIGestureRecognizer *)self currentPreviewForceState] < 1)
  {
    return 0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(_UITextSelectionForceGesture *)self increasingForceTimestamp];
  return Current - v6 >= a3;
}

- (UIKBPanGestureVelocitySample)_velocitySample
{
  return (UIKBPanGestureVelocitySample *)objc_getProperty(self, a2, 504, 1);
}

- (UIKBPanGestureVelocitySample)_previousVelocitySample
{
  return (UIKBPanGestureVelocitySample *)objc_getProperty(self, a2, 512, 1);
}

- (UIKBPanGestureVelocitySample)_liftOffSample
{
  return (UIKBPanGestureVelocitySample *)objc_getProperty(self, a2, 520, 1);
}

- (BOOL)shouldFailWithoutForce
{
  return self->_shouldFailWithoutForce;
}

- (void)setShouldFailWithoutForce:(BOOL)a3
{
  self->_shouldFailWithoutForce = a3;
}

- (BOOL)didLongPress
{
  return self->_didLongPress;
}

- (void)setDidLongPress:(BOOL)a3
{
  self->_didLongPress = a3;
}

- (BOOL)touchEclipsesVelocity
{
  return self->_touchEclipsesVelocity;
}

- (void)setTouchEclipsesVelocity:(BOOL)a3
{
  self->_touchEclipsesVelocitlong double y = a3;
}

- (double)increasingForceTimestamp
{
  return self->_increasingForceTimestamp;
}

- (void)setIncreasingForceTimestamp:(double)a3
{
  self->_increasingForceTimestamp = a3;
}

- (double)lastTouchTime
{
  return self->_lastTouchTime;
}

- (void)setLastTouchTime:(double)a3
{
  self->_lastTouchTime = a3;
}

- (CGPoint)lastSceneReferenceLocation
{
  double x = self->_lastSceneReferenceLocation.x;
  double y = self->_lastSceneReferenceLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastSceneReferenceLocation:(CGPoint)a3
{
  self->_lastSceneReferenceLocation = a3;
}

- (CGPoint)lastUnadjustedSceneReferenceLocation
{
  double x = self->_lastUnadjustedSceneReferenceLocation.x;
  double y = self->_lastUnadjustedSceneReferenceLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastUnadjustedSceneReferenceLocation:(CGPoint)a3
{
  self->_lastUnadjustedSceneReferenceLocation = a3;
}

- (int64_t)liftOffState
{
  return self->_liftOffState;
}

- (void)setLiftOffState:(int64_t)a3
{
  self->_liftOffState = a3;
}

- (int64_t)increasingForceState
{
  return self->_increasingForceState;
}

- (void)setIncreasingForceState:(int64_t)a3
{
  self->_increasingForceState = a3;
}

- (CGRect)velocityRange
{
  double x = self->_velocityRange.origin.x;
  double y = self->_velocityRange.origin.y;
  double width = self->_velocityRange.size.width;
  double height = self->_velocityRange.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVelocityRange:(CGRect)a3
{
  self->_velocityRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftOffSample, 0);
  objc_storeStrong((id *)&self->_previousVelocitySample, 0);
  objc_storeStrong((id *)&self->_velocitySample, 0);
}

@end