@interface PXEditSessionAction
- (NSString)localizedActionName;
- (PXEditSessionAction)initWithPresetManager:(id)a3 asset:(id)a4 sourcePreset:(id)a5 targetPreset:(id)a6 syncProgress:(id)a7 asyncLoadingStatusManager:(id)a8;
- (id)sourcePreset;
- (id)targetPreset;
- (void)_applyPreset:(id)a3 actionName:(id)a4 completionHandler:(id)a5;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
- (void)registerWithUndoManager:(id)a3;
- (void)setLocalizedActionName:(id)a3;
@end

@implementation PXEditSessionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong(&self->_targetPreset, 0);
  objc_storeStrong(&self->_sourcePreset, 0);
  objc_storeStrong((id *)&self->_redoMenuItemTitle, 0);
  objc_storeStrong((id *)&self->_undoMenuItemTitle, 0);
}

- (void)setLocalizedActionName:(id)a3
{
}

- (NSString)localizedActionName
{
  return self->_localizedActionName;
}

- (id)targetPreset
{
  return self->_targetPreset;
}

- (id)sourcePreset
{
  return self->_sourcePreset;
}

- (void)_applyPreset:(id)a3 actionName:(id)a4 completionHandler:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(PXEditBatchAction *)self assets];
  if ([v11 count])
  {
    v12 = [(PXEditBatchAction *)self assets];
    v13 = [v12 firstObject];

    if (v8 && v13)
    {
      uint64_t v14 = [(PXEditBatchAction *)self shouldRenderSynchronouslyForAsset:v13] ^ 1;
      v15 = [v13 uuid];
      v25 = v15;
      v26[0] = v8;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

      [(PXEditBatchAction *)self willBeginActionWithLocalizedTitle:v9 isAsync:v14 itemCount:1];
      if (v14) {
        [(PXEditBatchAction *)self asyncProgress];
      }
      else {
      v18 = [(PXEditBatchAction *)self syncProgress];
      }
      v19 = [(PXEditBatchAction *)self manager];
      v24 = v13;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __65__PXEditSessionAction__applyPreset_actionName_completionHandler___block_invoke;
      v21[3] = &unk_1E5DC8C98;
      id v22 = v10;
      [v19 replacePresets:v16 onAssets:v20 async:v14 progress:v18 completion:v21];

      goto LABEL_12;
    }
  }
  else
  {

    v13 = 0;
  }
  v17 = PLUIGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "Could not complete PXEditSessionAction: No asset or preset found", buf, 2u);
  }

  (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
LABEL_12:
}

void __65__PXEditSessionAction__applyPreset_actionName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 firstObject];
  id v5 = v3;
  if (v3)
  {
    v4 = [v3 error];
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performRedo:(id)a3
{
}

- (void)performUndo:(id)a3
{
}

- (void)registerWithUndoManager:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXEditSessionAction;
  id v4 = a3;
  [(PXAction *)&v9 registerWithUndoManager:v4];
  objc_msgSend(v4, "undoMenuItemTitle", v9.receiver, v9.super_class);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  undoMenuItemTitle = self->_undoMenuItemTitle;
  self->_undoMenuItemTitle = v5;

  v7 = [v4 redoMenuItemTitle];

  redoMenuItemTitle = self->_redoMenuItemTitle;
  self->_redoMenuItemTitle = v7;
}

- (void)performAction:(id)a3
{
}

- (PXEditSessionAction)initWithPresetManager:(id)a3 asset:(id)a4 sourcePreset:(id)a5 targetPreset:(id)a6 syncProgress:(id)a7 asyncLoadingStatusManager:(id)a8
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v23 = a5;
  id v15 = a6;
  v25[0] = v14;
  v16 = (void *)MEMORY[0x1E4F1C978];
  id v17 = a8;
  id v18 = a7;
  id v19 = a3;
  v20 = [v16 arrayWithObjects:v25 count:1];
  v24.receiver = self;
  v24.super_class = (Class)PXEditSessionAction;
  v21 = [(PXEditBatchAction *)&v24 initWithPresetManager:v19 syncProgress:v18 asyncProgress:0 asyncLoadingStatusManager:v17 forAssets:v20];

  if (v21)
  {
    objc_storeStrong(&v21->_sourcePreset, a5);
    objc_storeStrong(&v21->_targetPreset, a6);
  }

  return v21;
}

@end