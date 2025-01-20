@interface TSUIViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TSUIViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)TSUIViewControllerAccessibility;
  [(TSUIViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(TSUIViewControllerAccessibility *)self tsaxLoadAccessibilityInformation];
}

@end