@interface PUPXPhotoKitSlideShowAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)createActivityWithActionManager:(id)a3;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)shouldExitSelectModeForState:(unint64_t)a3;
- (id)_getLegacySlideshowSession;
- (id)_getSlideshowSession:(id)a3;
- (void)_startSlideshow;
- (void)performUserInteractionTask;
- (void)slideshowViewControllerDidFinish:(id)a3 withVisibleAssets:(id)a4;
@end

@implementation PUPXPhotoKitSlideShowAssetActionPerformer

- (void)slideshowViewControllerDidFinish:(id)a3 withVisibleAssets:(id)a4
{
  v5 = [a3 navigationController];
  BOOL v6 = [(PXActionPerformer *)self dismissViewController:v5 completionHandler:0];

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:v6 error:0];
}

- (id)_getSlideshowSession:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotoKitAssetActionPerformer *)self photosDataSourceSnapshot];
  BOOL v6 = [v5 fetchResultWithAssetsAtIndexPaths:v4];
  if ([v6 count])
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PUPXPhotoKitSlideShowAssetActionPerformer__getSlideshowSession___block_invoke;
    v10[3] = &unk_1E5F28668;
    v10[4] = &v11;
    [v4 enumerateItemIndexSetsUsingBlock:v10];
    if (v12[3] == 0x7FFFFFFFFFFFFFFFLL) {
      [v5 firstAssetCollection];
    }
    else {
    v8 = objc_msgSend(v5, "assetCollectionForSection:");
    }
    v7 = [[PUSlideshowSession alloc] initWithFetchResult:v6 assetCollection:v8];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __66__PUPXPhotoKitSlideShowAssetActionPerformer__getSlideshowSession___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  if (v4 >= a3) {
    uint64_t v4 = a3;
  }
  *(void *)(v3 + 24) = v4;
  return result;
}

- (id)_getLegacySlideshowSession
{
  uint64_t v4 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v5 = [v4 firstObject];

  BOOL v6 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
  v7 = [v6 allKeys];
  v8 = [v7 firstObject];

  v9 = [(PXPhotoKitAssetActionPerformer *)self photosDataSourceSnapshot];
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PUPXPhotoKitAssetActionManager.m" lineNumber:563 description:@"Share performer should have a photosDataSource set."];
  }
  v10 = [v9 indexPathForAsset:v5 inCollection:v8];
  uint64_t v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(v10, "section"));
    uint64_t v13 = [v9 assetsStartingAtIndexPath:v12];

    uint64_t v14 = -[PUSlideshowSession initWithFetchResult:assetCollection:startIndex:]([PUSlideshowSession alloc], "initWithFetchResult:assetCollection:startIndex:", v13, v8, [v11 item]);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_startSlideshow
{
  uint64_t v4 = [(PXAssetActionPerformer *)self selectionSnapshot];
  id v10 = [v4 selectedIndexPaths];

  if ([v10 itemCount] <= 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PUPXPhotoKitAssetActionManager.m" lineNumber:532 description:@"Expected at least one selected index path."];
  }
  if ([v10 itemCount] == 1) {
    [(PUPXPhotoKitSlideShowAssetActionPerformer *)self _getLegacySlideshowSession];
  }
  else {
  v5 = [(PUPXPhotoKitSlideShowAssetActionPerformer *)self _getSlideshowSession:v10];
  }
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PUPXPhotoKitAssetActionManager.m" lineNumber:542 description:@"Slideshow session was unable to be created"];
  }
  BOOL v6 = [[PUSlideshowViewController alloc] initWithSession:v5];
  [(PUSlideshowViewController *)v6 setDelegate:self];
  v7 = [[PUSlideshowNavigationController alloc] initWithRootViewController:v6];
  [(PUSlideshowNavigationController *)v7 setModalTransitionStyle:2];
  if (![(PXActionPerformer *)self presentViewController:v7]) {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

- (void)performUserInteractionTask
{
  uint64_t v3 = [(PXAssetActionPerformer *)self selectionSnapshot];
  uint64_t v4 = [v3 selectedIndexPaths];
  uint64_t v5 = [v4 count];

  if (v5 < 1)
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
  else
  {
    [(PUPXPhotoKitSlideShowAssetActionPerformer *)self _startSlideshow];
  }
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return 0;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"play.rectangle";
}

+ (id)createActivityWithActionManager:(id)a3
{
  uint64_t v3 = [a1 localizedTitleForUseCase:2 actionManager:a3];
  uint64_t v4 = [MEMORY[0x1E4F8FF48] activityWithActionTitle:v3 actionType:*MEMORY[0x1E4F90D88] activityType:*MEMORY[0x1E4F90AF8] systemImageName:@"play.rectangle"];

  return v4;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v8 = a3;
  v9 = [a1 localizedTitleForUseCase:1 actionManager:a5];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v9 style:0 target:v8 action:a4];

  return v10;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return a3 != 0;
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  return 1;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F8FFA0] sharedInstance];
  int v9 = [v8 enableSlideshowAction];

  if (!v9)
  {
    LOBYTE(v12) = 0;
    goto LABEL_10;
  }
  id v10 = [v7 dataSource];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    v18 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, a1, @"PUPXPhotoKitAssetActionManager.m", 476, @"%@ should be an instance inheriting from %@, but it is %@", @"selectionSnapshot.dataSource", v16, v18 object file lineNumber description];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, a1, @"PUPXPhotoKitAssetActionManager.m", 476, @"%@ should be an instance inheriting from %@, but it is nil", @"selectionSnapshot.dataSource", v16 object file lineNumber description];
  }

LABEL_4:
  uint64_t v11 = [v10 containerCollection];
  if ([v7 isAnyItemSelected]
    && (objc_msgSend(v11, "px_isRecentlyDeletedSmartAlbum") & 1) == 0)
  {
    int v12 = objc_msgSend(v11, "px_isRecoveredSmartAlbum") ^ 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

LABEL_10:
  return v12;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(@"SLIDESHOW_TITLE");
}

@end