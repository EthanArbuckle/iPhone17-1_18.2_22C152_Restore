@interface THWAVAudioUIAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_thaxHiddenPlayButton;
- (void)layout;
- (void)thaxConfigureHiddenAudioPlayButton;
@end

@implementation THWAVAudioUIAccessibility

- (void)thaxConfigureHiddenAudioPlayButton
{
  id v2 = [(THWAVAudioUIAccessibility *)self _thaxHiddenPlayButton];
  [v2 setAccessibilityLabel:THAccessibilityLocalizedString(@"av.play.description")];
  UIAccessibilityTraits v3 = UIAccessibilityTraitStartsMediaSession | UIAccessibilityTraitButton;

  [v2 setAccessibilityTraits:v3];
}

- (id)_thaxHiddenPlayButton
{
  return [(THWAVAudioUIAccessibility *)self tsaxValueForKey:@"hiddenPlayButton"];
}

+ (id)tsaxTargetClassName
{
  return @"THWAVAudioUI";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)layout
{
  v3.receiver = self;
  v3.super_class = (Class)THWAVAudioUIAccessibility;
  [(THWAVTransportUIAccessibility *)&v3 layout];
  if ([(THWAVAudioUIAccessibility *)self tsaxRespondsToSelector:"thaxConfigureAudioPlayButton" fromExtrasProtocol:&OBJC_PROTOCOL___THWAVAudioUIAccessibilityExtras])[(THWAVAudioUIAccessibility *)self thaxConfigureAudioPlayButton]; {
  if ([(THWAVAudioUIAccessibility *)self tsaxRespondsToSelector:"thaxConfigureHiddenAudioPlayButton" fromExtrasProtocol:&OBJC_PROTOCOL___THWAVAudioUIAccessibilityExtras])[(THWAVAudioUIAccessibility *)self thaxConfigureHiddenAudioPlayButton];
  }
}

@end