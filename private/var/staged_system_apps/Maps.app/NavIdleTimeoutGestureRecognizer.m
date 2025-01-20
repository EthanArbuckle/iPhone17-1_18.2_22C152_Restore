@interface NavIdleTimeoutGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (NavIdleTimeoutGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UIEvent)event;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation NavIdleTimeoutGestureRecognizer

- (NavIdleTimeoutGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NavIdleTimeoutGestureRecognizer;
  v4 = [(NavIdleTimeoutGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(NavIdleTimeoutGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(NavIdleTimeoutGestureRecognizer *)v5 setDelaysTouchesBegan:0];
    [(NavIdleTimeoutGestureRecognizer *)v5 setDelaysTouchesEnded:0];
  }
  return v5;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  return [a3 type] == 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_storeStrong((id *)&self->_event, a4);

  [(NavIdleTimeoutGestureRecognizer *)self setState:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_storeStrong((id *)&self->_event, a4);

  [(NavIdleTimeoutGestureRecognizer *)self setState:3];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_storeStrong((id *)&self->_event, a4);

  [(NavIdleTimeoutGestureRecognizer *)self setState:4];
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)NavIdleTimeoutGestureRecognizer;
  [(NavIdleTimeoutGestureRecognizer *)&v4 reset];
  event = self->_event;
  self->_event = 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (UIEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
}

@end