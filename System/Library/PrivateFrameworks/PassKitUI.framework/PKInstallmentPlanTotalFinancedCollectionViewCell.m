@interface PKInstallmentPlanTotalFinancedCollectionViewCell
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)subtitleText;
- (NSString)title;
- (PKCurrencyAmount)amount;
- (PKInstallmentPlanTotalFinancedCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAmount:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKInstallmentPlanTotalFinancedCollectionViewCell

- (PKInstallmentPlanTotalFinancedCollectionViewCell)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)PKInstallmentPlanTotalFinancedCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKInstallmentPlanTotalFinancedCollectionViewCell *)v3 contentView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v11;

    v13 = v4->_titleLabel;
    v14 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    [(UILabel *)v13 setFont:v14];

    v15 = v4->_titleLabel;
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v5 addSubview:v4->_titleLabel];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    amountLabel = v4->_amountLabel;
    v4->_amountLabel = (UILabel *)v17;

    v19 = v4->_amountLabel;
    v20 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2988], 0, 2, 0, *MEMORY[0x1E4FB09B8]);
    [(UILabel *)v19 setFont:v20];

    v21 = v4->_amountLabel;
    v22 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v21 setTextColor:v22];

    [(UILabel *)v4->_amountLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85228]];
    [v5 addSubview:v4->_amountLabel];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v23;

    v25 = v4->_subtitleLabel;
    v26 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], 0);
    [(UILabel *)v25 setFont:v26];

    v27 = v4->_subtitleLabel;
    v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v27 setTextColor:v28];

    [(UILabel *)v4->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [v5 addSubview:v4->_subtitleLabel];
    id v29 = objc_alloc(MEMORY[0x1E4FB1838]);
    v30 = PKUIChevronImage();
    uint64_t v31 = [v29 initWithImage:v30];
    disclosureView = v4->_disclosureView;
    v4->_disclosureView = (UIImageView *)v31;

    v33 = v4->_disclosureView;
    v34 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v33 setTintColor:v34];

    [v5 addSubview:v4->_disclosureView];
    [(PKInstallmentPlanTotalFinancedCollectionViewCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85AC0]];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  self->_isTemplateLayout = 1;
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  -[PKInstallmentPlanTotalFinancedCollectionViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width - (v6 + v6), height);
  self->_isTemplateLayout = 0;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKInstallmentPlanTotalFinancedCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v4 layoutSubviews];
  v3 = [(PKInstallmentPlanTotalFinancedCollectionViewCell *)self contentView];
  [v3 bounds];
  [(PKInstallmentPlanTotalFinancedCollectionViewCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PKInstallmentPlanTotalFinancedCollectionViewCell *)self _shouldReverseLayoutDirection])CGRectEdge v8 = CGRectMinXEdge; {
  else
  }
    CGRectEdge v8 = CGRectMaxXEdge;
  remainder.origin.double x = x + 16.0;
  remainder.origin.double y = y + 16.0;
  remainder.size.double width = width + -32.0;
  remainder.size.double height = height + -32.0;
  memset(&slice, 0, sizeof(slice));
  [(UIImageView *)self->_disclosureView frame];
  CGFloat v10 = v9;
  v27.origin.double x = x + 16.0;
  v27.origin.double y = y + 16.0;
  v27.size.double width = width + -32.0;
  v27.size.double height = height + -32.0;
  CGRectDivide(v27, &slice, &remainder, v10, v8);
  if (!self->_isTemplateLayout)
  {
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, 16.0, v8);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGFloat v12 = v11;
  -[UILabel sizeThatFits:](self->_amountLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGFloat v14 = v13;
  if (self->_subtitleText)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v16 = v15;
  }
  else
  {
    double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (!self->_isTemplateLayout)
  {
    CGRectDivide(remainder, &slice, &remainder, v12, CGRectMinYEdge);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(remainder, &slice, &remainder, 5.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, v14, CGRectMinYEdge);
    -[UILabel setFrame:](self->_amountLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    if (v16 <= 0.0)
    {
      p_CGRect slice = (CGRect *)MEMORY[0x1E4F1DB28];
    }
    else
    {
      p_CGRect slice = &slice;
      CGRectDivide(remainder, &slice, &remainder, 5.0, CGRectMinYEdge);
      CGRectDivide(remainder, &slice, &remainder, v16, CGRectMinYEdge);
    }
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", p_slice->origin.x, p_slice->origin.y, p_slice->size.width, p_slice->size.height);
  }
  double v18 = v16 + 5.0;
  if (v16 <= 0.0) {
    double v18 = -0.0;
  }
  double v19 = v12 + v14 + 5.0 + v18 + 32.0;
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = v22;
  v28.size.double height = v23;
  double v20 = CGRectGetWidth(v28);
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = self->_title;
  double v6 = (NSString *)v4;
  CGFloat v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    CGRectEdge v8 = (NSString *)[(NSString *)v10 copy];
    title = self->_title;
    self->_title = v8;

    [(UILabel *)self->_titleLabel setText:self->_title];
    [(PKInstallmentPlanTotalFinancedCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setAmount:(id)a3
{
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amount, a3);
    amountLabel = self->_amountLabel;
    double v6 = [v7 formattedStringValue];
    [(UILabel *)amountLabel setText:v6];

    [(PKInstallmentPlanTotalFinancedCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setSubtitleText:(id)a3
{
  id v4 = a3;
  v5 = self->_subtitleText;
  double v6 = (NSString *)v4;
  CGFloat v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    CGRectEdge v8 = (NSString *)[(NSString *)v10 copy];
    subtitleText = self->_subtitleText;
    self->_subtitleText = v8;

    [(UILabel *)self->_subtitleLabel setText:self->_subtitleText];
    [(PKInstallmentPlanTotalFinancedCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (NSString)title
{
  return self->_title;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end