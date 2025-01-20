@interface PXPhotoKitEditSourceLoader
- (NSError)error;
- (NSNumber)loadDuration;
- (NSProgress)progress;
- (NSString)contentIdentifier;
- (NSString)livePhotoPairingIdentifier;
- (PHAsset)asset;
- (PICompositionController)compositionController;
- (PICompositionController)originalCompositionController;
- (PLEditSource)editSource;
- (PXPhotoKitEditSourceLoader)initWithAsset:(id)a3;
- (int64_t)baseVersion;
- (void)_cancelContentInputRequest;
- (void)_handleCancellation;
- (void)_handleContentEditingInputRequestCompletion:(id)a3 info:(id)a4 asset:(id)a5;
- (void)_mainQueue_handleEditSource:(id)a3 compositionController:(id)a4 originalCompositionController:(id)a5 error:(id)a6;
- (void)_resetProgress;
- (void)beginLoading;
@end

@implementation PXPhotoKitEditSourceLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_loadDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_originalCompositionController, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_editSourceCreationProgress, 0);
  objc_storeStrong((id *)&self->_mainQueue_loadingStartDate, 0);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (NSString)livePhotoPairingIdentifier
{
  return self->_livePhotoPairingIdentifier;
}

- (NSNumber)loadDuration
{
  return self->_loadDuration;
}

- (int64_t)baseVersion
{
  return self->_baseVersion;
}

- (NSError)error
{
  return self->_error;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (PICompositionController)originalCompositionController
{
  return self->_originalCompositionController;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (void)_mainQueue_handleEditSource:(id)a3 compositionController:(id)a4 originalCompositionController:(id)a5 error:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_storeStrong((id *)&self->_editSource, a3);
  objc_storeStrong((id *)&self->_compositionController, a4);
  objc_storeStrong((id *)&self->_originalCompositionController, a5);
  [(NSProgress *)self->_editSourceCreationProgress setCompletedUnitCount:[(NSProgress *)self->_editSourceCreationProgress totalUnitCount]];
  v15 = NSNumber;
  v16 = [MEMORY[0x1E4F1C9C8] date];
  [v16 timeIntervalSinceDate:self->_mainQueue_loadingStartDate];
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  loadDuration = self->_loadDuration;
  self->_loadDuration = v17;

  objc_storeStrong((id *)&self->_error, a6);
  v19 = PLUIGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    editSource = self->_editSource;
    compositionController = self->_compositionController;
    int v22 = 138412546;
    v23 = editSource;
    __int16 v24 = 2112;
    v25 = compositionController;
    _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "_handleContentEditingInputRequestCompletion - editSource: %@\ncomposition:%@", (uint8_t *)&v22, 0x16u);
  }
}

- (void)_handleContentEditingInputRequestCompletion:(id)a3 info:(id)a4 asset:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  loadingQueue = self->_loadingQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke;
  v13[3] = &unk_1E5DD1508;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  SEL v16 = a2;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(loadingQueue, v13);
}

void __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke(id *a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke_2;
  aBlock[3] = &unk_1E5DD2D68;
  aBlock[4] = a1[4];
  v2 = (void (**)(void *, id))_Block_copy(aBlock);
  v3 = [a1[5] fullSizeImageURL];

  if (v3)
  {
    id v4 = a1[5];
    id v20 = 0;
    v5 = [MEMORY[0x1E4F911A0] editSourceForContentEditingInput:v4 useEmbeddedPreview:0 error:&v20];
    id v6 = v20;
    if (v5)
    {
      id v7 = a1[5];
      id v19 = 0;
      id v8 = [MEMORY[0x1E4F911A0] compositionControllerForContentEditingInput:v7 asShot:0 source:v5 error:&v19];
      id v9 = v19;
      if (v8)
      {
        id v10 = a1[5];
        id v18 = 0;
        id v11 = [MEMORY[0x1E4F911A0] compositionControllerForContentEditingInput:v10 asShot:1 source:v5 error:&v18];
        id v12 = v18;
        if (v11)
        {
          objc_initWeak(&location, a1[4]);
          objc_copyWeak(&v16, &location);
          v5;
          v8;
          v11;
          px_dispatch_on_main_queue();
        }
        v2[2](v2, v12);
      }
      else
      {
        v2[2](v2, v9);
      }
    }
    else
    {
      v2[2](v2, v6);
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v6 setObject:@"Failed to load image URL." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    uint64_t v13 = *MEMORY[0x1E4F39698];
    id v14 = [a1[6] objectForKeyedSubscript:*MEMORY[0x1E4F39698]];

    if (v14)
    {
      id v15 = [a1[6] objectForKeyedSubscript:v13];
      [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXEditSourceLoaderErrorDomain" code:0 userInfo:v6];
    v2[2](v2, v5);
  }
}

void __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v4, &location);
  v3;
  px_dispatch_on_main_queue();
}

void __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_mainQueue_handleEditSource:compositionController:originalCompositionController:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), 0);
}

void __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_mainQueue_handleEditSource:compositionController:originalCompositionController:error:", 0, 0, 0, *(void *)(a1 + 32));
}

- (void)_cancelContentInputRequest
{
  id v3 = [(PXPhotoKitEditSourceLoader *)self asset];
  [v3 cancelContentEditingInputRequest:self->_loadingQueue_imageRequestID];
}

- (void)_resetProgress
{
  id v3 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:0];
  progress = self->_progress;
  self->_progress = v3;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PXPhotoKitEditSourceLoader__resetProgress__block_invoke;
  v5[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v6, &location);
  [(NSProgress *)self->_progress setCancellationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__PXPhotoKitEditSourceLoader__resetProgress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleCancellation];
}

- (void)_handleCancellation
{
  objc_initWeak(&location, self);
  uint64_t v2 = MEMORY[0x1E4F143A8];
  uint64_t v3 = 3221225472;
  id v4 = __49__PXPhotoKitEditSourceLoader__handleCancellation__block_invoke;
  v5 = &unk_1E5DD32D0;
  objc_copyWeak(&v6, &location);
  px_dispatch_on_main_queue();
}

void __49__PXPhotoKitEditSourceLoader__handleCancellation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetProgress];
}

void __49__PXPhotoKitEditSourceLoader__handleCancellation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelContentInputRequest];
}

- (void)beginLoading
{
  uint64_t v3 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:50];
  [(NSProgress *)self->_progress px_appendChild:v3 withPendingUnitCount:50];
  objc_storeStrong((id *)&self->_editSourceCreationProgress, v3);
  if (!self->_mainQueue_loadingStartDate)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    mainQueue_loadingStartDate = self->_mainQueue_loadingStartDate;
    self->_mainQueue_loadingStartDate = v4;

    loadingQueue = self->_loadingQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke;
    v7[3] = &unk_1E5DD32A8;
    v7[4] = self;
    id v8 = v3;
    dispatch_async(loadingQueue, v7);
  }
}

void __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 32) asset];
  id v3 = objc_alloc_init(MEMORY[0x1E4F39028]);
  [v3 setForceReturnFullLivePhoto:1];
  [v3 setDontAllowRAW:1];
  [v3 setNetworkAccessAllowed:1];
  [v3 setCanHandleAdjustmentData:&__block_literal_global_55320];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_3;
  v8[3] = &unk_1E5DB4468;
  id v9 = *(id *)(a1 + 40);
  [v3 setProgressHandler:v8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_309;
  v5[3] = &unk_1E5DB4490;
  objc_copyWeak(&v7, &location);
  id v4 = v2;
  id v6 = v4;
  *(void *)(*(void *)(a1 + 32) + 8) = [v4 requestContentEditingInputWithOptions:v3 completionHandler:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_3(uint64_t a1)
{
}

void __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_309(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "PXPhotoKitEditSourceLoader content complete: %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleContentEditingInputRequestCompletion:v6 info:v5 asset:*(void *)(a1 + 32)];
}

void __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)(*(double *)(a1 + 40) * (double)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount")) - 1);
  uint64_t v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotoKitEditSourceLoader download progress: %f", (uint8_t *)&v4, 0xCu);
  }
}

BOOL __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F8AA58];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  uint64_t v5 = [v3 data];
  uint64_t v6 = [v3 formatIdentifier];
  id v7 = [v3 formatVersion];

  uint64_t v10 = 0;
  id v8 = [v4 loadCompositionFrom:v5 formatIdentifier:v6 formatVersion:v7 sidecarData:0 error:&v10];

  return v8 != 0;
}

- (NSString)contentIdentifier
{
  uint64_t v2 = [(PXPhotoKitEditSourceLoader *)self asset];
  id v3 = [v2 localIdentifier];

  return (NSString *)v3;
}

- (PXPhotoKitEditSourceLoader)initWithAsset:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotoKitEditSourceLoader;
  uint64_t v6 = [(PXPhotoKitEditSourceLoader *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    uint64_t v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:0];
    progress = v7->_progress;
    v7->_progress = (NSProgress *)v8;

    objc_initWeak(&location, v7);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__PXPhotoKitEditSourceLoader_initWithAsset___block_invoke;
    v14[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v15, &location);
    [(NSProgress *)v7->_progress setCancellationHandler:v14];
    uint64_t v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PXEditSourceLoader", v10);
    loadingQueue = v7->_loadingQueue;
    v7->_loadingQueue = (OS_dispatch_queue *)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __44__PXPhotoKitEditSourceLoader_initWithAsset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleCancellation];
}

@end