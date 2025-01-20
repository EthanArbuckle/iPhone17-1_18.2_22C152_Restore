@interface CRLUIWindowAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (UIResponder)crlaxFirstResponder;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CRLUIWindowAccessibility

+ (id)crlaxTargetClassName
{
  return @"UIWindow";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (UIResponder)crlaxFirstResponder
{
  v2 = [(CRLUIWindowAccessibility *)self crlaxTarget];
  id v3 = [v2 firstResponder];

  return (UIResponder *)v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CRLUIWindowAccessibility;
  [(CRLUIWindowAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CRLUIWindowAccessibility *)self crlaxLoadAccessibilityInformation];
}

@end