@interface THiOSIntroMediaViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityPerformEscape;
- (THiOSIntroMediaViewAccessibilityDelegate)thaxDelegate;
- (void)thaxSetDelegate:(id)a3;
@end

@implementation THiOSIntroMediaViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"THiOSIntroMediaView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THiOSIntroMediaViewAccessibilityDelegate)thaxDelegate
{
  return (THiOSIntroMediaViewAccessibilityDelegate *)__TSAccessibilityGetAssociatedObject(self, &unk_573A63);
}

- (void)thaxSetDelegate:(id)a3
{
}

- (BOOL)accessibilityPerformEscape
{
  v3 = [(THiOSIntroMediaViewAccessibility *)self thaxDelegate];
  if (v3)
  {
    [(THiOSIntroMediaViewAccessibilityDelegate *)[(THiOSIntroMediaViewAccessibility *)self thaxDelegate] thaxIntroMediaViewDidPerformEscapeGesture];
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"No delegate set for the intro media view controller. User won't be able to escape properly.", v5, v6, v7, v8, v9, v11))abort(); {
  }
    }
  return v3 != 0;
}

@end