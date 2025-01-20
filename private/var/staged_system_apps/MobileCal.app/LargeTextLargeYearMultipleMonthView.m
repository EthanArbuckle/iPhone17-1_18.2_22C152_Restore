@interface LargeTextLargeYearMultipleMonthView
+ (BOOL)useUIKitLayoutMargins;
+ (Class)headerClass;
+ (Class)monthClass;
+ (double)leftMarginForWindowSize:(CGSize)a3;
+ (double)rightMarginForWindowSize:(CGSize)a3;
+ (unint64_t)numberOfMonthsPerRowForWindowSize:(CGSize)a3;
@end

@implementation LargeTextLargeYearMultipleMonthView

+ (unint64_t)numberOfMonthsPerRowForWindowSize:(CGSize)a3
{
  return +[LargeTextLargeYearMonthView numberOfMonthsPerRowForWindowSize:](LargeTextLargeYearMonthView, "numberOfMonthsPerRowForWindowSize:", a3.width, a3.height);
}

+ (BOOL)useUIKitLayoutMargins
{
  return _EKUIShouldUseUIKitLayoutMargins(a1, a2);
}

+ (Class)headerClass
{
  return (Class)objc_opt_class();
}

+ (Class)monthClass
{
  return (Class)objc_opt_class();
}

+ (double)leftMarginForWindowSize:(CGSize)a3
{
  +[LargeTextLargeYearMonthView leftMarginForWindowSize:](LargeTextLargeYearMonthView, "leftMarginForWindowSize:", a3.width, a3.height);
  return result;
}

+ (double)rightMarginForWindowSize:(CGSize)a3
{
  +[LargeTextLargeYearMonthView rightMarginForWindowSize:](LargeTextLargeYearMonthView, "rightMarginForWindowSize:", a3.width, a3.height);
  return result;
}

@end