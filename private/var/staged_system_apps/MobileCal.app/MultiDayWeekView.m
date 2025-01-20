@interface MultiDayWeekView
+ (BOOL)showsAllDayDividerLine;
+ (BOOL)usesSmallTextForIsCompact:(BOOL)a3;
+ (double)centerYOffsetForTitleLabelWithSizeClass:(int64_t)a3;
+ (double)dayHeaderHeightWithSizeClass:(int64_t)a3;
+ (double)dayWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4;
+ (double)standardWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4;
+ (id)weekSeparatorColor;
+ (int64_t)numMultiDays;
+ (unint64_t)displayedDaysForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4;
- (MultiDayWeekView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6;
- (int64_t)daysToDisplay;
- (void)hideNowDot:(BOOL)a3;
@end

@implementation MultiDayWeekView

- (MultiDayWeekView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MultiDayWeekView;
  v6 = -[WeekView initWithFrame:sizeClass:targetWindow:rightClickDelegate:](&v11, "initWithFrame:sizeClass:targetWindow:rightClickDelegate:", a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
  {
    v8 = [(WeekView *)v6 allDayView];
    [v8 setUseMultiDayHeaderStyle:1];

    v9 = [(WeekView *)v7 content];
    [v9 setUseMultiDayStyle:1];
  }
  return v7;
}

+ (int64_t)numMultiDays
{
  return 2;
}

+ (BOOL)usesSmallTextForIsCompact:(BOOL)a3
{
  return 0;
}

+ (double)dayHeaderHeightWithSizeClass:(int64_t)a3
{
  +[MultiDayNavigationViewCell heightRequiredWithSizeClass:a3];
  return result;
}

+ (double)centerYOffsetForTitleLabelWithSizeClass:(int64_t)a3
{
  +[MultiDayNavigationViewCell heightRequiredWithSizeClass:a3];
  return v3 * 0.5;
}

+ (double)standardWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  [a1 dayWidthForOrientation:a3 withViewInViewHierarchy:a4];
  return v4 * (double)(uint64_t)[(id)objc_opt_class() numMultiDays];
}

+ (unint64_t)displayedDaysForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  double v4 = objc_opt_class();

  return (unint64_t)[v4 numMultiDays];
}

+ (double)dayWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  id v6 = a4;
  [a1 windowSpaceForOrientation:a3 withViewInViewHierarchy:v6];
  double v8 = v7;
  id v9 = [a1 displayedDaysForOrientation:a3 withViewInViewHierarchy:v6];

  return v8 / (double)(unint64_t)v9;
}

+ (id)weekSeparatorColor
{
  return (id)_EKUIVerticalGridLineColor(a1, a2);
}

+ (BOOL)showsAllDayDividerLine
{
  return 0;
}

- (int64_t)daysToDisplay
{
  v2 = objc_opt_class();

  return (int64_t)[v2 numMultiDays];
}

- (void)hideNowDot:(BOOL)a3
{
  id v4 = [(WeekView *)self content];
  double v3 = [v4 grid];
  [v3 hideNowDot:1];
}

@end