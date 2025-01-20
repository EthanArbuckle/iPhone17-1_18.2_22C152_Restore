@interface CRLImageLayoutAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsInMaskEditMode;
@end

@implementation CRLImageLayoutAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLImageLayout";
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

- (BOOL)crlaxIsInMaskEditMode
{
  v2 = [(CRLImageLayoutAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isInMaskEditMode];

  return v3;
}

@end