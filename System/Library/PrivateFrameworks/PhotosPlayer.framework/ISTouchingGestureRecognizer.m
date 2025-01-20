@interface ISTouchingGestureRecognizer
- (BOOL)requireSingleTouch;
- (CGPoint)_initialPointInView;
- (ISTouchingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)distanceFromInitialPoint;
- (double)extraMinimumTouchDuration;
- (double)maximumTouchMovement;
- (double)minimumTouchDuration;
- (unint64_t)_beginRequestID;
- (unint64_t)_touchCount;
- (void)_beginWithRequestID:(unint64_t)a3;
- (void)_decrementTouchesBy:(unint64_t)a3;
- (void)_incrementTouchesBy:(unint64_t)a3;
- (void)_setBeginRequestID:(unint64_t)a3;
- (void)_setInitialPointInView:(CGPoint)a3;
- (void)_setTouchCount:(unint64_t)a3;
- (void)_updateDistanceFromInitialPoint;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reset;
- (void)setEnabled:(BOOL)a3;
- (void)setExtraMinimumTouchDuration:(double)a3;
- (void)setMaximumTouchMovement:(double)a3;
- (void)setMinimumTouchDuration:(double)a3;
- (void)setRequireSingleTouch:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ISTouchingGestureRecognizer

- (CGPoint)_initialPointInView
{
  double x = self->__initialPointInView.x;
  double y = self->__initialPointInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setBeginRequestID:(unint64_t)a3
{
  self->__beginRequestID = a3;
}

- (unint64_t)_beginRequestID
{
  return self->__beginRequestID;
}

- (unint64_t)_touchCount
{
  return self->__touchCount;
}

- (double)distanceFromInitialPoint
{
  return self->_distanceFromInitialPoint;
}

- (void)setMaximumTouchMovement:(double)a3
{
  self->_maximumTouchMovement = a3;
}

- (double)maximumTouchMovement
{
  return self->_maximumTouchMovement;
}

- (void)setRequireSingleTouch:(BOOL)a3
{
  self->_requireSingleTouch = a3;
}

- (BOOL)requireSingleTouch
{
  return self->_requireSingleTouch;
}

- (void)setExtraMinimumTouchDuration:(double)a3
{
  self->_extraMinimumTouchDuration = a3;
}

- (double)extraMinimumTouchDuration
{
  return self->_extraMinimumTouchDuration;
}

- (void)setMinimumTouchDuration:(double)a3
{
  self->_minimumTouchDuration = a3;
}

- (double)minimumTouchDuration
{
  return self->_minimumTouchDuration;
}

- (void)_updateDistanceFromInitialPoint
{
  v3 = [(ISTouchingGestureRecognizer *)self view];
  [(ISTouchingGestureRecognizer *)self locationInView:v3];
  double v5 = v4;
  double v7 = v6;

  [(ISTouchingGestureRecognizer *)self _initialPointInView];
  self->_distanceFromInitialPoint = sqrt((v7 - v9) * (v7 - v9) + (v5 - v8) * (v5 - v8));
}

- (void)_setInitialPointInView:(CGPoint)a3
{
  if (a3.x != self->__initialPointInView.x || a3.y != self->__initialPointInView.y)
  {
    self->__initialPointInView = a3;
    [(ISTouchingGestureRecognizer *)self _updateDistanceFromInitialPoint];
  }
}

- (void)reset
{
  self->_distanceFromInitialPoint = 0.0;
  [(ISTouchingGestureRecognizer *)self _setTouchCount:0];
}

- (void)setEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISTouchingGestureRecognizer;
  -[ISTouchingGestureRecognizer setEnabled:](&v5, sel_setEnabled_);
  if (!a3)
  {
    self->_distanceFromInitialPoint = 0.0;
    [(ISTouchingGestureRecognizer *)self _setTouchCount:0];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];

  [(ISTouchingGestureRecognizer *)self _decrementTouchesBy:v5];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];

  [(ISTouchingGestureRecognizer *)self _decrementTouchesBy:v5];
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  [(ISTouchingGestureRecognizer *)self _updateDistanceFromInitialPoint];
  [(ISTouchingGestureRecognizer *)self distanceFromInitialPoint];
  double v6 = v5;
  [(ISTouchingGestureRecognizer *)self maximumTouchMovement];
  if (v6 > v7)
  {
    [(ISTouchingGestureRecognizer *)self setState:4];
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];

  [(ISTouchingGestureRecognizer *)self _incrementTouchesBy:v5];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ISTouchingGestureRecognizer;
  [(ISTouchingGestureRecognizer *)&v8 touchesMoved:a3 withEvent:a4];
  [(ISTouchingGestureRecognizer *)self _updateDistanceFromInitialPoint];
  [(ISTouchingGestureRecognizer *)self distanceFromInitialPoint];
  double v6 = v5;
  [(ISTouchingGestureRecognizer *)self maximumTouchMovement];
  if (v6 > v7) {
    [(ISTouchingGestureRecognizer *)self setState:4];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(ISTouchingGestureRecognizer *)self setState:4];
  uint64_t v6 = [v5 count];

  [(ISTouchingGestureRecognizer *)self _decrementTouchesBy:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];

  [(ISTouchingGestureRecognizer *)self _decrementTouchesBy:v5];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];

  [(ISTouchingGestureRecognizer *)self _incrementTouchesBy:v5];
}

- (void)_beginWithRequestID:(unint64_t)a3
{
  if ([(ISTouchingGestureRecognizer *)self _beginRequestID] == a3)
  {
    [(ISTouchingGestureRecognizer *)self setState:1];
  }
}

- (void)_setTouchCount:(unint64_t)a3
{
  unint64_t touchCount = self->__touchCount;
  if (touchCount != a3)
  {
    self->__unint64_t touchCount = a3;
    if (!a3 || (BOOL v6 = [(ISTouchingGestureRecognizer *)self requireSingleTouch], a3 != 1) && v6)
    {
      [(ISTouchingGestureRecognizer *)self _setBeginRequestID:[(ISTouchingGestureRecognizer *)self _beginRequestID] + 1];
      [(ISTouchingGestureRecognizer *)self setState:3];
    }
    if (a3 && !touchCount)
    {
      [(ISTouchingGestureRecognizer *)self minimumTouchDuration];
      if (v7 <= 0.0)
      {
        [(ISTouchingGestureRecognizer *)self setState:1];
      }
      else
      {
        objc_super v8 = (void *)([(ISTouchingGestureRecognizer *)self _beginRequestID] + 1);
        [(ISTouchingGestureRecognizer *)self _setBeginRequestID:v8];
        objc_initWeak(&location, self);
        [(ISTouchingGestureRecognizer *)self minimumTouchDuration];
        double v10 = v9;
        [(ISTouchingGestureRecognizer *)self extraMinimumTouchDuration];
        dispatch_time_t v12 = dispatch_time(0, (uint64_t)((v10 + v11) * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __46__ISTouchingGestureRecognizer__setTouchCount___block_invoke;
        block[3] = &unk_1E6BECC18;
        objc_copyWeak(v14, &location);
        v14[1] = v8;
        dispatch_after(v12, MEMORY[0x1E4F14428], block);
        objc_destroyWeak(v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __46__ISTouchingGestureRecognizer__setTouchCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _beginWithRequestID:*(void *)(a1 + 40)];
}

- (void)_decrementTouchesBy:(unint64_t)a3
{
  if ([(ISTouchingGestureRecognizer *)self _touchCount] >= a3) {
    unint64_t v5 = [(ISTouchingGestureRecognizer *)self _touchCount] - a3;
  }
  else {
    unint64_t v5 = 0;
  }

  [(ISTouchingGestureRecognizer *)self _setTouchCount:v5];
}

- (void)_incrementTouchesBy:(unint64_t)a3
{
  unint64_t v5 = [(ISTouchingGestureRecognizer *)self _touchCount];
  unint64_t v6 = v5 + a3;
  if (!v5 && v6)
  {
    double v7 = [(ISTouchingGestureRecognizer *)self view];
    [(ISTouchingGestureRecognizer *)self locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    -[ISTouchingGestureRecognizer _setInitialPointInView:](self, "_setInitialPointInView:", v9, v11);
  }

  [(ISTouchingGestureRecognizer *)self _setTouchCount:v6];
}

- (ISTouchingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ISTouchingGestureRecognizer;
  CGPoint result = [(ISTouchingGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
  if (result)
  {
    result->_maximumTouchMovement = 1.79769313e308;
    result->_minimumTouchDuration = 0.0;
  }
  return result;
}

@end