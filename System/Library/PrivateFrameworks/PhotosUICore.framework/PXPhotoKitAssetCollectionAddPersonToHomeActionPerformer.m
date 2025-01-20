@interface PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"rectangle.stack.badge.plus";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:a1 file:@"PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer.m" lineNumber:55 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v12 = 0;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      v11 = [v10 people];
    }
    else
    {
      v11 = 0;
    }
    v13 = [v11 firstObject];
    if (!v13)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:a1 file:@"PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer.m" lineNumber:38 description:@"Person is nil"];
    }
    v14 = objc_msgSend(v13, "px_localizedName");
    v15 = [v13 photoLibrary];
    uint64_t v16 = objc_msgSend(v15, "px_peoplePetsHomeVisibility");

    if (objc_msgSend(v13, "px_isHuman"))
    {
      uint64_t v17 = v16 | 1;
    }
    else if (objc_msgSend(v13, "px_isPet"))
    {
      uint64_t v17 = v16 | 2;
    }
    else
    {
      uint64_t v17 = v16;
    }
    if ([v14 length]) {
      PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, @"PXPeopleAddToHomeTitleNamed");
    }
    else {
    v18 = PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, @"PXPeopleAddToHomeTitleNoName");
    }
    v19 = PXLocalizedStringForPeoplePetsHomeTitle(v17);
    v12 = PXStringWithValidatedFormat();
  }
  return v12;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeAddPersonToHome" systemImageName:a5];
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
  if ([v5 count] == 1)
  {
    v6 = [v5 firstObject];
    BOOL v7 = +[PXPeopleUtilities isPersonHiddenFromPeopleHome:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)performUserInteractionTask
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXAssetCollectionActionPerformer *)self people];
  id v4 = [v3 firstObject];

  if (v4)
  {
    v5 = [v4 localIdentifier];
    v6 = +[PXPeopleUtilities personWithLocalIdentifier:v5];

    objc_initWeak(&location, self);
    BOOL v7 = [PXChangePeopleTypeAction alloc];
    v14[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v9 = [(PXChangePeopleTypeAction *)v7 initWithPeople:v8 type:0];

    id v10 = [(PXActionPerformer *)self undoManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer_performUserInteractionTask__block_invoke;
    v11[3] = &unk_1E5DD0950;
    objc_copyWeak(&v12, &location);
    [(PXAction *)v9 executeWithUndoManager:v10 completionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __85__PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained completeUserInteractionTaskWithSuccess:a2 error:v5];
}

@end