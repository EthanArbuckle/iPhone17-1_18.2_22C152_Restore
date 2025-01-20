@interface MultiDayNavigationViewCell
+ (double)heightRequiredWithSizeClass:(int64_t)a3;
+ (id)_dayOfWeekLabelFont;
+ (id)_overlayFont;
- (BOOL)shouldShowOverlay;
- (CGRect)contentFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MultiDayNavigationViewCell)initWithFrame:(CGRect)a3;
- (double)baselineOffsetFromTop;
- (id)dayOfWeekStringForDate:(id)a3;
- (id)preferredPointerShape;
- (void)_createSubviews;
- (void)_updateDisplayedStrings;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDate:(id)a3;
- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4;
- (void)setIsToday:(BOOL)a3;
- (void)setIsWeekend:(BOOL)a3;
- (void)setLabelElementsVisible:(BOOL)a3;
- (void)setOverlayShowsMonth:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldShowOverlay:(BOOL)a3;
- (void)updateOverlay;
@end

@implementation MultiDayNavigationViewCell

- (MultiDayNavigationViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MultiDayNavigationViewCell;
  v3 = -[DayNavigationViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MultiDayNavigationViewCell *)v3 _createSubviews];
  }
  return v4;
}

- (void)_createSubviews
{
  id v3 = objc_alloc((Class)UIView);
  [(MultiDayNavigationViewCell *)self bounds];
  v4 = [v3 initWithFrame:];
  cardBackgroundView = self->_cardBackgroundView;
  self->_cardBackgroundView = v4;

  objc_super v6 = +[UIColor systemBackgroundColor];
  [(UIView *)self->_cardBackgroundView setBackgroundColor:v6];

  [(MultiDayNavigationViewCell *)self addSubview:self->_cardBackgroundView];
  v7 = (UILabel *)objc_opt_new();
  dayOfWeekLabel = self->_dayOfWeekLabel;
  self->_dayOfWeekLabel = v7;

  v9 = +[UIColor clearColor];
  [(UILabel *)self->_dayOfWeekLabel setBackgroundColor:v9];

  v10 = [(id)objc_opt_class() _dayOfWeekLabelFont];
  [(UILabel *)self->_dayOfWeekLabel setFont:v10];

  [(UILabel *)self->_dayOfWeekLabel setTextAlignment:1];
  v11 = self->_dayOfWeekLabel;

  [(MultiDayNavigationViewCell *)self addSubview:v11];
}

+ (id)_dayOfWeekLabelFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:15.0 shouldScaleForSmallerSizes:20.0];

  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
}

+ (id)_overlayFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:15.0 shouldScaleForSmallerSizes:16.0];

  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
}

- (void)layoutSubviews
{
  [(MultiDayNavigationViewCell *)self bounds];
  -[UIView setFrame:](self->_cardBackgroundView, "setFrame:");
  int IsRightToLeft = CUIKLocaleIsRightToLeft();
  [(UILabel *)self->_dayOfWeekLabel sizeToFit];
  overlayLabel = self->_overlayLabel;
  if (overlayLabel) {
    [(UILabel *)overlayLabel sizeToFit];
  }
  [(MultiDayNavigationViewCell *)self bounds];
  double v6 = v5;
  [(UILabel *)self->_dayOfWeekLabel bounds];
  double v8 = (v6 - v7) * 0.5;
  [(MultiDayNavigationViewCell *)self frame];
  double v10 = v9;
  [(UILabel *)self->_dayOfWeekLabel frame];
  double v12 = v10 - v11 + -6.0;
  [(UILabel *)self->_overlayLabel frame];
  double v14 = (v12 - v13) * 0.5;
  [(UILabel *)self->_dayOfWeekLabel bounds];
  double v16 = v15;
  [(UILabel *)self->_dayOfWeekLabel bounds];
  -[UILabel setFrame:](self->_dayOfWeekLabel, "setFrame:", v14, v8, v16);
  if (self->_overlayLabel)
  {
    [(MultiDayNavigationViewCell *)self bounds];
    double v18 = v17;
    [(UILabel *)self->_overlayLabel bounds];
    double v20 = (v18 - v19) * 0.5;
    if (IsRightToLeft)
    {
      [(UILabel *)self->_overlayLabel frame];
      double v22 = v14 - (v21 + 6.0);
    }
    else
    {
      [(UILabel *)self->_dayOfWeekLabel frame];
      double v22 = v14 + v23 + 6.0;
    }
    [(UILabel *)self->_overlayLabel bounds];
    double v25 = v24;
    [(UILabel *)self->_overlayLabel bounds];
    CGFloat v27 = v26;
    -[UILabel setFrame:](self->_overlayLabel, "setFrame:", v22, v20, v25);
    if (self->_overlayUnderline)
    {
      v30.origin.x = v22;
      v30.origin.y = v20;
      v30.size.width = v25;
      v30.size.height = v27;
      CGRectGetMaxY(v30);
      CalRoundToScreenScale();
      CalRoundToScreenScale();
      CalRoundRectToScreenScale();
      overlayUnderline = self->_overlayUnderline;
      -[UIView setFrame:](overlayUnderline, "setFrame:");
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_dayOfWeekLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setShouldShowOverlay:(BOOL)a3
{
  self->_shouldShowOverlay = a3;
  [(MultiDayNavigationViewCell *)self updateOverlay];
}

- (void)prepareForReuse
{
  self->_hasOverlay = 0;
  self->_overlayShowsMonth = 0;
}

- (void)updateOverlay
{
  if ([(MultiDayNavigationViewCell *)self shouldShowOverlay])
  {
    double v3 = CUIKGetOverlayCalendar();
    p_hasOverlay = &self->_hasOverlay;
    self->_hasOverlay = v3 != 0;

    if (self->_hasOverlay)
    {
      if (!self->_overlayLabel)
      {
        double v5 = (UILabel *)objc_opt_new();
        overlayLabel = self->_overlayLabel;
        self->_overlayLabel = v5;

        double v7 = [(id)objc_opt_class() _overlayFont];
        [(UILabel *)self->_overlayLabel setFont:v7];

        [(MultiDayNavigationViewCell *)self addSubview:self->_overlayLabel];
      }
      goto LABEL_8;
    }
  }
  else
  {
    p_hasOverlay = &self->_hasOverlay;
    self->_hasOverlay = 0;
  }
  double v8 = self->_overlayLabel;
  if (v8)
  {
    [(UILabel *)v8 removeFromSuperview];
    [(UIView *)self->_overlayUnderline removeFromSuperview];
    double v9 = self->_overlayLabel;
    self->_overlayLabel = 0;

    overlayUnderline = self->_overlayUnderline;
    self->_overlayUnderline = 0;
  }
LABEL_8:
  if (*p_hasOverlay)
  {
    CUIKGetOverlayCalendar();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    double v11 = [(DayNavigationViewCell *)self date];
    if (self->_overlayShowsMonth) {
      +[CUIKDateStrings monthDayStringForDate:v11 inCalendar:v21];
    }
    else {
    double v12 = +[CUIKDateStrings overlayMediumStringForDate:v11 inCalendar:v21];
    }
    [(UILabel *)self->_overlayLabel setText:v12];

    if ([(DayNavigationViewCell *)self isWeekend]) {
      WeekendTextColor();
    }
    else {
    double v13 = +[UIColor labelColor];
    }
    [(UILabel *)self->_overlayLabel setTextColor:v13];

    double v14 = [v21 components:24 fromDate:v11];
    if ([v14 day] == (id)1)
    {
      double v15 = 1.0;
      if ([v14 month] == (id)1)
      {
        if ([v14 isLeapMonth]) {
          double v15 = 1.0;
        }
        else {
          double v15 = 1.5;
        }
      }
      if (!self->_overlayUnderline)
      {
        double v16 = (UIView *)objc_opt_new();
        double v17 = self->_overlayUnderline;
        self->_overlayUnderline = v16;

        double v18 = CalendarAppTintColor();
        [(UIView *)self->_overlayUnderline setBackgroundColor:v18];

        [(MultiDayNavigationViewCell *)self addSubview:self->_overlayUnderline];
      }
      self->_overlayUnderlineThickness = v15;
    }
    else
    {
      double v19 = self->_overlayUnderline;
      if (v19)
      {
        [(UIView *)v19 removeFromSuperview];
        double v20 = self->_overlayUnderline;
        self->_overlayUnderline = 0;
      }
    }
  }
}

- (void)setOverlayShowsMonth:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_overlayShowsMonth == a3) {
    return;
  }
  self->_overlayShowsMonth = a3;
  if (!self->_overlayLabel)
  {
LABEL_14:
    [(MultiDayNavigationViewCell *)self setNeedsLayout];
    return;
  }
  BOOL v6 = a4;
  double v7 = [(DayNavigationViewCell *)self date];
  double v8 = CUIKGetOverlayCalendar();
  if (a3) {
    +[CUIKDateStrings monthDayStringForDate:v7 inCalendar:v8];
  }
  else {
  id v14 = +[CUIKDateStrings overlayMediumStringForDate:v7 inCalendar:v8];
  }

  double v9 = [(UILabel *)self->_overlayLabel text];
  unsigned __int8 v10 = [v14 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000D10B0;
    v20[3] = &unk_1001D28A8;
    v20[4] = self;
    id v11 = v14;
    id v21 = v11;
    double v12 = objc_retainBlock(v20);
    double v13 = v12;
    if (v6)
    {
      double v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      double v17 = sub_1000D1110;
      double v18 = &unk_1001D3038;
      double v19 = v12;
      +[UIView animateWithDuration:&v15 animations:0.3];
    }
    else
    {
      ((void (*)(void *))v12[2])(v12);
    }

    goto LABEL_14;
  }
}

- (void)setIsToday:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MultiDayNavigationViewCell;
  [(DayNavigationViewCell *)&v4 setIsToday:a3];
  [(MultiDayNavigationViewCell *)self _updateDisplayedStrings];
}

- (void)setIsWeekend:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MultiDayNavigationViewCell;
  [(DayNavigationViewCell *)&v4 setIsWeekend:a3];
  [(MultiDayNavigationViewCell *)self _updateDisplayedStrings];
}

- (void)setDate:(id)a3
{
}

- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(DayNavigationViewCell *)self date];
  unsigned int v8 = [v6 isEqualToDate:v7];

  if (!v8 || v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)MultiDayNavigationViewCell;
    [(DayNavigationViewCell *)&v11 setDate:v6];
    double v9 = [(MultiDayNavigationViewCell *)self dayOfWeekStringForDate:v6];
    dayOfWeekString = self->_dayOfWeekString;
    self->_dayOfWeekString = v9;

    [(MultiDayNavigationViewCell *)self _updateDisplayedStrings];
  }
}

- (id)dayOfWeekStringForDate:(id)a3
{
  return (id)_CUIKAbbreviatedEmDashDayStringForDate(a3, 0);
}

- (double)baselineOffsetFromTop
{
  [(UILabel *)self->_dayOfWeekLabel _firstLineBaselineOffsetFromBoundsTop];
  return result;
}

- (CGRect)contentFrame
{
  int IsRightToLeft = CUIKLocaleIsRightToLeft();
  [(UILabel *)self->_dayOfWeekLabel frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(UILabel *)self->_overlayLabel frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v28 = v18;
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  double MinX = CGRectGetMinX(v30);
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  double MinY = CGRectGetMinY(v31);
  CGFloat v26 = v17;
  CGFloat v27 = v13;
  v32.origin.x = v13;
  v32.origin.y = v15;
  v32.size.width = v17;
  v32.size.height = v28;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  double MaxY = CGRectGetMaxY(v33);
  if (IsRightToLeft)
  {
    v34.size.width = v26;
    v34.origin.x = v27;
    v34.origin.y = v15;
    v34.size.height = v28;
    double MinX = CGRectGetMinX(v34);
    v35.origin.x = v5;
    v35.origin.y = v7;
    v35.size.width = v9;
    v35.size.height = v11;
    double MaxX = CGRectGetMaxX(v35);
  }
  double v22 = MaxX - MinX;
  double v23 = MinY;
  double v24 = MaxY - MinY;
  double v25 = MinX;
  result.size.height = v24;
  result.size.width = v22;
  result.origin.y = v23;
  result.origin.x = v25;
  return result;
}

- (void)setLabelElementsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MultiDayNavigationViewCell;
  -[DayNavigationViewCell setLabelElementsVisible:](&v6, "setLabelElementsVisible:");
  BOOL v5 = !v3;
  [(UILabel *)self->_dayOfWeekLabel setHidden:v5];
  [(UILabel *)self->_overlayLabel setHidden:v5];
}

- (id)preferredPointerShape
{
  [(MultiDayNavigationViewCell *)self contentFrame];
  UIRectInset();

  return +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
}

- (void)_updateDisplayedStrings
{
  [(UILabel *)self->_dayOfWeekLabel setText:self->_dayOfWeekString];
  if ([(DayNavigationViewCell *)self isToday])
  {
    uint64_t v3 = TodayTimelineColor();
  }
  else
  {
    if ([(DayNavigationViewCell *)self isWeekend]) {
      WeekendTextColor();
    }
    else {
    uint64_t v3 = +[UIColor labelColor];
    }
  }
  double v4 = (void *)v3;
  [(UILabel *)self->_dayOfWeekLabel setTextColor:v3];

  [(MultiDayNavigationViewCell *)self updateOverlay];

  [(MultiDayNavigationViewCell *)self setNeedsLayout];
}

+ (double)heightRequiredWithSizeClass:(int64_t)a3
{
  uint64_t v3 = [(id)objc_opt_class() _normalFont];
  [v3 pointSize];
  double v5 = v4 + 20.0;

  return v5;
}

- (BOOL)shouldShowOverlay
{
  return self->_shouldShowOverlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayOfWeekString, 0);
  objc_storeStrong((id *)&self->_overlayUnderline, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_dayOfWeekLabel, 0);

  objc_storeStrong((id *)&self->_cardBackgroundView, 0);
}

@end