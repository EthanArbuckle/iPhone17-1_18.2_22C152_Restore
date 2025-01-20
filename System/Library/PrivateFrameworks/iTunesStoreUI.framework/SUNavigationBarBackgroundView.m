@interface SUNavigationBarBackgroundView
- (BOOL)barWantsAdaptiveBackdrop;
- (BOOL)isTranslucent;
- (BOOL)separatorOnTop;
- (SUNavigationBarBackgroundView)initWithFrame:(CGRect)a3;
- (UIColor)barTintColor;
- (UIView)_shadowView;
- (_UIBackdropView)backdropView;
- (_UINavigationBarAppearanceStorage)appearanceStorage;
- (id)_currentCustomBackground;
- (id)_currentCustomBackgroundRespectOversize_legacy:(BOOL *)a3;
- (int64_t)backdropStyle;
- (int64_t)barStyle;
- (void)_setShadowView:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAppearanceStorage:(id)a3;
- (void)setBackdropStyle:(int64_t)a3;
- (void)setBarStyle:(int64_t)a3;
- (void)setBarTintColor:(id)a3;
- (void)setBarWantsAdaptiveBackdrop:(BOOL)a3;
- (void)setSeparatorOnTop:(BOOL)a3;
- (void)setTranslucent:(BOOL)a3;
@end

@implementation SUNavigationBarBackgroundView

- (SUNavigationBarBackgroundView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUNavigationBarBackgroundView;
  v3 = -[SUNavigationBarBackgroundView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SUNavigationBarBackgroundView *)v3 setAutoresizingMask:18];
    [(SUNavigationBarBackgroundView *)v4 setUserInteractionEnabled:0];
    uint64_t v5 = [objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:10060];
    v4->_backdropView = (_UIBackdropView *)v5;
    [(SUNavigationBarBackgroundView *)v4 addSubview:v5];

    v6 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    v4->_borderView = v6;
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.3]);
    [(SUNavigationBarBackgroundView *)v4 addSubview:v4->_borderView];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUNavigationBarBackgroundView;
  [(SUNavigationBarBackgroundView *)&v3 dealloc];
}

- (int64_t)backdropStyle
{
  return [(_UIBackdropView *)self->_backdropView style];
}

- (void)setBackdropStyle:(int64_t)a3
{
  backdropView = self->_backdropView;
  uint64_t v5 = (_UIBackdropView *)[objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:a3];
  self->_backdropView = v5;
  [(_UIBackdropView *)backdropView frame];
  -[_UIBackdropView setFrame:](v5, "setFrame:");
  [(SUNavigationBarBackgroundView *)self insertSubview:self->_backdropView atIndex:0];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SUNavigationBarBackgroundView_setBackdropStyle___block_invoke;
  v7[3] = &unk_264812130;
  v7[4] = backdropView;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__SUNavigationBarBackgroundView_setBackdropStyle___block_invoke_2;
  v6[3] = &unk_264812908;
  v6[4] = backdropView;
  [MEMORY[0x263F1CB60] animateWithDuration:v7 animations:v6 completion:0.3];
}

uint64_t __50__SUNavigationBarBackgroundView_setBackdropStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __50__SUNavigationBarBackgroundView_setBackdropStyle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setSeparatorOnTop:(BOOL)a3
{
  if (self->_separatorOnTop != a3)
  {
    self->_separatorOnTop = a3;
    [(SUNavigationBarBackgroundView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SUNavigationBarBackgroundView;
  [(SUNavigationBarBackgroundView *)&v11 layoutSubviews];
  [(SUNavigationBarBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  borderView = self->_borderView;
  double v8 = 0.0;
  if (!self->_separatorOnTop)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
    double v8 = v6 + -1.0 / v9;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  -[UIView setFrame:](borderView, "setFrame:", 0.0, v8, v4, 1.0 / v10);
}

- (id)_currentCustomBackgroundRespectOversize_legacy:(BOOL *)a3
{
  return 0;
}

- (id)_currentCustomBackground
{
  return 0;
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (BOOL)separatorOnTop
{
  return self->_separatorOnTop;
}

- (int64_t)barStyle
{
  return self->barStyle;
}

- (void)setBarStyle:(int64_t)a3
{
  self->barStyle = a3;
}

- (UIColor)barTintColor
{
  return self->barTintColor;
}

- (void)setBarTintColor:(id)a3
{
}

- (_UINavigationBarAppearanceStorage)appearanceStorage
{
  return self->appearanceStorage;
}

- (void)setAppearanceStorage:(id)a3
{
}

- (UIView)_shadowView
{
  return self->_shadowView;
}

- (void)_setShadowView:(id)a3
{
}

- (BOOL)isTranslucent
{
  return self->translucent;
}

- (void)setTranslucent:(BOOL)a3
{
  self->translucent = a3;
}

- (BOOL)barWantsAdaptiveBackdrop
{
  return self->barWantsAdaptiveBackdrop;
}

- (void)setBarWantsAdaptiveBackdrop:(BOOL)a3
{
  self->barWantsAdaptiveBackdrop = a3;
}

@end