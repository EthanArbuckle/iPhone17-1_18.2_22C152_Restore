@interface TSDDrawableInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxTypeDescription;
- (NSString)tsaxUserProvidedDescription;
- (TSDInfoGeometryAccessibility)tsaxGeometry;
- (id)tsaxComment;
@end

@implementation TSDDrawableInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDDrawableInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxUserProvidedDescription
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDDrawableInfoAccessibility *)self tsaxValueForKey:@"accessibilityDescription"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)tsaxComment
{
  return [(TSDDrawableInfoAccessibility *)self tsaxValueForKey:@"comment"];
}

- (NSString)tsaxTypeDescription
{
  return TSAccessibilityLocalizedString(@"object");
}

- (TSDInfoGeometryAccessibility)tsaxGeometry
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDInfoGeometryAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDDrawableInfoAccessibility *)self tsaxValueForKey:@"geometry"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end