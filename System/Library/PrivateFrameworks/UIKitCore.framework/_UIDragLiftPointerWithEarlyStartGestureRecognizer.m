@interface _UIDragLiftPointerWithEarlyStartGestureRecognizer
- (double)liftMoveHysteresis;
- (void)setLiftMoveHysteresis:(double)a3;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIDragLiftPointerWithEarlyStartGestureRecognizer

- (void)setLiftMoveHysteresis:(double)a3
{
  self->_liftMoveHysteresis = a3;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_UIDragLiftPointerWithEarlyStartGestureRecognizer;
  [(_UIDragLiftGestureRecognizer *)&v14 touchesMoved:a3 withEvent:a4];
  [(_UIDragLiftPointerWithEarlyStartGestureRecognizer *)self liftMoveHysteresis];
  if (v5 > 0.0)
  {
    [(UILongPressGestureRecognizer *)self startPoint];
    double v7 = v6;
    double v9 = v8;
    [(UILongPressGestureRecognizer *)self centroid];
    double v12 = sqrt((v10 - v7) * (v10 - v7) + (v11 - v9) * (v11 - v9));
    [(_UIDragLiftPointerWithEarlyStartGestureRecognizer *)self liftMoveHysteresis];
    if (v12 >= v13)
    {
      [(UILongPressGestureRecognizer *)self enoughTimeElapsed:0];
      if ([(UIGestureRecognizer *)self state] >= UIGestureRecognizerStateBegan) {
        [(UILongPressGestureRecognizer *)self clearAllTimers];
      }
    }
  }
}

- (double)liftMoveHysteresis
{
  return self->_liftMoveHysteresis;
}

@end