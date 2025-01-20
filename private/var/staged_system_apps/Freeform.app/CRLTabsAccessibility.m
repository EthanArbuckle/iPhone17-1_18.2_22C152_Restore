@interface CRLTabsAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (unint64_t)crlaxCount;
@end

@implementation CRLTabsAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLWPTabs";
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

- (unint64_t)crlaxCount
{
  v2 = [(CRLTabsAccessibility *)self crlaxTarget];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

@end