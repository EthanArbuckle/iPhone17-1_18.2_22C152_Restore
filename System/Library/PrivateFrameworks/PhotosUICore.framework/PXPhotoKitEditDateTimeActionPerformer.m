@interface PXPhotoKitEditDateTimeActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)_presentDateTimeEditViewControllerWithAssets:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitEditDateTimeActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"calendar.badge.clock";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(@"PXAdjustDateAndTimeActionName", @"PhotosUICore");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6 = a3;
  if ([v6 canPerformEditOperation:3] && !objc_msgSend(v6, "isTrashed"))
  {
    LOBYTE(v7) = 1;
  }
  else if (objc_msgSend(v6, "px_isUnsavedSyndicatedAsset"))
  {
    int v7 = objc_msgSend(v6, "px_isSyndicationPhotoLibraryAsset") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)performUserInteractionTask
{
  objc_initWeak(&location, self);
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v4 = [(PXActionPerformer *)self presentationEnvironment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PXPhotoKitEditDateTimeActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5DCEB28;
  objc_copyWeak(&v6, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__PXPhotoKitEditDateTimeActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v10 count];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v7) {
    [WeakRetained _presentDateTimeEditViewControllerWithAssets:v10];
  }
  else {
    [WeakRetained completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

- (void)_presentDateTimeEditViewControllerWithAssets:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v4 title:0];
  id v6 = (void *)MEMORY[0x1E4F390A0];
  uint64_t v7 = [v4 firstObject];
  v8 = [v6 fetchOptionsWithPhotoLibrary:0 orObject:v7];

  v19[0] = *MEMORY[0x1E4F394E8];
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v8 setFetchPropertySets:v9];

  id v10 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v8];
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __86__PXPhotoKitEditDateTimeActionPerformer__presentDateTimeEditViewControllerWithAssets___block_invoke;
  v16 = &unk_1E5DCE660;
  objc_copyWeak(&v17, &location);
  v11 = +[PhotosDetailsDateTimeEditViewFactory dateTimeViewControllerWithAssets:v10 completion:&v13];
  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v11, v13, v14, v15, v16))
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present Edit Date Time view controller");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v12];
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __86__PXPhotoKitEditDateTimeActionPerformer__presentDateTimeEditViewControllerWithAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeUserInteractionTaskWithSuccess:a2 error:0];
}

@end