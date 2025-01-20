@interface PKTableHeaderView
- (BOOL)_hasAccessibilityLargeText;
- (BOOL)accessoryViewsDisabled;
- (BOOL)shouldReserveSubtitleHeight;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)_layoutWithBounds:(CGRect)a3 imageHeightAdjustment:(double)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LAUICheckmarkLayer)checkmarkLayer;
- (PKTableHeaderView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)activityIndicator;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)bottomPadding;
- (double)maximumHeight;
- (double)minimumHeight;
- (double)topPadding;
- (id)actionButton;
- (unint64_t)style;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateAccessoryViews;
- (void)_updateCheckmarkColor;
- (void)_updateFonts;
- (void)_updateImageView;
- (void)layoutSubviews;
- (void)setAccessoryViewsDisabled:(BOOL)a3;
- (void)setActionTitle:(id)a3;
- (void)setBottomPadding:(double)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewImage:(id)a3 withSize:(CGSize)a4 animated:(BOOL)a5;
- (void)setMaximumHeight:(double)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setPassSnapshot:(id)a3 withSize:(CGSize)a4 animated:(BOOL)a5 needsCorners:(BOOL)a6;
- (void)setPassSnapshotUsingDefaultSize:(id)a3 animated:(BOOL)a4 needsCorners:(BOOL)a5;
- (void)setShouldReserveSubtitleHeight:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTopPadding:(double)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKTableHeaderView

- (PKTableHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKTableHeaderView;
  v3 = -[PKTableHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_maximumHeight = 1.79769313e308;
    [(PKTableHeaderView *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];
  }
  return v4;
}

- (void)setActionTitle:(id)a3
{
}

- (void)setPassSnapshotUsingDefaultSize:(id)a3 animated:(BOOL)a4 needsCorners:(BOOL)a5
{
}

- (void)setPassSnapshot:(id)a3 withSize:(CGSize)a4 animated:(BOOL)a5 needsCorners:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  id v16 = a3;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [v16 size];
    PKFloatRoundToPixel();
    double width = v12;
    PKFloatRoundToPixel();
    double height = v13;
  }
  [(UIImageView *)self->_imageView setContentMode:1];
  [(UIImageView *)self->_imageView setAccessibilityIgnoresInvertColors:1];
  -[PKTableHeaderView setImageViewImage:withSize:animated:](self, "setImageViewImage:withSize:animated:", v16, v7, width, height);
  if (v6)
  {
    v14 = [(UIImageView *)self->_imageView layer];
    id v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    [v15 CGColor];
    PKPaymentStyleApplyCorners();
  }
}

- (void)setImageViewImage:(id)a3 withSize:(CGSize)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  imageView = self->_imageView;
  if (!imageView)
  {
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    double v12 = self->_imageView;
    self->_imageView = v11;

    [(PKTableHeaderView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }
  -[UIImageView setFrame:](imageView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
  if (v5)
  {
    double v13 = (void *)MEMORY[0x1E4FB1EB0];
    v14 = self->_imageView;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __57__PKTableHeaderView_setImageViewImage_withSize_animated___block_invoke;
    v18 = &unk_1E59CA870;
    v19 = self;
    id v20 = v9;
    [v13 transitionWithView:v14 duration:5242880 options:&v15 animations:0 completion:0.300000012];
  }
  else
  {
    [(UIImageView *)self->_imageView setImage:v9];
  }
  [(PKTableHeaderView *)self _updateImageView];
}

uint64_t __57__PKTableHeaderView_setImageViewImage_withSize_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setImage:*(void *)(a1 + 40)];
}

- (void)setImageView:(id)a3
{
  BOOL v5 = (UIImageView *)a3;
  p_imageView = &self->_imageView;
  imageView = self->_imageView;
  if (imageView != v5)
  {
    v8 = v5;
    [(UIImageView *)imageView removeFromSuperview];
    objc_storeStrong((id *)&self->_imageView, a3);
    [(UIImageView *)*p_imageView setContentMode:1];
    [(PKTableHeaderView *)self addSubview:*p_imageView];
    [(PKTableHeaderView *)self _updateImageView];
    BOOL v5 = v8;
  }
}

- (void)_updateImageView
{
  p_originalImageViewSize = &self->_originalImageViewSize;
  [(UIImageView *)self->_imageView frame];
  p_originalImageViewSize->double width = v4;
  p_originalImageViewSize->double height = v5;

  [(PKTableHeaderView *)self setNeedsLayout];
}

- (void)setAccessoryViewsDisabled:(BOOL)a3
{
  self->_accessoryViewsDisabled = a3;
  [(PKTableHeaderView *)self _updateAccessoryViews];

  [(PKTableHeaderView *)self setNeedsLayout];
}

- (UIFont)titleFont
{
  titleFont = self->_titleFont;
  if (titleFont)
  {
    v3 = titleFont;
  }
  else
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2928], (void *)*MEMORY[0x1E4FB2788], 2, 0);
    v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (UIFont)subtitleFont
{
  subtitleFont = self->_subtitleFont;
  if (subtitleFont)
  {
    v3 = subtitleFont;
  }
  else
  {
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2788]);
    v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);

  [(PKTableHeaderView *)self _updateFonts];
}

- (void)setSubtitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFont, a3);

  [(PKTableHeaderView *)self _updateFonts];
}

- (UILabel)titleLabel
{
  v18[3] = *MEMORY[0x1E4F143B8];
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    CGFloat v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v6 = self->_titleLabel;
    self->_titleLabel = v5;

    BOOL v7 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    v8 = (void *)[v7 mutableCopy];

    LODWORD(v9) = 1036831949;
    [v8 setHyphenationFactor:v9];
    [v8 setLineBreakMode:4];
    [v8 setAlignment:1];
    v10 = self->_titleLabel;
    uint64_t v11 = *MEMORY[0x1E4FB0738];
    v18[0] = v8;
    uint64_t v12 = *MEMORY[0x1E4FB06F8];
    v17[0] = v11;
    v17[1] = v12;
    double v13 = [(PKTableHeaderView *)self titleFont];
    v18[1] = v13;
    v17[2] = *MEMORY[0x1E4FB0700];
    v14 = [MEMORY[0x1E4FB1618] labelColor];
    v18[2] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    [(UILabel *)v10 _setDefaultAttributes:v15];

    [(UILabel *)self->_titleLabel setNumberOfLines:2];
    [(UILabel *)self->_titleLabel setMinimumScaleFactor:0.5];
    [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(PKTableHeaderView *)self addSubview:self->_titleLabel];
    [(PKTableHeaderView *)self _updateAccessoryViews];

    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UILabel)subtitleLabel
{
  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    CGFloat v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v6 = self->_subtitleLabel;
    self->_subtitleLabel = v5;

    BOOL v7 = self->_subtitleLabel;
    v8 = [(PKTableHeaderView *)self subtitleFont];
    [(UILabel *)v7 setFont:v8];

    [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)self->_subtitleLabel setTextAlignment:1];
    [(UILabel *)self->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [(PKTableHeaderView *)self addSubview:self->_subtitleLabel];
    subtitleLabel = self->_subtitleLabel;
  }

  return subtitleLabel;
}

- (id)actionButton
{
  actionButton = self->_actionButton;
  if (!actionButton)
  {
    id v4 = (void *)MEMORY[0x1E4FB14D8];
    CGFloat v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    BOOL v6 = objc_msgSend(v4, "pkui_plainConfigurationWithTitle:font:", 0, v5);

    BOOL v7 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v6 primaryAction:0];
    v8 = self->_actionButton;
    self->_actionButton = v7;

    [(UIButton *)self->_actionButton setAccessibilityIdentifier:*MEMORY[0x1E4F851B0]];
    [(PKTableHeaderView *)self addSubview:self->_actionButton];

    actionButton = self->_actionButton;
  }

  return actionButton;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKTableHeaderView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  double maximumHeight = self->_maximumHeight;
  v6.n128_f64[0] = fmax(v6.n128_f64[0], self->_minimumHeight);
  v7.n128_f64[0] = fmin(v6.n128_f64[0], maximumHeight);
  if (maximumHeight > 0.0) {
    v6.n128_f64[0] = v7.n128_f64[0];
  }

  PKSizeCeilToPixel(v4, v6, v7);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[PKTableHeaderView _layoutWithBounds:imageHeightAdjustment:](self, "_layoutWithBounds:imageHeightAdjustment:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
  double maximumHeight = self->_maximumHeight;
  if (v9 > maximumHeight) {
    -[PKTableHeaderView _layoutWithBounds:imageHeightAdjustment:](self, "_layoutWithBounds:imageHeightAdjustment:", x, y, width, height, maximumHeight - v9);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 imageHeightAdjustment:(double)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double topPadding = self->_topPadding;
  if (topPadding <= 0.0)
  {
    double v94 = a3.origin.y;
    if (self->_style != 1) {
      goto LABEL_6;
    }
    unint64_t v11 = PKUIGetMinScreenWidthType();
    double topPadding = 52.0;
    if (v11 > 0xC) {
      double topPadding = 121.0;
    }
  }
  double v94 = y + topPadding;
LABEL_6:
  uint64_t v12 = [(UIImageView *)self->_imageView image];
  double v13 = v12;
  CGFloat v14 = self->_originalImageViewSize.height;
  CGFloat v90 = width;
  CGFloat v91 = y;
  CGFloat v92 = height;
  CGFloat v93 = x;
  if (v12)
  {
    [v12 size];
    double v17 = fmin(self->_originalImageViewSize.width / v15, self->_originalImageViewSize.height / v16);
    [v13 scale];
    [v13 alignmentRectInsets];
    double v19 = v18;
    double v21 = v20;
    PKFloatRoundToPixelWithScale();
    double v23 = v22;
    PKFloatRoundToPixelWithScale();
    double v24 = v17 * v19;
    double v87 = v17 * v21;
    double v88 = v25;
    if (a4 == 0.0)
    {
      CGFloat v26 = v90;
    }
    else
    {
      v96.origin.CGFloat x = v93;
      CGFloat v26 = v90;
      v96.origin.double y = v91;
      v96.size.double width = v90;
      v96.size.CGFloat height = v92;
      CGRectGetWidth(v96);
      PKSizeScaleAspectFit();
    }
    double v30 = v26;
    UIRectCenteredXInRect();
    CGFloat v27 = v31;
    CGFloat v28 = v32;
    CGFloat v29 = v33;
    CGFloat v14 = v34;
    if (!self->_isTemplateLayout) {
      -[UIImageView setFrame:](self->_imageView, "setFrame:", v31 - v24, v32 - v23, v33 - (-v88 - v24), v34 - (-v87 - v23));
    }
    double y = v91;
    double width = v30;
  }
  else
  {
    CGFloat v27 = 0.0;
    CGFloat v28 = v94;
    CGFloat v29 = self->_originalImageViewSize.width;
  }
  if (self->_imageView)
  {
    v97.origin.CGFloat x = v27;
    v97.origin.double y = v28;
    v97.size.double width = v29;
    v97.size.CGFloat height = v14;
    double MaxY = CGRectGetMaxY(v97) + 25.0;
  }
  else
  {
    if (self->_style == 1) {
      goto LABEL_19;
    }
    v98.origin.CGFloat x = v27;
    v98.origin.double y = v28;
    v98.size.double width = v29;
    v98.size.CGFloat height = v14;
    double MaxY = CGRectGetMaxY(v98);
  }
  double v94 = MaxY;
LABEL_19:
  [(UIActivityIndicatorView *)self->_activityIndicator frame];
  double v37 = v36;
  [(UILabel *)self->_titleLabel frame];
  if (PKUIGetMinScreenWidthType()) {
    double v38 = 24.0;
  }
  else {
    double v38 = 16.0;
  }
  [(LAUICheckmarkLayer *)self->_checkmarkLayer frame];
  [(LAUICheckmarkLayer *)self->_checkmarkLayer aspectSize];
  PKSizeScaleAspectFit();
  double v89 = width + v38 * -2.0;
  double v40 = v89 + -10.0 + fmax(v37, v39) * -2.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v40, 1.79769313e308);
  double v42 = v41;
  v99.size.double width = width;
  double v44 = fmin(v43, v40);
  v99.size.CGFloat height = v92;
  v99.origin.CGFloat x = v93;
  v99.origin.double y = y;
  double v45 = floor(CGRectGetMidX(v99) + v44 * -0.5);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v45, v94, v44, v42);
  }
  UIRectCenteredYInRect();
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  v100.origin.CGFloat x = v45;
  v100.origin.double y = v94;
  v100.size.double width = v44;
  v100.size.CGFloat height = v42;
  double MaxX = CGRectGetMaxX(v100);
  if (!self->_isTemplateLayout) {
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", MaxX + 10.0, v47, v49, v51);
  }
  UIRectCenteredYInRect();
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  v101.origin.CGFloat x = v45;
  v101.origin.double y = v94;
  v101.size.double width = v44;
  v101.size.CGFloat height = v42;
  double v59 = CGRectGetMaxX(v101);
  if (!self->_isTemplateLayout) {
    -[LAUICheckmarkLayer setFrame:](self->_checkmarkLayer, "setFrame:", v59 + 10.0, v54, v56, v58);
  }
  unint64_t style = self->_style;
  double v61 = 0.0;
  if (style <= 2) {
    double v61 = dbl_1A04455D0[style];
  }
  v102.origin.CGFloat x = v45;
  v102.origin.double y = v94;
  v102.size.double width = v44;
  v102.size.CGFloat height = v42;
  double v62 = CGRectGetMaxY(v102);
  [(UILabel *)self->_subtitleLabel frame];
  v63 = [(UILabel *)self->_subtitleLabel text];
  if ([v63 length])
  {

LABEL_32:
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v89, 1.79769313e308);
    goto LABEL_35;
  }
  BOOL shouldReserveSubtitleHeight = self->_shouldReserveSubtitleHeight;

  if (!shouldReserveSubtitleHeight) {
    goto LABEL_32;
  }
  subtitleLabel = self->_subtitleLabel;
  v66 = PKLocalizedString(&stru_1EF1B5F30.isa);
  [(UILabel *)subtitleLabel setText:v66];

  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v89, 1.79769313e308);
  [(UILabel *)self->_subtitleLabel setText:0];
LABEL_35:
  double v67 = v61 + v62;
  UIRectCenteredXInRect();
  CGFloat v71 = v68;
  CGFloat v72 = v69;
  CGFloat v73 = v70;
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v68, v67, v69, v70);
  }
  v103.origin.CGFloat x = v71;
  v103.origin.double y = v67;
  v103.size.double width = v72;
  v103.size.CGFloat height = v73;
  double v74 = CGRectGetMaxY(v103) + 10.0;
  [(UIButton *)self->_actionButton frame];
  UIRectCenteredXInRect();
  CGFloat v78 = v75;
  CGFloat v79 = v76;
  CGFloat v80 = v77;
  if (!self->_isTemplateLayout) {
    -[UIButton setFrame:](self->_actionButton, "setFrame:", v75, v74, v76, v77);
  }
  v104.origin.CGFloat x = v78;
  v104.origin.double y = v74;
  v104.size.double width = v79;
  v104.size.CGFloat height = v80;
  double v81 = CGRectGetMaxY(v104);
  double bottomPadding = self->_bottomPadding;
  if (bottomPadding <= 0.0) {
    double bottomPadding = -0.0;
  }
  double v83 = v81 + bottomPadding;
  v105.origin.CGFloat x = v93;
  v105.origin.double y = v91;
  v105.size.double width = v90;
  v105.size.CGFloat height = v92;
  CGFloat v84 = CGRectGetWidth(v105);

  double v85 = v84;
  double v86 = v83;
  result.CGFloat height = v86;
  result.double width = v85;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKTableHeaderView;
  [(PKTableHeaderView *)&v3 layoutSubviews];
  [(PKTableHeaderView *)self bounds];
  [(PKTableHeaderView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKTableHeaderView;
  [(PKTableHeaderView *)&v3 tintColorDidChange];
  [(PKTableHeaderView *)self _updateCheckmarkColor];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKTableHeaderView;
  [(PKTableHeaderView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKTableHeaderView *)self _updateCheckmarkColor];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTableHeaderView;
  [(PKTableHeaderView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    CGFloat v5 = [(PKTableHeaderView *)self traitCollection];
    __n128 v6 = [v5 preferredContentSizeCategory];
    __n128 v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(PKTableHeaderView *)self _updateFonts];
    }
  }
}

- (BOOL)_hasAccessibilityLargeText
{
  v2 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (void)_updateFonts
{
  titleLabel = self->_titleLabel;
  id v4 = [(PKTableHeaderView *)self titleFont];
  [(UILabel *)titleLabel setFont:v4];

  subtitleLabel = self->_subtitleLabel;
  __n128 v6 = [(PKTableHeaderView *)self subtitleFont];
  [(UILabel *)subtitleLabel setFont:v6];

  actionButton = self->_actionButton;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2788]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(UIButton *)actionButton pkui_updateConfigurationWithFont:v8];
}

- (void)_updateAccessoryViews
{
  BOOL accessoryViewsDisabled = self->_accessoryViewsDisabled;
  activityIndicator = self->_activityIndicator;
  if (accessoryViewsDisabled)
  {
    [(UIActivityIndicatorView *)activityIndicator removeFromSuperview];
    CGFloat v5 = self->_activityIndicator;
    self->_activityIndicator = 0;

    [(LAUICheckmarkLayer *)self->_checkmarkLayer removeFromSuperlayer];
    checkmarkLayer = self->_checkmarkLayer;
    self->_checkmarkLayer = 0;
  }
  else
  {
    if (!activityIndicator)
    {
      __n128 v7 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      id v8 = self->_activityIndicator;
      self->_activityIndicator = v7;

      [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
      [(UIActivityIndicatorView *)self->_activityIndicator sizeToFit];
      [(PKTableHeaderView *)self addSubview:self->_activityIndicator];
    }
    if (!self->_checkmarkLayer)
    {
      objc_super v9 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E4F72FB8]);
      v10 = self->_checkmarkLayer;
      self->_checkmarkLayer = v9;

      [(LAUICheckmarkLayer *)self->_checkmarkLayer setLineWidthScale:1.4];
      [(LAUICheckmarkLayer *)self->_checkmarkLayer setRevealed:0 animated:0];
      unint64_t v11 = [(PKTableHeaderView *)self layer];
      [v11 addSublayer:self->_checkmarkLayer];

      [(PKTableHeaderView *)self _updateCheckmarkColor];
    }
  }
}

- (void)_updateCheckmarkColor
{
  objc_super v3 = [(PKTableHeaderView *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__PKTableHeaderView__updateCheckmarkColor__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __42__PKTableHeaderView__updateCheckmarkColor__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[66];
  id v3 = [v1 tintColor];
  objc_msgSend(v2, "setColor:animated:", objc_msgSend(v3, "CGColor"), 0);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(double)a3
{
  self->_double topPadding = a3;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_double bottomPadding = a3;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_double maximumHeight = a3;
}

- (BOOL)accessoryViewsDisabled
{
  return self->_accessoryViewsDisabled;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)shouldReserveSubtitleHeight
{
  return self->_shouldReserveSubtitleHeight;
}

- (void)setShouldReserveSubtitleHeight:(BOOL)a3
{
  self->_BOOL shouldReserveSubtitleHeight = a3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (LAUICheckmarkLayer)checkmarkLayer
{
  return self->_checkmarkLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end