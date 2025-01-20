@interface SBNumberPadWithDelegate
- (BOOL)touchAtPoint:(CGPoint)a3 isCloseToButton:(id)a4;
- (SBNumberPadDelegate)delegate;
- (id)buttonForPoint:(CGPoint)a3 forEvent:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)buttonCancelled:(id)a3;
- (void)buttonDown:(id)a3;
- (void)buttonUp:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBNumberPadWithDelegate

- (void)buttonUp:(id)a3
{
  id v6 = a3;
  v4 = [(SBNumberPadWithDelegate *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained buttonUp:v6];
  }
}

- (void)buttonDown:(id)a3
{
  id v6 = a3;
  v4 = [(SBNumberPadWithDelegate *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained buttonDown:v6];
  }
}

- (void)buttonCancelled:(id)a3
{
  id v5 = a3;
  v4 = [(SBNumberPadWithDelegate *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 buttonCancelled:v5];
  }
}

- (id)buttonForPoint:(CGPoint)a3 forEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBNumberPadWithDelegate;
  v4 = -[SBNumberPadWithDelegate hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBNumberPadWithDelegate;
  id v5 = -[SBNumberPadWithDelegate hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = self;

    id v5 = v6;
  }
  return v5;
}

- (BOOL)touchAtPoint:(CGPoint)a3 isCloseToButton:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [a4 frame];
  CGRect v11 = CGRectInset(v10, -20.0, -20.0);
  CGFloat v6 = x;
  CGFloat v7 = y;
  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (SBNumberPadDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBNumberPadDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end