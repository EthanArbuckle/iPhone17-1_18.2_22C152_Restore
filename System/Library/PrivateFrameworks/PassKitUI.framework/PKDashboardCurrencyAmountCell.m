@interface PKDashboardCurrencyAmountCell
- (BOOL)_shouldUseStackedLayoutWithBounds:(CGRect)a3;
- (BOOL)showsPositivePrefix;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)detailString;
- (NSString)titleString;
- (PKCurrencyAmount)amount;
- (PKDashboardCurrencyAmountCell)initWithFrame:(CGRect)a3;
- (id)defaultPrimaryColor;
- (id)defaultSecondaryColor;
- (void)_updateCurrencyLabel;
- (void)layoutSubviews;
- (void)resetFonts;
- (void)setAmount:(id)a3;
- (void)setDetailString:(id)a3;
- (void)setShowsPositivePrefix:(BOOL)a3;
- (void)setTitleString:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKDashboardCurrencyAmountCell

- (PKDashboardCurrencyAmountCell)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PKDashboardCurrencyAmountCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKDashboardCurrencyAmountCell *)v3 contentView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v11;

    v13 = v4->_titleLabel;
    v14 = [(PKDashboardCurrencyAmountCell *)v4 defaultPrimaryColor];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)v4->_titleLabel setNumberOfLines:1];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v5 addSubview:v4->_titleLabel];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    currencyLabel = v4->_currencyLabel;
    v4->_currencyLabel = (UILabel *)v15;

    v17 = v4->_currencyLabel;
    v18 = [(PKDashboardCurrencyAmountCell *)v4 defaultSecondaryColor];
    [(UILabel *)v17 setTextColor:v18];

    [(UILabel *)v4->_currencyLabel setNumberOfLines:1];
    [(UILabel *)v4->_currencyLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
    [v5 addSubview:v4->_currencyLabel];
    [(PKDashboardCurrencyAmountCell *)v4 resetFonts];
  }
  return v4;
}

- (void)setTitleString:(id)a3
{
  v4 = (NSString *)[a3 copy];
  titleString = self->_titleString;
  self->_titleString = v4;

  [(UILabel *)self->_titleLabel setText:self->_titleString];

  [(PKDashboardCurrencyAmountCell *)self setNeedsLayout];
}

- (void)setAmount:(id)a3
{
  v4 = (PKCurrencyAmount *)[a3 copy];
  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = v4;

  [(PKDashboardCurrencyAmountCell *)self _updateCurrencyLabel];

  [(PKDashboardCurrencyAmountCell *)self setNeedsLayout];
}

- (void)setDetailString:(id)a3
{
  v4 = (NSString *)[a3 copy];
  detailString = self->_detailString;
  self->_detailString = v4;

  [(PKDashboardCurrencyAmountCell *)self _updateCurrencyLabel];

  [(PKDashboardCurrencyAmountCell *)self setNeedsLayout];
}

- (void)setShowsPositivePrefix:(BOOL)a3
{
  self->_showsPositivePrefix = a3;
  [(PKDashboardCurrencyAmountCell *)self _updateCurrencyLabel];

  [(PKDashboardCurrencyAmountCell *)self setNeedsLayout];
}

- (id)defaultPrimaryColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (id)defaultSecondaryColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKDashboardCurrencyAmountCell;
  [(PKDashboardCollectionViewCell *)&v4 layoutSubviews];
  v3 = [(PKDashboardCurrencyAmountCell *)self contentView];
  [v3 bounds];
  [(PKDashboardCurrencyAmountCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  -[PKDashboardCurrencyAmountCell _layoutWithBounds:](self, "_layoutWithBounds:", v6, v7, width + v8 * -2.0, height);
  double v11 = fmin(height, 44.0);
  if (v10 < 44.0) {
    double v10 = v11;
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)resetFonts
{
  titleLabel = self->_titleLabel;
  objc_super v4 = (NSString *)*MEMORY[0x1E4FB28C8];
  v5 = (NSString *)*MEMORY[0x1E4FB2790];
  double v6 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
  [(UILabel *)titleLabel setFont:v6];

  currencyLabel = self->_currencyLabel;
  PKFontForDefaultDesign(v4, v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)currencyLabel setFont:v8];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = a3.origin.x + 12.0;
  double v9 = a3.origin.y + 12.0;
  double v10 = a3.size.width + -24.0;
  double v11 = a3.size.height + -24.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.size.width + -24.0, a3.size.height + -24.0);
  double v46 = v12;
  double v47 = v13;
  -[UILabel sizeThatFits:](self->_currencyLabel, "sizeThatFits:", v10, v11);
  double v49 = v14;
  CGFloat v50 = v15;
  int v16 = [(PKDashboardCurrencyAmountCell *)self _shouldReverseLayoutDirection];
  memset(&slice, 0, sizeof(slice));
  if (v16) {
    CGRectEdge v17 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v17 = CGRectMinXEdge;
  }
  remainder.origin.double x = v8;
  remainder.origin.double y = v9;
  remainder.size.double width = v10;
  remainder.size.double height = v11;
  double v51 = width;
  if (-[PKDashboardCurrencyAmountCell _shouldUseStackedLayoutWithBounds:](self, "_shouldUseStackedLayoutWithBounds:", x, y, width, height))
  {
    v55.origin.double x = v8;
    v55.origin.double y = v9;
    v55.size.double width = v10;
    v55.size.double height = v11;
    CGRectDivide(v55, &slice, &remainder, v47 + 5.0, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    double v48 = v18;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    CGRectDivide(remainder, &slice, &remainder, v50, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v33 = v24 + 12.0 + 5.0 + v31;
  }
  else
  {
    if (v16) {
      CGRectEdge v34 = CGRectMinXEdge;
    }
    else {
      CGRectEdge v34 = CGRectMaxXEdge;
    }
    v56.origin.double x = v8;
    v56.origin.double y = v9;
    v56.size.double width = v10;
    v56.size.double height = v11;
    CGRectDivide(v56, &slice, &remainder, fmin(v10, v46), v17);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    double v48 = v35;
    double v20 = v36;
    double v22 = v37;
    double v24 = v38;
    CGRectDivide(remainder, &slice, &remainder, fmin(remainder.size.width, v49), v34);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    double v26 = v39;
    double v28 = v40;
    double v30 = v41;
    double v32 = v42;
    double v33 = v24 + 12.0;
  }
  double v43 = v33 + 12.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v48, v20, v22, v24);
  -[UILabel setFrame:](self->_currencyLabel, "setFrame:", v26, v28, v30, v32);
  double v44 = v51;
  double v45 = v43;
  result.double height = v45;
  result.double width = v44;
  return result;
}

- (void)_updateCurrencyLabel
{
  if (self->_detailString)
  {
    currencyLabel = self->_currencyLabel;
    -[UILabel setText:](currencyLabel, "setText:");
  }
  else
  {
    uint64_t v4 = [(PKCurrencyAmount *)self->_currencyAmount formattedStringValue];
    id v9 = (id)v4;
    if (self->_showsPositivePrefix
      && ([(PKCurrencyAmount *)self->_amount amount],
          v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = objc_msgSend(v5, "pk_isNegativeNumber"),
          v5,
          uint64_t v4 = (uint64_t)v9,
          (v6 & 1) == 0))
    {
      double v7 = self->_currencyLabel;
      double v8 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v9);
      [(UILabel *)v7 setText:v8];
    }
    else
    {
      [(UILabel *)self->_currencyLabel setText:v4];
    }
  }
}

- (BOOL)_shouldUseStackedLayoutWithBounds:(CGRect)a3
{
  double width = a3.size.width;
  v5 = [(UILabel *)self->_titleLabel font];
  [v5 pointSize];
  double v7 = v6;

  if (v7 >= 25.0) {
    return 1;
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_currencyLabel, "sizeThatFits:", width, 1.79769313e308);
  return width < v9 + v10 + 36.0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDashboardCurrencyAmountCell;
  [(PKDashboardCurrencyAmountCell *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKDashboardCurrencyAmountCell *)self traitCollection];
  double v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      double v7 = [v4 preferredContentSizeCategory];
      double v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9) {
        [(PKDashboardCurrencyAmountCell *)self resetFonts];
      }
    }
  }
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)detailString
{
  return self->_detailString;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (BOOL)showsPositivePrefix
{
  return self->_showsPositivePrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_detailString, 0);
  objc_storeStrong((id *)&self->_currencyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);

  objc_storeStrong((id *)&self->_titleString, 0);
}

@end