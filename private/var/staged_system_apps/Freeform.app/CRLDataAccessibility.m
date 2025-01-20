@interface CRLDataAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (NSString)crlaxFilename;
- (NSString)crlaxLabel;
@end

@implementation CRLDataAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLAsset";
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

- (NSString)crlaxLabel
{
  v2 = [(CRLDataAccessibility *)self crlaxFilename];
  id v3 = CRLAccessibilityFriendlyFilename(v2);

  return (NSString *)v3;
}

- (NSString)crlaxFilename
{
  v2 = [(CRLDataAccessibility *)self crlaxTarget];
  id v3 = [v2 filename];

  return (NSString *)v3;
}

@end