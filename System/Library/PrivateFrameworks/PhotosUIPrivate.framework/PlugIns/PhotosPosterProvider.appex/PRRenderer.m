@interface PRRenderer
- (double)px_backlightTransformAnimationDuration;
- (double)px_lowLuminanceAlphaAnimationDuration;
- (double)px_shuffleSleepFadeInAnimationDuration;
- (double)px_shuffleSleepFadeOutAnimationDuration;
- (double)px_shuffleSleepTransformOutAnimationDuration;
- (id)px_extendRenderSessionForReason:(id)a3;
- (void)px_noteContentSignificantlyChanged;
- (void)px_updatePreferences:(id)a3;
@end

@implementation PRRenderer

- (void)px_updatePreferences:(id)a3
{
}

- (void)px_noteContentSignificantlyChanged
{
  v2 = self;
  PRRenderer.px_noteContentSignificantlyChanged()();
}

- (id)px_extendRenderSessionForReason:(id)a3
{
  sub_100028CE0();
  v4 = self;
  id v5 = PRRenderer.px_extendRenderSession(forReason:)();

  swift_bridgeObjectRelease();
  return v5;
}

- (double)px_backlightTransformAnimationDuration
{
  return 0.5;
}

- (double)px_lowLuminanceAlphaAnimationDuration
{
  return 0.5;
}

- (double)px_shuffleSleepTransformOutAnimationDuration
{
  return 0.5;
}

- (double)px_shuffleSleepFadeOutAnimationDuration
{
  return 0.5;
}

- (double)px_shuffleSleepFadeInAnimationDuration
{
  return 1.995;
}

@end