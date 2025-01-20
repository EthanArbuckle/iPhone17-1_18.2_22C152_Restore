@interface _TVCommonSenseFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)logoView;
- (_TVCommonSenseFooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setLogoView:(id)a3;
@end

@implementation _TVCommonSenseFooterView

- (_TVCommonSenseFooterView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_TVCommonSenseFooterView;
  v3 = -[_TVCommonSenseFooterView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_TVCommonSenseFooterView *)v3 setBackgroundColor:0];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v5;

    v7 = v4->_separatorView;
    v8 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.1];
    [(UIView *)v7 setBackgroundColor:v8];

    [(_TVCommonSenseFooterView *)v4 addSubview:v4->_separatorView];
  }
  return v4;
}

- (void)setLogoView:(id)a3
{
  v5 = (UIView *)a3;
  p_logoView = &self->_logoView;
  logoView = self->_logoView;
  if (logoView != v5)
  {
    v9 = v5;
    if (logoView)
    {
      [(UIView *)logoView removeFromSuperview];
      v8 = *p_logoView;
      *p_logoView = 0;

      v5 = v9;
    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_logoView, a3);
      [(_TVCommonSenseFooterView *)self addSubview:*p_logoView];
    }
    logoView = (UIView *)[(_TVCommonSenseFooterView *)self setNeedsLayout];
    v5 = v9;
  }
  MEMORY[0x270F9A758](logoView, v5);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_TVCommonSenseFooterView;
  [(_TVCommonSenseFooterView *)&v5 layoutSubviews];
  [(_TVCommonSenseFooterView *)self bounds];
  CGFloat v4 = v3;
  -[UIView setFrame:](self->_separatorView, "setFrame:", 0.0, 0.0);
  [(UIView *)self->_logoView tv_margin];
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.height = 1.0;
  v6.size.width = v4;
  CGRectGetHeight(v6);
  -[UIView sizeThatFits:](self->_logoView, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  UIRectCenteredXInRect();
  -[UIView setFrame:](self->_logoView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UIView sizeThatFits:](self->_logoView, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v5 = v4 + 1.0;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (UIView)logoView
{
  return self->_logoView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end