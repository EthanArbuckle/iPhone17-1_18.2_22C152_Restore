@interface PIGlobalSettings
+ (id)IPXEditSettings;
+ (id)PUEditSettings;
+ (id)globalSettings;
- (BOOL)allowSpillMatteOnOlderPortraitV2Captures;
- (BOOL)cinematicAllowRGB10Packed;
- (BOOL)cinematicAllowYUVSourceInput;
- (BOOL)debugUseStyleEngine;
- (BOOL)disableHeadroom;
- (BOOL)disableMADForSettlingEffect;
- (BOOL)disableSegmentation;
- (BOOL)falseColorHDR;
- (BOOL)forceEnableSegmentation;
- (BOOL)forceEnableSettlingEffect;
- (BOOL)forceGlassesMatteOff;
- (BOOL)forceSpillMatteOff;
- (BOOL)inpaintDumpsOriginalMasks;
- (BOOL)inpaintDumpsProcessedMasks;
- (BOOL)inpaintFillsMaskHoles;
- (BOOL)inpaintOrientInputImages;
- (BOOL)inpaintOverlaysMaskBounds;
- (BOOL)inpaintOverlaysMasks;
- (BOOL)objectRemovalRegionOverride;
- (BOOL)parallaxStyleAvoidColorWashBrownOverride;
- (BOOL)parallaxStyleEnableGreenScreen;
- (BOOL)parallaxWallpaperDisableUpgrade;
- (BOOL)portraitDisableFuzzball;
- (BOOL)portraitForceLightMapLinear;
- (BOOL)posterDisableCropVariant;
- (BOOL)rawApplyBoostFirst;
- (BOOL)segmentationDebugPreviewDisableClock;
- (BOOL)segmentationDebugPreviewHighQuality;
- (BOOL)segmentationDebugRoundTripProxyImage;
- (BOOL)segmentationDebugTintLayers;
- (BOOL)segmentationDisableCaching;
- (BOOL)semanticStyleDisableStyleEngine;
- (BOOL)sensitivityCheckDumpsImages;
- (BOOL)sensitivityCheckVersion2Thresholds;
- (BOOL)useStyleRecipeConfigDirectory;
- (NSString)inpaintDumpPath;
- (NSString)parallaxLayoutConfigurationOverride;
- (NSString)styleRecipeConfigDirectoryPath;
- (double)inpaintGainMapMixFactor;
- (double)inpaintMaxAreaPercentage;
- (double)inpaintPixellationIntersectionAreaToFaceAreaThreshold;
- (double)inpaintPixellationIntersectionAreaToMaskAreaThreshold;
- (double)segmentationInfillDilationPercent;
- (double)segmentationManualGatingLenience;
- (float)settlingEffectMinimumMotionScore;
- (int64_t)parallaxStyleKeyLevelOverride;
- (int64_t)segmentationInfillAlgorithm;
- (void)setAllowSpillMatteOnOlderPortraitV2Captures:(BOOL)a3;
- (void)setCinematicAllowRGB10Packed:(BOOL)a3;
- (void)setCinematicAllowYUVSourceInput:(BOOL)a3;
- (void)setDebugUseStyleEngine:(BOOL)a3;
- (void)setDisableHeadroom:(BOOL)a3;
- (void)setDisableMADForSettlingEffect:(BOOL)a3;
- (void)setDisableSegmentation:(BOOL)a3;
- (void)setForceEnableSegmentation:(BOOL)a3;
- (void)setForceEnableSettlingEffect:(BOOL)a3;
- (void)setForceGlassesMatteOff:(BOOL)a3;
- (void)setForceSpillMatteOff:(BOOL)a3;
- (void)setInpaintDumpPath:(id)a3;
- (void)setInpaintDumpsOriginalMasks:(BOOL)a3;
- (void)setInpaintDumpsProcessedMasks:(BOOL)a3;
- (void)setInpaintFillsMaskHoles:(BOOL)a3;
- (void)setInpaintGainMapMixFactor:(double)a3;
- (void)setInpaintMaxAreaPercentage:(double)a3;
- (void)setInpaintOrientInputImages:(BOOL)a3;
- (void)setInpaintOverlaysMaskBounds:(BOOL)a3;
- (void)setInpaintOverlaysMasks:(BOOL)a3;
- (void)setInpaintPixellationIntersectionAreaToFaceAreaThreshold:(double)a3;
- (void)setInpaintPixellationIntersectionAreaToMaskAreaThreshold:(double)a3;
- (void)setObjectRemovalRegionOverride:(BOOL)a3;
- (void)setParallaxLayoutConfigurationOverride:(id)a3;
- (void)setParallaxStyleAvoidColorWashBrownOverride:(BOOL)a3;
- (void)setParallaxStyleEnableGreenScreen:(BOOL)a3;
- (void)setParallaxStyleKeyLevelOverride:(int64_t)a3;
- (void)setParallaxWallpaperDisableUpgrade:(BOOL)a3;
- (void)setPortraitDisableFuzzball:(BOOL)a3;
- (void)setPortraitForceLightMapLinear:(BOOL)a3;
- (void)setPosterDisableCropVariant:(BOOL)a3;
- (void)setRawApplyBoostFirst:(BOOL)a3;
- (void)setSegmentationDebugPreviewDisableClock:(BOOL)a3;
- (void)setSegmentationDebugPreviewHighQuality:(BOOL)a3;
- (void)setSegmentationDebugRoundTripProxyImage:(BOOL)a3;
- (void)setSegmentationDebugTintLayers:(BOOL)a3;
- (void)setSegmentationDisableCaching:(BOOL)a3;
- (void)setSegmentationInfillAlgorithm:(int64_t)a3;
- (void)setSegmentationInfillDilationPercent:(double)a3;
- (void)setSegmentationManualGatingLenience:(double)a3;
- (void)setSemanticStyleDisableStyleEngine:(BOOL)a3;
- (void)setSensitivityCheckDumpsImages:(BOOL)a3;
- (void)setSensitivityCheckVersion2Thresholds:(BOOL)a3;
- (void)setSettlingEffectMinimumMotionScore:(float)a3;
- (void)setStyleRecipeConfigDirectoryPath:(id)a3;
- (void)setUseStyleRecipeConfigDirectory:(BOOL)a3;
@end

@implementation PIGlobalSettings

- (void)setAllowSpillMatteOnOlderPortraitV2Captures:(BOOL)a3
{
  self->_allowSpillMatteOnOlderPortraitV2Captures = a3;
}

- (BOOL)allowSpillMatteOnOlderPortraitV2Captures
{
  return self->_allowSpillMatteOnOlderPortraitV2Captures;
}

- (void)setForceSpillMatteOff:(BOOL)a3
{
  self->_forceSpillMatteOff = a3;
}

- (BOOL)forceSpillMatteOff
{
  return self->_forceSpillMatteOff;
}

- (void)setForceGlassesMatteOff:(BOOL)a3
{
  self->_forceGlassesMatteOff = a3;
}

- (BOOL)forceGlassesMatteOff
{
  return self->_forceGlassesMatteOff;
}

- (void)setParallaxStyleAvoidColorWashBrownOverride:(BOOL)a3
{
  self->parallaxStyleAvoidColorWashBrownOverride = a3;
}

- (BOOL)parallaxStyleAvoidColorWashBrownOverride
{
  return self->parallaxStyleAvoidColorWashBrownOverride;
}

- (void)setParallaxStyleKeyLevelOverride:(int64_t)a3
{
  self->parallaxStyleKeyLevelOverride = a3;
}

- (int64_t)parallaxStyleKeyLevelOverride
{
  return self->parallaxStyleKeyLevelOverride;
}

- (void)setSensitivityCheckVersion2Thresholds:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_SENSITIVITY_V2_THRESHOLDS"];
}

- (BOOL)sensitivityCheckVersion2Thresholds
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_SENSITIVITY_V2_THRESHOLDS"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setSensitivityCheckDumpsImages:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_DUMP_SENSITIVITY_IMAGES"];
}

- (BOOL)sensitivityCheckDumpsImages
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_DUMP_SENSITIVITY_IMAGES"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setInpaintFillsMaskHoles:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_INPAINT_FILL_MASK_HOLES"];
}

- (BOOL)inpaintFillsMaskHoles
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_INPAINT_FILL_MASK_HOLES"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setInpaintMaxAreaPercentage:(double)a3
{
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"PI_INPAINT_MAX_AREA_PERCENTAGE"];
}

- (double)inpaintMaxAreaPercentage
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_INPAINT_MAX_AREA_PERCENTAGE"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.25;
  }

  return v5;
}

- (void)setObjectRemovalRegionOverride:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_OBJECT_REMOVAL_REGION_ELIGIBILITY_OVERRIDE"];
}

- (BOOL)objectRemovalRegionOverride
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_OBJECT_REMOVAL_REGION_ELIGIBILITY_OVERRIDE"];

  return v3;
}

- (void)setInpaintPixellationIntersectionAreaToFaceAreaThreshold:(double)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setDouble:@"PI_INPAINT_PIXELLATION_INTERSECTION_AREA_TO_FACE_AREA_THRESHOLD" forKey:a3];
}

- (double)inpaintPixellationIntersectionAreaToFaceAreaThreshold
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 objectForKey:@"PI_INPAINT_PIXELLATION_INTERSECTION_AREA_TO_FACE_AREA_THRESHOLD"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.35;
  }

  return v5;
}

- (void)setInpaintPixellationIntersectionAreaToMaskAreaThreshold:(double)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setDouble:@"PI_INPAINT_PIXELLATION_INTERSECTION_AREA_TO_MASK_AREA_THRESHOLD" forKey:a3];
}

- (double)inpaintPixellationIntersectionAreaToMaskAreaThreshold
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 objectForKey:@"PI_INPAINT_PIXELLATION_INTERSECTION_AREA_TO_MASK_AREA_THRESHOLD"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.3;
  }

  return v5;
}

- (void)setInpaintDumpsProcessedMasks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_INPAINT_DUMPS_PROCESSED_MASKS"];
}

- (BOOL)inpaintDumpsProcessedMasks
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_INPAINT_DUMPS_PROCESSED_MASKS"];

  return v3;
}

- (void)setInpaintDumpsOriginalMasks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_INPAINT_DUMPS_ORIGINAL_MASKS"];
}

- (BOOL)inpaintDumpsOriginalMasks
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_INPAINT_DUMPS_ORIGINAL_MASKS"];

  return v3;
}

- (void)setInpaintOverlaysMaskBounds:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_INPAINT_OVERLAYS_MASK_BOUNDS"];
}

- (BOOL)inpaintOverlaysMaskBounds
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_INPAINT_OVERLAYS_MASK_BOUNDS"];

  return v3;
}

- (void)setInpaintOverlaysMasks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_INPAINT_OVERLAYS_MASKS"];
}

- (BOOL)inpaintOverlaysMasks
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_INPAINT_OVERLAYS_MASKS"];

  return v3;
}

- (void)setInpaintDumpPath:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"PI_INPAINT_DUMP_PATH"];
}

- (NSString)inpaintDumpPath
{
  v2 = NSTemporaryDirectory();
  char v3 = [v2 stringByAppendingPathComponent:@"Photos"];
  id v4 = [v3 stringByAppendingPathComponent:@"inpaint"];

  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v6 = [v5 stringForKey:@"PI_INPAINT_DUMP_PATH"];

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (void)setInpaintOrientInputImages:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_INPAINT_ORIENT_INPUTS"];
}

- (BOOL)inpaintOrientInputImages
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_INPAINT_ORIENT_INPUTS"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setInpaintGainMapMixFactor:(double)a3
{
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"PI_INPAINT_GAIN_MAP_MIX_FACTOR"];
}

- (double)inpaintGainMapMixFactor
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_INPAINT_GAIN_MAP_MIX_FACTOR"];

  if (v3)
  {
    [v3 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.75;
  }

  return v5;
}

- (void)setSemanticStyleDisableStyleEngine:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_SEMANTIC_STYLE_DISABLE_STYLE_ENGINE"];
}

- (BOOL)semanticStyleDisableStyleEngine
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_SEMANTIC_STYLE_DISABLE_STYLE_ENGINE"];

  return v3;
}

- (void)setDebugUseStyleEngine:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_DEBUG_USE_STYLE_ENGINE"];
}

- (BOOL)debugUseStyleEngine
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_DEBUG_USE_STYLE_ENGINE"];

  return v3;
}

- (void)setPosterDisableCropVariant:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_POSTER_DISABLE_CROP_VARIANT"];
}

- (BOOL)posterDisableCropVariant
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_POSTER_DISABLE_CROP_VARIANT"];

  return v3;
}

- (void)setSettlingEffectMinimumMotionScore:(float)a3
{
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  *(float *)&double v4 = a3;
  [v5 setFloat:@"PI_PARALLAX_MINIMUM_MOTION_SCORE" forKey:v4];
}

- (float)settlingEffectMinimumMotionScore
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 objectForKey:@"PI_PARALLAX_MINIMUM_MOTION_SCORE"];

  if (v3)
  {
    [v3 floatValue];
    float v5 = v4;
  }
  else
  {
    float v5 = 0.7;
  }

  return v5;
}

- (void)setForceEnableSettlingEffect:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_PARALLAX_FORCE_ENABLE_SETTLING_EFFECT"];
}

- (BOOL)forceEnableSettlingEffect
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_PARALLAX_FORCE_ENABLE_SETTLING_EFFECT"];

  return v3;
}

- (void)setDisableMADForSettlingEffect:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_PARALLAX_DISABLE_MAD_SETTLING_EFFECT"];
}

- (BOOL)disableMADForSettlingEffect
{
  char v2 = _os_feature_enabled_impl();
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:@"PI_PARALLAX_DISABLE_MAD_SETTLING_EFFECT"];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = v2 ^ 1;
  }

  return v5;
}

- (void)setRawApplyBoostFirst:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_RAW_APPLY_BOOST_FIRST"];
}

- (BOOL)rawApplyBoostFirst
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_RAW_APPLY_BOOST_FIRST"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setCinematicAllowRGB10Packed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_CINEMATIC_ALLOW_RGB10_PACKED"];
}

- (BOOL)cinematicAllowRGB10Packed
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_CINEMATIC_ALLOW_RGB10_PACKED"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setCinematicAllowYUVSourceInput:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_CINEMATIC_ALLOW_YUV_SOURCE"];
}

- (BOOL)cinematicAllowYUVSourceInput
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_CINEMATIC_ALLOW_YUV_SOURCE"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setParallaxWallpaperDisableUpgrade:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_PARALLAX_DISABLE_UPGRADE"];
}

- (BOOL)parallaxWallpaperDisableUpgrade
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_PARALLAX_DISABLE_UPGRADE"];

  return v3;
}

- (void)setParallaxLayoutConfigurationOverride:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"PI_PARALLAX_LAYOUT_CONFIG"];
}

- (NSString)parallaxLayoutConfigurationOverride
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 stringForKey:@"PI_PARALLAX_LAYOUT_CONFIG"];

  return (NSString *)v3;
}

- (void)setParallaxStyleEnableGreenScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_PARALLAX_STYLE_ENABLE_GREEN_SCREEN"];
}

- (BOOL)parallaxStyleEnableGreenScreen
{
  char v2 = _os_feature_enabled_impl();
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"PI_PARALLAX_STYLE_ENABLE_GREEN_SCREEN"];

  return v2 | v4;
}

- (void)setUseStyleRecipeConfigDirectory:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_USE_STYLE_RECIPE_CONFIG"];
}

- (BOOL)useStyleRecipeConfigDirectory
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_USE_STYLE_RECIPE_CONFIG"];

  return v3;
}

- (void)setStyleRecipeConfigDirectoryPath:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"PI_STYLE_RECIPE_DIR_PATH"];
}

- (NSString)styleRecipeConfigDirectoryPath
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 stringForKey:@"PI_STYLE_RECIPE_DIR_PATH"];

  return (NSString *)v3;
}

- (void)setSegmentationManualGatingLenience:(double)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setDouble:@"PI_SEGMENT_MANUAL_GATING_LENIENCE" forKey:a3];
}

- (double)segmentationManualGatingLenience
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"PI_SEGMENT_MANUAL_GATING_LENIENCE"];
  double v4 = v3;

  return v4;
}

- (void)setSegmentationDebugPreviewHighQuality:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_SEGMENT_PREVIEW_HIGH_QUALITY"];
}

- (BOOL)segmentationDebugPreviewHighQuality
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_SEGMENT_PREVIEW_HIGH_QUALITY"];

  return v3;
}

- (void)setSegmentationDebugPreviewDisableClock:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_SEGMENT_PREVIEW_DISABLE_CLOCK"];
}

- (BOOL)segmentationDebugPreviewDisableClock
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_SEGMENT_PREVIEW_DISABLE_CLOCK"];

  return v3;
}

- (void)setSegmentationDisableCaching:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_SEGMENT_DISABLE_CACHE"];
}

- (BOOL)segmentationDisableCaching
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_SEGMENT_DISABLE_CACHE"];

  return v3;
}

- (void)setSegmentationDebugTintLayers:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_SEGMENT_TINT_LAYERS"];
}

- (BOOL)segmentationDebugTintLayers
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_SEGMENT_TINT_LAYERS"];

  return v3;
}

- (void)setSegmentationInfillDilationPercent:(double)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setDouble:@"PI_SEGMENT_INFILL_DILATION_PCT" forKey:a3];
}

- (double)segmentationInfillDilationPercent
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"PI_SEGMENT_INFILL_DILATION_PCT"];
  double v4 = v3;

  return v4;
}

- (void)setSegmentationInfillAlgorithm:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setInteger:a3 forKey:@"PI_SEGMENT_INFILL_ALGO"];
}

- (int64_t)segmentationInfillAlgorithm
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PI_SEGMENT_INFILL_ALGO"];

  return v3;
}

- (void)setDisableHeadroom:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_DISABLE_HEADROOM"];
}

- (BOOL)disableHeadroom
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_DISABLE_HEADROOM"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setForceEnableSegmentation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_SEGMENT_FORCE_ENABLE_SEGMENTATION"];
}

- (BOOL)forceEnableSegmentation
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_SEGMENT_FORCE_ENABLE_SEGMENTATION"];

  return v3;
}

- (void)setDisableSegmentation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_SEGMENT_DISABLE_SEGMENTATION"];
}

- (BOOL)disableSegmentation
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_SEGMENT_DISABLE_SEGMENTATION"];

  return v3;
}

- (void)setSegmentationDebugRoundTripProxyImage:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_SEGMENT_ROUND_TRIP_PROXY"];
}

- (BOOL)segmentationDebugRoundTripProxyImage
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_SEGMENT_ROUND_TRIP_PROXY"];

  return v3;
}

- (void)setPortraitForceLightMapLinear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_PORTRAIT_FORCE_LIGHT_MAP_LINEAR"];
}

- (BOOL)portraitForceLightMapLinear
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PI_PORTRAIT_FORCE_LIGHT_MAP_LINEAR"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setPortraitDisableFuzzball:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PI_PORTRAIT_DISABLE_FUZZBALL"];
}

- (BOOL)portraitDisableFuzzball
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PI_PORTRAIT_DISABLE_FUZZBALL"];

  return v3;
}

- (BOOL)falseColorHDR
{
  return 0;
}

+ (id)PUEditSettings
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 objectForKey:@"PURootSettings"];

  id v4 = [v3 objectForKey:@"PXSettingsArchiveKey"];
  id v5 = [v4 objectForKey:@"photoEditingSettings"];

  return v5;
}

+ (id)IPXEditSettings
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 objectForKey:@"IPXRootSettings"];

  id v4 = [v3 objectForKey:@"PXSettingsArchiveKey"];
  id v5 = [v4 objectForKey:@"editSettings"];

  return v5;
}

+ (id)globalSettings
{
  if (globalSettings_onceToken != -1) {
    dispatch_once(&globalSettings_onceToken, &__block_literal_global_17941);
  }
  char v2 = (void *)globalSettings_globalSettings;
  return v2;
}

uint64_t __34__PIGlobalSettings_globalSettings__block_invoke()
{
  globalSettings_globalSettings = objc_alloc_init(PIGlobalSettings);
  return MEMORY[0x1F41817F8]();
}

@end