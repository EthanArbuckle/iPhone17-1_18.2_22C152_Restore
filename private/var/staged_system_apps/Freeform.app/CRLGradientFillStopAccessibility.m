@interface CRLGradientFillStopAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CRLColorAccessibility)crlaxColor;
- (NSString)crlaxStyleInfoDescription;
@end

@implementation CRLGradientFillStopAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLGradientFillStop";
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

- (CRLColorAccessibility)crlaxColor
{
  char v8 = 0;
  v2 = [(CRLGradientFillStopAccessibility *)self crlaxTarget];
  id v3 = [v2 color];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLColorAccessibility *)v6;
}

- (NSString)crlaxStyleInfoDescription
{
  v2 = [(CRLGradientFillStopAccessibility *)self crlaxColor];
  id v3 = [v2 crlaxStyleInfoDescription];

  return (NSString *)v3;
}

@end