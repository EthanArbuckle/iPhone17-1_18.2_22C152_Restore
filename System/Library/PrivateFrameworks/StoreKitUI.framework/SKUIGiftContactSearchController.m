@interface SKUIGiftContactSearchController
- (BOOL)cancelSearch;
- (CNAutocompleteResultsTableViewController)searchResultsViewController;
- (SKUIGiftContactSearchDelegate)delegate;
- (UIView)searchResultsView;
- (int64_t)numberOfResults;
- (void)_finishSearchWithResults:(id)a3;
- (void)_setResults:(id)a3;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)cancelSearch;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)dealloc;
- (void)finishedSearchingForAutocompleteResults;
- (void)numberOfResults;
- (void)resetSearch;
- (void)searchForText:(id)a3;
- (void)searchResultsView;
- (void)searchResultsViewController;
- (void)setDelegate:(id)a3;
@end

@implementation SKUIGiftContactSearchController

- (void)dealloc
{
  if (self->_searchTaskIdentifier) {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
  }
  [(CNAutocompleteResultsTableViewController *)self->_searchResultsViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIGiftContactSearchController;
  [(SKUIGiftContactSearchController *)&v3 dealloc];
}

- (BOOL)cancelSearch
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftContactSearchController *)v3 cancelSearch];
      }
    }
  }
  searchTaskIdentifier = self->_searchTaskIdentifier;
  if (searchTaskIdentifier)
  {
    [(CNAutocompleteSearchManager *)self->_searchManager cancelTaskWithID:self->_searchTaskIdentifier];
    v12 = self->_searchTaskIdentifier;
    self->_searchTaskIdentifier = 0;
  }
  return searchTaskIdentifier != 0;
}

- (int64_t)numberOfResults
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftContactSearchController *)v3 numberOfResults];
      }
    }
  }
  return [(NSArray *)self->_results count];
}

- (void)resetSearch
{
  [(SKUIGiftContactSearchController *)self cancelSearch];

  [(SKUIGiftContactSearchController *)self _setResults:0];
}

- (void)searchForText:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGiftContactSearchController searchForText:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (!self->_autocompleteSearchResults)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    autocompleteSearchResults = self->_autocompleteSearchResults;
    self->_autocompleteSearchResults = v13;
  }
  [(SKUIGiftContactSearchController *)self cancelSearch];
  [(NSMutableArray *)self->_autocompleteSearchResults removeAllObjects];
  if ([v4 length])
  {
    searchManager = self->_searchManager;
    if (!searchManager)
    {
      uint64_t v16 = SKUIContactsAutocompleteUIFramework();
      v17 = (CNAutocompleteSearchManager *)objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Cnautocomplete.isa, v16)), "initWithAutocompleteSearchType:", 0);
      v18 = self->_searchManager;
      self->_searchManager = v17;

      [(CNAutocompleteSearchManager *)self->_searchManager setSearchTypes:3];
      searchManager = self->_searchManager;
    }
    v19 = [(CNAutocompleteSearchManager *)searchManager searchForText:v4 withAutocompleteFetchContext:0 consumer:self];
    searchTaskIdentifier = self->_searchTaskIdentifier;
    self->_searchTaskIdentifier = v19;
  }
  else
  {
    [(SKUIGiftContactSearchController *)self _finishSearchWithResults:0];
  }
}

- (UIView)searchResultsView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftContactSearchController *)v3 searchResultsView];
      }
    }
  }
  searchResultsView = self->_searchResultsView;
  if (!searchResultsView)
  {
    uint64_t v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v13 = self->_searchResultsView;
    self->_searchResultsView = v12;

    v14 = [(SKUIGiftContactSearchController *)self searchResultsViewController];
    v15 = [v14 tableView];

    uint64_t v16 = self->_searchResultsView;
    [v15 frame];
    -[UIView setFrame:](v16, "setFrame:");
    [(UIView *)self->_searchResultsView bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    [v15 setAutoresizingMask:18];
    objc_msgSend(v15, "setFrame:", v18, v20, v22, v24);
    [(UIView *)self->_searchResultsView addSubview:v15];

    searchResultsView = self->_searchResultsView;
  }

  return searchResultsView;
}

- (CNAutocompleteResultsTableViewController)searchResultsViewController
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftContactSearchController *)v3 searchResultsViewController];
      }
    }
  }
  searchResultsViewController = self->_searchResultsViewController;
  if (!searchResultsViewController)
  {
    uint64_t v12 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x1E4F5A0E8]);
    v13 = self->_searchResultsViewController;
    self->_searchResultsViewController = v12;

    [(CNAutocompleteResultsTableViewController *)self->_searchResultsViewController setDelegate:self];
    searchResultsViewController = self->_searchResultsViewController;
  }

  return searchResultsViewController;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIGiftContactSearchController consumeAutocompleteSearchResults:taskID:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  if ([v7 isEqualToNumber:self->_searchTaskIdentifier]) {
    [(NSMutableArray *)self->_autocompleteSearchResults addObjectsFromArray:v6];
  }
}

- (void)finishedSearchingForAutocompleteResults
{
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIGiftContactSearchController autocompleteResultsController:didSelectRecipient:atIndex:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    double v20 = objc_loadWeakRetained((id *)&self->_delegate);
    [v20 searchController:self didSelectRecipient:v9];
  }
  else
  {
    double v20 = [v8 tableView];
    double v21 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a5];
    [v20 deselectRowAtIndexPath:v21 animated:1];
  }
}

- (void)_finishSearchWithResults:(id)a3
{
  [(SKUIGiftContactSearchController *)self _setResults:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 searchControllerDidFinishSearch:self];
  }
}

- (void)_setResults:(id)a3
{
  if (self->_results != a3)
  {
    uint64_t v4 = (NSArray *)[a3 copy];
    results = self->_results;
    self->_results = v4;

    id v6 = self->_results;
    id v7 = [(SKUIGiftContactSearchController *)self searchResultsViewController];
    [v7 setRecipients:v6];

    id v8 = [(CNAutocompleteResultsTableViewController *)self->_searchResultsViewController tableView];
    [v8 reloadData];
  }
}

- (SKUIGiftContactSearchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIGiftContactSearchDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_searchResultsView, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_searchResultsViewController, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_autocompleteSearchResults, 0);
}

- (void)cancelSearch
{
}

- (void)numberOfResults
{
}

- (void)searchForText:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)searchResultsView
{
}

- (void)searchResultsViewController
{
}

- (void)consumeAutocompleteSearchResults:(uint64_t)a3 taskID:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)autocompleteResultsController:(uint64_t)a3 didSelectRecipient:(uint64_t)a4 atIndex:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end