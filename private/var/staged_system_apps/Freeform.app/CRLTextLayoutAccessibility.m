@interface CRLTextLayoutAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (id)crlaxStorage;
@end

@implementation CRLTextLayoutAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLWPLayout";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)crlaxStorage
{
  char v8 = 0;
  v2 = [(CRLTextLayoutAccessibility *)self crlaxTarget];
  v3 = [v2 info];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return v6;
}

@end