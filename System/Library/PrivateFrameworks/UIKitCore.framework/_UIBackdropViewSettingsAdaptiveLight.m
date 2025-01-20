@interface _UIBackdropViewSettingsAdaptiveLight
- (void)setDefaultValues;
@end

@implementation _UIBackdropViewSettingsAdaptiveLight

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)_UIBackdropViewSettingsAdaptiveLight;
  [(_UIBackdropViewSettingsLight *)&v4 setDefaultValues];
  int64_t v3 = [(_UIBackdropViewSettings *)self graphicsQuality];
  if (v3 == 10)
  {
    [(_UIBackdropViewSettings *)self setRequiresColorStatistics:0];
  }
  else if (v3 == 100)
  {
    [(_UIBackdropViewSettings *)self setRequiresColorStatistics:1];
    [(_UIBackdropViewSettings *)self setUsesDarkeningTintView:1];
    [(_UIBackdropViewSettings *)self setDarkeningTintAlpha:0.3];
    [(_UIBackdropViewSettings *)self setSaturationDeltaFactor:2.0];
  }
}

@end