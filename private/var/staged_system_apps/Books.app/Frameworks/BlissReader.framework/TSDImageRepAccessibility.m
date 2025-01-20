@interface TSDImageRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (NSString)tsaxLabel;
- (TSDImageRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4;
- (id)_tsaxImageInfo;
- (id)tsaxKnobLabel;
@end

@implementation TSDImageRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDImageRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxLabel
{
  v3 = [(TSDRepAccessibility *)self tsaxLockedLabel];
  id v4 = [[self _tsaxImageInfo] tsaxDescription];
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString(@"image");
}

- (id)_tsaxImageInfo
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"imageInfo"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSDImageRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSDImageRepAccessibility;
  id v4 = [(TSDImageRepAccessibility *)&v8 initWithLayout:a3 canvas:a4];
  char v5 = v4;
  if (v4)
  {
    unint64_t v6 = [(TSDRepAccessibility *)v4 accessibilityTraits];
    [(TSDImageRepAccessibility *)v5 setAccessibilityTraits:UIAccessibilityTraitImage | v6];
  }
  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end