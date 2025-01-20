@interface SUUISimpleCollectionViewCell
- (UIEdgeInsets)contentInsets;
- (UIView)contentChildView;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setContentChildView:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
@end

@implementation SUUISimpleCollectionViewCell

- (void)setContentChildView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentChildView = &self->_contentChildView;
  contentChildView = self->_contentChildView;
  v11 = v5;
  if (contentChildView != v5)
  {
    if ([(UIView *)contentChildView isDescendantOfView:self]) {
      [(UIView *)*p_contentChildView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentChildView, a3);
    [(SUUISimpleCollectionViewCell *)self setNeedsLayout];
    v5 = *p_contentChildView;
  }
  if (v5 && ![(UIView *)v5 isDescendantOfView:self])
  {
    v8 = [(SUUISimpleCollectionViewCell *)self contentView];
    v9 = *p_contentChildView;
    v10 = [(SUUISimpleCollectionViewCell *)self backgroundColor];
    [(UIView *)v9 setBackgroundColor:v10];

    [v8 addSubview:*p_contentChildView];
    [(SUUISimpleCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(SUUISimpleCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = [v4 backgroundColor];
  [(SUUISimpleCollectionViewCell *)self setBackgroundColor:v5];

  v6.receiver = self;
  v6.super_class = (Class)SUUISimpleCollectionViewCell;
  [(SUUISimpleCollectionViewCell *)&v6 applyLayoutAttributes:v4];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SUUISimpleCollectionViewCell;
  [(SUUISimpleCollectionViewCell *)&v12 layoutSubviews];
  v3 = [(SUUISimpleCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setFrame:](self->_contentChildView, "setFrame:", v5 + self->_contentInsets.left, v7 + self->_contentInsets.top, v9 - (self->_contentInsets.left + self->_contentInsets.right), v11 - (self->_contentInsets.top + self->_contentInsets.bottom));
}

- (void)setBackgroundColor:(id)a3
{
  contentChildView = self->_contentChildView;
  id v5 = a3;
  [(UIView *)contentChildView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUISimpleCollectionViewCell;
  [(SUUISimpleCollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (UIView)contentChildView
{
  return self->_contentChildView;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end