@interface _UIDatePickerContainerView
- (BOOL)isTransparentFocusItem;
- (BOOL)lastHitTestWasPassedThrough;
- (UIView)contentView;
- (_UIDatePickerContainerView)initWithFrame:(CGRect)a3;
- (_UIDatePickerOverlayPresentation)presentation;
- (_UIPassthroughScrollInteraction)passthroughInteraction;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didMoveToWindow;
- (void)setBounds:(CGRect)a3;
- (void)setContentView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLastHitTestWasPassedThrough:(BOOL)a3;
- (void)setPassthroughInteraction:(id)a3;
- (void)setPresentation:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIDatePickerContainerView

- (_UIDatePickerContainerView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerContainerView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    [(_UIDatePickerContainerView *)v3 setPassthroughInteraction:v4];

    [(UIView *)v3 setUserInteractionEnabled:1];
    v5 = [UIView alloc];
    [(UIView *)v3 bounds];
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    [(_UIDatePickerContainerView *)v3 setContentView:v6];

    v7 = [(_UIDatePickerContainerView *)v3 contentView];
    [v7 setAutoresizingMask:18];

    v8 = [(_UIDatePickerContainerView *)v3 contentView];
    [(UIView *)v3 addSubview:v8];
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  v17.origin.double x = v8;
  v17.origin.double y = v9;
  v17.size.double width = v10;
  v17.size.double height = v11;
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  if (!CGRectEqualToRect(v16, v17))
  {
    v12 = [(_UIDatePickerContainerView *)self presentation];
    char v13 = [v12 isBeingDismissedOrPresented];

    if ((v13 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39___UIDatePickerContainerView_setFrame___block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerContainerView;
  -[UIView setFrame:](&v14, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  v17.origin.double x = v8;
  v17.origin.double y = v9;
  v17.size.double width = v10;
  v17.size.double height = v11;
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  if (!CGRectEqualToRect(v16, v17))
  {
    v12 = [(_UIDatePickerContainerView *)self presentation];
    char v13 = [v12 isBeingDismissedOrPresented];

    if ((v13 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40___UIDatePickerContainerView_setBounds___block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerContainerView;
  -[UIView setBounds:](&v14, sel_setBounds_, x, y, width, height);
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerContainerView;
  [(UIView *)&v5 willMoveToWindow:a3];
  v4 = [(_UIDatePickerContainerView *)self passthroughInteraction];
  [(UIView *)self removeInteraction:v4];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerContainerView;
  [(UIView *)&v5 didMoveToWindow];
  v3 = [(UIView *)self window];

  if (v3)
  {
    v4 = [(_UIDatePickerContainerView *)self passthroughInteraction];
    [(UIView *)self addInteraction:v4];
  }
}

- (BOOL)isTransparentFocusItem
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_UIDatePickerContainerView;
  -[UIView hitTest:withEvent:](&v24, sel_hitTest_withEvent_, v7, x, y);
  CGFloat v8 = (_UIDatePickerContainerView *)objc_claimAutoreleasedReturnValue();
  if (v8 != self)
  {
    CGFloat v9 = [(_UIDatePickerContainerView *)self contentView];

    if (v8 != v9) {
      goto LABEL_18;
    }
  }
  CGFloat v10 = [(_UIDatePickerContainerView *)self presentation];
  CGFloat v11 = [v10 sourceView];

  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  double v13 = v12;
  double v15 = v14;
  CGRect v16 = [(_UIDatePickerContainerView *)self presentation];
  if ([v16 overlayAnchor] == 2)
  {
    CGRect v17 = [(_UIDatePickerContainerView *)self presentation];
    [v17 sourceRect];
    v26.double x = v13;
    v26.double y = v15;
    BOOL v18 = CGRectContainsPoint(v27, v26);

    if (!v18)
    {
      v19 = 0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v19 = objc_msgSend(v11, "hitTest:withEvent:", v7, v13, v15);
LABEL_8:
  BOOL v20 = +[_UIPassthroughScrollInteraction _shouldEventBePassedThrough:v7];
  if (v19 && v19 != v11)
  {
    if (v20)
    {
      v21 = [(_UIDatePickerContainerView *)self presentation];
      -[_UIDatePickerContainerView setLastHitTestWasPassedThrough:](self, "setLastHitTestWasPassedThrough:", [v21 ignoresPassthroughOnSourceView] ^ 1);
    }
    else
    {
      [(_UIDatePickerContainerView *)self setLastHitTestWasPassedThrough:0];
    }
    v22 = v19;
    goto LABEL_16;
  }
  if (v20)
  {
    [(_UIDatePickerContainerView *)self setLastHitTestWasPassedThrough:1];
    v22 = 0;
LABEL_16:

    goto LABEL_19;
  }

LABEL_18:
  v22 = v8;
LABEL_19:

  return v22;
}

- (_UIDatePickerOverlayPresentation)presentation
{
  return self->_presentation;
}

- (void)setPresentation:(id)a3
{
}

- (_UIPassthroughScrollInteraction)passthroughInteraction
{
  return self->_passthroughInteraction;
}

- (void)setPassthroughInteraction:(id)a3
{
}

- (BOOL)lastHitTestWasPassedThrough
{
  return self->_lastHitTestWasPassedThrough;
}

- (void)setLastHitTestWasPassedThrough:(BOOL)a3
{
  self->_lastHitTestWasPassedThrough = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
}

@end