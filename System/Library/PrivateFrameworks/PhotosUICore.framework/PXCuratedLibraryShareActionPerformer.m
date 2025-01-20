@interface PXCuratedLibraryShareActionPerformer
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (id)activitySystemImageName;
- (id)activityType;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryShareActionPerformer

- (void)performUserInteractionTask
{
  v41[3] = *MEMORY[0x1E4F143B8];
  v4 = [(PXCuratedLibraryAssetCollectionActionPerformer *)self assetCollectionReference];
  v5 = [v4 keyAssetReference];

  v6 = [v5 asset];
  v7 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v8 = [v7 assetsDataSourceManager];
  v9 = [v8 dataSourceForZoomLevel:3];

  if (!v6)
  {
    if (![v9 containsAnyItems]) {
      goto LABEL_9;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    v10 = [(PXCuratedLibraryAssetCollectionActionPerformer *)self assetCollectionReference];
    if (v9)
    {
      [v9 indexPathForAssetCollectionReference:v10];
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
    }

    if ((void)v38 == *(void *)off_1E5DAAED8
      || [v9 numberOfItemsInSection:*((void *)&v38 + 1)] < 1)
    {
LABEL_9:
      v6 = 0;
    }
    else
    {
      v36[0] = [v9 identifier];
      v36[1] = *((void *)&v38 + 1);
      long long v37 = xmmword_1AB359AA0;
      v6 = [v9 assetAtItemIndexPath:v36];
    }
  }
  v11 = [PXActivitySharingContext alloc];
  v12 = [(PXCuratedLibraryAssetCollectionActionPerformer *)self assetCollectionReference];
  v13 = [v12 assetCollection];
  v14 = [(PXActivitySharingContext *)v11 initWithAssetCollection:v13 assetsDataSource:v9];

  [(PXActivitySharingContext *)v14 setKeyAsset:v6];
  v15 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  uint64_t v16 = [v15 zoomLevel];
  if ((unint64_t)(v16 - 1) >= 3) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = 14 - v16;
  }
  [(PXActivitySharingContext *)v14 setSourceOrigin:v17];

  v41[0] = @"com.apple.Photos.activity.SlideShow";
  v41[1] = @"PUActivityTypeEditDateTime";
  v41[2] = @"PUActivityTypeEditLocation";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
  [(PXActivitySharingContext *)v14 setExcludedActivityTypes:v18];

  v19 = [(PXActivitySharingContext *)v14 excludedActivityTypes];
  v40[0] = @"PUActivityTypeHide";
  v40[1] = @"PUActivityTypeDuplicate";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  v21 = [v19 arrayByAddingObjectsFromArray:v20];
  [(PXActivitySharingContext *)v14 setExcludedActivityTypes:v21];

  id v22 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  v23 = objc_msgSend(v22, "px_sharePresentation");

  if (!v23)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 450, @"Invalid parameter not satisfying: %@", @"sharePresentation" object file lineNumber description];
  }
  v24 = [v23 createActivitySharingControllerWithContext:v14];
  [v24 selectInitialAssets];
  if (!v24)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 453, @"Invalid parameter not satisfying: %@", @"activitySharingController" object file lineNumber description];
  }
  v25 = [v24 activityViewController];
  if (!v25)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    [v33 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 454, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController.activityViewController", v30 object file lineNumber description];
LABEL_22:

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v31 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v31);
    v32 = objc_msgSend(v25, "px_descriptionForAssertionMessage");
    [v33 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 454, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController.activityViewController", v30, v32 object file lineNumber description];

    goto LABEL_22;
  }
LABEL_19:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PXCuratedLibraryShareActionPerformer_performUserInteractionTask__block_invoke;
  block[3] = &unk_1E5DD32A8;
  block[4] = self;
  id v35 = v25;
  id v26 = v25;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__PXCuratedLibraryShareActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:1 error:0];
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  objc_msgSend(a4, "activityType", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(PXCuratedLibraryShareActionPerformer *)self activityType];
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  char v9 = [v6 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 414, @"Invalid parameter not satisfying: %@", @"PXStringEqualToString(activity.activityType, self.activityType)" object file lineNumber description];
LABEL_5:
  }
  return 1;
}

- (id)activitySystemImageName
{
  return @"square.and.arrow.up";
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F9F3E0];
}

@end