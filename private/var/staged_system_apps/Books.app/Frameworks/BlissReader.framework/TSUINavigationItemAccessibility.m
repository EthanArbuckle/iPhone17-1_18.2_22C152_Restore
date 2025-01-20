@interface TSUINavigationItemAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TSUINavigationItemAccessibility

+ (id)tsaxTargetClassName
{
  return @"UINavigationItem";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)TSUINavigationItemAccessibility;
  [(TSUINavigationItemAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(TSUINavigationItemAccessibility *)self tsaxLoadAccessibilityInformation];
}

@end