@interface TSDDoubleSegmentedControlTableViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxLeftSegmentedControl;
- (id)tsaxRightSegmentedControl;
@end

@implementation TSDDoubleSegmentedControlTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDDoubleSegmentedControlTableViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxLeftSegmentedControl
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDDoubleSegmentedControlTableViewCellAccessibility *)self tsaxValueForKey:@"leftSegmentedControl"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)tsaxRightSegmentedControl
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDDoubleSegmentedControlTableViewCellAccessibility *)self tsaxValueForKey:@"rightSegmentedControl"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end