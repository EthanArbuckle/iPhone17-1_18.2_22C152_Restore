@interface PXEditBatchAudioMixModeAction
- (NSString)audioMixMode;
- (id)audioMixModeTitle;
- (id)localizedActionName;
- (id)localizedProgressToastOngoingTitle;
- (id)localizedProgressToastRedoTitle;
- (id)localizedProgressToastSuccessTitle;
- (id)localizedProgressToastUndoTitle;
- (void)_syncSetAudioMixModeDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5;
- (void)performAction:(id)a3;
- (void)setAudioMixMode:(id)a3;
@end

@implementation PXEditBatchAudioMixModeAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioMixMode, 0);
  objc_storeStrong((id *)&self->_audioMixModeTitle, 0);
}

- (void)setAudioMixMode:(id)a3
{
}

- (NSString)audioMixMode
{
  return self->_audioMixMode;
}

- (id)localizedProgressToastRedoTitle
{
  v3 = PXLocalizedStringFromTable(@"PhotoEditAudioMixRedoTitle", @"SpatialAudio");
  v4 = NSString;
  v5 = [(PXEditBatchAudioMixModeAction *)self audioMixModeTitle];
  v6 = [v4 stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (id)localizedProgressToastUndoTitle
{
  v3 = PXLocalizedStringFromTable(@"PhotoEditAudioMixUndoTitle", @"SpatialAudio");
  v4 = NSString;
  v5 = [(PXEditBatchAudioMixModeAction *)self audioMixModeTitle];
  v6 = [v4 stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (id)localizedProgressToastSuccessTitle
{
  v3 = PXLocalizedStringFromTable(@"PhotoEditAudioMixSuccessTitle", @"SpatialAudio");
  v4 = NSString;
  v5 = [(PXEditBatchAudioMixModeAction *)self audioMixModeTitle];
  v6 = [v4 stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (id)localizedProgressToastOngoingTitle
{
  v3 = PXLocalizedStringFromTable(@"PhotoEditAudioMixProgressTitle", @"SpatialAudio");
  v4 = NSString;
  v5 = [(PXEditBatchAudioMixModeAction *)self audioMixModeTitle];
  v6 = [v4 stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (id)localizedActionName
{
  v3 = PXLocalizedStringFromTable(@"PhotoEditAudioMixActionName", @"SpatialAudio");
  v4 = NSString;
  v5 = [(PXEditBatchAudioMixModeAction *)self audioMixModeTitle];
  v6 = [v4 stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (id)audioMixModeTitle
{
  v2 = (void *)MEMORY[0x1E4F911B8];
  v3 = [(PXEditBatchAudioMixModeAction *)self audioMixMode];
  v4 = [v2 audioMixModeForRenderingStyle:v3];

  v5 = [v4 localizedTitle];

  return v5;
}

- (void)_syncSetAudioMixModeDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5
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
    v13 = [(PXEditBatchAudioMixModeAction *)self audioMixMode];
    v14 = [(PXEditBatchAction *)self asyncProgress];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __102__PXEditBatchAudioMixModeAction__syncSetAudioMixModeDidFinishWithResults_didCancel_completionHandler___block_invoke;
    v15[3] = &unk_1E5DC84C8;
    id v16 = v8;
    objc_copyWeak(&v18, &location);
    id v17 = v9;
    [v12 setAudioMixModeOnAssets:v11 audioMixMode:v13 async:1 progress:v14 completion:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __102__PXEditBatchAudioMixModeAction__syncSetAudioMixModeDidFinishWithResults_didCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  v5 = [(PXEditBatchAction *)self assets];
  if ([v5 count])
  {
    id v6 = [(PXEditBatchAction *)self manager];
    if ([v6 isBusyWithBatchAction])
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28228];
      v21 = @"Could not complete PXEditBatchAudioMixModeAction: Edit manager is busy.";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v9 = [v7 errorWithDomain:@"PXEditBatchActionErrorDomain" code:1 userInfo:v8];

      v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchAudioMixModeAction: Edit manager is busy.", (uint8_t *)&buf, 2u);
      }

      v4[2](v4, 0, v9);
    }
    else
    {
      id v9 = [(PXEditBatchAction *)self syncAssets];
      -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 0, [v9 count]);
      objc_initWeak(&buf, self);
      v14 = [(PXEditBatchAudioMixModeAction *)self audioMixMode];
      v15 = [(PXEditBatchAction *)self syncProgress];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __47__PXEditBatchAudioMixModeAction_performAction___block_invoke;
      v16[3] = &unk_1E5DC84A0;
      objc_copyWeak(&v18, &buf);
      id v17 = v4;
      [v6 setAudioMixModeOnAssets:v9 audioMixMode:v14 async:0 progress:v15 completion:v16];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23[0] = @"Could not complete PXEditBatchAudioMixModeAction: No asset found";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v6 = [v11 errorWithDomain:@"PXEditBatchActionErrorDomain" code:2 userInfo:v12];

    v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchAudioMixModeAction: No asset found", (uint8_t *)&buf, 2u);
    }

    v4[2](v4, 0, v6);
  }
}

void __47__PXEditBatchAudioMixModeAction_performAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _syncSetAudioMixModeDidFinishWithResults:v6 didCancel:a3 completionHandler:*(void *)(a1 + 32)];
}

@end