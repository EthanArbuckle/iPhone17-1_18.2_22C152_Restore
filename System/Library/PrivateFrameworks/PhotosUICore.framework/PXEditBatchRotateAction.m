@interface PXEditBatchRotateAction
- (PXEditBatchRotateAction)initWithPresetManager:(id)a3 syncProgress:(id)a4 asyncProgress:(id)a5 asyncLoadingStatusManager:(id)a6 forAssets:(id)a7;
- (id)localizedActionName;
- (id)localizedProgressToastOngoingTitle;
- (id)localizedProgressToastRedoTitle;
- (id)localizedProgressToastSuccessTitle;
- (id)localizedProgressToastUndoTitle;
- (int64_t)direction;
- (void)_syncRotateDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5;
- (void)performAction:(id)a3;
@end

@implementation PXEditBatchRotateAction

- (int64_t)direction
{
  return 0;
}

- (id)localizedProgressToastRedoTitle
{
  return PXLocalizedStringFromTable(@"PXRotateEditActionProgressToastRedoTitle", @"PhotosUICore");
}

- (id)localizedProgressToastUndoTitle
{
  return PXLocalizedStringFromTable(@"PXRotateEditActionProgressToastUndoTitle", @"PhotosUICore");
}

- (id)localizedProgressToastSuccessTitle
{
  return PXLocalizedStringFromTable(@"PXRotateEditActionProgressToastSuccessTitle", @"PhotosUICore");
}

- (id)localizedProgressToastOngoingTitle
{
  return PXLocalizedStringFromTable(@"PXRotateEditActionProgressToastOngoingTitle", @"PhotosUICore");
}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(@"PXRotateEditAction", @"PhotosUICore");
}

- (void)_syncRotateDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(PXEditBatchAction *)self asyncAssets];
  v11 = v10;
  if (a4 || ![v10 count])
  {
    [(PXEditBatchAction *)self saveResults:v8 completion:v9];
  }
  else
  {
    objc_initWeak(&location, self);
    -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 1, [v11 count]);
    v12 = [(PXEditBatchAction *)self manager];
    int64_t v13 = [(PXEditBatchRotateAction *)self direction];
    v14 = [(PXEditBatchAction *)self asyncProgress];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__PXEditBatchRotateAction__syncRotateDidFinishWithResults_didCancel_completionHandler___block_invoke;
    v15[3] = &unk_1E5DC84C8;
    id v16 = v8;
    objc_copyWeak(&v18, &location);
    id v17 = v9;
    [v12 rotateAssets:v11 direction:v13 async:1 progress:v14 completion:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __87__PXEditBatchRotateAction__syncRotateDidFinishWithResults_didCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = (id)[v3 mutableCopy];
  [v6 addObjectsFromArray:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained saveResults:v6 completion:*(void *)(a1 + 40)];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  v5 = [(PXEditBatchAction *)self assets];
  if ([v5 count])
  {
    id v6 = [(PXEditBatchAction *)self manager];
    if ([v6 isBusyWithBatchAction])
    {
      v7 = PLUIGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchRotateAction: Edit manager is busy.", (uint8_t *)buf, 2u);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
    else
    {
      id v9 = [(PXEditBatchAction *)self syncAssets];
      -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 0, [v9 count]);
      objc_initWeak(buf, self);
      int64_t v10 = [(PXEditBatchRotateAction *)self direction];
      v11 = [(PXEditBatchAction *)self syncProgress];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __41__PXEditBatchRotateAction_performAction___block_invoke;
      v12[3] = &unk_1E5DC84A0;
      objc_copyWeak(&v14, buf);
      id v13 = v4;
      [v6 rotateAssets:v9 direction:v10 async:0 progress:v11 completion:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    id v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchRotateAction: No asset found", (uint8_t *)buf, 2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __41__PXEditBatchRotateAction_performAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _syncRotateDidFinishWithResults:v6 didCancel:a3 completionHandler:*(void *)(a1 + 32)];
}

- (PXEditBatchRotateAction)initWithPresetManager:(id)a3 syncProgress:(id)a4 asyncProgress:(id)a5 asyncLoadingStatusManager:(id)a6 forAssets:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)PXEditBatchRotateAction;
  return [(PXEditBatchAction *)&v8 initWithPresetManager:a3 syncProgress:a4 asyncProgress:a5 asyncLoadingStatusManager:a6 forAssets:a7];
}

@end