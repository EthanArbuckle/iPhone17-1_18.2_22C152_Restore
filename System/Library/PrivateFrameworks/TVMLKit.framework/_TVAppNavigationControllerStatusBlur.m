@interface _TVAppNavigationControllerStatusBlur
- (UIColor)backgroundTintColor;
- (UIVisualEffect)visualEffect;
- (_TVAppNavigationControllerStatusBlur)initWithCoder:(id)a3;
- (_TVAppNavigationControllerStatusBlur)initWithFrame:(CGRect)a3;
- (void)_commonInit;
- (void)setBackgroundTintColor:(id)a3;
- (void)setVisualEffect:(id)a3;
@end

@implementation _TVAppNavigationControllerStatusBlur

- (_TVAppNavigationControllerStatusBlur)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVAppNavigationControllerStatusBlur;
  v3 = [(_TVAppNavigationControllerStatusBlur *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_TVAppNavigationControllerStatusBlur *)v3 _commonInit];
  }
  return v4;
}

- (_TVAppNavigationControllerStatusBlur)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVAppNavigationControllerStatusBlur;
  v3 = -[_TVAppNavigationControllerStatusBlur initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVAppNavigationControllerStatusBlur *)v3 _commonInit];
  }
  return v4;
}

- (UIColor)backgroundTintColor
{
  return [(UIView *)self->_dimmingView backgroundColor];
}

- (UIVisualEffect)visualEffect
{
  return [(UIVisualEffectView *)self->_visualEffectView effect];
}

- (void)setBackgroundTintColor:(id)a3
{
}

- (void)setVisualEffect:(id)a3
{
}

- (void)_commonInit
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  [(_TVAppNavigationControllerStatusBlur *)self bounds];
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  dimmingView = self->_dimmingView;
  self->_dimmingView = v4;

  objc_super v6 = self->_dimmingView;
  v7 = [MEMORY[0x263F1C550] clearColor];
  [(UIView *)v6 setBackgroundColor:v7];

  [(UIView *)self->_dimmingView setAutoresizingMask:18];
  [(_TVAppNavigationControllerStatusBlur *)self addSubview:self->_dimmingView];
  v8 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:0];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v8;

  [(UIVisualEffectView *)self->_visualEffectView setAutoresizingMask:18];
  v10 = self->_visualEffectView;
  [(_TVAppNavigationControllerStatusBlur *)self bounds];
  -[UIVisualEffectView setFrame:](v10, "setFrame:");
  v11 = self->_visualEffectView;
  [(_TVAppNavigationControllerStatusBlur *)self addSubview:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end