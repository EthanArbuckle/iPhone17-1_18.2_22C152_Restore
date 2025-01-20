@interface CRLContainerRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (NSArray)crlaxChildReps;
@end

@implementation CRLContainerRepAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLWPRep";
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

- (NSArray)crlaxChildReps
{
  char v8 = 0;
  v2 = [(CRLContainerRepAccessibility *)self crlaxTarget];
  id v3 = [v2 childReps];

  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (NSArray *)v6;
}

@end