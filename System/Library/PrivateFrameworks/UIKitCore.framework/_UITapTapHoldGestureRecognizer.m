@interface _UITapTapHoldGestureRecognizer
- (BOOL)_shouldFailInResponseToPresses:(id)a3 withEvent:(id)a4;
- (BOOL)isInHoldToAction;
- (BOOL)isWaitingForHoldToAction;
- (BOOL)isWaitingForTooSlowForDoubleTap;
- (_UITapTapHoldGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)pressEventBeginTimestamp;
- (double)startTime;
- (int)currentNumberOfPresses;
- (int64_t)gestureType;
- (void)cancelPendingHoldToAction;
- (void)cancelPendingTooSlowForDoubleTap;
- (void)holdToAction:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reset;
- (void)scheduleHoldToAction;
- (void)scheduleTooSlowForDoubleTap;
- (void)setCurrentNumberOfPresses:(int)a3;
- (void)setGestureType:(int64_t)a3;
- (void)setIsInHoldToAction:(BOOL)a3;
- (void)setIsWaitingForHoldToAction:(BOOL)a3;
- (void)setIsWaitingForTooSlowForDoubleTap:(BOOL)a3;
- (void)setPressEventBeginTimestamp:(double)a3;
- (void)setStartTime:(double)a3;
- (void)tooSlowForDoubleTap:(id)a3;
@end

@implementation _UITapTapHoldGestureRecognizer

- (_UITapTapHoldGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UITapTapHoldGestureRecognizer;
  return [(UITapGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)_UITapTapHoldGestureRecognizer;
  [(UIGestureRecognizer *)&v3 reset];
  [(_UITapTapHoldGestureRecognizer *)self cancelPendingHoldToAction];
  [(_UITapTapHoldGestureRecognizer *)self cancelPendingTooSlowForDoubleTap];
  self->_gestureType = 0;
  self->_startTime = 0.0;
  self->_pressEventBeginTimestamp = 0.0;
  self->_isInHoldToAction = 0;
  self->_currentNumberOfPresses = 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  if ([(_UITapTapHoldGestureRecognizer *)self _shouldFailInResponseToPresses:a3 withEvent:a4])
  {
    [(UIGestureRecognizer *)self setState:5];
  }
  else
  {
    CFTimeInterval v5 = CACurrentMediaTime();
    self->_pressEventBeginTimestamp = v5;
    if (self->_startTime == 0.0) {
      self->_startTime = v5;
    }
    int v6 = self->_currentNumberOfPresses + 1;
    self->_currentNumberOfPresses = v6;
    if (v6 == 2)
    {
      [(_UITapTapHoldGestureRecognizer *)self cancelPendingTooSlowForDoubleTap];
      [(_UITapTapHoldGestureRecognizer *)self scheduleHoldToAction];
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  double v5 = CACurrentMediaTime();
  double v6 = v5;
  if (!self->_isInHoldToAction && v5 - self->_pressEventBeginTimestamp > 0.75)
  {
    v7 = self;
    uint64_t v8 = 5;
LABEL_15:
    [(UIGestureRecognizer *)v7 setState:v8];
    return;
  }
  int currentNumberOfPresses = self->_currentNumberOfPresses;
  if (currentNumberOfPresses == 2)
  {
    double pressEventBeginTimestamp = self->_pressEventBeginTimestamp;
    if ([(_UITapTapHoldGestureRecognizer *)self isInHoldToAction]
      && (double v11 = v6 - pressEventBeginTimestamp, v6 - pressEventBeginTimestamp > 0.5))
    {
      uint64_t v12 = 4;
    }
    else
    {
      [(_UITapTapHoldGestureRecognizer *)self cancelPendingHoldToAction];
      uint64_t v12 = 2;
    }
    -[_UITapTapHoldGestureRecognizer setGestureType:](self, "setGestureType:", v12, v11);
    v7 = self;
    uint64_t v8 = 3;
    goto LABEL_15;
  }
  if (currentNumberOfPresses == 1)
  {
    [(_UITapTapHoldGestureRecognizer *)self scheduleTooSlowForDoubleTap];
  }
}

- (void)tooSlowForDoubleTap:(id)a3
{
  self->_isWaitingForTooSlowForDoubleTap = 0;
  [(_UITapTapHoldGestureRecognizer *)self setGestureType:1];
  [(UIGestureRecognizer *)self setState:3];
}

- (void)scheduleTooSlowForDoubleTap
{
  self->_isWaitingForTooSlowForDoubleTap = 1;
  [(_UITapTapHoldGestureRecognizer *)self performSelector:sel_tooSlowForDoubleTap_ withObject:0 afterDelay:0.175];
}

- (void)cancelPendingTooSlowForDoubleTap
{
  if (self->_isWaitingForTooSlowForDoubleTap)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_tooSlowForDoubleTap_ object:0];
    self->_isWaitingForTooSlowForDoubleTap = 0;
  }
}

- (void)holdToAction:(id)a3
{
  self->_isWaitingForHoldToAction = 0;
  if ([(UIGestureRecognizer *)self state] != UIGestureRecognizerStateEnded
    && [(UIGestureRecognizer *)self state] != UIGestureRecognizerStateCancelled)
  {
    [(_UITapTapHoldGestureRecognizer *)self setGestureType:3];
    [(_UITapTapHoldGestureRecognizer *)self setIsInHoldToAction:1];
    [(UIGestureRecognizer *)self setState:1];
  }
}

- (void)scheduleHoldToAction
{
  self->_isWaitingForHoldToAction = 1;
}

- (void)cancelPendingHoldToAction
{
  if (self->_isWaitingForHoldToAction)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_holdToAction_ object:0];
    self->_isWaitingForHoldToAction = 0;
  }
}

- (BOOL)_shouldFailInResponseToPresses:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI])
  {
    double v6 = [(UIGestureRecognizer *)self allowedTouchTypes];
    if ([v6 containsObject:&unk_1ED3F4BD8])
    {
      char v7 = _UIPressesContainsPressType(v5, 4);

      if (v7)
      {
        LOBYTE(v8) = 1;
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if ([(UITapGestureRecognizer *)self isSingleKeyPressGesture]
    && ([(UIGestureRecognizer *)self allowedPressTypes],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v10))
  {
    double v11 = [(UIGestureRecognizer *)self allowedPressTypes];
    int v8 = _UIPressesOnlyContainsPressTypes(v5, v11) ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
LABEL_10:

  return v8;
}

- (int64_t)gestureType
{
  return self->_gestureType;
}

- (void)setGestureType:(int64_t)a3
{
  self->_gestureType = a3;
}

- (int)currentNumberOfPresses
{
  return self->_currentNumberOfPresses;
}

- (void)setCurrentNumberOfPresses:(int)a3
{
  self->_int currentNumberOfPresses = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)pressEventBeginTimestamp
{
  return self->_pressEventBeginTimestamp;
}

- (void)setPressEventBeginTimestamp:(double)a3
{
  self->_double pressEventBeginTimestamp = a3;
}

- (BOOL)isWaitingForHoldToAction
{
  return self->_isWaitingForHoldToAction;
}

- (void)setIsWaitingForHoldToAction:(BOOL)a3
{
  self->_isWaitingForHoldToAction = a3;
}

- (BOOL)isInHoldToAction
{
  return self->_isInHoldToAction;
}

- (void)setIsInHoldToAction:(BOOL)a3
{
  self->_isInHoldToAction = a3;
}

- (BOOL)isWaitingForTooSlowForDoubleTap
{
  return self->_isWaitingForTooSlowForDoubleTap;
}

- (void)setIsWaitingForTooSlowForDoubleTap:(BOOL)a3
{
  self->_isWaitingForTooSlowForDoubleTap = a3;
}

@end