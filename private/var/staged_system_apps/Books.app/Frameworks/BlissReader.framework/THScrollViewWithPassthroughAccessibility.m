@interface THScrollViewWithPassthroughAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityOnlyComparesByXAxis;
@end

@implementation THScrollViewWithPassthroughAccessibility

+ (id)tsaxTargetClassName
{
  return @"THScrollViewWithPassthrough";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

@end