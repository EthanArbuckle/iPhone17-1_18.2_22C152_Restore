@interface PKInstallmentPlanProgressCollectionViewCell
- (BOOL)isComplete;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)leadingTitle;
- (NSString)subtitleText;
- (NSString)trailingTitle;
- (PKCurrencyAmount)leadingAmount;
- (PKCurrencyAmount)trailingAmount;
- (PKInstallmentPlanProgressCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)progressAmount;
- (void)layoutSubviews;
- (void)setComplete:(BOOL)a3;
- (void)setLeadingAmount:(id)a3;
- (void)setLeadingTitle:(id)a3;
- (void)setProgressAmount:(double)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTrailingAmount:(id)a3;
- (void)setTrailingTitle:(id)a3;
@end

@implementation PKInstallmentPlanProgressCollectionViewCell

- (PKInstallmentPlanProgressCollectionViewCell)initWithFrame:(CGRect)a3
{
  v62.receiver = self;
  v62.super_class = (Class)PKInstallmentPlanProgressCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v62, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKInstallmentPlanProgressCollectionViewCell *)v3 contentView];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    leadingTitleLabel = v4->_leadingTitleLabel;
    v4->_leadingTitleLabel = v6;

    [(UILabel *)v4->_leadingTitleLabel setNumberOfLines:1];
    [(UILabel *)v4->_leadingTitleLabel setAdjustsFontSizeToFitWidth:1];
    v8 = v4->_leadingTitleLabel;
    v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v8 setTextColor:v9];

    v10 = v4->_leadingTitleLabel;
    v11 = (NSString *)*MEMORY[0x1E4FB2950];
    v12 = (void *)*MEMORY[0x1E4FB27B8];
    v61 = (NSString *)*MEMORY[0x1E4FB2950];
    v13 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB27B8]);
    [(UILabel *)v10 setFont:v13];

    [(UILabel *)v4->_leadingTitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v5 addSubview:v4->_leadingTitleLabel];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    leadingAmountLabel = v4->_leadingAmountLabel;
    v4->_leadingAmountLabel = v14;

    [(UILabel *)v4->_leadingAmountLabel setNumberOfLines:1];
    [(UILabel *)v4->_leadingAmountLabel setAdjustsFontSizeToFitWidth:1];
    v16 = v4->_leadingAmountLabel;
    v60 = (void *)*MEMORY[0x1E4FB0938];
    v17 = (void *)*MEMORY[0x1E4FB2990];
    double v18 = *MEMORY[0x1E4FB09B8];
    v19 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2990], v12, 2, 0, *MEMORY[0x1E4FB09B8]);
    [(UILabel *)v16 setFont:v19];

    [(UILabel *)v4->_leadingAmountLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [v5 addSubview:v4->_leadingAmountLabel];
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    trailingTitleLabel = v4->_trailingTitleLabel;
    v4->_trailingTitleLabel = v20;

    [(UILabel *)v4->_trailingTitleLabel setNumberOfLines:1];
    [(UILabel *)v4->_trailingTitleLabel setAdjustsFontSizeToFitWidth:1];
    v22 = v4->_trailingTitleLabel;
    v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v22 setTextColor:v23];

    v24 = v4->_trailingTitleLabel;
    v25 = PKFontForDefaultDesign(v11, (NSString *)v12);
    [(UILabel *)v24 setFont:v25];

    [(UILabel *)v4->_trailingTitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85988]];
    [v5 addSubview:v4->_trailingTitleLabel];
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    trailingAmountLabel = v4->_trailingAmountLabel;
    v4->_trailingAmountLabel = v26;

    [(UILabel *)v4->_trailingAmountLabel setNumberOfLines:1];
    [(UILabel *)v4->_trailingAmountLabel setAdjustsFontSizeToFitWidth:1];
    v28 = v4->_trailingAmountLabel;
    v29 = PKFontForDesign(v60, v17, v12, 2, 0, v18);
    [(UILabel *)v28 setFont:v29];

    [(UILabel *)v4->_trailingAmountLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85980]];
    [v5 addSubview:v4->_trailingAmountLabel];
    v30 = [PKProgressBar alloc];
    double v31 = *MEMORY[0x1E4F1DB28];
    double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v35 = -[PKProgressBar initWithFrame:](v30, "initWithFrame:", *MEMORY[0x1E4F1DB28], v32, v33, v34);
    progressBar = v4->_progressBar;
    v4->_progressBar = (PKProgressBar *)v35;

    v37 = v4->_progressBar;
    v38 = [MEMORY[0x1E4FB1618] colorWithRed:0.22745098 green:0.725490196 blue:0.42745098 alpha:1.0];
    [(PKProgressBar *)v37 setGradientStartColor:v38];

    v39 = v4->_progressBar;
    v40 = [MEMORY[0x1E4FB1618] colorWithRed:0.643137255 green:0.901960784 blue:0.42745098 alpha:1.0];
    [(PKProgressBar *)v39 setGradientEndColor:v40];

    [v5 addSubview:v4->_progressBar];
    v41 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
    v42 = [v41 imageWithRenderingMode:2];

    uint64_t v43 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v42];
    completeCheckmark = v4->_completeCheckmark;
    v4->_completeCheckmark = (UIImageView *)v43;

    v45 = v4->_completeCheckmark;
    v46 = [MEMORY[0x1E4FB1618] systemGreenColor];
    [(UIImageView *)v45 setTintColor:v46];

    [(UIImageView *)v4->_completeCheckmark setHidden:1];
    [v5 addSubview:v4->_completeCheckmark];
    uint64_t v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v31, v32, v33, v34);
    completeLabel = v4->_completeLabel;
    v4->_completeLabel = (UILabel *)v47;

    v49 = v4->_completeLabel;
    v50 = PKFontForDesign(v60, (void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB27D0], 2, 0, v18);
    [(UILabel *)v49 setFont:v50];

    v51 = v4->_completeLabel;
    v52 = PKLocalizedBeekmanString(&cfstr_InstallmentCom.isa);
    [(UILabel *)v51 setText:v52];

    [(UILabel *)v4->_completeLabel setNumberOfLines:1];
    [(UILabel *)v4->_completeLabel setHidden:1];
    [(UILabel *)v4->_completeLabel setAccessibilityIdentifier:*MEMORY[0x1E4F853B0]];
    [v5 addSubview:v4->_completeLabel];
    v53 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v53;

    v55 = v4->_detailLabel;
    v56 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v55 setTextColor:v56];

    v57 = v4->_detailLabel;
    v58 = PKFontForDefaultDesign(v61, (NSString *)v12);
    [(UILabel *)v57 setFont:v58];

    [(UILabel *)v4->_detailLabel setNumberOfLines:0];
    [(UILabel *)v4->_detailLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
    [v5 addSubview:v4->_detailLabel];
    [(PKInstallmentPlanProgressCollectionViewCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85610]];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  double v6 = v5;
  if (self->_leadingTitle)
  {
    v7 = [(UILabel *)self->_leadingTitleLabel font];
    [v7 _bodyLeading];
    PKFloatCeilToPixel();
    double v9 = v8;
  }
  else
  {
    PKFloatCeilToPixel();
    double v9 = v10;
  }
  if (self->_leadingAmount)
  {
    v11 = [(UILabel *)self->_leadingAmountLabel font];
    [v11 _bodyLeading];
    PKFloatCeilToPixel();
    double v13 = v12;
  }
  else
  {
    PKFloatCeilToPixel();
    double v13 = v14;
  }
  if (self->_complete)
  {
    v15 = [(UILabel *)self->_completeLabel font];
    [v15 _bodyLeading];
    PKFloatCeilToPixel();
    double v17 = v16;
  }
  else
  {
    PKFloatCeilToPixel();
    double v17 = v18;
  }
  double v19 = width + v6 * -2.0;
  v20 = [(UILabel *)self->_detailLabel text];
  if (v20)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_detailLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v19 + -32.0, 1.79769313e308);
    double v22 = v21;
  }
  else
  {
    double v22 = 0.0;
  }

  double v23 = v9 + v13 + v17 + v22 + dbl_1A0444550[v22 > 0.0];
  double v24 = v19;
  result.height = v23;
  result.double width = v24;
  return result;
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)PKInstallmentPlanProgressCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v51 layoutSubviews];
  v3 = [(PKInstallmentPlanProgressCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  int v12 = [(PKInstallmentPlanProgressCollectionViewCell *)self _shouldReverseLayoutDirection];
  double v13 = v5 + 16.0;
  double v14 = v7 + 16.0;
  double v15 = v9 + -32.0;
  remainder.origin.double x = v13;
  remainder.origin.double y = v14;
  double v16 = v11 + -32.0;
  remainder.size.double width = v15;
  remainder.size.double height = v16;
  memset(&v49, 0, sizeof(v49));
  if (v12) {
    CGRectEdge v17 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v17 = CGRectMinXEdge;
  }
  if (v12) {
    CGRectEdge v18 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v18 = CGRectMaxXEdge;
  }
  memset(&slice, 0, sizeof(slice));
  memset(&v47, 0, sizeof(v47));
  v52.origin.double x = v13;
  v52.origin.double y = v14;
  v52.size.double width = v15;
  v52.size.double height = v16;
  CGRectGetWidth(v52);
  PKFloatRoundToPixel();
  CGFloat v20 = v19;
  v53.origin.double x = v13;
  v53.origin.double y = v14;
  v53.size.double width = v15;
  v53.size.double height = v16;
  CGRectDivide(v53, &slice, &remainder, v20, v17);
  CGRectDivide(remainder, &v49, &remainder, v20, v18);
  -[UILabel sizeThatFits:](self->_leadingTitleLabel, "sizeThatFits:", slice.size.width, slice.size.height);
  double v22 = v21;
  -[UILabel sizeThatFits:](self->_leadingAmountLabel, "sizeThatFits:", slice.size.width, slice.size.height);
  double v24 = v23;
  double v25 = v22 + v23 + 5.0;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  slice.origin.double x = v26;
  slice.origin.double y = v27;
  slice.size.double width = v28;
  slice.size.double height = v29;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v49.origin.double x = v30;
  v49.origin.double y = v31;
  leadingTitleLabel = self->_leadingTitleLabel;
  v49.size.double width = v33;
  v49.size.double height = v34;
  -[UILabel setFrame:](leadingTitleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width + -16.0, v22);
  -[UILabel setFrame:](self->_leadingAmountLabel, "setFrame:", slice.origin.x, v22 + slice.origin.y + 5.0, slice.size.width + -16.0, v24);
  -[UILabel setFrame:](self->_trailingTitleLabel, "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v22);
  -[UILabel setFrame:](self->_trailingAmountLabel, "setFrame:", v49.origin.x, v22 + v49.origin.y + 5.0, v49.size.width, v24);
  v54.origin.double x = v13;
  v54.origin.double y = v14;
  v54.size.double width = v15;
  v54.size.double height = v16;
  CGRectDivide(v54, &v47, &remainder, v25 + 10.0, CGRectMinYEdge);
  if (self->_complete)
  {
    uint64_t v35 = [(UILabel *)self->_completeLabel font];
    [v35 _bodyLeading];
    CGFloat v37 = v36;

    CGRectDivide(remainder, &v47, &remainder, v37, CGRectMinYEdge);
    memset(&v46, 0, sizeof(v46));
    memset(&rect[1], 0, 32);
    CGRectDivide(v47, &v46, &v47, v37, v17);
    CGRectDivide(v47, &v47, (CGRect *)&rect[1], 5.0, v17);
    -[UIImageView setFrame:](self->_completeCheckmark, "setFrame:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
    completeLabel = self->_completeLabel;
    double x = *(double *)&rect[1];
    double y = *(double *)&rect[2];
    double width = *(double *)&rect[3];
    double height = *(double *)&rect[4];
  }
  else
  {
    CGRectDivide(remainder, &v47, &remainder, 20.0, CGRectMinYEdge);
    completeLabel = self->_progressBar;
    double x = v47.origin.x;
    double y = v47.origin.y;
    double width = v47.size.width;
    double height = v47.size.height;
  }
  objc_msgSend(completeLabel, "setFrame:", x, y, width, height);
  uint64_t v43 = [(UILabel *)self->_detailLabel text];

  if (v43)
  {
    p_CGRect remainder = &remainder;
    CGRectDivide(remainder, &v47, &remainder, 10.0, CGRectMinYEdge);
  }
  else
  {
    p_CGRect remainder = (CGRect *)MEMORY[0x1E4F1DB28];
  }
  -[UILabel setFrame:](self->_detailLabel, "setFrame:", p_remainder->origin.x, p_remainder->origin.y, p_remainder->size.width, p_remainder->size.height);
}

- (void)setLeadingTitle:(id)a3
{
  id v4 = a3;
  double v5 = self->_leadingTitle;
  double v6 = (NSString *)v4;
  double v10 = v6;
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
    double v8 = (NSString *)[(NSString *)v10 copy];
    leadingTitle = self->_leadingTitle;
    self->_leadingTitle = v8;

    [(UILabel *)self->_leadingTitleLabel setText:self->_leadingTitle];
    [(PKInstallmentPlanProgressCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setLeadingAmount:(id)a3
{
  p_leadingAmount = &self->_leadingAmount;
  id v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingAmount, a3);
    leadingAmountLabel = self->_leadingAmountLabel;
    BOOL v7 = [(PKCurrencyAmount *)*p_leadingAmount formattedStringValue];
    [(UILabel *)leadingAmountLabel setText:v7];

    [(PKInstallmentPlanProgressCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setTrailingTitle:(id)a3
{
  id v4 = a3;
  double v5 = self->_trailingTitle;
  double v6 = (NSString *)v4;
  double v10 = v6;
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
    id v8 = (NSString *)[(NSString *)v10 copy];
    trailingTitle = self->_trailingTitle;
    self->_trailingTitle = v8;

    [(UILabel *)self->_trailingTitleLabel setText:self->_trailingTitle];
    [(PKInstallmentPlanProgressCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setTrailingAmount:(id)a3
{
  p_trailingAmount = &self->_trailingAmount;
  id v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_trailingAmount, a3);
    trailingAmountLabel = self->_trailingAmountLabel;
    BOOL v7 = [(PKCurrencyAmount *)*p_trailingAmount formattedStringValue];
    [(UILabel *)trailingAmountLabel setText:v7];

    [(PKInstallmentPlanProgressCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setSubtitleText:(id)a3
{
  id v4 = a3;
  double v5 = self->_subtitleText;
  double v6 = (NSString *)v4;
  double v10 = v6;
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
    id v8 = (NSString *)[(NSString *)v10 copy];
    subtitleText = self->_subtitleText;
    self->_subtitleText = v8;

    [(UILabel *)self->_detailLabel setText:self->_subtitleText];
    [(PKInstallmentPlanProgressCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setProgressAmount:(double)a3
{
}

- (double)progressAmount
{
  [(PKProgressBar *)self->_progressBar progress];
  return result;
}

- (void)setComplete:(BOOL)a3
{
  if (((!self->_complete ^ a3) & 1) == 0)
  {
    self->_complete = a3;
    [(UIImageView *)self->_completeCheckmark setHidden:!a3];
    [(UILabel *)self->_completeLabel setHidden:!self->_complete];
    [(PKProgressBar *)self->_progressBar setHidden:self->_complete];
    [(PKInstallmentPlanProgressCollectionViewCell *)self setNeedsLayout];
  }
}

- (NSString)leadingTitle
{
  return self->_leadingTitle;
}

- (NSString)trailingTitle
{
  return self->_trailingTitle;
}

- (PKCurrencyAmount)leadingAmount
{
  return self->_leadingAmount;
}

- (PKCurrencyAmount)trailingAmount
{
  return self->_trailingAmount;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_trailingAmount, 0);
  objc_storeStrong((id *)&self->_leadingAmount, 0);
  objc_storeStrong((id *)&self->_trailingTitle, 0);
  objc_storeStrong((id *)&self->_leadingTitle, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_completeLabel, 0);
  objc_storeStrong((id *)&self->_completeCheckmark, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_trailingAmountLabel, 0);
  objc_storeStrong((id *)&self->_trailingTitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingAmountLabel, 0);

  objc_storeStrong((id *)&self->_leadingTitleLabel, 0);
}

@end