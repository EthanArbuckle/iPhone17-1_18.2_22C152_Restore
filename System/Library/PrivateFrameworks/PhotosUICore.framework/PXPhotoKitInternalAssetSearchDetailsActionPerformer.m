@interface PXPhotoKitInternalAssetSearchDetailsActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitInternalAssetSearchDetailsActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"magnifyingglass";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return @"Search Details";
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  v7 = +[PXRootSettings sharedInstance];
  char v8 = [v7 canShowInternalUI];
  if (a3) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
  v4 = [v3 allKeys];
  id v10 = [v4 firstObject];

  v5 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
  v6 = [v5 objectForKeyedSubscript:v10];
  v7 = [v6 firstObject];

  if (v7)
  {
    char v8 = +[PXSearchDiagnosticsService viewControllerForDetailsOfAsset:v7];
    BOOL v9 = [(PXActionPerformer *)self presentViewController:v8];
  }
  else
  {
    BOOL v9 = 0;
  }
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:v9 error:0];
}

@end