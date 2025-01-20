@interface PISegmentation
+ ($2753767B6D5E71768FC0A26EE39D5FB2)settlingEffectGatingStatisticsFromScores:(SEL)a3;
+ (BOOL)curatedSegmentationGatingDecisionForSegmentationScores:(id)a3;
+ (BOOL)currentDeviceSupportsSettlingEffect;
+ (BOOL)layoutGatingDecisionForSegmentationScores:(id)a3;
+ (BOOL)manualSegmentationGatingDecisionForSegmentationScores:(id)a3;
+ (BOOL)settlingEffectLayoutContainsHeadroomForSegmentationScores:(id)a3;
+ (BOOL)settlingEffectLayoutDecisionForSegmentationScores:(id)a3;
+ (BOOL)settlingEffectStabilizationDecisionForSegmentationScores:(id)a3;
+ (BOOL)settlingEffectVideoDecisionForSegmentationScores:(id)a3;
+ (BOOL)tryLoadSegmentationForColdAsset:(id)a3;
+ (CGImage)createFullExtentPreviewImageForWallpaperAtURL:(id)a3 error:(id *)a4;
+ (id)_styleFromOptions:(id)a3 item:(id)a4;
+ (id)segmentationLoaderForAsset:(id)a3;
+ (unint64_t)_layerStackOptionsFromOptions:(id)a3;
+ (unint64_t)currentVersion;
+ (unint64_t)settlingEffectGatingFailuresFromScores:(id)a3;
+ (void)_createReadOnlyCopyOfPosterAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6;
+ (void)_upgradeFullPosterAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6;
+ (void)_upgradeWallpaperAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6;
+ (void)cancelSegmentationForAsset:(id)a3;
+ (void)computeSegmentationScoresForAsset:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)ensureResources;
+ (void)exportWallpaperForAsset:(id)a3 toURL:(id)a4 options:(id)a5 completion:(id)a6;
+ (void)freeResources;
+ (void)loadSegmentationDataForAsset:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)loadSegmentationItemForAsset:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)setSegmentationLoader:(id)a3 forAsset:(id)a4;
+ (void)upgradePosterConfiguration:(id)a3 atURL:(id)a4 exportTo:(id)a5 options:(id)a6 completion:(id)a7;
+ (void)upgradeWallpaperAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6;
+ (void)warmUpResources;
@end

@implementation PISegmentation

+ (void)loadSegmentationDataForAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    v20 = NUAssertLogger_25216();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "asset != nil");
      *(_DWORD *)buf = 138543362;
      v39 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v22 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v24 = NUAssertLogger_25216();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        __int16 v40 = 2114;
        v41 = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v27;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v10 = (void (**)(void, void, void))v9;
  v11 = [v8 objectForKeyedSubscript:PISegmentationOptionLayoutConfiguration];
  v12 = [v8 objectForKeyedSubscript:PISegmentationOptionLayoutProvider];
  v13 = [v8 objectForKeyedSubscript:PISegmentationOptionSegmentationData];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E4F7A438];
      v18 = @"Invalid layout configuration option: %@";
      v19 = v11;
LABEL_15:
      v15 = [v17 invalidError:v18 object:v19];
      ((void (**)(void, void, void *))v10)[2](v10, 0, v15);
      goto LABEL_18;
    }
  }
  if (v12 && ([v12 conformsToProtocol:&unk_1F002A260] & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E4F7A438];
    v18 = @"Invalid layout provider option: %@";
    v19 = v12;
    goto LABEL_15;
  }
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E4F7A438];
      v18 = @"Invalid segmentationData option: %@";
      v19 = v13;
      goto LABEL_15;
    }
  }
  v14 = [[PISegmentationLoader alloc] initWithParallaxAsset:v7];
  v15 = v14;
  if (v11) {
    [(PISegmentationLoader *)v14 setLayoutConfiguration:v11];
  }
  [v15 setLayoutProvider:v12];
  [v15 setDisableSettlingEffect:1];
  [v15 setDisableHeadroomLayout:1];
  [v15 setPerformMediaAnalysisInProcess:1];
  if (v13)
  {
    id v16 = [v13 item];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke;
    v36[3] = &unk_1E5D81528;
    v37 = v10;
    [v15 refreshSegmentationItem:v16 completion:v36];
  }
  else
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke_2;
    v33[3] = &unk_1E5D81550;
    id v34 = v15;
    v35 = v10;
    [v34 loadSegmentationItemWithCompletion:v33];

    id v16 = v34;
  }

LABEL_18:
}

void __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[PISegmentationData alloc] initWithSegmentationItem:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke_3;
    v5[3] = &unk_1E5D81528;
    id v3 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v3 refreshSegmentationItem:a2 completion:v5];
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[PISegmentationData alloc] initWithSegmentationItem:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (CGImage)createFullExtentPreviewImageForWallpaperAtURL:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"PISegmentation.m", 767, @"Invalid parameter not satisfying: %@", @"sourceURL != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, a1, @"PISegmentation.m", 768, @"Invalid parameter not satisfying: %@", @"outError != nil" object file lineNumber description];

LABEL_3:
  id v8 = +[PISegmentationLoader loadCompoundLayerStackFromWallpaperURL:v7 options:2 error:a4];
  id v9 = v8;
  if (v8)
  {
    v10 = [v8 portraitLayerStack];
    v11 = [v10 backgroundBackfillLayer];
    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1E018]);
      v13 = (void *)[v12 initWithOptions:MEMORY[0x1E4F1CC08]];
      v14 = +[PISegmentationHelper imageFromImageLayer:v11];
      v15 = [v10 foregroundBackfillLayer];
      if (v15)
      {
        id v16 = +[PISegmentationHelper imageFromImageLayer:v15];
        uint64_t v17 = [v16 imageByCompositingOverImage:v14];

        v14 = (void *)v17;
      }
      v18 = [v10 layout];
      [v18 imageSize];
      double v21 = v19;
      double v22 = v20;
      if (v19 == 0.0 || v20 == 0.0 || v19 == *MEMORY[0x1E4F8A250] && v20 == *(double *)(MEMORY[0x1E4F8A250] + 8))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218496;
          double v34 = v21;
          __int16 v35 = 2048;
          double v36 = v22;
          __int16 v37 = 2048;
          uint64_t v38 = 0x3FF0000000000000;
          _os_log_fault_impl(&dword_1A9680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
        }
      }
      else
      {
        double v23 = v19 / v20;
      }
      objc_msgSend(v11, "pixelSize", v23);
      PFSizeWithAspectRatioFittingSize();
      double v26 = v25;
      double v28 = v27;

      v29 = objc_msgSend(v14, "imageByCroppingToRect:", 0.0, 0.0, v26, v28);

      [v29 extent];
      v24 = (CGImage *)objc_msgSend(v13, "createCGImage:fromRect:", v29);
      if (!v24)
      {
        *a4 = [MEMORY[0x1E4F7A438] failureError:@"Failed to render image" object:v7];
      }
    }
    else
    {
      [MEMORY[0x1E4F7A438] missingError:@"Missing required layer in layer stack" object:v7];
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (void)upgradePosterConfiguration:(id)a3 atURL:(id)a4 exportTo:(id)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v66 = a4;
  id v64 = a5;
  id v12 = a6;
  id v55 = a7;
  uint64_t v13 = [v12 mutableCopy];
  v69 = v11;
  v14 = v11;
  v15 = (void *)v13;
  id v16 = [v14 editConfiguration];
  uint64_t v17 = [v16 style];

  if (v17)
  {
    v18 = [MEMORY[0x1E4F8CCA8] dictionaryWithStyle:v17];
    [v15 setObject:v18 forKeyedSubscript:PISegmentationOptionStyle];
  }
  double v19 = [MEMORY[0x1E4F8CE48] deviceConfiguration];
  uint64_t v20 = [v12 objectForKeyedSubscript:PISegmentationOptionLayoutConfiguration];
  if (v20)
  {
    id v87 = 0;
    double v21 = [MEMORY[0x1E4F8CE48] compoundDeviceConfigurationFromDictionary:v20 error:&v87];
    id v22 = v87;
    if (v21)
    {
      id v23 = v21;

      double v19 = v23;
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
      }
      v24 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v90 = v20;
        __int16 v91 = 2114;
        id v92 = v22;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Failed to deserialize layout configuration: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
  }
  v68 = v15;
  double v25 = dispatch_group_create();
  double v26 = (void *)[v69 copy];
  double v27 = [v69 media];
  v62 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v27, "count"));
  double v28 = [v12 objectForKeyedSubscript:PISegmentationOptionLayerStackOptions];
  v29 = v28;
  if (v28)
  {
    if (([v28 unsignedIntegerValue] & 4) != 0)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
      }
      v32 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9680000, v32, OS_LOG_TYPE_INFO, "Upgrading poster media: SETTING .hasInactiveContent", buf, 2u);
      }
      unint64_t v31 = [v26 options] | 4;
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
      }
      id v30 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9680000, v30, OS_LOG_TYPE_INFO, "Upgrading poster media: CLEARING .hasInactiveContent", buf, 2u);
      }
      unint64_t v31 = [v26 options] & 0xFFFFFFFFFFFFFFFBLL;
    }
    [v26 setOptions:v31];
  }
  v63 = v26;
  v53 = v29;
  v54 = v19;
  v57 = v12;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v27;
  uint64_t v33 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
  v56 = (void *)v20;
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v59 = *(void *)v84;
    do
    {
      uint64_t v35 = 0;
      double v36 = v17;
      do
      {
        if (*(void *)v84 != v59) {
          objc_enumerationMutation(obj);
        }
        __int16 v37 = *(void **)(*((void *)&v83 + 1) + 8 * v35);
        dispatch_group_enter(v25);
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
        }
        uint64_t v38 = (void *)*MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
        {
          uint64_t v39 = v38;
          __int16 v40 = [v37 assetUUID];
          *(_DWORD *)buf = 138543362;
          uint64_t v90 = (uint64_t)v40;
          _os_log_impl(&dword_1A9680000, v39, OS_LOG_TYPE_INFO, "Upgrading poster media: %{public}@", buf, 0xCu);
        }
        v41 = [v37 subpath];
        uint64_t v42 = [v66 URLByAppendingPathComponent:v41];

        v43 = [v37 subpath];
        v44 = [v64 URLByAppendingPathComponent:v43];

        v45 = [v37 editConfiguration];
        uint64_t v17 = [v45 style];

        if (v17)
        {
          v46 = [MEMORY[0x1E4F8CCA8] dictionaryWithStyle:v17];
          [v68 setObject:v46 forKeyedSubscript:PISegmentationOptionStyle];
        }
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __79__PISegmentation_upgradePosterConfiguration_atURL_exportTo_options_completion___block_invoke;
        v78[3] = &unk_1E5D814D8;
        v78[4] = v37;
        id v79 = v69;
        id v80 = v63;
        id v81 = v62;
        v47 = v25;
        v82 = v47;
        [a1 _upgradeWallpaperAtURL:v42 exportToURL:v44 options:v68 completion:v78];
        dispatch_group_wait(v47, 0xFFFFFFFFFFFFFFFFLL);

        ++v35;
        double v36 = v17;
      }
      while (v34 != v35);
      uint64_t v34 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
    }
    while (v34);
  }

  v48 = dispatch_queue_create("PISegmentation.upgrade", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PISegmentation_upgradePosterConfiguration_atURL_exportTo_options_completion___block_invoke_169;
  block[3] = &unk_1E5D81500;
  id v71 = v62;
  id v72 = obj;
  id v73 = v63;
  id v74 = v54;
  id v75 = v64;
  id v76 = v66;
  id v77 = v55;
  id v67 = v66;
  id v65 = v64;
  id v61 = v54;
  id v49 = v63;
  id v50 = v55;
  id v51 = obj;
  id v52 = v62;
  dispatch_group_notify(v25, v48, block);
}

void __79__PISegmentation_upgradePosterConfiguration_atURL_exportTo_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
    }
    id v7 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = v7;
      v10 = [v8 assetUUID];
      int v17 = 138543362;
      v18 = v10;
      _os_log_impl(&dword_1A9680000, v9, OS_LOG_TYPE_INFO, "Successfully upgraded poster media: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    id v11 = [*(id *)(a1 + 32) copy];
    uint64_t v12 = [*(id *)(a1 + 40) configurationType];
    uint64_t v13 = v11;
    if (v12 != 2) {
      uint64_t v13 = *(NSObject **)(a1 + 48);
    }
    [v13 setEditConfiguration:v5];
    [*(id *)(a1 + 56) addObject:v11];
    goto LABEL_9;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
  }
  v14 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    v15 = *(void **)(a1 + 32);
    id v11 = v14;
    id v16 = [v15 assetUUID];
    int v17 = 138543618;
    v18 = v16;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Failed to upgraded poster media: %{public}@, error: %{public}@", (uint8_t *)&v17, 0x16u);

LABEL_9:
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __79__PISegmentation_upgradePosterConfiguration_atURL_exportTo_options_completion___block_invoke_169(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = [*(id *)(a1 + 40) count];
  v4 = (void *)MEMORY[0x1E4F7A750];
  uint64_t v5 = *MEMORY[0x1E4F7A750];
  if (v2 != v3)
  {
    if (v5 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
    }
    __int16 v19 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      double v27 = *(void **)(a1 + 40);
      double v28 = v19;
      uint64_t v29 = [v27 count];
      uint64_t v30 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = v29 - v30;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Failed to upgrade %lu poster media", buf, 0xCu);
    }
    uint64_t v20 = *(void *)(a1 + 80);
    uint64_t v21 = (void *)MEMORY[0x1E4F7A438];
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count") - objc_msgSend(*(id *)(a1 + 32), "count"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = [v21 failureError:@"Failed to upgrade some poster media" object:v13];
    (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v22);
    goto LABEL_22;
  }
  if (v5 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
  }
  id v6 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v7 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = v7;
    *(_DWORD *)buf = 134217984;
    uint64_t v36 = [v8 count];
    _os_log_impl(&dword_1A9680000, v9, OS_LOG_TYPE_INFO, "Successfully upgraded %lu poster media", buf, 0xCu);
  }
  [*(id *)(a1 + 48) setMedia:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) setLayoutConfiguration:*(void *)(a1 + 56)];
  v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  id v34 = 0;
  int v12 = [v10 saveToURL:v11 error:&v34];
  id v13 = v34;
  if (!v12)
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
    }
    os_log_t v23 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v31 = *(void **)(a1 + 64);
      v32 = v23;
      uint64_t v33 = [v31 path];
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = (uint64_t)v33;
      __int16 v37 = 2114;
      id v38 = v13;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Failed to save poster configuration to '%{public}@', error: %{public}@", buf, 0x16u);
    }
    uint64_t v24 = *(void *)(a1 + 80);
    double v25 = (void *)MEMORY[0x1E4F7A438];
    id v22 = [*(id *)(a1 + 64) path];
    double v26 = [v25 errorWithCode:1 reason:@"Failed to save poster configuration" object:v22 underlyingError:v13];
    (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v26);

LABEL_22:
    goto LABEL_23;
  }
  if (*v4 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
  }
  os_log_t v14 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(void **)(a1 + 72);
    id v16 = v14;
    int v17 = [v15 path];
    v18 = [*(id *)(a1 + 64) path];
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = (uint64_t)v17;
    __int16 v37 = 2114;
    id v38 = v18;
    _os_log_impl(&dword_1A9680000, v16, OS_LOG_TYPE_DEFAULT, "Successfully upgraded poster configuration from '%{public}@' to '%{public}@'", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_23:
}

+ (void)_createReadOnlyCopyOfPosterAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a6;
  id v70 = 0;
  uint64_t v11 = [MEMORY[0x1E4F8CCF8] loadFromURL:v8 error:&v70];
  id v12 = v70;
  if (v11)
  {
    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    os_log_t v14 = [v9 path];
    char v15 = [v13 fileExistsAtPath:v14];

    if ((v15 & 1) == 0)
    {
      id v69 = v12;
      char v16 = [v13 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v69];
      id v17 = v69;

      if ((v16 & 1) == 0)
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
        }
        id v38 = (void *)*MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
        {
          v47 = v38;
          v48 = [v9 path];
          *(_DWORD *)buf = 138543618;
          id v73 = v48;
          __int16 v74 = 2114;
          id v75 = v17;
          _os_log_error_impl(&dword_1A9680000, v47, OS_LOG_TYPE_ERROR, "Failed to create destination: '%{public}@', error: %{public}@", buf, 0x16u);
        }
        id obj = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to create destination" object:v9 underlyingError:v17];
        v10[2](v10, 0);
LABEL_43:

        id v12 = v17;
        goto LABEL_44;
      }
      id v12 = v17;
    }
    v56 = v10;
    v57 = v13;
    v18 = [v11 media];
    uint64_t v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v18;
    uint64_t v19 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    v58 = v11;
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v60 = *(void *)v66;
      id v61 = v9;
      uint64_t v21 = off_1E5D7E000;
LABEL_7:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v66 != v60) {
          objc_enumerationMutation(obj);
        }
        os_log_t v23 = *(void **)(*((void *)&v65 + 1) + 8 * v22);
        uint64_t v24 = objc_msgSend(v23, "subpath", v55);
        id v25 = v8;
        double v26 = [v8 URLByAppendingPathComponent:v24];

        double v27 = [v23 subpath];
        double v28 = [v61 URLByAppendingPathComponent:v27];

        uint64_t v29 = v21[10];
        id v64 = v12;
        uint64_t v30 = [(__objc2_class *)v29 loadCompoundLayerStackFromWallpaperURL:v26 options:1 error:&v64];
        id v17 = v64;

        if (!v30) {
          break;
        }
        unint64_t v31 = v21;
        v32 = v21[10];
        id v63 = v17;
        char v33 = [(__objc2_class *)v32 saveSegmentationItem:0 compoundLayerStack:v30 style:0 toWallpaperURL:v28 error:&v63];
        id v12 = v63;

        if ((v33 & 1) == 0)
        {
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
          }
          id v9 = v61;
          v41 = (void *)*MEMORY[0x1E4F7A758];
          v10 = v56;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
          {
            id v51 = v41;
            id v52 = [v26 path];
            *(_DWORD *)buf = 138543618;
            id v73 = v52;
            __int16 v74 = 2114;
            id v75 = v12;
            _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "Failed to save layer stack: '%{public}@', error: %{public}@", buf, 0x16u);
          }
          __int16 v40 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to save layer stack" object:v26 underlyingError:v12];
          id v17 = v12;
LABEL_36:
          ((void (*)(void (**)(id, void), void, void *))v10[2])(v10, 0, v40);

          id v34 = obj;
          uint64_t v35 = (void *)v55;
          goto LABEL_42;
        }

        ++v22;
        id v8 = v25;
        uint64_t v21 = v31;
        if (v20 == v22)
        {
          uint64_t v20 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
          id v9 = v61;
          uint64_t v11 = v58;
          if (v20) {
            goto LABEL_7;
          }
          goto LABEL_14;
        }
      }
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
      }
      id v9 = v61;
      uint64_t v39 = (void *)*MEMORY[0x1E4F7A758];
      v10 = v56;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        id v49 = v39;
        id v50 = [v26 path];
        *(_DWORD *)buf = 138543618;
        id v73 = v50;
        __int16 v74 = 2114;
        id v75 = v17;
        _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Failed to load layer stack: '%{public}@', error: %{public}@", buf, 0x16u);
      }
      __int16 v40 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load layer stack" object:v26 underlyingError:v17];
      uint64_t v30 = 0;
      goto LABEL_36;
    }
LABEL_14:

    id v34 = (void *)[v11 copy];
    uint64_t v35 = (void *)v55;
    [v34 setMedia:v55];
    id v62 = v12;
    int v36 = [v34 saveToURL:v9 error:&v62];
    id v17 = v62;

    if (v36)
    {
      id v25 = v8;
      double v26 = [v34 editConfiguration];
      v10 = v56;
      ((void (*)(void (**)(id, void), void *, void))v56[2])(v56, v26, 0);
    }
    else
    {
      v10 = v56;
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
      }
      id v25 = v8;
      uint64_t v42 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        v53 = v42;
        v54 = [v9 path];
        *(_DWORD *)buf = 138543618;
        id v73 = v54;
        __int16 v74 = 2114;
        id v75 = v17;
        _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "Failed to save poster configuration to '%{public}@', error: %{public}@", buf, 0x16u);
      }
      v43 = (void *)MEMORY[0x1E4F7A438];
      double v26 = objc_msgSend(v9, "path", v55);
      v44 = [v43 errorWithCode:1 reason:@"Failed to save poster configuration" object:v26 underlyingError:v17];
      ((void (*)(void (**)(id, void), void, void *))v56[2])(v56, 0, v44);
    }
LABEL_42:

    id v8 = v25;
    id v13 = v57;
    uint64_t v11 = v58;
    goto LABEL_43;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
  }
  __int16 v37 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    v45 = v37;
    v46 = [v8 path];
    *(_DWORD *)buf = 138543618;
    id v73 = v46;
    __int16 v74 = 2114;
    id v75 = v12;
    _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "Failed to load poster configuration from: '%{public}@', error: %{public}@", buf, 0x16u);
  }
  id v13 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load poster configuration from source URL" object:v8 underlyingError:v12];
  ((void (*)(void (**)(id, void), void, void *))v10[2])(v10, 0, v13);
LABEL_44:
}

+ (void)_upgradeFullPosterAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v24 = 0;
  os_log_t v14 = [MEMORY[0x1E4F8CCF8] loadFromURL:v10 error:&v24];
  id v15 = v24;
  if (v14)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__PISegmentation__upgradeFullPosterAtURL_exportToURL_options_completion___block_invoke;
    v20[3] = &unk_1E5D814B0;
    id v21 = v10;
    id v22 = v11;
    id v23 = v13;
    [a1 upgradePosterConfiguration:v14 atURL:v21 exportTo:v22 options:v12 completion:v20];

    char v16 = v21;
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
    }
    id v17 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      uint64_t v19 = [v10 path];
      *(_DWORD *)buf = 138543618;
      double v26 = v19;
      __int16 v27 = 2114;
      id v28 = v15;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Failed to load poster configuration from: '%{public}@', error: %{public}@", buf, 0x16u);
    }
    char v16 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load poster configuration from source URL" object:v10 underlyingError:v15];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v16);
  }
}

void __73__PISegmentation__upgradeFullPosterAtURL_exportToURL_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
    }
    id v7 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = v7;
      id v10 = [v8 path];
      id v11 = [*(id *)(a1 + 40) path];
      int v20 = 138543618;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_impl(&dword_1A9680000, v9, OS_LOG_TYPE_DEFAULT, "Successfully upgraded poster configuration from: '%{public}@' to: '%{public}@'", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [v5 editConfiguration];
    (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
    }
    os_log_t v14 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      char v16 = *(void **)(a1 + 32);
      id v17 = v14;
      v18 = [v16 path];
      uint64_t v19 = [*(id *)(a1 + 40) path];
      int v20 = 138543874;
      id v21 = v18;
      __int16 v22 = 2114;
      id v23 = v19;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Failed to upgrade poster configuration from: '%{public}@' to: '%{public}@', error: %{public}@", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v15 = *(void *)(a1 + 48);
    id v13 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to upgrade poster configuration from source URL" object:*(void *)(a1 + 32) underlyingError:v6];
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v13);
  }
}

+ (void)_upgradeWallpaperAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v52 = 0;
  os_log_t v14 = +[PISegmentationLoader loadSegmentationItemFromWallpaperURL:v10 error:&v52];
  id v15 = v52;
  if (v14)
  {
    id v42 = a1;
    char v16 = [MEMORY[0x1E4F8CE48] deviceConfiguration];
    uint64_t v17 = [v12 objectForKeyedSubscript:PISegmentationOptionLayoutConfiguration];
    v43 = (void *)v17;
    v44 = v11;
    if (v17)
    {
      v18 = v16;
      id v51 = 0;
      uint64_t v19 = [MEMORY[0x1E4F8CE48] compoundDeviceConfigurationFromDictionary:v17 error:&v51];
      id v20 = v51;
      if (v19)
      {
        id v21 = v12;
        id v22 = v19;

        v18 = v22;
      }
      else
      {
        id v21 = v12;
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
        }
        __int16 v24 = *MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v54 = v43;
          __int16 v55 = 2114;
          id v56 = v20;
          _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Failed to deserialize layout configuration: %{public}@, error: %{public}@", buf, 0x16u);
        }
      }
      id v12 = v21;

      char v16 = v18;
    }
    id v50 = v15;
    id v25 = +[PISegmentationLoader loadCompoundLayerStackFromWallpaperURL:v10 options:0 error:&v50];
    id v23 = v50;

    if (v25)
    {
      id v40 = v23;
      uint64_t v26 = [v25 layout];
      v41 = v16;
      __int16 v27 = [v26 layoutByUpgradingToConfiguration:v16];

      id v28 = objc_alloc_init(MEMORY[0x1E4F8CD08]);
      uint64_t v29 = [v27 portraitLayout];
      [v29 normalizedVisibleFrame];
      NURectFlipYOrigin();
      objc_msgSend(v28, "setNormalizedVisibleFrame:");

      uint64_t v39 = v27;
      uint64_t v30 = [v27 landscapeLayout];
      [v30 normalizedVisibleFrame];
      NURectFlipYOrigin();
      objc_msgSend(v28, "setNormalizedLandscapeVisibleFrame:");

      unint64_t v31 = [v25 portraitLayerStack];
      objc_msgSend(v28, "setIsDepthEnabled:", objc_msgSend(v31, "depthEnabled"));

      v32 = [v25 portraitLayerStack];
      objc_msgSend(v28, "setIsPerspectiveZoomEnabled:", objc_msgSend(v32, "parallaxDisabled") ^ 1);

      char v33 = [v25 portraitLayerStack];
      objc_msgSend(v28, "setIsSettlingEffectEnabled:", objc_msgSend(v33, "settlingEffectEnabled"));

      uint64_t v34 = [v42 _layerStackOptionsFromOptions:v12] | 1;
      if ([v28 isSettlingEffectEnabled])
      {
        uint64_t v35 = +[PIParallaxStyle defaultOriginalStyle];
        int v36 = [v35 bakedStyle];
      }
      else
      {
        int v36 = [v42 _styleFromOptions:v12 item:v14];
      }
      [v28 setStyle:v36];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __72__PISegmentation__upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke;
      v45[3] = &unk_1E5D81488;
      id v46 = v10;
      id v47 = v44;
      id v48 = v28;
      id v49 = v13;
      id v37 = v28;
      id v38 = +[PISegmentationLoader saveSegmentationItem:v14 layerStackOptions:v34 configuration:v37 style:v36 layout:v39 toWallpaperURL:v47 completion:v45];

      char v16 = v41;
      id v23 = v40;
    }
    else
    {
      (*((void (**)(id, void, id))v13 + 2))(v13, 0, v23);
    }

    id v11 = v44;
  }
  else
  {
    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v15);
    id v23 = v15;
  }
}

void __72__PISegmentation__upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
    }
    v4 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = v4;
      id v13 = [v11 path];
      os_log_t v14 = [*(id *)(a1 + 40) path];
      int v15 = 138543874;
      char v16 = v13;
      __int16 v17 = 2114;
      v18 = v14;
      __int16 v19 = 2114;
      id v20 = v3;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Failed to export refreshed wallpaper at %{public}@ to %{public}@, error: %{public}@", (uint8_t *)&v15, 0x20u);
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
    }
    id v6 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = v6;
      id v9 = [v7 path];
      id v10 = [*(id *)(a1 + 40) path];
      int v15 = 138543618;
      char v16 = v9;
      __int16 v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1A9680000, v8, OS_LOG_TYPE_DEFAULT, "Successfully exported refreshed wallpaper at %{public}@ to %{public}@", (uint8_t *)&v15, 0x16u);
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v5();
}

+ (void)upgradeWallpaperAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    uint64_t v29 = NUAssertLogger_25216();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sourceURL != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    unint64_t v31 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    char v33 = NUAssertLogger_25216();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        id v42 = dispatch_get_specific(*v31);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        id v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v46;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
LABEL_27:
      id v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v41;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_33:

    _NUAssertFailHandler();
    __break(1u);
  }
  if (!v11)
  {
    uint64_t v35 = NUAssertLogger_25216();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      int v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "destinationURL != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v37 = (const void **)MEMORY[0x1E4F7A308];
    id v38 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    char v33 = NUAssertLogger_25216();
    BOOL v39 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (!v39) {
        goto LABEL_33;
      }
      goto LABEL_27;
    }
    if (v39)
    {
      id v47 = dispatch_get_specific(*v37);
      id v48 = (void *)MEMORY[0x1E4F29060];
      id v49 = v47;
      id v50 = [v48 callStackSymbols];
      id v51 = [v50 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v47;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v51;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_33;
  }
  os_log_t v14 = v13;
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
  }
  int v15 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    char v16 = v15;
    __int16 v17 = [v10 path];
    v18 = [v11 path];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2114;
    id v62 = v12;
    _os_log_impl(&dword_1A9680000, v16, OS_LOG_TYPE_DEFAULT, "Upgrading wallpaper at %{public}@ to %{public}@, options: %{public}@", buf, 0x20u);
  }
  __int16 v19 = [v12 objectForKeyedSubscript:PISegmentationOptionOutOfProcess];
  int v20 = [v19 BOOLValue];

  if (v20)
  {
    uint64_t v21 = (void *)[v12 mutableCopy];
    [v21 setObject:0 forKeyedSubscript:PISegmentationOptionOutOfProcess];
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2050000000;
    id v22 = (void *)getVCPMediaAnalysisServiceClass_softClass_25324;
    uint64_t v60 = getVCPMediaAnalysisServiceClass_softClass_25324;
    if (!getVCPMediaAnalysisServiceClass_softClass_25324)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getVCPMediaAnalysisServiceClass_block_invoke_25325;
      id v62 = &unk_1E5D81578;
      id v63 = &v57;
      __getVCPMediaAnalysisServiceClass_block_invoke_25325((uint64_t)buf);
      id v22 = (void *)v58[3];
    }
    id v23 = v22;
    _Block_object_dispose(&v57, 8);
    __int16 v24 = [v23 sharedAnalysisService];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __71__PISegmentation_upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke;
    v55[3] = &unk_1E5D81438;
    id v56 = v14;
    [v24 requestWallpaperUpgradeAtURL:v10 toDestinationURL:v11 withOptions:v21 andCompletionHandler:v55];
  }
  else
  {
    [a1 ensureResources];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __71__PISegmentation_upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke_2;
    v52[3] = &unk_1E5D81460;
    id v53 = v14;
    id v54 = a1;
    id v25 = (void (**)(void, void, void))MEMORY[0x1AD0F8FE0](v52);
    uint64_t v26 = [v12 objectForKeyedSubscript:PISegmentationOptionWallpaperUpgradeMode];
    uint64_t v27 = [v26 integerValue];

    switch(v27)
    {
      case 0:
        [a1 _upgradeWallpaperAtURL:v10 exportToURL:v11 options:v12 completion:v25];
        break;
      case 1:
        [a1 _upgradeFullPosterAtURL:v10 exportToURL:v11 options:v12 completion:v25];
        break;
      case 2:
        id v28 = [MEMORY[0x1E4F7A438] unsupportedError:@"Not implemented yet" object:0];
        ((void (**)(void, void, void *))v25)[2](v25, 0, v28);

        break;
      case 3:
        [a1 _createReadOnlyCopyOfPosterAtURL:v10 exportToURL:v11 options:v12 completion:v25];
        break;
      default:
        break;
    }

    uint64_t v21 = v53;
  }
}

void __71__PISegmentation_upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"WallpaperPosterConfigDataResults"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v5;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v9];
    id v8 = v9;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = v8;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __71__PISegmentation_upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 freeResources];
}

+ (id)_styleFromOptions:(id)a3 item:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:PISegmentationOptionStyle];
  if (!v7) {
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [v6 availableStyles];
    v17[1] = (id)MEMORY[0x1E4F143A8];
    v17[2] = (id)3221225472;
    v17[3] = __41__PISegmentation__styleFromOptions_item___block_invoke;
    v17[4] = &unk_1E5D81410;
    id v18 = v8;
    id v10 = v8;
    PFFind();
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11) {
      goto LABEL_27;
    }
LABEL_18:
    id v12 = [v5 objectForKeyedSubscript:PISegmentationOptionStyleCategory];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v6 suggestedStyleForCategory:v12];
        goto LABEL_26;
      }
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
      }
      int v15 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v12;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Unknown style category option, ignored: %{public}@", buf, 0xCu);
      }
    }
    id v11 = 0;
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v7;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
    }
    os_log_t v14 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v7;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Unknown style option, ignored: %{public}@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  v17[0] = 0;
  id v11 = [MEMORY[0x1E4F8CCA8] styleWithDictionary:v7 error:v17];
  id v12 = v17[0];
  if (!v11)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
    }
    id v13 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v12;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Failed to deserialize style from dictionary: %{public}@, error: %{public}@", buf, 0x16u);
    }

    goto LABEL_18;
  }
LABEL_26:

LABEL_27:
  return v11;
}

uint64_t __41__PISegmentation__styleFromOptions_item___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (unint64_t)_layerStackOptionsFromOptions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:PISegmentationOptionLayerStackOptions];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = NUAssertLogger_25216();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [NSString stringWithFormat:@"Invalid additionalLayerOptions: %@", v4];
        *(_DWORD *)buf = 138543362;
        __int16 v21 = v8;
        _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      id v9 = (const void **)MEMORY[0x1E4F7A308];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      id v11 = NUAssertLogger_25216();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v12)
        {
          int v15 = dispatch_get_specific(*v9);
          char v16 = (void *)MEMORY[0x1E4F29060];
          id v17 = v15;
          id v18 = [v16 callStackSymbols];
          __int16 v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          __int16 v21 = v15;
          __int16 v22 = 2114;
          uint64_t v23 = v19;
          _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v12)
      {
        id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
        os_log_t v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        __int16 v21 = v14;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
    }
    unint64_t v5 = [v4 unsignedIntegerValue];
  }
  else
  {
    unint64_t v5 = 1;
  }

  return v5;
}

+ (void)exportWallpaperForAsset:(id)a3 toURL:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    __int16 v21 = NUAssertLogger_25216();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "asset != nil");
      __int16 v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v53 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v25 = NUAssertLogger_25216();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        BOOL v34 = dispatch_get_specific(*v23);
        uint64_t v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        uint64_t v23 = [v35 callStackSymbols];
        id v37 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v53 = (const void **)v34;
        __int16 v54 = 2114;
        __int16 v55 = v37;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v53 = v23;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v31 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!v11)
  {
    id v28 = NUAssertLogger_25216();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "wallpaperURL != nil");
      uint64_t v29 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v53 = v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v30 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v25 = NUAssertLogger_25216();
    int v31 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (!v30)
    {
      if (v31)
      {
        v32 = [MEMORY[0x1E4F29060] callStackSymbols];
        char v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v53 = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v31)
    {
      id v38 = dispatch_get_specific(*v23);
      BOOL v39 = (void *)MEMORY[0x1E4F29060];
      id v40 = v38;
      v41 = [v39 callStackSymbols];
      id v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v53 = (const void **)v38;
      __int16 v54 = 2114;
      __int16 v55 = v42;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  os_log_t v14 = v13;
  [a1 ensureResources];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __67__PISegmentation_exportWallpaperForAsset_toURL_options_completion___block_invoke;
  v49[3] = &unk_1E5D813C0;
  id v50 = v14;
  id v51 = a1;
  id v15 = v14;
  char v16 = (void *)MEMORY[0x1AD0F8FE0](v49);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __67__PISegmentation_exportWallpaperForAsset_toURL_options_completion___block_invoke_2;
  v43[3] = &unk_1E5D813E8;
  id v47 = v16;
  id v48 = a1;
  id v44 = v12;
  id v45 = v11;
  id v46 = v10;
  id v17 = v10;
  id v18 = v16;
  id v19 = v11;
  id v20 = v12;
  [a1 loadSegmentationItemForAsset:v17 options:v20 completion:v43];
}

uint64_t __67__PISegmentation_exportWallpaperForAsset_toURL_options_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 freeResources];
}

void __67__PISegmentation_exportWallpaperForAsset_toURL_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v13)
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:PISegmentationOptionDisableRendering];
    char v7 = [v6 BOOLValue];

    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [*(id *)(a1 + 64) _layerStackOptionsFromOptions:*(void *)(a1 + 32)];
    }
    id v11 = [*(id *)(a1 + 64) _styleFromOptions:*(void *)(a1 + 32) item:v13];
    id v12 = +[PISegmentationLoader saveSegmentationItem:v13 layerStackOptions:v8 configuration:0 style:v11 layout:0 toWallpaperURL:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F7A438];
    id v10 = [*(id *)(a1 + 48) localIdentifier];
    id v11 = [v9 errorWithCode:1 reason:@"Segmentation failure" object:v10 underlyingError:v5];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

+ (id)segmentationLoaderForAsset:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  id v6 = (void *)s_segmentationLoaderMap;
  char v7 = [v4 localIdentifier];
  uint64_t v8 = [v6 objectForKey:v7];

  objc_sync_exit(v5);
  return v8;
}

+ (void)setSegmentationLoader:(id)a3 forAsset:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = a1;
  objc_sync_enter(v7);
  uint64_t v8 = (void *)s_segmentationLoaderMap;
  if (s_segmentationLoaderMap)
  {
    if (v12)
    {
LABEL_3:
      id v9 = [v6 localIdentifier];
      [v8 setObject:v12 forKey:v9];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v11 = (void *)s_segmentationLoaderMap;
    s_segmentationLoaderMap = v10;

    uint64_t v8 = (void *)s_segmentationLoaderMap;
    if (v12) {
      goto LABEL_3;
    }
  }
  id v9 = [v6 localIdentifier];
  [v8 removeObjectForKey:v9];
LABEL_6:

  objc_sync_exit(v7);
}

+ (BOOL)tryLoadSegmentationForColdAsset:(id)a3
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v30[0] = PISegmentationOptionDisableDownload;
  v30[1] = PISegmentationOptionDisableRendering;
  v31[0] = MEMORY[0x1E4F1CC38];
  v31[1] = MEMORY[0x1E4F1CC38];
  v30[2] = PISegmentationOptionLowResolution;
  v31[2] = MEMORY[0x1E4F1CC28];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __50__PISegmentation_tryLoadSegmentationForColdAsset___block_invoke;
  id v19 = &unk_1E5D81398;
  __int16 v21 = &v22;
  id v7 = v5;
  id v20 = v7;
  [a1 loadSegmentationItemForAsset:v4 options:v6 completion:&v16];
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  intptr_t v9 = dispatch_group_wait(v7, v8);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
  }
  uint64_t v10 = (id)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = objc_msgSend(v4, "localIdentifier", v16, v17, v18, v19);
    id v12 = (void *)v11;
    if (v9)
    {
      id v13 = @"NO (timeout)";
    }
    else if (*((unsigned char *)v23 + 24))
    {
      id v13 = @"YES";
    }
    else
    {
      id v13 = @"NO";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v11;
    __int16 v28 = 2114;
    uint64_t v29 = v13;
    _os_log_impl(&dword_1A9680000, v10, OS_LOG_TYPE_INFO, "Can load cold asset? %{public}@ => %{public}@", buf, 0x16u);
  }
  if (v9) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = *((unsigned char *)v23 + 24) != 0;
  }

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __50__PISegmentation_tryLoadSegmentationForColdAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 != 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ ($2753767B6D5E71768FC0A26EE39D5FB2)settlingEffectGatingStatisticsFromScores:(SEL)a3
{
  id v6 = a4;
  __int16 v7 = [a2 settlingEffectGatingFailuresFromScores:v6];
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  retstr->var12 = 0;
  BOOL v8 = +[PISegmentation settlingEffectVideoDecisionForSegmentationScores:v6];
  BOOL v9 = +[PISegmentation settlingEffectLayoutDecisionForSegmentationScores:v6];

  if ((v7 & 0x40) == 0)
  {
    if ((v7 & 0x800) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 4);
    }
    else if ((v7 & 0x80) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 8);
    }
    else if ((v7 & 0x100) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 12);
    }
    else if ((v7 & 0x200) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 16);
    }
    else if (v7)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 20);
    }
    else if ((v7 & 2) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 24);
    }
    else if ((v7 & 4) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 28);
    }
    else if ((v7 & 8) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 32);
    }
    else if ((v7 & 0x10) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 36);
    }
    else if (v8)
    {
      if (v9)
      {
        if ((v7 & 0x20) == 0) {
          return result;
        }
        retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 48);
      }
      else
      {
        retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 44);
      }
    }
    else
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 40);
    }
  }
  retstr->var0 = 1;
  return result;
}

+ (unint64_t)settlingEffectGatingFailuresFromScores:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F8D200]];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

+ (BOOL)settlingEffectLayoutContainsHeadroomForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:a3] >> 6) & 1;
}

+ (BOOL)settlingEffectLayoutDecisionForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:a3] >> 5) & 1;
}

+ (BOOL)settlingEffectVideoDecisionForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:a3] >> 4) & 1;
}

+ (BOOL)settlingEffectStabilizationDecisionForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:a3] >> 3) & 1;
}

+ (BOOL)currentDeviceSupportsSettlingEffect
{
  return +[PISegmentationLoader currentDeviceSupportsSettlingEffect];
}

+ (BOOL)layoutGatingDecisionForSegmentationScores:(id)a3
{
  return +[PISegmentationGating gatingResultForSegmentationScores:a3] & 1;
}

+ (BOOL)manualSegmentationGatingDecisionForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:a3] >> 2) & 1;
}

+ (BOOL)curatedSegmentationGatingDecisionForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:a3] >> 1) & 1;
}

+ (void)cancelSegmentationForAsset:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v6 = NUAssertLogger_25216();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "asset != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v10 = NUAssertLogger_25216();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        id v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        uint64_t v17 = [v15 callStackSymbols];
        id v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v21 = v14;
        __int16 v22 = 2114;
        uint64_t v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      id v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v19 = v4;
  id v5 = [a1 segmentationLoaderForAsset:v4];
  [v5 cancel];
}

+ (void)loadSegmentationItemForAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id specific = a4;
  id v12 = a5;
  if (!v10)
  {
    id v40 = NUAssertLogger_25216();
    id v15 = "asset != nil";
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "asset != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = (uint64_t)v41;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v14 = (PISegmentationLoader *)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v16 = NUAssertLogger_25216();
    BOOL v42 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        id specific = dispatch_get_specific(v14->super.isa);
        id v46 = (void *)MEMORY[0x1E4F29060];
        id v10 = specific;
        BOOL v14 = [v46 callStackSymbols];
        id v47 = [(PISegmentationLoader *)v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v65 = (uint64_t)specific;
        __int16 v66 = 2114;
        id v67 = v47;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v42)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v14 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = (uint64_t)v14;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v45 = _NUAssertFailHandler();
    goto LABEL_46;
  }
  id v13 = v12;
  BOOL v14 = [[PISegmentationLoader alloc] initWithParallaxAsset:v10];
  [(PISegmentationLoader *)v14 setSourceMode:1];
  id v15 = [specific objectForKeyedSubscript:PISegmentationOptionClassification];
  if (!v15) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v43 = NUAssertLogger_25216();
    id v10 = &unk_1A980A000;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      id v44 = [NSString stringWithFormat:@"Invalid classification option: %@", v15];
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = (uint64_t)v44;
      _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v14 = (PISegmentationLoader *)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v16 = NUAssertLogger_25216();
    int v45 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v45)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v14 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v65 = (uint64_t)v14;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_48:

      id v50 = v15;
      _NUAssertFailHandler();
LABEL_49:
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_295);
LABEL_9:
      uint64_t v17 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v65 = v6;
        __int16 v66 = 2114;
        id v67 = v10;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Failed to deserialize layout configuration: %{public}@, error: %{public}@", buf, 0x16u);
      }
      goto LABEL_11;
    }
LABEL_46:
    if (v45)
    {
      id specific = dispatch_get_specific(v14->super.isa);
      id v48 = (void *)MEMORY[0x1E4F29060];
      id v10 = specific;
      BOOL v14 = [v48 callStackSymbols];
      id v49 = [(PISegmentationLoader *)v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v65 = (uint64_t)specific;
      __int16 v66 = 2114;
      id v67 = v49;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_48;
  }
  -[PISegmentationLoader setClassification:](v14, "setClassification:", [v15 unsignedIntegerValue]);
LABEL_5:
  uint64_t v6 = [specific objectForKeyedSubscript:PISegmentationOptionLayoutConfiguration];
  if (!v6) {
    goto LABEL_12;
  }
  __int16 v7 = v13;
  id v5 = v10;
  id v63 = 0;
  id v16 = [MEMORY[0x1E4F8CE48] compoundDeviceConfigurationFromDictionary:v6 error:&v63];
  id v10 = v63;
  if (!v16)
  {
    if (*MEMORY[0x1E4F7A750] == -1) {
      goto LABEL_9;
    }
    goto LABEL_49;
  }
  [(PISegmentationLoader *)v14 setLayoutConfiguration:v16];
LABEL_11:

  id v10 = v5;
  id v13 = v7;
LABEL_12:
  id v18 = objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionLowResolution, v50);
  id v19 = v18;
  if (v18) {
    -[PISegmentationLoader setLoadFirstResourceOnly:](v14, "setLoadFirstResourceOnly:", [v18 BOOLValue]);
  }
  id v20 = [specific objectForKeyedSubscript:PISegmentationOptionDisableDownload];
  __int16 v21 = v20;
  if (v20) {
    -[PISegmentationLoader setDisableDownload:](v14, "setDisableDownload:", [v20 BOOLValue]);
  }
  __int16 v22 = [specific objectForKeyedSubscript:PISegmentationOptionPriority];
  uint64_t v23 = v22;
  if (v22) {
    -[PISegmentationLoader setPriority:](v14, "setPriority:", [v22 integerValue]);
  }
  uint64_t v24 = [specific objectForKeyedSubscript:PISegmentationOptionDisableSegmentation];
  char v25 = v24;
  if (v24) {
    -[PISegmentationLoader setDisableSegmentation:](v14, "setDisableSegmentation:", [v24 BOOLValue]);
  }
  id v52 = v25;
  __int16 v54 = v21;
  BOOL v26 = [specific objectForKeyedSubscript:PISegmentationOptionDisableRendering];
  uint64_t v27 = v26;
  if (v26) {
    -[PISegmentationLoader setDisableRendering:](v14, "setDisableRendering:", [v26 BOOLValue]);
  }
  id v51 = v27;
  __int16 v28 = [specific objectForKeyedSubscript:PISegmentationOptionEnableSettlingEffect];
  uint64_t v29 = v28;
  uint64_t v57 = v15;
  if (v28) {
    uint64_t v30 = [v28 BOOLValue] ^ 1;
  }
  else {
    uint64_t v30 = 1;
  }
  [(PISegmentationLoader *)v14 setDisableSettlingEffect:v30];
  int v31 = [specific objectForKeyedSubscript:PISegmentationOptionSettlingEffectGatingLevel];
  v32 = v31;
  uint64_t v56 = (void *)v6;
  if (v31) {
    uint64_t v33 = [v31 integerValue];
  }
  else {
    uint64_t v33 = 2;
  }
  id v53 = v23;
  __int16 v55 = v19;
  [(PISegmentationLoader *)v14 setSettlingEffectGatingLevel:v33];
  BOOL v34 = [specific objectForKeyedSubscript:PISegmentationOptionOutOfProcess];
  uint64_t v35 = v34;
  if (v34) {
    -[PISegmentationLoader setPerformMediaAnalysisInProcess:](v14, "setPerformMediaAnalysisInProcess:", [v34 BOOLValue] ^ 1);
  }
  uint64_t v36 = [specific objectForKeyedSubscript:PISegmentationOptionPetsRegions];
  uint64_t v37 = [specific objectForKeyedSubscript:PISegmentationOptionPetsFaceRegions];
  if (v36 | v37)
  {
    [(PISegmentationLoader *)v14 setPetsRegions:v36];
    [(PISegmentationLoader *)v14 setPetsFaceRegions:v37];
  }
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __66__PISegmentation_loadSegmentationItemForAsset_options_completion___block_invoke;
  v59[3] = &unk_1E5D81370;
  id v61 = v13;
  id v62 = a1;
  id v60 = v10;
  id v38 = v10;
  id v39 = v13;
  [(PISegmentationLoader *)v14 loadSegmentationItemWithCompletion:v59];
  [a1 setSegmentationLoader:v14 forAsset:v38];
}

uint64_t __66__PISegmentation_loadSegmentationItemForAsset_options_completion___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v2 = (void *)a1[6];
  uint64_t v3 = a1[4];
  return [v2 setSegmentationLoader:0 forAsset:v3];
}

+ (void)computeSegmentationScoresForAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    uint64_t v17 = NUAssertLogger_25216();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "asset != nil");
      id v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v19 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    __int16 v21 = NUAssertLogger_25216();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        uint64_t v30 = dispatch_get_specific(*v19);
        int v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        id v19 = [v31 callStackSymbols];
        uint64_t v33 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = (const void **)v30;
        __int16 v44 = 2114;
        int v45 = v33;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v19 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = v19;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v27 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!v9)
  {
    uint64_t v24 = NUAssertLogger_25216();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "options != nil");
      char v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v19 = (const void **)MEMORY[0x1E4F7A308];
    BOOL v26 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    __int16 v21 = NUAssertLogger_25216();
    int v27 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        __int16 v28 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v43 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v27)
    {
      BOOL v34 = dispatch_get_specific(*v19);
      uint64_t v35 = (void *)MEMORY[0x1E4F29060];
      id v36 = v34;
      uint64_t v37 = [v35 callStackSymbols];
      id v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v43 = (const void **)v34;
      __int16 v44 = 2114;
      int v45 = v38;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  BOOL v11 = v10;
  id v12 = [v9 objectForKeyedSubscript:PISegmentationOptionEnableSettlingEffect];
  int v13 = [v12 BOOLValue];

  BOOL v14 = (void *)[v9 mutableCopy];
  id v15 = [NSNumber numberWithInt:v13 ^ 1u];
  [v14 setObject:v15 forKeyedSubscript:PISegmentationOptionLowResolution];

  [a1 ensureResources];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __71__PISegmentation_computeSegmentationScoresForAsset_options_completion___block_invoke;
  v39[3] = &unk_1E5D81348;
  id v40 = v11;
  id v41 = a1;
  id v16 = v11;
  [a1 loadSegmentationItemForAsset:v8 options:v14 completion:v39];
}

uint64_t __71__PISegmentation_computeSegmentationScoresForAsset_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  __int16 v7 = [a2 scores];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v6);

  id v8 = *(void **)(a1 + 40);
  return [v8 freeResources];
}

+ (void)warmUpResources
{
}

+ (void)ensureResources
{
}

+ (void)freeResources
{
}

+ (unint64_t)currentVersion
{
  return 50;
}

@end