@interface PUPhotoEditTaskManager
+ (id)sharedManager;
- (PUPhotoEditTaskManager)init;
- (void)createEditableCopyForReadOnlyPhoto:(id)a3 completionHandler:(id)a4;
@end

@implementation PUPhotoEditTaskManager

- (void)createEditableCopyForReadOnlyPhoto:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUPhotoEditTaskManager.m", 36, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v9 = objc_msgSend(v7, "pl_managedAsset");
  v10 = [v9 mainFileURL];

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__59369;
  v23[4] = __Block_byref_object_dispose__59370;
  id v24 = 0;
  v11 = [v7 photoLibrary];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke;
  v20[3] = &unk_1E5F2E200;
  id v12 = v10;
  id v21 = v12;
  v22 = v23;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke_2;
  v16[3] = &unk_1E5F28CD0;
  v19 = v23;
  id v13 = v11;
  id v17 = v13;
  id v14 = v8;
  id v18 = v14;
  [v13 performChanges:v20 completionHandler:v16];

  _Block_object_dispose(v23, 8);
}

void __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F38ED0] creationRequestForAssetFromImageAtFileURL:*(void *)(a1 + 32)];
  v2 = [v6 placeholderForCreatedAsset];
  uint64_t v3 = [v2 localIdentifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = [MEMORY[0x1E4F390A0] fetchOptionsWithInclusiveDefaultsForPhotoLibrary:*(void *)(a1 + 32)];
    id v7 = (void *)MEMORY[0x1E4F38EB8];
    v18[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v9 = [v7 fetchAssetsWithLocalIdentifiers:v8 options:v6];
    v10 = [v9 firstObject];
  }
  else
  {
    v10 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke_3;
  block[3] = &unk_1E5F2EBC8;
  id v11 = *(id *)(a1 + 40);
  id v16 = v5;
  id v17 = v11;
  id v15 = v10;
  id v12 = v5;
  id v13 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __79__PUPhotoEditTaskManager_createEditableCopyForReadOnlyPhoto_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (PUPhotoEditTaskManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditTaskManager;
  return [(PUPhotoEditTaskManager *)&v3 init];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_59387);
  }
  v2 = (void *)sharedManager__sharedInstance;
  return v2;
}

void __39__PUPhotoEditTaskManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(PUPhotoEditTaskManager);
  v1 = (void *)sharedManager__sharedInstance;
  sharedManager__sharedInstance = (uint64_t)v0;
}

@end