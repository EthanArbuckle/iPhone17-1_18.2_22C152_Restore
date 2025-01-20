@interface PUMoveAssetsToPersonalLibraryActivity
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_multiContributorConfirmationAlertControllerForAssets:(id)a3 contributorName:(id)a4 completion:(id)a5;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUMoveAssetsToPersonalLibraryActivity

- (void).cxx_destruct
{
}

- (void)performActivity
{
  v4 = [(PXActivity *)self itemSourceController];
  v5 = [v4 assets];

  if (!v5 || ![v5 count])
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = NSStringFromSelector(a2);
    [v21 handleFailureInMethod:a2, self, @"PUMoveAssetsToPersonalLibraryActivity.m", 123, @"Expecting non-empty, non-zero assets in %@", v22 object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke;
  aBlock[3] = &unk_1E5F2E3B8;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_3;
  v29[3] = &unk_1E5F2BE88;
  id v7 = v5;
  id v30 = v7;
  v31 = self;
  SEL v33 = a2;
  id v8 = v6;
  id v32 = v8;
  v9 = (void (**)(void))_Block_copy(v29);
  v10 = [v7 firstObject];
  v11 = [v10 photoLibrary];

  v12 = [MEMORY[0x1E4F90690] sharedLibraryStatusProviderWithPhotoLibrary:v11];
  [v12 hasPreview];
  if (PXSharedLibraryShouldDisplayMoveToPersonalLibraryConfirmation())
  {
    v13 = [v7 array];
    uint64_t v28 = 0;
    PXSharedLibraryGetMoveToPersonalLibraryConfirmationTitleAndMessage();
    id v23 = 0;

    v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v23 preferredStyle:0];
    v15 = (void *)MEMORY[0x1E4FB1410];
    v16 = [(PUMoveAssetsToPersonalLibraryActivity *)self activityTitle];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_274;
    v26[3] = &unk_1E5F2E898;
    v27 = v9;
    v17 = [v15 actionWithTitle:v16 style:0 handler:v26];
    [v14 addAction:v17];

    v18 = (void *)MEMORY[0x1E4FB1410];
    v19 = PXLocalizedString();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_2_275;
    v24[3] = &unk_1E5F2E898;
    id v25 = v8;
    v20 = [v18 actionWithTitle:v19 style:1 handler:v24];
    [v14 addAction:v20];

    [(UIViewController *)self->_presenterViewController px_presentOverTopmostPresentedViewController:v14 animated:1 completion:0];
  }
  else
  {
    v9[2](v9);
  }
}

void __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 activityDidFinish:1];
  }
  else
  {
    v4 = PXLocalizedSharedLibraryString();
    v5 = PXLocalizedSharedLibraryString();
    v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v5 preferredStyle:1];
    id v7 = (void *)MEMORY[0x1E4FB1410];
    id v8 = PXLocalizedString();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_2;
    v10[3] = &unk_1E5F2BF98;
    v10[4] = *(void *)(a1 + 32);
    v9 = [v7 actionWithTitle:v8 style:0 handler:v10];
    [v6 addAction:v9];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "px_presentOverTopmostPresentedViewController:animated:completion:", v6, 1, 0);
  }
}

void __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_3(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  v3 = [*(id *)(a1 + 40) itemSourceController];
  v4 = [v3 assets];
  uint64_t v5 = [v4 count];

  if (v5 != v2)
  {
    v6 = PXAssertGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412290;
      v50 = v28;
      _os_log_error_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Number of original assets changed in %@!", buf, 0xCu);
    }
  }
  id v7 = PXSharedLibraryFetchAssetsContributedByMeFromAssets();
  if (v2 != [v7 count])
  {
    id v8 = PXLocalizedSharedLibraryString();
    v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v8 preferredStyle:0];
    v16 = (void *)MEMORY[0x1E4FB1410];
    v17 = PXLocalizedSharedLibraryString();
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_270;
    v41[3] = &unk_1E5F28798;
    id v42 = v7;
    id v43 = *(id *)(a1 + 48);
    v18 = [v16 actionWithTitle:v17 style:0 handler:v41];
    [v10 addAction:v18];

    v19 = (void *)MEMORY[0x1E4FB1410];
    v20 = PXLocalizedString();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_271;
    v39[3] = &unk_1E5F2E898;
    id v40 = *(id *)(a1 + 48);
    v21 = [v19 actionWithTitle:v20 style:1 handler:v39];
    [v10 addAction:v21];

    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 224), "px_presentOverTopmostPresentedViewController:animated:completion:", v10, 1, 0);
    v11 = v42;
    goto LABEL_28;
  }
  id v8 = [v7 firstObject];
  if (!v8)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v30 = *(void *)(a1 + 56);
    uint64_t v31 = *(void *)(a1 + 40);
    id v32 = (objc_class *)objc_opt_class();
    SEL v33 = NSStringFromClass(v32);
    [v29 handleFailureInMethod:v30, v31, @"PUMoveAssetsToPersonalLibraryActivity.m", 148, @"%@ should be an instance inheriting from %@, but it is nil", @"myAssets.firstObject", v33 object file lineNumber description];
LABEL_31:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v34 = *(void *)(a1 + 56);
    uint64_t v35 = *(void *)(a1 + 40);
    v36 = (objc_class *)objc_opt_class();
    SEL v33 = NSStringFromClass(v36);
    v37 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v29 handleFailureInMethod:v34, v35, @"PUMoveAssetsToPersonalLibraryActivity.m", 148, @"%@ should be an instance inheriting from %@, but it is %@", @"myAssets.firstObject", v33, v37 object file lineNumber description];

    goto LABEL_31;
  }
LABEL_8:
  v9 = [v8 photoLibrary];
  v10 = [v9 librarySpecificFetchOptions];

  v11 = [MEMORY[0x1E4F392E8] fetchContributorsForAssets:v7 options:v10];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [v11 fetchedObjects];
  v14 = [v12 setWithArray:v13];

  if ((unint64_t)[v14 count] < 3)
  {
    if ([v14 count] == 2)
    {
      long long v47 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v44 = 0u;
      id v22 = v14;
      id v23 = (void *)[v22 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v23)
      {
        v38 = v8;
        uint64_t v24 = *(void *)v45;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v45 != v24) {
              objc_enumerationMutation(v22);
            }
            if (([*(id *)(*((void *)&v44 + 1) + 8 * i) isCurrentUser] & 1) == 0)
            {
              id v23 = PXSharedLibraryShortNameForParticipant();
              goto LABEL_25;
            }
          }
          id v23 = (void *)[v22 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v23) {
            continue;
          }
          break;
        }
LABEL_25:
        id v8 = v38;
      }

      v27 = [*(id *)(a1 + 40) _multiContributorConfirmationAlertControllerForAssets:v7 contributorName:v23 completion:*(void *)(a1 + 48)];
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 224), "px_presentOverTopmostPresentedViewController:animated:completion:", v27, 1, 0);
    }
    else
    {
      v26 = PLUIGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_INFO, "Attempting to move all selected assets to personal library. Calling PXSharedLibraryMoveAssetsToPersonalLibrary()", buf, 2u);
      }

      PXSharedLibraryMoveAssetsToPersonalLibrary();
    }
  }
  else
  {
    v15 = [*(id *)(a1 + 40) _multiContributorConfirmationAlertControllerForAssets:v7 contributorName:0 completion:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 224), "px_presentOverTopmostPresentedViewController:animated:completion:", v15, 1, 0);
  }
LABEL_28:
}

uint64_t __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_274(uint64_t a1)
{
  PXSharedLibrarySetDidConfirmMoveToPersonalLibrary();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

uint64_t __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_2_275(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_270()
{
  v0 = PLUIGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1AE9F8000, v0, OS_LOG_TYPE_INFO, "Attempting to move only user's assets to personal library. Calling PXSharedLibraryMoveAssetsToPersonalLibrary()", v2, 2u);
  }

  return PXSharedLibraryMoveAssetsToPersonalLibrary();
}

uint64_t __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_271(uint64_t a1)
{
  uint64_t v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_INFO, "Move to Personal Library canceled.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:0];
}

- (id)_multiContributorConfirmationAlertControllerForAssets:(id)a3 contributorName:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    SEL v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = (objc_class *)objc_opt_class();
    uint64_t v35 = NSStringFromClass(v36);
    v37 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v33 handleFailureInMethod:a2, self, @"PUMoveAssetsToPersonalLibraryActivity.m", 67, @"%@ should be an instance inheriting from %@, but it is %@", @"assets", v35, v37 object file lineNumber description];
  }
  else
  {
    SEL v33 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v34 = (objc_class *)objc_opt_class();
    uint64_t v35 = NSStringFromClass(v34);
    [v33 handleFailureInMethod:a2, self, @"PUMoveAssetsToPersonalLibraryActivity.m", 67, @"%@ should be an instance inheriting from %@, but it is nil", @"assets", v35 object file lineNumber description];
  }

LABEL_3:
  v13 = [v12 fetchedObjects];
  unint64_t v14 = [v12 count];
  v15 = &stru_1F06BE7B8;
  if (v14 > 1) {
    v15 = @"S";
  }
  v16 = v15;
  uint64_t v17 = [v10 length];
  uint64_t v18 = [v12 count];
  if (v17)
  {
    uint64_t v45 = 0;
    v46[0] = 0;
    uint64_t v44 = 0;
    [MEMORY[0x1E4F90488] assetTypeCountsForAssets:v13 photosCount:v46 videosCount:&v45 othersCount:&v44];
    if (v46[0] == v18)
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Photo%@", v16];
    }
    else if (v45 == v18)
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Video%@", v16];
    }
    else
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Item%@", v16];
    v19 = };
    v20 = PXLocalizedSharedLibraryString();
    id v38 = v10;
    v21 = PXLocalizedStringWithValidatedFormat();
  }
  else
  {
    uint64_t v45 = 0;
    v46[0] = 0;
    uint64_t v44 = 0;
    [MEMORY[0x1E4F90488] assetTypeCountsForAssets:v13 photosCount:v46 videosCount:&v45 othersCount:&v44];
    if (v46[0] == v18)
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Photo%@", v16];
    }
    else if (v45 == v18)
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Video%@", v16];
    }
    else
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Item%@", v16];
    v19 = };
    v21 = PXLocalizedSharedLibraryString();
  }
  id v22 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", 0, v21, 0, v38);
  id v23 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v24 = PXLocalizedSharedLibraryString();
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __122__PUMoveAssetsToPersonalLibraryActivity__multiContributorConfirmationAlertControllerForAssets_contributorName_completion___block_invoke;
  v41[3] = &unk_1E5F28798;
  id v42 = v12;
  id v25 = v11;
  id v43 = v25;
  id v26 = v12;
  v27 = [v23 actionWithTitle:v24 style:0 handler:v41];
  [v22 addAction:v27];

  uint64_t v28 = (void *)MEMORY[0x1E4FB1410];
  v29 = PXLocalizedString();
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __122__PUMoveAssetsToPersonalLibraryActivity__multiContributorConfirmationAlertControllerForAssets_contributorName_completion___block_invoke_244;
  v39[3] = &unk_1E5F2E898;
  id v40 = v25;
  id v30 = v25;
  uint64_t v31 = [v28 actionWithTitle:v29 style:1 handler:v39];
  [v22 addAction:v31];

  return v22;
}

uint64_t __122__PUMoveAssetsToPersonalLibraryActivity__multiContributorConfirmationAlertControllerForAssets_contributorName_completion___block_invoke()
{
  v0 = PLUIGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1AE9F8000, v0, OS_LOG_TYPE_INFO, "Attempting to move assets to personal library. Calling PXSharedLibraryMoveAssetsToPersonalLibrary()", v2, 2u);
  }

  return PXSharedLibraryMoveAssetsToPersonalLibrary();
}

uint64_t __122__PUMoveAssetsToPersonalLibraryActivity__multiContributorConfirmationAlertControllerForAssets_contributorName_completion___block_invoke_244(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v4 = [(PXActivity *)self itemSourceController];
  int v5 = [v4 isPreparingIndividualItems];

  if (!v5) {
    return 0;
  }
  v6 = [(PXActivity *)self itemSourceController];
  id v7 = [v6 assets];

  LOBYTE(v6) = PXSharedLibraryCanMoveAssetsToPersonalLibrary();
  return (char)v6;
}

- (id)_systemImageName
{
  return @"person";
}

- (id)activityTitle
{
  return (id)PXLocalizedSharedLibraryString();
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90A68];
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  objc_storeStrong((id *)&self->_presenterViewController, a3);
  id v9 = a3;
  id v10 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PUMoveAssetsToPersonalLibraryActivity;
  LOBYTE(v6) = [(PXActivity *)&v12 _presentActivityOnViewController:v9 animated:v6 completion:v10];

  return v6;
}

@end