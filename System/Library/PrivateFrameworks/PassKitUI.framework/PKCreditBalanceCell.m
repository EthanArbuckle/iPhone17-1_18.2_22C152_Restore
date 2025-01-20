@interface PKCreditBalanceCell
- (BOOL)useAccessibilityLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)amountText;
- (NSString)balanceText;
- (NSString)creditAvailableText;
- (PKCreditBalanceCell)initWithFrame:(CGRect)a3;
- (PKDashboardCreditAccountItem)item;
- (UIColor)creditAvailableTextColor;
- (UIFont)amountFont;
- (UIFont)balanceFont;
- (UIFont)creditAvailableFont;
- (int64_t)balanceLabelNumberOfLines;
- (void)_createSubviews;
- (void)_updateDefaultValues;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAmountFont:(id)a3;
- (void)setAmountText:(id)a3;
- (void)setBalanceFont:(id)a3;
- (void)setBalanceLabelNumberOfLines:(int64_t)a3;
- (void)setBalanceText:(id)a3;
- (void)setCreditAvailableFont:(id)a3;
- (void)setCreditAvailableText:(id)a3;
- (void)setCreditAvailableTextColor:(id)a3;
- (void)setItem:(id)a3;
- (void)setUseAccessibilityLayout:(BOOL)a3;
@end

@implementation PKCreditBalanceCell

- (PKCreditBalanceCell)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCreditBalanceCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
    [(PKCreditBalanceCell *)v3 _createSubviews];
  }
  return v3;
}

- (void)_createSubviews
{
  id v17 = [(PKCreditBalanceCell *)self contentView];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  labelBalance = self->_labelBalance;
  self->_labelBalance = v3;

  objc_super v5 = [(UILabel *)self->_labelBalance font];
  defaultFont = self->_defaultFont;
  self->_defaultFont = v5;

  [(UILabel *)self->_labelBalance setNumberOfLines:1];
  [(UILabel *)self->_labelBalance setAdjustsFontSizeToFitWidth:1];
  v7 = self->_labelBalance;
  v8 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v7 setTextColor:v8];

  [(UILabel *)self->_labelBalance setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];
  [v17 addSubview:self->_labelBalance];
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  labelAmount = self->_labelAmount;
  self->_labelAmount = v9;

  [(UILabel *)self->_labelAmount setNumberOfLines:1];
  [(UILabel *)self->_labelAmount setAdjustsFontSizeToFitWidth:1];
  v11 = self->_labelAmount;
  v12 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v11 setTextColor:v12];

  [(UILabel *)self->_labelAmount setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [v17 addSubview:self->_labelAmount];
  v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  labelCreditAvailable = self->_labelCreditAvailable;
  self->_labelCreditAvailable = v13;

  [(UILabel *)self->_labelCreditAvailable setNumberOfLines:1];
  [(UILabel *)self->_labelCreditAvailable setAdjustsFontSizeToFitWidth:1];
  v15 = self->_labelCreditAvailable;
  v16 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v15 setTextColor:v16];

  [(UILabel *)self->_labelCreditAvailable setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  [v17 addSubview:self->_labelCreditAvailable];
  [(PKCreditBalanceCell *)self _updateDefaultValues];
  [(PKCreditBalanceCell *)self setAccessibilityIdentifier:*MEMORY[0x1E4F852A8]];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKCreditBalanceCell;
  [(PKDashboardCollectionViewCell *)&v3 prepareForReuse];
  [(PKCreditBalanceCell *)self _updateDefaultValues];
}

- (void)_updateDefaultValues
{
  [(PKCreditBalanceCell *)self setBalanceText:0];
  [(PKCreditBalanceCell *)self setBalanceFont:self->_defaultFont];
  [(PKCreditBalanceCell *)self setBalanceLabelNumberOfLines:1];
  [(PKCreditBalanceCell *)self setAmountText:0];
  [(PKCreditBalanceCell *)self setAmountFont:self->_defaultFont];
  [(PKCreditBalanceCell *)self setCreditAvailableText:0];
  [(PKCreditBalanceCell *)self setCreditAvailableFont:self->_defaultFont];
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKCreditBalanceCell *)self setCreditAvailableTextColor:v3];
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)PKCreditBalanceCell;
  [(PKDashboardCollectionViewCell *)&v21 layoutSubviews];
  BOOL isCompactUI = self->_isCompactUI;
  [(PKCreditBalanceCell *)self bounds];
  double v8 = 12.0;
  if (isCompactUI) {
    double v8 = 8.0;
  }
  double v9 = v8 + v4;
  double v10 = v5 + 8.0;
  double v11 = 16.0;
  if (!isCompactUI) {
    double v11 = 24.0;
  }
  CGFloat v12 = v6 - v11;
  CGFloat v13 = v7 + -16.0;
  [(PKCreditBalanceCell *)self _shouldReverseLayoutDirection];
  memset(&slice, 0, sizeof(slice));
  v19.size.width = v12;
  v19.size.height = v13;
  -[UILabel sizeThatFits:](self->_labelBalance, "sizeThatFits:", v12, v13, *(void *)&v9, *(void *)&v10);
  CGFloat v15 = v14 + 0.0;
  v22.origin.x = v9;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v13;
  CGRectDivide(v22, &slice, &v19, v15, CGRectMinYEdge);
  labelBalance = self->_labelBalance;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](labelBalance, "setFrame:");
  -[UILabel sizeThatFits:](self->_labelAmount, "sizeThatFits:", v19.size.width, v19.size.height);
  CGRect v23 = v19;
  CGRectDivide(v19, &slice, &v19, v23.origin.y + 0.0, CGRectMinYEdge);
  labelAmount = self->_labelAmount;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](labelAmount, "setFrame:");
  -[UILabel sizeThatFits:](self->_labelCreditAvailable, "sizeThatFits:", v19.size.width, v19.size.height);
  CGRect v24 = v19;
  CGRectDivide(v19, &slice, &v19, v24.origin.y + 0.0, CGRectMinYEdge);
  labelCreditAvailable = self->_labelCreditAvailable;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](labelCreditAvailable, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  CGFloat v6 = a3.width + -24.0;
  [(UILabel *)self->_labelBalance sizeThatFits:a3.width + -24.0];
  double v8 = v7 + 0.0 + 16.0;
  -[UILabel sizeThatFits:](self->_labelAmount, "sizeThatFits:", v6, height);
  double v10 = v8 + v9 + 0.0;
  -[UILabel sizeThatFits:](self->_labelCreditAvailable, "sizeThatFits:", v6, height);
  double v12 = v10 + v11 + 0.0;
  double v13 = width;
  result.double height = v12;
  result.CGFloat width = v13;
  return result;
}

- (void)setBalanceText:(id)a3
{
  id v5 = a3;
  CGFloat v6 = self->_balanceText;
  double v7 = (NSString *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_balanceText, a3);
    [(UILabel *)self->_labelBalance setText:self->_balanceText];
    [(PKCreditBalanceCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setBalanceFont:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_balanceFont, a3);
    [(UILabel *)self->_labelBalance setFont:v5];
    [(PKCreditBalanceCell *)self setNeedsLayout];
  }
}

- (void)setBalanceLabelNumberOfLines:(int64_t)a3
{
  if (self->_balanceLabelNumberOfLines != a3)
  {
    self->_balanceLabelNumberOfLines = a3;
    -[UILabel setNumberOfLines:](self->_labelBalance, "setNumberOfLines:");
    [(PKCreditBalanceCell *)self setNeedsLayout];
  }
}

- (void)setAmountText:(id)a3
{
  id v5 = a3;
  CGFloat v6 = self->_amountText;
  double v7 = (NSString *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_amountText, a3);
    [(UILabel *)self->_labelAmount setText:self->_amountText];
    [(PKCreditBalanceCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setAmountFont:(id)a3
{
  p_amountFont = &self->_amountFont;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amountFont, a3);
    [(UILabel *)self->_labelAmount setFont:*p_amountFont];
    [(PKCreditBalanceCell *)self setNeedsLayout];
  }
}

- (void)setCreditAvailableText:(id)a3
{
  id v5 = a3;
  id v6 = self->_creditAvailableText;
  double v7 = (NSString *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_creditAvailableText, a3);
    [(UILabel *)self->_labelCreditAvailable setText:self->_creditAvailableText];
    [(PKCreditBalanceCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setCreditAvailableFont:(id)a3
{
  p_creditAvailableFont = &self->_creditAvailableFont;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_creditAvailableFont, a3);
    [(UILabel *)self->_labelCreditAvailable setFont:*p_creditAvailableFont];
    [(PKCreditBalanceCell *)self setNeedsLayout];
  }
}

- (void)setCreditAvailableTextColor:(id)a3
{
  p_creditAvailableTextColor = &self->_creditAvailableTextColor;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_creditAvailableTextColor, a3);
    [(UILabel *)self->_labelCreditAvailable setTextColor:*p_creditAvailableTextColor];
  }
}

- (void)setItem:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_item, a3);
    [(PKCreditBalanceCell *)self setNeedsLayout];
  }
}

- (void)setUseAccessibilityLayout:(BOOL)a3
{
  if (self->_useAccessibilityLayout != a3)
  {
    self->_useAccessibilityLayout = a3;
    [(PKCreditBalanceCell *)self setNeedsLayout];
  }
}

- (PKDashboardCreditAccountItem)item
{
  return self->_item;
}

- (NSString)balanceText
{
  return self->_balanceText;
}

- (UIFont)balanceFont
{
  return self->_balanceFont;
}

- (int64_t)balanceLabelNumberOfLines
{
  return self->_balanceLabelNumberOfLines;
}

- (NSString)amountText
{
  return self->_amountText;
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (NSString)creditAvailableText
{
  return self->_creditAvailableText;
}

- (UIFont)creditAvailableFont
{
  return self->_creditAvailableFont;
}

- (UIColor)creditAvailableTextColor
{
  return self->_creditAvailableTextColor;
}

- (BOOL)useAccessibilityLayout
{
  return self->_useAccessibilityLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creditAvailableTextColor, 0);
  objc_storeStrong((id *)&self->_creditAvailableFont, 0);
  objc_storeStrong((id *)&self->_creditAvailableText, 0);
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_balanceFont, 0);
  objc_storeStrong((id *)&self->_balanceText, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_labelCreditAvailable, 0);
  objc_storeStrong((id *)&self->_labelAmount, 0);
  objc_storeStrong((id *)&self->_labelBalance, 0);

  objc_storeStrong((id *)&self->_defaultFont, 0);
}

@end