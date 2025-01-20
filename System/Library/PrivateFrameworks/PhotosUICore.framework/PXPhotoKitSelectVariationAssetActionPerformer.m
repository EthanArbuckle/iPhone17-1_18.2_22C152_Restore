@interface PXPhotoKitSelectVariationAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (NSString)editOperationType;
+ (PXAssetEditOperationManager)editOperationManager;
- (NSProgress)progress;
- (void)cancelActionWithCompletionHandler:(id)a3;
- (void)performBackgroundTask;
- (void)setProgress:(id)a3;
@end

@implementation PXPhotoKitSelectVariationAssetActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v8 = a3;
  if ([a4 assetCollectionType] == 7)
  {
    char v9 = 0;
  }
  else
  {
    v10 = [a1 editOperationManager];
    v11 = [a1 editOperationType];
    char v9 = [v10 canPerformEditOperationWithType:v11 onAsset:v8];
  }
  return v9;
}

+ (NSString)editOperationType
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, a1, @"PXPhotoKitSelectVariationAssetActionPerformer.m", 39, @"Method %s is a responsibility of subclass %@", "+[PXPhotoKitSelectVariationAssetActionPerformer editOperationType]", v6 object file lineNumber description];

  abort();
}

+ (PXAssetEditOperationManager)editOperationManager
{
  return +[PXAssetEditOperationManager sharedManager];
}

- (void).cxx_destruct
{
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)cancelActionWithCompletionHandler:(id)a3
{
  id v6 = a3;
  v4 = [(PXPhotoKitSelectVariationAssetActionPerformer *)self progress];
  [v4 cancel];

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }
}

- (void)performBackgroundTask
{
  v3 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:0];
  [(PXPhotoKitSelectVariationAssetActionPerformer *)self setProgress:v3];
  v4 = [(id)objc_opt_class() editOperationManager];
  v5 = [(id)objc_opt_class() editOperationType];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 1;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__64642;
  v21[4] = __Block_byref_object_dispose__64643;
  id v22 = 0;
  dispatch_group_t v6 = dispatch_group_create();
  v7 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke;
  v13[3] = &unk_1E5DB4DB8;
  id v8 = v6;
  v14 = v8;
  id v9 = v4;
  id v15 = v9;
  id v10 = v5;
  id v16 = v10;
  v17 = self;
  v19 = v21;
  v20 = v23;
  id v11 = v3;
  id v18 = v11;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_202;
  v12[3] = &unk_1E5DCCE38;
  v12[4] = self;
  v12[5] = v23;
  v12[6] = v21;
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], v12);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
}

void __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        [*(id *)(a1 + 40) enumerateEditOperationsPerformedOnAsset:v8 usingBlock:&__block_literal_global_64646];
        id v9 = *(void **)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
        id v11 = [*(id *)(a1 + 56) delegate];
        v12 = [v11 undoManagerForActionPerformer:*(void *)(a1 + 56)];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_3;
        v15[3] = &unk_1E5DB4D90;
        v15[4] = v8;
        long long v17 = *(_OWORD *)(a1 + 72);
        id v16 = *(id *)(a1 + 32);
        v13 = [v9 performEditOperationWithType:v10 asset:v8 undoManager:v12 completionHandler:v15];

        if (v13) {
          objc_msgSend(*(id *)(a1 + 64), "px_appendChild:withPendingUnitCount:", v13, 1);
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

uint64_t __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_202(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) error:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if ((a2 & 1) == 0)
  {
    v5;
    px_dispatch_on_main_queue();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Error performEditOperationWithType for asset:%@ error:%@", (uint8_t *)&v8, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  uint64_t v6 = (id *)(v5 + 40);
  if (!v7) {
    objc_storeStrong(v6, *(id *)(a1 + 40));
  }
}

void __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (PXAssetVariationTypeForEditOperationType(a2) != -1) {
    [v4 cancel];
  }
}

@end