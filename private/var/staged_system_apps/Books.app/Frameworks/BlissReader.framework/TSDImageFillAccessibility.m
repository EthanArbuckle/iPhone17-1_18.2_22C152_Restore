@interface TSDImageFillAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxFillTechniqueDescription;
- (TSPDataAccessibility)tsaxImageData;
- (TSUColorAccessibility)tsaxTintColor;
- (id)accessibilityLabel;
- (int)tsaxFillTechnique;
@end

@implementation TSDImageFillAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDImageFill";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxFillTechniqueDescription
{
  unsigned int v2 = [(TSDImageFillAccessibility *)self tsaxFillTechnique];
  if (v2 > 4) {
    return 0;
  }
  v3 = off_46C0F0[v2];

  return TSAccessibilityLocalizedString((uint64_t)v3);
}

- (int)tsaxFillTechnique
{
  return [(TSDImageFillAccessibility *)self tsaxIntValueForKey:@"technique"];
}

- (TSPDataAccessibility)tsaxImageData
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSPDataAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDImageFillAccessibility *)self tsaxValueForKey:@"imageData"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSUColorAccessibility)tsaxTintColor
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSUColorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDImageFillAccessibility *)self tsaxValueForKey:@"tintColor"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString(@"image.fill");
}

@end