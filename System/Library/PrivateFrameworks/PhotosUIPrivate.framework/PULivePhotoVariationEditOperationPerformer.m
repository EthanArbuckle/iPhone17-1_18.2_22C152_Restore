@interface PULivePhotoVariationEditOperationPerformer
+ (id)_sharedResourceManager;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedStillImageTime;
- (BOOL)liveIsEnabled;
- (PHAsset)asset;
- (void)_completeWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handleDidFinishSavingEditsForAsset:(id)a3 error:(id)a4;
- (void)_handleLoadResult:(id)a3 analysisResult:(id)a4 editOperationType:(id)a5;
- (void)_performEditOperation:(id)a3 completionHandler:(id)a4;
- (void)_resourceLoadedWithResult:(id)a3 editOperationType:(id)a4;
- (void)_saveAssetEditsWithContentEditingInput:(id)a3 compositionController:(id)a4 lastSavedCompositionController:(id)a5 imageVersion:(int64_t)a6 editOperationType:(id)a7;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setLiveIsEnabled:(BOOL)a3;
@end

@implementation PULivePhotoVariationEditOperationPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEditOperationType, 0);
  objc_storeStrong((id *)&self->_mediaDestination, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setLiveIsEnabled:(BOOL)a3
{
  self->_liveIsEnabled = a3;
}

- (BOOL)liveIsEnabled
{
  return self->_liveIsEnabled;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedStillImageTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (void)_resourceLoadedWithResult:(id)a3 editOperationType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PULivePhotoVariationEditOperationPerformer *)self asset];
  v9 = [v6 compositionController];
  v10 = [v6 contentEditingInput];
  v11 = [v8 localIdentifier];
  v12 = (void *)MEMORY[0x1E4F8A358];
  v38 = v9;
  v13 = [v9 composition];
  v14 = [v12 imagePropertiesRequestWithComposition:v13];

  [v14 setName:@"PLCompositionHelper-getImageURL"];
  id v44 = 0;
  v15 = [v14 submitSynchronous:&v44];
  id v36 = v44;
  v37 = v10;
  if (v15
    && ([v15 properties],
        v16 = objc_claimAutoreleasedReturnValue(),
        [v16 url],
        v17 = objc_claimAutoreleasedReturnValue(),
        v16,
        v17))
  {
    v18 = [v10 overCapturePhotoURL];
    if ([v17 isEqual:v18]) {
      v19 = @"-Overcapture";
    }
    else {
      v19 = @"-Original";
    }
  }
  else
  {
    v18 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEBUG, "Could not read image source URL for composition controller", (uint8_t *)&buf, 2u);
    }
    v17 = 0;
    v19 = @"-Original";
  }

  v20 = [v11 stringByAppendingString:v19];

  id v21 = (id)*MEMORY[0x1E4F90E20];
  if (v21 == v7) {
    goto LABEL_16;
  }
  v22 = v21;
  char v23 = [v7 isEqualToString:v21];

  if (v23)
  {
LABEL_17:
    [(PULivePhotoVariationEditOperationPerformer *)self _handleLoadResult:v6 analysisResult:0 editOperationType:v7];
    v30 = v38;
    goto LABEL_18;
  }
  PXAssetEditOperationTypeForVariationType();
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v24 == v7)
  {

LABEL_16:
    goto LABEL_17;
  }
  v25 = v24;
  char v26 = [v7 isEqualToString:v24];

  if (v26) {
    goto LABEL_17;
  }
  v27 = [v8 photoLibrary];
  v28 = [v27 variationCache];

  v35 = v28;
  v29 = [v28 analysisResultForAssetIdentifier:v20];
  if (v29)
  {
    [(PULivePhotoVariationEditOperationPerformer *)self _handleLoadResult:v6 analysisResult:v29 editOperationType:v7];
    v30 = v38;
  }
  else
  {
    v31 = [v6 compositionController];
    uint64_t v32 = [v31 composition];

    v33 = (void *)v32;
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F8A258]) initWithComposition:v32];
    objc_initWeak(&buf, self);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __90__PULivePhotoVariationEditOperationPerformer__resourceLoadedWithResult_editOperationType___block_invoke;
    v39[3] = &unk_1E5F28458;
    objc_copyWeak(&v42, &buf);
    id v40 = v6;
    id v41 = v7;
    [v34 submit:v39];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&buf);

    v30 = v38;
    v29 = 0;
  }

LABEL_18:
}

void __90__PULivePhotoVariationEditOperationPerformer__resourceLoadedWithResult_editOperationType___block_invoke(uint64_t a1, void *a2)
{
  id v7 = 0;
  v3 = [a2 result:&v7];
  id v4 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (v3) {
    [WeakRetained _handleLoadResult:*(void *)(a1 + 32) analysisResult:v3 editOperationType:*(void *)(a1 + 40)];
  }
  else {
    [WeakRetained _completeWithSuccess:0 error:v4];
  }
}

- (void)_handleDidFinishSavingEditsForAsset:(id)a3 error:(id)a4
{
  -[PULivePhotoVariationEditOperationPerformer _completeWithSuccess:error:](self, "_completeWithSuccess:error:", a4 == 0);
}

- (void)_handleLoadResult:(id)a3 analysisResult:(id)a4 editOperationType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 retrievedVersion];
  v12 = [v8 contentEditingInput];
  v13 = [v8 compositionController];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke;
  aBlock[3] = &unk_1E5F28408;
  id v14 = v8;
  id v28 = v14;
  id v15 = v13;
  id v29 = v15;
  id v16 = v10;
  id v30 = v16;
  id v17 = v9;
  id v31 = v17;
  uint64_t v32 = self;
  id v18 = v12;
  id v33 = v18;
  uint64_t v34 = v11;
  v19 = (void (**)(void))_Block_copy(aBlock);
  id v20 = objc_alloc(MEMORY[0x1E4F91150]);
  id v21 = [(PULivePhotoVariationEditOperationPerformer *)self asset];
  v22 = (void *)[v20 initWithAsset:v21 delegate:self hasDepth:1 hasLive:1];

  char v23 = [v22 confirmationWarningStringForAction:6 compositionController:v15];
  id v24 = v23;
  if (v23)
  {
    id v25 = v23;
    char v26 = v19;
    px_dispatch_on_main_queue();
  }
  else
  {
    v19[2](v19);
  }
}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F8AA60]);
  v3 = [*(id *)(a1 + 32) editSource];
  id v4 = (void *)[v2 initWithEditSource:v3 renderPriority:2];

  v5 = (void *)[*(id *)(a1 + 40) copy];
  uint64_t v6 = PXAssetVariationTypeForEditOperationType();
  id v7 = [*(id *)(a1 + 32) editSource];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_2;
  v27[3] = &unk_1E5F28368;
  uint64_t v29 = v6;
  id v28 = *(id *)(a1 + 56);
  [v4 applySourceChangesToCompositionSynchronously:v5 source:v7 withBlock:v27];

  if (v6 == 3)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F8A2D0]);
    id v9 = [v5 composition];
    id v10 = (void *)[v8 initWithComposition:v9];

    [v10 setName:@"PU-PILongExposureFusionAutoCalculator"];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_3;
    v20[3] = &unk_1E5F283E0;
    uint64_t v11 = *(void *)(a1 + 64);
    v12 = *(void **)(a1 + 72);
    id v21 = v5;
    uint64_t v22 = v11;
    id v23 = v12;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 80);
    id v24 = v13;
    uint64_t v26 = v14;
    id v25 = *(id *)(a1 + 48);
    id v15 = v5;
    [v10 submit:v20];
  }
  else
  {
    id v17 = *(id *)(a1 + 72);
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    id v16 = v5;
    px_dispatch_on_main_queue();
  }
}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_3_238(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F8FF78];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_4_240;
  v5[3] = &unk_1E5F28430;
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = v3;
  id v4 = (id)[v2 show:v5];
}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_4_240(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 objectAtIndexedSubscript:0];
  [v4 setTitle:v5];

  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
  [v4 setMessage:v6];

  uint64_t v7 = PXLocalizedString();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_5;
  v10[3] = &unk_1E5F2EBA0;
  id v11 = *(id *)(a1 + 48);
  [v4 addActionWithTitle:v7 style:0 action:v10];

  id v8 = PXLocalizedString();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_6;
  v9[3] = &unk_1E5F2ED10;
  v9[4] = *(void *)(a1 + 40);
  [v4 addActionWithTitle:v8 style:1 action:v9];
}

uint64_t __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeWithSuccess:1 error:0];
}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F8A748];
  id v4 = a2;
  [v3 compositionController:v4 applyAssetVariation:PFMetadataPlaybackVariationFromPXAssetVariation() withRecipe:*(void *)(a1 + 32)];
}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_3(id *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  id v3 = [a2 result:&v14];
  id v4 = v14;
  if (!v3)
  {
    uint64_t v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Failed generating long exposure fusion alignment data. Error: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if ([v3 count])
  {
    id v5 = a1[4];
    uint64_t v6 = *MEMORY[0x1E4F8A470];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_4;
    v12[3] = &unk_1E5F28390;
    id v13 = v3;
    [v5 modifyAdjustmentWithKey:v6 modificationBlock:v12];
    uint64_t v7 = v13;
LABEL_6:
  }
  id v8 = a1[6];
  id v9 = a1[4];
  id v10 = a1[7];
  id v11 = a1[8];
  px_dispatch_on_main_queue();
}

uint64_t __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_2_237(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveAssetEditsWithContentEditingInput:*(void *)(a1 + 40) compositionController:*(void *)(a1 + 48) lastSavedCompositionController:*(void *)(a1 + 56) imageVersion:*(void *)(a1 + 72) editOperationType:*(void *)(a1 + 64)];
}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setAlignment:v2];
  [v3 setEnabled:1];
}

uint64_t __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_235(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveAssetEditsWithContentEditingInput:*(void *)(a1 + 40) compositionController:*(void *)(a1 + 48) lastSavedCompositionController:*(void *)(a1 + 56) imageVersion:*(void *)(a1 + 72) editOperationType:*(void *)(a1 + 64)];
}

- (void)_saveAssetEditsWithContentEditingInput:(id)a3 compositionController:(id)a4 lastSavedCompositionController:(id)a5 imageVersion:(int64_t)a6 editOperationType:(id)a7
{
  id v50 = a3;
  id v11 = a4;
  id v49 = a5;
  id v12 = a7;
  id v13 = [(PULivePhotoVariationEditOperationPerformer *)self asset];
  v48 = [v13 photoLibrary];
  if ((id)*MEMORY[0x1E4F90E20] == v12) {
    int v14 = 1;
  }
  else {
    int v14 = objc_msgSend(v12, "isEqualToString:");
  }
  PXAssetEditOperationTypeForVariationType();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 == v12) {
    int v16 = 1;
  }
  else {
    int v16 = [v12 isEqualToString:v15];
  }

  uint64_t v17 = [[PUPhotoEditIrisModel alloc] initWithAsset:v13 compositionController:v11];
  if (v14 == [(PUPhotoEditIrisModel *)v17 isVideoEnabled])
  {
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke;
    v64[3] = &unk_1E5F2E120;
    v65 = v17;
    char v66 = v14 ^ 1;
    [(PUViewModel *)v65 performChanges:v64];
  }
  objc_initWeak(&location, self);
  id v18 = [v49 composition];
  int v19 = [v11 isEqual:v18 visualChangesOnly:0];

  if (v19 && ![v13 hasAdjustments])
  {
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_4;
    v55[3] = &unk_1E5F2ECC8;
    id v42 = v13;
    id v56 = v42;
    v57 = v17;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_5;
    v51[3] = &unk_1E5F286B8;
    objc_copyWeak(&v54, &location);
    id v52 = v48;
    id v53 = v42;
    [v52 performChanges:v55 completionHandler:v51];

    objc_destroyWeak(&v54);
    goto LABEL_26;
  }
  id v20 = objc_msgSend(v11, "depthAdjustmentController", a6, v48);
  int v21 = [v20 enabled];

  if (((v21 ^ 1 | v14) & 1) == 0)
  {
    [(PULivePhotoVariationEditOperationPerformer *)self setLiveIsEnabled:[(PUPhotoEditIrisModel *)v17 isVideoEnabled]];
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F91150]) initWithAsset:v13 delegate:self hasDepth:1 hasLive:1];
    id v23 = v22;
    if (v16) {
      uint64_t v24 = 4;
    }
    else {
      uint64_t v24 = 6;
    }
    [v22 applySideEffectsForAction:v24 compositionController:v11];
  }
  id v25 = PXAssetEditOperationTypeForVariationType();
  id v26 = v12;
  id v27 = v25;
  unint64_t v28 = 0x1E4F91000uLL;
  if (v27 == v26)
  {
  }
  else
  {
    uint64_t v29 = v27;
    int v30 = [v26 isEqualToString:v27];

    if (!v30) {
      goto LABEL_25;
    }
  }
  id v62 = 0;
  id v31 = [MEMORY[0x1E4F911A0] compositionControllerForContentEditingInput:v50 asShot:1 error:&v62];
  id v32 = v62;
  id v33 = v32;
  if (!v31)
  {

    unint64_t v28 = 0x1E4F91000uLL;
    goto LABEL_25;
  }
  id v34 = objc_alloc(MEMORY[0x1E4F8CC48]);
  v35 = [v50 fullSizeImageURL];
  id v36 = (void *)[v34 initWithMediaURL:v35 timeZoneLookup:0];

  v37 = [MEMORY[0x1E4F911C0] repairedAsShotCompositionController:v31 forCurrentCompositionController:v11 isLivePhoto:1 metadata:v36];

  v38 = [v37 composition];
  char v39 = [v11 isEqual:v38 visualChangesOnly:1];

  unint64_t v28 = 0x1E4F91000;
  if ((v39 & 1) == 0)
  {
LABEL_25:
    v43 = [*(id *)(v28 + 416) contentEditingOutputForContentEditingInput:v50 compositionController:v11 asset:v13 async:0 onlyChangingOriginalChoice:0];
    mediaDestination = self->_mediaDestination;
    uint64_t v45 = [(PUPhotoEditIrisModel *)v17 editingVisibility];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_3;
    v58[3] = &unk_1E5F28340;
    objc_copyWeak(&v59, &location);
    [(PEPhotoKitMediaDestination *)mediaDestination saveInternalEditsForAsset:v13 usingCompositionController:v11 contentEditingOutput:v43 version:v47 livePhotoState:v45 completionHandler:v58];
    objc_destroyWeak(&v59);

    goto LABEL_26;
  }
  id v40 = (void *)MEMORY[0x1E4F911C0];
  id v41 = self->_mediaDestination;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_2;
  v60[3] = &unk_1E5F28318;
  objc_copyWeak(&v61, &location);
  [v40 revertEditsForAsset:v13 mediaDestination:v41 currentCompositionController:v11 completionHandler:v60];
  objc_destroyWeak(&v61);
LABEL_26:
  objc_destroyWeak(&location);
}

uint64_t __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVideoEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidFinishSavingEditsForAsset:v7 error:v5];
}

void __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidFinishSavingEditsForAsset:v7 error:v5];
}

void __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 32)];
  objc_msgSend(v2, "setPhotoIrisVisibilityState:", objc_msgSend(*(id *)(a1 + 40), "editingVisibility"));
}

void __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [MEMORY[0x1E4F390A0] fetchOptionsWithInclusiveDefaultsForPhotoLibrary:*(void *)(a1 + 32)];
    id v7 = (void *)MEMORY[0x1E4F38EB8];
    id v8 = [*(id *)(a1 + 40) localIdentifier];
    v13[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v10 = [v7 fetchAssetsWithLocalIdentifiers:v9 options:v6];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v12 = [v10 firstObject];
    [WeakRetained _handleDidFinishSavingEditsForAsset:v12 error:0];
  }
  else
  {
    uint64_t v6 = objc_loadWeakRetained((id *)(a1 + 48));
    [v6 _handleDidFinishSavingEditsForAsset:0 error:v5];
  }
}

- (void)_completeWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  px_dispatch_on_main_queue();
}

void __73__PULivePhotoVariationEditOperationPerformer__completeWithSuccess_error___block_invoke(uint64_t a1)
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
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v15[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v5 sendEvent:@"com.apple.photos.CPAnalytics.saving.livePhotoEffectSavingFailed" withPayload:v8];
  }
  id v9 = *(const void **)(*(void *)(a1 + 32) + 96);
  if (v9)
  {
    id v10 = _Block_copy(v9);
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

  id v10 = (PEPhotoKitMediaDestination *)objc_alloc_init(MEMORY[0x1E4F91168]);
  mediaDestination = self->_mediaDestination;
  self->_mediaDestination = v10;

  objc_initWeak(&location, self);
  id v12 = [(id)objc_opt_class() _sharedResourceManager];
  id v13 = [(PULivePhotoVariationEditOperationPerformer *)self asset];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __86__PULivePhotoVariationEditOperationPerformer__performEditOperation_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5F282F0;
  objc_copyWeak(&v17, &location);
  id v14 = v6;
  id v16 = v14;
  [v12 loadResourceForAsset:v13 requireLocalResources:0 forceRunAsUnadjustedAsset:0 progressHandler:&__block_literal_global_209 resultHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __86__PULivePhotoVariationEditOperationPerformer__performEditOperation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  id v5 = [(PULivePhotoVariationEditOperationPerformer *)self asset];
  uint64_t v6 = [v5 playbackStyle];

  if (v6 == 1)
  {
    id v7 = (NSString *)(id)*MEMORY[0x1E4F90E20];
  }
  else
  {
    id v9 = [(PULivePhotoVariationEditOperationPerformer *)self asset];
    objc_msgSend(v9, "px_currentVariationType");

    PXAssetEditOperationTypeForVariationType();
    id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  sourceEditOperationType = self->_sourceEditOperationType;
  self->_sourceEditOperationType = v7;

  id v10 = [(PXAssetEditOperationPerformer *)self editOperationType];
  [(PULivePhotoVariationEditOperationPerformer *)self _performEditOperation:v10 completionHandler:v4];
}

- (PHAsset)asset
{
  v4.receiver = self;
  v4.super_class = (Class)PULivePhotoVariationEditOperationPerformer;
  id v2 = [(PXAssetEditOperationPerformer *)&v4 asset];
  return (PHAsset *)v2;
}

+ (id)_sharedResourceManager
{
  if (_sharedResourceManager_onceToken != -1) {
    dispatch_once(&_sharedResourceManager_onceToken, &__block_literal_global_204);
  }
  id v2 = (void *)_sharedResourceManager_manager;
  return v2;
}

void __68__PULivePhotoVariationEditOperationPerformer__sharedResourceManager__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F91198]);
  v1 = (void *)_sharedResourceManager_manager;
  _sharedResourceManager_manager = (uint64_t)v0;
}

@end