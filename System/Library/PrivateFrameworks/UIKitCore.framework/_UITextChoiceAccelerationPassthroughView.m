@interface _UITextChoiceAccelerationPassthroughView
- (BOOL)_hitTest:(CGPoint)a3 withEvent:(id)a4 withSourceView:(id)a5;
- (BOOL)dismissalGestureRecognizer:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)touchFallbackView:(id)a3 shouldHitTestAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (_UIEditMenuDismissalGestureRecognizer)dismissalGestureRecognizer;
- (_UITextChoiceAccelerationPassthroughDelegate)delegate;
- (_UITextChoiceAccelerationPassthroughView)initWithFrame:(CGRect)a3 delegate:(id)a4;
- (_UITouchFallbackView)touchFallbackView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_installDismissalGesture;
- (void)_passthroughViewDidChangeSize;
- (void)didMoveToWindow;
- (void)didRecognizeDismissalGestureRecognizer:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UITextChoiceAccelerationPassthroughView

- (_UITextChoiceAccelerationPassthroughView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  v10 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    [(_UITextChoiceAccelerationPassthroughView *)v11 _installDismissalGesture];
  }

  return v11;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  if (width != v9 || height != v8) {
    [(_UITextChoiceAccelerationPassthroughView *)self _passthroughViewDidChangeSize];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  -[UIView setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  if (width != v9 || height != v8) {
    [(_UITextChoiceAccelerationPassthroughView *)self _passthroughViewDidChangeSize];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  -[UIView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)_passthroughViewDidChangeSize
{
  id v2 = [(_UITextChoiceAccelerationPassthroughView *)self delegate];
  [v2 passthruViewDidChangeSize];
}

- (_UITouchFallbackView)touchFallbackView
{
  touchFallbackView = self->_touchFallbackView;
  if (!touchFallbackView)
  {
    v4 = [_UITouchFallbackView alloc];
    [(UIView *)self bounds];
    v5 = -[_UITouchFallbackView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_touchFallbackView;
    self->_touchFallbackView = v5;

    [(_UITouchFallbackView *)self->_touchFallbackView setDelegate:self];
    [(UIView *)self->_touchFallbackView setAutoresizingMask:18];
    touchFallbackView = self->_touchFallbackView;
  }
  return touchFallbackView;
}

- (void)_installDismissalGesture
{
  v3 = [[_UIEditMenuDismissalGestureRecognizer alloc] initWithTarget:self action:sel_didRecognizeDismissalGestureRecognizer_];
  [(_UIEditMenuDismissalGestureRecognizer *)v3 setInteractionDelegate:self];
  dismissalGestureRecognizer = self->_dismissalGestureRecognizer;
  self->_dismissalGestureRecognizer = v3;

  [(UIView *)self setUserInteractionEnabled:1];
}

- (void)willMoveToWindow:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  [(UIView *)&v7 willMoveToWindow:a3];
  v4 = [(_UITextChoiceAccelerationPassthroughView *)self dismissalGestureRecognizer];

  if (v4)
  {
    v5 = [(UIView *)self window];
    v6 = [(_UITextChoiceAccelerationPassthroughView *)self dismissalGestureRecognizer];
    [v5 removeGestureRecognizer:v6];
  }
  [(UIView *)self->_touchFallbackView removeFromSuperview];
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  [(UIView *)&v7 didMoveToWindow];
  v3 = [(UIView *)self window];
  if (v3)
  {
    v4 = [(_UITextChoiceAccelerationPassthroughView *)self dismissalGestureRecognizer];

    if (v4)
    {
      v5 = [(_UITextChoiceAccelerationPassthroughView *)self dismissalGestureRecognizer];
      [v3 addGestureRecognizer:v5];

      v6 = [(_UITextChoiceAccelerationPassthroughView *)self touchFallbackView];
      [v3 bounds];
      objc_msgSend(v6, "setFrame:");
      [v3 insertSubview:v6 atIndex:0];
    }
  }
}

- (void)didRecognizeDismissalGestureRecognizer:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (v4 == 1) {
      self->_didDismissFromGesture = 0;
    }
  }
  else if (!self->_didDismissFromGesture)
  {
    self->_didDismissFromGesture = 1;
    id v5 = [(_UITextChoiceAccelerationPassthroughView *)self delegate];
    [v5 didRecognizeDismissal];
  }
}

- (BOOL)touchFallbackView:(id)a3 shouldHitTestAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  return 1;
}

- (BOOL)dismissalGestureRecognizer:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  v10 = [a3 view];
  objc_msgSend(v10, "convertPoint:toView:", self, x, y);
  double v12 = v11;
  double v14 = v13;

  v15 = [(_UITextChoiceAccelerationPassthroughView *)self delegate];
  v16 = [v15 sourceView];
  LOBYTE(self) = -[_UITextChoiceAccelerationPassthroughView _hitTest:withEvent:withSourceView:](self, "_hitTest:withEvent:withSourceView:", v9, v16, v12, v14);

  return (char)self;
}

- (BOOL)_hitTest:(CGPoint)a3 withEvent:(id)a4 withSourceView:(id)a5
{
  if (!a5) {
    return 1;
  }
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  id v10 = a4;
  [(UIView *)self setUserInteractionEnabled:0];
  double v11 = [(UIView *)self window];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);

  double v12 = [(UIView *)self window];
  double v13 = objc_msgSend(v12, "hitTest:withEvent:", v10, x, y);

  [(UIView *)self setUserInteractionEnabled:1];
  LOBYTE(self) = [v13 isDescendantOfView:v9];

  char v14 = self ^ 1;
  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UITextChoiceAccelerationPassthroughView;
  -[UIView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  double v8 = (_UITextChoiceAccelerationPassthroughView *)objc_claimAutoreleasedReturnValue();
  if (v8 != self) {
    goto LABEL_2;
  }
  id v9 = [(_UITextChoiceAccelerationPassthroughView *)self dismissalGestureRecognizer];

  if (v9)
  {
    if ([v7 type] != 9
      && !+[_UIEditMenuDismissalGestureRecognizer canHandleEventForPassthrough:v7])
    {
LABEL_2:
      id v9 = v8;
      goto LABEL_7;
    }
    id v9 = 0;
  }
LABEL_7:

  return v9;
}

- (_UITextChoiceAccelerationPassthroughDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITextChoiceAccelerationPassthroughDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIEditMenuDismissalGestureRecognizer)dismissalGestureRecognizer
{
  return self->_dismissalGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchFallbackView, 0);
}

@end