@interface PXInlineVideoStabilizationSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
+ (id)transientProperties;
- (BOOL)crossfadeEnabled;
- (BOOL)gyroStabilizationEnabled;
- (BOOL)localCacheForMediaAnalysisRecipes;
- (BOOL)pixelStabilizationEnabled;
- (BOOL)showDiagnosticUI;
- (BOOL)timeRangeEnabled;
- (BOOL)useMediaAnalysisRecipe;
- (double)allowedCropFraction;
- (id)parentSettings;
- (unint64_t)allowedAnalysisTypes;
- (void)setAllowedCropFraction:(double)a3;
- (void)setCrossfadeEnabled:(BOOL)a3;
- (void)setDefaultValues;
- (void)setGyroStabilizationEnabled:(BOOL)a3;
- (void)setLocalCacheForMediaAnalysisRecipes:(BOOL)a3;
- (void)setPixelStabilizationEnabled:(BOOL)a3;
- (void)setShowDiagnosticUI:(BOOL)a3;
- (void)setTimeRangeEnabled:(BOOL)a3;
- (void)setUseMediaAnalysisRecipe:(BOOL)a3;
@end

@implementation PXInlineVideoStabilizationSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXInlineVideoStabilizationSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXInlineVideoStabilizationSettings *)self setCrossfadeEnabled:1];
  [(PXInlineVideoStabilizationSettings *)self setTimeRangeEnabled:1];
  [(PXInlineVideoStabilizationSettings *)self setGyroStabilizationEnabled:1];
  [(PXInlineVideoStabilizationSettings *)self setPixelStabilizationEnabled:1];
  [(PXInlineVideoStabilizationSettings *)self setAllowedCropFraction:0.1];
  [(PXInlineVideoStabilizationSettings *)self setUseMediaAnalysisRecipe:1];
  [(PXInlineVideoStabilizationSettings *)self setLocalCacheForMediaAnalysisRecipes:1];
  [(PXInlineVideoStabilizationSettings *)self setShowDiagnosticUI:1];
}

- (void)setUseMediaAnalysisRecipe:(BOOL)a3
{
  self->_useMediaAnalysisRecipe = a3;
}

- (void)setTimeRangeEnabled:(BOOL)a3
{
  self->_timeRangeEnabled = a3;
}

- (void)setShowDiagnosticUI:(BOOL)a3
{
  self->_showDiagnosticUI = a3;
}

- (void)setPixelStabilizationEnabled:(BOOL)a3
{
  self->_pixelStabilizationEnabled = a3;
}

- (void)setLocalCacheForMediaAnalysisRecipes:(BOOL)a3
{
  self->_localCacheForMediaAnalysisRecipes = a3;
}

- (void)setGyroStabilizationEnabled:(BOOL)a3
{
  self->_gyroStabilizationEnabled = a3;
}

- (void)setCrossfadeEnabled:(BOOL)a3
{
  self->_crossfadeEnabled = a3;
}

- (void)setAllowedCropFraction:(double)a3
{
  self->_allowedCropFraction = a3;
}

- (BOOL)showDiagnosticUI
{
  return self->_showDiagnosticUI;
}

- (BOOL)pixelStabilizationEnabled
{
  return self->_pixelStabilizationEnabled;
}

- (BOOL)gyroStabilizationEnabled
{
  return self->_gyroStabilizationEnabled;
}

- (BOOL)timeRangeEnabled
{
  return self->_timeRangeEnabled;
}

- (BOOL)crossfadeEnabled
{
  return self->_crossfadeEnabled;
}

- (double)allowedCropFraction
{
  return self->_allowedCropFraction;
}

- (BOOL)localCacheForMediaAnalysisRecipes
{
  return self->_localCacheForMediaAnalysisRecipes;
}

- (BOOL)useMediaAnalysisRecipe
{
  return self->_useMediaAnalysisRecipe;
}

- (unint64_t)allowedAnalysisTypes
{
  if ([(PXInlineVideoStabilizationSettings *)self gyroStabilizationEnabled]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3 | [(PXInlineVideoStabilizationSettings *)self pixelStabilizationEnabled];
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)transientProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXInlineVideoStabilizationSettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_85739 != -1) {
    dispatch_once(&transientProperties_onceToken_85739, block);
  }
  v2 = (void *)transientProperties_transientProperties_85740;
  return v2;
}

void __57__PXInlineVideoStabilizationSettings_transientProperties__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___PXInlineVideoStabilizationSettings;
  v1 = objc_msgSendSuper2(&v5, sel_transientProperties);
  v2 = NSStringFromSelector(sel_allowedAnalysisTypes);
  uint64_t v3 = [v1 setByAddingObject:v2];
  v4 = (void *)transientProperties_transientProperties_85740;
  transientProperties_transientProperties_85740 = v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_85743 != -1) {
    dispatch_once(&sharedInstance_onceToken_85743, &__block_literal_global_85744);
  }
  v2 = (void *)sharedInstance_sharedInstance_85745;
  return v2;
}

void __52__PXInlineVideoStabilizationSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 inlineVideoStabilizationSettings];
  v1 = (void *)sharedInstance_sharedInstance_85745;
  sharedInstance_sharedInstance_85745 = v0;
}

+ (id)settingsControllerModule
{
  v22[8] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  v20 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Media Analysis Recipe" valueKeyPath:@"useMediaAnalysisRecipe"];
  v22[0] = v20;
  v19 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Cache Recipes Locally" valueKeyPath:@"localCacheForMediaAnalysisRecipes"];
  v18 = [v19 conditionFormat:@"useMediaAnalysisRecipe == YES"];
  v22[1] = v18;
  uint64_t v3 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Crop" valueKeyPath:@"allowedCropFraction"];
  v4 = [v3 minValue:0.1 maxValue:0.5];
  objc_super v5 = [v4 conditionFormat:@"useMediaAnalysisRecipe == NO"];
  v22[2] = v5;
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Gyro Enabled" valueKeyPath:@"gyroStabilizationEnabled"];
  v22[3] = v6;
  v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Pixel-Based Enabled" valueKeyPath:@"pixelStabilizationEnabled"];
  v22[4] = v7;
  v8 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Crossfade Enabled" valueKeyPath:@"crossfadeEnabled"];
  v22[5] = v8;
  v9 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Time Range Enabled" valueKeyPath:@"timeRangeEnabled"];
  v22[6] = v9;
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Diagnostic UI Enabled" valueKeyPath:@"showDiagnosticUI"];
  v22[7] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:8];
  v12 = [v2 sectionWithRows:v11 title:@"Settings"];

  v13 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v14 = (void *)MEMORY[0x1E4F94160];
  v21[0] = v12;
  v21[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v16 = [v14 moduleWithTitle:@"Inline Stabilization" contents:v15];

  return v16;
}

@end