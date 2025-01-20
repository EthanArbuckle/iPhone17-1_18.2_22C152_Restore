@interface PXPhotoKitAssetCollectionRemovePersonFromHomeActionPerformer
+ (BOOL)canPerformOn:(id)a3;
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)isActionDestructive;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForPerson:(id)a3;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)systemImageNameForPerson:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionRemovePersonFromHomeActionPerformer

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v5 = PXFirstPersonFromAssetCollectionActionPerformerInput(a4);
  v6 = [a1 systemImageNameForPerson:v5];

  return v6;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:a1 file:@"PXPhotoKitAssetCollectionRemovePersonFromHomeActionPerformer.m" lineNumber:64 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v13 = 0;
  }
  else
  {
    v12 = PXFirstPersonFromAssetCollectionActionPerformerInput(v10);
    v13 = [a1 localizedTitleForPerson:v12];
  }
  return v13;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeRemovePersonFromHome" systemImageName:a5];
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector())
  {
    v6 = [v5 people];
  }
  else
  {
    v6 = 0;
  }
  if ([v6 count] == 1) {
    char v7 = [a1 canPerformOn:v6];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

+ (id)systemImageNameForPerson:(id)a3
{
  return @"eye.slash";
}

+ (id)localizedTitleForPerson:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(v3, "px_localizedName");
  if ([v4 length])
  {
    v10[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

    v6 = PXLocalizedStringForPeople(v5, @"PXPeopleRemoveFromHomeTitleNamed");
    char v7 = PXStringWithValidatedFormat();
  }
  else
  {
    id v9 = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];

    char v7 = PXLocalizedStringForPeople(v5, @"PXPeopleRemoveFromHomeTitleNoName");
  }

  return v7;
}

+ (BOOL)canPerformOn:(id)a3
{
  id v3 = [a3 firstObject];
  BOOL v4 = +[PXPeopleUtilities isPersonHiddenFromPeopleHome:v3];

  return !v4;
}

- (void)performUserInteractionTask
{
  objc_initWeak(&location, self);
  id v3 = [(PXAssetCollectionActionPerformer *)self people];
  BOOL v4 = [(PXActionPerformer *)self presentationEnvironment];
  id v5 = [(PXActionPerformer *)self undoManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__PXPhotoKitAssetCollectionRemovePersonFromHomeActionPerformer_performUserInteractionTask__block_invoke;
  v6[3] = &unk_1E5DD0950;
  objc_copyWeak(&v7, &location);
  +[PXPeopleRemovalUtilities presentAlertFor:v3 totalNumberOfPeople:0 presentationEnvironment:v4 undoManager:v5 sourceItem:0 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __90__PXPhotoKitAssetCollectionRemovePersonFromHomeActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained completeUserInteractionTaskWithSuccess:a2 error:v5];
}

@end