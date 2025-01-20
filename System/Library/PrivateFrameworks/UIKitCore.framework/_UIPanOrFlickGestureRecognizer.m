@interface _UIPanOrFlickGestureRecognizer
- (BOOL)_analyticsIsGestureHandled;
- (BOOL)_shouldTryToBeginWithEvent:(id)a3;
- (BOOL)didLongPress;
- (BOOL)isValidLongPress;
- (BOOL)longPressOnly;
- (CGPoint)initialCentroidLocation;
- (UIDelayedAction)elapsedAction;
- (UIDelayedAction)responsivenessAction;
- (_UIPanOrFlickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (_UIPanOrFlickGestureRecognizerDelegate)panOrFlickDelegate;
- (double)allowableMovement;
- (double)maximumFlickDuration;
- (double)minimumFlickDistance;
- (double)minimumPressDuration;
- (double)responsivenessDelay;
- (double)timestampBeforeGestureBegan;
- (double)timestampOfLastEvent;
- (unint64_t)allowedFlickDirections;
- (unint64_t)recognizedFlickDirection;
- (void)clearTimer;
- (void)dealloc;
- (void)enoughTimeElapsed:(id)a3;
- (void)reset;
- (void)responsivenessTimeElapsed:(id)a3;
- (void)setAllowableMovement:(double)a3;
- (void)setAllowedFlickDirections:(unint64_t)a3;
- (void)setElapsedAction:(id)a3;
- (void)setInitialCentroidLocation:(CGPoint)a3;
- (void)setLongPressOnly:(BOOL)a3;
- (void)setMaximumFlickDuration:(double)a3;
- (void)setMinimumFlickDistance:(double)a3;
- (void)setMinimumPressDuration:(double)a3;
- (void)setResponsivenessAction:(id)a3;
- (void)setResponsivenessDelay:(double)a3;
- (void)setTimestampBeforeGestureBegan:(double)a3;
- (void)setTimestampOfLastEvent:(double)a3;
- (void)startTimer;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIPanOrFlickGestureRecognizer

- (void)setResponsivenessDelay:(double)a3
{
  self->_responsivenessDelay = a3;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (void)setMinimumFlickDistance:(double)a3
{
  self->_minimumFlickDistance = a3;
}

- (void)setMaximumFlickDuration:(double)a3
{
  self->_maximumFlickDuration = a3;
}

- (void)setAllowedFlickDirections:(unint64_t)a3
{
  self->_allowedFlickDirections = a3;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (_UIPanOrFlickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  result = [(UIPanGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
  if (result)
  {
    result->_minimumPressDuration = 0.5;
    result->_allowableMovement = 10.0;
    result->_responsivenessDelay = result->_minimumPressDuration;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsivenessAction, 0);
  objc_storeStrong((id *)&self->_elapsedAction, 0);
}

- (void)dealloc
{
  [(UIDelayedAction *)self->_elapsedAction cancel];
  [(UIDelayedAction *)self->_responsivenessAction cancel];
  v3.receiver = self;
  v3.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  [(UIGestureRecognizer *)&v3 dealloc];
}

- (void)reset
{
  self->_didLongPress = 0;
  self->_touchCount = 0;
  [(_UIPanOrFlickGestureRecognizer *)self clearTimer];
  v3.receiver = self;
  v3.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  [(UIGestureRecognizer *)&v3 reset];
}

- (_UIPanOrFlickGestureRecognizerDelegate)panOrFlickDelegate
{
  objc_super v3 = [(UIGestureRecognizer *)self delegate];
  int v4 = [v3 conformsToProtocol:&unk_1ED5F7930];

  if (v4)
  {
    objc_super v5 = [(UIGestureRecognizer *)self delegate];
  }
  else
  {
    objc_super v5 = 0;
  }
  return (_UIPanOrFlickGestureRecognizerDelegate *)v5;
}

- (unint64_t)recognizedFlickDirection
{
  if ([(UIGestureRecognizer *)self state] != UIGestureRecognizerStateEnded) {
    return 0;
  }
  objc_super v3 = [(UIGestureRecognizer *)self view];
  [(UIPanGestureRecognizer *)self translationInView:v3];
  double v5 = v4;
  double v7 = v6;

  [(_UIPanOrFlickGestureRecognizer *)self timestampOfLastEvent];
  double v9 = v8;
  [(_UIPanOrFlickGestureRecognizer *)self timestampBeforeGestureBegan];
  double v11 = v9 - v10;
  [(_UIPanOrFlickGestureRecognizer *)self maximumFlickDuration];
  if (v11 >= v12
    || ([(_UIPanOrFlickGestureRecognizer *)self minimumFlickDistance],
        double v14 = v13,
        [(_UIPanOrFlickGestureRecognizer *)self minimumFlickDistance],
        v5 * v5 + v7 * v7 <= v14 * v15))
  {
    uint64_t v20 = 0;
  }
  else
  {
    double v16 = fabs(v5);
    double v17 = fabs(v7);
    uint64_t v18 = 4;
    if (v7 <= 0.0) {
      uint64_t v18 = 1;
    }
    uint64_t v19 = 2;
    if (v5 > 0.0) {
      uint64_t v19 = 8;
    }
    if (v16 > v17) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = v18;
    }
  }
  return [(_UIPanOrFlickGestureRecognizer *)self allowedFlickDirections] & v20;
}

- (BOOL)isValidLongPress
{
  objc_super v3 = [(UIGestureRecognizer *)self view];
  [(UIPanGestureRecognizer *)self locationInView:v3];
  double v5 = v4;
  double v7 = v6;

  [(_UIPanOrFlickGestureRecognizer *)self initialCentroidLocation];
  double v9 = v5 - v8;
  [(_UIPanOrFlickGestureRecognizer *)self initialCentroidLocation];
  double v11 = v9 * v9 + (v7 - v10) * (v7 - v10);
  [(_UIPanOrFlickGestureRecognizer *)self allowableMovement];
  double v13 = v12;
  [(_UIPanOrFlickGestureRecognizer *)self allowableMovement];
  if (v11 > v13 * v14) {
    return 0;
  }
  unint64_t touchCount = self->_touchCount;
  return touchCount == [(UIPanGestureRecognizer *)self minimumNumberOfTouches];
}

- (void)responsivenessTimeElapsed:(id)a3
{
  if ([(_UIPanOrFlickGestureRecognizer *)self isValidLongPress]
    && [(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    if (self->_longPressOnly) {
      [(UIGestureRecognizer *)self setState:1];
    }
    double v4 = [(_UIPanOrFlickGestureRecognizer *)self panOrFlickDelegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(_UIPanOrFlickGestureRecognizer *)self panOrFlickDelegate];
      [v6 gestureRecognizerShouldBeginResponse:self];
    }
  }
}

- (void)enoughTimeElapsed:(id)a3
{
  if ([(_UIPanOrFlickGestureRecognizer *)self isValidLongPress])
  {
    uint64_t v4 = 1;
    self->_didLongPress = 1;
    if ([(UIGestureRecognizer *)self state])
    {
      if ([(UIGestureRecognizer *)self state] != UIGestureRecognizerStateBegan) {
        return;
      }
      uint64_t v4 = 2;
    }
    [(UIGestureRecognizer *)self setState:v4];
  }
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  if (self->_longPressOnly) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  return [(UIPanGestureRecognizer *)&v4 _shouldTryToBeginWithEvent:a3];
}

- (void)clearTimer
{
  [(UIDelayedAction *)self->_elapsedAction cancel];
  elapsedAction = self->_elapsedAction;
  self->_elapsedAction = 0;

  [(UIDelayedAction *)self->_responsivenessAction cancel];
  responsivenessAction = self->_responsivenessAction;
  self->_responsivenessAction = 0;
}

- (void)startTimer
{
  [(_UIPanOrFlickGestureRecognizer *)self clearTimer];
  objc_super v3 = [(_UIPanOrFlickGestureRecognizer *)self panOrFlickDelegate];
  char v4 = objc_opt_respondsToSelector();

  double v5 = 0.0;
  if (v4)
  {
    id v6 = [(_UIPanOrFlickGestureRecognizer *)self panOrFlickDelegate];
    [v6 additionalPressDurationForTypingCadence:self];
    double v5 = v7;
  }
  double v8 = [UIDelayedAction alloc];
  [(_UIPanOrFlickGestureRecognizer *)self minimumPressDuration];
  uint64_t v10 = *MEMORY[0x1E4F1C4B0];
  double v11 = [(UIDelayedAction *)v8 initWithTarget:self action:sel_enoughTimeElapsed_ userInfo:0 delay:*MEMORY[0x1E4F1C4B0] mode:v5 + v9];
  elapsedAction = self->_elapsedAction;
  self->_elapsedAction = v11;

  [(_UIPanOrFlickGestureRecognizer *)self responsivenessDelay];
  double v14 = v13;
  [(_UIPanOrFlickGestureRecognizer *)self minimumPressDuration];
  if (v14 != v15)
  {
    double v16 = [UIDelayedAction alloc];
    [(_UIPanOrFlickGestureRecognizer *)self responsivenessDelay];
    double v17 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v16, "initWithTarget:action:userInfo:delay:mode:", self, sel_responsivenessTimeElapsed_, 0, v10);
    responsivenessAction = self->_responsivenessAction;
    self->_responsivenessAction = v17;
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 timestamp];
  -[_UIPanOrFlickGestureRecognizer setTimestampOfLastEvent:](self, "setTimestampOfLastEvent:");
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    [v6 timestamp];
    -[_UIPanOrFlickGestureRecognizer setTimestampBeforeGestureBegan:](self, "setTimestampBeforeGestureBegan:");
  }
  [(_UIPanOrFlickGestureRecognizer *)self startTimer];
  v10.receiver = self;
  v10.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  [(UIPanGestureRecognizer *)&v10 touchesBegan:v7 withEvent:v6];
  uint64_t v8 = [v7 count];

  self->_touchCount += v8;
  double v9 = [(UIGestureRecognizer *)self view];
  [(UIPanGestureRecognizer *)self locationInView:v9];
  -[_UIPanOrFlickGestureRecognizer setInitialCentroidLocation:](self, "setInitialCentroidLocation:");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 timestamp];
  -[_UIPanOrFlickGestureRecognizer setTimestampOfLastEvent:](self, "setTimestampOfLastEvent:");
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    [v7 timestamp];
    -[_UIPanOrFlickGestureRecognizer setTimestampBeforeGestureBegan:](self, "setTimestampBeforeGestureBegan:");
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  [(UIPanGestureRecognizer *)&v8 touchesMoved:v6 withEvent:v7];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 timestamp];
  -[_UIPanOrFlickGestureRecognizer setTimestampOfLastEvent:](self, "setTimestampOfLastEvent:");
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    [v6 timestamp];
    -[_UIPanOrFlickGestureRecognizer setTimestampBeforeGestureBegan:](self, "setTimestampBeforeGestureBegan:");
  }
  [(_UIPanOrFlickGestureRecognizer *)self clearTimer];
  v9.receiver = self;
  v9.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  [(UIPanGestureRecognizer *)&v9 touchesEnded:v7 withEvent:v6];
  uint64_t v8 = [v7 count];

  self->_touchCount -= v8;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 timestamp];
  -[_UIPanOrFlickGestureRecognizer setTimestampOfLastEvent:](self, "setTimestampOfLastEvent:");
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    [v6 timestamp];
    -[_UIPanOrFlickGestureRecognizer setTimestampBeforeGestureBegan:](self, "setTimestampBeforeGestureBegan:");
  }
  [(_UIPanOrFlickGestureRecognizer *)self clearTimer];
  v9.receiver = self;
  v9.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  [(UIPanGestureRecognizer *)&v9 touchesCancelled:v7 withEvent:v6];
  uint64_t v8 = [v7 count];

  self->_touchCount -= v8;
}

- (BOOL)_analyticsIsGestureHandled
{
  return 1;
}

- (BOOL)longPressOnly
{
  return self->_longPressOnly;
}

- (void)setLongPressOnly:(BOOL)a3
{
  self->_longPressOnly = a3;
}

- (unint64_t)allowedFlickDirections
{
  return self->_allowedFlickDirections;
}

- (double)maximumFlickDuration
{
  return self->_maximumFlickDuration;
}

- (double)minimumFlickDistance
{
  return self->_minimumFlickDistance;
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (BOOL)didLongPress
{
  return self->_didLongPress;
}

- (double)responsivenessDelay
{
  return self->_responsivenessDelay;
}

- (double)timestampBeforeGestureBegan
{
  return self->_timestampBeforeGestureBegan;
}

- (void)setTimestampBeforeGestureBegan:(double)a3
{
  self->_timestampBeforeGestureBegan = a3;
}

- (double)timestampOfLastEvent
{
  return self->_timestampOfLastEvent;
}

- (void)setTimestampOfLastEvent:(double)a3
{
  self->_timestampOfLastEvent = a3;
}

- (UIDelayedAction)elapsedAction
{
  return self->_elapsedAction;
}

- (void)setElapsedAction:(id)a3
{
}

- (UIDelayedAction)responsivenessAction
{
  return self->_responsivenessAction;
}

- (void)setResponsivenessAction:(id)a3
{
}

- (CGPoint)initialCentroidLocation
{
  double x = self->_initialCentroidLocation.x;
  double y = self->_initialCentroidLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialCentroidLocation:(CGPoint)a3
{
  self->_initialCentroidLocation = a3;
}

@end