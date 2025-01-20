@interface THWAVTransportUIAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxIsMoviePlaying;
- (THWDetailSliderAccessibility)thaxScrubber;
- (UIButton)thaxPlayButton;
- (void)_thaxConfigurePlayButton;
- (void)layout;
- (void)pause;
- (void)play;
- (void)thaxConfigurePlayButton:(id)a3;
- (void)thaxConfigureViewsForConfigurationChange;
@end

@implementation THWAVTransportUIAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWAVTransportUI";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (UIButton)thaxPlayButton
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THWAVTransportUIAccessibility *)self tsaxValueForKey:@"playButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THWDetailSliderAccessibility)thaxScrubber
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWDetailSliderAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWAVTransportUIAccessibility *)self tsaxValueForKey:@"scrubber"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)thaxIsMoviePlaying
{
  id v2 = [(THWAVTransportUIAccessibility *)self tsaxValueForKey:@"transportController"];

  return [v2 tsaxBoolValueForKey:@"movieIsPlaying"];
}

- (void)play
{
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportUIAccessibility;
  [(THWAVTransportUIAccessibility *)&v3 play];
  [(THWAVTransportUIAccessibility *)self _thaxConfigurePlayButton];
}

- (void)pause
{
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportUIAccessibility;
  [(THWAVTransportUIAccessibility *)&v3 pause];
  [(THWAVTransportUIAccessibility *)self _thaxConfigurePlayButton];
}

- (void)layout
{
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportUIAccessibility;
  [(THWAVTransportUIAccessibility *)&v3 layout];
  [(THWAVTransportUIAccessibility *)self _thaxConfigurePlayButton];
  if ([(THWAVTransportUIAccessibility *)self tsaxRespondsToSelector:"thaxConfigureViewsForConfigurationChange" fromExtrasProtocol:&OBJC_PROTOCOL___THWAVTransportUIAccessibilityExtras])[(THWAVTransportUIAccessibility *)self thaxConfigureViewsForConfigurationChange]; {
}
  }

- (void)_thaxConfigurePlayButton
{
  if ([(THWAVTransportUIAccessibility *)self thaxIsMoviePlaying]) {
    CFStringRef v3 = @"av.pause.description";
  }
  else {
    CFStringRef v3 = @"av.play.description";
  }
  v4 = THAccessibilityLocalizedString((uint64_t)v3);
  if ([(THWAVTransportUIAccessibility *)self tsaxRespondsToSelector:"thaxConfigurePlayButton:" fromExtrasProtocol:&OBJC_PROTOCOL___THWAVTransportUIAccessibilityExtras])
  {
    [(THWAVTransportUIAccessibility *)self thaxConfigurePlayButton:v4];
  }
}

- (void)thaxConfigureViewsForConfigurationChange
{
  [(THWDetailSliderAccessibility *)[(THWAVTransportUIAccessibility *)self thaxScrubber] setAccessibilityLabel:THAccessibilityLocalizedString(@"av.trackposition.description")];
  if (![(THUISliderAccessibility *)[(THWAVTransportUIAccessibility *)self thaxScrubber] thaxValueHandler])
  {
    CFStringRef v3 = [(THWAVTransportUIAccessibility *)self thaxScrubber];
    [(THUISliderAccessibility *)v3 thaxSetValueHandler:&stru_46C7F8];
  }
}

- (void)thaxConfigurePlayButton:(id)a3
{
  [(UIButton *)[(THWAVTransportUIAccessibility *)self thaxPlayButton] setAccessibilityLabel:a3];
  v4 = [(THWAVTransportUIAccessibility *)self thaxPlayButton];
  UIAccessibilityTraits v5 = UIAccessibilityTraitStartsMediaSession | UIAccessibilityTraitButton;

  [(UIButton *)v4 setAccessibilityTraits:v5];
}

@end