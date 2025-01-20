@interface THSectionControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (THPresentationTypeAccessibility)thaxPresentationType;
@end

@implementation THSectionControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THSectionController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THPresentationTypeAccessibility)thaxPresentationType
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THPresentationTypeAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THSectionControllerAccessibility *)self tsaxValueForKey:@"presentationType"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end