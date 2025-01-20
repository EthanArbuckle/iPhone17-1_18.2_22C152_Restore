@interface SUSegmentedControlBar
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUSegmentedControlBar)initWithSegmentedControl:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation SUSegmentedControlBar

- (SUSegmentedControlBar)initWithSegmentedControl:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SUSegmentedControlBar;
  v4 = -[SUSegmentedControlBar initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v4)
  {
    if ((_UIApplicationUsesLegacyUI() & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x263F1C550] colorWithWhite:0.70588237 alpha:1.0];
      if ([a3 tintStyle] == 1)
      {
        uint64_t v5 = [MEMORY[0x263F1C550] colorWithWhite:0.254901975 alpha:1.0];
        uint64_t v6 = 11050;
      }
      else
      {
        uint64_t v6 = 2010;
      }
      uint64_t v7 = [objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:v6];
      v4->_backdropView = (_UIBackdropView *)v7;
      [(SUSegmentedControlBar *)v4 addSubview:v7];
      v8 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
      v4->_separatorView = v8;
      [(UIView *)v8 setBackgroundColor:v5];
      [(SUSegmentedControlBar *)v4 addSubview:v4->_separatorView];
    }
    v9 = (UIControl *)a3;
    v4->_control = v9;
    [(SUSegmentedControlBar *)v4 addSubview:v9];
    -[SUSegmentedControlBar setBackgroundColor:](v4, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUSegmentedControlBar;
  [(SUSegmentedControlBar *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SUSegmentedControlBar;
  [(SUSegmentedControlBar *)&v22 layoutSubviews];
  [(SUSegmentedControlBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  control = self->_control;
  if (control)
  {
    [(UIControl *)control frame];
    int v12 = _UIApplicationUsesLegacyUI();
    double v13 = 10.0;
    if (v12) {
      double v13 = 0.0;
    }
    double v21 = v13;
    if (_UIApplicationUsesLegacyUI()) {
      double v14 = 0.0;
    }
    else {
      double v14 = 15.0;
    }
    if (_UIApplicationUsesLegacyUI()) {
      double v15 = 0.0;
    }
    else {
      double v15 = 15.0;
    }
    double v16 = v8 + v15 * -2.0;
    int v17 = _UIApplicationUsesLegacyUI();
    double v18 = 10.0;
    if (v17) {
      double v18 = 0.0;
    }
    -[UIControl setFrame:](self->_control, "setFrame:", v14, v21, v16, v10 + v18 * -2.0);
  }
  backdropView = self->_backdropView;
  if (backdropView) {
    -[_UIBackdropView setFrame:](backdropView, "setFrame:", v4, v6, v8, v10);
  }
  if (self->_separatorView)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
    -[UIView setFrame:](self->_separatorView, "setFrame:", v4, v6 + v10 - 1.0 / v20, v8);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (_UIApplicationUsesLegacyUI()) {
    double v6 = 0.0;
  }
  else {
    double v6 = 10.0;
  }
  double v7 = height - v6 * 2.0;
  if (_UIApplicationUsesLegacyUI()) {
    double v8 = 0.0;
  }
  else {
    double v8 = 15.0;
  }
  -[UIControl sizeThatFits:](self->_control, "sizeThatFits:", width - v8 * 2.0, v7);
  double v10 = v9;
  double v12 = v11;
  if (_UIApplicationUsesLegacyUI()) {
    double v13 = 0.0;
  }
  else {
    double v13 = 10.0;
  }
  double v14 = v12 + v13 * 2.0;
  if (_UIApplicationUsesLegacyUI()) {
    double v15 = 0.0;
  }
  else {
    double v15 = 15.0;
  }
  double v16 = v10 + v15 * 2.0;
  double v17 = v14;
  result.double height = v17;
  result.double width = v16;
  return result;
}

@end