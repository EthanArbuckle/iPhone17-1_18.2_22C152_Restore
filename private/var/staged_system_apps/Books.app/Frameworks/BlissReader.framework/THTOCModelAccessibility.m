@interface THTOCModelAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)thaxTiles;
@end

@implementation THTOCModelAccessibility

+ (id)tsaxTargetClassName
{
  return @"THTOCModel";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSArray)thaxTiles
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THTOCModelAccessibility *)self tsaxValueForKey:@"tiles"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end