@interface _UITouchDownGestureRecognizer
- (BOOL)gestureIsStillValid;
- (BOOL)locationIsMostlyInsideView:(CGPoint)a3;
- (CGPoint)locationInView:(id)a3;
- (_UITouchDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)allowableMovement;
- (void)activationDelayHandler;
- (void)cancelActivationDelay;
- (void)recognizeOrFailForCurrentLocation;
- (void)reset;
- (void)setAllowableMovement:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UITouchDownGestureRecognizer

- (_UITouchDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UITouchDownGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4) {
    [(_UITouchDownGestureRecognizer *)v4 setAllowableMovement:10.0];
  }
  return v5;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void).cxx_destruct
{
}

- (void)reset
{
  [(UIDelayedAction *)self->_activationDelay cancel];
  activationDelay = self->_activationDelay;
  self->_activationDelay = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v16 = a3;
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible && !self->_activationDelay)
  {
    v5 = [v16 anyObject];
    v6 = [(UIGestureRecognizer *)self view];
    [v5 locationInView:v6];
    self->_locationInView.x = v7;
    self->_locationInView.y = v8;

    [(_UITouchDownGestureRecognizer *)self locationInView:0];
    self->_initialLocationInScreenSpace.x = v9;
    self->_initialLocationInScreenSpace.y = v10;
    v11 = [(UIGestureRecognizer *)self view];
    v12 = [v11 _containingScrollView];
    double v13 = dbl_186B9BCC0[v12 == 0];

    v14 = [[UIDelayedAction alloc] initWithTarget:self action:sel_activationDelayHandler userInfo:0 delay:v13];
    activationDelay = self->_activationDelay;
    self->_activationDelay = v14;
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  p_locationInView = &self->_locationInView;
  v6 = [a3 anyObject];
  CGFloat v7 = [(UIGestureRecognizer *)self view];
  [v6 locationInView:v7];
  p_locationInView->x = v8;
  p_locationInView->y = v9;

  if (self->_activationDelay && ![(_UITouchDownGestureRecognizer *)self gestureIsStillValid])
  {
    [(_UITouchDownGestureRecognizer *)self cancelActivationDelay];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(_UITouchDownGestureRecognizer *)self cancelActivationDelay];
  v6 = [v5 anyObject];

  CGFloat v7 = [(UIGestureRecognizer *)self view];
  [v6 locationInView:v7];
  self->_locationInView.x = v8;
  self->_locationInView.y = v9;

  [(_UITouchDownGestureRecognizer *)self recognizeOrFailForCurrentLocation];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  [(_UITouchDownGestureRecognizer *)self cancelActivationDelay];
  self->_locationInView = (CGPoint)*MEMORY[0x1E4F1DAD8];
  if ([(UIGestureRecognizer *)self state] > UIGestureRecognizerStatePossible) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 5;
  }
  [(UIGestureRecognizer *)self setState:v5];
}

- (void)activationDelayHandler
{
  activationDelay = self->_activationDelay;
  self->_activationDelay = 0;

  [(_UITouchDownGestureRecognizer *)self recognizeOrFailForCurrentLocation];
}

- (void)cancelActivationDelay
{
  [(UIDelayedAction *)self->_activationDelay cancel];
  activationDelay = self->_activationDelay;
  self->_activationDelay = 0;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIGestureRecognizer *)self view];
  objc_msgSend(v5, "convertPoint:toView:", v4, self->_locationInView.x, self->_locationInView.y);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)gestureIsStillValid
{
  v3 = -[UIGestureRecognizer _activeTouchesEvent](self);
  id v4 = [v3 allTouches];
  unint64_t v5 = [v4 count];

  BOOL v13 = v5 <= 1
     && ([(_UITouchDownGestureRecognizer *)self locationInView:0],
         double v7 = v6,
         double y = self->_initialLocationInScreenSpace.y,
         double v10 = vabdd_f64(v9, self->_initialLocationInScreenSpace.x),
         [(_UITouchDownGestureRecognizer *)self allowableMovement],
         v10 <= v11)
     && ([(_UITouchDownGestureRecognizer *)self allowableMovement], vabdd_f64(v7, y) <= v12)
     && -[_UITouchDownGestureRecognizer locationIsMostlyInsideView:](self, "locationIsMostlyInsideView:", self->_locationInView.x, self->_locationInView.y);

  return v13;
}

- (BOOL)locationIsMostlyInsideView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UIGestureRecognizer *)self view];
  char v7 = objc_opt_respondsToSelector();

  double v8 = [(UIGestureRecognizer *)self view];
  double v9 = v8;
  if (v7) {
    char v10 = objc_msgSend(v8, "pointMostlyInside:withEvent:", 0, x, y);
  }
  else {
    char v10 = objc_msgSend(v8, "pointInside:forEvent:", 0, x, y);
  }
  BOOL v11 = v10;

  return v11;
}

- (void)recognizeOrFailForCurrentLocation
{
  if ([(_UITouchDownGestureRecognizer *)self gestureIsStillValid]) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 5;
  }
  [(UIGestureRecognizer *)self setState:v3];
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

@end