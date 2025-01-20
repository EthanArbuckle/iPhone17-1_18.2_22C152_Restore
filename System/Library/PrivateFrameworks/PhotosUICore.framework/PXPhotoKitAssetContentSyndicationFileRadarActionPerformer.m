@interface PXPhotoKitAssetContentSyndicationFileRadarActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)requiresUnlockedDevice;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetContentSyndicationFileRadarActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"ant.circle";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return @"File Hubble Radar";
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6 = a3;
  v7 = +[PXRootSettings sharedInstance];
  int v8 = [v7 canShowInternalUI];

  if (v8)
  {
    if (objc_msgSend(v6, "px_isSyndicatedAsset")) {
      char v9 = 1;
    }
    else {
      char v9 = objc_msgSend(v6, "px_wasSavedThroughSyndication");
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)performUserInteractionTask
{
  objc_initWeak(&location, self);
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __87__PXPhotoKitAssetContentSyndicationFileRadarActionPerformer_performUserInteractionTask__block_invoke;
  int v8 = &unk_1E5DCE660;
  objc_copyWeak(&v9, &location);
  v4 = PXFileRadarViewControllerForContentSyndicationAssets(v3, &v5);

  -[PXActionPerformer presentViewController:](self, "presentViewController:", v4, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__PXPhotoKitAssetContentSyndicationFileRadarActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeUserInteractionTaskWithSuccess:a2 error:0];
}

- (BOOL)requiresUnlockedDevice
{
  return 1;
}

@end