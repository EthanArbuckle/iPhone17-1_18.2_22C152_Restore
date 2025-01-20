@interface _UIBackdropViewSettingsATVAdaptiveLighten
- (void)setDefaultValues;
@end

@implementation _UIBackdropViewSettingsATVAdaptiveLighten

- (void)setDefaultValues
{
  v14.receiver = self;
  v14.super_class = (Class)_UIBackdropViewSettingsATVAdaptiveLighten;
  [(_UIBackdropViewSettings *)&v14 setDefaultValues];
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
    v8 = +[UIColor whiteColor];
    [(_UIBackdropViewSettings *)self setColorTint:v8];

    [(_UIBackdropViewSettings *)self setColorTintAlpha:0.0];
    [(_UIBackdropViewSettings *)self setColorTintMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setColorTintMaskImage:0];
    [(_UIBackdropViewSettings *)self setBlurRadius:0.0];
    [(_UIBackdropViewSettings *)self setSaturationDeltaFactor:1.0];
    [(_UIBackdropViewSettings *)self setFilterMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setFilterMaskImage:0];
    v9 = +[UIColor whiteColor];
    [(_UIBackdropViewSettings *)self setLegibleColor:v9];

    if (!v3) {
      return;
    }
    v10 = +[UIColor colorWithRed:0.643137255 green:0.666666667 blue:0.682352941 alpha:1.0];
    [(_UIBackdropViewSettings *)self setColorTint:v10];

    [(_UIBackdropViewSettings *)self setColorTintAlpha:1.0];
    uint64_t v7 = +[UIColor blackColor];
  }
  else
  {
    if ([(_UIBackdropViewSettings *)self graphicsQuality] != 100) {
      return;
    }
    [(_UIBackdropViewSettings *)self setRequiresColorStatistics:0];
    [(_UIBackdropViewSettings *)self setBackdropVisible:1];
    [(_UIBackdropViewSettings *)self setUsesColorTintView:1];
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v4 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1) {
      goto LABEL_7;
    }
    int v12 = _UIInternalPreference_TVVisualEffectWithColorMatrix;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_TVVisualEffectWithColorMatrix) {
      goto LABEL_7;
    }
    while (v4 >= v12)
    {
      _UIInternalPreferenceSync(v4, &_UIInternalPreference_TVVisualEffectWithColorMatrix, @"TVVisualEffectWithColorMatrix", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v12 = _UIInternalPreference_TVVisualEffectWithColorMatrix;
      if (v4 == _UIInternalPreference_TVVisualEffectWithColorMatrix) {
        goto LABEL_7;
      }
    }
    if (byte_1E8FD4F54)
    {
LABEL_7:
      [(_UIBackdropViewSettings *)self setUsesColorOffset:1];
      v13[0] = xmmword_186B92B70;
      v13[1] = xmmword_186B92B80;
      v13[2] = xmmword_186B92B90;
      v13[3] = xmmword_186B92BA0;
      v13[4] = xmmword_186B92B40;
      v5 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v13];
      [(_UIBackdropViewSettings *)self setColorOffsetMatrix:v5];
    }
    [(_UIBackdropViewSettings *)self setGrayscaleTintLevel:0.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:0.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintMaskImage:0];
    v6 = +[UIColor whiteColor];
    [(_UIBackdropViewSettings *)self setColorTint:v6];

    [(_UIBackdropViewSettings *)self setColorTintAlpha:0.07];
    [(_UIBackdropViewSettings *)self setColorTintMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setColorTintMaskImage:0];
    [(_UIBackdropViewSettings *)self setBlurRadius:60.0];
    [(_UIBackdropViewSettings *)self setSaturationDeltaFactor:1.3];
    [(_UIBackdropViewSettings *)self setFilterMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setFilterMaskImage:0];
    uint64_t v7 = +[UIColor whiteColor];
  }
  v11 = (void *)v7;
  [(_UIBackdropViewSettings *)self setLegibleColor:v7];
}

@end