@interface SKUIFloatingOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIFloatingOverlayView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentView:(id)a3;
@end

@implementation SKUIFloatingOverlayView

- (SKUIFloatingOverlayView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFloatingOverlayView initWithFrame:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIFloatingOverlayView;
  v8 = -[SKUIFloatingOverlayView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIFloatingOverlayView *)v8 setBackgroundColor:v9];

    [(SKUIFloatingOverlayView *)v8 setClipsToBounds:1];
    v10 = [(SKUIFloatingOverlayView *)v8 layer];
    [v10 setCornerRadius:10.0];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2020];
    v12 = [v11 inputSettings];
    v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v14 = [v13 colorWithAlphaComponent:0.6];
    [v12 setColorTint:v14];

    [v11 setAutoresizingMask:18];
    [(SKUIFloatingOverlayView *)v8 bounds];
    objc_msgSend(v11, "setFrame:");
    [(SKUIFloatingOverlayView *)v8 addSubview:v11];
  }
  return v8;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUIFloatingOverlayView *)self setNeedsLayout];
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
      v9 = [MEMORY[0x1E4FB1618] clearColor];
      [(UIView *)v8 setBackgroundColor:v9];

      [(SKUIFloatingOverlayView *)self addSubview:*p_contentView];
    }
  }
}

- (void)layoutSubviews
{
  contentView = self->_contentView;
  [(SKUIFloatingOverlayView *)self bounds];
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
  result.double height = v6;
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFloatingOverlayView initWithFrame:]";
}

@end