@interface PUGridPinchGestureRecognizer
- (BOOL)transitionShouldFinish;
- (CGSize)centerOffset;
- (double)transitionProgress;
- (unint64_t)transitionDirection;
- (void)_resetTransitionState;
- (void)reset;
- (void)setState:(int64_t)a3;
@end

@implementation PUGridPinchGestureRecognizer

- (unint64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (BOOL)transitionShouldFinish
{
  [(PUGridPinchGestureRecognizer *)self transitionProgress];
  double v4 = v3;
  [(UIPinchGestureRecognizer *)self velocity];
  if (self->_transitionDirection == 2) {
    double v5 = -v5;
  }
  return v5 > 1.0 || v4 > 0.25 && v5 >= -0.2 || v4 > 0.7;
}

- (CGSize)centerOffset
{
  double v3 = [(PUGridPinchGestureRecognizer *)self view];
  double v4 = [v3 window];
  [(PUGridPinchGestureRecognizer *)self locationOfTouch:0 inView:v4];
  double v6 = v5;
  double v8 = v7;

  v9 = [(PUGridPinchGestureRecognizer *)self view];
  v10 = [v9 window];
  [(PUGridPinchGestureRecognizer *)self locationOfTouch:1 inView:v10];
  double v12 = v11;
  double v14 = v13;

  double v15 = (v6 + v12) * 0.5 - (self->_touch0InitialLocation.x + self->_touch1InitialLocation.x) * 0.5;
  double v16 = (v8 + v14) * 0.5 - (self->_touch0InitialLocation.y + self->_touch1InitialLocation.y) * 0.5;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)transitionProgress
{
  if ((unint64_t)[(PUGridPinchGestureRecognizer *)self numberOfTouches] <= 1) {
    return self->_lastTransitionProgress;
  }
  double v3 = [(PUGridPinchGestureRecognizer *)self view];
  double v4 = [v3 window];
  [(PUGridPinchGestureRecognizer *)self locationOfTouch:0 inView:v4];

  double v5 = [(PUGridPinchGestureRecognizer *)self view];
  double v6 = [v5 window];
  [(PUGridPinchGestureRecognizer *)self locationOfTouch:1 inView:v6];

  UIDistanceBetweenPoints();
  double v8 = v7;
  UIDistanceBetweenPoints();
  double result = (v9 - v8) / 150.0;
  self->_lastTransitionProgress = result;
  if (self->_transitionDirection == 2)
  {
    double result = -result;
    self->_lastTransitionProgress = result;
  }
  return result;
}

- (void)setState:(int64_t)a3
{
  if (a3 == 2)
  {
    if ((unint64_t)[(PUGridPinchGestureRecognizer *)self numberOfTouches] >= 2)
    {
      double v5 = [(PUGridPinchGestureRecognizer *)self view];
      double v6 = [v5 window];
      [(PUGridPinchGestureRecognizer *)self locationOfTouch:0 inView:v6];
      self->_touch0InitialLocation.x = v7;
      self->_touch0InitialLocation.y = v8;

      double v9 = [(PUGridPinchGestureRecognizer *)self view];
      v10 = [v9 window];
      [(PUGridPinchGestureRecognizer *)self locationOfTouch:1 inView:v10];
      self->_touch1InitialLocation.x = v11;
      self->_touch1InitialLocation.y = v12;

      if (!self->_transitionDirection)
      {
        [(UIPinchGestureRecognizer *)self velocity];
        unint64_t v13 = 2;
        if (v14 > 0.0) {
          unint64_t v13 = 1;
        }
        self->_transitionDirection = v13;
      }
    }
  }
  else if (a3 == 1 && (unint64_t)[(PUGridPinchGestureRecognizer *)self numberOfTouches] >= 2)
  {
    [(PUGridPinchGestureRecognizer *)self _resetTransitionState];
  }
  v15.receiver = self;
  v15.super_class = (Class)PUGridPinchGestureRecognizer;
  [(PUGridPinchGestureRecognizer *)&v15 setState:a3];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)PUGridPinchGestureRecognizer;
  [(PUGridPinchGestureRecognizer *)&v3 reset];
  [(PUGridPinchGestureRecognizer *)self _resetTransitionState];
}

- (void)_resetTransitionState
{
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_touch1InitialLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_touch0InitialLocation = v2;
  self->_lastTransitionProgress = 0.0;
  self->_transitionDirection = 0;
}

@end