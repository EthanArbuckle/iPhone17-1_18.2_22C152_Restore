@interface PUPXAssetActionManager
- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (PUAssetActionManager)fallbackActionManager;
- (PUPXAssetActionManager)init;
- (PUPXAssetActionManager)initWithUnderlyingActionManager:(id)a3;
- (PXAssetActionManager)underlyingActionManager;
- (id)_selectionSnapshotForAssetReferences:(id)a3;
- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetReferences:(id)a4;
- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetReferences:(id)a4;
- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4;
- (id)barButtonItemForActionType:(unint64_t)a3;
- (id)localizedTitleForActionType:(unint64_t)a3;
- (id)px_selectionManager;
- (void)setFallbackActionManager:(id)a3;
@end

@implementation PUPXAssetActionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackActionManager, 0);
  objc_storeStrong((id *)&self->_underlyingActionManager, 0);
}

- (void)setFallbackActionManager:(id)a3
{
}

- (PUAssetActionManager)fallbackActionManager
{
  return self->_fallbackActionManager;
}

- (PXAssetActionManager)underlyingActionManager
{
  return self->_underlyingActionManager;
}

- (id)localizedTitleForActionType:(unint64_t)a3
{
  v5 = PXAssetActionTypeForPUAssetActionType(a3);
  if (v5
    && [(PXAssetActionManager *)self->_underlyingActionManager canPerformActionType:v5])
  {
    v6 = [(PXAssetActionManager *)self->_underlyingActionManager localizedTitleForActionType:v5 useCase:1];
  }
  else
  {
    v6 = 0;
  }
  v7 = [(PUPXAssetActionManager *)self fallbackActionManager];
  v8 = v7;
  if (!v6 && v7)
  {
    v6 = [v7 localizedTitleForActionType:a3];
  }

  return v6;
}

- (id)barButtonItemForActionType:(unint64_t)a3
{
  v5 = PXAssetActionTypeForPUAssetActionType(a3);
  if (v5
    && [(PXAssetActionManager *)self->_underlyingActionManager canPerformActionType:v5])
  {
    v6 = [(PXAssetActionManager *)self->_underlyingActionManager barButtonItemForActionType:v5];
  }
  else
  {
    v6 = 0;
  }
  v7 = [(PUPXAssetActionManager *)self fallbackActionManager];
  v8 = v7;
  if (!v6 && v7)
  {
    v6 = [v7 barButtonItemForActionType:a3];
  }

  return v6;
}

- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUPXAssetActionManager *)self fallbackActionManager];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 actionPerformerForEditingWithPendingEditsRequest:v6 onAsset:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUPXAssetActionManager *)self fallbackActionManager];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 actionPerformerForEditingAudioMixMode:v6 onAsset:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4
{
  id v6 = a4;
  id v7 = [(PUPXAssetActionManager *)self fallbackActionManager];
  v9 = v7;
  if (v7)
  {
    *(float *)&double v8 = a3;
    v10 = [v7 actionPerformerForEditingPlaybackRate:v6 onAsset:v8];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PUPXAssetActionManager *)self fallbackActionManager];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 actionPerformerForEditingWithQuickCropContext:v6 onAsset:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4
{
  return [(PUPXAssetActionManager *)self actionPerformerForSimpleActionType:a3 onAssetReferences:0];
}

- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetReferences:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PUPXAssetActionManager *)self actionPerformerForSimpleActionType:41 onAssetReferences:v6];
  double v8 = [(PUPXAssetActionManager *)self fallbackActionManager];
  v9 = v8;
  if (!v7 && v8)
  {
    id v7 = [v8 actionPerformerForSettingFavoriteTo:v4 onAssetReferences:v6];
  }

  return v7;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetReferences:(id)a4
{
  id v6 = a4;
  id v7 = PXAssetActionTypeForPUAssetActionType(a3);
  if (v7)
  {
    double v8 = [(PXAssetActionManager *)self->_underlyingActionManager objectReference];
    if ([v6 count] == 1)
    {
      v9 = [v6 firstObject];
      v10 = [v9 pxAssetReference];
      [(PXAssetActionManager *)self->_underlyingActionManager setObjectReference:v10];
    }
    v11 = [(PXAssetActionManager *)self->_underlyingActionManager actionPerformerForActionType:v7];
    if (v11)
    {
      if (a3 != 62)
      {
        v12 = [(PUPXAssetActionManager *)self _selectionSnapshotForAssetReferences:v6];
        [v11 setSelectionSnapshot:v12];
      }
      v13 = [[PUPXAssetActionPerformer alloc] initWithUnderlyingActionPerformer:v11];
    }
    else
    {
      v13 = 0;
    }
    [(PXAssetActionManager *)self->_underlyingActionManager setObjectReference:v8];
  }
  else
  {
    v13 = 0;
  }
  v14 = [(PUPXAssetActionManager *)self fallbackActionManager];
  v15 = v14;
  if (!v13 && v14)
  {
    v13 = [v14 actionPerformerForSimpleActionType:a3 onAssetReferences:v6];
  }

  return v13;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = PXAssetActionTypeForPUAssetActionType(a3);
  if (v10) {
    char v11 = [(PXAssetActionManager *)self->_underlyingActionManager shouldEnableActionType:v10 onAsset:v8];
  }
  else {
    char v11 = 0;
  }
  v12 = [(PUPXAssetActionManager *)self fallbackActionManager];
  v13 = v12;
  if ((v11 & 1) == 0 && v12) {
    char v11 = [v12 shouldEnableActionType:a3 onAsset:v8 inAssetCollection:v9];
  }

  return v11;
}

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  unint64_t v8 = (unint64_t)a4;
  unint64_t v9 = (unint64_t)a5;
  v10 = PXAssetActionTypeForPUAssetActionType(a3);
  if (v10 && v8 | v9)
  {
    char v11 = [(PXAssetActionManager *)self->_underlyingActionManager objectReference];
    id v12 = objc_alloc(MEMORY[0x1E4F91220]);
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F91348] + 16);
    v21[0] = *MEMORY[0x1E4F91348];
    v21[1] = v13;
    v14 = (void *)[v12 initWithSectionObject:v9 itemObject:v8 subitemObject:0 indexPath:v21];
    [(PXAssetActionManager *)self->_underlyingActionManager setObjectReference:v14];

    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[PXAssetActionManager canPerformActionType:](self->_underlyingActionManager, "canPerformActionType:", v10));
    [(PXAssetActionManager *)self->_underlyingActionManager setObjectReference:v11];
  }
  else
  {
    v15 = 0;
  }
  v16 = [(PUPXAssetActionManager *)self fallbackActionManager];
  if (!v15)
  {
    v17 = [(PUPXAssetActionManager *)self underlyingActionManager];
    int v18 = [v17 isActionTypeAllowed:v10];

    if (v18)
    {
      if (v16)
      {
        v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "canPerformActionType:onAsset:inAssetCollection:", a3, v8, v9));
      }
    }
  }
  char v19 = [v15 BOOLValue];

  return v19;
}

- (id)_selectionSnapshotForAssetReferences:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXAssetActionManager *)self->_underlyingActionManager selectionManager];
  id v6 = [v5 selectionSnapshot];

  if (v4 && [v4 count])
  {
    id v7 = [v6 dataSource];
    unint64_t v8 = [MEMORY[0x1E4F912A0] indexPathSet];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          [v7 identifier];
          v15 = [v14 indexPath];
          PXSimpleIndexPathFromIndexPath();

          v18[0] = v19;
          v18[1] = v20;
          [v8 addIndexPath:v18];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v16 = (id)[objc_alloc(MEMORY[0x1E4F912E0]) initWithDataSource:v7 selectedIndexPaths:v8];
  }
  else
  {
    id v16 = v6;
  }

  return v16;
}

- (id)px_selectionManager
{
  return (id)[(PXAssetActionManager *)self->_underlyingActionManager selectionManager];
}

- (PUPXAssetActionManager)initWithUnderlyingActionManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPXAssetActionManager;
  id v6 = [(PUPXAssetActionManager *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingActionManager, a3);
  }

  return v7;
}

- (PUPXAssetActionManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPXAssetActionManager.m", 136, @"%s is not available as initializer", "-[PUPXAssetActionManager init]");

  abort();
}

@end