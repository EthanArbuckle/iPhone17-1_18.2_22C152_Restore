@interface TSDShadowAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxIsShadowEnabled;
- (NSString)tsaxShadowAngleDescription;
- (NSString)tsaxShadowColorDescription;
- (NSString)tsaxShadowTypeDescription;
- (double)_tsaxShadowAngle;
- (id)_tsaxShadowColor;
@end

@implementation TSDShadowAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDShadow";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)tsaxIsShadowEnabled
{
  return [(TSDShadowAccessibility *)self tsaxBoolValueForKey:@"mEnabled"];
}

- (NSString)tsaxShadowTypeDescription
{
  return TSAccessibilityLocalizedString(@"shadow");
}

- (NSString)tsaxShadowAngleDescription
{
  [(TSDShadowAccessibility *)self _tsaxShadowAngle];
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"angle.with.units %f"), *(void *)&v2];
  }
}

- (NSString)tsaxShadowColorDescription
{
  id v2 = [(TSDShadowAccessibility *)self _tsaxShadowColor];

  return (NSString *)[v2 tsaxStyleInfoDescription];
}

- (double)_tsaxShadowAngle
{
  [(TSDShadowAccessibility *)self tsaxCGFloatValueForKey:@"mAngle"];
  return result;
}

- (id)_tsaxShadowColor
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDShadowAccessibility *)self tsaxValueForKey:@"TSUColor"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end