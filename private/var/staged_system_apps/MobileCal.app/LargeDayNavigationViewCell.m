@interface LargeDayNavigationViewCell
+ (double)dayLabelBaseHeight;
+ (double)dayLabelYMargin;
+ (double)heightRequiredWithSizeClass:(int64_t)a3 usesMultiDayStyle:(BOOL)a4;
- (BOOL)usesRoundedRectInsteadOfCircle;
- (CGRect)circleFrame;
- (CGRect)contentFrame;
- (LargeDayNavigationViewCell)initWithFrame:(CGRect)a3;
- (double)baselineOffsetFromTop;
- (double)yCenterForDayNumbers;
- (id)badgeColor;
- (id)badgeLocale;
- (id)preferredPointerShape;
- (id)weekendColor;
- (int64_t)badgeType;
- (void)_createSubviews;
- (void)_updateBadge;
- (void)_updateDisplayedStrings;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pulseToday;
- (void)setBackgroundColor:(id)a3;
- (void)setBadgeColor:(id)a3;
- (void)setBadgeLocale:(id)a3;
- (void)setBadgeType:(int64_t)a3;
- (void)setCircled:(BOOL)a3;
- (void)setCircled:(BOOL)a3 animated:(BOOL)a4;
- (void)setDate:(id)a3;
- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setIsToday:(BOOL)a3;
- (void)setIsWeekend:(BOOL)a3;
- (void)setLabelElementsVisible:(BOOL)a3;
- (void)setOverlayShowsMonth:(BOOL)a3 animated:(BOOL)a4;
- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3;
- (void)setWeekendColor:(id)a3;
- (void)stopPulsing;
- (void)touchCancelled:(id)a3;
- (void)touchDownOccurred:(id)a3;
- (void)touchUpOccurred:(id)a3;
- (void)updateOverlay;
@end

@implementation LargeDayNavigationViewCell

- (LargeDayNavigationViewCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)LargeDayNavigationViewCell;
  v3 = -[DayNavigationViewCell initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(LargeDayNavigationViewCell *)v3 _createSubviews];
    [(LargeDayNavigationViewCell *)v4 setCircled:0];
    objc_initWeak(&location, v4);
    uint64_t v12 = objc_opt_class();
    v5 = +[NSArray arrayWithObjects:&v12 count:1];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000D4DF4;
    v8[3] = &unk_1001D2620;
    objc_copyWeak(&v9, &location);
    id v6 = [(LargeDayNavigationViewCell *)v4 registerForTraitChanges:v5 withHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LargeDayNavigationViewCell;
  [(DayNavigationViewCell *)&v21 setDelegate:v4];
  if (v4)
  {
    unsigned int v5 = [v4 dayNavigationCellShouldEnableSpringLoading];
    p_springLoadInteraction = &self->_springLoadInteraction;
    springLoadInteraction = self->_springLoadInteraction;
    if (v5 == (springLoadInteraction != 0)) {
      goto LABEL_8;
    }
    if (v5)
    {
      v8 = [(DayNavigationViewCell *)self delegate];
      objc_initWeak(&location, v8);

      objc_initWeak(&from, self);
      id v9 = objc_alloc((Class)UISpringLoadedInteraction);
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      v15 = sub_1000D5010;
      v16 = &unk_1001D4DE0;
      objc_copyWeak(&v17, &location);
      objc_copyWeak(&v18, &from);
      v10 = (UISpringLoadedInteraction *)[v9 initWithActivationHandler:&v13];
      objc_super v11 = *p_springLoadInteraction;
      *p_springLoadInteraction = v10;

      -[LargeDayNavigationViewCell addInteraction:](self, "addInteraction:", *p_springLoadInteraction, v13, v14, v15, v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      goto LABEL_8;
    }
  }
  else
  {
    p_springLoadInteraction = &self->_springLoadInteraction;
    springLoadInteraction = self->_springLoadInteraction;
  }
  if (springLoadInteraction)
  {
    -[LargeDayNavigationViewCell removeInteraction:](self, "removeInteraction:");
    uint64_t v12 = *p_springLoadInteraction;
    *p_springLoadInteraction = 0;
  }
LABEL_8:
}

- (void)prepareForReuse
{
  [(LargeDayNavigationViewCell *)self setCircled:0];
  [(LargeDayNavigationViewCell *)self setIsToday:0];
  [(LargeDayNavigationViewCell *)self setIsWeekend:0];
  self->_hasOverlay = 0;
  self->_overlayShowsMonth = 0;

  [(LargeDayNavigationViewCell *)self setBadgeType:0];
}

- (CGRect)circleFrame
{
  [(TappableDayNumber *)self->_dayNumber frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_createSubviews
{
  if (!self->_dayNumber)
  {
    double v3 = [[TappableDayNumber alloc] initWithSizeClass:2];
    dayNumber = self->_dayNumber;
    self->_dayNumber = v3;

    double v5 = [(LargeDayNavigationViewCell *)self backgroundColor];
    [(TappableDayNumber *)self->_dayNumber setBackgroundColor:v5];

    [(TappableDayNumber *)self->_dayNumber setIsToday:[(DayNavigationViewCell *)self isToday]];
    [(TappableDayNumber *)self->_dayNumber setUserInteractionEnabled:0];
    [(id)objc_opt_class() _fontSize];
    -[TappableDayNumber setFontSize:](self->_dayNumber, "setFontSize:");
    [(LargeDayNavigationViewCell *)self addTarget:self action:"touchDownOccurred:" forControlEvents:1];
    [(LargeDayNavigationViewCell *)self addTarget:self action:"touchUpOccurred:" forControlEvents:64];
    [(LargeDayNavigationViewCell *)self addTarget:self action:"touchCancelled:" forControlEvents:128];
    [(LargeDayNavigationViewCell *)self addTarget:self action:"touchCancelled:" forControlEvents:256];
    [(LargeDayNavigationViewCell *)self addSubview:self->_dayNumber];
    [(LargeDayNavigationViewCell *)self setNeedsLayout];
    id v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    dayBadge = self->_dayBadge;
    self->_dayBadge = v6;

    [(UIImageView *)self->_dayBadge setClipsToBounds:1];
    [(UIImageView *)self->_dayBadge setHidden:1];
    v8 = self->_dayBadge;
    [(LargeDayNavigationViewCell *)self addSubview:v8];
  }
}

- (void)updateOverlay
{
  double v3 = CUIKGetOverlayCalendar();
  self->_hasOverlay = v3 != 0;

  overlayLabel = self->_overlayLabel;
  if (self->_hasOverlay)
  {
    if (!overlayLabel)
    {
      double v5 = (UILabel *)objc_opt_new();
      id v6 = self->_overlayLabel;
      self->_overlayLabel = v5;

      v7 = [(id)objc_opt_class() _overlayFont];
      [(UILabel *)self->_overlayLabel setFont:v7];

      [(LargeDayNavigationViewCell *)self addSubview:self->_overlayLabel];
    }
  }
  else if (overlayLabel)
  {
    [(UILabel *)overlayLabel removeFromSuperview];
    [(UIView *)self->_overlayUnderline removeFromSuperview];
    v8 = self->_overlayLabel;
    self->_overlayLabel = 0;

    overlayUnderline = self->_overlayUnderline;
    self->_overlayUnderline = 0;
  }
  if (self->_hasOverlay)
  {
    CUIKGetOverlayCalendar();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v10 = [(DayNavigationViewCell *)self date];
    if (self->_overlayShowsMonth) {
      +[CUIKDateStrings monthDayStringForDate:v10 inCalendar:v20];
    }
    else {
    objc_super v11 = +[CUIKDateStrings overlayMediumStringForDate:v10 inCalendar:v20];
    }
    [(UILabel *)self->_overlayLabel setText:v11];

    if ([(DayNavigationViewCell *)self isWeekend]) {
      WeekendTextColor();
    }
    else {
    uint64_t v12 = +[UIColor labelColor];
    }
    [(UILabel *)self->_overlayLabel setTextColor:v12];

    v13 = [v20 components:24 fromDate:v10];
    if ([v13 day] == (id)1)
    {
      double v14 = 1.0;
      if ([v13 month] == (id)1)
      {
        if ([v13 isLeapMonth]) {
          double v14 = 1.0;
        }
        else {
          double v14 = 1.5;
        }
      }
      if (!self->_overlayUnderline)
      {
        v15 = (UIView *)objc_opt_new();
        v16 = self->_overlayUnderline;
        self->_overlayUnderline = v15;

        id v17 = CalendarAppTintColor();
        [(UIView *)self->_overlayUnderline setBackgroundColor:v17];

        [(LargeDayNavigationViewCell *)self addSubview:self->_overlayUnderline];
      }
      self->_overlayUnderlineThickness = v14;
    }
    else
    {
      id v18 = self->_overlayUnderline;
      if (v18)
      {
        [(UIView *)v18 removeFromSuperview];
        v19 = self->_overlayUnderline;
        self->_overlayUnderline = 0;
      }
    }
  }
}

+ (double)heightRequiredWithSizeClass:(int64_t)a3 usesMultiDayStyle:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = CUIKGetOverlayCalendar();

  v8 = +[CUIKPreferences sharedPreferences];
  unsigned int v9 = [v8 showWeekNumbers];

  int v10 = EKUIUsesRoundedRectsInsteadOfCircles();
  if (v4)
  {
    objc_super v11 = [(id)objc_opt_class() _normalFont];
    uint64_t v12 = [a1 _overlayFont];
    [v11 pointSize];
    double v14 = v13 + 32.0;
    if (!v7)
    {
LABEL_4:

      return v14;
    }
LABEL_3:
    [v12 pointSize];
    double v14 = v14 + v15;
    goto LABEL_4;
  }
  if (a3 != 2)
  {
    objc_super v11 = [(id)objc_opt_class() _normalFont];
    uint64_t v12 = [a1 _overlayFont];
    if (v7) {
      int v17 = 1;
    }
    else {
      int v17 = v9;
    }
    [v11 pointSize];
    double v14 = v18 + 32.0;
    if (v17 != 1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!v10)
  {
    +[LargeDayNavigationViewCell dayLabelBaseHeight];
    double v20 = v19;
    +[DayNavigationViewCell circleDiameter];
    if (v21 > v20)
    {
      +[DayNavigationViewCell circleDiameter];
      double v23 = v22;
      +[LargeDayNavigationViewCell dayLabelYMargin];
      double v20 = v23 + v24;
    }
    +[LargeDayNavigationViewCell dayLabelYMargin];
    double v14 = v20 + v25;
    v26 = CUIKGetOverlayCalendar();

    if (v26) {
      return v14 + 15.5;
    }
    return v14;
  }

  +[DayNavigationViewCell roundedRectHeight];
  return result;
}

+ (double)dayLabelYMargin
{
  return 1.5;
}

+ (double)dayLabelBaseHeight
{
  return 38.0;
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
    [(LargeDayNavigationViewCell *)self setNeedsLayout];
    return;
  }
  BOOL v6 = a4;
  v7 = [(DayNavigationViewCell *)self date];
  v8 = CUIKGetOverlayCalendar();
  if (a3) {
    +[CUIKDateStrings monthDayStringForDate:v7 inCalendar:v8];
  }
  else {
  id v14 = +[CUIKDateStrings overlayMediumStringForDate:v7 inCalendar:v8];
  }

  unsigned int v9 = [(UILabel *)self->_overlayLabel text];
  unsigned __int8 v10 = [v14 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000D5920;
    v20[3] = &unk_1001D28A8;
    v20[4] = self;
    id v11 = v14;
    id v21 = v11;
    uint64_t v12 = objc_retainBlock(v20);
    double v13 = v12;
    if (v6)
    {
      double v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      int v17 = sub_1000D5980;
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
  v4.super_class = (Class)LargeDayNavigationViewCell;
  [(DayNavigationViewCell *)&v4 setIsToday:a3];
  [(TappableDayNumber *)self->_dayNumber setIsToday:[(DayNavigationViewCell *)self isToday]];
  [(LargeDayNavigationViewCell *)self _updateDisplayedStrings];
  [(LargeDayNavigationViewCell *)self setNeedsLayout];
}

- (void)setIsWeekend:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LargeDayNavigationViewCell;
  [(DayNavigationViewCell *)&v6 setIsWeekend:a3];
  [(TappableDayNumber *)self->_dayNumber setIsWeekend:[(DayNavigationViewCell *)self isWeekend]];
  if ([(DayNavigationViewCell *)self isWeekend]) {
    WeekendTextColor();
  }
  else {
  objc_super v4 = +[UIColor labelColor];
  }
  [(UILabel *)self->_leftLabel setTextColor:v4];

  if ([(DayNavigationViewCell *)self isWeekend]) {
    WeekendTextColor();
  }
  else {
  double v5 = +[UIColor labelColor];
  }
  [(UILabel *)self->_rightLabel setTextColor:v5];

  [(LargeDayNavigationViewCell *)self _updateDisplayedStrings];
  [(LargeDayNavigationViewCell *)self setNeedsLayout];
}

- (void)setWeekendColor:(id)a3
{
}

- (id)weekendColor
{
  return [(TappableDayNumber *)self->_dayNumber weekendColor];
}

- (void)setCircled:(BOOL)a3
{
}

- (void)setCircled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(DayNavigationViewCell *)self circled] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)LargeDayNavigationViewCell;
    [(DayNavigationViewCell *)&v7 setCircled:v5];
    [(TappableDayNumber *)self->_dayNumber setCircled:v5 animated:v4];
    [(LargeDayNavigationViewCell *)self setNeedsLayout];
  }
}

- (void)setDate:(id)a3
{
}

- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(DayNavigationViewCell *)self date];
  unsigned int v8 = [v6 isEqualToDate:v7];

  if (!v8 || v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)LargeDayNavigationViewCell;
    [(DayNavigationViewCell *)&v15 setDate:v6];
    unsigned int v9 = [(id)objc_opt_class() leftStringForDate:v6];
    leftString = self->_leftString;
    self->_leftString = v9;

    id v11 = [(id)objc_opt_class() centerStringForDate:v6];
    centerString = self->_centerString;
    self->_centerString = v11;

    double v13 = [(id)objc_opt_class() rightStringForDate:v6];
    rightString = self->_rightString;
    self->_rightString = v13;

    [(LargeDayNavigationViewCell *)self setBadgeType:0];
    [(LargeDayNavigationViewCell *)self _updateDisplayedStrings];
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LargeDayNavigationViewCell;
  [(LargeDayNavigationViewCell *)&v7 setBackgroundColor:v4];
  [(TappableDayNumber *)self->_dayNumber setBackgroundColor:v4];
  [(UILabel *)self->_leftLabel setBackgroundColor:v4];
  [(UILabel *)self->_rightLabel setBackgroundColor:v4];
  BOOL v5 = +[UIColor clearColor];
  if ([v4 isEqual:v5])
  {
    id v6 = +[UIColor systemBackgroundColor];
    [(UIImageView *)self->_dayBadge setBackgroundColor:v6];
  }
  else
  {
    [(UIImageView *)self->_dayBadge setBackgroundColor:v4];
  }
}

- (void)pulseToday
{
  if ([(DayNavigationViewCell *)self isToday] && !self->_pulseView)
  {
    [(TappableDayNumber *)self->_dayNumber frame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = [(LargeDayNavigationViewCell *)self superview];
    uint64_t v12 = [v11 superview];

    double v13 = [(TappableDayNumber *)self->_dayNumber superview];
    [v12 convertRect:v13 fromView:v4];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    double v22 = [objc_alloc((Class)EKUITodayCirclePulseView) initWithFrame:v15, v17, v19, v21];
    pulseView = self->_pulseView;
    self->_pulseView = v22;

    if ([(LargeDayNavigationViewCell *)self usesRoundedRectInsteadOfCircle])
    {
      [(EKUITodayCirclePulseView *)self->_pulseView setCircleShouldFillFrame:1];
      [(EKUITodayCirclePulseView *)self->_pulseView setUsesRoundedRectInsteadOfCircle:1];
    }
    else
    {
      [(id)objc_opt_class() circleDiameter];
      -[EKUITodayCirclePulseView setCircleDiameter:](self->_pulseView, "setCircleDiameter:");
    }
    [(EKUITodayCirclePulseView *)self->_pulseView setString:self->_centerString];
    double v24 = [(id)objc_opt_class() _boldFont];
    [(EKUITodayCirclePulseView *)self->_pulseView setFont:v24];

    double v25 = [(LargeDayNavigationViewCell *)self traitCollection];
    int v26 = EKUIUsesRoundedRectsInsteadOfCircles();

    if (v26)
    {
      [(TappableDayNumber *)self->_dayNumber numberFrame];
      [(EKUITodayCirclePulseView *)self->_pulseView setTextYOffset:CGRectGetMinY(v32)];
    }
    else
    {
      [(EKUITodayCirclePulseView *)self->_pulseView circleDiameter];
      [(id)objc_opt_class() defaultCircleDiameter];
      CalRoundToScreenScale();
      [(EKUITodayCirclePulseView *)self->_pulseView setTextYOffset:v27 + 3.5];
      EKUIScaleFactor();
      if (v28 <= 1.0) {
        double v29 = 0.0;
      }
      else {
        double v29 = 0.5;
      }
      -[EKUITodayCirclePulseView setTextOffsetFromCircle:](self->_pulseView, "setTextOffsetFromCircle:", 0.0, v29);
    }
    [(EKUITodayCirclePulseView *)self->_pulseView layoutIfNeeded];
    [v12 addSubview:self->_pulseView];
    [(TappableDayNumber *)self->_dayNumber setHidden:1];
    v30 = self->_pulseView;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000D6054;
    v31[3] = &unk_1001D2740;
    v31[4] = self;
    [(EKUITodayCirclePulseView *)v30 pulse:v31];
  }
}

- (void)stopPulsing
{
  pulseView = self->_pulseView;
  if (pulseView)
  {
    [(EKUITodayCirclePulseView *)pulseView removeFromSuperview];
    double v4 = self->_pulseView;
    self->_pulseView = 0;
  }
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return [(TappableDayNumber *)self->_dayNumber usesRoundedRectInsteadOfCircle];
}

- (double)baselineOffsetFromTop
{
  [(TappableDayNumber *)self->_dayNumber firstLineBaselineOffsetFromBoundsTop];
  double v4 = v3;
  [(TappableDayNumber *)self->_dayNumber frame];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(TappableDayNumber *)self->_dayNumber superview];
  -[LargeDayNavigationViewCell convertPoint:fromView:](self, "convertPoint:fromView:", v9, v6, v8);
  double v11 = v10;

  return v4 + v11;
}

- (CGRect)contentFrame
{
  [(TappableDayNumber *)self->_dayNumber numberFrame];
  -[LargeDayNavigationViewCell convertRect:fromView:](self, "convertRect:fromView:", self->_dayNumber);
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  double MinX = CGRectGetMinX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v20);
  double v11 = [(UILabel *)self->_leftLabel superview];

  if (v11)
  {
    [(UILabel *)self->_leftLabel frame];
    double MinX = fmin(MinX, CGRectGetMinX(v21));
    [(UILabel *)self->_leftLabel frame];
    double MinY = fmin(MinY, CGRectGetMinY(v22));
    [(UILabel *)self->_leftLabel frame];
    double MaxX = fmax(MaxX, CGRectGetMaxX(v23));
    [(UILabel *)self->_leftLabel frame];
    double MaxY = fmax(MaxY, CGRectGetMaxY(v24));
  }
  uint64_t v12 = [(UILabel *)self->_rightLabel superview];

  if (v12)
  {
    [(UILabel *)self->_rightLabel frame];
    double MinX = fmin(MinX, CGRectGetMinX(v25));
    [(UILabel *)self->_rightLabel frame];
    double MinY = fmin(MinY, CGRectGetMinY(v26));
    [(UILabel *)self->_rightLabel frame];
    double MaxX = fmax(MaxX, CGRectGetMaxX(v27));
    [(UILabel *)self->_rightLabel frame];
    double MaxY = fmax(MaxY, CGRectGetMaxY(v28));
  }
  double v13 = MaxX - MinX;
  double v14 = MaxY - MinY;
  double v15 = MinX;
  double v16 = MinY;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)setLabelElementsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)LargeDayNavigationViewCell;
  -[DayNavigationViewCell setLabelElementsVisible:](&v6, "setLabelElementsVisible:");
  BOOL v5 = !v3;
  [(TappableDayNumber *)self->_dayNumber setHidden:v5];
  [(UILabel *)self->_leftLabel setHidden:v5];
  [(UILabel *)self->_rightLabel setHidden:v5];
}

- (id)preferredPointerShape
{
  [(LargeDayNavigationViewCell *)self contentFrame];
  UIRectInset();

  return +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
}

- (void)layoutSubviews
{
  unsigned int v3 = [(LargeDayNavigationViewCell *)self usesRoundedRectInsteadOfCircle];
  dayNumber = self->_dayNumber;
  if (v3)
  {
    [(TappableDayNumber *)dayNumber numberFrame];
    double x = v39.origin.x;
    CGFloat y = v39.origin.y;
    CGFloat width = v39.size.width;
    double height = v39.size.height;
    double v9 = CGRectGetHeight(v39);
    v40.origin.double x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.double height = height;
    double v10 = CGRectGetWidth(v40);
    if (v9 >= v10) {
      double v11 = v9;
    }
    else {
      double v11 = v10;
    }
    [(id)objc_opt_class() roundedRectHorizontalPadding];
    double v13 = v11 + v12 * 2.0;
    [(id)objc_opt_class() roundedRectVerticalPadding];
    double v15 = height + v14 * 2.0;
    [(LargeDayNavigationViewCell *)self yCenterForDayNumbers];
    v41.origin.double x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = v13;
    v41.size.double height = v15;
    CGRectGetHeight(v41);
    CalRoundToScreenScale();
    double v17 = v16;
  }
  else
  {
    [(TappableDayNumber *)dayNumber frame];
    double x = v18;
    CGFloat v20 = v19;
    [(id)objc_opt_class() circleDiameter];
    double v15 = v21;
    [(LargeDayNavigationViewCell *)self yCenterForDayNumbers];
    v42.origin.double x = x;
    v42.origin.CGFloat y = v20;
    v42.size.CGFloat width = v15;
    v42.size.double height = v15;
    CGRectGetHeight(v42);
    CalRoundToScreenScale();
    double v23 = v22;
    [(id)objc_opt_class() defaultCircleDiameter];
    double v17 = v23 + 1.0;
    if (v15 <= v24) {
      double v17 = v23;
    }
    double v13 = v15;
  }
  -[TappableDayNumber setFrame:](self->_dayNumber, "setFrame:", x, v17, v13, v15);
  [(LargeDayNavigationViewCell *)self _updateDisplayedStrings];
  [(LargeDayNavigationViewCell *)self bounds];
  double MidX = CGRectGetMidX(v43);
  [(UILabel *)self->_leftLabel frame];
  CGRectGetWidth(v44);
  [(TappableDayNumber *)self->_dayNumber contentFrame];
  CGRectGetWidth(v45);
  [(UILabel *)self->_rightLabel frame];
  CGRectGetWidth(v46);
  [(TappableDayNumber *)self->_dayNumber frame];
  CGRectGetMinY(v47);
  [(TappableDayNumber *)self->_dayNumber firstLineBaselineOffsetFromBoundsTop];
  unsigned int v26 = [(TappableDayNumber *)self->_dayNumber circled];
  CGRect v27 = objc_opt_class();
  if (v26) {
    [v27 interTextSpacingCircled];
  }
  else {
    [v27 interTextSpacing];
  }
  if ([(id)objc_opt_class() _stringsIncludeSpacing])
  {
    [(id)objc_opt_class() _widthOfSpace];
    CalCeilToScreenScale();
  }
  if (CalInterfaceIsLeftToRight()) {
    double v28 = 4.0;
  }
  else {
    double v28 = -4.0;
  }
  CalRoundToScreenScale();
  if (self->_leftString)
  {
    [(UILabel *)self->_leftLabel frame];
    [(UILabel *)self->_leftLabel _firstLineBaselineOffsetFromBoundsTop];
    CalRoundPointToScreenScale();
    -[UILabel setFrame:](self->_leftLabel, "setFrame:");
    [(UILabel *)self->_leftLabel frame];
  }
  [(TappableDayNumber *)self->_dayNumber frame];
  [(TappableDayNumber *)self->_dayNumber contentFrame];
  CGRectGetMinX(v48);
  CalRoundToScreenScale();
  -[TappableDayNumber setFrame:](self->_dayNumber, "setFrame:");
  [(TappableDayNumber *)self->_dayNumber contentFrame];
  if (self->_rightString)
  {
    [(UILabel *)self->_rightLabel frame];
    [(UILabel *)self->_rightLabel _firstLineBaselineOffsetFromBoundsTop];
    CalRoundPointToScreenScale();
    -[UILabel setFrame:](self->_rightLabel, "setFrame:");
  }
  overlayLabel = self->_overlayLabel;
  if (overlayLabel)
  {
    [(UILabel *)overlayLabel sizeToFit];
    [(UILabel *)self->_overlayLabel frame];
    CGFloat v30 = v49.size.width;
    CGFloat v31 = v49.size.height;
    double v32 = v28 + MidX + CGRectGetWidth(v49) * -0.5;
    [(TappableDayNumber *)self->_dayNumber frame];
    CGFloat MaxY = CGRectGetMaxY(v50);
    CalRoundRectToScreenScale();
    -[UILabel setFrame:](self->_overlayLabel, "setFrame:");
    if (self->_overlayUnderline)
    {
      v51.origin.double x = v32;
      v51.origin.CGFloat y = MaxY;
      v51.size.CGFloat width = v30;
      v51.size.double height = v31;
      CGRectGetMaxY(v51);
      CalRoundToScreenScale();
      CalRoundToScreenScale();
      CalRoundRectToScreenScale();
      -[UIView setFrame:](self->_overlayUnderline, "setFrame:");
    }
  }
  if (self->_badgeType)
  {
    [(id)objc_opt_class() badgeDiameter];
    double v35 = v34 * 0.5;
    v36 = objc_opt_class();
    [(TappableDayNumber *)self->_dayNumber frame];
    [v36 badgeFrameFromDayNumberFrame:self->_rightLabel != 0];
    CalRoundRectToScreenScale();
    -[UIImageView setFrame:](self->_dayBadge, "setFrame:");
    id v37 = [(UIImageView *)self->_dayBadge layer];
    [v37 setCornerRadius:v35];
  }
}

- (void)_updateDisplayedStrings
{
  [(TappableDayNumber *)self->_dayNumber setText:self->_centerString];
  if (!self->_leftLabel && self->_leftString)
  {
    unsigned int v3 = (UILabel *)objc_opt_new();
    leftLabel = self->_leftLabel;
    self->_leftLabel = v3;

    BOOL v5 = [(LargeDayNavigationViewCell *)self backgroundColor];
    [(UILabel *)self->_leftLabel setBackgroundColor:v5];

    if ([(DayNavigationViewCell *)self isWeekend]) {
      WeekendTextColor();
    }
    else {
    objc_super v6 = +[UIColor labelColor];
    }
    [(UILabel *)self->_leftLabel setTextColor:v6];

    if (CUIKLocaleIsRightToLeft()) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 0;
    }
    [(UILabel *)self->_leftLabel setTextAlignment:v7];
    [(LargeDayNavigationViewCell *)self addSubview:self->_leftLabel];
  }
  if (!self->_rightLabel && self->_rightString)
  {
    double v8 = (UILabel *)objc_opt_new();
    rightLabel = self->_rightLabel;
    self->_rightLabel = v8;

    double v10 = [(LargeDayNavigationViewCell *)self backgroundColor];
    [(UILabel *)self->_rightLabel setBackgroundColor:v10];

    if ([(DayNavigationViewCell *)self isWeekend]) {
      WeekendTextColor();
    }
    else {
    double v11 = +[UIColor labelColor];
    }
    [(UILabel *)self->_rightLabel setTextColor:v11];

    if (CUIKLocaleIsRightToLeft()) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    [(UILabel *)self->_rightLabel setTextAlignment:v12];
    [(LargeDayNavigationViewCell *)self addSubview:self->_rightLabel];
  }
  [(UILabel *)self->_leftLabel setText:self->_leftString];
  double v13 = [(id)objc_opt_class() _normalFont];
  [(UILabel *)self->_leftLabel setFont:v13];

  [(UILabel *)self->_leftLabel sizeToFit];
  [(UILabel *)self->_rightLabel setText:self->_rightString];
  double v14 = [(id)objc_opt_class() _normalFont];
  [(UILabel *)self->_rightLabel setFont:v14];

  [(UILabel *)self->_rightLabel sizeToFit];

  [(LargeDayNavigationViewCell *)self updateOverlay];
}

- (double)yCenterForDayNumbers
{
  [(id)objc_opt_class() yCenterForDayNumbers];

  CalRoundToScreenScale();
  return result;
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(int64_t)a3
{
  int64_t badgeType = self->_badgeType;
  if (badgeType != a3)
  {
    self->_int64_t badgeType = a3;
    [(LargeDayNavigationViewCell *)self _updateBadge];
    if (!badgeType)
    {
      [(LargeDayNavigationViewCell *)self setNeedsLayout];
    }
  }
}

- (id)badgeColor
{
  badgeColor = self->_badgeColor;
  if (badgeColor)
  {
    unsigned int v3 = badgeColor;
  }
  else
  {
    unsigned int v3 = +[UIColor clearColor];
  }

  return v3;
}

- (void)setBadgeColor:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  badgeColor = self->_badgeColor;
  if (v5 | (unint64_t)badgeColor)
  {
    unint64_t v7 = v5;
    badgeColor = (UIColor *)[(UIColor *)badgeColor isEqual:v5];
    unint64_t v5 = v7;
    if ((badgeColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->_badgeColor, a3);
      badgeColor = (UIColor *)[(LargeDayNavigationViewCell *)self _updateBadge];
      unint64_t v5 = v7;
    }
  }

  _objc_release_x1(badgeColor, v5);
}

- (id)badgeLocale
{
  return self->_badgeLocale;
}

- (void)setBadgeLocale:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  badgeLocale = self->_badgeLocale;
  if (v5 | (unint64_t)badgeLocale)
  {
    unint64_t v7 = v5;
    badgeLocale = (NSString *)[(NSString *)badgeLocale isEqual:v5];
    unint64_t v5 = v7;
    if ((badgeLocale & 1) == 0)
    {
      objc_storeStrong((id *)&self->_badgeLocale, a3);
      badgeLocale = (NSString *)[(LargeDayNavigationViewCell *)self _updateBadge];
      unint64_t v5 = v7;
    }
  }

  _objc_release_x1(badgeLocale, v5);
}

- (void)_updateBadge
{
  unsigned int v3 = [(LargeDayNavigationViewCell *)self badgeColor];

  if (!v3) {
    goto LABEL_10;
  }
  double v4 = [(LargeDayNavigationViewCell *)self traitCollection];
  [v4 userInterfaceStyle];

  int64_t badgeType = self->_badgeType;
  if (badgeType == 3)
  {
    [(id)objc_opt_class() badgeDiameter];
    objc_super v6 = [(LargeDayNavigationViewCell *)self badgeColor];
    uint64_t v7 = BadgeImageForAlternateWorkday();
  }
  else
  {
    if (badgeType != 1) {
      goto LABEL_10;
    }
    [(id)objc_opt_class() badgeDiameter];
    objc_super v6 = [(LargeDayNavigationViewCell *)self badgeColor];
    uint64_t v7 = BadgeImageForHoliday();
  }
  id v9 = (id)v7;

  if (v9)
  {
    [(UIImageView *)self->_dayBadge setImage:v9];
    [(UIImageView *)self->_dayBadge setHidden:0];

    return;
  }
LABEL_10:
  dayBadge = self->_dayBadge;

  [(UIImageView *)dayBadge setHidden:1];
}

- (void)touchDownOccurred:(id)a3
{
}

- (void)touchUpOccurred:(id)a3
{
  [(TappableDayNumber *)self->_dayNumber setPressed:0];
  double v4 = [(DayNavigationViewCell *)self delegate];

  if (v4)
  {
    id v5 = [(DayNavigationViewCell *)self delegate];
    [v5 dayNavigationCellTouchUpOccurred:self];
  }
}

- (void)touchCancelled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeLocale, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_dayBadge, 0);
  objc_storeStrong((id *)&self->_springLoadInteraction, 0);
  objc_storeStrong((id *)&self->_pulseView, 0);
  objc_storeStrong((id *)&self->_rightString, 0);
  objc_storeStrong((id *)&self->_centerString, 0);
  objc_storeStrong((id *)&self->_leftString, 0);
  objc_storeStrong((id *)&self->_overlayUnderline, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);

  objc_storeStrong((id *)&self->_dayNumber, 0);
}

@end