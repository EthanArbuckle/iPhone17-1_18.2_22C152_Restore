@interface TSDMovieRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxIsPlayable;
- (BOOL)tsaxShouldExposeAsAttachmentToken;
- (NSString)tsaxMovieLabel;
- (TSKAVPlayerControllerAccessibility)tsaxPlayerController;
- (id)_tsaxMovieInfo;
- (id)accessibilityHint;
- (id)tsaxKnobLabel;
- (void)tsaxPlayMovie;
- (void)tsaxTogglePlayback;
@end

@implementation TSDMovieRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDMovieRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)tsaxPlayMovie
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_25B0B8;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)tsaxTogglePlayback
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_25B134;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (NSString)tsaxMovieLabel
{
  v3 = [(TSDRepAccessibility *)self tsaxLockedLabel];
  id v4 = [[self _tsaxMovieInfo] tsaxMovieLabel];
  if ([v4 length]) {
    v5 = +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"movie.with.name %@"), v4];
  }
  else {
    v5 = TSAccessibilityLocalizedString(@"movie");
  }
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
}

- (BOOL)tsaxIsPlayable
{
  return [(TSDMovieRepAccessibility *)self tsaxBoolValueForKey:@"isPlayable"];
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString(@"movie");
}

- (BOOL)tsaxShouldExposeAsAttachmentToken
{
  return 1;
}

- (TSKAVPlayerControllerAccessibility)tsaxPlayerController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSKAVPlayerControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"playerController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_tsaxMovieInfo
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"movieInfo"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return TSAccessibilityLocalizedString(@"movie.double.tap.to.play.iOS");
}

- (BOOL)_accessibilitySupportsActivateAction
{
  v4.receiver = self;
  v4.super_class = (Class)TSDMovieRepAccessibility;
  if ([(TSDRepAccessibility *)&v4 _accessibilitySupportsActivateAction]) {
    return 1;
  }
  else {
    return [(TSDMovieRepAccessibility *)self tsaxIsPlayable];
  }
}

- (BOOL)accessibilityActivate
{
  if ([[(TSDRepAccessibility *)self tsaxRepForSelecting] tsaxIsSelected]&& [(TSDMovieRepAccessibility *)self tsaxIsPlayable])
  {
    [(TSDMovieRepAccessibility *)self tsaxTogglePlayback];
    return 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDMovieRepAccessibility;
    return [(TSDRepAccessibility *)&v4 accessibilityActivate];
  }
}

@end