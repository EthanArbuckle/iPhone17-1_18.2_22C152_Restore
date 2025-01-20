@interface PKPaymentTransactionView
+ (id)defaultTertiaryLabelFont;
- (BOOL)_shouldUseStackedLayout;
- (BOOL)allowPrimaryStringExpansion;
- (BOOL)hideBadgeBackground;
- (BOOL)hideSecondaryBadgeSymbolBackground;
- (BOOL)shouldShowTransactionPreviewForTouchAtPoint:(CGPoint)a3 inView:(id)a4;
- (BOOL)showsAvatarView;
- (BOOL)showsDisclosureView;
- (BOOL)strokeImage;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNAvatarView)avatarView;
- (NSAttributedString)transactionValueAttributedText;
- (NSString)badgeString;
- (NSString)primaryString;
- (NSString)secondaryBadgeSymbol;
- (NSString)secondaryString;
- (NSString)tertiaryString;
- (PKPaymentTransactionView)initWithFrame:(CGRect)a3;
- (UIColor)primaryColor;
- (UIColor)secondaryColor;
- (UIImage)primaryImage;
- (UIImageSymbolConfiguration)secondaryBadgeSymbolConfiguration;
- (double)_defaultLayoutHeight;
- (id)_disclosureView;
- (id)defaultPrimaryColor;
- (id)defaultSecondaryColor;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateAvatarView;
- (void)_updateImageViewDynamicColors;
- (void)_updatePrimaryLabelString;
- (void)createSubviews;
- (void)layoutSubviews;
- (void)resetFonts;
- (void)setAllowPrimaryStringExpansion:(BOOL)a3;
- (void)setBadgeString:(id)a3;
- (void)setHideBadgeBackground:(BOOL)a3;
- (void)setHideSecondaryBadgeSymbolBackground:(BOOL)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setPrimaryImage:(id)a3;
- (void)setPrimaryImage:(id)a3 animated:(BOOL)a4;
- (void)setPrimaryString:(id)a3;
- (void)setSecondaryBadgeSymbol:(id)a3;
- (void)setSecondaryBadgeSymbolConfiguration:(id)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setSecondaryString:(id)a3;
- (void)setShowsAvatarView:(BOOL)a3;
- (void)setShowsDisclosureView:(BOOL)a3;
- (void)setStrokeImage:(BOOL)a3;
- (void)setTertiaryString:(id)a3;
- (void)setTransactionValueAttributedText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPaymentTransactionView

- (PKPaymentTransactionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentTransactionView;
  v3 = -[PKPaymentTransactionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKPaymentTransactionView *)v3 createSubviews];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if ([(PKPaymentTransactionView *)self _shouldUseStackedLayout])
  {
    self->_isTemplateLayout = 1;
    -[PKPaymentTransactionView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, 3.40282347e38);
    self->_isTemplateLayout = 0;
  }
  else
  {
    [(PKPaymentTransactionView *)self _defaultLayoutHeight];
    double v6 = v7;
    double v5 = width;
  }
  result.height = v6;
  result.double width = v5;
  return result;
}

- (void)createSubviews
{
  if (!self->_primaryLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryLabel = self->_primaryLabel;
    self->_primaryLabel = v3;

    double v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryLabel = self->_secondaryLabel;
    self->_secondaryLabel = v5;

    double v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    tertiaryLabel = self->_tertiaryLabel;
    self->_tertiaryLabel = v7;

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    transactionValueLabel = self->_transactionValueLabel;
    self->_transactionValueLabel = v9;

    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    badgeLabel = self->_badgeLabel;
    self->_badgeLabel = v11;

    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    bonusImageView = self->_bonusImageView;
    self->_bonusImageView = v13;

    v15 = self->_primaryLabel;
    v16 = [(PKPaymentTransactionView *)self defaultPrimaryColor];
    [(UILabel *)v15 setTextColor:v16];

    v17 = self->_secondaryLabel;
    v18 = [(PKPaymentTransactionView *)self defaultSecondaryColor];
    [(UILabel *)v17 setTextColor:v18];

    v19 = self->_tertiaryLabel;
    v20 = [(PKPaymentTransactionView *)self defaultSecondaryColor];
    [(UILabel *)v19 setTextColor:v20];

    v21 = self->_badgeLabel;
    v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v21 setTextColor:v22];

    v23 = self->_badgeLabel;
    v24 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [(UILabel *)v23 setBackgroundColor:v24];

    [(UILabel *)self->_badgeLabel setTextAlignment:1];
    v25 = [(UILabel *)self->_badgeLabel layer];
    [v25 setCornerRadius:4.0];

    v26 = [(UILabel *)self->_badgeLabel layer];
    [v26 setMasksToBounds:1];

    v27 = self->_bonusImageView;
    v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIImageView *)v27 setTintColor:v28];

    v29 = self->_bonusImageView;
    v30 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [(UIImageView *)v29 setBackgroundColor:v30];

    [(UIImageView *)self->_bonusImageView setContentMode:4];
    [(UIImageView *)self->_bonusImageView setHidden:1];
    id v31 = [(UIImageView *)self->_bonusImageView layer];
    [v31 setCornerRadius:4.0];
    [v31 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [v31 setMasksToBounds:1];
    [(UILabel *)self->_primaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(UILabel *)self->_secondaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [(UILabel *)self->_tertiaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AA8]];
    [(UILabel *)self->_transactionValueLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85B58]];
    [(UILabel *)self->_badgeLabel setAccessibilityIdentifier:*MEMORY[0x1E4F852A0]];
    [(PKPaymentTransactionView *)self addSubview:self->_primaryLabel];
    [(PKPaymentTransactionView *)self addSubview:self->_secondaryLabel];
    [(PKPaymentTransactionView *)self addSubview:self->_tertiaryLabel];
    [(PKPaymentTransactionView *)self addSubview:self->_transactionValueLabel];
    [(PKPaymentTransactionView *)self addSubview:self->_badgeLabel];
    [(PKPaymentTransactionView *)self addSubview:self->_bonusImageView];
    [(PKPaymentTransactionView *)self setStrokeImage:1];
    [(PKPaymentTransactionView *)self resetFonts];
    [(PKPaymentTransactionView *)self setAccessibilityIdentifier:*MEMORY[0x1E4F85AD0]];
  }
}

- (void)resetFonts
{
  v3 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [(UILabel *)self->_secondaryLabel setNumberOfLines:v5];
  [(UILabel *)self->_tertiaryLabel setNumberOfLines:v5];
  uint64_t v6 = PKUIGetMinScreenWidthType();
  primaryLabel = self->_primaryLabel;
  if (v6) {
    v8 = (void *)*MEMORY[0x1E4FB28C8];
  }
  else {
    v8 = (void *)*MEMORY[0x1E4FB2950];
  }
  v9 = (void *)*MEMORY[0x1E4FB27F0];
  if (v6) {
    v10 = (void *)*MEMORY[0x1E4FB2950];
  }
  else {
    v10 = (void *)*MEMORY[0x1E4FB28F0];
  }
  v11 = PKFontForDefaultDesign(v8, (void *)*MEMORY[0x1E4FB27F0], 32770, 0);
  [(UILabel *)primaryLabel setFont:v11];

  PKFontForDefaultDesign(v10, v9, 0x8000, 0);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_secondaryLabel setFont:v22];
  [(UILabel *)self->_tertiaryLabel setFont:v22];
  transactionValueLabel = self->_transactionValueLabel;
  v13 = PKFontForDefaultDesign(v8, v9, 0, 8);
  [(UILabel *)transactionValueLabel setFont:v13];

  if (self->_hideBadgeBackground)
  {
    id v14 = v22;
  }
  else
  {
    id v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  }
  v15 = v14;
  [(UILabel *)self->_badgeLabel setFont:v14];
  BOOL v16 = [(PKPaymentTransactionView *)self _shouldUseStackedLayout];
  v17 = self->_transactionValueLabel;
  if (v16)
  {
    [(UILabel *)v17 setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_transactionValueLabel setMinimumScaleFactor:0.5];
  }
  else
  {
    [(UILabel *)v17 setAdjustsFontSizeToFitWidth:0];
  }
  if (self->_hideSecondaryBadgeSymbolBackground)
  {
    v18 = [MEMORY[0x1E4FB1830] configurationWithFont:v22];
  }
  else
  {
    v19 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB28D8]];
    v20 = (void *)MEMORY[0x1E4FB1830];
    [v19 scaledValueForValue:8.0];
    v18 = objc_msgSend(v20, "configurationWithPointSize:weight:scale:", 7, 3);
  }
  if (self->_secondaryBadgeSymbolConfiguration)
  {
    uint64_t v21 = objc_msgSend(v18, "configurationByApplyingConfiguration:");

    v18 = (void *)v21;
  }
  [(UIImageView *)self->_bonusImageView setPreferredSymbolConfiguration:v18];
}

- (BOOL)_shouldUseStackedLayout
{
  v2 = [(UILabel *)self->_transactionValueLabel font];
  [v2 pointSize];
  BOOL v4 = v3 >= 25.0;

  return v4;
}

- (void)setPrimaryString:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  uint64_t v6 = [v4 whitespaceAndNewlineCharacterSet];
  double v7 = [v5 stringByTrimmingCharactersInSet:v6];

  if ([(__CFString *)v7 length]) {
    v8 = v7;
  }
  else {
    v8 = @" ";
  }
  v9 = v8;

  v10 = self->_primaryString;
  v11 = v9;
  id v14 = v11;
  if (v10 == v11)
  {

    goto LABEL_14;
  }
  if (v11) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {

LABEL_13:
    objc_storeStrong((id *)&self->_primaryString, v8);
    [(PKPaymentTransactionView *)self _updatePrimaryLabelString];
    [(PKPaymentTransactionView *)self setNeedsLayout];
    goto LABEL_14;
  }
  BOOL v13 = [(NSString *)v10 isEqualToString:v11];

  if (!v13) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)setAllowPrimaryStringExpansion:(BOOL)a3
{
  if (self->_allowPrimaryStringExpansion != a3)
  {
    self->_allowPrimaryStringExpansion = a3;
    [(PKPaymentTransactionView *)self _updatePrimaryLabelString];
    [(PKPaymentTransactionView *)self setNeedsLayout];
  }
}

- (void)_updatePrimaryLabelString
{
  [(UILabel *)self->_primaryLabel setText:self->_primaryString];
  if (!self->_primaryString || (LODWORD(v3) = 1.0, !self->_allowPrimaryStringExpansion)) {
    double v3 = 0.0;
  }
  primaryLabel = self->_primaryLabel;

  [(UILabel *)primaryLabel _setHyphenationFactor:v3];
}

- (id)defaultPrimaryColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (void)setPrimaryColor:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = +[PKPaymentTransactionView appearance];
    double v7 = [v6 primaryColor];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(PKPaymentTransactionView *)self defaultPrimaryColor];
    }
    id v5 = v9;
  }
  [(UILabel *)self->_primaryLabel setTextColor:v5];
}

- (void)setSecondaryString:(id)a3
{
  [(UILabel *)self->_secondaryLabel setText:a3];

  [(PKPaymentTransactionView *)self setNeedsLayout];
}

- (id)defaultSecondaryColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (void)setSecondaryColor:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    id v5 = (UIColor *)v4;
  }
  else
  {
    uint64_t v6 = +[PKPaymentTransactionView appearance];
    double v7 = [v6 secondaryColor];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(PKPaymentTransactionView *)self defaultSecondaryColor];
    }
    id v5 = v9;
  }
  secondaryColor = self->_secondaryColor;
  self->_secondaryColor = v5;
  v11 = v5;

  [(UILabel *)self->_secondaryLabel setTextColor:v11];
}

- (void)setTertiaryString:(id)a3
{
  [(UILabel *)self->_tertiaryLabel setText:a3];

  [(PKPaymentTransactionView *)self setNeedsLayout];
}

+ (id)defaultTertiaryLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
}

- (void)setBadgeString:(id)a3
{
  badgeLabel = self->_badgeLabel;
  id v5 = a3;
  [(UILabel *)badgeLabel setText:v5];
  uint64_t v6 = [v5 length];

  [(UILabel *)self->_badgeLabel setHidden:v6 == 0];

  [(PKPaymentTransactionView *)self setNeedsLayout];
}

- (void)setHideBadgeBackground:(BOOL)a3
{
  if (self->_hideBadgeBackground != a3)
  {
    self->_hideBadgeBackground = a3;
    badgeLabel = self->_badgeLabel;
    if (a3) {
      [MEMORY[0x1E4FB1618] clearColor];
    }
    else {
    id v5 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    }
    [(UILabel *)badgeLabel setBackgroundColor:v5];

    [(PKPaymentTransactionView *)self resetFonts];
    [(PKPaymentTransactionView *)self setNeedsLayout];
  }
}

- (NSString)badgeString
{
  return [(UILabel *)self->_badgeLabel text];
}

- (void)setTransactionValueAttributedText:(id)a3
{
  [(UILabel *)self->_transactionValueLabel setAttributedText:a3];

  [(PKPaymentTransactionView *)self setNeedsLayout];
}

- (NSAttributedString)transactionValueAttributedText
{
  return [(UILabel *)self->_transactionValueLabel attributedText];
}

- (void)setSecondaryBadgeSymbol:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self->_secondaryBadgeSymbol;
  double v7 = (NSString *)v5;
  v11 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_secondaryBadgeSymbol, a3);
    bonusImageView = self->_bonusImageView;
    id v10 = [MEMORY[0x1E4FB1818] _systemImageNamed:self->_secondaryBadgeSymbol];
    [(UIImageView *)bonusImageView setImage:v10];

    [(UIImageView *)self->_bonusImageView setHidden:v11 == 0];
    [(PKPaymentTransactionView *)self setNeedsLayout];
    [(PKPaymentTransactionView *)self layoutIfNeeded];
  }
LABEL_9:
}

- (void)setHideSecondaryBadgeSymbolBackground:(BOOL)a3
{
  if (self->_hideSecondaryBadgeSymbolBackground != a3)
  {
    self->_hideSecondaryBadgeSymbolBackground = a3;
    bonusImageView = self->_bonusImageView;
    if (a3) {
      [MEMORY[0x1E4FB1618] clearColor];
    }
    else {
    id v5 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    }
    [(UIImageView *)bonusImageView setBackgroundColor:v5];

    [(PKPaymentTransactionView *)self resetFonts];
    [(PKPaymentTransactionView *)self setNeedsLayout];
  }
}

- (void)setSecondaryBadgeSymbolConfiguration:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryBadgeSymbolConfiguration, a3);
    [(PKPaymentTransactionView *)self resetFonts];
    [(PKPaymentTransactionView *)self setNeedsLayout];
  }
}

- (void)setPrimaryImage:(id)a3
{
}

- (void)setStrokeImage:(BOOL)a3
{
  if (((!self->_strokeImage ^ a3) & 1) == 0)
  {
    self->_strokeImage = a3;
    primaryImageView = self->_primaryImageView;
    if (primaryImageView)
    {
      id v6 = [(UIImageView *)primaryImageView layer];
      if (self->_strokeImage) {
        double v5 = PKUIPixelLength();
      }
      else {
        double v5 = 0.0;
      }
      [v6 setBorderWidth:v5];
    }
  }
}

- (void)setPrimaryImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (UIImage *)a3;
  p_primaryImage = &self->_primaryImage;
  if (self->_primaryImage != v7)
  {
    objc_storeStrong((id *)&self->_primaryImage, a3);
    if (*p_primaryImage)
    {
      [(PKPaymentTransactionView *)self setShowsAvatarView:0];
      primaryImageView = self->_primaryImageView;
      if (primaryImageView)
      {
        if (v4)
        {
          id v10 = primaryImageView;
          v11 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_primaryImage];
          id v12 = self->_primaryImageView;
          self->_primaryImageView = v11;

          [(UIImageView *)self->_primaryImageView setContentMode:1];
          [(UIImageView *)self->_primaryImageView setClipsToBounds:1];
          [(UIImageView *)self->_primaryImageView _setContinuousCornerRadius:4.0];
          [(PKPaymentTransactionView *)self _updateImageViewDynamicColors];
          BOOL v13 = [(UIImageView *)self->_primaryImageView layer];
          if (self->_strokeImage) {
            double v14 = PKUIPixelLength();
          }
          else {
            double v14 = 0.0;
          }
          [v13 setBorderWidth:v14];

          [(UIImageView *)self->_primaryImageView setImage:*p_primaryImage];
          [(UIImageView *)self->_primaryImageView setAlpha:0.0];
          v26 = (void *)MEMORY[0x1E4FB1EB0];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __53__PKPaymentTransactionView_setPrimaryImage_animated___block_invoke;
          v30[3] = &unk_1E59CA870;
          v30[4] = self;
          id v31 = v10;
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __53__PKPaymentTransactionView_setPrimaryImage_animated___block_invoke_2;
          v28[3] = &unk_1E59CB6D8;
          v29 = v31;
          v20 = v31;
          objc_msgSend(v26, "pkui_animateUsingOptions:animations:completion:", 4, v30, v28);
        }
        else
        {
          v20 = [(UIImageView *)primaryImageView image];
          [(UIImageView *)self->_primaryImageView setImage:*p_primaryImage];
          uint64_t v21 = [(UIImageView *)self->_primaryImageView image];

          if (v21 == v20)
          {
            [(UIImageView *)self->_primaryImageView removeFromSuperview];
            id v22 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_primaryImage];
            v23 = self->_primaryImageView;
            self->_primaryImageView = v22;

            [(UIImageView *)self->_primaryImageView setContentMode:1];
            [(UIImageView *)self->_primaryImageView setClipsToBounds:1];
            [(UIImageView *)self->_primaryImageView _setContinuousCornerRadius:4.0];
            [(PKPaymentTransactionView *)self _updateImageViewDynamicColors];
            v24 = [(UIImageView *)self->_primaryImageView layer];
            if (self->_strokeImage) {
              double v25 = PKUIPixelLength();
            }
            else {
              double v25 = 0.0;
            }
            [v24 setBorderWidth:v25];
          }
        }
      }
      else
      {
        BOOL v16 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_primaryImage];
        v17 = self->_primaryImageView;
        self->_primaryImageView = v16;

        [(UIImageView *)self->_primaryImageView setContentMode:1];
        [(UIImageView *)self->_primaryImageView setClipsToBounds:1];
        [(UIImageView *)self->_primaryImageView _setContinuousCornerRadius:4.0];
        [(PKPaymentTransactionView *)self _updateImageViewDynamicColors];
        v18 = [(UIImageView *)self->_primaryImageView layer];
        if (self->_strokeImage) {
          double v19 = PKUIPixelLength();
        }
        else {
          double v19 = 0.0;
        }
        [v18 setBorderWidth:v19];
      }
      v27 = [(UIImageView *)self->_primaryImageView superview];

      if (!v27)
      {
        [(PKPaymentTransactionView *)self addSubview:self->_primaryImageView];
        goto LABEL_23;
      }
    }
    else
    {
      v15 = [(UIImageView *)self->_primaryImageView superview];

      if (v15)
      {
        [(UIImageView *)self->_primaryImageView removeFromSuperview];
LABEL_23:
        [(PKPaymentTransactionView *)self setNeedsLayout];
        [(PKPaymentTransactionView *)self layoutIfNeeded];
      }
    }
  }
}

uint64_t __53__PKPaymentTransactionView_setPrimaryImage_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __53__PKPaymentTransactionView_setPrimaryImage_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_updateImageViewDynamicColors
{
  double v3 = [(PKPaymentTransactionView *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PKPaymentTransactionView__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __57__PKPaymentTransactionView__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  id v1 = [MEMORY[0x1E4FB1618] systemGrayColor];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));
}

- (void)setShowsAvatarView:(BOOL)a3
{
  if (((!self->_showsAvatarView ^ a3) & 1) == 0)
  {
    self->_showsAvatarView = a3;
    [(PKPaymentTransactionView *)self _updateAvatarView];
  }
}

- (void)_updateAvatarView
{
  if (self->_showsAvatarView)
  {
    [(PKPaymentTransactionView *)self setPrimaryImage:0];
    if (self->_avatarView) {
      return;
    }
    double v3 = (CNAvatarView *)objc_msgSend(objc_alloc(getCNAvatarViewClass_0()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    avatarView = self->_avatarView;
    self->_avatarView = v3;

    [(CNAvatarView *)self->_avatarView setUserInteractionEnabled:0];
    [(CNAvatarView *)self->_avatarView setAsynchronousRendering:1];
    [(CNAvatarView *)self->_avatarView setShowsContactOnTap:0];
    [(PKPaymentTransactionView *)self addSubview:self->_avatarView];
  }
  else
  {
    double v5 = self->_avatarView;
    if (!v5) {
      return;
    }
    [(CNAvatarView *)v5 removeFromSuperview];
    id v6 = self->_avatarView;
    self->_avatarView = 0;
  }

  [(PKPaymentTransactionView *)self setNeedsLayout];
}

- (BOOL)shouldShowTransactionPreviewForTouchAtPoint:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  avatarView = self->_avatarView;
  if (avatarView && ([(CNAvatarView *)avatarView isHidden] & 1) == 0)
  {
    -[CNAvatarView convertPoint:fromView:](self->_avatarView, "convertPoint:fromView:", v7, x, y);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [(CNAvatarView *)self->_avatarView bounds];
    v15.double x = v11;
    v15.double y = v13;
    BOOL v9 = !CGRectContainsPoint(v16, v15);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)setShowsDisclosureView:(BOOL)a3
{
  if (self->_showsDisclosureView != a3)
  {
    self->_showsDisclosureView = a3;
    if (a3)
    {
      id v4 = [(PKPaymentTransactionView *)self _disclosureView];
      double v5 = [(UIImageView *)self->_disclosureView superview];

      if (v5) {
        return;
      }
      [(PKPaymentTransactionView *)self addSubview:self->_disclosureView];
    }
    else
    {
      [(UIImageView *)self->_disclosureView removeFromSuperview];
    }
    [(PKPaymentTransactionView *)self setNeedsLayout];
  }
}

- (id)_disclosureView
{
  disclosureView = self->_disclosureView;
  if (!disclosureView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v5 = PKUIChevronImage();
    id v6 = (UIImageView *)[v4 initWithImage:v5];

    id v7 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v6 setTintColor:v7];

    [(UIImageView *)v6 setContentMode:1];
    BOOL v8 = self->_disclosureView;
    self->_disclosureView = v6;

    disclosureView = self->_disclosureView;
  }

  return disclosureView;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = [(PKPaymentTransactionView *)self _shouldUseStackedLayout];
  int v9 = [(PKPaymentTransactionView *)self _shouldReverseLayoutDirection];
  if (v9) {
    CGRectEdge v10 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v10 = CGRectMinXEdge;
  }
  if (v9) {
    CGRectEdge v11 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v11 = CGRectMaxXEdge;
  }
  double v12 = 0.0;
  if (v8)
  {
    CGFloat v13 = [(UILabel *)self->_transactionValueLabel font];
    [v13 lineHeight];
    [v13 capHeight];
    [v13 descender];
    PKFloatRoundToPixel();
    double v12 = v14;
  }
  CGPoint v15 = [(UILabel *)self->_badgeLabel text];
  uint64_t v128 = [v15 length];

  memset(&v137, 0, sizeof(v137));
  CGFloat v126 = x;
  CGFloat v127 = y;
  double v16 = x + 13.0;
  double v17 = y + 8.0;
  double v130 = width;
  double v18 = width + -26.0;
  double v19 = height + -16.0;
  remainder.origin.double x = v16;
  remainder.origin.double y = y + 8.0;
  remainder.size.double width = v18;
  remainder.size.double height = height + -16.0;
  CGRectEdge edge = v10;
  double v129 = height;
  if (v8)
  {
    PKContentAlignmentMake();
    goto LABEL_11;
  }
  if (!self->_allowPrimaryStringExpansion
    || ([(UILabel *)self->_primaryLabel text], (uint64_t v49 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_41:
    [(UILabel *)self->_primaryLabel setNumberOfLines:1];
    p_bonusImageView = &self->_bonusImageView;
    char v125 = [(UIImageView *)self->_bonusImageView isHidden];
LABEL_43:
    p_avatarView = (void **)&self->_avatarView;
    if (self->_avatarView
      || self->_primaryImage && (p_avatarView = (void **)&self->_primaryImageView, self->_primaryImageView))
    {
      v142.origin.double x = v16;
      v142.origin.double y = y + 8.0;
      v142.size.double width = v18;
      v142.size.double height = height + -16.0;
      CGRectDivide(v142, &v137, &remainder, 45.0, v10);
      if (!self->_isTemplateLayout)
      {
        v55 = *p_avatarView;
        PKSizeAlignedInRect();
        objc_msgSend(v55, "setFrame:");
      }
      CGRectDivide(remainder, &v137, &remainder, 12.0, v10);
    }
    CGRect slice = remainder;
    -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v57 = v56;
    -[UILabel sizeThatFits:](self->_tertiaryLabel, "sizeThatFits:", slice.size.width, slice.size.height);
    double v59 = v58;
    -[UILabel sizeThatFits:](self->_transactionValueLabel, "sizeThatFits:", slice.size.width, slice.size.height);
    double v61 = v60;
    -[UILabel sizeThatFits:](self->_badgeLabel, "sizeThatFits:", slice.size.width, slice.size.height);
    CGSize v62 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    rect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    rect.size = v62;
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", slice.size.width, slice.size.height);
    double v64 = v63;
    if (self->_showsDisclosureView) {
      double v65 = v63 + 12.0;
    }
    else {
      double v65 = 0.0;
    }
    double v66 = slice.size.width - v65;
    double v67 = v61 + 12.0;
    if (v61 == 0.0) {
      double v67 = 0.0;
    }
    -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", v66 - v67, slice.size.height);
    uint64_t v121 = v68;
    CGFloat v70 = v69;
    PKSizeAlignedInRect();
    CGRect slice = v143;
    memset(&v134, 0, sizeof(v134));
    CGRectDivide(v143, &v134, &slice, v70, CGRectMinYEdge);
    if (self->_showsDisclosureView)
    {
      CGRectDivide(slice, &v137, &slice, v64 + 12.0, v11);
      CGRectDivide(v134, &rect, &v134, v64 + 12.0, v11);
    }
    v71 = [(UILabel *)self->_transactionValueLabel text];
    uint64_t v72 = [v71 length];

    if (v72)
    {
      -[UILabel sizeThatFits:](self->_transactionValueLabel, "sizeThatFits:", slice.size.width, slice.size.height);
      CGFloat v74 = v73;
      memset(&v133, 0, sizeof(v133));
      CGRectDivide(v134, &v133, &v134, v75, v11);
      rect.size.double height = v74;
      PKSizeAlignedInRect();
      if (!self->_isTemplateLayout)
      {
        transactionValueLabel = self->_transactionValueLabel;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        -[UILabel setFrame:](transactionValueLabel, "setFrame:");
      }
      CGRectDivide(v134, &v133, &v134, 12.0, v11);
    }
    CGFloat v77 = height;
    if (!self->_isTemplateLayout)
    {
      primaryLabel = self->_primaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](primaryLabel, "setFrame:");
    }
    CGRectDivide(slice, &v134, &slice, 2.0, CGRectMinYEdge);
    if (self->_showsDisclosureView && !self->_isTemplateLayout)
    {
      [(UIImageView *)self->_disclosureView setHidden:0];
      disclosureView = self->_disclosureView;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](disclosureView, "setFrame:");
    }
    CGFloat v80 = v130;
    if (!v128) {
      goto LABEL_80;
    }
    -[UILabel sizeThatFits:](self->_badgeLabel, "sizeThatFits:", slice.size.width, slice.size.height);
    if (self->_hideBadgeBackground) {
      double v82 = v81;
    }
    else {
      double v82 = v81 + 10.0;
    }
    memset(&v133, 0, sizeof(v133));
    CGRectDivide(slice, &v133, &slice, v82, v11);
    if (self->_isTemplateLayout)
    {
      if (v125)
      {
LABEL_80:
        if ((v125 & 1) == 0)
        {
          -[UIImageView sizeThatFits:](*p_bonusImageView, "sizeThatFits:", slice.size.width, slice.size.height);
          memset(&v133, 0, sizeof(v133));
          CGRectDivide(slice, &v133, &slice, v87 + 6.0, v11);
          if (!self->_isTemplateLayout)
          {
            PKContentAlignmentMake();
            PKSizeAlignedInRect();
            v133.origin.double x = v89;
            v133.origin.double y = v88;
            v133.size.double width = v90;
            v133.size.double height = v91;
            if (v57 > 0.0 && v59 > 0.0) {
              v133.origin.double y = v88 + 3.0;
            }
            -[UIImageView setFrame:](*p_bonusImageView, "setFrame:");
          }
        }
        memset(&v133, 0, sizeof(v133));
        CGRectDivide(slice, &v133, &slice, v57, CGRectMinYEdge);
        if (!self->_isTemplateLayout)
        {
          secondaryLabel = self->_secondaryLabel;
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          -[UILabel setFrame:](secondaryLabel, "setFrame:");
        }
        if (v57 > 0.0) {
          CGRectDivide(slice, &v133, &slice, 2.0, CGRectMinYEdge);
        }
        memset(&v132, 0, sizeof(v132));
        CGRectDivide(slice, &v132, &slice, v59, CGRectMinYEdge);
        if (!self->_isTemplateLayout)
        {
          tertiaryLabel = self->_tertiaryLabel;
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          -[UILabel setFrame:](tertiaryLabel, "setFrame:");
        }
        double v94 = remainder.size.height + 8.0;
        goto LABEL_93;
      }
    }
    else
    {
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v133.origin.double x = v84;
      v133.origin.double y = v83;
      v133.size.double width = v85;
      v133.size.double height = v86;
      if (v57 > 0.0 && v59 > 0.0 && !self->_hideBadgeBackground) {
        v133.origin.double y = v83 + 3.0;
      }
      -[UILabel setFrame:](self->_badgeLabel, "setFrame:");
      if (v125) {
        goto LABEL_80;
      }
    }
    if (!self->_hideSecondaryBadgeSymbolBackground) {
      CGRectDivide(slice, &v133, &slice, 6.0, v11);
    }
    goto LABEL_80;
  }
  v50 = (void *)v49;
  uint64_t v51 = [(UILabel *)self->_secondaryLabel text];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(UILabel *)self->_tertiaryLabel text];

    CGRectEdge v10 = edge;
    if (v53) {
      goto LABEL_41;
    }
  }
  else
  {
  }
LABEL_11:
  [(UILabel *)self->_primaryLabel setNumberOfLines:2];
  p_bonusImageView = &self->_bonusImageView;
  char v21 = [(UIImageView *)self->_bonusImageView isHidden];
  char v22 = v21;
  if (!v8)
  {
    char v125 = v21;
    goto LABEL_43;
  }
  v23 = [(UILabel *)self->_transactionValueLabel text];
  uint64_t v24 = [v23 length];

  double v25 = 25.0;
  if (!self->_showsDisclosureView) {
    double v25 = *MEMORY[0x1E4F1DB30];
  }
  double v124 = v25;
  uint64_t v123 = v24;
  if (self->_primaryImage && self->_primaryImageView || self->_avatarView)
  {
    if (v24) {
      -[UILabel sizeThatFits:](self->_transactionValueLabel, "sizeThatFits:", v18, v19);
    }
    v26 = [(UILabel *)self->_transactionValueLabel font];
    [v26 lineHeight];
    CGFloat v28 = v27;

    CGSize v29 = (CGSize)0;
    memset(&slice, 0, sizeof(slice));
    if (self->_showsDisclosureView)
    {
      v140.origin.double x = v16;
      v140.origin.double y = v17;
      v140.size.double width = v18;
      v140.size.double height = height + -16.0;
      CGRectDivide(v140, &slice, &remainder, v124 + 12.0, v11);
      CGSize v29 = (CGSize)0;
      double v16 = remainder.origin.x;
      double v17 = remainder.origin.y;
      double v18 = remainder.size.width;
      double v19 = remainder.size.height;
    }
    rect.origin = (CGPoint)v29;
    rect.size = v29;
    v141.origin.double x = v16;
    v141.origin.double y = v17;
    v141.size.double width = v18;
    v141.size.double height = v19;
    CGRectDivide(v141, &rect, &remainder, v28, CGRectMinYEdge);
    if (self->_avatarView)
    {
      memset(&v134, 0, sizeof(v134));
      CGRectDivide(rect, &v134, &rect, v28 - v12, edge);
      if (!self->_isTemplateLayout)
      {
        [(CNAvatarView *)self->_avatarView setHidden:0];
        avatarView = self->_avatarView;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        -[CNAvatarView setFrame:](avatarView, "setFrame:");
      }
    }
    else
    {
      if (!self->_primaryImage || !self->_primaryImageView) {
        goto LABEL_25;
      }
      memset(&v134, 0, sizeof(v134));
      CGRectDivide(rect, &v134, &rect, v28 - v12, edge);
      if (!self->_isTemplateLayout)
      {
        [(UIImageView *)self->_primaryImageView setHidden:0];
        primaryImageView = self->_primaryImageView;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        -[UIImageView setFrame:](primaryImageView, "setFrame:");
      }
    }
    CGRectDivide(rect, &v134, &rect, 12.0, edge);
LABEL_25:
    if (!self->_isTemplateLayout)
    {
      id v31 = self->_transactionValueLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v31, "setFrame:");
    }
    if (self->_showsDisclosureView && !self->_isTemplateLayout)
    {
      [(UIImageView *)self->_disclosureView setHidden:0];
      v32 = self->_disclosureView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](v32, "setFrame:");
    }
    CGSize v33 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v134.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v134.size = v33;
    if (v128)
    {
      -[UILabel sizeThatFits:](self->_badgeLabel, "sizeThatFits:", rect.size.width, rect.size.height);
      CGRectDivide(rect, &v134, &rect, v34 + 10.0 + 12.0, v11);
      if (!self->_isTemplateLayout)
      {
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v134.origin.double x = v35;
        v134.origin.double y = v36;
        v134.size.double width = v37;
        v134.size.double height = v38;
        -[UILabel setFrame:](self->_badgeLabel, "setFrame:");
      }
    }
    if ((v22 & 1) == 0)
    {
      -[UIImageView sizeThatFits:](*p_bonusImageView, "sizeThatFits:", rect.size.width, rect.size.height);
      memset(&v133, 0, sizeof(v133));
      CGFloat v40 = v39 + 6.0;
      CGRectIsEmpty(v134);
      CGRectDivide(rect, &v133, &rect, v40, v11);
      if (!self->_isTemplateLayout)
      {
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v133.origin.double x = v41;
        v133.origin.double y = v42;
        v133.size.double width = v43;
        v133.size.double height = v44;
        -[UIImageView setFrame:](*p_bonusImageView, "setFrame:");
      }
    }
    char v45 = v22;
    v46 = &self->_bonusImageView;
    double v47 = v28 + 5.0 + 8.0;
    char v48 = 1;
    goto LABEL_105;
  }
  double v47 = 8.0;
  char v45 = v22;
  v46 = &self->_bonusImageView;
  if (self->_showsDisclosureView)
  {
    v145.origin.double x = v16;
    v145.origin.double y = y + 8.0;
    v145.size.double width = v18;
    v145.size.double height = height + -16.0;
    CGRectDivide(v145, &v137, &remainder, 25.0, v11);
    if (!self->_isTemplateLayout)
    {
      v99 = self->_disclosureView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](v99, "setFrame:");
    }
    CGRectDivide(remainder, &v137, &remainder, 12.0, v11);
  }
  char v48 = 0;
LABEL_105:
  double v100 = remainder.size.width;
  -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", remainder.size.width, 3.40282347e38);
  double v102 = v101;
  -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", v100, 3.40282347e38);
  double v104 = v103;
  -[UILabel sizeThatFits:](self->_tertiaryLabel, "sizeThatFits:", v100, 3.40282347e38);
  double v106 = v105;
  if (!self->_isTemplateLayout)
  {
    double v122 = v105;
    v107 = self->_primaryLabel;
    PKContentAlignmentMake();
    double v106 = v122;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v107, "setFrame:");
  }
  double v94 = v47 + v102;
  if (v104 > 0.0)
  {
    double v108 = v94 + 2.0;
    if (!self->_isTemplateLayout)
    {
      v109 = self->_secondaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v109, "setFrame:");
    }
    double v94 = v108 + v104;
  }
  CGFloat v80 = v130;
  if (v106 > 0.0)
  {
    double v110 = v94 + 2.0;
    if (!self->_isTemplateLayout)
    {
      v111 = self->_tertiaryLabel;
      PKContentAlignmentMake();
      CGFloat v80 = v130;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v111, "setFrame:");
    }
    double v94 = v106 + v110;
  }
  CGFloat v77 = v129;
  if ((v48 & 1) == 0)
  {
    if (v123)
    {
      double v112 = v94 + 2.0;
      -[UILabel sizeThatFits:](self->_transactionValueLabel, "sizeThatFits:", v100, 3.40282347e38);
      double v114 = v113;
      if (!self->_isTemplateLayout)
      {
        v115 = self->_transactionValueLabel;
        PKContentAlignmentMake();
        CGFloat v80 = v130;
        PKSizeAlignedInRect();
        -[UILabel setFrame:](v115, "setFrame:");
      }
      double v94 = v112 + v114;
    }
    if (v128)
    {
      double v116 = v94 + 2.0;
      -[UILabel sizeThatFits:](self->_transactionValueLabel, "sizeThatFits:", v100, 3.40282347e38);
      double v118 = v117;
      if (v45)
      {
        if (self->_isTemplateLayout)
        {
LABEL_129:
          double v94 = v116 + v118;
          CGFloat v77 = v129;
          CGFloat v80 = v130;
          goto LABEL_93;
        }
        badgeLabel = self->_badgeLabel;
        PKContentAlignmentMake();
      }
      else
      {
        -[UIImageView sizeThatFits:](*v46, "sizeThatFits:", v100, 3.40282347e38);
        if (self->_isTemplateLayout) {
          goto LABEL_129;
        }
        v120 = *v46;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        -[UIImageView setFrame:](v120, "setFrame:");
        if (self->_isTemplateLayout) {
          goto LABEL_129;
        }
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        badgeLabel = self->_badgeLabel;
        PKContentAlignmentMake();
      }
      PKSizeAlignedInRect();
      -[UILabel setFrame:](badgeLabel, "setFrame:");
      goto LABEL_129;
    }
    CGFloat v77 = v129;
  }
LABEL_93:
  double v95 = v94 + 8.0;
  v144.origin.double x = v126;
  v144.origin.double y = v127;
  v144.size.double width = v80;
  v144.size.double height = v77;
  double v96 = CGRectGetWidth(v144);
  double v97 = v95;
  result.double height = v97;
  result.double width = v96;
  return result;
}

- (double)_defaultLayoutHeight
{
  double v3 = [(UILabel *)self->_primaryLabel font];
  [v3 lineHeight];
  id v4 = [(UILabel *)self->_secondaryLabel font];
  [v4 lineHeight];
  double v5 = [(UILabel *)self->_tertiaryLabel font];
  [v5 lineHeight];

  PKFloatRoundToPixel();
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionView;
  [(PKPaymentTransactionView *)&v3 layoutSubviews];
  [(PKPaymentTransactionView *)self bounds];
  [(PKPaymentTransactionView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentTransactionView;
  [(PKPaymentTransactionView *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKPaymentTransactionView *)self traitCollection];
  id v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      id v7 = [v4 preferredContentSizeCategory];
      BOOL v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9) {
        [(PKPaymentTransactionView *)self resetFonts];
      }
    }
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionView;
  [(PKPaymentTransactionView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKPaymentTransactionView *)self _updateImageViewDynamicColors];
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (NSString)primaryString
{
  return self->_primaryString;
}

- (NSString)secondaryString
{
  return self->_secondaryString;
}

- (NSString)tertiaryString
{
  return self->_tertiaryString;
}

- (BOOL)hideBadgeBackground
{
  return self->_hideBadgeBackground;
}

- (BOOL)hideSecondaryBadgeSymbolBackground
{
  return self->_hideSecondaryBadgeSymbolBackground;
}

- (BOOL)showsAvatarView
{
  return self->_showsAvatarView;
}

- (BOOL)showsDisclosureView
{
  return self->_showsDisclosureView;
}

- (NSString)secondaryBadgeSymbol
{
  return self->_secondaryBadgeSymbol;
}

- (UIImageSymbolConfiguration)secondaryBadgeSymbolConfiguration
{
  return self->_secondaryBadgeSymbolConfiguration;
}

- (BOOL)allowPrimaryStringExpansion
{
  return self->_allowPrimaryStringExpansion;
}

- (UIImage)primaryImage
{
  return self->_primaryImage;
}

- (BOOL)strokeImage
{
  return self->_strokeImage;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_primaryImage, 0);
  objc_storeStrong((id *)&self->_secondaryBadgeSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_secondaryBadgeSymbol, 0);
  objc_storeStrong((id *)&self->_tertiaryString, 0);
  objc_storeStrong((id *)&self->_secondaryString, 0);
  objc_storeStrong((id *)&self->_primaryString, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_bonusImageView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_primaryImageView, 0);
  objc_storeStrong((id *)&self->_transactionValueLabel, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);

  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end