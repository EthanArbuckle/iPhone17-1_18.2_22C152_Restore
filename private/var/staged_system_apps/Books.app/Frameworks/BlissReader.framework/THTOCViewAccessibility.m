@interface THTOCViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityElementsHidden;
- (id)_thaxBookViewController;
@end

@implementation THTOCViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"THTOCView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return [self _thaxBookViewController].thaxIsTOCVisible ^ 1;
}

- (id)_thaxBookViewController
{
  id v2 = [(THTOCViewAccessibility *)self tsaxValueForKey:@"_accessibilityViewController"];
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[v2 tsaxValueForKey:@"delegate"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end