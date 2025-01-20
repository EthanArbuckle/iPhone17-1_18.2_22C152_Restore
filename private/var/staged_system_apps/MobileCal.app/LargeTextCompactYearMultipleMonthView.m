@interface LargeTextCompactYearMultipleMonthView
+ (Class)headerClass;
+ (Class)monthClass;
+ (double)leftMarginForWindowSize:(CGSize)a3;
+ (double)rightMarginForWindowSize:(CGSize)a3;
@end

@implementation LargeTextCompactYearMultipleMonthView

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
  +[LargeTextCompactYearMonthView leftMarginForWindowSize:](LargeTextCompactYearMonthView, "leftMarginForWindowSize:", a3.width, a3.height);
  return result;
}

+ (double)rightMarginForWindowSize:(CGSize)a3
{
  +[LargeTextCompactYearMonthView rightMarginForWindowSize:](LargeTextCompactYearMonthView, "rightMarginForWindowSize:", a3.width, a3.height);
  return result;
}

@end