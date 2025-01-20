@interface TSDShapeInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxShapeStyleName;
- (NSString)tsaxShapeTypeDescription;
- (TSDPathSourceAccessibility)tsaxPathSource;
- (TSDShapeStyleAccessibility)_tsaxShapeStyle;
@end

@implementation TSDShapeInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDShapeInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxShapeStyleName
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSSStyleAccessibility *)[(TSDShapeInfoAccessibility *)self _tsaxShapeStyle] tsaxName], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSDPathSourceAccessibility)tsaxPathSource
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDPathSourceAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDShapeInfoAccessibility *)self tsaxValueForKey:@"pathSource"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)tsaxShapeTypeDescription
{
  v2 = [(TSDShapeInfoAccessibility *)self tsaxPathSource];

  return [(TSDPathSourceAccessibility *)v2 tsaxLabel];
}

- (TSDShapeStyleAccessibility)_tsaxShapeStyle
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDShapeStyleAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDShapeInfoAccessibility *)self tsaxValueForKey:@"shapeStyle"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end