@interface PKPaymentTransactionCollectionViewCell
- (BOOL)isDeletable;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)identifier;
- (PKPaymentTransactionCollectionViewCell)initWithFrame:(CGRect)a3;
- (PKPaymentTransactionView)transactionView;
- (double)maxWidthForTransactionCellInWidth:(double)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDeletable:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation PKPaymentTransactionCollectionViewCell

- (PKPaymentTransactionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentTransactionCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
    uint64_t v6 = [v4 initWithImage:v5];
    multiselectImageView = v3->_multiselectImageView;
    v3->_multiselectImageView = (UIImageView *)v6;

    -[UIImageView setFrame:](v3->_multiselectImageView, "setFrame:", 0.0, 0.0, 25.6667, 25.6667);
    v8 = v3->_multiselectImageView;
    v9 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v8 setTintColor:v9];

    [(UIImageView *)v3->_multiselectImageView setHidden:!v3->_isEditing];
    v10 = v3->_multiselectImageView;
    v11 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
    [(UIImageView *)v10 setPreferredSymbolConfiguration:v11];

    v12 = objc_alloc_init(PKPaymentTransactionView);
    transactionView = v3->_transactionView;
    v3->_transactionView = v12;

    v14 = [(PKPaymentTransactionCollectionViewCell *)v3 contentView];
    [v14 addSubview:v3->_multiselectImageView];

    v15 = [(PKPaymentTransactionCollectionViewCell *)v3 contentView];
    [v15 addSubview:v3->_transactionView];

    v16 = [(PKPaymentTransactionCollectionViewCell *)v3 contentView];
    [v16 setClipsToBounds:1];

    [(PKPaymentTransactionCollectionViewCell *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85AD0]];
  }
  return v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v4 prepareForReuse];
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
  [(PKPaymentTransactionView *)self->_transactionView setSecondaryBadgeSymbol:0];
  [(PKPaymentTransactionView *)self->_transactionView setSecondaryBadgeSymbolConfiguration:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  double v7 = width + v6 * -2.0;
  transactionView = self->_transactionView;

  -[PKPaymentTransactionView sizeThatFits:](transactionView, "sizeThatFits:", v7, height);
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentTransactionCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v21 layoutSubviews];
  v3 = [(PKPaymentTransactionCollectionViewCell *)self contentView];
  [v3 bounds];
  double x = v4;
  double y = v6;
  double width = v8;
  double height = v10;

  remainder.origin.double x = x;
  remainder.origin.double y = y;
  remainder.size.double width = width;
  remainder.size.double height = height;
  memset(&v19, 0, sizeof(v19));
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  CGRectDivide(v22, &v19, &remainder, 14.0, CGRectMinXEdge);
  [(UIImageView *)self->_multiselectImageView frame];
  CGRectDivide(remainder, &v19, &remainder, v12, CGRectMinXEdge);
  __asm { FMOV            V2.2D, #0.5 }
  [(UIImageView *)self->_multiselectImageView setCenter:vaddq_f64((float64x2_t)v19.origin, vmulq_f64((float64x2_t)v19.size, _Q2))];
  BOOL v18 = !self->_deletable || !self->_isEditing;
  [(UIImageView *)self->_multiselectImageView setHidden:v18];
  if (self->_isEditing)
  {
    double x = remainder.origin.x;
    double y = remainder.origin.y;
    double width = remainder.size.width;
    double height = remainder.size.height;
  }
  -[PKPaymentTransactionView setFrame:](self->_transactionView, "setFrame:", x, y, width, height);
}

- (double)maxWidthForTransactionCellInWidth:(double)a3
{
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  return a3 + v4 * -2.0;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentTransactionCollectionViewCell;
  [(PKPaymentTransactionCollectionViewCell *)&v14 updateConfigurationUsingState:v4];
  if ([v4 isEditing] && !self->_isEditing)
  {
    self->_originalShowsDisclosureView = [(PKPaymentTransactionView *)self->_transactionView showsDisclosureView];
    [(PKPaymentTransactionView *)self->_transactionView setShowsDisclosureView:0];
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v7 = [MEMORY[0x1E4FB1618] systemGray4Color];
    [v6 setBackgroundColor:v7];

    [(PKPaymentTransactionCollectionViewCell *)self setSelectedBackgroundView:v6];
  }
  else if (([v4 isEditing] & 1) == 0 && self->_isEditing)
  {
    [(PKPaymentTransactionView *)self->_transactionView setShowsDisclosureView:self->_originalShowsDisclosureView];
    [(PKPaymentTransactionCollectionViewCell *)self setSelectedBackgroundView:0];
  }
  if ([v4 isEditing])
  {
    int v8 = [v4 isSelected];
    multiselectImageView = self->_multiselectImageView;
    if (v8)
    {
      double v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
      [(UIImageView *)multiselectImageView setImage:v10];

      v11 = self->_multiselectImageView;
      [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    else
    {
      CGFloat v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
      [(UIImageView *)multiselectImageView setImage:v12];

      v11 = self->_multiselectImageView;
      [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v13 = };
    [(UIImageView *)v11 setTintColor:v13];
  }
  self->_isEditing = [v4 isEditing];
  [(PKPaymentTransactionCollectionViewCell *)self setNeedsLayout];
  [(PKPaymentTransactionCollectionViewCell *)self layoutIfNeeded];
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

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (void)setDeletable:(BOOL)a3
{
  self->_deletable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_multiselectImageView, 0);
}

@end