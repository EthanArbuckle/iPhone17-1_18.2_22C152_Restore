@interface LargeYearMultipleMonthView
+ (BOOL)useUIKitLayoutMargins;
+ (Class)headerClass;
+ (Class)monthClass;
@end

@implementation LargeYearMultipleMonthView

+ (Class)headerClass
{
  return (Class)objc_opt_class();
}

+ (Class)monthClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)useUIKitLayoutMargins
{
  return _EKUIShouldUseUIKitLayoutMargins(a1, a2);
}

@end