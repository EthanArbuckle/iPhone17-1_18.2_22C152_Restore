@interface TSDFillAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxDescriptionForFill:(id)a3;
+ (id)tsaxTargetClassName;
- (NSString)tsaxStyleInfoDescription;
- (TSUColorAccessibility)tsaxReferenceColor;
- (int)tsaxFillType;
@end

@implementation TSDFillAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDFill";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (int)tsaxFillType
{
  return [(TSDFillAccessibility *)self tsaxIntegerValueForKey:@"fillType"];
}

- (TSUColorAccessibility)tsaxReferenceColor
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSUColorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDFillAccessibility *)self tsaxValueForKey:@"referenceColor"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

+ (id)tsaxDescriptionForFill:(id)a3
{
  if (!a3 || +[NSNull null] == a3)
  {
    return TSAccessibilityLocalizedString(@"fill.none");
  }
  else
  {
    +[TSAccessibilitySafeCategory tsaxTargetClass];
    if (objc_opt_isKindOfClass())
    {
      char v7 = 0;
      v4 = objc_opt_class();
      Class v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)a3, 1, &v7);
      if (v7) {
        abort();
      }
      return [(objc_class *)v5 tsaxStyleInfoDescription];
    }
    else
    {
      return 0;
    }
  }
}

- (NSString)tsaxStyleInfoDescription
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    uint64_t v3 = objc_opt_class();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"-[TSDFillAccessibility tsaxStyleInfoDescription] is abstract. Please implement tsaxStyleInfoDescription in %@.", v4, v5, v6, v7, v8, v3))abort(); {
  }
    }
  return 0;
}

@end