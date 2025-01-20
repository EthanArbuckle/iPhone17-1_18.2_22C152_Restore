@interface PUPosterHeadroomSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)useSoftLightBlendingModeForTopGradient;
- (double)blurMaskHeight;
- (double)blurMaskTopLocation;
- (double)blurRadius;
- (double)blurVisibilityFraction;
- (double)bottomGradientAlpha;
- (double)bottomGradientBottomLocation;
- (double)bottomGradientTopLocation;
- (double)fadeAnimationDuration;
- (double)falloffHeight;
- (double)gradientHeight;
- (double)gradientWhite;
- (double)highKeyGradientWhite;
- (double)topGradientAlpha;
- (double)topGradientBottomLocation;
- (double)topGradientTopLocation;
- (id)parentSettings;
- (void)setBlurMaskHeight:(double)a3;
- (void)setBlurMaskTopLocation:(double)a3;
- (void)setBlurRadius:(double)a3;
- (void)setBlurVisibilityFraction:(double)a3;
- (void)setBottomGradientAlpha:(double)a3;
- (void)setBottomGradientBottomLocation:(double)a3;
- (void)setBottomGradientTopLocation:(double)a3;
- (void)setDefaultValues;
- (void)setFadeAnimationDuration:(double)a3;
- (void)setFalloffHeight:(double)a3;
- (void)setGradientHeight:(double)a3;
- (void)setGradientWhite:(double)a3;
- (void)setHighKeyGradientWhite:(double)a3;
- (void)setTopGradientAlpha:(double)a3;
- (void)setTopGradientBottomLocation:(double)a3;
- (void)setTopGradientTopLocation:(double)a3;
- (void)setUseSoftLightBlendingModeForTopGradient:(BOOL)a3;
@end

@implementation PUPosterHeadroomSettings

- (BOOL)useSoftLightBlendingModeForTopGradient
{
  return self->_useSoftLightBlendingModeForTopGradient;
}

- (double)topGradientBottomLocation
{
  return self->_topGradientBottomLocation;
}

- (double)topGradientTopLocation
{
  return self->_topGradientTopLocation;
}

- (double)topGradientAlpha
{
  return self->_topGradientAlpha;
}

- (double)bottomGradientBottomLocation
{
  return self->_bottomGradientBottomLocation;
}

- (double)bottomGradientTopLocation
{
  return self->_bottomGradientTopLocation;
}

- (double)bottomGradientAlpha
{
  return self->_bottomGradientAlpha;
}

- (double)highKeyGradientWhite
{
  return self->_highKeyGradientWhite;
}

- (double)gradientWhite
{
  return self->_gradientWhite;
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (double)falloffHeight
{
  return self->_falloffHeight;
}

- (double)blurMaskTopLocation
{
  return self->_blurMaskTopLocation;
}

- (void)setBlurMaskHeight:(double)a3
{
  self->_blurMaskHeight = a3;
}

- (double)blurMaskHeight
{
  return self->_blurMaskHeight;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void)setBlurVisibilityFraction:(double)a3
{
  self->_blurVisibilityFraction = a3;
}

- (double)blurVisibilityFraction
{
  return self->_blurVisibilityFraction;
}

- (void)setFadeAnimationDuration:(double)a3
{
  self->_fadeAnimationDuration = a3;
}

- (double)fadeAnimationDuration
{
  return self->_fadeAnimationDuration;
}

- (void)setUseSoftLightBlendingModeForTopGradient:(BOOL)a3
{
  if (self->_useSoftLightBlendingModeForTopGradient != a3)
  {
    BOOL v3 = a3;
    self->_useSoftLightBlendingModeForTopGradient = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setUseSoftLightBlendingModeForTopGradient:v3];
  }
}

- (void)setTopGradientBottomLocation:(double)a3
{
  if (vabdd_f64(self->_topGradientBottomLocation, a3) > 0.00000999999975)
  {
    self->_topGradientBottomLocation = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setTopGradientBottomLocation:a3];
  }
}

- (void)setTopGradientTopLocation:(double)a3
{
  if (vabdd_f64(self->_topGradientTopLocation, a3) > 0.00000999999975)
  {
    self->_topGradientTopLocation = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setTopGradientTopLocation:a3];
  }
}

- (void)setTopGradientAlpha:(double)a3
{
  if (vabdd_f64(self->_topGradientAlpha, a3) > 0.00000999999975)
  {
    self->_topGradientAlpha = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setTopGradientAlpha:a3];
  }
}

- (void)setBottomGradientBottomLocation:(double)a3
{
  if (vabdd_f64(self->_bottomGradientBottomLocation, a3) > 0.00000999999975)
  {
    self->_bottomGradientBottomLocation = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setBottomGradientBottomLocation:a3];
  }
}

- (void)setBottomGradientTopLocation:(double)a3
{
  if (vabdd_f64(self->_bottomGradientTopLocation, a3) > 0.00000999999975)
  {
    self->_bottomGradientTopLocation = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setBottomGradientTopLocation:a3];
  }
}

- (void)setBottomGradientAlpha:(double)a3
{
  if (vabdd_f64(self->_bottomGradientAlpha, a3) > 0.00000999999975)
  {
    self->_bottomGradientAlpha = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setBottomGradientAlpha:a3];
  }
}

- (void)setHighKeyGradientWhite:(double)a3
{
  if (vabdd_f64(self->_highKeyGradientWhite, a3) > 0.00000999999975)
  {
    self->_highKeyGradientWhite = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setHighKeyGradientWhite:a3];
  }
}

- (void)setGradientWhite:(double)a3
{
  if (vabdd_f64(self->_gradientWhite, a3) > 0.00000999999975)
  {
    self->_gradientWhite = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setGradientWhite:a3];
  }
}

- (void)setGradientHeight:(double)a3
{
  if (vabdd_f64(self->_gradientHeight, a3) > 0.00000999999975)
  {
    self->_gradientHeight = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setGradientHeight:a3];
  }
}

- (void)setFalloffHeight:(double)a3
{
  if (vabdd_f64(self->_falloffHeight, a3) > 0.00000999999975)
  {
    self->_falloffHeight = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setFalloffHeight:a3];
  }
}

- (void)setBlurMaskTopLocation:(double)a3
{
  if (vabdd_f64(self->_blurMaskTopLocation, a3) > 0.00000999999975)
  {
    self->_blurMaskTopLocation = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setBlurMaskTopLocation:a3];
  }
}

- (void)setBlurRadius:(double)a3
{
  if (vabdd_f64(self->_blurRadius, a3) > 0.00000999999975)
  {
    self->_blurRadius = a3;
    id v4 = [MEMORY[0x1E4F8A2C8] sharedInstance];
    [v4 setBlurRadius:a3];
  }
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUPosterHeadroomSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUPosterHeadroomSettings *)self setFadeAnimationDuration:0.300000012];
  [(PUPosterHeadroomSettings *)self setBlurVisibilityFraction:1.0];
  [(PUPosterHeadroomSettings *)self setBlurRadius:7.0];
  [(PUPosterHeadroomSettings *)self setBlurMaskTopLocation:0.49000001];
  [(PUPosterHeadroomSettings *)self setBlurMaskHeight:300.0];
  [(PUPosterHeadroomSettings *)self setFalloffHeight:0.180000007];
  [(PUPosterHeadroomSettings *)self setGradientHeight:1.0];
  [(PUPosterHeadroomSettings *)self setGradientWhite:0.0];
  [(PUPosterHeadroomSettings *)self setHighKeyGradientWhite:1.0];
  [(PUPosterHeadroomSettings *)self setBottomGradientAlpha:0.75999999];
  [(PUPosterHeadroomSettings *)self setBottomGradientTopLocation:0.330000013];
  [(PUPosterHeadroomSettings *)self setBottomGradientBottomLocation:1.0];
  [(PUPosterHeadroomSettings *)self setTopGradientAlpha:0.709999979];
  [(PUPosterHeadroomSettings *)self setTopGradientTopLocation:0.300000012];
  [(PUPosterHeadroomSettings *)self setTopGradientBottomLocation:1.0];
  [(PUPosterHeadroomSettings *)self setUseSoftLightBlendingModeForTopGradient:1];
}

- (id)parentSettings
{
  return +[PUPosterSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v60[15] = *MEMORY[0x1E4F143B8];
  v42 = (void *)MEMORY[0x1E4F94160];
  v57 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade Animation Duration" valueKeyPath:@"fadeAnimationDuration"];
  v56 = [v57 minValue:0.0 maxValue:2.0];
  v55 = objc_msgSend(v56, "pu_increment:", 0.00999999978);
  v60[0] = v55;
  v54 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Blur Visibility Fraction" valueKeyPath:@"blurVisibilityFraction"];
  v53 = [v54 minValue:0.0500000007 maxValue:1.0];
  v52 = objc_msgSend(v53, "pu_increment:", 0.0500000007);
  v60[1] = v52;
  v51 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Blur Radius" valueKeyPath:@"blurRadius"];
  v50 = [v51 minValue:0.0 maxValue:50.0];
  v49 = objc_msgSend(v50, "pu_increment:", 0.5);
  v60[2] = v49;
  v48 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Blur Mask Top Location" valueKeyPath:@"blurMaskTopLocation"];
  v47 = [v48 minValue:0.0 maxValue:1.0];
  v46 = objc_msgSend(v47, "pu_increment:", 0.00999999978);
  v60[3] = v46;
  v45 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Falloff Height" valueKeyPath:@"falloffHeight"];
  v44 = [v45 minValue:0.0 maxValue:1.0];
  v41 = objc_msgSend(v44, "pu_increment:", 0.00999999978);
  v60[4] = v41;
  v40 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Gradient Height" valueKeyPath:@"gradientHeight"];
  v39 = [v40 minValue:0.0500000007 maxValue:1.0];
  v38 = objc_msgSend(v39, "pu_increment:", 0.00999999978);
  v60[5] = v38;
  v37 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Gradient White" valueKeyPath:@"gradientWhite"];
  v36 = [v37 minValue:0.0 maxValue:1.0];
  v35 = objc_msgSend(v36, "pu_increment:", 0.00999999978);
  v60[6] = v35;
  v34 = [MEMORY[0x1E4F941D8] rowWithTitle:@"High Key Gradient White" valueKeyPath:@"highKeyGradientWhite"];
  v33 = [v34 minValue:0.0 maxValue:1.0];
  v32 = objc_msgSend(v33, "pu_increment:", 0.00999999978);
  v60[7] = v32;
  v31 = [MEMORY[0x1E4F941D8] rowWithTitle:@"First Gradient Alpha" valueKeyPath:@"bottomGradientAlpha"];
  v30 = [v31 minValue:0.0 maxValue:1.0];
  v29 = objc_msgSend(v30, "pu_increment:", 0.00999999978);
  v60[8] = v29;
  v28 = [MEMORY[0x1E4F941D8] rowWithTitle:@"First Gradient Top Point" valueKeyPath:@"bottomGradientTopLocation"];
  v27 = [v28 minValue:0.0 maxValue:1.0];
  v26 = objc_msgSend(v27, "pu_increment:", 0.00999999978);
  v60[9] = v26;
  v25 = [MEMORY[0x1E4F941D8] rowWithTitle:@"First Gradient Bottom Point" valueKeyPath:@"bottomGradientBottomLocation"];
  v24 = [v25 minValue:0.0 maxValue:1.0];
  v23 = objc_msgSend(v24, "pu_increment:", 0.00999999978);
  v60[10] = v23;
  v22 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Second Gradient Alpha" valueKeyPath:@"topGradientAlpha"];
  v2 = [v22 minValue:0.0 maxValue:1.0];
  objc_super v3 = objc_msgSend(v2, "pu_increment:", 0.00999999978);
  v60[11] = v3;
  id v4 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Second Gradient Top Point" valueKeyPath:@"topGradientTopLocation"];
  v5 = [v4 minValue:0.0 maxValue:1.0];
  v6 = objc_msgSend(v5, "pu_increment:", 0.00999999978);
  v60[12] = v6;
  v7 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Second Gradient Bottom Point" valueKeyPath:@"topGradientBottomLocation"];
  v8 = [v7 minValue:0.0 maxValue:1.0];
  v9 = objc_msgSend(v8, "pu_increment:", 0.00999999978);
  v60[13] = v9;
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Soft Light Blending" valueKeyPath:@"useSoftLightBlendingModeForTopGradient"];
  v60[14] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:15];
  v43 = [v42 sectionWithRows:v11];

  v12 = (void *)MEMORY[0x1E4F94160];
  v13 = (void *)MEMORY[0x1E4F940F8];
  v14 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v15 = [v13 rowWithTitle:@"Restore Defaults" action:v14];
  v59 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  v17 = [v12 sectionWithRows:v16];

  v18 = (void *)MEMORY[0x1E4F94160];
  v58[0] = v43;
  v58[1] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  v20 = [v18 moduleWithTitle:@"Headroom" contents:v19];

  return v20;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_89997 != -1) {
    dispatch_once(&sharedInstance_onceToken_89997, &__block_literal_global_89998);
  }
  v2 = (void *)sharedInstance_sharedInstance_89999;
  return v2;
}

void __42__PUPosterHeadroomSettings_sharedInstance__block_invoke()
{
  id v2 = +[PUPosterSettings sharedInstance];
  uint64_t v0 = [v2 headroomSettings];
  v1 = (void *)sharedInstance_sharedInstance_89999;
  sharedInstance_sharedInstance_89999 = v0;
}

@end