@interface PESaveRequest
- (BOOL)applyVideoOrientationAsMetadata;
- (BOOL)supportsProgress;
- (PESaveRequest)init;
- (PESaveRequest)initWithPhoto:(id)a3 compositionController:(id)a4 contentEditingOutput:(id)a5 livePhotoState:(unsigned __int16)a6 applyVideoOrientationAsMetadata:(BOOL)a7;
- (PESaveRequest)initWithPhoto:(id)a3 contentEditingOutput:(id)a4 livePhotoState:(unsigned __int16)a5 applyVideoOrientationAsMetadata:(BOOL)a6;
- (PESaveRequest)initWithPhotoToRevertToOriginal:(id)a3 applyVideoOrientationAsMetadata:(BOOL)a4;
- (PHAsset)photo;
- (PHContentEditingOutput)contentEditingOutput;
- (PICompositionController)compositionController;
- (double)progress;
- (int)identifier;
- (int64_t)currentState;
- (unsigned)videoComplementState;
- (void)_finishWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_performRevertToOriginalOperation;
- (void)_performSaveContentEditingOutput;
- (void)_performSaveEditsOperation;
- (void)_transitionToState:(int64_t)a3;
- (void)beginSaveOperationWithCompletionHandler:(id)a3;
- (void)cancelSaveOperation;
- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3;
@end

@implementation PESaveRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEditingOutput, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_videoExportProgress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (unsigned)videoComplementState
{
  return self->_videoComplementState;
}

- (PHContentEditingOutput)contentEditingOutput
{
  return self->_contentEditingOutput;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PHAsset)photo
{
  return self->_photo;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (int)identifier
{
  return self->_identifier;
}

- (void)_transitionToState:(int64_t)a3
{
  int64_t currentState = self->_currentState;
  if (!currentState)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (currentState != 1 || (a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_6:
    v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PESaveRequest.m", 298, @"Invalid transition %ld %ld", self->_currentState, a3);
  }
LABEL_7:
  self->_int64_t currentState = a3;
}

- (double)progress
{
  double result = 1.0;
  if (self->_currentState != 2)
  {
    BOOL v4 = [(PESaveRequest *)self supportsProgress];
    double result = 0.0;
    if (v4)
    {
      videoExportProgress = self->_videoExportProgress;
      if (videoExportProgress)
      {
        [(NSProgress *)videoExportProgress fractionCompleted];
      }
    }
  }
  return result;
}

- (BOOL)supportsProgress
{
  v3 = [(PESaveRequest *)self compositionController];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(PESaveRequest *)self photo];
  if ([v4 isVideo])
  {
    char IsPlayable = 1;
  }
  else if ([v4 isPhotoIris])
  {
    [(PESaveRequest *)self videoComplementState];
    [v4 hasAdjustments];
    char IsPlayable = PHVideoComplementVisibilityStateIsPlayable();
  }
  else
  {
    char IsPlayable = 0;
  }

  return IsPlayable;
}

- (void)_finishWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int64_t currentState = self->_currentState;
    int v17 = 134218242;
    double v18 = *(double *)&currentState;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_DEFAULT, "-[PESaveRequest _finishWithSuccess:error:] - current state: %ld; error: %@",
      (uint8_t *)&v17,
      0x16u);
  }

  if ((self->_currentState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v4) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 3;
    }
    [(PESaveRequest *)self _transitionToState:v9];
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v11 = v10;
    double beginTimestamp = self->_beginTimestamp;
    v13 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      double v18 = v11 - beginTimestamp;
      _os_log_impl(&dword_217B65000, v13, OS_LOG_TYPE_DEFAULT, "PESaveRequest operation took: %f sec", (uint8_t *)&v17, 0xCu);
    }

    completionHandler = (void (**)(id, BOOL, id))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, v4, v6);
      id v15 = self->_completionHandler;
      self->_completionHandler = 0;
    }
    videoExportProgress = self->_videoExportProgress;
    self->_videoExportProgress = 0;
  }
}

- (void)cancelSaveOperation
{
  [(NSProgress *)self->_videoExportProgress cancel];
  objc_msgSend(MEMORY[0x263F087E8], "ph_errorWithDomain:code:userInfo:", *MEMORY[0x263F15108], 3072, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PESaveRequest *)self _finishWithSuccess:0 error:v3];
}

- (void)_performRevertToOriginalOperation
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v3, OS_LOG_TYPE_DEFAULT, "PESaveRequest revert to original...", buf, 2u);
  }

  BOOL v4 = PLPhotoEditGetLog();
  self->_os_signpost_id_t saveRequestPerfSignpost = os_signpost_id_generate(v4);
  v5 = v4;
  id v6 = v5;
  os_signpost_id_t saveRequestPerfSignpost = self->_saveRequestPerfSignpost;
  if (saveRequestPerfSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v6, OS_SIGNPOST_INTERVAL_BEGIN, saveRequestPerfSignpost, "PESaveRequest-Revert", " enableTelemetry=YES ", buf, 2u);
  }

  if ([(PHAsset *)self->_photo playbackVariation])
  {
    v8 = (void *)MEMORY[0x263F2FA10];
    uint64_t v19 = *MEMORY[0x263F2FA00];
    uint64_t v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    v20[0] = v10;
    double v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v8 sendEvent:@"com.apple.photos.CPAnalytics.userChoices.livePhotoEffectRevertedToOriginal" withPayload:v11];
  }
  v12 = [(PHAsset *)self->_photo photoLibrary];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__PESaveRequest__performRevertToOriginalOperation__block_invoke;
  v15[3] = &unk_2642BF318;
  v16 = v6;
  int v17 = self;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__PESaveRequest__performRevertToOriginalOperation__block_invoke_60;
  v14[3] = &unk_2642BE338;
  v14[4] = self;
  v13 = v6;
  [v12 performChanges:v15 completionHandler:v14];
}

void __50__PESaveRequest__performRevertToOriginalOperation__block_invoke(uint64_t a1)
{
  v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 40) + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v3, OS_SIGNPOST_EVENT, v4, "PESaveRequest-PerformChanges", "", v6, 2u);
  }

  v5 = [MEMORY[0x263F14D20] changeRequestForAsset:*(void *)(*(void *)(a1 + 40) + 56)];
  [v5 revertAssetContentToOriginal];
  if ([*(id *)(*(void *)(a1 + 40) + 56) isLivePhoto]
    && [v5 photoIrisVisibilityState])
  {
    [v5 setPhotoIrisVisibilityState:0];
  }
}

void __50__PESaveRequest__performRevertToOriginalOperation__block_invoke_60(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  PLPhotoEditGetLog();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  os_signpost_id_t v8 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PESaveRequest-Revert", " enableTelemetry=YES ", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__PESaveRequest__performRevertToOriginalOperation__block_invoke_61;
  block[3] = &unk_2642BE360;
  uint64_t v9 = *(void *)(a1 + 32);
  char v13 = a2;
  block[4] = v9;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __50__PESaveRequest__performRevertToOriginalOperation__block_invoke_61(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_performSaveContentEditingOutput
{
  id v3 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v3, OS_LOG_TYPE_DEFAULT, "PESaveRequest saving content editing output...", buf, 2u);
  }

  os_signpost_id_t v4 = PLPhotoEditGetLog();
  self->_os_signpost_id_t saveRequestPerfSignpost = os_signpost_id_generate(v4);
  id v5 = v4;
  id v6 = v5;
  os_signpost_id_t saveRequestPerfSignpost = self->_saveRequestPerfSignpost;
  if (saveRequestPerfSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v6, OS_SIGNPOST_INTERVAL_BEGIN, saveRequestPerfSignpost, "PESaveRequest-SavingChanges", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v8 = [(PHAsset *)self->_photo photoLibrary];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__PESaveRequest__performSaveContentEditingOutput__block_invoke;
  v11[3] = &unk_2642BF318;
  id v12 = v6;
  char v13 = self;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__PESaveRequest__performSaveContentEditingOutput__block_invoke_53;
  v10[3] = &unk_2642BE338;
  v10[4] = self;
  uint64_t v9 = v6;
  [v8 performChanges:v11 completionHandler:v10];
}

void __49__PESaveRequest__performSaveContentEditingOutput__block_invoke(uint64_t a1)
{
  v2 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v2, OS_LOG_TYPE_DEFAULT, "PESaveRequest saving content editing output - in performChanges", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  os_signpost_id_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(*(void *)(a1 + 40) + 32);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v4, OS_SIGNPOST_EVENT, v5, "PESaveRequest-PerformChanges", "", v10, 2u);
  }

  id v6 = [MEMORY[0x263F14D20] changeRequestForAsset:*(void *)(*(void *)(a1 + 40) + 56)];
  [v6 setContentEditingOutput:*(void *)(*(void *)(a1 + 40) + 72)];
  v7 = [*(id *)(*(void *)(a1 + 40) + 72) accessibilityDescription];
  if (v7)
  {
    os_signpost_id_t v8 = [*(id *)(*(void *)(a1 + 40) + 72) accessibilityDescription];
    [v6 setAccessibilityDescription:v8];
  }
  if ([*(id *)(*(void *)(a1 + 40) + 56) isLivePhoto])
  {
    int v9 = [v6 photoIrisVisibilityState];
    if (v9 != [*(id *)(a1 + 40) videoComplementState]) {
      objc_msgSend(v6, "setPhotoIrisVisibilityState:", objc_msgSend(*(id *)(a1 + 40), "videoComplementState"));
    }
  }
}

void __49__PESaveRequest__performSaveContentEditingOutput__block_invoke_53(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  PLPhotoEditGetLog();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  os_signpost_id_t v8 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PESaveRequest-SavingChanges", " enableTelemetry=YES ", buf, 2u);
  }

  int v9 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v9, OS_LOG_TYPE_DEFAULT, "PESaveRequest done saving content editing output", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PESaveRequest__performSaveContentEditingOutput__block_invoke_54;
  block[3] = &unk_2642BE360;
  uint64_t v10 = *(void *)(a1 + 32);
  char v14 = a2;
  block[4] = v10;
  id v13 = v5;
  id v11 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__PESaveRequest__performSaveContentEditingOutput__block_invoke_54(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_performSaveEditsOperation
{
  id v3 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v3, OS_LOG_TYPE_DEFAULT, "PESaveRequest saving edit model...", buf, 2u);
  }

  os_signpost_id_t v4 = objc_alloc_init(PESerializationUtilityExportSettings);
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263F58608]), "initWithTargetPixelSize:", 2048, 2048);
  [(PESerializationUtilityExportSettings *)v4 setScalePolicy:v5];

  [(PESerializationUtilityExportSettings *)v4 setApplyVideoOrientationAsMetadata:[(PESaveRequest *)self applyVideoOrientationAsMetadata]];
  id v6 = [(PESaveRequest *)self compositionController];
  v7 = [(PESaveRequest *)self contentEditingOutput];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__PESaveRequest__performSaveEditsOperation__block_invoke;
  v10[3] = &unk_2642BE338;
  v10[4] = self;
  os_signpost_id_t v8 = +[PESerializationUtility exportCompositionController:v6 forContentEditingOutput:v7 settings:v4 completionQueue:MEMORY[0x263EF83A0] completion:v10];
  videoExportProgress = self->_videoExportProgress;
  self->_videoExportProgress = v8;
}

void __43__PESaveRequest__performSaveEditsOperation__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"NO";
    if (a2) {
      v7 = @"YES";
    }
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_217B65000, v6, OS_LOG_TYPE_DEFAULT, "PESaveRequest - rendered image save complete. Success: %@ / Error: %@", (uint8_t *)&v9, 0x16u);
  }

  os_signpost_id_t v8 = *(void **)(a1 + 32);
  if (a2) {
    [v8 _performSaveContentEditingOutput];
  }
  else {
    [v8 _finishWithSuccess:0 error:v5];
  }
}

- (void)beginSaveOperationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(PESaveRequest *)self _transitionToState:1];
  id v5 = (void *)[v4 copy];

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v5;

  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_double beginTimestamp = v7;
  os_signpost_id_t v8 = [(PESaveRequest *)self compositionController];

  if (v8)
  {
    [(PESaveRequest *)self _performSaveEditsOperation];
  }
  else if (self->_contentEditingOutput)
  {
    [(PESaveRequest *)self _performSaveContentEditingOutput];
  }
  else
  {
    [(PESaveRequest *)self _performRevertToOriginalOperation];
  }
}

- (PESaveRequest)initWithPhoto:(id)a3 compositionController:(id)a4 contentEditingOutput:(id)a5 livePhotoState:(unsigned __int16)a6 applyVideoOrientationAsMetadata:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PESaveRequest;
  v16 = [(PESaveRequest *)&v19 init];
  int v17 = v16;
  if (v16)
  {
    v16->_identifier = atomic_fetch_add(_mediaDestinationRequestIdentifier, 1u) + 1;
    objc_storeStrong((id *)&v16->_photo, a3);
    objc_storeStrong((id *)&v17->_compositionController, a4);
    objc_storeStrong((id *)&v17->_contentEditingOutput, a5);
    v17->_int64_t currentState = 0;
    v17->_videoComplementState = a6;
    v17->_applyVideoOrientationAsMetadata = a7;
  }

  return v17;
}

- (PESaveRequest)initWithPhoto:(id)a3 contentEditingOutput:(id)a4 livePhotoState:(unsigned __int16)a5 applyVideoOrientationAsMetadata:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  id v11 = a3;
  id v12 = a4;
  if (!v12)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PESaveRequest.m", 94, @"Invalid parameter not satisfying: %@", @"contentEditingOutput" object file lineNumber description];
  }
  id v13 = [(PESaveRequest *)self initWithPhoto:v11 compositionController:0 contentEditingOutput:v12 livePhotoState:v7 applyVideoOrientationAsMetadata:v6];

  return v13;
}

- (PESaveRequest)initWithPhotoToRevertToOriginal:(id)a3 applyVideoOrientationAsMetadata:(BOOL)a4
{
  return [(PESaveRequest *)self initWithPhoto:a3 compositionController:0 contentEditingOutput:0 livePhotoState:0 applyVideoOrientationAsMetadata:a4];
}

- (PESaveRequest)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PESaveRequest.m" lineNumber:85 description:@"use the designated initializer"];

  return 0;
}

@end