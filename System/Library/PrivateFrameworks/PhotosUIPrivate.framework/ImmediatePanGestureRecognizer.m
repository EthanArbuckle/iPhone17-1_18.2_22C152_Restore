@interface ImmediatePanGestureRecognizer
- (PUCleanupGestureTouchTypeDelegate)touchTypeDelegate;
- (void)setTouchTypeDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ImmediatePanGestureRecognizer

- (void).cxx_destruct
{
}

- (void)setTouchTypeDelegate:(id)a3
{
}

- (PUCleanupGestureTouchTypeDelegate)touchTypeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchTypeDelegate);
  return (PUCleanupGestureTouchTypeDelegate *)WeakRetained;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)ImmediatePanGestureRecognizer;
  [(ImmediatePanGestureRecognizer *)&v4 touchesMoved:a3 withEvent:a4];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 anyObject];
  v9 = [(ImmediatePanGestureRecognizer *)self touchTypeDelegate];

  if (v9)
  {
    v10 = [(ImmediatePanGestureRecognizer *)self touchTypeDelegate];
    objc_msgSend(v10, "setTouchType:", objc_msgSend(v8, "type"));
  }
  v11.receiver = self;
  v11.super_class = (Class)ImmediatePanGestureRecognizer;
  [(ImmediatePanGestureRecognizer *)&v11 touchesBegan:v6 withEvent:v7];
}

@end