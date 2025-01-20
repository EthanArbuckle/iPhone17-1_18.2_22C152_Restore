@interface _UIScrollViewMockPanGestureRecognizer
- (CGPoint)locationInView:(id)a3;
- (CGPoint)translationInView:(id)a3;
- (CGPoint)velocityInView:(id)a3;
- (UIScrollViewPanGestureRecognizer)gestureRecognizer;
- (id)forwardingTargetForSelector:(SEL)a3;
- (int64_t)state;
- (void)setGestureRecognizer:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTranslation:(CGPoint)a3 inView:(id)a4;
- (void)simulateTranslation:(CGPoint)a3 velocity:(CGPoint)a4;
@end

@implementation _UIScrollViewMockPanGestureRecognizer

- (void)simulateTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  self->_translation = a3;
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
    [v7 handleFailureInMethod:a2, self, @"UIScrollView_UIApplicationTesting.m", 81, @"UIScrollView is calling %@ not implemented on _UIScrollViewMockPanGestureRecognizer or UIScrollViewPanGestureRecognizer", v8 object file lineNumber description];
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

- (CGPoint)translationInView:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(UIGestureRecognizer *)self->_gestureRecognizer view];

    if (v6 != v5)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"UIScrollView_UIApplicationTesting.m" lineNumber:98 description:@"expected different view"];
    }
  }
  CGFloat x = self->_translation.x;
  CGFloat y = self->_translation.y;

  double v10 = x;
  double v11 = y;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)setTranslation:(CGPoint)a3 inView:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  if (v8)
  {
    id v11 = v8;
    id v9 = [(UIGestureRecognizer *)self->_gestureRecognizer view];

    id v8 = v11;
    if (v9 != v11)
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UIScrollView_UIApplicationTesting.m" lineNumber:104 description:@"expected different view"];

      id v8 = v11;
    }
  }
  self->_translation.CGFloat x = x;
  self->_translation.CGFloat y = y;
}

- (CGPoint)velocityInView:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(UIGestureRecognizer *)self->_gestureRecognizer view];

    if (v6 != v5)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"UIScrollView_UIApplicationTesting.m" lineNumber:110 description:@"expected different view"];
    }
  }
  CGFloat x = self->_velocity.x;
  CGFloat y = self->_velocity.y;

  double v10 = x;
  double v11 = y;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(UIGestureRecognizer *)self->_gestureRecognizer view];

    if (v6 != v5)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"UIScrollView_UIApplicationTesting.m" lineNumber:116 description:@"expected different view"];
    }
  }
  [v5 frame];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  double MidX = CGRectGetMidX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v23);
  v14 = [v5 superview];
  objc_msgSend(v5, "convertPoint:fromView:", v14, MidX, MidY);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.CGFloat y = v20;
  result.CGFloat x = v19;
  return result;
}

- (UIScrollViewPanGestureRecognizer)gestureRecognizer
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