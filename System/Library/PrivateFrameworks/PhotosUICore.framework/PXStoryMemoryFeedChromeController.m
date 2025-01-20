@interface PXStoryMemoryFeedChromeController
- (BOOL)isActive;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (PXStoryMemoryFeedChromeController)init;
- (PXStoryMemoryFeedChromeController)initWithViewController:(id)a3 dataSourceManager:(id)a4;
- (PXStoryMemoryFeedDataSourceManager)dataSourceManager;
- (UINavigationItem)navigationItem;
- (void)_handleFavoritesToggleButton:(id)a3;
- (void)_updateChrome;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setIsActive:(BOOL)a3;
@end

@implementation PXStoryMemoryFeedChromeController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXStoryMemoryFeedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (UINavigationItem)navigationItem
{
  return self->_navigationItem;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)DataSourceManagerObservationContext_160285 == a5)
  {
    if ((v6 & 0xC) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if ((void *)PXLibraryFilterStateObservationContext_160286 == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_5:
    id v11 = v9;
    [(PXStoryMemoryFeedChromeController *)self _invalidateChrome];
    id v9 = v11;
    goto LABEL_6;
  }
  if ((void *)PXSharedLibraryStatusProviderObservationContext_160287 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryMemoryFeedChromeController.m" lineNumber:149 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 3) != 0) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_updateChrome
{
  if ([(PXStoryMemoryFeedChromeController *)self isActive])
  {
    v3 = [(PXStoryMemoryFeedChromeController *)self navigationItem];
    v4 = [(PXStoryMemoryFeedChromeController *)self sharedLibraryStatusProvider];
    if ([v4 hasSharedLibraryOrPreview])
    {
      v5 = [(PXStoryMemoryFeedChromeController *)self dataSourceManager];
      int v6 = [v5 wantsFavoritesOnly];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke;
      aBlock[3] = &unk_1E5DD2188;
      id v7 = v5;
      aBlock[4] = v7;
      v8 = _Block_copy(aBlock);
      if (v6) {
        id v9 = @"PXMemoriesFeedFavoritesTitle";
      }
      else {
        id v9 = @"PXMemoriesFeedTitle";
      }
      v10 = PXLocalizedStringFromTable(v9, @"PhotosUICore");
      [v3 setTitle:v10];

      id v11 = [(PXStoryMemoryFeedChromeController *)self libraryFilterState];
      uint64_t v12 = [v4 hasPreview];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_3;
      v21[3] = &unk_1E5DC0538;
      char v22 = v6;
      v21[4] = v7;
      v21[5] = v8;
      id v13 = v8;
      id v14 = v7;
      PXSharedLibraryCreateSwitchLibraryButtonItem(v11, v12, v21);
    }
    v15 = PXLocalizedStringFromTable(@"PXMemoriesFeedTitle", @"PhotosUICore");
    [v3 setTitle:v15];

    v16 = [(PXStoryMemoryFeedChromeController *)self dataSourceManager];
    if ([v16 hasAnyFavorites]
      && (![v16 wantsFavoritesOnly]
        ? (v17 = @"PXMemoriesFeedButtonFavoritesTitle")
        : (v17 = @"PXMemoriesFeedSeeAllButtonTitle"),
          PXLocalizedStringFromTable(v17, @"PhotosUICore"),
          (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v19 = (void *)v18;
      v20 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v18 style:0 target:self action:sel__handleFavoritesToggleButton_];
      [v3 setRightBarButtonItem:v20];
    }
    else
    {
      [v3 setRightBarButtonItem:0];
    }
  }
}

uint64_t __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_2;
  v4[3] = &__block_descriptor_33_e53_v16__0___PXStoryMutableMemoryFeedDataSourceManager__8l;
  char v5 = a2;
  return [v2 performChanges:v4];
}

void __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) hasAnyFavorites])
  {
    v4 = [v3 extraItemsMenuBuilder];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_4;
    v5[3] = &unk_1E5DC0510;
    char v7 = *(unsigned char *)(a1 + 48);
    id v6 = *(id *)(a1 + 40);
    [v4 addSectionWithConfiguration:v5];
  }
}

void __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PXLocalizedStringFromTable(@"PXMemoriesFeedAllMemoriesMenuItemTitle", @"PhotosUICore");
  BOOL v5 = *(unsigned char *)(a1 + 40) == 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_5;
  v10[3] = &unk_1E5DC04E8;
  id v11 = *(id *)(a1 + 32);
  [v3 addItemWithTitle:v4 systemImageName:@"memories" state:v5 options:0 handler:v10];

  id v6 = PXLocalizedStringFromTable(@"PXMemoriesFeedFavoriteMemoriesMenuItemTitle", @"PhotosUICore");
  uint64_t v7 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_6;
  v8[3] = &unk_1E5DC04E8;
  id v9 = *(id *)(a1 + 32);
  [v3 addItemWithTitle:v6 systemImageName:@"heart" state:v7 options:0 handler:v8];
}

uint64_t __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setWantsFavoritesOnly:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXStoryMemoryFeedChromeController *)self _invalidateChrome];
  }
}

- (void)_handleFavoritesToggleButton:(id)a3
{
  id v3 = [(PXStoryMemoryFeedChromeController *)self dataSourceManager];
  [v3 performChanges:&__block_literal_global_160326];
}

void __66__PXStoryMemoryFeedChromeController__handleFavoritesToggleButton___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setWantsFavoritesOnly:", objc_msgSend(v2, "wantsFavoritesOnly") ^ 1);
}

- (PXStoryMemoryFeedChromeController)initWithViewController:(id)a3 dataSourceManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryMemoryFeedChromeController;
  v8 = [(PXStoryMemoryFeedChromeController *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v6 navigationItem];
    navigationItem = v8->_navigationItem;
    v8->_navigationItem = (UINavigationItem *)v9;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v8->_dataSourceManager, a4);
      [(PXSectionedDataSourceManager *)v8->_dataSourceManager registerChangeObserver:v8 context:DataSourceManagerObservationContext_160285];
    }
    id v11 = [(PXStoryMemoryFeedDataSourceManager *)v8->_dataSourceManager photoLibrary];
    uint64_t v12 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v11];
    sharedLibraryStatusProvider = v8->_sharedLibraryStatusProvider;
    v8->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v12;

    [(PXSharedLibraryStatusProvider *)v8->_sharedLibraryStatusProvider registerChangeObserver:v8 context:PXSharedLibraryStatusProviderObservationContext_160287];
    id v14 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v8->_sharedLibraryStatusProvider];
    libraryFilterState = v8->_libraryFilterState;
    v8->_libraryFilterState = v14;

    [(PXLibraryFilterState *)v8->_libraryFilterState registerChangeObserver:v8 context:PXLibraryFilterStateObservationContext_160286];
    [(PXStoryMemoryFeedChromeController *)v8 _invalidateChrome];
  }

  return v8;
}

- (PXStoryMemoryFeedChromeController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMemoryFeedChromeController.m", 35, @"%s is not available as initializer", "-[PXStoryMemoryFeedChromeController init]");

  abort();
}

@end