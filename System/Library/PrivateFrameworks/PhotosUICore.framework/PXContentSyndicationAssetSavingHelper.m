@interface PXContentSyndicationAssetSavingHelper
+ (id)assetSavingHelperFromAssetCollectionActionPerformer:(id)a3;
- (BOOL)allowSkippingUnsavedAssets;
- (BOOL)skipUserPromptForSavingAssets;
- (BOOL)userCanContinueAfterSavingSyndicatedAssets;
- (PXContentSyndicationAssetSavingHelper)initWithAssetCollection:(id)a3;
- (PXDisplayAssetCollection)assetCollection;
- (PXPresentationEnvironment)presentationEnvironment;
- (void)_handleAlertResponseForUnsavedSyndicatedAssets:(id)a3 helperResult:(unint64_t)a4 error:(id)a5 completionHandler:(id)a6;
- (void)performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion:(id)a3;
- (void)presentSaveAlertForUnsavedSyndicatedAssets:(id)a3 canContinueAfterSaving:(BOOL)a4 allowSkippingUnsavedAssets:(BOOL)a5 withCompletion:(id)a6;
- (void)saveUnsavedSyndicatedAssetsWithCompletion:(id)a3;
- (void)setAllowSkippingUnsavedAssets:(BOOL)a3;
- (void)setPresentationEnvironment:(id)a3;
- (void)setSkipUserPromptForSavingAssets:(BOOL)a3;
- (void)setUserCanContinueAfterSavingSyndicatedAssets:(BOOL)a3;
@end

@implementation PXContentSyndicationAssetSavingHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationEnvironment, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (void)setPresentationEnvironment:(id)a3
{
}

- (PXPresentationEnvironment)presentationEnvironment
{
  return self->_presentationEnvironment;
}

- (void)setSkipUserPromptForSavingAssets:(BOOL)a3
{
  self->_skipUserPromptForSavingAssets = a3;
}

- (BOOL)skipUserPromptForSavingAssets
{
  return self->_skipUserPromptForSavingAssets;
}

- (void)setAllowSkippingUnsavedAssets:(BOOL)a3
{
  self->_allowSkippingUnsavedAssets = a3;
}

- (BOOL)allowSkippingUnsavedAssets
{
  return self->_allowSkippingUnsavedAssets;
}

- (void)setUserCanContinueAfterSavingSyndicatedAssets:(BOOL)a3
{
  self->_userCanContinueAfterSavingSyndicatedAssets = a3;
}

- (BOOL)userCanContinueAfterSavingSyndicatedAssets
{
  return self->_userCanContinueAfterSavingSyndicatedAssets;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)saveUnsavedSyndicatedAssetsWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = [(PXContentSyndicationAssetSavingHelper *)self presentationEnvironment];

  if (!v6)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = NSStringFromSelector(a2);
    [v18 handleFailureInMethod:a2, self, @"PXContentSyndicationAssetSavingHelper.m", 245, @"%@ requires a non-nil presentation environment", v19 object file lineNumber description];
  }
  id v7 = objc_alloc((Class)off_1E5DA55C0);
  v8 = [(PXContentSyndicationAssetSavingHelper *)self assetCollection];
  uint64_t v24 = *(void *)off_1E5DAAED8;
  long long v25 = xmmword_1AB359AA0;
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = (void *)[v7 initWithAssetCollection:v8 keyAssetReference:0 indexPath:&v24];

  v10 = [PXDisplayTitleInfo alloc];
  v11 = [(PXContentSyndicationAssetSavingHelper *)self assetCollection];
  v12 = [(PXDisplayTitleInfo *)v10 initWithAssetCollection:v11 useVerboseSmartDescription:0];

  v13 = [(PXAssetCollectionActionPerformer *)[PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer alloc] initWithActionType:@"PXAssetCollectionActionTypeContentSyndicationSaveToLibrary" assetCollectionReference:v9 displayTitleInfo:v12];
  v14 = [(PXContentSyndicationAssetSavingHelper *)self presentationEnvironment];
  [(PXActionPerformer *)v13 setPresentationEnvironment:v14];

  v15 = PLSyndicationUIGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: Performing save action...", buf, 2u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__PXContentSyndicationAssetSavingHelper_saveUnsavedSyndicatedAssetsWithCompletion___block_invoke;
  v20[3] = &unk_1E5DD2B90;
  v21 = v13;
  id v22 = v5;
  v16 = v13;
  id v17 = v5;
  [(PXActionPerformer *)v16 performActionWithCompletionHandler:v20];
}

void __83__PXContentSyndicationAssetSavingHelper_saveUnsavedSyndicatedAssetsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v8 = [v5 savedAssetsFetchResult];
  id v7 = [v8 fetchedObjects];
  (*(void (**)(uint64_t, uint64_t, void *, id))(v4 + 16))(v4, a2, v7, v6);
}

- (void)presentSaveAlertForUnsavedSyndicatedAssets:(id)a3 canContinueAfterSaving:(BOOL)a4 allowSkippingUnsavedAssets:(BOOL)a5 withCompletion:(id)a6
{
  id v9 = a3;
  a6;
  if (!v9)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, @"PXContentSyndicationAssetSavingHelper.m", 142, @"%@ requires a non-nil fetch result of unsaved assets", v12 object file lineNumber description];
  }
  v10 = [(PXContentSyndicationAssetSavingHelper *)self presentationEnvironment];

  if (!v10)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"PXContentSyndicationAssetSavingHelper.m", 143, @"%@ requires a non-nil presentation environment", v14 object file lineNumber description];
  }
  PXMediaTypeForAssets();
}

uint64_t __149__PXContentSyndicationAssetSavingHelper_presentSaveAlertForUnsavedSyndicatedAssets_canContinueAfterSaving_allowSkippingUnsavedAssets_withCompletion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 1;
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v1, 0);
}

uint64_t __149__PXContentSyndicationAssetSavingHelper_presentSaveAlertForUnsavedSyndicatedAssets_canContinueAfterSaving_allowSkippingUnsavedAssets_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __149__PXContentSyndicationAssetSavingHelper_presentSaveAlertForUnsavedSyndicatedAssets_canContinueAfterSaving_allowSkippingUnsavedAssets_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PXContentSyndicationAssetSavingHelper *)self presentationEnvironment];

  if (!v6)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = NSStringFromSelector(a2);
    [v20 handleFailureInMethod:a2, self, @"PXContentSyndicationAssetSavingHelper.m", 100, @"%@ requires a non-nil presentation environment", v21 object file lineNumber description];
  }
  id v7 = [(PXContentSyndicationAssetSavingHelper *)self assetCollection];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v25 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v25);
    uint64_t v26 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v22 handleFailureInMethod:a2, self, @"PXContentSyndicationAssetSavingHelper.m", 103, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v24, v26 object file lineNumber description];
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v23);
    [v22 handleFailureInMethod:a2, self, @"PXContentSyndicationAssetSavingHelper.m", 103, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v24 object file lineNumber description];
  }

LABEL_5:
  id v8 = PXContentSyndicationUnsavedSyndicatedAssetsInAssetCollection(v7);
  unint64_t v9 = [v8 count];
  v10 = PLSyndicationUIGetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v33 = v9;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: Found %lu unsaved content syndication assets that need to be saved before continuing", buf, 0xCu);
    }

    if ([(PXContentSyndicationAssetSavingHelper *)self skipUserPromptForSavingAssets])
    {
      v12 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: Skipping user prompt and directly saving assets", buf, 2u);
      }

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __106__PXContentSyndicationAssetSavingHelper_performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion___block_invoke;
      v30[3] = &unk_1E5DCE6F0;
      id v31 = v5;
      [(PXContentSyndicationAssetSavingHelper *)self saveUnsavedSyndicatedAssetsWithCompletion:v30];
    }
    else
    {
      v13 = [v7 photoLibrary];
      v14 = [v13 librarySpecificFetchOptions];

      [v14 setIncludeGuestAssets:1];
      v15 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v14];
      unint64_t v16 = [v15 count];
      BOOL v17 = [(PXContentSyndicationAssetSavingHelper *)self allowSkippingUnsavedAssets];
      BOOL v18 = v16 > v9 && v17;
      BOOL v19 = [(PXContentSyndicationAssetSavingHelper *)self userCanContinueAfterSavingSyndicatedAssets];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __106__PXContentSyndicationAssetSavingHelper_performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion___block_invoke_2;
      v27[3] = &unk_1E5DCE738;
      v27[4] = self;
      id v28 = v8;
      id v29 = v5;
      [(PXContentSyndicationAssetSavingHelper *)self presentSaveAlertForUnsavedSyndicatedAssets:v28 canContinueAfterSaving:v19 allowSkippingUnsavedAssets:v18 withCompletion:v27];
    }
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: No unsaved syndicated assets to process", buf, 2u);
    }

    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
  }
}

uint64_t __106__PXContentSyndicationAssetSavingHelper_performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 4;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __106__PXContentSyndicationAssetSavingHelper_performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleAlertResponseForUnsavedSyndicatedAssets:*(void *)(a1 + 40) helperResult:a2 error:a3 completionHandler:*(void *)(a1 + 48)];
}

- (void)_handleAlertResponseForUnsavedSyndicatedAssets:(id)a3 helperResult:(unint64_t)a4 error:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  switch(a4)
  {
    case 0uLL:
      BOOL v19 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: No unsaved syndicated assets to process", buf, 2u);
      }

      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationAssetSavingHelper.m" lineNumber:68 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1uLL:
      v14 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: User chose to save unsaved syndicated assets and stop", buf, 2u);
      }

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __125__PXContentSyndicationAssetSavingHelper__handleAlertResponseForUnsavedSyndicatedAssets_helperResult_error_completionHandler___block_invoke;
      v23[3] = &unk_1E5DCE6F0;
      id v24 = v13;
      [(PXContentSyndicationAssetSavingHelper *)self saveUnsavedSyndicatedAssetsWithCompletion:v23];
      v15 = v24;
      goto LABEL_8;
    case 2uLL:
      unint64_t v16 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: User chose to save unsaved syndicated assets and continue", buf, 2u);
      }

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __125__PXContentSyndicationAssetSavingHelper__handleAlertResponseForUnsavedSyndicatedAssets_helperResult_error_completionHandler___block_invoke_211;
      v21[3] = &unk_1E5DCE6F0;
      id v22 = v13;
      [(PXContentSyndicationAssetSavingHelper *)self saveUnsavedSyndicatedAssetsWithCompletion:v21];
      v15 = v22;
LABEL_8:

      break;
    case 3uLL:
      BOOL v17 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: User chose to skip saving unsaved syndicated assets", buf, 2u);
      }

      PXMap();
    case 4uLL:
      BOOL v18 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: User canceled saving unsaved syndicated assets", buf, 2u);
      }

      (*((void (**)(id, uint64_t, void, id))v13 + 2))(v13, 4, 0, v12);
      break;
    default:
      break;
  }
}

uint64_t __125__PXContentSyndicationAssetSavingHelper__handleAlertResponseForUnsavedSyndicatedAssets_helperResult_error_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 4;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __125__PXContentSyndicationAssetSavingHelper__handleAlertResponseForUnsavedSyndicatedAssets_helperResult_error_completionHandler___block_invoke_211(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 4;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

id __125__PXContentSyndicationAssetSavingHelper__handleAlertResponseForUnsavedSyndicatedAssets_helperResult_error_completionHandler___block_invoke_212(int a1, id a2)
{
  return a2;
}

- (PXContentSyndicationAssetSavingHelper)initWithAssetCollection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"PXContentSyndicationAssetSavingHelper.m", 53, @"%@ requires a non-nil asset collection", v11 object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PXContentSyndicationAssetSavingHelper;
  id v7 = [(PXContentSyndicationAssetSavingHelper *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_assetCollection, a3);
    *(_WORD *)&v8->_userCanContinueAfterSavingSyndicatedAssets = 257;
  }

  return v8;
}

+ (id)assetSavingHelperFromAssetCollectionActionPerformer:(id)a3
{
  id v5 = a3;
  id v6 = [v5 assetCollectionReference];
  id v7 = [v6 assetCollection];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, a1, @"PXContentSyndicationAssetSavingHelper.m", 44, @"%@ should be an instance inheriting from %@, but it is %@", @"actionPerformer.assetCollectionReference.assetCollection", v13, v15 object file lineNumber description];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, a1, @"PXContentSyndicationAssetSavingHelper.m", 44, @"%@ should be an instance inheriting from %@, but it is nil", @"actionPerformer.assetCollectionReference.assetCollection", v13 object file lineNumber description];
  }

LABEL_3:
  id v8 = [[PXContentSyndicationAssetSavingHelper alloc] initWithAssetCollection:v7];
  unint64_t v9 = [v5 presentationEnvironment];

  [(PXContentSyndicationAssetSavingHelper *)v8 setPresentationEnvironment:v9];
  [(PXContentSyndicationAssetSavingHelper *)v8 setUserCanContinueAfterSavingSyndicatedAssets:0];
  [(PXContentSyndicationAssetSavingHelper *)v8 setAllowSkippingUnsavedAssets:0];

  return v8;
}

@end