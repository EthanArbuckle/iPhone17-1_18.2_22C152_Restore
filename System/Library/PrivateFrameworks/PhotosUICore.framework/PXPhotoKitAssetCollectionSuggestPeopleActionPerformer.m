@interface PXPhotoKitAssetCollectionSuggestPeopleActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionSuggestPeopleActionPerformer

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"rectangle.on.rectangle.angled";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:a1 file:@"PXPhotoKitAssetCollectionSuggestPeopleActionPerformer.m" lineNumber:46 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v11 = 0;
  }
  else
  {
    v11 = PXLocalizedStringFromTable(@"PXPeopleSuggestWidgetGeneric", @"PhotosUICore");
  }

  return v11;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeSuggestPeople" systemImageName:a5];
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return 0;
}

- (void)performUserInteractionTask
{
  v3 = [(PXAssetCollectionActionPerformer *)self people];
  id v6 = [v3 firstObject];

  if (v6)
  {
    v4 = [[PXPeopleSplitConfirmationViewController alloc] initWithPerson:v6];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
    [(PXPeopleSplitConfirmationViewController *)v4 setModalPresentationStyle:0];
    [(PXActionPerformer *)self presentViewController:v5];
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

@end