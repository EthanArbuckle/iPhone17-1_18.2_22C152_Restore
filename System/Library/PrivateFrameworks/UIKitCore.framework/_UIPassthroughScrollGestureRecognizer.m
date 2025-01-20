@interface _UIPassthroughScrollGestureRecognizer
+ (BOOL)_supportsTouchContinuation;
+ (BOOL)canHandleEventForPassthrough:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)endForPrimaryButtonDown;
- (BOOL)endForSecondaryButtonDown;
- (BOOL)shouldReceiveEvent:(id)a3;
- (_UIPassthroughScrollGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (unint64_t)endReason;
- (void)_beginAtLocation:(CGPoint)a3;
- (void)_endWithReason:(unint64_t)a3;
- (void)_scrollingChangedWithEvent:(id)a3;
- (void)_transformChangedWithEvent:(id)a3;
- (void)reset;
- (void)setEndForPrimaryButtonDown:(BOOL)a3;
- (void)setEndForSecondaryButtonDown:(BOOL)a3;
- (void)setView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIPassthroughScrollGestureRecognizer

- (void)setView:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      [v6 handleFailureInMethod:a2, self, @"_UIPassthroughScrollGestureRecognizer.m", 67, @"%@ can only be added to a window", v8 object file lineNumber description];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)_UIPassthroughScrollGestureRecognizer;
  [(UIGestureRecognizer *)&v9 setView:a3];
}

- (void)setEndForPrimaryButtonDown:(BOOL)a3
{
  self->_endForPrimaryButtonDown = a3;
}

- (_UIPassthroughScrollGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPassthroughScrollGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    *((unsigned char *)&v4->super._gestureFlags + 8) &= ~8u;
    [(UIGestureRecognizer *)v4 _setRequiresSystemGesturesToFail:1];
  }
  return v5;
}

+ (BOOL)_supportsTouchContinuation
{
  return 0;
}

- (void)reset
{
  self->_startPoint = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_startTime = 0.0;
  self->_accumulatedScrollEventDelta.dx = 0.0;
  self->_accumulatedScrollEventDelta.dy = 0.0;
  *(unsigned char *)&self->_flags &= ~1u;
}

- (void)_beginAtLocation:(CGPoint)a3
{
  self->_startPoint = a3;
  self->_startTime = CACurrentMediaTime();
  self->_endReason = 0;
  [(UIGestureRecognizer *)self setState:1];
}

- (void)_endWithReason:(unint64_t)a3
{
  self->_endReason = a3;
  [(UIGestureRecognizer *)self setState:3];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    v6 = [(UIGestureRecognizer *)self view];
    [(UIGestureRecognizer *)self locationInView:v6];
    -[_UIPassthroughScrollGestureRecognizer _beginAtLocation:](self, "_beginAtLocation:");

    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | (([(UIGestureRecognizer *)self modifierFlags] & 0x100000) != 0);
    if ([(_UIPassthroughScrollGestureRecognizer *)self endForSecondaryButtonDown]
      && ([a4 buttonMask] & 2) != 0)
    {
      uint64_t v7 = 5;
    }
    else
    {
      if (![(_UIPassthroughScrollGestureRecognizer *)self endForPrimaryButtonDown]
        || ([a4 buttonMask] & 1) == 0)
      {
        return;
      }
      uint64_t v7 = 2;
    }
    [(_UIPassthroughScrollGestureRecognizer *)self _endWithReason:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v5 = [(UIGestureRecognizer *)self view];
  [(UIGestureRecognizer *)self locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = sqrt((v7 - self->_startPoint.x) * (v7 - self->_startPoint.x)+ (v9 - self->_startPoint.y) * (v9 - self->_startPoint.y));
  if (([(UIGestureRecognizer *)self modifierFlags] & 0x100000) == 0) {
    *(unsigned char *)&self->_flags &= ~1u;
  }
  if (v10 > 10.0)
  {
    v11 = [(_UIPassthroughScrollGestureRecognizer *)self _window];
    if ([v11 _hasSystemGestureGate])
    {

LABEL_10:
      [(_UIPassthroughScrollGestureRecognizer *)self _endWithReason:4];
      return;
    }
    v12 = [(_UIPassthroughScrollGestureRecognizer *)self _window];
    char v13 = [v12 _systemGestureRecognitionIsPossible];

    if ((v13 & 1) == 0) {
      goto LABEL_10;
    }
  }
  [(UIGestureRecognizer *)self setState:2];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5 = [(UIGestureRecognizer *)self view];
  [(UIGestureRecognizer *)self locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = sqrt((v7 - self->_startPoint.x) * (v7 - self->_startPoint.x)+ (v9 - self->_startPoint.y) * (v9 - self->_startPoint.y));
  double v11 = CACurrentMediaTime();
  double startTime = self->_startTime;
  if (([(UIGestureRecognizer *)self modifierFlags] & 0x100000) == 0) {
    *(unsigned char *)&self->_flags &= ~1u;
  }
  if (v10 <= 10.0)
  {
    if (v11 - startTime <= 1.5)
    {
      if (*(unsigned char *)&self->_flags) {
        uint64_t v13 = 3;
      }
      else {
        uint64_t v13 = 2;
      }
    }
    else
    {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 4;
  }
  [(_UIPassthroughScrollGestureRecognizer *)self _endWithReason:v13];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  double v7 = [(UIGestureRecognizer *)self delegate];
  if (v7)
  {
    double v8 = [(UIGestureRecognizer *)self view];
    [a3 locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    char v13 = objc_msgSend(v7, "_passthroughGestureRecognizer:shouldInteractAtLocation:withEvent:", self, a4, v10, v12);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (BOOL)canHandleEventForPassthrough:(id)a3
{
  return ![a3 type] || objc_msgSend(a3, "type") == 10 || objc_msgSend(a3, "type") == 14;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  if (+[_UIPassthroughScrollGestureRecognizer canHandleEventForPassthrough:](_UIPassthroughScrollGestureRecognizer, "canHandleEventForPassthrough:"))
  {
    v5 = [(UIGestureRecognizer *)self delegate];
    if (v5)
    {
      if ([a3 type] == 10)
      {
        id v6 = a3;
        double v7 = [(UIGestureRecognizer *)self view];
        [v6 locationInView:v7];
        double v9 = v8;
        double v11 = v10;

        char v12 = objc_msgSend(v5, "_passthroughGestureRecognizer:shouldInteractAtLocation:withEvent:", self, v6, v9, v11);
      }
      else
      {
        char v12 = 1;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIPassthroughScrollGestureRecognizer;
    return [(UIGestureRecognizer *)&v14 shouldReceiveEvent:a3];
  }
  return v12;
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  v5 = [(UIGestureRecognizer *)self view];
  [a3 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  if ([a3 phase] == 2)
  {
    -[_UIPassthroughScrollGestureRecognizer _beginAtLocation:](self, "_beginAtLocation:", v7, v9);
    return;
  }
  if ([a3 phase] == 5)
  {
    if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateEnded) {
      return;
    }
    goto LABEL_7;
  }
  if (self->_startTime == 0.0) {
    return;
  }
  char v12 = [(UIGestureRecognizer *)self view];
  [a3 _adjustedAcceleratedDeltaInView:v12];
  double v14 = v13;
  double v16 = v15;

  CGFloat v17 = v14 + self->_accumulatedScrollEventDelta.dx;
  CGFloat v18 = v16 + self->_accumulatedScrollEventDelta.dy;
  self->_accumulatedScrollEventDelta.dx = v17;
  self->_accumulatedScrollEventDelta.dy = v18;
  if (sqrt(v17 * v17 + v18 * v18) > 10.0)
  {
    double v10 = self;
    uint64_t v11 = 4;
    goto LABEL_12;
  }
  if ([a3 phase] != 3)
  {
LABEL_7:
    double v10 = self;
    uint64_t v11 = 1;
LABEL_12:
    [(_UIPassthroughScrollGestureRecognizer *)v10 _endWithReason:v11];
    return;
  }
  [(UIGestureRecognizer *)self setState:2];
}

- (void)_transformChangedWithEvent:(id)a3
{
  v5 = [(UIGestureRecognizer *)self view];
  [a3 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [a3 phase];
  if ((unint64_t)(v10 - 2) < 2)
  {
    uint64_t v11 = self;
    uint64_t v12 = 6;
  }
  else
  {
    if (v10 != 4)
    {
      if (v10 == 1)
      {
        -[_UIPassthroughScrollGestureRecognizer _beginAtLocation:](self, "_beginAtLocation:", v7, v9);
      }
      return;
    }
    uint64_t v11 = self;
    uint64_t v12 = 1;
  }
  [(_UIPassthroughScrollGestureRecognizer *)v11 _endWithReason:v12];
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (BOOL)endForPrimaryButtonDown
{
  return self->_endForPrimaryButtonDown;
}

- (BOOL)endForSecondaryButtonDown
{
  return self->_endForSecondaryButtonDown;
}

- (void)setEndForSecondaryButtonDown:(BOOL)a3
{
  self->_endForSecondaryButtonDown = a3;
}

@end