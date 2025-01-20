@interface _UIBackdropViewSettingsLightKeyboard
- (BOOL)_shouldUseDarkeningTintLayer;
- (id)_defaultColorTintColorWithOpacity:(double)a3;
- (void)setDefaultValues;
@end

@implementation _UIBackdropViewSettingsLightKeyboard

- (BOOL)_shouldUseDarkeningTintLayer
{
  return 1;
}

- (id)_defaultColorTintColorWithOpacity:(double)a3
{
  if ([(_UIBackdropViewSettings *)self graphicsQuality] == 40
    || [(_UIBackdropViewSettings *)self graphicsQuality] == 10)
  {
    double v5 = 0.82745098;
    double v6 = 0.843137255;
    double v7 = 0.870588235;
  }
  else
  {
    double v5 = 0.921568627;
    double v6 = 0.941176471;
    double v7 = 0.968627451;
  }
  v8 = +[UIColor colorWithRed:v5 green:v6 blue:v7 alpha:a3];
  return v8;
}

- (void)setDefaultValues
{
  v14.receiver = self;
  v14.super_class = (Class)_UIBackdropViewSettingsLightKeyboard;
  [(_UIBackdropViewSettings *)&v14 setDefaultValues];
  v3 = +[UIDevice currentDevice];
  -[_UIBackdropViewSettings setGraphicsQuality:](self, "setGraphicsQuality:", [v3 _keyboardGraphicsQuality]);

  if (_AXSEnhanceBackgroundContrastEnabled()
    || [(_UIBackdropViewSettings *)self graphicsQuality] == 10)
  {
    uint64_t v4 = 0;
    double v5 = 1.0;
  }
  else
  {
    uint64_t v4 = 1;
    double v5 = 0.9;
  }
  [(_UIBackdropViewSettings *)self setRequiresColorStatistics:0];
  [(_UIBackdropViewSettings *)self setUsesColorTintView:1];
  int64_t v6 = [(_UIBackdropViewSettings *)self graphicsQuality];
  BOOL v7 = v6 == 100;
  [(_UIBackdropViewSettings *)self setUsesGrayscaleTintView:v7];
  [(_UIBackdropViewSettings *)self setUsesColorBurnTintView:v7];
  BOOL v8 = 0;
  if (v6 == 100) {
    BOOL v8 = [(_UIBackdropViewSettingsLightKeyboard *)self _shouldUseDarkeningTintLayer];
  }
  [(_UIBackdropViewSettings *)self setUsesDarkeningTintView:v8];
  [(_UIBackdropViewSettings *)self setGrayscaleTintLevel:1.0];
  [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:0.5];
  [(_UIBackdropViewSettings *)self setLightenGrayscaleWithSourceOver:v4];
  v9 = [(_UIBackdropViewSettingsLightKeyboard *)self _defaultColorTintColorWithOpacity:v5];
  [(_UIBackdropViewSettings *)self setColorTint:v9];

  [(_UIBackdropViewSettings *)self setColorTintAlpha:1.0];
  [(_UIBackdropViewSettings *)self setColorBurnTintLevel:0.87];
  [(_UIBackdropViewSettings *)self setColorBurnTintAlpha:1.0];
  if ([(_UIBackdropViewSettingsLightKeyboard *)self _shouldUseDarkeningTintLayer])
  {
    [(_UIBackdropViewSettings *)self setDarkeningTintAlpha:0.3];
    [(_UIBackdropViewSettings *)self setDarkeningTintHue:0.602777778];
    [(_UIBackdropViewSettings *)self setDarkeningTintSaturation:0.0];
    [(_UIBackdropViewSettings *)self setDarkeningTintBrightness:0.5];
    [(_UIBackdropViewSettings *)self setDarkenWithSourceOver:1];
  }
  int64_t v10 = [(_UIBackdropViewSettings *)self graphicsQuality];
  v11 = &_UIBackdropViewSettingsSaturationDeltaFactorStrong;
  v12 = &_UIBackdropViewSettingsBlurRadiusMedium;
  uint64_t v13 = 1;
  if (v10 != 100 && v10 != 40)
  {
    if (v10 != 10) {
      return;
    }
    uint64_t v13 = 0;
    v11 = &_UIBackdropViewSettingsSaturationDeltaFactorNone;
    v12 = &_UIBackdropViewSettingsBlurRadiusNone;
  }
  [(_UIBackdropViewSettings *)self setBackdropVisible:v13];
  [(_UIBackdropViewSettings *)self setUsesBackdropEffectView:v13];
  [(_UIBackdropViewSettings *)self setBlurRadius:*(double *)v12];
  [(_UIBackdropViewSettings *)self setSaturationDeltaFactor:*(double *)v11];
  [(_UIBackdropViewSettings *)self setFilterMaskAlpha:1.0];
  [(_UIBackdropViewSettings *)self setFilterMaskImage:0];
}

@end