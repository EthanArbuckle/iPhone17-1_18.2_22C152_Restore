@interface TSUIWindowAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (UIResponder)tsaxFirstResponder;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TSUIWindowAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIWindow";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (UIResponder)tsaxFirstResponder
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (UIResponder *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSUIWindowAccessibility *)self tsaxValueForKey:@"firstResponder"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)TSUIWindowAccessibility;
  [(TSUIWindowAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(TSUIWindowAccessibility *)self tsaxLoadAccessibilityInformation];
}

@end