@interface CRLSmartStrokeAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (NSDictionary)crlaxKnownStrokePatternLocalizationStrings;
- (NSString)crlaxStrokePatternDescription;
- (id)crlaxStrokeFullDescription;
@end

@implementation CRLSmartStrokeAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLSmartStroke";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (NSString)crlaxStrokePatternDescription
{
  id v3 = [(CRLSmartStrokeAccessibility *)self crlaxTarget];
  v4 = [v3 strokeName];

  if ([v4 length])
  {
    v5 = [(CRLSmartStrokeAccessibility *)self crlaxKnownStrokePatternLocalizationStrings];
    v6 = [v5 objectForKeyedSubscript:v4];

    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      if (![v6 length])
      {
        int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        v15 = [(id)objc_opt_class() crlaxTargetClassName];
        int v13 = __CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Unknown stroke pattern %@. Please add an entry in crlaxKnownStrokePatternLocalizationStrings in %@Accessibility.", v8, v9, v10, v11, v12, (uint64_t)v4);

        if (v13) {
          abort();
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSDictionary)crlaxKnownStrokePatternLocalizationStrings
{
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    id v3 = [(id)objc_opt_class() crlaxTargetClassName];
    int v9 = __CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"crlaxKnownStrokePatternLocalizationStrings is abstract, please implement on %@Accessibility", v4, v5, v6, v7, v8, (uint64_t)v3);

    if (v9) {
      abort();
    }
  }
  return 0;
}

- (id)crlaxStrokeFullDescription
{
  char v19 = 0;
  v2 = self;
  id v3 = objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v19);
  if (v19) {
    abort();
  }
  uint64_t v5 = (void *)v4;

  if (([v5 crlaxStrokeIsEmpty] & 1) != 0
    || ([v5 crlaxStrokeWidth], v6 <= 0.0))
  {
    uint64_t v7 = +[NSBundle mainBundle];
    v16 = [v7 localizedStringForKey:@"None" value:0 table:0];
  }
  else
  {
    uint64_t v7 = [(CRLStrokeAccessibility *)v2 crlaxStrokeColor];
    uint64_t v8 = [v7 crlaxApproximateColorDescriptionWithOpacity];
    int v9 = [(CRLStrokeAccessibility *)v2 crlaxStrokeWidthDescription];
    v18 = [(CRLSmartStrokeAccessibility *)v2 crlaxStrokePatternDescription];
    v16 = __CRLAccessibilityStringForVariables(1, v8, v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  }

  return v16;
}

@end