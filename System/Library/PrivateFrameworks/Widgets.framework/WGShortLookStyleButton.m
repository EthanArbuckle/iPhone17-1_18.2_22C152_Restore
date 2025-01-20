@interface WGShortLookStyleButton
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isBackgroundBlurred;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)_size;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)materialGroupNameBase;
- (NSString)title;
- (double)_backgroundViewCornerRadius;
- (id)_fontProvider;
- (id)fontForTitle:(id)a3;
- (void)_configureBackgroundViewIfNecessary;
- (void)_configureMaskIfNecessary;
- (void)_configureTitleLabelIfNecessary;
- (void)_layoutTitleLabel;
- (void)_setBackgroundViewCornerRadius:(double)a3;
- (void)_updateHighlight;
- (void)_updateTitleLabelFont;
- (void)_updateTouchInsetsIfNecessary;
- (void)invalidateCachedGeometry;
- (void)layoutSubviews;
- (void)setBackgroundBlurred:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WGShortLookStyleButton

- (void)setBackgroundBlurred:(BOOL)a3
{
  if (self->_backgroundBlurred != a3)
  {
    self->_backgroundBlurred = a3;
    -[MTMaterialView setBlurEnabled:](self->_backgroundView, "setBlurEnabled:");
    [(WGShortLookStyleButton *)self setNeedsLayout];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WGShortLookStyleButton *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WGShortLookStyleButton;
    [(WGShortLookStyleButton *)&v5 setHighlighted:v3];
    if (v3) {
      [(WGShortLookStyleButton *)self _updateHighlight];
    }
    else {
      BSRunLoopPerformAfterCACommit();
    }
  }
}

uint64_t __41__WGShortLookStyleButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHighlight];
}

- (void)_updateHighlight
{
  if ([(WGShortLookStyleButton *)self isHighlighted])
  {
    backgroundView = self->_backgroundView;
    [(MTMaterialView *)backgroundView setHighlighted:1];
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __42__WGShortLookStyleButton__updateHighlight__block_invoke;
    v4[3] = &unk_264676588;
    v4[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v4 options:0 animations:0.3 completion:0.0];
  }
}

uint64_t __42__WGShortLookStyleButton__updateHighlight__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setHighlighted:0];
}

- (id)_fontProvider
{
  fontProvider = self->_fontProvider;
  if (!fontProvider)
  {
    v4 = [MEMORY[0x263F29D38] preferredFontProvider];
    objc_super v5 = self->_fontProvider;
    self->_fontProvider = v4;

    fontProvider = self->_fontProvider;
  }
  return fontProvider;
}

- (id)fontForTitle:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = 0;
  double v5 = *MEMORY[0x263F1D318];
  uint64_t v6 = *MEMORY[0x263F1C238];
  double v7 = 15.0;
  do
  {
    v8 = v4;
    v4 = [MEMORY[0x263F1C658] systemFontOfSize:v7 weight:v5];

    uint64_t v14 = v6;
    v15[0] = v4;
    v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v3 sizeWithAttributes:v9];
    double v11 = v10;

    double v7 = v7 + -1.0;
  }
  while (v11 > 42.6666667 && v7 >= 10.0);

  return v4;
}

- (void)_configureBackgroundViewIfNecessary
{
  if (!self->_backgroundView)
  {
    id v3 = [MEMORY[0x263F53FE8] materialViewWithRecipe:2];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    [(MTMaterialView *)self->_backgroundView setBlurEnabled:self->_backgroundBlurred];
    [(WGShortLookStyleButton *)self addSubview:self->_backgroundView];
    double v5 = self->_backgroundView;
    [(WGShortLookStyleButton *)self sendSubviewToBack:v5];
  }
}

- (void)_updateTitleLabelFont
{
  id v3 = [(WGShortLookStyleButton *)self title];
  id v4 = [(WGShortLookStyleButton *)self fontForTitle:v3];

  [(UILabel *)self->_titleLabel setFont:v4];
}

- (void)_configureTitleLabelIfNecessary
{
  if (!self->_titleLabel)
  {
    id v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    [(WGShortLookStyleButton *)self _updateTitleLabelFont];
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setNumberOfLines:1];
    [(WGShortLookStyleButton *)self addSubview:self->_titleLabel];
    [(WGShortLookStyleButton *)self _configureBackgroundViewIfNecessary];
    id v5 = [(MTMaterialView *)self->_backgroundView visualStylingProviderForCategory:1];
    [v5 automaticallyUpdateView:self->_titleLabel withStyle:1];
  }
}

- (double)_backgroundViewCornerRadius
{
  [(MTMaterialView *)self->_backgroundView _continuousCornerRadius];
  return result;
}

- (void)_setBackgroundViewCornerRadius:(double)a3
{
}

- (void)_configureMaskIfNecessary
{
  [(WGShortLookStyleButton *)self _backgroundViewCornerRadius];
  if (fabs(v3) < 2.22044605e-16)
  {
    [(WGShortLookStyleButton *)self _size];
    if (v4 >= v5) {
      double v4 = v5;
    }
    double v6 = v4 * 0.5;
    [(WGShortLookStyleButton *)self _setBackgroundViewCornerRadius:v6];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  [(WGShortLookStyleButton *)self _configureTitleLabelIfNecessary];
  [(UILabel *)self->_titleLabel setText:v4];

  [(WGShortLookStyleButton *)self _updateTitleLabelFont];
  [(WGShortLookStyleButton *)self invalidateCachedGeometry];
}

- (CGSize)_size
{
  p_size = &self->_size;
  double width = self->_size.width;
  double height = self->_size.height;
  if (width == 0.0 && height == 0.0)
  {
    [(WGShortLookStyleButton *)self _configureTitleLabelIfNecessary];
    double v6 = [(WGShortLookStyleButton *)self title];
    double v7 = [(WGShortLookStyleButton *)self fontForTitle:v6];

    uint64_t v8 = 464;
    [(UILabel *)self->_titleLabel setFont:v7];
    [(UILabel *)self->_titleLabel sizeToFit];
    titleLabel = self->_titleLabel;
    [(UILabel *)titleLabel bounds];
    -[UILabel textRectForBounds:limitedToNumberOfLines:](titleLabel, "textRectForBounds:limitedToNumberOfLines:", [(UILabel *)self->_titleLabel numberOfLines], v10, v11, v12, v13);
    double v15 = ceil(v14 + 10.0 + 10.0);
    if (v15 >= 60.0) {
      double v16 = v15;
    }
    else {
      double v16 = 60.0;
    }
    v17 = [MEMORY[0x263F29CA0] sharedInstance];
    int v18 = [v17 deviceClass];
    if (v18)
    {
      uint64_t v8 = [MEMORY[0x263F29CA0] sharedInstance];
      double v19 = 26.0;
      if ([(id)v8 deviceClass] != 1) {
        goto LABEL_14;
      }
    }
    v20 = [MEMORY[0x263F1C920] mainScreen];
    [v20 _referenceBounds];
    double v19 = 26.0;
    if (CGRectGetHeight(v25) > 812.0)
    {
      v21 = [MEMORY[0x263F29CA0] sharedInstance];
      if ([v21 homeButtonType] == 2) {
        double v19 = 28.0;
      }
      else {
        double v19 = 26.0;
      }
    }
    if (v18) {
LABEL_14:
    }

    p_size->double width = v16;
    p_size->double height = v19;
    UISizeRoundToScale();
    p_size->double width = v22;
    p_size->double height = v23;

    double width = p_size->width;
    double height = p_size->height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)invalidateCachedGeometry
{
  self->_size = (CGSize)*MEMORY[0x263F001B0];
  [(WGShortLookStyleButton *)self _setBackgroundViewCornerRadius:0.0];
  [(WGShortLookStyleButton *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(WGShortLookStyleButton *)self _configureTitleLabelIfNecessary];
  [(WGShortLookStyleButton *)self _size];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)_layoutTitleLabel
{
  [(UILabel *)self->_titleLabel sizeToFit];
  [(WGShortLookStyleButton *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  titleLabel = self->_titleLabel;
  double MidX = CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v9 = CGRectGetMidY(v12) + -0.5;
  -[UILabel setCenter:](titleLabel, "setCenter:", MidX, v9);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WGShortLookStyleButton;
  [(WGShortLookStyleButton *)&v3 layoutSubviews];
  [(WGShortLookStyleButton *)self _configureBackgroundViewIfNecessary];
  [(WGShortLookStyleButton *)self bounds];
  -[MTMaterialView setFrame:](self->_backgroundView, "setFrame:");
  [(WGShortLookStyleButton *)self _layoutTitleLabel];
  [(WGShortLookStyleButton *)self _configureMaskIfNecessary];
  [(WGShortLookStyleButton *)self _updateTouchInsetsIfNecessary];
}

- (void)_updateTouchInsetsIfNecessary
{
  [(WGShortLookStyleButton *)self bounds];
  if (v3 < 44.0)
  {
    -[WGShortLookStyleButton _setTouchInsets:](self, "_setTouchInsets:");
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WGShortLookStyleButton;
  return -[WGShortLookStyleButton pointInside:withEvent:](&v5, sel_pointInside_withEvent_, a4, a3.x, a3.y);
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WGShortLookStyleButton;
  id v4 = a3;
  [(WGShortLookStyleButton *)&v9 traitCollectionDidChange:v4];
  objc_super v5 = [(WGShortLookStyleButton *)self traitCollection];
  double v6 = [v4 preferredContentSizeCategory];

  if (v6)
  {
    double v7 = [v5 preferredContentSizeCategory];
    char v8 = [v7 isEqualToString:v6];

    if ((v8 & 1) == 0)
    {
      [(WGShortLookStyleButton *)self _updateTitleLabelFont];
      [(WGShortLookStyleButton *)self invalidateCachedGeometry];
    }
  }
}

- (NSString)materialGroupNameBase
{
  return (NSString *)[(MTMaterialView *)self->_backgroundView groupNameBase];
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v4 = a3;
  [(WGShortLookStyleButton *)self _configureBackgroundViewIfNecessary];
  [(MTMaterialView *)self->_backgroundView setGroupNameBase:v4];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 view];
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1)
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v4 numberOfTapsRequired];

  if (v6 != 1)
  {
LABEL_7:
    BOOL v7 = 1;
    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)isBackgroundBlurred
{
  return self->_backgroundBlurred;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end