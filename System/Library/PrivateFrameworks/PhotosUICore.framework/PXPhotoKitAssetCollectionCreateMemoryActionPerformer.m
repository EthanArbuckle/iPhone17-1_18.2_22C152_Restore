@interface PXPhotoKitAssetCollectionCreateMemoryActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionCreateMemoryActionPerformer

- (void)performBackgroundTask
{
  v3 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  v4 = [(PXAssetCollectionActionPerformer *)self displayTitleInfo];
  v5 = [(PXAssetCollectionActionPerformer *)self people];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v6 = [v3 photoLibrary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__PXPhotoKitAssetCollectionCreateMemoryActionPerformer_performBackgroundTask__block_invoke;
  v11[3] = &unk_1E5DCA7A8;
  id v7 = v3;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  id v9 = v5;
  id v14 = v9;
  v15 = v16;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PXPhotoKitAssetCollectionCreateMemoryActionPerformer_performBackgroundTask__block_invoke_2;
  v10[3] = &unk_1E5DB34E8;
  v10[4] = self;
  v10[5] = v16;
  [v6 performChanges:v11 completionHandler:v10];

  _Block_object_dispose(v16, 8);
}

void __77__PXPhotoKitAssetCollectionCreateMemoryActionPerformer_performBackgroundTask__block_invoke(void *a1)
{
  objc_msgSend(MEMORY[0x1E4F39170], "px_creationRequestForAssetCollection:displayTitleInfo:people:", a1[4], a1[5], a1[6]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setUserCreated:1];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v2 != 0;
}

void __77__PXPhotoKitAssetCollectionCreateMemoryActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  px_dispatch_on_main_queue();
}

uint64_t __77__PXPhotoKitAssetCollectionCreateMemoryActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    BOOL v1 = *(unsigned char *)(a1 + 56) != 0;
  }
  else {
    BOOL v1 = 0;
  }
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:v1 error:*(void *)(a1 + 40)];
}

- (void)performUserInteractionTask
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F56658];
  v8[0] = *MEMORY[0x1E4F56548];
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  v9[0] = v4;
  v8[1] = *MEMORY[0x1E4F56560];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v3 sendEvent:@"com.apple.photos.CPAnalytics.memoryCreatedViaAddToMemories" withPayload:v7];

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"memories.badge.plus";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 > 2)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = PXLocalizedStringFromTable(off_1E5DB3508[a3], @"PhotosUICore");
  }

  return v9;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeCreateMemory" systemImageName:a5];
}

+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  v6 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v7 = a4;
  id v8 = (void *)[[v6 alloc] initWithBarButtonSystemItem:4 target:v7 action:a5];

  return v8;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v6 = [a3 assetCollection];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      v15 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
      [v12 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 1358, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v14, v15 object file lineNumber description];
    }
    if ([v6 assetCollectionType] != 7)
    {
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass() ^ 1;
      goto LABEL_7;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 1358, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v11 object file lineNumber description];
  }
  char v7 = 0;
LABEL_7:

  return v7 & 1;
}

@end