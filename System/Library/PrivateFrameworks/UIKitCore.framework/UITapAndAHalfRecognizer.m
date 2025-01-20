@interface UITapAndAHalfRecognizer
- (CGPoint)locationOfFirstTap;
- (CGPoint)translationInWindowCoordinates;
- (UITapAndAHalfRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UITouch)touch;
- (double)allowableMovement;
- (double)minimumFinalPressDuration;
- (int)numberOfFullTaps;
- (void)_resetGestureRecognizer;
- (void)_verifyMovementInAllowableRange;
- (void)clearTapTimer;
- (void)dealloc;
- (void)recognized:(id)a3;
- (void)setAllowableMovement:(double)a3;
- (void)setMinimumFinalPressDuration:(double)a3;
- (void)setNumberOfFullTaps:(int)a3;
- (void)setTouch:(id)a3;
- (void)startRecognitionTimer:(double)a3;
- (void)startTapTimer:(double)a3;
- (void)tooSlow:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UITapAndAHalfRecognizer

- (UITapAndAHalfRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UITapAndAHalfRecognizer;
  v4 = [(UIGestureRecognizer *)&v9 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_numberOfFullTaps = 1;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeTouches = v5->_activeTouches;
    v5->_activeTouches = v6;

    v5->_allowableMovement = 1.79769313e308;
    v5->_minimumFinalPressDuration = 0.15;
    [(UIGestureRecognizer *)v5 reset];
  }
  return v5;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void)dealloc
{
  [(UITapAndAHalfRecognizer *)self clearTapTimer];
  [(UITapAndAHalfRecognizer *)self setTouch:0];
  v3.receiver = self;
  v3.super_class = (Class)UITapAndAHalfRecognizer;
  [(UIGestureRecognizer *)&v3 dealloc];
}

- (void)setTouch:(id)a3
{
}

- (void)clearTapTimer
{
  v4 = self;
  tapTimer = v4->_tapTimer;
  if (tapTimer)
  {
    [(UIDelayedAction *)tapTimer setTarget:0];
    [(UIDelayedAction *)v4->_tapTimer unschedule];
    objc_super v3 = v4->_tapTimer;
    v4->_tapTimer = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapTimer, 0);
  objc_storeStrong((id *)&self->_touch, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

- (void)setNumberOfFullTaps:(int)a3
{
  self->_numberOfFullTaps = a3;
}

- (void)_resetGestureRecognizer
{
  [(UITapAndAHalfRecognizer *)self clearTapTimer];
  self->_currentNumberOfTaps = 0;
  [(NSMutableSet *)self->_activeTouches removeAllObjects];
  [(UITapAndAHalfRecognizer *)self setTouch:0];
  v3.receiver = self;
  v3.super_class = (Class)UITapAndAHalfRecognizer;
  [(UIGestureRecognizer *)&v3 _resetGestureRecognizer];
}

- (void)startRecognitionTimer:(double)a3
{
  [(UITapAndAHalfRecognizer *)self clearTapTimer];
  v5 = [UIDelayedAction alloc];
  v6 = [(UIDelayedAction *)v5 initWithTarget:self action:sel_recognized_ userInfo:0 delay:*MEMORY[0x1E4F1C4B0] mode:a3];
  tapTimer = self->_tapTimer;
  self->_tapTimer = v6;
}

- (void)startTapTimer:(double)a3
{
  [(UITapAndAHalfRecognizer *)self clearTapTimer];
  v5 = [UIDelayedAction alloc];
  v6 = [(UIDelayedAction *)v5 initWithTarget:self action:sel_tooSlow_ userInfo:0 delay:*MEMORY[0x1E4F1C4B0] mode:a3];
  tapTimer = self->_tapTimer;
  self->_tapTimer = v6;
}

- (void)tooSlow:(id)a3
{
  [(UIGestureRecognizer *)self setState:5];
  [(UITapAndAHalfRecognizer *)self clearTapTimer];
}

- (void)recognized:(id)a3
{
  [(UIGestureRecognizer *)self setState:1];
  [(UITapAndAHalfRecognizer *)self clearTapTimer];
}

- (void)_verifyMovementInAllowableRange
{
  if (self->_allowableMovement != 1.79769313e308)
  {
    objc_super v3 = [(UITapAndAHalfRecognizer *)self touch];
    [v3 locationInView:0];
    double v5 = v4;
    double v7 = v6;

    if (sqrt((self->_startPoint.x - v5) * (self->_startPoint.x - v5)+ (self->_startPoint.y - v7) * (self->_startPoint.y - v7)) > self->_allowableMovement)
    {
      [(UITapAndAHalfRecognizer *)self clearTapTimer];
      [(UIGestureRecognizer *)self setState:5];
    }
  }
}

- (CGPoint)translationInWindowCoordinates
{
  objc_super v3 = [(UITapAndAHalfRecognizer *)self touch];
  [v3 locationInView:0];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5 - self->_startPoint.x;
  double v9 = v7 - self->_startPoint.y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(NSMutableSet *)self->_activeTouches count]
    && [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateFailed)
  {
    [(UIGestureRecognizer *)self reset];
  }
  if ((unint64_t)(self->super._state - 1) > 2)
  {
    [(NSMutableSet *)self->_activeTouches unionSet:v6];
    if ((unint64_t)[(NSMutableSet *)self->_activeTouches count] >= 2)
    {
      [(UITapAndAHalfRecognizer *)self clearTapTimer];
      [(UIGestureRecognizer *)self setState:5];
    }
    if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
    {
      v13 = [(NSMutableSet *)self->_activeTouches anyObject];
      [(UITapAndAHalfRecognizer *)self setTouch:v13];

      v14 = [(UITapAndAHalfRecognizer *)self touch];
      [v14 locationInView:0];
      double v16 = v15;
      double v18 = v17;

      if (self->_currentNumberOfTaps)
      {
        [(UITapAndAHalfRecognizer *)self allowableMovement];
        if (v19 != 1.79769313e308)
        {
          double v20 = sqrt((v16 - self->_startPoint.x) * (v16 - self->_startPoint.x)+ (v18 - self->_startPoint.y) * (v18 - self->_startPoint.y));
          [(UITapAndAHalfRecognizer *)self allowableMovement];
          if (v20 > v21)
          {
            [(UITapAndAHalfRecognizer *)self clearTapTimer];
            [(UIGestureRecognizer *)self setState:5];
          }
        }
      }
      else
      {
        self->_startPoint.x = v16;
        self->_startPoint.y = v18;
      }
      if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
      {
        int currentNumberOfTaps = self->_currentNumberOfTaps;
        if (currentNumberOfTaps == [(UITapAndAHalfRecognizer *)self numberOfFullTaps])
        {
          [(UITapAndAHalfRecognizer *)self minimumFinalPressDuration];
          -[UITapAndAHalfRecognizer startRecognitionTimer:](self, "startRecognitionTimer:");
        }
        else
        {
          [(UITapAndAHalfRecognizer *)self startTapTimer:0.5];
        }
      }
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          -[UIGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(void *)(*((void *)&v23 + 1) + 8 * i), v7, (void)v23);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = [(UITapAndAHalfRecognizer *)self touch];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    if (self && (unint64_t)(self->super._state - 1) <= 2)
    {
      [(UITapAndAHalfRecognizer *)self clearTapTimer];
      [(UIGestureRecognizer *)self setState:2];
    }
    else
    {
      int currentNumberOfTaps = self->_currentNumberOfTaps;
      if (currentNumberOfTaps < [(UITapAndAHalfRecognizer *)self numberOfFullTaps])
      {
        [(UITapAndAHalfRecognizer *)self _verifyMovementInAllowableRange];
      }
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  activeTouches = self->_activeTouches;
  id v6 = a3;
  [(NSMutableSet *)activeTouches minusSet:v6];
  int v7 = [(UITapAndAHalfRecognizer *)self touch];
  int v8 = [v6 containsObject:v7];

  if (!v8) {
    return;
  }
  if ((unint64_t)(self->super._state - 1) <= 2)
  {
    [(UITapAndAHalfRecognizer *)self clearTapTimer];
    uint64_t v9 = self;
    uint64_t v10 = 3;
LABEL_4:
    [(UIGestureRecognizer *)v9 setState:v10];
    return;
  }
  if ([(UIGestureRecognizer *)self state]) {
    return;
  }
  [(UITapAndAHalfRecognizer *)self _verifyMovementInAllowableRange];
  if ([(UIGestureRecognizer *)self state] || [(NSMutableSet *)self->_activeTouches count]) {
    return;
  }
  int currentNumberOfTaps = self->_currentNumberOfTaps;
  self->_int currentNumberOfTaps = currentNumberOfTaps + 1;
  if (currentNumberOfTaps >= [(UITapAndAHalfRecognizer *)self numberOfFullTaps])
  {
    [(UITapAndAHalfRecognizer *)self clearTapTimer];
    uint64_t v9 = self;
    uint64_t v10 = 5;
    goto LABEL_4;
  }
  [(UITapAndAHalfRecognizer *)self startTapTimer:0.3];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", a3, a4);
  [(UITapAndAHalfRecognizer *)self clearTapTimer];
  [(UIGestureRecognizer *)self setState:5];
}

- (CGPoint)locationOfFirstTap
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int)numberOfFullTaps
{
  return self->_numberOfFullTaps;
}

- (UITouch)touch
{
  return self->_touch;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (double)minimumFinalPressDuration
{
  return self->_minimumFinalPressDuration;
}

- (void)setMinimumFinalPressDuration:(double)a3
{
  self->_minimumFinalPressDuration = a3;
}

@end