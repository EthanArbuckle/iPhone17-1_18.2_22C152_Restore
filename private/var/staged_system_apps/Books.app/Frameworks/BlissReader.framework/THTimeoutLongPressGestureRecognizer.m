@interface THTimeoutLongPressGestureRecognizer
- (NSTimer)cancelTimer;
- (double)maximumPressDuration;
- (void)cancel;
- (void)dealloc;
- (void)p_startCancelTimer;
- (void)p_teardownTimer;
- (void)reset;
- (void)setCancelTimer:(id)a3;
- (void)setMaximumPressDuration:(double)a3;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation THTimeoutLongPressGestureRecognizer

- (void)dealloc
{
  if (self->_cancelTimer) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTimeoutLongPressGestureRecognizer dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTimeoutLongPressGestureRecognizer.m") lineNumber:32 description:@"expected nil value for '%s'", "_cancelTimer"];
  }
  v3.receiver = self;
  v3.super_class = (Class)THTimeoutLongPressGestureRecognizer;
  [(THTimeoutLongPressGestureRecognizer *)&v3 dealloc];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THTimeoutLongPressGestureRecognizer;
  [(THTimeoutLongPressGestureRecognizer *)&v5 touchesBegan:a3 withEvent:a4];
  if (![(THTimeoutLongPressGestureRecognizer *)self state]) {
    [(THTimeoutLongPressGestureRecognizer *)self p_startCancelTimer];
  }
}

- (void)setState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THTimeoutLongPressGestureRecognizer;
  -[THTimeoutLongPressGestureRecognizer setState:](&v5, "setState:");
  if ((unint64_t)(a3 - 3) <= 2) {
    [(THTimeoutLongPressGestureRecognizer *)self p_teardownTimer];
  }
}

- (void)cancel
{
  if ([(THTimeoutLongPressGestureRecognizer *)self cancelTimer])
  {
    v3.receiver = self;
    v3.super_class = (Class)THTimeoutLongPressGestureRecognizer;
    [(THTimeoutLongPressGestureRecognizer *)&v3 cancel];
    [(THTimeoutLongPressGestureRecognizer *)self p_teardownTimer];
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)THTimeoutLongPressGestureRecognizer;
  [(THTimeoutLongPressGestureRecognizer *)&v3 reset];
  [(THTimeoutLongPressGestureRecognizer *)self p_teardownTimer];
}

- (void)p_startCancelTimer
{
  [(NSTimer *)[(THTimeoutLongPressGestureRecognizer *)self cancelTimer] invalidate];
  [(THTimeoutLongPressGestureRecognizer *)self maximumPressDuration];
  objc_super v3 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_cancelTimerFired", 0, 0);

  [(THTimeoutLongPressGestureRecognizer *)self setCancelTimer:v3];
}

- (void)p_teardownTimer
{
  [(NSTimer *)[(THTimeoutLongPressGestureRecognizer *)self cancelTimer] invalidate];

  [(THTimeoutLongPressGestureRecognizer *)self setCancelTimer:0];
}

- (double)maximumPressDuration
{
  return self->_maximumPressDuration;
}

- (void)setMaximumPressDuration:(double)a3
{
  self->_maximumPressDuration = a3;
}

- (NSTimer)cancelTimer
{
  return self->_cancelTimer;
}

- (void)setCancelTimer:(id)a3
{
}

@end