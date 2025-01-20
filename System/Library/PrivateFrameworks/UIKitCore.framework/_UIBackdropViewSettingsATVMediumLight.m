@interface _UIBackdropViewSettingsATVMediumLight
- (void)setDefaultValues;
@end

@implementation _UIBackdropViewSettingsATVMediumLight

- (void)setDefaultValues
{
  v9.receiver = self;
  v9.super_class = (Class)_UIBackdropViewSettingsATVMediumLight;
  [(_UIBackdropViewSettings *)&v9 setDefaultValues];
  int v3 = _AXSEnhanceBackgroundContrastEnabled();
  if ([(_UIBackdropViewSettings *)self graphicsQuality] == 10 || v3)
  {
    [(_UIBackdropViewSettings *)self setRequiresColorStatistics:0];
    [(_UIBackdropViewSettings *)self setBackdropVisible:0];
    [(_UIBackdropViewSettings *)self setUsesBackdropEffectView:0];
    [(_UIBackdropViewSettings *)self setUsesColorTintView:1];
    [(_UIBackdropViewSettings *)self setGrayscaleTintLevel:0.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:0.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintMaskImage:0];
    v6 = +[UIColor colorWithRed:0.996078431 green:0.992156863 blue:1.0 alpha:1.0];
    [(_UIBackdropViewSettings *)self setColorTint:v6];

    [(_UIBackdropViewSettings *)self setColorTintAlpha:0.55];
    [(_UIBackdropViewSettings *)self setColorTintMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setColorTintMaskImage:0];
    [(_UIBackdropViewSettings *)self setBlurRadius:0.0];
    [(_UIBackdropViewSettings *)self setSaturationDeltaFactor:1.0];
    [(_UIBackdropViewSettings *)self setFilterMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setFilterMaskImage:0];
    v7 = +[UIColor blackColor];
    [(_UIBackdropViewSettings *)self setLegibleColor:v7];

    if (v3)
    {
      v8 = +[UIColor colorWithRed:0.784313725 green:0.8 blue:0.807843137 alpha:1.0];
      [(_UIBackdropViewSettings *)self setColorTint:v8];

      [(_UIBackdropViewSettings *)self setColorTintAlpha:1.0];
    }
  }
  else if ([(_UIBackdropViewSettings *)self graphicsQuality] == 100)
  {
    [(_UIBackdropViewSettings *)self setRequiresColorStatistics:0];
    [(_UIBackdropViewSettings *)self setBackdropVisible:1];
    [(_UIBackdropViewSettings *)self setUsesColorTintView:1];
    [(_UIBackdropViewSettings *)self setGrayscaleTintLevel:0.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:0.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintMaskImage:0];
    v4 = +[UIColor colorWithRed:0.996078431 green:0.992156863 blue:1.0 alpha:1.0];
    [(_UIBackdropViewSettings *)self setColorTint:v4];

    [(_UIBackdropViewSettings *)self setColorTintAlpha:0.5];
    [(_UIBackdropViewSettings *)self setColorTintMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setColorTintMaskImage:0];
    [(_UIBackdropViewSettings *)self setBlurRadius:90.0];
    [(_UIBackdropViewSettings *)self setSaturationDeltaFactor:1.6];
    [(_UIBackdropViewSettings *)self setFilterMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setFilterMaskImage:0];
    v5 = +[UIColor blackColor];
    [(_UIBackdropViewSettings *)self setLegibleColor:v5];
  }
}

@end