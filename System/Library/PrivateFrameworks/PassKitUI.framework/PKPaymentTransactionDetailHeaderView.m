@interface PKPaymentTransactionDetailHeaderView
- (BOOL)hasProminentSubtitle;
- (BOOL)inBridge;
- (BOOL)useStroke;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)amountText;
- (NSString)secondarySubtitleText;
- (NSString)subtitleText;
- (NSString)tertiarySubtitleText;
- (PKPaymentTransactionDetailHeaderView)initWithFrame:(CGRect)a3;
- (UIImage)merchantIcon;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateImageViewDynamicColors;
- (void)layoutSubviews;
- (void)setAmountText:(id)a3;
- (void)setHasProminentSubtitle:(BOOL)a3;
- (void)setInBridge:(BOOL)a3;
- (void)setMerchantIcon:(id)a3;
- (void)setSecondarySubtitleText:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTertiarySubtitleText:(id)a3;
- (void)setUseStroke:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailHeaderView

- (PKPaymentTransactionDetailHeaderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionDetailHeaderView;
  v3 = -[PKPaymentTransactionDetailHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    amountLabel = v3->_amountLabel;
    v3->_amountLabel = v4;

    v6 = v3->_amountLabel;
    v7 = PKRoundedSystemFontOfSizeAndWeight(64.0, *MEMORY[0x1E4FB09E0]);
    [(UILabel *)v6 setFont:v7];

    [(UILabel *)v3->_amountLabel setTextAlignment:1];
    [(UILabel *)v3->_amountLabel setNumberOfLines:1];
    [(UILabel *)v3->_amountLabel setAdjustsFontSizeToFitWidth:1];
    [(PKPaymentTransactionDetailHeaderView *)v3 addSubview:v3->_amountLabel];
    [(UILabel *)v3->_amountLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    v3->_useStroke = 1;
  }
  return v3;
}

- (void)setAmountText:(id)a3
{
  id v4 = a3;
  v5 = self->_amountText;
  v6 = (NSString *)v4;
  v13 = v6;
  if (v5 == v6)
  {

LABEL_12:
    v8 = v13;
    goto LABEL_13;
  }
  if (!v6 || !v5)
  {

    v8 = v13;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  v8 = v13;
  if (!v7)
  {
LABEL_8:
    objc_super v9 = (NSString *)[(NSString *)v8 copy];
    amountText = self->_amountText;
    self->_amountText = v9;

    [(UILabel *)self->_amountLabel setText:self->_amountText];
    amountLabel = self->_amountLabel;
    if (self->_inBridge) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    v12 = [MEMORY[0x1E4FB1618] labelColor];
    }
    [(UILabel *)amountLabel setTextColor:v12];

    [(PKPaymentTransactionDetailHeaderView *)self setNeedsLayout];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)setSubtitleText:(id)a3
{
  id v4 = a3;
  v5 = self->_subtitleText;
  v6 = (NSString *)v4;
  v22 = v6;
  if (v5 == v6)
  {

LABEL_21:
    v8 = v22;
    goto LABEL_22;
  }
  if (!v6 || !v5)
  {

    v8 = v22;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  v8 = v22;
  if (!v7)
  {
LABEL_8:
    objc_super v9 = (NSString *)[(NSString *)v8 copy];
    subtitleText = self->_subtitleText;
    self->_subtitleText = v9;

    v11 = self->_subtitleText;
    subtitleLabel = self->_subtitleLabel;
    if (v11)
    {
      if (!subtitleLabel)
      {
        v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v14 = self->_subtitleLabel;
        self->_subtitleLabel = v13;

        v15 = self->_subtitleLabel;
        if (self->_hasProminentSubtitle)
        {
          v16 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB2788], 2, 0);
          [(UILabel *)v15 setFont:v16];

          v17 = self->_subtitleLabel;
          if (self->_inBridge) {
            [MEMORY[0x1E4FB1618] whiteColor];
          }
          else {
            [MEMORY[0x1E4FB1618] labelColor];
          }
        }
        else
        {
          v20 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
          [(UILabel *)v15 setFont:v20];

          v17 = self->_subtitleLabel;
          if (self->_inBridge) {
            [MEMORY[0x1E4FB1618] systemGrayColor];
          }
          else {
            [MEMORY[0x1E4FB1618] secondaryLabelColor];
          }
        uint64_t v18 = };
        v21 = (void *)v18;
        [(UILabel *)v17 setTextColor:v18];

        [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
        [(UILabel *)self->_subtitleLabel setTextAlignment:1];
        [(UILabel *)self->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
        [(PKPaymentTransactionDetailHeaderView *)self addSubview:self->_subtitleLabel];
        subtitleLabel = self->_subtitleLabel;
        v11 = self->_subtitleText;
      }
      [(UILabel *)subtitleLabel setText:v11];
    }
    else
    {
      [(UILabel *)subtitleLabel removeFromSuperview];
      v19 = self->_subtitleLabel;
      self->_subtitleLabel = 0;
    }
    [(PKPaymentTransactionDetailHeaderView *)self setNeedsLayout];
    goto LABEL_21;
  }
LABEL_22:
}

- (void)setSecondarySubtitleText:(id)a3
{
  id v4 = a3;
  v5 = self->_secondarySubtitleText;
  v6 = (NSString *)v4;
  v20 = v6;
  if (v5 == v6)
  {

LABEL_17:
    v8 = v20;
    goto LABEL_18;
  }
  if (!v6 || !v5)
  {

    v8 = v20;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  v8 = v20;
  if (!v7)
  {
LABEL_8:
    objc_super v9 = (NSString *)[(NSString *)v8 copy];
    secondarySubtitleText = self->_secondarySubtitleText;
    self->_secondarySubtitleText = v9;

    v11 = self->_secondarySubtitleText;
    secondaryLabel = self->_secondaryLabel;
    if (v11)
    {
      if (!secondaryLabel)
      {
        v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v14 = self->_secondaryLabel;
        self->_secondaryLabel = v13;

        v15 = self->_secondaryLabel;
        v16 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
        [(UILabel *)v15 setFont:v16];

        v17 = self->_secondaryLabel;
        if (self->_inBridge) {
          [MEMORY[0x1E4FB1618] systemGrayColor];
        }
        else {
        v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        }
        [(UILabel *)v17 setTextColor:v19];

        [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
        [(UILabel *)self->_secondaryLabel setTextAlignment:1];
        [(UILabel *)self->_secondaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85978]];
        [(PKPaymentTransactionDetailHeaderView *)self addSubview:self->_secondaryLabel];
        secondaryLabel = self->_secondaryLabel;
        v11 = self->_secondarySubtitleText;
      }
      [(UILabel *)secondaryLabel setText:v11];
    }
    else
    {
      [(UILabel *)secondaryLabel removeFromSuperview];
      uint64_t v18 = self->_secondaryLabel;
      self->_secondaryLabel = 0;
    }
    [(PKPaymentTransactionDetailHeaderView *)self setNeedsLayout];
    goto LABEL_17;
  }
LABEL_18:
}

- (void)setTertiarySubtitleText:(id)a3
{
  id v4 = a3;
  v5 = self->_tertiarySubtitleText;
  v6 = (NSString *)v4;
  v20 = v6;
  if (v5 == v6)
  {

LABEL_17:
    v8 = v20;
    goto LABEL_18;
  }
  if (!v6 || !v5)
  {

    v8 = v20;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  v8 = v20;
  if (!v7)
  {
LABEL_8:
    objc_super v9 = (NSString *)[(NSString *)v8 copy];
    tertiarySubtitleText = self->_tertiarySubtitleText;
    self->_tertiarySubtitleText = v9;

    v11 = self->_tertiarySubtitleText;
    tertiaryLabel = self->_tertiaryLabel;
    if (v11)
    {
      if (!tertiaryLabel)
      {
        v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v14 = self->_tertiaryLabel;
        self->_tertiaryLabel = v13;

        v15 = self->_tertiaryLabel;
        v16 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
        [(UILabel *)v15 setFont:v16];

        v17 = self->_tertiaryLabel;
        if (self->_inBridge) {
          [MEMORY[0x1E4FB1618] systemGrayColor];
        }
        else {
        v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        }
        [(UILabel *)v17 setTextColor:v19];

        [(UILabel *)self->_tertiaryLabel setNumberOfLines:0];
        [(UILabel *)self->_tertiaryLabel setTextAlignment:1];
        [(UILabel *)self->_tertiaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AA8]];
        [(PKPaymentTransactionDetailHeaderView *)self addSubview:self->_tertiaryLabel];
        tertiaryLabel = self->_tertiaryLabel;
        v11 = self->_tertiarySubtitleText;
      }
      [(UILabel *)tertiaryLabel setText:v11];
    }
    else
    {
      [(UILabel *)tertiaryLabel removeFromSuperview];
      uint64_t v18 = self->_tertiaryLabel;
      self->_tertiaryLabel = 0;
    }
    [(PKPaymentTransactionDetailHeaderView *)self setNeedsLayout];
    goto LABEL_17;
  }
LABEL_18:
}

- (void)setMerchantIcon:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_merchantIcon != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_merchantIcon, a3);
    merchantIconImageView = self->_merchantIconImageView;
    if (self->_merchantIcon)
    {
      if (!merchantIconImageView)
      {
        BOOL v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        v8 = self->_merchantIconImageView;
        self->_merchantIconImageView = v7;

        [(UIImageView *)self->_merchantIconImageView setContentMode:1];
        [(UIImageView *)self->_merchantIconImageView setClipsToBounds:1];
        [(UIImageView *)self->_merchantIconImageView _setContinuousCornerRadius:8.0];
        if (self->_useStroke)
        {
          objc_super v9 = [(UIImageView *)self->_merchantIconImageView layer];
          [v9 setBorderWidth:PKUIPixelLength()];
        }
        [(PKPaymentTransactionDetailHeaderView *)self addSubview:self->_merchantIconImageView];
        merchantIconImageView = self->_merchantIconImageView;
      }
      -[UIImageView setImage:](merchantIconImageView, "setImage:");
      [(PKPaymentTransactionDetailHeaderView *)self _updateImageViewDynamicColors];
    }
    else
    {
      [(UIImageView *)merchantIconImageView removeFromSuperview];
      v10 = self->_merchantIconImageView;
      self->_merchantIconImageView = 0;
    }
    [(PKPaymentTransactionDetailHeaderView *)self setNeedsLayout];
    v5 = v11;
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionDetailHeaderView;
  [(PKPaymentTransactionDetailHeaderView *)&v3 layoutSubviews];
  [(PKPaymentTransactionDetailHeaderView *)self bounds];
  [(PKPaymentTransactionDetailHeaderView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKPaymentTransactionDetailHeaderView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionDetailHeaderView;
  [(PKPaymentTransactionDetailHeaderView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKPaymentTransactionDetailHeaderView *)self _updateImageViewDynamicColors];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v8 = a3.origin.x + 16.0;
  double v9 = 0.0;
  double v10 = a3.origin.y + 0.0;
  double v11 = a3.size.width + -32.0;
  double v12 = a3.size.height + -22.0;
  remainder.origin.CGFloat x = v8;
  remainder.origin.CGFloat y = v10;
  remainder.size.CGFloat width = v11;
  remainder.size.CGFloat height = v12;
  memset(&v29, 0, sizeof(v29));
  if (self->_merchantIcon)
  {
    CGRectDivide(*(CGRect *)&v8, &v29, &remainder, 80.0, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
    {
      merchantIconImageView = self->_merchantIconImageView;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](merchantIconImageView, "setFrame:", *(_OWORD *)&v29.origin, *(_OWORD *)&v29.size);
    }
    CGRectDivide(remainder, &v29, &remainder, 20.0, CGRectMinYEdge);
    double v9 = 100.0;
  }
  if ([(NSString *)self->_amountText length])
  {
    -[UILabel pkui_sizeThatFits:](self->_amountLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
    CGFloat v15 = v14;
    if (!self->_isTemplateLayout)
    {
      amountLabel = self->_amountLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](amountLabel, "setFrame:");
    }
    CGRectDivide(remainder, &v29, &remainder, v15, CGRectMinYEdge);
    double v9 = v9 + v15;
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGFloat v19 = v18;
    if (!self->_isTemplateLayout)
    {
      v20 = self->_subtitleLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v20, "setFrame:");
    }
    CGRectDivide(remainder, &v29, &remainder, v19, CGRectMinYEdge);
    double v9 = v9 + v19;
  }
  if (self->_secondaryLabel)
  {
    CGRectDivide(remainder, &v29, &remainder, 4.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGFloat v22 = v21;
    if (!self->_isTemplateLayout)
    {
      secondaryLabel = self->_secondaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](secondaryLabel, "setFrame:");
    }
    CGRectDivide(remainder, &v29, &remainder, v22, CGRectMinYEdge);
    double v9 = v9 + v22 + 4.0;
  }
  if (self->_tertiaryLabel)
  {
    CGRectDivide(remainder, &v29, &remainder, 4.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGFloat v25 = v24;
    if (!self->_isTemplateLayout)
    {
      tertiaryLabel = self->_tertiaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](tertiaryLabel, "setFrame:");
    }
    CGRectDivide(remainder, &v29, &remainder, v25, CGRectMinYEdge);
    double v9 = v9 + v25 + 4.0;
  }
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v27 = CGRectGetWidth(v32);
  double v28 = v9 + 22.0;
  result.CGFloat height = v28;
  result.CGFloat width = v27;
  return result;
}

- (void)_updateImageViewDynamicColors
{
  objc_super v3 = [(PKPaymentTransactionDetailHeaderView *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PKPaymentTransactionDetailHeaderView__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __69__PKPaymentTransactionDetailHeaderView__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  id v1 = [MEMORY[0x1E4FB1618] systemGrayColor];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));
}

- (BOOL)inBridge
{
  return self->_inBridge;
}

- (void)setInBridge:(BOOL)a3
{
  self->_inBridge = a3;
}

- (BOOL)hasProminentSubtitle
{
  return self->_hasProminentSubtitle;
}

- (void)setHasProminentSubtitle:(BOOL)a3
{
  self->_hasProminentSubtitle = a3;
}

- (NSString)amountText
{
  return self->_amountText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (NSString)secondarySubtitleText
{
  return self->_secondarySubtitleText;
}

- (NSString)tertiarySubtitleText
{
  return self->_tertiarySubtitleText;
}

- (UIImage)merchantIcon
{
  return self->_merchantIcon;
}

- (BOOL)useStroke
{
  return self->_useStroke;
}

- (void)setUseStroke:(BOOL)a3
{
  self->_useStroke = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantIcon, 0);
  objc_storeStrong((id *)&self->_tertiarySubtitleText, 0);
  objc_storeStrong((id *)&self->_secondarySubtitleText, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_merchantIconImageView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_amountLabel, 0);
}

@end