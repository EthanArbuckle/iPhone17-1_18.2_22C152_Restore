@interface THWGutterInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxAuthorProvidedDescription;
- (TSWPShapeInfoAccessibility)thaxTitleShape;
@end

@implementation THWGutterInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWGutterInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxAuthorProvidedDescription
{
  v3 = objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWGutterInfoAccessibility *)self tsaxValueForKey:@"expandedDrawableToPresent"], 0, 0);
  if (result)
  {
    return (NSString *)[(NSString *)result tsaxUserProvidedDescription];
  }
  return result;
}

- (TSWPShapeInfoAccessibility)thaxTitleShape
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSWPShapeInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWGutterInfoAccessibility *)self tsaxValueForKey:@"titleShape"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end