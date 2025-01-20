@interface PXPhotoKitAssetCollectionCopyInternalURLActionPerformer
+ (BOOL)canPerformOn:(id)a3;
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForPerson:(id)a3;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)systemImageNameForPerson:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionCopyInternalURLActionPerformer

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeFileRadar" systemImageName:a5];
}

+ (id)systemImageNameForPerson:(id)a3
{
  return @"link";
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"link";
}

+ (id)localizedTitleForPerson:(id)a3
{
  return @"Copy URL";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  if (a3 == 2) {
    return @"(Internal) Copy URL";
  }
  else {
    return @"Copy URL";
  }
}

+ (BOOL)canPerformOn:(id)a3
{
  id v3 = a3;
  v4 = +[PXRootSettings sharedInstance];
  if ([v4 canShowInternalUI]) {
    BOOL v5 = [v3 count] == 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v4 = +[PXRootSettings sharedInstance];
  char v5 = [v4 canShowInternalUI];

  return v5;
}

- (void)performUserInteractionTask
{
  id v3 = [(PXAssetCollectionActionPerformer *)self people];
  v4 = [v3 firstObject];

  if (v4)
  {
    objc_msgSend(v4, "px_navigationURL");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v5 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    objc_msgSend(v5, "px_navigationURL");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v6 setURL:v7];

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

@end