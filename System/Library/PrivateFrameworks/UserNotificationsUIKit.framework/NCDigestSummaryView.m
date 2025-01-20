@interface NCDigestSummaryView
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)presentFeaturedNotificationsInline;
- (CGRect)_layoutBoundsForTitleLabelInBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationSummaryContentProviding)appsSummaryContentProvider;
- (NCNotificationSummaryContentProviding)communicationsSummaryContentProvider;
- (NSArray)featuredNotificationContentProviders;
- (NSArray)requiredVisualStyleCategories;
- (NSDate)date;
- (NSString)heading;
- (NSString)materialGroupNameBase;
- (NSString)preferredContentSizeCategory;
- (NSString)subheading;
- (NSTimeZone)timeZone;
- (UIView)clearControlView;
- (id)_fontProvider;
- (id)_newSummaryContentViewForSummaryContentProvider:(id)a3;
- (id)_timeStampLabelFont;
- (id)_timeStampLabelPreferredFont;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)dateFormatStyle;
- (unint64_t)_numberOfLinesForHeadingLabelInRect:(CGRect)a3;
- (unint64_t)_numberOfLinesForSubheadingLabelInRect:(CGRect)a3;
- (unint64_t)count;
- (void)_configureSummaryContentView:(id)a3 withSummaryContentProvider:(id)a4;
- (void)_configureTimeStampLabel;
- (void)_configureTimeStampLabelIfNecessary;
- (void)_recycleTimeStampLabel;
- (void)_setFontProvider:(id)a3;
- (void)_tearDownTimeStampLabel;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForCountLabel;
- (void)_updateTextAttributesForDateLabel;
- (void)_updateTextAttributesForHeadingLabel;
- (void)_updateTextAttributesForSubheadingLabel;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_updateVisualStylingProvidersForViewIfNecessary:(id)a3;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAppsSummaryContentProvider:(id)a3;
- (void)setClearControlView:(id)a3;
- (void)setCommunicationsSummaryContentProvider:(id)a3;
- (void)setCount:(unint64_t)count;
- (void)setDate:(id)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setFeaturedNotificationContentProviders:(id)a3;
- (void)setHeading:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setPresentFeaturedNotificationsInline:(BOOL)a3;
- (void)setSubheading:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)updateContent;
@end

@implementation NCDigestSummaryView

- (void)updateContent
{
  [(NCDigestFeaturedNotificationsContainerDisplaying *)self->_featuredNotificationsContainerView updateContent];
  [(NCDigestSummaryView *)self _configureSummaryContentView:self->_communicationsSummaryContentView withSummaryContentProvider:self->_communicationsSummaryContentProvider];
  [(NCDigestSummaryView *)self _configureSummaryContentView:self->_appsSummaryContentView withSummaryContentProvider:self->_appsSummaryContentProvider];

  [(NCDigestSummaryView *)self setNeedsLayout];
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSDate *)[v6 copy];
    date = self->_date;
    self->_date = v4;

    [(NCDigestSummaryView *)self _tearDownTimeStampLabel];
    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSTimeZone *)[v6 copy];
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    [(NCDigestSummaryView *)self _tearDownTimeStampLabel];
    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    [(NCDigestSummaryView *)self _tearDownTimeStampLabel];
    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (NSString)heading
{
  return [(UILabel *)self->_headingLabel text];
}

- (void)setHeading:(id)a3
{
  id v13 = a3;
  v4 = [(NCDigestSummaryView *)self heading];
  char v5 = BSEqualStrings();

  id v6 = v13;
  if ((v5 & 1) == 0)
  {
    headingLabel = self->_headingLabel;
    if (v13)
    {
      if (!headingLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v9 = self->_headingLabel;
        self->_headingLabel = v8;

        [(UILabel *)self->_headingLabel setLineBreakMode:4];
        [(NCDigestSummaryView *)self addSubview:self->_headingLabel];
        [(NCDigestSummaryView *)self _updateTextAttributesForHeadingLabel];
        v10 = self->_headingLabel;
        v11 = [(NCDigestSummaryView *)self visualStylingProviderForCategory:1];
        [(NCDigestSummaryView *)self _updateVisualStylingOfView:v10 style:0 visualStylingProvider:v11 outgoingProvider:0];

        id v6 = v13;
        headingLabel = self->_headingLabel;
      }
      [(UILabel *)headingLabel setText:v6];
    }
    else
    {
      [(UILabel *)headingLabel removeFromSuperview];
      v12 = self->_headingLabel;
      self->_headingLabel = 0;
    }
    [(NCDigestSummaryView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (NSString)subheading
{
  return [(UILabel *)self->_subheadingLabel text];
}

- (void)setSubheading:(id)a3
{
  id v13 = a3;
  v4 = [(NCDigestSummaryView *)self subheading];
  char v5 = BSEqualStrings();

  id v6 = v13;
  if ((v5 & 1) == 0)
  {
    subheadingLabel = self->_subheadingLabel;
    if (v13)
    {
      if (!subheadingLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v9 = self->_subheadingLabel;
        self->_subheadingLabel = v8;

        [(UILabel *)self->_subheadingLabel setLineBreakMode:4];
        [(NCDigestSummaryView *)self addSubview:self->_subheadingLabel];
        [(NCDigestSummaryView *)self _updateTextAttributesForSubheadingLabel];
        v10 = self->_subheadingLabel;
        v11 = [(NCDigestSummaryView *)self visualStylingProviderForCategory:1];
        [(NCDigestSummaryView *)self _updateVisualStylingOfView:v10 style:0 visualStylingProvider:v11 outgoingProvider:0];

        id v6 = v13;
        subheadingLabel = self->_subheadingLabel;
      }
      [(UILabel *)subheadingLabel setText:v6];
    }
    else
    {
      [(UILabel *)subheadingLabel removeFromSuperview];
      v12 = self->_subheadingLabel;
      self->_subheadingLabel = 0;
    }
    [(NCDigestSummaryView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (void)setCount:(unint64_t)count
{
  if (self->_count != count)
  {
    self->_count = count;
    countLabel = self->_countLabel;
    if (count)
    {
      if (!countLabel)
      {
        char v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        countBackgroundView = self->_countBackgroundView;
        self->_countBackgroundView = v5;

        v7 = [(UIView *)self->_countBackgroundView layer];
        [v7 setCornerCurve:*MEMORY[0x1E4F39EA0]];

        [(NCDigestSummaryView *)self addSubview:self->_countBackgroundView];
        v8 = self->_countBackgroundView;
        v9 = [MEMORY[0x1E4FB1618] blackColor];
        [(UIView *)v8 setBackgroundColor:v9];

        [(UIView *)self->_countBackgroundView setAlpha:0.25];
        v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v11 = self->_countLabel;
        self->_countLabel = v10;

        [(UILabel *)self->_countLabel setTextAlignment:1];
        v12 = self->_countLabel;
        id v13 = [MEMORY[0x1E4FB1618] systemWhiteColor];
        [(UILabel *)v12 setTextColor:v13];

        [(NCDigestSummaryView *)self addSubview:self->_countLabel];
        [(NCDigestSummaryView *)self _updateTextAttributesForCountLabel];
        countLabel = self->_countLabel;
        count = self->_count;
      }
      v14 = (void *)MEMORY[0x1E4F28EE0];
      id v18 = [NSNumber numberWithUnsignedInteger:count];
      v15 = [v14 localizedStringFromNumber:v18 numberStyle:0];
      [(UILabel *)countLabel setText:v15];
    }
    else if (countLabel)
    {
      [(UILabel *)self->_countLabel removeFromSuperview];
      v16 = self->_countLabel;
      self->_countLabel = 0;

      [(UIView *)self->_countBackgroundView removeFromSuperview];
      v17 = self->_countBackgroundView;
      self->_countBackgroundView = 0;

      [(NCDigestSummaryView *)self setNeedsLayout];
    }
  }
}

- (void)setPresentFeaturedNotificationsInline:(BOOL)a3
{
  if (self->_presentFeaturedNotificationsInline != a3)
  {
    self->_presentFeaturedNotificationsInline = a3;
    id v5 = [(NCDigestSummaryView *)self featuredNotificationContentProviders];
    [(NCDigestFeaturedNotificationsContainerDisplaying *)self->_featuredNotificationsContainerView removeFromSuperview];
    featuredNotificationsContainerView = self->_featuredNotificationsContainerView;
    self->_featuredNotificationsContainerView = 0;

    [(NCDigestSummaryView *)self setFeaturedNotificationContentProviders:v5];
  }
}

- (NSArray)featuredNotificationContentProviders
{
  return (NSArray *)[(NCDigestFeaturedNotificationsContainerDisplaying *)self->_featuredNotificationsContainerView featuredNotificationContentProviders];
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
  id v14 = a3;
  v4 = [(NCDigestSummaryView *)self featuredNotificationContentProviders];
  char v5 = BSEqualArrays();

  if (v5)
  {
    [(NCDigestFeaturedNotificationsContainerDisplaying *)self->_featuredNotificationsContainerView updateContent];
  }
  else
  {
    uint64_t v6 = [v14 count];
    featuredNotificationsContainerView = self->_featuredNotificationsContainerView;
    if (v6)
    {
      if (!featuredNotificationsContainerView)
      {
        BOOL v8 = [(NCDigestSummaryView *)self presentFeaturedNotificationsInline];
        v9 = off_1E6A90AE0;
        if (!v8) {
          v9 = off_1E6A90AF0;
        }
        id v10 = objc_alloc(*v9);
        v11 = (NCDigestFeaturedNotificationsContainerDisplaying *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v12 = self->_featuredNotificationsContainerView;
        self->_featuredNotificationsContainerView = v11;

        [(NCDigestFeaturedNotificationsContainerDisplaying *)self->_featuredNotificationsContainerView setMaterialGroupNameBase:self->_materialGroupNameBase];
        [(NCDigestFeaturedNotificationsContainerDisplaying *)self->_featuredNotificationsContainerView setVisualStylingProvider:self->_strokeVisualStylingProvider forCategory:1];
        [(NCDigestSummaryView *)self addSubview:self->_featuredNotificationsContainerView];
        featuredNotificationsContainerView = self->_featuredNotificationsContainerView;
      }
      [(NCDigestFeaturedNotificationsContainerDisplaying *)featuredNotificationsContainerView setFeaturedNotificationContentProviders:v14];
    }
    else
    {
      [(NCDigestFeaturedNotificationsContainerDisplaying *)featuredNotificationsContainerView removeFromSuperview];
      id v13 = self->_featuredNotificationsContainerView;
      self->_featuredNotificationsContainerView = 0;
    }
    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (void)setCommunicationsSummaryContentProvider:(id)a3
{
  id v11 = a3;
  v4 = [(NCDigestSummaryView *)self communicationsSummaryContentProvider];
  char v5 = BSEqualObjects();

  if (v5)
  {
    [(NCDigestSummaryView *)self _configureSummaryContentView:self->_communicationsSummaryContentView withSummaryContentProvider:v11];
  }
  else
  {
    communicationsSummaryContentView = self->_communicationsSummaryContentView;
    if (v11)
    {
      if (communicationsSummaryContentView)
      {
        -[NCDigestSummaryView _configureSummaryContentView:withSummaryContentProvider:](self, "_configureSummaryContentView:withSummaryContentProvider:");
      }
      else
      {
        BOOL v8 = [(NCDigestSummaryView *)self _newSummaryContentViewForSummaryContentProvider:v11];
        v9 = self->_communicationsSummaryContentView;
        self->_communicationsSummaryContentView = v8;

        [(NCNotificationSummaryContentView *)self->_communicationsSummaryContentView setHorizontalLeadingMargin:0.0];
        [(NCDigestSummaryView *)self addSubview:self->_communicationsSummaryContentView];
      }
      id v10 = (NCNotificationSummaryContentProviding *)v11;
      communicationsSummaryContentProvider = self->_communicationsSummaryContentProvider;
      self->_communicationsSummaryContentProvider = v10;
    }
    else
    {
      [(NCNotificationSummaryContentView *)communicationsSummaryContentView removeFromSuperview];
      communicationsSummaryContentProvider = self->_communicationsSummaryContentView;
      self->_communicationsSummaryContentView = 0;
    }

    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (void)setAppsSummaryContentProvider:(id)a3
{
  id v11 = a3;
  v4 = [(NCDigestSummaryView *)self appsSummaryContentProvider];
  char v5 = BSEqualObjects();

  if (v5)
  {
    [(NCDigestSummaryView *)self _configureSummaryContentView:self->_appsSummaryContentView withSummaryContentProvider:v11];
  }
  else
  {
    appsSummaryContentView = self->_appsSummaryContentView;
    if (v11)
    {
      if (appsSummaryContentView)
      {
        -[NCDigestSummaryView _configureSummaryContentView:withSummaryContentProvider:](self, "_configureSummaryContentView:withSummaryContentProvider:");
      }
      else
      {
        BOOL v8 = [(NCDigestSummaryView *)self _newSummaryContentViewForSummaryContentProvider:v11];
        v9 = self->_appsSummaryContentView;
        self->_appsSummaryContentView = v8;

        [(NCNotificationSummaryContentView *)self->_appsSummaryContentView setHorizontalLeadingMargin:0.0];
        [(NCNotificationSummaryContentView *)self->_appsSummaryContentView setHorizontalTrailingMargin:0.0];
        [(NCNotificationSummaryContentView *)self->_appsSummaryContentView setVisualStylingProvider:self->_strokeVisualStylingProvider forCategory:1];
        [(NCNotificationSummaryContentView *)self->_appsSummaryContentView setSummaryLabelMaterialSecondary:1];
        [(NCDigestSummaryView *)self addSubview:self->_appsSummaryContentView];
      }
      id v10 = (NCNotificationSummaryContentProviding *)v11;
      appsSummaryContentProvider = self->_appsSummaryContentProvider;
      self->_appsSummaryContentProvider = v10;
    }
    else
    {
      [(NCNotificationSummaryContentView *)appsSummaryContentView removeFromSuperview];
      appsSummaryContentProvider = self->_appsSummaryContentView;
      self->_appsSummaryContentView = 0;
    }

    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (void)setClearControlView:(id)a3
{
  char v5 = (UIView *)a3;
  clearControlView = self->_clearControlView;
  if (clearControlView != v5)
  {
    v7 = v5;
    if (clearControlView) {
      [(UIView *)clearControlView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_clearControlView, a3);
    if (v7) {
      [(NCDigestSummaryView *)self addSubview:v7];
    }
    [(NCDigestSummaryView *)self setNeedsLayout];
    char v5 = v7;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[NCDigestSummaryView _layoutBoundsForTitleLabelInBounds:](self, "_layoutBoundsForTitleLabelInBounds:", 0.0, 0.0, a3.width, a3.height);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (self->_timeStampLabel)
  {
    id v14 = [(NCDigestSummaryView *)self _timeStampLabelFont];
    [v14 lineHeight];
  }
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_headingLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForHeadingLabelInRect:](self, "_numberOfLinesForHeadingLabelInRect:", v7, v9, v11, v13));
  subheadingLabel = self->_subheadingLabel;
  if (subheadingLabel) {
    -[UILabel unui_measuringHeightWithNumberOfLines:](subheadingLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForSubheadingLabelInRect:](self, "_numberOfLinesForSubheadingLabelInRect:", v7, v9, v11, v13));
  }
  communicationsSummaryContentView = self->_communicationsSummaryContentView;
  if (communicationsSummaryContentView) {
    -[NCNotificationSummaryContentView sizeThatFits:](communicationsSummaryContentView, "sizeThatFits:", width + -36.0, height);
  }
  BOOL v17 = [(NCDigestSummaryView *)self presentFeaturedNotificationsInline];
  featuredNotificationsContainerView = self->_featuredNotificationsContainerView;
  if (featuredNotificationsContainerView)
  {
    double v19 = width + -36.0 + 24.0;
    if (!v17) {
      double v19 = width + -36.0;
    }
    -[NCDigestFeaturedNotificationsContainerDisplaying sizeThatFits:](featuredNotificationsContainerView, "sizeThatFits:", v19, height);
  }
  appsSummaryContentView = self->_appsSummaryContentView;
  if (appsSummaryContentView) {
    -[NCNotificationSummaryContentView sizeThatFits:](appsSummaryContentView, "sizeThatFits:", width + -36.0, height);
  }

  UISizeRoundToScale();
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (void)layoutSubviews
{
  v93.receiver = self;
  v93.super_class = (Class)NCDigestSummaryView;
  [(NCDigestSummaryView *)&v93 layoutSubviews];
  [(NCDigestSummaryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int v11 = [(NCDigestSummaryView *)self _shouldReverseLayoutDirection];
  if ((v11 & 1) == 0)
  {
    v94.origin.x = v4;
    v94.origin.y = v6;
    v94.size.double width = v8;
    v94.size.double height = v10;
    CGRectGetWidth(v94);
  }
  countLabel = self->_countLabel;
  if (countLabel)
  {
    -[UILabel sizeThatFits:](countLabel, "sizeThatFits:", v8, v10);
    if ((v11 & 1) == 0)
    {
      v95.origin.x = v4;
      v95.origin.y = v6;
      v95.size.double width = v8;
      v95.size.double height = v10;
      CGRectGetWidth(v95);
    }
    UIRectIntegralWithScale();
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    -[UIView setFrame:](self->_countBackgroundView, "setFrame:");
    double v21 = [(UIView *)self->_countBackgroundView layer];
    v96.origin.x = v14;
    v96.origin.y = v16;
    v96.size.double width = v18;
    v96.size.double height = v20;
    [v21 setCornerRadius:CGRectGetHeight(v96) * 0.5];

    -[UILabel setFrame:](self->_countLabel, "setFrame:", v14, v16, v18, v20);
  }
  clearControlView = self->_clearControlView;
  if (clearControlView)
  {
    double v23 = 0.0;
    if (!self->_countLabel) {
      double v23 = 1.0;
    }
    [(UIView *)clearControlView setAlpha:v23];
    -[UIView sizeThatFits:](self->_clearControlView, "sizeThatFits:", v8, v10);
    if ((v11 & 1) == 0)
    {
      v97.origin.x = v4;
      v97.origin.y = v6;
      v97.size.double width = v8;
      v97.size.double height = v10;
      CGRectGetWidth(v97);
    }
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_clearControlView, "setFrame:");
  }
  -[NCDigestSummaryView _layoutBoundsForTitleLabelInBounds:](self, "_layoutBoundsForTitleLabelInBounds:", v4, v6, v8, v10);
  CGFloat v25 = v24;
  CGFloat v26 = v6;
  double v28 = v27;
  CGFloat v29 = v8;
  double v31 = v30;
  CGFloat v32 = v10;
  double v34 = v33;
  CGFloat v91 = v26;
  CGFloat v92 = v4;
  CGFloat rect_16 = v32;
  CGFloat rect_24 = v29;
  if (v11)
  {
    v98.origin.x = v4;
    v98.origin.y = v26;
    v98.size.double width = v29;
    v98.size.double height = v32;
    CGRectGetMaxX(v98);
    v99.origin.x = v25;
    v99.origin.y = v28;
    v99.size.double width = v31;
    v99.size.double height = v34;
    CGRectGetWidth(v99);
  }
  double rect = v25;
  v100.origin.x = v25;
  v100.origin.y = v28;
  v100.size.double width = v31;
  v100.size.double height = v34;
  CGRectGetWidth(v100);
  v35 = [(NCDigestSummaryView *)self _timeStampLabelFont];
  [v35 lineHeight];
  v36 = [(NCDigestSummaryView *)self traitCollection];
  [v36 displayScale];
  UICeilToScale();
  double rect_8 = 18.0;
  UIRectIntegralWithScale();

  [(NCDigestSummaryView *)self _configureTimeStampLabelIfNecessary];
  UIRectIntegralWithScale();
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  -[BSUIDateLabel setFrame:](self->_timeStampLabel, "setFrame:");
  [(UILabel *)self->_headingLabel frame];
  double v45 = 18.0;
  if (v11)
  {
    v101.origin.y = v91;
    v101.origin.x = v92;
    v101.size.double height = rect_16;
    v101.size.double width = rect_24;
    CGFloat v46 = CGRectGetMaxX(v101) + -18.0;
    v102.origin.x = rect;
    v102.origin.y = v28;
    v102.size.double width = v31;
    v102.size.double height = v34;
    double v45 = v46 - CGRectGetWidth(v102);
  }
  if (self->_timeStampLabel)
  {
    v103.origin.x = v38;
    v103.origin.y = v40;
    v103.size.double width = v42;
    v103.size.double height = v44;
    double rect_8 = CGRectGetMaxY(v103) + 2.0;
  }
  v104.origin.x = rect;
  v104.origin.y = v28;
  v104.size.double width = v31;
  v104.size.double height = v34;
  CGFloat Width = CGRectGetWidth(v104);
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_headingLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForHeadingLabelInRect:](self, "_numberOfLinesForHeadingLabelInRect:", rect, v28, v31, v34));
  CGFloat v49 = v48;
  double v86 = v34;
  -[UILabel unui_drawingHeightWithNumberOfLines:](self->_headingLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForHeadingLabelInRect:](self, "_numberOfLinesForHeadingLabelInRect:", rect, v28, v31, v34));
  v105.origin.x = v45;
  v105.origin.y = rect_8;
  v105.size.double width = Width;
  v105.size.double height = v49;
  CGRectGetWidth(v105);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  [(UILabel *)self->_headingLabel setFrame:0];
  subheadingLabel = self->_subheadingLabel;
  if (subheadingLabel)
  {
    [(UILabel *)subheadingLabel frame];
    double v59 = 18.0;
    if (v11)
    {
      v106.origin.y = v91;
      v106.origin.x = v92;
      v106.size.double height = rect_16;
      v106.size.double width = rect_24;
      CGFloat v60 = CGRectGetMaxX(v106) + -18.0;
      v107.origin.x = rect;
      v107.origin.y = v28;
      v107.size.double width = v31;
      v107.size.double height = v86;
      double v59 = v60 - CGRectGetWidth(v107);
    }
    v108.origin.x = v57;
    v108.origin.y = v51;
    v108.size.double width = v53;
    v108.size.double height = v55;
    CGFloat v61 = CGRectGetMaxY(v108) + 1.0;
    v109.origin.x = rect;
    v109.origin.y = v28;
    v109.size.double width = v31;
    v109.size.double height = v86;
    CGFloat v62 = CGRectGetWidth(v109);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_subheadingLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForSubheadingLabelInRect:](self, "_numberOfLinesForSubheadingLabelInRect:", rect, v28, v31, v86));
    CGFloat v64 = v63;
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_subheadingLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForSubheadingLabelInRect:](self, "_numberOfLinesForSubheadingLabelInRect:", rect, v28, v31, v86));
    v110.origin.x = v59;
    v110.origin.y = v61;
    v110.size.double width = v62;
    v110.size.double height = v64;
    CGRectGetWidth(v110);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    double v57 = v65;
    double v51 = v66;
    double v53 = v67;
    double v55 = v68;
    [(UILabel *)self->_subheadingLabel setFrame:0];
  }
  v111.origin.y = v91;
  v111.origin.x = v92;
  v111.size.double height = rect_16;
  v111.size.double width = rect_24;
  CGRect v112 = CGRectInset(v111, 18.0, 0.0);
  double v69 = v112.size.width;
  double height = v112.size.height;
  communicationsSummaryContentView = self->_communicationsSummaryContentView;
  if (communicationsSummaryContentView)
  {
    -[NCNotificationSummaryContentView sizeThatFits:](communicationsSummaryContentView, "sizeThatFits:", v112.size.width, v112.size.height);
    v113.origin.x = v57;
    v113.origin.y = v51;
    v113.size.double width = v53;
    v113.size.double height = v55;
    CGRectGetMaxY(v113);
    UIRectIntegralWithScale();
    -[NCNotificationSummaryContentView setFrame:](self->_communicationsSummaryContentView, "setFrame:");
  }
  featuredNotificationsContainerView = self->_featuredNotificationsContainerView;
  if (featuredNotificationsContainerView)
  {
    [(NCDigestFeaturedNotificationsContainerDisplaying *)featuredNotificationsContainerView frame];
    BOOL v73 = [(NCDigestSummaryView *)self presentFeaturedNotificationsInline];
    double v74 = v69 + 24.0;
    if (!v73) {
      double v74 = v69;
    }
    -[NCDigestFeaturedNotificationsContainerDisplaying sizeThatFits:](self->_featuredNotificationsContainerView, "sizeThatFits:", v74, height);
    v75 = self->_communicationsSummaryContentView;
    double v76 = v57;
    double v77 = v51;
    double v78 = v53;
    double v79 = v55;
    if (v75) {
      [(NCNotificationSummaryContentView *)v75 frame];
    }
    CGRectGetMaxY(*(CGRect *)&v76);
    [(NCDigestSummaryView *)self presentFeaturedNotificationsInline];
    UIRectIntegralWithScale();
    -[NCDigestFeaturedNotificationsContainerDisplaying setFrame:](self->_featuredNotificationsContainerView, "setFrame:");
  }
  if (self->_appsSummaryContentView)
  {
    v80 = self->_featuredNotificationsContainerView;
    if (v80)
    {
      [(NCDigestFeaturedNotificationsContainerDisplaying *)v80 frame];
      CGRectGetMaxY(v114);
    }
    else
    {
      v81 = self->_communicationsSummaryContentView;
      if (v81)
      {
        [(NCNotificationSummaryContentView *)v81 frame];
        double v57 = v82;
        double v51 = v83;
        double v53 = v84;
        double v55 = v85;
      }
      v115.origin.x = v57;
      v115.origin.y = v51;
      v115.size.double width = v53;
      v115.size.double height = v55;
      CGRectGetMaxY(v115);
    }
    -[NCNotificationSummaryContentView sizeThatFits:](self->_appsSummaryContentView, "sizeThatFits:", v69, height);
    UIRectIntegralWithScale();
    -[NCNotificationSummaryContentView setFrame:](self->_appsSummaryContentView, "setFrame:");
  }
}

- (void)didMoveToWindow
{
  double v3 = [(NCDigestSummaryView *)self window];

  if (v3)
  {
    [(NCDigestSummaryView *)self adjustForContentSizeCategoryChange];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  double v3 = [(NCDigestSummaryView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    [(NCDigestFeaturedNotificationsContainerDisplaying *)self->_featuredNotificationsContainerView adjustForContentSizeCategoryChange];
    [(NCNotificationSummaryContentView *)self->_communicationsSummaryContentView adjustForContentSizeCategoryChange];
    [(NCNotificationSummaryContentView *)self->_appsSummaryContentView adjustForContentSizeCategoryChange];
    [(NCDigestSummaryView *)self _updateTextAttributes];
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
    v6.super_class = (Class)NCDigestSummaryView;
    double v4 = [(NCDigestSummaryView *)&v6 visualStylingProviderForCategory:a3];
  }

  return v4;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F2F845C8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  objc_super v6 = (MTVisualStylingProvider *)a3;
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider != v6)
  {
    int v11 = v6;
    double v8 = v6;
    double v9 = self->_strokeVisualStylingProvider;
    self->_strokeVisualStylingProvider = v8;
    double v10 = strokeVisualStylingProvider;

    [(NCDigestSummaryView *)self _visualStylingProviderDidChange:self->_strokeVisualStylingProvider forCategory:a4 outgoingProvider:v10];
    [(NCDigestFeaturedNotificationsContainerDisplaying *)self->_featuredNotificationsContainerView setVisualStylingProvider:self->_strokeVisualStylingProvider forCategory:a4];
    [(NCNotificationSummaryContentView *)self->_appsSummaryContentView setVisualStylingProvider:self->_strokeVisualStylingProvider forCategory:a4];

    objc_super v6 = v11;
  }
}

- (void)setMaterialGroupNameBase:(id)a3
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  id v5 = a3;
  [(NCDigestFeaturedNotificationsContainerDisplaying *)self->_featuredNotificationsContainerView setMaterialGroupNameBase:v5];
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  double v7 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  uint64_t v16 = *MEMORY[0x1E4FB0950];
  uint64_t v14 = *MEMORY[0x1E4FB09F0];
  double v8 = [NSNumber numberWithDouble:a5];
  double v15 = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v9;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  int v11 = [v7 fontDescriptorByAddingAttributes:v10];

  double v12 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (id)_timeStampLabelFont
{
  double v3 = [(BSUIDateLabel *)self->_timeStampLabel font];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NCDigestSummaryView *)self _timeStampLabelPreferredFont];
  }
  objc_super v6 = v5;

  return v6;
}

- (id)_timeStampLabelPreferredFont
{
  v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x1E4FB28F0];
  double v4 = *MEMORY[0x1E4FB09C0];

  return (id)[v2 _preferredFont:1 textStyle:v3 weight:0 additionalTraits:v4];
}

- (id)_fontProvider
{
  if (!self->_fontProvider)
  {
    if ([(NCDigestSummaryView *)self adjustsFontForContentSizeCategory]) {
      [MEMORY[0x1E4F4F8B8] preferredFontProvider];
    }
    else {
    uint64_t v3 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    }
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;
  }
  id v5 = self->_fontProvider;

  return v5;
}

- (void)_setFontProvider:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fontProvider, a3);
    [(NCDigestSummaryView *)self _updateTextAttributes];
  }
}

- (void)_updateTextAttributesForDateLabel
{
  timeStampLabel = self->_timeStampLabel;
  if (timeStampLabel)
  {
    double v4 = [(NCDigestSummaryView *)self _timeStampLabelPreferredFont];
    [(BSUIDateLabel *)timeStampLabel setFont:v4];

    [(BSUIDateLabel *)self->_timeStampLabel setNumberOfLines:1];
    [(BSUIDateLabel *)self->_timeStampLabel setLineBreakMode:3];
    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForHeadingLabel
{
  headingLabel = self->_headingLabel;
  if (headingLabel)
  {
    double v4 = [(id)objc_opt_class() _preferredFont:1 textStyle:*MEMORY[0x1E4FB2990] weight:0 additionalTraits:*MEMORY[0x1E4FB09E0]];
    [(UILabel *)headingLabel setFont:v4];

    [(UILabel *)self->_headingLabel setNumberOfLines:0];
    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (unint64_t)_numberOfLinesForHeadingLabelInRect:(CGRect)a3
{
  return -[UILabel unui_numberOfLinesInFrame:maximum:drawingContext:](self->_headingLabel, "unui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateTextAttributesForSubheadingLabel
{
  subheadingLabel = self->_subheadingLabel;
  if (subheadingLabel)
  {
    double v4 = [(id)objc_opt_class() _preferredFont:1 textStyle:*MEMORY[0x1E4FB28F0] weight:0 additionalTraits:*MEMORY[0x1E4FB09D8]];
    [(UILabel *)subheadingLabel setFont:v4];

    [(UILabel *)self->_subheadingLabel setNumberOfLines:0];
    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (unint64_t)_numberOfLinesForSubheadingLabelInRect:(CGRect)a3
{
  return -[UILabel unui_numberOfLinesInFrame:maximum:drawingContext:](self->_subheadingLabel, "unui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateTextAttributesForCountLabel
{
  if (self->_countLabel)
  {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    double v4 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v4 = (id *)MEMORY[0x1E4FB2950];
    }
    countLabel = self->_countLabel;
    id v6 = *v4;
    double v7 = [(id)objc_opt_class() _preferredFont:1 textStyle:v6 weight:0 additionalTraits:*MEMORY[0x1E4FB09E0]];

    [(UILabel *)countLabel setFont:v7];
    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributes
{
  [(NCDigestSummaryView *)self _updateTextAttributesForDateLabel];
  [(NCDigestSummaryView *)self _updateTextAttributesForHeadingLabel];
  [(NCDigestSummaryView *)self _updateTextAttributesForSubheadingLabel];

  [(NCDigestSummaryView *)self _updateTextAttributesForCountLabel];
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

- (void)_updateVisualStylingProvidersForViewIfNecessary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = objc_msgSend(v4, "requiredVisualStyleCategories", 0);
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
          int v11 = [(NCDigestSummaryView *)self visualStylingProviderForCategory:v10];
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

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  if (a4 == 1)
  {
    timeStampLabel = self->_timeStampLabel;
    id v9 = a5;
    id v10 = a3;
    [(NCDigestSummaryView *)self _updateVisualStylingOfView:timeStampLabel style:1 visualStylingProvider:v10 outgoingProvider:v9];
    [(NCDigestSummaryView *)self _updateVisualStylingOfView:self->_headingLabel style:0 visualStylingProvider:v10 outgoingProvider:v9];
    [(NCDigestSummaryView *)self _updateVisualStylingOfView:self->_subheadingLabel style:0 visualStylingProvider:v10 outgoingProvider:v9];
  }
}

- (void)_configureTimeStampLabelIfNecessary
{
  if (!self->_timeStampLabel)
  {
    if (self->_date) {
      [(NCDigestSummaryView *)self _configureTimeStampLabel];
    }
  }
}

- (void)_configureTimeStampLabel
{
  uint64_t v3 = [MEMORY[0x1E4F4F8A8] sharedInstance];
  id v4 = [v3 startLabelWithStartDate:self->_date endDate:0 timeZone:self->_timeZone allDay:0 forStyle:self->_dateFormatStyle];
  timeStampLabel = self->_timeStampLabel;
  self->_timeStampLabel = v4;

  [(BSUIDateLabel *)self->_timeStampLabel setDelegate:self];
  [(NCDigestSummaryView *)self addSubview:self->_timeStampLabel];
  [(NCDigestSummaryView *)self _updateTextAttributesForDateLabel];
  uint64_t v6 = self->_timeStampLabel;
  id v7 = [(NCDigestSummaryView *)self visualStylingProviderForCategory:1];
  [(NCDigestSummaryView *)self _updateVisualStylingOfView:v6 style:1 visualStylingProvider:v7 outgoingProvider:0];
}

- (void)_recycleTimeStampLabel
{
  [(BSUIDateLabel *)self->_timeStampLabel setDelegate:0];
  timeStampLabel = self->_timeStampLabel;
  id v4 = [(NCDigestSummaryView *)self visualStylingProviderForCategory:1];
  [(NCDigestSummaryView *)self _updateVisualStylingOfView:timeStampLabel style:1 visualStylingProvider:0 outgoingProvider:v4];

  id v5 = [MEMORY[0x1E4F4F8A8] sharedInstance];
  [v5 recycleLabel:self->_timeStampLabel];
}

- (void)_tearDownTimeStampLabel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__NCDigestSummaryView__tearDownTimeStampLabel__block_invoke;
  v2[3] = &unk_1E6A91BB0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __46__NCDigestSummaryView__tearDownTimeStampLabel__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 408);
  if (v2)
  {
    [v2 removeFromSuperview];
    [*(id *)(a1 + 32) _recycleTimeStampLabel];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 408);
    *(void *)(v3 + 408) = 0;
  }
}

- (CGRect)_layoutBoundsForTitleLabelInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  countBackgroundView = self->_countBackgroundView;
  if (countBackgroundView || (countBackgroundView = self->_clearControlView) != 0)
  {
    [(UIView *)countBackgroundView frame];
    double v8 = CGRectGetWidth(v14);
  }
  else
  {
    double v8 = 40.0;
  }
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGFloat v9 = CGRectGetWidth(v15) + -36.0 - v8 + -4.0;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v16);
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = v9;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (id)_newSummaryContentViewForSummaryContentProvider:(id)a3
{
  id v4 = a3;
  id v5 = [NCNotificationSummaryContentView alloc];
  uint64_t v6 = -[NCNotificationSummaryContentView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NCDigestSummaryView *)self _configureSummaryContentView:v6 withSummaryContentProvider:v4];

  return v6;
}

- (void)_configureSummaryContentView:(id)a3 withSummaryContentProvider:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    double v8 = [v6 summaryTitle];
    [v7 setSummaryTitle:v8];

    CGFloat v9 = [v6 summary];
    [v7 setSummary:v9];

    double v10 = [v6 summaryIconViews];
    [v7 setSummaryIconViews:v10];

    objc_msgSend(v7, "setIconViewLeading:", objc_msgSend(v6, "isIconViewLeading"));
    double v11 = [v6 summaryTitleFontName];
    [v7 setSummaryTitleFontName:v11];

    double v12 = [v6 summaryDate];

    [v7 setSummaryDate:v12];
    [(NCDigestSummaryView *)self setNeedsLayout];
  }
}

- (NSDate)date
{
  return self->_date;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (unint64_t)count
{
  return self->_count;
}

- (BOOL)presentFeaturedNotificationsInline
{
  return self->_presentFeaturedNotificationsInline;
}

- (NCNotificationSummaryContentProviding)communicationsSummaryContentProvider
{
  return self->_communicationsSummaryContentProvider;
}

- (NCNotificationSummaryContentProviding)appsSummaryContentProvider
{
  return self->_appsSummaryContentProvider;
}

- (UIView)clearControlView
{
  return self->_clearControlView;
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

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_clearControlView, 0);
  objc_storeStrong((id *)&self->_appsSummaryContentProvider, 0);
  objc_storeStrong((id *)&self->_communicationsSummaryContentProvider, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_appsSummaryContentView, 0);
  objc_storeStrong((id *)&self->_communicationsSummaryContentView, 0);
  objc_storeStrong((id *)&self->_featuredNotificationsContainerView, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_countBackgroundView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_subheadingLabel, 0);
  objc_storeStrong((id *)&self->_headingLabel, 0);

  objc_storeStrong((id *)&self->_timeStampLabel, 0);
}

@end