@interface DayNavigationViewCell
+ (BOOL)_stringsIncludeSpacing;
+ (CGRect)badgeFrameFromDayNumberFrame:(CGRect)a3 isRightToLeft:(BOOL)a4;
+ (_NSRange)_rangeForFirstSequenceOfDCharacters:(id)a3;
+ (double)_fontSize;
+ (double)_widthOfSpace;
+ (double)badgeDiameter;
+ (double)circleDiameter;
+ (double)defaultCircleDiameter;
+ (double)interTextSpacing;
+ (double)interTextSpacingCircled;
+ (double)roundedRectBaselineOffset;
+ (double)roundedRectBottomSpacing;
+ (double)roundedRectHeight;
+ (double)roundedRectHorizontalPadding;
+ (double)roundedRectVerticalPadding;
+ (double)yCenterForDayNumbers;
+ (id)_boldFont;
+ (id)_centerDateFormatter;
+ (id)_findFormatForLocale:(id)a3 usingExampleDate:(id)a4;
+ (id)_leftDateFormatter;
+ (id)_normalFont;
+ (id)_overlayFont;
+ (id)_rightDateFormatter;
+ (id)centerStringForDate:(id)a3;
+ (id)leftStringForDate:(id)a3;
+ (id)rightStringForDate:(id)a3;
+ (void)_generateFormatStringsIfNeeded;
+ (void)_updateFormatter;
+ (void)contentSizeCategoryChanged;
+ (void)localeChanged;
- (BOOL)circled;
- (BOOL)isToday;
- (BOOL)isWeekend;
- (BOOL)labelElementsVisible;
- (BOOL)usesRoundedRectInsteadOfCircle;
- (CGRect)circleFrame;
- (CGRect)dayCircleFrame;
- (CGSize)roundedRectSize;
- (DayNavigationViewCell)initWithFrame:(CGRect)a3;
- (DayNavigationViewCellDelegate)delegate;
- (NSDate)date;
- (NSString)badgeLocale;
- (NSString)description;
- (UIColor)badgeColor;
- (double)baselineOffsetFromTop;
- (double)fontSize;
- (double)overlayFontSize;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)preferredPointerShape;
- (int64_t)badgeType;
- (void)_setUpInteraction;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)prepareForReuse;
- (void)pulseToday;
- (void)setBadgeColor:(id)a3;
- (void)setBadgeLocale:(id)a3;
- (void)setBadgeType:(int64_t)a3;
- (void)setCircled:(BOOL)a3;
- (void)setCircled:(BOOL)a3 animated:(BOOL)a4;
- (void)setDate:(id)a3;
- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setIsToday:(BOOL)a3;
- (void)setIsWeekend:(BOOL)a3;
- (void)setLabelElementsVisible:(BOOL)a3;
- (void)setOverlayFontSize:(double)a3;
- (void)setRoundedRectSize:(CGSize)a3;
- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3;
- (void)stopPulsing;
@end

@implementation DayNavigationViewCell

- (void)setDelegate:(id)a3
{
}

- (void)setDate:(id)a3
{
}

- (void)setIsWeekend:(BOOL)a3
{
  self->_isWeekend = a3;
}

- (BOOL)isWeekend
{
  return self->_isWeekend;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)circled
{
  return self->_circled;
}

- (DayNavigationViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DayNavigationViewCell;
  v3 = -[DayNavigationViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(DayNavigationViewCell *)v3 _setUpInteraction];
  }
  return v4;
}

- (void)_setUpInteraction
{
  id v3 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:self];
  [(DayNavigationViewCell *)self addInteraction:v3];
}

- (BOOL)isToday
{
  return self->_isToday;
}

- (void)setIsToday:(BOOL)a3
{
  self->_isToday = a3;
}

- (void)setCircled:(BOOL)a3
{
  self->_circled = a3;
}

- (CGRect)circleFrame
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)description
{
  [(DayNavigationViewCell *)self frame];
  id v3 = NSStringFromRect(v8);
  v4 = [(DayNavigationViewCell *)self date];
  v5 = +[NSString stringWithFormat:@"frame: %@  date: %@", v3, v4];

  return (NSString *)v5;
}

- (double)baselineOffsetFromTop
{
  return 0.0;
}

- (CGRect)dayCircleFrame
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)preferredPointerShape
{
  return 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  [(DayNavigationViewCell *)self contentFrame];
  double x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double height = v17.size.height;
  if (CGRectIsEmpty(v17)
    || ([v6 location],
        v16.double x = v11,
        v16.double y = v12,
        v18.origin.double x = x,
        v18.origin.double y = y,
        v18.size.double width = width,
        v18.size.double height = height,
        !CGRectContainsPoint(v18, v16)))
  {
    v13 = 0;
  }
  else
  {
    v13 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, x, y, width, height);
  }

  return v13;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004CFF0;
  v5[3] = &unk_1001D27D8;
  v5[4] = self;
  [a5 addCompletion:v5, a4];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(DayNavigationViewCell *)self labelElementsVisible];
  [(DayNavigationViewCell *)self setLabelElementsVisible:1];
  [v5 rect];
  v7 = createImageViewFromView();
  id v8 = objc_alloc((Class)UIPreviewTarget);
  [v5 rect];
  double MidX = CGRectGetMidX(v22);
  [v5 rect];
  id v10 = [v8 initWithContainer:self MidX:CGRectGetMidY(v23)];
  [v5 rect];
  double v12 = v11;
  double v14 = v13;

  [v7 setFrame:CGPointZero.x, CGPointZero.y, v12, v14];
  id v15 = objc_alloc_init((Class)UIPreviewParameters);
  id v16 = [objc_alloc((Class)UITargetedPreview) initWithView:v7 parameters:v15 target:v10];
  [(DayNavigationViewCell *)self setLabelElementsVisible:v6];
  CGRect v17 = +[UIPointerEffect effectWithPreview:v16];
  CGRect v18 = [(DayNavigationViewCell *)self preferredPointerShape];
  v19 = +[UIPointerStyle styleWithEffect:v17 shape:v18];

  return v19;
}

+ (void)contentSizeCategoryChanged
{
  qword_100213900 = 0xBFF0000000000000;
  v2 = (void *)qword_1002165B8;
  qword_1002165B8 = 0;

  id v3 = (void *)qword_1002165C0;
  qword_1002165C0 = 0;

  v4 = (void *)qword_1002165A0;
  qword_1002165A0 = 0;

  id v5 = (void *)qword_1002165A8;
  qword_1002165A8 = 0;

  BOOL v6 = (void *)qword_1002165B0;
  qword_1002165B0 = 0;
}

+ (double)_fontSize
{
  v2 = +[NSLocale currentLocale];
  id v3 = [v2 objectForKey:NSLocaleLanguageCode];

  v4 = CUIKLocalizedStringForInteger();
  unsigned int v5 = [v4 isEqual:@"൧"];

  unsigned int v6 = [v3 isEqual:@"ml"];
  EKUICurrentWindowSize();
  if (v7 <= v8) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  if (v7 < v8) {
    double v7 = v8;
  }
  double v10 = 23.0;
  if (v9 == 744.0 && v7 == 1133.0)
  {
    double v11 = +[NSLocale currentLocale];
    double v12 = [v11 localeIdentifier];
    unsigned int v13 = [v12 hasPrefix:@"ja_"];

    double v10 = 17.0;
    if (!v13) {
      double v10 = 23.0;
    }
  }
  double v14 = 17.0;
  if ((v6 & v5) != 0) {
    double v14 = 14.0;
  }
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:v14 shouldScaleForSmallerSizes:v10];
  double v16 = v15;

  return v16;
}

+ (id)_normalFont
{
  [a1 _fontSize];
  v2 = (void *)qword_1002165B8;
  if (!qword_1002165B8)
  {
    uint64_t v3 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    v4 = (void *)qword_1002165B8;
    qword_1002165B8 = v3;

    v2 = (void *)qword_1002165B8;
  }

  return v2;
}

+ (id)_boldFont
{
  [a1 _fontSize];
  v2 = (void *)qword_1002165C0;
  if (!qword_1002165C0)
  {
    uint64_t v3 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
    v4 = (void *)qword_1002165C0;
    qword_1002165C0 = v3;

    v2 = (void *)qword_1002165C0;
  }

  return v2;
}

+ (id)_overlayFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:11.0 shouldScaleForSmallerSizes:17.0];

  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

+ (double)circleDiameter
{
  double result = *(double *)&qword_100213900;
  if (*(double *)&qword_100213900 < 0.0)
  {
    id v4 = objc_alloc_init((Class)NSDateComponents);
    [v4 setYear:2014];
    [v4 setMonth:12];
    [v4 setDay:25];
    [v4 setHour:12];
    [v4 setSecond:0];
    [v4 setMinute:0];
    unsigned int v5 = CUIKCalendar();
    unsigned int v6 = [v5 dateFromComponents:v4];

    double v7 = [a1 centerStringForDate:v6];
    double v8 = [a1 _boldFont];
    double v9 = +[NSDictionary dictionaryWithObject:v8 forKey:NSFontAttributeName];

    [v7 sizeWithAttributes:v9];
    *(float *)&double v11 = v10 * v10 + v11 * v11;
    double v12 = sqrtf(*(float *)&v11);
    [(id)objc_opt_class() defaultCircleDiameter];
    if (v13 < v12) {
      double v13 = v12;
    }
    qword_100213900 = ceil(v13);

    return *(double *)&qword_100213900;
  }
  return result;
}

+ (double)defaultCircleDiameter
{
  return 28.0;
}

+ (double)yCenterForDayNumbers
{
  return 21.0;
}

+ (double)roundedRectHorizontalPadding
{
  return 5.0;
}

+ (double)roundedRectVerticalPadding
{
  return 2.0;
}

+ (double)roundedRectBottomSpacing
{
  return 5.0;
}

+ (double)interTextSpacing
{
  return 4.0;
}

+ (double)interTextSpacingCircled
{
  return 6.0;
}

+ (double)badgeDiameter
{
  return 14.0;
}

+ (double)roundedRectHeight
{
  [a1 yCenterForDayNumbers];
  CalRoundToScreenScale();
  uint64_t v3 = [a1 _normalFont];
  [v3 lineHeight];
  CalRoundToScreenScale();

  CalRoundToScreenScale();
  double v5 = v4;
  unsigned int v6 = CUIKGetOverlayCalendar();

  if (v6)
  {
    double v7 = [a1 _overlayFont];
    [v7 lineHeight];
    CalRoundToScreenScale();
    double v5 = v5 + v8;
  }
  return v5 + 5.0;
}

+ (double)roundedRectBaselineOffset
{
  [a1 yCenterForDayNumbers];
  CalRoundToScreenScale();
  uint64_t v3 = [a1 _normalFont];
  [v3 lineHeight];
  CalRoundToScreenScale();
  [a1 _fontSize];
  +[TappableDayNumber firstLineBaselineOffsetForFontSize:](TappableDayNumber, "firstLineBaselineOffsetForFontSize:");
  CalRoundToScreenScale();
  double v5 = v4;

  return v5;
}

+ (id)leftStringForDate:(id)a3
{
  id v4 = a3;
  [a1 _generateFormatStringsIfNeeded];
  if (qword_1002165A0)
  {
    double v5 = [a1 _leftDateFormatter];
    [v5 setDateFormat:qword_1002165A0];
    unsigned int v6 = [v5 stringFromDate:v4];
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

+ (id)centerStringForDate:(id)a3
{
  id v4 = a3;
  [a1 _generateFormatStringsIfNeeded];
  if (qword_1002165A8)
  {
    double v5 = [a1 _centerDateFormatter];
    [v5 setDateFormat:qword_1002165A8];
    unsigned int v6 = [v5 stringFromDate:v4];
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

+ (id)rightStringForDate:(id)a3
{
  id v4 = a3;
  [a1 _generateFormatStringsIfNeeded];
  if (qword_1002165B0)
  {
    double v5 = [a1 _rightDateFormatter];
    [v5 setDateFormat:qword_1002165B0];
    unsigned int v6 = [v5 stringFromDate:v4];
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

+ (double)_widthOfSpace
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D984;
  block[3] = &unk_1001D2FA8;
  block[4] = a1;
  if (qword_1002165D0 != -1) {
    dispatch_once(&qword_1002165D0, block);
  }
  return *(double *)&qword_1002165C8;
}

+ (BOOL)_stringsIncludeSpacing
{
  return byte_1002165D8;
}

+ (void)localeChanged
{
  [a1 _updateFormatter];
  v2 = (void *)qword_1002165A0;
  qword_1002165A0 = 0;

  uint64_t v3 = (void *)qword_1002165A8;
  qword_1002165A8 = 0;

  id v4 = (void *)qword_1002165B0;
  qword_1002165B0 = 0;

  qword_100213900 = 0xBFF0000000000000;
}

+ (_NSRange)_rangeForFirstSequenceOfDCharacters:(id)a3
{
  id v3 = a3;
  id v4 = [v3 length];
  NSUInteger v5 = 0;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    id v7 = v4;
    if (v4)
    {
      double v8 = [v3 UTF8String];
      uint64_t v9 = 0;
      NSUInteger v5 = 0;
      BOOL v10 = 0;
      do
      {
        BOOL v11 = v8[v9] == 100;
        if (v8[v9] == 100)
        {
          if (!v5) {
            uint64_t v6 = v9;
          }
          ++v5;
        }
        else if (v10)
        {
          break;
        }
        ++v9;
        BOOL v10 = v11;
      }
      while (v7 != (id)v9);
    }
  }

  NSUInteger v12 = v6;
  NSUInteger v13 = v5;
  result.length = v13;
  result.location = v12;
  return result;
}

+ (void)_generateFormatStringsIfNeeded
{
  if (!qword_1002165A8)
  {
    v2 = +[NSLocale currentLocale];
    id v3 = [v2 localeIdentifier];
    unsigned int v4 = [v3 isEqualToString:@"en_US"];

    long long v22 = xmmword_1001C12F0;
    if (v4)
    {
      byte_1002165D8 = 0;
      NSUInteger v5 = @"EEEd";
      id v6 = [(id)objc_opt_class() _rangeForFirstSequenceOfDCharacters:@"EEEd"];
      *(void *)&long long v22 = v6;
      *((void *)&v22 + 1) = v7;
    }
    else
    {
      byte_1002165D8 = 1;
      GetFormatAnd_d_FieldRangeFor_Ed(v2, (uint64_t *)&v22);
      NSUInteger v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v6 = (id)v22;
    }
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      double v8 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Scrubber cell: unable to generate date format, defaulting to US layout.", v21, 2u);
      }

      byte_1002165D8 = 0;
      NSUInteger v5 = @"EEEd";
      id v6 = [(id)objc_opt_class() _rangeForFirstSequenceOfDCharacters:@"EEEd"];
      uint64_t v10 = v9;
      *(void *)&long long v22 = v6;
      *((void *)&v22 + 1) = v9;
    }
    else
    {
      uint64_t v10 = *((void *)&v22 + 1);
    }
    BOOL v11 = -[__CFString substringWithRange:](v5, "substringWithRange:", v6, v10);
    if ((void)v22)
    {
      NSUInteger v12 = -[__CFString substringToIndex:](v5, "substringToIndex:");
      uint64_t v13 = v22;
    }
    else
    {
      uint64_t v13 = 0;
      NSUInteger v12 = 0;
    }
    unint64_t v14 = *((void *)&v22 + 1) + v13;
    if (v14 >= (unint64_t)[(__CFString *)v5 length])
    {
      double v15 = 0;
    }
    else
    {
      double v15 = [(__CFString *)v5 substringFromIndex:v14];
    }
    double v16 = (void *)qword_1002165A8;
    qword_1002165A8 = (uint64_t)v11;
    id v17 = v11;

    int IsRightToLeft = CUIKLocaleIsRightToLeft();
    if (IsRightToLeft) {
      v19 = v15;
    }
    else {
      v19 = v12;
    }
    if (IsRightToLeft) {
      v20 = v12;
    }
    else {
      v20 = v15;
    }
    objc_storeStrong((id *)&qword_1002165A0, v19);
    objc_storeStrong((id *)&qword_1002165B0, v20);
  }
}

+ (id)_findFormatForLocale:(id)a3 usingExampleDate:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  [a1 _widthOfSpace];
  double v8 = v7 * -3.0 + 80.0;
  id v9 = objc_alloc_init((Class)NSDateFormatter);
  [v9 setLocale:v6];
  uint64_t v10 = CUIKCalendar();
  [v9 setCalendar:v10];

  BOOL v11 = CUIKCalendar();
  NSUInteger v12 = [v11 timeZone];
  [v9 setTimeZone:v12];

  double v13 = v8 + 1000.0;
  if (v8 + 1000.0 <= v8)
  {
    id v17 = @"EEE d";
  }
  else
  {
    uint64_t v14 = 0;
    double v15 = @"EEE d";
    while (v14 < (uint64_t)objc_msgSend(&off_1001DC998, "count", v13))
    {
      double v16 = [&off_1001DC998 objectAtIndexedSubscript:v14];
      id v17 = +[NSDateFormatter dateFormatFromTemplate:v16 options:0 locale:v6];

      [v9 setDateFormat:v17];
      CGRect v18 = [v9 stringFromDate:v24];
      NSAttributedStringKey v25 = NSFontAttributeName;
      v19 = [a1 _boldFont];
      v26 = v19;
      v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [v18 sizeWithAttributes:v20];
      double v22 = v21;

      ++v14;
      double v15 = v17;
      if (v22 <= v8) {
        goto LABEL_8;
      }
    }
    id v17 = v15;
  }
LABEL_8:

  return v17;
}

+ (id)_leftDateFormatter
{
  id v3 = (void *)qword_100216588;
  if (!qword_100216588)
  {
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    NSUInteger v5 = (void *)qword_100216588;
    qword_100216588 = (uint64_t)v4;

    [a1 _updateFormatter];
    id v3 = (void *)qword_100216588;
  }

  return v3;
}

+ (id)_centerDateFormatter
{
  id v3 = (void *)qword_100216590;
  if (!qword_100216590)
  {
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    NSUInteger v5 = (void *)qword_100216590;
    qword_100216590 = (uint64_t)v4;

    [a1 _updateFormatter];
    id v3 = (void *)qword_100216590;
  }

  return v3;
}

+ (id)_rightDateFormatter
{
  id v3 = (void *)qword_100216598;
  if (!qword_100216598)
  {
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    NSUInteger v5 = (void *)qword_100216598;
    qword_100216598 = (uint64_t)v4;

    [a1 _updateFormatter];
    id v3 = (void *)qword_100216598;
  }

  return v3;
}

+ (void)_updateFormatter
{
  id v5 = +[NSLocale currentLocale];
  v2 = CUIKCalendar();
  id v3 = CUIKCalendar();
  id v4 = [v3 timeZone];

  [(id)qword_100216588 setLocale:v5];
  [(id)qword_100216590 setLocale:v5];
  [(id)qword_100216598 setLocale:v5];
  [(id)qword_100216588 setCalendar:v2];
  [(id)qword_100216590 setCalendar:v2];
  [(id)qword_100216598 setCalendar:v2];
  [(id)qword_100216588 setTimeZone:v4];
  [(id)qword_100216590 setTimeZone:v4];
  [(id)qword_100216598 setTimeZone:v4];
}

+ (CGRect)badgeFrameFromDayNumberFrame:(CGRect)a3 isRightToLeft:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(id)objc_opt_class() badgeDiameter];
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRectGetMidY(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRectGetMidX(v14);

  CalRoundRectToScreenScale();
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (BOOL)labelElementsVisible
{
  return self->_labelElementsVisible;
}

- (void)setLabelElementsVisible:(BOOL)a3
{
  self->_labelElementsVisible = a3;
}

- (DayNavigationViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DayNavigationViewCellDelegate *)WeakRetained;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)overlayFontSize
{
  return self->_overlayFontSize;
}

- (void)setOverlayFontSize:(double)a3
{
  self->_overlayFontSize = a3;
}

- (CGSize)roundedRectSize
{
  double width = self->_roundedRectSize.width;
  double height = self->_roundedRectSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRoundedRectSize:(CGSize)a3
{
  self->_roundedRectSize = a3;
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  self->_usesRoundedRectInsteadOfCircle = a3;
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(int64_t)a3
{
  self->_badgeType = a3;
}

- (UIColor)badgeColor
{
  return self->_badgeColor;
}

- (void)setBadgeColor:(id)a3
{
}

- (NSString)badgeLocale
{
  return self->_badgeLocale;
}

- (void)setBadgeLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeLocale, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_date, 0);
}

- (void)setCircled:(BOOL)a3 animated:(BOOL)a4
{
  sub_100037858();
  sub_10004E834();

  NSRequestConcreteImplementation();
}

- (void)prepareForReuse
{
  sub_100037858();
  sub_10004E834();

  NSRequestConcreteImplementation();
}

- (void)pulseToday
{
  sub_100037858();
  sub_10004E834();

  NSRequestConcreteImplementation();
}

- (void)stopPulsing
{
  sub_100037858();
  sub_10004E834();

  NSRequestConcreteImplementation();
}

- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4
{
  sub_100037858();
  sub_10004E834();

  NSRequestConcreteImplementation();
}

@end