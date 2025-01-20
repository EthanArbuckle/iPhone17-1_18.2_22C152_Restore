@interface PUAssetActionManager
+ (OS_os_log)actionManagerLog;
+ (id)_unlockDeviceHandlerWithActionType;
+ (void)setUnlockDeviceHandlerWithActionType:(id)a3;
- (BOOL)canPerformAction:(unint64_t)a3 onAllAssetReferences:(id)a4;
- (BOOL)canPerformAction:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4;
- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (BOOL)shouldEnableActionType:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4;
- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (PUAssetActionManagerDelegate)delegate;
- (PXSectionedSelectionManager)px_selectionManager;
- (id)_assetsByAssetCollectionForAssetReferences:(id)a3;
- (id)actionPerformerForDuplicatingAssetsByAssetCollection:(id)a3 withNewStillImageTime:(id *)a4;
- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForPastingAdjustmentsByAssetCollection:(id)a3;
- (id)actionPerformerForRemoveAssetsFromFeaturedPhotosByAssetCollection:(id)a3 assetToSuggestionMap:(id)a4;
- (id)actionPerformerForRevertingAdjustmentsByAssetCollection:(id)a3;
- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetReferences:(id)a4;
- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetsByAssetCollection:(id)a4;
- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetReferences:(id)a4;
- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4;
- (id)barButtonItemForActionType:(unint64_t)a3;
- (id)localizedTitleForActionType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PUAssetActionManager

+ (OS_os_log)actionManagerLog
{
  if (actionManagerLog_onceToken != -1) {
    dispatch_once(&actionManagerLog_onceToken, &__block_literal_global_9180);
  }
  v2 = (void *)actionManagerLog_actionManagerLog;
  return (OS_os_log *)v2;
}

void __40__PUAssetActionManager_actionManagerLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "AssetActions");
  v1 = (void *)actionManagerLog_actionManagerLog;
  actionManagerLog_actionManagerLog = (uint64_t)v0;
}

+ (id)_unlockDeviceHandlerWithActionType
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = _Block_copy((const void *)_sharedUnlockDeviceHandlerWithActionType);
  objc_sync_exit(v2);

  v4 = _Block_copy(v3);
  return v4;
}

+ (void)setUnlockDeviceHandlerWithActionType:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PUAssetActionManager.m", 220, @"Invalid parameter not satisfying: %@", @"unlockDeviceHandlerWithActionType != nil" object file lineNumber description];
  }
  id v5 = a1;
  objc_sync_enter(v5);
  uint64_t v6 = [v9 copy];
  v7 = (void *)_sharedUnlockDeviceHandlerWithActionType;
  _sharedUnlockDeviceHandlerWithActionType = v6;

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (PUAssetActionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAssetActionManagerDelegate *)WeakRetained;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4
{
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__PUAssetActionManager_shouldEnableActionType_onAllAssetsByAssetCollection___block_invoke;
    v9[3] = &unk_1E5F235B8;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = a3;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v7 = [(PUAssetActionManager *)self shouldEnableActionType:a3 onAsset:0 inAssetCollection:0];
  }

  return v7;
}

void __76__PUAssetActionManager_shouldEnableActionType_onAllAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "shouldEnableActionType:onAsset:inAssetCollection:", *(void *)(a1 + 48), *(void *)(*((void *)&v13 + 1) + 8 * v12), v7, (void)v13);
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)canPerformAction:(unint64_t)a3 onAllAssetReferences:(id)a4
{
  id v6 = [(PUAssetActionManager *)self _assetsByAssetCollectionForAssetReferences:a4];
  LOBYTE(a3) = [(PUAssetActionManager *)self canPerformAction:a3 onAllAssetsByAssetCollection:v6];

  return a3;
}

- (BOOL)canPerformAction:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4
{
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PUAssetActionManager_canPerformAction_onAllAssetsByAssetCollection___block_invoke;
    v9[3] = &unk_1E5F235B8;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = a3;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v7 = [(PUAssetActionManager *)self canPerformActionType:a3 onAsset:0 inAssetCollection:0];
  }

  return v7;
}

void __70__PUAssetActionManager_canPerformAction_onAllAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "canPerformActionType:onAsset:inAssetCollection:", *(void *)(a1 + 48), *(void *)(*((void *)&v13 + 1) + 8 * v12), v7, (void)v13);
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (id)actionPerformerForRemoveAssetsFromFeaturedPhotosByAssetCollection:(id)a3 assetToSuggestionMap:(id)a4
{
  return 0;
}

- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4
{
  return 0;
}

- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4
{
  return 0;
}

- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4
{
  return 0;
}

- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4
{
  return 0;
}

- (id)actionPerformerForRevertingAdjustmentsByAssetCollection:(id)a3
{
  return 0;
}

- (id)actionPerformerForPastingAdjustmentsByAssetCollection:(id)a3
{
  return 0;
}

- (id)actionPerformerForDuplicatingAssetsByAssetCollection:(id)a3 withNewStillImageTime:(id *)a4
{
  return 0;
}

- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetReferences:(id)a4
{
  BOOL v4 = a3;
  id v6 = [(PUAssetActionManager *)self _assetsByAssetCollectionForAssetReferences:a4];
  id v7 = [(PUAssetActionManager *)self actionPerformerForSettingFavoriteTo:v4 onAssetsByAssetCollection:v6];

  return v7;
}

- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetsByAssetCollection:(id)a4
{
  return 0;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetReferences:(id)a4
{
  id v6 = [(PUAssetActionManager *)self _assetsByAssetCollectionForAssetReferences:a4];
  id v7 = [(PUAssetActionManager *)self actionPerformerForSimpleActionType:a3 onAssetsByAssetCollection:v6];

  return v7;
}

- (id)_assetsByAssetCollectionForAssetReferences:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    id v5 = [v4 assetCollection];
    uint64_t v6 = [v4 asset];
    id v7 = (void *)v6;
    id v8 = (void *)MEMORY[0x1E4F1CC08];
    if (v5 && v6)
    {
      uint64_t v29 = v6;
      v30 = v5;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      v31[0] = v9;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = v3;
    uint64_t v10 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v21 = v3;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v4);
          }
          long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v15 = [v14 assetCollection];
          long long v16 = [v14 asset];
          if (v16) {
            BOOL v17 = v15 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17)
          {
            uint64_t v18 = PXAssertGetLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v14;
              _os_log_error_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_ERROR, "Unable to map asset reference to assetsByAssetCollection: %@", buf, 0xCu);
            }
          }
          else
          {
            v19 = [v8 objectForKeyedSubscript:v15];
            if (v19)
            {
              uint64_t v18 = v19;
              [v19 addObject:v16];
            }
            else
            {
              uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithObject:v16];
              [v8 setObject:v18 forKeyedSubscript:v15];
            }
          }
        }
        uint64_t v11 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v11);
      id v3 = v21;
    }
  }

  return v8;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4
{
  return 0;
}

- (id)localizedTitleForActionType:(unint64_t)a3
{
  return 0;
}

- (id)barButtonItemForActionType:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  return 1;
}

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  return 0;
}

- (PXSectionedSelectionManager)px_selectionManager
{
  return 0;
}

@end