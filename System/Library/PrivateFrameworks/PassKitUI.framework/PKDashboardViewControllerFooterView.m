@interface PKDashboardViewControllerFooterView
- (BOOL)isEqualToFooter:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDirectionalEdgeInsets)contentInsets;
- (PKDashboardViewControllerFooterView)initWithFrame:(CGRect)a3;
- (PKDashboardViewControllerFooterViewDelegate)delegate;
- (UILabel)leadingDetail;
- (UILabel)leadingTitle;
- (UILabel)trailingDetail;
- (UILabel)trailingTitle;
- (double)layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (id)_payButtonWithCircleLayout:(BOOL)a3;
- (int64_t)detailNumberOfLines;
- (void)_buttonTapped:(id)a3;
- (void)_createSubviews;
- (void)layoutSubviews;
- (void)setButtonTintColor:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setButtonTitleColor:(id)a3;
- (void)setContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailNumberOfLines:(int64_t)a3;
- (void)setPayButtonImage:(id)a3;
@end

@implementation PKDashboardViewControllerFooterView

- (PKDashboardViewControllerFooterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKDashboardViewControllerFooterView;
  v3 = -[PKDashboardViewControllerFooterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKDashboardViewControllerFooterView *)v3 _createSubviews];
    [(PKDashboardViewControllerFooterView *)v4 setUserInteractionEnabled:1];
    [(PKDashboardViewControllerFooterView *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85428]];
  }
  return v4;
}

- (void)_createSubviews
{
  v3 = (void *)*MEMORY[0x1E4FB27B8];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB27B8]);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [MEMORY[0x1E4FB1618] systemGrayColor];
  v5 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2990], v3, 2, 0, *MEMORY[0x1E4FB09B8]);
  id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
  leadingTitle = self->_leadingTitle;
  self->_leadingTitle = v11;

  [(UILabel *)self->_leadingTitle setNumberOfLines:1];
  [(UILabel *)self->_leadingTitle setTextColor:v4];
  [(UILabel *)self->_leadingTitle setFont:v27];
  [(UILabel *)self->_leadingTitle setAccessibilityIdentifier:*MEMORY[0x1E4F85668]];
  [(PKDashboardViewControllerFooterView *)self addSubview:self->_leadingTitle];
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
  leadingDetail = self->_leadingDetail;
  self->_leadingDetail = v13;

  [(UILabel *)self->_leadingDetail setNumberOfLines:1];
  [(UILabel *)self->_leadingDetail setFont:v5];
  [(UILabel *)self->_leadingDetail setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  [(PKDashboardViewControllerFooterView *)self addSubview:self->_leadingDetail];
  v15 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
  trailingTitle = self->_trailingTitle;
  self->_trailingTitle = v15;

  [(UILabel *)self->_trailingTitle setNumberOfLines:1];
  [(UILabel *)self->_trailingTitle setTextColor:v4];
  [(UILabel *)self->_trailingTitle setFont:v27];
  [(UILabel *)self->_trailingTitle setAccessibilityIdentifier:*MEMORY[0x1E4F85AC8]];
  [(PKDashboardViewControllerFooterView *)self addSubview:self->_trailingTitle];
  v17 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
  trailingDetail = self->_trailingDetail;
  self->_trailingDetail = v17;

  [(UILabel *)self->_trailingDetail setNumberOfLines:1];
  [(UILabel *)self->_trailingDetail setFont:v5];
  [(UILabel *)self->_trailingDetail setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
  [(PKDashboardViewControllerFooterView *)self addSubview:self->_trailingDetail];
  v19 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  separatorView = self->_separatorView;
  self->_separatorView = v19;

  v21 = self->_separatorView;
  v22 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  [(UIView *)v21 setBackgroundColor:v22];

  [(PKDashboardViewControllerFooterView *)self addSubview:self->_separatorView];
  v23 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  topSeparatorView = self->_topSeparatorView;
  self->_topSeparatorView = v23;

  v25 = self->_topSeparatorView;
  v26 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  [(UIView *)v25 setBackgroundColor:v26];

  [(PKDashboardViewControllerFooterView *)self addSubview:self->_topSeparatorView];
  [(PKDashboardViewControllerFooterView *)self setAccessibilityIdentifier:*MEMORY[0x1E4F855A8]];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[PKDashboardViewControllerFooterView layoutWithBounds:isTemplateLayout:](self, "layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a3.width, a3.height);
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardViewControllerFooterView;
  [(PKDashboardViewControllerFooterView *)&v3 layoutSubviews];
  [(PKDashboardViewControllerFooterView *)self bounds];
  -[PKDashboardViewControllerFooterView layoutWithBounds:isTemplateLayout:](self, "layoutWithBounds:isTemplateLayout:", 0);
}

- (double)layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v10 = [(PKDashboardViewControllerFooterView *)self _shouldReverseLayoutDirection];
  int v11 = v10;
  if (v10) {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  if (v10) {
    CGRectEdge v13 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v13 = CGRectMaxXEdge;
  }
  BOOL v14 = self->_contentInsets.leading == *(double *)(MEMORY[0x1E4FB12A8] + 8);
  if (self->_contentInsets.top != *MEMORY[0x1E4FB12A8]) {
    BOOL v14 = 0;
  }
  if (self->_contentInsets.trailing != *(double *)(MEMORY[0x1E4FB12A8] + 24)) {
    BOOL v14 = 0;
  }
  BOOL v15 = self->_contentInsets.bottom == *(double *)(MEMORY[0x1E4FB12A8] + 16);
  if (v14 && v15) {
    double leading = 18.0;
  }
  else {
    double leading = self->_contentInsets.leading;
  }
  if (v14 && v15) {
    double trailing = 18.0;
  }
  else {
    double trailing = self->_contentInsets.trailing;
  }
  remainder.origin.double x = x;
  remainder.origin.double y = y;
  remainder.size.double width = width;
  remainder.size.double height = height;
  v18 = [(UILabel *)self->_trailingTitle text];
  if ([v18 length])
  {
    BOOL v19 = 1;
  }
  else
  {
    v20 = [(UILabel *)self->_trailingDetail text];
    BOOL v19 = [v20 length] != 0;
  }
  v21 = [(PKContinuousButton *)self->_payButton titleLabel];
  v22 = [v21 text];
  unint64_t v23 = [v22 length];

  uint64_t v24 = [(PKContinuousButton *)self->_payButton currentImage];

  if (v23 >= 4 && v24 == 0)
  {
    -[PKContinuousButton sizeThatFits:](self->_payButton, "sizeThatFits:", width, height);
    CGFloat v26 = v27;
  }
  else
  {
    CGFloat v26 = 54.0;
  }
  memset(&v58, 0, sizeof(v58));
  memset(&slice, 0, sizeof(slice));
  memset(&v56, 0, sizeof(v56));
  if (v11) {
    double v28 = trailing;
  }
  else {
    double v28 = leading;
  }
  if (v11) {
    double v29 = leading;
  }
  else {
    double v29 = trailing;
  }
  double v30 = x + v28;
  double v31 = y + 18.0;
  double v32 = width - (v28 + 18.0);
  double v33 = height - (v29 + 18.0);
  remainder.origin.double x = v30;
  remainder.origin.double y = y + 18.0;
  remainder.size.double width = v32;
  remainder.size.double height = v33;
  v60.origin.double x = v30;
  v60.origin.double y = y + 18.0;
  v60.size.double width = v32;
  v60.size.double height = v33;
  CGRectGetMidX(v60);
  PKFloatRoundToPixel();
  double v55 = v34;
  if (v23 | v24)
  {
    v61.origin.double x = v30;
    v61.origin.double y = y + 18.0;
    v61.size.double width = v32;
    v61.size.double height = v33;
    CGRectDivide(v61, &slice, &remainder, v26, v13);
LABEL_36:
    CGRect v56 = remainder;
    goto LABEL_37;
  }
  if (!v19) {
    goto LABEL_36;
  }
  v62.origin.double x = v30;
  v62.origin.double y = y + 18.0;
  v62.size.double width = v32;
  v62.size.double height = v33;
  CGRectGetWidth(v62);
  PKFloatRoundToPixel();
  CGFloat v36 = v35 + -18.0;
  v63.origin.double x = v30;
  v63.origin.double y = v31;
  v63.size.double width = v32;
  v63.size.double height = v33;
  CGRectDivide(v63, &v56, &remainder, v36, v12);
  CGRectDivide(remainder, &slice, &remainder, v36, v13);
LABEL_37:
  -[UILabel pkui_sizeThatFits:](self->_leadingTitle, "pkui_sizeThatFits:", v56.size.width, v56.size.height);
  double v38 = v37;
  -[UILabel pkui_sizeThatFits:](self->_leadingDetail, "pkui_sizeThatFits:", v56.size.width, v56.size.height);
  CGFloat v40 = v39;
  double v41 = v38 + v39 + 2.0;
  double v42 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v43 = v42;
  if (!(v23 | v24) && v19)
  {
    -[UILabel pkui_sizeThatFits:](self->_trailingTitle, "pkui_sizeThatFits:", slice.size.width, v56.size.height);
    double v43 = v44;
    -[UILabel pkui_sizeThatFits:](self->_trailingDetail, "pkui_sizeThatFits:", slice.size.width, v56.size.height);
    double v42 = v45;
  }
  double v46 = fmax(v41, v42 + v43 + 2.0);
  if (!a4)
  {
    CGRect remainder = v56;
    CGRectDivide(v56, &v58, &remainder, v38, CGRectMinYEdge);
    leadingTitle = self->_leadingTitle;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](leadingTitle, "setFrame:");
    CGRectDivide(remainder, &v58, &remainder, 2.0, CGRectMinYEdge);
    CGRectDivide(remainder, &v58, &remainder, v40, CGRectMinYEdge);
    leadingDetail = self->_leadingDetail;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](leadingDetail, "setFrame:");
    BOOL v49 = (v23 | v24) != 0 || !v19;
    separatorView = self->_separatorView;
    if ((v23 | v24) != 0 || !v19)
    {
      [(UIView *)separatorView setHidden:1];
      [(UILabel *)self->_trailingTitle setHidden:1];
      p_trailingDetail = &self->_trailingDetail;
    }
    else
    {
      [(UIView *)separatorView setHidden:0];
      -[UIView setFrame:](self->_separatorView, "setFrame:", v55, v56.origin.y, PKUIPixelLength() * 3.0, v46);
      CGRect remainder = slice;
      CGRectDivide(slice, &v58, &remainder, v43, CGRectMinYEdge);
      trailingTitle = self->_trailingTitle;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](trailingTitle, "setFrame:");
      CGRectDivide(remainder, &v58, &remainder, 2.0, CGRectMinYEdge);
      CGRectDivide(remainder, &v58, &remainder, v42, CGRectMinYEdge);
      p_trailingDetail = &self->_trailingDetail;
      trailingDetail = self->_trailingDetail;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](trailingDetail, "setFrame:");
      [(UILabel *)self->_trailingTitle setHidden:0];
    }
    [(UILabel *)*p_trailingDetail setHidden:v49];
    [(PKContinuousButton *)self->_payButton setHidden:(v23 | v24) == 0];
    if (v23 | v24)
    {
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[PKContinuousButton setFrame:](self->_payButton, "setFrame:");
    }
  }
  return v46 + 36.0;
}

- (void)setButtonTitle:(id)a3
{
  id v18 = a3;
  double v4 = [(PKContinuousButton *)self->_payButton titleLabel];
  double v5 = [v4 text];
  unint64_t v6 = [v5 length];

  unint64_t v7 = [v18 length];
  if (v6 <= 3 && v7 >= 4)
  {
    payButton = self->_payButton;
    if (payButton) {
      [(PKContinuousButton *)payButton removeFromSuperview];
    }
    BOOL v14 = [(PKDashboardViewControllerFooterView *)self _payButtonWithCircleLayout:0];
    BOOL v15 = self->_payButton;
    self->_payButton = v14;

    [(PKDashboardViewControllerFooterView *)self addSubview:self->_payButton];
    goto LABEL_20;
  }
  unint64_t v9 = v7;
  BOOL v10 = v7 < 4;
  int v11 = self->_payButton;
  if (v6 >= 4 && v9 <= 3)
  {
    if (v11) {
      [(PKContinuousButton *)v11 removeFromSuperview];
    }
    BOOL v10 = 1;
LABEL_19:
    v16 = [(PKDashboardViewControllerFooterView *)self _payButtonWithCircleLayout:v10];
    v17 = self->_payButton;
    self->_payButton = v16;

    [(PKDashboardViewControllerFooterView *)self addSubview:self->_payButton];
    if (!v9) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!v11) {
    goto LABEL_19;
  }
  if (v9) {
LABEL_20:
  }
    [(PKDashboardViewControllerFooterView *)self setPayButtonImage:0];
LABEL_21:
  [(PKContinuousButton *)self->_payButton setTitle:v18 forState:0];
}

- (void)setButtonTitleColor:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_buttonTitleColor, a3);
    [(PKContinuousButton *)self->_payButton updateTitleColorWithColor:v6];
    double v5 = [(PKContinuousButton *)self->_payButton imageView];
    [v5 setTintColor:v6];
  }
}

- (void)setButtonTintColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_buttonTintColor, a3);
    [(PKContinuousButton *)self->_payButton setTintColor:v5];
  }
}

- (void)setPayButtonImage:(id)a3
{
  p_payButtonImage = &self->_payButtonImage;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_payButtonImage, a3);
    if (v6) {
      [(PKDashboardViewControllerFooterView *)self setButtonTitle:0];
    }
    [(PKContinuousButton *)self->_payButton updateWithImage:*p_payButtonImage];
    [(PKDashboardViewControllerFooterView *)self setNeedsLayout];
  }
}

- (id)_payButtonWithCircleLayout:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 2, 0);
  if (v3)
  {
    v17[0] = 0;
    v17[1] = 0;
    int64x2_t v18 = vdupq_n_s64(2uLL);
    uint64_t v19 = 2;
    id v6 = [[PKContinuousButton alloc] initWithConfiguration:v17];
    -[PKContinuousButton setContentEdgeInsets:](v6, "setContentEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
    BOOL v7 = 1;
  }
  else
  {
    PKFloatRoundToPixel();
    double v9 = v8;
    [v5 lineHeight];
    PKFloatRoundToPixel();
    uint64_t v14 = v10;
    long long v15 = xmmword_1A040E960;
    int64x2_t v16 = vdupq_n_s64(2uLL);
    id v6 = [[PKContinuousButton alloc] initWithConfiguration:&v14];
    -[PKContinuousButton setContentEdgeInsets:](v6, "setContentEdgeInsets:", v9, 16.0, 24.0 - v9, 16.0);
    BOOL v7 = 0;
  }
  self->_usingCircleButton = v7;
  int v11 = [(PKContinuousButton *)v6 titleLabel];
  [v11 setFont:v5];
  [v11 setAdjustsFontSizeToFitWidth:1];
  [(PKContinuousButton *)v6 updateTitleColorWithColor:self->_buttonTitleColor];
  CGRectEdge v12 = [(PKContinuousButton *)v6 imageView];
  [v12 setTintColor:self->_buttonTitleColor];

  [(PKContinuousButton *)v6 setTintColor:self->_buttonTintColor];
  [(PKContinuousButton *)v6 addTarget:self action:sel__buttonTapped_ forControlEvents:64];

  return v6;
}

- (void)_buttonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained buttonTappedInFooterView:self];
    id WeakRetained = v5;
  }
}

- (int64_t)detailNumberOfLines
{
  return [(UILabel *)self->_leadingDetail numberOfLines];
}

- (void)setDetailNumberOfLines:(int64_t)a3
{
  if ([(UILabel *)self->_leadingDetail numberOfLines] != a3)
  {
    [(UILabel *)self->_leadingDetail setNumberOfLines:a3];
    [(UILabel *)self->_trailingDetail setNumberOfLines:a3];
    [(UILabel *)self->_leadingDetail setLineBreakMode:4 * (a3 == 1)];
    [(UILabel *)self->_trailingDetail setLineBreakMode:4 * (a3 == 1)];
    [(PKDashboardViewControllerFooterView *)self setNeedsLayout];
  }
}

- (BOOL)isEqualToFooter:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = (id *)v4;
    id v6 = [(UILabel *)self->_leadingTitle text];
    BOOL v7 = [v5[59] text];
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        char v12 = 0;
        CGRectEdge v13 = v9;
        id v14 = v8;
LABEL_35:

        goto LABEL_36;
      }
      int v15 = [v8 isEqualToString:v9];

      if (!v15)
      {
        char v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    int64x2_t v16 = [(UILabel *)self->_leadingDetail text];
    v17 = [v5[60] text];
    id v14 = v16;
    id v18 = v17;
    CGRectEdge v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      char v12 = 0;
      uint64_t v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_34;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
        char v12 = 0;
        goto LABEL_35;
      }
    }
    v22 = [(UILabel *)self->_trailingTitle text];
    double v33 = v5;
    unint64_t v23 = [v5[61] text];
    id v20 = v22;
    id v24 = v23;
    double v32 = v24;
    if (v20 != v24)
    {
      char v12 = 0;
      if (v20)
      {
        v25 = v24;
        id v26 = v20;
        if (v24)
        {
          int v27 = [v20 isEqualToString:v24];

          if (!v27)
          {
            char v12 = 0;
LABEL_33:
            uint64_t v19 = v32;
            id v5 = v33;
LABEL_34:

            goto LABEL_35;
          }
          goto LABEL_25;
        }
      }
      else
      {
        v25 = v24;
        id v26 = 0;
      }
LABEL_32:

      goto LABEL_33;
    }

LABEL_25:
    double v28 = [(UILabel *)self->_trailingDetail text];
    double v29 = [v33[62] text];
    id v26 = v28;
    id v30 = v29;
    v25 = v30;
    if (v26 == v30)
    {
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
      if (v26 && v30) {
        char v12 = [v26 isEqualToString:v30];
      }
    }

    goto LABEL_32;
  }
  char v12 = 0;
LABEL_37:

  return v12;
}

- (PKDashboardViewControllerFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDashboardViewControllerFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)leadingTitle
{
  return self->_leadingTitle;
}

- (UILabel)leadingDetail
{
  return self->_leadingDetail;
}

- (UILabel)trailingTitle
{
  return self->_trailingTitle;
}

- (UILabel)trailingDetail
{
  return self->_trailingDetail;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  double bottom = self->_contentInsets.bottom;
  double trailing = self->_contentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingDetail, 0);
  objc_storeStrong((id *)&self->_trailingTitle, 0);
  objc_storeStrong((id *)&self->_leadingDetail, 0);
  objc_storeStrong((id *)&self->_leadingTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_payButtonImage, 0);
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_buttonTitleColor, 0);
  objc_storeStrong((id *)&self->_payButton, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);

  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end