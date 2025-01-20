@interface THWIOSMovieRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxIsPlaying;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxIsRepPressable;
- (BOOL)thaxPressRep;
- (BOOL)thaxShouldHideChildReps;
- (THWMovieInfoAccessibility)_thaxMovieInfo;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)childRepsForHitTesting;
- (unint64_t)accessibilityTraits;
@end

@implementation THWIOSMovieRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWIOSMovieRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)childRepsForHitTesting
{
  if (![(id)objc_opt_class() thaxRepShouldAllowHitTestingOfChildren:self]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THWIOSMovieRepAccessibility;
  return [(THWIOSMovieRepAccessibility *)&v4 childRepsForHitTesting];
}

- (BOOL)isAccessibilityElement
{
  return ![(THWIOSMovieRepAccessibility *)self _thaxIsPlaying];
}

- (id)accessibilityLabel
{
  v2 = [(THWMovieInfoAccessibility *)[(THWIOSMovieRepAccessibility *)self _thaxMovieInfo] thaxMediaLabel];
  if ([(NSString *)v2 length]) {
    return v2;
  }

  return THAccessibilityLocalizedString(@"widgets.movie.short.roledescription");
}

- (id)accessibilityHint
{
  return THAccessibilityLocalizedString(@"av.play.stopped.hint.ios");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitStartsMediaSession | UIAccessibilityTraitButton;
}

- (BOOL)thaxShouldHideChildReps
{
  return ![(THWIOSMovieRepAccessibility *)self _thaxIsPlaying];
}

- (BOOL)thaxIsRepPressable
{
  return ![(THWIOSMovieRepAccessibility *)self _thaxIsPlaying];
}

- (BOOL)thaxPressRep
{
  if (TSAccessibilityShouldPerformValidationChecks()
    && [(THWIOSMovieRepAccessibility *)self _thaxIsPlaying]
    && (int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
        __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"The user should not be able to press on this rep while playing.", v4, v5, v6, v7, v8, v10))|| (v11[0] = _NSConcreteStackBlock, v11[1] = 3221225472, v11[2] = sub_29971C, v11[3] = &unk_456DE0, v11[4] = self, __TSAccessibilityPerformSafeBlock((uint64_t)v11)))
  {
    abort();
  }
  TSAccessibilityPostLayoutChangedNotification(0);
  return 1;
}

- (THWMovieInfoAccessibility)_thaxMovieInfo
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWMovieInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"movieInfo"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)_thaxIsPlaying
{
  return [(THWIOSMovieRepAccessibility *)self tsaxBoolValueForKey:@"isPlaying"];
}

@end