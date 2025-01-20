@interface THWInteractiveImageRadioPanelRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_thaxNextButtonRep;
- (id)_thaxPreviousButtonRep;
- (id)thaxHintForButtonControlRep:(id)a3;
- (id)thaxLabelForButtonControlRep:(id)a3;
@end

@implementation THWInteractiveImageRadioPanelRepAccessibility

- (id)thaxLabelForButtonControlRep:(id)a3
{
  if ([(THWInteractiveImageRadioPanelRepAccessibility *)self _thaxNextButtonRep] == a3)
  {
    CFStringRef v12 = @"interactive.image.navigation.next";
  }
  else
  {
    if ([(THWInteractiveImageRadioPanelRepAccessibility *)self _thaxPreviousButtonRep] != a3)
    {
      if (TSAccessibilityShouldPerformValidationChecks())
      {
        int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"A label for this button control rep was not provided: %@", v6, v7, v8, v9, v10, (uint64_t)a3))abort(); {
      }
        }
      return 0;
    }
    CFStringRef v12 = @"interactive.image.navigation.previous";
  }

  return THAccessibilityLocalizedString((uint64_t)v12);
}

- (id)thaxHintForButtonControlRep:(id)a3
{
  if ([(THWInteractiveImageRadioPanelRepAccessibility *)self _thaxNextButtonRep] == a3)
  {
    CFStringRef v12 = @"interactive.image.navigation.next.hint.ios";
  }
  else
  {
    if ([(THWInteractiveImageRadioPanelRepAccessibility *)self _thaxPreviousButtonRep] != a3)
    {
      if (TSAccessibilityShouldPerformValidationChecks())
      {
        int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"A hint for this button control rep was not provided: %@", v6, v7, v8, v9, v10, (uint64_t)a3))abort(); {
      }
        }
      return 0;
    }
    CFStringRef v12 = @"interactive.image.navigation.previous.hint.ios";
  }

  return THAccessibilityLocalizedString((uint64_t)v12);
}

- (id)_thaxNextButtonRep
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"_nextButtonRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_thaxPreviousButtonRep
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"_previousButtonRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

+ (id)tsaxTargetClassName
{
  return @"THWInteractiveImageRadioPanelRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end