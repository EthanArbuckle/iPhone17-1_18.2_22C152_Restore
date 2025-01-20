@interface PUPXPhotoKitActionPerformerAdapter
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (Class)pxActionPerformerClass;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (NSString)pxActionType;
- (PUPXPhotoKitActionPerformerAdapter)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5;
- (PUPXPhotoKitActionPerformerAdapter)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5 pxActionPerformer:(id)a6;
- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3;
- (id)actionPerformerHostViewControllerForPresentingToast:(id)a3;
- (id)hostViewControllerForActionPerformer:(id)a3;
- (unint64_t)actionType;
- (void)_configureActionPerformer:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PUPXPhotoKitActionPerformerAdapter

- (void).cxx_destruct
{
}

- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3
{
  v4 = [(PUAssetActionPerformer *)self delegate];
  [v4 assetActionPerformerBottomPaddingForPresentingToast:self];
  double v6 = v5;

  return v6;
}

- (id)actionPerformerHostViewControllerForPresentingToast:(id)a3
{
  v4 = [(PUAssetActionPerformer *)self delegate];
  double v5 = [v4 assetActionPerformerHostViewControllerForPresentingToast:self];

  return v5;
}

- (id)hostViewControllerForActionPerformer:(id)a3
{
  return 0;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  return [(PUAssetActionPerformer *)self presentViewController:a4];
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return [(PUAssetActionPerformer *)self dismissViewController:a4 completionHandler:a5];
}

- (NSString)pxActionType
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 786, @"Method %s is a responsibility of subclass %@", "-[PUPXPhotoKitActionPerformerAdapter pxActionType]", v6 object file lineNumber description];

  abort();
}

- (void)performUserInteractionTask
{
  pxActionPerformer = self->_pxActionPerformer;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PUPXPhotoKitActionPerformerAdapter_performUserInteractionTask__block_invoke;
  v3[3] = &unk_1E5F2E3B8;
  v3[4] = self;
  [(PXPhotoKitAssetActionPerformer *)pxActionPerformer performActionWithCompletionHandler:v3];
}

uint64_t __64__PUPXPhotoKitActionPerformerAdapter_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

- (void)_configureActionPerformer:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v5 = [(PUPhotoKitActionPerformer *)self photosDataSource];
  double v6 = [v5 immutableCopy];

  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F90460]) initWithImmutablePhotosDataSource:v6 withChange:0];
    id v8 = objc_alloc_init(MEMORY[0x1E4F912A0]);
    v9 = [(PUAssetActionPerformer *)self assetsByAssetCollection];

    if (v9)
    {
      v10 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __64__PUPXPhotoKitActionPerformerAdapter__configureActionPerformer___block_invoke;
      v29[3] = &unk_1E5F29890;
      SEL v34 = a2;
      id v30 = v6;
      v31 = self;
      id v32 = v8;
      id v33 = v7;
      [v10 enumerateKeysAndObjectsUsingBlock:v29];

      v11 = v30;
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v11 = [(PUAssetActionPerformer *)self assets];
      uint64_t v15 = [v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        SEL v23 = a2;
        uint64_t v17 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v11);
            }
            uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            v20 = [v6 indexPathForAsset:v19 hintIndexPath:0 hintCollection:0];
            if (!v20)
            {
              [MEMORY[0x1E4F28B00] currentHandler];
              v21 = uint64_t v22 = v19;
              [v21 handleFailureInMethod:v23, self, @"PUPhotoKitAssetActionManager.m", 753, @"Unable to find asset %@ in dataSource %@", v22, v6 object file lineNumber description];
            }
            [v7 identifier];
            PXSimpleIndexPathFromIndexPath();
            [v8 addIndexPath:v24];
          }
          uint64_t v16 = [v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
        }
        while (v16);
      }
    }

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F912E0]) initWithDataSource:v7 selectedIndexPaths:v8];
  }
  else
  {
    v7 = [(PUAssetActionPerformer *)self assets];
    id v8 = [MEMORY[0x1E4F90460] dataSourceWithAssets:v7];
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(v8, "numberOfItemsInSection:", 0));
    v13 = objc_msgSend(MEMORY[0x1E4F91268], "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v12, objc_msgSend(v8, "identifier"), 0);
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F912E0]) initWithDataSource:v8 selectedIndexPaths:v13];
  }
  [(PXPhotoKitAssetActionPerformer *)self->_pxActionPerformer setSelectionSnapshot:v14];
  [(PXPhotoKitAssetActionPerformer *)self->_pxActionPerformer setDelegate:self];
}

void __64__PUPXPhotoKitActionPerformerAdapter__configureActionPerformer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) sectionForAssetCollection:a2];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    id v8 = [*(id *)(a1 + 32) assetsInSection:v6];
    if (!v8)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"PUPhotoKitAssetActionManager.m", 736, @"Missing fetchResult in section %ld in dataSource %@", v7, *(void *)(a1 + 32) object file lineNumber description];
    }
    uint64_t v22 = v7;
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v23 = v5;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v16 = [v8 indexOfObject:v15];
          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [MEMORY[0x1E4F28B00] currentHandler];
            uint64_t v17 = v21 = v15;
            [v17 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"PUPhotoKitAssetActionManager.m", 740, @"Unable to find asset %@ in dataSource %@", v21, *(void *)(a1 + 32) object file lineNumber description];
          }
          [v9 addIndex:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      v18 = *(void **)(a1 + 48);
      uint64_t v19 = [*(id *)(a1 + 56) identifier];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __64__PUPXPhotoKitActionPerformerAdapter__configureActionPerformer___block_invoke_2;
      v24[3] = &unk_1E5F2A028;
      id v25 = v9;
      [v18 modifyItemIndexSetForDataSourceIdentifier:v19 section:v22 usingBlock:v24];
    }
    id v5 = v23;
  }
}

uint64_t __64__PUPXPhotoKitActionPerformerAdapter__configureActionPerformer___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

- (PUPXPhotoKitActionPerformerAdapter)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5 pxActionPerformer:(id)a6
{
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PUPXPhotoKitActionPerformerAdapter;
  uint64_t v12 = [(PUAssetActionPerformer *)&v16 initWithActionType:a3 assets:a4 orAssetsByAssetCollection:a5];
  uint64_t v13 = v12;
  if (v12)
  {
    p_pxActionPerformer = (id *)&v12->_pxActionPerformer;
    objc_storeStrong((id *)&v12->_pxActionPerformer, a6);
    [*p_pxActionPerformer setDelegate:v13];
    [(PUPXPhotoKitActionPerformerAdapter *)v13 _configureActionPerformer:*p_pxActionPerformer];
  }

  return v13;
}

- (PUPXPhotoKitActionPerformerAdapter)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc((Class)[(id)objc_opt_class() pxActionPerformerClass]);
  id v11 = [(PUPXPhotoKitActionPerformerAdapter *)self pxActionType];
  uint64_t v12 = (void *)[v10 initWithActionType:v11];
  uint64_t v13 = [(PUPXPhotoKitActionPerformerAdapter *)self initWithActionType:a3 assets:v9 orAssetsByAssetCollection:v8 pxActionPerformer:v12];

  return v13;
}

- (unint64_t)actionType
{
  v2 = [(PUPXPhotoKitActionPerformerAdapter *)self pxActionType];
  unint64_t v3 = PUAssetActionTypeForPXAssetActionType(v2);

  return v3;
}

+ (Class)pxActionPerformerClass
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, a1, @"PUPhotoKitAssetActionManager.m", 782, @"Method %s is a responsibility of subclass %@", "+[PUPXPhotoKitActionPerformerAdapter pxActionPerformerClass]", v6 object file lineNumber description];

  abort();
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  LOBYTE(a1) = objc_msgSend((id)objc_msgSend(a1, "pxActionPerformerClass"), "canPerformOnAsset:inAssetCollection:person:socialGroup:", v7, v6, 0, 0);

  return (char)a1;
}

@end