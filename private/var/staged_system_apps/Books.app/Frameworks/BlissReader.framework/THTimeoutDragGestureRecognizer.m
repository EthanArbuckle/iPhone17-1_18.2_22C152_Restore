@interface THTimeoutDragGestureRecognizer
- (BOOL)hasMovedDistance:(CGPoint)a3;
- (BOOL)isStylus;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)requiredMovement;
- (CGPoint)touchMovement;
- (CGPoint)touchStartPoint;
- (NSTimer)cancelTimer;
- (NSTimer)recognizeTimer;
- (UIGestureRecognizer)dependentGestureRecognizer;
- (double)allowableMovement;
- (double)maximumPressDuration;
- (double)minimumPressDuration;
- (double)touchStartTime;
- (void)dealloc;
- (void)p_cancelTimerFired;
- (void)p_recognizeTimerFired;
- (void)p_startCancelTimerWithTimeout:(double)a3;
- (void)p_startRecognizeTimer;
- (void)p_teardownTimers;
- (void)reset;
- (void)setAllowableMovement:(double)a3;
- (void)setCancelTimer:(id)a3;
- (void)setDependentGestureRecognizer:(id)a3;
- (void)setMaximumPressDuration:(double)a3;
- (void)setMinimumPressDuration:(double)a3;
- (void)setRecognizeTimer:(id)a3;
- (void)setRequiredMovement:(CGPoint)a3;
- (void)setState:(int64_t)a3;
- (void)setStylus:(BOOL)a3;
- (void)setTouchMovement:(CGPoint)a3;
- (void)setTouchStartPoint:(CGPoint)a3;
- (void)setTouchStartTime:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation THTimeoutDragGestureRecognizer

- (void)dealloc
{
  if (self->_cancelTimer) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTimeoutDragGestureRecognizer dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTimeoutDragGestureRecognizer.m") lineNumber:51 description:@"expected nil value for '%s'", "_cancelTimer"];
  }
  if (self->_recognizeTimer) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTimeoutDragGestureRecognizer dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTimeoutDragGestureRecognizer.m") lineNumber:52 description:@"expected nil value for '%s'", "_recognizeTimer"];
  }

  v3.receiver = self;
  v3.super_class = (Class)THTimeoutDragGestureRecognizer;
  [(THTimeoutDragGestureRecognizer *)&v3 dealloc];
}

- (BOOL)hasMovedDistance:(CGPoint)a3
{
  return fabs(self->_touchMovement.x) >= a3.x || fabs(self->_touchMovement.y) >= a3.y;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)THTimeoutDragGestureRecognizer;
  -[THTimeoutDragGestureRecognizer touchesBegan:withEvent:](&v14, "touchesBegan:withEvent:");
  if (objc_msgSend(objc_msgSend(a4, "allTouches"), "count") == (char *)&dword_0 + 1)
  {
    id v7 = [a3 anyObject];
    +[NSDate timeIntervalSinceReferenceDate];
    self->_touchStartTime = v8;
    [v7 locationInView:[self view]];
    self->_touchStartPoint.x = v9;
    self->_touchStartPoint.y = v10;
    self->_touchMovement = CGPointZero;
    [(THTimeoutDragGestureRecognizer *)self delegate];
    v11 = (void *)TSUProtocolCast();
    if (v11)
    {
      [v11 dragGestureRecognizer:self requiredMovementForTouch:v7];
      self->_requiredMovement.x = v12;
      self->_requiredMovement.y = v13;
    }
    [(THTimeoutDragGestureRecognizer *)self p_startRecognizeTimer];
    [(THTimeoutDragGestureRecognizer *)self maximumPressDuration];
    [(THTimeoutDragGestureRecognizer *)self p_startCancelTimerWithTimeout:"p_startCancelTimerWithTimeout:"];
  }
  else
  {
    [(THTimeoutDragGestureRecognizer *)self setState:4];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_msgSend(objc_msgSend(a3, "anyObject"), "locationInView:", -[THTimeoutDragGestureRecognizer view](self, "view"));
  TSDSubtractPoints();
  self->_touchMovement.x = v5;
  self->_touchMovement.y = v6;
  if ([(THTimeoutDragGestureRecognizer *)self state])
  {
    if ([(THTimeoutDragGestureRecognizer *)self state] != (char *)&dword_0 + 1) {
      return;
    }
    uint64_t v7 = 2;
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v9 = v8 - self->_touchStartTime;
    [(THTimeoutDragGestureRecognizer *)self minimumPressDuration];
    if (v9 <= v10)
    {
      TSDPointLength();
      double v12 = v11;
      [(THTimeoutDragGestureRecognizer *)self allowableMovement];
      if (v12 <= v13) {
        return;
      }
      uint64_t v7 = 4;
    }
    else
    {
      if (!-[THTimeoutDragGestureRecognizer hasMovedDistance:](self, "hasMovedDistance:", self->_requiredMovement.x, self->_requiredMovement.y))return; {
      uint64_t v7 = 1;
      }
    }
  }

  [(THTimeoutDragGestureRecognizer *)self setState:v7];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  [(THTimeoutDragGestureRecognizer *)self setState:4];
  v7.receiver = self;
  v7.super_class = (Class)THTimeoutDragGestureRecognizer;
  [(THTimeoutDragGestureRecognizer *)&v7 touchesCancelled:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(THTimeoutDragGestureRecognizer *)self state] == (char *)&dword_0 + 1)
  {
    uint64_t v7 = 3;
  }
  else if ([(THTimeoutDragGestureRecognizer *)self state] == (char *)&dword_0 + 2)
  {
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t v7 = 5;
  }
  [(THTimeoutDragGestureRecognizer *)self setState:v7];
  v8.receiver = self;
  v8.super_class = (Class)THTimeoutDragGestureRecognizer;
  [(THTimeoutDragGestureRecognizer *)&v8 touchesEnded:a3 withEvent:a4];
}

- (CGPoint)locationInView:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)THTimeoutDragGestureRecognizer;
  -[THTimeoutDragGestureRecognizer locationInView:](&v13, "locationInView:");
  double v6 = v5;
  double v8 = v7;
  if ([(THTimeoutDragGestureRecognizer *)self state] == (char *)&dword_0 + 1)
  {
    [self->_touchStartPoint.x, self->_touchStartPoint.y]
    double v6 = v9;
    double v8 = v10;
  }
  double v11 = v6;
  double v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THTimeoutDragGestureRecognizer;
  -[THTimeoutDragGestureRecognizer setState:](&v5, "setState:");
  if ((unint64_t)(a3 - 3) <= 2)
  {
    [(THTimeoutDragGestureRecognizer *)self p_teardownTimers];
    [(UIGestureRecognizer *)self->_dependentGestureRecognizer cancel];
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)THTimeoutDragGestureRecognizer;
  [(THTimeoutDragGestureRecognizer *)&v3 reset];
  [(THTimeoutDragGestureRecognizer *)self p_teardownTimers];
  [(UIGestureRecognizer *)self->_dependentGestureRecognizer cancel];
}

- (void)p_startRecognizeTimer
{
  [(NSTimer *)[(THTimeoutDragGestureRecognizer *)self recognizeTimer] invalidate];
  [(THTimeoutDragGestureRecognizer *)self minimumPressDuration];
  objc_super v3 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_recognizeTimerFired", 0, 0);

  [(THTimeoutDragGestureRecognizer *)self setRecognizeTimer:v3];
}

- (void)p_startCancelTimerWithTimeout:(double)a3
{
  [(NSTimer *)[(THTimeoutDragGestureRecognizer *)self cancelTimer] invalidate];
  objc_super v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"p_cancelTimerFired" selector:0 userInfo:0 repeats:a3];

  [(THTimeoutDragGestureRecognizer *)self setCancelTimer:v5];
}

- (void)p_teardownTimers
{
  [(NSTimer *)[(THTimeoutDragGestureRecognizer *)self recognizeTimer] invalidate];
  [(THTimeoutDragGestureRecognizer *)self setRecognizeTimer:0];
  [(NSTimer *)[(THTimeoutDragGestureRecognizer *)self cancelTimer] invalidate];

  [(THTimeoutDragGestureRecognizer *)self setCancelTimer:0];
}

- (void)p_recognizeTimerFired
{
  if (![(THTimeoutDragGestureRecognizer *)self state])
  {
    if (-[THTimeoutDragGestureRecognizer hasMovedDistance:](self, "hasMovedDistance:", self->_requiredMovement.x, self->_requiredMovement.y)|| (CGPointZero.x == self->_requiredMovement.x ? (BOOL v3 = CGPointZero.y == self->_requiredMovement.y) : (BOOL v3 = 0), v3))
    {
      [(THTimeoutDragGestureRecognizer *)self setState:1];
    }
  }
}

- (void)p_cancelTimerFired
{
  if (![(THTimeoutDragGestureRecognizer *)self state])
  {
    [(THTimeoutDragGestureRecognizer *)self setState:5];
  }
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (double)maximumPressDuration
{
  return self->_maximumPressDuration;
}

- (void)setMaximumPressDuration:(double)a3
{
  self->_maximumPressDuration = a3;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (UIGestureRecognizer)dependentGestureRecognizer
{
  return self->_dependentGestureRecognizer;
}

- (void)setDependentGestureRecognizer:(id)a3
{
}

- (CGPoint)requiredMovement
{
  double x = self->_requiredMovement.x;
  double y = self->_requiredMovement.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRequiredMovement:(CGPoint)a3
{
  self->_requiredMovement = a3;
}

- (double)touchStartTime
{
  return self->_touchStartTime;
}

- (void)setTouchStartTime:(double)a3
{
  self->_touchStartTime = a3;
}

- (CGPoint)touchStartPoint
{
  double x = self->_touchStartPoint.x;
  double y = self->_touchStartPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchStartPoint:(CGPoint)a3
{
  self->_touchStartPoint = a3;
}

- (CGPoint)touchMovement
{
  double x = self->_touchMovement.x;
  double y = self->_touchMovement.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchMovement:(CGPoint)a3
{
  self->_touchMovement = a3;
}

- (NSTimer)recognizeTimer
{
  return self->_recognizeTimer;
}

- (void)setRecognizeTimer:(id)a3
{
}

- (NSTimer)cancelTimer
{
  return self->_cancelTimer;
}

- (void)setCancelTimer:(id)a3
{
}

- (BOOL)isStylus
{
  return self->_stylus;
}

- (void)setStylus:(BOOL)a3
{
  self->_stylus = a3;
}

@end