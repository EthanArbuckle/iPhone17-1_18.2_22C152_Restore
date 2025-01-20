@interface SUUISearchFieldController
- (BOOL)_presentsInPopover:(id)a3;
- (BOOL)canBecomeActive;
- (BOOL)displaysSearchBarInNavigationBar;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)searchBarShouldClear:(id)a3;
- (BOOL)showsResultsForEmptyField;
- (NSString)searchBarAccessoryText;
- (NSString)searchHintsURLString;
- (NSString)trendingSearchURLString;
- (SUUIClientContext)clientContext;
- (SUUISearchFieldController)initWithContentsController:(id)a3;
- (SUUISearchFieldController)initWithContentsController:(id)a3 clientContext:(id)a4;
- (SUUISearchFieldDelegate)delegate;
- (UISearchBar)searchBar;
- (UIViewController)contentsController;
- (id)URLForTrendingSearchPageView:(id)a3;
- (id)searchControllerClientContext:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSearchResults;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_adjustInsetsForResultsTableView:(id)a3;
- (void)_loadResultsForSearchRequest:(id)a3;
- (void)_reloadData;
- (void)_reloadTrendingVisibility;
- (void)_setResponse:(id)a3 error:(id)a4;
- (void)becomeActive;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentSearchController:(id)a3;
- (void)resignActive:(BOOL)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchControllerWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplaysSearchBarInNavigationBar:(BOOL)a3;
- (void)setNumberOfSearchResults:(int64_t)a3;
- (void)setSearchBarAccessoryText:(id)a3;
- (void)setSearchHintsURLString:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)setShowsResultsForEmptyField:(BOOL)a3;
- (void)setTrendingSearchURLString:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)trendingSearchPageView:(id)a3 didSelectSearch:(id)a4;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation SUUISearchFieldController

- (SUUISearchFieldController)initWithContentsController:(id)a3 clientContext:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SUUISearchFieldController;
  v7 = [(SUUISearchFieldController *)&v34 init];
  if (v7)
  {
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v8;

    id v10 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_contentsController, v10);

    v11 = [SUUISearchFieldTableView alloc];
    v12 = -[SUUISearchFieldTableView initWithFrame:style:](v11, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(SUUISearchFieldTableView *)v12 setTrendingSearchDelegate:v7];
    v13 = [v6 trendingSearchProvider];
    [(SUUISearchFieldTableView *)v12 setTrendingSearchProvider:v13];

    BOOL v14 = [(SUUISearchFieldController *)v7 _presentsInPopover:v6];
    uint64_t v15 = [objc_alloc(MEMORY[0x263F82C88]) initWithStyle:0];
    searchResultsController = v7->_searchResultsController;
    v7->_searchResultsController = (UITableViewController *)v15;

    [(UITableViewController *)v7->_searchResultsController setTableView:v12];
    v17 = [(UITableViewController *)v7->_searchResultsController tableView];
    [v17 setDataSource:v7];

    v18 = [(UITableViewController *)v7->_searchResultsController tableView];
    [v18 setDelegate:v7];

    v19 = [(UITableViewController *)v7->_searchResultsController tableView];
    if (v14) {
      [MEMORY[0x263F825C8] clearColor];
    }
    else {
    v20 = [MEMORY[0x263F825C8] systemBackgroundColor];
    }
    [v19 setBackgroundColor:v20];

    if (v14)
    {
      v21 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v7->_searchResultsController];
      v22 = [[SUUISearchController alloc] initWithSearchResultsController:v21];
      searchController = v7->_searchController;
      v7->_searchController = v22;
    }
    else
    {
      v24 = [[SUUISearchController alloc] initWithSearchResultsController:v7->_searchResultsController];
      v25 = v7->_searchController;
      v7->_searchController = v24;

      [(UITableViewController *)v7->_searchResultsController setAutomaticallyAdjustsScrollViewInsets:0];
      v21 = [(UITableViewController *)v7->_searchResultsController tableView];
      [v21 setContentInsetAdjustmentBehavior:101];
    }

    [(SUUISearchController *)v7->_searchController setHidesNavigationBarDuringPresentation:0];
    [(SUUISearchController *)v7->_searchController setDelegate:v7];
    [(SUUISearchController *)v7->_searchController setSearchResultsUpdater:v7];
    v26 = [(SUUISearchController *)v7->_searchController searchBar];
    [v26 setDrawsBackground:0];
    [v26 setAutocapitalizationType:0];
    [v26 setAutocorrectionType:1];
    [v26 setDelegate:v7];
    [v26 setSearchBarStyle:2];
    id v27 = objc_loadWeakRetained(&location);
    v28 = [v27 navigationController];
    v29 = [v28 navigationBar];
    uint64_t v30 = [v29 barStyle];

    if (v30 == 1)
    {
      v31 = [v26 searchField];
      v32 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.6];
      [v31 setTextColor:v32];
    }
    if (v6) {
      [(SUUISearchFieldController *)v7 setClientContext:v6];
    }
  }
  objc_destroyWeak(&location);
  return v7;
}

- (SUUISearchFieldController)initWithContentsController:(id)a3
{
  id v4 = a3;
  v5 = [(SUUISearchFieldController *)self initWithContentsController:v4 clientContext:0];

  return v5;
}

- (BOOL)displaysSearchBarInNavigationBar
{
  return [(SUUISearchController *)self->_searchController hidesNavigationBarDuringPresentation] ^ 1;
}

- (BOOL)canBecomeActive
{
  if ([(SUUISearchController *)self->_searchController isActive]) {
    return 0;
  }
  id v4 = [(SUUISearchController *)self->_searchController searchBar];
  v5 = [v4 superview];
  BOOL v3 = v5 != 0;

  return v3;
}

- (void)becomeActive
{
  BOOL v3 = [(SUUISearchController *)self->_searchController transitionCoordinator];
  id v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__SUUISearchFieldController_becomeActive__block_invoke;
    v6[3] = &unk_265400820;
    v6[4] = self;
    [v3 animateAlongsideTransition:0 completion:v6];
  }
  else
  {
    v5 = [(SUUISearchController *)self->_searchController searchBar];
    [v5 becomeFirstResponder];
  }
}

void __41__SUUISearchFieldController_becomeActive__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 40) searchBar];
  [v1 becomeFirstResponder];
}

- (void)resignActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUUISearchController *)self->_searchController isActive])
  {
    if (v3)
    {
      searchController = self->_searchController;
      [(SUUISearchController *)searchController setActive:0];
    }
    else
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __42__SUUISearchFieldController_resignActive___block_invoke;
      v6[3] = &unk_265400980;
      v6[4] = self;
      [MEMORY[0x263F82E00] performWithoutAnimation:v6];
    }
  }
}

uint64_t __42__SUUISearchFieldController_resignActive___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) setActive:0];
}

- (UISearchBar)searchBar
{
  return (UISearchBar *)[(SUUISearchController *)self->_searchController searchBar];
}

- (void)setDisplaysSearchBarInNavigationBar:(BOOL)a3
{
}

- (void)setNumberOfSearchResults:(int64_t)a3
{
  if (self->_numberOfSearchResults != a3)
  {
    self->_numberOfSearchResults = a3;
    if (a3)
    {
      clientContext = self->_clientContext;
      if (a3 == 1) {
        v5 = @"SEARCH_FIELD_ONE_RESULT";
      }
      else {
        v5 = @"SEARCH_FIELD_PLURAL_RESULTS";
      }
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:v5];
      }
      else {
      id v6 = +[SUUIClientContext localizedStringForKey:v5 inBundles:0];
      }
      v7 = NSString;
      v8 = [NSNumber numberWithInteger:self->_numberOfSearchResults];
      id v9 = [v7 stringWithValidatedFormat:v6, @"%@", 0, v8 validFormatSpecifiers error];

      [(SUUISearchController *)self->_searchController _setSuffix:v9];
    }
    else
    {
      id v9 = 0;
      [(SUUISearchController *)self->_searchController _setSuffix:0];
    }
  }
}

- (void)setClientContext:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_clientContext, a3);
  searchResultsController = self->_searchResultsController;
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SUUIClientContext *)clientContext localizedStringForKey:@"SEARCH_SUGGESTIONS"];
  }
  else {
  v7 = +[SUUIClientContext localizedStringForKey:@"SEARCH_SUGGESTIONS" inBundles:0];
  }
  [(UITableViewController *)searchResultsController setTitle:v7];

  [(SUUISearchFieldController *)self _reloadTrendingVisibility];
}

- (void)setSearchBarAccessoryText:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_searchBarAccessoryText] & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    searchBarAccessoryText = self->_searchBarAccessoryText;
    self->_searchBarAccessoryText = v4;

    [(SUUISearchController *)self->_searchController _setSuffix:self->_searchBarAccessoryText];
  }
}

- (void)setSearchTerm:(id)a3
{
  searchController = self->_searchController;
  id v5 = a3;
  id v6 = [(SUUISearchController *)searchController searchBar];
  v7 = [v6 searchField];
  [v7 setText:v5];

  [(SUUISearchFieldController *)self _reloadTrendingVisibility];
}

- (void)setShowsResultsForEmptyField:(BOOL)a3
{
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFD | v6;
  char v7 = objc_opt_respondsToSelector();

  if (v7) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFB | v8;
}

- (BOOL)showsResultsForEmptyField
{
  return [(SUUISearchController *)self->_searchController _showResultsForEmptySearch];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  char v6 = objc_alloc_init(SUUISearchRequest);
  id v5 = [v4 text];
  [(SUUISearchRequest *)v6 setTerm:v5];

  [(SUUISearchFieldController *)self _loadResultsForSearchRequest:v6];
  [v4 resignFirstResponder];

  [(SUUISearchController *)self->_searchController setActive:0];
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v4 = [WeakRetained searchFieldControllerShouldBeginEditing:self];
  }
  else
  {
    char v4 = 1;
  }
  char v6 = [(UITableViewController *)self->_searchResultsController tableView];
  [(SUUISearchFieldController *)self _adjustInsetsForResultsTableView:v6];

  return v4;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 2) != 0)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained searchFieldController:self searchBarDidChangeText:v6];
  }
}

- (BOOL)searchBarShouldClear:(id)a3
{
  id v4 = a3;
  if (([v4 isFirstResponder] & 1) != 0
    || [(SUUISearchFieldController *)self _presentsInPopover:self->_clientContext])
  {
    BOOL v5 = 1;
  }
  else
  {
    [v4 setText:0];
    id v6 = [v4 text];
    [(SUUISearchFieldController *)self searchBar:v4 textDidChange:v6];

    [(SUUISearchFieldController *)self becomeActive];
    BOOL v5 = 0;
  }

  return v5;
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = [(UITableViewController *)self->_searchResultsController tableView];
  [(SUUISearchFieldController *)self _adjustInsetsForResultsTableView:v4];

  [(SUUISearchFieldController *)self _reloadData];
}

- (void)presentSearchController:(id)a3
{
  id v4 = a3;
  if ([(SUUISearchFieldController *)self _presentsInPopover:self->_clientContext])
  {
    [v4 setModalPresentationStyle:7];
    BOOL v5 = [v4 popoverPresentationController];
    [v5 setDelegate:self];
  }
  id v6 = [(SUUISearchFieldController *)self contentsController];
  [v6 setDefinesPresentationContext:1];

  char v7 = [(SUUISearchFieldController *)self contentsController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__SUUISearchFieldController_presentSearchController___block_invoke;
  v8[3] = &unk_265400980;
  v8[4] = self;
  [v7 presentViewController:v4 animated:1 completion:v8];
}

void __53__SUUISearchFieldController_presentSearchController___block_invoke(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) searchBar];
  v2 = [v14 superview];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v3 = [*(id *)(a1 + 32) searchBar];
    char v4 = [v3 autoresizingMask];

    if ((v4 & 2) == 0) {
      return;
    }
    id v14 = [*(id *)(a1 + 32) searchBar];
    v2 = [v14 superview];
    [v2 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [*(id *)(a1 + 32) searchBar];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  }
}

- (void)willDismissSearchController:(id)a3
{
  id v3 = [(SUUISearchFieldController *)self contentsController];
  [v3 setDefinesPresentationContext:0];
}

- (void)searchControllerWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __92__SUUISearchFieldController_searchControllerWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_265400820;
  v4[4] = self;
  [a4 animateAlongsideTransition:0 completion:v4];
}

void __92__SUUISearchFieldController_searchControllerWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = *(id **)(a1 + 32);
  id v2 = [v1[4] tableView];
  [v1 _adjustInsetsForResultsTableView:v2];
}

- (id)searchControllerClientContext:(id)a3
{
  return self->_clientContext;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setPermittedArrowDirections:1];
  double v5 = [(SUUISearchController *)self->_searchController searchBar];
  [v4 setSourceView:v5];

  double v6 = [(SUUISearchController *)self->_searchController searchBar];
  [v6 bounds];
  objc_msgSend(v4, "setSourceRect:");

  double v7 = [(SUUISearchController *)self->_searchController searchBar];
  v9[0] = v7;
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v4 setPassthroughViews:v8];
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v3 = [(SUUISearchFieldController *)self contentsController];
  [v3 setDefinesPresentationContext:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"a"];
  if (!v7) {
    double v7 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"a"];
  }
  double v8 = [(SUUICompletionList *)self->_completionList completions];
  uint64_t v9 = [v6 row];

  double v10 = [v8 objectAtIndex:v9];

  double v11 = [v7 textLabel];
  double v12 = [v10 alternateTitle];
  if ([v12 length]) {
    [v10 alternateTitle];
  }
  else {
  v13 = [v10 title];
  }
  [v11 setText:v13];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(SUUICompletionList *)self->_completionList completions];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v22 = objc_alloc_init(SUUISearchRequest);
  id v6 = [(SUUISearchController *)self->_searchController searchBar];
  double v7 = [v6 text];
  [(SUUISearchRequest *)v22 setSearchHintOriginalTerm:v7];

  double v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "row"));
  [(SUUISearchRequest *)v22 setSearchHintIndex:v8];

  uint64_t v9 = [(SUUICompletionList *)self->_completionList completions];
  uint64_t v10 = [v5 row];

  double v11 = [v9 objectAtIndex:v10];

  double v12 = [v11 title];
  [(SUUISearchRequest *)v22 setTerm:v12];
  id v13 = objc_alloc(NSURL);
  id v14 = [v11 URLString];
  uint64_t v15 = (void *)[v13 initWithString:v14];

  [(SUUISearchRequest *)v22 setURL:v15];
  v16 = [v11 alternateTitle];
  v17 = [(SUUISearchController *)self->_searchController searchBar];
  v18 = [v17 searchField];
  v19 = v18;
  if (v16) {
    v20 = v16;
  }
  else {
    v20 = v12;
  }
  [v18 setText:v20];

  [(SUUISearchFieldController *)self _loadResultsForSearchRequest:v22];
  v21 = [(SUUISearchController *)self->_searchController searchBar];
  [v21 resignFirstResponder];

  [(SUUISearchController *)self->_searchController setActive:0];
}

- (void)trendingSearchPageView:(id)a3 didSelectSearch:(id)a4
{
  id v5 = a4;
  double v12 = objc_alloc_init(SUUISearchRequest);
  id v6 = NSURL;
  double v7 = [v5 URLString];
  double v8 = [v6 URLWithString:v7];
  [(SUUISearchRequest *)v12 setURL:v8];

  uint64_t v9 = [v5 term];

  [(SUUISearchRequest *)v12 setTerm:v9];
  uint64_t v10 = [(SUUISearchController *)self->_searchController searchBar];
  double v11 = [v10 searchField];
  [v11 setText:v9];

  [(SUUISearchFieldController *)self _loadResultsForSearchRequest:v12];
  [(SUUISearchController *)self->_searchController setActive:0];
}

- (id)URLForTrendingSearchPageView:(id)a3
{
  id v3 = NSURL;
  id v4 = [(SUUISearchFieldController *)self trendingSearchURLString];
  id v5 = [v3 URLWithString:v4];

  return v5;
}

- (BOOL)_presentsInPopover:(id)a3
{
  id v3 = a3;
  if (SUUIUserInterfaceIdiom(v3) == 1)
  {
    id v4 = [MEMORY[0x263F82438] sharedApplication];
    id v5 = [v4 keyWindow];
    [v5 bounds];
    if (v6 <= SUUICompactThreshold()) {
      LOBYTE(v7) = 0;
    }
    else {
      int v7 = [v3 shouldForceTransientSearchControllerBahavior] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_adjustInsetsForResultsTableView:(id)a3
{
  id v25 = a3;
  id v4 = [(SUUISearchFieldController *)self clientContext];
  if (SUUIUserInterfaceIdiom(v4) == 1)
  {
    id v5 = [MEMORY[0x263F82438] sharedApplication];
    double v6 = [v5 keyWindow];
    [v6 bounds];
    if (v7 > SUUICompactThreshold())
    {
      BOOL v8 = [(SUUIClientContext *)self->_clientContext shouldForceTransientSearchControllerBahavior];

      if (!v8) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  [v25 contentInset];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v25 contentOffset];
  double v18 = v17;
  double v20 = v19;
  v21 = [(SUUISearchFieldController *)self contentsController];
  v22 = [v21 topLayoutGuide];
  [v22 length];
  double v24 = v23;

  if (v24 != v10)
  {
    objc_msgSend(v25, "setContentInset:", v24, v12, v14, v16);
    objc_msgSend(v25, "setScrollIndicatorInsets:", v24, v12, v14, v16);
    objc_msgSend(v25, "setContentOffset:", v18, v20 - (v24 - v10));
  }
LABEL_9:
}

- (void)_loadResultsForSearchRequest:(id)a3
{
  id v12 = a3;
  id v4 = [(SUUISearchFieldController *)self delegate];
  id v5 = v4;
  if (*(unsigned char *)&self->_delegateRespondsTo)
  {
    [v4 searchFieldController:self requestSearch:v12];
  }
  else
  {
    double v6 = [v12 term];
    uint64_t v7 = [v12 URL];
    BOOL v8 = (void *)v7;
    if (!v6 || v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = objc_loadWeakRetained((id *)&self->_delegate);
        [v11 searchFieldController:self requestSearchWithURL:v8 metricsEvent:0];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v5 searchFieldController:self requestSearchWithSearchTerm:v6 metricsEvent:0];
    }
  }
}

- (void)_reloadData
{
  id v3 = [(SUUISearchController *)self->_searchController searchBar];
  id v4 = [v3 text];

  if ([v4 length])
  {
    id v5 = [(SUUISearchFieldController *)self searchHintsURLString];

    if (!v5)
    {
      objc_initWeak(&location, self);
      double v18 = [(SUUIClientContext *)self->_clientContext URLBag];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __40__SUUISearchFieldController__reloadData__block_invoke;
      v21[3] = &unk_265402320;
      objc_copyWeak(&v22, &location);
      [v18 loadValueForKey:@"searchHints" completionBlock:v21];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
      goto LABEL_7;
    }
    [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
    [(SSVLoadURLOperation *)self->_loadOperation cancel];
    double v6 = NSURL;
    uint64_t v7 = [(SUUISearchFieldController *)self searchHintsURLString];
    BOOL v8 = [v6 URLWithString:v7];
    double v9 = [v8 URLByAppendingQueryParameter:@"term" value:v4];

    char v10 = (SSVLoadURLOperation *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v9];
    loadOperation = self->_loadOperation;
    self->_loadOperation = v10;

    id v12 = self->_loadOperation;
    double v13 = +[SSVURLDataConsumer consumer];
    [(SSVLoadURLOperation *)v12 setDataConsumer:v13];

    double v14 = self->_loadOperation;
    double v15 = [(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
    [(SSVLoadURLOperation *)v14 setStoreFrontSuffix:v15];

    objc_initWeak(&location, self);
    double v16 = self->_loadOperation;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __40__SUUISearchFieldController__reloadData__block_invoke_3;
    v19[3] = &unk_265402348;
    objc_copyWeak(&v20, &location);
    [(SSVLoadURLOperation *)v16 setOutputBlock:v19];
    [(NSOperationQueue *)self->_operationQueue addOperation:self->_loadOperation];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SUUISearchFieldController *)self _setResponse:0 error:0];
    [(SUUISearchFieldController *)self _loadResultsForSearchRequest:0];
    completionList = self->_completionList;
    self->_completionList = 0;

    double v9 = [(UITableViewController *)self->_searchResultsController tableView];
    [v9 reloadData];
  }

LABEL_7:
  [(SUUISearchFieldController *)self _reloadTrendingVisibility];
}

void __40__SUUISearchFieldController__reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __40__SUUISearchFieldController__reloadData__block_invoke_2;
    v4[3] = &unk_2654022F8;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    id v5 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v6);
  }
}

void __40__SUUISearchFieldController__reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setSearchHintsURLString:*(void *)(a1 + 32)];
    [v3 _reloadData];
    id WeakRetained = v3;
  }
}

void __40__SUUISearchFieldController__reloadData__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUUISearchFieldController__reloadData__block_invoke_4;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __40__SUUISearchFieldController__reloadData__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_reloadTrendingVisibility
{
  id v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v14 = [MEMORY[0x263F82438] sharedApplication];
    id v5 = [v14 keyWindow];
    [v5 bounds];
    if (v6 <= SUUICompactThreshold())
    {
    }
    else
    {
      BOOL v7 = [(SUUIClientContext *)self->_clientContext shouldForceTransientSearchControllerBahavior];

      if (v7) {
        return;
      }
      id v14 = [(UITableViewController *)self->_searchResultsController tableView];
      id v8 = [(SUUIClientContext *)self->_clientContext trendingSearchProvider];
      [v14 setTrendingSearchProvider:v8];

      unsigned int v9 = [(SUUISearchController *)self->_searchController isActive];
      id v10 = [(SUUISearchController *)self->_searchController searchBar];
      id v11 = [v10 text];
      uint64_t v12 = [v11 length];

      if (v12) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v9;
      }
      [v14 setTrendingSearchesVisible:v13];
    }
  }
}

- (void)_setResponse:(id)a3 error:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    id v8 = [(SUUISearchController *)self->_searchController searchBar];
    unsigned int v9 = [v8 text];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      objc_storeStrong((id *)&self->_completionList, a3);
      id v11 = [(UITableViewController *)self->_searchResultsController tableView];
      [v11 reloadData];
    }
  }
}

- (UIViewController)contentsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentsController);
  return (UIViewController *)WeakRetained;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUISearchFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUISearchFieldDelegate *)WeakRetained;
}

- (NSString)searchBarAccessoryText
{
  return self->_searchBarAccessoryText;
}

- (NSString)searchHintsURLString
{
  return self->_searchHintsURLString;
}

- (void)setSearchHintsURLString:(id)a3
{
}

- (NSString)trendingSearchURLString
{
  return self->_trendingSearchURLString;
}

- (void)setTrendingSearchURLString:(id)a3
{
}

- (int64_t)numberOfSearchResults
{
  return self->_numberOfSearchResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingSearchURLString, 0);
  objc_storeStrong((id *)&self->_searchHintsURLString, 0);
  objc_storeStrong((id *)&self->_searchBarAccessoryText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_contentsController);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_completionList, 0);
}

@end