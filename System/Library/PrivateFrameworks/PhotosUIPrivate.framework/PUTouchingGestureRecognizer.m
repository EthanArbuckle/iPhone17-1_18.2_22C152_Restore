@interface PUTouchingGestureRecognizer
- (unint64_t)_touchCount;
- (void)_decrementTouchesBy:(unint64_t)a3;
- (void)_incrementTouchesBy:(unint64_t)a3;
- (void)_setTouchCount:(unint64_t)a3;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation PUTouchingGestureRecognizer

- (unint64_t)_touchCount
{
  return self->__touchCount;
}

- (void)reset
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(PUTouchingGestureRecognizer *)self setState:4];
  uint64_t v6 = [v5 count];

  [(PUTouchingGestureRecognizer *)self _decrementTouchesBy:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];
  [(PUTouchingGestureRecognizer *)self _decrementTouchesBy:v5];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];
  [(PUTouchingGestureRecognizer *)self _incrementTouchesBy:v5];
}

- (void)_setTouchCount:(unint64_t)a3
{
  unint64_t touchCount = self->__touchCount;
  if (touchCount != a3)
  {
    self->__unint64_t touchCount = a3;
    if (a3)
    {
      if (touchCount) {
        return;
      }
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v4 = 3;
    }
    [(PUTouchingGestureRecognizer *)self setState:v4];
  }
}

- (void)_decrementTouchesBy:(unint64_t)a3
{
  if ([(PUTouchingGestureRecognizer *)self _touchCount] >= a3) {
    unint64_t v5 = [(PUTouchingGestureRecognizer *)self _touchCount] - a3;
  }
  else {
    unint64_t v5 = 0;
  }
  [(PUTouchingGestureRecognizer *)self _setTouchCount:v5];
}

- (void)_incrementTouchesBy:(unint64_t)a3
{
  unint64_t v4 = [(PUTouchingGestureRecognizer *)self _touchCount] + a3;
  [(PUTouchingGestureRecognizer *)self _setTouchCount:v4];
}

@end