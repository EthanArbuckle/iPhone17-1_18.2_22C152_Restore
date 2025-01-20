@interface PXPhotoKitAssetCollectionBlockPersonActionPerformer
+ (BOOL)canPerformOn:(id)a3;
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)isActionDestructive;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForPerson:(id)a3;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)systemImageNameForPerson:(id)a3;
- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionBlockPersonActionPerformer

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
      [v15 handleFailureInMethod:a2 object:a1 file:@"PXPhotoKitAssetCollectionBlockPersonActionPerformer.m" lineNumber:95 description:@"Code which should be unreachable has been reached"];

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
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeBlockPerson" systemImageName:a5];
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
  id v3 = a3;
  [v3 fetchPropertySetsIfNeeded];
  v4 = [v3 userFeedbackProperties];

  id v5 = [v4 userFeedback];

  if (v5) {
    return @"plus.circle";
  }
  else {
    return @"xmark.circle";
  }
}

+ (id)localizedTitleForPerson:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "px_localizedName");
  [v3 fetchPropertySetsIfNeeded];
  id v5 = [v3 userFeedbackProperties];
  v6 = [v5 userFeedback];

  uint64_t v7 = [v4 length];
  if (v6)
  {
    if (v7)
    {
      v8 = @"PXPeopleBlockPersonRevertResetActionTitleNamed";
LABEL_6:
      id v9 = PXLocalizedStringForPersonOrPetAndVisibility(v3, 0, v8);
      id v10 = PXStringWithValidatedFormat();

      goto LABEL_10;
    }
    v11 = @"PXPeopleBlockPersonRevertResetActionTitleNoName";
  }
  else
  {
    if (v7)
    {
      v8 = @"PXPeopleBlockPersonActionTitleNamed";
      goto LABEL_6;
    }
    v11 = @"PXPeopleBlockPersonActionTitleNoName";
  }
  id v10 = PXLocalizedStringForPersonOrPetAndVisibility(v3, 0, v11);
LABEL_10:

  return v10;
}

+ (BOOL)canPerformOn:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return [(PXActionPerformer *)self dismissViewController:a4 completionHandler:a5];
}

- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4
{
  return [(PXActionPerformer *)self presentViewController:a4];
}

- (void)performUserInteractionTask
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXAssetCollectionActionPerformer *)self people];
  v4 = [v3 firstObject];

  id v5 = PLMemoriesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to block person: %@", buf, 0xCu);
  }

  v6 = [v4 photoLibrary];

  if (!v6)
  {
    [v4 photoLibrary];
    v11 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to block person because person and/or its photo library was nil. Person: %@ photoLibrary: %@", v4, objc_claimAutoreleasedReturnValue());
    v12 = PLMemoriesGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Failed to block person because needed objects were nil. Error: %@", buf, 0xCu);
    }

    id v13 = v11;
    px_dispatch_on_main_queue();
  }
  if (!self->_suggestLessPeopleHelper)
  {
    uint64_t v7 = objc_alloc_init(PXSuggestLessPeopleHelper);
    suggestLessPeopleHelper = self->_suggestLessPeopleHelper;
    self->_suggestLessPeopleHelper = v7;

    [(PXSuggestLessPeopleHelper *)self->_suggestLessPeopleHelper setDelegate:self];
  }
  objc_initWeak((id *)buf, self);
  id v9 = self->_suggestLessPeopleHelper;
  v16 = v4;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PXPhotoKitAssetCollectionBlockPersonActionPerformer_performUserInteractionTask__block_invoke;
  v14[3] = &unk_1E5DD0950;
  objc_copyWeak(&v15, (id *)buf);
  [(PXSuggestLessPeopleHelper *)v9 suggestLessPeople:v10 completionHandler:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __81__PXPhotoKitAssetCollectionBlockPersonActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  char v7 = a2;
  v5;
  px_dispatch_on_main_queue();
}

uint64_t __81__PXPhotoKitAssetCollectionBlockPersonActionPerformer_performUserInteractionTask__block_invoke_226(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

void __81__PXPhotoKitAssetCollectionBlockPersonActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

@end