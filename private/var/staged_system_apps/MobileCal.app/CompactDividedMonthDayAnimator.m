@interface CompactDividedMonthDayAnimator
+ (Class)monthDayTransitionViewClass;
@end

@implementation CompactDividedMonthDayAnimator

+ (Class)monthDayTransitionViewClass
{
  return (Class)objc_opt_class();
}

@end