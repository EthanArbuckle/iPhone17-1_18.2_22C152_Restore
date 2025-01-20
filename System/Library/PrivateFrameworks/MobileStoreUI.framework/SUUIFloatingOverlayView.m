@interface SUUIFloatingOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIFloatingOverlayView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentView:(id)a3;
@end

@implementation SUUIFloatingOverlayView

- (SUUIFloatingOverlayView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIFloatingOverlayView;
  v3 = -[SUUIFloatingOverlayView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIFloatingOverlayView *)v3 setBackgroundColor:v4];

    [(SUUIFloatingOverlayView *)v3 setClipsToBounds:1];
    v5 = [(SUUIFloatingOverlayView *)v3 layer];
    [v5 setCornerRadius:10.0];

    v6 = (void *)[objc_alloc(MEMORY[0x263F82EB8]) initWithPrivateStyle:2020];
    v7 = [v6 inputSettings];
    v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
    v9 = [v8 colorWithAlphaComponent:0.6];
    [v7 setColorTint:v9];

    [v6 setAutoresizingMask:18];
    [(SUUIFloatingOverlayView *)v3 bounds];
    objc_msgSend(v6, "setFrame:");
    [(SUUIFloatingOverlayView *)v3 addSubview:v6];
  }
  return v3;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIFloatingOverlayView *)self setNeedsLayout];
  }
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  v10 = v5;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    v8 = *p_contentView;
    if (*p_contentView)
    {
      v9 = [MEMORY[0x263F825C8] clearColor];
      [(UIView *)v8 setBackgroundColor:v9];

      [(SUUIFloatingOverlayView *)self addSubview:*p_contentView];
    }
  }
}

- (void)layoutSubviews
{
  contentView = self->_contentView;
  [(SUUIFloatingOverlayView *)self bounds];
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double v7 = v6 + left;
  double v9 = v8 + top;
  double v11 = v10 - (left + self->_contentInset.right);
  double v13 = v12 - (top + self->_contentInset.bottom);
  -[UIView setFrame:](contentView, "setFrame:", v7, v9, v11, v13);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  double v6 = v5 + self->_contentInset.top + self->_contentInset.bottom;
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end