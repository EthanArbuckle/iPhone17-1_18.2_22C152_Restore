@interface PXEditBatchRevertAction
- (id)localizedActionName;
- (id)localizedProgressToastOngoingTitle;
- (id)localizedProgressToastRedoTitle;
- (id)localizedProgressToastSuccessTitle;
- (id)localizedProgressToastUndoTitle;
- (void)performAction:(id)a3;
@end

@implementation PXEditBatchRevertAction

- (id)localizedProgressToastRedoTitle
{
  return PXLocalizedStringFromTable(@"PXRevertEditActionProgressToastRedoTitle", @"PhotosUICore");
}

- (id)localizedProgressToastUndoTitle
{
  return PXLocalizedStringFromTable(@"PXRevertEditActionProgressToastUndoTitle", @"PhotosUICore");
}

- (id)localizedProgressToastSuccessTitle
{
  return PXLocalizedStringFromTable(@"PXRevertEditActionProgressToastSuccessTitle", @"PhotosUICore");
}

- (id)localizedProgressToastOngoingTitle
{
  return PXLocalizedStringFromTable(@"PXRevertEditActionProgressToastOngoingTitle", @"PhotosUICore");
}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(@"PXRevertEditAction", @"PhotosUICore");
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  v5 = [(PXEditBatchAction *)self assets];
  if ([v5 count])
  {
    v6 = [(PXEditBatchAction *)self manager];
    if ([v6 isBusyWithBatchAction])
    {
      v7 = PLUIGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchRevertAction: Edit manager is busy.", (uint8_t *)buf, 2u);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
    else
    {
      -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 1, [v5 count]);
      objc_initWeak(buf, self);
      v9 = [(PXEditBatchAction *)self asyncProgress];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __41__PXEditBatchRevertAction_performAction___block_invoke;
      v10[3] = &unk_1E5DC84A0;
      objc_copyWeak(&v12, buf);
      id v11 = v4;
      [v6 revertAdjustmentsOnAssets:v5 async:1 progress:v9 completion:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchRevertAction: No assets found", (uint8_t *)buf, 2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __41__PXEditBatchRevertAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained saveResults:v4 completion:*(void *)(a1 + 32)];
}

@end