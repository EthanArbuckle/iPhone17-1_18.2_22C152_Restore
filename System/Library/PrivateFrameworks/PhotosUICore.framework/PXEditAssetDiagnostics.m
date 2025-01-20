@interface PXEditAssetDiagnostics
- (NSDictionary)diagnosticsPackage;
- (NUComposition)originalComposition;
- (OS_dispatch_queue)diagnosticsQueue;
- (OS_dispatch_queue)renderQueue;
- (PHAsset)asset;
- (PHContentEditingInput)contentEditingInput;
- (PICompositionController)compositionController;
- (PXEditAssetDiagnostics)initWithAsset:(id)a3 contentEditingInput:(id)a4 compositionController:(id)a5 originalComposition:(id)a6;
- (id)_renameFileAt:(id)a3 usingPrefix:(id)a4;
- (void)_renderAssetWithCompositionController:(id)a3 attachmentPrefix:(id)a4 scalePolicy:(id)a5 completion:(id)a6;
- (void)collectDiagnosticsToTTRContainer:(id)a3;
- (void)collectDiagnosticsWithOptions:(id)a3 completion:(id)a4;
- (void)deleteCollectedFiles;
- (void)setAsset:(id)a3;
- (void)setCompositionController:(id)a3;
- (void)setContentEditingInput:(id)a3;
- (void)setDiagnosticsPackage:(id)a3;
- (void)setDiagnosticsQueue:(id)a3;
- (void)setOriginalComposition:(id)a3;
- (void)setRenderQueue:(id)a3;
@end

@implementation PXEditAssetDiagnostics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalComposition, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_diagnosticsQueue, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_contentEditingInput, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_diagnosticsPackage, 0);
}

- (void)setOriginalComposition:(id)a3
{
}

- (NUComposition)originalComposition
{
  return self->_originalComposition;
}

- (void)setRenderQueue:(id)a3
{
}

- (OS_dispatch_queue)renderQueue
{
  return self->_renderQueue;
}

- (void)setDiagnosticsQueue:(id)a3
{
}

- (OS_dispatch_queue)diagnosticsQueue
{
  return self->_diagnosticsQueue;
}

- (void)setCompositionController:(id)a3
{
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setContentEditingInput:(id)a3
{
}

- (PHContentEditingInput)contentEditingInput
{
  return self->_contentEditingInput;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setDiagnosticsPackage:(id)a3
{
}

- (NSDictionary)diagnosticsPackage
{
  return self->_diagnosticsPackage;
}

- (id)_renameFileAt:(id)a3 usingPrefix:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 lastPathComponent];
  v8 = [NSString stringWithFormat:@"%@_%@", v6, v7];

  v9 = [v5 URLByDeletingLastPathComponent];
  v10 = [v9 URLByAppendingPathComponent:v8];

  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v17 = 0;
  char v12 = [v11 moveItemAtURL:v5 toURL:v10 error:&v17];
  id v13 = v17;

  if (v12)
  {
    id v14 = v10;
  }
  else
  {
    v15 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "Could not prefix URL: %@ - Error: %@", buf, 0x16u);
    }

    id v14 = 0;
  }

  return v14;
}

- (void)deleteCollectedFiles
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(PXEditAssetDiagnostics *)self diagnosticsPackage];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PXEditAssetDiagnostics_deleteCollectedFiles__block_invoke;
  aBlock[3] = &unk_1E5DD0BD0;
  id v5 = v4;
  id v19 = v5;
  id v6 = v3;
  id v20 = v6;
  v7 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  v7[2](v7, @"OriginalAssetURL");
  v7[2](v7, @"OriginalRenderedAssetURL");
  v7[2](v7, @"RenderedAssetURL");
  v7[2](v7, @"RenderedVideoComplementAssetURL");
  v7[2](v7, @"AdjustmentsURL");
  v8 = [v5 objectForKeyedSubscript:@"AuxiliaryURLArray"];
  v9 = v8;
  if (v8)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [v6 removeItemAtURL:*(void *)(*((void *)&v14 + 1) + 8 * v13++) error:0];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
      }
      while (v11);
    }
  }
}

void __46__PXEditAssetDiagnostics_deleteCollectedFiles__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 40) removeItemAtURL:v3 error:0];
    v3 = v4;
  }
}

- (void)collectDiagnosticsToTTRContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(PXEditAssetDiagnostics *)self diagnosticsPackage];

  if (v5) {
    NSLog(&cfstr_ThereIsNoNeedT.isa);
  }
  id v6 = [v4 beginCollectionOperationWithName:@"Edit Diagnostics Operation" timeout:180.0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PXEditAssetDiagnostics_collectDiagnosticsToTTRContainer___block_invoke;
  v9[3] = &unk_1E5DCE438;
  id v10 = v6;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v6;
  [(PXEditAssetDiagnostics *)self collectDiagnosticsWithOptions:0 completion:v9];
}

void __59__PXEditAssetDiagnostics_collectDiagnosticsToTTRContainer___block_invoke(id *a1, char a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = [a1[5] diagnosticsPackage];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PXEditAssetDiagnostics_collectDiagnosticsToTTRContainer___block_invoke_2;
    aBlock[3] = &unk_1E5DD0BD0;
    id v4 = v3;
    id v19 = v4;
    id v20 = a1[6];
    id v5 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
    v5[2](v5, @"OriginalAssetURL");
    v5[2](v5, @"OriginalRenderedAssetURL");
    v5[2](v5, @"RenderedAssetURL");
    v5[2](v5, @"RenderedVideoComplementAssetURL");
    v5[2](v5, @"AdjustmentsURL");
    id v6 = [v4 objectForKeyedSubscript:@"AuxiliaryURLArray"];
    id v7 = v6;
    if (v6)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            [a1[6] addAttachment:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v21 count:16];
        }
        while (v9);
      }
    }
    id v12 = [v4 objectForKeyedSubscript:@"AdjustmentsDescriptionString"];
    if (v12) {
      [a1[6] addAttachmentWithText:v12 name:@"EditSession_CompositionControllerDebugDescription"];
    }
    [a1[4] endWithSuccess:1 error:0];
  }
  else
  {
    id v13 = a1[4];
    [v13 endWithSuccess:0 error:0];
  }
}

void __59__PXEditAssetDiagnostics_collectDiagnosticsToTTRContainer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 40) addAttachment:v3];
    v3 = v4;
  }
}

- (void)_renderAssetWithCompositionController:(id)a3 attachmentPrefix:(id)a4 scalePolicy:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = (void *)MEMORY[0x1E4F911A0];
  long long v15 = [(PXEditAssetDiagnostics *)self contentEditingInput];
  long long v16 = [(PXEditAssetDiagnostics *)self asset];
  long long v17 = [v14 contentEditingOutputForContentEditingInput:v15 compositionController:v10 asset:v16 async:1 onlyChangingOriginalChoice:0];

  id v18 = objc_alloc_init(MEMORY[0x1E4F911A8]);
  id v19 = v18;
  if (v12)
  {
    [v18 setScalePolicy:v12];
  }
  else
  {
    id v20 = [MEMORY[0x1E4F7A478] oneToOneScalePolicy];
    [v19 setScalePolicy:v20];
  }
  [v19 setApplyVideoOrientationAsMetadata:1];
  id v21 = (void *)MEMORY[0x1E4F911A0];
  uint64_t v22 = [(PXEditAssetDiagnostics *)self renderQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __104__PXEditAssetDiagnostics__renderAssetWithCompositionController_attachmentPrefix_scalePolicy_completion___block_invoke;
  v27[3] = &unk_1E5DD1B28;
  id v28 = v17;
  v29 = self;
  id v30 = v11;
  id v31 = v13;
  id v23 = v13;
  id v24 = v11;
  id v25 = v17;
  id v26 = (id)[v21 exportCompositionController:v10 forContentEditingOutput:v25 settings:v19 completionQueue:v22 completion:v27];
}

void __104__PXEditAssetDiagnostics__renderAssetWithCompositionController_attachmentPrefix_scalePolicy_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) renderedContentURL];
    if (v6
      || ([*(id *)(a1 + 32) renderedPreviewContentURL],
          (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v7 = [*(id *)(a1 + 40) _renameFileAt:v6 usingPrefix:*(void *)(a1 + 48)];
      uint64_t v8 = (void *)v7;
      if (v7) {
        uint64_t v9 = (void *)v7;
      }
      else {
        uint64_t v9 = v6;
      }
      id v10 = v9;
      id v11 = [*(id *)(a1 + 40) asset];
      if ([v11 isLivePhoto])
      {
        id v12 = [*(id *)(a1 + 32) renderedVideoComplementContentURL];

        if (!v12)
        {
LABEL_17:

          goto LABEL_18;
        }
        id v13 = *(void **)(a1 + 40);
        long long v14 = [*(id *)(a1 + 32) renderedVideoComplementContentURL];
        long long v15 = [v13 _renameFileAt:v14 usingPrefix:*(void *)(a1 + 48)];

        if (v15)
        {
          id v11 = v15;
          id v12 = v11;
        }
        else
        {
          id v12 = [*(id *)(a1 + 32) renderedVideoComplementContentURL];
          id v11 = 0;
        }
      }
      else
      {
        id v12 = 0;
      }

      goto LABEL_17;
    }
  }
  else
  {
    long long v16 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "-[PXEditAssetDiagnostics collectDiagnosticsWithCompletion:] Could not get result for exportCompositionController - Error: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  id v12 = 0;
  id v10 = 0;
LABEL_18:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)collectDiagnosticsWithOptions:(id)a3 completion:(id)a4
{
  id v6 = (PXEditAssetDiagnosticsOptions *)a3;
  id v7 = a4;
  if (!v6) {
    id v6 = objc_alloc_init(PXEditAssetDiagnosticsOptions);
  }
  diagnosticsQueue = self->_diagnosticsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXEditAssetDiagnostics_collectDiagnosticsWithOptions_completion___block_invoke;
  block[3] = &unk_1E5DD0E78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(diagnosticsQueue, block);
}

void __67__PXEditAssetDiagnostics_collectDiagnosticsWithOptions_completion___block_invoke(id *a1)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  v2 = dispatch_group_create();
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [a1[4] asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [a1[4] asset];

    if (v6)
    {
      dispatch_group_enter(v2);
      id v7 = (void *)MEMORY[0x1E4F38EB8];
      v43[0] = v6;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __67__PXEditAssetDiagnostics_collectDiagnosticsWithOptions_completion___block_invoke_2;
      v39[3] = &unk_1E5DB9080;
      v39[4] = a1[4];
      id v40 = v4;
      id v41 = v3;
      v42 = v2;
      objc_msgSend(v7, "px_generateResourceFilesForAssets:completionHandler:", v8, v39);
    }
  }
  else
  {

    id v6 = 0;
  }
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  [v3 setObject:v4 forKeyedSubscript:@"AuxiliaryURLArray"];
  id v9 = [a1[4] compositionController];
  id v10 = [v9 debugDescription];
  [v3 setObject:v10 forKeyedSubscript:@"AdjustmentsDescriptionString"];

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 1;
  id v11 = [a1[4] contentEditingInput];

  if (v11)
  {
    dispatch_group_enter(v2);
    id v12 = a1[4];
    id v13 = [v12 compositionController];
    long long v14 = [a1[5] scalePolicyForRenders];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __67__PXEditAssetDiagnostics_collectDiagnosticsWithOptions_completion___block_invoke_3;
    v33[3] = &unk_1E5DB90A8;
    id v34 = v3;
    v36 = v37;
    v35 = v2;
    [v12 _renderAssetWithCompositionController:v13 attachmentPrefix:@"EditSession" scalePolicy:v14 completion:v33];
  }
  if ([a1[5] includeOriginalRender])
  {
    dispatch_group_enter(v2);
    id v15 = objc_alloc(MEMORY[0x1E4F8A280]);
    long long v16 = [a1[4] originalComposition];
    int v17 = (void *)[v15 initWithComposition:v16];

    id v18 = a1[4];
    uint64_t v19 = [a1[5] scalePolicyForRenders];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __67__PXEditAssetDiagnostics_collectDiagnosticsWithOptions_completion___block_invoke_4;
    v29[3] = &unk_1E5DB90A8;
    id v30 = v3;
    v32 = v37;
    id v31 = v2;
    [v18 _renderAssetWithCompositionController:v17 attachmentPrefix:@"OriginalRender" scalePolicy:v19 completion:v29];
  }
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  id v20 = [a1[4] compositionController];
  id v21 = [v20 inpaintAdjustmentController];

  if (v21)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F91120];
    id v23 = [a1[4] compositionController];
    id v24 = [v22 logForCompositionController:v23];

    if ([v24 length]) {
      [v3 setObject:v24 forKeyedSubscript:@"CleanupDiagnosticSummaryString"];
    }
  }
  id v25 = (void *)[v3 copy];
  [a1[4] setDiagnosticsPackage:v25];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXEditAssetDiagnostics_collectDiagnosticsWithOptions_completion___block_invoke_5;
  block[3] = &unk_1E5DD35B8;
  id v27 = a1[6];
  id v28 = v37;
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v37, 8);
}

void __67__PXEditAssetDiagnostics_collectDiagnosticsWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) asset];
  id v5 = [v4 originalFilename];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v27 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      uint64_t v28 = v8;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "_renameFileAt:usingPrefix:", v12, @"EntryAsset", v27);
        long long v14 = (void *)v13;
        if (v13) {
          id v15 = (void *)v13;
        }
        else {
          id v15 = v12;
        }
        id v16 = v15;

        int v17 = [v12 lastPathComponent];
        if ([v17 isEqualToString:v5])
        {
          id v18 = v16;

          id v9 = v18;
        }
        else
        {
          uint64_t v19 = v10;
          id v20 = v9;
          id v21 = v5;
          id v22 = v6;
          id v23 = [v17 stringByDeletingPathExtension];
          int v24 = [v23 isEqualToString:@"PenultimateFullSizeRender"];

          if (v24)
          {
            id v25 = v16;

            id v27 = v25;
          }
          else
          {
            [*(id *)(a1 + 40) addObject:v16];
          }
          id v6 = v22;
          id v5 = v21;
          id v9 = v20;
          uint64_t v10 = v19;
          uint64_t v8 = v28;
        }

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);

    if (v9) {
      [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:@"OriginalAssetURL"];
    }
    id v26 = v27;
    if (v27) {
      [*(id *)(a1 + 48) setObject:v27 forKeyedSubscript:@"PenultimateAssetURL"];
    }
  }
  else
  {

    id v26 = 0;
    id v9 = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __67__PXEditAssetDiagnostics_collectDiagnosticsWithOptions_completion___block_invoke_3(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:@"RenderedAssetURL"];
    if (v7) {
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"RenderedVideoComplementAssetURL"];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __67__PXEditAssetDiagnostics_collectDiagnosticsWithOptions_completion___block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:@"OriginalRenderedAssetURL"];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  id v4 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v4);
}

uint64_t __67__PXEditAssetDiagnostics_collectDiagnosticsWithOptions_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return result;
}

- (PXEditAssetDiagnostics)initWithAsset:(id)a3 contentEditingInput:(id)a4 compositionController:(id)a5 originalComposition:(id)a6
{
  uint64_t v10 = (PHAsset *)a3;
  uint64_t v11 = (PHContentEditingInput *)a4;
  id v12 = (PICompositionController *)a5;
  uint64_t v13 = (NUComposition *)a6;
  v28.receiver = self;
  v28.super_class = (Class)PXEditAssetDiagnostics;
  long long v14 = [(PXEditAssetDiagnostics *)&v28 init];
  asset = v14->_asset;
  v14->_asset = v10;
  id v16 = v10;

  contentEditingInput = v14->_contentEditingInput;
  v14->_contentEditingInput = v11;
  id v18 = v11;

  compositionController = v14->_compositionController;
  v14->_compositionController = v12;
  id v20 = v12;

  originalComposition = v14->_originalComposition;
  v14->_originalComposition = v13;
  id v22 = v13;

  dispatch_queue_t v23 = dispatch_queue_create("PXEditAssetDiagnostics", 0);
  diagnosticsQueue = v14->_diagnosticsQueue;
  v14->_diagnosticsQueue = (OS_dispatch_queue *)v23;

  dispatch_queue_t v25 = dispatch_queue_create("PXEditAssetDiagnosticsRender", 0);
  renderQueue = v14->_renderQueue;
  v14->_renderQueue = (OS_dispatch_queue *)v25;

  return v14;
}

@end