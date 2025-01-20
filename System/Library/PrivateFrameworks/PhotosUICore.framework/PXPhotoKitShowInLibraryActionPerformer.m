@interface PXPhotoKitShowInLibraryActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)_assetToRevealFromAsset:(id)a3;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitShowInLibraryActionPerformer

+ (id)_assetToRevealFromAsset:(id)a3
{
  id v3 = a3;
  v4 = [v3 photoLibrary];
  uint64_t v5 = [v4 wellKnownPhotoLibraryIdentifier];

  if (v5 == 3)
  {
    PXAssetToRevealForSyndicationLibraryAsset(v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ([v3 sourceType] == 8)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      v8 = PXAssetToRevealForMomentSharedAsset(v3, 2, v7);

      goto LABEL_7;
    }
    id v6 = v3;
  }
  v8 = v6;
LABEL_7:

  return v8;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"photo.on.rectangle";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  v4 = NSString;
  if (a3 > 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = off_1E5DB8B58[a3];
  }
  id v6 = v5;
  v7 = [v4 stringWithFormat:@"PXPhotoKitAssetActionManager%@Title_ShowInLibrary", v6];

  v8 = PXLocalizedStringFromTable(v7, @"PhotosUICore");

  return v8;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7 = a3;
  if (([v7 isHidden] & 1) != 0
    || ([v7 isTrashed] & 1) != 0
    || ([v7 isRecoveredAsset] & 1) != 0
    || ([v7 isCloudSharedAsset] & 1) != 0
    || objc_msgSend(v7, "px_isSyndicatedAsset")
    && (objc_msgSend(v7, "px_wasSavedThroughSyndication") & 1) == 0
    && (+[PXUserDefaults standardUserDefaults],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 includeSharedWithYou],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 BOOLValue],
        v11,
        v10,
        !v12))
  {
    BOOL v8 = 0;
  }
  else
  {
    v13 = [a1 _assetToRevealFromAsset:v7];
    BOOL v8 = v13 != 0;
  }
  return v8;
}

- (void)performUserInteractionTask
{
  id v3 = objc_opt_class();
  v4 = [(PXPhotoKitAssetActionPerformer *)self assets];
  uint64_t v5 = [v4 lastObject];
  id v6 = [v3 _assetToRevealFromAsset:v5];

  objc_initWeak(&location, self);
  id v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PXPhotoKitShowInLibraryActionPerformer_performUserInteractionTask__block_invoke;
  v8[3] = &unk_1E5DD0950;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "px_navigateToMomentsViewRevealingAsset:completionHandler:", v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __68__PXPhotoKitShowInLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"PXPhotoKitShowInLibraryActionPerformerCompleted" object:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeUserInteractionTaskWithSuccess:a2 error:v7];
}

@end