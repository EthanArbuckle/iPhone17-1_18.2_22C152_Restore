@interface PXMediaAnalysisVideoStabilizationRecipeSource
+ (id)cachedRecipeForAsset:(id)a3;
+ (void)cacheRecipe:(id)a3 forAsset:(id)a4;
- (PXMediaAnalysisVideoStabilizationRecipeSource)initWithAsset:(id)a3 videoDimensions:(CGSize)a4;
- (id)_loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4;
- (id)analyticsPayload;
@end

@implementation PXMediaAnalysisVideoStabilizationRecipeSource

- (void).cxx_destruct
{
}

- (id)_loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__199619;
  v51 = __Block_byref_object_dispose__199620;
  id v52 = 0;
  uint64_t v34 = [(PHAsset *)self->_asset localIdentifier];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v8 = [(PXVideoStabilizationRecipeSource *)self allowedAnalysisTypes];
  if ((v8 & 2) != 0)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], @"GyroStabilization", v34);
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AllowOnDemandGyro"];
  }
  if (v8)
  {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PixelStabilization"];
    if ([(PXVideoStabilizationRecipeSource *)self allowsOnDemandPixelAnalysis]) {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AllowOnDemandPixel"];
    }
  }
  v9 = objc_msgSend(MEMORY[0x1E4F744E8], "sharedAnalysisService", v34);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__199619;
  v45 = __Block_byref_object_dispose__199620;
  id v46 = 0;
  v10 = +[PXInlineVideoStabilizationSettings sharedInstance];
  int v11 = [v10 localCacheForMediaAnalysisRecipes];

  if (v11)
  {
    uint64_t v12 = [(id)objc_opt_class() cachedRecipeForAsset:self->_asset];
    v13 = (void *)v42[5];
    v42[5] = v12;
  }
  v14 = (void *)v42[5];
  if (v14) {
    goto LABEL_14;
  }
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v55[0] = self->_asset;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __87__PXMediaAnalysisVideoStabilizationRecipeSource__loadStabilizationRecipe_analysisType___block_invoke;
  v36[3] = &unk_1E5DC40D0;
  v39 = &v47;
  v40 = &v41;
  id v37 = v35;
  v17 = v15;
  v38 = v17;
  uint64_t v18 = [v9 requestVideoStabilizationForAssets:v16 withOptions:v7 progressHandler:0 andCompletionHandler:v36];

  dispatch_time_t v19 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v17, v19))
  {
    [v9 cancelRequest:v18];
    v20 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v33 = [(PHAsset *)self->_asset uuid];
      *(_DWORD *)buf = 138543362;
      v54 = v33;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video stabilization request timed out for asset %{public}@", buf, 0xCu);
    }
  }
  [(id)objc_opt_class() cacheRecipe:v42[5] forAsset:self->_asset];

  v14 = (void *)v42[5];
  if (v14)
  {
LABEL_14:
    v22 = (void *)[v14 mutableCopy];
    [v22 removeObjectsForKeys:&unk_1F02D4D98];
    v23 = (void *)[v22 copy];
    [(PXVideoStabilizationRecipeSource *)self setDebugInfo:v23];

    v24 = ICCreateCorrectionHomographiesWithNewImageCoordinates();
    id v25 = 0;
    if (v24)
    {
      id v26 = v24;
      v27 = [(id)v42[5] objectForKeyedSubscript:@"gyroStabilization"];
      int v28 = [v27 BOOLValue];

      char v29 = [(PXVideoStabilizationRecipeSource *)self allowedAnalysisTypes];
      v30 = 0;
      if (v28) {
        unint64_t v31 = v29 & 2;
      }
      else {
        unint64_t v31 = v29 & 1;
      }
    }
    else
    {
      v30 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithUnderlyingError:debugDescription:", v25, @"Recipe Denormalization Failed");
      unint64_t v31 = 0;
    }

    if (a4) {
      goto LABEL_20;
    }
  }
  else
  {
    v30 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithUnderlyingError:debugDescription:", v48[5], @"No recipe returned by MediaAnalysis");
    unint64_t v31 = 0;
    v24 = 0;
    if (a4) {
LABEL_20:
    }
      *a4 = v31;
  }
  if (a3) {
    *a3 = v30;
  }
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v24;
}

void __87__PXMediaAnalysisVideoStabilizationRecipeSource__loadStabilizationRecipe_analysisType___block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];

  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)analyticsPayload
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F56558];
  asset = self->_asset;
  uint64_t v7 = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&asset count:1];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v4;
}

- (PXMediaAnalysisVideoStabilizationRecipeSource)initWithAsset:(id)a3 videoDimensions:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXMediaAnalysisVideoStabilizationRecipeSource;
  v9 = [(PXVideoStabilizationRecipeSource *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    v10->_videoDimensions.CGFloat width = width;
    v10->_videoDimensions.CGFloat height = height;
  }

  return v10;
}

+ (void)cacheRecipe:(id)a3 forAsset:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (cacheRecipe_forAsset__onceToken != -1)
  {
    dispatch_once(&cacheRecipe_forAsset__onceToken, &__block_literal_global_199697);
    if (v5) {
      goto LABEL_3;
    }
LABEL_9:
    objc_super v12 = (void *)RecipeCache;
    v13 = [v6 localIdentifier];
    [v12 removeObjectForKey:v13];

    goto LABEL_10;
  }
  if (!v5) {
    goto LABEL_9;
  }
LABEL_3:
  v14[0] = @"AdjustmentDate";
  uint64_t v7 = [v6 adjustmentTimestamp];
  id v8 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = @"Recipe";
  v15[0] = v8;
  v15[1] = v5;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  if (!v7) {

  }
  id v10 = (void *)RecipeCache;
  int v11 = [v6 localIdentifier];
  [v10 setObject:v9 forKey:v11];

LABEL_10:
}

uint64_t __70__PXMediaAnalysisVideoStabilizationRecipeSource_cacheRecipe_forAsset___block_invoke()
{
  v0 = objc_alloc_init(PXLRUMemoryCache);
  v1 = (void *)RecipeCache;
  RecipeCache = (uint64_t)v0;

  uint64_t v2 = (void *)RecipeCache;
  return [v2 setNumberOfSlots:20];
}

+ (id)cachedRecipeForAsset:(id)a3
{
  id v3 = a3;
  v4 = (void *)RecipeCache;
  id v5 = [v3 localIdentifier];
  id v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    objc_super v12 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [v6 objectForKeyedSubscript:@"AdjustmentDate"];
  id v8 = [MEMORY[0x1E4F1CA98] null];

  v9 = [v3 adjustmentTimestamp];
  id v10 = v9;
  if (v7 == v8)
  {

    if (!v10) {
      goto LABEL_4;
    }
LABEL_7:
    objc_super v12 = 0;
    goto LABEL_8;
  }
  int v11 = [v9 isEqualToDate:v7];

  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  objc_super v12 = [v6 objectForKeyedSubscript:@"Recipe"];
LABEL_8:

LABEL_9:
  return v12;
}

@end