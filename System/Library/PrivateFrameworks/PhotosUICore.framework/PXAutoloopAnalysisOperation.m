@interface PXAutoloopAnalysisOperation
- (BOOL)succeeded;
- (NSDictionary)analysisResult;
- (NSError)error;
- (NSNumber)duration;
- (NSProgress)progress;
- (PLLivePhotoEditSource)editSource;
- (PXAutoloopAnalysisOperation)init;
- (PXAutoloopAnalysisOperation)initWithEditSource:(id)a3;
- (id)recipeForVariationType:(int64_t)a3;
- (void)_timeout;
- (void)cancel;
- (void)main;
@end

@implementation PXAutoloopAnalysisOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisResult, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_recipesByVariationType, 0);
}

- (NSDictionary)analysisResult
{
  return self->_analysisResult;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSError)error
{
  return self->_error;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (PLLivePhotoEditSource)editSource
{
  return self->_editSource;
}

- (void)main
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  v55 = [MEMORY[0x1E4F1C9C8] date];
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 30000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PXAutoloopAnalysisOperation_main__block_invoke_2;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v62, &location);
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
  v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = NSTemporaryDirectory();
  v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  v8 = [v5 stringByAppendingPathComponent:v7];
  v9 = [v4 fileURLWithPath:v8];

  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:0];

  v54 = [(PXAutoloopAnalysisOperation *)self editSource];
  v11 = [v54 videoEditSource];
  v12 = [v11 videoURL];

  v13 = [MEMORY[0x1E4F16330] assetWithURL:v12];
  v14 = PLPhotoEditGetLog();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);
  v16 = v14;
  v17 = v16;
  os_signpost_id_t spid = v15;
  unint64_t v18 = v15 - 1;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VariationsRecipesOperation", "", buf, 2u);
  }

  if (v13) {
    [v13 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CMTimeGetSeconds(&time);
  v19 = self;
  kdebug_trace();

  v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 postNotificationName:@"PXAutoloopAnalysisOperationDidStartNotification" object:v19];

  unsigned int v59 = 0;
  id v21 = v13;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  v22 = (uint64_t (*)(id, unsigned int *))getget_autoloopSettings_forAssetSymbolLoc_ptr;
  v67 = getget_autoloopSettings_forAssetSymbolLoc_ptr;
  if (!getget_autoloopSettings_forAssetSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getget_autoloopSettings_forAssetSymbolLoc_block_invoke;
    v71 = &unk_1E5DD2B08;
    v72 = &v64;
    v23 = (void *)AutoLoopLibrary();
    v24 = dlsym(v23, "get_autoloopSettings_forAsset");
    *(void *)(v72[1] + 24) = v24;
    getget_autoloopSettings_forAssetSymbolLoc_ptr = *(_UNKNOWN **)(v72[1] + 24);
    v22 = (uint64_t (*)(id, unsigned int *))v65[3];
  }
  _Block_object_dispose(&v64, 8);
  if (!v22)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    v51 = objc_msgSend(NSString, "stringWithUTF8String:", "struct autoloopSettings *_get_autoloopSettings_forAsset(AVAsset *__strong, autoloopErrorCode *)");
    objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, @"PXAutoloopSoftLinks.m", 33, @"%s", dlerror());

    __break(1u);
  }
  uint64_t v25 = v22(v21, &v59);

  if (v59)
  {
    v26 = __35__PXAutoloopAnalysisOperation_main__block_invoke(v59);
  }
  else
  {
    *(_DWORD *)&buf[8] = 1;
    *(void *)buf = 0x200000000;
    uint64_t v64 = 0;
    v27 = [(PXAutoloopAnalysisOperation *)v19 progress];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __35__PXAutoloopAnalysisOperation_main__block_invoke_33;
    v56[3] = &unk_1E5DB3D78;
    id v28 = v27;
    id v57 = v28;
    objc_copyWeak(&v58, &location);
    _runLiveAnalysisPipeline(v25, v9, v21, (uint64_t)buf, (uint64_t)&v64, v56);
    uint64_t v30 = v29;
    if ([(PXAutoloopAnalysisOperation *)v19 isCancelled])
    {
      v26 = 0;
    }
    else if (v30 || !v64)
    {
      v26 = __35__PXAutoloopAnalysisOperation_main__block_invoke(v30);
    }
    else
    {
      v31 = _liveAnalysisResultToDictionary(v64);
      v52 = v31;
      if (v31)
      {
        uint64_t v32 = [v31 copy];
        analysisResult = v19->_analysisResult;
        v19->_analysisResult = (NSDictionary *)v32;

        v26 = 0;
        v19->_succeeded = 1;
      }
      else
      {
        v34 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v68 = *MEMORY[0x1E4F28568];
        v69 = @"liveAnalysisResultToDictionary did not return an analysis dictionary";
        uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        v36 = v34;
        v37 = (void *)v35;
        uint64_t v38 = [v36 errorWithDomain:@"PXAutoloopAnalysisOperationErrorDomain" code:0 userInfo:v35];
        v39 = v37;
        v26 = (void *)v38;
      }
    }
    if (v64) {
      _liveAnalysisResultDestroy(v64);
    }
    objc_destroyWeak(&v58);
  }
  if (v26)
  {
    objc_storeStrong((id *)&v19->_error, v26);
    v19->_succeeded = 0;
  }
  if (v25) {
    _autoloopSettingsDestroy(v25);
  }
  v40 = [MEMORY[0x1E4F1C9C8] date];
  [v40 timeIntervalSinceDate:v55];
  double v42 = v41;

  v43 = PLUIGetLog();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v42;
    _os_log_impl(&dword_1A9AE7000, v43, OS_LOG_TYPE_DEFAULT, "%@ finished generating variation recipes in %.2fs", buf, 0x16u);
  }

  uint64_t v44 = [NSNumber numberWithDouble:v42];
  duration = v19->_duration;
  v19->_duration = (NSNumber *)v44;

  v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v46 postNotificationName:@"PXAutoloopAnalysisOperationDidEndNotification" object:v19];

  v47 = v19;
  kdebug_trace();

  v48 = v17;
  v49 = v48;
  if (v18 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v49, OS_SIGNPOST_INTERVAL_END, spid, "VariationsRecipesOperation", "", buf, 2u);
  }

  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);
}

void __35__PXAutoloopAnalysisOperation_main__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timeout];
}

uint64_t __35__PXAutoloopAnalysisOperation_main__block_invoke_33(uint64_t a1, float a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", vcvtms_s32_f32((float)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount") * a2));
  dispatch_time_t v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v3);
    uint64_t v6 = [v5 isCancelled] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id __35__PXAutoloopAnalysisOperation_main__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = _autoloopErrorCodeToString(a1);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v1;
  dispatch_time_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [v2 errorWithDomain:@"PXAssetVariationRecipeErrorDomain" code:0 userInfo:v3];

  return v4;
}

- (void)cancel
{
  if (([(PXAutoloopAnalysisOperation *)self isFinished] & 1) == 0)
  {
    kdebug_trace();
    dispatch_time_t v3 = PLPhotoEditGetLog();
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
    id v5 = v3;
    uint64_t v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v4, "VariationsRecipesOperation", "", buf, 2u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)PXAutoloopAnalysisOperation;
  [(PXAutoloopAnalysisOperation *)&v7 cancel];
}

- (void)_timeout
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (([(PXAutoloopAnalysisOperation *)self isFinished] & 1) == 0)
  {
    self->_succeeded = 0;
    dispatch_time_t v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28568];
    v8[0] = @"Recipe generation timed out";
    os_signpost_id_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v5 = [v3 errorWithDomain:@"PXAutoloopAnalysisOperationErrorDomain" code:0 userInfo:v4];
    error = self->_error;
    self->_error = v5;

    [(PXAutoloopAnalysisOperation *)self cancel];
  }
}

- (id)recipeForVariationType:(int64_t)a3
{
  recipesByVariationType = self->_recipesByVariationType;
  os_signpost_id_t v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)recipesByVariationType objectForKeyedSubscript:v4];

  return v5;
}

- (PXAutoloopAnalysisOperation)initWithEditSource:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXAutoloopAnalysisOperation;
  uint64_t v6 = [(PXAutoloopAnalysisOperation *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_editSource, a3);
    uint64_t v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:50];
    progress = v7->_progress;
    v7->_progress = (NSProgress *)v8;

    objc_initWeak(&location, v7);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__PXAutoloopAnalysisOperation_initWithEditSource___block_invoke;
    v12[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v13, &location);
    [(NSProgress *)v7->_progress setCancellationHandler:v12];
    recipesByVariationType = v7->_recipesByVariationType;
    v7->_recipesByVariationType = (NSDictionary *)MEMORY[0x1E4F1CC08];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __50__PXAutoloopAnalysisOperation_initWithEditSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

- (PXAutoloopAnalysisOperation)init
{
  os_signpost_id_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAutoloopAnalysisOperation.m", 41, @"%s is not available as initializer", "-[PXAutoloopAnalysisOperation init]");

  abort();
}

@end