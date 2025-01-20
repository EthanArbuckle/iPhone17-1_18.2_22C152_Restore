@interface PUAddToAlbumActivity
+ (BOOL)canPerformWithItemSourceController:(id)a3;
+ (int64_t)activityCategory;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSArray)selectedAssets;
- (id)_albumPickerViewControllerWithAssets:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)setSelectedAssets:(id)a3;
@end

@implementation PUAddToAlbumActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAssets, 0);
  objc_destroyWeak((id *)&self->_presenterViewController);
}

- (void)setSelectedAssets:(id)a3
{
}

- (NSArray)selectedAssets
{
  return self->_selectedAssets;
}

- (void)performActivity
{
  v3 = [(PXActivity *)self itemSourceController];
  v4 = [v3 assets];
  v5 = [v4 array];

  v6 = [(PUAddToAlbumActivity *)self _albumPickerViewControllerWithAssets:v5];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);
    objc_msgSend(WeakRetained, "px_presentOverTopmostPresentedViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Share Sheet: Failed to create album picker for adding assets to album.", v9, 2u);
    }

    [(UIActivity *)self activityDidFinish:0];
  }
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v4 = objc_opt_class();
  v5 = [(PXActivity *)self itemSourceController];
  LOBYTE(v4) = [v4 canPerformWithItemSourceController:v5];

  return (char)v4;
}

- (id)_systemImageName
{
  return @"rectangle.stack.badge.plus";
}

- (id)activityTitle
{
  return PULocalizedString(@"ADD_TO_ALBUM_ACTIVITY");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90928];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    v6 = [(PUAddToAlbumActivity *)self selectedAssets];
    v7 = [v6 firstObject];
    v8 = [v7 photoLibrary];
    v9 = [v8 librarySpecificFetchOptions];

    v10 = [v5 firstObject];
    v11 = [v10 itemIdentifier];

    v12 = (void *)MEMORY[0x1E4F38EE8];
    v26[0] = v11;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    v14 = [v12 fetchAssetCollectionsWithLocalIdentifiers:v13 options:v9];
    v15 = [v14 firstObject];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);
    v17 = [WeakRetained undoManager];

    if (v15)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F8FF60]);
      v19 = [(PUAddToAlbumActivity *)self selectedAssets];
      v20 = (void *)[v18 initWithAssets:v19 assetCollection:v15];

      [v20 setShouldSortAssetsByCreationDate:1];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __48__PUAddToAlbumActivity_picker_didFinishPicking___block_invoke;
      v24[3] = &unk_1E5F2D4B8;
      v24[4] = self;
      id v25 = v15;
      [v20 executeWithUndoManager:v17 completionHandler:v24];
    }
  }
  else
  {
    v15 = 0;
  }
  id v21 = objc_loadWeakRetained((id *)&self->_presenterViewController);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48__PUAddToAlbumActivity_picker_didFinishPicking___block_invoke_198;
  v22[3] = &unk_1E5F2E120;
  v22[4] = self;
  BOOL v23 = v15 != 0;
  [v21 dismissViewControllerAnimated:1 completion:v22];
}

void __48__PUAddToAlbumActivity_picker_didFinishPicking___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [*(id *)(a1 + 32) selectedAssets];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "failed adding assets to album: %@ %@ %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

uint64_t __48__PUAddToAlbumActivity_picker_didFinishPicking___block_invoke_198(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:*(unsigned __int8 *)(a1 + 40)];
}

- (id)_albumPickerViewControllerWithAssets:(id)a3
{
  id v4 = a3;
  [(PUAddToAlbumActivity *)self setSelectedAssets:v4];
  id v5 = +[PUPickerUtilities pickerConfigurationForAddToAlbumWithAssetsToAdd:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v5];
  [v6 setDelegate:self];
  id v7 = v6;
  [v7 setModalInPresentation:1];

  return v7;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  p_presenterViewController = &self->_presenterViewController;
  id v9 = a5;
  id v10 = a3;
  objc_storeWeak((id *)p_presenterViewController, v10);
  v12.receiver = self;
  v12.super_class = (Class)PUAddToAlbumActivity;
  LOBYTE(v5) = [(PXActivity *)&v12 _presentActivityOnViewController:v10 animated:v5 completion:v9];

  return v5;
}

+ (int64_t)activityCategory
{
  return 0;
}

+ (BOOL)canPerformWithItemSourceController:(id)a3
{
  id v3 = a3;
  if ([v3 isPreparingIndividualItems])
  {
    id v4 = [v3 assets];
    BOOL v5 = [v4 indexOfObjectPassingTest:&__block_literal_global_4756] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL __59__PUAddToAlbumActivity_canPerformWithItemSourceController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 sourceType];
  return v2 == 2 || v2 == 8;
}

@end