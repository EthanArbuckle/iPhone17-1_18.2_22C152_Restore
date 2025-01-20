@interface TSPDataAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxFilename;
- (NSString)tsaxFriendlyFilename;
- (NSString)tsaxLabel;
@end

@implementation TSPDataAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSPData";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxLabel
{
  return [(TSPDataAccessibility *)self tsaxFriendlyFilename];
}

- (NSString)tsaxFriendlyFilename
{
  v2 = [(TSPDataAccessibility *)self tsaxFilename];

  return (NSString *)TSAccessibilityFriendlyFilename(v2);
}

- (NSString)tsaxFilename
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSPDataAccessibility *)self tsaxValueForKey:@"filename"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end