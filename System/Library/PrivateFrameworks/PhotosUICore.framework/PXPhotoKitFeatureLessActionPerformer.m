@interface PXPhotoKitFeatureLessActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)isActionDestructive;
+ (id)_facesInCurrentAsset:(id)a3;
+ (id)_personFromFace:(id)a3 asset:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4;
- (id)_personFromFace:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitFeatureLessActionPerformer

+ (id)_personFromFace:(id)a3 asset:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F390A0];
  id v6 = a3;
  v7 = [v5 fetchOptionsWithPhotoLibrary:0 orObject:a4];
  [v7 setFetchLimit:1];
  v11[0] = *MEMORY[0x1E4F397E0];
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v7 setFetchPropertySets:v8];

  v9 = [MEMORY[0x1E4F391F0] fetchPersonWithFace:v6 options:v7];

  return v9;
}

+ (id)_facesInCurrentAsset:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F390A0];
  id v4 = a3;
  v5 = [v3 fetchOptionsWithPhotoLibrary:0 orObject:v4];
  [v5 setFetchLimit:2];
  [v5 setPersonContext:5];
  id v6 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v4 options:v5];

  return v6;
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  v3 = [a3 selectionManager];
  id v4 = [v3 selectionSnapshot];
  v5 = [v4 firstObject];

  id v6 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v8 = [(id)objc_opt_class() _facesInCurrentAsset:v7];
  v9 = @"xmark.circle";
  if ([v8 count] == 1)
  {
    v10 = objc_opt_class();
    v11 = [v8 firstObject];
    v12 = [v10 _personFromFace:v11 asset:v7];

    v13 = [v12 firstObject];
    [v13 fetchPropertySetsIfNeeded];
    v14 = [v13 userFeedbackProperties];
    v15 = [v14 userFeedback];

    if (v15) {
      v9 = @"plus.circle";
    }
  }
  return v9;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4 = objc_msgSend(a4, "selectionManager", a3);
  v5 = [v4 selectionSnapshot];
  id v6 = [v5 firstObject];

  id v7 = v6;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  v9 = [(id)objc_opt_class() _facesInCurrentAsset:v8];
  if ([v9 count] != 1)
  {
    v18 = PXLocalizedStringFromTable(@"PXForYouRecentInterestSuggestionSuggestLessPeopleActionTitle", @"PhotosUICore");
    goto LABEL_14;
  }
  v10 = objc_opt_class();
  v11 = [v9 firstObject];
  v12 = [v10 _personFromFace:v11 asset:v8];

  v13 = [v12 firstObject];
  [v13 fetchPropertySetsIfNeeded];
  v14 = objc_msgSend(v13, "px_localizedName");
  v15 = [v13 userFeedbackProperties];
  v16 = [v15 userFeedback];

  if (!v16)
  {
    uint64_t v19 = PXLocalizedStringFromTable(@"PXForYouRecentInterestSuggestionSuggestLessPersonActionTitle", @"PhotosUICore");
LABEL_12:
    v18 = (void *)v19;
    goto LABEL_13;
  }
  if (![v14 length])
  {
    uint64_t v19 = PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, @"PXPeopleBlockPersonRevertResetActionTitleNoName");
    goto LABEL_12;
  }
  v17 = PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, @"PXPeopleBlockPersonRevertResetActionTitleNamed");
  v18 = PXStringWithValidatedFormat();

LABEL_13:
LABEL_14:

  return v18;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && (objc_msgSend(v10, "px_isSyndicatedAsset") & 1) == 0)
  {
    v15 = [a1 _facesInCurrentAsset:v10];
    BOOL v14 = [v15 count] != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
}

- (id)_personFromFace:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXPhotoKitAssetActionPerformer *)self assets];
  id v6 = [v5 firstObject];

  id v7 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v6];
  [v7 setFetchLimit:1];
  v11[0] = *MEMORY[0x1E4F397E0];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v7 setFetchPropertySets:v8];

  v9 = [MEMORY[0x1E4F391F0] fetchPersonWithFace:v4 options:v7];

  return v9;
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
  v3 = objc_alloc_init(PXSuggestLessPeopleHelper);
  suggestLessPeopleHelper = self->_suggestLessPeopleHelper;
  self->_suggestLessPeopleHelper = v3;

  [(PXSuggestLessPeopleHelper *)self->_suggestLessPeopleHelper setDelegate:self];
  v5 = self->_suggestLessPeopleHelper;
  id v6 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PXPhotoKitFeatureLessActionPerformer_performUserInteractionTask__block_invoke;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  [(PXSuggestLessPeopleHelper *)v5 suggestLessPeopleFromAssets:v6 completionHandler:v7];
}

void __66__PXPhotoKitFeatureLessActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Could not suggest this person less: %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PXPhotoKitFeatureLessActionPerformer_performUserInteractionTask__block_invoke_212;
  block[3] = &unk_1E5DD21E8;
  uint64_t v7 = *(void *)(a1 + 32);
  char v11 = a2;
  block[4] = v7;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__PXPhotoKitFeatureLessActionPerformer_performUserInteractionTask__block_invoke_212(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

@end