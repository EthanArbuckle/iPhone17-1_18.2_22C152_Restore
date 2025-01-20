@interface TSKSegmentedControlAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_tsaxSegments;
- (unint64_t)tsaxSegmentCount;
- (void)tsaxSetSegmentDescriptions:(id)a3;
@end

@implementation TSKSegmentedControlAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSKSegmentedControl";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)tsaxSegmentCount
{
  id v2 = [(TSKSegmentedControlAccessibility *)self _tsaxSegments];

  return (unint64_t)[v2 count];
}

- (void)tsaxSetSegmentDescriptions:(id)a3
{
  id v4 = [(TSKSegmentedControlAccessibility *)self _tsaxSegments];
  id v5 = [a3 count];
  if (v5 == [v4 count])
  {
    if (v5)
    {
      uint64_t v6 = 0;
      while (1)
      {
        id v7 = [v4 objectAtIndex:v6];
        char v16 = 0;
        v8 = (objc_class *)objc_opt_class();
        uint64_t v9 = __TSAccessibilityCastAsClass(v8, (uint64_t)[a3 objectAtIndex:v6], 1, &v16);
        if (v16) {
          break;
        }
        [v7 setAccessibilityLabel:v9];
        if (v5 == (id)++v6) {
          return;
        }
      }
LABEL_10:
      abort();
    }
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Number of segments have changed from %lu to %lu", v11, v12, v13, v14, v15, (uint64_t)v5))goto LABEL_10; {
  }
    }
}

- (id)_tsaxSegments
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSKSegmentedControlAccessibility *)self tsaxValueForKey:@"mButtonSegments"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end