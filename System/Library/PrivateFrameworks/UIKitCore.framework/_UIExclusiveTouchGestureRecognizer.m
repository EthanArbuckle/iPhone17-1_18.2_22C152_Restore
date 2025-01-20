@interface _UIExclusiveTouchGestureRecognizer
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)achievedMaximumAbsoluteAccumulatedMovement;
- (CGPoint)accumulatedMovement;
- (CGPoint)maximumAbsoluteAccumulatedMovement;
- (id)description;
- (void)reset;
- (void)setMaximumAbsoluteAccumulatedMovement:(CGPoint)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIExclusiveTouchGestureRecognizer

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  unsigned int v5 = [(UIGestureRecognizer *)&v7 _shouldReceiveTouch:a3 withEvent:a4];
  if (v5) {
    LOBYTE(v5) = [a3 _isPointerTouch] ^ 1;
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  [(UIGestureRecognizer *)&v5 touchesBegan:a3 withEvent:a4];
  [(UIGestureRecognizer *)self setState:1];
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  [(UIGestureRecognizer *)&v5 reset];
  self->_accumulatedMovement = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_achievedMaximumAbsoluteAccumulatedMovement = 0;
  v3 = [(UIGestureRecognizer *)self delegate];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceNow];
  objc_msgSend(v3, "exclusiveTouchGestureRecognizer:achievedMaximumAbsoluteAccumulatedMovement:timestamp:", self, 0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  [(UIGestureRecognizer *)&v7 touchesEnded:a3 withEvent:a4];
  objc_super v5 = [(UIGestureRecognizer *)self _allActiveTouches];
  uint64_t v6 = [v5 count];

  if (!v6) {
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  v3 = [(UIGestureRecognizer *)&v9 description];
  v4 = (void *)[v3 mutableCopy];

  objc_super v5 = NSStringFromCGPoint(self->_maximumAbsoluteAccumulatedMovement);
  [v4 appendFormat:@"_maximumAbsoluteAccumulatedMovement %@\n", v5];

  uint64_t v6 = NSStringFromCGPoint(self->_accumulatedMovement);
  [v4 appendFormat:@"_accumulatedMovement %@\n", v6];

  if (self->_achievedMaximumAbsoluteAccumulatedMovement) {
    objc_super v7 = @"YES";
  }
  else {
    objc_super v7 = @"NO";
  }
  [v4 appendFormat:@"_achievedMaximumAbsoluteAccumulatedMovement %@\n", v7];
  return v4;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  [(UIGestureRecognizer *)&v31 touchesMoved:a3 withEvent:a4];
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v14 = [(UIGestureRecognizer *)self view];
        [v13 previousLocationInView:v14];
        double v16 = v15;
        double v18 = v17;

        v19 = [(UIGestureRecognizer *)self view];
        [v13 locationInView:v19];
        double v21 = v20;
        double v23 = v22;

        double v7 = v7 + vabdd_f64(v21, v16);
        double v6 = v6 + vabdd_f64(v23, v18);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  self->_accumulatedMovement.x = self->_accumulatedMovement.x + v7 / (double)(unint64_t)[v8 count];
  double v24 = self->_accumulatedMovement.y + v6 / (double)(unint64_t)[v8 count];
  self->_accumulatedMovement.double y = v24;
  if (self->_maximumAbsoluteAccumulatedMovement.x > 0.0
    && self->_accumulatedMovement.x >= self->_maximumAbsoluteAccumulatedMovement.x
    || (double y = self->_maximumAbsoluteAccumulatedMovement.y, y > 0.0) && v24 >= y)
  {
    if (!self->_achievedMaximumAbsoluteAccumulatedMovement)
    {
      self->_achievedMaximumAbsoluteAccumulatedMovement = 1;
      v26 = [(UIGestureRecognizer *)self delegate];
      [(UIGestureRecognizer *)self lastTouchTimestamp];
      objc_msgSend(v26, "exclusiveTouchGestureRecognizer:achievedMaximumAbsoluteAccumulatedMovement:timestamp:", self, 1);
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  [(UIGestureRecognizer *)&v5 touchesCancelled:a3 withEvent:a4];
  [(UIGestureRecognizer *)self setState:4];
}

- (CGPoint)maximumAbsoluteAccumulatedMovement
{
  double x = self->_maximumAbsoluteAccumulatedMovement.x;
  double y = self->_maximumAbsoluteAccumulatedMovement.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMaximumAbsoluteAccumulatedMovement:(CGPoint)a3
{
  self->_maximumAbsoluteAccumulatedMovement = a3;
}

- (BOOL)achievedMaximumAbsoluteAccumulatedMovement
{
  return self->_achievedMaximumAbsoluteAccumulatedMovement;
}

- (CGPoint)accumulatedMovement
{
  double x = self->_accumulatedMovement.x;
  double y = self->_accumulatedMovement.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end