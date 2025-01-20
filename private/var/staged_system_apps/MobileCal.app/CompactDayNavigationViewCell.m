@interface CompactDayNavigationViewCell
+ (double)badgeDiameter;
+ (double)circleDiameter;
+ (double)contentHeightForFontSize:(double)a3 overlayFontSize:(double)a4;
+ (double)largeOverlayCircleDiameterForSizeClass:(int64_t)a3;
+ (double)overlayCircleDiameterForSizeClass:(int64_t)a3;
+ (double)roundedRectHeightToMatchMonthView;
+ (double)standardCircleDiameterForSizeClass:(int64_t)a3;
- (BOOL)applyMonthAnimationStateAdjustments;
- (BOOL)matchesMonthView;
- (BOOL)monthAnimationState;
- (BOOL)usesRoundedRectInsteadOfCircle;
- (BOOL)verticallyCompressedState;
- (CGRect)circleFrame;
- (CGRect)dayCircleFrame;
- (CompactDayNavigationViewCell)initWithFrame:(CGRect)a3;
- (CompactDayNavigationViewCell)initWithFrame:(CGRect)a3 loadMonthAnimationState:(BOOL)a4 hasOverlay:(BOOL)a5 sizeClass:(int64_t)a6;
- (UIColor)weekendColor;
- (UILabel)label;
- (double)_circleDiameter;
- (double)_circleXForDiameter:(double)a3;
- (double)baselineOffsetFromTop;
- (double)contentWidth;
- (double)fontSize;
- (double)overlayFontSize;
- (double)yCenterForDayNumbers;
- (id)badgeColor;
- (id)badgeLocale;
- (id)preferredPointerShape;
- (int64_t)badgeType;
- (void)_createMonthAnimationStateModeSubviews;
- (void)_createSubviewsWithSizeClass:(int64_t)a3;
- (void)_loadMonthAnimationStateBadgeIfNeeded;
- (void)_loadMonthAnimationStateOverlayIfNeeded;
- (void)_updateBadge;
- (void)_updateDisplayedString;
- (void)_updateMonthAnimationStateBadgeToState:(BOOL)a3;
- (void)_updateTextColor;
- (void)_updateToMatchMonthViewIfNeeded;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pulseToday;
- (void)setApplyMonthAnimationStateAdjustments:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBadgeColor:(id)a3;
- (void)setBadgeLocale:(id)a3;
- (void)setBadgeType:(int64_t)a3;
- (void)setCircleDiameter:(double)a3 overlayDiameter:(double)a4 largeOverlayDiameter:(double)a5;
- (void)setCircled:(BOOL)a3;
- (void)setCircled:(BOOL)a3 animated:(BOOL)a4;
- (void)setDate:(id)a3;
- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4;
- (void)setDisplayedString:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setIsToday:(BOOL)a3;
- (void)setIsWeekend:(BOOL)a3;
- (void)setLabelElementsVisible:(BOOL)a3;
- (void)setMatchesMonthView:(BOOL)a3;
- (void)setMonthAnimationState:(BOOL)a3;
- (void)setNeedsDisplay;
- (void)setOverlayFontSize:(double)a3;
- (void)setOverlayString:(id)a3;
- (void)setUnderlineThickness:(double)a3;
- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3;
- (void)setVerticallyCompressedState:(BOOL)a3;
- (void)setWeekendColor:(id)a3;
- (void)stopPulsing;
- (void)touchUpOccurred:(id)a3;
- (void)updateOverlay;
@end

@implementation CompactDayNavigationViewCell

- (void)setIsToday:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompactDayNavigationViewCell;
  [(DayNavigationViewCell *)&v4 setIsToday:a3];
  [(TappableDayNumber *)self->_dateNumber setIsToday:[(DayNavigationViewCell *)self isToday]];
  [(CompactDayNavigationViewCell *)self _updateTextColor];
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)CompactDayNavigationViewCell;
  [(CompactDayNavigationViewCell *)&v3 setNeedsDisplay];
  [(TappableDayNumber *)self->_dateNumber setNeedsDisplay];
}

- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(DayNavigationViewCell *)self date];
  unsigned int v8 = [v6 isEqualToDate:v7];

  if (!v8 || v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)CompactDayNavigationViewCell;
    [(DayNavigationViewCell *)&v13 setDate:v6];
    id v9 = objc_alloc((Class)EKCalendarDate);
    v10 = +[NSTimeZone calendarTimeZone];
    id v11 = [v9 initWithDate:v6 timeZone:v10];

    [v11 day];
    v12 = CUIKLocalizedStringForInteger();
    [(CompactDayNavigationViewCell *)self setDisplayedString:v12];

    [(CompactDayNavigationViewCell *)self updateOverlay];
    [(CompactDayNavigationViewCell *)self setBadgeType:0];
  }
}

- (void)updateOverlay
{
  CUIKGetOverlayCalendar();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_super v3 = [(DayNavigationViewCell *)self date];
    BOOL v4 = +[CUIKDateStrings overlayShortStringForDate:v3 inCalendar:v9];

    v5 = [(DayNavigationViewCell *)self date];
    id v6 = [v9 components:24 fromDate:v5];

    double v7 = 0.0;
    if ([v6 day] != (id)1
      || (double v7 = 1.0, [v6 month] != (id)1)
      || (double v8 = 1.5, [v6 isLeapMonth]))
    {
      double v8 = v7;
    }
  }
  else
  {
    BOOL v4 = 0;
    double v8 = 0.0;
  }
  [(CompactDayNavigationViewCell *)self setOverlayString:v4];
  [(CompactDayNavigationViewCell *)self setUnderlineThickness:v8];
  [(CompactDayNavigationViewCell *)self _updateToMatchMonthViewIfNeeded];
}

- (void)setUnderlineThickness:(double)a3
{
}

- (void)setOverlayString:(id)a3
{
  v5 = (NSString *)a3;
  p_overlayString = &self->_overlayString;
  overlayString = self->_overlayString;
  if (overlayString != v5)
  {
    v10 = v5;
    if (!v5
      || (overlayString = (NSString *)[(NSString *)overlayString isEqualToString:v5],
          v5 = v10,
          (overlayString & 1) == 0))
    {
      objc_storeStrong((id *)&self->_overlayString, a3);
      self->_hasOverlay = [(NSString *)v10 length] != 0;
      dateNumber = self->_dateNumber;
      if (dateNumber) {
        [(TappableDayNumber *)dateNumber setOverlayText:*p_overlayString];
      }
      monthAnimationStateOverlay = self->_monthAnimationStateOverlay;
      if (monthAnimationStateOverlay)
      {
        [(UILabel *)monthAnimationStateOverlay setText:*p_overlayString];
        [(CompactDayNavigationViewCell *)self _updateTextColor];
      }
      [(CompactDayNavigationViewCell *)self _updateToMatchMonthViewIfNeeded];
      overlayString = (NSString *)[(CompactDayNavigationViewCell *)self setNeedsLayout];
      v5 = v10;
    }
  }

  _objc_release_x1(overlayString, v5);
}

- (void)setDisplayedString:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_displayString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_displayString, a3);
    [(CompactDayNavigationViewCell *)self _updateDisplayedString];
  }
}

- (void)setDate:(id)a3
{
}

- (void)_updateDisplayedString
{
  dateNumber = self->_dateNumber;
  if (dateNumber) {
    [(TappableDayNumber *)dateNumber setText:self->_displayString];
  }
  monthAnimationStateDayNumber = self->_monthAnimationStateDayNumber;
  if (monthAnimationStateDayNumber)
  {
    [(UILabel *)monthAnimationStateDayNumber setText:self->_displayString];
    [(CompactDayNavigationViewCell *)self _updateTextColor];
  }
  [(CompactDayNavigationViewCell *)self _updateToMatchMonthViewIfNeeded];

  [(CompactDayNavigationViewCell *)self setNeedsLayout];
}

- (void)setMatchesMonthView:(BOOL)a3
{
  if (self->_matchesMonthView != a3)
  {
    self->_matchesMonthView = a3;
    [(CompactDayNavigationViewCell *)self _updateToMatchMonthViewIfNeeded];
  }
}

- (void)setIsWeekend:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompactDayNavigationViewCell;
  [(DayNavigationViewCell *)&v4 setIsWeekend:a3];
  [(TappableDayNumber *)self->_dateNumber setIsWeekend:[(DayNavigationViewCell *)self isWeekend]];
  [(CompactDayNavigationViewCell *)self _updateTextColor];
}

- (void)_updateTextColor
{
  if (self->_monthAnimationStateDayNumber)
  {
    if ([(DayNavigationViewCell *)self isWeekend])
    {
      weekendColor = self->_weekendColor;
      if (weekendColor)
      {
        objc_super v4 = weekendColor;
      }
      else
      {
        WeekendTextColor();
        objc_super v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_super v4 = +[UIColor labelColor];
    }
    id v5 = v4;
    [(UILabel *)self->_monthAnimationStateDayNumber setTextColor:v4];
    [(UILabel *)self->_monthAnimationStateOverlay setTextColor:v5];
  }
}

- (void)setBadgeType:(int64_t)a3
{
  if (self->_badgeType != a3)
  {
    self->_badgeType = a3;
    [(CompactDayNavigationViewCell *)self _updateBadge];
  }
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
      badgeLocale = (NSString *)[(CompactDayNavigationViewCell *)self _updateBadge];
      unint64_t v5 = v7;
    }
  }

  _objc_release_x1(badgeLocale, v5);
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
      badgeColor = (UIColor *)[(CompactDayNavigationViewCell *)self _updateBadge];
      unint64_t v5 = v7;
    }
  }

  _objc_release_x1(badgeColor, v5);
}

- (void)_updateToMatchMonthViewIfNeeded
{
  +[CompactMonthWeekView dayNumberFontSize:[(CompactDayNavigationViewCell *)self verticallyCompressedState]];
  objc_super v3 = +[TappableDayNumber normalFontForSize:](TappableDayNumber, "normalFontForSize:");
  [(UILabel *)self->_monthAnimationStateDayNumber setFont:v3];

  +[CompactMonthWeekView dayNumberOverlayFontSize:[(CompactDayNavigationViewCell *)self verticallyCompressedState]];
  objc_super v4 = +[TappableDayNumber overlayFontForSize:](TappableDayNumber, "overlayFontForSize:");
  [(UILabel *)self->_monthAnimationStateOverlay setFont:v4];

  if ([(CompactDayNavigationViewCell *)self matchesMonthView])
  {
    +[CompactMonthWeekView dayNumberFontSize:[(CompactDayNavigationViewCell *)self verticallyCompressedState]];
    -[CompactDayNavigationViewCell setFontSize:](self, "setFontSize:");
    [(CompactDayNavigationViewCell *)self fontSize];
    unint64_t v5 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    [(UILabel *)self->_monthAnimationStateDayNumber setFont:v5];

    +[CompactMonthWeekView dayNumberOverlayFontSize:[(CompactDayNavigationViewCell *)self verticallyCompressedState]];
    -[CompactDayNavigationViewCell setOverlayFontSize:](self, "setOverlayFontSize:");
    id v6 = [(CompactDayNavigationViewCell *)self traitCollection];
    [(CompactDayNavigationViewCell *)self setUsesRoundedRectInsteadOfCircle:EKUIUsesRoundedRectsInsteadOfCircles()];

    if ([(CompactDayNavigationViewCell *)self usesRoundedRectInsteadOfCircle])
    {
      displayString = self->_displayString;
      overlayString = self->_overlayString;
      [(CompactDayNavigationViewCell *)self fontSize];
      double v10 = v9;
      [(CompactDayNavigationViewCell *)self overlayFontSize];
      +[CompactMonthWeekTodayCircle roundedRectSizeForNumberString:displayString overlayString:overlayString fontSize:v10 overlayFontSize:v11];
      -[DayNavigationViewCell setRoundedRectSize:](self, "setRoundedRectSize:");
    }
    [(CompactDayNavigationViewCell *)self setNeedsLayout];
  }
}

- (BOOL)verticallyCompressedState
{
  return self->_verticallyCompressedState;
}

- (CGRect)dayCircleFrame
{
  [(TappableDayNumber *)self->_dateNumber frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  if ([(CompactDayNavigationViewCell *)self usesRoundedRectInsteadOfCircle])
  {
    [(DayNavigationViewCell *)self roundedRectSize];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
  }
  else
  {
    [(CompactDayNavigationViewCell *)self _circleDiameter];
    CGFloat v8 = v11;
    CGFloat v10 = v11;
  }
  [(CompactDayNavigationViewCell *)self bounds];
  CGRectGetMidX(v29);
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  CGRectGetWidth(v30);
  CalRoundToScreenScale();
  CGFloat v13 = v12;
  if ([(CompactDayNavigationViewCell *)self monthAnimationState]
    || [(CompactDayNavigationViewCell *)self applyMonthAnimationStateAdjustments])
  {
    +[CompactMonthWeekView dayNumberLayerYOffsetCompressed:[(CompactDayNavigationViewCell *)self verticallyCompressedState] containsFirstDayOfMonth:0];
    v14 = [(TappableDayNumber *)self->_dateNumber titleLabel];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    v23 = [(TappableDayNumber *)self->_dateNumber titleLabel];
    -[CompactDayNavigationViewCell convertRect:fromView:](self, "convertRect:fromView:", v23, v16, v18, v20, v22);
  }
  else
  {
    [(CompactDayNavigationViewCell *)self yCenterForDayNumbers];
    v31.origin.x = v13;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    CGRectGetHeight(v31);
  }
  CalRoundToScreenScale();
  double v25 = v24;
  double v26 = v13;
  double v27 = v8;
  double v28 = v10;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v25;
  result.origin.x = v26;
  return result;
}

- (double)yCenterForDayNumbers
{
  unsigned int v3 = [(CompactDayNavigationViewCell *)self usesRoundedRectInsteadOfCircle];
  double result = 21.0;
  if (v3)
  {
    [(DayNavigationViewCell *)self roundedRectSize];
    return v5 * 0.5;
  }
  return result;
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return [(TappableDayNumber *)self->_dateNumber usesRoundedRectInsteadOfCircle];
}

- (BOOL)monthAnimationState
{
  return self->_monthAnimationState;
}

- (BOOL)applyMonthAnimationStateAdjustments
{
  return self->_applyMonthAnimationStateAdjustments;
}

- (double)_circleDiameter
{
  if ([(CompactDayNavigationViewCell *)self usesRoundedRectInsteadOfCircle])
  {
    double v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CompactDayNavigationViewCell.m" lineNumber:636 description:@"Should not have tried to get the circle diameter for a rounded rect."];
  }
  if (self->_hasOverlay)
  {
    CGFloat v4 = [(TappableDayNumber *)self->_dateNumber text];
    if ((unint64_t)[v4 length] >= 2)
    {

      double v7 = &OBJC_IVAR___CompactDayNavigationViewCell__circleDiameterOverlayLarge;
    }
    else
    {
      double v5 = [(TappableDayNumber *)self->_dateNumber overlayText];
      id v6 = [v5 length];

      double v7 = &OBJC_IVAR___CompactDayNavigationViewCell__circleDiameterOverlay;
      if ((unint64_t)v6 > 2) {
        double v7 = &OBJC_IVAR___CompactDayNavigationViewCell__circleDiameterOverlayLarge;
      }
    }
  }
  else
  {
    double v7 = &OBJC_IVAR___CompactDayNavigationViewCell__circleDiameter;
  }
  return *(double *)((char *)&self->super.super.super.super.super.isa + *v7);
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
}

- (void)setOverlayFontSize:(double)a3
{
  double v3 = a3;
  if (self->_overlayString)
  {
    double v5 = +[TappableDayNumber overlayFontForSize:a3];
    NSAttributedStringKey v17 = NSFontAttributeName;
    double v18 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    double v7 = self->_circleDiameter * 0.85;
    id v8 = [objc_alloc((Class)NSAttributedString) initWithString:self->_overlayString attributes:v6];
    [v5 lineHeight];
    double v10 = v9;
    double v11 = objc_opt_new();
    [v11 setMinimumScaleFactor:0.6];
    [v8 boundingRectWithSize:1 options:v11 context:v7];
    [v11 actualScaleFactor];
    if (v12 != 1.0)
    {
      [v5 pointSize];
      double v14 = v13;
      [v11 actualScaleFactor];
      double v3 = v14 * v15;
    }
  }
  [(TappableDayNumber *)self->_dateNumber setOverlayFontSize:v3];
  if (self->_monthAnimationStateOverlay)
  {
    double v16 = +[TappableDayNumber overlayFontForSize:v3];
    [(UILabel *)self->_monthAnimationStateOverlay setFont:v16];
  }
}

- (void)setFontSize:(double)a3
{
  [(TappableDayNumber *)self->_dateNumber setFontSize:a3];
  if (self->_monthAnimationStateDayNumber)
  {
    if (self->_monthAnimationState)
    {
      [(CompactDayNavigationViewCell *)self fontSize];
      +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    }
    else
    {
      [(CompactDayNavigationViewCell *)self fontSize];
      +[TappableDayNumber normalFontForSize:](TappableDayNumber, "normalFontForSize:");
    }
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UILabel *)self->_monthAnimationStateDayNumber setFont:v4];
  }
}

- (BOOL)matchesMonthView
{
  return self->_matchesMonthView;
}

- (double)fontSize
{
  [(TappableDayNumber *)self->_dateNumber fontSize];
  return result;
}

- (void)layoutSubviews
{
  [(CompactDayNavigationViewCell *)self dayCircleFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[TappableDayNumber setFrame:](self->_dateNumber, "setFrame:");
  [(id)objc_opt_class() badgeDiameter];
  double v12 = v11;
  int IsRightToLeft = CUIKLocaleIsRightToLeft();
  double v14 = v4;
  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  if (IsRightToLeft) {
    CGRectGetMinX(*(CGRect *)&v14);
  }
  else {
    CGRectGetMaxX(*(CGRect *)&v14);
  }
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  CGRectGetMinY(v35);
  CalRoundRectToScreenScale();
  -[UIImageView setFrame:](self->_dayBadge, "setFrame:");
  double v18 = [(UIImageView *)self->_dayBadge layer];
  [v18 setCornerRadius:v12 * 0.5];

  monthAnimationStateDayNumber = self->_monthAnimationStateDayNumber;
  if (monthAnimationStateDayNumber)
  {
    [(UILabel *)monthAnimationStateDayNumber sizeToFit];
    [(UILabel *)self->_monthAnimationStateDayNumber frame];
    double v21 = v20;
    CGFloat v23 = v22;
    [(CompactDayNavigationViewCell *)self bounds];
    double v25 = (v24 - v21) * 0.5;
    +[CompactMonthWeekView dayNumberLayerYOffsetCompressed:[(CompactDayNavigationViewCell *)self verticallyCompressedState] containsFirstDayOfMonth:0];
    double v27 = v26;
    monthAnimationStateOverlay = self->_monthAnimationStateOverlay;
    if (monthAnimationStateOverlay)
    {
      [(UILabel *)monthAnimationStateOverlay sizeToFit];
      [(UILabel *)self->_monthAnimationStateOverlay frame];
      CGRectGetHeight(v36);
      CalRoundToScreenScale();
      CGFloat v30 = v27 - v29;
      [(CompactDayNavigationViewCell *)self bounds];
      v37.origin.x = v25;
      v37.origin.y = v30;
      v37.size.width = v21;
      v37.size.height = v23;
      CGRectGetMaxY(v37);
      CalRoundRectToScreenScale();
      -[UILabel setFrame:](self->_monthAnimationStateOverlay, "setFrame:");
    }
    CalRoundRectToScreenScale();
    -[UILabel setFrame:](self->_monthAnimationStateDayNumber, "setFrame:");
  }
  if (self->_badgeType && self->_monthAnimationStateDayBadge)
  {
    +[CompactMonthWeekView dayTypeBadgeFrameFromDayNumberFrame:compressed:](CompactMonthWeekView, "dayTypeBadgeFrameFromDayNumberFrame:compressed:", [(CompactDayNavigationViewCell *)self verticallyCompressedState], v4, v6, v8, v10);
    double v32 = v31;
    -[UIImageView setFrame:](self->_monthAnimationStateDayBadge, "setFrame:");
    id v33 = [(UIImageView *)self->_monthAnimationStateDayBadge layer];
    [v33 setCornerRadius:v32 * 0.5];
  }
}

+ (double)badgeDiameter
{
  return 14.0;
}

- (CompactDayNavigationViewCell)initWithFrame:(CGRect)a3 loadMonthAnimationState:(BOOL)a4 hasOverlay:(BOOL)a5 sizeClass:(int64_t)a6
{
  BOOL v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CompactDayNavigationViewCell;
  double v9 = -[DayNavigationViewCell initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v10 = v9;
  if (v9)
  {
    v9->_monthAnimationState = 0;
    v9->_hasOverlay = a5;
    [(CompactDayNavigationViewCell *)v9 _createSubviewsWithSizeClass:a6];
    if (v8) {
      [(CompactDayNavigationViewCell *)v10 _createMonthAnimationStateModeSubviews];
    }
    [(CompactDayNavigationViewCell *)v10 layoutSubviews];
    [(CompactDayNavigationViewCell *)v10 setCircled:0];
    [(id)objc_opt_class() standardCircleDiameterForSizeClass:a6];
    v10->_circleDiameter = v11;
    [(id)objc_opt_class() overlayCircleDiameterForSizeClass:a6];
    v10->_circleDiameterOverlay = v12;
    [(id)objc_opt_class() largeOverlayCircleDiameterForSizeClass:a6];
    v10->_circleDiameterOverlayLarge = v13;
    objc_initWeak(&location, v10);
    uint64_t v21 = objc_opt_class();
    double v14 = +[NSArray arrayWithObjects:&v21 count:1];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000312D0;
    v17[3] = &unk_1001D2620;
    objc_copyWeak(&v18, &location);
    id v15 = [(CompactDayNavigationViewCell *)v10 registerForTraitChanges:v14 withHandler:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (void)setCircled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(DayNavigationViewCell *)self circled] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)CompactDayNavigationViewCell;
    [(DayNavigationViewCell *)&v7 setCircled:v5];
    [(TappableDayNumber *)self->_dateNumber setCircled:v5 animated:v4];
    [(CompactDayNavigationViewCell *)self setNeedsLayout];
  }
}

- (void)setCircled:(BOOL)a3
{
}

- (void)_createSubviewsWithSizeClass:(int64_t)a3
{
  if (!self->_dateNumber)
  {
    BOOL v4 = [[TappableDayNumber alloc] initWithSizeClass:a3];
    dateNumber = self->_dateNumber;
    self->_dateNumber = v4;

    double v6 = [(CompactDayNavigationViewCell *)self backgroundColor];
    [(TappableDayNumber *)self->_dateNumber setBackgroundColor:v6];

    [(TappableDayNumber *)self->_dateNumber setUserInteractionEnabled:0];
    [(TappableDayNumber *)self->_dateNumber setIsToday:[(DayNavigationViewCell *)self isToday]];
    [(CompactDayNavigationViewCell *)self addTarget:self action:"touchUpOccurred:" forControlEvents:64];
    [(CompactDayNavigationViewCell *)self addSubview:self->_dateNumber];
    objc_super v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    dayBadge = self->_dayBadge;
    self->_dayBadge = v7;

    [(UIImageView *)self->_dayBadge setClipsToBounds:1];
    [(UIImageView *)self->_dayBadge setHidden:1];
    double v9 = self->_dayBadge;
    [(CompactDayNavigationViewCell *)self addSubview:v9];
  }
}

+ (double)standardCircleDiameterForSizeClass:(int64_t)a3
{
  EKUIMultiwindowAssert();
  double result = 35.0;
  if (a3 == 2) {
    return 28.0;
  }
  return result;
}

+ (double)overlayCircleDiameterForSizeClass:(int64_t)a3
{
  return 35.0;
}

+ (double)largeOverlayCircleDiameterForSizeClass:(int64_t)a3
{
  BOOL v3 = a3 == 2;
  EKUIMultiwindowAssert();
  return dbl_1001C11B0[v3];
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CompactDayNavigationViewCell;
  [(CompactDayNavigationViewCell *)&v7 setBackgroundColor:v4];
  [(TappableDayNumber *)self->_dateNumber setBackgroundColor:v4];
  [(UILabel *)self->_monthAnimationStateDayNumber setBackgroundColor:v4];
  [(UILabel *)self->_monthAnimationStateOverlay setBackgroundColor:v4];
  BOOL v5 = +[UIColor clearColor];
  if ([v4 isEqual:v5])
  {
    double v6 = +[UIColor systemBackgroundColor];
    [(UIImageView *)self->_dayBadge setBackgroundColor:v6];
  }
  else
  {
    [(UIImageView *)self->_dayBadge setBackgroundColor:v4];
  }
}

- (void)stopPulsing
{
  pulseView = self->_pulseView;
  if (pulseView)
  {
    [(EKUITodayCirclePulseView *)pulseView removeFromSuperview];
    id v4 = self->_pulseView;
    self->_pulseView = 0;
  }
}

+ (double)roundedRectHeightToMatchMonthView
{
  +[CompactMonthWeekView dayNumberFontSize:0];
  double v3 = v2;
  +[CompactMonthWeekView dayNumberOverlayFontSize:0];
  double v5 = v4;
  double v6 = CUIKGetOverlayCalendar();
  BOOL v7 = v6 != 0;

  +[CompactMonthWeekTodayCircle roundedRectHeightWithOverlay:v7 fontSize:v3 overlayFontSize:v5];
  return result;
}

+ (double)contentHeightForFontSize:(double)a3 overlayFontSize:(double)a4
{
  double v5 = +[TappableDayNumber circledFontForSize:a3];
  [v5 lineHeight];
  double v7 = v6;

  if (a4 > 0.0)
  {
    BOOL v8 = +[TappableDayNumber overlayFontForSize:a4];
    [v8 lineHeight];
    double v7 = v7 + v9;
  }
  return v7;
}

- (CompactDayNavigationViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = CUIKGetOverlayCalendar();
  BOOL v9 = v8 != 0;

  return -[CompactDayNavigationViewCell initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:](self, "initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:", 0, v9, 1, x, y, width, height);
}

- (void)prepareForReuse
{
  [(CompactDayNavigationViewCell *)self setCircled:0];
  [(CompactDayNavigationViewCell *)self setIsToday:0];
  [(CompactDayNavigationViewCell *)self setIsWeekend:0];

  [(CompactDayNavigationViewCell *)self setBadgeType:0];
}

- (CGRect)circleFrame
{
  [(TappableDayNumber *)self->_dateNumber frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

+ (double)circleDiameter
{
  return 35.0;
}

- (void)_createMonthAnimationStateModeSubviews
{
  double v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  monthAnimationStateDayNumber = self->_monthAnimationStateDayNumber;
  self->_monthAnimationStateDayNumber = v3;

  [(UILabel *)self->_monthAnimationStateDayNumber setTextAlignment:1];
  double v5 = [(CompactDayNavigationViewCell *)self backgroundColor];
  [(UILabel *)self->_monthAnimationStateDayNumber setBackgroundColor:v5];

  [(CompactDayNavigationViewCell *)self addSubview:self->_monthAnimationStateDayNumber];
  [(CompactDayNavigationViewCell *)self _loadMonthAnimationStateOverlayIfNeeded];
  [(CompactDayNavigationViewCell *)self _loadMonthAnimationStateBadgeIfNeeded];
  if (self->_monthAnimationState)
  {
    [(CompactDayNavigationViewCell *)self fontSize];
    +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  }
  else
  {
    [(UILabel *)self->_monthAnimationStateDayNumber setAlpha:0.0];
    [(UILabel *)self->_monthAnimationStateOverlay setAlpha:0.0];
    [(UIImageView *)self->_monthAnimationStateDayBadge setAlpha:0.0];
    [(CompactDayNavigationViewCell *)self fontSize];
    +[TappableDayNumber normalFontForSize:](TappableDayNumber, "normalFontForSize:");
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_monthAnimationStateDayNumber setFont:v6];
}

- (void)setMonthAnimationState:(BOOL)a3
{
  if (self->_monthAnimationState != a3)
  {
    BOOL v3 = a3;
    self->_monthAnimationState = a3;
    if (a3) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    if (a3) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    [(TappableDayNumber *)self->_dateNumber setAlpha:v5];
    [(UIImageView *)self->_dayBadge setAlpha:v5];
    [(UILabel *)self->_monthAnimationStateDayNumber setAlpha:v6];
    [(UILabel *)self->_monthAnimationStateOverlay setAlpha:v6];
    [(CompactDayNavigationViewCell *)self _updateMonthAnimationStateBadgeToState:v3];
  }
}

- (void)setApplyMonthAnimationStateAdjustments:(BOOL)a3
{
  if (self->_applyMonthAnimationStateAdjustments != a3)
  {
    self->_applyMonthAnimationStateAdjustments = a3;
    -[CompactDayNavigationViewCell _updateMonthAnimationStateBadgeToState:](self, "_updateMonthAnimationStateBadgeToState:");
  }
}

- (void)_loadMonthAnimationStateOverlayIfNeeded
{
  if (self->_hasOverlay && !self->_monthAnimationStateOverlay)
  {
    BOOL v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    monthAnimationStateOverladouble y = self->_monthAnimationStateOverlay;
    self->_monthAnimationStateOverladouble y = v3;

    [(UILabel *)self->_monthAnimationStateOverlay setTextAlignment:1];
    [(CompactDayNavigationViewCell *)self overlayFontSize];
    double v5 = +[TappableDayNumber overlayFontForSize:](TappableDayNumber, "overlayFontForSize:");
    [(UILabel *)self->_monthAnimationStateOverlay setFont:v5];

    double v6 = [(CompactDayNavigationViewCell *)self backgroundColor];
    [(UILabel *)self->_monthAnimationStateOverlay setBackgroundColor:v6];

    double v7 = self->_monthAnimationStateOverlay;
    [(CompactDayNavigationViewCell *)self addSubview:v7];
  }
}

- (void)_loadMonthAnimationStateBadgeIfNeeded
{
  if (!self->_monthAnimationStateDayBadge)
  {
    BOOL v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    monthAnimationStateDayBadge = self->_monthAnimationStateDayBadge;
    self->_monthAnimationStateDayBadge = v3;

    double v5 = [(UIImageView *)self->_dayBadge backgroundColor];
    [(UIImageView *)self->_monthAnimationStateDayBadge setBackgroundColor:v5];

    double v6 = self->_monthAnimationStateDayBadge;
    [(CompactDayNavigationViewCell *)self addSubview:v6];
  }
}

- (void)_updateMonthAnimationStateBadgeToState:(BOOL)a3
{
  monthAnimationStateDayBadge = self->_monthAnimationStateDayBadge;
  if (!a3)
  {
    [(UIImageView *)monthAnimationStateDayBadge setAlpha:0.0];
    [(UIImageView *)self->_dayBadge setAlpha:1.0];
    [(CompactDayNavigationViewCell *)self fontSize];
    uint64_t v9 = +[TappableDayNumber normalFontForSize:](TappableDayNumber, "normalFontForSize:");
    goto LABEL_11;
  }
  double v5 = [(UIImageView *)monthAnimationStateDayBadge image];

  if (!v5)
  {
    +[CompactMonthWeekView dayTypeBadgeDiameter:[(CompactDayNavigationViewCell *)self verticallyCompressedState]];
    double v6 = [(CompactDayNavigationViewCell *)self traitCollection];
    [v6 userInterfaceStyle];

    int64_t badgeType = self->_badgeType;
    if (badgeType == 3)
    {
      uint64_t v8 = BadgeImageForAlternateWorkday();
    }
    else
    {
      if (badgeType != 1)
      {
LABEL_9:
        double v11 = +[CompactMonthWeekView dayTypeBadgeBackgroundColorForVerticallyCompressedMode:[(CompactDayNavigationViewCell *)self verticallyCompressedState]];
        [(UIImageView *)self->_monthAnimationStateDayBadge setBackgroundColor:v11];

        goto LABEL_10;
      }
      uint64_t v8 = BadgeImageForHoliday();
    }
    double v10 = (void *)v8;
    [(UIImageView *)self->_monthAnimationStateDayBadge setImage:v8];

    goto LABEL_9;
  }
LABEL_10:
  [(UIImageView *)self->_monthAnimationStateDayBadge setAlpha:1.0];
  [(UIImageView *)self->_dayBadge setAlpha:0.0];
  [(CompactDayNavigationViewCell *)self fontSize];
  uint64_t v9 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
LABEL_11:
  id v12 = (id)v9;
  [(UILabel *)self->_monthAnimationStateDayNumber setFont:v9];
}

- (void)setVerticallyCompressedState:(BOOL)a3
{
  self->_verticallyCompressedState = a3;
  [(CompactDayNavigationViewCell *)self _updateToMatchMonthViewIfNeeded];
}

- (void)setWeekendColor:(id)a3
{
  id v5 = a3;
  dateNumber = self->_dateNumber;
  id v9 = v5;
  if (dateNumber)
  {
    id v7 = [(TappableDayNumber *)dateNumber setWeekendColor:v5];
  }
  else
  {
    objc_storeStrong((id *)&self->_weekendColor, a3);
    id v7 = (id)[(DayNavigationViewCell *)self isWeekend];
    id v8 = v9;
    if (!v7) {
      goto LABEL_6;
    }
    [(UILabel *)self->_monthAnimationStateDayNumber setTextColor:v9];
    id v7 = [(UILabel *)self->_monthAnimationStateOverlay setTextColor:v9];
  }
  id v8 = v9;
LABEL_6:

  _objc_release_x1(v7, v8);
}

- (UIColor)weekendColor
{
  if (self->_dateNumber)
  {
    double v2 = [(TappableDayNumber *)self->_dateNumber weekendColor];
  }
  else
  {
    double v2 = self->_weekendColor;
  }

  return v2;
}

- (void)setCircleDiameter:(double)a3 overlayDiameter:(double)a4 largeOverlayDiameter:(double)a5
{
  self->_circleDiameter = a3;
  self->_circleDiameterOverladouble y = a4;
  self->_circleDiameterOverlayLarge = a5;
  [(CompactDayNavigationViewCell *)self setNeedsLayout];
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (id)badgeColor
{
  badgeColor = self->_badgeColor;
  if (badgeColor)
  {
    BOOL v3 = badgeColor;
  }
  else
  {
    BOOL v3 = +[UIColor clearColor];
  }

  return v3;
}

- (id)badgeLocale
{
  return self->_badgeLocale;
}

- (void)_updateBadge
{
  BOOL v3 = [(CompactDayNavigationViewCell *)self badgeColor];

  if (!v3) {
    goto LABEL_10;
  }
  double v4 = [(CompactDayNavigationViewCell *)self traitCollection];
  [v4 userInterfaceStyle];

  int64_t badgeType = self->_badgeType;
  if (badgeType == 3)
  {
    [(id)objc_opt_class() badgeDiameter];
    double v6 = [(CompactDayNavigationViewCell *)self badgeColor];
    id v7 = [(CompactDayNavigationViewCell *)self badgeLocale];
    uint64_t v8 = BadgeImageForAlternateWorkday();
  }
  else
  {
    if (badgeType != 1) {
      goto LABEL_10;
    }
    [(id)objc_opt_class() badgeDiameter];
    double v6 = [(CompactDayNavigationViewCell *)self badgeColor];
    id v7 = [(CompactDayNavigationViewCell *)self badgeLocale];
    uint64_t v8 = BadgeImageForHoliday();
  }
  id v10 = (id)v8;

  if (v10)
  {
    [(UIImageView *)self->_dayBadge setImage:v10];
    [(UIImageView *)self->_dayBadge setHidden:0];

    return;
  }
LABEL_10:
  dayBadge = self->_dayBadge;

  [(UIImageView *)dayBadge setHidden:1];
}

- (double)overlayFontSize
{
  [(TappableDayNumber *)self->_dateNumber overlayFontSize];
  return result;
}

- (double)contentWidth
{
  dateNumber = self->_dateNumber;
  [(CompactDayNavigationViewCell *)self bounds];

  -[TappableDayNumber sizeThatFits:](dateNumber, "sizeThatFits:", v3, v4);
  return result;
}

- (double)baselineOffsetFromTop
{
  [(TappableDayNumber *)self->_dateNumber firstLineBaselineOffsetFromBoundsTop];
  double v4 = v3;
  [(TappableDayNumber *)self->_dateNumber frame];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(TappableDayNumber *)self->_dateNumber superview];
  -[CompactDayNavigationViewCell convertPoint:fromView:](self, "convertPoint:fromView:", v9, v6, v8);
  double v11 = v10;

  return v4 + v11;
}

- (void)setLabelElementsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CompactDayNavigationViewCell;
  -[DayNavigationViewCell setLabelElementsVisible:](&v5, "setLabelElementsVisible:");
  [(TappableDayNumber *)self->_dateNumber setHidden:!v3];
}

- (double)_circleXForDiameter:(double)a3
{
  [(CompactDayNavigationViewCell *)self bounds];
  EKUIScaleFactor();

  CalRoundToScreenScale();
  return result;
}

- (void)touchUpOccurred:(id)a3
{
  double v4 = [(DayNavigationViewCell *)self delegate];

  if (v4)
  {
    id v5 = [(DayNavigationViewCell *)self delegate];
    [v5 dayNavigationCellTouchUpOccurred:self];
  }
}

- (void)pulseToday
{
  if ([(DayNavigationViewCell *)self isToday] && !self->_pulseView)
  {
    [(TappableDayNumber *)self->_dateNumber frame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    if (![(CompactDayNavigationViewCell *)self usesRoundedRectInsteadOfCircle]) {
      double v6 = v6 + 2.0;
    }
    double v11 = [(CompactDayNavigationViewCell *)self superview];
    id v12 = [v11 superview];

    [v12 convertRect:self fromView:v4];
    double v17 = [objc_alloc((Class)EKUITodayCirclePulseView) initWithFrame:v13, v14, v15, v16];
    pulseView = self->_pulseView;
    self->_pulseView = v17;

    if ([(CompactDayNavigationViewCell *)self usesRoundedRectInsteadOfCircle])
    {
      [(EKUITodayCirclePulseView *)self->_pulseView setCircleShouldFillFrame:1];
      [(EKUITodayCirclePulseView *)self->_pulseView setUsesRoundedRectInsteadOfCircle:1];
    }
    else
    {
      [(CompactDayNavigationViewCell *)self _circleDiameter];
      -[EKUITodayCirclePulseView setCircleDiameter:](self->_pulseView, "setCircleDiameter:");
    }
    [(EKUITodayCirclePulseView *)self->_pulseView setString:self->_displayString];
    [(CompactDayNavigationViewCell *)self fontSize];
    double v19 = +[TappableDayNumber circledFontForSize:](TappableDayNumber, "circledFontForSize:");
    [(EKUITodayCirclePulseView *)self->_pulseView setFont:v19];

    if ([(CompactDayNavigationViewCell *)self usesRoundedRectInsteadOfCircle])
    {
      [(TappableDayNumber *)self->_dateNumber primaryNumberFrame];
      [(EKUITodayCirclePulseView *)self->_pulseView setTextYOffset:v20];
      [(EKUITodayCirclePulseView *)self->_pulseView setUsesTextYOffsetWithoutAdjustmentForOverlay:1];
    }
    else
    {
      CalRoundToScreenScale();
      -[EKUITodayCirclePulseView setTextYOffset:](self->_pulseView, "setTextYOffset:");
      -[EKUITodayCirclePulseView setTextOffsetFromCircle:](self->_pulseView, "setTextOffsetFromCircle:", 0.0, -0.5);
    }
    [(EKUITodayCirclePulseView *)self->_pulseView setTextFrameWidthAdjustment:0.0];
    if (self->_hasOverlay)
    {
      [(EKUITodayCirclePulseView *)self->_pulseView setOverlayString:self->_overlayString];
      [(CompactDayNavigationViewCell *)self overlayFontSize];
      uint64_t v21 = +[TappableDayNumber overlayFontForSize:](TappableDayNumber, "overlayFontForSize:");
      [(EKUITodayCirclePulseView *)self->_pulseView setOverlayFont:v21];
    }
    [(EKUITodayCirclePulseView *)self->_pulseView layoutIfNeeded];
    [v12 addSubview:self->_pulseView];
    [(TappableDayNumber *)self->_dateNumber setHidden:1];
    double v22 = self->_pulseView;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100032154;
    v23[3] = &unk_1001D2740;
    v23[4] = self;
    [(EKUITodayCirclePulseView *)v22 pulse:v23];
  }
}

- (id)preferredPointerShape
{
  [(CompactDayNavigationViewCell *)self circleFrame];

  return +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_badgeLocale, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_monthAnimationStateDayBadge, 0);
  objc_storeStrong((id *)&self->_dayBadge, 0);
  objc_storeStrong((id *)&self->_weekendColor, 0);
  objc_storeStrong((id *)&self->_pulseView, 0);
  objc_storeStrong((id *)&self->_monthAnimationStateOverlay, 0);
  objc_storeStrong((id *)&self->_monthAnimationStateDayNumber, 0);
  objc_storeStrong((id *)&self->_dateNumber, 0);
  objc_storeStrong((id *)&self->_overlayString, 0);

  objc_storeStrong((id *)&self->_displayString, 0);
}

@end