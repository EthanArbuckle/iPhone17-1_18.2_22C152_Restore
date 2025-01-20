@interface SFTabCollectionSearchController
- (BOOL)applySearchToItems:(id)a3;
- (BOOL)hasEmptyResults;
- (BOOL)isSearching;
- (NSArray)itemsMatchingSearchTerm;
- (NSIndexSet)indexesMatchingSearchTerm;
- (NSString)searchTerm;
- (SFTabCollectionSearchController)init;
- (SFTabCollectionSearchControllerDelegate)delegate;
- (SFTabCollectionSearchControllerItemSource)itemSource;
- (SFTabOverviewSearchBar)searchBar;
- (TabThumbnailCollectionView)tabView;
- (void)beginSearching;
- (void)dealloc;
- (void)endSearching;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemSource:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)setTabView:(id)a3;
- (void)test_setIndexesMatchingSearch:(id)a3;
- (void)updateSearchBarDefaultCancelButtonAnimated:(BOOL)a3;
@end

@implementation SFTabCollectionSearchController

- (SFTabCollectionSearchController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SFTabCollectionSearchController;
  v2 = [(SFTabCollectionSearchController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    searchTerm = v2->_searchTerm;
    v2->_searchTerm = (NSString *)&stru_1F3C268E8;

    v5 = objc_alloc_init(SFTabOverviewSearchBar);
    searchBar = v3->_searchBar;
    v3->_searchBar = v5;

    [(SFTabOverviewSearchBar *)v3->_searchBar setDelegate:v3];
    [(SFTabOverviewSearchBar *)v3->_searchBar addObserver:v3 forKeyPath:@"embeddedInToolbar" options:0 context:kvoContext_0];
    [(SFTabCollectionSearchController *)v3 updateSearchBarDefaultCancelButtonAnimated:0];
    v7 = v3;
  }

  return v3;
}

- (void)dealloc
{
  [(SFTabOverviewSearchBar *)self->_searchBar removeObserver:self forKeyPath:@"embeddedInToolbar" context:kvoContext_0];
  v3.receiver = self;
  v3.super_class = (Class)SFTabCollectionSearchController;
  [(SFTabCollectionSearchController *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)kvoContext_0 == a6 && [v10 isEqual:@"embeddedInToolbar"])
  {
    [(SFTabCollectionSearchController *)self updateSearchBarDefaultCancelButtonAnimated:0];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SFTabCollectionSearchController;
    [(SFTabCollectionSearchController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)beginSearching
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained searchControllerWillBeginSearch:self];
  }
  [(SFTabOverviewSearchBar *)self->_searchBar becomeFirstResponder];
}

- (void)endSearching
{
  [(SFTabOverviewSearchBar *)self->_searchBar resignFirstResponder];
  [(SFTabCollectionSearchController *)self setSearchTerm:&stru_1F3C268E8];
  [(SFTabCollectionSearchController *)self updateSearchBarDefaultCancelButtonAnimated:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained searchControllerDidEndSearch:self];
  }
}

- (void)setSearchTerm:(id)a3
{
  v4 = &stru_1F3C268E8;
  if (a3) {
    v4 = (__CFString *)a3;
  }
  v8 = v4;
  if ((WBSIsEqual() & 1) == 0)
  {
    v5 = (NSString *)[(__CFString *)v8 copy];
    searchTerm = self->_searchTerm;
    self->_searchTerm = v5;

    [(SFTabOverviewSearchBar *)self->_searchBar setText:v8];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSource);
    [WeakRetained searchControllerDidUpdateMatches:self];
  }
}

- (BOOL)isSearching
{
  if ([(NSString *)self->_searchTerm length]) {
    return 1;
  }
  searchBar = self->_searchBar;
  return [(SFTabOverviewSearchBar *)searchBar isFirstResponder];
}

- (BOOL)applySearchToItems:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self->_itemsMatchingSearchTerm;
  BOOL hasEmptyResults = self->_hasEmptyResults;
  if ([(SFTabCollectionSearchController *)self isSearching]
    && [(NSString *)self->_searchTerm length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabView);
    objc_super v9 = [WeakRetained delegate];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __54__SFTabCollectionSearchController_applySearchToItems___block_invoke;
    v28[3] = &unk_1E6D7BDE0;
    id v10 = v9;
    id v29 = v10;
    id v11 = WeakRetained;
    id v30 = v11;
    v31 = self;
    id v12 = [v5 indexesOfObjectsPassingTest:v28];
    indexesMatchingSearchTerm = self->_indexesMatchingSearchTerm;
    self->_indexesMatchingSearchTerm = v12;

    v14 = [v5 objectsAtIndexes:self->_indexesMatchingSearchTerm];
    itemsMatchingSearchTerm = self->_itemsMatchingSearchTerm;
    self->_itemsMatchingSearchTerm = v14;

    v16 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_indexesMatchingSearchTerm;
      v18 = v16;
      uint64_t v19 = [(NSIndexSet *)v17 count];
      uint64_t v20 = [v5 count];
      int v21 = [(NSString *)self->_searchTerm length];
      *(_DWORD *)buf = 134218496;
      uint64_t v33 = v19;
      __int16 v34 = 2048;
      uint64_t v35 = v20;
      __int16 v36 = 1024;
      int v37 = v21;
      _os_log_impl(&dword_1E102C000, v18, OS_LOG_TYPE_DEFAULT, "Update tab overview search with number of matching items: %ld, number of items: %ld, has search text: %d", buf, 0x1Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_itemsMatchingSearchTerm, a3);
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
    v22 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    v23 = self->_indexesMatchingSearchTerm;
    self->_indexesMatchingSearchTerm = v22;
  }
  if ([(NSString *)self->_searchTerm length]) {
    BOOL v24 = [(NSIndexSet *)self->_indexesMatchingSearchTerm count] == 0;
  }
  else {
    BOOL v24 = 0;
  }
  self->_BOOL hasEmptyResults = v24;
  id v25 = objc_loadWeakRetained((id *)&self->_delegate);
  if (hasEmptyResults || self->_hasEmptyResults) && (objc_opt_respondsToSelector()) {
    [v25 searchControllerDidUpdateHasEmptyResults:self];
  }
  char v26 = WBSIsEqual();

  return v26 ^ 1;
}

uint64_t __54__SFTabCollectionSearchController_applySearchToItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) tabCollectionView:*(void *)(a1 + 40) item:a2 matchesSearchText:*(void *)(*(void *)(a1 + 48) + 64)];
}

- (void)updateSearchBarDefaultCancelButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SFTabOverviewSearchBar *)self->_searchBar embeddedInToolbar];
  searchBar = self->_searchBar;
  if (v5)
  {
    if ([(SFTabOverviewSearchBar *)searchBar showsCancelButton])
    {
      v7 = self->_searchBar;
      [(SFTabOverviewSearchBar *)v7 setShowsCancelButton:0 animated:v3];
    }
  }
  else
  {
    if ([(SFTabOverviewSearchBar *)searchBar isFirstResponder])
    {
      if ([(SFTabOverviewSearchBar *)self->_searchBar showsCancelButton]) {
        return;
      }
      [(SFTabOverviewSearchBar *)self->_searchBar setShowsCancelButton:1 animated:v3];
    }
    else
    {
      NSUInteger v8 = [(NSString *)self->_searchTerm length];
      if ((v8 != 0) == [(SFTabOverviewSearchBar *)self->_searchBar showsCancelButton]) {
        return;
      }
      [(SFTabOverviewSearchBar *)self->_searchBar setShowsCancelButton:v8 != 0 animated:v3];
      if (!v8) {
        return;
      }
    }
    objc_msgSend(MEMORY[0x1E4FB1970], "sf_tabMenu");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(SFTabOverviewSearchBar *)self->_searchBar setCancelButtonMenu:v9];
  }
}

- (void)test_setIndexesMatchingSearch:(id)a3
{
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "Edit tab overview search", v7, 2u);
  }
  [(SFTabCollectionSearchController *)self setSearchTerm:v5];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  [(SFTabCollectionSearchController *)self updateSearchBarDefaultCancelButtonAnimated:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained searchControllerDidChangeEditing:self];
  }
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  [(SFTabCollectionSearchController *)self updateSearchBarDefaultCancelButtonAnimated:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained searchControllerDidChangeEditing:self];
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3 = a3;
  v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Tap cancel tab overview search", v5, 2u);
  }
  [v3 resignFirstResponder];
}

- (SFTabCollectionSearchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFTabCollectionSearchControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFTabCollectionSearchControllerItemSource)itemSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSource);
  return (SFTabCollectionSearchControllerItemSource *)WeakRetained;
}

- (void)setItemSource:(id)a3
{
}

- (TabThumbnailCollectionView)tabView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabView);
  return (TabThumbnailCollectionView *)WeakRetained;
}

- (void)setTabView:(id)a3
{
}

- (SFTabOverviewSearchBar)searchBar
{
  return self->_searchBar;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (NSArray)itemsMatchingSearchTerm
{
  return self->_itemsMatchingSearchTerm;
}

- (NSIndexSet)indexesMatchingSearchTerm
{
  return self->_indexesMatchingSearchTerm;
}

- (BOOL)hasEmptyResults
{
  return self->_hasEmptyResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_destroyWeak((id *)&self->_tabView);
  objc_destroyWeak((id *)&self->_itemSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indexesMatchingSearchTerm, 0);
  objc_storeStrong((id *)&self->_itemsMatchingSearchTerm, 0);
}

@end