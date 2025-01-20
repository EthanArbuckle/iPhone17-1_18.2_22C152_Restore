@interface PXAssetVariationRenderProvider
+ (NSIndexSet)supportedVariationTypes;
+ (id)_renderingLog;
+ (id)sharedOperationQueue;
+ (void)_performSimulatedWorkWithProgress:(id)a3;
- (BOOL)_hasAllResults;
- (BOOL)renderAllResources;
- (CGSize)targetSize;
- (NSDate)_beginRenderingDate;
- (NSDictionary)analysisResult;
- (NSError)error;
- (NSIndexSet)desiredVariationTypes;
- (NSMutableDictionary)_renderingDurationByVariationType;
- (NSMutableDictionary)_renderingOperationsByVariationType;
- (NSNumber)_editSourceDuration;
- (NSNumber)_recipeGenerationDuration;
- (NSNumber)totalRenderingDuration;
- (NSOperation)_analysisOperation;
- (NSProgress)initialLoadingProgress;
- (NSString)statusDescription;
- (PXAssetVariationRenderProvider)init;
- (PXAssetVariationRenderProvider)initWithEditSourceLoader:(id)a3 targetSize:(CGSize)a4 desiredVariationTypes:(id)a5;
- (PXEditSourceLoader)editSourceLoader;
- (id)debugDescription;
- (id)progressForVariationType:(int64_t)a3;
- (id)renderResultForVariationType:(int64_t)a3;
- (int64_t)_variationSourceType;
- (int64_t)status;
- (void)_handleAnalysisOperationCompleted:(id)a3;
- (void)_handleCachedAnalysisResult:(id)a3;
- (void)_handleRenderingOperationCompleted:(id)a3;
- (void)_handleRenderingOperationStarted:(id)a3;
- (void)_invalidateAnalysisResult;
- (void)_invalidateCachedAnalysisResult;
- (void)_invalidateRenders;
- (void)_invalidateStatus;
- (void)_removeAllResults;
- (void)_setAnalysisOperation:(id)a3;
- (void)_setBeginRenderingDate:(id)a3;
- (void)_setEditSourceDuration:(id)a3;
- (void)_setError:(id)a3;
- (void)_setProgress:(id)a3 forVariationType:(int64_t)a4;
- (void)_setRecipeGenerationDuration:(id)a3;
- (void)_setResult:(id)a3 forVariationType:(int64_t)a4;
- (void)_setStatus:(int64_t)a3;
- (void)_setStatusDescription:(id)a3;
- (void)_updateAnalysisResult;
- (void)_updateCachedAnalysisResult;
- (void)_updateRenders;
- (void)_updateStatus;
- (void)beginRendering;
- (void)cancelRendering;
- (void)dealloc;
- (void)didPerformChanges;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnalysisResult:(id)a3;
- (void)setRenderAllResources:(BOOL)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setTotalRenderingDuration:(id)a3;
@end

@implementation PXAssetVariationRenderProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__renderingDurationByVariationType, 0);
  objc_storeStrong((id *)&self->__recipeGenerationDuration, 0);
  objc_storeStrong((id *)&self->__editSourceDuration, 0);
  objc_storeStrong((id *)&self->__beginRenderingDate, 0);
  objc_storeStrong((id *)&self->__renderingOperationsByVariationType, 0);
  objc_storeStrong((id *)&self->__analysisOperation, 0);
  objc_storeStrong((id *)&self->_totalRenderingDuration, 0);
  objc_storeStrong((id *)&self->_initialLoadingProgress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_desiredVariationTypes, 0);
  objc_storeStrong((id *)&self->_editSourceLoader, 0);
  objc_storeStrong((id *)&self->_analysisResult, 0);
  objc_storeStrong((id *)&self->_observedEditSourceLoaderProgress, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_recipeGenerationProgress, 0);
  objc_storeStrong((id *)&self->_progressesByVariationType, 0);
  objc_storeStrong((id *)&self->_resultsByVariationType, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (NSMutableDictionary)_renderingDurationByVariationType
{
  return self->__renderingDurationByVariationType;
}

- (void)_setRecipeGenerationDuration:(id)a3
{
}

- (NSNumber)_recipeGenerationDuration
{
  return self->__recipeGenerationDuration;
}

- (void)_setEditSourceDuration:(id)a3
{
}

- (NSNumber)_editSourceDuration
{
  return self->__editSourceDuration;
}

- (void)_setBeginRenderingDate:(id)a3
{
}

- (NSDate)_beginRenderingDate
{
  return self->__beginRenderingDate;
}

- (NSMutableDictionary)_renderingOperationsByVariationType
{
  return self->__renderingOperationsByVariationType;
}

- (void)_setAnalysisOperation:(id)a3
{
}

- (NSOperation)_analysisOperation
{
  return self->__analysisOperation;
}

- (void)setTotalRenderingDuration:(id)a3
{
}

- (NSNumber)totalRenderingDuration
{
  return self->_totalRenderingDuration;
}

- (NSProgress)initialLoadingProgress
{
  return self->_initialLoadingProgress;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setRenderAllResources:(BOOL)a3
{
  self->_renderAllResources = a3;
}

- (BOOL)renderAllResources
{
  return self->_renderAllResources;
}

- (NSIndexSet)desiredVariationTypes
{
  return self->_desiredVariationTypes;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXEditSourceLoader)editSourceLoader
{
  return self->_editSourceLoader;
}

- (NSDictionary)analysisResult
{
  return self->_analysisResult;
}

- (id)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v25.receiver = self;
  v25.super_class = (Class)PXAssetVariationRenderProvider;
  v4 = [(PXAssetVariationRenderProvider *)&v25 debugDescription];
  v5 = [v3 stringWithFormat:@"%@\n", v4];

  if ([(PXAssetVariationRenderProvider *)self status] == 5)
  {
    [v5 appendString:@"Failed:\n"];
    v6 = [(PXAssetVariationRenderProvider *)self error];
    v7 = [v6 description];
    [v5 appendString:v7];
  }
  else
  {
    [v5 appendString:@"Loading Durations\nImage URL: "];
    [v5 appendString:@"\nEdit Source: "];
    v8 = [(PXAssetVariationRenderProvider *)self _editSourceDuration];

    if (v8)
    {
      v9 = [(PXAssetVariationRenderProvider *)self _editSourceDuration];
      [v9 doubleValue];
      [v5 appendFormat:@"%.2fs", v10];
    }
    [v5 appendString:@"\nRecipes: "];
    v11 = [(PXAssetVariationRenderProvider *)self _recipeGenerationDuration];

    if (v11)
    {
      v12 = [(PXAssetVariationRenderProvider *)self _recipeGenerationDuration];
      [v12 doubleValue];
      [v5 appendFormat:@"%.2fs", v13];
    }
    else
    {
      v14 = [(PXAssetVariationRenderProvider *)self analysisResult];

      if (v14) {
        [v5 appendString:@"cached"];
      }
    }
    v15 = [(PXAssetVariationRenderProvider *)self desiredVariationTypes];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __50__PXAssetVariationRenderProvider_debugDescription__block_invoke;
    v22[3] = &unk_1E5DD1558;
    id v16 = v5;
    id v23 = v16;
    v24 = self;
    [v15 enumerateIndexesUsingBlock:v22];

    [v16 appendString:@"\nTotal duration: "];
    v17 = [(PXAssetVariationRenderProvider *)self totalRenderingDuration];

    if (v17)
    {
      v18 = [(PXAssetVariationRenderProvider *)self totalRenderingDuration];
      [v18 doubleValue];
      [v16 appendFormat:@"%.2fs", v19];
    }
    v6 = v23;
  }

  v20 = (void *)[v5 copy];
  return v20;
}

void __50__PXAssetVariationRenderProvider_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  if ((unint64_t)(a2 + 1) > 4) {
    v5 = @"Unknown";
  }
  else {
    v5 = off_1E5DB6DB0[a2 + 1];
  }
  v6 = v5;
  [v4 appendFormat:@"\n%@: ", v6];

  v7 = [*(id *)(a1 + 40) _renderingDurationByVariationType];
  v8 = [NSNumber numberWithInteger:a2];
  id v12 = [v7 objectForKeyedSubscript:v8];

  v9 = v12;
  if (v12)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    [v12 doubleValue];
    [v10 appendFormat:@"%.2fs", v11];
    v9 = v12;
  }
}

- (void)_setError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = (NSError *)a3;
  v6 = self->_error;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(NSError *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      if (v5)
      {
        v9 = PLUIGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = 138412546;
          uint64_t v11 = self;
          __int16 v12 = 2112;
          uint64_t v13 = v5;
          _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "%@ encountered error: %@", (uint8_t *)&v10, 0x16u);
        }
      }
      objc_storeStrong((id *)&self->_error, a3);
      [(PXAssetVariationRenderProvider *)self _invalidateStatus];
    }
  }
}

- (void)setAnalysisResult:(id)a3
{
  if (self->_analysisResult != a3)
  {
    v5 = (NSDictionary *)[a3 copy];
    analysisResult = self->_analysisResult;
    self->_analysisResult = v5;

    [(PXAssetVariationRenderProvider *)self _invalidateRenders];
    [(PXAssetVariationRenderProvider *)self _invalidateStatus];
    if (a3) {
      int64_t v7 = [(NSProgress *)self->_recipeGenerationProgress totalUnitCount];
    }
    else {
      int64_t v7 = 0;
    }
    [(NSProgress *)self->_recipeGenerationProgress setCompletedUnitCount:v7];
    [(PXAssetVariationRenderProvider *)self signalChange:2];
  }
}

- (void)_setStatusDescription:(id)a3
{
  char v8 = (NSString *)a3;
  v4 = self->_statusDescription;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      statusDescription = self->_statusDescription;
      self->_statusDescription = v6;

      [(PXAssetVariationRenderProvider *)self signalChange:16];
    }
  }
}

- (void)_setStatus:(int64_t)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (self->_status != a3)
  {
    self->_status = a3;
    if (a3 == 5)
    {
      v9 = (void *)MEMORY[0x1E4F56658];
      uint64_t v13 = *MEMORY[0x1E4F56560];
      int v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      v14[0] = v11;
      __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      [v9 sendEvent:@"com.apple.photos.CPAnalytics.rendering.livePhotoEffectFailed" withPayload:v12];
    }
    else if (a3 == 4)
    {
      v4 = [MEMORY[0x1E4F1C9C8] date];
      BOOL v5 = [(PXAssetVariationRenderProvider *)self _beginRenderingDate];
      [v4 timeIntervalSinceDate:v5];
      double v7 = v6;

      char v8 = [NSNumber numberWithDouble:v7];
      [(PXAssetVariationRenderProvider *)self setTotalRenderingDuration:v8];
    }
    [(PXAssetVariationRenderProvider *)self signalChange:4];
  }
}

- (void)_setProgress:(id)a3 forVariationType:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PXAssetVariationRenderProvider__setProgress_forVariationType___block_invoke;
  v8[3] = &unk_1E5DD0510;
  int v10 = self;
  int64_t v11 = a4;
  id v9 = v6;
  id v7 = v6;
  [(PXAssetVariationRenderProvider *)self performChanges:v8];
}

void __64__PXAssetVariationRenderProvider__setProgress_forVariationType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v3 = *(void **)(a1 + 32);
  id v7 = (id)v2;
  v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 112), "objectForKeyedSubscript:");

  if (v3 != v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(*(void *)(a1 + 40) + 112);
    if (v5) {
      [v6 setObject:v5 forKeyedSubscript:v7];
    }
    else {
      [v6 removeObjectForKey:v7];
    }
    [*(id *)(a1 + 40) signalChange:2];
  }
}

- (void)_removeAllResults
{
}

uint64_t __51__PXAssetVariationRenderProvider__removeAllResults__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PXAssetVariationRenderProvider__removeAllResults__block_invoke_2;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __51__PXAssetVariationRenderProvider__removeAllResults__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 200);
  *(void *)(v2 + 200) = 0;

  [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 112) removeAllObjects];
  [*(id *)(a1 + 32) _invalidateStatus];
  [*(id *)(a1 + 32) signalChange:1];
  v4 = *(void **)(a1 + 32);
  return [v4 signalChange:2];
}

- (void)_setResult:(id)a3 forVariationType:(int64_t)a4
{
  id v4 = a3;
  px_dispatch_on_main_queue();
}

void __62__PXAssetVariationRenderProvider__setResult_forVariationType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  id v9 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  objc_msgSend(v2, "objectForKeyedSubscript:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = *(id *)(a1 + 40);
  if (v3 == v4)
  {
  }
  else
  {
    uint64_t v5 = v4;
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __62__PXAssetVariationRenderProvider__setResult_forVariationType___block_invoke_2;
      v10[3] = &unk_1E5DD0510;
      uint64_t v7 = *(void *)(a1 + 48);
      char v8 = *(void **)(a1 + 40);
      id v11 = *(id *)(a1 + 32);
      uint64_t v13 = v7;
      id v12 = v8;
      [v11 performChanges:v10];
    }
  }
}

uint64_t __62__PXAssetVariationRenderProvider__setResult_forVariationType___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 104);
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v3 setObject:v2 forKeyedSubscript:v4];

  [*(id *)(a1 + 32) _invalidateStatus];
  [*(id *)(a1 + 32) signalChange:1];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  return [v5 _setProgress:0 forVariationType:v6];
}

- (void)_handleRenderingOperationCompleted:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 isCancelled] & 1) == 0)
  {
    uint64_t v5 = [v4 outputImageURL];
    uint64_t v6 = [v4 outputVideoURL];
    uint64_t v7 = [v4 outputImage];
    char v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      int v10 = (void *)MEMORY[0x1E4FB1818];
      id v11 = [v5 path];
      id v9 = [v10 imageWithContentsOfFile:v11];
    }
    id v12 = [v4 outputAVAsset];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x1E4F166C8] assetWithURL:v6];
    }
    v15 = v14;

    v4;
    id v16 = v15;
    id v17 = v9;
    id v18 = v6;
    id v19 = v5;
    px_dispatch_on_main_queue();
  }
}

void __69__PXAssetVariationRenderProvider__handleRenderingOperationCompleted___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) variationType];
  id v3 = [*(id *)(a1 + 32) error];
  id v4 = [*(id *)(a1 + 32) duration];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) _renderingDurationByVariationType];
    uint64_t v6 = [NSNumber numberWithInteger:v2];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 40) _renderingOperationsByVariationType];
  char v8 = [NSNumber numberWithInteger:v2];
  [v7 removeObjectForKey:v8];

  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v9 = [*(id *)(a1 + 40) renderResultForVariationType:v2];

    if (!v9)
    {
      int v10 = [*(id *)(a1 + 32) succeeded];
      id v11 = [PXAssetVariationRenderResult alloc];
      id v12 = v11;
      if (v10)
      {
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 56);
        v15 = [*(id *)(a1 + 32) analysisResult];
        id v16 = [*(id *)(a1 + 32) adjustedCompositionController];
        id v17 = [(PXAssetVariationRenderResult *)v12 initWithVariationType:v2 imageURL:v13 videoURL:v14 analysisResult:v15 compositionController:v16 success:1 error:0];

        [(PXAssetVariationRenderResult *)v17 setImage:*(void *)(a1 + 64)];
        [(PXAssetVariationRenderResult *)v17 setVideoAsset:*(void *)(a1 + 72)];
        id v18 = [*(id *)(a1 + 32) outputVideoComposition];
        [(PXAssetVariationRenderResult *)v17 setVideoComposition:v18];

        [(PXAssetVariationRenderResult *)v17 setFullsizeRender:1];
      }
      else
      {
        id v17 = [(PXAssetVariationRenderResult *)v11 initWithVariationType:v2 imageURL:0 videoURL:0 analysisResult:0 compositionController:0 success:0 error:v3];
        id v19 = PLUIGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412802;
          uint64_t v22 = v20;
          __int16 v23 = 2048;
          uint64_t v24 = v2;
          __int16 v25 = 2112;
          v26 = v3;
          _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "%@: rendering failed for type: %ld error: %@", buf, 0x20u);
        }
      }
      [*(id *)(a1 + 40) _setResult:v17 forVariationType:v2];
    }
  }
}

- (void)_handleRenderingOperationStarted:(id)a3
{
}

uint64_t __67__PXAssetVariationRenderProvider__handleRenderingOperationStarted___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__PXAssetVariationRenderProvider__handleRenderingOperationStarted___block_invoke_2;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __67__PXAssetVariationRenderProvider__handleRenderingOperationStarted___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateStatus];
}

- (void)_updateRenders
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXAssetVariationRenderProvider *)self desiredVariationTypes];
  id v4 = [(PXAssetVariationRenderProvider *)self analysisResult];
  uint64_t v5 = [(PXAssetVariationRenderProvider *)self editSourceLoader];
  uint64_t v6 = [v5 editSource];
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = (void *)v6;
  char v8 = [(PXAssetVariationRenderProvider *)self editSourceLoader];
  uint64_t v9 = [v8 compositionController];
  if (!v9)
  {

LABEL_10:
LABEL_11:

    goto LABEL_12;
  }
  int v10 = (void *)v9;
  uint64_t v11 = [v3 count];

  if (v11 && v4)
  {
    id v12 = [(PXAssetVariationRenderProvider *)self editSourceLoader];
    uint64_t v5 = [v12 editSource];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v16 = PLUIGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v32 = self;
          __int16 v33 = 2112;
          v34 = v5;
          _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "%@: expected Live Photo Edit Source, but got %@", buf, 0x16u);
        }

        id v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = *MEMORY[0x1E4F28568];
        v30 = @"Expected Live Photo Edit Source";
        id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        id v19 = [v17 errorWithDomain:@"PXAssetVariationRenderProviderErrorDomain" code:1 userInfo:v18];
        [(PXAssetVariationRenderProvider *)self _setError:v19];

        goto LABEL_11;
      }
    }
    uint64_t v13 = [(PXAssetVariationRenderProvider *)self editSourceLoader];
    uint64_t v7 = [v13 compositionController];

    if ([(PXEditSourceLoader *)self->_editSourceLoader baseVersion])
    {
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXEditSourceLoaderErrorDomain" code:0 userInfo:0];
      error = self->_error;
      self->_error = v14;
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __48__PXAssetVariationRenderProvider__updateRenders__block_invoke;
      aBlock[3] = &unk_1E5DB85F0;
      id v25 = v4;
      id v26 = v5;
      id v27 = v7;
      v28 = self;
      uint64_t v20 = _Block_copy(aBlock);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_5;
      v22[3] = &unk_1E5DC4A30;
      id v23 = v20;
      id v21 = v20;
      [v3 enumerateIndexesUsingBlock:v22];
    }
    goto LABEL_10;
  }
LABEL_12:
}

void __48__PXAssetVariationRenderProvider__updateRenders__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2 || *(void *)(a1 + 32))
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "px_tempDirectoryFileURLWithFileName:subdirectory:fileExtension:", v5, @"PXAssetVariationRenderProvider", @"jpg");
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "px_tempDirectoryFileURLWithFileName:subdirectory:fileExtension:", v5, @"PXAssetVariationRenderProvider", @"mov");
    char v8 = [PXAssetVariationRenderingOperation alloc];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    [*(id *)(a1 + 56) targetSize];
    double v13 = v12;
    double v15 = v14;
    LOBYTE(v25) = [*(id *)(a1 + 56) renderAllResources];
    id v16 = -[PXAssetVariationRenderingOperation initWithEditSource:variationType:analysisResult:baseCompositionController:outputImageURL:outputVideoURL:targetSize:renderAllResources:](v8, "initWithEditSource:variationType:analysisResult:baseCompositionController:outputImageURL:outputVideoURL:targetSize:renderAllResources:", v9, a2, v10, v11, v6, v7, v13, v15, v25);
    id v17 = [*(id *)(a1 + 56) _renderingOperationsByVariationType];
    id v18 = [NSNumber numberWithInteger:a2];
    id v19 = [v17 objectForKeyedSubscript:v18];
    [v19 cancel];

    uint64_t v20 = [*(id *)(a1 + 56) _renderingOperationsByVariationType];
    id v21 = [NSNumber numberWithInteger:a2];
    [v20 setObject:v16 forKeyedSubscript:v21];

    objc_initWeak(location, *(id *)(a1 + 56));
    objc_initWeak(&from, v16);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_2;
    v29[3] = &unk_1E5DD0838;
    objc_copyWeak(&v30, location);
    objc_copyWeak(&v31, &from);
    [(PXAssetVariationRenderingOperation *)v16 setCompletionBlock:v29];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_3;
    v26[3] = &unk_1E5DD0838;
    objc_copyWeak(&v27, location);
    objc_copyWeak(&v28, &from);
    [(PXAssetVariationRenderingOperation *)v16 setStartHandler:v26];
    uint64_t v22 = *(void **)(a1 + 56);
    id v23 = [(PXAssetVariationRenderingOperation *)v16 progress];
    [v22 _setProgress:v23 forVariationType:a2];

    uint64_t v24 = [(id)objc_opt_class() sharedOperationQueue];
    [v24 addOperation:v16];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
}

uint64_t __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleRenderingOperationCompleted:v2];
}

void __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_3(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 32));
  objc_copyWeak(&v3, (id *)(a1 + 40));
  px_dispatch_on_main_queue();
}

void __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleRenderingOperationStarted:v2];
}

- (void)_invalidateRenders
{
}

uint64_t __52__PXAssetVariationRenderProvider__invalidateRenders__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) setNeedsUpdateOf:sel__updateRenders];
}

- (void)_handleAnalysisOperationCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if (([v4 isCancelled] & 1) == 0)
    {
      uint64_t v6 = [(PXAssetVariationRenderProvider *)self _analysisOperation];

      if (v6 == v5)
      {
        uint64_t v7 = [v5 duration];
        [(PXAssetVariationRenderProvider *)self _setRecipeGenerationDuration:v7];

        [(PXAssetVariationRenderProvider *)self _setAnalysisOperation:0];
        if (![v5 succeeded])
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v16 = [v5 error];

          if (v16)
          {
            id v17 = [v5 error];
            [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
          }
          [v15 setObject:@"Failed to generate asset variation recipes." forKeyedSubscript:*MEMORY[0x1E4F28568]];
          id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXAssetVariationRenderProviderErrorDomain" code:2 userInfo:v15];
          px_dispatch_on_main_queue();
        }
        char v8 = [v5 analysisResult];
        uint64_t v9 = [(PXAssetVariationRenderProvider *)self editSourceLoader];
        uint64_t v10 = [v9 contentIdentifier];

        uint64_t v11 = [(PXAssetVariationRenderProvider *)self _variationSourceType];
        objc_initWeak(&location, self);
        double v12 = [(id)objc_opt_class() sharedOperationQueue];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke;
        v19[3] = &unk_1E5DC8380;
        objc_copyWeak(v22, &location);
        id v13 = v8;
        id v20 = v13;
        id v14 = v10;
        id v21 = v14;
        v22[1] = v11;
        [v12 addOperationWithBlock:v19];

        objc_destroyWeak(v22);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 48));
  *(id *)(a1 + 32);
  px_dispatch_on_main_queue();
}

void __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_5;
  v2[3] = &unk_1E5DD0328;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 performChanges:v2];
}

uint64_t __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setError:*(void *)(a1 + 40)];
}

void __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_3;
  v4[3] = &unk_1E5DC0290;
  objc_copyWeak(&v6, v2);
  id v5 = *(id *)(a1 + 32);
  [WeakRetained performChanges:v4];

  objc_destroyWeak(&v6);
}

void __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAnalysisResult:v1];
}

- (void)_updateAnalysisResult
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[PXAssetVariationsSettings sharedInstance];
  int v4 = [v3 simulateLoadingFailure];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"Simulated Failure";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v7 = [v5 errorWithDomain:@"PXAssetVariationRenderProviderErrorDomain" code:2 userInfo:v6];
    [(PXAssetVariationRenderProvider *)self _setError:v7];
  }
  else
  {
    char v8 = [(PXAssetVariationRenderProvider *)self editSourceLoader];
    id v6 = [v8 activeEditSource];

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [(PXAssetVariationRenderProvider *)self analysisResult];
        if (v9)
        {
        }
        else
        {
          id v14 = [(PXAssetVariationRenderProvider *)self _analysisOperation];

          if (!v14)
          {
            id v15 = [[PXAutoloopAnalysisOperation alloc] initWithEditSource:v6];
            objc_initWeak((id *)buf, self);
            objc_initWeak(&location, v15);
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __55__PXAssetVariationRenderProvider__updateAnalysisResult__block_invoke;
            v18[3] = &unk_1E5DD0838;
            objc_copyWeak(&v19, (id *)buf);
            objc_copyWeak(&v20, &location);
            [(PXAutoloopAnalysisOperation *)v15 setCompletionBlock:v18];
            [(PXAssetVariationRenderProvider *)self _setAnalysisOperation:v15];
            id v16 = [(PXAutoloopAnalysisOperation *)v15 progress];
            [(NSProgress *)self->_recipeGenerationProgress setCompletedUnitCount:0];
            [(NSProgress *)self->_recipeGenerationProgress addChild:v16 withPendingUnitCount:[(NSProgress *)self->_recipeGenerationProgress totalUnitCount]];
            id v17 = [(id)objc_opt_class() sharedOperationQueue];
            [v17 addOperation:v15];

            objc_destroyWeak(&v20);
            objc_destroyWeak(&v19);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);
          }
        }
      }
      else
      {
        uint64_t v10 = PLUIGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v25 = self;
          __int16 v26 = 2112;
          id v27 = v6;
          _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "%@: expected Live Photo Edit Source, but got %@", buf, 0x16u);
        }

        uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28568];
        id v23 = @"Expected Live Photo Edit Source";
        double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        id v13 = [v11 errorWithDomain:@"PXAssetVariationRenderProviderErrorDomain" code:1 userInfo:v12];
        [(PXAssetVariationRenderProvider *)self _setError:v13];
      }
    }
  }
}

void __55__PXAssetVariationRenderProvider__updateAnalysisResult__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 32));
  objc_copyWeak(&v3, (id *)(a1 + 40));
  px_dispatch_on_main_queue();
}

void __55__PXAssetVariationRenderProvider__updateAnalysisResult__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAnalysisOperationCompleted:v2];
}

- (void)_invalidateAnalysisResult
{
}

uint64_t __59__PXAssetVariationRenderProvider__invalidateAnalysisResult__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) setNeedsUpdateOf:sel__updateAnalysisResult];
}

- (void)_handleCachedAnalysisResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PXAssetVariationRenderProvider__handleCachedAnalysisResult___block_invoke;
  v6[3] = &unk_1E5DD0328;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXAssetVariationRenderProvider *)self performChanges:v6];
}

void __62__PXAssetVariationRenderProvider__handleCachedAnalysisResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) analysisResult];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      objc_msgSend(v3, "setAnalysisResult:");
    }
    else
    {
      id v4 = [v3 _analysisOperation];

      if (!v4)
      {
        id v5 = *(void **)(a1 + 32);
        [v5 _invalidateAnalysisResult];
      }
    }
  }
}

- (void)_updateCachedAnalysisResult
{
  if (![(PXAssetVariationRenderProvider *)self _hasAllResults])
  {
    id v3 = [(PXAssetVariationRenderProvider *)self editSourceLoader];
    id v4 = [v3 activeEditSource];

    if (v4)
    {
      id v5 = [v3 contentIdentifier];
      int64_t v6 = [(PXAssetVariationRenderProvider *)self _variationSourceType];
      if (v5)
      {
        id v7 = (void *)v6;
        char v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
        uint64_t v9 = [v8 variationCache];

        objc_initWeak(&location, self);
        uint64_t v10 = [(id)objc_opt_class() sharedOperationQueue];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __61__PXAssetVariationRenderProvider__updateCachedAnalysisResult__block_invoke;
        v12[3] = &unk_1E5DC8380;
        id v11 = v9;
        id v13 = v11;
        id v14 = v5;
        v15[1] = v7;
        objc_copyWeak(v15, &location);
        [v10 addOperationWithBlock:v12];

        objc_destroyWeak(v15);
        objc_destroyWeak(&location);
      }
      else
      {
        [(PXAssetVariationRenderProvider *)self _handleCachedAnalysisResult:0];
      }
    }
  }
}

void __61__PXAssetVariationRenderProvider__updateCachedAnalysisResult__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) analysisResultForAssetIdentifier:*(void *)(a1 + 40) sourceType:*(void *)(a1 + 56)];
  objc_copyWeak(&v3, (id *)(a1 + 48));
  v2;
  px_dispatch_on_main_queue();
}

void __61__PXAssetVariationRenderProvider__updateCachedAnalysisResult__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleCachedAnalysisResult:*(void *)(a1 + 32)];
}

- (int64_t)_variationSourceType
{
  return 0;
}

- (void)_invalidateCachedAnalysisResult
{
}

uint64_t __65__PXAssetVariationRenderProvider__invalidateCachedAnalysisResult__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) setNeedsUpdateOf:sel__updateCachedAnalysisResult];
}

- (void)_updateStatus
{
  id v3 = [(PXAssetVariationRenderProvider *)self error];

  if (v3)
  {
    id v4 = @"Failed";
    uint64_t v5 = 5;
  }
  else if (self->_hasBegunRendering)
  {
    BOOL v7 = [(PXAssetVariationRenderProvider *)self _hasAllResults];
    char v8 = [(PXAssetVariationRenderProvider *)self analysisResult];

    if (v7)
    {
      id v4 = @"Finished";
      uint64_t v5 = 4;
    }
    else
    {
      uint64_t v9 = [(PXAssetVariationRenderProvider *)self editSourceLoader];
      uint64_t v10 = [v9 editSource];
      if (v10)
      {
        id v11 = (void *)v10;
        double v12 = [(PXAssetVariationRenderProvider *)self editSourceLoader];
        id v13 = [v12 compositionController];

        if (v13) {
          id v4 = @"Generating Recipes";
        }
        else {
          id v4 = @"Loading Resources";
        }
        uint64_t v5 = 2;
        if (v13 && v8)
        {
          uint64_t v24 = 0;
          uint64_t v25 = &v24;
          uint64_t v26 = 0x2020000000;
          uint64_t v27 = -1;
          id v14 = [(PXAssetVariationRenderProvider *)self _renderingOperationsByVariationType];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __47__PXAssetVariationRenderProvider__updateStatus__block_invoke;
          v23[3] = &unk_1E5DB85C0;
          v23[4] = &v24;
          [v14 enumerateKeysAndObjectsUsingBlock:v23];

          uint64_t v15 = v25[3];
          if (v15 == -1)
          {
            id v4 = @"Rendering";
          }
          else
          {
            id v16 = NSString;
            unint64_t v17 = v15 + 1;
            if (v17 > 4) {
              id v18 = @"Unknown";
            }
            else {
              id v18 = off_1E5DB6DB0[v17];
            }
            id v19 = v18;
            id v4 = [v16 stringWithFormat:@"Rendering %@", v19];
          }
          _Block_object_dispose(&v24, 8);
          uint64_t v5 = 3;
        }
      }
      else
      {

        id v4 = @"Loading Resources";
        uint64_t v5 = 2;
      }
    }
  }
  else
  {
    id v4 = &stru_1F00B0030;
    uint64_t v5 = 1;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__PXAssetVariationRenderProvider__updateStatus__block_invoke_2;
  v20[3] = &unk_1E5DD0510;
  id v21 = v4;
  uint64_t v22 = v5;
  v20[4] = self;
  int64_t v6 = v4;
  [(PXAssetVariationRenderProvider *)self performChanges:v20];
}

void __47__PXAssetVariationRenderProvider__updateStatus__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  if ([a3 isExecuting])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 integerValue];
    *a4 = 1;
  }
}

uint64_t __47__PXAssetVariationRenderProvider__updateStatus__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setStatus:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _setStatusDescription:v3];
}

- (void)_invalidateStatus
{
}

uint64_t __51__PXAssetVariationRenderProvider__invalidateStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) setNeedsUpdateOf:sel__updateStatus];
}

- (BOOL)_hasAllResults
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  uint64_t v3 = [(PXAssetVariationRenderProvider *)self desiredVariationTypes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PXAssetVariationRenderProvider__hasAllResults__block_invoke;
  v5[3] = &unk_1E5DC5478;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 enumerateIndexesUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __48__PXAssetVariationRenderProvider__hasAllResults__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) renderResultForVariationType:a2];

  if (!v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (void)didPerformChanges
{
  v2.receiver = self;
  v2.super_class = (Class)PXAssetVariationRenderProvider;
  [(PXAssetVariationRenderProvider *)&v2 didPerformChanges];
  px_dispatch_on_main_queue();
}

uint64_t __51__PXAssetVariationRenderProvider_didPerformChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) updateIfNeeded];
}

- (void)setTargetSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width <= 0.0 || a3.height <= 0.0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXAssetVariationRenderProvider.m", 244, @"Invalid parameter not satisfying: %@", @"targetSize.width > 0 && targetSize.height > 0" object file lineNumber description];
  }
  if (width != self->_targetSize.width || height != self->_targetSize.height)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__PXAssetVariationRenderProvider_setTargetSize___block_invoke;
    v9[3] = &unk_1E5DD0460;
    v9[4] = self;
    *(double *)&v9[5] = width;
    *(double *)&v9[6] = height;
    [(PXAssetVariationRenderProvider *)self performChanges:v9];
  }
}

__n128 __48__PXAssetVariationRenderProvider_setTargetSize___block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(a1 + 32) + 272) = result;
  return result;
}

- (id)progressForVariationType:(int64_t)a3
{
  progressesByVariationType = self->_progressesByVariationType;
  id v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)progressesByVariationType objectForKeyedSubscript:v4];

  return v5;
}

- (void)cancelRendering
{
  self->_hasBegunRendering = 0;
  observedEditSourceLoaderProgress = self->_observedEditSourceLoaderProgress;
  id v4 = NSStringFromSelector(sel_completedUnitCount);
  [(NSProgress *)observedEditSourceLoaderProgress removeObserver:self forKeyPath:v4 context:PXEditSourceLoaderProgressObservationContext];

  uint64_t v5 = self->_observedEditSourceLoaderProgress;
  self->_observedEditSourceLoaderProgress = 0;

  uint64_t v6 = [(PXAssetVariationRenderProvider *)self editSourceLoader];
  id v7 = [v6 progress];
  [v7 cancel];

  uint64_t v8 = [(PXAssetVariationRenderProvider *)self _analysisOperation];
  [v8 cancel];

  [(PXAssetVariationRenderProvider *)self _setAnalysisOperation:0];
  id v9 = [(PXAssetVariationRenderProvider *)self _renderingOperationsByVariationType];
  [v9 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_233];
}

uint64_t __49__PXAssetVariationRenderProvider_cancelRendering__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

- (void)beginRendering
{
  if (!self->_hasBegunRendering)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __48__PXAssetVariationRenderProvider_beginRendering__block_invoke;
    v2[3] = &unk_1E5DD0FA8;
    v2[4] = self;
    [(PXAssetVariationRenderProvider *)self performChanges:v2];
  }
}

uint64_t __48__PXAssetVariationRenderProvider_beginRendering__block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) editSourceLoader];
  [v2 beginLoading];

  uint64_t v3 = [*(id *)(a1 + 32) editSourceLoader];
  id v4 = [v3 progress];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = NSStringFromSelector(sel_completedUnitCount);
  [v4 addObserver:v5 forKeyPath:v6 options:4 context:PXEditSourceLoaderProgressObservationContext];

  id v7 = [*(id *)(a1 + 32) editSourceLoader];
  uint64_t v8 = [v7 progress];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 144);
  *(void *)(v9 + 144) = v8;

  id v11 = *(void **)(a1 + 32);
  if (!v11[30])
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 240);
    *(void *)(v13 + 240) = v12;

    id v11 = *(void **)(a1 + 32);
  }
  uint64_t v15 = [v11 analysisResult];

  if (!v15) {
    [*(id *)(a1 + 32) _invalidateCachedAnalysisResult];
  }
  uint64_t result = [*(id *)(a1 + 32) _hasAllResults];
  if ((result & 1) == 0) {
    uint64_t result = [*(id *)(a1 + 32) _invalidateRenders];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = 1;
  return result;
}

- (id)renderResultForVariationType:(int64_t)a3
{
  resultsByVariationType = self->_resultsByVariationType;
  id v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)resultsByVariationType objectForKeyedSubscript:v4];

  return v5;
}

- (PXAssetVariationRenderProvider)initWithEditSourceLoader:(id)a3 targetSize:(CGSize)a4 desiredVariationTypes:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PXAssetVariationRenderProvider;
  uint64_t v12 = [(PXAssetVariationRenderProvider *)&v32 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_editSourceLoader, a3);
    v13->_targetSize.CGFloat width = width;
    v13->_targetSize.CGFloat height = height;
    if (v11)
    {
      id v14 = (void *)[v11 copy];
    }
    else
    {
      id v14 = [(id)objc_opt_class() supportedVariationTypes];
    }
    uint64_t v15 = v14;
    objc_storeStrong((id *)&v13->_desiredVariationTypes, v14);

    uint64_t v16 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v13];
    updater = v13->_updater;
    v13->_updater = (PXUpdater *)v16;

    [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateCachedAnalysisResult];
    [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateAnalysisResult];
    [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateRenders];
    [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateStatus];
    [(PXUpdater *)v13->_updater setNeedsUpdateOf:sel__updateCachedAnalysisResult];
    [(PXUpdater *)v13->_updater setNeedsUpdateOf:sel__updateRenders];
    id v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resultsByVariationType = v13->_resultsByVariationType;
    v13->_resultsByVariationType = v18;

    id v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    progressesByVariationType = v13->_progressesByVariationType;
    v13->_progressesByVariationType = v20;

    uint64_t v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    renderingOperationsByVariationType = v13->__renderingOperationsByVariationType;
    v13->__renderingOperationsByVariationType = v22;

    uint64_t v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    renderingDurationByVariationType = v13->__renderingDurationByVariationType;
    v13->__renderingDurationByVariationType = v24;

    uint64_t v26 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:0];
    initialLoadingProgress = v13->_initialLoadingProgress;
    v13->_initialLoadingProgress = (NSProgress *)v26;

    v13->_status = 1;
    uint64_t v28 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    recipeGenerationProgress = v13->_recipeGenerationProgress;
    v13->_recipeGenerationProgress = (NSProgress *)v28;

    id v30 = [v10 progress];
    [(NSProgress *)v13->_initialLoadingProgress px_appendChild:v30 withPendingUnitCount:100];
    [(NSProgress *)v13->_initialLoadingProgress px_appendChild:v13->_recipeGenerationProgress withPendingUnitCount:50];
    v13->_signpostID = 0;
  }
  return v13;
}

- (void)dealloc
{
  observedEditSourceLoaderProgress = self->_observedEditSourceLoaderProgress;
  id v4 = NSStringFromSelector(sel_completedUnitCount);
  [(NSProgress *)observedEditSourceLoaderProgress removeObserver:self forKeyPath:v4 context:PXEditSourceLoaderProgressObservationContext];

  uint64_t v5 = self->_observedEditSourceLoaderProgress;
  self->_observedEditSourceLoaderProgress = 0;

  uint64_t v6 = [(PXEditSourceLoader *)self->_editSourceLoader progress];
  [v6 cancel];

  [(NSOperation *)self->__analysisOperation cancel];
  [(NSMutableDictionary *)self->__renderingOperationsByVariationType enumerateKeysAndObjectsUsingBlock:&__block_literal_global_214_89537];
  v7.receiver = self;
  v7.super_class = (Class)PXAssetVariationRenderProvider;
  [(PXAssetVariationRenderProvider *)&v7 dealloc];
}

uint64_t __41__PXAssetVariationRenderProvider_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

- (PXAssetVariationRenderProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetVariationRenderProvider.m", 113, @"%s is not available as initializer", "-[PXAssetVariationRenderProvider init]");

  abort();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ((void *)PXEditSourceLoaderProgressObservationContext != a6)
  {
    unint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXAssetVariationRenderProvider.m" lineNumber:99 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v14 = v13;
  uint64_t v15 = NSStringFromSelector(sel_completedUnitCount);
  int v16 = [v11 isEqualToString:v15];

  if (v16) {
    px_dispatch_on_main_queue();
  }
}

uint64_t __81__PXAssetVariationRenderProvider_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__PXAssetVariationRenderProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __81__PXAssetVariationRenderProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateCachedAnalysisResult];
  [*(id *)(a1 + 32) _invalidateStatus];
  [*(id *)(a1 + 32) _invalidateAnalysisResult];
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 _invalidateRenders];
}

+ (void)_performSimulatedWorkWithProgress:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setCompletedUnitCount:", objc_msgSend(v4, "completedUnitCount") + 1);
  [v4 fractionCompleted];
  if (v5 < 1.0)
  {
    dispatch_time_t v6 = dispatch_time(0, 250000000);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PXAssetVariationRenderProvider__performSimulatedWorkWithProgress___block_invoke;
    v7[3] = &unk_1E5DD08D8;
    id v9 = a1;
    id v8 = v4;
    dispatch_after(v6, MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __68__PXAssetVariationRenderProvider__performSimulatedWorkWithProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _performSimulatedWorkWithProgress:*(void *)(a1 + 32)];
}

+ (NSIndexSet)supportedVariationTypes
{
  if (supportedVariationTypes_onceToken != -1) {
    dispatch_once(&supportedVariationTypes_onceToken, &__block_literal_global_235);
  }
  objc_super v2 = (void *)supportedVariationTypes_indexSet;
  return (NSIndexSet *)v2;
}

void __57__PXAssetVariationRenderProvider_supportedVariationTypes__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28E60] indexSet];
  [v2 addIndex:0];
  [v2 addIndex:1];
  [v2 addIndex:2];
  [v2 addIndex:3];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)supportedVariationTypes_indexSet;
  supportedVariationTypes_indexSet = v0;
}

+ (id)_renderingLog
{
  if (_renderingLog_onceToken != -1) {
    dispatch_once(&_renderingLog_onceToken, &__block_literal_global_206);
  }
  id v2 = (void *)_renderingLog_renderingLog;
  return v2;
}

void __47__PXAssetVariationRenderProvider__renderingLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "AutoLoopGeneration");
  uint64_t v1 = (void *)_renderingLog_renderingLog;
  _renderingLog_renderingLog = (uint64_t)v0;
}

+ (id)sharedOperationQueue
{
  if (sharedOperationQueue_onceToken != -1) {
    dispatch_once(&sharedOperationQueue_onceToken, &__block_literal_global_89557);
  }
  id v2 = (void *)sharedOperationQueue_queue;
  return v2;
}

uint64_t __54__PXAssetVariationRenderProvider_sharedOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v1 = (void *)sharedOperationQueue_queue;
  sharedOperationQueue_queue = (uint64_t)v0;

  [(id)sharedOperationQueue_queue setQualityOfService:25];
  id v2 = (void *)sharedOperationQueue_queue;
  return [v2 setMaxConcurrentOperationCount:3];
}

@end