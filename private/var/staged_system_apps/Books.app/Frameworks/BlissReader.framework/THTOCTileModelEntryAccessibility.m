@interface THTOCTileModelEntryAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxDisplayPageNumber;
- (NSString)thaxSectionIdentifier;
- (NSString)thaxTitle;
@end

@implementation THTOCTileModelEntryAccessibility

+ (id)tsaxTargetClassName
{
  return @"THTOCTileModelEntry";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxSectionIdentifier
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THTOCTileModelEntryAccessibility *)self tsaxValueForKey:@"sectionIdentifier"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)thaxTitle
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THTOCTileModelEntryAccessibility *)self tsaxValueForKey:@"title"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)thaxDisplayPageNumber
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THTOCTileModelEntryAccessibility *)self tsaxValueForKey:@"displayPageNumber"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end