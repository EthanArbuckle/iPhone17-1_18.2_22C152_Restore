@interface PKSplashImageHeaderView
- (BOOL)showsGradientOverlay;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)attributionProviderName;
- (NSString)primaryText;
- (NSString)secondaryText;
- (PKSplashImageHeaderView)initWithFrame:(CGRect)a3;
- (UIColor)fallbackColor;
- (UIImage)backgroundImage;
- (UIImage)iconImage;
- (void)layoutSubviews;
- (void)setAttributionProviderName:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImage:(id)a3 animated:(BOOL)a4;
- (void)setFallbackColor:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setShowsGradientOverlay:(BOOL)a3;
@end

@implementation PKSplashImageHeaderView

- (PKSplashImageHeaderView)initWithFrame:(CGRect)a3
{
  v50[4] = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)PKSplashImageHeaderView;
  v3 = -[PKSplashImageHeaderView initWithFrame:](&v49, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    fallbackColorView = v3->_fallbackColorView;
    v3->_fallbackColorView = v4;

    [(PKSplashImageHeaderView *)v3 addSubview:v3->_fallbackColorView];
    int v48 = [(PKSplashImageHeaderView *)v3 _shouldReverseLayoutDirection];
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = v6;

    v8 = v3->_backgroundImageView;
    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)v8 setBackgroundColor:v9];

    [(UIImageView *)v3->_backgroundImageView setContentMode:2];
    [(UIImageView *)v3->_backgroundImageView setClipsToBounds:1];
    v10 = [(UIImageView *)v3->_backgroundImageView layer];
    [v10 setOpacity:0.0];

    [(PKSplashImageHeaderView *)v3 addSubview:v3->_backgroundImageView];
    uint64_t v11 = [MEMORY[0x1E4F39BD0] layer];
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = (CAGradientLayer *)v11;

    v13 = v3->_gradientLayer;
    v14 = PKLayerNullActions();
    [(CAGradientLayer *)v13 setActions:v14];

    [(CAGradientLayer *)v3->_gradientLayer setHidden:1];
    [(CAGradientLayer *)v3->_gradientLayer setType:*MEMORY[0x1E4F3A390]];
    v15 = v3->_gradientLayer;
    id v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
    v50[0] = [v16 CGColor];
    id v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.05];
    v50[1] = [v17 CGColor];
    id v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.15];
    v50[2] = [v18 CGColor];
    id v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
    v50[3] = [v19 CGColor];
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
    [(CAGradientLayer *)v15 setColors:v20];

    [(CAGradientLayer *)v3->_gradientLayer setLocations:&unk_1EF2BA380];
    id v21 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v22 = [v21 layer];
    [v22 addSublayer:v3->_gradientLayer];

    [(PKSplashImageHeaderView *)v3 addSubview:v21];
    v23 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v23;

    v25 = v3->_iconImageView;
    v26 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)v25 setBackgroundColor:v26];

    [(UIImageView *)v3->_iconImageView _setContinuousCornerRadius:8.0];
    [(UIImageView *)v3->_iconImageView setClipsToBounds:1];
    [(UIImageView *)v3->_iconImageView setContentMode:1];
    [(PKSplashImageHeaderView *)v3 addSubview:v3->_iconImageView];
    v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryLabel = v3->_primaryLabel;
    v3->_primaryLabel = v27;

    v29 = v3->_primaryLabel;
    v30 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v29 setTextColor:v30];

    if (v48) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = 2;
    }
    [(UILabel *)v3->_primaryLabel setTextAlignment:v31];
    [(UILabel *)v3->_primaryLabel setNumberOfLines:2];
    v32 = v3->_primaryLabel;
    v33 = (void *)*MEMORY[0x1E4FB27B8];
    v34 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB27B8], 32770, 0);
    [(UILabel *)v32 setFont:v34];

    [(UILabel *)v3->_primaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(PKSplashImageHeaderView *)v3 addSubview:v3->_primaryLabel];
    v35 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryLabel = v3->_secondaryLabel;
    v3->_secondaryLabel = v35;

    [(UILabel *)v3->_secondaryLabel setTextAlignment:v31];
    [(UILabel *)v3->_secondaryLabel setNumberOfLines:1];
    v37 = v3->_secondaryLabel;
    v38 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], v33, 2, 0);
    [(UILabel *)v37 setFont:v38];

    v39 = v3->_secondaryLabel;
    v40 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v39 setTextColor:v40];

    [(UILabel *)v3->_secondaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [(PKSplashImageHeaderView *)v3 addSubview:v3->_secondaryLabel];
    v41 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    attributionLabel = v3->_attributionLabel;
    v3->_attributionLabel = v41;

    [(UILabel *)v3->_attributionLabel setNumberOfLines:1];
    v43 = v3->_attributionLabel;
    v44 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D8], (NSString *)*MEMORY[0x1E4FB27D0]);
    [(UILabel *)v43 setFont:v44];

    [(UILabel *)v3->_attributionLabel setTextAlignment:1];
    v45 = v3->_attributionLabel;
    v46 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UILabel *)v45 setTextColor:v46];

    [(UILabel *)v3->_attributionLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
    [(PKSplashImageHeaderView *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  PKFloatRoundToPixel();
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)PKSplashImageHeaderView;
  [(PKSplashImageHeaderView *)&v63 layoutSubviews];
  [(PKSplashImageHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  memset(&slice, 0, sizeof(slice));
  [(UIView *)self->_fallbackColorView setFrame:v3];
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v4, v6, v8, v10);
  gradientLayer = self->_gradientLayer;
  [(UIImageView *)self->_backgroundImageView bounds];
  -[CAGradientLayer setFrame:](gradientLayer, "setFrame:");
  if ([(PKSplashImageHeaderView *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v13 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v13 = CGRectMinXEdge;
  }
  CGFloat v14 = v6 + 0.0;
  CGFloat v15 = v8 + -32.0;
  remainder.origin.x = v4 + 16.0;
  remainder.origin.y = v6 + 0.0;
  remainder.size.CGFloat width = v8 + -32.0;
  remainder.size.height = v10 + -16.0;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  v64.origin.x = v4 + 16.0;
  v64.origin.y = v14;
  v64.size.CGFloat width = v15;
  v64.size.height = v10 + -16.0;
  CGRectDivide(v64, &slice, &remainder, 89.0, v13);
  v24 = [(UILabel *)self->_attributionLabel superview];

  -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v26 = v25;
  v27 = [(UILabel *)self->_primaryLabel font];
  [v27 lineHeight];
  double v29 = v28;

  if (v24)
  {
    CGFloat v56 = v17;
    CGFloat v57 = v19;
    CGFloat v60 = v26;
    float v30 = v26;
    float v31 = ceilf(v30);
    float v32 = v29;
    float v58 = ceilf(v32);
    float v59 = v31;
    -[UILabel sizeThatFits:](self->_attributionLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v34 = v33;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    v43 = [(UILabel *)self->_secondaryLabel font];
    [v43 descender];
    double v45 = v44;

    -[UILabel setFrame:](self->_attributionLabel, "setFrame:", v36, v38 - v45, v40, v42);
    CGRectDivide(remainder, &slice, &remainder, v34 + v45, CGRectMaxYEdge);
    if (v59 <= v58)
    {
      v67.origin.x = v56;
      v67.origin.y = v57;
      v67.size.CGFloat width = v21;
      v67.size.height = v23;
      CGFloat MinY = CGRectGetMinY(v67);
      CGRectDivide(remainder, &slice, &remainder, MinY, CGRectMinYEdge);
      -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
      CGFloat v54 = v53;
      secondaryLabel = self->_secondaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](secondaryLabel, "setFrame:");
      CGRectDivide(remainder, &slice, &remainder, v54, CGRectMinYEdge);
      primaryLabel = self->_primaryLabel;
    }
    else
    {
      v46 = self->_primaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v46, "setFrame:");
      CGRectDivide(remainder, &slice, &remainder, v60, CGRectMaxYEdge);
      -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
      primaryLabel = self->_secondaryLabel;
    }
    PKContentAlignmentMake();
  }
  else
  {
    -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    CGFloat v49 = v48;
    v65.origin.x = v17;
    v65.origin.y = v19;
    v65.size.CGFloat width = v21;
    v65.size.height = v23;
    CGRectGetMinY(v65);
    v66.origin.x = v17;
    v66.origin.y = v19;
    v66.size.CGFloat width = v21;
    v66.size.height = v23;
    CGRectGetHeight(v66);
    PKFloatRoundToPixel();
    CGRectDivide(remainder, &slice, &remainder, v50, CGRectMinYEdge);
    v51 = self->_secondaryLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v51, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, v49, CGRectMinYEdge);
    primaryLabel = self->_primaryLabel;
    PKContentAlignmentMake();
  }
  PKSizeAlignedInRect();
  -[UILabel setFrame:](primaryLabel, "setFrame:");
}

- (void)setPrimaryText:(id)a3
{
  id v4 = a3;
  double v5 = self->_primaryText;
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
    primaryText = self->_primaryText;
    self->_primaryText = v8;

    [(UILabel *)self->_primaryLabel setText:self->_primaryText];
    [(PKSplashImageHeaderView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSecondaryText:(id)a3
{
  id v4 = a3;
  double v5 = self->_secondaryText;
  double v6 = (NSString *)v4;
  v12 = v6;
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
    double v8 = (NSString *)[(NSString *)v12 copy];
    secondaryText = self->_secondaryText;
    self->_secondaryText = v8;

    secondaryLabel = self->_secondaryLabel;
    uint64_t v11 = [(NSString *)self->_secondaryText pk_uppercaseStringForPreferredLocale];
    [(UILabel *)secondaryLabel setText:v11];

    [(PKSplashImageHeaderView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setIconImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_iconImage != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_iconImage, a3);
    [(UIImageView *)self->_iconImageView setImage:self->_iconImage];
    double v5 = v6;
  }
}

- (void)setBackgroundImage:(id)a3
{
}

- (void)setBackgroundImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = (UIImage *)a3;
  if (self->_backgroundImage != v7)
  {
    CGRectEdge v13 = v7;
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    [(UIImageView *)self->_backgroundImageView setImage:v13];
    double v8 = [(UIImageView *)self->_backgroundImageView layer];
    [v8 opacity];
    if (v4 && *(float *)&v9 != 1.0)
    {
      double v10 = *(float *)&v9;
      uint64_t v11 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v11, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v10, 1.0);
      id v12 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v11);
    }
    LODWORD(v9) = 1.0;
    [v8 setOpacity:v9];

    BOOL v7 = v13;
  }
}

- (void)setFallbackColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_fallbackColor != v5)
  {
    objc_storeStrong((id *)&self->_fallbackColor, a3);
    [(UIView *)self->_fallbackColorView setBackgroundColor:v5];
  }
}

- (void)setShowsGradientOverlay:(BOOL)a3
{
  if (((!self->_showsGradientOverlay ^ a3) & 1) == 0)
  {
    self->_showsGradientOverlay = a3;
    [(CAGradientLayer *)self->_gradientLayer setHidden:!a3];
  }
}

- (void)setAttributionProviderName:(id)a3
{
  id v4 = a3;
  attributionProviderName = self->_attributionProviderName;
  uint64_t v11 = (NSString *)v4;
  double v6 = attributionProviderName;
  if (v6 == v11)
  {

LABEL_13:
    double v8 = v11;
    goto LABEL_14;
  }
  if (!v11 || !v6)
  {

    if (!v11)
    {
      [(UILabel *)self->_attributionLabel removeFromSuperview];
LABEL_12:
      [(PKSplashImageHeaderView *)self setNeedsLayout];
      goto LABEL_13;
    }
LABEL_8:
    double v9 = [(UILabel *)self->_attributionLabel superview];

    if (!v9) {
      [(PKSplashImageHeaderView *)self addSubview:self->_attributionLabel];
    }
    double v10 = PKLocalizedFeatureString();
    -[UILabel setText:](self->_attributionLabel, "setText:", v10, v11);

    goto LABEL_12;
  }
  BOOL v7 = [(NSString *)v11 isEqualToString:v6];

  double v8 = v11;
  if (!v7) {
    goto LABEL_8;
  }
LABEL_14:
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (BOOL)showsGradientOverlay
{
  return self->_showsGradientOverlay;
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (NSString)attributionProviderName
{
  return self->_attributionProviderName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionProviderName, 0);
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);

  objc_storeStrong((id *)&self->_fallbackColorView, 0);
}

@end