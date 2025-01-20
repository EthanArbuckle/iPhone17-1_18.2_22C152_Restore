@interface UIDragRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
- (BOOL)canBeginDrag;
- (BOOL)restrictsToAngle;
- (CGPoint)startPosition;
- (UIDelayedAction)ignoreTouch;
- (UIDragRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UITouch)touch;
- (double)angle;
- (double)maximumDeviation;
- (double)minimumDistance;
- (double)quietPeriod;
- (double)startAngle;
- (void)_resetGestureRecognizer;
- (void)clearIgnoreTouch;
- (void)clearTimer;
- (void)dealloc;
- (void)setAngle:(double)a3;
- (void)setCanBeginDrag:(BOOL)a3;
- (void)setIgnoreTouch:(id)a3;
- (void)setMaximumDeviation:(double)a3;
- (void)setMinimumDistance:(double)a3;
- (void)setQuietPeriod:(double)a3;
- (void)setRestrictsToAngle:(BOOL)a3;
- (void)setStartAngle:(double)a3;
- (void)setStartPosition:(CGPoint)a3;
- (void)setTouch:(id)a3;
- (void)tooSlow:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIDragRecognizer

- (UIDragRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIDragRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIDragRecognizer *)v4 setRestrictsToAngle:1];
    [(UIDragRecognizer *)v5 setAngle:0.0];
    [(UIDragRecognizer *)v5 setMinimumDistance:50.0];
    [(UIDragRecognizer *)v5 setMaximumDeviation:0.261799388];
    [(UIGestureRecognizer *)v5 reset];
  }
  return v5;
}

- (void)dealloc
{
  [(UIDragRecognizer *)self clearTimer];
  [(UIDragRecognizer *)self setTouch:0];
  [(UIDragRecognizer *)self clearIgnoreTouch];
  v3.receiver = self;
  v3.super_class = (Class)UIDragRecognizer;
  [(UIGestureRecognizer *)&v3 dealloc];
}

- (void)_resetGestureRecognizer
{
  [(UIDragRecognizer *)self clearTimer];
  [(UIDragRecognizer *)self setTouch:0];
  v3.receiver = self;
  v3.super_class = (Class)UIDragRecognizer;
  [(UIGestureRecognizer *)&v3 _resetGestureRecognizer];
}

- (void)clearTimer
{
  [(UIDelayedAction *)self->_tooSlow unschedule];
  tooSlow = self->_tooSlow;
  self->_tooSlow = 0;
}

- (void)tooSlow:(id)a3
{
  [(UIDragRecognizer *)self clearTimer];
  [(UIGestureRecognizer *)self setState:5];
}

- (void)clearIgnoreTouch
{
  objc_super v3 = [(UIDragRecognizer *)self ignoreTouch];
  [v3 unschedule];

  [(UIDragRecognizer *)self setIgnoreTouch:0];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v16 = a3;
  tooSlow = [(UIDragRecognizer *)self ignoreTouch];
  if (tooSlow) {
    goto LABEL_2;
  }
  v6 = [(UIDragRecognizer *)self touch];

  if (!v6)
  {
    v11 = [v16 anyObject];
    [(UIDragRecognizer *)self setTouch:v11];

    v12 = [(UIDragRecognizer *)self touch];
    v13 = [(UIGestureRecognizer *)self view];
    [v12 locationInView:v13];
    -[UIDragRecognizer setStartPosition:](self, "setStartPosition:");

    v14 = [UIDelayedAction alloc];
    v15 = [(UIDelayedAction *)v14 initWithTarget:self action:sel_tooSlow_ userInfo:0 delay:*MEMORY[0x1E4F1C4B0] mode:2.0];
    tooSlow = self->_tooSlow;
    self->_tooSlow = v15;
LABEL_2:
  }
  [(UIDragRecognizer *)self quietPeriod];
  if (v7 > 0.0)
  {
    v8 = [(UIDragRecognizer *)self ignoreTouch];

    if (v8)
    {
      v9 = [(UIDragRecognizer *)self ignoreTouch];
      [(UIDragRecognizer *)self quietPeriod];
      -[UIDelayedAction touchWithDelay:](v9, "touchWithDelay:");
    }
    else
    {
      v10 = [UIDelayedAction alloc];
      [(UIDragRecognizer *)self quietPeriod];
      v9 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v10, "initWithTarget:action:userInfo:delay:mode:", self, sel_clearIgnoreTouch, 0, *MEMORY[0x1E4F1C4B0]);
      [(UIDragRecognizer *)self setIgnoreTouch:v9];
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  v6 = [(UIDragRecognizer *)self touch];
  int v7 = [v5 containsObject:v6];

  if (!v7) {
    return;
  }
  if (self && (unint64_t)(self->super._state - 1) < 3)
  {
    uint64_t v8 = 2;
LABEL_5:
    [(UIGestureRecognizer *)self setState:v8];
    return;
  }
  v9 = [(UIDragRecognizer *)self touch];
  v10 = [(UIGestureRecognizer *)self view];
  [v9 locationInView:v10];
  double v12 = v11;
  double v14 = v13;

  [(UIDragRecognizer *)self startPosition];
  double v17 = (v15 - v12) * (v15 - v12) + (v16 - v14) * (v16 - v14);
  [(UIDragRecognizer *)self startPosition];
  long double v19 = v12 - v18;
  [(UIDragRecognizer *)self startPosition];
  double v21 = atan2(v14 - v20, v19);
  if (v21 >= 0.0) {
    double v22 = v21;
  }
  else {
    double v22 = v21 + 3.14159265;
  }
  [(UIDragRecognizer *)self angle];
  double v24 = v23 - v22;
  if (v24 >= 0.0) {
    double v25 = v24;
  }
  else {
    double v25 = -v24;
  }
  [(UIDragRecognizer *)self angle];
  double v27 = v26 + 3.14159265 - v22;
  if (v27 < 0.0) {
    double v27 = -v27;
  }
  if (v27 < v25)
  {
    [(UIDragRecognizer *)self angle];
    double v29 = v28 + 3.14159265 - v22;
    if (v29 >= 0.0) {
      double v25 = v29;
    }
    else {
      double v25 = -v29;
    }
  }
  double v30 = sqrt(v17);
  [(UIDragRecognizer *)self angle];
  double v32 = v31 - (v22 + 3.14159265);
  if (v32 < 0.0) {
    double v32 = -v32;
  }
  if (v32 < v25)
  {
    [(UIDragRecognizer *)self angle];
    double v34 = v33 - (v22 + 3.14159265);
    if (v34 >= 0.0) {
      double v25 = v34;
    }
    else {
      double v25 = -v34;
    }
  }
  [(UIDragRecognizer *)self minimumDistance];
  double v36 = v35;
  BOOL v37 = [(UIDragRecognizer *)self restrictsToAngle];
  if (v30 <= v36)
  {
    if (v30 > 20.0 && v37)
    {
      [(UIDragRecognizer *)self maximumDeviation];
      if (v25 > v41)
      {
        [(UIDragRecognizer *)self clearTimer];
        uint64_t v8 = 5;
        goto LABEL_5;
      }
    }
  }
  else
  {
    if (v37)
    {
      [(UIDragRecognizer *)self maximumDeviation];
      BOOL v39 = v25 <= v38;
    }
    else
    {
      BOOL v39 = 1;
    }
    [(UIDragRecognizer *)self setCanBeginDrag:v39];
    if ([(UIDragRecognizer *)self canBeginDrag])
    {
      [(UIDragRecognizer *)self clearTimer];
      [(UIDragRecognizer *)self setStartAngle:v22];
      uint64_t v8 = 1;
      goto LABEL_5;
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  v6 = [(UIDragRecognizer *)self touch];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    if (self && (unint64_t)(self->super._state - 1) < 3)
    {
      uint64_t v8 = 3;
    }
    else
    {
      [(UIDragRecognizer *)self clearTimer];
      uint64_t v8 = 5;
    }
    [(UIGestureRecognizer *)self setState:v8];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  [(UIDragRecognizer *)self clearTimer];
  [(UIGestureRecognizer *)self setState:5];
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (double)maximumDeviation
{
  return self->_maximumDeviation;
}

- (void)setMaximumDeviation:(double)a3
{
  self->_maximumDeviation = a3;
}

- (CGPoint)startPosition
{
  double x = self->_startPosition.x;
  double y = self->_startPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartPosition:(CGPoint)a3
{
  self->_startPosition = a3;
}

- (double)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(double)a3
{
  self->_minimumDistance = a3;
}

- (UITouch)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
}

- (BOOL)restrictsToAngle
{
  return self->_restrictsToAngle;
}

- (void)setRestrictsToAngle:(BOOL)a3
{
  self->_restrictsToAngle = a3;
}

- (double)angle
{
  return self->_angle;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

- (double)startAngle
{
  return self->_startAngle;
}

- (void)setStartAngle:(double)a3
{
  self->_startAngle = a3;
}

- (double)quietPeriod
{
  return self->_quietPeriod;
}

- (void)setQuietPeriod:(double)a3
{
  self->_quietPeriod = a3;
}

- (BOOL)canBeginDrag
{
  return self->_canBeginDrag;
}

- (void)setCanBeginDrag:(BOOL)a3
{
  self->_canBeginDrag = a3;
}

- (UIDelayedAction)ignoreTouch
{
  return self->ignoreTouch;
}

- (void)setIgnoreTouch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ignoreTouch, 0);
  objc_storeStrong((id *)&self->_tooSlow, 0);
  objc_storeStrong((id *)&self->_touch, 0);
}

@end