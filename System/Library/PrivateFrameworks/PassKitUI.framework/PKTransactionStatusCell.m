@interface PKTransactionStatusCell
- (BOOL)hasCompleteSecondaryLink;
- (BOOL)isBridge;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)secondaryTitleAttributed;
- (NSString)primaryText;
- (NSString)secondaryTitle;
- (NSString)secondaryTitleLinkText;
- (NSString)secondaryValue;
- (NSString)tertiaryText;
- (NSURL)secondaryTitleLinkURL;
- (PKTransactionStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)secondaryTextOverrideColor;
- (id)secondaryTitleButtonAction;
- (void)_updateTextColors;
- (void)didPressSecondaryTitleButton:(id)a3;
- (void)layoutSubviews;
- (void)setIsBridge:(BOOL)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryTextOverrideColor:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSecondaryTitleAttributed:(id)a3;
- (void)setSecondaryTitleButtonAction:(id)a3;
- (void)setSecondaryTitleLinkText:(id)a3;
- (void)setSecondaryTitleLinkURL:(id)a3;
- (void)setSecondaryValue:(id)a3;
- (void)setTertiaryText:(id)a3;
@end

@implementation PKTransactionStatusCell

- (PKTransactionStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)PKTransactionStatusCell;
  v4 = [(PKTransactionStatusCell *)&v31 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PKTransactionStatusCell *)v4 contentView];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryLabel = v5->_primaryLabel;
    v5->_primaryLabel = v7;

    v9 = v5->_primaryLabel;
    v10 = (NSString *)*MEMORY[0x1E4FB28C8];
    v11 = (NSString *)*MEMORY[0x1E4FB27F0];
    v12 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27F0], 2, 0);
    [(UILabel *)v9 setFont:v12];

    [(UILabel *)v5->_primaryLabel setNumberOfLines:0];
    [(UILabel *)v5->_primaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v6 addSubview:v5->_primaryLabel];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryTitleLabel = v5->_secondaryTitleLabel;
    v5->_secondaryTitleLabel = v13;

    v15 = v5->_secondaryTitleLabel;
    v16 = PKFontForDefaultDesign(v10, v11);
    [(UILabel *)v15 setFont:v16];

    [(UILabel *)v5->_secondaryTitleLabel setNumberOfLines:0];
    [(UILabel *)v5->_secondaryTitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [v6 addSubview:v5->_secondaryTitleLabel];
    v17 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    secondaryTitleButton = v5->_secondaryTitleButton;
    v5->_secondaryTitleButton = v17;

    v19 = (void *)MEMORY[0x1E4FB14D8];
    v20 = PKFontForDefaultDesign(v10, v11);
    v21 = objc_msgSend(v19, "pkui_plainConfigurationWithTitle:font:", &stru_1EF1B5B50, v20);

    objc_msgSend(v21, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    [(UIButton *)v5->_secondaryTitleButton setConfiguration:v21];
    [(UIButton *)v5->_secondaryTitleButton setHidden:1];
    objc_storeStrong(&v5->_secondaryTitleButtonAction, &__block_literal_global_47);
    [(UIButton *)v5->_secondaryTitleButton addTarget:v5 action:sel_didPressSecondaryTitleButton_ forControlEvents:64];
    [(UIButton *)v5->_secondaryTitleButton setAccessibilityIdentifier:*MEMORY[0x1E4F85978]];
    [v6 addSubview:v5->_secondaryTitleButton];
    v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryValueLabel = v5->_secondaryValueLabel;
    v5->_secondaryValueLabel = v22;

    v24 = v5->_secondaryValueLabel;
    v25 = PKFontForDefaultDesign(v10, v11);
    [(UILabel *)v24 setFont:v25];

    [(UILabel *)v5->_secondaryValueLabel setNumberOfLines:1];
    [(UILabel *)v5->_secondaryValueLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85B58]];
    [v6 addSubview:v5->_secondaryValueLabel];
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    tertiaryLabel = v5->_tertiaryLabel;
    v5->_tertiaryLabel = v26;

    v28 = v5->_tertiaryLabel;
    v29 = PKFontForDefaultDesign(v10, v11);
    [(UILabel *)v28 setFont:v29];

    [(UILabel *)v5->_tertiaryLabel setNumberOfLines:0];
    [(UILabel *)v5->_tertiaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85980]];
    [v6 addSubview:v5->_tertiaryLabel];
    [(PKTransactionStatusCell *)v5 _updateTextColors];
    [(PKTransactionStatusCell *)v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85A58]];
  }
  return v5;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionStatusCell;
  [(PKTransactionStatusCell *)&v4 layoutSubviews];
  v3 = [(PKTransactionStatusCell *)self contentView];
  [v3 bounds];
  [(PKTransactionStatusCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_templateLayout = 1;
  -[PKTransactionStatusCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, 1.79769313e308);
  self->_templateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setPrimaryText:(id)a3
{
  id v4 = a3;
  primaryText = self->_primaryText;
  v10 = (NSString *)v4;
  v6 = primaryText;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v10 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    v9 = self->_primaryText;
    self->_primaryText = v8;

    [(UILabel *)self->_primaryLabel setText:self->_primaryText];
    [(PKTransactionStatusCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (NSString)secondaryTitle
{
  return [(NSAttributedString *)self->_secondaryTitleAttributed string];
}

- (void)setSecondaryTitle:(id)a3
{
  objc_msgSend(a3, "pk_attributedString");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKTransactionStatusCell *)self setSecondaryTitleAttributed:v4];
}

- (void)setSecondaryTitleAttributed:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  double v5 = (void *)v4;
  if (v4 | (unint64_t)self->_secondaryTitleLabel)
  {
    v9 = (void *)v4;
    char v6 = [(id)v4 isEqualToAttributedString:self->_secondaryTitleAttributed];
    double v5 = v9;
    if ((v6 & 1) == 0)
    {
      BOOL v7 = (NSAttributedString *)[v9 copy];
      secondaryTitleAttributed = self->_secondaryTitleAttributed;
      self->_secondaryTitleAttributed = v7;

      [(UILabel *)self->_secondaryTitleLabel setAttributedText:self->_secondaryTitleAttributed];
      [(PKTransactionStatusCell *)self setNeedsLayout];
      double v5 = v9;
    }
  }
}

- (void)setSecondaryTitleLinkText:(id)a3
{
  id v4 = a3;
  secondaryTitleLinkText = self->_secondaryTitleLinkText;
  v10 = (NSString *)v4;
  char v6 = secondaryTitleLinkText;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v10 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    v9 = self->_secondaryTitleLinkText;
    self->_secondaryTitleLinkText = v8;

    [(UIButton *)self->_secondaryTitleButton pkui_updateConfigurationWithTitle:self->_secondaryTitleLinkText];
    [(UIButton *)self->_secondaryTitleButton setHidden:[(PKTransactionStatusCell *)self hasCompleteSecondaryLink] ^ 1];
    [(PKTransactionStatusCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSecondaryTitleLinkURL:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    id v4 = (NSURL *)[v6 copy];
    secondaryTitleLinkURL = self->_secondaryTitleLinkURL;
    self->_secondaryTitleLinkURL = v4;

    [(UIButton *)self->_secondaryTitleButton setHidden:[(PKTransactionStatusCell *)self hasCompleteSecondaryLink] ^ 1];
    [(PKTransactionStatusCell *)self setNeedsLayout];
  }
}

- (BOOL)hasCompleteSecondaryLink
{
  NSUInteger v3 = [(NSString *)self->_secondaryTitleLinkText length];
  if (v3) {
    LOBYTE(v3) = self->_secondaryTitleLinkURL != 0;
  }
  return v3;
}

- (void)setSecondaryValue:(id)a3
{
  id v4 = a3;
  secondaryValue = self->_secondaryValue;
  v10 = (NSString *)v4;
  id v6 = secondaryValue;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v10 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    v9 = self->_secondaryValue;
    self->_secondaryValue = v8;

    [(UILabel *)self->_secondaryValueLabel setText:self->_secondaryValue];
    [(PKTransactionStatusCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setTertiaryText:(id)a3
{
  id v4 = a3;
  tertiaryText = self->_tertiaryText;
  v10 = (NSString *)v4;
  id v6 = tertiaryText;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v10 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    v9 = self->_tertiaryText;
    self->_tertiaryText = v8;

    [(UILabel *)self->_tertiaryLabel setText:self->_tertiaryText];
    [(PKTransactionStatusCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSecondaryTextOverrideColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_secondaryTextOverrideColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_secondaryTextOverrideColor, a3);
    [(PKTransactionStatusCell *)self _updateTextColors];
    double v5 = v6;
  }
}

- (void)setIsBridge:(BOOL)a3
{
  if (((!self->_isBridge ^ a3) & 1) == 0)
  {
    self->_isBridge = a3;
    [(PKTransactionStatusCell *)self _updateTextColors];
  }
}

- (void)_updateTextColors
{
  primaryLabel = self->_primaryLabel;
  if (self->_isBridge) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  id v4 = [MEMORY[0x1E4FB1618] labelColor];
  }
  [(UILabel *)primaryLabel setTextColor:v4];

  secondaryTitleLabel = self->_secondaryTitleLabel;
  if (self->_secondaryTextOverrideColor)
  {
    -[UILabel setTextColor:](self->_secondaryTitleLabel, "setTextColor:");
  }
  else
  {
    if (self->_isBridge) {
      [MEMORY[0x1E4FB1618] systemGrayColor];
    }
    else {
    id v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    [(UILabel *)secondaryTitleLabel setTextColor:v6];
  }
  tertiaryLabel = self->_tertiaryLabel;
  if (self->_isBridge) {
    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else {
  v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [(UILabel *)tertiaryLabel setTextColor:v8];

  if (self->_isBridge) {
    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else {
  id v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [(UILabel *)self->_secondaryValueLabel setTextColor:v9];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  memset(&v35, 0, sizeof(v35));
  [(UITableViewCell *)self pkui_effectiveLayoutMargins];
  double v9 = x + v8;
  double v10 = y + 14.0;
  double v12 = width - (v8 + v11);
  remainder.origin.double x = x + v8;
  remainder.origin.double y = y + 14.0;
  double v13 = height + -28.0;
  remainder.size.double width = v12;
  remainder.size.double height = v13;
  if ([(PKTransactionStatusCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v14 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v14 = CGRectMaxXEdge;
  }
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_primaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v12, v13);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v38.origin.double x = v9;
  v38.origin.double y = v10;
  v38.size.double width = v12;
  v38.size.double height = v13;
  CGRectDivide(v38, &v35, &remainder, v18, CGRectMinYEdge);
  if (!self->_templateLayout) {
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", *(_OWORD *)&v35.origin, *(_OWORD *)&v35.size);
  }
  CGRectDivide(remainder, &v35, &remainder, 4.0, CGRectMinYEdge);
  if ([(NSString *)self->_secondaryValue length])
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryValueLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    double v20 = v19;
    CGRectDivide(remainder, &v35, &remainder, v16, v14);
    if (!self->_templateLayout)
    {
      secondaryValueLabel = self->_secondaryValueLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](secondaryValueLabel, "setFrame:");
    }
    CGRectDivide(remainder, &v35, &remainder, 4.0, v14);
  }
  else
  {
    double v20 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (!self->_templateLayout) {
      -[UILabel setFrame:](self->_secondaryValueLabel, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
  }
  double v22 = v18 + 4.0;
  -[UILabel sizeThatFits:](self->_secondaryTitleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v24 = v23;
  CGRectDivide(remainder, &v35, &remainder, v23, CGRectMinYEdge);
  if (!self->_templateLayout)
  {
    secondaryTitleLabel = self->_secondaryTitleLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](secondaryTitleLabel, "setFrame:");
  }
  double v26 = v22 + 28.0;
  if ([(NSString *)self->_tertiaryText length])
  {
    CGRectDivide(remainder, &v35, &remainder, 4.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    double v28 = v27;
    CGRectDivide(remainder, &v35, &remainder, v27, CGRectMinYEdge);
    if (!self->_templateLayout) {
      -[UILabel setFrame:](self->_tertiaryLabel, "setFrame:", *(_OWORD *)&v35.origin, *(_OWORD *)&v35.size);
    }
    double v26 = v26 + v28 + 4.0;
  }
  else if (!self->_templateLayout)
  {
    -[UILabel setFrame:](self->_tertiaryLabel, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  if (([(UIButton *)self->_secondaryTitleButton isHidden] & 1) == 0)
  {
    CGRectDivide(remainder, &v35, &remainder, 4.0, CGRectMinYEdge);
    -[UIButton sizeThatFits:](self->_secondaryTitleButton, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v30 = v29;
    CGRectDivide(remainder, &v35, &remainder, v29, CGRectMinYEdge);
    if (!self->_templateLayout)
    {
      secondaryTitleButton = self->_secondaryTitleButton;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIButton setFrame:](secondaryTitleButton, "setFrame:");
    }
    double v26 = v26 + v30 + 4.0;
  }
  float v32 = fmax(v24, v20) + v26;
  double v33 = ceilf(v32);
  double v34 = width;
  result.double height = v33;
  result.double width = v34;
  return result;
}

- (void)didPressSecondaryTitleButton:(id)a3
{
  secondaryTitleButtonAction = (void (**)(void))self->_secondaryTitleButtonAction;
  if (secondaryTitleButtonAction)
  {
    if (self->_secondaryTitleLinkURL) {
      secondaryTitleButtonAction[2]();
    }
  }
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSAttributedString)secondaryTitleAttributed
{
  return self->_secondaryTitleAttributed;
}

- (NSString)secondaryTitleLinkText
{
  return self->_secondaryTitleLinkText;
}

- (NSURL)secondaryTitleLinkURL
{
  return self->_secondaryTitleLinkURL;
}

- (NSString)secondaryValue
{
  return self->_secondaryValue;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (UIColor)secondaryTextOverrideColor
{
  return self->_secondaryTextOverrideColor;
}

- (BOOL)isBridge
{
  return self->_isBridge;
}

- (id)secondaryTitleButtonAction
{
  return self->_secondaryTitleButtonAction;
}

- (void)setSecondaryTitleButtonAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secondaryTitleButtonAction, 0);
  objc_storeStrong((id *)&self->_secondaryTextOverrideColor, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryValue, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLinkURL, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLinkText, 0);
  objc_storeStrong((id *)&self->_secondaryTitleAttributed, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryValueLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTitleButton, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLabel, 0);

  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end