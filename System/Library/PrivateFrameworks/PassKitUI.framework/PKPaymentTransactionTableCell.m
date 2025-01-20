@interface PKPaymentTransactionTableCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)identifier;
- (PKPaymentTransactionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKPaymentTransactionView)transactionView;
- (UIColor)primaryColor;
- (UIColor)secondaryColor;
- (UIEdgeInsets)additionalInsets;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAdditionalInsets:(UIEdgeInsets)a3;
- (void)setIdentifier:(id)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setSecondaryColor:(id)a3;
@end

@implementation PKPaymentTransactionTableCell

- (PKPaymentTransactionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionTableCell;
  v4 = [(PKPaymentTransactionTableCell *)&v9 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(PKPaymentTransactionView);
    transactionView = v4->_transactionView;
    v4->_transactionView = v5;

    v7 = [(PKPaymentTransactionTableCell *)v4 contentView];
    [v7 addSubview:v4->_transactionView];

    [(PKPaymentTransactionTableCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85AD0]];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPaymentTransactionView sizeThatFits:](self->_transactionView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentTransactionTableCell;
  [(PKPaymentTransactionTableCell *)&v12 layoutSubviews];
  double v3 = [(PKPaymentTransactionTableCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PKPaymentTransactionView setFrame:](self->_transactionView, "setFrame:", v5 + self->_additionalInsets.left, v7 + self->_additionalInsets.top, v9 - (self->_additionalInsets.left + self->_additionalInsets.right), v11 - (self->_additionalInsets.top + self->_additionalInsets.bottom));
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionTableCell;
  [(PKTableViewCell *)&v4 prepareForReuse];
  [(PKPaymentTransactionTableCell *)self setAccessoryType:0];
  identifier = self->_identifier;
  self->_identifier = 0;

  [(PKPaymentTransactionView *)self->_transactionView setPrimaryColor:0];
  [(PKPaymentTransactionView *)self->_transactionView setSecondaryColor:0];
  [(PKPaymentTransactionView *)self->_transactionView setPrimaryString:0];
  [(PKPaymentTransactionView *)self->_transactionView setSecondaryString:0];
  [(PKPaymentTransactionView *)self->_transactionView setTertiaryString:0];
  [(PKPaymentTransactionView *)self->_transactionView setTransactionValueAttributedText:0];
  [(PKPaymentTransactionView *)self->_transactionView setBadgeString:0];
  [(PKPaymentTransactionView *)self->_transactionView setShowsAvatarView:0];
  [(PKPaymentTransactionView *)self->_transactionView setShowsDisclosureView:0];
  [(PKPaymentTransactionView *)self->_transactionView setPrimaryImage:0];
  [(PKPaymentTransactionView *)self->_transactionView setAlpha:1.0];
}

- (void)setPrimaryColor:(id)a3
{
}

- (UIColor)primaryColor
{
  return [(PKPaymentTransactionView *)self->_transactionView primaryColor];
}

- (void)setSecondaryColor:(id)a3
{
}

- (UIColor)secondaryColor
{
  return [(PKPaymentTransactionView *)self->_transactionView secondaryColor];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (PKPaymentTransactionView)transactionView
{
  return self->_transactionView;
}

- (UIEdgeInsets)additionalInsets
{
  double top = self->_additionalInsets.top;
  double left = self->_additionalInsets.left;
  double bottom = self->_additionalInsets.bottom;
  double right = self->_additionalInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAdditionalInsets:(UIEdgeInsets)a3
{
  self->_additionalInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionView, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end