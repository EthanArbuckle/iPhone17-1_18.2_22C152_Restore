@interface WeekTimeView
+ (double)widthForOrientation:(int64_t)a3 inViewHierarchy:(id)a4;
- (BOOL)allDayHighlighted;
- (BOOL)showsTimeMarker;
- (BOOL)useMaterialBackground;
- (BOOL)useMultiDayStyle;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKDayTimeView)timeView;
- (NSString)overlayMonthText;
- (NSString)weekNumberText;
- (UIColor)timeMarkerExtensionColor;
- (UIScrollView)scrollView;
- (WeekTimeView)initWithFrame:(CGRect)a3 targetSizeClass:(int64_t)a4 orientation:(int64_t)a5;
- (double)_yLocationForMonthLabel;
- (double)allDayAlpha;
- (double)allDayBackgroundColorOriginY;
- (double)allDayLabelOriginY;
- (double)allDayOccurrenceInsetIntoScroller;
- (double)headerHeight;
- (id)monthText;
- (int64_t)orientation;
- (void)_localeChanged:(id)a3;
- (void)_updateMonthFont;
- (void)_updateOverlayMonthFont;
- (void)_updateWeekNumberFont;
- (void)contentSizeCategoryChanged;
- (void)layoutSubviews;
- (void)reAdjustAllDayLabelLayout;
- (void)setAllDayAlpha:(double)a3;
- (void)setAllDayHighlighted:(BOOL)a3;
- (void)setDayTimeViewDelegate:(id)a3;
- (void)setHeaderHeight:(double)a3;
- (void)setHourHeightScale:(double)a3;
- (void)setMonthText:(id)a3 isCurrentMonth:(BOOL)a4;
- (void)setMonthTextBaselineOffset:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOverlayMonthText:(id)a3;
- (void)setShowsTimeMarker:(BOOL)a3;
- (void)setTimeMarkerExtensionColor:(id)a3;
- (void)setUseMaterialBackground:(BOOL)a3;
- (void)setUseMultiDayStyle:(BOOL)a3;
- (void)setWeekNumberText:(id)a3;
- (void)updateMarkerPosition;
- (void)updateMonthLabel;
@end

@implementation WeekTimeView

+ (double)widthForOrientation:(int64_t)a3 inViewHierarchy:(id)a4
{
  double v10 = 0.0;
  id v5 = a4;
  if (+[EKDayAllDayView shouldTimeBarWidthMatchAllDayTextWithResultWidth:&v10])double v6 = v10; {
  else
  }
    double v6 = 51.0;
  +[EKDayTimeView timeWidthForOrientation:a3 inViewHierarchy:v5];
  double v8 = v7;

  if (v6 >= v8) {
    return v6;
  }
  else {
    return v8;
  }
}

- (WeekTimeView)initWithFrame:(CGRect)a3 targetSizeClass:(int64_t)a4 orientation:(int64_t)a5
{
  v47.receiver = self;
  v47.super_class = (Class)WeekTimeView;
  double v7 = -[WeekTimeView initWithFrame:](&v47, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v8 = v7;
  if (v7)
  {
    v7->_preferredMonthLabelBaselineOffsetFromTop = -1.0;
    [(WeekTimeView *)v7 setOrientation:a5];
    id v9 = objc_alloc((Class)EKDayTimeView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v13 = [v9 initWithFrame:CGRectZero.origin.x, y, width, height];
    timeView = v8->_timeView;
    v8->_timeView = v13;

    [(EKDayTimeView *)v8->_timeView setOpaque:0];
    [(EKDayTimeView *)v8->_timeView setOrientation:a5];
    [(EKDayTimeView *)v8->_timeView setShowsRightBorder:[(WeekTimeView *)v8 _showTrailingBorder]];
    [(EKDayTimeView *)v8->_timeView setShowsTimeMarkerExtension:1];
    v15 = [objc_alloc((Class)UIScrollView) initWithFrame:CGRectZero.origin.x, y, width, height];
    timeScroller = v8->_timeScroller;
    v8->_timeScroller = v15;

    [(UIScrollView *)v8->_timeScroller addSubview:v8->_timeView];
    v17 = v8->_timeScroller;
    [(EKDayTimeView *)v8->_timeView bounds];
    -[UIScrollView setContentSize:](v17, "setContentSize:", v18, v19);
    [(UIScrollView *)v8->_timeScroller setScrollEnabled:0];
    [(UIScrollView *)v8->_timeScroller setDelegate:v8];
    [(WeekTimeView *)v8 addSubview:v8->_timeScroller];
    v20 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    headerBackground = v8->_headerBackground;
    v8->_headerBackground = v20;

    v22 = +[UIColor colorNamed:@"weekHeaderBGColor"];
    [(UIView *)v8->_headerBackground setBackgroundColor:v22];

    [(WeekTimeView *)v8 addSubview:v8->_headerBackground];
    v23 = (UIView *)objc_alloc_init((Class)UIView);
    allDayBackgroundColorView = v8->_allDayBackgroundColorView;
    v8->_allDayBackgroundColorView = v23;

    v25 = CUIKAllDayBackgroundColor();
    [(UIView *)v8->_allDayBackgroundColorView setBackgroundColor:v25];

    [(UIView *)v8->_allDayBackgroundColorView setClipsToBounds:1];
    [(WeekTimeView *)v8 addSubview:v8->_allDayBackgroundColorView];
    v26 = (UIView *)objc_alloc_init((Class)UIView);
    topAllDaySeparatorView = v8->_topAllDaySeparatorView;
    v8->_topAllDaySeparatorView = v26;

    v28 = +[UIColor separatorColor];
    [(UIView *)v8->_topAllDaySeparatorView setBackgroundColor:v28];

    [(WeekTimeView *)v8 addSubview:v8->_topAllDaySeparatorView];
    v29 = (UIView *)objc_alloc_init((Class)UIView);
    bottomAllDaySeparatorView = v8->_bottomAllDaySeparatorView;
    v8->_bottomAllDaySeparatorView = v29;

    v31 = +[UIColor separatorColor];
    [(UIView *)v8->_bottomAllDaySeparatorView setBackgroundColor:v31];

    [(WeekTimeView *)v8 addSubview:v8->_bottomAllDaySeparatorView];
    v32 = (UILabel *)objc_alloc_init((Class)UILabel);
    allDayLabel = v8->_allDayLabel;
    v8->_allDayLabel = v32;

    v34 = v8->_allDayLabel;
    v35 = +[NSBundle bundleForClass:objc_opt_class()];
    v36 = [v35 localizedStringForKey:@"all-day" value:&stru_1001D6918 table:0];
    [(UILabel *)v34 setText:v36];

    [(UILabel *)v8->_allDayLabel setMinimumScaleFactor:0.727272727];
    v37 = v8->_allDayLabel;
    v38 = +[UIColor secondaryLabelColor];
    [(UILabel *)v37 setTextColor:v38];

    [(UILabel *)v8->_allDayLabel setTextAlignment:2];
    v39 = v8->_allDayLabel;
    v40 = +[EKDayTimeView allDayLabelFont];
    [(UILabel *)v39 setFont:v40];

    [(WeekTimeView *)v8 reAdjustAllDayLabelLayout];
    [(UIView *)v8->_allDayBackgroundColorView addSubview:v8->_allDayLabel];
    v41 = (UIView *)objc_alloc_init((Class)UIView);
    trailingBorderView = v8->_trailingBorderView;
    v8->_trailingBorderView = v41;

    v43 = +[UIColor separatorColor];
    [(UIView *)v8->_trailingBorderView setBackgroundColor:v43];

    [(UIView *)v8->_trailingBorderView setHidden:[(WeekTimeView *)v8 _showTrailingBorder] ^ 1];
    [(WeekTimeView *)v8 addSubview:v8->_trailingBorderView];
    [(WeekTimeView *)v8 bringSubviewToFront:v8->_timeScroller];
    [(WeekTimeView *)v8 bringSubviewToFront:v8->_headerBackground];
    [(WeekTimeView *)v8 bringSubviewToFront:v8->_allDayBackgroundColorView];
    [(UIView *)v8->_allDayBackgroundColorView bringSubviewToFront:v8->_allDayLabel];
    [(WeekTimeView *)v8 bringSubviewToFront:v8->_trailingBorderView];
    [(WeekTimeView *)v8 bringSubviewToFront:v8->_topAllDaySeparatorView];
    [(WeekTimeView *)v8 bringSubviewToFront:v8->_bottomAllDaySeparatorView];
    v44 = +[UIColor systemBackgroundColor];
    [(WeekTimeView *)v8 setBackgroundColor:v44];

    v45 = +[NSNotificationCenter defaultCenter];
    [v45 addObserver:v8 selector:"_localeChanged:" name:NSCurrentLocaleDidChangeNotification object:0];
  }
  return v8;
}

- (void)_localeChanged:(id)a3
{
}

- (void)reAdjustAllDayLabelLayout
{
  if (+[EKDayAllDayView shouldAllDayTextUseTwoLines])
  {
    +[EKDayAllDayView maxAllowableAllDayTextWidth];
    +[EKDayAllDayView maxAllowableAllDayTextTwoLineHeight];
    [(UILabel *)self->_allDayLabel frame];
    double v4 = v3;
    [(UILabel *)self->_allDayLabel frame];
    [(UILabel *)self->_allDayLabel setFrame:v4];
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 1;
  }
  [(UILabel *)self->_allDayLabel setNumberOfLines:v5];
  allDayLabel = self->_allDayLabel;

  [(UILabel *)allDayLabel sizeToFit];
}

- (void)setUseMultiDayStyle:(BOOL)a3
{
  BOOL v3 = a3;
  self->_useMultiDayStyle = a3;
  if (a3) {
    CUIKAllDayBackgroundColor();
  }
  else {
  uint64_t v5 = +[UIColor colorNamed:@"weekHeaderBGColor"];
  }
  [(UIView *)self->_headerBackground setBackgroundColor:v5];

  [(UIView *)self->_topAllDaySeparatorView setHidden:v3];
  LODWORD(v5) = CalTimeDirectionIsLeftToRight();
  timeView = self->_timeView;
  BOOL v7 = [(WeekTimeView *)self _showTrailingBorder];
  if (v5) {
    [(EKDayTimeView *)timeView setShowsRightBorder:v7];
  }
  else {
    [(EKDayTimeView *)timeView setShowsLeftBorder:v7];
  }
  uint64_t v8 = [(WeekTimeView *)self _showTrailingBorder] ^ 1;
  trailingBorderView = self->_trailingBorderView;

  [(UIView *)trailingBorderView setHidden:v8];
}

- (void)setUseMaterialBackground:(BOOL)a3
{
  self->_useMaterialBackground = a3;
  effectBackgroundView = self->_effectBackgroundView;
  if (!a3 || effectBackgroundView)
  {
    [(UIVisualEffectView *)effectBackgroundView removeFromSuperview];
    double v10 = self->_effectBackgroundView;
    self->_effectBackgroundView = 0;

    v11 = +[UIColor systemBackgroundColor];
    [(WeekTimeView *)self setBackgroundColor:v11];

    v12 = CUIKAllDayBackgroundColor();
    [(UIView *)self->_allDayBackgroundColorView setBackgroundColor:v12];

    id v13 = +[UIColor colorNamed:@"weekHeaderBGColor"];
    [(UIView *)self->_headerBackground setBackgroundColor:v13];
  }
  else
  {
    id v13 = +[UIBlurEffect effectWithStyle:9];
    uint64_t v5 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v13];
    double v6 = self->_effectBackgroundView;
    self->_effectBackgroundView = v5;

    [(WeekTimeView *)self bounds];
    -[UIVisualEffectView setFrame:](self->_effectBackgroundView, "setFrame:");
    [(WeekTimeView *)self addSubview:self->_effectBackgroundView];
    [(WeekTimeView *)self sendSubviewToBack:self->_effectBackgroundView];
    BOOL v7 = +[UIColor clearColor];
    [(WeekTimeView *)self setBackgroundColor:v7];

    uint64_t v8 = +[UIColor clearColor];
    [(UIView *)self->_allDayBackgroundColorView setBackgroundColor:v8];

    id v9 = +[UIColor clearColor];
    [(UIView *)self->_headerBackground setBackgroundColor:v9];
  }
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
  -[EKDayTimeView setOrientation:](self->_timeView, "setOrientation:");

  [(WeekTimeView *)self setNeedsLayout];
}

- (void)setTimeMarkerExtensionColor:(id)a3
{
}

- (UIColor)timeMarkerExtensionColor
{
  return (UIColor *)[(EKDayTimeView *)self->_timeView timeMarkerExtensionColor];
}

- (void)setHeaderHeight:(double)a3
{
  if (self->_headerHeight != a3)
  {
    if (a3 <= 0.0) {
      a3 = 0.0;
    }
    self->_headerHeight = a3;
    [(WeekTimeView *)self setNeedsLayout];
    [(WeekTimeView *)self setNeedsDisplay];
  }
}

- (void)setAllDayHighlighted:(BOOL)a3
{
  allDayLabel = self->_allDayLabel;
  if (a3) {
    +[UIColor labelColor];
  }
  else {
  id v4 = +[UIColor secondaryLabelColor];
  }
  [(UILabel *)allDayLabel setTextColor:v4];
}

- (BOOL)allDayHighlighted
{
  BOOL v3 = +[UIColor labelColor];
  id v4 = [(UILabel *)self->_allDayLabel textColor];
  LOBYTE(self) = v3 == v4;

  return (char)self;
}

- (void)setShowsTimeMarker:(BOOL)a3
{
}

- (BOOL)showsTimeMarker
{
  return [(EKDayTimeView *)self->_timeView showsTimeMarker];
}

- (void)setDayTimeViewDelegate:(id)a3
{
  [(EKDayTimeView *)self->_timeView setDelegate:a3];
  timeView = self->_timeView;

  [(EKDayTimeView *)timeView setNeedsDisplay];
}

- (void)setHourHeightScale:(double)a3
{
  -[EKDayTimeView setHourHeightScale:](self->_timeView, "setHourHeightScale:");
  [(UIScrollView *)self->_timeScroller contentSize];
  double v6 = v5;
  +[EKDayTimeView defaultHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:self->_orientation withHourScale:a3];
  -[UIScrollView setContentSize:](self->_timeScroller, "setContentSize:", v6, v7);
  [(WeekTimeView *)self setNeedsLayout];

  [(WeekTimeView *)self setNeedsDisplay];
}

- (void)contentSizeCategoryChanged
{
  allDayLabel = self->_allDayLabel;
  id v4 = +[EKDayTimeView allDayLabelFont];
  [(UILabel *)allDayLabel setFont:v4];

  [(UILabel *)self->_allDayLabel sizeToFit];
  [(WeekTimeView *)self _updateMonthFont];
  [(WeekTimeView *)self _updateWeekNumberFont];
  [(WeekTimeView *)self _updateOverlayMonthFont];
  double v5 = [(EKDayTimeView *)self->_timeView timeMarker];
  [v5 invalidateFonts];

  [(WeekTimeView *)self setNeedsLayout];
}

- (void)setAllDayAlpha:(double)a3
{
  -[UIView setAlpha:](self->_topAllDaySeparatorView, "setAlpha:");
  allDayLabel = self->_allDayLabel;

  [(UILabel *)allDayLabel setAlpha:a3];
}

- (double)allDayAlpha
{
  [(UILabel *)self->_allDayLabel alpha];
  return result;
}

- (void)_updateMonthFont
{
  v11 = UIFontTextStyleTitle3;
  if (EKUICurrentWindowSizeParadigmForViewHierarchy() == 4)
  {
    BOOL v3 = UIFontTextStyleHeadline;

    id v4 = v3;
  }
  else
  {
    id v4 = v11;
  }
  v12 = v4;
  double v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
  double v6 = +[UIFont fontWithDescriptor:v5 size:0.0];
  [(UILabel *)self->_monthLabel setFont:v6];

  double v7 = [(UILabel *)self->_monthLabel font];
  [v7 pointSize];
  double v9 = v8;

  if (v9 > 25.0)
  {
    double v10 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5);
    [(UILabel *)self->_monthLabel setFont:v10];
  }
}

- (void)_updateWeekNumberFont
{
  BOOL v3 = [(WeekTimeView *)self traitCollection];
  int v4 = EKUIUsesRoundedRectsInsteadOfCircles();

  double v5 = 14.0;
  if (v4) {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:14.0 shouldScaleForSmallerSizes:16.0];
  }
  id v6 = +[UIFont systemFontOfSize:v5];
  [(UILabel *)self->_weekNumberLabel setFont:v6];
}

- (void)_updateOverlayMonthFont
{
  BOOL v3 = [(WeekTimeView *)self traitCollection];
  int v4 = EKUIUsesRoundedRectsInsteadOfCircles();

  double v5 = 10.0;
  if (v4) {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:10.0 shouldScaleForSmallerSizes:12.5];
  }
  id v6 = +[UIFont systemFontOfSize:v5];
  [(UILabel *)self->_overlayMonthLabel setFont:v6];
}

- (void)setMonthText:(id)a3 isCurrentMonth:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  monthLabel = self->_monthLabel;
  id v11 = v6;
  if (!monthLabel)
  {
    double v8 = (UILabel *)objc_alloc_init((Class)UILabel);
    double v9 = self->_monthLabel;
    self->_monthLabel = v8;

    [(UILabel *)self->_monthLabel setText:@" "];
    [(WeekTimeView *)self _updateMonthFont];
    [(WeekTimeView *)self addSubview:self->_monthLabel];
    [(WeekTimeView *)self bringSubviewToFront:self->_monthLabel];
    id v6 = v11;
    monthLabel = self->_monthLabel;
  }
  [(UILabel *)monthLabel setText:v6];
  if (v4) {
    CalendarAppTintColor();
  }
  else {
  double v10 = +[UIColor labelColor];
  }
  [(UILabel *)self->_monthLabel setTextColor:v10];

  [(WeekTimeView *)self setNeedsLayout];
}

- (id)monthText
{
  return [(UILabel *)self->_monthLabel text];
}

- (void)setMonthTextBaselineOffset:(double)a3
{
  self->_preferredMonthLabelBaselineOffsetFromTop = a3;
  [(WeekTimeView *)self updateMonthLabel];
}

- (void)setWeekNumberText:(id)a3
{
  id v4 = a3;
  weekNumberLabel = self->_weekNumberLabel;
  if (v4)
  {
    id v10 = v4;
    if (!weekNumberLabel)
    {
      id v6 = (UILabel *)objc_opt_new();
      double v7 = self->_weekNumberLabel;
      self->_weekNumberLabel = v6;

      double v8 = WeekendTextColor();
      [(UILabel *)self->_weekNumberLabel setTextColor:v8];

      [(WeekTimeView *)self _updateWeekNumberFont];
      [(WeekTimeView *)self addSubview:self->_weekNumberLabel];
      weekNumberLabel = self->_weekNumberLabel;
    }
    [(UILabel *)weekNumberLabel setText:v10];
    [(UILabel *)self->_weekNumberLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_weekNumberLabel setMinimumScaleFactor:0.75];
    weekNumberLabel = (UILabel *)[(WeekTimeView *)self setNeedsLayout];
  }
  else
  {
    if (!weekNumberLabel) {
      goto LABEL_8;
    }
    id v10 = 0;
    [(UILabel *)weekNumberLabel removeFromSuperview];
    double v9 = self->_weekNumberLabel;
    self->_weekNumberLabel = 0;
  }
  id v4 = v10;
LABEL_8:

  _objc_release_x1(weekNumberLabel, v4);
}

- (NSString)weekNumberText
{
  return [(UILabel *)self->_weekNumberLabel text];
}

- (void)setOverlayMonthText:(id)a3
{
  id v4 = a3;
  overlayMonthLabel = self->_overlayMonthLabel;
  id v10 = v4;
  if (v4)
  {
    if (!overlayMonthLabel)
    {
      id v6 = (UILabel *)objc_opt_new();
      double v7 = self->_overlayMonthLabel;
      self->_overlayMonthLabel = v6;

      [(WeekTimeView *)self _updateOverlayMonthFont];
      double v8 = +[UIColor labelColor];
      [(UILabel *)self->_overlayMonthLabel setTextColor:v8];

      [(WeekTimeView *)self addSubview:self->_overlayMonthLabel];
      id v4 = v10;
      overlayMonthLabel = self->_overlayMonthLabel;
    }
    [(UILabel *)overlayMonthLabel setText:v4];
    [(WeekTimeView *)self setNeedsLayout];
  }
  else if (overlayMonthLabel)
  {
    [(UILabel *)overlayMonthLabel removeFromSuperview];
    double v9 = self->_overlayMonthLabel;
    self->_overlayMonthLabel = 0;
  }
  [(WeekTimeView *)self sizeToFit];
}

- (NSString)overlayMonthText
{
  return [(UILabel *)self->_overlayMonthLabel text];
}

- (double)allDayBackgroundColorOriginY
{
  uint64_t v3 = EKUIWidthSizeClassForViewHierarchy();
  BOOL v4 = [(WeekTimeView *)self useMultiDayStyle];

  +[WeekAllDayView dayLabelHeightWithSizeClass:v3 usesMultiDay:v4];
  return result;
}

- (double)allDayOccurrenceInsetIntoScroller
{
  IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();

  +[WeekAllDayView occurrenceInsetIntoScrollerWithSizeClassRegular:IsRegularInViewHierarchy];
  return result;
}

- (double)allDayLabelOriginY
{
  +[EKDayOccurrenceView minimumHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:self->_orientation isAllDay:1];
  double v4 = v3;
  [(UILabel *)self->_allDayLabel frame];
  double v6 = v5;
  [(WeekTimeView *)self allDayOccurrenceInsetIntoScroller];
  return v7 + (v4 - v6) * 0.5;
}

- (void)updateMonthLabel
{
  monthLabel = self->_monthLabel;
  if (monthLabel)
  {
    [(UILabel *)monthLabel sizeToFit];
    double v4 = [(UILabel *)self->_monthLabel font];
    [v4 pointSize];
    double v6 = v5;

    while (v6 > 8.0)
    {
      [(UILabel *)self->_monthLabel frame];
      CGFloat v7 = CGRectGetWidth(v21) + 5.0;
      [(WeekTimeView *)self bounds];
      if (v7 <= CGRectGetWidth(v22)) {
        break;
      }
      double v6 = v6 + -1.0;
      double v8 = [(UILabel *)self->_monthLabel font];
      double v9 = [v8 fontDescriptor];
      id v10 = +[UIFont fontWithDescriptor:v9 size:v6];
      [(UILabel *)self->_monthLabel setFont:v10];

      [(UILabel *)self->_monthLabel sizeToFit];
    }
    [(UILabel *)self->_monthLabel frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    if (CalInterfaceIsLeftToRight())
    {
      [(WeekTimeView *)self bounds];
      CGRectGetMaxX(v23);
      v24.origin.x = v12;
      v24.origin.double y = v14;
      v24.size.double width = v16;
      v24.size.double height = v18;
      CGRectGetWidth(v24);
      CalRoundToScreenScale();
    }
    [(WeekTimeView *)self _yLocationForMonthLabel];
    CalRoundRectToScreenScale();
    double v19 = self->_monthLabel;
    -[UILabel setFrame:](v19, "setFrame:");
  }
}

- (void)layoutSubviews
{
  *(void *)&recta.origin.double y = self;
  *(void *)&recta.size.double width = WeekTimeView;
  [(CGFloat *)(objc_super *)&recta.origin.y layoutSubviews];
  [(WeekTimeView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  -[UIVisualEffectView setFrame:](self->_effectBackgroundView, "setFrame:");
  -[UIView setFrame:](self->_headerBackground, "setFrame:", 0.0, 0.0, v8, self->_headerHeight);
  [(EKDayTimeView *)self->_timeView sizeToFit];
  double headerHeight = self->_headerHeight;
  [(WeekTimeView *)self bounds];
  double v13 = v12;
  recta.origin.x = v4;
  v89.origin.x = v4;
  v89.origin.double y = v6;
  v89.size.double width = v8;
  v89.size.double height = v10;
  -[UIScrollView setFrame:](self->_timeScroller, "setFrame:", 0.0, headerHeight, v13, CGRectGetMaxY(v89) - self->_headerHeight);
  [(EKDayTimeView *)self->_timeView bounds];
  -[UIScrollView setContentSize:](self->_timeScroller, "setContentSize:", v14, v15);
  if (CalTimeDirectionIsLeftToRight())
  {
    [(WeekTimeView *)self bounds];
    double v17 = v16;
    EKUISeparatorLineThickness();
    double v19 = v17 - v18;
    EKUISeparatorLineThickness();
    double v21 = v20;
    double v22 = self->_headerHeight;
    trailingBorderView = self->_trailingBorderView;
    double v24 = v19;
  }
  else
  {
    EKUISeparatorLineThickness();
    double v21 = v25;
    double v22 = self->_headerHeight;
    trailingBorderView = self->_trailingBorderView;
    double v24 = 0.0;
  }
  -[UIView setFrame:](trailingBorderView, "setFrame:", v24, 0.0, v21, v22);
  [(WeekTimeView *)self updateMonthLabel];
  weekNumberLabel = self->_weekNumberLabel;
  if (weekNumberLabel)
  {
    [(UILabel *)weekNumberLabel sizeToFit];
    [(UILabel *)self->_weekNumberLabel frame];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    if (CalInterfaceIsLeftToRight())
    {
      [(WeekTimeView *)self bounds];
      CGRectGetMaxX(v90);
      v91.origin.x = v28;
      v91.origin.double y = v30;
      v91.size.double width = v32;
      v91.size.double height = v34;
      CGRectGetWidth(v91);
    }
    if ([(WeekTimeView *)self useMultiDayStyle])
    {
      +[MultiDayWeekView centerYOffsetForTitleLabelWithSizeClass:EKUIWidthSizeClassForViewHierarchy()];
    }
    else
    {
      +[WeekAllDayView baselineForWeekdayLabelsWithSizeClass:EKUIWidthSizeClassForViewHierarchy()];
      [(UILabel *)self->_weekNumberLabel _firstLineBaselineOffsetFromBoundsTop];
    }
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy())
    {
      v35 = [(WeekTimeView *)self traitCollection];
      EKUIUsesRoundedRectsInsteadOfCircles();
    }
    CalRoundRectToScreenScale();
    -[UILabel setFrame:](self->_weekNumberLabel, "setFrame:");
  }
  overlayMonthLabel = self->_overlayMonthLabel;
  if (overlayMonthLabel)
  {
    [(UILabel *)overlayMonthLabel sizeToFit];
    [(UILabel *)self->_overlayMonthLabel frame];
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    if (CalInterfaceIsLeftToRight())
    {
      [(WeekTimeView *)self bounds];
      CGRectGetMaxX(v92);
      v93.origin.x = v38;
      v93.origin.double y = v40;
      v93.size.double width = v42;
      v93.size.double height = v44;
      CGRectGetWidth(v93);
    }
    [(UILabel *)self->_monthLabel frame];
    CGRectGetMaxY(v94);
    CalRoundToScreenScale();
    CalRoundRectToScreenScale();
    -[UILabel setFrame:](self->_overlayMonthLabel, "setFrame:");
  }
  [(WeekTimeView *)self allDayBackgroundColorOriginY];
  double v46 = v45;
  double v47 = self->_headerHeight;
  [(WeekTimeView *)self allDayBackgroundColorOriginY];
  -[UIView setFrame:](self->_allDayBackgroundColorView, "setFrame:", 0.0, v46, v8, v47 - v48);
  if (self->_useMaterialBackground)
  {
    [(UIView *)self->_allDayBackgroundColorView bounds];
    v49 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 2);
    v50 = +[CAShapeLayer layer];
    [(UIView *)self->_allDayBackgroundColorView bounds];
    [v50 setFrame:];
    id v51 = v49;
    [v50 setPath:[v51 CGPath]];
    v52 = [(UIView *)self->_allDayBackgroundColorView layer];
    [v52 setMask:v50];

    [(UIVisualEffectView *)self->_effectBackgroundView bounds];
    v53 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 2);
    v54 = +[CAShapeLayer layer];
    [(UIVisualEffectView *)self->_effectBackgroundView bounds];
    [v54 setFrame:];
    id v55 = v53;
    objc_msgSend(v54, "setPath:", objc_msgSend(v55, "CGPath"));
    v56 = [(UIVisualEffectView *)self->_effectBackgroundView layer];
    [v56 setMask:v54];
  }
  else
  {
    v57 = [(UIView *)self->_allDayBackgroundColorView layer];
    [v57 setMask:0];

    id v51 = [(UIVisualEffectView *)self->_effectBackgroundView layer];
    [v51 setMask:0];
  }

  EKUISeparatorLineThickness();
  double v59 = v58;
  [(WeekTimeView *)self allDayBackgroundColorOriginY];
  -[UIView setFrame:](self->_topAllDaySeparatorView, "setFrame:", 0.0, v60, v8, v59);
  [(WeekTimeView *)self allDayAlpha];
  if (v61 <= 0.0)
  {
    [(WeekTimeView *)self allDayBackgroundColorOriginY];
    double v62 = v63;
  }
  else
  {
    [(UIView *)self->_allDayBackgroundColorView frame];
    double v62 = CGRectGetMaxY(v95) - v59;
  }
  double v64 = 0.0;
  -[UIView setFrame:](self->_bottomAllDaySeparatorView, "setFrame:", 0.0, v62, v8, v59);
  [(EKDayTimeView *)self->_timeView frame];
  CGFloat v66 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  if (CalInterfaceIsLeftToRight())
  {
    v96.origin.x = recta.origin.x;
    v96.origin.double y = v6;
    v96.size.double width = v8;
    v96.size.double height = v10;
    double Width = CGRectGetWidth(v96);
    v97.origin.x = v66;
    v97.origin.double y = v68;
    v97.size.double width = v70;
    v97.size.double height = v72;
    double v64 = Width - CGRectGetWidth(v97);
  }
  -[EKDayTimeView setFrame:](self->_timeView, "setFrame:", v64, v68, v70, v72);
  [(UILabel *)self->_allDayLabel frame];
  double v75 = v74;
  double v77 = v76;
  [(WeekTimeView *)self allDayLabelOriginY];
  CalRoundToScreenScale();
  double v79 = v78;
  +[EKDayTimeView timeInsetForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:self->_orientation];
  double v81 = v80;
  if (CalInterfaceIsLeftToRight())
  {
    [(WeekTimeView *)self frame];
    double v83 = v82 - v75 - v81 + -1.0;
    if (v83 < 0.0)
    {
      double v75 = v75 + v83;
      double v83 = 0.0;
    }
  }
  else
  {
    double v83 = v81 + 1.0;
    v98.origin.x = v81 + 1.0;
    v98.origin.double y = v79;
    v98.size.double width = v75;
    v98.size.double height = v77;
    CGFloat v84 = v81 + 1.0 + CGRectGetWidth(v98);
    [(WeekTimeView *)self frame];
    if (v84 > CGRectGetWidth(v99))
    {
      v100.origin.x = v81 + 1.0;
      v100.origin.double y = v79;
      v100.size.double width = v75;
      v100.size.double height = v77;
      double MinX = CGRectGetMinX(v100);
      v101.origin.x = v81 + 1.0;
      v101.origin.double y = v79;
      v101.size.double width = v75;
      v101.size.double height = v77;
      double v86 = MinX + CGRectGetWidth(v101);
      [(WeekTimeView *)self frame];
      double v75 = v75 + v86 - CGRectGetWidth(v102);
      [(WeekTimeView *)self frame];
      double v87 = CGRectGetWidth(v103);
      v104.origin.x = v81 + 1.0;
      v104.origin.double y = v79;
      v104.size.double width = v75;
      v104.size.double height = v77;
      double v83 = v87 - CGRectGetWidth(v104) - v81 + -1.0;
    }
  }
  -[UILabel setFrame:](self->_allDayLabel, "setFrame:", v83, v79, v75, v77);
  [(WeekTimeView *)self reAdjustAllDayLabelLayout];
}

- (double)_yLocationForMonthLabel
{
  double result = 0.0;
  if (!self->_overlayMonthLabel)
  {
    double preferredMonthLabelBaselineOffsetFromTop = self->_preferredMonthLabelBaselineOffsetFromTop;
    double result = 5.0;
    if (preferredMonthLabelBaselineOffsetFromTop > 0.0)
    {
      [(UILabel *)self->_monthLabel _firstLineBaselineOffsetFromBoundsTop];
      return preferredMonthLabelBaselineOffsetFromTop - v4;
    }
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CalRoundToScreenScale();
  double v7 = v6;
  EKUISeparatorLineThickness();
  double v9 = v8;
  -[EKDayTimeView sizeThatFits:](self->_timeView, "sizeThatFits:", width, height);
  if (v10 >= 51.0) {
    double v11 = v10;
  }
  else {
    double v11 = 51.0;
  }
  overlayMonthLabel = self->_overlayMonthLabel;
  if (overlayMonthLabel)
  {
    [(UILabel *)overlayMonthLabel sizeToFit];
    [(UILabel *)self->_overlayMonthLabel frame];
    double v13 = CGRectGetWidth(v17) + 10.0;
    if (v11 < v13) {
      double v11 = v13;
    }
  }
  if (height >= v7 + v9) {
    double v14 = height;
  }
  else {
    double v14 = v7 + v9;
  }
  double v15 = v11;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (void)updateMarkerPosition
{
}

- (UIScrollView)scrollView
{
  return self->_timeScroller;
}

- (BOOL)useMultiDayStyle
{
  return self->_useMultiDayStyle;
}

- (BOOL)useMaterialBackground
{
  return self->_useMaterialBackground;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (EKDayTimeView)timeView
{
  return self->_timeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerBackground, 0);
  objc_storeStrong((id *)&self->_bottomAllDaySeparatorView, 0);
  objc_storeStrong((id *)&self->_topAllDaySeparatorView, 0);
  objc_storeStrong((id *)&self->_allDayBackgroundColorView, 0);
  objc_storeStrong((id *)&self->_allDayLabel, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_overlayMonthLabel, 0);
  objc_storeStrong((id *)&self->_monthLabel, 0);
  objc_storeStrong((id *)&self->_trailingBorderView, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_timeScroller, 0);

  objc_storeStrong((id *)&self->_effectBackgroundView, 0);
}

@end