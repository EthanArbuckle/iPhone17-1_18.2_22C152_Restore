@interface _UIBackdropViewSettingsATVAdaptive
- (void)setDefaultValues;
@end

@implementation _UIBackdropViewSettingsATVAdaptive

- (void)setDefaultValues
{
  v13.receiver = self;
  v13.super_class = (Class)_UIBackdropViewSettingsATVAdaptive;
  [(_UIBackdropViewSettings *)&v13 setDefaultValues];
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

    if (v3)
    {
      v10 = +[UIColor colorWithRed:0.301960784 green:0.325490196 blue:0.337254902 alpha:1.0];
      [(_UIBackdropViewSettings *)self setColorTint:v10];

      [(_UIBackdropViewSettings *)self setColorTintAlpha:1.0];
    }
  }
  else if ([(_UIBackdropViewSettings *)self graphicsQuality] == 100)
  {
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
    int v11 = _UIInternalPreference_TVVisualEffectWithColorMatrix;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_TVVisualEffectWithColorMatrix) {
      goto LABEL_7;
    }
    while (v4 >= v11)
    {
      _UIInternalPreferenceSync(v4, &_UIInternalPreference_TVVisualEffectWithColorMatrix, @"TVVisualEffectWithColorMatrix", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v11 = _UIInternalPreference_TVVisualEffectWithColorMatrix;
      if (v4 == _UIInternalPreference_TVVisualEffectWithColorMatrix) {
        goto LABEL_7;
      }
    }
    if (byte_1E8FD4F54)
    {
LABEL_7:
      [(_UIBackdropViewSettings *)self setUsesColorOffset:1];
      v12[0] = xmmword_186B92B00;
      v12[1] = xmmword_186B92B10;
      v12[2] = xmmword_186B92B20;
      v12[3] = xmmword_186B92B30;
      v12[4] = xmmword_186B92B40;
      v5 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v12];
      [(_UIBackdropViewSettings *)self setColorOffsetMatrix:v5];
    }
    [(_UIBackdropViewSettings *)self setGrayscaleTintLevel:0.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:0.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintMaskImage:0];
    v6 = +[UIColor whiteColor];
    [(_UIBackdropViewSettings *)self setColorTint:v6];

    [(_UIBackdropViewSettings *)self setColorTintAlpha:0.0];
    [(_UIBackdropViewSettings *)self setColorTintMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setColorTintMaskImage:0];
    [(_UIBackdropViewSettings *)self setBlurRadius:30.0];
    [(_UIBackdropViewSettings *)self setSaturationDeltaFactor:1.0];
    [(_UIBackdropViewSettings *)self setFilterMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setFilterMaskImage:0];
    v7 = +[UIColor whiteColor];
    [(_UIBackdropViewSettings *)self setLegibleColor:v7];
  }
}

@end