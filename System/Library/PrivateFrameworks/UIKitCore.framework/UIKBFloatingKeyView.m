@interface UIKBFloatingKeyView
- (UIKBFloatingKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (UIKBFloatingKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 renderTraits:(id)a6;
- (_UIFloatingContentView)floatingContentView;
- (void)layoutSubviews;
- (void)prepareForDisplay;
@end

@implementation UIKBFloatingKeyView

- (UIKBFloatingKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)UIKBFloatingKeyView;
  v5 = -[UIKBContainerKeyView initWithFrame:keyplane:key:](&v11, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = [_UIKBFloatingContentView alloc];
    uint64_t v7 = -[_UIFloatingContentView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    floatingContentView = v5->_floatingContentView;
    v5->_floatingContentView = (_UIFloatingContentView *)v7;

    [(_UIFloatingContentView *)v5->_floatingContentView setCornerRadius:6.0];
    -[_UIFloatingContentView setAsymmetricFocusedSizeIncrease:](v5->_floatingContentView, "setAsymmetricFocusedSizeIncrease:", 10.0, 10.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:](v5->_floatingContentView, "setContentMotionRotation:translation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 6.0, 3.0);
    [(_UIFloatingContentView *)v5->_floatingContentView set_disableOutsetShadowPath:1];
    [(_UIFloatingContentView *)v5->_floatingContentView setShadowRadius:12.0];
    [(_UIFloatingContentView *)v5->_floatingContentView setShadowVerticalOffset:25.0];
    [(_UIFloatingContentView *)v5->_floatingContentView setShadowOpacity:0.1];
    [(UIView *)v5 insertSubview:v5->_floatingContentView atIndex:0];
    v9 = [(UIKBContainerKeyView *)v5 contentsKeyView];
    [(UIView *)v5 addSubview:v9];
  }
  return v5;
}

- (UIKBFloatingKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 renderTraits:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)UIKBFloatingKeyView;
  v14 = -[UIKBContainerKeyView initWithFrame:keyplane:key:](&v25, sel_initWithFrame_keyplane_key_, a4, a5, x, y, width, height);
  if (v14)
  {
    v15 = [_UIKBFloatingContentView alloc];
    uint64_t v16 = -[_UIFloatingContentView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    floatingContentView = v14->_floatingContentView;
    v14->_floatingContentView = (_UIFloatingContentView *)v16;

    v18 = v14->_floatingContentView;
    [v13 floatingContentViewCornerRadius];
    -[_UIFloatingContentView setCornerRadius:](v18, "setCornerRadius:");
    [(_UIFloatingContentView *)v14->_floatingContentView setContinuousCornerEnabled:0];
    -[_UIFloatingContentView setShadowExpansion:](v14->_floatingContentView, "setShadowExpansion:", -4.0, -4.0);
    v19 = v14->_floatingContentView;
    [v13 floatingContentViewFocusedIncreaseSize];
    -[_UIFloatingContentView setAsymmetricFocusedSizeIncrease:](v19, "setAsymmetricFocusedSizeIncrease:");
    -[_UIFloatingContentView setContentMotionRotation:translation:](v14->_floatingContentView, "setContentMotionRotation:translation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 6.0, 3.0);
    [(_UIFloatingContentView *)v14->_floatingContentView set_disableOutsetShadowPath:1];
    v20 = v14->_floatingContentView;
    [v13 floatingContentViewShadowRadius];
    -[_UIFloatingContentView setShadowRadius:](v20, "setShadowRadius:");
    v21 = v14->_floatingContentView;
    [v13 floatingContentViewShadowVerticalOffset];
    -[_UIFloatingContentView setShadowVerticalOffset:](v21, "setShadowVerticalOffset:");
    v22 = v14->_floatingContentView;
    [v13 floatingContentViewShadowOpacity];
    -[_UIFloatingContentView setShadowOpacity:](v22, "setShadowOpacity:");
    [(UIView *)v14 insertSubview:v14->_floatingContentView atIndex:0];
    v23 = [(UIKBContainerKeyView *)v14 contentsKeyView];
    [(UIView *)v14 addSubview:v23];
  }
  return v14;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIKBFloatingKeyView;
  [(UIView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[_UIFloatingContentView setFrame:](self->_floatingContentView, "setFrame:");
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void)prepareForDisplay
{
  v5.receiver = self;
  v5.super_class = (Class)UIKBFloatingKeyView;
  [(UIKBContainerKeyView *)&v5 prepareForDisplay];
  objc_super v3 = [(UIView *)self layer];
  if ([v3 needsDisplay])
  {
  }
  else
  {
    BOOL v4 = [(UIKBContainerKeyView *)self hasRendered];

    if (v4) {
      return;
    }
  }
  [(UIView *)self recursivelyForceDisplayIfNeeded];
}

- (void).cxx_destruct
{
}

@end