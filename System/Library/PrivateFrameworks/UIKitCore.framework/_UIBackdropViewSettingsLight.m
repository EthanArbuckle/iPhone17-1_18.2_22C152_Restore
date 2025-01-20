@interface _UIBackdropViewSettingsLight
- (void)computeOutputSettingsUsingModel:(id)a3;
- (void)setDefaultValues;
@end

@implementation _UIBackdropViewSettingsLight

- (void)setDefaultValues
{
  v17.receiver = self;
  v17.super_class = (Class)_UIBackdropViewSettingsLight;
  [(_UIBackdropViewSettings *)&v17 setDefaultValues];
  self->super._requiresColorStatistics = 0;
  int64_t graphicsQuality = self->super._graphicsQuality;
  if (graphicsQuality == 10)
  {
    self->super._backdropVisible = 0;
    self->super._usesBackdropEffectView = 0;
    self->super._usesColorTintView = 0;
    *(_OWORD *)&self->super._grayscaleTintLevel = xmmword_186B92D50;
    if (_AXSEnhanceBackgroundContrastEnabled()) {
      self->super._grayscaleTintAlpha = 1.0;
    }
    v4 = &_UIBackdropViewSettingsSaturationDeltaFactorNone;
    v5 = &_UIBackdropViewSettingsBlurRadiusNone;
    goto LABEL_7;
  }
  if (graphicsQuality == 100)
  {
    self->super._backdropVisible = 1;
    self->super._usesColorTintView = 0;
    *(_OWORD *)&self->super._grayscaleTintLevel = xmmword_186B92D60;
    v4 = &_UIBackdropViewSettingsSaturationDeltaFactorStrong;
    v5 = &_UIBackdropViewSettingsBlurRadiusLarge;
LABEL_7:
    grayscaleTintMaskImage = self->super._grayscaleTintMaskImage;
    self->super._grayscaleTintMaskAlpha = 1.0;
    self->super._grayscaleTintMaskImage = 0;

    colorTint = self->super._colorTint;
    self->super._colorTint = 0;

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&self->super._colorTintAlpha = _Q0;
    colorTintMaskImage = self->super._colorTintMaskImage;
    self->super._colorTintMaskImage = 0;

    *(void *)&self->super._blurRadius = *v5;
    *(void *)&self->super._saturationDeltaFactor = *v4;
    filterMaskImage = self->super._filterMaskImage;
    self->super._filterMaskAlpha = 1.0;
    self->super._filterMaskImage = 0;
  }
  v15 = +[UIColor whiteColor];
  legibleColor = self->super._legibleColor;
  self->super._legibleColor = v15;
}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_UIBackdropViewSettingsLight;
  [(_UIBackdropViewSettings *)&v25 computeOutputSettingsUsingModel:v4];
  if (self->super._enabled)
  {
    if (self->super._selected)
    {
      if (!self->super._highlighted)
      {
        if (qword_1EB25F048 != -1) {
          dispatch_once(&qword_1EB25F048, &__block_literal_global_25);
        }
        objc_storeStrong((id *)&self->super._colorTint, (id)qword_1EB25F050);
        int64_t graphicsQuality = self->super._graphicsQuality;
        if (graphicsQuality == 10)
        {
          double v7 = 0.96;
          goto LABEL_21;
        }
        if (graphicsQuality != 100) {
          goto LABEL_22;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if (self->super._highlighted)
    {
LABEL_15:
      objc_storeStrong((id *)&self->super._colorTint, *((id *)v4 + 16));
      self->super._colorTintAlpha = *((double *)v4 + 17) * 0.6;
      goto LABEL_22;
    }
    p_colorTint = &self->super._colorTint;
    colorTint = self->super._colorTint;
    self->super._colorTint = 0;

    self->super._colorTintAlpha = 0.0;
    self->super._grayscaleTintAlpha = *((double *)v4 + 12);
    v10 = (void *)*((void *)v4 + 16);
    if (v10)
    {
      objc_storeStrong((id *)&self->super._colorTint, v10);
      double v11 = *((double *)v4 + 17);
    }
    else
    {
      if (*((void *)v4 + 7) != 1
        || (uint64_t v19 = *((void *)v4 + 8), v19 < 0)
        || (double v20 = (double)v19 * 0.04 + 0.08, v20 <= 0.0))
      {
LABEL_35:
        int64_t v23 = self->super._graphicsQuality;
        if (v23 == 10)
        {
          self->super._grayscaleTintLevel = fmin(self->super._grayscaleTintLevel + (double)*((uint64_t *)v4 + 8) * 0.1, 1.0);
        }
        else if (v23 == 100)
        {
          self->super._grayscaleTintAlpha = fmin(self->super._grayscaleTintAlpha* ((double)*((uint64_t *)v4 + 8) * 0.5 + 1.0), 1.0);
        }
        goto LABEL_22;
      }
      uint64_t v21 = +[_UIBackdropViewSettings darkeningTintColor];
      v22 = *p_colorTint;
      *p_colorTint = (UIColor *)v21;

      double v11 = v20 * *((double *)v4 + 17);
    }
    self->super._colorTintAlpha = v11;
    goto LABEL_35;
  }
  if (_MergedGlobals_946 != -1) {
    dispatch_once(&_MergedGlobals_946, &__block_literal_global_30);
  }
  objc_storeStrong((id *)&self->super._colorTint, (id)qword_1EB25F040);
  int64_t v6 = self->super._graphicsQuality;
  if (v6 == 10)
  {
LABEL_16:
    double v7 = 0.75;
    goto LABEL_21;
  }
  if (v6 == 100)
  {
    double v7 = 0.2;
LABEL_21:
    self->super._colorTintAlpha = v7;
  }
LABEL_22:
  [*((id *)v4 + 6) averageBrightness];
  double v13 = v12;
  id v14 = *((id *)v4 + 16);
  v15 = v14;
  if (v14)
  {
    if ((double v24 = 0.0,
          id v16 = v14,
          CGColorGetNumberOfComponents((CGColorRef)[v16 CGColor]) == 2)
      && ([v16 getWhite:&v24 alpha:0] & 1) != 0
      || [v16 getHue:0 saturation:0 brightness:&v24 alpha:0])
    {
      double v13 = v24;
    }
  }
  if (v13 <= 0.65)
  {
    objc_super v17 = +[UIColor whiteColor];
  }
  else
  {
    objc_super v17 = [[UIColor alloc] initWithWhite:0.0 alpha:0.6];
  }
  legibleColor = self->super._legibleColor;
  self->super._legibleColor = v17;
}

@end