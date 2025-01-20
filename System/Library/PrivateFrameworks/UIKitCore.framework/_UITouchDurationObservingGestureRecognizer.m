@interface _UITouchDurationObservingGestureRecognizer
- (BOOL)_exceededNumberOfTouchesForEvent:(id)a3;
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)hasExceededAllowableMovement;
- (CADisplayLink)displayLink;
- (CGPoint)originalCentroid;
- (UIDelayedAction)delayedAction;
- (_UITouchDurationObservingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)allowableMovement;
- (double)minimumDurationRequired;
- (double)touchDuration;
- (double)touchForce;
- (double)touchStartTimestamp;
- (id)_allTouchesMatchingRequirementsForEvent:(id)a3;
- (void)_cancelOrFail;
- (void)_displayLinkDidFire:(id)a3;
- (void)_performDelayedBegin;
- (void)dealloc;
- (void)reset;
- (void)setAllowableMovement:(double)a3;
- (void)setMinimumDurationRequired:(double)a3;
- (void)setOriginalCentroid:(CGPoint)a3;
- (void)setTouchStartTimestamp:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UITouchDurationObservingGestureRecognizer

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (_UITouchDurationObservingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UITouchDurationObservingGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(_UITouchDurationObservingGestureRecognizer *)v4 setMinimumDurationRequired:0.15];
    [(_UITouchDurationObservingGestureRecognizer *)v5 setTouchStartTimestamp:978307200.0];
  }
  return v5;
}

- (void)setMinimumDurationRequired:(double)a3
{
  self->_minimumDurationRequired = a3;
}

- (void)setTouchStartTimestamp:(double)a3
{
  self->_touchStartTimestamp = a3;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITouchDurationObservingGestureRecognizer;
  BOOL result = -[UIGestureRecognizer _isGestureType:](&v5, sel__isGestureType_);
  if (a3 == 7) {
    return 1;
  }
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(UIGestureRecognizer *)self state] <= UIGestureRecognizerStatePossible) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 3;
  }
  [(UIGestureRecognizer *)self setState:v5];
}

- (void)_displayLinkDidFire:(id)a3
{
  -[UIGestureRecognizer _activeTouchesEvent](self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_UITouchDurationObservingGestureRecognizer _exceededNumberOfTouchesForEvent:](self, "_exceededNumberOfTouchesForEvent:"))
  {
    [(_UITouchDurationObservingGestureRecognizer *)self _cancelOrFail];
  }
  else
  {
    v4 = [(_UITouchDurationObservingGestureRecognizer *)self _allTouchesMatchingRequirementsForEvent:v5];
    self->_touchForce = _UITouchForceFromTouches(v4);

    if ([(UIGestureRecognizer *)self state] < UIGestureRecognizerStateBegan
      || [(UIGestureRecognizer *)self state] > UIGestureRecognizerStateEnded)
    {
      if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible && self->_touchForce >= 2.6)
      {
        [(_UITouchDurationObservingGestureRecognizer *)self _performDelayedBegin];
        [(UIDelayedAction *)self->_delayedAction cancel];
      }
    }
    else
    {
      [(UIGestureRecognizer *)self setState:2];
    }
  }
}

- (id)_allTouchesMatchingRequirementsForEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = objc_msgSend(v4, "allTouches", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v12 = [v11 type];
        if (self && (self->super._allowedTouchTypes & (1 << v12)) != 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_exceededNumberOfTouchesForEvent:(id)a3
{
  v3 = [(_UITouchDurationObservingGestureRecognizer *)self _allTouchesMatchingRequirementsForEvent:a3];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedAction, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)dealloc
{
  displayLink = self->_displayLink;
  BOOL v4 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)displayLink removeFromRunLoop:v4 forMode:*MEMORY[0x1E4F1C4B0]];

  v5.receiver = self;
  v5.super_class = (Class)_UITouchDurationObservingGestureRecognizer;
  [(UIGestureRecognizer *)&v5 dealloc];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v9 = [(_UITouchDurationObservingGestureRecognizer *)self _allTouchesMatchingRequirementsForEvent:a4];
  if ([v9 count] == 1 && -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    [(UIGestureRecognizer *)self locationInView:0];
    -[_UITouchDurationObservingGestureRecognizer setOriginalCentroid:](self, "setOriginalCentroid:");
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[_UITouchDurationObservingGestureRecognizer setTouchStartTimestamp:](self, "setTouchStartTimestamp:");
    objc_super v5 = [UIDelayedAction alloc];
    [(_UITouchDurationObservingGestureRecognizer *)self minimumDurationRequired];
    v6 = -[UIDelayedAction initWithTarget:action:userInfo:delay:](v5, "initWithTarget:action:userInfo:delay:", self, sel__performDelayedBegin, 0);
    delayedAction = self->_delayedAction;
    self->_delayedAction = v6;

    self->_touchForce = _UITouchForceFromTouches(v9);
    uint64_t v8 = [(_UITouchDurationObservingGestureRecognizer *)self displayLink];
    [v8 setPaused:0];
  }
  else
  {
    [(_UITouchDurationObservingGestureRecognizer *)self _cancelOrFail];
  }
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)_UITouchDurationObservingGestureRecognizer;
  [(UIGestureRecognizer *)&v5 reset];
  [(CADisplayLink *)self->_displayLink setPaused:1];
  v3 = [(_UITouchDurationObservingGestureRecognizer *)self delayedAction];
  [v3 cancel];

  delayedAction = self->_delayedAction;
  self->_delayedAction = 0;

  self->_touchForce = 0.0;
  self->_hasExceededAllowableMovement = 0;
  [(_UITouchDurationObservingGestureRecognizer *)self setTouchStartTimestamp:978307200.0];
  -[_UITouchDurationObservingGestureRecognizer setOriginalCentroid:](self, "setOriginalCentroid:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)setOriginalCentroid:(CGPoint)a3
{
  self->_originalCentroid = a3;
}

- (double)minimumDurationRequired
{
  return self->_minimumDurationRequired;
}

- (CADisplayLink)displayLink
{
  displayLink = self->_displayLink;
  if (!displayLink)
  {
    BOOL v4 = [[_UIWeakDisplayLinkTarget alloc] initWithTarget:self action:sel__displayLinkDidFire_];
    objc_msgSend(MEMORY[0x1E4F39B68], "displayLinkWithTarget:selector:", v4, +[_UIWeakDisplayLinkTarget displayLinkAction](_UIWeakDisplayLinkTarget, "displayLinkAction"));
    objc_super v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v6 = self->_displayLink;
    self->_displayLink = v5;

    uint64_t v7 = self->_displayLink;
    uint64_t v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v7 addToRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

    [(CADisplayLink *)self->_displayLink setPaused:1];
    displayLink = self->_displayLink;
  }
  return displayLink;
}

- (UIDelayedAction)delayedAction
{
  return self->_delayedAction;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v17 = a4;
  if (-[_UITouchDurationObservingGestureRecognizer _exceededNumberOfTouchesForEvent:](self, "_exceededNumberOfTouchesForEvent:"))
  {
    [(_UITouchDurationObservingGestureRecognizer *)self _cancelOrFail];
  }
  else
  {
    objc_super v5 = [(_UITouchDurationObservingGestureRecognizer *)self _allTouchesMatchingRequirementsForEvent:v17];
    self->_touchForce = _UITouchForceFromTouches(v5);

    [(_UITouchDurationObservingGestureRecognizer *)self allowableMovement];
    if (v6 > 0.0)
    {
      double v7 = v6;
      [(UIGestureRecognizer *)self locationInView:0];
      double v9 = v8;
      double v11 = v10;
      [(_UITouchDurationObservingGestureRecognizer *)self originalCentroid];
      double v14 = vabdd_f64(v11, v13);
      if (vabdd_f64(v9, v12) > v7 || v14 > v7)
      {
        self->_hasExceededAllowableMovement = 1;
        [(_UITouchDurationObservingGestureRecognizer *)self _cancelOrFail];
        long long v16 = [(_UITouchDurationObservingGestureRecognizer *)self delayedAction];
        [v16 cancel];
      }
    }
  }
}

- (CGPoint)originalCentroid
{
  double x = self->_originalCentroid.x;
  double y = self->_originalCentroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (void)_performDelayedBegin
{
}

- (double)touchDuration
{
  [(_UITouchDurationObservingGestureRecognizer *)self touchStartTimestamp];
  double v4 = v3;
  double result = 0.0;
  if (v4 < 978307200.0)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", 0.0);
    double v7 = v6;
    [(_UITouchDurationObservingGestureRecognizer *)self touchStartTimestamp];
    return v7 - v8;
  }
  return result;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 4, a4);
  id v5 = [(_UITouchDurationObservingGestureRecognizer *)self delayedAction];
  [v5 cancel];
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
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
  delayedAction = self->_delayedAction;
  [(UIDelayedAction *)delayedAction cancel];
}

- (BOOL)hasExceededAllowableMovement
{
  return self->_hasExceededAllowableMovement;
}

- (double)touchForce
{
  return self->_touchForce;
}

- (double)touchStartTimestamp
{
  return self->_touchStartTimestamp;
}

@end