@interface PISegmentationLoader
+ (BOOL)clientIsMobileSlideShow;
+ (BOOL)currentDeviceSupportsSettlingEffect;
+ (BOOL)saveSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 toWallpaperURL:(id)a6 error:(id *)a7;
+ (BOOL)saveSegmentationItem:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (id)_loadSegmentationItemFromURL:(id)a3 error:(id *)a4;
+ (id)_loadSegmentationItemFromWallpaperURL:(id)a3 error:(id *)a4;
+ (id)generateLayerStackForItem:(id)a3 style:(id)a4 layout:(id)a5 options:(unint64_t)a6 enableSettlingEffect:(BOOL)a7 completion:(id)a8;
+ (id)livePhotoCompositionForVideoData:(id)a3 cropRect:(CGRect)a4 photoComposition:(id)a5;
+ (id)loadCompoundLayerStackFromWallpaperURL:(id)a3 options:(unint64_t)a4 error:(id *)specific;
+ (id)loadSegmentationItemFromURL:(id)a3 error:(id *)a4;
+ (id)loadSegmentationItemFromWallpaperURL:(id)a3 error:(id *)a4;
+ (id)loadStyleFromWallpaperURL:(id)a3 error:(id *)specific;
+ (id)proxyScalePolicy;
+ (id)reloadSegmentationItemFromWallpaperURL:(id)a3 asset:(id)a4 completion:(id)a5;
+ (id)renderPriorityForResourcePriority:(int64_t)a3;
+ (id)saveSegmentationItem:(id)a3 layerStackOptions:(unint64_t)a4 configuration:(id)a5 style:(id)a6 layout:(id)a7 toWallpaperURL:(id)a8 completion:(id)a9;
+ (id)segmentationCompositionForImageURL:(id)a3 fileUTI:(id)a4 orientation:(int64_t)a5 proxyImage:(CGImage *)a6;
+ (id)segmentationCompositionForProxyImage:(CGImage *)a3 orientation:(int64_t)a4;
+ (id)segmentationSourceForImageURL:(id)a3 fileUTI:(id)a4 orientation:(int64_t)a5 proxyImage:(CGImage *)a6;
+ (void)_ensureResources;
+ (void)_freeResources;
+ (void)_renderPreviewLayerStackFromWallpaperURL:(id)a3 styleCategory:(id)a4 completion:(id)a5;
+ (void)_saveSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 toWallpaperURL:(id)a6 completion:(id)a7;
+ (void)ensureResources;
+ (void)freeResources;
+ (void)initialize;
+ (void)renderPreviewLayerStackFromWallpaperURL:(id)a3 styleCategory:(id)a4 completion:(id)a5;
+ (void)warmUpClassificationDetectors;
+ (void)warmUpResources;
- (BOOL)_isValidSegmentationMatteHistogramForDepth:(id)a3;
- (BOOL)_shouldEnableSegmentationByDefault;
- (BOOL)_shouldEnableSettlingEffectByDefault;
- (BOOL)_shouldLoadSettlingEffectForItem:(id)a3;
- (BOOL)allowCachedLayoutConfigurationMismatch;
- (BOOL)disableCache;
- (BOOL)disableDownload;
- (BOOL)disableHeadroomLayout;
- (BOOL)disableRendering;
- (BOOL)disableSegmentation;
- (BOOL)disableSettlingEffect;
- (BOOL)loadFirstResourceOnly;
- (BOOL)performMediaAnalysisInProcess;
- (BOOL)preferFullResolutionResource;
- (BOOL)shouldUseInteractiveSettlingEffectGating;
- (NSArray)petsFaceRegions;
- (NSArray)petsRegions;
- (OS_dispatch_queue)loadingHandlerQueue;
- (PFParallaxAsset)asset;
- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration;
- (PIPosterLayoutProvider)layoutProvider;
- (PISegmentationLoader)initWithParallaxAsset:(id)a3;
- (PISegmentationLoader)initWithSegmentationItem:(id)a3 parallaxAsset:(id)a4;
- (id)_computeDefaultLayoutForItem:(id)a3 error:(id *)a4;
- (id)_defaultLayoutRequestForItem:(id)a3;
- (id)_tryLoadSegmentationItemFromCache:(id)a3;
- (id)currentContextInfo;
- (id)downloadProgressHandler;
- (id)loadingHandler;
- (int64_t)priority;
- (int64_t)settlingEffectGatingLevel;
- (int64_t)sourceMode;
- (unint64_t)classification;
- (unint64_t)role;
- (void)_abort:(id)a3;
- (void)_analyzeColors:(id)a3 completion:(id)a4;
- (void)_cacheSegmentationDataForItem:(id)a3;
- (void)_classify:(id)a3 completion:(id)a4;
- (void)_didLoad:(id)a3 completion:(id)a4;
- (void)_handlePartialItem:(id)a3 loadingState:(unint64_t)a4;
- (void)_load:(id)a3;
- (void)_loadAssetResource:(int64_t)a3 allowNetworkAccess:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (void)_loadAssetResource:(int64_t)a3 options:(id)a4 completion:(id)a5;
- (void)_loadAssetResourceForLiveOriginalWithCompletion:(id)a3;
- (void)_loadAssetResourceForProxy:(BOOL)a3 completion:(id)a4;
- (void)_loadBackground:(id)a3 completion:(id)a4;
- (void)_loadFinalResource:(id)a3 completion:(id)a4;
- (void)_loadFirstPreferredResource:(id)a3 completion:(id)a4;
- (void)_loadFullSizeResource:(id)a3 completion:(id)a4;
- (void)_loadItem:(id)a3 completion:(id)a4;
- (void)_loadLiveOriginalResource:(id)a3 completion:(id)a4;
- (void)_loadLocalLightData:(id)a3 completion:(id)a4;
- (void)_loadMotionScore:(id)a3 completion:(id)a4;
- (void)_loadProxyResource:(id)a3 completion:(id)a4;
- (void)_loadRegions:(id)a3 completion:(id)a4;
- (void)_loadSegmentationData:(id)a3 layoutGroup:(id)a4 completion:(id)a5;
- (void)_loadSettlingEffect:(id)a3 layoutGroup:(id)a4 completion:(id)a5;
- (void)_performLayout:(id)a3 completion:(id)a4;
- (void)_performSegmentation:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)_performSettlingEffectLayout:(id)a3 completion:(id)a4;
- (void)_segment:(id)a3 completion:(id)a4;
- (void)_updateItem:(id)a3 withSettlingEffectGatingFailures:(unint64_t)a4;
- (void)cancel;
- (void)loadSegmentationItemWithCompletion:(id)a3;
- (void)refreshSegmentationItem:(id)a3 completion:(id)a4;
- (void)setAllowCachedLayoutConfigurationMismatch:(BOOL)a3;
- (void)setClassification:(unint64_t)a3;
- (void)setDisableCache:(BOOL)a3;
- (void)setDisableDownload:(BOOL)a3;
- (void)setDisableHeadroomLayout:(BOOL)a3;
- (void)setDisableRendering:(BOOL)a3;
- (void)setDisableSegmentation:(BOOL)a3;
- (void)setDisableSettlingEffect:(BOOL)a3;
- (void)setDownloadProgressHandler:(id)a3;
- (void)setLayoutConfiguration:(id)a3;
- (void)setLayoutProvider:(id)a3;
- (void)setLoadFirstResourceOnly:(BOOL)a3;
- (void)setLoadingHandler:(id)a3;
- (void)setLoadingHandlerQueue:(id)a3;
- (void)setPerformMediaAnalysisInProcess:(BOOL)a3;
- (void)setPetsFaceRegions:(id)a3;
- (void)setPetsRegions:(id)a3;
- (void)setPreferFullResolutionResource:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRole:(unint64_t)a3;
- (void)setSettlingEffectGatingLevel:(int64_t)a3;
- (void)setSourceMode:(int64_t)a3;
@end

@implementation PISegmentationLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingHandlerQueue, 0);
  objc_storeStrong(&self->_loadingHandler, 0);
  objc_storeStrong(&self->_downloadProgressHandler, 0);
  objc_storeStrong((id *)&self->_petsFaceRegions, 0);
  objc_storeStrong((id *)&self->_petsRegions, 0);
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLoadingHandlerQueue:(id)a3
{
}

- (OS_dispatch_queue)loadingHandlerQueue
{
  return self->_loadingHandlerQueue;
}

- (void)setLoadingHandler:(id)a3
{
}

- (id)loadingHandler
{
  return self->_loadingHandler;
}

- (void)setDownloadProgressHandler:(id)a3
{
}

- (id)downloadProgressHandler
{
  return self->_downloadProgressHandler;
}

- (void)setPetsFaceRegions:(id)a3
{
}

- (NSArray)petsFaceRegions
{
  return self->_petsFaceRegions;
}

- (void)setPetsRegions:(id)a3
{
}

- (NSArray)petsRegions
{
  return self->_petsRegions;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setDisableHeadroomLayout:(BOOL)a3
{
  self->_disableHeadroomLayout = a3;
}

- (BOOL)disableHeadroomLayout
{
  return self->_disableHeadroomLayout;
}

- (void)setDisableDownload:(BOOL)a3
{
  self->_disableDownload = a3;
}

- (BOOL)disableDownload
{
  return self->_disableDownload;
}

- (void)setPreferFullResolutionResource:(BOOL)a3
{
  self->_preferFullResolutionResource = a3;
}

- (BOOL)preferFullResolutionResource
{
  return self->_preferFullResolutionResource;
}

- (void)setLoadFirstResourceOnly:(BOOL)a3
{
  self->_loadFirstResourceOnly = a3;
}

- (BOOL)loadFirstResourceOnly
{
  return self->_loadFirstResourceOnly;
}

- (void)setSettlingEffectGatingLevel:(int64_t)a3
{
  self->_settlingEffectGatingLevel = a3;
}

- (int64_t)settlingEffectGatingLevel
{
  return self->_settlingEffectGatingLevel;
}

- (void)setPerformMediaAnalysisInProcess:(BOOL)a3
{
  self->_performMediaAnalysisInProcess = a3;
}

- (BOOL)performMediaAnalysisInProcess
{
  return self->_performMediaAnalysisInProcess;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setAllowCachedLayoutConfigurationMismatch:(BOOL)a3
{
  self->_allowCachedLayoutConfigurationMismatch = a3;
}

- (BOOL)allowCachedLayoutConfigurationMismatch
{
  return self->_allowCachedLayoutConfigurationMismatch;
}

- (void)setDisableCache:(BOOL)a3
{
  self->_disableCache = a3;
}

- (BOOL)disableCache
{
  return self->_disableCache;
}

- (void)setLayoutProvider:(id)a3
{
}

- (PIPosterLayoutProvider)layoutProvider
{
  return self->_layoutProvider;
}

- (void)setDisableSettlingEffect:(BOOL)a3
{
  self->_disableSettlingEffect = a3;
}

- (BOOL)disableSettlingEffect
{
  return self->_disableSettlingEffect;
}

- (void)setDisableRendering:(BOOL)a3
{
  self->_disableRendering = a3;
}

- (BOOL)disableRendering
{
  return self->_disableRendering;
}

- (void)setDisableSegmentation:(BOOL)a3
{
  self->_disableSegmentation = a3;
}

- (BOOL)disableSegmentation
{
  return self->_disableSegmentation;
}

- (void)setLayoutConfiguration:(id)a3
{
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setClassification:(unint64_t)a3
{
  self->_classification = a3;
}

- (unint64_t)classification
{
  return self->_classification;
}

- (void)setSourceMode:(int64_t)a3
{
  self->_sourceMode = a3;
}

- (int64_t)sourceMode
{
  return self->_sourceMode;
}

- (PFParallaxAsset)asset
{
  return self->_asset;
}

- (void)_cacheSegmentationDataForItem:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_isCancelled && !self->_loadingError)
  {
    v5 = +[PIGlobalSettings globalSettings];
    if ([v5 segmentationDisableCaching])
    {
    }
    else
    {
      BOOL v6 = [(PISegmentationLoader *)self disableCache];

      if (!v6)
      {
        v7 = [v4 segmentationDataURL];

        if (!v7)
        {
          v8 = [(PISegmentationLoader *)self asset];
          int v9 = [v8 supportsSegmentationResourceCaching];

          if (v9)
          {
            v10 = [(PISegmentationLoader *)self asset];
            v11[0] = MEMORY[0x1E4F143A8];
            v11[1] = 3221225472;
            v11[2] = __54__PISegmentationLoader__cacheSegmentationDataForItem___block_invoke;
            v11[3] = &unk_1E5D81080;
            id v12 = v4;
            v13 = self;
            [v10 updateSegmentationResource:v11];
          }
        }
      }
    }
  }
}

uint64_t __54__PISegmentationLoader__cacheSegmentationDataForItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id)s_log_22531;
  v5 = v4;
  os_signpost_id_t v6 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PISegmentationLoader.data.write", "", buf, 2u);
  }

  v7 = *(void **)(a1 + 32);
  id v19 = 0;
  uint64_t v8 = [v7 saveSegmentationDataToURL:v3 error:&v19];
  id v9 = v19;
  v10 = (id)s_log_22531;
  v11 = v10;
  os_signpost_id_t v12 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PISegmentationLoader.data.write", "", buf, 2u);
  }

  if ((v8 & 1) == 0)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    v13 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(a1 + 40);
      v16 = v13;
      v17 = [v15 asset];
      v18 = [v17 localIdentifier];
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      __int16 v22 = 2114;
      id v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Failed to save segmentation data for asset: %{public}@, error:%{public}@", buf, 0x16u);
    }
  }

  return v8;
}

- (id)_tryLoadSegmentationItemFromCache:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v53 = NUAssertLogger_22535();
    id v15 = &unk_1A980A000;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "currentInfo != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)v60 = v54;
      _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v13 = (PIParallaxSegmentationItem *)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v5 = NUAssertLogger_22535();
    BOOL v55 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        specific = dispatch_get_specific(v13->super.isa);
        v56 = (void *)MEMORY[0x1E4F29060];
        id v15 = specific;
        v13 = [v56 callStackSymbols];
        v57 = [(PIParallaxSegmentationItem *)v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)v60 = specific;
        *(_WORD *)&v60[8] = 2114;
        uint64_t v61 = (uint64_t)v57;
        _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v55)
    {
      specific = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)v60 = v13;
      _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    goto LABEL_64;
  }
  v5 = v4;
  os_signpost_id_t v6 = +[PIGlobalSettings globalSettings];
  if ([v6 segmentationDisableCaching])
  {

LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_37;
  }
  BOOL v7 = [(PISegmentationLoader *)self disableCache];

  if (v7) {
    goto LABEL_5;
  }
  specific = [(PFParallaxAsset *)self->_asset segmentationResourceURL];
  if (specific)
  {
    v10 = (id)s_log_22531;
    v11 = v10;
    os_signpost_id_t signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v11, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.data.read", "", buf, 2u);
    }

    v13 = objc_alloc_init(PIParallaxSegmentationItem);
    id v58 = 0;
    BOOL v14 = [(PIParallaxSegmentationItem *)v13 loadSegmentationDataFromURL:specific error:&v58];
    id v15 = v58;
    v16 = (id)s_log_22531;
    v17 = v16;
    os_signpost_id_t v18 = self->_signpost;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PISegmentationLoader.data.read", "", buf, 2u);
    }

    if (v14)
    {
      id v19 = [(PIParallaxSegmentationItem *)v13 contextInfo];
      uint64_t v20 = [v19 version];
      if (v20 == [v5 version])
      {
        uint64_t v21 = [v19 sourceMode];
        if (v21 == [v5 sourceMode])
        {
          int v22 = [v19 segmentationDisabled];
          if (v22 != [v5 segmentationDisabled])
          {
            id v23 = NULogger_22543();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              int v24 = [v19 segmentationDisabled];
              int v25 = [v5 segmentationDisabled];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v60 = v24;
              *(_WORD *)&v60[4] = 1024;
              *(_DWORD *)&v60[6] = v25;
              v26 = "Cached segmentation disabled flag mismatch: got %d, expected %d";
              v27 = v23;
              uint32_t v28 = 14;
LABEL_31:
              _os_log_impl(&dword_1A9680000, v27, OS_LOG_TYPE_INFO, v26, buf, v28);
            }
LABEL_32:

LABEL_33:
            uint64_t v8 = 0;
LABEL_34:

LABEL_35:
            goto LABEL_36;
          }
          uint64_t v36 = [v19 infillAlgorithm];
          if (v36 == [v5 infillAlgorithm])
          {
            if (![(PISegmentationLoader *)self allowCachedLayoutConfigurationMismatch])
            {
              v37 = [v19 layoutConfiguration];
              v38 = [v5 layoutConfiguration];
              char v39 = [v37 isEqualToLayoutConfiguration:v38];

              if ((v39 & 1) == 0)
              {
                id v23 = NULogger_22543();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  v48 = [v19 layoutConfiguration];
                  v49 = [v5 layoutConfiguration];
                  *(_DWORD *)buf = 138543618;
                  *(void *)v60 = v48;
                  *(_WORD *)&v60[8] = 2114;
                  uint64_t v61 = (uint64_t)v49;
                  _os_log_impl(&dword_1A9680000, v23, OS_LOG_TYPE_INFO, "Cached segmentation layout configuration mismatch: got %{public}@, expected %{public}@", buf, 0x16u);
                }
                goto LABEL_32;
              }
            }
            if ([(PISegmentationLoader *)self classification])
            {
              unint64_t v40 = [(PISegmentationLoader *)self classification];
              if (v40 != [(PIParallaxSegmentationItem *)v13 classification])
              {
                v50 = NULogger_22543();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                {
                  [(PIParallaxSegmentationItem *)v13 classification];
                  v51 = PFPosterClassificationName();
                  [(PISegmentationLoader *)self classification];
                  v52 = PFPosterClassificationName();
                  *(_DWORD *)buf = 138543618;
                  *(void *)v60 = v51;
                  *(_WORD *)&v60[8] = 2114;
                  uint64_t v61 = (uint64_t)v52;
                  _os_log_impl(&dword_1A9680000, v50, OS_LOG_TYPE_INFO, "Cached segmentation classification mismatch: got %{public}@, expected %{public}@", buf, 0x16u);
                }
                goto LABEL_33;
              }
            }
            uint64_t v41 = [v5 role];
            if (v41 == [v19 role])
            {
              uint64_t v8 = v13;
              goto LABEL_34;
            }
            id v23 = NULogger_22543();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
              goto LABEL_32;
            }
            uint64_t v46 = [v5 role];
            uint64_t v47 = [v19 role];
            *(_DWORD *)buf = 134218240;
            *(void *)v60 = v46;
            *(_WORD *)&v60[8] = 2048;
            uint64_t v61 = v47;
            v26 = "Cached segmentation role mismatch: got %ld, expected %ld";
          }
          else
          {
            id v23 = NULogger_22543();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
              goto LABEL_32;
            }
            uint64_t v42 = [v19 infillAlgorithm];
            uint64_t v43 = [v5 infillAlgorithm];
            *(_DWORD *)buf = 134218240;
            *(void *)v60 = v42;
            *(_WORD *)&v60[8] = 2048;
            uint64_t v61 = v43;
            v26 = "Cached segmentation infill algorithm mismatch: got %ld, expected %ld";
          }
        }
        else
        {
          id v23 = NULogger_22543();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
            goto LABEL_32;
          }
          uint64_t v33 = [v19 sourceMode];
          uint64_t v34 = [v5 sourceMode];
          *(_DWORD *)buf = 134218240;
          *(void *)v60 = v33;
          *(_WORD *)&v60[8] = 2048;
          uint64_t v61 = v34;
          v26 = "Cached segmentation source mode mismatch: got %ld, expected %ld";
        }
      }
      else
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
        }
        v30 = (void *)*MEMORY[0x1E4F7A758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO)) {
          goto LABEL_33;
        }
        id v23 = v30;
        uint64_t v31 = [v19 version];
        uint64_t v32 = [v5 version];
        *(_DWORD *)buf = 134218240;
        *(void *)v60 = v31;
        *(_WORD *)&v60[8] = 2048;
        uint64_t v61 = v32;
        v26 = "Cached segmentation version mismatch: got %ld, expected %ld";
      }
      v27 = v23;
      uint32_t v28 = 22;
      goto LABEL_31;
    }
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_21:
      v29 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        v44 = v29;
        v45 = [specific path];
        *(_DWORD *)buf = 138543618;
        *(void *)v60 = v45;
        *(_WORD *)&v60[8] = 2114;
        uint64_t v61 = (uint64_t)v15;
        _os_log_error_impl(&dword_1A9680000, v44, OS_LOG_TYPE_ERROR, "Failed to read cached segmentation data from: %{public}@, error: %{public}@", buf, 0x16u);
      }
      uint64_t v8 = 0;
      goto LABEL_35;
    }
LABEL_64:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    goto LABEL_21;
  }
  uint64_t v8 = 0;
LABEL_36:

LABEL_37:
  return v8;
}

- (void)_loadLocalLightData:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void (**)(void))a4;
  uint64_t v8 = [v6 composition];

  if (!v8)
  {
    id v15 = NUAssertLogger_22535();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "item.composition != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v19 = NUAssertLogger_22535();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        id v23 = dispatch_get_specific(*v17);
        int v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v23;
        __int16 v33 = 2114;
        uint64_t v34 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v9 = [v6 localLightData];

  if (v9 || self->_isCancelled || [(PISegmentationLoader *)self disableRendering])
  {
    v7[2](v7);
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F7A4D8]);
    v11 = [v6 composition];
    os_signpost_id_t v12 = (void *)[v10 initWithComposition:v11 dataExtractor:@"CILocalLight" options:0];

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x40000];
    [v12 setScalePolicy:v13];

    [v12 setSampleMode:1];
    [v12 setResponseQueue:self->_queue];
    [v12 setRenderContext:self->_renderContext];
    BOOL v14 = objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
    [v12 setPriority:v14];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __55__PISegmentationLoader__loadLocalLightData_completion___block_invoke;
    v28[3] = &unk_1E5D81798;
    id v29 = v6;
    v30 = v7;
    [v12 submit:v28];
  }
}

void __55__PISegmentationLoader__loadLocalLightData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Local light data response: %{public}@", buf, 0xCu);
  }
  id v11 = 0;
  BOOL v7 = [v3 result:&v11];
  id v8 = v11;
  if (v7)
  {
    id v9 = [v7 data];
    [*(id *)(a1 + 32) setLocalLightData:v9];
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Failed to compute local light data: %{public}@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateItem:(id)a3 withSettlingEffectGatingFailures:(unint64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 scores];
  uint64_t v7 = *MEMORY[0x1E4F8D200];
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D200]];

  uint64_t v9 = [v8 unsignedIntegerValue];
  uint64_t v12 = v7;
  id v10 = [NSNumber numberWithUnsignedInteger:v9 | a4];
  v13[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v5 updateScores:v11];
}

- (void)_performSettlingEffectLayout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = [v6 settlingEffectLayout];

  if (v8 || self->_isCancelled || [(PISegmentationLoader *)self disableRendering])
  {
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v9 = [(PISegmentationLoader *)self _defaultLayoutRequestForItem:v6];
    [v9 setShouldComputeAllScores:0];
    [v9 setShouldConstrainLayoutToBounds:1];
    [v6 settlingEffectNormalizedBounds];
    objc_msgSend(v9, "setNormalizedLayoutBounds:");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__PISegmentationLoader__performSettlingEffectLayout_completion___block_invoke;
    v10[3] = &unk_1E5D81798;
    id v11 = v6;
    uint64_t v12 = v7;
    [v9 submit:v10];
  }
}

void __64__PISegmentationLoader__performSettlingEffectLayout_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Poster settling effect layout response: %{public}@", buf, 0xCu);
  }
  id v15 = 0;
  uint64_t v7 = [v3 result:&v15];
  id v8 = v15;
  if (v7)
  {
    uint64_t v9 = [v7 scores];
    id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F8D180]];

    id v11 = *(void **)(a1 + 32);
    uint64_t v16 = *MEMORY[0x1E4F8D208];
    v17 = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v11 updateScores:v12];

    id v13 = [v7 layout];
    [*(id *)(a1 + 32) setSettlingEffectLayout:v13];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v8;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Failed to layout item: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_performLayout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v8 = [v6 originalLayout];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    if ((PFPosterEnableHeadroom() & 1) == 0)
    {

      goto LABEL_10;
    }
    id v10 = [v6 headroomLayout];

    if (v10) {
      goto LABEL_10;
    }
  }
  if (self->_isCancelled)
  {
LABEL_10:
    v7[2](v7, 0);
    goto LABEL_11;
  }
  id v11 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__22558;
  v31[4] = __Block_byref_object_dispose__22559;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__22558;
  v29[4] = __Block_byref_object_dispose__22559;
  id v30 = 0;
  dispatch_group_enter(v11);
  uint64_t v12 = [(PISegmentationLoader *)self _defaultLayoutRequestForItem:v6];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50__PISegmentationLoader__performLayout_completion___block_invoke;
  v25[3] = &unk_1E5D81030;
  id v13 = v6;
  id v26 = v13;
  uint32_t v28 = v31;
  uint64_t v14 = v11;
  v27 = v14;
  [v12 submit:v25];

  if (PFPosterEnableHeadroom() && !self->_disableHeadroomLayout)
  {
    dispatch_group_enter(v14);
    id v15 = [(PISegmentationLoader *)self _defaultLayoutRequestForItem:v13];
    [v15 setShouldConsiderHeadroom:1];
    [v15 setShouldComputeAllScores:0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__PISegmentationLoader__performLayout_completion___block_invoke_166;
    v21[3] = &unk_1E5D81030;
    id v22 = v13;
    int v24 = v29;
    id v23 = v14;
    [v15 submit:v21];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PISegmentationLoader__performLayout_completion___block_invoke_167;
  block[3] = &unk_1E5D81290;
  os_signpost_id_t v18 = v7;
  id v19 = v29;
  uint64_t v20 = v31;
  dispatch_group_notify(v14, queue, block);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

LABEL_11:
}

void __50__PISegmentationLoader__performLayout_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Poster original layout response: %{public}@", buf, 0xCu);
  }
  id v15 = 0;
  uint64_t v7 = [v3 result:&v15];
  id v8 = v15;
  if (v7)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = [v7 scores];
    [v9 updateScores:v10];

    id v11 = [v7 layout];
    [*(id *)(a1 + 32) setOriginalLayout:v11];
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v8;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Failed to layout item: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = v8;
    id v11 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __50__PISegmentationLoader__performLayout_completion___block_invoke_166(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Poster headroom layout response: %{public}@", buf, 0xCu);
  }
  id v13 = 0;
  uint64_t v7 = [v3 result:&v13];
  id v8 = v13;
  if (v7)
  {
    uint64_t v9 = [v7 layout];
    [*(id *)(a1 + 32) setHeadroomLayout:v9];
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Failed to layout item with headroom: %{public}@", buf, 0xCu);
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = v8;
    uint64_t v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __50__PISegmentationLoader__performLayout_completion___block_invoke_167(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
  if (!v3) {
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (void)refreshSegmentationItem:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = NUAssertLogger_22535();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[item isKindOfClass:PIParallaxSegmentationItem.class]");
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v22 = NUAssertLogger_22535();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        id v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        id v29 = [v27 callStackSymbols];
        id v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v26;
        __int16 v36 = 2114;
        v37 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      int v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v25;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v8 = [v6 layoutConfiguration];
  uint64_t v9 = [(PISegmentationLoader *)self layoutConfiguration];
  int v10 = [v8 isEqualToLayoutConfiguration:v9];

  if (v10)
  {
    v7[2](v7, v6);
  }
  else
  {
    uint64_t v11 = (void *)[v6 copy];
    dispatch_group_t v12 = dispatch_group_create();
    [v11 setOriginalLayout:0];
    [v11 setColorAnalysis:0];
    id v13 = [(PISegmentationLoader *)self currentContextInfo];
    [v11 setContextInfo:v13];

    id v14 = (id)s_log_22531;
    id v15 = v14;
    os_signpost_id_t signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v15, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.refresh", "", buf, 2u);
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __59__PISegmentationLoader_refreshSegmentationItem_completion___block_invoke;
    v31[3] = &unk_1E5D80CC8;
    v31[4] = self;
    id v32 = v11;
    __int16 v33 = v7;
    id v17 = v11;
    [(PISegmentationLoader *)self _loadSegmentationData:v17 layoutGroup:v12 completion:v31];
  }
}

uint64_t __59__PISegmentationLoader_refreshSegmentationItem_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id)s_log_22531;
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.refresh", "", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_defaultLayoutRequestForItem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 composition];

  if (!v5)
  {
    uint64_t v16 = NUAssertLogger_22535();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [NSString stringWithFormat:@"Missing composition"];
      int v29 = 138543362;
      id v30 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v29, 0xCu);
    }
    uint64_t v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v20 = NUAssertLogger_22535();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        int v24 = dispatch_get_specific(*v18);
        id v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        id v28 = [v27 componentsJoinedByString:@"\n"];
        int v29 = 138543618;
        id v30 = v24;
        __int16 v31 = 2114;
        id v32 = v28;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v29, 0x16u);
      }
    }
    else if (v21)
    {
      id v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      int v29 = 138543362;
      id v30 = v23;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v29, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v6 = [PIPosterLayoutRequest alloc];
  uint64_t v7 = [v4 composition];
  id v8 = [(PIPosterLayoutRequest *)v6 initWithComposition:v7];

  uint64_t v9 = [(PISegmentationLoader *)self layoutProvider];
  [(PIPosterLayoutRequest *)v8 setLayoutProvider:v9];

  int v10 = [(PISegmentationLoader *)self layoutConfiguration];
  [(PIPosterLayoutRequest *)v8 setLayoutConfiguration:v10];

  uint64_t v11 = [v4 regions];
  [(PIPosterLayoutRequest *)v8 setLayoutRegions:v11];

  dispatch_group_t v12 = [v4 segmentationMatte];
  [(PIPosterLayoutRequest *)v8 setSegmentationMatte:v12];

  id v13 = [v4 segmentationConfidenceMap];
  [(PIPosterLayoutRequest *)v8 setSegmentationConfidenceMap:v13];

  -[PIPosterLayoutRequest setSegmentationClassification:](v8, "setSegmentationClassification:", [v4 classification]);
  [(NURenderRequest *)v8 setResponseQueue:self->_queue];
  [(NURenderRequest *)v8 setRenderContext:self->_renderContext];
  id v14 = objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
  [(NURenderRequest *)v8 setPriority:v14];

  return v8;
}

- (void)_loadRegions:(id)a3 completion:(id)a4
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = [v6 regions];

  if (v8 || self->_isCancelled)
  {
    v7[2](v7);
  }
  else
  {
    uint64_t v9 = [v6 composition];

    if (!v9)
    {
      char v39 = NUAssertLogger_22535();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        unint64_t v40 = [NSString stringWithFormat:@"Missing composition"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v40;
        _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      uint64_t v41 = (const void **)MEMORY[0x1E4F7A308];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      uint64_t v43 = NUAssertLogger_22535();
      BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v44)
        {
          uint64_t v47 = dispatch_get_specific(*v41);
          v48 = (void *)MEMORY[0x1E4F29060];
          id v49 = v47;
          v50 = [v48 callStackSymbols];
          v51 = [v50 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v47;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v51;
          _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v44)
      {
        v45 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v46;
        _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
      __break(1u);
    }
    int v10 = dispatch_group_create();
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x4010000000;
    v108 = &unk_1A984BDE3;
    long long v109 = 0u;
    long long v110 = 0u;
    [(PFParallaxAsset *)self->_asset acceptableCropRect];
    *(void *)&long long v109 = v12;
    *((void *)&v109 + 1) = v13;
    *(void *)&long long v110 = v14;
    *((void *)&v110 + 1) = v15;
    if (CGRectIsEmpty(*(CGRect *)(*(void *)&buf[8] + 32)))
    {
      id v52 = objc_alloc_init(MEMORY[0x1E4F45848]);
      [v11 addObject:v52];
    }
    else
    {
      id v52 = 0;
    }
    uint64_t v101 = 0;
    v102 = (CGRect *)&v101;
    uint64_t v103 = 0x4010000000;
    v104 = &unk_1A984BDE3;
    long long v105 = 0u;
    long long v106 = 0u;
    [(PFParallaxAsset *)self->_asset preferredCropRect];
    *(void *)&long long v105 = v16;
    *((void *)&v105 + 1) = v17;
    *(void *)&long long v106 = v18;
    *((void *)&v106 + 1) = v19;
    if (CGRectIsEmpty(v102[1]))
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F45820]);
      [v11 addObject:v20];
    }
    else
    {
      id v20 = 0;
    }
    uint64_t v95 = 0;
    v96 = (CGRect *)&v95;
    uint64_t v97 = 0x4010000000;
    v98 = &unk_1A984BDE3;
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v99 = *MEMORY[0x1E4F1DB20];
    long long v100 = v21;
    if ([v6 classification] == 1
      && ([(PFParallaxAsset *)self->_asset gazeAreaRect], v96[1] = v112, CGRectIsNull(v112)))
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F45790]);
      [v11 addObject:v22];
    }
    else
    {
      id v22 = 0;
    }
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x3032000000;
    v92 = __Block_byref_object_copy__22558;
    v93 = __Block_byref_object_dispose__22559;
    id v94 = 0;
    if ([v6 classification] == 1
      && ([(PFParallaxAsset *)self->_asset faceRegions],
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          int v24 = (void *)v90[5],
          v90[5] = v23,
          v24,
          !v90[5]))
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F457A8]);
      [v11 addObject:v25];
    }
    else
    {
      id v25 = 0;
    }
    uint64_t v83 = 0;
    v84 = (id *)&v83;
    uint64_t v85 = 0x3032000000;
    v86 = __Block_byref_object_copy__22558;
    v87 = __Block_byref_object_dispose__22559;
    id v88 = 0;
    uint64_t v77 = 0;
    v78 = (id *)&v77;
    uint64_t v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__22558;
    v81 = __Block_byref_object_dispose__22559;
    id v82 = 0;
    if ([v6 classification] == 2)
    {
      petsRegions = self->_petsRegions;
      if (petsRegions)
      {
        v27 = self->_petsRegions;
      }
      else
      {
        v27 = [(PFParallaxAsset *)self->_asset petRegions];
      }
      objc_storeStrong(v84 + 5, v27);
      if (!petsRegions) {

      }
      petsFaceRegions = self->_petsFaceRegions;
      if (petsFaceRegions)
      {
        int v29 = self->_petsFaceRegions;
      }
      else
      {
        int v29 = [(PFParallaxAsset *)self->_asset faceRegions];
      }
      objc_storeStrong(v78 + 5, v29);
      if (!petsFaceRegions) {

      }
      if ((!v84[5] || !v78[5]) && ![(PISegmentationLoader *)self disableRendering] && self->_asset)
      {
        dispatch_group_enter(v10);
        id v30 = objc_alloc_init(MEMORY[0x1E4F8CC60]);
        objc_msgSend(v30, "setNeedsInProcessHandling:", -[PISegmentationLoader performMediaAnalysisInProcess](self, "performMediaAnalysisInProcess"));
        asset = self->_asset;
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __48__PISegmentationLoader__loadRegions_completion___block_invoke;
        v73[3] = &unk_1E5D80FB8;
        v73[4] = self;
        v75 = &v83;
        v76 = &v77;
        v74 = v10;
        self->_petsRequestID = [(PFParallaxAsset *)asset loadPetsRegionsWithOptions:v30 resultHandler:v73];
      }
    }
    if ([v11 count] && !-[PISegmentationLoader disableRendering](self, "disableRendering"))
    {
      dispatch_group_enter(v10);
      id v32 = objc_alloc(MEMORY[0x1E4F7A720]);
      uint64_t v33 = [v6 composition];
      uint64_t v34 = (void *)[v32 initWithComposition:v33];

      [v34 setVisionRequests:v11];
      uint64_t v35 = [(id)objc_opt_class() proxyScalePolicy];
      [v34 setScalePolicy:v35];

      __int16 v36 = +[PIPhotoEditHelper pipelineFiltersForShowingOriginalWithGeometry];
      [v34 setPipelineFilters:v36];

      [v34 setResponseQueue:self->_queue];
      [v34 setRenderContext:self->_renderContext];
      v37 = objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
      [v34 setPriority:v37];

      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __48__PISegmentationLoader__loadRegions_completion___block_invoke_160;
      v63[3] = &unk_1E5D80FE0;
      id v64 = v53;
      v69 = buf;
      id v65 = v20;
      v70 = &v101;
      id v66 = v25;
      v71 = &v89;
      id v67 = v22;
      v72 = &v95;
      v68 = v10;
      [v34 submit:v63];
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PISegmentationLoader__loadRegions_completion___block_invoke_163;
    block[3] = &unk_1E5D81008;
    v57 = &v89;
    id v58 = &v77;
    v59 = buf;
    v60 = &v101;
    uint64_t v61 = &v95;
    uint64_t v62 = &v83;
    id v55 = v6;
    v56 = v7;
    dispatch_group_notify(v10, queue, block);

    _Block_object_dispose(&v77, 8);
    _Block_object_dispose(&v83, 8);

    _Block_object_dispose(&v89, 8);
    _Block_object_dispose(&v95, 8);

    _Block_object_dispose(&v101, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __48__PISegmentationLoader__loadRegions_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  *(_DWORD *)(*(void *)(a1 + 32) + 32) = 0;
  id v11 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  uint64_t v12 = (os_log_t *)MEMORY[0x1E4F7A758];
  uint64_t v13 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_1A9680000, v13, OS_LOG_TYPE_DEFAULT, "MAD pets results: %@, pets face results: %@, error: %@", (uint8_t *)&v15, 0x20u);
  }
  if (v8 && v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  else
  {
    if (*v11 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v14 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      id v16 = v10;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Failed to load pets regions: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __48__PISegmentationLoader__loadRegions_completion___block_invoke_160(uint64_t a1, void *a2)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v5 = (NSObject **)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v99 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Vision detection response: %@", buf, 0xCu);
  }
  id v93 = 0;
  uint64_t v7 = [v3 result:&v93];
  id v8 = v93;
  if (v7)
  {
    id v75 = v3;
    id v9 = *(void **)(a1 + 32);
    id v10 = (_OWORD *)MEMORY[0x1E4F1DB20];
    if (v9)
    {
      id v11 = v8;
      uint64_t v12 = [v9 results];
      uint64_t v13 = [v12 firstObject];

      uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
      long long v15 = v10[1];
      *(_OWORD *)(v14 + 32) = *v10;
      *(_OWORD *)(v14 + 48) = v15;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v16 = [v13 salientObjects];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v89 objects:v97 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v90 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(CGRect **)(*(void *)(a1 + 72) + 8);
            [*(id *)(*((void *)&v89 + 1) + 8 * i) boundingBox];
            v101.origin.x = v22;
            v101.origin.y = v23;
            v101.size.width = v24;
            v101.size.height = v25;
            *(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = CGRectUnion(v21[1], v101);
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v89 objects:v97 count:16];
        }
        while (v18);
      }

      id v8 = v11;
    }
    id v26 = *(void **)(a1 + 40);
    if (v26)
    {
      v27 = [v26 results];
      id v28 = [v27 firstObject];

      uint64_t v29 = *(void *)(*(void *)(a1 + 80) + 8);
      long long v30 = v10[1];
      *(_OWORD *)(v29 + 32) = *v10;
      *(_OWORD *)(v29 + 48) = v30;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      __int16 v31 = [v28 salientObjects];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v85 objects:v96 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v86;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v86 != v34) {
              objc_enumerationMutation(v31);
            }
            __int16 v36 = *(CGRect **)(*(void *)(a1 + 80) + 8);
            [*(id *)(*((void *)&v85 + 1) + 8 * j) boundingBox];
            v102.origin.x = v37;
            v102.origin.y = v38;
            v102.size.width = v39;
            v102.size.height = v40;
            *(CGRect *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = CGRectUnion(v36[1], v102);
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v85 objects:v96 count:16];
        }
        while (v33);
      }
    }
    uint64_t v41 = *(void **)(a1 + 48);
    id v3 = v75;
    if (v41)
    {
      id v73 = v8;
      v74 = v7;
      uint64_t v42 = [v41 results];
      uint64_t v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v42, "count"));
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v44 = v42;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v81 objects:v95 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v82;
        do
        {
          for (uint64_t k = 0; k != v46; ++k)
          {
            if (*(void *)v82 != v47) {
              objc_enumerationMutation(v44);
            }
            [*(id *)(*((void *)&v81 + 1) + 8 * k) boundingBox];
            v80[0] = v49;
            v80[1] = v50;
            v80[2] = v51;
            v80[3] = v52;
            v53 = [MEMORY[0x1E4F29238] valueWithBytes:v80 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
            [v43 addObject:v53];
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v81 objects:v95 count:16];
        }
        while (v46);
      }

      uint64_t v54 = [v43 copy];
      uint64_t v55 = *(void *)(*(void *)(a1 + 88) + 8);
      v56 = *(void **)(v55 + 40);
      *(void *)(v55 + 40) = v54;

      id v8 = v73;
      uint64_t v7 = v74;
    }
    v57 = *(void **)(a1 + 56);
    if (v57)
    {
      id v58 = [v57 results];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      uint64_t v59 = [v58 countByEnumeratingWithState:&v76 objects:v94 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v77;
        do
        {
          for (uint64_t m = 0; m != v60; ++m)
          {
            if (*(void *)v77 != v61) {
              objc_enumerationMutation(v58);
            }
            v63 = [*(id *)(*((void *)&v76 + 1) + 8 * m) gaze];
            [v63 locationBounds];
            CGFloat v65 = v64;
            CGFloat v67 = v66;
            CGFloat v69 = v68;
            CGFloat v71 = v70;

            v103.origin.x = v65;
            v103.origin.y = v67;
            v103.size.width = v69;
            v103.size.height = v71;
            *(CGRect *)(*(void *)(*(void *)(a1 + 96) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 96)+ 8)+ 32), v103);
          }
          uint64_t v60 = [v58 countByEnumeratingWithState:&v76 objects:v94 count:16];
        }
        while (v60);
      }
    }
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    v72 = *v5;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v99 = v8;
      _os_log_error_impl(&dword_1A9680000, v72, OS_LOG_TYPE_ERROR, "Failed to run face/saliency detection: %{public}@", buf, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __48__PISegmentationLoader__loadRegions_completion___block_invoke_163(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v2 + 40);
  id v3 = (id *)(v2 + 40);
  id v4 = v5;
  if (!v5) {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  objc_storeStrong(v3, v4);
  id v6 = [PISegmentationLayoutRegions alloc];
  uint64_t v7 = *(double **)(*(void *)(a1 + 64) + 8);
  id v8 = *(double **)(*(void *)(a1 + 72) + 8);
  id v9 = *(void **)(*(void *)(a1 + 80) + 8);
  id v10 = -[PISegmentationLayoutRegions initWithAcceptableRect:preferredRect:gazeAreaRect:faces:pets:](v6, "initWithAcceptableRect:preferredRect:gazeAreaRect:faces:pets:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v7[4], v7[5], v7[6], v7[7], v8[4], v8[5], v8[6], v8[7], v9[4], v9[5], v9[6], v9[7]);
  [*(id *)(a1 + 32) setRegions:v10];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_loadBackground:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = [v6 segmentationBackground];

  if (v8 || self->_isCancelled) {
    goto LABEL_8;
  }
  id v9 = +[PIGlobalSettings globalSettings];
  uint64_t v10 = [v9 segmentationInfillAlgorithm];

  BOOL v11 = v10 == 5 || v10 == 0;
  if (v11
    || ([v6 segmentationMatte], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
LABEL_8:
    v7[2](v7);
  }
  else
  {
    uint64_t v13 = [v6 composition];

    if (!v13)
    {
      uint64_t v21 = NUAssertLogger_22535();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        CGFloat v22 = [NSString stringWithFormat:@"Missing composition"];
        *(_DWORD *)buf = 138543362;
        CGFloat v38 = v22;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      CGFloat v23 = (const void **)MEMORY[0x1E4F7A308];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      CGFloat v25 = NUAssertLogger_22535();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v26)
        {
          uint64_t v29 = dispatch_get_specific(*v23);
          long long v30 = (void *)MEMORY[0x1E4F29060];
          id v31 = v29;
          uint64_t v32 = [v30 callStackSymbols];
          uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          CGFloat v38 = v29;
          __int16 v39 = 2114;
          CGFloat v40 = v33;
          _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v26)
      {
        v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        CGFloat v38 = v28;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
    }
    uint64_t v14 = [PIParallaxInfillRequest alloc];
    long long v15 = [v6 composition];
    id v16 = [(PIParallaxInfillRequest *)v14 initWithComposition:v15];

    uint64_t v17 = [v6 segmentationMatte];
    [(PIParallaxInfillRequest *)v16 setSegmentationMatte:v17];

    BOOL v18 = [v6 classification] == 3 || objc_msgSend(v6, "classification") == 4;
    [(PIParallaxInfillRequest *)v16 setShouldInfillForeground:v18];
    uint64_t v19 = [(id)objc_opt_class() proxyScalePolicy];
    [(PIParallaxInfillRequest *)v16 setScalePolicy:v19];

    [(NURenderRequest *)v16 setResponseQueue:self->_queue];
    [(NURenderRequest *)v16 setRenderContext:self->_renderContext];
    id v20 = objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
    [(NURenderRequest *)v16 setPriority:v20];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __51__PISegmentationLoader__loadBackground_completion___block_invoke;
    v34[3] = &unk_1E5D81798;
    id v35 = v6;
    __int16 v36 = v7;
    [(PIParallaxInfillRequest *)v16 submit:v34];
  }
}

void __51__PISegmentationLoader__loadBackground_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Parallax infill response: %@", buf, 0xCu);
  }
  id v11 = 0;
  uint64_t v7 = [v3 result:&v11];
  id v8 = v11;
  if (v7)
  {
    id v9 = [v7 infilledImage];
    [*(id *)(a1 + 32) setSegmentationBackground:v9];
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Parallax infill failed: %{public}@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_analyzeColors:(id)a3 completion:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = [v6 colorAnalysis];

  if (v8 || self->_isCancelled || [(PISegmentationLoader *)self disableRendering])
  {
    v7[2](v7);
    goto LABEL_5;
  }
  id v9 = [v6 composition];

  if (!v9)
  {
    uint64_t v49 = NUAssertLogger_22535();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = [NSString stringWithFormat:@"Missing composition"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v50;
      _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v51 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v53 = NUAssertLogger_22535();
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v54)
      {
        uint64_t v62 = dispatch_get_specific(*v51);
        v63 = (void *)MEMORY[0x1E4F29060];
        id v64 = v62;
        CGFloat v65 = [v63 callStackSymbols];
        double v66 = [v65 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v62;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v66;
        _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v54)
    {
LABEL_23:
      uint64_t v60 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v61 = [v60 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v61;
      _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_29:

    _NUAssertFailHandler();
    __break(1u);
  }
  uint64_t v10 = [v6 originalLayout];

  if (!v10)
  {
    uint64_t v55 = NUAssertLogger_22535();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v56 = [NSString stringWithFormat:@"Missing original layout"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v56;
      _os_log_error_impl(&dword_1A9680000, v55, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v57 = (const void **)MEMORY[0x1E4F7A308];
    id v58 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v53 = NUAssertLogger_22535();
    BOOL v59 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (!v58)
    {
      if (!v59) {
        goto LABEL_29;
      }
      goto LABEL_23;
    }
    if (v59)
    {
      CGFloat v67 = dispatch_get_specific(*v57);
      double v68 = (void *)MEMORY[0x1E4F29060];
      id v69 = v67;
      double v70 = [v68 callStackSymbols];
      CGFloat v71 = [v70 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v67;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v71;
      _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_29;
  }
  id v11 = [v6 originalLayout];
  uint64_t v12 = [v11 portraitLayout];

  [v12 imageSize];
  [v12 visibleFrame];
  NURectNormalize();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [v12 timeFrame];
  NURectNormalize();
  uint64_t v72 = v21;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v83 = __Block_byref_object_copy__22558;
  long long v84 = __Block_byref_object_dispose__22559;
  long long v85 = objc_alloc_init(PIParallaxColorAnalysis);
  id v28 = objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
  [MEMORY[0x1E4F7A648] begin];
  uint64_t v29 = [PIParallaxColorAnalysisRequest alloc];
  long long v30 = [v6 composition];
  id v31 = [(PIParallaxColorAnalysisRequest *)v29 initWithComposition:v30];

  [(PIParallaxColorAnalysisRequest *)v31 setSegmentationMatte:0];
  [(PIParallaxColorAnalysisRequest *)v31 setAnalyzeBackground:1];
  -[PIParallaxColorAnalysisRequest setNormalizedClipRect:](v31, "setNormalizedClipRect:", v14, v16, v18, v20);
  uint64_t v32 = [v6 segmentationMatte];
  if (v32) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 5;
  }
  -[PIParallaxColorAnalysisRequest setMaxDominantColors:](v31, "setMaxDominantColors:", v33, v72);

  [(NURenderRequest *)v31 setResponseQueue:self->_queue];
  [(NURenderRequest *)v31 setRenderContext:self->_renderContext];
  [(NURenderRequest *)v31 setPriority:v28];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __50__PISegmentationLoader__analyzeColors_completion___block_invoke;
  v81[3] = &unk_1E5D81268;
  v81[4] = buf;
  [(PIParallaxColorAnalysisRequest *)v31 submit:v81];
  uint64_t v34 = [v6 segmentationMatte];
  BOOL v35 = v34 == 0;

  if (!v35)
  {
    __int16 v36 = [PIParallaxColorAnalysisRequest alloc];
    CGFloat v37 = [v6 composition];
    CGFloat v38 = [(PIParallaxColorAnalysisRequest *)v36 initWithComposition:v37];

    __int16 v39 = [v6 segmentationMatte];
    [(PIParallaxColorAnalysisRequest *)v38 setSegmentationMatte:v39];

    [(PIParallaxColorAnalysisRequest *)v38 setAnalyzeBackground:0];
    -[PIParallaxColorAnalysisRequest setNormalizedClipRect:](v38, "setNormalizedClipRect:", v14, v16, v18, v20);
    [(PIParallaxColorAnalysisRequest *)v38 setMaxDominantColors:5];
    [(NURenderRequest *)v38 setResponseQueue:self->_queue];
    [(NURenderRequest *)v38 setRenderContext:self->_renderContext];
    [(NURenderRequest *)v38 setPriority:v28];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __50__PISegmentationLoader__analyzeColors_completion___block_invoke_147;
    v80[3] = &unk_1E5D81268;
    void v80[4] = buf;
    [(PIParallaxColorAnalysisRequest *)v38 submit:v80];
    CGFloat v40 = [PIParallaxColorAnalysisRequest alloc];
    uint64_t v41 = [v6 composition];
    uint64_t v42 = [(PIParallaxColorAnalysisRequest *)v40 initWithComposition:v41];

    uint64_t v43 = [v6 segmentationMatte];
    [(PIParallaxColorAnalysisRequest *)v42 setSegmentationMatte:v43];

    [(PIParallaxColorAnalysisRequest *)v42 setAnalyzeBackground:1];
    -[PIParallaxColorAnalysisRequest setNormalizedClipRect:](v42, "setNormalizedClipRect:", v14, v16, v18, v20);
    [(PIParallaxColorAnalysisRequest *)v42 setMaxDominantColors:5];
    [(NURenderRequest *)v42 setResponseQueue:self->_queue];
    [(NURenderRequest *)v42 setRenderContext:self->_renderContext];
    [(NURenderRequest *)v42 setPriority:v28];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __50__PISegmentationLoader__analyzeColors_completion___block_invoke_148;
    v79[3] = &unk_1E5D81268;
    v79[4] = buf;
    [(PIParallaxColorAnalysisRequest *)v42 submit:v79];
  }
  id v44 = [PIParallaxColorAnalysisRequest alloc];
  uint64_t v45 = [v6 composition];
  uint64_t v46 = [(PIParallaxColorAnalysisRequest *)v44 initWithComposition:v45];

  [(PIParallaxColorAnalysisRequest *)v46 setSegmentationMatte:0];
  [(PIParallaxColorAnalysisRequest *)v46 setAnalyzeBackground:1];
  -[PIParallaxColorAnalysisRequest setNormalizedClipRect:](v46, "setNormalizedClipRect:", v73, v23, v25, v27);
  [(PIParallaxColorAnalysisRequest *)v46 setMaxDominantColors:1];
  [(NURenderRequest *)v46 setResponseQueue:self->_queue];
  [(NURenderRequest *)v46 setRenderContext:self->_renderContext];
  [(NURenderRequest *)v46 setPriority:v28];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __50__PISegmentationLoader__analyzeColors_completion___block_invoke_149;
  v78[3] = &unk_1E5D81268;
  v78[4] = buf;
  [(PIParallaxColorAnalysisRequest *)v46 submit:v78];
  uint64_t v47 = (void *)MEMORY[0x1E4F7A648];
  queue = self->_queue;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __50__PISegmentationLoader__analyzeColors_completion___block_invoke_150;
  v74[3] = &unk_1E5D80F90;
  id v75 = v6;
  long long v77 = buf;
  long long v76 = v7;
  [v47 commitAndNotifyOnQueue:queue withBlock:v74];

  _Block_object_dispose(buf, 8);
LABEL_5:
}

void __50__PISegmentationLoader__analyzeColors_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Full Image color analysis response: %@", buf, 0xCu);
  }
  id v12 = 0;
  uint64_t v7 = [v3 result:&v12];
  id v8 = v12;
  if (v7)
  {
    [v7 medianLuminance];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setLuminance:");
    id v9 = [v7 dominantColors];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setColors:v9];
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Full Image color analysis failed: %{public}@", buf, 0xCu);
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

void __50__PISegmentationLoader__analyzeColors_completion___block_invoke_147(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Foreground color analysis response: %@", buf, 0xCu);
  }
  id v12 = 0;
  uint64_t v7 = [v3 result:&v12];
  id v8 = v12;
  if (v7)
  {
    [v7 medianLuminance];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setForegroundLuminance:");
    id v9 = [v7 dominantColors];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setForegroundColors:v9];
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Foreground color analysis failed: %{public}@", buf, 0xCu);
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

void __50__PISegmentationLoader__analyzeColors_completion___block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Background color analysis response: %@", buf, 0xCu);
  }
  id v12 = 0;
  uint64_t v7 = [v3 result:&v12];
  id v8 = v12;
  if (v7)
  {
    [v7 medianLuminance];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setBackgroundLuminance:");
    id v9 = [v7 dominantColors];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setBackgroundColors:v9];
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Background color analysis failed: %{public}@", buf, 0xCu);
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

void __50__PISegmentationLoader__analyzeColors_completion___block_invoke_149(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Clock area Image color analysis response: %@", buf, 0xCu);
  }
  id v12 = 0;
  uint64_t v7 = [v3 result:&v12];
  id v8 = v12;
  if (v7)
  {
    id v9 = [v7 dominantColors];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setClockAreaColors:v9];
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Full Image color analysis failed: %{public}@", buf, 0xCu);
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

uint64_t __50__PISegmentationLoader__analyzeColors_completion___block_invoke_150(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) segmentationMatte];

  if (!v2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) luminance];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setBackgroundLuminance:");
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) colors];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setBackgroundColors:v3];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) backgroundLuminance];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setForegroundLuminance:");
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) backgroundColors];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setForegroundColors:v4];
  }
  [*(id *)(a1 + 32) setColorAnalysis:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

- (BOOL)_isValidSegmentationMatteHistogramForDepth:(id)a3
{
  +[PISegmentationHelper bimodalScoreForHistogram:a3];
  return +[PISegmentationGating isValidSegmentationScoreForDepth:](PISegmentationGating, "isValidSegmentationScoreForDepth:");
}

- (void)_performSegmentation:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    uint64_t v15 = NUAssertLogger_22535();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      double v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      id v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v19 = NUAssertLogger_22535();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        double v23 = dispatch_get_specific(*v17);
        double v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        double v26 = [v24 callStackSymbols];
        double v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v31 = v23;
        __int16 v32 = 2114;
        uint64_t v33 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v31 = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v10 = v9;
  if (self->_isCancelled)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
  else
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F7A730]) initWithComposition:v8];
    [v11 setSegmentationType:a4];
    [v11 setVisionSegmentationPolicy:3];
    id v12 = [(id)objc_opt_class() proxyScalePolicy];
    [v11 setScalePolicy:v12];

    double v13 = +[PIPhotoEditHelper pipelineFiltersForShowingOriginalWithGeometry];
    [v11 setPipelineFilters:v13];

    [v11 setResponseQueue:self->_queue];
    [v11 setRenderContext:self->_renderContext];
    id v14 = objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
    [v11 setPriority:v14];

    [v11 setProduceConfidenceMap:a4 == 1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __61__PISegmentationLoader__performSegmentation_type_completion___block_invoke;
    v28[3] = &unk_1E5D81670;
    id v29 = v10;
    [v11 submit:v28];
  }
}

void __61__PISegmentationLoader__performSegmentation_type_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Image segmentation response: %@", buf, 0xCu);
  }
  id v13 = 0;
  uint64_t v7 = [v3 result:&v13];
  id v8 = v13;
  if (v7)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v7 matteImageBuffer];
    uint64_t v11 = [v7 confidenceMapBuffer];
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11);
  }
  else
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Image segmentation failed: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_segment:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = [v6 segmentationMatte];

  if (v8
    || [v6 classification] == 5
    || self->_isCancelled
    || [(PISegmentationLoader *)self disableSegmentation]
    || [(PISegmentationLoader *)self disableRendering])
  {
    v7[2](v7);
  }
  else
  {
    uint64_t v9 = [v6 composition];

    if (!v9)
    {
      id v25 = NUAssertLogger_22535();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        double v26 = [NSString stringWithFormat:@"Missing composition"];
        *(_DWORD *)buf = 138543362;
        uint64_t v52 = v26;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      double v27 = (const void **)MEMORY[0x1E4F7A308];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      id v29 = NUAssertLogger_22535();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v30)
        {
          uint64_t v33 = dispatch_get_specific(*v27);
          uint64_t v34 = (void *)MEMORY[0x1E4F29060];
          id v35 = v33;
          __int16 v36 = [v34 callStackSymbols];
          CGFloat v37 = [v36 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v52 = v33;
          __int16 v53 = 2114;
          BOOL v54 = v37;
          _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v30)
      {
        id v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v52 = v32;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
    }
    uint64_t v10 = [v6 classification];
    if ((unint64_t)(v10 - 3) < 2)
    {
      char v12 = 0;
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = v10;
      if (v10 == 1 || v10 == 2)
      {
        char v12 = 0;
      }
      else
      {
        uint64_t v11 = 0;
        char v12 = 1;
      }
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __44__PISegmentationLoader__segment_completion___block_invoke;
    v49[3] = &unk_1E5D80F40;
    v49[4] = self;
    id v13 = v6;
    id v50 = v13;
    id v14 = (void *)MEMORY[0x1AD0F8FE0](v49);
    id v15 = [v13 composition];
    if (v12)
    {
      uint64_t v38 = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      CGFloat v40 = __44__PISegmentationLoader__segment_completion___block_invoke_3;
      uint64_t v41 = &unk_1E5D80F68;
      uint64_t v16 = &v43;
      uint64_t v43 = v14;
      double v17 = &v42;
      id v42 = v13;
      double v18 = (id *)&v44;
      id v44 = v7;
      id v19 = v14;
      BOOL v20 = &v38;
      uint64_t v21 = self;
      double v22 = v15;
      uint64_t v23 = 3;
    }
    else
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __44__PISegmentationLoader__segment_completion___block_invoke_2;
      v45[3] = &unk_1E5D80F68;
      uint64_t v16 = &v47;
      uint64_t v47 = v14;
      double v17 = &v46;
      id v46 = v13;
      double v18 = (id *)&v48;
      v48 = v7;
      id v24 = v14;
      BOOL v20 = v45;
      uint64_t v21 = self;
      double v22 = v15;
      uint64_t v23 = v11;
    }
    -[PISegmentationLoader _performSegmentation:type:completion:](v21, "_performSegmentation:type:completion:", v22, v23, v20, v38, v39, v40, v41);
  }
}

BOOL __44__PISegmentationLoader__segment_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F7A4A8]);
  id v8 = [v7 computeHistogramFromMatteBuffer:v5];
  BOOL v9 = +[PISegmentationHelper matteHistogramIndicatesSubjectDetected:v8];
  if (v9 && [*(id *)(a1 + 32) _isValidSegmentationMatteHistogramForDepth:v8])
  {
    [*(id *)(a1 + 40) setSegmentationMatte:v5];
    [*(id *)(a1 + 40) setSegmentationConfidenceMap:v6];
  }

  return v9;
}

uint64_t __44__PISegmentationLoader__segment_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v7 = a3;
  id v8 = a2;
  (*(void (**)(uint64_t, id, id, uint64_t))(v5 + 16))(v5, v8, v7, [v6 classification]);

  BOOL v9 = *(uint64_t (**)(void))(a1[6] + 16);
  return v9();
}

uint64_t __44__PISegmentationLoader__segment_completion___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setClassification:3];
  }
  else
  {
    [v3 setClassification:5];
    [*(id *)(a1 + 32) setSegmentationMatte:0];
    [*(id *)(a1 + 32) setSegmentationConfidenceMap:0];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

- (void)_classify:(id)a3 completion:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v8 = [v6 classification];
  if ((unint64_t)(v8 - 1) < 4)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    BOOL v9 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v9;
      [v6 classification];
      uint64_t v11 = PFPosterClassificationName();
      *(_DWORD *)buf = 138543362;
      id v46 = v11;
      _os_log_impl(&dword_1A9680000, v10, OS_LOG_TYPE_INFO, "Known classification: %{public}@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (v8)
  {
    if (v8 == 5)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      char v12 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9680000, v12, OS_LOG_TYPE_INFO, "Previous classification attempt yielded 'other'", buf, 2u);
      }
      goto LABEL_18;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v13 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9680000, v13, OS_LOG_TYPE_INFO, "Current classification is unspecified", buf, 2u);
    }
  }
  if (self->_isCancelled || [(PISegmentationLoader *)self disableRendering])
  {
LABEL_18:
    v7[2](v7);
    goto LABEL_19;
  }
  id v14 = [v6 composition];

  if (!v14)
  {
    double v26 = NUAssertLogger_22535();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      double v27 = [NSString stringWithFormat:@"Missing composition"];
      *(_DWORD *)buf = 138543362;
      id v46 = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v28 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v30 = NUAssertLogger_22535();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        uint64_t v34 = dispatch_get_specific(*v28);
        id v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        CGFloat v37 = [v35 callStackSymbols];
        uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v46 = v34;
        __int16 v47 = 2114;
        v48 = v38;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      __int16 v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v46 = v33;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F457A8]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F458F8]);
  id v17 = objc_alloc(MEMORY[0x1E4F7A720]);
  double v18 = [v6 composition];
  id v19 = (void *)[v17 initWithComposition:v18];

  v44[0] = v15;
  v44[1] = v16;
  BOOL v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  [v19 setVisionRequests:v20];

  uint64_t v21 = [(id)objc_opt_class() proxyScalePolicy];
  [v19 setScalePolicy:v21];

  double v22 = +[PIPhotoEditHelper pipelineFiltersForShowingOriginalWithGeometry];
  [v19 setPipelineFilters:v22];

  [v19 setResponseQueue:self->_queue];
  [v19 setRenderContext:self->_renderContext];
  uint64_t v23 = objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
  [v19 setPriority:v23];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __45__PISegmentationLoader__classify_completion___block_invoke;
  v39[3] = &unk_1E5D80F18;
  id v40 = v15;
  id v41 = v16;
  id v42 = v6;
  uint64_t v43 = v7;
  id v24 = v16;
  id v25 = v15;
  [v19 submit:v39];

LABEL_19:
}

void __45__PISegmentationLoader__classify_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  uint64_t v5 = (NSObject **)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Vision detection response: %@", buf, 0xCu);
  }
  id v50 = 0;
  id v7 = [v3 result:&v50];
  id v8 = v50;
  if (v7)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    BOOL v9 = [*(id *)(a1 + 32) results];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
    uint64_t v11 = (double *)MEMORY[0x1E4F8A250];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v47;
      double v14 = *MEMORY[0x1E4F8A250];
      double v15 = *(double *)(MEMORY[0x1E4F8A250] + 8);
      double v16 = -1.0;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v47 != v13) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v46 + 1) + 8 * i) boundingBox];
          if (v18 == 0.0 || v19 == 0.0 || (v19 == v15 ? (BOOL v20 = v18 == v14) : (BOOL v20 = 0), v20)) {
            double v21 = 0.0;
          }
          else {
            double v21 = v18 * v19;
          }
          if (v21 >= v16) {
            double v16 = v21;
          }
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v12);
    }
    else
    {
      double v16 = -1.0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v23 = objc_msgSend(*(id *)(a1 + 40), "results", 0);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v43;
      double v27 = *v11;
      double v28 = v11[1];
      double v29 = -1.0;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v43 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * j) boundingBox];
          if (v31 == 0.0 || v32 == 0.0 || (v32 == v28 ? (BOOL v33 = v31 == v27) : (BOOL v33 = 0), v33)) {
            double v34 = 0.0;
          }
          else {
            double v34 = v31 * v32;
          }
          if (v34 >= v29) {
            double v29 = v34;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v25);

      if (v16 <= 0.0)
      {
        id v36 = (NSObject **)MEMORY[0x1E4F7A758];
        if (v29 <= 0.0) {
          goto LABEL_54;
        }
        uint64_t v35 = 2;
      }
      else
      {
        uint64_t v35 = 1;
        id v36 = (NSObject **)MEMORY[0x1E4F7A758];
      }
    }
    else
    {

      id v36 = (NSObject **)MEMORY[0x1E4F7A758];
      if (v16 <= 0.0) {
        goto LABEL_54;
      }
      uint64_t v35 = 1;
    }
    [*(id *)(a1 + 48) setClassification:v35];
LABEL_54:
    if ([*(id *)(a1 + 48) classification])
    {
      if (*v4 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      CGFloat v37 = *v36;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        uint64_t v38 = *(void **)(a1 + 48);
        uint64_t v39 = v37;
        [v38 classification];
        id v40 = PFPosterClassificationName();
        *(_DWORD *)buf = 138543362;
        id v54 = v40;
        _os_log_impl(&dword_1A9680000, v39, OS_LOG_TYPE_INFO, "Classified image as %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (*v4 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      id v41 = *v36;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9680000, v41, OS_LOG_TYPE_INFO, "Detectors failed to classify asset. Falling back to segmentation strategy.", buf, 2u);
      }
    }
    goto LABEL_63;
  }
  if (*v4 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  double v22 = *v5;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v54 = v8;
    _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Vision detection failed: %{public}@", buf, 0xCu);
  }
  [*(id *)(a1 + 48) setClassification:5];
LABEL_63:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_loadMotionScore:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PISegmentationLoader *)self asset];

  if (!v8)
  {
    double v18 = NUAssertLogger_22535();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      double v19 = [NSString stringWithFormat:@"Cannot load motion score for nil asset"];
      *(_DWORD *)buf = 138543362;
      id v36 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v22 = NUAssertLogger_22535();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v26 = dispatch_get_specific(*v20);
        double v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        double v29 = [v27 callStackSymbols];
        BOOL v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v36 = v26;
        __int16 v37 = 2114;
        uint64_t v38 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v36 = v25;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  BOOL v9 = [(PISegmentationLoader *)self asset];
  uint64_t v10 = [v9 localIdentifier];

  uint64_t v11 = (id)s_log_22531;
  uint64_t v12 = v11;
  os_signpost_id_t signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v12, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.settlingEffect.motion", "", buf, 2u);
  }

  double v14 = [(PISegmentationLoader *)self asset];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__PISegmentationLoader__loadMotionScore_completion___block_invoke;
  v31[3] = &unk_1E5D80EF0;
  v31[4] = self;
  id v32 = v6;
  id v33 = v10;
  id v34 = v7;
  id v15 = v7;
  id v16 = v10;
  id v17 = v6;
  self->_loadMotionRequestID = [v14 loadMotionScore:v31];
}

void __52__PISegmentationLoader__loadMotionScore_completion___block_invoke(void *a1, void *a2, float a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  double v5 = COERCE_DOUBLE(a2);
  id v6 = (id)s_log_22531;
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1[4] + 8);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PISegmentationLoader.settlingEffect.motion", "", (uint8_t *)&v17, 2u);
  }

  if (v5 == 0.0)
  {
    uint64_t v12 = (void *)a1[5];
    uint64_t v21 = *MEMORY[0x1E4F8D210];
    *(float *)&double v9 = a3;
    uint64_t v13 = [NSNumber numberWithFloat:v9];
    v22[0] = v13;
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [v12 updateScores:v14];

    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v15 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = a1[6];
      int v17 = 138543618;
      uint64_t v18 = v16;
      __int16 v19 = 2048;
      double v20 = a3;
      _os_log_impl(&dword_1A9680000, v15, OS_LOG_TYPE_INFO, "Loaded motion score for asset %{public}@: %.2f", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v10 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[6];
      int v17 = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      double v20 = v5;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Failed to load motion score for asset %{public}@: %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)_loadSettlingEffect:(id)a3 layoutGroup:(id)a4 completion:(id)a5
{
  *(void *)&v35[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  uint64_t v11 = [(PISegmentationLoader *)self asset];
  uint64_t v12 = [v11 localIdentifier];

  if (![(PISegmentationLoader *)self _shouldLoadSettlingEffectForItem:v8])
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v18 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v12;
      _os_log_impl(&dword_1A9680000, v18, OS_LOG_TYPE_INFO, "Skipping settling effect loading for asset %{public}@, cached results are sufficient for the current session", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if ([(PISegmentationLoader *)self disableSettlingEffect]
    || [(PISegmentationLoader *)self disableRendering])
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v13 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      double v14 = v13;
      *(_DWORD *)buf = 138543874;
      id v33 = v12;
      __int16 v34 = 1024;
      *(_DWORD *)uint64_t v35 = [(PISegmentationLoader *)self disableSettlingEffect];
      v35[2] = 1024;
      *(_DWORD *)&v35[3] = [(PISegmentationLoader *)self disableRendering];
      _os_log_impl(&dword_1A9680000, v14, OS_LOG_TYPE_INFO, "Skipping settling effect loading for asset %{public}@, disableSettlingEffect: %d, disableRendering: %d", buf, 0x18u);
    }
    id v15 = self;
    id v16 = v8;
    uint64_t v17 = 64;
LABEL_9:
    [(PISegmentationLoader *)v15 _updateItem:v16 withSettlingEffectGatingFailures:v17];
LABEL_14:
    v10[2](v10, 0);
    goto LABEL_15;
  }
  __int16 v19 = +[PIGlobalSettings globalSettings];
  char v20 = [v19 forceEnableSettlingEffect];

  if ((v20 & 1) == 0 && ([(id)objc_opt_class() currentDeviceSupportsSettlingEffect] & 1) == 0)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v24 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = v24;
      [(PISegmentationLoader *)self settlingEffectGatingLevel];
      uint64_t v26 = PFPosterSettlingEffectGatingLevelDescription();
      *(_DWORD *)buf = 138543618;
      id v33 = v12;
      __int16 v34 = 2114;
      *(void *)uint64_t v35 = v26;
      _os_log_impl(&dword_1A9680000, v25, OS_LOG_TYPE_INFO, "Skipping settling effect loading for asset %{public}@, unsupported device for gating level %{public}@", buf, 0x16u);
    }
    id v15 = self;
    id v16 = v8;
    uint64_t v17 = 2048;
    goto LABEL_9;
  }
  [v8 resetSettlingEffectGatingFailure];
  uint64_t v21 = (id)s_log_22531;
  double v22 = v21;
  os_signpost_id_t signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v22, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.liveOriginal", "", buf, 2u);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke;
  v27[3] = &unk_1E5D80EC8;
  v27[4] = self;
  id v28 = v8;
  id v29 = v12;
  double v31 = v10;
  id v30 = v9;
  [(PISegmentationLoader *)self _loadLiveOriginalResource:v28 completion:v27];

LABEL_15:
}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke(id *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id)s_log_22531;
  double v5 = v4;
  os_signpost_id_t v6 = *((void *)a1[4] + 1);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PISegmentationLoader.liveOriginal", "", buf, 2u);
  }

  id v7 = [a1[5] livePhotoResource];

  if (v7)
  {
    id v8 = objc_alloc_init(PIParallaxAssetSettlingEffectOptions);
    -[PIParallaxAssetSettlingEffectOptions setIsInteractiveRequest:](v8, "setIsInteractiveRequest:", [a1[4] shouldUseInteractiveSettlingEffectGating]);
    -[PIParallaxAssetSettlingEffectOptions setNeedsInProcessHandling:](v8, "setNeedsInProcessHandling:", [a1[4] performMediaAnalysisInProcess]);
    id v9 = [a1[5] settlingEffectVideoData];
    [(PIParallaxAssetSettlingEffectOptions *)v8 setLoadVideoStatusOnly:v9 != 0];

    uint64_t v10 = (id)s_log_22531;
    uint64_t v11 = v10;
    os_signpost_id_t v12 = *((void *)a1[4] + 1);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PISegmentationLoader.settlingEffect.stabilize", "", buf, 2u);
    }

    uint64_t v13 = [a1[5] livePhotoResource];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_113;
    v17[3] = &unk_1E5D80EA0;
    v17[4] = a1[4];
    id v18 = a1[6];
    id v19 = a1[5];
    id v22 = a1[8];
    id v20 = a1[7];
    uint64_t v21 = v8;
    double v14 = v8;
    *((_DWORD *)a1[4] + 10) = +[PIPosterSettlingEffectLoader loadCropRectWithResource:v13 options:v14 completion:v17];
  }
  else
  {
    if (v3)
    {
      [a1[4] _updateItem:a1[5] withSettlingEffectGatingFailures:128];
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      id v15 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        id v16 = a1[6];
        *(_DWORD *)buf = 138543362;
        id v24 = v16;
        _os_log_impl(&dword_1A9680000, v15, OS_LOG_TYPE_INFO, "Skipping settling effect loading for asset %{public}@, not a Live Photo", buf, 0xCu);
      }
      [a1[5] setSettlingEffectStatus:1];
    }
    (*((void (**)(void))a1[8] + 2))();
  }
}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_113(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = (id)s_log_22531;
  uint64_t v17 = v16;
  os_signpost_id_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PISegmentationLoader.settlingEffect.stabilize", "", buf, 2u);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 40) = 0;
  id v19 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v20 = (os_log_t *)MEMORY[0x1E4F7A758];
  uint64_t v21 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
  {
    id v22 = v15;
    uint64_t v23 = *(void *)(a1 + 40);
    id v24 = v21;
    if ((unint64_t)(a2 - 1) > 4) {
      uint64_t v25 = @"unknown";
    }
    else {
      uint64_t v25 = off_1E5D7F160[a2 - 1];
    }
    uint64_t v26 = v25;
    *(_DWORD *)buf = 138543618;
    uint64_t v61 = v23;
    __int16 v62 = 2114;
    v63 = v26;
    _os_log_impl(&dword_1A9680000, v24, OS_LOG_TYPE_INFO, "Settling effect status after L1 stabilization for asset %{public}@: %{public}@", buf, 0x16u);

    id v15 = v22;
  }
  [*(id *)(a1 + 48) setSettlingEffectStatus:a2];
  [*(id *)(a1 + 32) _updateItem:*(void *)(a1 + 48) withSettlingEffectGatingFailures:a3];
  v65.origin.x = a5;
  v65.origin.y = a6;
  v65.size.width = a7;
  v65.size.height = a8;
  if (CGRectIsNull(v65))
  {
    if (*v19 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    double v27 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v43;
      __int16 v62 = 2114;
      v63 = v15;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Failed to compute a settling effect crop rect for asset %{public}@: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v28 = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 48), "setSettlingEffectNormalizedBounds:", a5, a6, a7, a8);
    id v29 = *(void **)(a1 + 48);
    uint64_t v58 = *MEMORY[0x1E4F8D218];
    uint64_t v59 = MEMORY[0x1E4F1CC38];
    id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    [v29 updateScores:v30];

    dispatch_group_enter(v28);
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = *(NSObject **)(v31 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_115;
    block[3] = &unk_1E5D80E00;
    void block[4] = v31;
    id v33 = *(NSObject **)(a1 + 56);
    id v55 = *(id *)(a1 + 48);
    id v56 = *(id *)(a1 + 40);
    __int16 v34 = v28;
    v57 = v34;
    dispatch_group_notify(v33, v32, block);
    dispatch_group_enter(v34);
    uint64_t v35 = (id)s_log_22531;
    id v36 = v35;
    os_signpost_id_t v37 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v37, "PISegmentationLoader.settlingEffect.video", "", buf, 2u);
    }

    uint64_t v38 = [*(id *)(a1 + 48) livePhotoResource];
    uint64_t v39 = *(void *)(a1 + 64);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_116;
    v46[3] = &unk_1E5D80E78;
    v46[4] = *(void *)(a1 + 32);
    id v40 = *(id *)(a1 + 48);
    CGFloat v50 = a5;
    CGFloat v51 = a6;
    CGFloat v52 = a7;
    CGFloat v53 = a8;
    id v47 = v40;
    long long v48 = v34;
    id v49 = *(id *)(a1 + 40);
    id v41 = v34;
    *(_DWORD *)(*(void *)(a1 + 32) + 44) = +[PIPosterSettlingEffectLoader loadVideoWithResource:v38 options:v39 completion:v46];

    long long v42 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    void v44[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_125;
    v44[3] = &unk_1E5D80E28;
    id v45 = *(id *)(a1 + 72);
    dispatch_group_notify(v41, v42, v44);
  }
}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_115(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_2;
  v4[3] = &unk_1E5D80E50;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 _performSettlingEffectLayout:v3 completion:v4];
}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_116(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, void *a5)
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  uint64_t v11 = (id)s_log_22531;
  os_signpost_id_t v12 = v11;
  os_signpost_id_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PISegmentationLoader.settlingEffect.video", "", buf, 2u);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 44) = 0;
  [*(id *)(a1 + 40) setSettlingEffectStatus:a3];
  [*(id *)(a1 + 32) _updateItem:*(void *)(a1 + 40) withSettlingEffectGatingFailures:a4];
  if (v9)
  {
    double v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9];
    if (v14)
    {
      id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v51 = 0;
      char v16 = [v15 removeItemAtURL:v9 error:&v51];
      uint64_t v17 = v51;

      if ((v16 & 1) == 0)
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
        }
        os_signpost_id_t v18 = *MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CGFloat v53 = v17;
          _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Failed to clean up settling effect video file: %@", buf, 0xCu);
        }
      }
      id v19 = [*(id *)(a1 + 40) settlingEffectVideoData];

      if (!v19)
      {
        [*(id *)(a1 + 40) setSettlingEffectVideoData:v14];
        id v20 = [*(id *)(a1 + 40) composition];
        uint64_t v21 = +[PISegmentationLoader livePhotoCompositionForVideoData:cropRect:photoComposition:](PISegmentationLoader, "livePhotoCompositionForVideoData:cropRect:photoComposition:", v14, v20, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
        [*(id *)(a1 + 40) setComposition:v21];
      }
      int v22 = [*(id *)(a1 + 32) shouldUseInteractiveSettlingEffectGating];
      unint64_t v23 = [*(id *)(a1 + 40) settlingEffectStatus];
      unint64_t v24 = v23;
      if (v22) {
        unint64_t v25 = 2;
      }
      else {
        unint64_t v25 = 4;
      }
      uint64_t v26 = *(void **)(a1 + 40);
      uint64_t v56 = *MEMORY[0x1E4F8D220];
      double v27 = [NSNumber numberWithBool:v23 > v25];
      v57[0] = v27;
      id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
      [v26 updateScores:v28];

      if (v24 > v25)
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        id v29 = *(void **)(a1 + 32);
        uint64_t v30 = *(void *)(a1 + 40);
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_120;
        v49[3] = &unk_1E5D812E0;
        id v50 = *(id *)(a1 + 48);
        [v29 _loadMotionScore:v30 completion:v49];
      }
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      id v33 = (void *)*MEMORY[0x1E4F7A758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      __int16 v34 = *(NSObject **)(a1 + 56);
      uint64_t v17 = v33;
      uint64_t v35 = [v9 path];
      *(_DWORD *)buf = 138543618;
      CGFloat v53 = v34;
      __int16 v54 = 2114;
      id v55 = v35;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Failed to read settling effect video file for asset %{public}@ from path: %{public}@", buf, 0x16u);
    }
LABEL_27:

    goto LABEL_28;
  }
  if (a3 >= 2)
  {
    id v36 = NUAssertLogger_22535();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v37 = [NSString stringWithFormat:@"No video should imply 'unknown' or 'unavailable'"];
      *(_DWORD *)buf = 138543362;
      CGFloat v53 = v37;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v38 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v40 = NUAssertLogger_22535();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        long long v44 = dispatch_get_specific(*v38);
        id v45 = (void *)MEMORY[0x1E4F29060];
        long long v46 = v44;
        id v47 = [v45 callStackSymbols];
        long long v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        CGFloat v53 = v44;
        __int16 v54 = 2114;
        id v55 = v48;
        _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v41)
    {
      long long v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      CGFloat v53 = v43;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  uint64_t v31 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    id v32 = *(NSObject **)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    CGFloat v53 = v32;
    __int16 v54 = 2114;
    id v55 = v10;
    _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Failed to compute a settling effect for asset %{public}@: %{public}@", buf, 0x16u);
  }
LABEL_28:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_125(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_120(uint64_t a1)
{
}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v4 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Failed to compute a settling effect layout for asset %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)_shouldLoadSettlingEffectForItem:(id)a3
{
  id v4 = a3;
  if ([v4 settlingEffectStatus])
  {
    if ([v4 settlingEffectStatus] == 3) {
      BOOL v5 = ![(PISegmentationLoader *)self shouldUseInteractiveSettlingEffectGating];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)_loadSegmentationData:(id)a3 layoutGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_group_t v11 = dispatch_group_create();
  dispatch_group_enter(v9);
  os_signpost_id_t v12 = (id)s_log_22531;
  os_signpost_id_t v13 = v12;
  os_signpost_id_t signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v13, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.classify", "", buf, 2u);
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke;
  v35[3] = &unk_1E5D80E00;
  v35[4] = self;
  id v15 = v9;
  id v36 = v15;
  id v16 = v8;
  id v37 = v16;
  uint64_t v17 = v11;
  uint64_t v38 = v17;
  [(PISegmentationLoader *)self _classify:v16 completion:v35];
  dispatch_group_enter(v17);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_107;
  block[3] = &unk_1E5D81158;
  id v19 = v17;
  id v32 = v19;
  id v33 = self;
  id v20 = v16;
  id v34 = v20;
  dispatch_group_notify(v15, queue, block);
  dispatch_group_enter(v19);
  uint64_t v21 = (id)s_log_22531;
  int v22 = v21;
  os_signpost_id_t v23 = self->_signpost;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PISegmentationLoader.localLightData", "", buf, 2u);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_110;
  v29[3] = &unk_1E5D80DD8;
  v29[4] = self;
  uint64_t v30 = v19;
  unint64_t v24 = v19;
  [(PISegmentationLoader *)self _loadLocalLightData:v20 completion:v29];
  unint64_t v25 = self->_queue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_111;
  v27[3] = &unk_1E5D80E28;
  id v28 = v10;
  id v26 = v10;
  dispatch_group_notify(v24, v25, v27);
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke(uint64_t a1)
{
  int v2 = (id)s_log_22531;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.classify", "", buf, 2u);
  }

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  BOOL v5 = (id)s_log_22531;
  int v6 = v5;
  os_signpost_id_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PISegmentationLoader.segment", "", buf, 2u);
  }

  id v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_104;
  v10[3] = &unk_1E5D80E00;
  void v10[4] = v8;
  uint64_t v9 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  [v8 _segment:v9 completion:v10];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_107(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  int v2 = (id)s_log_22531;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PISegmentationLoader.layout", "", buf, 2u);
  }

  int v6 = *(void **)(a1 + 40);
  BOOL v5 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_108;
  v7[3] = &unk_1E5D80C78;
  v7[4] = v6;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  [v6 _performLayout:v8 completion:v7];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_110(uint64_t a1)
{
  int v2 = (id)s_log_22531;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.localLightData", "", v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_108(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = (id)s_log_22531;
  BOOL v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PISegmentationLoader.layout", "", buf, 2u);
  }

  os_signpost_id_t v7 = *(void **)(a1 + 32);
  if (v3)
  {
    [v7 _abort:v3];
  }
  else
  {
    [v7 _handlePartialItem:*(void *)(a1 + 40) loadingState:2];
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    id v8 = (id)s_log_22531;
    id v9 = v8;
    os_signpost_id_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PISegmentationLoader.colorAnalysis", "", buf, 2u);
    }

    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_109;
    v13[3] = &unk_1E5D80DD8;
    v13[4] = v11;
    id v14 = *(id *)(a1 + 48);
    [v11 _analyzeColors:v12 completion:v13];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_109(uint64_t a1)
{
  int v2 = (id)s_log_22531;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.colorAnalysis", "", v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_104(uint64_t a1)
{
  int v2 = (id)s_log_22531;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.segment", "", buf, 2u);
  }

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  BOOL v5 = (id)s_log_22531;
  os_signpost_id_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PISegmentationLoader.regions", "", buf, 2u);
  }

  id v8 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_105;
  v17[3] = &unk_1E5D80DD8;
  v17[4] = v8;
  uint64_t v9 = *(void *)(a1 + 48);
  id v18 = *(id *)(a1 + 40);
  [v8 _loadRegions:v9 completion:v17];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
  os_signpost_id_t v10 = (id)s_log_22531;
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PISegmentationLoader.infill", "", buf, 2u);
  }

  id v13 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_106;
  v15[3] = &unk_1E5D80DD8;
  v15[4] = v13;
  uint64_t v14 = *(void *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  [v13 _loadBackground:v14 completion:v15];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_105(uint64_t a1)
{
  int v2 = (id)s_log_22531;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.regions", "", v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_106(uint64_t a1)
{
  int v2 = (id)s_log_22531;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.infill", "", v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_loadAssetResource:(int64_t)a3 allowNetworkAccess:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  [v10 setNetworkAccessAllowed:v7];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  os_signpost_id_t v12 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
  {
    asset = self->_asset;
    uint64_t v14 = v12;
    id v15 = [(PFParallaxAsset *)asset localIdentifier];
    *(_DWORD *)buf = 134218498;
    int64_t v25 = a3;
    __int16 v26 = 2114;
    double v27 = v15;
    __int16 v28 = 1024;
    int v29 = [v10 networkAccessAllowed];
    _os_log_impl(&dword_1A9680000, v14, OS_LOG_TYPE_INFO, "Loading resource %ld for asset %{public}@, allow download? %d", buf, 0x1Cu);
  }
  id v16 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v17 = self->_asset;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__PISegmentationLoader__loadAssetResource_allowNetworkAccess_options_completion___block_invoke;
  v20[3] = &unk_1E5D80DB0;
  v20[4] = self;
  id v21 = v16;
  id v22 = v11;
  int64_t v23 = a3;
  id v18 = v11;
  id v19 = v16;
  self->_loadRequestID = [(PFParallaxAsset *)v17 loadParallaxResource:a3 options:v10 resultHandler:v20];
}

void __81__PISegmentationLoader__loadAssetResource_allowNetworkAccess_options_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a2;
  id v8 = [v6 now];
  *(_DWORD *)(a1[4] + 28) = 0;
  if (v7)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v9 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = a1[7];
      id v11 = *(void **)(a1[4] + 88);
      os_signpost_id_t v12 = v9;
      id v13 = [v11 localIdentifier];
      [v8 timeIntervalSinceDate:a1[5]];
      int v25 = 134218498;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      __int16 v28 = v13;
      __int16 v29 = 2048;
      uint64_t v30 = v14;
      id v15 = "Successfully loaded resource %ld for asset %{public}@ in %0.3fs";
LABEL_6:
      _os_log_impl(&dword_1A9680000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v25, 0x20u);
LABEL_7:
    }
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F7A750];
    if (v5)
    {
      if (v16 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      uint64_t v17 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = a1[7];
        id v19 = *(void **)(a1[4] + 88);
        os_signpost_id_t v12 = v17;
        id v13 = [v19 localIdentifier];
        [v8 timeIntervalSinceDate:a1[5]];
        int v25 = 134218754;
        uint64_t v26 = v18;
        __int16 v27 = 2114;
        __int16 v28 = v13;
        __int16 v29 = 2048;
        uint64_t v30 = v20;
        __int16 v31 = 2114;
        id v32 = v5;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Failed to load resource %ld for asset %{public}@ after %0.3fs, error: %{public}@", (uint8_t *)&v25, 0x2Au);
        goto LABEL_7;
      }
    }
    else
    {
      if (v16 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      id v21 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = a1[7];
        int64_t v23 = *(void **)(a1[4] + 88);
        os_signpost_id_t v12 = v21;
        id v13 = [v23 localIdentifier];
        [v8 timeIntervalSinceDate:a1[5]];
        int v25 = 134218498;
        uint64_t v26 = v22;
        __int16 v27 = 2114;
        __int16 v28 = v13;
        __int16 v29 = 2048;
        uint64_t v30 = v24;
        id v15 = "Cancelled loading resource %ld for asset %{public}@ after %0.3fs";
        goto LABEL_6;
      }
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_loadAssetResource:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PISegmentationLoader__loadAssetResource_options_completion___block_invoke;
  v12[3] = &unk_1E5D80DB0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  [(PISegmentationLoader *)self _loadAssetResource:a3 allowNetworkAccess:0 options:v11 completion:v12];
}

void __62__PISegmentationLoader__loadAssetResource_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 || ([*(id *)(a1 + 32) disableDownload] & 1) != 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) downloadProgressHandler];
    [*(id *)(a1 + 40) setDownloadProgressHandler:v7];

    if ([*(id *)(a1 + 32) priority])
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      id v8 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        id v9 = *(void **)(a1 + 32);
        id v10 = v8;
        id v11 = [v9 asset];
        os_signpost_id_t v12 = [v11 localIdentifier];
        *(_DWORD *)buf = 138543362;
        id v19 = v12;
        _os_log_impl(&dword_1A9680000, v10, OS_LOG_TYPE_INFO, "Triggering non-foreground user initiated download for asset with local identifier: %{public}@", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 40), "setPriority:", objc_msgSend(*(id *)(a1 + 32), "priority"));
    }
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__PISegmentationLoader__loadAssetResource_options_completion___block_invoke_102;
    v16[3] = &unk_1E5D80D88;
    uint64_t v15 = *(void *)(a1 + 56);
    id v17 = *(id *)(a1 + 48);
    [v13 _loadAssetResource:v15 allowNetworkAccess:1 options:v14 completion:v16];
  }
}

uint64_t __62__PISegmentationLoader__loadAssetResource_options_completion___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_loadAssetResourceForProxy:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (objc_class *)MEMORY[0x1E4F8CC70];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  unint64_t sourceMode = self->_sourceMode;
  id v13 = v8;
  if (sourceMode < 2)
  {
    uint64_t v10 = v4;
    BOOL v11 = !v4;
  }
  else
  {
    if (sourceMode != 2)
    {
      if (sourceMode == 3)
      {
        [v8 setCanHandleAdjustmentData:&__block_literal_global_101_22648];
        uint64_t v10 = 4;
      }
      else
      {
        uint64_t v10 = 0;
      }
      goto LABEL_13;
    }
    BOOL v11 = !v4;
    if (v4) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 2;
    }
  }
  double v12 = 3024.0;
  if (!v11) {
    double v12 = 1536.0;
  }
  objc_msgSend(v8, "setImageSize:", v12, v12);
LABEL_13:
  [v13 setResultHandlerQueue:self->_queue];
  [(PISegmentationLoader *)self _loadAssetResource:v10 options:v13 completion:v7];
}

BOOL __62__PISegmentationLoader__loadAssetResourceForProxy_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[PIPhotoEditHelper canInterpretDataWithFormatIdentifier:a2 formatVersion:a3];
}

- (void)_loadAssetResourceForLiveOriginalWithCompletion:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F8CC70];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setCanHandleAdjustmentData:&__block_literal_global_22651];
  [v6 setResultHandlerQueue:self->_queue];
  [(PISegmentationLoader *)self _loadAssetResource:6 options:v6 completion:v5];
}

BOOL __72__PISegmentationLoader__loadAssetResourceForLiveOriginalWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[PIPhotoEditHelper canInterpretDataWithFormatIdentifier:a2 formatVersion:a3];
}

- (void)_loadFullSizeResource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [v6 resource];
  if (v8
    && (id v9 = (void *)v8,
        [v6 resource],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isProxyOnly],
        v10,
        v9,
        (v11 & 1) == 0)
    || self->_isCancelled)
  {
    v7[2](v7, 0);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__PISegmentationLoader__loadFullSizeResource_completion___block_invoke;
    v12[3] = &unk_1E5D80D40;
    id v13 = v6;
    uint64_t v14 = v7;
    [(PISegmentationLoader *)self _loadAssetResourceForProxy:0 completion:v12];
  }
}

void __57__PISegmentationLoader__loadFullSizeResource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (v17)
  {
    id v3 = [*(id *)(a1 + 32) resource];
    objc_msgSend(v17, "setProxyImage:", objc_msgSend(v3, "proxyImage"));

    BOOL v4 = +[PISegmentationLoader segmentationCompositionForAssetResource:v17];
    [*(id *)(a1 + 32) setResource:v17];
    [*(id *)(a1 + 32) setComposition:v4];
    id v5 = [*(id *)(a1 + 32) settlingEffectVideoData];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) settlingEffectVideoData];
      [*(id *)(a1 + 32) settlingEffectNormalizedBounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      uint64_t v15 = [*(id *)(a1 + 32) composition];
      uint64_t v16 = +[PISegmentationLoader livePhotoCompositionForVideoData:cropRect:photoComposition:](PISegmentationLoader, "livePhotoCompositionForVideoData:cropRect:photoComposition:", v6, v15, v8, v10, v12, v14);
      [*(id *)(a1 + 32) setComposition:v16];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_loadProxyResource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, void))a4;
  double v8 = [v6 resource];

  if (v8 || self->_isCancelled)
  {
    v7[2](v7, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PISegmentationLoader__loadProxyResource_completion___block_invoke;
    v9[3] = &unk_1E5D80D40;
    id v10 = v6;
    double v11 = v7;
    [(PISegmentationLoader *)self _loadAssetResourceForProxy:1 completion:v9];
  }
}

void __54__PISegmentationLoader__loadProxyResource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    [*(id *)(a1 + 32) setResource:v3];
    BOOL v4 = +[PISegmentationLoader segmentationCompositionForAssetResource:v5];
    [*(id *)(a1 + 32) setComposition:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_loadFinalResource:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([(PISegmentationLoader *)self preferFullResolutionResource])
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PISegmentationLoader.m" lineNumber:613 description:@"Item already has full resolution resource loaded."];
  }
  else
  {
    [(PISegmentationLoader *)self _loadFullSizeResource:v9 completion:v7];
  }
}

- (void)_loadFirstPreferredResource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(PISegmentationLoader *)self preferFullResolutionResource]) {
    [(PISegmentationLoader *)self _loadFullSizeResource:v7 completion:v6];
  }
  else {
    [(PISegmentationLoader *)self _loadProxyResource:v7 completion:v6];
  }
}

- (void)_loadLiveOriginalResource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  double v8 = [v6 livePhotoResource];

  if (v8 || self->_isCancelled)
  {
    v7[2](v7, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__PISegmentationLoader__loadLiveOriginalResource_completion___block_invoke;
    v9[3] = &unk_1E5D80D40;
    id v10 = v6;
    double v11 = v7;
    [(PISegmentationLoader *)self _loadAssetResourceForLiveOriginalWithCompletion:v9];
  }
}

void __61__PISegmentationLoader__loadLiveOriginalResource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    if ([v3 type] == 6) {
      [*(id *)(a1 + 32) setLivePhotoResource:v5];
    }
    BOOL v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    BOOL v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
}

- (void)_abort:(id)a3
{
  id v5 = a3;
  p_loadingError = &self->_loadingError;
  if (!self->_loadingError)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_loadingError, a3);
    if (self->_loadRequestID) {
      -[PFParallaxAsset cancelParallaxResourceRequest:](self->_asset, "cancelParallaxResourceRequest:");
    }
    if (self->_petsRequestID) {
      -[PFParallaxAsset cancelPetsRegionsRequest:](self->_asset, "cancelPetsRegionsRequest:");
    }
    if (self->_loadMotionRequestID) {
      -[PFParallaxAsset cancelMotionScoreRequest:](self->_asset, "cancelMotionScoreRequest:");
    }
    if (self->_settlingEffectCropRequestID) {
      +[PIPosterSettlingEffectLoader cancelRequest:](PIPosterSettlingEffectLoader, "cancelRequest:");
    }
    if (self->_settlingEffectVideoRequestID) {
      +[PIPosterSettlingEffectLoader cancelRequest:](PIPosterSettlingEffectLoader, "cancelRequest:");
    }
    p_loadingError = (NSError **)[(NURenderContext *)self->_renderContext cancelAllRequests];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_loadingError, v5);
}

- (void)cancel
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  id v3 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9680000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling segmentation loader", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__PISegmentationLoader_cancel__block_invoke;
  block[3] = &unk_1E5D812E0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __30__PISegmentationLoader_cancel__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
  return [*(id *)(a1 + 32) _abort:0];
}

- (id)_computeDefaultLayoutForItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [PIPosterLayoutRequest alloc];
  double v8 = [v6 composition];
  id v9 = [(PIPosterLayoutRequest *)v7 initWithComposition:v8];

  id v10 = [(PISegmentationLoader *)self layoutConfiguration];
  [(PIPosterLayoutRequest *)v9 setLayoutConfiguration:v10];

  [(PIPosterLayoutRequest *)v9 setLayoutRegions:self->_asset];
  [(PIPosterLayoutRequest *)v9 setSegmentationClassification:[(PISegmentationLoader *)self classification]];
  [(PIPosterLayoutRequest *)v9 setShouldComputeAllScores:0];
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = __Block_byref_object_copy__22558;
  uint64_t v30 = __Block_byref_object_dispose__22559;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int64_t v23 = __Block_byref_object_copy__22558;
  uint64_t v24 = __Block_byref_object_dispose__22559;
  id v25 = 0;
  double v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__PISegmentationLoader__computeDefaultLayoutForItem_error___block_invoke;
  v16[3] = &unk_1E5D80D18;
  uint64_t v18 = &v26;
  id v19 = &v20;
  double v12 = v11;
  id v17 = v12;
  [(PIPosterLayoutRequest *)v9 submit:v16];
  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  double v13 = (void *)v27[5];
  if (!v13)
  {
    *a4 = (id) v21[5];
    double v13 = (void *)v27[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __59__PISegmentationLoader__computeDefaultLayoutForItem_error___block_invoke(uint64_t a1, void *a2)
{
  id v11 = 0;
  id v3 = [a2 result:&v11];
  id v4 = v11;
  id v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v3 layout];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v4;
    double v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_handlePartialItem:(id)a3 loadingState:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PISegmentationLoader *)self loadingHandler];
  if (v7)
  {
    uint64_t v8 = [v6 loadingState];
    unint64_t v9 = a4 == 128 ? v8 | 0x80 : v8 & 0x80 | a4;
    [v6 setLoadingState:v9];
    id v10 = [v6 defaultLayout];

    if (v10) {
      goto LABEL_6;
    }
    id v27 = 0;
    id v14 = [(PISegmentationLoader *)self _computeDefaultLayoutForItem:v6 error:&v27];
    id v13 = v27;
    if (!v14)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      uint64_t v20 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v29 = v13;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Failed to compute default layout, error: %{public}@", buf, 0xCu);
      }
      goto LABEL_7;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F7A498]);
    uint64_t v16 = [v6 composition];
    id v17 = (void *)[v15 initWithComposition:v16];

    id v26 = 0;
    uint64_t v18 = [v17 submitSynchronous:&v26];
    id v19 = v26;

    if (v18)
    {
      [v6 setDefaultLayout:v14];
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      id v21 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v29 = v19;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Failed to compute proxy image size, error: %{public}@", buf, 0xCu);
      }
    }

    if (v18)
    {
LABEL_6:
      id v11 = (void *)[v6 copy];
      loadingHandlerQueue = self->_loadingHandlerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__PISegmentationLoader__handlePartialItem_loadingState___block_invoke;
      block[3] = &unk_1E5D80CF0;
      id v23 = v11;
      id v24 = v7;
      unint64_t v25 = v9;
      id v13 = v11;
      dispatch_async(loadingHandlerQueue, block);

LABEL_7:
    }
  }
}

uint64_t __56__PISegmentationLoader__handlePartialItem_loadingState___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (void)_loadItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  unint64_t v9 = (id)s_log_22531;
  id v10 = v9;
  os_signpost_id_t signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v10, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.proxy", "", buf, 2u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __45__PISegmentationLoader__loadItem_completion___block_invoke;
  v20[3] = &unk_1E5D80C78;
  v20[4] = self;
  id v12 = v6;
  id v21 = v12;
  uint64_t v22 = v8;
  id v13 = v8;
  [(PISegmentationLoader *)self _loadFirstPreferredResource:v12 completion:v20];
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__PISegmentationLoader__loadItem_completion___block_invoke_83;
  v17[3] = &unk_1E5D80CC8;
  id v18 = v12;
  id v19 = v7;
  v17[4] = self;
  id v15 = v12;
  id v16 = v7;
  dispatch_group_notify(v13, queue, v17);
}

void __45__PISegmentationLoader__loadItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)s_log_22531;
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PISegmentationLoader.proxy", "", buf, 2u);
  }

  id v7 = [*(id *)(a1 + 40) resource];

  uint64_t v8 = *(void **)(a1 + 32);
  if (v7)
  {
    [v8 _handlePartialItem:*(void *)(a1 + 40) loadingState:1];
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    dispatch_group_t v9 = dispatch_group_create();
    id v10 = (id)s_log_22531;
    id v11 = v10;
    os_signpost_id_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PISegmentationLoader.properties", "", buf, 2u);
    }

    id v14 = *(void **)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __45__PISegmentationLoader__loadItem_completion___block_invoke_79;
    v24[3] = &unk_1E5D81158;
    v24[4] = v14;
    id v25 = v13;
    id v26 = *(id *)(a1 + 48);
    [v14 _loadSegmentationData:v25 layoutGroup:v9 completion:v24];
    if (([*(id *)(a1 + 32) loadFirstResourceOnly] & 1) == 0)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      id v15 = (id)s_log_22531;
      id v16 = v15;
      os_signpost_id_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9680000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PISegmentationLoader.fullSize", "", buf, 2u);
      }

      id v19 = *(void **)(a1 + 32);
      id v18 = *(void **)(a1 + 40);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __45__PISegmentationLoader__loadItem_completion___block_invoke_80;
      v20[3] = &unk_1E5D80CA0;
      v20[4] = v19;
      id v21 = v18;
      id v22 = *(id *)(a1 + 48);
      id v23 = v9;
      [v19 _loadFinalResource:v21 completion:v20];
    }
  }
  else
  {
    [v8 _abort:v3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __45__PISegmentationLoader__loadItem_completion___block_invoke_83(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 25) || *(void *)(v2 + 48))
  {
    id v3 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    [(id)v2 _cacheSegmentationDataForItem:a1[5]];
    id v3 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v3();
}

void __45__PISegmentationLoader__loadItem_completion___block_invoke_79(uint64_t a1)
{
  uint64_t v2 = (id)s_log_22531;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.properties", "", v5, 2u);
  }

  [*(id *)(a1 + 32) _handlePartialItem:*(void *)(a1 + 40) loadingState:4];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __45__PISegmentationLoader__loadItem_completion___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = (id)s_log_22531;
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PISegmentationLoader.fullSize", "", buf, 2u);
  }

  id v7 = [*(id *)(a1 + 40) resource];

  uint64_t v8 = *(void **)(a1 + 32);
  if (v7)
  {
    [v8 _handlePartialItem:*(void *)(a1 + 40) loadingState:128];
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    id v10 = *(void **)(a1 + 32);
    dispatch_group_t v9 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__PISegmentationLoader__loadItem_completion___block_invoke_81;
    v14[3] = &unk_1E5D80C78;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 32);
    id v15 = v12;
    uint64_t v16 = v13;
    id v17 = *(id *)(a1 + 48);
    [v10 _loadSettlingEffect:v12 layoutGroup:v11 completion:v14];
  }
  else
  {
    [v8 _abort:v3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __45__PISegmentationLoader__loadItem_completion___block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    os_signpost_id_t v4 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v3;
      _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Failed to load settling effect: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 40) _abort:v3];
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v5 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      os_signpost_id_t v6 = *(void **)(a1 + 32);
      id v7 = v5;
      uint64_t v8 = [v6 settlingEffectStatus];
      if ((unint64_t)(v8 - 1) > 4) {
        dispatch_group_t v9 = @"unknown";
      }
      else {
        dispatch_group_t v9 = off_1E5D7F160[v8 - 1];
      }
      id v10 = v9;
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_1A9680000, v7, OS_LOG_TYPE_INFO, "Loaded settling effect, status: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)currentContextInfo
{
  id v3 = +[PISegmentationContextInfo currentContextInfo];
  objc_msgSend(v3, "setSourceMode:", -[PISegmentationLoader sourceMode](self, "sourceMode"));
  objc_msgSend(v3, "setSegmentationDisabled:", -[PISegmentationLoader disableSegmentation](self, "disableSegmentation"));
  os_signpost_id_t v4 = [(PISegmentationLoader *)self layoutConfiguration];
  [v3 setLayoutConfiguration:v4];

  objc_msgSend(v3, "setRole:", -[PISegmentationLoader role](self, "role"));
  return v3;
}

- (void)_load:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_isLoading = 1;
  id v5 = [(PISegmentationLoader *)self layoutConfiguration];

  if (!v5)
  {
    os_signpost_id_t v6 = +[PIGlobalSettings globalSettings];
    id v7 = [v6 parallaxLayoutConfigurationOverride];

    uint64_t v8 = (void *)MEMORY[0x1E4F7A750];
    if (v7)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      dispatch_group_t v9 = (os_log_t *)MEMORY[0x1E4F7A758];
      id v10 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543362;
        uint64_t v20 = v7;
        _os_log_impl(&dword_1A9680000, v10, OS_LOG_TYPE_DEFAULT, "Warning: PISegmentationLoader layout configuration unspecified! Using override layout configuration '%{public}@'", (uint8_t *)&v19, 0xCu);
      }
      int v11 = [MEMORY[0x1E4F8CE48] configurationWithDeviceName:v7];
      [(PISegmentationLoader *)self setLayoutConfiguration:v11];

      id v12 = [(PISegmentationLoader *)self layoutConfiguration];

      if (v12) {
        goto LABEL_19;
      }
      if (*v8 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      uint64_t v13 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543362;
        uint64_t v20 = v7;
        _os_log_impl(&dword_1A9680000, v13, OS_LOG_TYPE_DEFAULT, "Warning: Override layout configuration '%{public}@' not found, using generic fallback", (uint8_t *)&v19, 0xCu);
      }
      uint64_t v14 = [MEMORY[0x1E4F8CE48] genericConfiguration];
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
      }
      id v15 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1A9680000, v15, OS_LOG_TYPE_DEFAULT, "Warning: PISegmentationLoader layout configuration unspecified! Using the layout configuration matching this device", (uint8_t *)&v19, 2u);
      }
      uint64_t v14 = [MEMORY[0x1E4F8CE48] deviceConfiguration];
    }
    uint64_t v16 = (void *)v14;
    [(PISegmentationLoader *)self setLayoutConfiguration:v14];

LABEL_19:
  }
  id v17 = self->_item;
  id v18 = [(PIParallaxSegmentationItem *)v17 contextInfo];
  if (v18)
  {
    if (v17) {
      goto LABEL_26;
    }
  }
  else
  {
    id v18 = [(PISegmentationLoader *)self currentContextInfo];
    if (v17) {
      goto LABEL_26;
    }
  }
  id v17 = [(PISegmentationLoader *)self _tryLoadSegmentationItemFromCache:v18];
  if (!v17)
  {
    id v17 = objc_alloc_init(PIParallaxSegmentationItem);
    [(PIParallaxSegmentationItem *)v17 setContextInfo:v18];
    [(PIParallaxSegmentationItem *)v17 setClassification:[(PISegmentationLoader *)self classification]];
  }
LABEL_26:
  [(PISegmentationLoader *)self _loadItem:v17 completion:v4];
}

- (void)_didLoad:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_isLoading = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__PISegmentationLoader__didLoad_completion___block_invoke;
  v15[3] = &unk_1E5D81550;
  v15[4] = self;
  id v8 = v7;
  id v16 = v8;
  uint64_t v9 = MEMORY[0x1AD0F8FE0](v15);
  id v12 = (void *)v9;
  if (self->_isCancelled)
  {
    uint64_t v13 = *(void (**)(uint64_t, id, void, uint64_t, uint64_t))(v9 + 16);
    id v14 = 0;
  }
  else
  {
    if (!v6)
    {
      (*(void (**)(uint64_t, void, NSError *, uint64_t, uint64_t))(v9 + 16))(v9, 0, self->_loadingError, v10, v11);
      goto LABEL_6;
    }
    uint64_t v13 = *(void (**)(uint64_t, id, void, uint64_t, uint64_t))(v9 + 16);
    id v14 = v6;
  }
  v13(v9, v14, 0, v10, v11);
LABEL_6:
}

void __44__PISegmentationLoader__didLoad_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) loadingHandlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PISegmentationLoader__didLoad_completion___block_invoke_2;
  block[3] = &unk_1E5D80CC8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __44__PISegmentationLoader__didLoad_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)loadSegmentationItemWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PISegmentationLoader_loadSegmentationItemWithCompletion___block_invoke;
  v7[3] = &unk_1E5D80C50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __59__PISegmentationLoader_loadSegmentationItemWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id)s_log_22531;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PISegmentationLoader.item", "", buf, 2u);
  }

  id v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PISegmentationLoader_loadSegmentationItemWithCompletion___block_invoke_73;
  v6[3] = &unk_1E5D80C28;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  [v5 _load:v6];
}

void __59__PISegmentationLoader_loadSegmentationItemWithCompletion___block_invoke_73(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = (id)s_log_22531;
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PISegmentationLoader.item", "", v7, 2u);
  }

  [*(id *)(a1 + 32) _didLoad:v3 completion:*(void *)(a1 + 40)];
}

- (BOOL)shouldUseInteractiveSettlingEffectGating
{
  return [(PISegmentationLoader *)self settlingEffectGatingLevel] != 2;
}

- (BOOL)_shouldEnableSettlingEffectByDefault
{
  uint64_t v2 = +[PIGlobalSettings globalSettings];
  char v3 = [v2 forceEnableSettlingEffect];

  if (v3) {
    return 1;
  }
  return MEMORY[0x1F4140768]();
}

- (BOOL)_shouldEnableSegmentationByDefault
{
  uint64_t v2 = +[PIGlobalSettings globalSettings];
  char v3 = [v2 forceEnableSegmentation];

  if (v3) {
    return 1;
  }
  id v5 = +[PIGlobalSettings globalSettings];
  char v6 = [v5 disableSegmentation];

  if (v6) {
    return 0;
  }
  return MEMORY[0x1F4140758]();
}

- (PISegmentationLoader)initWithSegmentationItem:(id)a3 parallaxAsset:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (_PISegmentationNullAsset *)a4;
  if (!v7)
  {
    id v16 = NUAssertLogger_22535();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "item != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v20 = NUAssertLogger_22535();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        id v24 = dispatch_get_specific(*v18);
        id v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        id v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v24;
        __int16 v31 = 2114;
        id v32 = v28;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      id v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v23;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v9 = v8;
  if (!v8) {
    id v9 = objc_alloc_init(_PISegmentationNullAsset);
  }
  id v10 = [(PISegmentationLoader *)self initWithParallaxAsset:v9];
  [v7 setSegmentationDataURL:0];
  objc_storeStrong((id *)&v10->_item, a3);
  uint64_t v11 = [v7 contextInfo];
  id v12 = v11;
  if (v11)
  {
    v10->_unint64_t sourceMode = [v11 sourceMode];
    v10->_disableSegmentation = [v12 segmentationDisabled];
    uint64_t v13 = [v12 layoutConfiguration];
    layoutConfiguration = v10->_layoutConfiguration;
    v10->_layoutConfiguration = (PFWallpaperCompoundDeviceConfiguration *)v13;
  }
  return v10;
}

- (PISegmentationLoader)initWithParallaxAsset:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = (PFParallaxAsset *)a3;
  if (!v4)
  {
    id v18 = NUAssertLogger_22535();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "asset != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v22 = NUAssertLogger_22535();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        id v26 = dispatch_get_specific(*v20);
        id v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        id v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v26;
        __int16 v34 = 2114;
        uint64_t v35 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v25;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = v4;
  v31.receiver = self;
  v31.super_class = (Class)PISegmentationLoader;
  char v6 = [(PISegmentationLoader *)&v31 init];
  asset = v6->_asset;
  v6->_asset = v5;
  id v8 = v5;

  v6->_unint64_t sourceMode = 1;
  id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create("PISegmentationItemLoader.state", v9);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v10;

  id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create("PISegmentationItemLoader.loading", v12);
  loadingHandlerQueue = v6->_loadingHandlerQueue;
  v6->_loadingHandlerQueue = (OS_dispatch_queue *)v13;

  v6->_os_signpost_id_t signpost = os_signpost_id_make_with_pointer((os_log_t)s_log_22531, v6);
  id v15 = (NURenderContext *)objc_alloc_init(MEMORY[0x1E4F7A600]);
  renderContext = v6->_renderContext;
  v6->_renderContext = v15;

  v6->_disableSegmentation = ![(PISegmentationLoader *)v6 _shouldEnableSegmentationByDefault];
  v6->_disableSettlingEffect = ![(PISegmentationLoader *)v6 _shouldEnableSettlingEffectByDefault];
  return v6;
}

+ (BOOL)currentDeviceSupportsSettlingEffect
{
  uint64_t v2 = [MEMORY[0x1E4F7A5E0] currentPlatform];
  char v3 = [v2 mainDevice];

  LOBYTE(v2) = (unint64_t)[v3 family] > 4;
  return (char)v2;
}

+ (id)reloadSegmentationItemFromWallpaperURL:(id)a3 asset:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id specific = a4;
  id v11 = a5;
  if (!v9)
  {
    id v22 = NUAssertLogger_22535();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "wallpaperURL != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = (uint64_t)v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v12 = MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v9 = NUAssertLogger_22535();
    BOOL v24 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        id specific = dispatch_get_specific(*(const void **)v12);
        id v25 = (void *)MEMORY[0x1E4F29060];
        a1 = specific;
        uint64_t v12 = [v25 callStackSymbols];
        id v5 = [(id)v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = (uint64_t)specific;
        __int16 v33 = 2114;
        id v34 = v5;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v12 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    id v26 = "wallpaperURL != nil";
    _NUAssertFailHandler();
    goto LABEL_24;
  }
  uint64_t v12 = (uint64_t)v11;
  id v30 = 0;
  a1 = [a1 _loadSegmentationItemFromWallpaperURL:v9 error:&v30];
  id v5 = v30;
  if (!a1)
  {
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_6:
      dispatch_queue_t v13 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = (uint64_t)v5;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Failed to load segmentation item from wallpaper: %{public}@", buf, 0xCu);
      }
      id v14 = objc_msgSend(MEMORY[0x1E4F7A438], "errorWithCode:reason:object:underlyingError:", 1, @"Failed to load segmentation item from wallpaper", v9, v5, v26);
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v14);

      goto LABEL_9;
    }
LABEL_24:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    goto LABEL_6;
  }
  if ([a1 isComplete])
  {
    (*(void (**)(uint64_t, id, void))(v12 + 16))(v12, a1, 0);
LABEL_9:
    id v15 = 0;
    goto LABEL_13;
  }
  id v16 = [[PISegmentationLoader alloc] initWithSegmentationItem:a1 parallaxAsset:specific];
  if (!specific)
  {
    id v17 = [a1 resource];
    -[PISegmentationLoader setLoadFirstResourceOnly:](v16, "setLoadFirstResourceOnly:", [v17 isProxyOnly]);

    id v18 = [a1 livePhotoResource];
    [(PISegmentationLoader *)v16 setDisableSettlingEffect:v18 == 0];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __80__PISegmentationLoader_reloadSegmentationItemFromWallpaperURL_asset_completion___block_invoke;
  v27[3] = &unk_1E5D81550;
  int v19 = v16;
  id v28 = v19;
  id v29 = (id)v12;
  [(PISegmentationLoader *)v19 loadSegmentationItemWithCompletion:v27];
  uint64_t v20 = v29;
  id v15 = v19;

LABEL_13:
  return v15;
}

uint64_t __80__PISegmentationLoader_reloadSegmentationItemFromWallpaperURL_asset_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)_renderPreviewLayerStackFromWallpaperURL:(id)a3 styleCategory:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v14 = NUAssertLogger_22535();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "wallpaperURL != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v16 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v18 = NUAssertLogger_22535();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        id v22 = dispatch_get_specific(*v16);
        BOOL v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        id v25 = [v23 callStackSymbols];
        id v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v22;
        __int16 v33 = 2114;
        id v34 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v21;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __90__PISegmentationLoader__renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke;
  v27[3] = &unk_1E5D81370;
  id v29 = v10;
  id v30 = a1;
  id v28 = v9;
  id v11 = v10;
  id v12 = v9;
  id v13 = (id)[a1 reloadSegmentationItemFromWallpaperURL:v8 asset:0 completion:v27];
}

void __90__PISegmentationLoader__renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (*(void *)(a1 + 32))
    {
      id v7 = objc_msgSend(v5, "suggestedStyleForCategory:");
    }
    else
    {
      id v7 = 0;
    }
    if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]) {
      uint64_t v9 = 136;
    }
    else {
      uint64_t v9 = 8;
    }
    uint64_t v10 = [v5 isSettlingEffectAvailable];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__PISegmentationLoader__renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke_2;
    v14[3] = &unk_1E5D810F8;
    id v11 = *(void **)(a1 + 48);
    id v17 = *(id *)(a1 + 40);
    id v15 = v7;
    id v16 = v5;
    id v12 = v7;
    id v13 = (id)[v11 generateLayerStackForItem:v16 style:v12 layout:0 options:v9 enableSettlingEffect:v10 completion:v14];
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v8 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v6;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Failed to reload segmentation item from wallpaper: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __90__PISegmentationLoader__renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v8 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Failed to render layer stack: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
}

+ (void)renderPreviewLayerStackFromWallpaperURL:(id)a3 styleCategory:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v13 = NUAssertLogger_22535();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "wallpaperURL != nil");
      *(_DWORD *)buf = 138543362;
      id v30 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v15 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v17 = NUAssertLogger_22535();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        BOOL v21 = dispatch_get_specific(*v15);
        id v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        id v24 = [v22 callStackSymbols];
        id v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v30 = v21;
        __int16 v31 = 2114;
        uint64_t v32 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v30 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v11 = v10;
  [a1 ensureResources];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __89__PISegmentationLoader_renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke;
  v26[3] = &unk_1E5D810D0;
  id v27 = v11;
  id v28 = a1;
  id v12 = v11;
  [a1 _renderPreviewLayerStackFromWallpaperURL:v8 styleCategory:v9 completion:v26];
}

void __89__PISegmentationLoader_renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = *(void **)(a1 + 40);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  [v9 freeResources];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)loadStyleFromWallpaperURL:(id)a3 error:(id *)specific
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    BOOL v21 = NUAssertLogger_22535();
    id v13 = "wallpaperURL != nil";
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "wallpaperURL != nil");
      id v22 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v29 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = (id *)dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v8 = NUAssertLogger_22535();
    BOOL v23 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        id specific = (id *)dispatch_get_specific(*v12);
        id v24 = (void *)MEMORY[0x1E4F29060];
        os_signpost_id_t v4 = specific;
        id v12 = [v24 callStackSymbols];
        id v5 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v29 = specific;
        __int16 v30 = 2114;
        id v31 = v5;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v29 = (id *)v12;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    id v25 = "wallpaperURL != nil";
    _NUAssertFailHandler();
LABEL_30:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    goto LABEL_14;
  }
  id v8 = v7;
  id v9 = (id)s_log_22531;
  id v10 = v9;
  os_signpost_id_t v11 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PISegmentationLoader.style.read", "", buf, 2u);
  }

  id v12 = [v8 URLByAppendingPathComponent:@"style.plist"];
  id v27 = 0;
  os_signpost_id_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v12 error:&v27];
  id v5 = v27;
  if (v4)
  {
    id v26 = v5;
    id v13 = [MEMORY[0x1E4F8CCA8] styleWithDictionary:v4 error:&v26];
    id v14 = v26;

    id v5 = v14;
  }
  else
  {
    id v13 = 0;
  }
  id v15 = (id)s_log_22531;
  id v16 = v15;
  os_signpost_id_t v17 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PISegmentationLoader.style.read", "", buf, 2u);
  }

  if (v13)
  {
    BOOL v18 = v13;
    goto LABEL_17;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_30;
  }
LABEL_14:
  id v19 = *MEMORY[0x1E4F7A758];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    if (!specific) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  *(_DWORD *)buf = 138543362;
  id v29 = (id *)v5;
  _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Failed to load style from wallpaper: %{public}@", buf, 0xCu);
  if (specific)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E4F7A438], "errorWithCode:reason:object:underlyingError:", 1, @"Failed to load style from wallpaper", v8, v5, v25);
    void *specific = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_17:

  return v13;
}

+ (id)loadCompoundLayerStackFromWallpaperURL:(id)a3 options:(unint64_t)a4 error:(id *)specific
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    BOOL v21 = NUAssertLogger_22535();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "wallpaperURL != nil");
      id v22 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v28 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v14 = (const void **)MEMORY[0x1E4F7A308];
    id specific = (id *)dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_22535();
    BOOL v23 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        id specific = (id *)dispatch_get_specific(*v14);
        id v24 = (void *)MEMORY[0x1E4F29060];
        id v5 = specific;
        id v14 = [v24 callStackSymbols];
        id v6 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v28 = specific;
        __int16 v29 = 2114;
        id v30 = v6;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      id v14 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v28 = (id *)v14;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    id v25 = "wallpaperURL != nil";
    _NUAssertFailHandler();
LABEL_27:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    goto LABEL_11;
  }
  id v10 = v9;
  os_signpost_id_t v11 = (id)s_log_22531;
  id v12 = v11;
  os_signpost_id_t v13 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PISegmentationLoader.layerStack.read", "", buf, 2u);
  }

  id v5 = [v10 URLByAppendingPathComponent:@"output.layerStack"];
  id v26 = 0;
  id v14 = [MEMORY[0x1E4F8CCA0] loadCompoundLayerStackFromURL:v5 options:a4 error:&v26];
  id v6 = v26;
  id v15 = (id)s_log_22531;
  id v16 = v15;
  os_signpost_id_t v17 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PISegmentationLoader.layerStack.read", "", buf, 2u);
  }

  if (v14)
  {
    BOOL v18 = v14;
    goto LABEL_14;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_27;
  }
LABEL_11:
  id v19 = *MEMORY[0x1E4F7A758];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    if (!specific) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  *(_DWORD *)buf = 138543362;
  id v28 = (id *)v6;
  _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Failed to load layer stack from wallpaper: %{public}@", buf, 0xCu);
  if (specific)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E4F7A438], "errorWithCode:reason:object:underlyingError:", 1, @"Failed to load layer stack from wallpaper", v10, v6, v25);
    void *specific = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v14;
}

+ (id)_loadSegmentationItemFromWallpaperURL:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 URLByAppendingPathComponent:@"input.segmentation"];
  id v13 = 0;
  id v8 = [a1 _loadSegmentationItemFromURL:v7 error:&v13];
  id v9 = v13;
  if (v8)
  {
    id v10 = v8;
    goto LABEL_8;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  os_signpost_id_t v11 = *MEMORY[0x1E4F7A758];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  id v15 = v9;
  _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Failed to load segmentation item from wallpaper: %{public}@", buf, 0xCu);
  if (a4)
  {
LABEL_7:
    *a4 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load segmentation item from wallpaper" object:v6 underlyingError:v9];
  }
LABEL_8:

  return v8;
}

+ (id)loadSegmentationItemFromWallpaperURL:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v12 = NUAssertLogger_22535();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "wallpaperURL != nil");
      *(_DWORD *)buf = 138543362;
      id v26 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v14 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v16 = NUAssertLogger_22535();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v20 = dispatch_get_specific(*v14);
        BOOL v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        BOOL v23 = [v21 callStackSymbols];
        id v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v26 = v20;
        __int16 v27 = 2114;
        id v28 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      BOOL v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v26 = v19;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v7 = v6;
  id v8 = [a1 _loadSegmentationItemFromWallpaperURL:v6 error:a4];
  id v9 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  if ([v8 isComplete])
  {
    id v10 = v9;
    goto LABEL_8;
  }
  if (a4)
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Segmentation item from wallpaper is incomplete" object:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    id v10 = 0;
  }
LABEL_8:

  return v10;
}

+ (BOOL)saveSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 toWallpaperURL:(id)a6 error:(id *)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v15)
  {
    id v51 = NUAssertLogger_22535();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      CGFloat v52 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "wallpaperURL != nil");
      *(_DWORD *)buf = 138543362;
      id v68 = v52;
      _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    CGFloat v53 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v12 = NUAssertLogger_22535();
    BOOL v54 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v54)
      {
        id specific = dispatch_get_specific(*v53);
        uint64_t v56 = (void *)MEMORY[0x1E4F29060];
        a5 = specific;
        v57 = [v56 callStackSymbols];
        id v7 = [v57 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v68 = specific;
        __int16 v69 = 2114;
        double v70 = v7;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v54)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      id v55 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v68 = v55;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v58 = "wallpaperURL != nil";
    _NUAssertFailHandler();
LABEL_68:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
LABEL_28:
    long long v42 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v68 = specific;
      _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Failed to create wallpaper directory: %{public}@", buf, 0xCu);
      if (!a7) {
        goto LABEL_43;
      }
    }
    else if (!a7)
    {
LABEL_43:
      BOOL v41 = 0;
      goto LABEL_51;
    }
    objc_msgSend(MEMORY[0x1E4F7A438], "errorWithCode:reason:object:underlyingError:", 1, @"Failed to create wallpaper directory", a5, specific, v58);
    BOOL v41 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  a5 = v15;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v16 = [a5 path];
  char v17 = [v7 fileExistsAtPath:v16];

  if (v17)
  {
    __int16 v62 = a7;
    BOOL v18 = 0;
    if (!v12) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  id v66 = 0;
  char v19 = [v7 createDirectoryAtURL:a5 withIntermediateDirectories:0 attributes:0 error:&v66];
  id v20 = v66;
  id specific = v20;
  if ((v19 & 1) == 0)
  {
    if (*MEMORY[0x1E4F7A750] == -1) {
      goto LABEL_28;
    }
    goto LABEL_68;
  }
  __int16 v62 = a7;
  BOOL v18 = v20;
  if (!v12) {
    goto LABEL_9;
  }
LABEL_7:
  id v22 = [a5 URLByAppendingPathComponent:@"input.segmentation"];
  id v65 = v18;
  BOOL v23 = +[PISegmentationLoader saveSegmentationItem:v12 toURL:v22 error:&v65];
  id specific = v65;

  if (!v23)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    uint64_t v43 = v62;
    long long v44 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v68 = specific;
      _os_log_error_impl(&dword_1A9680000, v44, OS_LOG_TYPE_ERROR, "Failed to export segmentation item: %{public}@", buf, 0xCu);
      if (!v62) {
        goto LABEL_42;
      }
    }
    else if (!v62)
    {
      goto LABEL_42;
    }
    id v45 = (void *)MEMORY[0x1E4F7A438];
    long long v46 = @"Failed to export segmentation item";
    id v47 = v12;
LABEL_41:
    *uint64_t v43 = [v45 errorWithCode:1 reason:v46 object:v47 underlyingError:specific];
    goto LABEL_42;
  }

  BOOL v18 = specific;
LABEL_9:
  id v61 = v14;
  if (!v13) {
    goto LABEL_18;
  }
  id v24 = (id)s_log_22531;
  id v25 = v24;
  os_signpost_id_t v26 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PISegmentationLoader.layerStack.write", "", buf, 2u);
  }

  id v22 = [a5 URLByAppendingPathComponent:@"output.layerStack"];
  id v64 = v18;
  __int16 v27 = v13;
  char v28 = [MEMORY[0x1E4F8CCA0] saveCompoundLayerStack:v13 toURL:v22 options:0xFFFFLL error:&v64];
  id specific = v64;

  uint64_t v29 = (id)s_log_22531;
  id v30 = v29;
  os_signpost_id_t v31 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PISegmentationLoader.layerStack.write", "", buf, 2u);
  }

  if ((v28 & 1) == 0)
  {
    id v14 = v61;
    uint64_t v43 = v62;
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v13 = v27;
    long long v48 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v68 = specific;
      _os_log_error_impl(&dword_1A9680000, v48, OS_LOG_TYPE_ERROR, "Failed to export layer stack: %{public}@", buf, 0xCu);
      if (!v62) {
        goto LABEL_42;
      }
      goto LABEL_40;
    }
    if (v62)
    {
LABEL_40:
      id v45 = (void *)MEMORY[0x1E4F7A438];
      long long v46 = @"Failed to export layer stack";
      id v47 = v13;
      goto LABEL_41;
    }
LABEL_42:

    goto LABEL_43;
  }

  BOOL v18 = specific;
  id v13 = v27;
  id v14 = v61;
LABEL_18:
  if (!v14)
  {
    BOOL v41 = 1;
    id specific = v18;
    goto LABEL_51;
  }
  uint64_t v60 = v13;
  uint64_t v32 = (id)s_log_22531;
  uint64_t v33 = v32;
  os_signpost_id_t v34 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v34, "PISegmentationLoader.style.write", "", buf, 2u);
  }

  uint64_t v35 = [a5 URLByAppendingPathComponent:@"style.plist"];
  uint64_t v36 = [MEMORY[0x1E4F8CCA8] dictionaryWithStyle:v14];
  id v63 = v18;
  uint64_t v59 = (void *)v35;
  char v37 = [v36 writeToURL:v35 error:&v63];
  id specific = v63;

  uint64_t v38 = (id)s_log_22531;
  uint64_t v39 = v38;
  os_signpost_id_t v40 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v39, OS_SIGNPOST_INTERVAL_END, v40, "PISegmentationLoader.style.write", "", buf, 2u);
  }

  if ((v37 & 1) == 0)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v49 = *MEMORY[0x1E4F7A758];
    id v14 = v61;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v68 = specific;
      _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Failed to export style: %{public}@", buf, 0xCu);
      if (!v62) {
        goto LABEL_50;
      }
    }
    else if (!v62)
    {
LABEL_50:

      BOOL v41 = 0;
      id v13 = v60;
      goto LABEL_51;
    }
    *__int16 v62 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to export style" object:v61 underlyingError:specific];
    goto LABEL_50;
  }

  BOOL v41 = 1;
  id v13 = v60;
  id v14 = v61;
LABEL_51:

  return v41;
}

+ (void)_saveSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 toWallpaperURL:(id)a6 completion:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void))a7;
  char v17 = (id)s_log_22531;
  BOOL v18 = v17;
  os_signpost_id_t v19 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PISegmentationLoader.wallpaper.write", "", buf, 2u);
  }

  id v28 = 0;
  char v20 = [a1 saveSegmentationItem:v12 compoundLayerStack:v13 style:v14 toWallpaperURL:v15 error:&v28];
  id v21 = v28;
  id v22 = (id)s_log_22531;
  BOOL v23 = v22;
  os_signpost_id_t v24 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PISegmentationLoader.wallpaper.write", "", buf, 2u);
  }

  if (v20)
  {
    id v25 = 0;
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    os_signpost_id_t v26 = *MEMORY[0x1E4F7A758];
    BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR);
    id v25 = v21;
    if (v27)
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v21;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Failed to save segmentation item and layer stack to wallpaper URL: %{public}@", buf, 0xCu);
      id v25 = v21;
    }
  }
  ((void (**)(id, id))v16)[2](v16, v25);
}

+ (id)generateLayerStackForItem:(id)a3 style:(id)a4 layout:(id)a5 options:(unint64_t)a6 enableSettlingEffect:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if (!v13)
  {
    uint64_t v31 = NUAssertLogger_22535();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "item != nil");
      *(_DWORD *)buf = 138543362;
      id v47 = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v33 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v35 = NUAssertLogger_22535();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        uint64_t v39 = dispatch_get_specific(*v33);
        os_signpost_id_t v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        long long v42 = [v40 callStackSymbols];
        uint64_t v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v47 = v39;
        __int16 v48 = 2114;
        id v49 = v43;
        _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      char v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v47 = v38;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  char v17 = v16;
  if (!a6)
  {
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
    BOOL v18 = 0;
    goto LABEL_20;
  }
  BOOL v18 = [[PIParallaxCompoundLayerStackRequest alloc] initWithSegmentationItem:v13];
  [(PIParallaxCompoundLayerStackRequest *)v18 setSettlingEffectEnabled:v9];
  if (v14)
  {
    os_signpost_id_t v19 = +[PIParallaxStyle styleWithBakedStyle:v14];
    [(PIParallaxCompoundLayerStackRequest *)v18 setStyle:v19];
  }
  else
  {
    [(PIParallaxCompoundLayerStackRequest *)v18 setStyle:0];
  }
  if (!v15)
  {
    [(PIParallaxCompoundLayerStackRequest *)v18 setUpdateInactiveFrame:1];
    goto LABEL_16;
  }
  [(PIParallaxCompoundLayerStackRequest *)v18 setLayout:v15];
  int v20 = [v15 supportsBothOrientations];
  id v21 = [v15 portraitLayout];
  [v21 inactiveFrame];
  BOOL IsNull = CGRectIsNull(v52);
  uint64_t v23 = IsNull;
  if (v20)
  {
    if (!IsNull)
    {
      id v25 = [v15 landscapeLayout];
      [v25 inactiveFrame];
      [(PIParallaxCompoundLayerStackRequest *)v18 setUpdateInactiveFrame:CGRectIsNull(v53)];

      goto LABEL_15;
    }
    os_signpost_id_t v24 = v18;
    uint64_t v23 = 1;
  }
  else
  {
    os_signpost_id_t v24 = v18;
  }
  [(PIParallaxCompoundLayerStackRequest *)v24 setUpdateInactiveFrame:v23];
LABEL_15:

LABEL_16:
  [(PIParallaxCompoundLayerStackRequest *)v18 setUpdateClockAreaLuminance:1];
  [(PIParallaxCompoundLayerStackRequest *)v18 setUpdateClockZPosition:1];
  [(PIParallaxCompoundLayerStackRequest *)v18 setLayerStackOptions:a6];
  os_signpost_id_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:1];
  [(NURenderRequest *)v18 setPriority:v26];

  BOOL v27 = (id)s_log_22531;
  id v28 = v27;
  os_signpost_id_t v29 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PISegmentationLoader.layerStack.render", "", buf, 2u);
  }

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  void v44[2] = __103__PISegmentationLoader_generateLayerStackForItem_style_layout_options_enableSettlingEffect_completion___block_invoke;
  v44[3] = &unk_1E5D81670;
  id v45 = v17;
  [(PIParallaxCompoundLayerStackRequest *)v18 submit:v44];

LABEL_20:
  return v18;
}

void __103__PISegmentationLoader_generateLayerStackForItem_style_layout_options_enableSettlingEffect_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  char v3 = [a2 result:&v11];
  id v4 = v11;
  id v5 = (id)s_log_22531;
  id v6 = v5;
  os_signpost_id_t v7 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PISegmentationLoader.layerStack.render", "", buf, 2u);
  }

  if (v3)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    BOOL v9 = [v3 compoundLayerStack];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    }
    id v10 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v4;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Failed to render layer stack: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)saveSegmentationItem:(id)a3 layerStackOptions:(unint64_t)a4 configuration:(id)a5 style:(id)a6 layout:(id)a7 toWallpaperURL:(id)a8 completion:(id)a9
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (!v15)
  {
    id v49 = NUAssertLogger_22535();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "item != nil");
      uint64_t v50 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      long long v79 = v50;
      _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v51 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    CGRect v53 = NUAssertLogger_22535();
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v54)
      {
        __int16 v62 = dispatch_get_specific(*v51);
        id v63 = (void *)MEMORY[0x1E4F29060];
        id v64 = v62;
        id v51 = [v63 callStackSymbols];
        id v65 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v79 = (const void **)v62;
        __int16 v80 = 2114;
        long long v81 = v65;
        _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v54)
    {
      id v55 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v51 = [v55 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v79 = v51;
      _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v59 = _NUAssertFailHandler();
    goto LABEL_33;
  }
  if (!v19)
  {
    uint64_t v56 = NUAssertLogger_22535();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "wallpaperURL != nil");
      v57 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      long long v79 = v57;
      _os_log_error_impl(&dword_1A9680000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v51 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v58 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    CGRect v53 = NUAssertLogger_22535();
    int v59 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (!v58)
    {
      if (v59)
      {
        uint64_t v60 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        long long v79 = v61;
        _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_35;
    }
LABEL_33:
    if (v59)
    {
      id v66 = dispatch_get_specific(*v51);
      CGFloat v67 = (void *)MEMORY[0x1E4F29060];
      id v68 = v66;
      __int16 v69 = [v67 callStackSymbols];
      double v70 = [v69 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      long long v79 = (const void **)v66;
      __int16 v80 = 2114;
      long long v81 = v70;
      _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_35:

    _NUAssertFailHandler();
  }
  id v21 = v20;
  if (v16 && !v18)
  {
    [v16 normalizedVisibleFrame];
    if (!CGRectIsNull(v84))
    {
      [v16 normalizedVisibleFrame];
      NURectFlipYOrigin();
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      [v16 normalizedLandscapeVisibleFrame];
      NURectFlipYOrigin();
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      uint64_t v39 = [v15 originalLayout];
      objc_msgSend(v39, "layoutByUpdatingNormalizedPortraitVisibleFrame:landscapeVisibleFrame:", v24, v26, v28, v30, v32, v34, v36, v38);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_10;
    }
    id v18 = 0;
  }
  if (v17)
  {
LABEL_8:
    id v22 = v17;
    goto LABEL_11;
  }
LABEL_10:
  id v22 = [v16 style];
  if (v22)
  {
LABEL_11:
    os_signpost_id_t v40 = [v15 adjustedStyleForHeadroom:v22];

    if ((a4 & 0x40) == 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v41 = [v15 isSettlingEffectAvailable];
    if (!v16) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  os_signpost_id_t v40 = 0;
  if ((a4 & 0x40) != 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v41 = 0;
  if (v16) {
LABEL_16:
  }
    uint64_t v41 = v41 & [v16 isSettlingEffectEnabled];
LABEL_17:
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __116__PISegmentationLoader_saveSegmentationItem_layerStackOptions_configuration_style_layout_toWallpaperURL_completion___block_invoke;
  v71[3] = &unk_1E5D810A8;
  id v72 = v16;
  id v73 = v15;
  id v74 = v40;
  id v75 = v19;
  id v76 = v21;
  id v77 = a1;
  id v42 = v21;
  id v43 = v19;
  id v44 = v40;
  id v45 = v15;
  id v46 = v16;
  id v47 = [a1 generateLayerStackForItem:v45 style:v44 layout:v18 options:a4 enableSettlingEffect:v41 completion:v71];

  return v47;
}

void __116__PISegmentationLoader_saveSegmentationItem_layerStackOptions_configuration_style_layout_toWallpaperURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    if (v6)
    {
      os_signpost_id_t v7 = objc_msgSend(v8, "compoundLayerStackByUpdatingPortraitDepthEnabled:landscapeDepthEnabled:", objc_msgSend(v6, "isDepthEnabled"), objc_msgSend(*(id *)(a1 + 32), "isLandscapeDepthEnabled"));

      objc_msgSend(v7, "compoundLayerStackByUpdatingParallaxDisabled:", objc_msgSend(*(id *)(a1 + 32), "isPerspectiveZoomEnabled") ^ 1);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    [*(id *)(a1 + 72) _saveSegmentationItem:*(void *)(a1 + 40) compoundLayerStack:v8 style:*(void *)(a1 + 48) toWallpaperURL:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
}

+ (id)_loadSegmentationItemFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  os_signpost_id_t v7 = objc_alloc_init(PIParallaxSegmentationItem);
  id v8 = (id)s_log_22531;
  BOOL v9 = v8;
  os_signpost_id_t v10 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PISegmentationLoader.archive.read", "", buf, 2u);
  }

  id v35 = 0;
  char v11 = [(PIParallaxSegmentationItem *)v7 loadFromURL:v6 error:&v35];

  id v12 = v35;
  id v13 = [(PIParallaxSegmentationItem *)v7 resource];

  if (v13)
  {
    uint64_t v14 = [(PIParallaxSegmentationItem *)v7 resource];
    id v15 = [a1 segmentationCompositionForAssetResource:v14];
    [(PIParallaxSegmentationItem *)v7 setComposition:v15];

    id v16 = [(PIParallaxSegmentationItem *)v7 settlingEffectVideoData];

    if (v16)
    {
      id v17 = [(PIParallaxSegmentationItem *)v7 settlingEffectVideoData];
      [(PIParallaxSegmentationItem *)v7 settlingEffectNormalizedBounds];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v26 = [(PIParallaxSegmentationItem *)v7 composition];
      double v27 = objc_msgSend(a1, "livePhotoCompositionForVideoData:cropRect:photoComposition:", v17, v26, v19, v21, v23, v25);
      [(PIParallaxSegmentationItem *)v7 setComposition:v27];
    }
  }
  double v28 = (id)s_log_22531;
  double v29 = v28;
  os_signpost_id_t v30 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)double v34 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v30, "PISegmentationLoader.archive.read", "", v34, 2u);
  }

  if (a4) {
    char v31 = v11;
  }
  else {
    char v31 = 1;
  }
  if (v31)
  {
    double v32 = v7;
  }
  else
  {
    double v32 = 0;
    *a4 = v12;
  }

  return v32;
}

+ (id)loadSegmentationItemFromURL:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    char v11 = NUAssertLogger_22535();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileURL != nil");
      *(_DWORD *)buf = 138543362;
      double v25 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v13 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v15 = NUAssertLogger_22535();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        double v19 = dispatch_get_specific(*v13);
        double v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        double v22 = [v20 callStackSymbols];
        double v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v25 = v19;
        __int16 v26 = 2114;
        double v27 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v25 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  os_signpost_id_t v7 = v6;
  id v8 = [a1 _loadSegmentationItemFromURL:v6 error:a4];
  if ([v8 isComplete])
  {
    id v9 = v8;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Segmentation item is incomplete" object:v7];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)saveSegmentationItem:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v21 = NUAssertLogger_22535();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      double v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "item != nil");
      *(_DWORD *)buf = 138543362;
      id v49 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v23 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v25 = NUAssertLogger_22535();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        id specific = dispatch_get_specific(*v23);
        double v37 = (void *)MEMORY[0x1E4F29060];
        id v5 = specific;
        double v23 = [v37 callStackSymbols];
        double v38 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v49 = specific;
        __int16 v50 = 2114;
        id v51 = v38;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      double v23 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v49 = v23;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v29 = _NUAssertFailHandler();
    goto LABEL_34;
  }
  os_signpost_id_t v10 = v9;
  if (!v9)
  {
    double v27 = NUAssertLogger_22535();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileURL != nil");
      *(_DWORD *)buf = 138543362;
      id v49 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v23 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v25 = NUAssertLogger_22535();
    int v29 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v29)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        os_signpost_id_t v30 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v49 = v30;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_36:

      int v34 = _NUAssertFailHandler();
      goto LABEL_37;
    }
LABEL_34:
    if (v29)
    {
      id specific = dispatch_get_specific(*v23);
      uint64_t v39 = (void *)MEMORY[0x1E4F29060];
      id v5 = specific;
      os_signpost_id_t v40 = [v39 callStackSymbols];
      uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v49 = specific;
      __int16 v50 = 2114;
      id v51 = v41;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v31 = NUAssertLogger_22535();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      double v32 = [NSString stringWithFormat:@"Invalid segmentation item: %@", v8];
      *(_DWORD *)buf = 138543362;
      id v49 = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v5 = (const void **)MEMORY[0x1E4F7A308];
    double v33 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id specific = NUAssertLogger_22535();
    int v34 = os_log_type_enabled(specific, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        id v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v49 = v36;
        _os_log_error_impl(&dword_1A9680000, specific, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_39;
    }
LABEL_37:
    if (v34)
    {
      id v42 = dispatch_get_specific(*v5);
      id v43 = (void *)MEMORY[0x1E4F29060];
      id v44 = v42;
      id v45 = [v43 callStackSymbols];
      id v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v49 = v42;
      __int16 v50 = 2114;
      id v51 = v46;
      _os_log_error_impl(&dword_1A9680000, specific, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_39:

    _NUAssertFailHandler();
  }
  char v11 = (id)s_log_22531;
  id v12 = v11;
  os_signpost_id_t v13 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PISegmentationLoader.archive.write", "", buf, 2u);
  }

  id v47 = 0;
  char v14 = [v8 saveToURL:v10 error:&v47];
  id v15 = v47;
  BOOL v16 = (id)s_log_22531;
  id v17 = v16;
  os_signpost_id_t v18 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PISegmentationLoader.archive.write", "", buf, 2u);
  }

  if (a5) {
    char v19 = v14;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0) {
    *a5 = v15;
  }

  return v14;
}

+ (id)segmentationSourceForImageURL:(id)a3 fileUTI:(id)a4 orientation:(int64_t)a5 proxyImage:(CGImage *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    char v14 = NUAssertLogger_22535();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "imageURL != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v16 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    os_signpost_id_t v18 = NUAssertLogger_22535();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        double v22 = dispatch_get_specific(*v16);
        double v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        double v25 = [v23 callStackSymbols];
        BOOL v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v22;
        __int16 v29 = 2114;
        os_signpost_id_t v30 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      double v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v21;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  os_signpost_id_t v10 = v9;
  if (a6)
  {
    char v11 = [MEMORY[0x1E4F1E050] imageWithCGImage:a6];
    id v12 = +[PIPhotoEditHelper imageSourceWithURL:v8 type:v10 proxyImage:v11 orientation:1 useEmbeddedPreview:1];
  }
  else
  {
    id v12 = +[PIPhotoEditHelper imageSourceWithURL:v8 type:v9 useEmbeddedPreview:0];
  }

  return v12;
}

+ (id)segmentationCompositionForImageURL:(id)a3 fileUTI:(id)a4 orientation:(int64_t)a5 proxyImage:(CGImage *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  char v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    double v25 = NUAssertLogger_22535();
    BOOL v16 = "imageURL != nil";
    id v14 = &unk_1A980A000;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "imageURL != nil");
      BOOL v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      double v32 = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v15 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    char v11 = NUAssertLogger_22535();
    BOOL v27 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        id specific = dispatch_get_specific(*v15);
        uint64_t v28 = (void *)MEMORY[0x1E4F29060];
        id v14 = specific;
        id v15 = [v28 callStackSymbols];
        a5 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v32 = (const void **)specific;
        __int16 v33 = 2114;
        int64_t v34 = a5;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v32 = v15;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_19:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
    goto LABEL_5;
  }
  id specific = v12;
  id v14 = +[PIPhotoEditHelper newComposition];
  id v15 = [a1 segmentationSourceForImageURL:v11 fileUTI:specific orientation:a5 proxyImage:a6];
  [v14 setObject:v15 forKeyedSubscript:@"source"];
  [v14 setMediaType:1];
  a5 = [objc_alloc(MEMORY[0x1E4F7A520]) initWithComposition:v14];
  id v30 = 0;
  BOOL v16 = [(id)a5 submitSynchronous:&v30];
  id v6 = v30;
  if (v16)
  {
    id v17 = [v16 properties];
    uint64_t v18 = [v17 orientation];

    goto LABEL_8;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_19;
  }
LABEL_5:
  BOOL v19 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    double v23 = v19;
    id v24 = [v11 path];
    *(_DWORD *)buf = 138412546;
    double v32 = v24;
    __int16 v33 = 2114;
    int64_t v34 = (int64_t)v6;
    _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Failed to read orientation for image file: %@, error: %{public}@", buf, 0x16u);
  }
  uint64_t v18 = 1;
LABEL_8:
  double v20 = [[PICompositionController alloc] initWithComposition:v14];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __90__PISegmentationLoader_segmentationCompositionForImageURL_fileUTI_orientation_proxyImage___block_invoke;
  v29[3] = &__block_descriptor_40_e43_v16__0__PIOrientationAdjustmentController_8l;
  v29[4] = v18;
  [(PICompositionController *)v20 modifyAdjustmentWithKey:@"orientation" modificationBlock:v29];
  id v21 = [(PICompositionController *)v20 composition];

  return v21;
}

uint64_t __90__PISegmentationLoader_segmentationCompositionForImageURL_fileUTI_orientation_proxyImage___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOrientation:*(void *)(a1 + 32)];
}

+ (id)livePhotoCompositionForVideoData:(id)a3 cropRect:(CGRect)a4 photoComposition:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    double v20 = NUAssertLogger_22535();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "videoData != nil");
      id v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v55 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v22 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v24 = NUAssertLogger_22535();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        double v38 = dispatch_get_specific(*v22);
        uint64_t v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        double v22 = [v39 callStackSymbols];
        uint64_t v41 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v55 = (const void **)v38;
        __int16 v56 = 2114;
        v57 = v41;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      BOOL v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v22 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v55 = v22;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v30 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  id v12 = v11;
  if (!v11)
  {
    BOOL v27 = NUAssertLogger_22535();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      uint64_t v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v55 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v22 = (const void **)MEMORY[0x1E4F7A308];
    __int16 v29 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v24 = NUAssertLogger_22535();
    int v30 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v22 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v55 = v22;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_27:

      int v35 = _NUAssertFailHandler();
      goto LABEL_28;
    }
LABEL_25:
    if (v30)
    {
      id v42 = dispatch_get_specific(*v22);
      id v43 = (void *)MEMORY[0x1E4F29060];
      id v44 = v42;
      double v22 = [v43 callStackSymbols];
      id v45 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v55 = (const void **)v42;
      __int16 v56 = 2114;
      v57 = v45;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if ([v11 mediaType] != 1)
  {
    double v32 = NUAssertLogger_22535();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition.mediaType == NUMediaTypeImage");
      __int16 v33 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v55 = v33;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v22 = (const void **)MEMORY[0x1E4F7A308];
    int64_t v34 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v24 = NUAssertLogger_22535();
    int v35 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!v34)
    {
      if (v35)
      {
        double v36 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v55 = v37;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_30;
    }
LABEL_28:
    if (v35)
    {
      id v46 = dispatch_get_specific(*v22);
      id v47 = (void *)MEMORY[0x1E4F29060];
      id v48 = v46;
      id v49 = [v47 callStackSymbols];
      __int16 v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v55 = (const void **)v46;
      __int16 v56 = 2114;
      v57 = v50;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_30:

    _NUAssertFailHandler();
  }
  os_signpost_id_t v13 = +[PIPhotoEditHelper videoSourceWithVideoData:v10 orientation:1];
  uint64_t v52 = @"appliedCropRect";
  *(CGFloat *)id v51 = x;
  *(CGFloat *)&v51[1] = y;
  *(CGFloat *)&v51[2] = width;
  *(CGFloat *)&v51[3] = height;
  id v14 = [MEMORY[0x1E4F29238] valueWithBytes:v51 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  CGRect v53 = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  BOOL v16 = [v13 definition];
  [v16 setSourceOptions:v15];

  id v17 = [v12 objectForKeyedSubscript:@"source"];
  uint64_t v18 = +[PIPhotoEditHelper livePhotoSourceWithPhotoSource:v17 videoSource:v13];
  [v12 setObject:v18 forKeyedSubscript:@"source"];
  [v12 setMediaType:3];

  return v12;
}

+ (id)segmentationCompositionForProxyImage:(CGImage *)a3 orientation:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v12 = NUAssertLogger_22535();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "proxyImage != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v14 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v16 = NUAssertLogger_22535();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        double v20 = dispatch_get_specific(*v14);
        id v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        double v23 = [v21 callStackSymbols];
        id v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v20;
        __int16 v29 = 2114;
        int v30 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v19;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v6 = +[PIPhotoEditHelper newComposition];
  os_signpost_id_t v7 = (void *)MEMORY[0x1E4F1E050];
  uint64_t v25 = *MEMORY[0x1E4F1E380];
  uint64_t v26 = MEMORY[0x1E4F1CC28];
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v9 = [v7 imageWithCGImage:a3 options:v8];

  id v10 = +[PIPhotoEditHelper imageSourceWithCIImage:v9 orientation:a4];
  [v6 setObject:v10 forKeyedSubscript:@"source"];
  [v6 setMediaType:1];

  return v6;
}

+ (id)renderPriorityForResourcePriority:(int64_t)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:v3];
  return v4;
}

+ (id)proxyScalePolicy
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:3048192];
  return v2;
}

+ (BOOL)clientIsMobileSlideShow
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];

  LOBYTE(v2) = [v3 isEqualToString:@"com.apple.mobileslideshow"];
  return (char)v2;
}

+ (void)_freeResources
{
  uint64_t v3 = (id)s_log_22531;
  id v4 = v3;
  os_signpost_id_t v5 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PISegmentationLoader.memory.purge", "", buf, 2u);
  }

  if (([a1 clientIsMobileSlideShow] & 1) == 0) {
    [MEMORY[0x1E4F7A448] freeAllResources:1];
  }
  id v6 = (id)s_log_22531;
  os_signpost_id_t v7 = v6;
  os_signpost_id_t v8 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PISegmentationLoader.memory.purge", "", v9, 2u);
  }
}

+ (void)_ensureResources
{
  id v2 = +[PISchema registeredPhotosSchemaIdentifier];
}

+ (void)freeResources
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&sResourceLock);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  uint64_t v3 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = sResourceCounter;
    _os_log_debug_impl(&dword_1A9680000, v3, OS_LOG_TYPE_DEBUG, "Freeing segmentation loader resources with counter %ld", buf, 0xCu);
  }
  uint64_t v4 = sResourceCounter;
  if (sResourceCounter == 1)
  {
    [a1 _freeResources];
    uint64_t v4 = sResourceCounter;
  }
  if (v4 <= 0)
  {
    os_signpost_id_t v5 = NUAssertLogger_22535();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unbalanced call to freeResources detected! (%ld)", sResourceCounter);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = (uint64_t)v6;
      _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    os_signpost_id_t v7 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v9 = NUAssertLogger_22535();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        os_signpost_id_t v13 = dispatch_get_specific(*v7);
        id v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        BOOL v16 = [v14 callStackSymbols];
        BOOL v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = (uint64_t)v13;
        __int16 v20 = 2114;
        id v21 = v17;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      id v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = (uint64_t)v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  sResourceCounter = v4 - 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&sResourceLock);
}

+ (void)ensureResources
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&sResourceLock);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  uint64_t v3 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = sResourceCounter;
    _os_log_debug_impl(&dword_1A9680000, v3, OS_LOG_TYPE_DEBUG, "Ensuring segmentation resources with counter %ld", buf, 0xCu);
  }
  uint64_t v4 = sResourceCounter;
  if (!sResourceCounter)
  {
    [a1 _ensureResources];
    uint64_t v4 = sResourceCounter;
  }
  if (v4 < 0)
  {
    os_signpost_id_t v5 = NUAssertLogger_22535();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unbalanced call to ensureResources detected! (%ld)", sResourceCounter);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = (uint64_t)v6;
      _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    os_signpost_id_t v7 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v9 = NUAssertLogger_22535();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        os_signpost_id_t v13 = dispatch_get_specific(*v7);
        id v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        BOOL v16 = [v14 callStackSymbols];
        BOOL v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = (uint64_t)v13;
        __int16 v20 = 2114;
        id v21 = v17;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      id v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = (uint64_t)v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  sResourceCounter = v4 + 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&sResourceLock);
}

+ (void)warmUpClassificationDetectors
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v2 = objc_alloc_init(MEMORY[0x1E4F457A8]);
  [v4 addObject:v2];

  id v3 = objc_alloc_init(MEMORY[0x1E4F458F8]);
  [v4 addObject:v3];

  [MEMORY[0x1E4F7A720] warmUpRequests:v4];
}

+ (void)warmUpResources
{
  id v3 = (id)s_log_22531;
  id v4 = v3;
  os_signpost_id_t v5 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PISegmentationLoader.memory.warmUp", "", buf, 2u);
  }

  [MEMORY[0x1E4F7A730] warmUp];
  [a1 warmUpClassificationDetectors];
  id v6 = (id)s_log_22531;
  os_signpost_id_t v7 = v6;
  os_signpost_id_t v8 = s_signpost_22532;
  if ((unint64_t)(s_signpost_22532 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PISegmentationLoader.memory.warmUp", "", v9, 2u);
  }
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PISegmentationLoader_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (initialize_onceToken_22862 != -1) {
    dispatch_once(&initialize_onceToken_22862, block);
  }
}

os_signpost_id_t __34__PISegmentationLoader_initialize__block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.photos.PhotoImaging", "segmentation");
  id v3 = (void *)s_log_22531;
  s_log_22531 = (uint64_t)v2;

  os_signpost_id_t result = os_signpost_id_make_with_pointer((os_log_t)s_log_22531, *(const void **)(a1 + 32));
  s_signpost_22532 = result;
  return result;
}

@end