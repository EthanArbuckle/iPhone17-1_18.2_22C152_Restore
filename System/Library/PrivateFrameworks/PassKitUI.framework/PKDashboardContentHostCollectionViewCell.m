@interface PKDashboardContentHostCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDashboardContentHostCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)hostedContentInset;
- (UIView)hostedContentView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHostedContentInset:(UIEdgeInsets)a3;
- (void)setHostedContentView:(id)a3;
@end

@implementation PKDashboardContentHostCollectionViewCell

- (PKDashboardContentHostCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKDashboardContentHostCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKDashboardCollectionViewCell *)v3 setWantsCustomAppearance:1];
  }
  return v4;
}

- (void)setHostedContentInset:(UIEdgeInsets)a3
{
  if (self->_hostedContentInset.left != a3.left
    || self->_hostedContentInset.top != a3.top
    || self->_hostedContentInset.right != a3.right
    || self->_hostedContentInset.bottom != a3.bottom)
  {
    self->_hostedContentInset = a3;
    [(PKDashboardContentHostCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setHostedContentView:(id)a3
{
  v4 = (UIView *)a3;
  hostedContentView = self->_hostedContentView;
  if (hostedContentView)
  {
    [(UIView *)hostedContentView removeFromSuperview];
    objc_super v6 = self->_hostedContentView;
  }
  else
  {
    objc_super v6 = 0;
  }
  self->_hostedContentView = v4;
  v7 = v4;

  v8 = [(PKDashboardContentHostCollectionViewCell *)self contentView];
  [v8 addSubview:v7];

  [(PKDashboardContentHostCollectionViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardContentHostCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v7 layoutSubviews];
  if (self->_hostedContentView)
  {
    [(PKDashboardContentHostCollectionViewCell *)self bounds];
    -[UIView setFrame:](self->_hostedContentView, "setFrame:", v3 + self->_hostedContentInset.left, v4 + self->_hostedContentInset.top, v5 - (self->_hostedContentInset.left + self->_hostedContentInset.right), v6 - (self->_hostedContentInset.top + self->_hostedContentInset.bottom));
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_hostedContentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardContentHostCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v3 prepareForReuse];
  if (objc_opt_respondsToSelector()) {
    [(UIView *)self->_hostedContentView performSelector:sel_prepareForReuse];
  }
}

- (UIEdgeInsets)hostedContentInset
{
  double top = self->_hostedContentInset.top;
  double left = self->_hostedContentInset.left;
  double bottom = self->_hostedContentInset.bottom;
  double right = self->_hostedContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)hostedContentView
{
  return self->_hostedContentView;
}

- (void).cxx_destruct
{
}

@end