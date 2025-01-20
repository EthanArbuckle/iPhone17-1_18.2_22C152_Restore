@interface _UIBackdropViewSettingsCombiner
- (BOOL)isBackdropVisible;
- (BOOL)requiresBackdropLayer;
- (_UIBackdropViewSettings)inputSettingsA;
- (_UIBackdropViewSettings)inputSettingsB;
- (_UIBackdropViewSettings)outputSettingsA;
- (_UIBackdropViewSettings)outputSettingsB;
- (double)weighting;
- (void)computeOutputSettingsUsingModel:(id)a3;
- (void)copyAdditionalSettingsFromSettings:(id)a3;
- (void)setDefaultValues;
- (void)setInputSettingsA:(id)a3;
- (void)setInputSettingsB:(id)a3;
- (void)setOutputSettingsA:(id)a3;
- (void)setOutputSettingsB:(id)a3;
- (void)setRequiresColorStatistics:(BOOL)a3;
- (void)setWeighting:(double)a3;
@end

@implementation _UIBackdropViewSettingsCombiner

- (BOOL)isBackdropVisible
{
  return 1;
}

- (void)setWeighting:(double)a3
{
  self->_weighting = a3;
}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  v4 = a3;
  if (!self->_outputSettingsA)
  {
    v5 = (_UIBackdropViewSettings *)objc_alloc_init((Class)objc_opt_class());
    outputSettingsA = self->_outputSettingsA;
    self->_outputSettingsA = v5;
  }
  if (self->_outputSettingsB)
  {
    if (v4)
    {
LABEL_5:
      v7 = (void *)v4[6];
      goto LABEL_8;
    }
  }
  else
  {
    v8 = (_UIBackdropViewSettings *)objc_alloc_init((Class)objc_opt_class());
    outputSettingsB = self->_outputSettingsB;
    self->_outputSettingsB = v8;

    if (v4) {
      goto LABEL_5;
    }
  }
  v7 = 0;
LABEL_8:
  p_colorSettings = &self->super._colorSettings;
  objc_storeStrong((id *)&self->super._colorSettings, v7);
  inputSettingsA = self->_inputSettingsA;
  if (inputSettingsA) {
    objc_storeStrong((id *)&inputSettingsA->_colorSettings, *p_colorSettings);
  }
  inputSettingsB = self->_inputSettingsB;
  if (inputSettingsB) {
    objc_storeStrong((id *)&inputSettingsB->_colorSettings, *p_colorSettings);
  }
  [(_UIBackdropViewSettings *)self->_outputSettingsA computeOutputSettingsUsingModel:self->_inputSettingsA];
  [(_UIBackdropViewSettings *)self->_outputSettingsB computeOutputSettingsUsingModel:self->_inputSettingsB];
  double v13 = 0.0;
  double v14 = 1.0;
  self->_double weighting = fmin(fmax(self->_weighting, 0.0), 1.0);
  v15 = self->_outputSettingsA;
  if (v15)
  {
    double grayscaleTintLevel = v15->_grayscaleTintLevel;
    double grayscaleTintAlpha = v15->_grayscaleTintAlpha;
    v18 = v15->_colorTint;
    v19 = self->_outputSettingsA;
    double colorTintAlpha = v19->_colorTintAlpha;
    double blurRadius = v19->_blurRadius;
    double saturationDeltaFactor = v19->_saturationDeltaFactor;
    double zoom = v19->_zoom;
  }
  else
  {
    v18 = 0;
    double grayscaleTintLevel = 0.0;
    double grayscaleTintAlpha = 0.0;
    double colorTintAlpha = 0.0;
    double blurRadius = 0.0;
    double saturationDeltaFactor = 1.0;
    double zoom = 0.0;
  }
  double v44 = zoom;
  v21 = self->_outputSettingsB;
  if (v21)
  {
    double v13 = v21->_grayscaleTintLevel;
    double v22 = v21->_grayscaleTintAlpha;
    v23 = v21->_colorTint;
    v24 = self->_outputSettingsB;
    double v25 = v24->_colorTintAlpha;
    double v26 = v24->_blurRadius;
    double v14 = v24->_saturationDeltaFactor;
    double v27 = v24->_zoom;
  }
  else
  {
    v23 = 0;
    double v22 = 0.0;
    double v25 = 0.0;
    double v26 = 0.0;
    double v27 = 0.0;
  }
  double v39 = v27;
  self->super._double grayscaleTintLevel = v13 * self->_weighting + grayscaleTintLevel * (1.0 - self->_weighting);
  self->super._double grayscaleTintAlpha = v22 * self->_weighting + grayscaleTintAlpha * (1.0 - self->_weighting);
  double weighting = self->_weighting;
  v29 = v18;
  v30 = v23;
  double v52 = 0.0;
  double v53 = 0.0;
  double v50 = 0.0;
  double v51 = 0.0;
  if (![(UIColor *)v29 getRed:&v53 green:&v52 blue:&v51 alpha:&v50])
  {
    double v49 = 0.0;
    [(UIColor *)v29 getWhite:&v49 alpha:&v50];
    double v51 = v49;
    double v52 = v49;
    double v53 = v49;
  }
  double v31 = 1.0 - weighting;
  double v48 = 0.0;
  double v49 = 0.0;
  double v46 = 0.0;
  double v47 = 0.0;
  if (-[UIColor getRed:green:blue:alpha:](v30, "getRed:green:blue:alpha:", &v49, &v48, &v47, &v46, *(void *)&v39))
  {
    double v33 = v48;
    double v32 = v49;
    double v34 = v47;
  }
  else
  {
    double v45 = 0.0;
    [(UIColor *)v30 getWhite:&v45 alpha:&v46];
    double v33 = v45;
    double v47 = v45;
    double v48 = v45;
    double v49 = v45;
    double v34 = v45;
    double v32 = v45;
  }
  v35 = +[UIColor colorWithRed:(1.0 - v31) * v32 + v31 * v53 green:(1.0 - v31) * v34 + v31 * v52 blue:(1.0 - v31) * v33 + v31 * v51 alpha:v31 * v50 + (1.0 - v31) * v46];

  colorTint = self->super._colorTint;
  self->super._colorTint = v35;

  self->super._double colorTintAlpha = v25 * self->_weighting + colorTintAlpha * (1.0 - self->_weighting);
  self->super._double blurRadius = v26 * self->_weighting + blurRadius * (1.0 - self->_weighting);
  self->super._double saturationDeltaFactor = v14 * self->_weighting + saturationDeltaFactor * (1.0 - self->_weighting);
  self->super._double zoom = v40 * self->_weighting + v44 * (1.0 - self->_weighting);
  if (!self->_outputSettingsA && !self->_outputSettingsB) {
    self->super._scale = 1.0;
  }
  _UIBackdropViewComputeLegibleColorWithColorSettings(self->super._colorSettings);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
  v37 = (UIColor *)objc_claimAutoreleasedReturnValue();
  legibleColor = self->super._legibleColor;
  self->super._legibleColor = v37;

  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setInputSettingsB:(id)a3
{
}

- (void)setInputSettingsA:(id)a3
{
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsCombiner;
  [(_UIBackdropViewSettings *)&v3 setDefaultValues];
  self->super._requiresColorStatistics = 0;
}

- (void)copyAdditionalSettingsFromSettings:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIBackdropViewSettingsCombiner;
  [(_UIBackdropViewSettings *)&v12 copyAdditionalSettingsFromSettings:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 inputSettingsA];
    v7 = +[_UIBackdropViewSettings settingsPreservingHintsFromSettings:v6 graphicsQuality:[(_UIBackdropViewSettings *)self graphicsQuality]];
    [(_UIBackdropViewSettingsCombiner *)self setInputSettingsA:v7];

    v8 = [v5 inputSettingsB];
    v9 = +[_UIBackdropViewSettings settingsPreservingHintsFromSettings:v8 graphicsQuality:[(_UIBackdropViewSettings *)self graphicsQuality]];
    [(_UIBackdropViewSettingsCombiner *)self setInputSettingsB:v9];

    [v5 weighting];
    double v11 = v10;

    [(_UIBackdropViewSettingsCombiner *)self setWeighting:v11];
  }
}

- (_UIBackdropViewSettings)inputSettingsB
{
  return self->_inputSettingsB;
}

- (_UIBackdropViewSettings)inputSettingsA
{
  return self->_inputSettingsA;
}

- (double)weighting
{
  return self->_weighting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputSettingsB, 0);
  objc_storeStrong((id *)&self->_outputSettingsA, 0);
  objc_storeStrong((id *)&self->_inputSettingsB, 0);
  objc_storeStrong((id *)&self->_inputSettingsA, 0);
}

- (void)setRequiresColorStatistics:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsCombiner;
  [(_UIBackdropViewSettings *)&v3 setRequiresColorStatistics:0];
}

- (BOOL)requiresBackdropLayer
{
  return 1;
}

- (_UIBackdropViewSettings)outputSettingsA
{
  return self->_outputSettingsA;
}

- (void)setOutputSettingsA:(id)a3
{
}

- (_UIBackdropViewSettings)outputSettingsB
{
  return self->_outputSettingsB;
}

- (void)setOutputSettingsB:(id)a3
{
}

@end