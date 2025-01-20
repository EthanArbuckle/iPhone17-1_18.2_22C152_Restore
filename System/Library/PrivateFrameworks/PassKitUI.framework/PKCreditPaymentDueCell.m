@interface PKCreditPaymentDueCell
- (BOOL)useAccessibilityLayout;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)dateLabelText;
- (NSString)detailLabelText;
- (NSString)fallbackButtonTitle;
- (NSString)paymentDueLabelText;
- (PKContinuousButton)payButton;
- (PKCreditPaymentDueCell)initWithFrame:(CGRect)a3;
- (PKCreditPaymentDueCellDelegate)delegate;
- (PKDashboardCreditAccountItem)item;
- (UIColor)dateLabelTextColor;
- (UIColor)detailLabelTextColor;
- (UIColor)payButtonTintColor;
- (UIColor)payButtonTitleColor;
- (UIColor)paymentDueLabelTextColor;
- (UIFont)dateLabelFont;
- (UIFont)detailLabelFont;
- (UIFont)payButtonFont;
- (UIFont)paymentDueLabelFont;
- (UIImage)payButtonImage;
- (id)_payButtonWithCircleLayout:(BOOL)a3;
- (void)_buttonTapped:(id)a3;
- (void)_updateButtonImage:(id)a3;
- (void)createSubviews;
- (void)layoutSubviews;
- (void)setButtonTitle:(id)a3;
- (void)setDateLabelFont:(id)a3;
- (void)setDateLabelText:(id)a3;
- (void)setDateLabelTextColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailLabelFont:(id)a3;
- (void)setDetailLabelText:(id)a3;
- (void)setDetailLabelTextColor:(id)a3;
- (void)setFallbackButtonTitle:(id)a3;
- (void)setItem:(id)a3;
- (void)setPayButtonFont:(id)a3;
- (void)setPayButtonImage:(id)a3;
- (void)setPayButtonTintColor:(id)a3;
- (void)setPayButtonTitleColor:(id)a3;
- (void)setPaymentDueLabelFont:(id)a3;
- (void)setPaymentDueLabelText:(id)a3;
- (void)setPaymentDueLabelTextColor:(id)a3;
- (void)setUseAccessibilityLayout:(BOOL)a3;
@end

@implementation PKCreditPaymentDueCell

- (PKCreditPaymentDueCell)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCreditPaymentDueCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
    [(PKCreditPaymentDueCell *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F857D0]];
    [(PKCreditPaymentDueCell *)v3 createSubviews];
  }
  return v3;
}

- (void)createSubviews
{
  id v9 = [(PKCreditPaymentDueCell *)self contentView];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  paymentDueLabel = self->_paymentDueLabel;
  self->_paymentDueLabel = v3;

  [(UILabel *)self->_paymentDueLabel setNumberOfLines:2];
  [(UILabel *)self->_paymentDueLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_paymentDueLabel setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];
  [v9 addSubview:self->_paymentDueLabel];
  objc_super v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  dateLabel = self->_dateLabel;
  self->_dateLabel = v5;

  [(UILabel *)self->_dateLabel setNumberOfLines:1];
  [(UILabel *)self->_dateLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_dateLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [v9 addSubview:self->_dateLabel];
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v7;

  [(UILabel *)self->_detailLabel setNumberOfLines:0];
  [(UILabel *)self->_detailLabel setLineBreakMode:4];
  [(UILabel *)self->_detailLabel setAdjustsFontSizeToFitWidth:0];
  [(UILabel *)self->_detailLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  [v9 addSubview:self->_detailLabel];
  [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F857D0]];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKCreditPaymentDueCell;
  [(PKDashboardCollectionViewCell *)&v3 layoutSubviews];
  [(PKCreditPaymentDueCell *)self bounds];
  [(PKCreditPaymentDueCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKCreditPaymentDueCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, 3.40282347e38);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double v4 = 12.0;
  if (self->_isCompactUI) {
    double v4 = 8.0;
  }
  double v5 = a3.origin.x + v4;
  double v6 = a3.origin.y + 8.0;
  double v7 = 16.0;
  if (!self->_isCompactUI) {
    double v7 = 24.0;
  }
  double v8 = a3.size.width - v7;
  double v9 = a3.size.height + -16.0;
  [(PKCreditPaymentDueCell *)self _shouldReverseLayoutDirection];
  memset(&slice, 0, sizeof(slice));
  remainder.origin.CGFloat x = v5;
  remainder.origin.CGFloat y = v6;
  remainder.size.CGFloat width = v8;
  remainder.size.double height = v9;
  -[UILabel sizeThatFits:](self->_paymentDueLabel, "sizeThatFits:", v8, v9);
  CGFloat v11 = v10 + 0.0;
  v46.origin.CGFloat x = v5;
  v46.origin.CGFloat y = v6;
  v46.size.CGFloat width = v8;
  v46.size.double height = v9;
  double v42 = v11;
  CGRectDivide(v46, &slice, &remainder, v11, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    paymentDueLabel = self->_paymentDueLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](paymentDueLabel, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v14 = v13 + 0.0;
  CGRectDivide(remainder, &slice, &remainder, v13 + 0.0, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    dateLabel = self->_dateLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](dateLabel, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v17 = v16;
  if (self->_usingCircleButton)
  {
    double v18 = 80.0;
    if (!self->_isCompactUI) {
      double v18 = 90.0;
    }
    double v19 = 60.0;
    double v20 = 64.0;
    if (!self->_isCompactUI) {
      double v19 = 64.0;
    }
    if (!self->_useAccessibilityLayout)
    {
      double v20 = 48.0;
      double v18 = v19;
    }
    double height = remainder.size.height;
    double v22 = fmin(fmax(v20, remainder.size.height + -3.0 - v17), v18);
    CGFloat width = remainder.size.width;
  }
  else
  {
    -[PKContinuousButton sizeThatFits:](self->_payButton, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v22 = v24;
    CGFloat width = remainder.size.width;
    double height = remainder.size.height;
  }
  double v25 = fmin(v17, height - v22 + -3.0);
  if (!self->_isTemplateLayout) {
    double v17 = v25;
  }
  CGFloat x = remainder.origin.x;
  CGFloat y = remainder.origin.y;
  CGRectDivide(*(CGRect *)(&width - 2), &slice, &remainder, v17, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    detailLabel = self->_detailLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](detailLabel, "setFrame:");
  }
  BOOL useAccessibilityLayout = self->_useAccessibilityLayout;
  if (self->_usingCircleButton)
  {
    double v30 = v22 + 3.0;
    CGRectDivide(remainder, &slice, &remainder, v22 + 3.0, CGRectMaxYEdge);
    if (useAccessibilityLayout)
    {
      if (!self->_isTemplateLayout)
      {
        payButton = self->_payButton;
LABEL_32:
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        goto LABEL_33;
      }
    }
    else if (!self->_isTemplateLayout)
    {
      payButton = self->_payButton;
      goto LABEL_32;
    }
  }
  else
  {
    CGRectDivide(remainder, &slice, &remainder, v22 + 3.0, CGRectMaxYEdge);
    if (!self->_isTemplateLayout)
    {
      payButton = self->_payButton;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      double v30 = v22;
LABEL_33:
      double v32 = v41;
      -[PKContinuousButton setFrame:](payButton, "setFrame:");
      goto LABEL_34;
    }
    double v30 = v22;
  }
  double v32 = v41;
LABEL_34:
  if (self->_fallbackButtonTitle)
  {
    v33 = [(PKContinuousButton *)self->_payButton titleLabel];
    objc_msgSend(v33, "pkui_sizeThatFits:", v8, v9);
    double v35 = v34;

    [(PKContinuousButton *)self->_payButton contentEdgeInsets];
    double v37 = v36;
    [(PKContinuousButton *)self->_payButton contentEdgeInsets];
    if (v35 >= v8 - (v37 + v38)) {
      [(PKCreditPaymentDueCell *)self setButtonTitle:self->_fallbackButtonTitle];
    }
  }
  double v39 = v42 + 16.0 + v14 + v17 + 0.0 + 3.0 + v30;
  double v40 = v32;
  result.double height = v39;
  result.CGFloat width = v40;
  return result;
}

- (void)setPaymentDueLabelText:(id)a3
{
  id v4 = a3;
  id v5 = [(UILabel *)self->_paymentDueLabel text];
  id v6 = v4;
  id v8 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(UILabel *)self->_paymentDueLabel setText:v8];
    [(PKCreditPaymentDueCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (NSString)paymentDueLabelText
{
  return [(UILabel *)self->_paymentDueLabel text];
}

- (void)setPaymentDueLabelFont:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_paymentDueLabel font];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_paymentDueLabel setFont:v6];
    [(PKCreditPaymentDueCell *)self setNeedsLayout];
  }
}

- (UIFont)paymentDueLabelFont
{
  return [(UILabel *)self->_paymentDueLabel font];
}

- (void)setPaymentDueLabelTextColor:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_paymentDueLabel textColor];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_paymentDueLabel setTextColor:v6];
  }
}

- (UIColor)paymentDueLabelTextColor
{
  return [(UILabel *)self->_paymentDueLabel textColor];
}

- (void)setDateLabelText:(id)a3
{
  id v4 = a3;
  id v5 = [(UILabel *)self->_dateLabel text];
  id v6 = v4;
  id v8 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(UILabel *)self->_dateLabel setText:v8];
    [(PKCreditPaymentDueCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (NSString)dateLabelText
{
  return [(UILabel *)self->_dateLabel text];
}

- (void)setDateLabelFont:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_dateLabel font];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_dateLabel setFont:v6];
    [(PKCreditPaymentDueCell *)self setNeedsLayout];
  }
}

- (UIFont)dateLabelFont
{
  return [(UILabel *)self->_dateLabel font];
}

- (void)setDateLabelTextColor:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_dateLabel textColor];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_dateLabel setTextColor:v6];
  }
}

- (UIColor)dateLabelTextColor
{
  return [(UILabel *)self->_dateLabel textColor];
}

- (void)setDetailLabelText:(id)a3
{
  id v4 = a3;
  id v5 = [(UILabel *)self->_detailLabel text];
  id v6 = v4;
  id v8 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(UILabel *)self->_detailLabel setText:v8];
    [(PKCreditPaymentDueCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (NSString)detailLabelText
{
  return [(UILabel *)self->_detailLabel text];
}

- (void)setDetailLabelFont:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_detailLabel font];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_detailLabel setFont:v6];
    [(PKCreditPaymentDueCell *)self setNeedsLayout];
  }
}

- (UIFont)detailLabelFont
{
  return [(UILabel *)self->_detailLabel font];
}

- (void)setDetailLabelTextColor:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_detailLabel textColor];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_detailLabel setTextColor:v6];
  }
}

- (UIColor)detailLabelTextColor
{
  return [(UILabel *)self->_detailLabel textColor];
}

- (void)setButtonTitle:(id)a3
{
  id v4 = a3;
  char v5 = [(PKCreditPaymentDueCell *)self contentView];
  id v6 = [(PKContinuousButton *)self->_payButton titleLabel];
  char v7 = [v6 text];

  id v8 = v7;
  id v9 = v4;
  id v24 = v9;
  if (v8 == v9)
  {
  }
  else
  {
    if (!v9 || !v8)
    {

      goto LABEL_10;
    }
    int v10 = [v8 isEqualToString:v9];

    if (!v10)
    {
LABEL_10:
      unint64_t v11 = [v8 length];
      unint64_t v12 = [v24 length];
      if (v11 <= 3 && v12 >= 4)
      {
        payButton = self->_payButton;
        if (payButton) {
          [(PKContinuousButton *)payButton removeFromSuperview];
        }
        double v19 = [(PKCreditPaymentDueCell *)self _payButtonWithCircleLayout:0];
        double v20 = self->_payButton;
        self->_payButton = v19;

        [v5 addSubview:self->_payButton];
        goto LABEL_29;
      }
      unint64_t v14 = v12;
      BOOL v15 = v12 < 4;
      double v16 = self->_payButton;
      if (v11 < 4 || v14 > 3)
      {
        if (v16)
        {
          if (v14)
          {
LABEL_29:
            payButtonImage = 0;
LABEL_30:
            [(PKCreditPaymentDueCell *)self _updateButtonImage:payButtonImage];
            [(PKContinuousButton *)self->_payButton setTitle:v24 forState:0];
            [(PKContinuousButton *)self->_payButton setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
            [(PKCreditPaymentDueCell *)self setNeedsLayout];
            goto LABEL_31;
          }
LABEL_34:
          payButtonImage = self->_payButtonImage;
          goto LABEL_30;
        }
      }
      else
      {
        if (v16) {
          [(PKContinuousButton *)v16 removeFromSuperview];
        }
        BOOL v15 = 1;
      }
      v21 = [(PKCreditPaymentDueCell *)self _payButtonWithCircleLayout:v15];
      double v22 = self->_payButton;
      self->_payButton = v21;

      [v5 addSubview:self->_payButton];
      if (v14) {
        goto LABEL_29;
      }
      goto LABEL_34;
    }
  }
  if (self->_payButtonImage) {
    goto LABEL_10;
  }
LABEL_31:
}

- (void)setFallbackButtonTitle:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fallbackButtonTitle, a3);
    [(PKCreditPaymentDueCell *)self setNeedsLayout];
  }
}

- (void)setPayButtonImage:(id)a3
{
  id v4 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    [(PKCreditPaymentDueCell *)self _updateButtonImage:v4];
    [(PKCreditPaymentDueCell *)self setButtonTitle:0];
    [(PKCreditPaymentDueCell *)self setNeedsLayout];
  }
}

- (void)setPayButtonTintColor:(id)a3
{
  p_payButtonTintColor = &self->_payButtonTintColor;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_payButtonTintColor, a3);
    [(PKContinuousButton *)self->_payButton setTintColor:*p_payButtonTintColor];
  }
}

- (void)setPayButtonTitleColor:(id)a3
{
  p_payButtonTitleColor = &self->_payButtonTitleColor;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_payButtonTitleColor, a3);
    [(PKContinuousButton *)self->_payButton updateTitleColorWithColor:*p_payButtonTitleColor];
    id v6 = [(PKContinuousButton *)self->_payButton imageView];
    [v6 setTintColor:*p_payButtonTitleColor];
  }
}

- (void)setPayButtonFont:(id)a3
{
  payButton = self->_payButton;
  id v4 = a3;
  id v5 = [(PKContinuousButton *)payButton titleLabel];
  [v5 setFont:v4];
}

- (void)_updateButtonImage:(id)a3
{
  p_payButtonImage = &self->_payButtonImage;
  objc_storeStrong((id *)&self->_payButtonImage, a3);
  id v6 = a3;
  [(PKContinuousButton *)self->_payButton updateWithImage:*p_payButtonImage];
  -[PKContinuousButton setImageEdgeInsets:](self->_payButton, "setImageEdgeInsets:", 6.0, 6.0, 6.0, 6.0);
  id v7 = [(PKContinuousButton *)self->_payButton imageView];

  [v7 setContentMode:1];
  [(PKCreditPaymentDueCell *)self setNeedsLayout];
}

- (id)_payButtonWithCircleLayout:(BOOL)a3
{
  if (a3)
  {
    v15[0] = 0;
    v15[1] = 0;
    int64x2_t v16 = vdupq_n_s64(2uLL);
    uint64_t v17 = 2;
    id v4 = [[PKContinuousButton alloc] initWithConfiguration:v15];
    -[PKContinuousButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    int64x2_t v13 = vdupq_n_s64(2uLL);
    int64x2_t v14 = v13;
    id v4 = [[PKContinuousButton alloc] initWithConfiguration:&v12];
    -[PKContinuousButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 10.0, 16.0, 10.0, 16.0);
    BOOL v5 = 0;
  }
  self->_usingCircleButton = v5;
  [(PKContinuousButton *)v4 setTintColor:self->_payButtonTintColor];
  [(PKContinuousButton *)v4 updateTitleColorWithColor:self->_payButtonTitleColor];
  id v6 = [(PKContinuousButton *)v4 imageView];
  [v6 setTintColor:self->_payButtonTitleColor];
  id v7 = [(PKContinuousButton *)v4 titleLabel];
  if (self->_isCompactUI) {
    uint64_t v8 = 0x8000;
  }
  else {
    uint64_t v8 = 2;
  }
  id v9 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27B0], v8, 0);
  [v7 setFont:v9];

  int v10 = [(PKContinuousButton *)v4 titleLabel];
  [v10 setAdjustsFontSizeToFitWidth:1];

  [(PKContinuousButton *)v4 addTarget:self action:sel__buttonTapped_ forControlEvents:64];

  return v4;
}

- (void)_buttonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained paymentButtonTappedForItem:self->_item];
    id WeakRetained = v5;
  }
}

- (PKCreditPaymentDueCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKCreditPaymentDueCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKDashboardCreditAccountItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (PKContinuousButton)payButton
{
  return self->_payButton;
}

- (UIColor)payButtonTintColor
{
  return self->_payButtonTintColor;
}

- (UIColor)payButtonTitleColor
{
  return self->_payButtonTitleColor;
}

- (UIFont)payButtonFont
{
  return self->_payButtonFont;
}

- (BOOL)useAccessibilityLayout
{
  return self->_useAccessibilityLayout;
}

- (void)setUseAccessibilityLayout:(BOOL)a3
{
  self->_BOOL useAccessibilityLayout = a3;
}

- (UIImage)payButtonImage
{
  return self->_payButtonImage;
}

- (NSString)fallbackButtonTitle
{
  return self->_fallbackButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackButtonTitle, 0);
  objc_storeStrong((id *)&self->_payButtonImage, 0);
  objc_storeStrong((id *)&self->_payButtonFont, 0);
  objc_storeStrong((id *)&self->_payButtonTitleColor, 0);
  objc_storeStrong((id *)&self->_payButtonTintColor, 0);
  objc_storeStrong((id *)&self->_payButton, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);

  objc_storeStrong((id *)&self->_paymentDueLabel, 0);
}

@end