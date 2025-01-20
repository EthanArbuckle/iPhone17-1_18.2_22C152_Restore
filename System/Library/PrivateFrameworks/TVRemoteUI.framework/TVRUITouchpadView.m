@interface TVRUITouchpadView
- (TVRUITouchpadDelegate)touchDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setTouchDelegate:(id)a3;
@end

@implementation TVRUITouchpadView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(TVRUITouchpadView *)self touchDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(TVRUITouchpadView *)self touchDelegate];
    v11 = objc_msgSend(v10, "hitTest:withEvent:forTouchpadView:", v7, self, x, y);

    if (v11)
    {
      id v12 = v11;
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)TVRUITouchpadView;
      -[TVRUITouchpadView hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TVRUITouchpadView;
    v13 = -[TVRUITouchpadView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
  }

  return v13;
}

- (TVRUITouchpadDelegate)touchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchDelegate);
  return (TVRUITouchpadDelegate *)WeakRetained;
}

- (void)setTouchDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end