@interface SUUIGiftContactSearchController
- (BOOL)cancelSearch;
- (CNAutocompleteResultsTableViewController)searchResultsViewController;
- (SUUIGiftContactSearchDelegate)delegate;
- (UIView)searchResultsView;
- (int64_t)numberOfResults;
- (void)_finishSearchWithResults:(id)a3;
- (void)_setResults:(id)a3;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)dealloc;
- (void)finishedSearchingForAutocompleteResults;
- (void)resetSearch;
- (void)searchForText:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SUUIGiftContactSearchController

- (void)dealloc
{
  if (self->_searchTaskIdentifier) {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
  }
  [(CNAutocompleteResultsTableViewController *)self->_searchResultsViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIGiftContactSearchController;
  [(SUUIGiftContactSearchController *)&v3 dealloc];
}

- (BOOL)cancelSearch
{
  searchTaskIdentifier = self->_searchTaskIdentifier;
  if (searchTaskIdentifier)
  {
    [(CNAutocompleteSearchManager *)self->_searchManager cancelTaskWithID:searchTaskIdentifier];
    v4 = self->_searchTaskIdentifier;
    self->_searchTaskIdentifier = 0;
  }
  return searchTaskIdentifier != 0;
}

- (int64_t)numberOfResults
{
  return [(NSArray *)self->_results count];
}

- (void)resetSearch
{
  [(SUUIGiftContactSearchController *)self cancelSearch];
  [(SUUIGiftContactSearchController *)self _setResults:0];
}

- (void)searchForText:(id)a3
{
  id v12 = a3;
  if (!self->_autocompleteSearchResults)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    autocompleteSearchResults = self->_autocompleteSearchResults;
    self->_autocompleteSearchResults = v4;
  }
  [(SUUIGiftContactSearchController *)self cancelSearch];
  [(NSMutableArray *)self->_autocompleteSearchResults removeAllObjects];
  if ([v12 length])
  {
    searchManager = self->_searchManager;
    if (!searchManager)
    {
      uint64_t v7 = SUUIContactsAutocompleteUIFramework();
      v8 = (CNAutocompleteSearchManager *)objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(&cfstr_Cnautocomplete.isa, v7)), "initWithAutocompleteSearchType:", 0);
      v9 = self->_searchManager;
      self->_searchManager = v8;

      [(CNAutocompleteSearchManager *)self->_searchManager setSearchTypes:3];
      searchManager = self->_searchManager;
    }
    v10 = [(CNAutocompleteSearchManager *)searchManager searchForText:v12 withAutocompleteFetchContext:0 consumer:self];
    searchTaskIdentifier = self->_searchTaskIdentifier;
    self->_searchTaskIdentifier = v10;
  }
  else
  {
    [(SUUIGiftContactSearchController *)self _finishSearchWithResults:0];
  }
}

- (UIView)searchResultsView
{
  searchResultsView = self->_searchResultsView;
  if (!searchResultsView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    v5 = self->_searchResultsView;
    self->_searchResultsView = v4;

    v6 = [(SUUIGiftContactSearchController *)self searchResultsViewController];
    uint64_t v7 = [v6 tableView];

    v8 = self->_searchResultsView;
    [v7 frame];
    -[UIView setFrame:](v8, "setFrame:");
    [(UIView *)self->_searchResultsView bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [v7 setAutoresizingMask:18];
    objc_msgSend(v7, "setFrame:", v10, v12, v14, v16);
    [(UIView *)self->_searchResultsView addSubview:v7];

    searchResultsView = self->_searchResultsView;
  }
  return searchResultsView;
}

- (CNAutocompleteResultsTableViewController)searchResultsViewController
{
  searchResultsViewController = self->_searchResultsViewController;
  if (!searchResultsViewController)
  {
    v4 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x263F33410]);
    v5 = self->_searchResultsViewController;
    self->_searchResultsViewController = v4;

    [(CNAutocompleteResultsTableViewController *)self->_searchResultsViewController setDelegate:self];
    searchResultsViewController = self->_searchResultsViewController;
  }
  return searchResultsViewController;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToNumber:self->_searchTaskIdentifier]) {
    [(NSMutableArray *)self->_autocompleteSearchResults addObjectsFromArray:v6];
  }
}

- (void)finishedSearchingForAutocompleteResults
{
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 searchController:self didSelectRecipient:v8];
  }
  else
  {
    double v11 = [v13 tableView];
    double v12 = [MEMORY[0x263F088C8] indexPathWithIndex:a5];
    [v11 deselectRowAtIndexPath:v12 animated:1];
  }
}

- (void)_finishSearchWithResults:(id)a3
{
  [(SUUIGiftContactSearchController *)self _setResults:a3];
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
    v4 = (NSArray *)[a3 copy];
    results = self->_results;
    self->_results = v4;

    id v6 = self->_results;
    uint64_t v7 = [(SUUIGiftContactSearchController *)self searchResultsViewController];
    [v7 setRecipients:v6];

    id v8 = [(CNAutocompleteResultsTableViewController *)self->_searchResultsViewController tableView];
    [v8 reloadData];
  }
}

- (SUUIGiftContactSearchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIGiftContactSearchDelegate *)WeakRetained;
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

@end