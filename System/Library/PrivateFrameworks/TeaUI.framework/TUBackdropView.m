@interface TUBackdropView
- (TUBackdropView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (UIVisualEffectView)backdropView;
- (void)layoutSubviews;
@end

@implementation TUBackdropView

- (TUBackdropView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TUBackdropView;
  v3 = -[TUBackdropView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v4];
    backdropView = v3->_backdropView;
    v3->_backdropView = (UIVisualEffectView *)v5;

    [(TUBackdropView *)v3 addSubview:v3->_backdropView];
    [(TUBackdropView *)v3 setOpaque:0];
    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(TUBackdropView *)v3 setBackgroundColor:v7];
  }
  return v3;
}

- (UIView)contentView
{
  v2 = [(TUBackdropView *)self backdropView];
  v3 = [v2 contentView];

  return (UIView *)v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)TUBackdropView;
  [(TUBackdropView *)&v12 layoutSubviews];
  [(TUBackdropView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TUBackdropView *)self backdropView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (UIVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (void).cxx_destruct
{
}

@end