@interface _UIScrollViewMockPinchGestureRecognizer
- (CGPoint)anchorPoint;
- (UIScrollViewPinchGestureRecognizer)gestureRecognizer;
- (double)scale;
- (double)velocity;
- (id)_activeTouchesForEvent:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (int64_t)state;
- (void)setGestureRecognizer:(id)a3;
- (void)setState:(int64_t)a3;
- (void)simulateScale:(double)a3 velocity:(double)a4;
@end

@implementation _UIScrollViewMockPinchGestureRecognizer

- (void)simulateScale:(double)a3 velocity:(double)a4
{
  self->_scale = a3;
  self->_velocity = a4;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      v6 = self->_gestureRecognizer;
      goto LABEL_6;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = NSStringFromSelector(a3);
    [v7 handleFailureInMethod:a2, self, @"UIScrollView_UIApplicationTesting.m", 156, @"UIScrollView is calling %@ not implemented on _UIScrollViewMockPinchGestureRecognizer or UIScrollViewPanGestureRecognizer", v8 object file lineNumber description];
  }
  v6 = 0;
LABEL_6:
  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)scale
{
  return self->_scale;
}

- (double)velocity
{
  return self->_velocity;
}

- (CGPoint)anchorPoint
{
  v2 = [(UIGestureRecognizer *)self->_gestureRecognizer view];
  [v2 center];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)_activeTouchesForEvent:(id)a3
{
  double v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"fakeTouch1", @"fakeTouch2", 0);
  return v3;
}

- (UIScrollViewPinchGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end