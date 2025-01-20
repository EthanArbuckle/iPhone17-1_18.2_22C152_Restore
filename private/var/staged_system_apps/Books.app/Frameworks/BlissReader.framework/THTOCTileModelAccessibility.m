@interface THTOCTileModelAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)thaxLandscapeEntries;
@end

@implementation THTOCTileModelAccessibility

+ (id)tsaxTargetClassName
{
  return @"THTOCTileModel";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSArray)thaxLandscapeEntries
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THTOCTileModelAccessibility *)self tsaxValueForKey:@"landscapeEntries"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end