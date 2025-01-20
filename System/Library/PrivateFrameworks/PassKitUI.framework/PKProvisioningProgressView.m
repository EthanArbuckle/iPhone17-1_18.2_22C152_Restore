@interface PKProvisioningProgressView
- (BOOL)isShowingCheckmark;
- (CGSize)_layoutWithBounds:(CGRect)a3 applyLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LAUICheckmarkLayer)checkmarkLayer;
- (NSString)primaryText;
- (PKProvisioningProgressView)init;
- (UILabel)progressLabel;
- (UILabel)secondaryLabel;
- (UIProgressView)progressView;
- (UITextView)primaryLabel;
- (UIView)headerView;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateCheckmarkColor;
- (void)createViews;
- (void)layoutSubviews;
- (void)setHeaderView:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setShowingCheckmark:(BOOL)a3;
- (void)setShowingCheckmark:(BOOL)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation PKProvisioningProgressView

- (PKProvisioningProgressView)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKProvisioningProgressView;
  v2 = [(PKProvisioningProgressView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PKProvisioningProgressView *)v2 createViews];
  }
  return v3;
}

- (void)createViews
{
  PKUIGetMinScreenWidthType();
  [(PKProvisioningProgressView *)self layoutMargins];
  [(PKProvisioningProgressView *)self setLayoutMargins:"setLayoutMargins:"];
  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  [(PKProvisioningProgressView *)self addSubview:self->_scrollView];
  objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v5;

  [(UITextView *)self->_primaryLabel setTextAlignment:1];
  v7 = self->_primaryLabel;
  v8 = [MEMORY[0x1E4FB1618] labelColor];
  [(UITextView *)v7 setTextColor:v8];

  [(UITextView *)self->_primaryLabel setSelectable:1];
  id v25 = [(UITextView *)self->_primaryLabel textContainer];
  [v25 setMaximumNumberOfLines:0];
  [v25 setLineBreakMode:4];
  [(UIScrollView *)self->_scrollView addSubview:self->_primaryLabel];
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v9;

  v11 = self->_secondaryLabel;
  v12 = (NSString *)*MEMORY[0x1E4FB28C8];
  v13 = (NSString *)*MEMORY[0x1E4FB2790];
  v14 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
  [(UILabel *)v11 setFont:v14];

  [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
  v15 = self->_secondaryLabel;
  v16 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v15 setTextColor:v16];

  [(UILabel *)self->_secondaryLabel setTextAlignment:1];
  [(UIScrollView *)self->_scrollView addSubview:self->_secondaryLabel];
  v17 = (UIProgressView *)[objc_alloc(MEMORY[0x1E4FB1B48]) initWithProgressViewStyle:0];
  progressView = self->_progressView;
  self->_progressView = v17;

  [(PKProvisioningProgressView *)self addSubview:self->_progressView];
  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  progressLabel = self->_progressLabel;
  self->_progressLabel = v19;

  v21 = self->_progressLabel;
  v22 = PKFontForDefaultDesign(v12, v13);
  [(UILabel *)v21 setFont:v22];

  [(UILabel *)self->_progressLabel setNumberOfLines:1];
  [(UILabel *)self->_progressLabel setTextAlignment:1];
  v23 = self->_progressLabel;
  v24 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v23 setTextColor:v24];

  [(PKProvisioningProgressView *)self addSubview:self->_progressLabel];
}

- (void)setHeaderView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  headerView = self->_headerView;
  v7 = v5;
  if (headerView != v5)
  {
    [(UIView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    if (self->_headerView)
    {
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:");
      [(PKProvisioningProgressView *)self setNeedsLayout];
    }
  }
}

- (void)setPrimaryText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  id v11 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4];

  v6 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v7 = (void *)[v6 mutableCopy];

  [v7 setLineBreakMode:0];
  [v7 setAlignment:1];
  v8 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2980], (void *)*MEMORY[0x1E4FB2788], 2, 0);
  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v8, 0, v5);
  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v7, 0, v5);
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  v10 = [MEMORY[0x1E4FB1618] labelColor];
  objc_msgSend(v11, "addAttribute:value:range:", v9, v10, 0, v5);

  [(UITextView *)self->_primaryLabel setAttributedText:v11];
}

- (void)setShowingCheckmark:(BOOL)a3
{
}

- (void)setShowingCheckmark:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showingCheckmark != a3)
  {
    self->_showingCheckmark = a3;
    if (a3)
    {
      BOOL v5 = a4;
      v6 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E4F72FB8]);
      checkmarkLayer = self->_checkmarkLayer;
      self->_checkmarkLayer = v6;

      [(LAUICheckmarkLayer *)self->_checkmarkLayer setLineWidthScale:1.4];
      [(LAUICheckmarkLayer *)self->_checkmarkLayer setRevealed:1 animated:v5];
      v8 = self->_checkmarkLayer;
      double v9 = *MEMORY[0x1E4F1DAD8];
      double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      [(LAUICheckmarkLayer *)v8 aspectSize];
      PKSizeScaleAspectFit();
      -[LAUICheckmarkLayer setFrame:](v8, "setFrame:", v9, v10, v11, v12);
      [(PKProvisioningProgressView *)self _updateCheckmarkColor];
      v13 = [(UIScrollView *)self->_scrollView layer];
      [v13 addSublayer:self->_checkmarkLayer];

      [(PKProvisioningProgressView *)self setNeedsLayout];
    }
    else
    {
      [(LAUICheckmarkLayer *)self->_checkmarkLayer removeFromSuperlayer];
      v14 = self->_checkmarkLayer;
      self->_checkmarkLayer = 0;
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKProvisioningProgressView;
  [(PKProvisioningProgressView *)&v3 layoutSubviews];
  [(PKProvisioningProgressView *)self bounds];
  -[PKProvisioningProgressView _layoutWithBounds:applyLayout:](self, "_layoutWithBounds:applyLayout:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKProvisioningProgressView _layoutWithBounds:applyLayout:](self, "_layoutWithBounds:applyLayout:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 applyLayout:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double rect1 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PKProvisioningProgressView *)self layoutMargins];
  double v72 = v10;
  double v12 = width - (v10 + v11);
  [(UIProgressView *)self->_progressView frame];
  double v14 = v13;
  double v15 = v12;
  [(UILabel *)self->_progressLabel sizeThatFits:v12];
  double v17 = v16;
  v75.origin.double x = x;
  v75.origin.double y = y;
  v75.size.double width = width;
  v75.size.CGFloat height = height;
  double v18 = CGRectGetMaxY(v75) - v17 - v14 + -50.0 + -13.0 + -10.0;
  if (v4)
  {
    [(UIScrollView *)self->_scrollView frame];
    v79.origin.double x = v19;
    v79.origin.double y = v20;
    v79.size.double width = v21;
    v79.size.CGFloat height = v22;
    v76.origin.double x = x;
    v76.origin.double y = y;
    v76.size.double width = rect1;
    v76.size.CGFloat height = height;
    if (!CGRectEqualToRect(v76, v79)) {
      -[UIScrollView setFrame:](self->_scrollView, "setFrame:", x, y, rect1, v18);
    }
  }
  headerView = self->_headerView;
  double v24 = 0.0;
  double v25 = v15;
  if (headerView)
  {
    -[UIView sizeThatFits:](headerView, "sizeThatFits:", rect1, 1.79769313e308);
    PKSizeRoundToPixel(v26, v27, v28);
    double v24 = v29 + 10.0;
    if (v4) {
      -[UIView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), rect1, v29);
    }
  }
  double v30 = x + v72;
  -[UITextView sizeThatFits:](self->_primaryLabel, "sizeThatFits:", v15 + -52.0, 1.79769313e308);
  if (v4)
  {
    double v32 = v31;
    -[UITextView setFrame:](self->_primaryLabel, "setFrame:", v30 + 26.0, v24, v15 + -52.0, v31);
    double v33 = v24 + v32 + 5.0;
    checkmarkLayer = self->_checkmarkLayer;
    if (checkmarkLayer)
    {
      double v71 = v24 + v32 + 5.0;
      [(LAUICheckmarkLayer *)checkmarkLayer frame];
      v35 = [(UITextView *)self->_primaryLabel layoutManager];
      v36 = [(UITextView *)self->_primaryLabel textContainer];
      [v35 ensureLayoutForTextContainer:v36];

      primaryLabel = self->_primaryLabel;
      v38 = [(UITextView *)primaryLabel endOfDocument];
      v39 = [(UITextView *)primaryLabel positionFromPosition:v38 offset:-1];

      v40 = self->_primaryLabel;
      v41 = [(UITextView *)v40 endOfDocument];
      v42 = [(UITextView *)v40 textRangeFromPosition:v39 toPosition:v41];

      [(UITextView *)self->_primaryLabel firstRectForRange:v42];
      -[PKProvisioningProgressView convertRect:fromView:](self, "convertRect:fromView:", self->_primaryLabel);
      uint64_t v44 = v43;
      uint64_t v46 = v45;
      uint64_t v48 = v47;
      uint64_t v50 = v49;
      int v51 = [(PKProvisioningProgressView *)self _shouldReverseLayoutDirection];
      uint64_t v52 = v44;
      uint64_t v53 = v46;
      uint64_t v54 = v48;
      uint64_t v55 = v50;
      if (v51) {
        CGRectGetMinX(*(CGRect *)&v52);
      }
      else {
        CGRectGetMaxX(*(CGRect *)&v52);
      }
      UIRectCenteredYInRect();
      -[LAUICheckmarkLayer setFrame:](self->_checkmarkLayer, "setFrame:");

      double v33 = v71;
    }
    -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", v25, 1.79769313e308);
    CGFloat v57 = v56;
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v30, v33, v25, v56);
    v77.origin.double x = v30;
    v77.origin.double y = v33;
    v77.size.double width = v25;
    v77.size.CGFloat height = v57;
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", rect1, CGRectGetMaxY(v77));
  }
  else
  {
    -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", v15, 1.79769313e308);
  }
  PKFloatRoundToPixel();
  UIRectCenteredXInRect();
  CGFloat v62 = v58;
  CGFloat v63 = v59;
  CGFloat v64 = v60;
  CGFloat v65 = v61;
  if (v4)
  {
    -[UIProgressView setFrame:](self->_progressView, "setFrame:", v58, v59, v60, v61);
    v78.origin.double x = v62;
    v78.origin.double y = v63;
    v78.size.double width = v64;
    v78.size.CGFloat height = v65;
    double v66 = CGRectGetMaxY(v78) + 13.0;
    double v67 = v25;
    double v68 = v17;
    -[UILabel setFrame:](self->_progressLabel, "setFrame:", v30, v66, v67, v17);
  }
  else
  {
    double v66 = CGRectGetMaxY(*(CGRect *)&v58) + 13.0;
    double v68 = v17;
  }
  double v69 = v68 + v66;
  double v70 = rect1;
  result.CGFloat height = v69;
  result.double width = v70;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKProvisioningProgressView;
  [(PKProvisioningProgressView *)&v3 tintColorDidChange];
  [(PKProvisioningProgressView *)self _updateCheckmarkColor];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKProvisioningProgressView;
  [(PKProvisioningProgressView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKProvisioningProgressView *)self _updateCheckmarkColor];
}

- (void)_updateCheckmarkColor
{
  objc_super v3 = [(PKProvisioningProgressView *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PKProvisioningProgressView__updateCheckmarkColor__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __51__PKProvisioningProgressView__updateCheckmarkColor__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[59];
  id v3 = [v1 tintColor];
  objc_msgSend(v2, "setColor:animated:", objc_msgSend(v3, "CGColor"), 0);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (UITextView)primaryLabel
{
  return self->_primaryLabel;
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (BOOL)isShowingCheckmark
{
  return self->_showingCheckmark;
}

- (LAUICheckmarkLayer)checkmarkLayer
{
  return self->_checkmarkLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end