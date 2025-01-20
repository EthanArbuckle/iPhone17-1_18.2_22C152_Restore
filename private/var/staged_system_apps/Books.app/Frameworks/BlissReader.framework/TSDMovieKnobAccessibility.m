@interface TSDMovieKnobAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSDMovieRepAccessibility)tsaxParentRepForKnob;
- (id)tsaxLabel;
@end

@implementation TSDMovieKnobAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDMovieKnob";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSDMovieRepAccessibility)tsaxParentRepForKnob
{
  char v7 = 0;
  v3 = objc_opt_class();
  v6.receiver = self;
  v6.super_class = (Class)TSDMovieKnobAccessibility;
  v4 = [(TSDKnobAccessibility *)&v6 tsaxParentRepForKnob];
  result = (TSDMovieRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7) {
    abort();
  }
  return result;
}

- (id)tsaxLabel
{
  return TSAccessibilityLocalizedString(@"play.movie");
}

@end