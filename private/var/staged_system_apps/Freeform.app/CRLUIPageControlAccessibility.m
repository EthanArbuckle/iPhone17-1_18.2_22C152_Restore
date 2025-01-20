@interface CRLUIPageControlAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (void)_accessibilityCurrentPageDidChange;
@end

@implementation CRLUIPageControlAccessibility

+ (id)crlaxTargetClassName
{
  return @"UIPageControl";
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

- (void)_accessibilityCurrentPageDidChange
{
  if ([(CRLUIPageControlAccessibility *)self crlaxPageChangeCausesLayoutChange])
  {
    CRLAccessibilityPostLayoutChangedNotification(0);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)CRLUIPageControlAccessibility;
    [(CRLUIPageControlAccessibility *)&v3 _accessibilityCurrentPageDidChange];
  }
}

@end