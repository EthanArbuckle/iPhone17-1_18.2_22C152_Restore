@interface _UIEditMenuContainerView
- (BOOL)_touchesInsideShouldHideCalloutBar;
- (BOOL)dismissalGestureRecognizer:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)dismissesOnViewportResize;
- (BOOL)ignoresPassthroughInPresentationSource;
- (BOOL)touchFallbackView:(id)a3 shouldHitTestAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (_UIEditMenuContainerView)initWithPresentation:(id)a3 enablePassthrough:(BOOL)a4;
- (_UIEditMenuDismissalGestureRecognizer)dismissalGestureRecognizer;
- (_UIEditMenuPresentation)presentation;
- (_UITouchFallbackView)touchFallbackView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_dismissMenuPresentationForSizeChange;
- (void)_installDismissalGesture;
- (void)didMoveToWindow;
- (void)didRecognizeDismissalGestureRecognizer:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDismissesOnViewportResize:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIgnoresPassthroughInPresentationSource:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIEditMenuContainerView

- (_UIEditMenuContainerView)initWithPresentation:(id)a3 enablePassthrough:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIEditMenuContainerView;
  v7 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_presentation, v6);
    if (v4)
    {
      v8->_dismissesOnViewportResize = 1;
      [(_UIEditMenuContainerView *)v8 _installDismissalGesture];
    }
  }

  return v8;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  if (width != v9 || height != v8) {
    [(_UIEditMenuContainerView *)self _dismissMenuPresentationForSizeChange];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIEditMenuContainerView;
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
    [(_UIEditMenuContainerView *)self _dismissMenuPresentationForSizeChange];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIEditMenuContainerView;
  -[UIView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)_dismissMenuPresentationForSizeChange
{
  if ([(_UIEditMenuContainerView *)self dismissesOnViewportResize])
  {
    v3 = [(_UIEditMenuContainerView *)self presentation];
    BOOL v4 = [v3 displayedMenu];

    if (v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65___UIEditMenuContainerView__dismissMenuPresentationForSizeChange__block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (BOOL)_touchesInsideShouldHideCalloutBar
{
  return 0;
}

- (_UITouchFallbackView)touchFallbackView
{
  touchFallbackView = self->_touchFallbackView;
  if (!touchFallbackView)
  {
    BOOL v4 = [_UITouchFallbackView alloc];
    [(UIView *)self bounds];
    v5 = -[_UITouchFallbackView initWithFrame:](v4, "initWithFrame:");
    id v6 = self->_touchFallbackView;
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

  self->_ignoresPassthroughInPresentationSource = 0;
  [(UIView *)self setUserInteractionEnabled:1];
}

- (void)willMoveToWindow:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIEditMenuContainerView;
  [(UIView *)&v7 willMoveToWindow:a3];
  BOOL v4 = [(_UIEditMenuContainerView *)self dismissalGestureRecognizer];

  if (v4)
  {
    v5 = [(UIView *)self window];
    id v6 = [(_UIEditMenuContainerView *)self dismissalGestureRecognizer];
    [v5 removeGestureRecognizer:v6];
  }
  [(UIView *)self->_touchFallbackView removeFromSuperview];
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)_UIEditMenuContainerView;
  [(UIView *)&v7 didMoveToWindow];
  v3 = [(UIView *)self window];
  if (v3)
  {
    BOOL v4 = [(_UIEditMenuContainerView *)self dismissalGestureRecognizer];

    if (v4)
    {
      v5 = [(_UIEditMenuContainerView *)self dismissalGestureRecognizer];
      [v3 addGestureRecognizer:v5];

      id v6 = [(_UIEditMenuContainerView *)self touchFallbackView];
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
    id v5 = [(_UIEditMenuContainerView *)self presentation];
    [v5 hideMenuWithReason:0];
  }
}

- (BOOL)touchFallbackView:(id)a3 shouldHitTestAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  id v5 = [(_UIEditMenuContainerView *)self presentation];
  id v6 = [v5 displayedMenu];
  BOOL v7 = v6 != 0;

  return v7;
}

- (BOOL)dismissalGestureRecognizer:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  self->_lastHitTestPassedThrough = 0;
  objc_super v10 = [a3 view];
  objc_msgSend(v10, "convertPoint:toView:", self, x, y);
  double v12 = v11;
  double v14 = v13;

  id v15 = -[_UIEditMenuContainerView hitTest:withEvent:](self, "hitTest:withEvent:", v9, v12, v14);
  LOBYTE(v10) = self->_lastHitTestPassedThrough;

  return (char)v10;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIEditMenuContainerView;
  -[UIView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  double v8 = (_UIEditMenuContainerView *)objc_claimAutoreleasedReturnValue();
  if (v8 != self)
  {
LABEL_2:
    id v9 = v8;
    goto LABEL_3;
  }
  id v9 = [(_UIEditMenuContainerView *)self dismissalGestureRecognizer];

  if (v9)
  {
    if ([v7 type] != 9)
    {
      if (+[_UIEditMenuDismissalGestureRecognizer canHandleEventForPassthrough:v7])
      {
        if ([(_UIEditMenuContainerView *)self ignoresPassthroughInPresentationSource])
        {
          double v11 = [(_UIEditMenuContainerView *)self presentation];
          double v12 = [v11 sourceView];

          [(UIView *)self setUserInteractionEnabled:0];
          double v13 = [(UIView *)self window];
          -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);

          double v14 = [(UIView *)self window];
          id v15 = objc_msgSend(v14, "hitTest:withEvent:", v7, x, y);

          [(UIView *)self setUserInteractionEnabled:1];
          char v16 = [v15 isDescendantOfView:v12] ^ 1;
        }
        else
        {
          char v16 = 1;
        }
        id v9 = 0;
        self->_lastHitTestPassedThrough = v16;
        goto LABEL_3;
      }
      goto LABEL_2;
    }
    id v9 = 0;
  }
LABEL_3:

  return v9;
}

- (_UIEditMenuPresentation)presentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentation);
  return (_UIEditMenuPresentation *)WeakRetained;
}

- (BOOL)ignoresPassthroughInPresentationSource
{
  return self->_ignoresPassthroughInPresentationSource;
}

- (void)setIgnoresPassthroughInPresentationSource:(BOOL)a3
{
  self->_ignoresPassthroughInPresentationSource = a3;
}

- (BOOL)dismissesOnViewportResize
{
  return self->_dismissesOnViewportResize;
}

- (void)setDismissesOnViewportResize:(BOOL)a3
{
  self->_dismissesOnViewportResize = a3;
}

- (_UIEditMenuDismissalGestureRecognizer)dismissalGestureRecognizer
{
  return self->_dismissalGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_presentation);
  objc_storeStrong((id *)&self->_touchFallbackView, 0);
}

@end