@interface PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)requiresUnlockedDevice;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"sparkles.rectangle.stack";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return @"Promote To Guest";
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6 = a3;
  v7 = [v6 photoLibrary];
  uint64_t v8 = [v7 wellKnownPhotoLibraryIdentifier];

  if (v8 == 3) {
    int v9 = [v6 isGuestAsset] ^ 1;
  }
  else {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)performBackgroundTask
{
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v4 = [v3 firstObject];
  v5 = [v4 photoLibrary];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer_performBackgroundTask__block_invoke;
  v8[3] = &unk_1E5DD36F8;
  id v9 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer_performBackgroundTask__block_invoke_2;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  id v6 = v3;
  [v5 performChanges:v8 completionHandler:v7];
}

void __87__PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer_performBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = objc_msgSend(MEMORY[0x1E4F38ED0], "changeRequestForAsset:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 promoteToGuestAsset];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __87__PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  px_dispatch_on_main_queue();
}

uint64_t __87__PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (BOOL)requiresUnlockedDevice
{
  return 1;
}

@end