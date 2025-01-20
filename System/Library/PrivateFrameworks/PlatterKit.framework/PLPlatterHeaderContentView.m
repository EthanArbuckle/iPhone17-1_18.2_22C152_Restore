@interface PLPlatterHeaderContentView
+ (double)contentBaselineToBoundsBottomWithWidth:(double)a3 scale:(double)a4;
+ (id)_titleLabelFontFromFontProvider:(id)a3;
- (BOOL)_usesLargeTextLayout;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)heedsHorizontalLayoutMargins;
- (BOOL)isDateAllDay;
- (BSUIFontProvider)_fontProvider;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)iconButtons;
- (NSArray)icons;
- (NSArray)requiredVisualStyleCategories;
- (NSDate)date;
- (NSString)preferredContentSizeCategory;
- (NSString)title;
- (NSTimeZone)timeZone;
- (PLPlatterHeaderContentView)init;
- (UIButton)utilityButton;
- (UIFont)_dateLabelFont;
- (UIFont)_titleLabelFont;
- (UILabel)_dateLabel;
- (UIView)utilityView;
- (double)_headerHeightForWidth:(double)a3;
- (double)_iconDimension;
- (double)_iconLeadingPadding;
- (double)_iconTrailingPadding;
- (double)_utilityButtonHorizontalLayoutReference;
- (double)contentBaseline;
- (id)_attributedStringForTitle:(id)a3;
- (id)_dateLabelPreferredFont;
- (id)_layoutManager;
- (id)_lazyTitleLabel;
- (id)_newIconButton;
- (id)_newTitleLabel;
- (id)_titleLabelPreferredFont;
- (id)_updateTitleAttributesForAttributedString:(id)a3;
- (id)_utilityButton;
- (id)visualStylingProvider;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)dateFormatStyle;
- (void)_configureDateLabel;
- (void)_configureDateLabelIfNecessary;
- (void)_configureIconButton:(id)a3 withIcon:(id)a4;
- (void)_configureIconButtonsForIcons:(id)a3;
- (void)_configureTitleLabel:(id)a3;
- (void)_configureUtilityButton;
- (void)_configureUtilityButtonIfNecessary;
- (void)_darkerSystemColorsStatusDidChange:(id)a3;
- (void)_layoutDateLabelWithScale:(double)a3;
- (void)_layoutIconButtonsWithScale:(double)a3;
- (void)_layoutTitleLabelWithScale:(double)a3;
- (void)_layoutUtilityButtonWithScale:(double)a3;
- (void)_recycleDateLabel;
- (void)_reduceTransparencyStatusDidChange:(id)a3;
- (void)_setFontProvider:(id)a3;
- (void)_setTitleLabel:(id)a3;
- (void)_setUsesLargeTextLayout:(BOOL)a3;
- (void)_setUtilityButtonHorizontalLayoutReference:(double)a3;
- (void)_tearDownDateLabel;
- (void)_updateStylingForTitleLabel:(id)a3;
- (void)_updateTextAttributesForDateLabel;
- (void)_updateTextAttributesForTitleLabel:(id)a3;
- (void)_updateUtilityButtonFont;
- (void)_updateUtilityButtonVisualStyling;
- (void)dateLabelDidChange:(id)a3;
- (void)dealloc;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setDateAllDay:(BOOL)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setHeedsHorizontalLayoutMargins:(BOOL)a3;
- (void)setIcons:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUtilityView:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation PLPlatterHeaderContentView

+ (double)contentBaselineToBoundsBottomWithWidth:(double)a3 scale:(double)a4
{
  v7 = [MEMORY[0x1E4F42738] sharedApplication];
  v8 = [v7 preferredContentSizeCategory];

  UIContentSizeCategoryIsAccessibilityCategory(v8);
  v9 = objc_opt_class();
  v10 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  v11 = [a1 _titleLabelFontFromFontProvider:v10];
  [v9 contentBaselineToBoundsBottomWithFont:v11 boundsWidth:a3 scale:a4];
  double v13 = v12;

  return v13;
}

- (PLPlatterHeaderContentView)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLPlatterHeaderContentView;
  v2 = [(PLPlatterHeaderContentView *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_dateFormatStyle = 1;
    [(PLPlatterHeaderContentView *)v2 setPreservesSuperviewLayoutMargins:1];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__darkerSystemColorsStatusDidChange_ name:*MEMORY[0x1E4F43418] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel__reduceTransparencyStatusDidChange_ name:*MEMORY[0x1E4F43480] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43418] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F43480] object:0];

  [(PLPlatterHeaderContentView *)self _recycleDateLabel];
  v5.receiver = self;
  v5.super_class = (Class)PLPlatterHeaderContentView;
  [(PLPlatterHeaderContentView *)&v5 dealloc];
}

- (UILabel)_dateLabel
{
  return (UILabel *)self->_dateLabel;
}

- (BSUIFontProvider)_fontProvider
{
  if (!self->_fontProvider)
  {
    if ([(PLPlatterHeaderContentView *)self adjustsFontForContentSizeCategory]) {
      [MEMORY[0x1E4F4F8B8] preferredFontProvider];
    }
    else {
    v3 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    }
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;
  }
  objc_super v5 = self->_fontProvider;
  return v5;
}

- (id)_layoutManager
{
  layoutManager = self->_layoutManager;
  if (!layoutManager)
  {
    [(PLPlatterHeaderContentView *)self _usesLargeTextLayout];
    v4 = (PLPlatterHeaderContentViewLayoutManager *)[objc_alloc((Class)objc_opt_class()) initWithPlatterHeaderContentView:self];
    objc_super v5 = self->_layoutManager;
    self->_layoutManager = v4;

    layoutManager = self->_layoutManager;
  }
  return layoutManager;
}

- (void)_setUsesLargeTextLayout:(BOOL)a3
{
  if (self->_usesLargeTextLayout != a3)
  {
    self->_usesLargeTextLayout = a3;
    self->_layoutManager = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[PLPlatterHeaderContentView _headerHeightForWidth:](self, "_headerHeightForWidth:", a3.width, a3.height);
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (NSArray)icons
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_iconButtons count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v3)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      double v4 = self->_iconButtons;
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "imageForState:", 0, (void)v11);
            [v3 addObject:v9];
          }
          uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
    }
  }
  else
  {
    id v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)_configureIconButtonsForIcons:(id)a3
{
  id v16 = a3;
  if ([v16 count]) {
    double v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    double v4 = 0;
  }
  uint64_t v5 = [v16 count];
  p_iconButtons = &self->_iconButtons;
  if (v5 | [(NSArray *)self->_iconButtons count])
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = [v16 count];
      unint64_t v9 = [(NSArray *)*p_iconButtons count];
      if (v7 >= v8)
      {
        if (v7 >= v9)
        {
          id v10 = 0;
        }
        else
        {
          id v10 = [(NSArray *)*p_iconButtons objectAtIndex:v7];
        }
        [v10 removeFromSuperview];
      }
      else
      {
        if (v7 >= v9
          || ([(NSArray *)*p_iconButtons objectAtIndex:v7],
              (id v10 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        {
          id v10 = [(PLPlatterHeaderContentView *)self _newIconButton];
          [(PLPlatterHeaderContentView *)self addSubview:v10];
        }
        long long v11 = [v16 objectAtIndex:v7];
        [(PLPlatterHeaderContentView *)self _configureIconButton:v10 withIcon:v11];
        [(NSArray *)v4 addObject:v10];
      }
      ++v7;
      unint64_t v12 = [v16 count];
      p_iconButtons = &self->_iconButtons;
      NSUInteger v13 = [(NSArray *)self->_iconButtons count];
      if (v12 <= v13) {
        NSUInteger v14 = v13;
      }
      else {
        NSUInteger v14 = v12;
      }
    }
    while (v7 < v14);
  }
  v15 = *p_iconButtons;
  *p_iconButtons = v4;
}

- (void)setIcons:(id)a3
{
  iconButtons = self->_iconButtons;
  id v5 = a3;
  uint64_t v6 = [(NSArray *)iconButtons count];
  [(PLPlatterHeaderContentView *)self _configureIconButtonsForIcons:v5];

  if (v6 != [(NSArray *)self->_iconButtons count])
  {
    titleLabel = self->_titleLabel;
    [(PLPlatterHeaderContentView *)self _updateTextAttributesForTitleLabel:titleLabel];
  }
}

- (NSString)title
{
  v2 = [(PLPlatterHeaderContentView *)self _titleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

+ (id)_titleLabelFontFromFontProvider:(id)a3
{
  return (id)[a3 preferredFontForTextStyle:*MEMORY[0x1E4F43890] hiFontStyle:8];
}

- (id)_titleLabelPreferredFont
{
  id v3 = objc_opt_class();
  double v4 = [(PLPlatterHeaderContentView *)self _fontProvider];
  id v5 = [v3 _titleLabelFontFromFontProvider:v4];

  return v5;
}

- (UIFont)_titleLabelFont
{
  id v3 = [(UILabel *)self->_titleLabel attributedText];
  if ([v3 length]) {
    [(UILabel *)self->_titleLabel font];
  }
  else {
  double v4 = [(PLPlatterHeaderContentView *)self _titleLabelPreferredFont];
  }

  return (UIFont *)v4;
}

- (void)_updateTextAttributesForTitleLabel:(id)a3
{
  id v7 = a3;
  double v4 = [v7 attributedText];
  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = [(PLPlatterHeaderContentView *)self _updateTitleAttributesForAttributedString:v5];
  [v7 setAttributedText:v6];

  objc_msgSend(v7, "setNumberOfLines:", -[PLPlatterHeaderContentView _usesLargeTextLayout](self, "_usesLargeTextLayout") ^ 1);
}

- (id)_newTitleLabel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v2 _setOverallWritingDirectionFollowsLayoutDirection:1];
  return v2;
}

- (id)_lazyTitleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    double v4 = [(PLPlatterHeaderContentView *)self _newTitleLabel];
    id v5 = self->_titleLabel;
    self->_titleLabel = v4;

    [(PLPlatterHeaderContentView *)self addSubview:self->_titleLabel];
    [(PLPlatterHeaderContentView *)self _configureTitleLabel:self->_titleLabel];
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (void)setTitle:(id)a3
{
  double v4 = (__CFString *)a3;
  if (!v4) {
    double v4 = @" ";
  }
  id v10 = v4;
  id v5 = [(PLPlatterHeaderContentView *)self title];
  char v6 = [(__CFString *)v10 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = [(PLPlatterHeaderContentView *)self _layoutManager];
    [v7 invalidateCachedSizeInfo];

    unint64_t v8 = [(PLPlatterHeaderContentView *)self _lazyTitleLabel];
    unint64_t v9 = [(PLPlatterHeaderContentView *)self _attributedStringForTitle:v10];
    [v8 setAttributedText:v9];

    [(PLPlatterHeaderContentView *)self setNeedsLayout];
    self->_hasUpdatedContent = 1;
    if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
    {
      self->_hasUpdatedContent = 0;
      objc_msgSend(v8, "pl_performCrossFadeIfNecessary");
    }
  }
}

- (id)_attributedStringForTitle:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4];
    char v6 = [(PLPlatterHeaderContentView *)self _updateTitleAttributesForAttributedString:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_updateTitleAttributesForAttributedString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(PLPlatterHeaderContentView *)self _usesLargeTextLayout];
    if (v5) {
      float v6 = 0.45;
    }
    else {
      float v6 = 0.0;
    }
    if (v5) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = 4;
    }
    unint64_t v8 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
    unint64_t v9 = (void *)[v8 mutableCopy];

    unint64_t v10 = [(NSArray *)self->_iconButtons count];
    [(PLPlatterHeaderContentView *)self _iconDimension];
    double v12 = v11;
    [(PLPlatterHeaderContentView *)self _iconLeadingPadding];
    unint64_t v14 = v10 - 1;
    if (!v10) {
      unint64_t v14 = 0;
    }
    double v15 = v13 * (double)v14 + v12 * (double)v10;
    if (v10) {
      [(PLPlatterHeaderContentView *)self _iconTrailingPadding];
    }
    else {
      double v16 = 0.0;
    }
    [v9 setFirstLineHeadIndent:v15 + v16];
    [v9 setLineBreakMode:v7];
    *(float *)&double v17 = v6;
    [v9 setHyphenationFactor:v17];
    objc_msgSend(v4, "addAttribute:value:range:", *MEMORY[0x1E4F42540], v9, 0, objc_msgSend(v4, "length"));
    uint64_t v18 = *MEMORY[0x1E4F42508];
    v19 = [(PLPlatterHeaderContentView *)self _titleLabelPreferredFont];
    objc_msgSend(v4, "addAttribute:value:range:", v18, v19, 0, objc_msgSend(v4, "length"));
  }
  return v4;
}

- (void)_updateTextAttributesForDateLabel
{
  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    [(BSUIDateLabel *)dateLabel setAdjustsFontSizeToFitWidth:[(PLPlatterHeaderContentView *)self _usesLargeTextLayout]];
    id v4 = self->_dateLabel;
    BOOL v5 = [(PLPlatterHeaderContentView *)self _dateLabelPreferredFont];
    [(BSUIDateLabel *)v4 setFont:v5];

    [(BSUIDateLabel *)self->_dateLabel setNumberOfLines:1];
    float v6 = self->_dateLabel;
    [(BSUIDateLabel *)v6 setLineBreakMode:3];
  }
}

- (UIFont)_dateLabelFont
{
  id v3 = [(BSUIDateLabel *)self->_dateLabel font];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PLPlatterHeaderContentView *)self _dateLabelPreferredFont];
  }
  float v6 = v5;

  return (UIFont *)v6;
}

- (id)_dateLabelPreferredFont
{
  id v2 = [(PLPlatterHeaderContentView *)self _fontProvider];
  id v3 = [v2 preferredFontForTextStyle:*MEMORY[0x1E4F43890] hiFontStyle:1];

  return v3;
}

- (void)_configureDateLabelIfNecessary
{
  if (!self->_dateLabel)
  {
    if (self->_date) {
      [(PLPlatterHeaderContentView *)self _configureDateLabel];
    }
  }
}

- (void)_recycleDateLabel
{
  [(BSUIDateLabel *)self->_dateLabel setDelegate:0];
  [(MTVisualStylingProvider *)self->_visualStylingProvider stopAutomaticallyUpdatingView:self->_dateLabel];
  [(BSUIDateLabel *)self->_dateLabel mt_removeAllVisualStyling];
  id v3 = +[PLPlatterHeaderViewDateLabelFactory sharedInstance];
  [v3 recycleLabel:self->_dateLabel];
}

- (void)_tearDownDateLabel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__PLPlatterHeaderContentView__tearDownDateLabel__block_invoke;
  v2[3] = &unk_1E6B5F800;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v2];
}

void __48__PLPlatterHeaderContentView__tearDownDateLabel__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 408);
  if (v2)
  {
    [v2 removeFromSuperview];
    [*(id *)(a1 + 32) _recycleDateLabel];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 408);
    *(void *)(v3 + 408) = 0;
  }
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (NSDate *)[v6 copy];
    date = self->_date;
    self->_date = v4;

    [(PLPlatterHeaderContentView *)self _tearDownDateLabel];
    [(PLPlatterHeaderContentView *)self setNeedsLayout];
  }
}

- (void)setDateAllDay:(BOOL)a3
{
  if (self->_dateAllDay != a3)
  {
    self->_dateAllDay = a3;
    [(PLPlatterHeaderContentView *)self _tearDownDateLabel];
    [(PLPlatterHeaderContentView *)self setNeedsLayout];
  }
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    [(PLPlatterHeaderContentView *)self _tearDownDateLabel];
    [(PLPlatterHeaderContentView *)self setNeedsLayout];
  }
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (NSTimeZone *)[v6 copy];
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    [(PLPlatterHeaderContentView *)self _tearDownDateLabel];
    [(PLPlatterHeaderContentView *)self setNeedsLayout];
  }
}

- (UIButton)utilityButton
{
  [(PLPlatterHeaderContentView *)self _configureUtilityButtonIfNecessary];
  utilityButton = self->_utilityButton;
  return utilityButton;
}

- (void)setUtilityView:(id)a3
{
  id v5 = (UIView *)a3;
  utilityView = self->_utilityView;
  if (utilityView != v5)
  {
    uint64_t v7 = v5;
    [(UIView *)utilityView removeFromSuperview];
    objc_storeStrong((id *)&self->_utilityView, a3);
    [(PLPlatterHeaderContentView *)self addSubview:self->_utilityView];
    utilityView = (UIView *)[(PLPlatterHeaderContentView *)self setNeedsLayout];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](utilityView, v5);
}

- (double)contentBaseline
{
  if ([(PLPlatterHeaderContentView *)self _usesLargeTextLayout])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__PLPlatterHeaderContentView_contentBaseline__block_invoke;
    v7[3] = &unk_1E6B5F800;
    v7[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v7];
  }
  uint64_t v3 = [(PLPlatterHeaderContentView *)self _layoutManager];
  [v3 contentBaseline];
  double v5 = v4;

  return v5;
}

uint64_t __45__PLPlatterHeaderContentView_contentBaseline__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updateUtilityButtonFont
{
  utilityButton = self->_utilityButton;
  if (utilityButton)
  {
    id v6 = [(UIButton *)utilityButton titleLabel];
    double v4 = [(PLPlatterHeaderContentView *)self _fontProvider];
    double v5 = [v4 preferredFontForTextStyle:*MEMORY[0x1E4F43890] hiFontStyle:1];
    [v6 setFont:v5];
  }
}

- (void)layoutMarginsDidChange
{
  if (self->_heedsHorizontalLayoutMargins) {
    [(PLPlatterHeaderContentView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PLPlatterHeaderContentView;
  [(PLPlatterHeaderContentView *)&v8 layoutSubviews];
  [(PLPlatterHeaderContentView *)self _configureDateLabelIfNecessary];
  uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];
  double v5 = v4;

  [(PLPlatterHeaderContentView *)self _layoutIconButtonsWithScale:v5];
  id v6 = [(PLPlatterHeaderContentView *)self _utilityButton];

  if (v6) {
    [(PLPlatterHeaderContentView *)self _layoutUtilityButtonWithScale:v5];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PLPlatterHeaderContentView_layoutSubviews__block_invoke;
  v7[3] = &unk_1E6B5FAC8;
  v7[4] = self;
  *(double *)&void v7[5] = v5;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v7];
  if (self->_hasUpdatedContent)
  {
    self->_hasUpdatedContent = 0;
    [(UILabel *)self->_titleLabel pl_performCrossFadeIfNecessary];
  }
}

uint64_t __44__PLPlatterHeaderContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutDateLabelWithScale:*(double *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  return [v2 _layoutTitleLabelWithScale:v3];
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (a3 == 1) {
    return self->_visualStylingProvider;
  }
  else {
    return 0;
  }
}

- (id)visualStylingProvider
{
  return [(PLPlatterHeaderContentView *)self visualStylingProviderForCategory:1];
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F3358E78;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  uint64_t v7 = (MTVisualStylingProvider *)a3;
  if (a4 == 1 && self->_visualStylingProvider != v7)
  {
    objc_super v8 = v7;
    [(MTVisualStylingProvider *)v7 stopAutomaticallyUpdatingView:self->_titleLabel];
    [(MTVisualStylingProvider *)v8 stopAutomaticallyUpdatingView:self->_dateLabel];
    [(MTVisualStylingProvider *)v8 stopAutomaticallyUpdatingView:self->_utilityButton];
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    [(PLPlatterHeaderContentView *)self _updateStylingForTitleLabel:self->_titleLabel];
    [(PLPlatterHeaderContentView *)self _tearDownDateLabel];
    [(PLPlatterHeaderContentView *)self _updateUtilityButtonVisualStyling];
    [(PLPlatterHeaderContentView *)self setNeedsLayout];
    uint64_t v7 = v8;
  }
}

- (void)setVisualStylingProvider:(id)a3
{
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(PLPlatterHeaderContentView *)self adjustForContentSizeCategoryChange];
  }
}

- (NSString)preferredContentSizeCategory
{
  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E4F437D0]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }
  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  double v3 = [MEMORY[0x1E4F42738] sharedApplication];
  double v4 = [v3 preferredContentSizeCategory];

  double v5 = [(PLPlatterHeaderContentView *)self preferredContentSizeCategory];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    fontProvider = self->_fontProvider;
    self->_fontProvider = 0;

    [(PLPlatterHeaderContentView *)self setPreferredContentSizeCategory:v4];
    [(PLPlatterHeaderContentView *)self _setUsesLargeTextLayout:UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4)];
    objc_super v8 = [(PLPlatterHeaderContentView *)self _layoutManager];
    [v8 invalidateCachedSizeInfo];

    unint64_t v9 = [(PLPlatterHeaderContentView *)self _titleLabel];
    [(PLPlatterHeaderContentView *)self _updateTextAttributesForTitleLabel:v9];

    [(PLPlatterHeaderContentView *)self _updateTextAttributesForDateLabel];
    [(PLPlatterHeaderContentView *)self _updateUtilityButtonFont];
    [(PLPlatterHeaderContentView *)self setNeedsLayout];
  }

  return v6 ^ 1;
}

- (void)dateLabelDidChange:(id)a3
{
  if (![(PLPlatterHeaderContentView *)self _usesLargeTextLayout])
  {
    [(BSUIDateLabel *)self->_dateLabel sizeToFit];
    [(PLPlatterHeaderContentView *)self setNeedsLayout];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isDateAllDay
{
  return self->_dateAllDay;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (NSArray)iconButtons
{
  return self->_iconButtons;
}

- (UIView)utilityView
{
  return self->_utilityView;
}

- (BOOL)heedsHorizontalLayoutMargins
{
  return self->_heedsHorizontalLayoutMargins;
}

- (void)setHeedsHorizontalLayoutMargins:(BOOL)a3
{
  self->_heedsHorizontalLayoutMargins = a3;
}

- (void)_setFontProvider:(id)a3
{
}

- (void)_setTitleLabel:(id)a3
{
}

- (BOOL)_usesLargeTextLayout
{
  return self->_usesLargeTextLayout;
}

- (double)_utilityButtonHorizontalLayoutReference
{
  return self->_utilityButtonHorizontalLayoutReference;
}

- (void)_setUtilityButtonHorizontalLayoutReference:(double)a3
{
  self->_utilityButtonHorizontalLayoutReference = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_utilityView, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_utilityButton, 0);
  objc_storeStrong((id *)&self->_iconButtons, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

- (void)_configureUtilityButtonIfNecessary
{
  if (!self->_utilityButton) {
    [(PLPlatterHeaderContentView *)self _configureUtilityButton];
  }
}

- (id)_utilityButton
{
  return self->_utilityButton;
}

- (double)_iconDimension
{
  return 20.0;
}

- (double)_iconLeadingPadding
{
  return 10.0;
}

- (double)_iconTrailingPadding
{
  return 7.0;
}

- (double)_headerHeightForWidth:(double)a3
{
  double v4 = [(PLPlatterHeaderContentView *)self _layoutManager];
  [v4 headerHeightForWidth:a3];
  double v6 = v5;

  return v6;
}

- (id)_newIconButton
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F427E0]);
  [v2 setContentMode:4];
  [v2 setAdjustsImageWhenHighlighted:0];
  return v2;
}

- (void)_configureIconButton:(id)a3 withIcon:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  [v8 setImage:v5 forState:0];
  char v6 = [v5 isSymbolImage];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F428B8] labelColor];
    [v8 setTintColor:v7];
  }
  else
  {
    [v8 setTintColor:0];
  }
}

- (void)_updateStylingForTitleLabel:(id)a3
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    id v6 = a3;
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](visualStylingProvider, "automaticallyUpdateView:withStyle:");
  }
  else
  {
    double v4 = (void *)MEMORY[0x1E4F428B8];
    id v5 = a3;
    id v6 = [v4 blackColor];
    objc_msgSend(v5, "setTextColor:");
  }
}

- (void)_configureTitleLabel:(id)a3
{
  id v4 = a3;
  [(PLPlatterHeaderContentView *)self _updateTextAttributesForTitleLabel:v4];
  [(PLPlatterHeaderContentView *)self _updateStylingForTitleLabel:v4];
}

- (void)_configureDateLabel
{
  double v3 = +[PLPlatterHeaderViewDateLabelFactory sharedInstance];
  id v4 = [v3 startLabelWithStartDate:self->_date endDate:0 timeZone:self->_timeZone allDay:self->_dateAllDay forStyle:BSUIDateFormatStyleFromPLDateFormatStyle(self->_dateFormatStyle)];
  dateLabel = self->_dateLabel;
  self->_dateLabel = v4;

  [(BSUIDateLabel *)self->_dateLabel setDelegate:self];
  [(PLPlatterHeaderContentView *)self addSubview:self->_dateLabel];
  [(PLPlatterHeaderContentView *)self _updateTextAttributesForDateLabel];
  visualStylingProvider = self->_visualStylingProvider;
  uint64_t v7 = self->_dateLabel;
  if (visualStylingProvider)
  {
    [(MTVisualStylingProvider *)visualStylingProvider automaticallyUpdateView:v7 withStyle:1];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F428B8] blackColor];
    [(BSUIDateLabel *)v7 setTextColor:v8];
  }
}

- (void)_updateUtilityButtonVisualStyling
{
  if (self->_visualStylingProvider)
  {
    objc_initWeak(&location, self->_utilityButton);
    visualStylingProvider = self->_visualStylingProvider;
    id v4 = [(UIButton *)self->_utilityButton titleLabel];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    unint64_t v9 = __73__PLPlatterHeaderContentView_Subclass___updateUtilityButtonVisualStyling__block_invoke;
    unint64_t v10 = &unk_1E6B5FBB8;
    objc_copyWeak(&v11, &location);
    [(MTVisualStylingProvider *)visualStylingProvider automaticallyUpdateView:v4 withStyle:1 andObserverBlock:&v7];

    id v5 = self->_visualStylingProvider;
    id v6 = [(UIButton *)self->_utilityButton imageView];
    [(MTVisualStylingProvider *)v5 automaticallyUpdateView:v6 withStyle:1];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

id __73__PLPlatterHeaderContentView_Subclass___updateUtilityButtonVisualStyling__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__PLPlatterHeaderContentView_Subclass___updateUtilityButtonVisualStyling__block_invoke_2;
  v5[3] = &unk_1E6B5FB90;
  id v6 = WeakRetained;
  id v2 = WeakRetained;
  double v3 = (void *)MEMORY[0x1D948D440](v5);

  return v3;
}

void __73__PLPlatterHeaderContentView_Subclass___updateUtilityButtonVisualStyling__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_visualStylingForContinuallyUpdatedView:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = [v6 color];
  [*(id *)(a1 + 32) setTitleColor:v3 forState:0];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 colorWithAlphaComponent:0.7];
  [v4 setTitleColor:v5 forState:1];

  [*(id *)(a1 + 32) setTintColor:v3];
}

- (void)_configureUtilityButton
{
  double v3 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  utilityButton = self->_utilityButton;
  self->_utilityButton = v3;

  [(PLPlatterHeaderContentView *)self addSubview:self->_utilityButton];
  [(PLPlatterHeaderContentView *)self _updateUtilityButtonFont];
  [(PLPlatterHeaderContentView *)self _updateUtilityButtonVisualStyling];
}

- (void)_layoutIconButtonsWithScale:(double)a3
{
  id v4 = [(PLPlatterHeaderContentView *)self _layoutManager];
  [v4 layoutIconButtonsWithScale:a3];
}

- (void)_layoutTitleLabelWithScale:(double)a3
{
  id v5 = [(PLPlatterHeaderContentView *)self _titleLabel];
  if (v5)
  {
    id v22 = v5;
    dateLabel = self->_dateLabel;
    if (!dateLabel) {
      dateLabel = self->_utilityButton;
    }
    id v7 = dateLabel;
    [v7 alpha];
    if (v8 <= 0.0) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = v7;
    }
    id v10 = v9;

    if ([(PLPlatterHeaderContentView *)self _shouldReverseLayoutDirection])
    {
      if (v10)
      {
        [v10 frame];
LABEL_15:
        double MaxX = CGRectGetMaxX(*(CGRect *)&v11);
        goto LABEL_16;
      }
      [(PLPlatterHeaderContentView *)self bounds];
    }
    else
    {
      if (!v10)
      {
        [(PLPlatterHeaderContentView *)self bounds];
        goto LABEL_15;
      }
      [v10 frame];
    }
    double MaxX = CGRectGetMinX(*(CGRect *)&v15);
LABEL_16:
    double v20 = MaxX;
    v21 = [(PLPlatterHeaderContentView *)self _layoutManager];
    [v21 layoutTitleLabelWithTrailingXLimit:v20 scale:a3];

    id v5 = v22;
  }
}

- (void)_layoutUtilityButtonWithScale:(double)a3
{
  id v4 = [(PLPlatterHeaderContentView *)self _layoutManager];
  [v4 layoutUtilityButtonWithScale:a3];
}

- (void)_layoutDateLabelWithScale:(double)a3
{
  if (self->_dateLabel)
  {
    id v4 = [(PLPlatterHeaderContentView *)self _layoutManager];
    [v4 layoutDateLabelWithScale:a3];
  }
}

- (void)_darkerSystemColorsStatusDidChange:(id)a3
{
  if (self->_titleLabel) {
    -[PLPlatterHeaderContentView _updateStylingForTitleLabel:](self, "_updateStylingForTitleLabel:");
  }
}

- (void)_reduceTransparencyStatusDidChange:(id)a3
{
  if (self->_titleLabel) {
    -[PLPlatterHeaderContentView _updateStylingForTitleLabel:](self, "_updateStylingForTitleLabel:");
  }
}

@end