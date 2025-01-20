@interface SUUIRedeemResultSimpleTableViewCell
- (UIEdgeInsets)childContentInsets;
- (UIView)childContentView;
- (void)layoutSubviews;
- (void)setChildContentInsets:(UIEdgeInsets)a3;
- (void)setChildContentView:(id)a3;
@end

@implementation SUUIRedeemResultSimpleTableViewCell

- (void)setChildContentInsets:(UIEdgeInsets)a3
{
  self->_childContentInsets = a3;
  [(SUUIRedeemResultSimpleTableViewCell *)self setNeedsLayout];
}

- (void)setChildContentView:(id)a3
{
  id v5 = a3;
  p_uint64_t childContentView = &self->_childContentView;
  uint64_t childContentView = (uint64_t)self->_childContentView;
  id v9 = v5;
  if ((id)childContentView == v5)
  {
    if (!v5) {
      goto LABEL_9;
    }
    uint64_t childContentView = [v5 isDescendantOfView:self];
    id v5 = v9;
    if (childContentView) {
      goto LABEL_9;
    }
LABEL_8:
    v8 = [(SUUIRedeemResultSimpleTableViewCell *)self contentView];
    [v8 addSubview:*p_childContentView];

    uint64_t childContentView = [(SUUIRedeemResultSimpleTableViewCell *)self setNeedsLayout];
    id v5 = v9;
    goto LABEL_9;
  }
  if ([(id)childContentView isDescendantOfView:self]) {
    [(UIView *)*p_childContentView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_childContentView, a3);
  id v5 = v9;
  if (v9) {
    goto LABEL_8;
  }
LABEL_9:
  MEMORY[0x270F9A758](childContentView, v5);
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIRedeemResultSimpleTableViewCell;
  [(SUUIRedeemResultSimpleTableViewCell *)&v10 layoutSubviews];
  [(UIView *)self->_childContentView frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [(SUUIRedeemResultSimpleTableViewCell *)self contentView];
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