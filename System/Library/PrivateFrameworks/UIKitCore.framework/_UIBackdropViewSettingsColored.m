@interface _UIBackdropViewSettingsColored
- (void)computeOutputSettingsUsingModel:(id)a3;
- (void)setDefaultValues;
@end

@implementation _UIBackdropViewSettingsColored

- (void)setDefaultValues
{
  v10.receiver = self;
  v10.super_class = (Class)_UIBackdropViewSettingsColored;
  [(_UIBackdropViewSettings *)&v10 setDefaultValues];
  int64_t v3 = [(_UIBackdropViewSettings *)self graphicsQuality];
  if (v3 == 10)
  {
    [(_UIBackdropViewSettings *)self setRequiresColorStatistics:0];
    [(_UIBackdropViewSettings *)self setBackdropVisible:0];
    [(_UIBackdropViewSettings *)self setUsesBackdropEffectView:0];
    [(_UIBackdropViewSettings *)self setUsesGrayscaleTintView:0];
    [(_UIBackdropViewSettings *)self setColorTint:0];
    [(_UIBackdropViewSettings *)self setColorTintAlpha:0.86];
    int v8 = _AXSEnhanceBackgroundContrastEnabled();
    double v7 = 1.0;
    v5 = &_UIBackdropViewSettingsSaturationDeltaFactorNone;
    v6 = &_UIBackdropViewSettingsBlurRadiusNone;
    if (!v8)
    {
LABEL_6:
      [(_UIBackdropViewSettings *)self setColorTintMaskAlpha:1.0];
      [(_UIBackdropViewSettings *)self setColorTintMaskImage:0];
      [(_UIBackdropViewSettings *)self setBlurRadius:*(double *)v6];
      [(_UIBackdropViewSettings *)self setSaturationDeltaFactor:*(double *)v5];
      [(_UIBackdropViewSettings *)self setFilterMaskAlpha:1.0];
      [(_UIBackdropViewSettings *)self setFilterMaskImage:0];
      goto LABEL_7;
    }
LABEL_5:
    [(_UIBackdropViewSettings *)self setColorTintAlpha:v7];
    goto LABEL_6;
  }
  if (v3 == 100)
  {
    [(_UIBackdropViewSettings *)self setRequiresColorStatistics:0];
    [(_UIBackdropViewSettings *)self setBackdropVisible:1];
    [(_UIBackdropViewSettings *)self setGrayscaleTintLevel:0.97];
    [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:0.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintMaskAlpha:1.0];
    [(_UIBackdropViewSettings *)self setGrayscaleTintMaskImage:0];
    v4 = [[UIColor alloc] initWithRed:0.0196078431 green:0.0196078431 blue:0.0196078431 alpha:1.0];
    [(_UIBackdropViewSettings *)self setColorTint:v4];

    v5 = &_UIBackdropViewSettingsSaturationDeltaFactorDesaturate;
    v6 = &_UIBackdropViewSettingsBlurRadiusSmall;
    double v7 = 0.6;
    goto LABEL_5;
  }
LABEL_7:
  v9 = +[UIColor whiteColor];
  [(_UIBackdropViewSettings *)self setLegibleColor:v9];
}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_UIBackdropViewSettingsColored;
  [(_UIBackdropViewSettings *)&v30 computeOutputSettingsUsingModel:v4];
  if ([(_UIBackdropViewSettings *)self isEnabled])
  {
    if (![(_UIBackdropViewSettings *)self isSelected]
      || [(_UIBackdropViewSettings *)self isHighlighted])
    {
      BOOL v5 = [(_UIBackdropViewSettings *)self isHighlighted];
      v6 = [v4 colorTint];
      [(_UIBackdropViewSettings *)self setColorTint:v6];

      if (v5)
      {
        [v4 colorTintAlpha];
        double v8 = v7 * 0.6;
LABEL_28:
        [(_UIBackdropViewSettings *)self setColorTintAlpha:v8];
        goto LABEL_31;
      }
      objc_super v10 = [v4 colorSettings];
      [v10 averageBrightness];
      double v12 = v11;

      v13 = [v4 colorSettings];
      [v13 averageSaturation];
      double v15 = v14;

      if (v12 < 0.5)
      {
        [v4 grayscaleTintAlpha];
        [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:fmin((0.5 - v12) * 1.25 + v16, 0.96)];
      }
      if (v15 > 0.7)
      {
        [(_UIBackdropViewSettings *)self grayscaleTintAlpha];
        [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:fmin((v15 + -0.7) * 1.75 + v17, 0.96)];
      }
      v18 = [v4 colorTint];
      v19 = _UIBackdropViewSettingsColorAcceptGreen();

      if (v18 == v19)
      {
        double v28 = 0.0;
        uint64_t v29 = 0;
        v20 = objc_msgSend(v4, "colorTint", 0, 0);
        [v20 getRed:&v29 green:&v28 blue:&v27 alpha:&v26];

        if (v28 > 0.95)
        {
          if (v12 > 0.7)
          {
            objc_msgSend(v4, "colorTintAlpha", v28);
            [(_UIBackdropViewSettings *)self setColorTintAlpha:fmin((v12 + -0.7) * 0.9 + v21, 0.96)];
            [(_UIBackdropViewSettings *)self setGrayscaleTintLevel:0.0];
            [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:fmin(v12 + -0.7 + v12 + -0.7, 0.96)];
          }
          if (v15 > 0.7)
          {
            [(_UIBackdropViewSettings *)self colorTintAlpha];
            [(_UIBackdropViewSettings *)self setColorTintAlpha:fmin(v15 + -0.7 + v22, 0.96)];
          }
        }
      }
      if (v12 <= 0.9)
      {
        v23 = +[UIColor whiteColor];
        [(_UIBackdropViewSettings *)self setLegibleColor:v23];
      }
      else
      {
        v23 = +[UIColor blackColor];
        v24 = [v23 colorWithAlphaComponent:0.4];
        [(_UIBackdropViewSettings *)self setLegibleColor:v24];
      }
      goto LABEL_31;
    }
    if (qword_1EB25F018 != -1) {
      dispatch_once(&qword_1EB25F018, &__block_literal_global_5);
    }
    [(_UIBackdropViewSettings *)self setColorTint:qword_1EB25F020];
    int64_t v25 = [(_UIBackdropViewSettings *)self graphicsQuality];
    if (v25 == 10)
    {
      double v8 = 0.96;
      goto LABEL_28;
    }
    if (v25 != 100) {
      goto LABEL_31;
    }
LABEL_27:
    double v8 = 0.75;
    goto LABEL_28;
  }
  if (_MergedGlobals_944 != -1) {
    dispatch_once(&_MergedGlobals_944, &__block_literal_global_29);
  }
  [(_UIBackdropViewSettings *)self setColorTint:qword_1EB25F010];
  int64_t v9 = [(_UIBackdropViewSettings *)self graphicsQuality];
  if (v9 == 10) {
    goto LABEL_27;
  }
  if (v9 == 100)
  {
    double v8 = 0.2;
    goto LABEL_28;
  }
LABEL_31:
}

@end