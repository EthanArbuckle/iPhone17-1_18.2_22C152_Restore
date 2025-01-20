@interface PUDepthToggleEditOperationPerformer
+ (id)_sharedResourceManager;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStillImageTime;
- (BOOL)_shouldEnableDepth;
- (BOOL)liveIsEnabled;
- (PHAsset)asset;
- (void)_completeWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handleLoadResult:(id)a3 imageValues:(id)a4;
- (void)_performEditOperation:(id)a3 completionHandler:(id)a4;
- (void)_resourceLoadedWithResult:(id)a3 editOperationType:(id)a4;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setLiveIsEnabled:(BOOL)a3;
- (void)setOriginalStillImageTime:(id *)a3;
@end

@implementation PUDepthToggleEditOperationPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEditOperationType, 0);
  objc_storeStrong((id *)&self->_mediaDestination, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setOriginalStillImageTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)(&self->_liveIsEnabled + 4) = *(_OWORD *)&a3->var0;
  *(void *)&self->_originalStillImageTime.flags = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStillImageTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[5].var2;
  retstr->int64_t var3 = *(int64_t *)((char *)&self[6].var0 + 4);
  return self;
}

- (void)setLiveIsEnabled:(BOOL)a3
{
  self->_liveIsEnabled = a3;
}

- (BOOL)liveIsEnabled
{
  return self->_liveIsEnabled;
}

- (void)_resourceLoadedWithResult:(id)a3 editOperationType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F911D0]);
  v9 = [v6 editSource];
  [v8 setEditSource:v9];

  v10 = [v6 compositionController];
  v11 = (void *)[v10 copy];

  [v11 removeAdjustmentWithKey:*MEMORY[0x1E4F8A480]];
  [v11 removeAdjustmentWithKey:*MEMORY[0x1E4F8A5A0]];
  [v8 setCompositionController:v11];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__PUDepthToggleEditOperationPerformer__resourceLoadedWithResult_editOperationType___block_invoke;
  v14[3] = &unk_1E5F2D758;
  objc_copyWeak(&v17, &location);
  id v12 = v6;
  id v15 = v12;
  id v13 = v8;
  id v16 = v13;
  [v13 precomputeImageValuesWithCompletion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __83__PUDepthToggleEditOperationPerformer__resourceLoadedWithResult_editOperationType___block_invoke(id *a1)
{
  objc_copyWeak(&v4, a1 + 6);
  id v2 = a1[4];
  id v3 = a1[5];
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v4);
}

void __83__PUDepthToggleEditOperationPerformer__resourceLoadedWithResult_editOperationType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleLoadResult:*(void *)(a1 + 32) imageValues:*(void *)(a1 + 40)];
}

- (BOOL)_shouldEnableDepth
{
  id v2 = [(PXAssetEditOperationPerformer *)self editOperationType];
  char IsEnableDepth = PXAssetEditOperationTypeIsEnableDepth();

  return IsEnableDepth;
}

- (void)_handleLoadResult:(id)a3 imageValues:(id)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = a4;
  v36 = [v32 portraitValuesWithAccuracy:0];
  v35 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F8A448]];
  if (v35)
  {
    id v7 = [v6 compositionController];
    id v8 = (void *)[v7 copy];

    v9 = [v8 depthAdjustmentController];
    v33 = [v9 depthInfo];

    v10 = [v33 objectForKeyedSubscript:@"focusRect"];

    if (!v10)
    {
      v11 = [v8 adjustmentConstants];
      id v12 = [v11 PIDepthAdjustmentKey];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke;
      v47[3] = &unk_1E5F28480;
      id v48 = v35;
      id v49 = v36;
      id v50 = v33;
      [v8 modifyAdjustmentWithKey:v12 modificationBlock:v47];
    }
    id v13 = [(PUDepthToggleEditOperationPerformer *)self asset];
    v34 = [[PUPhotoEditIrisModel alloc] initWithAsset:v13 compositionController:v8];
    v14 = [v6 contentEditingInput];
    id v15 = [v14 livePhoto];

    if (v6)
    {
      [v6 videoComplementOriginalStillImageTime];
    }
    else
    {
      long long v45 = 0uLL;
      uint64_t v46 = 0;
    }
    long long v43 = v45;
    uint64_t v44 = v46;
    [(PUDepthToggleEditOperationPerformer *)self setOriginalStillImageTime:&v43];
    [(PUDepthToggleEditOperationPerformer *)self setLiveIsEnabled:[(PUPhotoEditIrisModel *)v34 isVideoEnabled]];
    if (v15) {
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F91150]) initWithAsset:v13 delegate:self hasDepth:1 hasLive:1];
    }
    else {
      v18 = 0;
    }
    +[PUPhotoEditEffectsSupport updateCompositionController:v8 withDepthEnabled:[(PUDepthToggleEditOperationPerformer *)self _shouldEnableDepth] livePortraitBehaviorController:v18];
    if (([(PUDepthToggleEditOperationPerformer *)self liveIsEnabled] || v15 == 0)
      && ![(PUDepthToggleEditOperationPerformer *)self _shouldEnableDepth]
      && (uint64_t v42 = 0,
          [MEMORY[0x1E4F911A0] compositionControllerForContentEditingInput:v14 asShot:1 error:&v42],
          (v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v20 = objc_alloc(MEMORY[0x1E4F8CC48]);
      v21 = [v14 fullSizeImageURL];
      v31 = (void *)[v20 initWithMediaURL:v21 timeZoneLookup:0];

      v22 = [MEMORY[0x1E4F911C0] repairedAsShotCompositionController:v19 forCurrentCompositionController:v8 isLivePhoto:v15 != 0 metadata:v31];

      v23 = [v22 composition];
      int v24 = [v8 isEqual:v23 visualChangesOnly:1];

      objc_initWeak(&location, self);
      if (v24)
      {
        v25 = (void *)MEMORY[0x1E4F911C0];
        mediaDestination = self->_mediaDestination;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke_2;
        v39[3] = &unk_1E5F28318;
        objc_copyWeak(&v40, &location);
        [v25 revertEditsForAsset:v13 mediaDestination:mediaDestination currentCompositionController:v8 completionHandler:v39];
        objc_destroyWeak(&v40);
LABEL_18:
        objc_destroyWeak(&location);

        goto LABEL_19;
      }
    }
    else
    {
      objc_initWeak(&location, self);
    }
    v27 = objc_msgSend(MEMORY[0x1E4F911A0], "contentEditingOutputForContentEditingInput:compositionController:asset:async:onlyChangingOriginalChoice:", v14, v8, v13, 0, 0, v31);
    v28 = self->_mediaDestination;
    uint64_t v29 = [v6 retrievedVersion];
    uint64_t v30 = [(PUPhotoEditIrisModel *)v34 editingVisibility];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke_3;
    v37[3] = &unk_1E5F28340;
    objc_copyWeak(&v38, &location);
    [(PEPhotoKitMediaDestination *)v28 saveInternalEditsForAsset:v13 usingCompositionController:v8 contentEditingOutput:v27 version:v29 livePhotoState:v30 completionHandler:v37];
    objc_destroyWeak(&v38);

    goto LABEL_18;
  }
  id v16 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v51 = *MEMORY[0x1E4F28228];
  v52[0] = @"Asset is missing depth info";
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  id v8 = [v16 errorWithDomain:@"PUEditOperationPerformerErrorDomain" code:1 userInfo:v17];

  [(PUDepthToggleEditOperationPerformer *)self _completeWithSuccess:0 error:v8];
LABEL_19:
}

void __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 setDepthInfo:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F8A430]];
  [v3 floatValue];
  [v7 setAperture:v4];

  v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F8A438]];
  [v7 setFocusRect:v5];

  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F8A440]];
  [v7 setGlassesMatteAllowed:v6];

  if (!*(void *)(a1 + 48)) {
    [v7 setEnabled:0];
  }
}

void __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _completeWithSuccess:v4 == 0 error:v4];
}

void __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _completeWithSuccess:v4 == 0 error:v4];
}

- (void)_completeWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  px_dispatch_on_main_queue();
}

void __66__PUDepthToggleEditOperationPerformer__completeWithSuccess_error___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) progress];
  uint64_t v3 = [v2 totalUnitCount];
  id v4 = [*(id *)(a1 + 32) progress];
  [v4 setCompletedUnitCount:v3];

  if (!*(unsigned char *)(a1 + 48))
  {
    id v5 = (void *)MEMORY[0x1E4F56658];
    uint64_t v14 = *MEMORY[0x1E4F56560];
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v15[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v5 sendEvent:@"com.apple.photos.CPAnalytics.saving.depthEffectSavingFailed" withPayload:v8];
  }
  v9 = *(const void **)(*(void *)(a1 + 32) + 96);
  if (v9)
  {
    v10 = _Block_copy(v9);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 96);
    *(void *)(v11 + 96) = 0;

    id v13 = [*(id *)(a1 + 32) progress];
    [v13 setCancellationHandler:0];

    (*((void (**)(void *, void, void))v10 + 2))(v10, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
  }
}

- (void)_performEditOperation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[v7 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v8;

  v10 = (PEPhotoKitMediaDestination *)objc_alloc_init(MEMORY[0x1E4F91168]);
  mediaDestination = self->_mediaDestination;
  self->_mediaDestination = v10;

  objc_initWeak(&location, self);
  id v12 = [(id)objc_opt_class() _sharedResourceManager];
  id v13 = [(PUDepthToggleEditOperationPerformer *)self asset];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __79__PUDepthToggleEditOperationPerformer__performEditOperation_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5F282F0;
  objc_copyWeak(&v17, &location);
  id v14 = v6;
  id v16 = v14;
  [v12 loadResourceForAsset:v13 requireLocalResources:0 forceRunAsUnadjustedAsset:0 progressHandler:&__block_literal_global_346 resultHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __79__PUDepthToggleEditOperationPerformer__performEditOperation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (v8) {
    [WeakRetained _resourceLoadedWithResult:v8 editOperationType:*(void *)(a1 + 32)];
  }
  else {
    [WeakRetained _completeWithSuccess:0 error:v5];
  }
}

- (void)performUndo:(id)a3
{
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  [(PUDepthToggleEditOperationPerformer *)self _shouldEnableDepth];
  PXAssetEditOperationTypeForDepthToggle();
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  sourceEditOperationType = self->_sourceEditOperationType;
  self->_sourceEditOperationType = v5;

  id v7 = [(PXAssetEditOperationPerformer *)self editOperationType];
  [(PUDepthToggleEditOperationPerformer *)self _performEditOperation:v7 completionHandler:v4];
}

- (PHAsset)asset
{
  v4.receiver = self;
  v4.super_class = (Class)PUDepthToggleEditOperationPerformer;
  id v2 = [(PXAssetEditOperationPerformer *)&v4 asset];
  return (PHAsset *)v2;
}

+ (id)_sharedResourceManager
{
  if (_sharedResourceManager_onceToken_341 != -1) {
    dispatch_once(&_sharedResourceManager_onceToken_341, &__block_literal_global_344_52397);
  }
  id v2 = (void *)_sharedResourceManager_manager_342;
  return v2;
}

void __61__PUDepthToggleEditOperationPerformer__sharedResourceManager__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F91198]);
  v1 = (void *)_sharedResourceManager_manager_342;
  _sharedResourceManager_manager_342 = (uint64_t)v0;
}

@end