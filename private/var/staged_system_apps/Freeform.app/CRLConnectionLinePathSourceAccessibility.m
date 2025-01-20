@interface CRLConnectionLinePathSourceAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (id)_crlaxInferredLabel;
@end

@implementation CRLConnectionLinePathSourceAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLConnectionLinePathSource";
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

- (id)_crlaxInferredLabel
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Curved connection line" value:0 table:0];

  return v3;
}

@end