@interface PUJoiningAssetActionManager
- (BOOL)canPerformAction:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4;
- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (BOOL)shouldEnableActionType:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4;
- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (NSMapTable)_actionManagerByClass;
- (PUAssetActionManager)_actionManagerForNoAsset;
- (PUJoiningAssetActionManager)init;
- (id)_actionManagerForAsset:(id)a3;
- (id)_actionManagerForAssets:(id)a3;
- (id)_actionManagerForAssetsByAssetCollection:(id)a3;
- (id)actionPerformerForDuplicatingAssetsByAssetCollection:(id)a3 withNewStillImageTime:(id *)a4;
- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetsByAssetCollection:(id)a4;
- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4;
- (void)_setActionManagerForNoAsset:(id)a3;
- (void)registerActionManager:(id)a3 forAssetClass:(Class)a4;
@end

@implementation PUJoiningAssetActionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__actionManagerForNoAsset, 0);
  objc_storeStrong((id *)&self->__actionManagerByClass, 0);
}

- (void)_setActionManagerForNoAsset:(id)a3
{
}

- (PUAssetActionManager)_actionManagerForNoAsset
{
  return self->__actionManagerForNoAsset;
}

- (NSMapTable)_actionManagerByClass
{
  return self->__actionManagerByClass;
}

- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PUJoiningAssetActionManager *)self _actionManagerForAsset:v6];
  v9 = [v8 actionPerformerForEditingWithPendingEditsRequest:v7 onAsset:v6];

  return v9;
}

- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PUJoiningAssetActionManager *)self _actionManagerForAsset:v6];
  v9 = [v8 actionPerformerForEditingAudioMixMode:v7 onAsset:v6];

  return v9;
}

- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4
{
  id v6 = a4;
  id v7 = [(PUJoiningAssetActionManager *)self _actionManagerForAsset:v6];
  *(float *)&double v8 = a3;
  v9 = [v7 actionPerformerForEditingPlaybackRate:v6 onAsset:v8];

  return v9;
}

- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PUJoiningAssetActionManager *)self _actionManagerForAsset:v6];
  v9 = [v8 actionPerformerForEditingWithQuickCropContext:v7 onAsset:v6];

  return v9;
}

- (id)actionPerformerForDuplicatingAssetsByAssetCollection:(id)a3 withNewStillImageTime:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = [v6 allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v23 = a4;
    id v24 = v6;
    v10 = 0;
    uint64_t v11 = *(void *)v34;
    id obj = v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v30;
          while (2)
          {
            uint64_t v18 = 0;
            v19 = v10;
            do
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v20 = [(PUJoiningAssetActionManager *)self _actionManagerForAsset:*(void *)(*((void *)&v29 + 1) + 8 * v18)];
              v10 = (void *)v20;
              if (v19 && (void *)v20 != v19)
              {

                v10 = 0;
                goto LABEL_17;
              }

              ++v18;
              v19 = v10;
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);

    a4 = v23;
    id v6 = v24;
    if (v10)
    {
      long long v27 = *(_OWORD *)&v23->var0;
      int64_t var3 = v23->var3;
      v21 = [v10 actionPerformerForDuplicatingAssetsByAssetCollection:v24 withNewStillImageTime:&v27];
      goto LABEL_23;
    }
  }
  else
  {
  }
  v26.receiver = self;
  v26.super_class = (Class)PUJoiningAssetActionManager;
  long long v27 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  v21 = [(PUAssetActionManager *)&v26 actionPerformerForDuplicatingAssetsByAssetCollection:v6 withNewStillImageTime:&v27];
  v10 = 0;
LABEL_23:

  return v21;
}

- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetsByAssetCollection:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = [v6 allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unsigned int v23 = v4;
    id v24 = v6;
    id obj = v7;
    v10 = 0;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v28;
          while (2)
          {
            uint64_t v18 = 0;
            v19 = v10;
            do
            {
              if (*(void *)v28 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v20 = [(PUJoiningAssetActionManager *)self _actionManagerForAsset:*(void *)(*((void *)&v27 + 1) + 8 * v18)];
              v10 = (void *)v20;
              if (v19 && (void *)v20 != v19)
              {

                v10 = 0;
                goto LABEL_17;
              }

              ++v18;
              v19 = v10;
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);

    id v6 = v24;
    uint64_t v4 = v23;
    if (v10)
    {
      v21 = [v10 actionPerformerForSettingFavoriteTo:v23 onAssetsByAssetCollection:v24];
      goto LABEL_23;
    }
  }
  else
  {
  }
  v26.receiver = self;
  v26.super_class = (Class)PUJoiningAssetActionManager;
  v21 = [(PUAssetActionManager *)&v26 actionPerformerForSettingFavoriteTo:v4 onAssetsByAssetCollection:v6];
  v10 = 0;
LABEL_23:

  return v21;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4
{
  id v6 = a4;
  id v7 = [v6 allKeys];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [v6 objectForKeyedSubscript:v8];
  v10 = [v9 firstObject];
  uint64_t v11 = [(PUJoiningAssetActionManager *)self _actionManagerForAsset:v10];
  v12 = [v11 actionPerformerForSimpleActionType:a3 onAssetsByAssetCollection:v6];

  return v12;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4
{
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__40070;
    v11[4] = __Block_byref_object_dispose__40071;
    id v12 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__PUJoiningAssetActionManager_shouldEnableActionType_onAllAssetsByAssetCollection___block_invoke;
    v10[3] = &unk_1E5F26C50;
    v10[4] = self;
    v10[5] = &v13;
    v10[6] = v11;
    v10[7] = a3;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
    char v7 = *((unsigned char *)v14 + 24) != 0;
    _Block_object_dispose(v11, 8);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    uint64_t v8 = [(PUJoiningAssetActionManager *)self _actionManagerForNoAsset];
    char v7 = [v8 shouldEnableActionType:a3 onAllAssetsByAssetCollection:v6];
  }
  return v7;
}

void __83__PUJoiningAssetActionManager_shouldEnableActionType_onAllAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * v12);
      id v14 = objc_msgSend(*(id *)(a1 + 32), "_actionManagerForAsset:", v13, (void)v24);
      uint64_t v15 = v14;
      if (!v14) {
        uint64_t v15 = *(void **)(a1 + 32);
      }
      id v16 = v15;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v16 shouldEnableActionType:*(void *)(a1 + 56) onAsset:v13 inAssetCollection:v7];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      char v18 = *(unsigned char *)(v17 + 24);
      if (v18)
      {
        id v19 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v19) {
          BOOL v20 = v19 == v16;
        }
        else {
          BOOL v20 = 1;
        }
        char v18 = v20;
      }
      *(unsigned char *)(v17 + 24) = v18;
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v16;
      id v23 = v16;

      LODWORD(v22) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (!v22) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)canPerformAction:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4
{
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__40070;
    v11[4] = __Block_byref_object_dispose__40071;
    id v12 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__PUJoiningAssetActionManager_canPerformAction_onAllAssetsByAssetCollection___block_invoke;
    v10[3] = &unk_1E5F26C50;
    v10[4] = self;
    v10[5] = &v13;
    v10[6] = v11;
    v10[7] = a3;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
    char v7 = *((unsigned char *)v14 + 24) != 0;
    _Block_object_dispose(v11, 8);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = [(PUJoiningAssetActionManager *)self _actionManagerForNoAsset];
    char v7 = [v8 canPerformActionType:a3 onAsset:0 inAssetCollection:0];
  }
  return v7;
}

void __77__PUJoiningAssetActionManager_canPerformAction_onAllAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * v12);
      id v14 = objc_msgSend(*(id *)(a1 + 32), "_actionManagerForAsset:", v13, (void)v24);
      uint64_t v15 = v14;
      if (!v14) {
        uint64_t v15 = *(void **)(a1 + 32);
      }
      id v16 = v15;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v16 canPerformActionType:*(void *)(a1 + 56) onAsset:v13 inAssetCollection:v7];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      char v18 = *(unsigned char *)(v17 + 24);
      if (v18)
      {
        id v19 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v19) {
          BOOL v20 = v19 == v16;
        }
        else {
          BOOL v20 = 1;
        }
        char v18 = v20;
      }
      *(unsigned char *)(v17 + 24) = v18;
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v16;
      id v23 = v16;

      LODWORD(v22) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (!v22) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [(PUJoiningAssetActionManager *)self _actionManagerForAsset:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    unsigned __int8 v12 = [v10 shouldEnableActionType:a3 onAsset:v9 inAssetCollection:v8];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PUJoiningAssetActionManager;
    unsigned __int8 v12 = [(PUAssetActionManager *)&v15 shouldEnableActionType:a3 onAsset:v9 inAssetCollection:v8];
  }
  BOOL v13 = v12;

  return v13;
}

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [(PUJoiningAssetActionManager *)self _actionManagerForAsset:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    unsigned __int8 v12 = [v10 canPerformActionType:a3 onAsset:v9 inAssetCollection:v8];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PUJoiningAssetActionManager;
    unsigned __int8 v12 = [(PUAssetActionManager *)&v15 canPerformActionType:a3 onAsset:v9 inAssetCollection:v8];
  }
  BOOL v13 = v12;

  return v13;
}

- (id)_actionManagerForAssetsByAssetCollection:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v11 = 0;
    unsigned __int8 v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__40070;
    objc_super v15 = __Block_byref_object_dispose__40071;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PUJoiningAssetActionManager__actionManagerForAssetsByAssetCollection___block_invoke;
    v10[3] = &unk_1E5F26C28;
    v10[4] = self;
    v10[5] = &v11;
    [v4 enumerateKeysAndObjectsUsingBlock:v10];
    v5 = (void *)v12[5];
    id v6 = [MEMORY[0x1E4F1CA98] null];
    LODWORD(v5) = [v5 isEqual:v6];

    if (v5)
    {
      id v7 = (void *)v12[5];
      v12[5] = 0;
    }
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v8 = [(PUJoiningAssetActionManager *)self _actionManagerForNoAsset];
  }

  return v8;
}

void __72__PUJoiningAssetActionManager__actionManagerForAssetsByAssetCollection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_actionManagerForAssets:");
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  id v9 = v10;
  if (v10) {
    BOOL v11 = v9 == v6;
  }
  else {
    BOOL v11 = 1;
  }
  id v15 = v6;
  if (v11)
  {
    objc_storeStrong(v8, v6);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

- (id)_actionManagerForAssets:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        uint64_t v10 = 0;
        BOOL v11 = v8;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = -[PUJoiningAssetActionManager _actionManagerForAsset:](self, "_actionManagerForAsset:", *(void *)(*((void *)&v14 + 1) + 8 * v10), (void)v14);
          id v8 = (void *)v12;
          if (v11 && v11 != (void *)v12)
          {

            goto LABEL_13;
          }

          ++v10;
          BOOL v11 = v8;
        }
        while (v7 != v10);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_13:
      id v8 = 0;
    }
  }
  else
  {
    id v8 = [(PUJoiningAssetActionManager *)self _actionManagerForNoAsset];
  }

  return v8;
}

- (id)_actionManagerForAsset:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PUJoiningAssetActionManager *)self _actionManagerByClass];
    uint64_t v6 = [v5 objectForKey:objc_opt_class()];

    if (!v6)
    {
      uint64_t v7 = [(PUJoiningAssetActionManager *)self _actionManagerByClass];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = objc_msgSend(v7, "keyEnumerator", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            if ([(id)objc_opt_class() isSubclassOfClass:v13])
            {
              uint64_t v6 = [v7 objectForKey:v13];

              if (v6) {
                [v7 setObject:v6 forKey:objc_opt_class()];
              }
              goto LABEL_15;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      uint64_t v6 = 0;
LABEL_15:
    }
  }
  else
  {
    uint64_t v6 = [(PUJoiningAssetActionManager *)self _actionManagerForNoAsset];
  }

  return v6;
}

- (void)registerActionManager:(id)a3 forAssetClass:(Class)a4
{
  id v7 = a3;
  id v10 = v7;
  if (!v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUJoiningAssetActionManager.m", 29, @"Invalid parameter not satisfying: %@", @"actionManager != nil" object file lineNumber description];

    id v7 = 0;
  }
  if (a4)
  {
    id v8 = [(PUJoiningAssetActionManager *)self _actionManagerByClass];
    [v8 setObject:v10 forKey:a4];
  }
  else
  {
    [(PUJoiningAssetActionManager *)self _setActionManagerForNoAsset:v7];
  }
}

- (PUJoiningAssetActionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUJoiningAssetActionManager;
  v2 = [(PUJoiningAssetActionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    actionManagerByClass = v2->__actionManagerByClass;
    v2->__actionManagerByClass = (NSMapTable *)v3;
  }
  return v2;
}

@end