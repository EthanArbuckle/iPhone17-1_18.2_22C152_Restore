@interface CRLWPSearchReferenceAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CRLWPSelectionAccessibility)crlaxSelection;
@end

@implementation CRLWPSearchReferenceAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLWPSearchReference";
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

- (CRLWPSelectionAccessibility)crlaxSelection
{
  char v8 = 0;
  v2 = [(CRLWPSearchReferenceAccessibility *)self crlaxTarget];
  id v3 = [v2 selection];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLWPSelectionAccessibility *)v6;
}

@end