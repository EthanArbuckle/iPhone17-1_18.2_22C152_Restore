@interface PKPaymentSetupGDPRCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)privacyView;
- (void)layoutSubviews;
- (void)setPrivacyView:(id)a3;
- (void)setprivacyView:(id)a3;
@end

@implementation PKPaymentSetupGDPRCollectionViewCell

- (void)setprivacyView:(id)a3
{
  v4 = (UIView *)a3;
  [(UIView *)self->_privacyView removeFromSuperview];
  privacyView = self->_privacyView;
  self->_privacyView = v4;
  v6 = v4;

  id v7 = [(PKPaymentSetupGDPRCollectionViewCell *)self contentView];
  [v7 addSubview:self->_privacyView];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIView *)self->_privacyView setNeedsLayout];
  [(UIView *)self->_privacyView layoutIfNeeded];
  privacyView = self->_privacyView;
  LODWORD(v7) = 1148846080;
  LODWORD(v8) = 1112014848;

  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](privacyView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v7, v8);
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  [(PKPaymentSetupGDPRCollectionViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(UIView *)self->_privacyView superview];

  if (!v7)
  {
    double v10 = [(PKPaymentSetupGDPRCollectionViewCell *)self contentView];
    [v10 addSubview:self->_privacyView];
  }
  LODWORD(v8) = 1148846080;
  LODWORD(v9) = 1112014848;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_privacyView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v4, v6, v8, v9);
  privacyView = self->_privacyView;
  PKSizeAlignedInRect();

  -[UIView setFrame:](privacyView, "setFrame:");
}

- (UIView)privacyView
{
  return self->_privacyView;
}

- (void)setPrivacyView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end