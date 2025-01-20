@interface _PXAssetAnalyzerRequest
- (PHAsset)asset;
- (_PXAssetAnalyzerRequest)initWithAsset:(id)a3 workerType:(int64_t)a4;
- (int64_t)workerType;
- (void)_handleFinishWithSuccess:(BOOL)a3;
- (void)runWithResultHandler:(id)a3;
@end

@implementation _PXAssetAnalyzerRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

- (int64_t)workerType
{
  return self->_workerType;
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 24, 1);
}

- (void)_handleFinishWithSuccess:(BOOL)a3
{
  if (!self->_finished)
  {
    self->_finished = 1;
    id resultHandler = self->_resultHandler;
    if (resultHandler)
    {
      BOOL v5 = a3;
      v7 = (void (**)(id, BOOL))_Block_copy(resultHandler);
      id v6 = self->_resultHandler;
      self->_id resultHandler = 0;

      v7[2](v7, v5);
    }
  }
}

- (void)runWithResultHandler:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXAssetAnalyzer.m", 119, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];
  }
  id v6 = (void *)[v5 copy];
  id resultHandler = self->_resultHandler;
  self->_id resultHandler = v6;

  v8 = [(_PXAssetAnalyzerRequest *)self asset];
  if (!self->_workerType)
  {
    objc_initWeak(&location, self);
    v9 = [MEMORY[0x1E4F744E8] sharedAnalysisService];
    if (objc_opt_respondsToSelector())
    {
      id v10 = v9;
      v21[0] = v8;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __48___PXAssetAnalyzerRequest_runWithResultHandler___block_invoke;
      v16[3] = &unk_1E5DD0DB8;
      objc_copyWeak(&v17, &location);
      int v12 = [v10 requestLivePhotoEffectsForAssets:v11 withOptions:0 progressHandler:0 andCompletionHandler:v16];

      if (v12 <= 0)
      {
        v13 = PLUIGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v20 = v12;
          _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Effects request failed: invalid request ID %d", buf, 8u);
        }

        [(_PXAssetAnalyzerRequest *)self _handleFinishWithSuccess:0];
      }
      objc_destroyWeak(&v17);
    }
    else
    {
      v14 = PLUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "PXAssetAnalyzerWorkerTypeAutoloop requires at least Yukon17A491", buf, 2u);
      }

      [(_PXAssetAnalyzerRequest *)self _handleFinishWithSuccess:0];
    }

    objc_destroyWeak(&location);
  }
}

- (_PXAssetAnalyzerRequest)initWithAsset:(id)a3 workerType:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXAssetAnalyzer.m", 109, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_PXAssetAnalyzerRequest;
  v9 = [(_PXAssetAnalyzerRequest *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    v10->_workerType = a4;
  }

  return v10;
}

@end