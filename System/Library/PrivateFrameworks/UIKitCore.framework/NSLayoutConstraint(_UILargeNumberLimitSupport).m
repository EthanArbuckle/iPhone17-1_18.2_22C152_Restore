@interface NSLayoutConstraint(_UILargeNumberLimitSupport)
+ (double)_constraintConstantLimit;
@end

@implementation NSLayoutConstraint(_UILargeNumberLimitSupport)

+ (double)_constraintConstantLimit
{
  return 2777777.0;
}

@end