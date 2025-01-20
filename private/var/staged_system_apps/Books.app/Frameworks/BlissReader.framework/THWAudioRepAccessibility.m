@interface THWAudioRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxHasAudioControls;
- (BOOL)thaxIsPaused;
- (BOOL)thaxIsPlaying;
- (BOOL)thaxShouldHideChildReps;
- (NSString)thaxMediaLabel;
- (id)_thaxChildReps;
- (id)_thaxMovieInfo;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
- (void)thaxTogglePlaying;
@end

@implementation THWAudioRepAccessibility

- (BOOL)isAccessibilityElement
{
  return ![(THWAudioRepAccessibility *)self thaxHasAudioControls];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  unsigned __int8 v3 = [(THWAudioRepAccessibility *)self thaxHasAudioControls];
  if ((v3 & 1) == 0) {
    [(THWAudioRepAccessibility *)self thaxTogglePlaying];
  }
  return v3 ^ 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)THWAudioRepAccessibility;
  unint64_t v3 = [(TSDRepAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(THWAudioRepAccessibility *)self thaxHasAudioControls];
  UIAccessibilityTraits v5 = UIAccessibilityTraitButton | UIAccessibilityTraitStartsMediaSession;
  if (v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityHint
{
  if ([(THWAudioRepAccessibility *)self thaxHasAudioControls])
  {
    v5.receiver = self;
    v5.super_class = (Class)THWAudioRepAccessibility;
    return [(THTSDRepAccessibility *)&v5 accessibilityHint];
  }
  else
  {
    if ([(THWAudioRepAccessibility *)self thaxIsPlaying])
    {
      CFStringRef v4 = @"av.pause.playing.hint.ios";
    }
    else if ([(THWAudioRepAccessibility *)self thaxIsPaused])
    {
      CFStringRef v4 = @"av.play.paused.hint.ios";
    }
    else
    {
      CFStringRef v4 = @"av.play.stopped.hint.ios";
    }
    return THAccessibilityLocalizedString((uint64_t)v4);
  }
}

+ (id)tsaxTargetClassName
{
  return @"THWAudioRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)thaxTogglePlaying
{
  if ([(THWAudioRepAccessibility *)self thaxIsPlaying])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_29F2DC;
    v4[3] = &unk_456DE0;
    v4[4] = self;
    unint64_t v3 = v4;
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_29F2D4;
    v5[3] = &unk_456DE0;
    v5[4] = self;
    unint64_t v3 = v5;
  }
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (NSString)thaxMediaLabel
{
  id v2 = [(THWAudioRepAccessibility *)self _thaxMovieInfo];

  return (NSString *)[v2 thaxMediaLabel];
}

- (BOOL)thaxIsPlaying
{
  return [(THWAudioRepAccessibility *)self tsaxBoolValueForKey:@"isPlaying"];
}

- (BOOL)thaxIsPaused
{
  return [(THWAudioRepAccessibility *)self tsaxBoolValueForKey:@"isPaused"];
}

- (BOOL)thaxHasAudioControls
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(THWAudioRepAccessibility *)self _thaxChildReps];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        v8 = objc_opt_class();
        if (__TSAccessibilityCastAsSafeCategory(v8, v7, 0, 0))
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (BOOL)thaxShouldHideChildReps
{
  return ![(THWAudioRepAccessibility *)self thaxHasAudioControls];
}

- (id)_thaxMovieInfo
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"movieInfo"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_thaxChildReps
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"childReps"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end