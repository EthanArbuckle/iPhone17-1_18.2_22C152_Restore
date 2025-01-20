@interface NUGlobalSettings
+ (BOOL)allAssetsCanUseHDRPipeline;
+ (BOOL)alwaysRequireHardwareVideoEncoder;
+ (BOOL)bufferStorageFactoryUsePool;
+ (BOOL)debugDumpStyleEngineInputs;
+ (BOOL)deviceDisableMetal;
+ (BOOL)devicePrintRenderer;
+ (BOOL)disableAuxiliaryImageCacheFromSource;
+ (BOOL)disableIOSurfacePortaitExport;
+ (BOOL)disableMeteorGainMapGeneration;
+ (BOOL)disablePacked10BitPixelFormats;
+ (BOOL)displayDisableColorMatching;
+ (BOOL)displayDisableDeepColor;
+ (BOOL)displayForceDeepColor;
+ (BOOL)enableDash5;
+ (BOOL)enableFlexRange;
+ (BOOL)enableHDRSupport;
+ (BOOL)enableSpatialMediaEditing;
+ (BOOL)enforceMinimumBitRateForCinematicVideos;
+ (BOOL)enforceMinimumBitRateForExportedVideos;
+ (BOOL)forceMeteorGainMapGeneration;
+ (BOOL)forceMeteorPlusLinear;
+ (BOOL)forceMeteorPlusPlus;
+ (BOOL)forceSoftwareVideoEncoder;
+ (BOOL)imageLayerDebug;
+ (BOOL)imageRenderJobUseSurfaceRenderer;
+ (BOOL)imageRenderJobUseTextureRenderer;
+ (BOOL)imageSourceDisableCacheImmediately;
+ (BOOL)imageSourceDisableRAW;
+ (BOOL)inpaintDumpsInputImages;
+ (BOOL)inpaintEnablesRefinementPass;
+ (BOOL)inpaintSegmentationUsesConnectedComponents;
+ (BOOL)inpaintSegmentationUsesNonUniformScaling;
+ (BOOL)inpaintShowsSurroundOutline;
+ (BOOL)isViewDebugEnabled;
+ (BOOL)logPeakRenderCIUsuage;
+ (BOOL)mediaViewDisableLivePhoto;
+ (BOOL)overrideCleanupHardwareCheck;
+ (BOOL)overrideSemanticStylesHardwareCheck;
+ (BOOL)platformHasWideColor;
+ (BOOL)preserveSubjectsWhenInpainting;
+ (BOOL)renderEDRAsPQ;
+ (BOOL)renderJobDebug;
+ (BOOL)renderJobDebugCapture5PercentOfJobs;
+ (BOOL)renderJobDebugCaptureCanceledJobs;
+ (BOOL)renderJobDebugCaptureNodeCache;
+ (BOOL)renderJobDebugCaptureNodeGraphs;
+ (BOOL)renderJobDebugCaptureOnlyPerfStats;
+ (BOOL)renderJobDebugCapturePerfStatHistory;
+ (BOOL)renderJobDisableResultCache;
+ (BOOL)renderMeteorPlusAsHDR;
+ (BOOL)renderTransparencyOpaque;
+ (BOOL)renderTransparencyOverBlack;
+ (BOOL)renderVideoLive;
+ (BOOL)rendererClampToAlpha;
+ (BOOL)rendererUseHalfFloat;
+ (BOOL)rendererUseP3Linear;
+ (BOOL)resampleInSourceColorSpace;
+ (BOOL)runNeutrinoSynchronously;
+ (BOOL)semanticStyleAllowResidualsMismatch;
+ (BOOL)semanticStyleDisableDeltaMap;
+ (BOOL)semanticStyleDisableResiduals;
+ (BOOL)semanticStyleForceResiduals;
+ (BOOL)semanticStyleForceSyntheticNoise;
+ (BOOL)semanticStyleUseDynamicConfig;
+ (BOOL)semanticStyleUseFasterSystemOrder;
+ (BOOL)shouldEnableStylesForProRaw;
+ (BOOL)surfaceStorageFactoryUsePool;
+ (NSString)debugRenderBlue;
+ (NSString)debugRenderPurple;
+ (NSString)debugRenderYellow;
+ (NSString)inpaintSegmentationInputTensorsDumpPath;
+ (NSString)meteorGainMapExposureCompensationMode;
+ (NSString)tempDir;
+ (NSURL)cacheNodeDirectoryURL;
+ (NSURL)pipelineSourceURL;
+ (double)HLGOpticalScale;
+ (double)cacheNodeImageCompression;
+ (double)inpaintMaximumArea;
+ (double)inpaintMinimumArea;
+ (double)maxGainMapHeadroom;
+ (double)mediaViewRenderCoalescingInterval;
+ (double)overrideDisplayHeadroom;
+ (double)renderJSPipelineTimeout;
+ (double)renderResourceEvictionDelay;
+ (double)semanticStyleInterpolationHalfWindowTime;
+ (double)storagePoolMigrationDelay;
+ (double)thresholdDisplayHeadroom;
+ (id)globalSettings;
+ (int64_t)cacheNodeCacheSizeLimit;
+ (int64_t)cacheNodeFilePermissions;
+ (int64_t)debugSoftMemoryLimit;
+ (int64_t)deviceDefaultSampleMode;
+ (int64_t)imageTileBorder;
+ (int64_t)imageTileSize;
+ (int64_t)inpaintSegmentationMaxInputSize;
+ (int64_t)maxPixelCountForCacheImmediately;
+ (int64_t)rendererContextLargeMemoryTarget;
+ (int64_t)rendererContextLowMemoryTarget;
+ (int64_t)storagePoolNonPurgeableLimit;
+ (int64_t)storagePoolPurgeableLimit;
+ (unint64_t)videoCompositorDebugMode;
+ (void)reset;
+ (void)setAllAssetsCanUseHDRPipeline:(BOOL)a3;
+ (void)setAlwaysRequireHardwareVideoEncoder:(BOOL)a3;
+ (void)setBufferStorageFactoryUsePool:(BOOL)a3;
+ (void)setCacheNodeCacheSizeLimit:(int64_t)a3;
+ (void)setCacheNodeDirectoryURL:(id)a3;
+ (void)setCacheNodeFilePermissions:(int64_t)a3;
+ (void)setCacheNodeImageCompression:(double)a3;
+ (void)setDebugDumpStyleEngineInputs:(BOOL)a3;
+ (void)setDebugRenderBlue:(id)a3;
+ (void)setDebugRenderPurple:(id)a3;
+ (void)setDebugRenderYellow:(id)a3;
+ (void)setDebugSoftMemoryLimit:(int64_t)a3;
+ (void)setDeviceDefaultSampleMode:(int64_t)a3;
+ (void)setDevicePrintRenderer:(BOOL)a3;
+ (void)setDisableAuxiliaryImageCacheFromSource:(BOOL)a3;
+ (void)setDisableIOSurfacePortaitExport:(BOOL)a3;
+ (void)setDisableMeteorGainMapGeneration:(BOOL)a3;
+ (void)setDisablePacked10BitPixelFormats:(BOOL)a3;
+ (void)setDisplayDisableColorMatching:(BOOL)a3;
+ (void)setDisplayDisableDeepColor:(BOOL)a3;
+ (void)setDisplayForceDeepColor:(BOOL)a3;
+ (void)setEnableDash5:(BOOL)a3;
+ (void)setEnableFlexRange:(BOOL)a3;
+ (void)setEnableHDRSupport:(BOOL)a3;
+ (void)setEnableSpatialMediaEditing:(BOOL)a3;
+ (void)setEnforceMinimumBitRateForCinematicVideos:(BOOL)a3;
+ (void)setEnforceMinimumBitRateForExportedVideos:(BOOL)a3;
+ (void)setForceMeteorGainMapGeneration:(BOOL)a3;
+ (void)setForceMeteorPlusLinear:(BOOL)a3;
+ (void)setForceMeteorPlusPlus:(BOOL)a3;
+ (void)setForceSoftwareVideoEncoder:(BOOL)a3;
+ (void)setImageLayerDebug:(BOOL)a3;
+ (void)setImageRenderJobUseSurfaceRenderer:(BOOL)a3;
+ (void)setImageRenderJobUseTextureRenderer:(BOOL)a3;
+ (void)setImageSourceDisableCacheImmediately:(BOOL)a3;
+ (void)setImageSourceDisableRAW:(BOOL)a3;
+ (void)setImageTileBorder:(int64_t)a3;
+ (void)setImageTileSize:(int64_t)a3;
+ (void)setInpaintDumpsInputImages:(BOOL)a3;
+ (void)setInpaintEnablesRefinementPass:(BOOL)a3;
+ (void)setInpaintMaximumArea:(double)a3;
+ (void)setInpaintMinimumArea:(double)a3;
+ (void)setInpaintSegmentationInputTensorsDumpPath:(id)a3;
+ (void)setInpaintSegmentationMaxInputSize:(int64_t)a3;
+ (void)setInpaintSegmentationUsesConnectedComponents:(BOOL)a3;
+ (void)setInpaintSegmentationUsesNonUniformScaling:(BOOL)a3;
+ (void)setInpaintShowsSurroundOutline:(BOOL)a3;
+ (void)setLogPeakRenderCIUsuage:(BOOL)a3;
+ (void)setMaxGainMapHeadroom:(double)a3;
+ (void)setMaxPixelCountForCacheImmediately:(int64_t)a3;
+ (void)setMediaViewDisableLivePhoto:(BOOL)a3;
+ (void)setMediaViewRenderCoalescingInterval:(double)a3;
+ (void)setMeteorGainMapExposureCompensationMode:(id)a3;
+ (void)setOverrideCleanupHardwareCheck:(BOOL)a3;
+ (void)setOverrideDisplayHeadroom:(double)a3;
+ (void)setOverrideSemanticStylesHardwareCheck:(BOOL)a3;
+ (void)setPipelineSourceURL:(id)a3;
+ (void)setPlatformHasWideColor:(BOOL)a3;
+ (void)setPreserveSubjectsWhenInpainting:(BOOL)a3;
+ (void)setRenderEDRAsPQ:(BOOL)a3;
+ (void)setRenderJSPipelineTimeout:(double)a3;
+ (void)setRenderJobDebug:(BOOL)a3;
+ (void)setRenderJobDebugCapture5PercentOfJobs:(BOOL)a3;
+ (void)setRenderJobDebugCaptureCanceledJobs:(BOOL)a3;
+ (void)setRenderJobDebugCaptureNodeCache:(BOOL)a3;
+ (void)setRenderJobDebugCaptureNodeGraphs:(BOOL)a3;
+ (void)setRenderJobDebugCaptureOnlyPerfStats:(BOOL)a3;
+ (void)setRenderJobDebugCapturePerfStatHistory:(BOOL)a3;
+ (void)setRenderJobDisableResultCache:(BOOL)a3;
+ (void)setRenderMeteorPlusAsHDR:(BOOL)a3;
+ (void)setRenderResourceEvictionDelay:(double)a3;
+ (void)setRenderTransparencyOpaque:(BOOL)a3;
+ (void)setRenderTransparencyOverBlack:(BOOL)a3;
+ (void)setRenderVideoLive:(BOOL)a3;
+ (void)setRendererClampToAlpha:(BOOL)a3;
+ (void)setRendererContextLargeMemoryTarget:(int64_t)a3;
+ (void)setRendererContextLowMemoryTarget:(int64_t)a3;
+ (void)setRendererUseHalfFloat:(BOOL)a3;
+ (void)setRendererUseP3Linear:(BOOL)a3;
+ (void)setResampleInSourceColorSpace:(BOOL)a3;
+ (void)setRunNeutrinoSynchronously:(BOOL)a3;
+ (void)setSemanticStyleAllowResidualsMismatch:(BOOL)a3;
+ (void)setSemanticStyleDisableDeltaMap:(BOOL)a3;
+ (void)setSemanticStyleDisableResiduals:(BOOL)a3;
+ (void)setSemanticStyleForceResiduals:(BOOL)a3;
+ (void)setSemanticStyleForceSyntheticNoise:(BOOL)a3;
+ (void)setSemanticStyleInterpolationHalfWindowTime:(double)a3;
+ (void)setSemanticStyleUseDynamicConfig:(BOOL)a3;
+ (void)setSemanticStyleUseFasterSystemOrder:(BOOL)a3;
+ (void)setShouldEnableStylesForProRaw:(BOOL)a3;
+ (void)setStoragePoolMigrationDelay:(double)a3;
+ (void)setStoragePoolNonPurgeableLimit:(int64_t)a3;
+ (void)setStoragePoolPurgeableLimit:(int64_t)a3;
+ (void)setSurfaceStorageFactoryUsePool:(BOOL)a3;
+ (void)setTempDir:(id)a3;
+ (void)setThresholdDisplayHeadroom:(double)a3;
+ (void)setUpCacheNodeDirectoryWithComponent:(id)a3;
+ (void)setVideoCompositorDebugMode:(unint64_t)a3;
+ (void)setViewDebugEnabled:(BOOL)a3;
- (BOOL)BOOLSettingForKey:(id)a3 defaultValue:(id)a4;
- (NUGlobalSettings)init;
- (double)doubleSettingForKey:(id)a3 defaultValue:(id)a4;
- (id)_settingForKey:(id)a3 defaultValue:(id)a4;
- (id)settingForKey:(id)a3 defaultValue:(id)a4;
- (id)stringSettingForKey:(id)a3 defaultValue:(id)a4;
- (id)urlSettingForKey:(id)a3 defaultValue:(id)a4;
- (int64_t)integerSettingForKey:(id)a3 defaultValue:(id)a4;
- (void)reset;
- (void)setSetting:(id)a3 forKey:(id)a4;
@end

@implementation NUGlobalSettings

uint64_t __38__NUGlobalSettings_setSetting_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
}

uint64_t __34__NUGlobalSettings_globalSettings__block_invoke()
{
  globalSettings_globalSettings = objc_alloc_init(NUGlobalSettings);

  return MEMORY[0x1F41817F8]();
}

- (NUGlobalSettings)init
{
  v8.receiver = self;
  v8.super_class = (Class)NUGlobalSettings;
  v2 = [(NUGlobalSettings *)&v8 init];
  dispatch_queue_t v3 = dispatch_queue_create("NUGlobalSettings", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  settings = v2->_settings;
  v2->_settings = v5;

  return v2;
}

+ (void)setEnableSpatialMediaEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_ENABLE_SPATIAL_MEDIA_EDITING"];
}

- (void)setSetting:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__NUGlobalSettings_setSetting_forKey___block_invoke;
  block[3] = &unk_1E5D95878;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

+ (id)globalSettings
{
  if (globalSettings_onceToken != -1) {
    dispatch_once(&globalSettings_onceToken, &__block_literal_global_935);
  }
  v2 = (void *)globalSettings_globalSettings;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)urlSettingForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__NUGlobalSettings_urlSettingForKey_defaultValue___block_invoke;
  v12[3] = &unk_1E5D93C60;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(NUGlobalSettings *)self settingForKey:v9 defaultValue:v12];

  return v10;
}

id __50__NUGlobalSettings_urlSettingForKey_defaultValue___block_invoke(uint64_t a1)
{
  v2 = getStringEnv(*(void **)(a1 + 32));
  if (v2) {
    [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
  }
  else {
  BOOL v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v3;
}

- (id)stringSettingForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__NUGlobalSettings_stringSettingForKey_defaultValue___block_invoke;
  v12[3] = &unk_1E5D93C38;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(NUGlobalSettings *)self settingForKey:v9 defaultValue:v12];

  return v10;
}

id __53__NUGlobalSettings_stringSettingForKey_defaultValue___block_invoke(uint64_t a1)
{
  v2 = getStringEnv(*(void **)(a1 + 32));
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return v5;
}

- (double)doubleSettingForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __53__NUGlobalSettings_doubleSettingForKey_defaultValue___block_invoke;
  v17 = &unk_1E5D93C10;
  id v18 = v6;
  id v19 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(NUGlobalSettings *)self settingForKey:v9 defaultValue:&v14];
  objc_msgSend(v10, "doubleValue", v14, v15, v16, v17);
  double v12 = v11;

  return v12;
}

uint64_t __53__NUGlobalSettings_doubleSettingForKey_defaultValue___block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (double (**)(void))*(id *)(a1 + 40);
  id v4 = getStringEnv(v2);
  id v5 = v4;
  if (v4) {
    [v4 doubleValue];
  }
  else {
    double v6 = v3[2](v3);
  }
  double v7 = v6;

  return [v1 numberWithDouble:v7];
}

- (int64_t)integerSettingForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __54__NUGlobalSettings_integerSettingForKey_defaultValue___block_invoke;
  v16 = &unk_1E5D93C10;
  id v17 = v6;
  id v18 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(NUGlobalSettings *)self settingForKey:v9 defaultValue:&v13];
  int64_t v11 = objc_msgSend(v10, "integerValue", v13, v14, v15, v16);

  return v11;
}

uint64_t __54__NUGlobalSettings_integerSettingForKey_defaultValue___block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (uint64_t (**)(void))*(id *)(a1 + 40);
  id v4 = getStringEnv(v2);
  id v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 integerValue];
  }
  else {
    uint64_t v6 = v3[2](v3);
  }
  uint64_t v7 = v6;

  return [v1 numberWithInteger:v7];
}

- (BOOL)BOOLSettingForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __51__NUGlobalSettings_BOOLSettingForKey_defaultValue___block_invoke;
  v16 = &unk_1E5D93C10;
  id v17 = v6;
  id v18 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(NUGlobalSettings *)self settingForKey:v9 defaultValue:&v13];
  char v11 = objc_msgSend(v10, "BOOLValue", v13, v14, v15, v16);

  return v11;
}

uint64_t __51__NUGlobalSettings_BOOLSettingForKey_defaultValue___block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (uint64_t (**)(void))*(id *)(a1 + 40);
  id v4 = getStringEnv(v2);
  id v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = v3[2](v3);
  }
  uint64_t v7 = v6;

  return [v1 numberWithBool:v7];
}

- (id)_settingForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = [(NSMutableDictionary *)self->_settings objectForKeyedSubscript:v6];
  if (!v8)
  {
    id v8 = v7[2](v7);
    [(NSMutableDictionary *)self->_settings setObject:v8 forKeyedSubscript:v6];
  }

  return v8;
}

- (id)settingForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__759;
  v21 = __Block_byref_object_dispose__760;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__NUGlobalSettings_settingForKey_defaultValue___block_invoke;
  v13[3] = &unk_1E5D94658;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __47__NUGlobalSettings_settingForKey_defaultValue___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _settingForKey:*(void *)(a1 + 40) defaultValue:*(void *)(a1 + 48)];

  return MEMORY[0x1F41817F8]();
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__NUGlobalSettings_reset__block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __25__NUGlobalSettings_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

+ (void)setDebugSoftMemoryLimit:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_DEBUG_SOFT_MEMORY_LIMIT"];
}

+ (int64_t)debugSoftMemoryLimit
{
  v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_DEBUG_SOFT_MEMORY_LIMIT" defaultValue:&__block_literal_global_533];

  return v3;
}

uint64_t __40__NUGlobalSettings_debugSoftMemoryLimit__block_invoke()
{
  return 0;
}

+ (void)setRenderResourceEvictionDelay:(double)a3
{
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_RESOURCE_EVICTION_DELAY"];
}

+ (double)renderResourceEvictionDelay
{
  v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_RENDER_RESOURCE_EVICTION_DELAY" defaultValue:&__block_literal_global_528];
  double v4 = v3;

  return v4;
}

double __47__NUGlobalSettings_renderResourceEvictionDelay__block_invoke()
{
  return 3.0;
}

+ (void)setSemanticStyleUseFasterSystemOrder:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_STYLES_USE_FASTER_SYSTEM_ORDER"];
}

+ (BOOL)semanticStyleUseFasterSystemOrder
{
  v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_STYLES_USE_FASTER_SYSTEM_ORDER" defaultValue:&__block_literal_global_523];

  return v3;
}

uint64_t __53__NUGlobalSettings_semanticStyleUseFasterSystemOrder__block_invoke()
{
  return 0;
}

+ (void)setSemanticStyleUseDynamicConfig:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_STYLES_USE_DYNAMIC_CONFIG"];
}

+ (BOOL)semanticStyleUseDynamicConfig
{
  v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_STYLES_USE_DYNAMIC_CONFIG" defaultValue:&__block_literal_global_514];

  return v3;
}

uint64_t __49__NUGlobalSettings_semanticStyleUseDynamicConfig__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.Preferences"];

  return v2;
}

+ (void)setDebugDumpStyleEngineInputs:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_DEBUG_DUMP_STYLE_ENGINE_INPUTS"];
}

+ (BOOL)debugDumpStyleEngineInputs
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_DEBUG_DUMP_STYLE_ENGINE_INPUTS" defaultValue:&__block_literal_global_509];

  return v3;
}

uint64_t __46__NUGlobalSettings_debugDumpStyleEngineInputs__block_invoke()
{
  return 0;
}

+ (void)setSemanticStyleForceSyntheticNoise:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_STYLES_FORCE_SYNTHETIC_NOISE"];
}

+ (BOOL)semanticStyleForceSyntheticNoise
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_STYLES_FORCE_SYNTHETIC_NOISE" defaultValue:&__block_literal_global_504];

  return v3;
}

uint64_t __52__NUGlobalSettings_semanticStyleForceSyntheticNoise__block_invoke()
{
  return 0;
}

+ (void)setSemanticStyleAllowResidualsMismatch:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_STYLES_ALLOW_RESIDUALS_MISMATCH"];
}

+ (BOOL)semanticStyleAllowResidualsMismatch
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_STYLES_ALLOW_RESIDUALS_MISMATCH" defaultValue:&__block_literal_global_499];

  return v3;
}

uint64_t __55__NUGlobalSettings_semanticStyleAllowResidualsMismatch__block_invoke()
{
  return 1;
}

+ (void)setSemanticStyleForceResiduals:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_STYLES_FORCE_RESIDUALS"];
}

+ (BOOL)semanticStyleForceResiduals
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_STYLES_FORCE_RESIDUALS" defaultValue:&__block_literal_global_494];

  return v3;
}

uint64_t __47__NUGlobalSettings_semanticStyleForceResiduals__block_invoke()
{
  return 0;
}

+ (void)setSemanticStyleDisableResiduals:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_STYLES_DISABLE_RESIDUALS"];
}

+ (BOOL)semanticStyleDisableResiduals
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_STYLES_DISABLE_RESIDUALS" defaultValue:&__block_literal_global_489];

  return v3;
}

uint64_t __49__NUGlobalSettings_semanticStyleDisableResiduals__block_invoke()
{
  return 0;
}

+ (void)setSemanticStyleDisableDeltaMap:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_STYLES_DISABLE_DELTA_MAP"];
}

+ (BOOL)semanticStyleDisableDeltaMap
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_STYLES_DISABLE_DELTA_MAP" defaultValue:&__block_literal_global_484];

  return v3;
}

uint64_t __48__NUGlobalSettings_semanticStyleDisableDeltaMap__block_invoke()
{
  return 0;
}

+ (void)setOverrideSemanticStylesHardwareCheck:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_STYLES_OVERRIDE_HARDWARE"];
}

+ (BOOL)overrideSemanticStylesHardwareCheck
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_STYLES_OVERRIDE_HARDWARE" defaultValue:&__block_literal_global_479];

  return v3;
}

uint64_t __55__NUGlobalSettings_overrideSemanticStylesHardwareCheck__block_invoke()
{
  return 0;
}

+ (void)setSemanticStyleInterpolationHalfWindowTime:(double)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setSetting:v4 forKey:@"NU_STYLES_TEMPORAL_WINDOW_SIZE"];
}

+ (double)semanticStyleInterpolationHalfWindowTime
{
  uint64_t v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_STYLES_TEMPORAL_WINDOW_SIZE" defaultValue:&__block_literal_global_474];
  double v4 = v3;

  return v4;
}

double __60__NUGlobalSettings_semanticStyleInterpolationHalfWindowTime__block_invoke()
{
  return 0.400000006;
}

+ (void)setShouldEnableStylesForProRaw:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_STYLES_SHOULD_ENABLE_ON_PRORAW"];
}

+ (BOOL)shouldEnableStylesForProRaw
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_STYLES_SHOULD_ENABLE_ON_PRORAW" defaultValue:&__block_literal_global_469];

  return v3;
}

uint64_t __47__NUGlobalSettings_shouldEnableStylesForProRaw__block_invoke()
{
  return 0;
}

+ (void)setInpaintSegmentationMaxInputSize:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_INPAINT_SEGMENTATION_MAX_INPUT_SIZE"];
}

+ (int64_t)inpaintSegmentationMaxInputSize
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_INPAINT_SEGMENTATION_MAX_INPUT_SIZE" defaultValue:&__block_literal_global_464];

  return v3;
}

uint64_t __51__NUGlobalSettings_inpaintSegmentationMaxInputSize__block_invoke()
{
  return 12192768;
}

+ (void)setInpaintEnablesRefinementPass:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_INPAINT_ENABLE_REFINEMENT"];
}

+ (BOOL)inpaintEnablesRefinementPass
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_INPAINT_ENABLE_REFINEMENT" defaultValue:&__block_literal_global_459];

  return v3;
}

uint64_t __48__NUGlobalSettings_inpaintEnablesRefinementPass__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"NU_INPAINT_ENABLE_REFINEMENT"];

  if (v1) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

+ (void)setInpaintMaximumArea:(double)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setSetting:v4 forKey:@"NU_INPAINT_MAX_AREA"];
}

+ (double)inpaintMaximumArea
{
  uint64_t v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_INPAINT_MAX_AREA" defaultValue:&__block_literal_global_454];
  double v4 = v3;

  return v4;
}

double __38__NUGlobalSettings_inpaintMaximumArea__block_invoke()
{
  return 0.1;
}

+ (void)setInpaintMinimumArea:(double)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setSetting:v4 forKey:@"NU_INPAINT_MIN_AREA"];
}

+ (double)inpaintMinimumArea
{
  uint64_t v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_INPAINT_MIN_AREA" defaultValue:&__block_literal_global_449];
  double v4 = v3;

  return v4;
}

double __38__NUGlobalSettings_inpaintMinimumArea__block_invoke()
{
  return 0.0004;
}

+ (void)setInpaintDumpsInputImages:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_INPAINT_DUMPS_INPUT_IMAGES"];
}

+ (BOOL)inpaintDumpsInputImages
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_INPAINT_DUMPS_INPUT_IMAGES" defaultValue:&__block_literal_global_444];

  return v3;
}

uint64_t __43__NUGlobalSettings_inpaintDumpsInputImages__block_invoke()
{
  return 0;
}

+ (void)setInpaintShowsSurroundOutline:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_INPAINT_SHOWS_SURROUND_OUTLINE"];
}

+ (BOOL)inpaintShowsSurroundOutline
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_INPAINT_SHOWS_SURROUND_OUTLINE" defaultValue:&__block_literal_global_439];

  return v3;
}

uint64_t __47__NUGlobalSettings_inpaintShowsSurroundOutline__block_invoke()
{
  return 0;
}

+ (void)setInpaintSegmentationInputTensorsDumpPath:(id)a3
{
  id v4 = a3;
  id v5 = [a1 globalSettings];
  [v5 setSetting:v4 forKey:@"NU_INPAINT_SEGMENT_INPUT_TENSOR_DUMP_PATH"];
}

+ (NSString)inpaintSegmentationInputTensorsDumpPath
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 settingForKey:@"NU_INPAINT_SEGMENT_INPUT_TENSOR_DUMP_PATH" defaultValue:&__block_literal_global_434];

  return (NSString *)v3;
}

id __59__NUGlobalSettings_inpaintSegmentationInputTensorsDumpPath__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"NU_INPAINT_SEGMENT_INPUT_TENSOR_DUMP_PATH"];

  return v1;
}

+ (void)setInpaintSegmentationUsesNonUniformScaling:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_INPAINT_SEGMENT_NONUNIFORM_SCALING"];
}

+ (BOOL)inpaintSegmentationUsesNonUniformScaling
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_INPAINT_SEGMENT_NONUNIFORM_SCALING" defaultValue:&__block_literal_global_428];

  return v3;
}

uint64_t __60__NUGlobalSettings_inpaintSegmentationUsesNonUniformScaling__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"NU_INPAINT_SEGMENT_NONUNIFORM_SCALING"];

  if (v1) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

+ (void)setInpaintSegmentationUsesConnectedComponents:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_INPAINT_SEGMENT_CONNECTED_COMPONENTS"];
}

+ (BOOL)inpaintSegmentationUsesConnectedComponents
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_INPAINT_SEGMENT_CONNECTED_COMPONENTS" defaultValue:&__block_literal_global_423];

  return v3;
}

uint64_t __62__NUGlobalSettings_inpaintSegmentationUsesConnectedComponents__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"NU_INPAINT_SEGMENT_CONNECTED_COMPONENTS"];

  if (v1) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

+ (void)setPreserveSubjectsWhenInpainting:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_INPAINT_PRESERVES_SUBJECTS"];
}

+ (BOOL)preserveSubjectsWhenInpainting
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_INPAINT_PRESERVES_SUBJECTS" defaultValue:&__block_literal_global_418];

  return v3;
}

uint64_t __50__NUGlobalSettings_preserveSubjectsWhenInpainting__block_invoke()
{
  return 1;
}

+ (void)setOverrideCleanupHardwareCheck:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_CLEANUP_OVERRIDE_HARDWARE"];
}

+ (BOOL)overrideCleanupHardwareCheck
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_CLEANUP_OVERRIDE_HARDWARE" defaultValue:&__block_literal_global_413];

  return v3;
}

uint64_t __48__NUGlobalSettings_overrideCleanupHardwareCheck__block_invoke()
{
  return 0;
}

+ (void)setMaxPixelCountForCacheImmediately:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_MAX_PIXEL_COUNT_FOR_CACHE_IMMEDIATELY"];
}

+ (int64_t)maxPixelCountForCacheImmediately
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_MAX_PIXEL_COUNT_FOR_CACHE_IMMEDIATELY" defaultValue:&__block_literal_global_408];

  return v3;
}

uint64_t __52__NUGlobalSettings_maxPixelCountForCacheImmediately__block_invoke()
{
  return 24470208;
}

+ (BOOL)enableSpatialMediaEditing
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_ENABLE_SPATIAL_MEDIA_EDITING" defaultValue:&__block_literal_global_403];

  return v3;
}

uint64_t __45__NUGlobalSettings_enableSpatialMediaEditing__block_invoke()
{
  return 0;
}

+ (void)setMediaViewDisableLivePhoto:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_MEDIAVIEW_DISABLE_LIVE_PHOTO"];
}

+ (BOOL)mediaViewDisableLivePhoto
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_MEDIAVIEW_DISABLE_LIVE_PHOTO" defaultValue:&__block_literal_global_398];

  return v3;
}

uint64_t __45__NUGlobalSettings_mediaViewDisableLivePhoto__block_invoke()
{
  return 0;
}

+ (void)setMediaViewRenderCoalescingInterval:(double)a3
{
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithDouble:1.0 / a3];
  [v5 setSetting:v4 forKey:@"NU_MEDIAVIEW_COALESCED_UPDATES_PER_SECOND"];
}

+ (double)mediaViewRenderCoalescingInterval
{
  uint64_t v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_MEDIAVIEW_COALESCED_UPDATES_PER_SECOND" defaultValue:&__block_literal_global_393];
  double v4 = v3;

  return 1.0 / v4;
}

double __53__NUGlobalSettings_mediaViewRenderCoalescingInterval__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"NU_MEDIAVIEW_COALESCED_UPDATES_PER_SECOND"];

  if (v1)
  {
    [v1 doubleValue];
    double v3 = v2;
  }
  else
  {
    double v3 = 30.0;
  }

  return v3;
}

+ (void)setDisableAuxiliaryImageCacheFromSource:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_DISABLE_AUXILIARY_IMAGE_CACHE_FROM_SOURCE"];
}

+ (BOOL)disableAuxiliaryImageCacheFromSource
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_DISABLE_AUXILIARY_IMAGE_CACHE_FROM_SOURCE" defaultValue:&__block_literal_global_388];

  return v3;
}

uint64_t __56__NUGlobalSettings_disableAuxiliaryImageCacheFromSource__block_invoke()
{
  return 0;
}

+ (void)setEnforceMinimumBitRateForCinematicVideos:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_ENFORCE_MIN_BITRATE_FOR_CINEMATIC_VIDEO"];
}

+ (BOOL)enforceMinimumBitRateForCinematicVideos
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_ENFORCE_MIN_BITRATE_FOR_CINEMATIC_VIDEO" defaultValue:&__block_literal_global_383];

  return v3;
}

uint64_t __59__NUGlobalSettings_enforceMinimumBitRateForCinematicVideos__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"NU_ENFORCE_MIN_BITRATE_FOR_CINEMATIC_VIDEO"];

  if (!v1) {
    return 1;
  }
  double v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 BOOLForKey:@"NU_ENFORCE_MIN_BITRATE_FOR_CINEMATIC_VIDEO"];

  return v3;
}

+ (void)setEnforceMinimumBitRateForExportedVideos:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_ENFORCE_MIN_BITRATE_FOR_VIDEO"];
}

+ (BOOL)enforceMinimumBitRateForExportedVideos
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_ENFORCE_MIN_BITRATE_FOR_VIDEO" defaultValue:&__block_literal_global_378];

  return v3;
}

uint64_t __58__NUGlobalSettings_enforceMinimumBitRateForExportedVideos__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_ENFORCE_MIN_BITRATE_FOR_VIDEO"];

  return v1;
}

+ (void)setMeteorGainMapExposureCompensationMode:(id)a3
{
  id v4 = a3;
  id v5 = [a1 globalSettings];
  [v5 setSetting:v4 forKey:@"NU_METEOR_GAIN_MAP_EXPOSURE_COMPENSATION_MODE"];
}

+ (NSString)meteorGainMapExposureCompensationMode
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 stringSettingForKey:@"NU_METEOR_GAIN_MAP_EXPOSURE_COMPENSATION_MODE" defaultValue:&__block_literal_global_373];

  return (NSString *)v3;
}

uint64_t __57__NUGlobalSettings_meteorGainMapExposureCompensationMode__block_invoke()
{
  return 0;
}

+ (void)setForceMeteorGainMapGeneration:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_FORCE_METEOR_GAIN_MAP_GENERATION"];
}

+ (BOOL)forceMeteorGainMapGeneration
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_FORCE_METEOR_GAIN_MAP_GENERATION" defaultValue:&__block_literal_global_368];

  return v3;
}

uint64_t __48__NUGlobalSettings_forceMeteorGainMapGeneration__block_invoke()
{
  return 0;
}

+ (void)setDisableMeteorGainMapGeneration:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_DISABLE_METEOR_GAIN_MAP_GENERATION"];
}

+ (BOOL)disableMeteorGainMapGeneration
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_DISABLE_METEOR_GAIN_MAP_GENERATION" defaultValue:&__block_literal_global_363];

  return v3;
}

uint64_t __50__NUGlobalSettings_disableMeteorGainMapGeneration__block_invoke()
{
  return 0;
}

+ (void)setDebugRenderYellow:(id)a3
{
  id v4 = a3;
  id v5 = [a1 globalSettings];
  [v5 setSetting:v4 forKey:@"NU_DEBUG_RENDER_YELLOW"];
}

+ (NSString)debugRenderYellow
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 stringSettingForKey:@"NU_DEBUG_RENDER_YELLOW" defaultValue:&__block_literal_global_358];

  return (NSString *)v3;
}

uint64_t __37__NUGlobalSettings_debugRenderYellow__block_invoke()
{
  return 0;
}

+ (void)setDebugRenderPurple:(id)a3
{
  id v4 = a3;
  id v5 = [a1 globalSettings];
  [v5 setSetting:v4 forKey:@"NU_DEBUG_RENDER_PURPLE"];
}

+ (NSString)debugRenderPurple
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 stringSettingForKey:@"NU_DEBUG_RENDER_PURPLE" defaultValue:&__block_literal_global_353];

  return (NSString *)v3;
}

uint64_t __37__NUGlobalSettings_debugRenderPurple__block_invoke()
{
  return 0;
}

+ (void)setDebugRenderBlue:(id)a3
{
  id v4 = a3;
  id v5 = [a1 globalSettings];
  [v5 setSetting:v4 forKey:@"NU_DEBUG_RENDER_BLUE"];
}

+ (NSString)debugRenderBlue
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 stringSettingForKey:@"NU_DEBUG_RENDER_BLUE" defaultValue:&__block_literal_global_348];

  return (NSString *)v3;
}

uint64_t __35__NUGlobalSettings_debugRenderBlue__block_invoke()
{
  return 0;
}

+ (void)setAlwaysRequireHardwareVideoEncoder:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_ALWAYS_REQUIRE_HARDWARE_VIDEO_ENCODER"];
}

+ (BOOL)alwaysRequireHardwareVideoEncoder
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_ALWAYS_REQUIRE_HARDWARE_VIDEO_ENCODER" defaultValue:&__block_literal_global_343];

  return v3;
}

uint64_t __53__NUGlobalSettings_alwaysRequireHardwareVideoEncoder__block_invoke()
{
  return 0;
}

+ (void)setForceSoftwareVideoEncoder:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_FORCE_SOFTWARE_VIDEO_ENCODER"];
}

+ (BOOL)forceSoftwareVideoEncoder
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_FORCE_SOFTWARE_VIDEO_ENCODER" defaultValue:&__block_literal_global_338];

  return v3;
}

uint64_t __45__NUGlobalSettings_forceSoftwareVideoEncoder__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_FORCE_SOFTWARE_VIDEO_ENCODER"];

  return v1;
}

+ (void)setVideoCompositorDebugMode:(unint64_t)a3
{
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_VIDEO_COMPOSITOR_DEBUG_MODE"];
}

+ (unint64_t)videoCompositorDebugMode
{
  double v2 = [a1 globalSettings];
  unint64_t v3 = [v2 integerSettingForKey:@"NU_VIDEO_COMPOSITOR_DEBUG_MODE" defaultValue:&__block_literal_global_333];

  return v3;
}

uint64_t __44__NUGlobalSettings_videoCompositorDebugMode__block_invoke()
{
  return 0;
}

+ (void)setThresholdDisplayHeadroom:(double)a3
{
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setSetting:v4 forKey:@"NU_THRESHOLD_DISPLAY_HEADROOM"];
}

+ (double)thresholdDisplayHeadroom
{
  double v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_THRESHOLD_DISPLAY_HEADROOM" defaultValue:&__block_literal_global_328];
  double v4 = v3;

  return v4;
}

double __44__NUGlobalSettings_thresholdDisplayHeadroom__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 objectForKey:@"NU_THRESHOLD_DISPLAY_HEADROOM"];

  if (v1)
  {
    [v1 doubleValue];
    double v3 = v2;
  }
  else
  {
    double v3 = 2.0;
  }

  return v3;
}

+ (void)setOverrideDisplayHeadroom:(double)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setSetting:v4 forKey:@"NU_OVERRIDE_DISPLAY_HEADROOM"];
}

+ (double)overrideDisplayHeadroom
{
  double v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_OVERRIDE_DISPLAY_HEADROOM" defaultValue:&__block_literal_global_323];
  double v4 = v3;

  return v4;
}

double __43__NUGlobalSettings_overrideDisplayHeadroom__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 doubleForKey:@"NU_OVERRIDE_DISPLAY_HEADROOM"];
  double v2 = v1;

  return v2;
}

+ (void)setDisablePacked10BitPixelFormats:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_DISABLE_PACKED_10BIT_PIXEL_FORMATS"];
}

+ (BOOL)disablePacked10BitPixelFormats
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_DISABLE_PACKED_10BIT_PIXEL_FORMATS" defaultValue:&__block_literal_global_318];

  return v3;
}

uint64_t __50__NUGlobalSettings_disablePacked10BitPixelFormats__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_DISABLE_PACKED_10BIT_PIXEL_FORMATS"];

  return v1;
}

+ (void)setForceMeteorPlusLinear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_FORCE_METEOR_PLUS_LINEAR"];
}

+ (BOOL)forceMeteorPlusLinear
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_FORCE_METEOR_PLUS_LINEAR" defaultValue:&__block_literal_global_313];

  return v3;
}

uint64_t __41__NUGlobalSettings_forceMeteorPlusLinear__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_FORCE_METEOR_PLUS_LINEAR"];

  return v1;
}

+ (void)setForceMeteorPlusPlus:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_FORCE_METEOR_PLUS_PLUS"];
}

+ (BOOL)forceMeteorPlusPlus
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_FORCE_METEOR_PLUS_PLUS" defaultValue:&__block_literal_global_308];

  return v3;
}

uint64_t __39__NUGlobalSettings_forceMeteorPlusPlus__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_FORCE_METEOR_PLUS_PLUS"];

  return v1;
}

+ (void)setRenderEDRAsPQ:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_EDR_AS_PQ"];
}

+ (BOOL)renderEDRAsPQ
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_EDR_AS_PQ" defaultValue:&__block_literal_global_303_841];

  return v3;
}

uint64_t __33__NUGlobalSettings_renderEDRAsPQ__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_RENDER_EDR_AS_PQ"];

  return v1;
}

+ (void)setRenderMeteorPlusAsHDR:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_METEOR_PLUS_AS_HDR"];
}

+ (BOOL)renderMeteorPlusAsHDR
{
  double v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_METEOR_PLUS_AS_HDR" defaultValue:&__block_literal_global_298];

  return v3;
}

uint64_t __41__NUGlobalSettings_renderMeteorPlusAsHDR__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 objectForKey:@"NU_RENDER_METEOR_PLUS_AS_HDR"];

  uint64_t v2 = _os_feature_enabled_impl();
  if (v1) {
    uint64_t v2 = [v1 BOOLValue];
  }
  uint64_t v3 = v2;

  return v3;
}

+ (void)setEnableFlexRange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_ENABLE_FLEX_RANGE"];
}

+ (BOOL)enableFlexRange
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_ENABLE_FLEX_RANGE" defaultValue:&__block_literal_global_293];

  return v3;
}

uint64_t __35__NUGlobalSettings_enableFlexRange__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 objectForKey:@"NU_ENABLE_FLEX_RANGE"];

  if (v1) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

+ (void)setEnableDash5:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_ENABLE_DASH5"];
}

+ (BOOL)enableDash5
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_ENABLE_DASH5" defaultValue:&__block_literal_global_286];

  return v3;
}

uint64_t __31__NUGlobalSettings_enableDash5__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 objectForKey:@"NU_ENABLE_DASH5"];

  uint64_t v2 = _os_feature_enabled_impl();
  if (v1) {
    uint64_t v2 = [v1 BOOLValue];
  }
  uint64_t v3 = v2;

  return v3;
}

+ (void)setMaxGainMapHeadroom:(double)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setSetting:v4 forKey:@"NU_MAX_GAINMAP_HEADROOM"];
}

+ (double)maxGainMapHeadroom
{
  uint64_t v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_MAX_GAINMAP_HEADROOM" defaultValue:&__block_literal_global_281];
  double v4 = v3;

  return v4;
}

double __38__NUGlobalSettings_maxGainMapHeadroom__block_invoke()
{
  return 8.0;
}

+ (double)HLGOpticalScale
{
  uint64_t v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_HLG_OPTICAL_SCALE" defaultValue:&__block_literal_global_276];
  double v4 = v3;

  return v4;
}

double __35__NUGlobalSettings_HLGOpticalScale__block_invoke()
{
  return 2.0;
}

+ (void)setAllAssetsCanUseHDRPipeline:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_ALL_ASSETS_CAN_USE_HDR_PIPELINE"];
}

+ (BOOL)allAssetsCanUseHDRPipeline
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_ALL_ASSETS_CAN_USE_HDR_PIPELINE" defaultValue:&__block_literal_global_271];

  return v3;
}

uint64_t __46__NUGlobalSettings_allAssetsCanUseHDRPipeline__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_ALL_ASSETS_CAN_USE_HDR_PIPELINE"];

  return v1;
}

+ (void)setEnableHDRSupport:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_ENABLE_HDR_SUPPORT"];
}

+ (BOOL)enableHDRSupport
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_ENABLE_HDR_SUPPORT" defaultValue:&__block_literal_global_266];

  return v3;
}

uint64_t __36__NUGlobalSettings_enableHDRSupport__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 objectForKey:@"NU_ENABLE_HDR_SUPPORT"];

  if (v1) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

+ (void)setDisableIOSurfacePortaitExport:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_DISABLE_IOSURFACE_PORTRAIT_EXPORT"];
}

+ (BOOL)disableIOSurfacePortaitExport
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_DISABLE_IOSURFACE_PORTRAIT_EXPORT" defaultValue:&__block_literal_global_261];

  return v3;
}

uint64_t __49__NUGlobalSettings_disableIOSurfacePortaitExport__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_DISABLE_IOSURFACE_PORTRAIT_EXPORT"];

  return v1;
}

+ (void)setRunNeutrinoSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RUN_SYNCHRONOUSLY"];
}

+ (BOOL)runNeutrinoSynchronously
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RUN_SYNCHRONOUSLY" defaultValue:&__block_literal_global_256];

  return v3;
}

uint64_t __44__NUGlobalSettings_runNeutrinoSynchronously__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_RUN_SYNCHRONOUSLY"];

  return v1;
}

+ (void)setLogPeakRenderCIUsuage:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_SHOW_PEAK_RENDER_MEMORY"];
}

+ (BOOL)logPeakRenderCIUsuage
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_SHOW_PEAK_RENDER_MEMORY" defaultValue:&__block_literal_global_251];

  return v3;
}

uint64_t __41__NUGlobalSettings_logPeakRenderCIUsuage__block_invoke()
{
  return 0;
}

+ (void)setUpCacheNodeDirectoryWithComponent:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v6 = [v5 temporaryDirectory];
  id v7 = [v6 URLByAppendingPathComponent:v4];

  +[NUGlobalSettings setCacheNodeDirectoryURL:v7];
  +[NUGlobalSettings setCacheNodeFilePermissions:511];
  +[NUCacheNode clearCacheDirectory];
}

+ (void)setRenderTransparencyOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_TRANSPARENCY_OPAQUE"];
}

+ (BOOL)renderTransparencyOpaque
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_TRANSPARENCY_OPAQUE" defaultValue:&__block_literal_global_245];

  return v3;
}

uint64_t __44__NUGlobalSettings_renderTransparencyOpaque__block_invoke()
{
  return 1;
}

+ (void)setRenderTransparencyOverBlack:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_TRANSPARENCY_OVER_BLACK"];
}

+ (BOOL)renderTransparencyOverBlack
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_TRANSPARENCY_OVER_BLACK" defaultValue:&__block_literal_global_240];

  return v3;
}

uint64_t __47__NUGlobalSettings_renderTransparencyOverBlack__block_invoke()
{
  return 0;
}

+ (void)setDisplayDisableColorMatching:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_DISPLAY_DISABLE_COLOR_MATCHING"];
}

+ (BOOL)displayDisableColorMatching
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_DISPLAY_DISABLE_COLOR_MATCHING" defaultValue:&__block_literal_global_235_855];

  return v3;
}

uint64_t __47__NUGlobalSettings_displayDisableColorMatching__block_invoke()
{
  return 0;
}

+ (void)setDisplayForceDeepColor:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_DISPLAY_FORCE_DEEP_COLOR"];
}

+ (BOOL)displayForceDeepColor
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_DISPLAY_FORCE_DEEP_COLOR" defaultValue:&__block_literal_global_230];

  return v3;
}

uint64_t __41__NUGlobalSettings_displayForceDeepColor__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_DISPLAY_FORCE_DEEP_COLOR"];

  return v1;
}

+ (void)setDisplayDisableDeepColor:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_DISPLAY_DISABLE_DEEP_COLOR"];
}

+ (BOOL)displayDisableDeepColor
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_DISPLAY_DISABLE_DEEP_COLOR" defaultValue:&__block_literal_global_225];

  return v3;
}

uint64_t __43__NUGlobalSettings_displayDisableDeepColor__block_invoke()
{
  return 0;
}

+ (void)setImageLayerDebug:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_IMAGE_LAYER_DEBUG"];
}

+ (BOOL)imageLayerDebug
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_IMAGE_LAYER_DEBUG" defaultValue:&__block_literal_global_220];

  return v3;
}

uint64_t __35__NUGlobalSettings_imageLayerDebug__block_invoke()
{
  return 0;
}

+ (void)setPipelineSourceURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 globalSettings];
  [v5 setSetting:v4 forKey:@"NU_PIPELINE_SOURCE_URL"];
}

+ (NSURL)pipelineSourceURL
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 urlSettingForKey:@"NU_PIPELINE_SOURCE_URL" defaultValue:&__block_literal_global_215];

  return (NSURL *)v3;
}

uint64_t __37__NUGlobalSettings_pipelineSourceURL__block_invoke()
{
  return 0;
}

+ (void)setPlatformHasWideColor:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_PLATFORM_HAS_WIDE_COLOR"];
}

+ (BOOL)platformHasWideColor
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_PLATFORM_HAS_WIDE_COLOR" defaultValue:&__block_literal_global_207];

  return v3;
}

uint64_t __40__NUGlobalSettings_platformHasWideColor__block_invoke()
{
  return MEMORY[0x1F417CE00](@"Aixt/MEN2O2B7f+8m4TxUA");
}

+ (void)setRenderVideoLive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_PLATFORM_RENDER_VIDEO_LIVE"];
}

+ (BOOL)renderVideoLive
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_PLATFORM_RENDER_VIDEO_LIVE" defaultValue:&__block_literal_global_201];

  return v3;
}

uint64_t __35__NUGlobalSettings_renderVideoLive__block_invoke()
{
  v0 = +[NUPlatform currentPlatform];
  uint64_t v1 = [v0 defaultSupportsLiveVideoRendering];

  return v1;
}

+ (void)setCacheNodeDirectoryURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 globalSettings];
  [v5 setSetting:v4 forKey:@"NU_CACHE_NODE_DIRECTORY"];
}

+ (NSURL)cacheNodeDirectoryURL
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 urlSettingForKey:@"NU_CACHE_NODE_DIRECTORY" defaultValue:&__block_literal_global_192];

  return (NSURL *)v3;
}

id __41__NUGlobalSettings_cacheNodeDirectoryURL__block_invoke()
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v1 = [v0 URLsForDirectory:13 inDomains:1];

  if ([v1 count])
  {
    uint64_t v2 = [v1 firstObject];
  }
  else
  {
    char v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v2 = [v3 temporaryDirectory];
  }
  id v4 = [v2 URLByAppendingPathComponent:@"com.apple.neutrino.cache.node"];

  return v4;
}

+ (void)setViewDebugEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_VIEW_DEBUG_ENABLED"];
}

+ (BOOL)isViewDebugEnabled
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_VIEW_DEBUG_ENABLED" defaultValue:&__block_literal_global_187];

  return v3;
}

uint64_t __38__NUGlobalSettings_isViewDebugEnabled__block_invoke()
{
  return 0;
}

+ (void)setCacheNodeImageCompression:(double)a3
{
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setSetting:v4 forKey:@"NU_CACHE_NODE_IMAGE_COMPRESSION"];
}

+ (double)cacheNodeImageCompression
{
  uint64_t v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_CACHE_NODE_IMAGE_COMPRESSION" defaultValue:&__block_literal_global_182_864];
  double v4 = v3;

  return v4;
}

double __45__NUGlobalSettings_cacheNodeImageCompression__block_invoke()
{
  return 0.9;
}

+ (void)setCacheNodeFilePermissions:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_CACHE_NODE_FILE_PERMISSIONS"];
}

+ (int64_t)cacheNodeFilePermissions
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_CACHE_NODE_FILE_PERMISSIONS" defaultValue:&__block_literal_global_177];

  return v3;
}

uint64_t __44__NUGlobalSettings_cacheNodeFilePermissions__block_invoke()
{
  return 493;
}

+ (void)setCacheNodeCacheSizeLimit:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_CACHE_NODE_CACHE_SIZE_LIMIT"];
}

+ (int64_t)cacheNodeCacheSizeLimit
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_CACHE_NODE_CACHE_SIZE_LIMIT" defaultValue:&__block_literal_global_172];

  return v3;
}

uint64_t __43__NUGlobalSettings_cacheNodeCacheSizeLimit__block_invoke()
{
  return 0x4000000;
}

+ (void)setImageSourceDisableCacheImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_IMAGE_SOURCE_DISABLE_CACHE_IMMEDIATELY"];
}

+ (BOOL)imageSourceDisableCacheImmediately
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_IMAGE_SOURCE_DISABLE_CACHE_IMMEDIATELY" defaultValue:&__block_literal_global_167];

  return v3;
}

uint64_t __54__NUGlobalSettings_imageSourceDisableCacheImmediately__block_invoke()
{
  return 0;
}

+ (void)setImageSourceDisableRAW:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_IMAGE_SOURCE_DISABLE_RAW"];
}

+ (BOOL)imageSourceDisableRAW
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_IMAGE_SOURCE_DISABLE_RAW" defaultValue:&__block_literal_global_162];

  return v3;
}

uint64_t __41__NUGlobalSettings_imageSourceDisableRAW__block_invoke()
{
  return 0;
}

+ (void)setImageTileBorder:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_IMAGE_TILE_BORDER"];
}

+ (int64_t)imageTileBorder
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_IMAGE_TILE_BORDER" defaultValue:&__block_literal_global_157];

  return v3;
}

uint64_t __35__NUGlobalSettings_imageTileBorder__block_invoke()
{
  return 0;
}

+ (void)setImageTileSize:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_IMAGE_TILE_SIZE"];
}

+ (int64_t)imageTileSize
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_IMAGE_TILE_SIZE" defaultValue:&__block_literal_global_152];

  return v3;
}

uint64_t __33__NUGlobalSettings_imageTileSize__block_invoke()
{
  return 1024;
}

+ (void)setRendererContextLowMemoryTarget:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_RENDERER_CONTEXT_LOW_MEMORY_TARGET"];
}

+ (int64_t)rendererContextLowMemoryTarget
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_RENDERER_CONTEXT_LOW_MEMORY_TARGET" defaultValue:&__block_literal_global_147];

  return v3;
}

uint64_t __50__NUGlobalSettings_rendererContextLowMemoryTarget__block_invoke()
{
  return 64;
}

+ (void)setRendererContextLargeMemoryTarget:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_RENDERER_CONTEXT_LARGE_MEMORY_TARGET"];
}

+ (int64_t)rendererContextLargeMemoryTarget
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_RENDERER_CONTEXT_LARGE_MEMORY_TARGET" defaultValue:&__block_literal_global_142];

  return v3;
}

uint64_t __52__NUGlobalSettings_rendererContextLargeMemoryTarget__block_invoke()
{
  return 256;
}

+ (void)setRendererUseP3Linear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDERER_USE_P3_LINEAR"];
}

+ (BOOL)rendererUseP3Linear
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDERER_USE_P3_LINEAR" defaultValue:&__block_literal_global_137];

  return v3;
}

uint64_t __39__NUGlobalSettings_rendererUseP3Linear__block_invoke()
{
  return 0;
}

+ (void)setRendererClampToAlpha:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDERER_CLAMP_TO_ALPHA"];
}

+ (BOOL)rendererClampToAlpha
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDERER_CLAMP_TO_ALPHA" defaultValue:&__block_literal_global_132];

  return v3;
}

uint64_t __40__NUGlobalSettings_rendererClampToAlpha__block_invoke()
{
  return 0;
}

+ (void)setRendererUseHalfFloat:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDERER_USE_HALF_FLOAT"];
}

+ (BOOL)rendererUseHalfFloat
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDERER_USE_HALF_FLOAT" defaultValue:&__block_literal_global_126];

  return v3;
}

BOOL __40__NUGlobalSettings_rendererUseHalfFloat__block_invoke()
{
  return +[NURenderer defaultUseHalfFloat];
}

+ (void)setRenderJSPipelineTimeout:(double)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_JS_TIMEOUT"];
}

+ (double)renderJSPipelineTimeout
{
  uint64_t v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_RENDER_JS_TIMEOUT" defaultValue:&__block_literal_global_121];
  double v4 = v3;

  return v4;
}

double __43__NUGlobalSettings_renderJSPipelineTimeout__block_invoke()
{
  return 1.0;
}

+ (void)setImageRenderJobUseTextureRenderer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_IMAGE_RENDER_JOB_USE_TEXTURE_RENDERER"];
}

+ (BOOL)imageRenderJobUseTextureRenderer
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_IMAGE_RENDER_JOB_USE_TEXTURE_RENDERER" defaultValue:&__block_literal_global_116];

  return v3;
}

uint64_t __52__NUGlobalSettings_imageRenderJobUseTextureRenderer__block_invoke()
{
  return 1;
}

+ (void)setImageRenderJobUseSurfaceRenderer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_IMAGE_RENDER_JOB_USE_SURFACE_RENDERER"];
}

+ (BOOL)imageRenderJobUseSurfaceRenderer
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_IMAGE_RENDER_JOB_USE_SURFACE_RENDERER" defaultValue:&__block_literal_global_111];

  return v3;
}

uint64_t __52__NUGlobalSettings_imageRenderJobUseSurfaceRenderer__block_invoke()
{
  return 0;
}

+ (void)setBufferStorageFactoryUsePool:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_BUFFER_STORAGE_FACTORY_USE_POOL"];
}

+ (BOOL)bufferStorageFactoryUsePool
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_BUFFER_STORAGE_FACTORY_USE_POOL" defaultValue:&__block_literal_global_106];

  return v3;
}

uint64_t __47__NUGlobalSettings_bufferStorageFactoryUsePool__block_invoke()
{
  return 1;
}

+ (void)setSurfaceStorageFactoryUsePool:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_SURFACE_STORAGE_FACTORY_USE_POOL"];
}

+ (BOOL)surfaceStorageFactoryUsePool
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_SURFACE_STORAGE_FACTORY_USE_POOL" defaultValue:&__block_literal_global_101];

  return v3;
}

uint64_t __48__NUGlobalSettings_surfaceStorageFactoryUsePool__block_invoke()
{
  return 1;
}

+ (void)setStoragePoolMigrationDelay:(double)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setSetting:v4 forKey:@"NU_STORAGE_POOL_MIGRATION_DELAY"];
}

+ (double)storagePoolMigrationDelay
{
  uint64_t v2 = [a1 globalSettings];
  [v2 doubleSettingForKey:@"NU_STORAGE_POOL_MIGRATION_DELAY" defaultValue:&__block_literal_global_96];
  double v4 = v3;

  return v4;
}

double __45__NUGlobalSettings_storagePoolMigrationDelay__block_invoke()
{
  return 0.25;
}

+ (void)setStoragePoolPurgeableLimit:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_STORAGE_POOL_PURGEABLE_LIMIT"];
}

+ (int64_t)storagePoolPurgeableLimit
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_STORAGE_POOL_PURGEABLE_LIMIT" defaultValue:&__block_literal_global_90];

  return v3;
}

uint64_t __45__NUGlobalSettings_storagePoolPurgeableLimit__block_invoke()
{
  return 15;
}

+ (void)setStoragePoolNonPurgeableLimit:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_STORAGE_POOL_NONPURGEABLE_LIMIT"];
}

+ (int64_t)storagePoolNonPurgeableLimit
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_STORAGE_POOL_NONPURGEABLE_LIMIT" defaultValue:&__block_literal_global_85];

  return v3;
}

uint64_t __48__NUGlobalSettings_storagePoolNonPurgeableLimit__block_invoke()
{
  return 10;
}

+ (void)setResampleInSourceColorSpace:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RESAMPLE_IN_SOURCE_COLOR_SPACE"];
}

+ (BOOL)resampleInSourceColorSpace
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RESAMPLE_IN_SOURCE_COLOR_SPACE" defaultValue:&__block_literal_global_80];

  return v3;
}

uint64_t __46__NUGlobalSettings_resampleInSourceColorSpace__block_invoke()
{
  return 1;
}

+ (void)setDeviceDefaultSampleMode:(int64_t)a3
{
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithInteger:a3];
  [v5 setSetting:v4 forKey:@"NU_DEVICE_DEFAULT_SAMPLE_MODE"];
}

+ (int64_t)deviceDefaultSampleMode
{
  uint64_t v2 = [a1 globalSettings];
  int64_t v3 = [v2 integerSettingForKey:@"NU_DEVICE_DEFAULT_SAMPLE_MODE" defaultValue:&__block_literal_global_75];

  return v3;
}

uint64_t __43__NUGlobalSettings_deviceDefaultSampleMode__block_invoke()
{
  return 0;
}

+ (void)setDevicePrintRenderer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_DEVICE_PRINT_RENDERER"];
}

+ (BOOL)devicePrintRenderer
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_DEVICE_PRINT_RENDERER" defaultValue:&__block_literal_global_68];

  return v3;
}

uint64_t __39__NUGlobalSettings_devicePrintRenderer__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"NU_DEVICE_PRINT_RENDERER"];

  return v1;
}

+ (BOOL)deviceDisableMetal
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_DEVICE_DISABLE_METAL" defaultValue:&__block_literal_global_63];

  return v3;
}

uint64_t __38__NUGlobalSettings_deviceDisableMetal__block_invoke()
{
  return 0;
}

+ (void)setTempDir:(id)a3
{
  id v4 = a3;
  id v5 = [a1 globalSettings];
  [v5 setSetting:v4 forKey:@"NU_TEMP_DIR"];
}

+ (NSString)tempDir
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 stringSettingForKey:@"NU_TEMP_DIR" defaultValue:&__block_literal_global_51];

  return (NSString *)v3;
}

id __27__NUGlobalSettings_tempDir__block_invoke()
{
  v0 = NSString;
  uint64_t v1 = NSTemporaryDirectory();
  uint64_t v2 = [v0 stringWithFormat:@"%@%@", v1, @"/Neutrino"];

  return v2;
}

+ (void)setRenderJobDebugCapture5PercentOfJobs:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_5_PERCENT_OF_JOBS"];
}

+ (BOOL)renderJobDebugCapture5PercentOfJobs
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_5_PERCENT_OF_JOBS" defaultValue:&__block_literal_global_46];

  return v3;
}

uint64_t __55__NUGlobalSettings_renderJobDebugCapture5PercentOfJobs__block_invoke()
{
  return 0;
}

+ (void)setRenderJobDebugCaptureOnlyPerfStats:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_ONLY_PERF_STATS"];
}

+ (BOOL)renderJobDebugCaptureOnlyPerfStats
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_ONLY_PERF_STATS" defaultValue:&__block_literal_global_41];

  return v3;
}

uint64_t __54__NUGlobalSettings_renderJobDebugCaptureOnlyPerfStats__block_invoke()
{
  return 0;
}

+ (void)setRenderJobDebugCapturePerfStatHistory:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_PERF_STAT_HISTORY"];
}

+ (BOOL)renderJobDebugCapturePerfStatHistory
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_PERF_STAT_HISTORY" defaultValue:&__block_literal_global_36];

  return v3;
}

uint64_t __56__NUGlobalSettings_renderJobDebugCapturePerfStatHistory__block_invoke()
{
  return 0;
}

+ (void)setRenderJobDebugCaptureNodeCache:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_NODE_CACHE"];
}

+ (BOOL)renderJobDebugCaptureNodeCache
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_NODE_CACHE" defaultValue:&__block_literal_global_31];

  return v3;
}

uint64_t __50__NUGlobalSettings_renderJobDebugCaptureNodeCache__block_invoke()
{
  return 0;
}

+ (void)setRenderJobDebugCaptureNodeGraphs:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_NODE_GRAPHS"];
}

+ (BOOL)renderJobDebugCaptureNodeGraphs
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_NODE_GRAPHS" defaultValue:&__block_literal_global_26];

  return v3;
}

uint64_t __51__NUGlobalSettings_renderJobDebugCaptureNodeGraphs__block_invoke()
{
  return 0;
}

+ (void)setRenderJobDebugCaptureCanceledJobs:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_CANCELED_JOBS"];
}

+ (BOOL)renderJobDebugCaptureCanceledJobs
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_JOB_DEBUG_CAPTURE_CANCELED_JOBS" defaultValue:&__block_literal_global_21];

  return v3;
}

uint64_t __53__NUGlobalSettings_renderJobDebugCaptureCanceledJobs__block_invoke()
{
  return 0;
}

+ (void)setRenderJobDisableResultCache:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_JOB_DISABLE_RESULT_CACHE"];
}

+ (BOOL)renderJobDisableResultCache
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_JOB_DISABLE_RESULT_CACHE" defaultValue:&__block_literal_global_16_931];

  return v3;
}

uint64_t __47__NUGlobalSettings_renderJobDisableResultCache__block_invoke()
{
  return 0;
}

+ (void)setRenderJobDebug:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 globalSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setSetting:v4 forKey:@"NU_RENDER_JOB_DEBUG"];
}

+ (BOOL)renderJobDebug
{
  uint64_t v2 = [a1 globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"NU_RENDER_JOB_DEBUG" defaultValue:&__block_literal_global_11];

  return v3;
}

uint64_t __34__NUGlobalSettings_renderJobDebug__block_invoke()
{
  return 0;
}

+ (void)reset
{
  id v2 = [a1 globalSettings];
  [v2 reset];
}

@end