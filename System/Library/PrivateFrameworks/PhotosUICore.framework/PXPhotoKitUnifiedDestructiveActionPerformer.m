@interface PXPhotoKitUnifiedDestructiveActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)isActionDestructive;
+ (id)_containedPerformerClasses;
+ (id)_localizedTitleForAsset:(id)a3 titleUseCase:(unint64_t)a4 key:(id)a5;
+ (id)_localizedTitleForAssets:(id)a3 titleUseCase:(unint64_t)a4 key:(id)a5;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (NSArray)performerClasses;
- (id)createContainedPerformers;
- (void)_handleActionPickForPerformerClass:(Class)a3;
- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitUnifiedDestructiveActionPerformer

- (void).cxx_destruct
{
}

- (id)createContainedPerformers
{
}

id __72__PXPhotoKitUnifiedDestructiveActionPerformer_createContainedPerformers__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 actionType];
  v5 = [v2 createPerformerWithClass:v3 actionType:v4];

  return v5;
}

- (void)_handleActionPickForPerformerClass:(Class)a3
{
  v5 = [(PXActionPerformer *)self actionType];
  v6 = [(PXPhotoKitAssetActionPerformer *)self createPerformerWithClass:a3 actionType:v5];

  objc_msgSend(v6, "setShouldSkipUserConfirmation:", -[objc_class isActionDestructive](a3, "isActionDestructive") ^ 1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PXPhotoKitUnifiedDestructiveActionPerformer__handleActionPickForPerformerClass___block_invoke;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  [v6 performActionWithCompletionHandler:v7];
}

uint64_t __82__PXPhotoKitUnifiedDestructiveActionPerformer__handleActionPickForPerformerClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(PXActionPerformer *)self state] != 10) {
    PXAssertGetLog();
  }
  v7.receiver = self;
  v7.super_class = (Class)PXPhotoKitUnifiedDestructiveActionPerformer;
  [(PXActionPerformer *)&v7 completeUserInteractionTaskWithSuccess:v4 error:v6];
}

- (NSArray)performerClasses
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  performerClasses = self->_performerClasses;
  if (performerClasses)
  {
    v21 = performerClasses;
  }
  else
  {
    location = (id *)&self->_performerClasses;
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v22 = self;
    v5 = [(id)objc_opt_class() _containedPerformerClasses];
    v21 = (NSArray *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    id v6 = [(PXAssetActionPerformer *)v22 selectionSnapshot];
    objc_super v7 = [v6 selectedIndexPaths];

    v25 = [(PXPhotoKitAssetActionPerformer *)v22 person];
    v24 = [(PXPhotoKitAssetActionPerformer *)v22 socialGroup];
    v23 = [(PXPhotoKitAssetActionPerformer *)v22 photosDataSourceSnapshot];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [(id)objc_opt_class() _containedPerformerClasses];
    uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v32 = 0;
          v33 = &v32;
          uint64_t v34 = 0x2020000000;
          BOOL v35 = 0;
          BOOL v35 = [v7 count] > 0;
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __63__PXPhotoKitUnifiedDestructiveActionPerformer_performerClasses__block_invoke;
          v26[3] = &unk_1E5DAFB10;
          id v27 = v23;
          v30 = &v32;
          v31 = v11;
          id v28 = v25;
          id v29 = v24;
          [v7 enumerateItemIndexSetsUsingBlock:v26];
          if (*((unsigned char *)v33 + 24))
          {
            if ([v11 isEqual:objc_opt_class()])
            {
              v12 = [(PXActionPerformer *)v22 delegate];
              char v13 = objc_opt_respondsToSelector();

              if (v13)
              {
                v14 = [(PXActionPerformer *)v22 delegate];
                v15 = [v14 hostViewControllerForActionPerformer:v22];

                if ([v15 conformsToProtocol:&unk_1F050E2A0]) {
                  *((unsigned char *)v33 + 24) = 0;
                }
                v16 = [(PXActionPerformer *)v22 sender];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass) {
                  *((unsigned char *)v33 + 24) = 0;
                }
              }
            }
          }
          if (*((unsigned char *)v33 + 24)) {
            [(NSArray *)v21 addObject:v11];
          }

          _Block_object_dispose(&v32, 8);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v8);
    }

    objc_storeStrong(location, v21);
  }
  return v21;
}

void __63__PXPhotoKitUnifiedDestructiveActionPerformer_performerClasses__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  uint64_t v8 = [v6 assetCollectionForSection:a3];
  uint64_t v9 = [*(id *)(a1 + 32) assetsInSection:a3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PXPhotoKitUnifiedDestructiveActionPerformer_performerClasses__block_invoke_2;
  v12[3] = &unk_1E5DAFAE8;
  long long v17 = *(_OWORD *)(a1 + 56);
  id v13 = v9;
  id v14 = v8;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v10 = v8;
  id v11 = v9;
  [v7 enumerateIndexesUsingBlock:v12];
}

void __63__PXPhotoKitUnifiedDestructiveActionPerformer_performerClasses__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 72), "canPerformOnAsset:inAssetCollection:person:socialGroup:");
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    *a3 = 1;
  }
}

- (void)performUserInteractionTask
{
  id v4 = [(PXActionPerformer *)self presentationEnvironment];
  id v5 = [v4 presentingViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(PXPhotoKitUnifiedDestructiveActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
  else
  {
    id v7 = [(PXPhotoKitUnifiedDestructiveActionPerformer *)self performerClasses];
    if ([v7 count] == 1)
    {
      uint64_t v8 = [v7 lastObject];
      uint64_t v9 = [(PXActionPerformer *)self actionType];
      id v10 = [(PXPhotoKitAssetActionPerformer *)self createPerformerWithClass:v8 actionType:v9];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke;
      v21[3] = &unk_1E5DD3158;
      v21[4] = self;
      [v10 performActionWithCompletionHandler:v21];
    }
    else
    {
      id v11 = [(PXPhotoKitAssetActionPerformer *)self assets];
      v12 = [(PXActionPerformer *)self presentationEnvironment];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_2;
      v16[3] = &unk_1E5DAFAC0;
      id v17 = v11;
      v18 = self;
      id v19 = v7;
      SEL v20 = a2;
      id v10 = v11;
      id v13 = [v12 presentAlertWithConfigurationHandler:v16];

      if (!v13)
      {
        id v14 = PLUIGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v15 = 0;
          _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Failed to present delete confirmation. User must confirm to perform removal.", v15, 2u);
        }

        [(PXPhotoKitUnifiedDestructiveActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
      }
    }
  }
}

uint64_t __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

void __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v13 = a1;
  v12 = +[PXPhotoKitDeletePhotosActionController warningStringForAssets:*(void *)(a1 + 32) isDeleting:1];
  [v3 setTitle:v12];
  [v3 setStyle:0];
  id v11 = PXLocalizedStringFromTable(@"PXPhotoKitUnifiedDestructiveActionPerformer_Cancel", @"PhotosUICore");
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_3;
  v22[3] = &unk_1E5DD36F8;
  a1 += 40;
  v22[4] = *(void *)a1;
  [v3 addActionWithTitle:v11 style:1 action:v22];
  objc_initWeak(&location, *(id *)a1);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(v13 + 48);
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          id v10 = [MEMORY[0x1E4F28B00] currentHandler];
          [v10 handleFailureInMethod:*(void *)(v13 + 56) object:*(void *)(v13 + 40) file:@"PXPhotoKitUnifiedDestructiveActionPerformer.m" lineNumber:179 description:@"Code which should be unreachable has been reached"];

          abort();
        }
        uint64_t v8 = [v7 localizedTitleForUseCase:1 actionManager:0];
        if ([v7 isActionDestructive]) {
          uint64_t v9 = 2;
        }
        else {
          uint64_t v9 = 0;
        }
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_4;
        v15[3] = &unk_1E5DAFA98;
        objc_copyWeak(v16, &location);
        v16[1] = v7;
        [v3 addActionWithTitle:v8 style:v9 action:v15];
        objc_destroyWeak(v16);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v4);
  }

  objc_destroyWeak(&location);
}

uint64_t __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

void __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleActionPickForPerformerClass:*(void *)(a1 + 40)];
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"trash";
}

+ (id)_localizedTitleForAssets:(id)a3 titleUseCase:(unint64_t)a4 key:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((unint64_t)[v8 count] <= 1)
  {
    id v11 = [v8 firstObject];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    id v10 = [a1 _localizedTitleForAsset:v12 titleUseCase:a4 key:v9];
  }
  else
  {
    id v10 = v9;
  }

  return v10;
}

+ (id)_localizedTitleForAsset:(id)a3 titleUseCase:(unint64_t)a4 key:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if ([v6 isCloudSharedAsset])
  {
    id v8 = @"SharedAlbum";
  }
  else if (objc_msgSend(v6, "px_isUnsavedSyndicatedAsset"))
  {
    unint64_t v9 = [v6 mediaType];
    if (v9 > 3) {
      goto LABEL_8;
    }
    id v8 = off_1E5DAFB58[v9];
  }
  else
  {
    id v8 = @"Library";
  }
  uint64_t v10 = [NSString stringWithFormat:@"%@_%@", v7, v8];

  id v7 = (id)v10;
LABEL_8:

  return v7;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  if (a3 > 2) {
    id v8 = 0;
  }
  else {
    id v8 = off_1E5DB8B58[a3];
  }
  unint64_t v9 = v8;
  uint64_t v10 = [v6 stringWithFormat:@"PXPhotoKitAssetActionManager%@Title_Trash", v9];

  id v11 = +[PXPhotoKitAssetActionManager selectedAssetForActionManager:v7];

  if (v11) {
    [a1 _localizedTitleForAsset:v11 titleUseCase:a3 key:v10];
  }
  else {
  id v12 = [NSString stringWithFormat:@"%@_%@", v10, @"Library"];
  }

  uint64_t v13 = PXLocalizedStringFromTable(v12, @"PhotosUICore");

  return v13;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithBarButtonSystemItem:16 target:v7 action:a4];

  return v8;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(a1, "_containedPerformerClasses", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) canPerformOnSubsetOfSelection])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = objc_msgSend(a1, "_containedPerformerClasses", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    char v17 = 0;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v14);
        }
        if (v17) {
          char v17 = 1;
        }
        else {
          char v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) canPerformOnAsset:v10 inAssetCollection:v11 person:v12 socialGroup:v13];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

+ (id)_containedPerformerClasses
{
  if (_containedPerformerClasses_onceToken != -1) {
    dispatch_once(&_containedPerformerClasses_onceToken, &__block_literal_global_9757);
  }
  v2 = (void *)_containedPerformerClasses_containedPerformerClasses;
  return v2;
}

void __73__PXPhotoKitUnifiedDestructiveActionPerformer__containedPerformerClasses__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)_containedPerformerClasses_containedPerformerClasses;
  _containedPerformerClasses_containedPerformerClasses = v0;
}

@end