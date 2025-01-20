@interface PUPhotoKitSlideShowActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (void)_startSlideshow;
- (void)performUserInteractionTask;
@end

@implementation PUPhotoKitSlideShowActionPerformer

- (void)_startSlideshow
{
  v4 = [(PUAssetActionPerformer *)self assets];
  id v17 = [v4 firstObject];

  v5 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
  v6 = [v5 allKeys];
  v7 = [v6 firstObject];

  v8 = [(PUPhotoKitActionPerformer *)self photosDataSource];
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PUPhotoKitAssetActionManager.m" lineNumber:1899 description:@"Share performer should have a photosDataSource set."];
  }
  v9 = [v8 indexPathForAsset:v17 inCollection:v7];
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(v9, "section"));
    v12 = [v8 assetsStartingAtIndexPath:v11];

    v13 = -[PUSlideshowSession initWithFetchResult:assetCollection:startIndex:]([PUSlideshowSession alloc], "initWithFetchResult:assetCollection:startIndex:", v12, v7, [v10 item]);
    v14 = [[PUSlideshowViewController alloc] initWithSession:v13];
    BOOL v15 = [(PUAssetActionPerformer *)self presentViewController:v14];
  }
  else
  {
    BOOL v15 = 0;
  }
  [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:v15 error:0];
}

- (void)performUserInteractionTask
{
  v4 = [(PUAssetActionPerformer *)self assets];
  uint64_t v5 = [v4 count];

  if (v5 != 1)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUPhotoKitAssetActionManager.m" lineNumber:1889 description:@"There can be only one asset when starting a SlideShow action"];
  }
  [(PUPhotoKitSlideShowActionPerformer *)self _startSlideshow];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

@end