@interface PXMemoriesFeedWidgetDataSourceManager
- (BOOL)onlyFavorites;
- (id)_generateEntryFromMemories:(id)a3;
- (id)fetchOptions;
- (unint64_t)_extendedMaxCount;
- (unint64_t)maxCount;
- (void)_regenerateMemoriesWithChange:(id)a3;
- (void)handleChangedKeyAssetsForMemories:(id)a3;
- (void)handleIncrementalFetchResultChange:(id)a3 updatedFetchResultsForMemoriesWithChangedKeyAssets:(id)a4;
- (void)handleNonIncrementalFetchResultChange:(id)a3;
- (void)setMaxCount:(unint64_t)a3;
- (void)setOnlyFavorites:(BOOL)a3;
- (void)startGeneratingMemories;
@end

@implementation PXMemoriesFeedWidgetDataSourceManager

- (void)setOnlyFavorites:(BOOL)a3
{
  self->_onlyFavorites = a3;
}

- (BOOL)onlyFavorites
{
  return self->_onlyFavorites;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (void)handleChangedKeyAssetsForMemories:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = PLMemoriesGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134217984;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "[Widget] Handling updates to key assets: %lu.", (uint8_t *)&v7, 0xCu);
    }

    [(PXMemoriesFeedWidgetDataSourceManager *)self _regenerateMemoriesWithChange:0];
  }
}

- (void)handleNonIncrementalFetchResultChange:(id)a3
{
  uint64_t v4 = [a3 fetchResultAfterChanges];
  uint64_t v5 = [(PXMemoriesFeedDataSourceManagerBase *)self memoriesFetchResult];

  if (v4 != v5)
  {
    v6 = PLMemoriesGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "[Widget] Handling non-incremental update.", v7, 2u);
    }

    [(PXMemoriesFeedDataSourceManagerBase *)self setMemoriesFetchResult:v4];
    [(PXMemoriesFeedWidgetDataSourceManager *)self _regenerateMemoriesWithChange:0];
  }
}

- (void)handleIncrementalFetchResultChange:(id)a3 updatedFetchResultsForMemoriesWithChangedKeyAssets:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PXMemoriesFeedDataSourceManagerBase *)self memoriesFetchResult];
  uint64_t v9 = [v7 changeDetailsForFetchResult:v8];

  uint64_t v10 = [v6 count];
  v11 = [v9 fetchResultAfterChanges];
  if (v10
    || ([(PXMemoriesFeedDataSourceManagerBase *)self memoriesFetchResult],
        v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11 != v12))
  {
    v13 = PLMemoriesGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134217984;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEBUG, "[Widget] Handling incremental update. Key assets changed: %lu.", (uint8_t *)&v14, 0xCu);
    }

    [(PXMemoriesFeedDataSourceManagerBase *)self setMemoriesFetchResult:v11];
    [(PXMemoriesFeedWidgetDataSourceManager *)self _regenerateMemoriesWithChange:v9];
  }
}

- (void)setMaxCount:(unint64_t)a3
{
  if (self->_maxCount != a3)
  {
    self->_maxCount = a3;
    [(PXMemoriesFeedDataSourceManagerBase *)self resetMemoriesFetchResult];
    [(PXMemoriesFeedWidgetDataSourceManager *)self _regenerateMemoriesWithChange:0];
  }
}

- (void)_regenerateMemoriesWithChange:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(PXMemoriesFeedWidgetDataSourceManager *)self maxCount]) {
    goto LABEL_21;
  }
  uint64_t v5 = [(PXMemoriesFeedDataSourceManagerBase *)self memoriesFetchResult];
  v25 = v5;
  if ([v5 count])
  {
    id v6 = [(PXMemoriesFeedWidgetDataSourceManager *)self _generateEntryFromMemories:v5];
    id v7 = [PXMemoriesFeedDataSource alloc];
    v28[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    uint64_t v9 = [(PXMemoriesFeedDataSource *)v7 initWithEntries:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(PXSectionedDataSourceManager *)self dataSource];
  if ([v10 numberOfSections]) {
    BOOL v11 = [(PXMemoriesFeedDataSource *)v9 numberOfSections] == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if ([v10 numberOfSections]) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = [(PXMemoriesFeedDataSource *)v9 numberOfSections] != 0;
  }
  if (v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    if (!v12)
    {
LABEL_14:
      uint64_t v14 = 0;
LABEL_17:
      uint64_t v15 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v4];
      if ([v15 hasAnyChanges]) {
        [MEMORY[0x1E4F28D60] indexSet];
      }
      else {
      uint64_t v16 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
      }
      v17 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v13 insertedIndexes:v14 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v16];
      id v18 = objc_alloc((Class)off_1E5DA8488);
      v23 = (void *)v13;
      v24 = v10;
      uint64_t v19 = [v10 identifier];
      v20 = (void *)v14;
      uint64_t v21 = [(PXMemoriesFeedDataSource *)v9 identifier];
      v26 = &unk_1F02D8440;
      v27 = v15;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      [v18 initWithFromDataSourceIdentifier:v19 toDataSourceIdentifier:v21 sectionChanges:v17 itemChangeDetailsBySection:v22 subitemChangeDetailsByItemBySection:0];

      [v25 count];
LABEL_21:
      px_dispatch_on_main_queue();
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (!v12) {
      goto LABEL_14;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  goto LABEL_17;
}

uint64_t __71__PXMemoriesFeedWidgetDataSourceManager__regenerateMemoriesWithChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFirstUngroupedMemoryIndex:*(void *)(a1 + 40)];
}

- (id)_generateEntryFromMemories:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLMemoriesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = [v4 count];
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[Widget] Generate a feed entry from %lu memories...", buf, 0xCu);
  }

  id v6 = objc_msgSend((id)objc_opt_class(), "generateEntriesFromMemories:startingFromIndex:maximumNumberOfEntries:finalMemoryIndex:", v4, 0, -[PXMemoriesFeedWidgetDataSourceManager _extendedMaxCount](self, "_extendedMaxCount"), 0);
  unint64_t v7 = [(PXMemoriesFeedWidgetDataSourceManager *)self maxCount];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __68__PXMemoriesFeedWidgetDataSourceManager__generateEntryFromMemories___block_invoke;
  v17 = &unk_1E5DBE500;
  id v9 = v8;
  id v18 = v9;
  unint64_t v19 = v7;
  [v6 enumerateObjectsUsingBlock:&v14];
  uint64_t v10 = [PXMemoryEntryInfo alloc];
  BOOL v11 = -[PXMemoryEntryInfo initWithSortedMemories:](v10, "initWithSortedMemories:", v9, v14, v15, v16, v17);
  BOOL v12 = PLMemoriesGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = (uint64_t)v11;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "[Widget] Generated feed entry: %@", buf, 0xCu);
  }

  return v11;
}

void __68__PXMemoriesFeedWidgetDataSourceManager__generateEntryFromMemories___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 memories];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PXMemoriesFeedWidgetDataSourceManager__generateEntryFromMemories___block_invoke_2;
  v6[3] = &unk_1E5DBE4D8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 enumerateObjectsUsingBlock:v6];
}

void __68__PXMemoriesFeedWidgetDataSourceManager__generateEntryFromMemories___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 40)) {
    *a4 = 1;
  }
  else {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (void)startGeneratingMemories
{
  v3.receiver = self;
  v3.super_class = (Class)PXMemoriesFeedWidgetDataSourceManager;
  [(PXMemoriesFeedDataSourceManagerBase *)&v3 startGeneratingMemories];
  [(PXMemoriesFeedWidgetDataSourceManager *)self _regenerateMemoriesWithChange:0];
}

- (id)fetchOptions
{
  v13.receiver = self;
  v13.super_class = (Class)PXMemoriesFeedWidgetDataSourceManager;
  objc_super v3 = [(PXMemoriesFeedDataSourceManagerBase *)&v13 fetchOptions];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PXMemoriesFeedWidgetDataSourceManager_fetchOptions__block_invoke;
  aBlock[3] = &unk_1E5DCDE28;
  id v4 = v3;
  id v12 = v4;
  uint64_t v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  if ([(PXMemoriesFeedWidgetDataSourceManager *)self maxCount]) {
    objc_msgSend(v4, "setFetchLimit:", -[PXMemoriesFeedWidgetDataSourceManager _extendedMaxCount](self, "_extendedMaxCount"));
  }
  [v4 setIncludePendingMemories:1];
  [v4 setFetchLimit:5];
  if (PFOSVariantHasInternalUI())
  {
    id v6 = +[PXMemoriesRelatedSettings sharedInstance];
    int v7 = [v6 showLocalMemories];

    if (v7) {
      [v4 setIncludeLocalMemories:1];
    }
  }
  if ([(PXMemoriesFeedWidgetDataSourceManager *)self onlyFavorites])
  {
    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"favorite == true"];
    v5[2](v5, v8);
  }
  id v9 = v4;

  return v9;
}

void __53__PXMemoriesFeedWidgetDataSourceManager_fetchOptions__block_invoke(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) predicate];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v4;
    v9[1] = v3;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v8 = [v6 andPredicateWithSubpredicates:v7];
    [*(id *)(a1 + 32) setPredicate:v8];
  }
  else
  {
    [*(id *)(a1 + 32) setPredicate:v3];
  }
}

- (unint64_t)_extendedMaxCount
{
  return [(PXMemoriesFeedWidgetDataSourceManager *)self maxCount] + 2;
}

@end