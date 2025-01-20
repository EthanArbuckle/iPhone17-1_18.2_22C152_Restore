@interface PXSearchResultsSectionedDataSourceManager
- (BOOL)isIndexingPaused;
- (BOOL)queryHasChanged:(id)a3 maxSuggestionCount:(int64_t)a4;
- (BOOL)resultsReady;
- (NSDictionary)debugDictionary;
- (PHCachingImageManager)cachingImageManager;
- (PSIDatabase)psiSearchIndex;
- (PXSearchActiveSearch)activeSearch;
- (PXSearchResultsSectionedDataSource)searchResultsDataSource;
- (PXSearchResultsSectionedDataSourceChangeObserver)delegate;
- (PXSearchResultsSectionedDataSourceManager)initWithSearchSectionedDataSource:(id)a3;
- (unint64_t)itemsRemainingCount;
- (void)dealloc;
- (void)mergePendingChanges;
- (void)prepareDataSourceWithCompletion:(id)a3;
- (void)searchResultsDataSource:(id)a3 didChangeThumbnailAssetsForSearchResult:(id)a4 atIndexes:(id)a5;
- (void)searchResultsDataSource:(id)a3 didChangeThumbnailAssetsForSearchResult:(id)a4 topAssetsSectionExists:(BOOL)a5;
- (void)searchResultsDataSource:(id)a3 didFetchAssetsForSearchResult:(id)a4 indexPath:(id)a5;
- (void)searchResultsDataSourceHasPendingChanges:(id)a3 shouldMergePendingChanges:(BOOL)a4;
- (void)setActiveSearch:(id)a3;
- (void)setCachingImageManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsIndexingPaused:(BOOL)a3;
- (void)setItemsRemainingCount:(unint64_t)a3;
- (void)setPsiSearchIndex:(id)a3;
- (void)setSearchResultsDataSource:(id)a3;
@end

@implementation PXSearchResultsSectionedDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psiSearchIndex, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchResultsDataSource, 0);
  objc_storeStrong((id *)&self->_cachingImageManager, 0);
  objc_storeStrong((id *)&self->_activeSearch, 0);
}

- (void)setPsiSearchIndex:(id)a3
{
}

- (PSIDatabase)psiSearchIndex
{
  return self->_psiSearchIndex;
}

- (void)setDelegate:(id)a3
{
}

- (PXSearchResultsSectionedDataSourceChangeObserver)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSearchResultsSectionedDataSourceChangeObserver *)WeakRetained;
}

- (void)setItemsRemainingCount:(unint64_t)a3
{
  self->_itemsRemainingCount = a3;
}

- (unint64_t)itemsRemainingCount
{
  return self->_itemsRemainingCount;
}

- (void)setIsIndexingPaused:(BOOL)a3
{
  self->_isIndexingPaused = a3;
}

- (BOOL)isIndexingPaused
{
  return self->_isIndexingPaused;
}

- (void)setSearchResultsDataSource:(id)a3
{
}

- (PXSearchResultsSectionedDataSource)searchResultsDataSource
{
  return self->_searchResultsDataSource;
}

- (void)setCachingImageManager:(id)a3
{
}

- (PHCachingImageManager)cachingImageManager
{
  return self->_cachingImageManager;
}

- (void)setActiveSearch:(id)a3
{
}

- (PXSearchActiveSearch)activeSearch
{
  return self->_activeSearch;
}

- (NSDictionary)debugDictionary
{
  v2 = [(PXSearchResultsSectionedDataSourceManager *)self searchResultsDataSource];
  v3 = [v2 debugDictionary];

  return (NSDictionary *)v3;
}

- (void)dealloc
{
  v3 = [(PXSearchResultsSectionedDataSourceManager *)self searchResultsDataSource];
  [v3 setChangeObserver:0];

  v4 = [(PXSearchResultsSectionedDataSourceManager *)self searchResultsDataSource];
  [v4 cancel];

  v5.receiver = self;
  v5.super_class = (Class)PXSearchResultsSectionedDataSourceManager;
  [(PXSearchResultsSectionedDataSourceManager *)&v5 dealloc];
}

- (void)searchResultsDataSource:(id)a3 didChangeThumbnailAssetsForSearchResult:(id)a4 atIndexes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PXSearchResultsSectionedDataSourceManager *)self delegate];
  [v11 searchResultsDataSource:v10 didChangeThumbnailAssetsForSearchResult:v9 atIndexes:v8];
}

- (void)searchResultsDataSourceHasPendingChanges:(id)a3 shouldMergePendingChanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PXSearchResultsSectionedDataSourceManager *)self delegate];
  [v7 searchResultsDataSourceHasPendingChanges:v6 shouldMergePendingChanges:v4];
}

- (void)searchResultsDataSource:(id)a3 didFetchAssetsForSearchResult:(id)a4 indexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PXSearchResultsSectionedDataSourceManager *)self delegate];
  [v11 searchResultsDataSource:v10 didFetchAssetsForSearchResult:v9 indexPath:v8];
}

- (void)searchResultsDataSource:(id)a3 didChangeThumbnailAssetsForSearchResult:(id)a4 topAssetsSectionExists:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PXSearchResultsSectionedDataSourceManager *)self delegate];
  [v10 searchResultsDataSource:v9 didChangeThumbnailAssetsForSearchResult:v8 topAssetsSectionExists:v5];
}

- (BOOL)queryHasChanged:(id)a3 maxSuggestionCount:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PXSearchResultsSectionedDataSourceManager *)self activeSearch];
  char v8 = [v7 isEqual:v6];

  if ((v8 & 1) == 0)
  {
    [(PXSearchResultsSectionedDataSourceManager *)self setActiveSearch:v6];
    id v9 = [(PXSearchResultsSectionedDataSourceManager *)self searchResultsDataSource];
    id v10 = [v6 searchText];
    id v11 = [v6 representedObjects];
    v12 = [v6 priorityAssetUUID];
    objc_msgSend(v9, "setSearchString:representedObjects:maxSuggestionCount:priorityAssetUUID:libraryScope:", v10, v11, a4, v12, objc_msgSend(v6, "libraryScope"));
  }
  return v8 ^ 1;
}

- (BOOL)resultsReady
{
  v2 = [(PXSearchResultsSectionedDataSourceManager *)self searchResultsDataSource];
  char v3 = [v2 resultsReady];

  return v3;
}

- (void)mergePendingChanges
{
  id v2 = [(PXSearchResultsSectionedDataSourceManager *)self searchResultsDataSource];
  [v2 mergePendingChanges];
}

- (void)prepareDataSourceWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  [(PXSearchResultsSectionedDataSourceManager *)self setCachingImageManager:v5];

  id v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v7 = [v6 searchIndex];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PXSearchResultsSectionedDataSourceManager_prepareDataSourceWithCompletion___block_invoke;
  v10[3] = &unk_1E5DBEA98;
  v10[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  [v7 preWarmSearchIndexSynchronously:0 completion:v10];
}

uint64_t __77__PXSearchResultsSectionedDataSourceManager_prepareDataSourceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setPsiSearchIndex:a2];
    char v3 = [PXSearchResultsSectionedDataSource alloc];
    id v4 = [*(id *)(a1 + 32) psiSearchIndex];
    BOOL v5 = [*(id *)(a1 + 40) photoLibrary];
    id v6 = [(PXSearchResultsSectionedDataSource *)v3 initWithSearchIndex:v4 photoLibrary:v5];
    [*(id *)(a1 + 32) setSearchResultsDataSource:v6];

    id v7 = [*(id *)(a1 + 32) searchResultsDataSource];
    [v7 setChangeObserver:*(void *)(a1 + 32)];

    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 32) searchResultsDataSource];
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v9 != 0);
  }
  id v10 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v10();
}

- (PXSearchResultsSectionedDataSourceManager)initWithSearchSectionedDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXSearchResultsSectionedDataSourceManager;
  BOOL v5 = [(PXSearchResultsSectionedDataSourceManager *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(PXSearchResultsSectionedDataSourceManager *)v5 setSearchResultsDataSource:v4];
  }

  return v6;
}

@end