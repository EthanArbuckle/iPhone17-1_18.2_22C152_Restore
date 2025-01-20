@interface PXEditBatchEnhanceAction
- (PXEditBatchEnhanceAction)initWithPresetManager:(id)a3 syncProgress:(id)a4 asyncProgress:(id)a5 asyncLoadingStatusManager:(id)a6 forAssets:(id)a7;
- (id)localizedActionName;
- (id)localizedProgressToastOngoingTitle;
- (id)localizedProgressToastRedoTitle;
- (id)localizedProgressToastSuccessTitle;
- (id)localizedProgressToastUndoTitle;
- (void)_syncEnhanceDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5;
- (void)performAction:(id)a3;
@end

@implementation PXEditBatchEnhanceAction

- (id)localizedProgressToastRedoTitle
{
  return PXLocalizedStringFromTable(@"PXAutoEnhanceEditActionProgressToastRedoTitle", @"PhotosUICore");
}

- (id)localizedProgressToastUndoTitle
{
  return PXLocalizedStringFromTable(@"PXAutoEnhanceEditActionProgressToastUndoTitle", @"PhotosUICore");
}

- (id)localizedProgressToastSuccessTitle
{
  return PXLocalizedStringFromTable(@"PXAutoEnhanceEditActionProgressToastSuccessTitle", @"PhotosUICore");
}

- (id)localizedProgressToastOngoingTitle
{
  return PXLocalizedStringFromTable(@"PXAutoEnhanceEditActionProgressToastOngoingTitle", @"PhotosUICore");
}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(@"PXAutoEnhanceEditAction", @"PhotosUICore");
}

- (void)_syncEnhanceDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5
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
    v13 = [(PXEditBatchAction *)self asyncProgress];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__PXEditBatchEnhanceAction__syncEnhanceDidFinishWithResults_didCancel_completionHandler___block_invoke;
    v14[3] = &unk_1E5DC84C8;
    id v15 = v8;
    objc_copyWeak(&v17, &location);
    id v16 = v9;
    [v12 autoEnhanceAssets:v11 async:1 progress:v13 completion:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __89__PXEditBatchEnhanceAction__syncEnhanceDidFinishWithResults_didCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
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
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchEnhanceAction: Edit manager is busy.", (uint8_t *)buf, 2u);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
    else
    {
      id v9 = [(PXEditBatchAction *)self syncAssets];
      -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 0, [v9 count]);
      objc_initWeak(buf, self);
      v10 = [(PXEditBatchAction *)self syncProgress];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __42__PXEditBatchEnhanceAction_performAction___block_invoke;
      v11[3] = &unk_1E5DC84A0;
      objc_copyWeak(&v13, buf);
      id v12 = v4;
      [v6 autoEnhanceAssets:v9 async:0 progress:v10 completion:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    id v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchEnhanceAction: No asset found", (uint8_t *)buf, 2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __42__PXEditBatchEnhanceAction_performAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _syncEnhanceDidFinishWithResults:v6 didCancel:a3 completionHandler:*(void *)(a1 + 32)];
}

- (PXEditBatchEnhanceAction)initWithPresetManager:(id)a3 syncProgress:(id)a4 asyncProgress:(id)a5 asyncLoadingStatusManager:(id)a6 forAssets:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)PXEditBatchEnhanceAction;
  return [(PXEditBatchAction *)&v8 initWithPresetManager:a3 syncProgress:a4 asyncProgress:a5 asyncLoadingStatusManager:a6 forAssets:a7];
}

@end