@interface SKUIRedeemResultSimpleTableViewCell
- (UIEdgeInsets)childContentInsets;
- (UIView)childContentView;
- (void)layoutSubviews;
- (void)setChildContentInsets:(UIEdgeInsets)a3;
- (void)setChildContentView:(id)a3;
@end

@implementation SKUIRedeemResultSimpleTableViewCell

- (void)setChildContentInsets:(UIEdgeInsets)a3
{
  self->_childContentInsets = a3;
  [(SKUIRedeemResultSimpleTableViewCell *)self setNeedsLayout];
}

- (void)setChildContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_childContentView = &self->_childContentView;
  childContentView = self->_childContentView;
  v9 = v5;
  if (childContentView == v5)
  {
    if (!v5 || [(UIView *)v5 isDescendantOfView:self]) {
      goto LABEL_9;
    }
LABEL_8:
    v8 = [(SKUIRedeemResultSimpleTableViewCell *)self contentView];
    [v8 addSubview:*p_childContentView];

    [(SKUIRedeemResultSimpleTableViewCell *)self setNeedsLayout];
    goto LABEL_9;
  }
  if ([(UIView *)childContentView isDescendantOfView:self]) {
    [(UIView *)*p_childContentView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_childContentView, a3);
  if (v9) {
    goto LABEL_8;
  }
LABEL_9:

  MEMORY[0x1F41817F8]();
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SKUIRedeemResultSimpleTableViewCell;
  [(SKUIRedeemResultSimpleTableViewCell *)&v10 layoutSubviews];
  [(UIView *)self->_childContentView frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [(SKUIRedeemResultSimpleTableViewCell *)self contentView];
  [v7 frame];
  double v9 = (v8 - v4) * 0.5;

  -[UIView setFrame:](self->_childContentView, "setFrame:", v9, self->_childContentInsets.top, v4, v6);
}

- (UIEdgeInsets)childContentInsets
{
  double top = self->_childContentInsets.top;
  double left = self->_childContentInsets.left;
  double bottom = self->_childContentInsets.bottom;
  double right = self->_childContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)childContentView
{
  return self->_childContentView;
}

- (void).cxx_destruct
{
}

@end