@interface CRLUINavigationItemAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CRLUINavigationItemAccessibility

+ (id)crlaxTargetClassName
{
  return @"UINavigationItem";
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

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CRLUINavigationItemAccessibility;
  [(CRLUINavigationItemAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CRLUINavigationItemAccessibility *)self crlaxLoadAccessibilityInformation];
}

@end