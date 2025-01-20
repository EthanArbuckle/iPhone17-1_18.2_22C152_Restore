@interface PUAssetSharingHelper
+ (void)_prepareAssets:(id)a3 forActivityType:(id)a4 window:(id)a5 completion:(id)a6;
+ (void)copyAssets:(id)a3 completionHandler:(id)a4;
+ (void)prepareAssets:(id)a3 forActivityType:(id)a4 completion:(id)a5;
- (PXAssetsSharingHelperDelegate)delegate;
- (void)_presentViewController:(id)a3;
- (void)copyAssets:(id)a3;
- (void)ensureLocalAssetsForCloudPhotoSharing:(id)a3 completion:(id)a4;
- (void)ensureLocalAssetsForRendering:(id)a3 completion:(id)a4;
- (void)ensureLocalAssetsForSyndicationSave:(id)a3 completion:(id)a4;
- (void)ensureRenderingForAssetsWithDeferredProcessingInCollection:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PUAssetSharingHelper

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (PXAssetsSharingHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXAssetsSharingHelperDelegate *)WeakRetained;
}

- (void)ensureRenderingForAssetsWithDeferredProcessingInCollection:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t))a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"deferredProcessingNeeded != 0"];
  [v8 setInternalPredicate:v9];

  v10 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v8];

  if ([v10 count])
  {
    v11 = [v10 fetchedObjects];
    [(PUAssetSharingHelper *)self ensureLocalAssetsForRendering:v11 completion:v6];
  }
  else
  {
    v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "PUAssetSharingHelper: No assets to render", v13, 2u);
    }

    if (v6) {
      v6[2](v6, 1);
    }
  }
}

- (void)ensureLocalAssetsForRendering:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUAssetSharingHelper *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(PUAssetSharingHelper *)self delegate];
    v11 = [v10 windowForProgressPresentationInAssetsSharingHelper:self];
  }
  else
  {
    v11 = 0;
  }
  uint64_t v12 = *MEMORY[0x1E4F90A98];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PUAssetSharingHelper_ensureLocalAssetsForRendering_completion___block_invoke;
  v15[3] = &unk_1E5F2C398;
  id v16 = v6;
  v17 = self;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  +[PUAssetSharingHelper _prepareAssets:v14 forActivityType:v12 window:v11 completion:v15];
}

void __65__PUAssetSharingHelper_ensureLocalAssetsForRendering_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Render: Will show \"Unable to render\" dialogue. Reported error: %@", buf, 0xCu);
    }

    v8 = objc_msgSend(NSString, "stringWithFormat:", @"Rendering %ld assets:\n\n", objc_msgSend(*(id *)(a1 + 32), "count"));
    char v9 = [PUSharingErrorPresentationController alloc];
    id v15 = v6;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    v11 = [(PUSharingErrorPresentationController *)v9 initWithErrors:v10 forAssets:*(void *)(a1 + 32) fromSource:5 preparationType:0];

    [(PUErrorPresentationController *)v11 setRadarDescription:v8];
    [(PUErrorPresentationController *)v11 setRadarComponentID:@"428725" name:@"Photos Backend Storage" version:@"iOS"];
    uint64_t v12 = [(PUErrorPresentationController *)v11 alertControllerWithCompletion:0];
    id v13 = [*(id *)(a1 + 40) delegate];
    [v13 assetsSharingHelper:*(void *)(a1 + 40) presentViewController:v12];
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, v5 != 0);
  }
}

- (void)ensureLocalAssetsForSyndicationSave:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F90B20];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PUAssetSharingHelper_ensureLocalAssetsForSyndicationSave_completion___block_invoke;
  v11[3] = &unk_1E5F2C3C0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  +[PUAssetSharingHelper prepareAssets:v10 forActivityType:v8 completion:v11];
}

void __71__PUAssetSharingHelper_ensureLocalAssetsForSyndicationSave_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Syndication Save: Will show \"Unable to share\" dialogue. Reported error: %{public}@", buf, 0xCu);
    }

    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Saving %ld syndicated assets:\n\n", objc_msgSend(*(id *)(a1 + 32), "count"));
    id v9 = [PUSharingErrorPresentationController alloc];
    id v15 = v6;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    v11 = [(PUSharingErrorPresentationController *)v9 initWithErrors:v10 forAssets:*(void *)(a1 + 32) fromSource:4 preparationType:0];

    [(PUErrorPresentationController *)v11 setRadarDescription:v8];
    [(PUErrorPresentationController *)v11 setRadarComponentID:@"512768" name:@"Photos Backend (New Bugs)" version:@"all"];
    id v12 = [(PUErrorPresentationController *)v11 alertControllerWithCompletion:0];
    id v13 = [*(id *)(a1 + 40) delegate];
    [v13 assetsSharingHelper:*(void *)(a1 + 40) presentViewController:v12];
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, v5 != 0);
  }
}

- (void)ensureLocalAssetsForCloudPhotoSharing:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F90950];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PUAssetSharingHelper_ensureLocalAssetsForCloudPhotoSharing_completion___block_invoke;
  v11[3] = &unk_1E5F2C398;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  +[PUAssetSharingHelper prepareAssets:v10 forActivityType:v8 completion:v11];
}

void __73__PUAssetSharingHelper_ensureLocalAssetsForCloudPhotoSharing_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v6;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Shared Albums: Will show \"Unable to share\" dialogue. Reported error: %{public}@", buf, 0xCu);
    }

    uint64_t v8 = NSString;
    uint64_t v9 = [*(id *)(a1 + 32) count];
    id v10 = [v8 stringWithFormat:@"Sharing %ld assets to activity type %@ from within shared album:\n\n", v9, *MEMORY[0x1E4F90950]];
    v11 = [PUSharingErrorPresentationController alloc];
    id v17 = v6;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    id v13 = [(PUSharingErrorPresentationController *)v11 initWithErrors:v12 forAssets:*(void *)(a1 + 32) fromSource:1 preparationType:0];

    [(PUErrorPresentationController *)v13 setRadarDescription:v10];
    [(PUErrorPresentationController *)v13 setRadarComponentID:@"512768" name:@"Photos Backend (New Bugs)" version:@"all"];
    id v14 = [(PUErrorPresentationController *)v13 alertControllerWithCompletion:0];
    id v15 = [*(id *)(a1 + 40) delegate];
    [v15 assetsSharingHelper:*(void *)(a1 + 40) presentViewController:v14];
  }
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(uint64_t, BOOL))(v16 + 16))(v16, v5 != 0);
  }
}

- (void)copyAssets:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__PUAssetSharingHelper_copyAssets___block_invoke;
  v3[3] = &unk_1E5F2E3B8;
  v3[4] = self;
  +[PUAssetSharingHelper copyAssets:a3 completionHandler:v3];
}

void __35__PUAssetSharingHelper_copyAssets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    PULocalizedString(@"COPY_TO_PASTEBOARD_PREPARATION_ERROR_TITLE");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v4 = PULocalizedString(@"COPY_TO_PASTEBOARD_PREPARATION_ERROR_MESSAGE");
    id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v4 preferredStyle:1];
    id v6 = (void *)MEMORY[0x1E4FB1410];
    id v7 = PULocalizedString(@"OK");
    uint64_t v8 = [v6 actionWithTitle:v7 style:0 handler:&__block_literal_global_90093];
    [v5 addAction:v8];

    [*(id *)(a1 + 32) _presentViewController:v5];
  }
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAssetSharingHelper *)self delegate];
  [v5 assetsSharingHelper:self presentViewController:v4];
}

+ (void)_prepareAssets:(id)a3 forActivityType:(id)a4 window:(id)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 count])
  {
    id v13 = objc_alloc_init(PUActivityItemSourceController);
    id v14 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v9];
    id v15 = +[PUActivityAssetItem itemsForAssets:v14];

    uint64_t v16 = *MEMORY[0x1E4F9F360];
    if ([v10 isEqualToString:*MEMORY[0x1E4F9F360]]
      && _os_feature_enabled_impl()
      && PLIsLockdownMode())
    {
      id v32 = v11;
      id v17 = PLUIGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "Lockdown mode is enabled, excluding location and caption metadata by default.", buf, 2u);
      }

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v31 = v15;
      id v18 = v15;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v41 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            objc_msgSend(v23, "setExcludeLocation:", 1, v31);
            [v23 setExcludeCaption:1];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v20);
      }

      id v15 = v31;
      id v11 = v32;
    }
    -[PUActivityItemSourceController setAssetItems:](v13, "setAssetItems:", v15, v31);
    id v24 = objc_alloc_init(MEMORY[0x1E4F8FF50]);
    v25 = v24;
    if (v11) {
      [v24 setWindow:v11];
    }
    if ([v10 isEqualToString:v16])
    {
      v26 = @"COPY_TO_PASTEBOARD_PREPARATION_TITLE";
    }
    else if ([v10 isEqualToString:*MEMORY[0x1E4F90950]])
    {
      v26 = @"POST_TO_SHARED_ALBUM_PREPARATION_TITLE";
    }
    else if ([v10 isEqualToString:*MEMORY[0x1E4F90B20]])
    {
      v26 = @"SYNDICATION_SAVE_PREPARATION_TITLE";
    }
    else if ([v10 isEqualToString:*MEMORY[0x1E4F90A98]])
    {
      v26 = @"RENDER_PREPARATION_TITLE";
    }
    else
    {
      v26 = @"SHARING_PREPARATION_TITLE";
    }
    v27 = PULocalizedString(v26);
    [v25 setTitle:v27];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke;
    v38[3] = &unk_1E5F2D8C0;
    id v28 = v25;
    id v39 = v28;
    [(PUActivityItemSourceController *)v13 setProgressHandler:v38];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_3;
    v36[3] = &unk_1E5F2ED10;
    v37 = v13;
    v29 = v13;
    [v28 setCancellationHandler:v36];
    [v28 showAnimated:1 allowDelay:1];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_4;
    v33[3] = &unk_1E5F2C410;
    id v34 = v28;
    id v35 = v12;
    id v30 = v28;
    [(PUActivityItemSourceController *)v29 runExplicitly:1 withActivityType:v10 completionHandler:v33];
  }
  else if (v12)
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

void __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke(uint64_t a1, double a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_2;
  v3[3] = &unk_1E5F2E0A8;
  id v4 = *(id *)(a1 + 32);
  double v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_4(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_5;
  block[3] = &unk_1E5F2C3E8;
  id v13 = v8;
  char v17 = a3;
  id v14 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v15 = v7;
  id v16 = v9;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_5(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = *(unsigned char *)(a1 + 64) == 0;
  }
  [*(id *)(a1 + 40) hideAnimated:1 allowDelay:v2];
  if (*(void *)(a1 + 56))
  {
    uint64_t v3 = [*(id *)(a1 + 32) firstObject];
    if (v2) {
      uint64_t v4 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = (id)v3;
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v4);
  }
}

uint64_t __73__PUAssetSharingHelper__prepareAssets_forActivityType_window_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFractionCompleted:*(double *)(a1 + 40)];
}

+ (void)prepareAssets:(id)a3 forActivityType:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [(id)objc_opt_class() _prepareAssets:v9 forActivityType:v8 window:0 completion:v7];
}

+ (void)copyAssets:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F9F360];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PUAssetSharingHelper_copyAssets_completionHandler___block_invoke;
  v8[3] = &unk_1E5F2C370;
  id v9 = v5;
  id v7 = v5;
  +[PUAssetSharingHelper prepareAssets:a3 forActivityType:v6 completion:v8];
}

void __53__PUAssetSharingHelper_copyAssets_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v6 setItemProviders:v8];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, v8 != 0, v5);
  }
}

@end