@interface _UIContinuousSelectionGestureRecognizer
+ (BOOL)_supportsTouchContinuation;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (CGPoint)originalLocation;
- (CGVector)allowableMovement;
- (_UIContinuousSelectionGestureRecognizer)init;
- (void)_cancelOrFail;
- (void)setAllowableMovement:(CGVector)a3;
- (void)setOriginalLocation:(CGPoint)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIContinuousSelectionGestureRecognizer

- (_UIContinuousSelectionGestureRecognizer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIContinuousSelectionGestureRecognizer;
  v2 = [(UIGestureRecognizer *)&v5 init];
  v3 = v2;
  if (v2) {
    -[_UIContinuousSelectionGestureRecognizer setAllowableMovement:](v2, "setAllowableMovement:", 0.0, 0.0);
  }
  return v3;
}

+ (BOOL)_supportsTouchContinuation
{
  return 1;
}

- (void)_cancelOrFail
{
  if ([(UIGestureRecognizer *)self state]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  [(UIGestureRecognizer *)self setState:v3];
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  v4 = [(UIGestureRecognizer *)self _allActiveTouches];
  BOOL v5 = [v4 count] == 0;

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer locationInView:](self, "locationInView:", 0, a4);
  -[_UIContinuousSelectionGestureRecognizer setOriginalLocation:](self, "setOriginalLocation:");
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    [(UIGestureRecognizer *)self setState:1];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  [(_UIContinuousSelectionGestureRecognizer *)self allowableMovement];
  double v6 = v5;
  double v8 = v7;
  [(_UIContinuousSelectionGestureRecognizer *)self originalLocation];
  double v10 = v9;
  double v12 = v11;
  [(UIGestureRecognizer *)self locationInView:0];
  double v15 = v14;
  if (v6 <= 0.0)
  {
    if (v8 <= 0.0) {
      goto LABEL_9;
    }
    BOOL v18 = 0;
  }
  else
  {
    double v16 = vabdd_f64(v13, v10);
    [(_UIContinuousSelectionGestureRecognizer *)self allowableMovement];
    BOOL v18 = v16 > v17;
    if (v8 <= 0.0)
    {
      if (v16 > v17) {
        goto LABEL_15;
      }
      goto LABEL_9;
    }
  }
  [(_UIContinuousSelectionGestureRecognizer *)self allowableMovement];
  if (v18 || vabdd_f64(v15, v12) > v19)
  {
LABEL_15:
    [(_UIContinuousSelectionGestureRecognizer *)self _cancelOrFail];
    return;
  }
LABEL_9:
  if ([(UIGestureRecognizer *)self state] >= UIGestureRecognizerStateBegan
    && [(UIGestureRecognizer *)self state] <= UIGestureRecognizerStateChanged)
  {
    [(UIGestureRecognizer *)self setState:2];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(UIGestureRecognizer *)self state] < UIGestureRecognizerStateBegan
    || [(UIGestureRecognizer *)self state] >= UIGestureRecognizerStateEnded)
  {
    uint64_t v5 = 5;
  }
  else
  {
    uint64_t v5 = 3;
  }
  [(UIGestureRecognizer *)self setState:v5];
}

- (CGVector)allowableMovement
{
  double dx = self->_allowableMovement.dx;
  double dy = self->_allowableMovement.dy;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

- (void)setAllowableMovement:(CGVector)a3
{
  self->_allowableMovement = a3;
}

- (CGPoint)originalLocation
{
  double x = self->_originalLocation.x;
  double y = self->_originalLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalLocation:(CGPoint)a3
{
  self->_originalLocation = a3;
}

@end