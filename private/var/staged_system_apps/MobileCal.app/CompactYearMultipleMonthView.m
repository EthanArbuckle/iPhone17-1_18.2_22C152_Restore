@interface CompactYearMultipleMonthView
+ (Class)headerClass;
+ (Class)monthClass;
- (double)leftMarginAdjustment;
- (double)rightMarginAdjustment;
@end

@implementation CompactYearMultipleMonthView

+ (Class)headerClass
{
  return (Class)objc_opt_class();
}

+ (Class)monthClass
{
  return (Class)objc_opt_class();
}

- (double)leftMarginAdjustment
{
  uint64_t v2 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  double result = 0.0;
  if (v2 == 32) {
    return -3.0;
  }
  return result;
}

- (double)rightMarginAdjustment
{
  uint64_t v2 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  double result = 0.0;
  if (v2 == 32) {
    return -3.0;
  }
  return result;
}

@end