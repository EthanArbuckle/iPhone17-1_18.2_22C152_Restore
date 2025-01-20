@interface PXExpungeAssetsAction
- (id)actionIdentifier;
- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4;
@end

@implementation PXExpungeAssetsAction

- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = PLUIActionsGetLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ExpungeAssets", "", buf, 2u);
  }

  [(PXAction *)self removeAllActionsFromUndoManager:v7];
  id v12 = objc_alloc_init(MEMORY[0x1E4F38F30]);
  [v12 setExpungeSource:3];
  v13 = (void *)MEMORY[0x1E4F38ED0];
  v14 = [(PXAssetsAction *)self assets];
  v15 = [(PXPhotosAction *)self photoLibrary];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__PXExpungeAssetsAction_executeWithUndoManager_completionHandler___block_invoke;
  v18[3] = &unk_1E5DCB090;
  v19 = v11;
  v20 = self;
  id v21 = v6;
  os_signpost_id_t v22 = v9;
  id v16 = v6;
  v17 = v11;
  [v13 performBatchExpungeWithAssets:v14 deleteOptions:v12 photoLibrary:v15 completionHandler:v18];
}

void __66__PXExpungeAssetsAction_executeWithUndoManager_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PXExpungeAssetsAction_executeWithUndoManager_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5DCF860;
  id v6 = *(id *)(a1 + 32);
  v8 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v12 = v6;
  id v13 = v5;
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v16 = v7;
  uint64_t v14 = v9;
  id v15 = v8;
  char v17 = a2;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __66__PXExpungeAssetsAction_executeWithUndoManager_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ExpungeAssets", "", (uint8_t *)&v9, 2u);
  }

  if (*(void *)(a1 + 40))
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 48) assets];
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Unable to expunge assets:%@ error:%@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)actionIdentifier
{
  return @"ExpungeAssets";
}

@end