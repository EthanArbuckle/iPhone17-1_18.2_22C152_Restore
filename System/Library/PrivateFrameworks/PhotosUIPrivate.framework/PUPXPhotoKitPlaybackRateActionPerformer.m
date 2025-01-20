@interface PUPXPhotoKitPlaybackRateActionPerformer
+ (BOOL)_canPerformOnAsset:(id)a3;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
- (float)playbackRate;
- (void)performUserInteractionTask;
- (void)setPlaybackRate:(float)a3;
@end

@implementation PUPXPhotoKitPlaybackRateActionPerformer

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)performUserInteractionTask
{
  v4 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v5 = PFFilter();
  if ([v5 count])
  {
    uint64_t v6 = objc_opt_class();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__PUPXPhotoKitPlaybackRateActionPerformer_performUserInteractionTask__block_invoke_728;
    v15[3] = &unk_1E5F28808;
    v15[4] = self;
    id v7 = +[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:self class:v6 assets:v5 prepareAction:v15];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        v8 = [(PXActionPerformer *)self undoManager];
        [v7 executeWithUndoManager:v8 completionHandler:&__block_literal_global_734];

        [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
        goto LABEL_8;
      }
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v13);
      v14 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPXPhotoKitAssetActionManager.m", 1707, @"%@ should be an instance inheriting from %@, but it is %@", @"[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:self class:PXEditBatchPlaybackRateAction.class assets:validAssets prepareAction:^(PXEditBatchPlaybackRateAction *preparePlaybackRateAction) { preparePlaybackRateAction.playbackRate = self.playbackRate; }]",
        v12,
        v14);
    }
    else
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPXPhotoKitAssetActionManager.m", 1707, @"%@ should be an instance inheriting from %@, but it is nil", @"[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:self class:PXEditBatchPlaybackRateAction.class assets:validAssets prepareAction:^(PXEditBatchPlaybackRateAction *preparePlaybackRateAction) { preparePlaybackRateAction.playbackRate = self.playbackRate; }]",
        v12);
    }

    goto LABEL_4;
  }
  v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_INFO, "No valid assets to apply playback rate, aborting.", buf, 2u);
  }

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
LABEL_8:
}

void __69__PUPXPhotoKitPlaybackRateActionPerformer_performUserInteractionTask__block_invoke_728(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 playbackRate];
  objc_msgSend(v3, "setPlaybackRate:");
}

uint64_t __69__PUPXPhotoKitPlaybackRateActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (+[PUPXPhotoKitBatchActionPerformer canPerformBatchOnAsset:v2])
  {
    uint64_t v3 = [MEMORY[0x1E4F8FFE8] isSupportedAsset:v2 type:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (BOOL)_canPerformOnAsset:(id)a3
{
  return [a3 canPerformEditOperation:2];
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isAnyItemSelected])
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __94__PUPXPhotoKitPlaybackRateActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v13[3] = &unk_1E5F28708;
    v13[4] = &v14;
    v13[5] = a1;
    [v8 enumerateSelectedObjectsUsingBlock:v13];
    BOOL v11 = *((unsigned char *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __94__PUPXPhotoKitPlaybackRateActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v6;

    if (v5 && [*(id *)(a1 + 40) _canPerformOnAsset:v5])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
  else
  {

    id v5 = 0;
  }
}

@end