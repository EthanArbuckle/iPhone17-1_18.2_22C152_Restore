@interface PUPhotoKitAssetActionManager
+ (Class)actionPerformerClassForActionType:(unint64_t)a3;
- (BOOL)_actionTypeIsSimple:(unint64_t)a3;
- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (BOOL)enableNavigateToPhotos;
- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (PUPhotoKitDataSourceManager)dataSourceManager;
- (id)_photoKitAssetsDataSource;
- (id)_photosDataSource;
- (id)actionPerformerForDuplicatingAssetsByAssetCollection:(id)a3 withNewStillImageTime:(id *)a4;
- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4;
- (id)actionPerformerForPastingAdjustmentsByAssetCollection:(id)a3;
- (id)actionPerformerForRevertingAdjustmentsByAssetCollection:(id)a3;
- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetsByAssetCollection:(id)a4;
- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4;
- (void)setDataSourceManager:(id)a3;
- (void)setEnableNavigateToPhotos:(BOOL)a3;
@end

@implementation PUPhotoKitAssetActionManager

- (void).cxx_destruct
{
}

- (void)setEnableNavigateToPhotos:(BOOL)a3
{
  self->_enableNavigateToPhotos = a3;
}

- (BOOL)enableNavigateToPhotos
{
  return self->_enableNavigateToPhotos;
}

- (void)setDataSourceManager:(id)a3
{
}

- (PUPhotoKitDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (BOOL)_actionTypeIsSimple:(unint64_t)a3
{
  return (a3 < 0x40) & (0xFFFFFDBFFFFFFFFELL >> a3);
}

- (id)_photoKitAssetsDataSource
{
  v3 = [(PUAssetActionManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(PUAssetActionManager *)self delegate];
    v6 = [v5 assetActionManagerCurrentAssetsDataSource:self];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)_photosDataSource
{
  v3 = [(PUPhotoKitAssetActionManager *)self dataSourceManager];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(PUPhotoKitAssetActionManager *)self dataSourceManager];
    v6 = [v5 photosDataSource];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [PUPhotoKitEditActionPerformer alloc];
  v11[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  v9 = [(PUAssetActionPerformer *)v7 initWithActionType:15 assets:v8 orAssetsByAssetCollection:0];
  [(PUPhotoKitEditActionPerformer *)v9 setPendingEditsRequest:v6];

  return v9;
}

- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [PUPXPhotoKitAudioMixModeActionPerformer alloc];
  v8 = [(PXActionPerformer *)v7 initWithActionType:*MEMORY[0x1E4F90C78]];
  [(PUPXPhotoKitAudioMixModeActionPerformer *)v8 setAudioMixMode:v6];

  v9 = [PUPhotoKitAudioMixModePerformer alloc];
  v13[0] = v5;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  v11 = [(PUPXPhotoKitActionPerformerAdapter *)v9 initWithActionType:29 assets:v10 orAssetsByAssetCollection:0 pxActionPerformer:v8];
  return v11;
}

- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [PUPXPhotoKitPlaybackRateActionPerformer alloc];
  id v7 = [(PXActionPerformer *)v6 initWithActionType:*MEMORY[0x1E4F90C80]];
  *(float *)&double v8 = a3;
  [(PUPXPhotoKitPlaybackRateActionPerformer *)v7 setPlaybackRate:v8];
  v9 = [PUPhotoKitPlaybackRatePerformer alloc];
  v13[0] = v5;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  v11 = [(PUPXPhotoKitActionPerformerAdapter *)v9 initWithActionType:28 assets:v10 orAssetsByAssetCollection:0 pxActionPerformer:v7];
  return v11;
}

- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [PUPhotoKitEditActionPerformer alloc];
  v11[0] = v5;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  v9 = [(PUAssetActionPerformer *)v7 initWithActionType:25 assets:v8 orAssetsByAssetCollection:0];
  [(PUPhotoKitEditActionPerformer *)v9 setQuickCropContext:v6];

  return v9;
}

- (id)actionPerformerForRevertingAdjustmentsByAssetCollection:(id)a3
{
  id v3 = a3;
  char v4 = [(PUPXPhotoKitActionPerformerAdapter *)[PUPhotoKitRevertAdjustmentsActionPerformer alloc] initWithActionType:21 assets:0 orAssetsByAssetCollection:v3];

  return v4;
}

- (id)actionPerformerForPastingAdjustmentsByAssetCollection:(id)a3
{
  id v3 = a3;
  char v4 = [(PUPXPhotoKitActionPerformerAdapter *)[PUPhotoKitPasteAdjustmentsActionPerformer alloc] initWithActionType:20 assets:0 orAssetsByAssetCollection:v3];

  return v4;
}

- (id)actionPerformerForDuplicatingAssetsByAssetCollection:(id)a3 withNewStillImageTime:(id *)a4
{
  id v5 = a3;
  id v6 = [(PUAssetActionPerformer *)[PUPhotoKitDuplicateActionPerformer alloc] initWithActionType:38 assets:0 orAssetsByAssetCollection:v5];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  [(PUPhotoKitDuplicateActionPerformer *)v6 setNewStillImageTime:&v8];
  return v6;
}

- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetsByAssetCollection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PUAssetActionPerformer *)[PUPhotoKitFavoriteActionPerformer alloc] initWithActionType:41 assets:0 orAssetsByAssetCollection:v6];

  [(PUPhotoKitFavoriteActionPerformer *)v7 setFavorite:v4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [(PUPhotoKitAssetActionManager *)self _photosDataSource];
  [(PUPhotoKitActionPerformer *)v7 setPhotosDataSource:v8];

  return v7;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4
{
  id v7 = a4;
  if (![(PUPhotoKitAssetActionManager *)self _actionTypeIsSimple:a3])
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 444, @"Invalid parameter not satisfying: %@", @"[self _actionTypeIsSimple:actionType]" object file lineNumber description];
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = +[PUPhotoKitAssetActionManager actionPerformerClassForActionType:a3];
  if (v8)
  {
    uint64_t v9 = [[v8 alloc] initWithActionType:a3 assets:0 orAssetsByAssetCollection:v7];
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PUPhotoKitAssetActionManager;
    uint64_t v9 = [(PUAssetActionManager *)&v24 actionPerformerForSimpleActionType:a3 onAssetsByAssetCollection:v7];
  }
  v10 = (void *)v9;
  if (objc_opt_respondsToSelector())
  {
    v11 = [(PUPhotoKitAssetActionManager *)self _photoKitAssetsDataSource];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 photosDataSource];
      v14 = [MEMORY[0x1E4F1CA60] dictionary];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __93__PUPhotoKitAssetActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke;
      v21[3] = &unk_1E5F29868;
      id v22 = v13;
      id v23 = v14;
      id v15 = v14;
      id v16 = v13;
      [v7 enumerateKeysAndObjectsUsingBlock:v21];
      [v10 setFetchResultsByAssetCollection:v15];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [(PUPhotoKitAssetActionManager *)self _photosDataSource];
    [v10 setPhotosDataSource:v17];
  }
  v18 = [(id)objc_opt_class() actionManagerLog];
  [v10 setActionPerformerLog:v18];

  return v10;
}

void __93__PUPhotoKitAssetActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) sectionForAssetCollection:v6];
  BOOL v4 = v6;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = objc_msgSend(*(id *)(a1 + 32), "assetsInSection:");
    if (v5) {
      [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
    }

    BOOL v4 = v6;
  }
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = +[PUPhotoKitAssetActionManager actionPerformerClassForActionType:a3];
  if (v10 && ((v11 = v10, !v8) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    unsigned __int8 v12 = [(objc_class *)v11 shouldEnableOnAsset:v8 inAssetCollection:v9];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PUPhotoKitAssetActionManager;
    unsigned __int8 v12 = [(PUAssetActionManager *)&v15 shouldEnableActionType:a3 onAsset:v8 inAssetCollection:v9];
  }
  BOOL v13 = v12;

  return v13;
}

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = +[PUPhotoKitAssetActionManager actionPerformerClassForActionType:a3];
  if (!v10 || (v11 = v10, v8) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v18.receiver = self;
    v18.super_class = (Class)PUPhotoKitAssetActionManager;
    unsigned __int8 v16 = [(PUAssetActionManager *)&v18 canPerformActionType:a3 onAsset:v8 inAssetCollection:v9];
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v9;
  }
  else {
    id v12 = 0;
  }
  int v13 = [(objc_class *)v11 canPerformOnAsset:v8 inAssetCollection:v12];
  BOOL v14 = a3 == 40;
  if (a3 == 40) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v13;
  }
  if (v14 && v13)
  {
    unsigned __int8 v16 = [(PUPhotoKitAssetActionManager *)self enableNavigateToPhotos];
LABEL_15:
    BOOL v15 = v16;
  }

  return v15;
}

+ (Class)actionPerformerClassForActionType:(unint64_t)a3
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x3DuLL:
    case 0x3FuLL:
      goto LABEL_4;
    case 0x11uLL:
      BOOL v4 = +[PUPhotoEditProtoSettings sharedInstance];
      [v4 showAutoEnhanceAction];

      goto LABEL_4;
    case 0x1AuLL:
    case 0x1BuLL:
      id v5 = +[PUPhotoEditProtoSettings sharedInstance];
      [v5 showRotateAction];

LABEL_4:
      uint64_t v3 = objc_opt_class();
      break;
    default:
      break;
  }
  return (Class)v3;
}

@end