@interface PKPayLaterContentActionFooterViewContent
+ (id)leadingTitleFont;
- (BOOL)showSpinner;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)buttonText;
- (NSString)leadingDetailText;
- (NSString)leadingTitleText;
- (PKPayLaterContentActionFooterViewContent)initWithDelegate:(id)a3;
- (UIColor)buttonTintColor;
- (UIColor)buttonTitleColor;
- (UIColor)leadingDetailTextColor;
- (UIColor)leadingTitleTextColor;
- (UIImage)leadingTitleIcon;
- (void)_buttonTapped;
- (void)_configureButton;
- (void)_configureLabels;
- (void)layoutSubviews;
- (void)setButtonText:(id)a3;
- (void)setButtonTintColor:(id)a3;
- (void)setButtonTitleColor:(id)a3;
- (void)setLeadingDetailText:(id)a3;
- (void)setLeadingDetailTextColor:(id)a3;
- (void)setLeadingTitleIcon:(id)a3;
- (void)setLeadingTitleText:(id)a3;
- (void)setLeadingTitleTextColor:(id)a3;
- (void)setShowSpinner:(BOOL)a3;
@end

@implementation PKPayLaterContentActionFooterViewContent

- (PKPayLaterContentActionFooterViewContent)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPayLaterContentActionFooterViewContent;
  v5 = -[PKPayLaterContentActionFooterViewContent initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(PKPayLaterContentActionFooterViewContent *)v6 setUserInteractionEnabled:1];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinnerView = v6->_spinnerView;
    v6->_spinnerView = (UIActivityIndicatorView *)v7;

    [(UIActivityIndicatorView *)v6->_spinnerView startAnimating];
    [(UIActivityIndicatorView *)v6->_spinnerView setHidden:1];
    [(PKPayLaterContentActionFooterViewContent *)v6 addSubview:v6->_spinnerView];
  }

  return v6;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterContentActionFooterViewContent;
  [(PKPayLaterContentActionFooterViewContent *)&v3 layoutSubviews];
  [(PKPayLaterContentActionFooterViewContent *)self bounds];
  -[PKPayLaterContentActionFooterViewContent _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPayLaterContentActionFooterViewContent _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double v6 = a3.origin.x + 20.0;
  double v7 = a3.origin.y + 16.0;
  CGFloat width = a3.size.width;
  double v8 = a3.size.width + -38.0;
  double v9 = a3.size.height + -32.0;
  if ([(PKPayLaterContentActionFooterViewContent *)self _shouldReverseLayoutDirection])CGRectEdge v11 = CGRectMinXEdge; {
  else
  }
    CGRectEdge v11 = CGRectMaxXEdge;
  remainder.origin.x = v6;
  remainder.origin.y = v7;
  remainder.size.CGFloat width = v8;
  remainder.size.height = v9;
  -[UIActivityIndicatorView sizeThatFits:](self->_spinnerView, "sizeThatFits:", v8, v9);
  if ([(NSString *)self->_buttonText length])
  {
    -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v8, v9);
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_leadingTitleText)
  {
    -[PKIconTextLabel sizeThatFits:](self->_leadingTitle, "sizeThatFits:", v8 - v13, 1.79769313e308);
    double v52 = v16;
    double v54 = v17;
  }
  else
  {
    double v52 = *MEMORY[0x1E4F1DB30];
    double v54 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_leadingDetailText)
  {
    -[UILabel sizeThatFits:](self->_leadingDetail, "sizeThatFits:", v8 - v13, 1.79769313e308);
    double v19 = v18;
    double v53 = v20;
  }
  else
  {
    double v19 = *MEMORY[0x1E4F1DB30];
    double v53 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  memset(&v60, 0, sizeof(v60));
  CGPoint v21 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v22 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.origin = v21;
  slice.size = v22;
  double v23 = *MEMORY[0x1E4F1DB28];
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGSize v50 = v22;
  CGPoint v51 = v21;
  if (v13 <= 0.0)
  {
    double v48 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v49 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v35 = width;
    double v25 = v15;
  }
  else
  {
    double v47 = v19;
    PKRectCenteredYInRect();
    v62.origin.x = v6;
    v62.origin.y = v7;
    v62.size.CGFloat width = v8;
    v62.size.height = v9;
    CGRectDivide(v62, &slice, &remainder, v13, v11);
    PKContentAlignmentMake();
    double v25 = v15;
    PKSizeAlignedInRect();
    slice.origin.x = v26;
    slice.origin.y = v27;
    slice.size.CGFloat width = v28;
    slice.size.height = v29;
    CGRectDivide(remainder, &v60, &remainder, 15.0, v11);
    v30 = [(UIButton *)self->_button layer];
    [v30 setCornerRadius:slice.size.height * 0.5];

    PKSizeAlignedInRect();
    double v23 = v31;
    double v24 = v32;
    CGSize v22 = v50;
    CGPoint v21 = v51;
    double v48 = v34;
    double v49 = v33;
    double v19 = v47;
    CGFloat v35 = width;
  }
  v57.origin = v21;
  v57.size = v22;
  if (v52 > 0.0)
  {
    double v36 = v19;
    CGRectDivide(remainder, &v57, &remainder, v54, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v57.origin.x = v37;
    v57.origin.y = v38;
    CGSize v22 = v50;
    CGPoint v21 = v51;
    v57.size.CGFloat width = v39;
    v57.size.height = v40;
    double v19 = v36;
  }
  v56.origin = v21;
  v56.size = v22;
  if (v19 > 0.0)
  {
    CGRectDivide(remainder, &v56, &remainder, v53, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v56.origin.x = v41;
    v56.origin.y = v42;
    v56.size.CGFloat width = v43;
    v56.size.height = v44;
  }
  if (!a4)
  {
    -[UIButton setFrame:](self->_button, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[PKIconTextLabel setFrame:](self->_leadingTitle, "setFrame:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
    -[UILabel setFrame:](self->_leadingDetail, "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
    -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v23, v24, v49, v48);
  }
  double v45 = fmax(v25, v54 + v53) + 16.0 + 16.0;
  double v46 = v35;
  result.height = v45;
  result.CGFloat width = v46;
  return result;
}

+ (id)leadingTitleFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB27D0]);
}

- (void)setButtonText:(id)a3
{
  id v5 = a3;
  buttonText = self->_buttonText;
  double v9 = (NSString *)v5;
  double v7 = buttonText;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_buttonText, a3);
    [(PKPayLaterContentActionFooterViewContent *)self _configureButton];
  }
LABEL_9:
}

- (void)setButtonTintColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_buttonTintColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_buttonTintColor, a3);
    [(PKPayLaterContentActionFooterViewContent *)self _configureButton];
    id v5 = v6;
  }
}

- (void)setButtonTitleColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_buttonTitleColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_buttonTitleColor, a3);
    [(PKPayLaterContentActionFooterViewContent *)self _configureButton];
    id v5 = v6;
  }
}

- (void)setLeadingTitleText:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingTitleText, a3);
    [(PKPayLaterContentActionFooterViewContent *)self _configureLabels];
  }
}

- (void)setLeadingTitleTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingTitleTextColor, a3);
    [(PKPayLaterContentActionFooterViewContent *)self setNeedsLayout];
  }
}

- (void)setLeadingTitleIcon:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_leadingTitleIcon != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_leadingTitleIcon, a3);
    [(PKPayLaterContentActionFooterViewContent *)self _configureLabels];
    id v5 = v6;
  }
}

- (void)setLeadingDetailTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingDetailTextColor, a3);
    [(PKPayLaterContentActionFooterViewContent *)self setNeedsLayout];
  }
}

- (void)setLeadingDetailText:(id)a3
{
  id v5 = a3;
  leadingDetailText = self->_leadingDetailText;
  double v9 = (NSString *)v5;
  double v7 = leadingDetailText;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_leadingDetailText, a3);
    [(PKPayLaterContentActionFooterViewContent *)self _configureLabels];
  }
LABEL_9:
}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_BOOL showSpinner = a3;
    [(UIActivityIndicatorView *)self->_spinnerView setHidden:!a3];
    button = self->_button;
    BOOL showSpinner = self->_showSpinner;
    [(UIButton *)button setHidden:showSpinner];
  }
}

- (void)_configureLabels
{
  leadingDetailText = self->_leadingDetailText;
  leadingDetail = self->_leadingDetail;
  if (leadingDetailText)
  {
    if (!leadingDetail)
    {
      id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
      double v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v7 = self->_leadingDetail;
      self->_leadingDetail = v6;

      [(UILabel *)self->_leadingDetail setNumberOfLines:0];
      BOOL v8 = self->_leadingDetail;
      double v9 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB27D0], 0, 0, *MEMORY[0x1E4FB09E0]);
      [(UILabel *)v8 setFont:v9];

      [(PKPayLaterContentActionFooterViewContent *)self addSubview:self->_leadingDetail];
      leadingDetail = self->_leadingDetail;
      leadingDetailText = self->_leadingDetailText;
    }
    [(UILabel *)leadingDetail setText:leadingDetailText];
    objc_super v10 = self->_leadingDetail;
    if (self->_leadingDetailTextColor)
    {
      -[UILabel setTextColor:](self->_leadingDetail, "setTextColor:");
    }
    else
    {
      double v12 = [MEMORY[0x1E4FB1618] labelColor];
      [(UILabel *)v10 setTextColor:v12];
    }
  }
  else
  {
    [(UILabel *)leadingDetail removeFromSuperview];
    CGRectEdge v11 = self->_leadingDetail;
    self->_leadingDetail = 0;
  }
  leadingTitleText = self->_leadingTitleText;
  if (leadingTitleText || self->_leadingTitleIcon)
  {
    leadingTitle = self->_leadingTitle;
    if (!leadingTitle)
    {
      double v15 = [PKIconTextLabel alloc];
      double v16 = -[PKIconTextLabel initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v17 = self->_leadingTitle;
      self->_leadingTitle = v16;

      [(PKPayLaterContentActionFooterViewContent *)self addSubview:self->_leadingTitle];
      leadingTitle = self->_leadingTitle;
      leadingTitleText = self->_leadingTitleText;
    }
    double v18 = [(NSString *)leadingTitleText pk_attributedString];
    [(PKIconTextLabel *)leadingTitle setText:v18];

    double v19 = self->_leadingTitle;
    double v20 = [(id)objc_opt_class() leadingTitleFont];
    [(PKIconTextLabel *)v19 setTextFont:v20];

    CGPoint v21 = self->_leadingTitle;
    if (self->_leadingTitleTextColor)
    {
      -[PKIconTextLabel setTextColor:](self->_leadingTitle, "setTextColor:");
    }
    else
    {
      CGSize v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(PKIconTextLabel *)v21 setTextColor:v22];
    }
    [(PKIconTextLabel *)self->_leadingTitle setIcon:self->_leadingTitleIcon];
  }
  else
  {
    [(PKIconTextLabel *)self->_leadingTitle removeFromSuperview];
    double v23 = self->_leadingTitle;
    self->_leadingTitle = 0;
  }

  [(PKPayLaterContentActionFooterViewContent *)self setNeedsLayout];
}

- (void)_configureButton
{
  buttonText = self->_buttonText;
  button = self->_button;
  if (buttonText)
  {
    if (!button)
    {
      id v5 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
      double v6 = self->_button;
      self->_button = v5;

      double v7 = [(UIButton *)self->_button layer];
      [v7 setCornerCurve:*MEMORY[0x1E4F39EA8]];

      BOOL v8 = self->_buttonText;
      double v9 = (void *)MEMORY[0x1E4FB14D8];
      objc_super v10 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 2, (unint64_t)*MEMORY[0x1E4FB09E0]);
      CGRectEdge v11 = objc_msgSend(v9, "pkui_plainConfigurationWithTitle:font:", v8, v10);

      [(UIButton *)self->_button setConfiguration:v11];
      [(UIButton *)self->_button addTarget:self action:sel__buttonTapped forControlEvents:64];
      [(PKPayLaterContentActionFooterViewContent *)self addSubview:self->_button];

      button = self->_button;
    }
    double v12 = [(UIButton *)button configuration];
    [v12 setBaseForegroundColor:self->_buttonTitleColor];
    [v12 contentInsets];
    objc_msgSend(v12, "setContentInsets:", v15 + 1.0, v13 + 2.0, v16 + 1.0, v14 + 2.0);
    [(UIButton *)self->_button setConfiguration:v12];
    [(UIButton *)self->_button setBackgroundColor:self->_buttonTintColor];
  }
  else
  {
    [(UIButton *)button removeFromSuperview];
    double v12 = self->_button;
    self->_button = 0;
  }

  [(PKPayLaterContentActionFooterViewContent *)self setNeedsLayout];
}

- (void)_buttonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained payLaterContentActionFooterViewDidTapButton];
    id WeakRetained = v3;
  }
}

- (NSString)leadingTitleText
{
  return self->_leadingTitleText;
}

- (UIImage)leadingTitleIcon
{
  return self->_leadingTitleIcon;
}

- (UIColor)leadingTitleTextColor
{
  return self->_leadingTitleTextColor;
}

- (NSString)leadingDetailText
{
  return self->_leadingDetailText;
}

- (UIColor)leadingDetailTextColor
{
  return self->_leadingDetailTextColor;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (UIColor)buttonTitleColor
{
  return self->_buttonTitleColor;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitleColor, 0);
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_leadingDetailTextColor, 0);
  objc_storeStrong((id *)&self->_leadingDetailText, 0);
  objc_storeStrong((id *)&self->_leadingTitleTextColor, 0);
  objc_storeStrong((id *)&self->_leadingTitleIcon, 0);
  objc_storeStrong((id *)&self->_leadingTitleText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_leadingDetail, 0);
  objc_storeStrong((id *)&self->_leadingTitle, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end