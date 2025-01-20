@interface CRLDropShadowAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (id)crlaxShadowTypeDescription;
@end

@implementation CRLDropShadowAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLDropShadow";
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

- (id)crlaxShadowTypeDescription
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Drop shadow" value:0 table:0];

  return v3;
}

@end