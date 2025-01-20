@interface PXPhotoKitAssetCollectionStoryDemoActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionStoryDemoActionPerformer

- (void)performUserInteractionTask
{
  v3 = [(PXAssetCollectionActionPerformer *)self assetsDataSource];
  if (!v3) {
    goto LABEL_11;
  }
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollectionReference];
  v5 = [v3 assetCollectionReferenceForAssetCollectionReference:v4];

  v6 = [v5 assetCollection];
  if (v6
    || ([v3 containerCollection],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 canContainAssets],
        v9,
        v10)
    && ([v3 containerCollection], (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = [[PXStoryConfiguration alloc] initWithAssetCollection:v6];
  }
  else
  {
    if ([v3 numberOfSections] <= 0)
    {

LABEL_11:
      v11 = [PXStoryConfiguration alloc];
      v12 = [(PXAssetCollectionActionPerformer *)self assetCollection];
      v8 = [(PXStoryConfiguration *)v11 initWithAssetCollection:v12];

      goto LABEL_12;
    }
    uint64_t v17 = [v3 identifier];
    long long v18 = xmmword_1AB359AA0;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = [v3 assetsInSectionIndexPath:&v17];
    v7 = [[PXStoryConfiguration alloc] initWithAssets:v6];
  }
  v8 = v7;

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PXPhotoKitAssetCollectionStoryDemoActionPerformer_performUserInteractionTask__block_invoke;
  v14[3] = &unk_1E5DD32A8;
  v15 = v8;
  v16 = self;
  v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __79__PXPhotoKitAssetCollectionStoryDemoActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  id v2 = +[PXStoryUIFactory viewControllerWithConfiguration:*(void *)(a1 + 32) contentViewController:0];
  [*(id *)(a1 + 40) presentViewController:v2];
  [*(id *)(a1 + 40) completeUserInteractionTaskWithSuccess:1 error:0];
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeDebugCuration" systemImageName:a5];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"memories";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return @"Play as Standalone Memory";
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = a3;
  v5 = +[PXRootSettings sharedInstance];
  if ([v5 canShowInternalUI])
  {
    v6 = +[PXStorySettings sharedInstance];
    if ([v6 enableDemoAction])
    {
      char isKindOfClass = 1;
    }
    else
    {
      v8 = [v4 assetCollection];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end