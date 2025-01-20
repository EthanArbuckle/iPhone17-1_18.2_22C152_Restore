@interface CRLNavigationControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation CRLNavigationControllerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLNavigationController";
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

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CRLNavigationControllerAccessibility;
  [(CRLNavigationControllerAccessibility *)&v4 didShowViewController:a3 animated:a4];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

@end