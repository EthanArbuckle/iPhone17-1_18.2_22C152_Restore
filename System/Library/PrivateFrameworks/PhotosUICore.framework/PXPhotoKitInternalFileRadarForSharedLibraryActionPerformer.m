@interface PXPhotoKitInternalFileRadarForSharedLibraryActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)requiresUnlockedDevice;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitInternalFileRadarForSharedLibraryActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"ant.circle";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return @"(Internal) File Shared Library Radar";
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[PXRootSettings sharedInstance];
  int v10 = [v9 canShowInternalUI];

  if (v10)
  {
    v11 = [v7 photoLibrary];
    v12 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v11];

    if ([v12 hasSharedLibraryOrPreview])
    {
      uint64_t v13 = [v8 assetCollectionSubtype];
      LOBYTE(v10) = v13 == 1000000205 || v13 == 1000000301;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (void)performUserInteractionTask
{
  objc_initWeak(&location, self);
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __88__PXPhotoKitInternalFileRadarForSharedLibraryActionPerformer_performUserInteractionTask__block_invoke;
  id v8 = &unk_1E5DCE660;
  objc_copyWeak(&v9, &location);
  v4 = PXFileRadarViewControllerForSharedLibraryAssets(v3, &v5);

  -[PXActionPerformer presentViewController:](self, "presentViewController:", v4, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __88__PXPhotoKitInternalFileRadarForSharedLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeUserInteractionTaskWithSuccess:a2 error:0];
}

- (BOOL)requiresUnlockedDevice
{
  return 1;
}

@end