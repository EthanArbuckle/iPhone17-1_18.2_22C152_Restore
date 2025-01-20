@interface PXPhotoKitAssetCollectionDropAssetsActionPerformer
+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)dropAssetsActionPerformerForAssetCollection:(id)a3 dropSession:(id)a4;
- (id)memoryAssetsActionFactory;
- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionDropAssetsActionPerformer

- (id)memoryAssetsActionFactory
{
  v3 = [(PXActionPerformer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = +[PXStorySettings sharedInstance];
    if ([v4 allowCustomUserAssets])
    {
      v5 = [(PXActionPerformer *)self delegate];
      v6 = [v5 memoryAssetsActionFactory];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PXPhotoKitAssetCollectionDropAssetsActionPerformer;
  [(PXActionPerformer *)&v5 completeUserInteractionTaskWithSuccess:a3 error:a4];
  [(PXAssetCollectionActionPerformer *)self setDragSession:0];
  [(PXAssetCollectionActionPerformer *)self setDropSession:0];
}

- (void)performUserInteractionTask
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  objc_super v5 = [(PXAssetCollectionActionPerformer *)self dropSession];
  if (!objc_msgSend(v4, "px_assetsDropMode"))
  {
    v6 = [(PXPhotoKitAssetCollectionDropAssetsActionPerformer *)self memoryAssetsActionFactory];

    if (!v6)
    {
      v10 = PLDragAndDropGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138412546;
        v23 = v12;
        __int16 v24 = 2112;
        v25 = v4;
        v13 = "%@ called with non-editable collection: %@";
        goto LABEL_12;
      }
LABEL_13:

      [(PXPhotoKitAssetCollectionDropAssetsActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
      goto LABEL_14;
    }
  }
  if (!v5)
  {
    v10 = PLDragAndDropGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412546;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v4;
      v13 = "%@ called without drop session: %@";
LABEL_12:
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  int v7 = objc_msgSend(v4, "px_isSharedAlbum");
  v8 = +[PXImportManager defaultManager];
  if (v7)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke;
    v19[3] = &unk_1E5DC9D18;
    v19[4] = self;
    id v20 = v4;
    id v21 = v5;
    [v8 fetchAssetsFromDrop:v21 importIfNeeded:0 completion:v19];

    v9 = v20;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_7;
    v15[3] = &unk_1E5DC9D40;
    SEL v18 = a2;
    v15[4] = self;
    id v16 = v5;
    id v17 = v4;
    [v8 fetchAssetsFromDrop:v16 importIfNeeded:1 completion:v15];

    v9 = v16;
  }

LABEL_14:
}

void __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_2;
    block[3] = &unk_1E5DD0F30;
    block[4] = *(void *)(a1 + 32);
    v4 = &v14;
    id v14 = v3;
    objc_super v5 = &v15;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6 = +[PXImportManager defaultManager];
    int v7 = [*(id *)(a1 + 48) items];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_3;
    v10[3] = &unk_1E5DC9CF0;
    v8 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    v4 = &v11;
    id v11 = v8;
    objc_super v5 = &v12;
    id v12 = *(id *)(a1 + 48);
    id v9 = (id)[v6 importSharedSourcesForDragItems:v7 completionHandler:v10];
  }
}

void __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v28 = *(void *)(a1 + 56);
      uint64_t v29 = *(void *)(a1 + 32);
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      v32 = objc_msgSend(v3, "px_descriptionForAssertionMessage");
      [v27 handleFailureInMethod:v28, v29, @"PXPhotoKitAssetCollectionDropAssetsActionPerformer.m", 126, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"displayAssetFetchResult", v31, v32 object file lineNumber description];
    }
  }
  uint64_t v4 = [v3 count];
  objc_super v5 = [*(id *)(a1 + 40) items];
  uint64_t v6 = [v5 count];

  if (v4 != v6)
  {
    int v7 = +[PXDragAndDropUIUtilities dropImportErrorAlertControllerWithHandler:0];
    [*(id *)(a1 + 32) presentViewController:v7];
  }
  if ([v3 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_8;
    aBlock[3] = &unk_1E5DD3158;
    aBlock[4] = *(void *)(a1 + 32);
    v8 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
    id v9 = [*(id *)(a1 + 32) actionType];
    int v10 = [v9 isEqualToString:@"PXAssetCollectionActionTypeMoveAssets"];

    if (!v10)
    {
      if (objc_msgSend(*(id *)(a1 + 48), "px_isFavoritesSmartAlbum"))
      {
        v19 = [[PXFavoriteAssetsAction alloc] initWithAssets:v3 favorite:1];
      }
      else
      {
        if (objc_msgSend(*(id *)(a1 + 48), "px_isPhotosVirtualCollection"))
        {
          v8[2](v8, 1, 0);
LABEL_31:

          goto LABEL_32;
        }
        v19 = [[PXAddAssetsToAssetCollectionAction alloc] initWithAssets:v3 assetCollection:*(void *)(a1 + 48)];
      }
      v13 = v19;
      uint64_t v26 = [*(id *)(a1 + 32) undoManager];
      [v13 executeWithUndoManager:v26 completionHandler:v8];

LABEL_30:
      goto LABEL_31;
    }
    id v11 = [*(id *)(a1 + 32) dropTargetAssetReference];
    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) dropTargetAssetReference];
      v13 = [v12 asset];

      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_18;
        }
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v36 = *(void *)(a1 + 56);
        uint64_t v15 = *(void *)(a1 + 32);
        id v16 = (objc_class *)objc_opt_class();
        id v17 = NSStringFromClass(v16);
        SEL v18 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
        [v14 handleFailureInMethod:v36, v15, @"PXPhotoKitAssetCollectionDropAssetsActionPerformer.m", 141, @"%@ should be an instance inheriting from %@, but it is %@", @"self.dropTargetAssetReference.asset", v17, v18 object file lineNumber description];
      }
      else
      {
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v33 = *(void *)(a1 + 56);
        uint64_t v34 = *(void *)(a1 + 32);
        v35 = (objc_class *)objc_opt_class();
        id v17 = NSStringFromClass(v35);
        [v14 handleFailureInMethod:v33, v34, @"PXPhotoKitAssetCollectionDropAssetsActionPerformer.m", 141, @"%@ should be an instance inheriting from %@, but it is nil", @"self.dropTargetAssetReference.asset", v17 object file lineNumber description];
      }
    }
    else
    {
      v13 = 0;
    }
LABEL_18:

    id v20 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(a1 + 48) options:0];
    if (([v20 containsObject:v13] & 1) != 0
      || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !v13)
      || (isKindOfClass & 1) != 0)
    {
      __int16 v24 = [*(id *)(a1 + 32) memoryAssetsActionFactory];
      v23 = [v24 rearrangeMemoryAssetsActionWithAssetCollection:*(void *)(a1 + 48) movedAssets:v3 beforeAsset:v13];

      if (v23
        || (objc_msgSend(*(id *)(a1 + 48), "px_isMemory") & 1) == 0
        && (v23 = [[PXRearrangeAssetCollectionAction alloc] initWithAssetCollection:*(void *)(a1 + 48) movedAssets:v3 targetAsset:v13]) != 0)
      {
        v25 = [*(id *)(a1 + 32) undoManager];
        [(PXAction *)v23 executeWithUndoManager:v25 completionHandler:v8];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Unable to obtain rearrange action for asset collection: %@", *(void *)(a1 + 48));
        v23 = (PXRearrangeAssetCollectionAction *)objc_claimAutoreleasedReturnValue();
        ((void (**)(void *, uint64_t, PXRearrangeAssetCollectionAction *))v8)[2](v8, 0, v23);
      }
    }
    else
    {
      v22 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Unable to know where the move target is, %@ is not in the list of existing assets.", v13);
      v23 = (PXRearrangeAssetCollectionAction *)objc_claimAutoreleasedReturnValue();
      [v22 completeUserInteractionTaskWithSuccess:0 error:v23];
    }

    goto LABEL_30;
  }
  [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
LABEL_32:
}

void __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_9;
  block[3] = &unk_1E5DD21E8;
  uint64_t v6 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = v6;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

uint64_t __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addAssets:*(void *)(a1 + 40) toSharedAlbum:*(void *)(a1 + 48)];
}

void __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_3(id *a1, int a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_4;
  aBlock[3] = &unk_1E5DD0F30;
  aBlock[4] = a1[4];
  id v7 = v6;
  id v19 = v7;
  id v20 = a1[5];
  v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = [v7 count];
  char v10 = [a1[6] items];
  uint64_t v11 = [v10 count];

  if (v9 == v11)
  {
    if (a2 && [v7 count]) {
      v8[2](v8);
    }
  }
  else
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_6;
    id v16 = &unk_1E5DCE788;
    id v17 = v8;
    id v12 = +[PXDragAndDropUIUtilities dropImportErrorAlertControllerWithHandler:&v13];
    objc_msgSend(a1[4], "presentViewController:", v12, v13, v14, v15, v16);
  }
}

void __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_5;
  block[3] = &unk_1E5DD0F30;
  v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) addAssets:*(void *)(a1 + 40) toSharedAlbum:*(void *)(a1 + 48)];
}

+ (id)dropAssetsActionPerformerForAssetCollection:(id)a3 dropSession:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PXDisplayTitleInfo alloc] initWithAssetCollection:v6 useVerboseSmartDescription:0];
  id v8 = objc_alloc((Class)off_1E5DA55C0);
  uint64_t v12 = *(void *)off_1E5DAAED8;
  long long v13 = xmmword_1AB359AA0;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = (void *)[v8 initWithAssetCollection:v6 keyAssetReference:0 indexPath:&v12];

  char v10 = [(PXAssetCollectionActionPerformer *)[PXPhotoKitAssetCollectionDropAssetsActionPerformer alloc] initWithActionType:@"PXAssetCollectionActionTypeDropAssets" assetCollectionReference:v9 displayTitleInfo:v7];
  [(PXAssetCollectionActionPerformer *)v10 setDropSession:v5];

  return v10;
}

+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [a4 assetCollection];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v32);
    uint64_t v33 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v29 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionDropAssetsActionPerformer.m", 43, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v31, v33 object file lineNumber description];
  }
  else
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    [v29 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionDropAssetsActionPerformer.m", 43, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v31 object file lineNumber description];
  }

LABEL_3:
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v10 dropSession];
  }
  else
  {
    uint64_t v12 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v13 = [v10 memoryAssetsActionFactory];
  if (!v13) {
    goto LABEL_10;
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = +[PXStorySettings sharedInstance];
  char v16 = [v15 allowCustomUserAssets];

  if (v16)
  {
    int v17 = 0;
    uint64_t v18 = 1;
  }
  else
  {
LABEL_10:
    uint64_t v18 = objc_msgSend(v11, "px_assetsDropMode");
    int v17 = 1;
  }
  if (v12) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  int v20 = !v19;
  if ([v9 isEqualToString:@"PXAssetCollectionActionTypeMoveAssets"])
  {
    if (v17) {
      int v21 = [v11 canPerformEditOperation:5];
    }
    else {
      int v21 = 1;
    }
    if ((v20 & v21) != 1) {
      goto LABEL_29;
    }
    uint64_t v22 = [v10 dropTargetAssetReference];
    if (v22)
    {
      v23 = (void *)v22;
      __int16 v24 = [v10 dropTargetAssetReference];
      v25 = [v24 asset];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_29;
      }
    }
  }
  else if (!v20)
  {
LABEL_29:
    char HasValidItems = 0;
    goto LABEL_30;
  }
  if (v18 == 2 && !PXDropSessionHasItemsNeedingImport(v12)) {
    goto LABEL_29;
  }
  char HasValidItems = PXDropSessionHasValidItems(v12);
LABEL_30:

  return HasValidItems;
}

@end