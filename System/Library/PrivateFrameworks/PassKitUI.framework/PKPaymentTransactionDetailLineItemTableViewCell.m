@interface PKPaymentTransactionDetailLineItemTableViewCell
- (BOOL)hasTrailingLineSeperator;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)titleText;
- (NSString)valueText;
- (PKPaymentTransactionDetailLineItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)titleColor;
- (UIColor)valueColor;
- (UIFont)titleFont;
- (UIFont)valueFont;
- (UILabel)titleLabel;
- (UILabel)valueLabel;
- (int64_t)separatorStyleForTrailingLineSeparator;
- (void)layoutSubviews;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setValueColor:(id)a3;
- (void)setValueFont:(id)a3;
- (void)setValueLabel:(id)a3;
- (void)setValueText:(id)a3;
@end

@implementation PKPaymentTransactionDetailLineItemTableViewCell

- (PKPaymentTransactionDetailLineItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTransactionDetailLineItemTableViewCell;
  v4 = [(PKPaymentTransactionDetailLineItemTableViewCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = v7;

    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    objc_storeStrong((id *)&v4->_titleFont, v9);
    valueFont = v4->_valueFont;
    v4->_valueFont = v9;
    v16 = v9;

    v11 = [MEMORY[0x1E4FB1618] labelColor];
    objc_storeStrong((id *)&v4->_titleColor, v11);
    valueColor = v4->_valueColor;
    v4->_valueColor = v11;
    v13 = v11;

    v14 = [(PKPaymentTransactionDetailLineItemTableViewCell *)v4 contentView];
    [v14 addSubview:v4->_titleLabel];
    [v14 addSubview:v4->_valueLabel];
    [(UILabel *)v4->_titleLabel setFont:v4->_titleFont];
    [(UILabel *)v4->_titleLabel setTextColor:v4->_titleColor];
    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(UILabel *)v4->_valueLabel setFont:v4->_valueFont];
    [(UILabel *)v4->_valueLabel setTextColor:v4->_valueColor];
    [(UILabel *)v4->_valueLabel setNumberOfLines:1];
    [(UILabel *)v4->_valueLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];

    [(PKPaymentTransactionDetailLineItemTableViewCell *)v4 setSelectionStyle:0];
    [(PKPaymentTransactionDetailLineItemTableViewCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85678]];
  }
  return v4;
}

- (void)setTitleText:(id)a3
{
  p_titleText = &self->_titleText;
  id v6 = a3;
  if (([v6 isEqualToString:*p_titleText] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    [(UILabel *)self->_titleLabel setText:*p_titleText];
    [(PKPaymentTransactionDetailLineItemTableViewCell *)self setNeedsLayout];
  }
}

- (void)setTitleFont:(id)a3
{
  p_titleFont = &self->_titleFont;
  id v6 = a3;
  if (([v6 isEqual:*p_titleFont] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    [(UILabel *)self->_titleLabel setFont:*p_titleFont];
    [(PKPaymentTransactionDetailLineItemTableViewCell *)self setNeedsLayout];
  }
}

- (void)setTitleColor:(id)a3
{
  p_titleColor = &self->_titleColor;
  id v6 = a3;
  if (([v6 isEqual:*p_titleColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    [(UILabel *)self->_titleLabel setTextColor:*p_titleColor];
  }
}

- (void)setValueText:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_valueText] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueText, a3);
    [(UILabel *)self->_valueLabel setText:v5];
    [(PKPaymentTransactionDetailLineItemTableViewCell *)self setNeedsLayout];
  }
}

- (void)setValueFont:(id)a3
{
  p_valueFont = &self->_valueFont;
  id v6 = a3;
  if (([v6 isEqual:*p_valueFont] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueFont, a3);
    [(UILabel *)self->_valueLabel setFont:*p_valueFont];
    [(PKPaymentTransactionDetailLineItemTableViewCell *)self setNeedsLayout];
  }
}

- (void)setValueColor:(id)a3
{
  p_valueColor = &self->_valueColor;
  id v6 = a3;
  if (([v6 isEqual:*p_valueColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueColor, a3);
    [(UILabel *)self->_valueLabel setTextColor:*p_valueColor];
  }
}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  if (((!self->_hasTrailingLineSeperator ^ a3) & 1) == 0)
  {
    self->_hasTrailingLineSeperator = a3;
    [(PKPaymentTransactionDetailLineItemTableViewCell *)self setSeparatorStyle:[(PKPaymentTransactionDetailLineItemTableViewCell *)self separatorStyleForTrailingLineSeparator]];
    [(PKPaymentTransactionDetailLineItemTableViewCell *)self setNeedsLayout];
  }
}

- (int64_t)separatorStyleForTrailingLineSeparator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  if ([(PKPaymentTransactionDetailLineItemTableViewCell *)self separatorStyleForTrailingLineSeparator] == a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaymentTransactionDetailLineItemTableViewCell;
    [(PKPaymentTransactionDetailLineItemTableViewCell *)&v5 setSeparatorStyle:a3];
  }
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentTransactionDetailLineItemTableViewCell;
  [(PKPaymentTransactionDetailLineItemTableViewCell *)&v29 layoutSubviews];
  int v3 = [(PKPaymentTransactionDetailLineItemTableViewCell *)self _shouldReverseLayoutDirection];
  v4 = [(PKPaymentTransactionDetailLineItemTableViewCell *)self contentView];
  [(UITableViewCell *)self pkui_effectiveLayoutMargins];
  double v6 = v5;
  double v8 = v7;
  [v4 bounds];
  double v12 = v6 + v11;
  double v13 = 11.0;
  double v14 = v9 + 11.0;
  double v16 = v15 - (v6 + v8);
  if (self->_hasTrailingLineSeperator) {
    double v13 = 22.0;
  }
  double v17 = v10 - v13;
  remainder.origin.x = v12;
  remainder.origin.y = v9 + 11.0;
  remainder.size.width = v16;
  remainder.size.height = v10 - v13;
  if (v3) {
    CGRectEdge v18 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v18 = CGRectMaxXEdge;
  }
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v16, v17);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  memset(&slice, 0, sizeof(slice));
  v30.origin.x = v12;
  v30.origin.y = v14;
  v30.size.width = v16;
  v30.size.height = v17;
  CGRectDivide(v30, &slice, &remainder, v20, v18);
  memset(&v26, 0, sizeof(v26));
  memset(&v25, 0, sizeof(v25));
  CGRectDivide(slice, &v25, &v26, v22, CGRectMinYEdge);
  -[UILabel setFrame:](self->_valueLabel, "setFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  memset(&v24, 0, sizeof(v24));
  memset(&v23, 0, sizeof(v23));
  CGRectDivide(remainder, &v23, &v24, 6.0, v18);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = [(PKPaymentTransactionDetailLineItemTableViewCell *)self contentView];
  [(UITableViewCell *)self pkui_effectiveLayoutMargins];
  double v7 = v6;
  double v9 = v8;
  [v5 frame];
  double v11 = v10 - v7 - v9;
  if (self->_hasTrailingLineSeperator) {
    double v12 = 11.0;
  }
  else {
    double v12 = 0.0;
  }
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v11, 1.79769313e308);
  double v14 = v13;
  LODWORD(v16) = 1148846080;
  LODWORD(v17) = 1112014848;
  -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_titleLabel, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v11 - v15 + -6.0, 0.0, v16, v17);
  if (v14 <= v18) {
    double v19 = v18;
  }
  else {
    double v19 = v14;
  }
  double v20 = v12 + v19 + 11.0;

  double v21 = width;
  double v22 = v20;
  result.height = v22;
  result.CGFloat width = v21;
  return result;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (NSString)valueText
{
  return self->_valueText;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (UIColor)valueColor
{
  return self->_valueColor;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_valueColor, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

@end