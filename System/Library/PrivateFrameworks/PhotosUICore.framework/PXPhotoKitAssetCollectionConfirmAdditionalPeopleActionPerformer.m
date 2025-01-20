@interface PXPhotoKitAssetCollectionConfirmAdditionalPeopleActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionConfirmAdditionalPeopleActionPerformer

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"rectangle.stack.badge.person.crop";
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
      [v13 handleFailureInMethod:a2 object:a1 file:@"PXPhotoKitAssetCollectionConfirmAdditionalPeopleActionPerformer.m" lineNumber:53 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v11 = 0;
  }
  else
  {
    v11 = PXLocalizedStringFromTable(@"PXPeopleConfirmAdditionalPhotosActionTitle", @"PhotosUICore");
  }

  return v11;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeConfirmAdditionalPeople" systemImageName:a5];
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = a4;
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 people];
  }
  else
  {
    v5 = 0;
  }
  BOOL v6 = [v5 count] == 1;

  return v6;
}

- (void)performUserInteractionTask
{
  v3 = [(PXAssetCollectionActionPerformer *)self people];
  id v6 = [v3 firstObject];

  if (v6)
  {
    id v4 = [[PXPeopleSplitConfirmationViewController alloc] initWithPerson:v6];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
    [(PXActionPerformer *)self presentViewController:v5];
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

@end