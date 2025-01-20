@interface PTQualitySettings
+ (id)createWithQuality:(int)a3 options:(id)a4;
- (BOOL)doCenterDisparity;
- (BOOL)doDisparityUpsampling;
- (BOOL)doFirstLevelGaussianDownsample;
- (BOOL)doFocusEdgeMask;
- (BOOL)doIntermediate2XUpscale;
- (BOOL)doMacroApertureLimit;
- (BOOL)portraitPreviewDeadzone;
- (BOOL)rayMarch;
- (BOOL)useExportQualityNoise;
- (float)circleOfConfusionLimitBackground;
- (float)circleOfConfusionLimitForeground;
- (float)disparityGuidedFilterEpsilon;
- (float)disparityUpsampleFactor;
- (float)renderDownscale;
- (id)description;
- (int)numberOfPatternCircles;
- (int)quality;
- (unint64_t)intermediatePixelFormat;
- (void)setCircleOfConfusionLimitBackground:(float)a3;
- (void)setCircleOfConfusionLimitForeground:(float)a3;
- (void)setDisparityGuidedFilterEpsilon:(float)a3;
- (void)setDisparityUpsampleFactor:(float)a3;
- (void)setDoCenterDisparity:(BOOL)a3;
- (void)setDoFirstLevelGaussianDownsample:(BOOL)a3;
- (void)setDoFocusEdgeMask:(BOOL)a3;
- (void)setDoIntermediate2XUpscale:(BOOL)a3;
- (void)setDoMacroApertureLimit:(BOOL)a3;
- (void)setIntermediatePixelFormat:(unint64_t)a3;
- (void)setNumberOfPatternCircles:(int)a3;
- (void)setPortraitPreviewDeadzone:(BOOL)a3;
- (void)setQuality:(int)a3;
- (void)setRayMarch:(BOOL)a3;
- (void)setRenderDownscale:(float)a3;
- (void)setUseExportQualityNoise:(BOOL)a3;
- (void)updateDescription;
@end

@implementation PTQualitySettings

- (float)renderDownscale
{
  return self->_renderDownscale;
}

- (BOOL)rayMarch
{
  return self->_rayMarch;
}

- (unint64_t)intermediatePixelFormat
{
  return self->_intermediatePixelFormat;
}

- (BOOL)doCenterDisparity
{
  return self->_doCenterDisparity;
}

- (BOOL)useExportQualityNoise
{
  return self->_useExportQualityNoise;
}

- (int)numberOfPatternCircles
{
  return self->_numberOfPatternCircles;
}

- (BOOL)doFirstLevelGaussianDownsample
{
  return self->_doFirstLevelGaussianDownsample;
}

- (BOOL)doDisparityUpsampling
{
  return self->_disparityUpsampleFactor > 1.0;
}

- (float)circleOfConfusionLimitForeground
{
  return self->_circleOfConfusionLimitForeground;
}

- (float)circleOfConfusionLimitBackground
{
  return self->_circleOfConfusionLimitBackground;
}

- (int)quality
{
  return self->_quality;
}

+ (id)createWithQuality:(int)a3 options:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:&unk_1F26C0958];
  if (v6) {
    goto LABEL_40;
  }
  v6 = objc_opt_new();
  [v6 setQuality:v4];
  [v6 setDoFirstLevelGaussianDownsample:(int)v4 > 26];
  [v6 setUseExportQualityNoise:(int)v4 > 26];
  LODWORD(v7) = 2.0;
  [v6 setRenderDownscale:v7];
  [v6 setDoMacroApertureLimit:1];
  [v6 setDoCenterDisparity:1];
  [v6 setIntermediatePixelFormat:115];
  [v6 setRayMarch:1];
  if ((int)v4 <= 25) {
    int v9 = 1;
  }
  else {
    int v9 = 2;
  }
  *(float *)&double v8 = (float)v9;
  [v6 setDisparityUpsampleFactor:v8];
  LODWORD(v10) = 1028443341;
  [v6 setDisparityGuidedFilterEpsilon:v10];
  v11 = [v5 objectForKeyedSubscript:&unk_1F26C0970];

  if (v11)
  {
    v12 = [v5 objectForKeyedSubscript:&unk_1F26C0970];
    [v12 floatValue];
    objc_msgSend(v6, "setDisparityUpsampleFactor:");
  }
  [v6 setDoFocusEdgeMask:(int)v4 > 25];
  if ((int)v4 > 25)
  {
    if ((int)v4 > 74)
    {
      if (v4 == 75)
      {
        v13 = v6;
        uint64_t v14 = 4;
        goto LABEL_25;
      }
      if (v4 == 100) {
        goto LABEL_21;
      }
    }
    else
    {
      if (v4 == 26)
      {
        v13 = v6;
        uint64_t v14 = 2;
        goto LABEL_25;
      }
      if (v4 == 51)
      {
        v13 = v6;
        uint64_t v14 = 3;
LABEL_25:
        [v13 setNumberOfPatternCircles:v14];
        goto LABEL_26;
      }
    }
LABEL_18:
    v15 = _PTLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[PTQualitySettings createWithQuality:options:](v4, v15);
    }

LABEL_21:
    v13 = v6;
    uint64_t v14 = 5;
    goto LABEL_25;
  }
  if (v4)
  {
    if (v4 != 24 && v4 != 25) {
      goto LABEL_18;
    }
    [v6 setNumberOfPatternCircles:2];
    [v6 setRayMarch:0];
  }
  else
  {
    [v6 setNumberOfPatternCircles:2];
    LODWORD(v16) = 4.0;
    [v6 setRenderDownscale:v16];
  }
LABEL_26:
  v17 = [v5 objectForKeyedSubscript:&unk_1F26C0988];

  if (v17)
  {
    v18 = [v5 objectForKeyedSubscript:&unk_1F26C0988];
    [v18 floatValue];
    objc_msgSend(v6, "setRenderDownscale:");
  }
  [v6 renderDownscale];
  [v6 setDoIntermediate2XUpscale:v19 > 3.0];
  v20 = [v5 objectForKeyedSubscript:&unk_1F26C09A0];

  if (v20)
  {
    v22 = [v5 objectForKeyedSubscript:&unk_1F26C09A0];
    objc_msgSend(v6, "setDoMacroApertureLimit:", objc_msgSend(v22, "BOOLValue"));
  }
  LODWORD(v21) = 2143289344;
  [v6 setCircleOfConfusionLimitBackground:v21];
  LODWORD(v23) = 2143289344;
  [v6 setCircleOfConfusionLimitForeground:v23];
  v24 = [v5 objectForKeyedSubscript:&unk_1F26C09B8];

  if (v24)
  {
    v25 = [v5 objectForKeyedSubscript:&unk_1F26C09B8];
    [v25 floatValue];
    objc_msgSend(v6, "setCircleOfConfusionLimitBackground:");
  }
  v26 = [v5 objectForKeyedSubscript:&unk_1F26C09D0];

  if (v26)
  {
    v27 = [v5 objectForKeyedSubscript:&unk_1F26C09D0];
    [v27 floatValue];
    objc_msgSend(v6, "setCircleOfConfusionLimitForeground:");
  }
  [v6 setPortraitPreviewDeadzone:0];
  v28 = [v5 objectForKeyedSubscript:&unk_1F26C09E8];

  if (v28)
  {
    v29 = [v5 objectForKeyedSubscript:&unk_1F26C09E8];
    objc_msgSend(v6, "setPortraitPreviewDeadzone:", objc_msgSend(v29, "BOOLValue"));
  }
  objc_msgSend(v6, "setRayMarch:", objc_msgSend(v6, "rayMarch"));
  [v6 disparityUpsampleFactor];
  objc_msgSend(v6, "setDisparityUpsampleFactor:");
  objc_msgSend(v6, "setDoFocusEdgeMask:", objc_msgSend(v6, "doFocusEdgeMask"));
  [v6 renderDownscale];
  objc_msgSend(v6, "setRenderDownscale:");
  objc_msgSend(v6, "setDoMacroApertureLimit:", objc_msgSend(v6, "doMacroApertureLimit"));
  objc_msgSend(v6, "setDoIntermediate2XUpscale:", objc_msgSend(v6, "doIntermediate2XUpscale"));
  if ([v6 doFocusEdgeMask]) {
    uint64_t v30 = [v6 rayMarch];
  }
  else {
    uint64_t v30 = 0;
  }
  [v6 setDoFocusEdgeMask:v30];
  [v6 updateDescription];
LABEL_40:
  id v31 = v6;

  return v31;
}

- (void)setRenderDownscale:(float)a3
{
  self->_renderDownscale = a3;
}

- (void)setRayMarch:(BOOL)a3
{
  self->_rayMarch = a3;
}

- (void)setDoFocusEdgeMask:(BOOL)a3
{
  self->_doFocusEdgeMask = a3;
}

- (void)setDisparityUpsampleFactor:(float)a3
{
  self->_disparityUpsampleFactor = a3;
}

- (BOOL)doFocusEdgeMask
{
  return self->_doFocusEdgeMask;
}

- (void)setDoMacroApertureLimit:(BOOL)a3
{
  self->_doMacroApertureLimit = a3;
}

- (void)setDoIntermediate2XUpscale:(BOOL)a3
{
  self->_doIntermediate2XUpscale = a3;
}

- (void)setIntermediatePixelFormat:(unint64_t)a3
{
  self->_intermediatePixelFormat = a3;
}

- (void)setDoCenterDisparity:(BOOL)a3
{
  self->_doCenterDisparity = a3;
}

- (BOOL)doMacroApertureLimit
{
  return self->_doMacroApertureLimit;
}

- (BOOL)doIntermediate2XUpscale
{
  return self->_doIntermediate2XUpscale;
}

- (void)updateDescription
{
  if (self->_rayMarch) {
    v3 = @"Raymarch adaptive";
  }
  else {
    v3 = @"1-step";
  }
  uint64_t v4 = @"FirstLevelGaussianDownsample";
  if (!self->_doFirstLevelGaussianDownsample) {
    uint64_t v4 = &stru_1F269F3B0;
  }
  self->_description = [NSString stringWithFormat:@"%@. Circles: %i. upscale-disp:%f %@", v3, self->_numberOfPatternCircles, self->_disparityUpsampleFactor, v4];

  MEMORY[0x1F41817F8]();
}

- (void)setUseExportQualityNoise:(BOOL)a3
{
  self->_useExportQualityNoise = a3;
}

- (void)setQuality:(int)a3
{
  self->_quality = a3;
}

- (void)setPortraitPreviewDeadzone:(BOOL)a3
{
  self->_portraitPreviewDeadzone = a3;
}

- (void)setNumberOfPatternCircles:(int)a3
{
  self->_numberOfPatternCircles = a3;
}

- (void)setDoFirstLevelGaussianDownsample:(BOOL)a3
{
  self->_doFirstLevelGaussianDownsample = a3;
}

- (void)setDisparityGuidedFilterEpsilon:(float)a3
{
  self->_disparityGuidedFilterEpsilon = a3;
}

- (void)setCircleOfConfusionLimitForeground:(float)a3
{
  self->_circleOfConfusionLimitForeground = a3;
}

- (void)setCircleOfConfusionLimitBackground:(float)a3
{
  self->_circleOfConfusionLimitBackground = a3;
}

- (float)disparityUpsampleFactor
{
  return self->_disparityUpsampleFactor;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (float)disparityGuidedFilterEpsilon
{
  return self->_disparityGuidedFilterEpsilon;
}

- (BOOL)portraitPreviewDeadzone
{
  return self->_portraitPreviewDeadzone;
}

- (void).cxx_destruct
{
}

+ (void)createWithQuality:(int)a1 options:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Unknow quality level, got: %i, assuming maximum quality: 100", (uint8_t *)v2, 8u);
}

@end