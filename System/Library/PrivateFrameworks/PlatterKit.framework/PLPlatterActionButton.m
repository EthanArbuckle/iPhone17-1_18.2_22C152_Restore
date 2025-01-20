@interface PLPlatterActionButton
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BSUIFontProvider)_fontProvider;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTMaterialView)backgroundView;
- (MTVisualStylingProvider)titleLabelVisualStylingProvider;
- (NSString)materialGroupNameBase;
- (NSString)preferredContentSizeCategory;
- (NSString)title;
- (PLPlatterActionButton)initWithFrame:(CGRect)a3;
- (UIColor)backgroundTintColor;
- (UIColor)textColor;
- (UIFont)font;
- (UILabel)titleLabel;
- (double)cornerRadius;
- (int64_t)_wordCountForText:(id)a3;
- (int64_t)backgroundMaterialRecipe;
- (void)_configureBackgroundColoringViewIfNecessary;
- (void)_configureBackgroundViewIfNecessary;
- (void)_configureTitleLabelEffects;
- (void)_configureTitleLabelIfNecessary;
- (void)_handleHoverGestureRecognizerEvent:(id)a3;
- (void)_layoutBackgroundView;
- (void)_layoutTitleLabel;
- (void)_setFontProvider:(id)a3;
- (void)_updateTitleLabelFont;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setBackgroundMaterialRecipe:(int64_t)a3;
- (void)setBackgroundTintColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelVisualStylingProvider:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PLPlatterActionButton

- (PLPlatterActionButton)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLPlatterActionButton;
  v3 = -[PLPlatterActionButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PLPlatterActionButton *)v3 setAccessibilityIdentifier:@"swipe-action-button-identifier"];
    [(PLPlatterActionButton *)v4 setClipsToBounds:1];
    v4->_cornerRadius = 13.0;
    v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v4 action:sel__handleHoverGestureRecognizerEvent_];
      [(PLPlatterActionButton *)v4 addGestureRecognizer:v7];
    }
  }
  return v4;
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLPlatterActionButton;
  id v3 = a3;
  [(PLPlatterActionButton *)&v5 willMoveToSuperview:v3];
  v4 = objc_msgSend(v3, "layer", v5.receiver, v5.super_class);

  [v4 setAllowsGroupBlending:0];
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)[v7 copy];
    title = self->_title;
    self->_title = v4;

    [(UILabel *)self->_titleLabel removeFromSuperview];
    titleLabel = self->_titleLabel;
    self->_titleLabel = 0;

    [(PLPlatterActionButton *)self _configureTitleLabelIfNecessary];
    [(PLPlatterActionButton *)self setNeedsLayout];
  }
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIFont *)[v6 copy];
    font = self->_font;
    self->_font = v4;

    [(UILabel *)self->_titleLabel setFont:self->_font];
    [(PLPlatterActionButton *)self setNeedsLayout];
  }
}

- (void)setBackgroundTintColor:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)[v6 copy];
    backgroundTintColor = self->_backgroundTintColor;
    self->_backgroundTintColor = v4;

    [(PLPlatterActionButton *)self setNeedsLayout];
  }
}

- (void)setTextColor:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)[v6 copy];
    textColor = self->_textColor;
    self->_textColor = v4;

    [(PLPlatterActionButton *)self _configureTitleLabelIfNecessary];
    [(PLPlatterActionButton *)self _configureTitleLabelEffects];
    [(PLPlatterActionButton *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PLPlatterActionButton;
  [(PLPlatterActionButton *)&v3 layoutSubviews];
  [(PLPlatterActionButton *)self _configureBackgroundViewIfNecessary];
  [(PLPlatterActionButton *)self _configureBackgroundColoringViewIfNecessary];
  [(PLPlatterActionButton *)self _configureTitleLabelIfNecessary];
  [(PLPlatterActionButton *)self sendSubviewToBack:self->_backgroundView];
  [(PLPlatterActionButton *)self _layoutTitleLabel];
  [(PLPlatterActionButton *)self _layoutBackgroundView];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4 + 16.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLPlatterActionButton;
  unsigned int v5 = [(PLPlatterActionButton *)&v17 isHighlighted];
  v16.receiver = self;
  v16.super_class = (Class)PLPlatterActionButton;
  [(PLPlatterActionButton *)&v16 setHighlighted:v3];
  v15.receiver = self;
  v15.super_class = (Class)PLPlatterActionButton;
  unsigned int v6 = [(PLPlatterActionButton *)&v15 isHighlighted];
  if (v5 != v6)
  {
    char v7 = v6;
    [(PLPlatterActionButton *)self _configureBackgroundViewIfNecessary];
    backgroundView = self->_backgroundView;
    id v9 = objc_initWeak(&location, backgroundView);
    v10 = (void *)[(id)objc_opt_class() newDefaultHighlightAnimator];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__PLPlatterActionButton_setHighlighted___block_invoke;
    v11[3] = &unk_1E6B5F778;
    objc_copyWeak(&v12, &location);
    char v13 = v7;
    [v10 addAnimations:v11];
    [v10 startAnimation];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

void __40__PLPlatterActionButton_setHighlighted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHighlighted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setBackgroundMaterialRecipe:(int64_t)a3
{
  if (self->_backgroundMaterialRecipe != a3)
  {
    self->_backgroundMaterialRecipe = a3;
    -[MTMaterialView setRecipe:](self->_backgroundView, "setRecipe:");
    [(PLPlatterActionButton *)self setNeedsLayout];
  }
}

- (BSUIFontProvider)_fontProvider
{
  if (!self->_fontProvider)
  {
    if ([(PLPlatterActionButton *)self adjustsFontForContentSizeCategory]) {
      [MEMORY[0x1E4F4F8B8] preferredFontProvider];
    }
    else {
    BOOL v3 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    }
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;
  }
  unsigned int v5 = self->_fontProvider;
  return v5;
}

- (void)_updateTitleLabelFont
{
  if (self->_titleLabel)
  {
    BOOL v3 = self->_font;
    if (!v3)
    {
      if ([(UILabel *)self->_titleLabel numberOfLines] <= 1) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = 8;
      }
      unsigned int v5 = [(PLPlatterActionButton *)self _fontProvider];
      unsigned int v6 = [v5 preferredFontForTextStyle:*MEMORY[0x1E4F438C8] hiFontStyle:v4];

      BOOL v3 = v6;
    }
    char v7 = v3;
    [(UILabel *)self->_titleLabel setFont:v3];
  }
}

- (void)_configureTitleLabelEffects
{
  [(PLPlatterActionButton *)self _configureBackgroundViewIfNecessary];
  textColor = self->_textColor;
  if (textColor)
  {
    titleLabelVisualStylingProvider = self->_titleLabelVisualStylingProvider;
    if (titleLabelVisualStylingProvider)
    {
      [(MTVisualStylingProvider *)titleLabelVisualStylingProvider stopAutomaticallyUpdatingView:self->_titleLabel];
      [(UILabel *)self->_titleLabel mt_removeAllVisualStyling];
      unsigned int v5 = self->_titleLabelVisualStylingProvider;
      self->_titleLabelVisualStylingProvider = 0;

      textColor = self->_textColor;
    }
    titleLabel = self->_titleLabel;
    [(UILabel *)titleLabel setTextColor:textColor];
  }
  else
  {
    char v7 = [(MTMaterialView *)self->_backgroundView visualStylingProviderForCategory:1];
    v8 = self->_titleLabelVisualStylingProvider;
    self->_titleLabelVisualStylingProvider = v7;

    id v9 = self->_titleLabelVisualStylingProvider;
    v10 = self->_titleLabel;
    [(MTVisualStylingProvider *)v9 automaticallyUpdateView:v10 withStyle:1];
  }
}

- (void)_configureTitleLabelIfNecessary
{
  if (!self->_titleLabel)
  {
    [(PLPlatterActionButton *)self bounds];
    CGRect v17 = CGRectInset(v16, 8.0, 0.0);
    double x = v17.origin.x;
    double y = v17.origin.y;
    double width = v17.size.width;
    unsigned int v6 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v6;

    uint64_t v8 = 1;
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setMinimumScaleFactor:0.5];
    LODWORD(v9) = 1036831949;
    [(UILabel *)self->_titleLabel _setHyphenationFactor:v9];
    [(UILabel *)self->_titleLabel setLineBreakMode:4];
    [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_titleLabel setText:self->_title];
    if ([(PLPlatterActionButton *)self _wordCountForText:self->_title] > 1) {
      uint64_t v8 = 2;
    }
    [(UILabel *)self->_titleLabel setNumberOfLines:v8];
    [(PLPlatterActionButton *)self _updateTitleLabelFont];
    v10 = [(PLPlatterActionButton *)self traitCollection];
    [v10 displayScale];

    v11 = [(UILabel *)self->_titleLabel font];
    [v11 lineHeight];
    UIRoundToScale();
    double v13 = v12;

    -[UILabel setFrame:](self->_titleLabel, "setFrame:", x, y, width, v13);
    [(PLPlatterActionButton *)self _configureTitleLabelEffects];
    v14 = self->_titleLabel;
    [(PLPlatterActionButton *)self addSubview:v14];
  }
}

- (void)_configureBackgroundColoringViewIfNecessary
{
  backgroundTintColor = self->_backgroundTintColor;
  backgroundTintColoringView = self->_backgroundTintColoringView;
  if (backgroundTintColor)
  {
    if (!backgroundTintColoringView)
    {
      unsigned int v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      unsigned int v6 = self->_backgroundTintColoringView;
      self->_backgroundTintColoringView = v5;

      [(MTMaterialView *)self->_backgroundView addSubview:self->_backgroundTintColoringView];
      [(UIView *)self->_backgroundTintColoringView _setContinuousCornerRadius:self->_cornerRadius];
      backgroundTintColoringView = self->_backgroundTintColoringView;
      backgroundTintColor = self->_backgroundTintColor;
    }
    [(UIView *)backgroundTintColoringView setBackgroundColor:backgroundTintColor];
  }
  else
  {
    [(UIView *)backgroundTintColoringView removeFromSuperview];
    char v7 = self->_backgroundTintColoringView;
    self->_backgroundTintColoringView = 0;
  }
  [(PLPlatterActionButton *)self _configureTitleLabelEffects];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(PLPlatterActionButton *)self _configureBackgroundViewIfNecessary];
    [(MTMaterialView *)self->_backgroundView _setContinuousCornerRadius:self->_cornerRadius];
    [(PLPlatterActionButton *)self _configureBackgroundColoringViewIfNecessary];
    [(UIView *)self->_backgroundTintColoringView _setContinuousCornerRadius:self->_cornerRadius];
    [(PLPlatterActionButton *)self setNeedsLayout];
  }
}

- (void)_configureBackgroundViewIfNecessary
{
  if (!self->_backgroundView)
  {
    BOOL v3 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:self->_backgroundMaterialRecipe];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    [(MTMaterialView *)self->_backgroundView setGroupNameBase:self->_materialGroupNameBase];
    [(MTMaterialView *)self->_backgroundView _setContinuousCornerRadius:self->_cornerRadius];
    [(PLPlatterActionButton *)self addSubview:self->_backgroundView];
    unsigned int v5 = self->_backgroundView;
    [(PLPlatterActionButton *)self sendSubviewToBack:v5];
  }
}

- (void)_layoutBackgroundView
{
  backgroundView = self->_backgroundView;
  [(PLPlatterActionButton *)self bounds];
  -[MTMaterialView setFrame:](backgroundView, "setFrame:");
  backgroundTintColoringView = self->_backgroundTintColoringView;
  [(PLPlatterActionButton *)self bounds];
  -[UIView setFrame:](backgroundTintColoringView, "setFrame:");
}

- (void)_layoutTitleLabel
{
  [(PLPlatterActionButton *)self bounds];
  CGRectGetWidth(v6);
  [(UILabel *)self->_titleLabel frame];
  CGRectGetHeight(v7);
  BSRectWithSize();
  BOOL v3 = [(PLPlatterActionButton *)self traitCollection];
  [v3 displayScale];

  [(PLPlatterActionButton *)self bounds];
  UIRectCenteredIntegralRectScale();
  titleLabel = self->_titleLabel;
  -[UILabel setFrame:](titleLabel, "setFrame:");
}

- (int64_t)_wordCountForText:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  if ([(__CFString *)v3 length])
  {
    CFIndex Length = CFStringGetLength(v3);
    CFLocaleRef v5 = CFLocaleCopyCurrent();
    v9.id location = 0;
    v9.length = Length;
    CGRect v6 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3, v9, 3uLL, v5);
    int64_t v7 = -1;
    do
      ++v7;
    while (CFStringTokenizerAdvanceToNextToken(v6));
    CFRelease(v6);
    CFRelease(v5);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategordouble y = a3;
    if (a3)
    {
      uint64_t v4 = [MEMORY[0x1E4F42738] sharedApplication];
      CFLocaleRef v5 = [v4 preferredContentSizeCategory];
      [(PLPlatterActionButton *)self setPreferredContentSizeCategory:v5];
    }
    [(PLPlatterActionButton *)self adjustForContentSizeCategoryChange];
  }
}

- (NSString)preferredContentSizeCategory
{
  p_preferredContentSizeCategordouble y = &self->_preferredContentSizeCategory;
  preferredContentSizeCategordouble y = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E4F437D0]);
    preferredContentSizeCategordouble y = *p_preferredContentSizeCategory;
  }
  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v4 = [v3 preferredContentSizeCategory];

  CFLocaleRef v5 = [(PLPlatterActionButton *)self preferredContentSizeCategory];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    fontProvider = self->_fontProvider;
    self->_fontProvider = 0;

    [(PLPlatterActionButton *)self setPreferredContentSizeCategory:v4];
    [(PLPlatterActionButton *)self _updateTitleLabelFont];
    [(PLPlatterActionButton *)self setNeedsLayout];
  }

  return v6 ^ 1;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  p_materialGroupNameBase = &self->_materialGroupNameBase;
  id v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    [(MTMaterialView *)self->_backgroundView setGroupNameBase:*p_materialGroupNameBase];
    [(PLPlatterActionButton *)self setNeedsLayout];
  }
}

- (void)_handleHoverGestureRecognizerEvent:(id)a3
{
  uint64_t v4 = [a3 state];
  if (v4 == 3)
  {
    CFLocaleRef v5 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    CFRange v9 = __60__PLPlatterActionButton__handleHoverGestureRecognizerEvent___block_invoke_2;
    v10 = &unk_1E6B5F800;
    v11 = self;
    id v6 = &v7;
  }
  else
  {
    if (v4 != 1) {
      return;
    }
    CFLocaleRef v5 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __60__PLPlatterActionButton__handleHoverGestureRecognizerEvent___block_invoke;
    objc_super v15 = &unk_1E6B5F800;
    CGRect v16 = self;
    id v6 = &v12;
  }
  objc_msgSend(v5, "animateWithDuration:animations:", v6, 0.2, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t __60__PLPlatterActionButton__handleHoverGestureRecognizerEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:1];
}

uint64_t __60__PLPlatterActionButton__handleHoverGestureRecognizerEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:0];
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (NSString)title
{
  return self->_title;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)backgroundMaterialRecipe
{
  return self->_backgroundMaterialRecipe;
}

- (UIColor)backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setFontProvider:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (MTVisualStylingProvider)titleLabelVisualStylingProvider
{
  return self->_titleLabelVisualStylingProvider;
}

- (void)setTitleLabelVisualStylingProvider:(id)a3
{
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_titleLabelVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_backgroundTintColoringView, 0);
}

@end