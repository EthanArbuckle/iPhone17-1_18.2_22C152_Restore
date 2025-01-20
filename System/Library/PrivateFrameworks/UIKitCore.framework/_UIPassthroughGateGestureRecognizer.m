@interface _UIPassthroughGateGestureRecognizer
+ (BOOL)_supportsTouchContinuation;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)shouldReceiveEvent:(id)a3;
- (_UIPassthroughGateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)endClosed;
- (void)open;
@end

@implementation _UIPassthroughGateGestureRecognizer

- (_UIPassthroughGateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPassthroughGateGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:self action:a4];
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

- (void)open
{
}

- (void)endClosed
{
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  objc_super v7 = [(UIGestureRecognizer *)self delegate];
  if (v7)
  {
    v8 = [(UIGestureRecognizer *)self view];
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

- (BOOL)shouldReceiveEvent:(id)a3
{
  if ([a3 type] == 10)
  {
    v5 = [(UIGestureRecognizer *)self delegate];
    if (v5)
    {
      id v6 = a3;
      objc_super v7 = [(UIGestureRecognizer *)self view];
      [v6 locationInView:v7];
      double v9 = v8;
      double v11 = v10;

      char v12 = objc_msgSend(v5, "_passthroughGestureRecognizer:shouldInteractAtLocation:withEvent:", self, v6, v9, v11);
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIPassthroughGateGestureRecognizer;
    return [(UIGestureRecognizer *)&v14 shouldReceiveEvent:a3];
  }
  return v12;
}

@end