@interface NCNotificationSummaryContentView
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isIconViewLeading;
- (BOOL)isSummaryLabelMaterialSecondary;
- (CGRect)_adjustedRectForLabelLayoutFromRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationSummaryContentView)initWithFrame:(CGRect)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSArray)summaryIconViews;
- (NSDate)summaryDate;
- (NSString)preferredContentSizeCategory;
- (NSString)summary;
- (NSString)summaryIconSymbolName;
- (NSString)summaryTitle;
- (NSString)summaryTitleFontName;
- (double)_widthForIconsContainerView;
- (double)horizontalLeadingMargin;
- (double)horizontalTrailingMargin;
- (id)_dateLabelFont;
- (id)_dateLabelPreferredFont;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)_dateFormatStyleForDate:(id)a3;
- (unint64_t)_maximumNumberOfLinesForSummaryText;
- (unint64_t)_maximumNumberOfLinesForSummaryTitleText;
- (unint64_t)_numberOfLinesForSummaryTextInFrame:(CGRect)a3;
- (unint64_t)_numberOfLinesForSummaryTitleTextInFrame:(CGRect)a3;
- (void)_addShadowForIconView:(id)a3;
- (void)_layoutSummaryDateLabel;
- (void)_layoutSummaryIconsView;
- (void)_layoutSummaryLabel;
- (void)_layoutSummaryTitleLabel;
- (void)_recycleDateLabel;
- (void)_tearDownDateLabelIfNecessary;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForDateLabel;
- (void)_updateTextAttributesForSummaryLabel;
- (void)_updateTextAttributesForSummaryTitleLabel;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_updateVisualStylingProvidersForIconViewIfNecessary:(id)a3;
- (void)_updateVisualStylingProvidersForIconViewsIfNecessary;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)dateLabelDidChange:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setHorizontalLeadingMargin:(double)a3;
- (void)setHorizontalTrailingMargin:(double)a3;
- (void)setIconViewLeading:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryDate:(id)a3;
- (void)setSummaryIconSymbolName:(id)a3;
- (void)setSummaryIconViews:(id)a3;
- (void)setSummaryLabelMaterialSecondary:(BOOL)a3;
- (void)setSummaryTitle:(id)a3;
- (void)setSummaryTitleFontName:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation NCNotificationSummaryContentView

- (NCNotificationSummaryContentView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationSummaryContentView;
  v3 = -[NCNotificationSummaryContentView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_adjustsFontForContentSizeCategory = 1;
    v5 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    uint64_t v6 = [v5 preferredContentSizeCategory];
    preferredContentSizeCategory = v4->_preferredContentSizeCategory;
    v4->_preferredContentSizeCategory = (NSString *)v6;
  }
  return v4;
}

- (void)setSummaryLabelMaterialSecondary:(BOOL)a3
{
  if (self->_summaryLabelMaterialSecondary != a3)
  {
    self->_summaryLabelMaterialSecondary = a3;
    summaryLabel = self->_summaryLabel;
    if (summaryLabel)
    {
      uint64_t v5 = [(NCNotificationSummaryContentView *)self isSummaryLabelMaterialSecondary];
      id v6 = [(NCNotificationSummaryContentView *)self visualStylingProviderForCategory:1];
      [(NCNotificationSummaryContentView *)self _updateVisualStylingOfView:summaryLabel style:v5 visualStylingProvider:v6 outgoingProvider:0];
    }
  }
}

- (NSString)summaryTitle
{
  return [(UILabel *)self->_summaryTitleLabel text];
}

- (void)setSummaryTitle:(id)a3
{
  id v13 = a3;
  v4 = [(NCNotificationSummaryContentView *)self summaryTitle];
  char v5 = BSEqualStrings();

  id v6 = v13;
  if ((v5 & 1) == 0)
  {
    summaryTitleLabel = self->_summaryTitleLabel;
    if (v13)
    {
      if (!summaryTitleLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        objc_super v9 = self->_summaryTitleLabel;
        self->_summaryTitleLabel = v8;

        [(UILabel *)self->_summaryTitleLabel setLineBreakMode:4];
        [(NCNotificationSummaryContentView *)self addSubview:self->_summaryTitleLabel];
        [(NCNotificationSummaryContentView *)self _updateTextAttributesForSummaryTitleLabel];
        v10 = self->_summaryTitleLabel;
        v11 = [(NCNotificationSummaryContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationSummaryContentView *)self _updateVisualStylingOfView:v10 style:0 visualStylingProvider:v11 outgoingProvider:0];

        id v6 = v13;
        summaryTitleLabel = self->_summaryTitleLabel;
      }
      [(UILabel *)summaryTitleLabel setText:v6];
    }
    else
    {
      [(UILabel *)summaryTitleLabel removeFromSuperview];
      v12 = self->_summaryTitleLabel;
      self->_summaryTitleLabel = 0;
    }
    [(NCNotificationSummaryContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (NSString)summary
{
  return [(UILabel *)self->_summaryLabel text];
}

- (void)setSummary:(id)a3
{
  id v14 = a3;
  v4 = [(NCNotificationSummaryContentView *)self summary];
  char v5 = BSEqualStrings();

  id v6 = v14;
  if ((v5 & 1) == 0)
  {
    summaryLabel = self->_summaryLabel;
    if (v14)
    {
      if (!summaryLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        objc_super v9 = self->_summaryLabel;
        self->_summaryLabel = v8;

        [(UILabel *)self->_summaryLabel setLineBreakMode:4];
        [(NCNotificationSummaryContentView *)self addSubview:self->_summaryLabel];
        [(NCNotificationSummaryContentView *)self _updateTextAttributesForSummaryLabel];
        v10 = self->_summaryLabel;
        uint64_t v11 = [(NCNotificationSummaryContentView *)self isSummaryLabelMaterialSecondary];
        v12 = [(NCNotificationSummaryContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationSummaryContentView *)self _updateVisualStylingOfView:v10 style:v11 visualStylingProvider:v12 outgoingProvider:0];

        id v6 = v14;
        summaryLabel = self->_summaryLabel;
      }
      [(UILabel *)summaryLabel setText:v6];
    }
    else
    {
      [(UILabel *)summaryLabel removeFromSuperview];
      id v13 = self->_summaryLabel;
      self->_summaryLabel = 0;
    }
    [(NCNotificationSummaryContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (NSArray)summaryIconViews
{
  return self->_iconViews;
}

- (void)setSummaryIconViews:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(NCNotificationSummaryContentView *)self summaryIconViews];
  char v7 = BSEqualArrays();

  if ((v7 & 1) == 0)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v8 = self->_iconViews;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    summaryIconSymbolImageView = self->_summaryIconSymbolImageView;
    if (summaryIconSymbolImageView)
    {
      [(UIImageView *)summaryIconSymbolImageView removeFromSuperview];
      id v14 = self->_summaryIconSymbolImageView;
      self->_summaryIconSymbolImageView = 0;
    }
    summaryIconSymbolBackgroundView = self->_summaryIconSymbolBackgroundView;
    if (summaryIconSymbolBackgroundView)
    {
      [(UIView *)summaryIconSymbolBackgroundView removeFromSuperview];
      v16 = self->_summaryIconSymbolBackgroundView;
      self->_summaryIconSymbolBackgroundView = 0;
    }
    objc_storeStrong((id *)&self->_iconViews, a3);
    uint64_t v17 = [v5 count];
    summaryIconsContainerView = self->_summaryIconsContainerView;
    if (v17)
    {
      if (!summaryIconsContainerView)
      {
        id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        v20 = (UIView *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v21 = self->_summaryIconsContainerView;
        self->_summaryIconsContainerView = v20;

        [(NCNotificationSummaryContentView *)self addSubview:self->_summaryIconsContainerView];
      }
      iconViews = self->_iconViews;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __56__NCNotificationSummaryContentView_setSummaryIconViews___block_invoke;
      v24[3] = &unk_1E6A93350;
      v24[4] = self;
      [(NSArray *)iconViews enumerateObjectsUsingBlock:v24];
    }
    else
    {
      [(UIView *)summaryIconsContainerView removeFromSuperview];
      v23 = self->_summaryIconsContainerView;
      self->_summaryIconsContainerView = 0;
    }
    [(NCNotificationSummaryContentView *)self setNeedsLayout];
  }
}

void __56__NCNotificationSummaryContentView_setSummaryIconViews___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 432) count] >= 2
    && [*(id *)(*(void *)(a1 + 32) + 432) count] - 1 > a3)
  {
    [*(id *)(a1 + 32) _addShadowForIconView:v5];
  }
  [*(id *)(*(void *)(a1 + 32) + 424) addSubview:v5];
  [*(id *)(a1 + 32) _updateVisualStylingProvidersForIconViewIfNecessary:v5];
}

- (void)setIconViewLeading:(BOOL)a3
{
  self->_iconViewLeading = a3;
  [(NCNotificationSummaryContentView *)self setNeedsLayout];
}

- (void)setSummaryTitleFontName:(id)a3
{
  objc_storeStrong((id *)&self->_summaryTitleFontName, a3);
  [(NCNotificationSummaryContentView *)self _updateTextAttributesForSummaryTitleLabel];

  [(NCNotificationSummaryContentView *)self setNeedsLayout];
}

- (void)setSummaryDate:(id)a3
{
  p_summaryDate = &self->_summaryDate;
  id v13 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    [(NCNotificationSummaryContentView *)self _tearDownDateLabelIfNecessary];
    objc_storeStrong((id *)&self->_summaryDate, a3);
    if (v13)
    {
      id v6 = [MEMORY[0x1E4F4F8A8] sharedInstance];
      char v7 = *p_summaryDate;
      v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      objc_msgSend(v6, "startLabelWithStartDate:endDate:timeZone:allDay:forStyle:", v7, 0, 0, objc_msgSend(v8, "isDateInToday:", v13) ^ 1, 0);
      uint64_t v9 = (BSUIDateLabel *)objc_claimAutoreleasedReturnValue();
      summaryDateLabel = self->_summaryDateLabel;
      self->_summaryDateLabel = v9;

      [(BSUIDateLabel *)self->_summaryDateLabel setDelegate:self];
      [(NCNotificationSummaryContentView *)self addSubview:self->_summaryDateLabel];
      [(NCNotificationSummaryContentView *)self _updateTextAttributesForDateLabel];
      uint64_t v11 = self->_summaryDateLabel;
      v12 = [(NCNotificationSummaryContentView *)self visualStylingProviderForCategory:1];
      [(NCNotificationSummaryContentView *)self _updateVisualStylingOfView:v11 style:1 visualStylingProvider:v12 outgoingProvider:0];
    }
    [(NCNotificationSummaryContentView *)self setNeedsLayout];
  }
}

- (void)setSummaryIconSymbolName:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_summaryIconSymbolName isEqualToString:v4])
  {
    [(UIImageView *)self->_summaryIconSymbolImageView removeFromSuperview];
    summaryIconSymbolImageView = self->_summaryIconSymbolImageView;
    self->_summaryIconSymbolImageView = 0;

    if (v4)
    {
      iconViews = self->_iconViews;
      if (iconViews)
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        char v7 = iconViews;
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v37 != v10) {
                objc_enumerationMutation(v7);
              }
              objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "removeFromSuperview", (void)v36);
            }
            uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
          }
          while (v9);
        }

        v12 = self->_iconViews;
        self->_iconViews = 0;
      }
      if (!self->_summaryIconsContainerView)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        id v14 = (UIView *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        summaryIconsContainerView = self->_summaryIconsContainerView;
        self->_summaryIconsContainerView = v14;

        [(NCNotificationSummaryContentView *)self addSubview:self->_summaryIconsContainerView];
      }
      if (!self->_summaryIconSymbolBackgroundView)
      {
        id v16 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        [(NCNotificationSummaryContentView *)self isIconViewLeading];
        [(NCNotificationSummaryContentView *)self isIconViewLeading];
        BSRectWithSize();
        uint64_t v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
        summaryIconSymbolBackgroundView = self->_summaryIconSymbolBackgroundView;
        self->_summaryIconSymbolBackgroundView = v17;

        id v19 = self->_summaryIconSymbolBackgroundView;
        v20 = [MEMORY[0x1E4FB1618] systemWhiteColor];
        [(UIView *)v19 setBackgroundColor:v20];

        v21 = self->_summaryIconSymbolBackgroundView;
        BOOL v22 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
        double v23 = 20.0;
        if (v22) {
          double v23 = 19.0;
        }
        [(UIView *)v21 _setContinuousCornerRadius:v23];
        [(UIView *)self->_summaryIconsContainerView addSubview:self->_summaryIconSymbolBackgroundView];
        v24 = self->_summaryIconSymbolBackgroundView;
        long long v25 = [(NCNotificationSummaryContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationSummaryContentView *)self _updateVisualStylingOfView:v24 style:3 visualStylingProvider:v25 outgoingProvider:0];
      }
      long long v26 = (void *)MEMORY[0x1E4FB1830];
      BOOL v27 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
      double v28 = 15.2;
      if (!v27) {
        double v28 = 16.0;
      }
      v29 = [v26 configurationWithPointSize:v28];
      uint64_t v30 = [MEMORY[0x1E4FB1818] _systemImageNamed:v4 withConfiguration:v29];
      v31 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v30];
      v32 = self->_summaryIconSymbolImageView;
      self->_summaryIconSymbolImageView = v31;

      v33 = self->_summaryIconSymbolImageView;
      v34 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      [(UIImageView *)v33 setTintColor:v34];

      [(UIImageView *)self->_summaryIconSymbolImageView setContentMode:4];
      [(UIView *)self->_summaryIconsContainerView addSubview:self->_summaryIconSymbolImageView];
    }
    else
    {
      [(UIView *)self->_summaryIconSymbolBackgroundView removeFromSuperview];
      v35 = self->_summaryIconSymbolBackgroundView;
      self->_summaryIconSymbolBackgroundView = 0;
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[NCNotificationSummaryContentView _adjustedRectForLabelLayoutFromRect:](self, "_adjustedRectForLabelLayoutFromRect:", 0.0, 0.0, a3.width, a3.height);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  summaryTitleLabel = self->_summaryTitleLabel;
  if (summaryTitleLabel) {
    -[UILabel unui_measuringHeightWithNumberOfLines:](summaryTitleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTitleTextInFrame:](self, "_numberOfLinesForSummaryTitleTextInFrame:", v4, v5, v6, v7));
  }
  summaryLabel = self->_summaryLabel;
  if (summaryLabel) {
    -[UILabel unui_measuringHeightWithNumberOfLines:](summaryLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTextInFrame:](self, "_numberOfLinesForSummaryTextInFrame:", v8, v9, v10, v11));
  }
  if (UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory)) {
    [(BSUIDateLabel *)self->_summaryDateLabel unui_measuringHeightWithNumberOfLines:1];
  }
  if (self->_summaryIconsContainerView) {
    [(NCNotificationSummaryContentView *)self isIconViewLeading];
  }
  id v14 = [(NCNotificationSummaryContentView *)self traitCollection];
  [v14 displayScale];
  UICeilToScale();

  UISizeRoundToScale();
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryContentView;
  [(NCNotificationSummaryContentView *)&v3 layoutSubviews];
  [(NCNotificationSummaryContentView *)self _layoutSummaryTitleLabel];
  [(NCNotificationSummaryContentView *)self _layoutSummaryDateLabel];
  [(NCNotificationSummaryContentView *)self _layoutSummaryLabel];
  [(NCNotificationSummaryContentView *)self _layoutSummaryIconsView];
}

- (void)didMoveToWindow
{
  objc_super v3 = [(NCNotificationSummaryContentView *)self window];

  if (v3)
  {
    [(NCNotificationSummaryContentView *)self adjustForContentSizeCategoryChange];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  objc_super v3 = [(NCNotificationSummaryContentView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    [(NCNotificationSummaryContentView *)self _updateTextAttributes];
    [(NCNotificationSummaryContentView *)self setNeedsLayout];
  }

  return v5 != NSOrderedSame;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
  {
    double v4 = strokeVisualStylingProvider;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationSummaryContentView;
    double v4 = [(NCNotificationSummaryContentView *)&v6 visualStylingProviderForCategory:a3];
  }

  return v4;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F2F84628;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  objc_super v6 = (MTVisualStylingProvider *)a3;
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider != v6)
  {
    double v11 = v6;
    double v8 = v6;
    double v9 = self->_strokeVisualStylingProvider;
    self->_strokeVisualStylingProvider = v8;
    double v10 = strokeVisualStylingProvider;

    [(NCNotificationSummaryContentView *)self _visualStylingProviderDidChange:self->_strokeVisualStylingProvider forCategory:a4 outgoingProvider:v10];
    objc_super v6 = v11;
  }
}

- (void)dateLabelDidChange:(id)a3
{
  [(BSUIDateLabel *)self->_summaryDateLabel sizeToFit];

  [(NCNotificationSummaryContentView *)self setNeedsLayout];
}

- (void)_layoutSummaryTitleLabel
{
  if (self->_summaryTitleLabel)
  {
    [(NCNotificationSummaryContentView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(UILabel *)self->_summaryTitleLabel frame];
    CGFloat v35 = v6;
    CGFloat v36 = v8;
    CGFloat rect = v10;
    -[NCNotificationSummaryContentView _adjustedRectForLabelLayoutFromRect:](self, "_adjustedRectForLabelLayoutFromRect:", v4, v6, v8, v10);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    summaryDateLabel = self->_summaryDateLabel;
    double v21 = 0.0;
    if (summaryDateLabel && !IsAccessibilityCategory)
    {
      -[BSUIDateLabel sizeThatFits:](summaryDateLabel, "sizeThatFits:", v16, v18);
      double v21 = v22 + 10.0;
    }
    v39.origin.x = v12;
    v39.origin.y = v14;
    v39.size.width = v16;
    v39.size.height = v18;
    double v23 = CGRectGetWidth(v39) - v21;
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_summaryTitleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTitleTextInFrame:](self, "_numberOfLinesForSummaryTitleTextInFrame:", v12, v14, v16, v18));
    CGFloat v25 = v24;
    [(NCNotificationSummaryContentView *)self _widthForIconsContainerView];
    double v27 = v26;
    BOOL v28 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
    int v29 = [(NCNotificationSummaryContentView *)self _shouldReverseLayoutDirection];
    if (v28)
    {
      if (v29)
      {
        v40.origin.x = v4;
        v40.origin.y = v35;
        v40.size.width = v36;
        v40.size.height = rect;
        double v30 = CGRectGetMaxX(v40) - v23 - v27 + -10.0;
      }
      else
      {
        double v30 = v27 + 10.0;
      }
    }
    else if (v29)
    {
      v41.origin.x = v4;
      v41.origin.y = v35;
      v41.size.width = v36;
      v41.size.height = rect;
      CGFloat v31 = CGRectGetMaxX(v41) - v23;
      [(NCNotificationSummaryContentView *)self horizontalLeadingMargin];
      double v30 = v31 - v32;
    }
    else
    {
      [(NCNotificationSummaryContentView *)self horizontalLeadingMargin];
      double v30 = v33;
    }
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_summaryTitleLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTitleTextInFrame:](self, "_numberOfLinesForSummaryTitleTextInFrame:", v12, v14, v16, v18));
    v42.origin.y = 0.0;
    v42.origin.x = v30;
    v42.size.width = v23;
    v42.size.height = v25;
    CGRectGetWidth(v42);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    summaryTitleLabel = self->_summaryTitleLabel;
    -[UILabel setFrame:](summaryTitleLabel, "setFrame:");
  }
}

- (void)_layoutSummaryLabel
{
  if (!self->_summaryLabel) {
    return;
  }
  [(NCNotificationSummaryContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self->_summaryTitleLabel frame];
  CGFloat v39 = v12;
  CGFloat v40 = v11;
  CGFloat v38 = v13;
  CGFloat rect = v14;
  [(UILabel *)self->_summaryLabel frame];
  -[NCNotificationSummaryContentView _adjustedRectForLabelLayoutFromRect:](self, "_adjustedRectForLabelLayoutFromRect:", v4, v6, v8, v10);
  double x = v44.origin.x;
  double y = v44.origin.y;
  double width = v44.size.width;
  double height = v44.size.height;
  double v41 = CGRectGetWidth(v44);
  double v35 = x;
  double v36 = height;
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_summaryLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTextInFrame:](self, "_numberOfLinesForSummaryTextInFrame:", x, y, width, height));
  double v37 = v19;
  [(NCNotificationSummaryContentView *)self _widthForIconsContainerView];
  double v21 = v20;
  BOOL v22 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
  int v23 = [(NCNotificationSummaryContentView *)self _shouldReverseLayoutDirection];
  if (v22)
  {
    if (v23)
    {
      v45.origin.double x = v4;
      v45.origin.double y = v6;
      v45.size.double width = v8;
      v45.size.double height = v10;
      double v24 = CGRectGetMaxX(v45) - v41 - v21 + -10.0;
    }
    else
    {
      double v24 = v21 + 10.0;
    }
  }
  else if (v23)
  {
    v46.origin.double x = v4;
    v46.origin.double y = v6;
    v46.size.double width = v8;
    v46.size.double height = v10;
    CGFloat v25 = CGRectGetMaxX(v46) - v41;
    [(NCNotificationSummaryContentView *)self horizontalLeadingMargin];
    double v24 = v25 - v26;
  }
  else
  {
    [(NCNotificationSummaryContentView *)self horizontalLeadingMargin];
    double v24 = v27;
  }
  if (UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory)
    && (summaryDateLabel = self->_summaryDateLabel) != 0)
  {
    [(BSUIDateLabel *)summaryDateLabel frame];
  }
  else
  {
    CGFloat v29 = v40;
    CGFloat v30 = v39;
    CGFloat v31 = v38;
    CGFloat v32 = rect;
    if (!self->_summaryTitleLabel)
    {
      double v33 = 0.0;
      goto LABEL_16;
    }
  }
  double v33 = CGRectGetMaxY(*(CGRect *)&v29) + 1.0;
LABEL_16:
  -[UILabel unui_drawingHeightWithNumberOfLines:](self->_summaryLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTextInFrame:](self, "_numberOfLinesForSummaryTextInFrame:", v35, y, width, v36));
  v47.origin.double x = v40;
  v47.origin.double y = v39;
  v47.size.double width = v38;
  v47.size.double height = rect;
  CGRectGetWidth(v47);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  summaryLabel = self->_summaryLabel;

  -[UILabel setFrame:](summaryLabel, "setFrame:", v24, v33, v41, v37);
}

- (void)_layoutSummaryIconsView
{
  if ([(NSArray *)self->_iconViews count] || self->_summaryIconSymbolImageView)
  {
    int v3 = [(NCNotificationSummaryContentView *)self _shouldReverseLayoutDirection];
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    double v25 = 0.0;
    double v4 = 0.0;
    if (v3)
    {
      [(NCNotificationSummaryContentView *)self _widthForIconsContainerView];
      double v6 = v5;
      BOOL v7 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
      double v8 = 40.0;
      if (v7) {
        double v8 = 38.0;
      }
      double v4 = v6 - v8;
    }
    double v25 = v4;
    iconViews = self->_iconViews;
    if (iconViews)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __59__NCNotificationSummaryContentView__layoutSummaryIconsView__block_invoke;
      v22[3] = &unk_1E6A94F30;
      v22[4] = self;
      v22[5] = v24;
      char v23 = v3;
      [(NSArray *)iconViews enumerateObjectsUsingBlock:v22];
    }
    else if (self->_summaryIconSymbolImageView)
    {
      BOOL v10 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
      BOOL v11 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
      if (v10) {
        double v12 = 38.0;
      }
      else {
        double v12 = 40.0;
      }
      if (v11) {
        double v13 = 38.0;
      }
      else {
        double v13 = 40.0;
      }
      -[UIImageView setFrame:](self->_summaryIconSymbolImageView, "setFrame:", 0.0, 0.0, v12, v13);
      -[UIView setFrame:](self->_summaryIconSymbolBackgroundView, "setFrame:", 0.0, 0.0, v12, v13);
      [(UIView *)self->_summaryIconsContainerView bringSubviewToFront:self->_summaryIconSymbolImageView];
    }
    [(UIView *)self->_summaryIconsContainerView frame];
    [(NCNotificationSummaryContentView *)self bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    [(NCNotificationSummaryContentView *)self _widthForIconsContainerView];
    if ([(NCNotificationSummaryContentView *)self isIconViewLeading])
    {
      if (v3) {
        goto LABEL_21;
      }
    }
    else if ((v3 & 1) == 0)
    {
LABEL_21:
      v26.origin.double x = v15;
      v26.origin.double y = v17;
      v26.size.double width = v19;
      v26.size.double height = v21;
      CGRectGetMaxX(v26);
    }
    [(NCNotificationSummaryContentView *)self isIconViewLeading];
    UIRectCenteredYInRect();
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_summaryIconsContainerView, "setFrame:");
    _Block_object_dispose(v24, 8);
  }
}

double __59__NCNotificationSummaryContentView__layoutSummaryIconsView__block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = a2;
  if ([v3 isIconViewLeading]) {
    double v6 = 38.0;
  }
  else {
    double v6 = 40.0;
  }
  if ([*(id *)(a1 + 32) isIconViewLeading]) {
    double v7 = 38.0;
  }
  else {
    double v7 = 40.0;
  }
  objc_msgSend(v5, "setFrame:", v4, 0.0, v6, v7);
  [*(id *)(*(void *)(a1 + 32) + 424) sendSubviewToBack:v5];

  int v8 = *(unsigned __int8 *)(a1 + 48);
  int v9 = [*(id *)(a1 + 32) isIconViewLeading];
  int v10 = [*(id *)(a1 + 32) isIconViewLeading];
  if (v8)
  {
    double v11 = 15.2;
    if (!v10) {
      double v11 = 16.0;
    }
    double v12 = 22.8;
    if (!v10) {
      double v12 = 24.0;
    }
    if (!v9) {
      double v11 = v12;
    }
    double v13 = -v11;
  }
  else
  {
    if (v9)
    {
      double v13 = 15.2;
      double v14 = 16.0;
    }
    else
    {
      double v13 = 22.8;
      double v14 = 24.0;
    }
    if (!v10) {
      double v13 = v14;
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v13 + *(double *)(v15 + 24);
  *(double *)(v15 + 24) = result;
  return result;
}

- (void)_layoutSummaryDateLabel
{
  if (self->_summaryDateLabel)
  {
    [(NCNotificationSummaryContentView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(UILabel *)self->_summaryTitleLabel frame];
    CGFloat v12 = v11;
    CGFloat v24 = v13;
    CGFloat v25 = v14;
    CGFloat rect = v15;
    [(BSUIDateLabel *)self->_summaryDateLabel frame];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    -[NCNotificationSummaryContentView _adjustedRectForLabelLayoutFromRect:](self, "_adjustedRectForLabelLayoutFromRect:", v4, v6, v8, v10);
    double v19 = v17;
    double v20 = v18;
    if (!IsAccessibilityCategory)
    {
      -[UILabel sizeThatFits:](self->_summaryTitleLabel, "sizeThatFits:", v17, v18);
      double v19 = v19 - v21 + -10.0;
    }
    -[BSUIDateLabel sizeThatFits:](self->_summaryDateLabel, "sizeThatFits:", v19, v20);
    [(NCNotificationSummaryContentView *)self _widthForIconsContainerView];
    int v22 = [(NCNotificationSummaryContentView *)self _shouldReverseLayoutDirection];
    if (IsAccessibilityCategory)
    {
      if (v22)
      {
        v28.origin.double x = v4;
        v28.origin.double y = v6;
        v28.size.double width = v8;
        v28.size.double height = v10;
        CGRectGetMaxX(v28);
      }
    }
    else if ((v22 & 1) == 0)
    {
      v29.origin.double x = v4;
      v29.origin.double y = v6;
      v29.size.double width = v8;
      v29.size.double height = v10;
      CGRectGetWidth(v29);
    }
    v30.origin.double x = v12;
    v30.origin.double y = v24;
    v30.size.double width = v25;
    v30.size.double height = rect;
    CGRectGetMaxY(v30);
    UIRectIntegralWithScale();
    summaryDateLabel = self->_summaryDateLabel;
    -[BSUIDateLabel setFrame:](summaryDateLabel, "setFrame:");
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4];
  }
}

- (void)_updateVisualStylingProvidersForIconViewIfNecessary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = objc_msgSend(v4, "requiredVisualStyleCategories", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) integerValue];
          double v11 = [(NCNotificationSummaryContentView *)self visualStylingProviderForCategory:v10];
          [v4 setVisualStylingProvider:v11 forCategory:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)_updateVisualStylingProvidersForIconViewsIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = self->_iconViews;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NCNotificationSummaryContentView _updateVisualStylingProvidersForIconViewIfNecessary:](self, "_updateVisualStylingProvidersForIconViewIfNecessary:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  if (a4 == 1)
  {
    summaryLabel = self->_summaryLabel;
    id v9 = a5;
    id v10 = a3;
    [(NCNotificationSummaryContentView *)self _updateVisualStylingOfView:summaryLabel style:[(NCNotificationSummaryContentView *)self isSummaryLabelMaterialSecondary] visualStylingProvider:v10 outgoingProvider:v9];
    [(NCNotificationSummaryContentView *)self _updateVisualStylingOfView:self->_summaryTitleLabel style:0 visualStylingProvider:v10 outgoingProvider:v9];
    [(NCNotificationSummaryContentView *)self _updateVisualStylingOfView:self->_summaryDateLabel style:1 visualStylingProvider:v10 outgoingProvider:v9];
    [(NCNotificationSummaryContentView *)self _updateVisualStylingOfView:self->_summaryIconSymbolBackgroundView style:3 visualStylingProvider:v10 outgoingProvider:v9];

    [(NCNotificationSummaryContentView *)self _updateVisualStylingProvidersForIconViewsIfNecessary];
  }
}

- (void)_updateTextAttributes
{
  [(NCNotificationSummaryContentView *)self _updateTextAttributesForSummaryLabel];
  [(NCNotificationSummaryContentView *)self _updateTextAttributesForSummaryTitleLabel];

  [(NCNotificationSummaryContentView *)self _updateTextAttributesForDateLabel];
}

- (void)_updateTextAttributesForSummaryTitleLabel
{
  if (self->_summaryTitleLabel)
  {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    uint64_t v4 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      uint64_t v4 = (id *)MEMORY[0x1E4FB2950];
    }
    id v5 = *v4;
    uint64_t v6 = [(NCNotificationSummaryContentView *)self summaryTitleFontName];
    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4FB08E0];
      long long v8 = (void *)MEMORY[0x1E4FB08E8];
      uint64_t v9 = [(NCNotificationSummaryContentView *)self traitCollection];
      id v10 = [v8 preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v9];

      [v10 pointSize];
      objc_msgSend(v7, "fontWithName:size:", v6);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      id v5 = (id)v9;
    }
    else
    {
      id v11 = [(id)objc_opt_class() _preferredFont:1 textStyle:v5 weight:0 additionalTraits:*MEMORY[0x1E4FB09E0]];
    }

    [(UILabel *)self->_summaryTitleLabel setFont:v11];
    [(UILabel *)self->_summaryTitleLabel setNumberOfLines:[(NCNotificationSummaryContentView *)self _maximumNumberOfLinesForSummaryTitleText]];
    [(NCNotificationSummaryContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForSummaryLabel
{
  if (self->_summaryLabel)
  {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    uint64_t v4 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      uint64_t v4 = (id *)MEMORY[0x1E4FB2950];
    }
    summaryLabel = self->_summaryLabel;
    id v6 = *v4;
    uint64_t v7 = [(id)objc_opt_class() _preferredFont:1 textStyle:v6 weight:0x8000 additionalTraits:*MEMORY[0x1E4FB09D8]];

    [(UILabel *)summaryLabel setFont:v7];
    [(UILabel *)self->_summaryLabel setNumberOfLines:[(NCNotificationSummaryContentView *)self _maximumNumberOfLinesForSummaryText]];
    [(NCNotificationSummaryContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForDateLabel
{
  summaryDateLabel = self->_summaryDateLabel;
  if (summaryDateLabel)
  {
    uint64_t v4 = [(NCNotificationSummaryContentView *)self _dateLabelPreferredFont];
    [(BSUIDateLabel *)summaryDateLabel setFont:v4];

    [(BSUIDateLabel *)self->_summaryDateLabel setNumberOfLines:1];
    [(BSUIDateLabel *)self->_summaryDateLabel setLineBreakMode:3];
    [(NCNotificationSummaryContentView *)self setNeedsLayout];
  }
}

- (id)_dateLabelFont
{
  double v3 = [(BSUIDateLabel *)self->_summaryDateLabel font];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NCNotificationSummaryContentView *)self _dateLabelPreferredFont];
  }
  id v6 = v5;

  return v6;
}

- (id)_dateLabelPreferredFont
{
  v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x1E4FB28F0];
  double v4 = *MEMORY[0x1E4FB09D8];

  return (id)[v2 _preferredFont:1 textStyle:v3 weight:0 additionalTraits:v4];
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  uint64_t v7 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  uint64_t v16 = *MEMORY[0x1E4FB0950];
  uint64_t v14 = *MEMORY[0x1E4FB09F0];
  long long v8 = [NSNumber numberWithDouble:a5];
  long long v15 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v11 = [v7 fontDescriptorByAddingAttributes:v10];

  long long v12 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (unint64_t)_maximumNumberOfLinesForSummaryTitleText
{
  return !UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
}

- (unint64_t)_numberOfLinesForSummaryTitleTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  summaryTitleLabel = self->_summaryTitleLabel;
  unint64_t v9 = [(NCNotificationSummaryContentView *)self _maximumNumberOfLinesForSummaryTitleText];
  drawingContext = self->_drawingContext;

  return -[UILabel unui_numberOfLinesInFrame:maximum:drawingContext:](summaryTitleLabel, "unui_numberOfLinesInFrame:maximum:drawingContext:", v9, drawingContext, x, y, width, height);
}

- (unint64_t)_maximumNumberOfLinesForSummaryText
{
  if (UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory)) {
    return 0;
  }
  else {
    return 4;
  }
}

- (unint64_t)_numberOfLinesForSummaryTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  summaryLabel = self->_summaryLabel;
  unint64_t v9 = [(NCNotificationSummaryContentView *)self _maximumNumberOfLinesForSummaryText];
  drawingContext = self->_drawingContext;

  return -[UILabel unui_numberOfLinesInFrame:maximum:drawingContext:](summaryLabel, "unui_numberOfLinesInFrame:maximum:drawingContext:", v9, drawingContext, x, y, width, height);
}

- (double)_widthForIconsContainerView
{
  BOOL v3 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
  NSUInteger v4 = [(NSArray *)self->_iconViews count];
  double v5 = 0.0;
  if (v4 >= 2)
  {
    double v6 = (double)([(NSArray *)self->_iconViews count] - 1);
    BOOL v7 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
    BOOL v8 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
    double v9 = 15.2;
    if (!v8) {
      double v9 = 16.0;
    }
    double v10 = 22.8;
    if (!v8) {
      double v10 = 24.0;
    }
    if (!v7) {
      double v9 = v10;
    }
    double v5 = v9 * v6;
  }
  double v11 = 40.0;
  if (v3) {
    double v11 = 38.0;
  }
  return v11 + v5;
}

- (CGRect)_adjustedRectForLabelLayoutFromRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  [(NCNotificationSummaryContentView *)self horizontalLeadingMargin];
  double v10 = v8 - v9;
  [(NCNotificationSummaryContentView *)self horizontalTrailingMargin];
  double v12 = v10 - v11;
  [(NCNotificationSummaryContentView *)self _widthForIconsContainerView];
  double v14 = v13;
  if ([(NSArray *)self->_iconViews count] || self->_summaryIconSymbolImageView) {
    double v12 = v12 - (v14 + 10.0);
  }
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v15 = CGRectGetHeight(v19);
  double v16 = x;
  double v17 = y;
  double v18 = v12;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)_recycleDateLabel
{
  [(BSUIDateLabel *)self->_summaryDateLabel setDelegate:0];
  [(MTVisualStylingProvider *)self->_strokeVisualStylingProvider stopAutomaticallyUpdatingView:self->_summaryDateLabel];
  id v3 = [MEMORY[0x1E4F4F8A8] sharedInstance];
  [v3 recycleLabel:self->_summaryDateLabel];
}

- (void)_tearDownDateLabelIfNecessary
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__NCNotificationSummaryContentView__tearDownDateLabelIfNecessary__block_invoke;
  v2[3] = &unk_1E6A91BB0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __65__NCNotificationSummaryContentView__tearDownDateLabelIfNecessary__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 456);
  if (v2)
  {
    [v2 removeFromSuperview];
    [*(id *)(a1 + 32) _recycleDateLabel];
    uint64_t v3 = *(void *)(a1 + 32);
    NSUInteger v4 = *(void **)(v3 + 456);
    *(void *)(v3 + 456) = 0;
  }
}

- (int64_t)_dateFormatStyleForDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  double v5 = [v3 currentCalendar];
  unsigned int v6 = [v5 isDateInToday:v4];

  return v6;
}

- (void)_addShadowForIconView:(id)a3
{
  id v4 = a3;
  id v15 = [v4 layer];
  [v15 setShadowColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB60])];
  LODWORD(v5) = 1049582633;
  [v15 setShadowOpacity:v5];
  [v15 setShadowRadius:2.0];
  if ([(NCNotificationSummaryContentView *)self isIconViewLeading]) {
    double v6 = 33.82;
  }
  else {
    double v6 = 35.6;
  }
  if ([(NCNotificationSummaryContentView *)self _shouldReverseLayoutDirection])
  {
    double v7 = v6 * -0.1;
  }
  else
  {
    BOOL v8 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
    double v9 = 40.0;
    if (v8) {
      double v9 = 38.0;
    }
    double v7 = v9 + v6 * -0.9;
  }
  BOOL v10 = [(NCNotificationSummaryContentView *)self isIconViewLeading];
  double v11 = 40.0;
  if (v10) {
    double v11 = 38.0;
  }
  objc_msgSend(v15, "setShadowOffset:", v7, (v11 - v6) * 0.5);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    double v13 = v6 * 0.5;
  }
  else {
    double v13 = 9.0;
  }
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v6, v6, v13);
  id v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShadowPath:", objc_msgSend(v14, "CGPath"));
}

- (BOOL)isIconViewLeading
{
  return self->_iconViewLeading;
}

- (NSString)summaryTitleFontName
{
  return self->_summaryTitleFontName;
}

- (NSDate)summaryDate
{
  return self->_summaryDate;
}

- (NSString)summaryIconSymbolName
{
  return self->_summaryIconSymbolName;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategorCGFloat y = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (double)horizontalLeadingMargin
{
  return self->_horizontalLeadingMargin;
}

- (void)setHorizontalLeadingMargin:(double)a3
{
  self->_horizontalLeadingMargin = a3;
}

- (double)horizontalTrailingMargin
{
  return self->_horizontalTrailingMargin;
}

- (void)setHorizontalTrailingMargin:(double)a3
{
  self->_horizontalTrailingMargin = a3;
}

- (BOOL)isSummaryLabelMaterialSecondary
{
  return self->_summaryLabelMaterialSecondary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_summaryIconSymbolName, 0);
  objc_storeStrong((id *)&self->_summaryDate, 0);
  objc_storeStrong((id *)&self->_summaryTitleFontName, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_summaryDateLabel, 0);
  objc_storeStrong((id *)&self->_summaryIconSymbolBackgroundView, 0);
  objc_storeStrong((id *)&self->_summaryIconSymbolImageView, 0);
  objc_storeStrong((id *)&self->_iconViews, 0);
  objc_storeStrong((id *)&self->_summaryIconsContainerView, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);

  objc_storeStrong((id *)&self->_summaryTitleLabel, 0);
}

@end