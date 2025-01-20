@interface PXStoryMemoryFeedDataSourceManager
- (BOOL)hasAnyFavorites;
- (BOOL)hasAnyMemories;
- (BOOL)isActive;
- (BOOL)wantsFavoritesOnly;
- (PHPhotoLibrary)photoLibrary;
- (PXFetchResultBasedMemoriesDataSourceManager)allMemoriesDataSourceManager;
- (PXFetchResultBasedMemoriesDataSourceManager)favoriteMemoriesDataSourceManager;
- (PXLibraryFilterState)libraryFilterState;
- (PXStoryMemoryFeedDataSourceManager)init;
- (PXStoryMemoryFeedDataSourceManager)initWithPhotoLibrary:(id)a3;
- (PXUpdater)updater;
- (id)createInitialDataSource;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (void)_invalidateChildDataSourceManagers;
- (void)_invalidateDataSource;
- (void)_invalidateHasAnyFavorites;
- (void)_setDataSourceToEmpty;
- (void)_setNeedsUpdate;
- (void)_updateChildDataSourceManagers;
- (void)_updateDataSource;
- (void)_updateHasAnyFavorites;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)preferencesDidChange;
- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3;
- (void)setHasAnyFavorites:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setWantsFavoritesOnly:(BOOL)a3;
@end

@implementation PXStoryMemoryFeedDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_favoriteMemoriesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_allMemoriesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXFetchResultBasedMemoriesDataSourceManager)favoriteMemoriesDataSourceManager
{
  return self->_favoriteMemoriesDataSourceManager;
}

- (PXFetchResultBasedMemoriesDataSourceManager)allMemoriesDataSourceManager
{
  return self->_allMemoriesDataSourceManager;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)wantsFavoritesOnly
{
  return self->_wantsFavoritesOnly;
}

- (BOOL)hasAnyFavorites
{
  return self->_hasAnyFavorites;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PXStoryMemoryFeedDataSourceManager_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5DCDE50;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  [(PXStoryMemoryFeedDataSourceManager *)self performChanges:v5];
}

void __67__PXStoryMemoryFeedDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == AllMemoriesDataSourceManagerObservationContext)
  {
    if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
      goto LABEL_13;
    }
    id v8 = v3;
    [*(id *)(a1 + 32) _invalidateDataSource];
    goto LABEL_12;
  }
  if (v4 == FavoriteMemoriesDataSourceManagerObservationContext)
  {
    if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
      goto LABEL_13;
    }
    v6 = *(void **)(a1 + 32);
    id v8 = v3;
    goto LABEL_11;
  }
  if (v4 != PXLibraryFilterStateObservationContext_264989)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXStoryMemoryFeedDataSourceManager.m" lineNumber:249 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v8 = v3;
    [*(id *)(a1 + 32) _invalidateChildDataSourceManagers];
    int v5 = [*(id *)(a1 + 32) isActive];
    id v3 = v8;
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
LABEL_11:
      [v6 _invalidateDataSource];
      [*(id *)(a1 + 32) _invalidateHasAnyFavorites];
LABEL_12:
      id v3 = v8;
    }
  }
LABEL_13:
}

- (void)_updateHasAnyFavorites
{
  id v4 = [(PXStoryMemoryFeedDataSourceManager *)self favoriteMemoriesDataSourceManager];
  id v3 = [v4 dataSource];
  -[PXStoryMemoryFeedDataSourceManager setHasAnyFavorites:](self, "setHasAnyFavorites:", [v3 containsAnyItems]);
}

- (void)_invalidateHasAnyFavorites
{
  id v2 = [(PXStoryMemoryFeedDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateHasAnyFavorites];
}

- (void)_updateDataSource
{
  id v9 = [(PXSectionedDataSourceManager *)self dataSource];
  if ([(PXStoryMemoryFeedDataSourceManager *)self wantsFavoritesOnly]) {
    [(PXStoryMemoryFeedDataSourceManager *)self favoriteMemoriesDataSourceManager];
  }
  else {
  id v3 = [(PXStoryMemoryFeedDataSourceManager *)self allMemoriesDataSourceManager];
  }
  id v4 = [_PXStoryMemoryFeedDataSource alloc];
  int v5 = [v3 dataSource];
  v6 = [(_PXStoryMemoryFeedDataSource *)v4 initWithDataSource:v5];

  if (([(_PXStoryMemoryFeedDataSource *)v6 isEqual:v9] & 1) == 0)
  {
    v7 = [v3 changeHistory];
    id v8 = objc_msgSend(v7, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v9, "identifier"), -[_PXStoryMemoryFeedDataSource identifier](v6, "identifier"));

    [(PXSectionedDataSourceManager *)self setDataSource:v6 changeDetailsArray:v8];
  }
}

- (void)_invalidateDataSource
{
  id v2 = [(PXStoryMemoryFeedDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDataSource];
}

- (void)_updateChildDataSourceManagers
{
  v28[2] = *MEMORY[0x1E4F143B8];
  allMemoriesDataSourceManager = self->_allMemoriesDataSourceManager;
  if (allMemoriesDataSourceManager || self->_favoriteMemoriesDataSourceManager)
  {
    [(PXSectionedDataSourceManager *)allMemoriesDataSourceManager unregisterChangeObserver:self context:AllMemoriesDataSourceManagerObservationContext];
    [(PXSectionedDataSourceManager *)self->_favoriteMemoriesDataSourceManager unregisterChangeObserver:self context:FavoriteMemoriesDataSourceManagerObservationContext];
  }
  id v4 = [(PXStoryMemoryFeedDataSourceManager *)self photoLibrary];
  int v5 = [v4 librarySpecificFetchOptions];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PXStoryMemoryFeedDataSourceManager__updateChildDataSourceManagers__block_invoke;
  aBlock[3] = &unk_1E5DCDE28;
  id v26 = v5;
  id v6 = v5;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"rejected == NO"];
  v7[2](v7, v8);

  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"!(%K = %d && %K = %d)", @"pendingState", 1, @"creationType", 1);
  v7[2](v7, v9);

  [v6 setIncludePendingMemories:1];
  [v6 setIncludeStoryMemories:1];
  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v28[0] = v10;
  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:0];
  v28[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  [v6 setSortDescriptors:v12];

  uint64_t v27 = *MEMORY[0x1E4F397B8];
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  [v6 setFetchPropertySets:v13];

  v14 = +[PXStorySettings sharedInstance];
  objc_msgSend(v6, "setFetchLimit:", objc_msgSend(v14, "feedInitialLimit"));

  v15 = [(PXStoryMemoryFeedDataSourceManager *)self libraryFilterState];
  uint64_t v16 = [v15 viewMode];
  if (v16 == 2) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 2 * (v16 != 1);
  }
  [v6 setSharingFilter:v17];

  v18 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
  v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"favorite == YES"];
  v7[2](v7, v19);

  v20 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
  v21 = [[PXFetchResultBasedMemoriesDataSourceManager alloc] initWithMemoriesFetchResult:v18];
  v22 = self->_allMemoriesDataSourceManager;
  self->_allMemoriesDataSourceManager = v21;

  [(PXSectionedDataSourceManager *)self->_allMemoriesDataSourceManager registerChangeObserver:self context:AllMemoriesDataSourceManagerObservationContext];
  v23 = [[PXFetchResultBasedMemoriesDataSourceManager alloc] initWithMemoriesFetchResult:v20];
  favoriteMemoriesDataSourceManager = self->_favoriteMemoriesDataSourceManager;
  self->_favoriteMemoriesDataSourceManager = v23;

  [(PXSectionedDataSourceManager *)self->_favoriteMemoriesDataSourceManager registerChangeObserver:self context:FavoriteMemoriesDataSourceManagerObservationContext];
}

void __68__PXStoryMemoryFeedDataSourceManager__updateChildDataSourceManagers__block_invoke(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) predicate];
  int v5 = (void *)v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v4;
    v9[1] = v3;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    id v8 = [v6 andPredicateWithSubpredicates:v7];
    [*(id *)(a1 + 32) setPredicate:v8];
  }
  else
  {
    [*(id *)(a1 + 32) setPredicate:v3];
  }
}

- (void)_invalidateChildDataSourceManagers
{
  id v2 = [(PXStoryMemoryFeedDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateChildDataSourceManagers];
}

- (void)_setNeedsUpdate
{
}

- (void)setWantsFavoritesOnly:(BOOL)a3
{
  if (self->_wantsFavoritesOnly != a3)
  {
    self->_wantsFavoritesOnly = a3;
    [(PXStoryMemoryFeedDataSourceManager *)self signalChange:8];
    [(PXStoryMemoryFeedDataSourceManager *)self _invalidateDataSource];
  }
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXStoryMemoryFeedDataSourceManager *)self signalChange:2];
    if (self->_isActive)
    {
      uint64_t v4 = [(PXStoryMemoryFeedDataSourceManager *)self allMemoriesDataSourceManager];
      [v4 startLoadingIfNeeded];

      int v5 = [(PXStoryMemoryFeedDataSourceManager *)self favoriteMemoriesDataSourceManager];
      [v5 startLoadingIfNeeded];

      [(PXStoryMemoryFeedDataSourceManager *)self _invalidateDataSource];
      [(PXStoryMemoryFeedDataSourceManager *)self _invalidateHasAnyFavorites];
    }
  }
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryMemoryFeedDataSourceManager *)self photoLibrary];
  objc_msgSend(v5, "px_endPausingChanges:", v4);
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6 = a4;
  v7 = [(PXStoryMemoryFeedDataSourceManager *)self photoLibrary];
  id v8 = objc_msgSend(v7, "px_beginPausingChangesWithTimeout:identifier:", v6, a3);

  return v8;
}

- (id)createInitialDataSource
{
  return (id)[off_1E5DA8480 emptyDataSource];
}

- (void)_setDataSourceToEmpty
{
  id v3 = [off_1E5DA8480 emptyDataSource];
  [(PXSectionedDataSourceManager *)self setDataSource:v3 changeDetailsArray:0];
}

- (void)preferencesDidChange
{
  if ((PLIsFeaturedContentAllowed() & 1) == 0)
  {
    [(PXStoryMemoryFeedDataSourceManager *)self _setDataSourceToEmpty];
  }
}

- (void)setHasAnyFavorites:(BOOL)a3
{
  if (self->_hasAnyFavorites != a3)
  {
    self->_hasAnyFavorites = a3;
    [(PXStoryMemoryFeedDataSourceManager *)self signalChange:4];
  }
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryMemoryFeedDataSourceManager;
  [(PXStoryMemoryFeedDataSourceManager *)&v4 didPerformChanges];
  id v3 = [(PXStoryMemoryFeedDataSourceManager *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryMemoryFeedDataSourceManager;
  [(PXStoryMemoryFeedDataSourceManager *)&v3 performChanges:a3];
}

- (BOOL)hasAnyMemories
{
  id v2 = [(PXStoryMemoryFeedDataSourceManager *)self allMemoriesDataSourceManager];
  objc_super v3 = [v2 dataSource];
  char v4 = [v3 containsAnyItems];

  return v4;
}

- (PXStoryMemoryFeedDataSourceManager)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMemoryFeedDataSourceManager.m", 71, @"%s is not available as initializer", "-[PXStoryMemoryFeedDataSourceManager init]");

  abort();
}

- (PXStoryMemoryFeedDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryMemoryFeedDataSourceManager;
  id v6 = [(PXSectionedDataSourceManager *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    id v8 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v5];
    id v9 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v8];
    libraryFilterState = v7->_libraryFilterState;
    v7->_libraryFilterState = v9;

    uint64_t v11 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v7 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v11;

    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateChildDataSourceManagers];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateDataSource];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateHasAnyFavorites];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__PXStoryMemoryFeedDataSourceManager_initWithPhotoLibrary___block_invoke;
    v15[3] = &unk_1E5DCDE00;
    v13 = v7;
    uint64_t v16 = v13;
    [(PXStoryMemoryFeedDataSourceManager *)v13 performChanges:v15];
    PXRegisterPreferencesObserver(v13);
    [(PXLibraryFilterState *)v7->_libraryFilterState registerChangeObserver:v13 context:PXLibraryFilterStateObservationContext_264989];
  }
  return v7;
}

uint64_t __59__PXStoryMemoryFeedDataSourceManager_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateChildDataSourceManagers];
}

@end