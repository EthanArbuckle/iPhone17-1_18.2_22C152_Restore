@interface SUFooterContainerView
- (BOOL)isFooterVisible;
- (UIView)contentView;
- (UIView)footerView;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setFooterVisible:(BOOL)a3;
@end

@implementation SUFooterContainerView

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  contentView = self->_contentView;
  v7 = v5;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    if (self->_contentView) {
      -[SUFooterContainerView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setFooterView:(id)a3
{
  v5 = (UIView *)a3;
  footerView = self->_footerView;
  v7 = v5;
  if (footerView != v5)
  {
    [(UIView *)footerView removeFromSuperview];
    objc_storeStrong((id *)&self->_footerView, a3);
    if (self->_footerView) {
      -[SUFooterContainerView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setFooterVisible:(BOOL)a3
{
  if (self->_footerVisible != a3)
  {
    self->_footerVisible = a3;
    [(SUFooterContainerView *)self layoutSubviews];
  }
}

- (void)layoutSubviews
{
  [(SUFooterContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double MinY = v9;
  footerView = self->_footerView;
  if (footerView)
  {
    [(UIView *)footerView frame];
    double v13 = v12;
    BOOL footerVisible = self->_footerVisible;
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = MinY;
    double MaxY = CGRectGetMaxY(v20);
    double v16 = 0.0;
    if (footerVisible) {
      double v16 = v13;
    }
    CGFloat v17 = MaxY - v16;
    -[UIView setFrame:](self->_footerView, "setFrame:", 0.0, MaxY - v16, v8, v13);
    v21.origin.x = 0.0;
    v21.origin.y = v17;
    v21.size.width = v8;
    v21.size.height = v13;
    double MinY = CGRectGetMinY(v21);
  }
  contentView = self->_contentView;
  if (contentView)
  {
    -[UIView setFrame:](contentView, "setFrame:", v4, v6, v8, MinY);
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (BOOL)isFooterVisible
{
  return self->_footerVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end