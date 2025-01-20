@interface PXPhotoKitAssetCollectionFavoritePersonActionPerformer
+ (BOOL)canPerformOn:(id)a3;
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForPerson:(id)a3;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)systemImageNameForPerson:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionFavoritePersonActionPerformer

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v5 = objc_msgSend(a4, "people", a3);
  v6 = [v5 firstObject];

  v7 = [a1 systemImageNameForPerson:v6];

  return v7;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 people];
  v12 = [v11 firstObject];

  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:a1 file:@"PXPhotoKitAssetCollectionFavoritePersonActionPerformer.m" lineNumber:73 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v13 = 0;
  }
  else
  {
    v13 = [a1 localizedTitleForPerson:v12];
  }

  return v13;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeFavoritePerson" systemImageName:a5];
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
  if ([a3 type] == 1) {
    v3 = @"heart.slash";
  }
  else {
    v3 = @"heart";
  }
  return v3;
}

+ (id)localizedTitleForPerson:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "px_localizedName");
  uint64_t v5 = [v4 length];
  uint64_t v6 = [v3 type];
  if (v5)
  {
    if (v6 == 1) {
      char v7 = @"PXPeopleUnfavoriteThisPersonNamed";
    }
    else {
      char v7 = @"PXPeopleFavoriteThisPersonNamed";
    }
    v8 = PXLocalizedStringFromTable(v7, @"PhotosUICore");
    id v9 = PXStringWithValidatedFormat();
  }
  else
  {
    if (v6 == 1) {
      id v10 = @"PXPeopleUnfavoriteThisPersonNoName";
    }
    else {
      id v10 = @"PXPeopleFavoriteThisPersonNoName";
    }
    id v9 = PXLocalizedStringForPersonOrPetAndVisibility(v3, 0, v10);
  }

  return v9;
}

+ (BOOL)canPerformOn:(id)a3
{
  id v3 = [a3 firstObject];
  BOOL v4 = +[PXPeopleUtilities isPersonHiddenFromPeopleHome:v3];

  return !v4;
}

- (void)performUserInteractionTask
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PXAssetCollectionActionPerformer *)self people];
  BOOL v4 = [v3 firstObject];

  if (v4)
  {
    uint64_t v5 = [v4 localIdentifier];
    uint64_t v6 = +[PXPeopleUtilities personWithLocalIdentifier:v5];

    objc_initWeak(&location, self);
    BOOL v7 = [v6 type] != 1;
    v8 = [PXChangePeopleTypeAction alloc];
    v15[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v10 = [(PXChangePeopleTypeAction *)v8 initWithPeople:v9 type:v7];

    v11 = [(PXActionPerformer *)self undoManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__PXPhotoKitAssetCollectionFavoritePersonActionPerformer_performUserInteractionTask__block_invoke;
    v12[3] = &unk_1E5DD0950;
    objc_copyWeak(&v13, &location);
    [(PXAction *)v10 executeWithUndoManager:v11 completionHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __84__PXPhotoKitAssetCollectionFavoritePersonActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained completeUserInteractionTaskWithSuccess:a2 error:v5];
}

@end