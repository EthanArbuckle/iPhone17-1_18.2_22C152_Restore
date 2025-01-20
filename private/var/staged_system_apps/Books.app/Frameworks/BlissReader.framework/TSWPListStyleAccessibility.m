@interface TSWPListStyleAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxDescription;
- (id)tsaxListType;
@end

@implementation TSWPListStyleAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPListStyle";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxDescription
{
  return [(TSWPListStyleAccessibility *)self tsaxListType];
}

- (id)tsaxListType
{
  char v8 = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSSStyleAccessibility *)self tsaxObjectForProperty:180], 1, &v8);
  if (v8) {
    abort();
  }
  v5 = v4;
  id result = [v4 count];
  if (result)
  {
    unsigned int v7 = [[v5 firstObject] intValue] - 1;
    if (v7 > 2) {
      return 0;
    }
    else {
      return TSAccessibilityLocalizedString((uint64_t)off_46C308[v7]);
    }
  }
  return result;
}

@end