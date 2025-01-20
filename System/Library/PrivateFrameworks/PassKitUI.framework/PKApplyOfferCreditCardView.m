@interface PKApplyOfferCreditCardView
- (BOOL)showSchumerBox;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKApplyOfferCreditCardView)initWithTermsLinkAction:(id)a3 actionTitle:(id)a4;
- (UIButton)termsLinkButton;
- (UILabel)aprForPurchaseLabel;
- (UILabel)aprForPurchaseTitleLabel;
- (UILabel)bodyLabel;
- (UILabel)creditLimitLabel;
- (UILabel)creditLimitTitleLabel;
- (UILabel)feeLabel;
- (UILabel)feeTitleLabel;
- (void)layoutSubviews;
- (void)setAprForPurchaseLabel:(id)a3;
- (void)setAprForPurchaseTitleLabel:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setCreditLimitLabel:(id)a3;
- (void)setCreditLimitTitleLabel:(id)a3;
- (void)setFeeLabel:(id)a3;
- (void)setFeeTitleLabel:(id)a3;
- (void)setTermsLinkButton:(id)a3;
@end

@implementation PKApplyOfferCreditCardView

- (PKApplyOfferCreditCardView)initWithTermsLinkAction:(id)a3 actionTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v59.receiver = self;
  v59.super_class = (Class)PKApplyOfferCreditCardView;
  v8 = [(PKApplyOfferCreditCardView *)&v59 init];
  if (v8)
  {
    v58 = (NSString *)*MEMORY[0x1E4FB2790];
    uint64_t v9 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    v10 = PKRoundedSystemFontOfSizeAndWeight(22.0, *MEMORY[0x1E4FB09E0]);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    creditLimitTitleLabel = v8->_creditLimitTitleLabel;
    v8->_creditLimitTitleLabel = v11;

    v13 = v8->_creditLimitTitleLabel;
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)v8->_creditLimitTitleLabel setFont:v9];
    [(UILabel *)v8->_creditLimitTitleLabel setTextAlignment:1];
    [(PKApplyOfferCreditCardView *)v8 addSubview:v8->_creditLimitTitleLabel];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    creditLimitLabel = v8->_creditLimitLabel;
    v8->_creditLimitLabel = v15;

    [(UILabel *)v8->_creditLimitLabel setFont:v10];
    v17 = v8->_creditLimitLabel;
    v18 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v17 setTextColor:v18];

    [(UILabel *)v8->_creditLimitLabel setTextAlignment:1];
    [(UILabel *)v8->_creditLimitLabel setAdjustsFontSizeToFitWidth:1];
    [(PKApplyOfferCreditCardView *)v8 addSubview:v8->_creditLimitLabel];
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    aprForPurchaseTitleLabel = v8->_aprForPurchaseTitleLabel;
    v8->_aprForPurchaseTitleLabel = v19;

    v57 = (void *)v9;
    [(UILabel *)v8->_aprForPurchaseTitleLabel setFont:v9];
    v21 = v8->_aprForPurchaseTitleLabel;
    v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v21 setTextColor:v22];

    [(UILabel *)v8->_aprForPurchaseTitleLabel setTextAlignment:1];
    [(PKApplyOfferCreditCardView *)v8 addSubview:v8->_aprForPurchaseTitleLabel];
    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    aprForPurchaseLabel = v8->_aprForPurchaseLabel;
    v8->_aprForPurchaseLabel = v23;

    [(UILabel *)v8->_aprForPurchaseLabel setFont:v10];
    v25 = v8->_aprForPurchaseLabel;
    v26 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v25 setTextColor:v26];

    [(UILabel *)v8->_aprForPurchaseLabel setTextAlignment:1];
    [(UILabel *)v8->_aprForPurchaseLabel setAdjustsFontSizeToFitWidth:1];
    [(PKApplyOfferCreditCardView *)v8 addSubview:v8->_aprForPurchaseLabel];
    v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    feeTitleLabel = v8->_feeTitleLabel;
    v8->_feeTitleLabel = v27;

    [(UILabel *)v8->_feeTitleLabel setTextAlignment:1];
    v29 = v8->_feeTitleLabel;
    v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v29 setTextColor:v30];

    [(UILabel *)v8->_feeTitleLabel setFont:v9];
    [(PKApplyOfferCreditCardView *)v8 addSubview:v8->_feeTitleLabel];
    v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    feeLabel = v8->_feeLabel;
    v8->_feeLabel = v31;

    [(UILabel *)v8->_feeLabel setTextAlignment:1];
    [(UILabel *)v8->_feeLabel setFont:v10];
    v33 = v8->_feeLabel;
    v34 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v33 setTextColor:v34];

    [(UILabel *)v8->_feeLabel setAdjustsFontSizeToFitWidth:1];
    [(PKApplyOfferCreditCardView *)v8 addSubview:v8->_feeLabel];
    v35 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v36 = v6;
    dividerLeft = v8->_dividerLeft;
    v8->_dividerLeft = v35;

    v38 = v8->_dividerLeft;
    v39 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v38 setBackgroundColor:v39];

    [(PKApplyOfferCreditCardView *)v8 addSubview:v8->_dividerLeft];
    v40 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    dividerRight = v8->_dividerRight;
    v8->_dividerRight = v40;

    v42 = v8->_dividerRight;
    v43 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v42 setBackgroundColor:v43];

    [(PKApplyOfferCreditCardView *)v8 addSubview:v8->_dividerRight];
    v44 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    bodyLabel = v8->_bodyLabel;
    v8->_bodyLabel = v44;

    [(UILabel *)v8->_bodyLabel setTextAlignment:1];
    v46 = v8->_bodyLabel;
    v47 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v46 setTextColor:v47];

    [(UILabel *)v8->_bodyLabel setNumberOfLines:0];
    v48 = v8->_bodyLabel;
    v49 = (NSString *)*MEMORY[0x1E4FB28C8];
    v50 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], v58);
    [(UILabel *)v48 setFont:v50];

    [(PKApplyOfferCreditCardView *)v8 addSubview:v8->_bodyLabel];
    v51 = (void *)MEMORY[0x1E4FB14D8];
    v52 = PKFontForDefaultDesign(v49, v58);
    v53 = objc_msgSend(v51, "pkui_plainConfigurationWithTitle:font:", v7, v52);

    id v6 = v36;
    uint64_t v54 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v53 primaryAction:v36];
    termsLinkButton = v8->_termsLinkButton;
    v8->_termsLinkButton = (UIButton *)v54;

    [(UIButton *)v8->_termsLinkButton setConfigurationUpdateHandler:&__block_literal_global_226];
    [(PKApplyOfferCreditCardView *)v8 addSubview:v8->_termsLinkButton];
  }
  return v8;
}

void __66__PKApplyOfferCreditCardView_initWithTermsLinkAction_actionTitle___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  id v3 = [v2 titleLabel];

  [v3 setTextAlignment:1];
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)PKApplyOfferCreditCardView;
  [(PKApplyOfferCreditCardView *)&v36 layoutSubviews];
  [(PKApplyOfferCreditCardView *)self bounds];
  double x = v37.origin.x;
  double y = v37.origin.y;
  double Width = CGRectGetWidth(v37);
  if ([(PKApplyOfferCreditCardView *)self showSchumerBox])
  {
    PKFloatRoundToPixel();
    double v7 = v6;
    [(UILabel *)self->_creditLimitTitleLabel sizeToFit];
    [(UILabel *)self->_creditLimitTitleLabel frame];
    -[UILabel setFrame:](self->_creditLimitTitleLabel, "setFrame:", x, y, v7 + -3.0);
    [(UILabel *)self->_creditLimitLabel sizeToFit];
    [(UILabel *)self->_creditLimitLabel frame];
    double v9 = v8;
    [(UILabel *)self->_creditLimitTitleLabel frame];
    -[UILabel setFrame:](self->_creditLimitLabel, "setFrame:", x, CGRectGetMaxY(v38) + 5.0, v7 + -3.0, v9);
    CGFloat v10 = x + v7;
    PKFloatRoundToPixel();
    double v34 = v11;
    [(UIView *)self->_dividerLeft frame];
    CGFloat v13 = v12;
    [(UILabel *)self->_creditLimitTitleLabel frame];
    double MinY = CGRectGetMinY(v39);
    double v15 = PKUIPixelLength();
    [(UILabel *)self->_creditLimitLabel frame];
    double MaxY = CGRectGetMaxY(v40);
    v41.origin.double x = v10;
    v41.origin.double y = MinY;
    v41.size.width = v15;
    v41.size.height = v13;
    -[UIView setFrame:](self->_dividerLeft, "setFrame:", v10, MinY, v15, MaxY - CGRectGetMinY(v41));
    [(UILabel *)self->_aprForPurchaseTitleLabel sizeToFit];
    [(UILabel *)self->_aprForPurchaseTitleLabel frame];
    -[UILabel setFrame:](self->_aprForPurchaseTitleLabel, "setFrame:", v10 + 3.0, y, v34 + -6.0);
    [(UILabel *)self->_aprForPurchaseLabel sizeToFit];
    [(UILabel *)self->_aprForPurchaseLabel frame];
    double v18 = v17;
    [(UILabel *)self->_creditLimitTitleLabel frame];
    -[UILabel setFrame:](self->_aprForPurchaseLabel, "setFrame:", v10 + 3.0, CGRectGetMaxY(v42) + 5.0, v34 + -6.0, v18);
    CGFloat v19 = v10 + v34;
    PKFloatRoundToPixel();
    double v35 = v20;
    [(UIView *)self->_dividerRight frame];
    CGFloat v22 = v21;
    [(UILabel *)self->_aprForPurchaseTitleLabel frame];
    double v23 = CGRectGetMinY(v43);
    double v24 = PKUIPixelLength();
    [(UILabel *)self->_aprForPurchaseLabel frame];
    double v25 = CGRectGetMaxY(v44);
    v45.origin.double x = v19;
    v45.origin.double y = v23;
    v45.size.width = v24;
    v45.size.height = v22;
    -[UIView setFrame:](self->_dividerRight, "setFrame:", v19, v23, v24, v25 - CGRectGetMinY(v45));
    [(UILabel *)self->_feeTitleLabel sizeToFit];
    [(UILabel *)self->_feeTitleLabel frame];
    CGFloat v26 = v19 + 3.0;
    -[UILabel setFrame:](self->_feeTitleLabel, "setFrame:", v26, y, v35 + -3.0);
    [(UILabel *)self->_feeLabel sizeToFit];
    [(UILabel *)self->_feeLabel frame];
    double v28 = v27;
    [(UILabel *)self->_feeTitleLabel frame];
    -[UILabel setFrame:](self->_feeLabel, "setFrame:", v26, CGRectGetMaxY(v46) + 5.0, v35 + -3.0, v28);
  }
  [(UILabel *)self->_bodyLabel sizeToFit];
  [(UILabel *)self->_bodyLabel frame];
  double v30 = v29;
  [(UILabel *)self->_aprForPurchaseLabel frame];
  CGFloat v31 = CGRectGetMaxY(v47) + 10.0;
  -[UILabel setFrame:](self->_bodyLabel, "setFrame:", x, v31, Width, v30);
  -[UIButton sizeThatFits:](self->_termsLinkButton, "sizeThatFits:", Width, 1.79769313e308);
  double v33 = v32;
  v48.origin.double x = x;
  v48.origin.double y = v31;
  v48.size.width = Width;
  v48.size.height = v30;
  -[UIButton setFrame:](self->_termsLinkButton, "setFrame:", x, CGRectGetMaxY(v48) + 10.0, Width, v33);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_bodyLabel, "sizeThatFits:", a3.width, 1.79769313e308);
  double v6 = v5 + 0.0 + 10.0;
  -[UIButton sizeThatFits:](self->_termsLinkButton, "sizeThatFits:", width, 1.79769313e308);
  double v8 = v6 + v7;
  if ([(PKApplyOfferCreditCardView *)self showSchumerBox])
  {
    -[UILabel sizeThatFits:](self->_aprForPurchaseTitleLabel, "sizeThatFits:", width, 1.79769313e308);
    double v10 = v8 + v9 + 5.0;
    -[UILabel sizeThatFits:](self->_aprForPurchaseLabel, "sizeThatFits:", width, 1.79769313e308);
    double v8 = v10 + v11 + 10.0;
  }
  double v12 = width;
  double v13 = v8;
  result.height = v13;
  result.double width = v12;
  return result;
}

- (BOOL)showSchumerBox
{
  id v3 = [(UILabel *)self->_creditLimitLabel text];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(UILabel *)self->_feeLabel text];
    if ([v5 length])
    {
      BOOL v4 = 1;
    }
    else
    {
      double v6 = [(UILabel *)self->_aprForPurchaseLabel text];
      BOOL v4 = [v6 length] != 0;
    }
  }

  return v4;
}

- (UILabel)creditLimitTitleLabel
{
  return self->_creditLimitTitleLabel;
}

- (void)setCreditLimitTitleLabel:(id)a3
{
}

- (UILabel)aprForPurchaseTitleLabel
{
  return self->_aprForPurchaseTitleLabel;
}

- (void)setAprForPurchaseTitleLabel:(id)a3
{
}

- (UILabel)feeTitleLabel
{
  return self->_feeTitleLabel;
}

- (void)setFeeTitleLabel:(id)a3
{
}

- (UILabel)creditLimitLabel
{
  return self->_creditLimitLabel;
}

- (void)setCreditLimitLabel:(id)a3
{
}

- (UILabel)aprForPurchaseLabel
{
  return self->_aprForPurchaseLabel;
}

- (void)setAprForPurchaseLabel:(id)a3
{
}

- (UILabel)feeLabel
{
  return self->_feeLabel;
}

- (void)setFeeLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (UIButton)termsLinkButton
{
  return self->_termsLinkButton;
}

- (void)setTermsLinkButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsLinkButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_feeLabel, 0);
  objc_storeStrong((id *)&self->_aprForPurchaseLabel, 0);
  objc_storeStrong((id *)&self->_creditLimitLabel, 0);
  objc_storeStrong((id *)&self->_feeTitleLabel, 0);
  objc_storeStrong((id *)&self->_aprForPurchaseTitleLabel, 0);
  objc_storeStrong((id *)&self->_creditLimitTitleLabel, 0);
  objc_storeStrong((id *)&self->_dividerRight, 0);

  objc_storeStrong((id *)&self->_dividerLeft, 0);
}

@end