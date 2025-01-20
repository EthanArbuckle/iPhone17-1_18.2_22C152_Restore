@interface TSDSegmentedControlTableViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSKSegmentedControlAccessibility)tsaxSegmentedControl;
@end

@implementation TSDSegmentedControlTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDSegmentedControlTableViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSKSegmentedControlAccessibility)tsaxSegmentedControl
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSKSegmentedControlAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDSegmentedControlTableViewCellAccessibility *)self tsaxValueForKey:@"segmentedControl"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end