@interface TSDAudioRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxShouldExposeAsAttachmentToken;
- (NSString)tsaxLabel;
- (TSDMovieInfoAccessibility)_tsaxMovieInfo;
- (TSKAVPlayerControllerAccessibility)tsaxPlayerController;
- (id)tsaxKnobLabel;
@end

@implementation TSDAudioRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

+ (id)tsaxTargetClassName
{
  return @"TSDAudioRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxLabel
{
  v3 = [(TSDRepAccessibility *)self tsaxLockedLabel];
  v4 = [(TSDMovieInfoAccessibility *)[(TSDAudioRepAccessibility *)self _tsaxMovieInfo] tsaxMovieLabel];
  if ([(NSString *)v4 length]) {
    v5 = +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"audio.with.name %@"), v4];
  }
  else {
    v5 = TSAccessibilityLocalizedString(@"audio");
  }
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString(@"audio");
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

- (TSDMovieInfoAccessibility)_tsaxMovieInfo
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDMovieInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"movieInfo"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end