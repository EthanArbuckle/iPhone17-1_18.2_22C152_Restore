@interface SUSearchFieldController
- (BOOL)_focusTransientViewController;
- (BOOL)isActive;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)searchBarShouldEndEditing:(id)a3;
- (BOOL)searchDisplayController:(id)a3 shouldReloadTableForSearchString:(id)a4;
- (SUSearchFieldConfiguration)searchFieldConfiguration;
- (SUSearchFieldController)init;
- (SUSearchFieldController)initWithContentsController:(id)a3;
- (SUSearchFieldController)initWithContentsController:(id)a3 clientInterface:(id)a4;
- (SUSearchFieldController)initWithContentsController:(id)a3 clientInterface:(id)a4 style:(int64_t)a5;
- (SUSearchFieldController)initWithContentsController:(id)a3 style:(int64_t)a4;
- (UISearchBar)searchBar;
- (id)_cancelButtonView;
- (id)_defaultSearchTerm;
- (id)_newBlankStorePageViewController;
- (id)_newSearchBar;
- (id)_newSearchDisplayControllerWithContentsController:(id)a3;
- (id)_newTransientViewController;
- (id)_searchGroupForSearchKind:(id)a3;
- (id)_targetViewController;
- (id)newRequestPropertiesWithSearchTerm:(id)a3;
- (id)newRequestPropertiesWithSearchTerm:(id)a3 kind:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)searchFieldStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelCompletionsOperation;
- (void)_dimmerViewAction:(id)a3;
- (void)_fetchCompletions;
- (void)_fetchResultsForTerm:(id)a3 URL:(id)a4;
- (void)_fetchResultsForURLRequestProperties:(id)a3;
- (void)_reloadCompletionsForSearchString:(id)a3;
- (void)_reloadSearchBar;
- (void)_resizeSearchBarForOrientation:(int64_t)a3;
- (void)_saveSearchTermToDefaults:(id)a3;
- (void)_savedSearchTermChangedNotification:(id)a3;
- (void)_sendOnXEventWithTerm:(id)a3 URL:(id)a4 completionBlock:(id)a5;
- (void)_showDimmerView;
- (void)_tearDownDimmerView;
- (void)dealloc;
- (void)handleSearchURL:(id)a3 withSourceApplication:(id)a4 sourceURL:(id)a5;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)operationDidFinish:(id)a3;
- (void)scriptDidChangeTextForField:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)searchBarWillRemoveFromSuperview:(id)a3;
- (void)searchDisplayController:(id)a3 didLoadSearchResultsTableView:(id)a4;
- (void)searchDisplayController:(id)a3 willUnloadSearchResultsTableView:(id)a4;
- (void)setSearchFieldConfiguration:(id)a3;
- (void)setSearchFieldStyle:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SUSearchFieldController

- (SUSearchFieldController)init
{
  return [(SUSearchFieldController *)self initWithContentsController:0];
}

- (SUSearchFieldController)initWithContentsController:(id)a3
{
  id v5 = +[SUClientDispatch clientInterface];

  return [(SUSearchFieldController *)self initWithContentsController:a3 clientInterface:v5];
}

- (SUSearchFieldController)initWithContentsController:(id)a3 style:(int64_t)a4
{
  id v7 = +[SUClientDispatch clientInterface];

  return [(SUSearchFieldController *)self initWithContentsController:a3 clientInterface:v7 style:a4];
}

- (SUSearchFieldController)initWithContentsController:(id)a3 clientInterface:(id)a4
{
  return [(SUSearchFieldController *)self initWithContentsController:a3 clientInterface:a4 style:0];
}

- (SUSearchFieldController)initWithContentsController:(id)a3 clientInterface:(id)a4 style:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SUSearchFieldController;
  v8 = [(SUSearchFieldController *)&v12 init];
  if (v8)
  {
    v8->_clientInterface = (SUClientInterface *)a4;
    v8->_searchFieldStyle = a5;
    v9 = objc_alloc_init(SUScriptTextFieldDelegate);
    v8->_textFieldDelegate = v9;
    [(SUScriptTextFieldDelegate *)v9 addDelegate:v8];
    v10 = [(SUSearchFieldController *)v8 _newSearchDisplayControllerWithContentsController:a3];
    v8->_searchController = v10;
    [(UISearchDisplayController *)v10 setDelegate:v8];
    [(UISearchDisplayController *)v8->_searchController setSearchResultsDataSource:v8];
    [(UISearchDisplayController *)v8->_searchController setSearchResultsDelegate:v8];
    -[UISearchDisplayController setSearchResultsTitle:](v8->_searchController, "setSearchResultsTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SEARCH_SUGGESTIONS", &stru_26DB8C5F8, 0));
    [(UISearchBar *)[(SUSearchFieldController *)v8 searchBar] setDrawsBackground:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v8, sel__savedSearchTermChangedNotification_, @"SUSearchFieldControllerSavedSearchTermNotification", 0);
  }
  return v8;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"SUSearchFieldControllerSavedSearchTermNotification", 0);
  [(SUSearchFieldController *)self _tearDownDimmerView];

  [(SUScriptTextFieldDelegate *)self->_textFieldDelegate removeDelegate:self];
  if (![(SUScriptTextFieldDelegate *)self->_textFieldDelegate numberOfDelegates]
    && [(UISearchBar *)self->_searchBar delegate] == self->_textFieldDelegate)
  {
    [(UISearchBar *)self->_searchBar setDelegate:0];
  }

  [(UISearchDisplayController *)self->_searchController setDelegate:0];
  [(UISearchDisplayController *)self->_searchController setSearchResultsDataSource:0];
  [(UISearchDisplayController *)self->_searchController setSearchResultsDelegate:0];

  [(ISStoreURLOperation *)self->_completionsOperation setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUSearchFieldController;
  [(SUSearchFieldController *)&v3 dealloc];
}

- (void)handleSearchURL:(id)a3 withSourceApplication:(id)a4 sourceURL:(id)a5
{
  id v7 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  v9 = (void *)[a3 copyQueryStringDictionaryWithUnescapedValues:1];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v19 = v7;
    id v20 = a4;
    v21 = self;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v16, "isEqualToString:", @"term", v19)
          || [v16 rangeOfString:@"term" options:13] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = [v9 objectForKey:v16];
        }
        else if (([v16 isEqualToString:@"kind"] & 1) != 0 {
               || [v16 isEqualToString:@"entity"])
        }
        {
          uint64_t v13 = [v9 objectForKey:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
    if (v12)
    {
      self = v21;
      [(SUSearchDisplayController *)v21->_searchController _noEventSetSearchFieldText:v12];
      id v7 = v19;
      a4 = v20;
      if (![v19 host])
      {
        id v17 = [(SUSearchFieldController *)v21 newRequestPropertiesWithSearchTerm:v12 kind:v13];
        goto LABEL_21;
      }
    }
    else
    {
      id v7 = v19;
      a4 = v20;
      self = v21;
      if (![v19 host]) {
        goto LABEL_23;
      }
    }
  }
  else if (![v7 host])
  {
    goto LABEL_23;
  }
  id v17 = -[SUSearchFieldConfiguration URLRequestPropertiesWithBaseURL:forNetworkType:](self->_configuration, "URLRequestPropertiesWithBaseURL:forNetworkType:", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "networkType"));
LABEL_21:
  v18 = v17;
  if (v17)
  {
    [v17 setValue:a5 forHTTPHeaderField:@"referer"];
    [v18 setValue:a4 forHTTPHeaderField:@"ref-user-agent"];
    [(SUSearchFieldController *)self _fetchResultsForURLRequestProperties:v18];
  }
LABEL_23:
}

- (BOOL)isActive
{
  return [(UISearchDisplayController *)self->_searchController isActive];
}

- (id)newRequestPropertiesWithSearchTerm:(id)a3
{
  return [(SUSearchFieldController *)self newRequestPropertiesWithSearchTerm:a3 kind:0];
}

- (id)newRequestPropertiesWithSearchTerm:(id)a3 kind:(id)a4
{
  id v7 = -[SUSearchFieldConfiguration searchURLRequestPropertiesForNetworkType:](self->_configuration, "searchURLRequestPropertiesForNetworkType:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "networkType"));
  objc_msgSend(v7, "setValue:forRequestParameter:", -[SUSearchFieldController _searchGroupForSearchKind:](self, "_searchGroupForSearchKind:", a4), @"group");
  [v7 setValue:a3 forRequestParameter:@"term"];
  id v8 = v7;
  return v7;
}

- (UISearchBar)searchBar
{
  result = self->_searchBar;
  if (!result)
  {
    self->_searchBar = (UISearchBar *)[(SUSearchFieldController *)self _newSearchBar];
    [(SUSearchFieldController *)self _reloadSearchBar];
    return self->_searchBar;
  }
  return result;
}

- (void)setSearchFieldConfiguration:(id)a3
{
  configuration = self->_configuration;
  if (configuration != a3)
  {

    self->_configuration = (SUSearchFieldConfiguration *)[a3 copy];
    [(SUSearchFieldController *)self _reloadSearchBar];
  }
}

- (void)setSearchFieldStyle:(int64_t)a3
{
  if (self->_searchFieldStyle != a3)
  {
    v6 = [(UISearchDisplayController *)self->_searchController searchContentsController];
    self->_searchFieldStyle = a3;
    [(UISearchDisplayController *)self->_searchController setDelegate:0];
    [(UISearchDisplayController *)self->_searchController setSearchResultsDataSource:self];
    [(UISearchDisplayController *)self->_searchController setSearchResultsDelegate:self];

    id v5 = [(SUSearchFieldController *)self _newSearchDisplayControllerWithContentsController:v6];
    self->_searchController = v5;
    [(UISearchDisplayController *)v5 setDelegate:self];
    [(UISearchDisplayController *)self->_searchController setSearchResultsDataSource:self];
    [(UISearchDisplayController *)self->_searchController setSearchResultsDelegate:self];
    [(SUSearchFieldController *)self _reloadSearchBar];
  }
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  self->_completionsOperation = 0;
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  self->_completions = (NSArray *)(id)[a4 completionItems];
  v6 = [(UISearchDisplayController *)self->_searchController searchResultsTableView];

  [(UITableView *)v6 reloadData];
}

- (void)operationDidFinish:(id)a3
{
  self->_completionsOperation = 0;
}

- (void)scriptDidChangeTextForField:(id)a3
{
  v4 = [(UISearchBar *)self->_searchBar text];

  [(SUSearchFieldController *)self _saveSearchTermToDefaults:v4];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = [(UISearchDisplayController *)self->_searchController searchContentsController];
  v6 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  [v6 sendAction:sel_iTunesStoreUI_searchFieldControllerDidChange_ to:v5 from:a3 forEvent:0];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  v4 = (void *)[a3 text];
  [(SUSearchDisplayController *)self->_searchController _noEventSetSearchFieldText:v4];
  [(SUSearchDisplayController *)self->_searchController setActive:0 animated:1];
  [(SUSearchFieldController *)self _saveSearchTermToDefaults:v4];
  if ([v4 length])
  {
    [(SUSearchFieldController *)self _fetchResultsForTerm:v4 URL:0];
  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3), "userInterfaceIdiom") == 1)
  {
    if ([(NSString *)[(UISearchBar *)self->_searchBar text] length]
      && [(SUSearchFieldController *)self _focusTransientViewController])
    {
      return 0;
    }
    [(SUSearchFieldController *)self _showDimmerView];
  }
  return 1;
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  if (self->_dimmerView)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__SUSearchFieldController_searchBarShouldEndEditing___block_invoke;
    v6[3] = &unk_264812130;
    v6[4] = self;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__SUSearchFieldController_searchBarShouldEndEditing___block_invoke_2;
    v5[3] = &unk_264812908;
    v5[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v6 options:v5 animations:0.3 completion:0.0];
  }
  [(SUSearchFieldController *)self _cancelCompletionsOperation];
  return 1;
}

uint64_t __53__SUSearchFieldController_searchBarShouldEndEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:0.0];
}

uint64_t __53__SUSearchFieldController_searchBarShouldEndEditing___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDownDimmerView];
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  v4 = [(UISearchBar *)self->_searchBar text];

  [(SUSearchFieldController *)self _saveSearchTermToDefaults:v4];
}

- (void)searchBarWillRemoveFromSuperview:(id)a3
{
  BOOL hasLoadedSearchResultsTableView = self->_hasLoadedSearchResultsTableView;
  searchController = self->_searchController;
  if (!hasLoadedSearchResultsTableView)
  {
    if (![(UISearchDisplayController *)searchController isActive]) {
      return;
    }
LABEL_6:
    if (![(UISearchBar *)self->_searchBar isFirstResponder]) {
      return;
    }
    goto LABEL_7;
  }
  uint64_t v6 = [(UITableView *)[(UISearchDisplayController *)searchController searchResultsTableView] window];
  if (![(UISearchDisplayController *)self->_searchController isActive]) {
    return;
  }
  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:
  id v7 = self->_searchController;

  [(SUSearchDisplayController *)v7 setActive:0 animated:1];
}

- (BOOL)searchDisplayController:(id)a3 shouldReloadTableForSearchString:(id)a4
{
  return [a4 length] == 0;
}

- (void)searchDisplayController:(id)a3 didLoadSearchResultsTableView:(id)a4
{
  self->_BOOL hasLoadedSearchResultsTableView = 1;
}

- (void)searchDisplayController:(id)a3 willUnloadSearchResultsTableView:(id)a4
{
  self->_BOOL hasLoadedSearchResultsTableView = 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = (id)[a3 dequeueReusableCellWithIdentifier:@"a"];
  if (!v6) {
    id v6 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"a"];
  }
  id v7 = -[NSArray objectAtIndex:](self->_completions, "objectAtIndex:", [a4 row]);
  id v8 = (void *)[v7 alternateTitle];
  if (![v8 length]) {
    id v8 = (void *)[v7 title];
  }
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", v8);
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = -[NSArray objectAtIndex:](self->_completions, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  uint64_t v6 = [v5 title];
  [(SUSearchDisplayController *)self->_searchController _noEventSetSearchFieldText:v6];
  [(SUSearchDisplayController *)self->_searchController setActive:0 animated:1];
  [(SUSearchFieldController *)self _saveSearchTermToDefaults:v6];
  uint64_t v7 = [v5 URL];

  [(SUSearchFieldController *)self _fetchResultsForTerm:v6 URL:v7];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_completions count];
}

- (void)_dimmerViewAction:(id)a3
{
}

- (void)_savedSearchTermChangedNotification:(id)a3
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "searchFieldConfiguration"), "userDefaultsKey"), "isEqualToString:", -[SUSearchFieldConfiguration userDefaultsKey](self->_configuration, "userDefaultsKey")))
  {
    searchController = self->_searchController;
    id v5 = [(SUSearchFieldController *)self _defaultSearchTerm];
    [(SUSearchDisplayController *)searchController _noEventSetSearchFieldText:v5];
  }
}

- (id)_cancelButtonView
{
  v2 = [(UISearchDisplayController *)self->_searchController searchContentsController];
  if (!v2) {
    return 0;
  }
  objc_super v3 = [(UIViewController *)v2 navigationItem];
  if (sel_isEqual(sel_cancelTransientViewController_, [(UIBarButtonItem *)[(UINavigationItem *)v3 leftBarButtonItem] action]))
  {
    return (id)[(UINavigationItem *)v3 customLeftView];
  }
  if (!sel_isEqual(sel_cancelTransientViewController_, [(UIBarButtonItem *)[(UINavigationItem *)v3 rightBarButtonItem] action]))return 0; {

  }
  return (id)[(UINavigationItem *)v3 customRightView];
}

- (void)_cancelCompletionsOperation
{
  self->_completionsOperation = 0;
}

- (id)_defaultSearchTerm
{
  id result = [(SUSearchFieldConfiguration *)self->_configuration userDefaultsKey];
  if (result)
  {
    id v3 = result;
    v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    return (id)[v4 objectForKey:v3];
  }
  return result;
}

- (void)_fetchCompletions
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  id v3 = [(UISearchBar *)[(SUSearchFieldController *)self searchBar] text];
  if ([(NSString *)v3 length])
  {
    v4 = (ISStoreURLOperation *)objc_alloc_init(MEMORY[0x263F89528]);
    self->_completionsOperation = v4;
    [(ISStoreURLOperation *)v4 setDataProvider:+[ISDataProvider provider]];
    [(ISStoreURLOperation *)self->_completionsOperation setDelegate:self];
    [(ISStoreURLOperation *)self->_completionsOperation setShouldMessageMainThread:1];
    id v5 = -[SUSearchFieldConfiguration hintsURLRequestPropertiesForNetworkType:](self->_configuration, "hintsURLRequestPropertiesForNetworkType:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "networkType"));
    [v5 setValue:v3 forRequestParameter:@"q"];
    [(ISStoreURLOperation *)self->_completionsOperation setRequestProperties:v5];
    uint64_t v6 = (void *)[MEMORY[0x263F894E0] mainQueue];
    completionsOperation = self->_completionsOperation;
    [v6 addOperation:completionsOperation];
  }
}

- (void)_fetchResultsForTerm:(id)a3 URL:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SUSearchFieldController__fetchResultsForTerm_URL___block_invoke;
  v4[3] = &unk_2648141D0;
  v4[4] = a4;
  v4[5] = self;
  v4[6] = a3;
  [(SUSearchFieldController *)self _sendOnXEventWithTerm:a3 URL:a4 completionBlock:v4];
}

void __52__SUSearchFieldController__fetchResultsForTerm_URL___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v4 = *(id **)(a1 + 40);
    if (v5) {
      id v6 = (id)objc_msgSend(v4[4], "URLRequestPropertiesWithBaseURL:forNetworkType:", v5, objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "networkType"));
    }
    else {
      id v6 = (id)[v4 newRequestPropertiesWithSearchTerm:*(void *)(a1 + 48)];
    }
    id v7 = v6;
    [*(id *)(a1 + 40) _fetchResultsForURLRequestProperties:v6];
  }
}

- (void)_fetchResultsForURLRequestProperties:(id)a3
{
  id v6 = [(SUSearchFieldController *)self _targetViewController];
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUSearchFieldController.m", 493, @"Must have a target view controller");
  }

  [v6 reloadWithURLRequestProperties:a3];
}

- (BOOL)_focusTransientViewController
{
  id v3 = [(UIViewController *)[(UISearchDisplayController *)self->_searchController searchContentsController] tabBarController];
  if (!__SharedTransientViewController) {
    goto LABEL_6;
  }
  v4 = v3;
  uint64_t v5 = [(UITabBarController *)v3 transientViewController];
  if (v5 == __SharedTransientViewController) {
    goto LABEL_6;
  }
  id v6 = (void *)[(id)__SharedTransientViewController topViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  id v7 = (void *)[v6 searchFieldController];
  if (v7)
  {
    if (objc_msgSend((id)objc_msgSend(v7, "searchFieldConfiguration"), "location") == 2)
    {
LABEL_6:
      LOBYTE(v7) = 0;
      return (char)v7;
    }
    id v8 = self;
    [(UITabBarController *)v4 setTransientViewController:__SharedTransientViewController animated:0];
    LOBYTE(v7) = 1;
  }
  return (char)v7;
}

- (id)_newBlankStorePageViewController
{
  id v3 = [(SUViewController *)[SUSearchRootStorePageViewController alloc] initWithSection:[(UIViewController *)[(UISearchDisplayController *)self->_searchController searchContentsController] section]];
  [(SUViewController *)v3 setClientInterface:self->_clientInterface];
  return v3;
}

- (id)_newSearchBar
{
  id v3 = [SUSearchBar alloc];
  v4 = -[SUSearchBar initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(SUSearchBar *)v4 setAutocapitalizationType:0];
  [(SUSearchBar *)v4 setAutocorrectionType:1];
  [(SUSearchBar *)v4 setDelegate:self->_textFieldDelegate];
  return v4;
}

- (id)_newSearchDisplayControllerWithContentsController:(id)a3
{
  v4 = [(UISearchDisplayController *)[SUSearchDisplayController alloc] initWithSearchBar:[(SUSearchFieldController *)self searchBar] contentsController:a3];
  [(UISearchDisplayController *)v4 _setAllowDisablingNavigationBarHiding:1];
  [(UISearchDisplayController *)v4 setAutomaticallyShowsNoResultsMessage:0];
  [(UISearchDisplayController *)v4 setDimTableViewOnEmptySearchString:1];
  if (self->_searchFieldStyle)
  {
    [(SUSearchDisplayController *)v4 setNavigationBarHidingEnabled:1];
    [(UISearchDisplayController *)v4 _setCancelButtonManagementDisabled:0];
  }
  else
  {
    [(SUSearchDisplayController *)v4 setNavigationBarHidingEnabled:0];
    [(UISearchDisplayController *)v4 _setCancelButtonManagementDisabled:1];
    if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      [(UISearchDisplayController *)v4 setDisplaysSearchBarInNavigationBar:1];
      [(UINavigationItem *)[(UISearchDisplayController *)v4 navigationItem] setRightBarButtonItem:0];
    }
  }
  return v4;
}

- (id)_newTransientViewController
{
  id v3 = [(UIViewController *)[(UISearchDisplayController *)self->_searchController searchContentsController] section];
  id v4 = [(SUSearchFieldController *)self _newBlankStorePageViewController];
  uint64_t v5 = [[SUNavigationController alloc] initWithSection:v3 rootViewController:v4];
  -[SUNavigationController setClientInterface:](v5, "setClientInterface:", [v4 clientInterface]);

  return v5;
}

- (void)_reloadCompletionsForSearchString:(id)a3
{
  [(SUSearchFieldController *)self _cancelCompletionsOperation];
  if ([a3 length])
  {
    [(SUSearchFieldController *)self performSelector:sel__fetchCompletions withObject:0 afterDelay:0.3];
  }
  else
  {

    self->_completions = 0;
  }
}

- (void)_reloadSearchBar
{
  [(SUSearchFieldController *)self _resizeSearchBarForOrientation:[(UIViewController *)[(UISearchDisplayController *)self->_searchController searchContentsController] interfaceOrientation]];
  if (![(NSString *)[(UISearchBar *)self->_searchBar text] length]) {
    [(SUSearchDisplayController *)self->_searchController _noEventSetSearchFieldText:[(SUSearchFieldController *)self _defaultSearchTerm]];
  }
  int v3 = _UIApplicationUsesLegacyUI();
  id v4 = (void *)[(UISearchBar *)self->_searchBar searchField];
  if (v3)
  {
    if (self->_searchFieldStyle)
    {
      [(UISearchBar *)self->_searchBar setSearchFieldBackgroundImage:0 forState:0];
      [(UISearchBar *)self->_searchBar setSearchFieldBackgroundImage:0 forState:2];
      [(UISearchBar *)self->_searchBar setImage:0 forSearchBarIcon:1 state:0];
      [(UISearchBar *)self->_searchBar setImage:0 forSearchBarIcon:0 state:0];
      -[UISearchBar setPositionAdjustment:forSearchBarIcon:](self->_searchBar, "setPositionAdjustment:forSearchBarIcon:", 1, 0.0, 1.0);
      [v4 setShadowColor:0];
      uint64_t v5 = [MEMORY[0x263F1C550] blackColor];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      -[UISearchBar setSearchFieldBackgroundImage:forState:](self->_searchBar, "setSearchFieldBackgroundImage:forState:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISearch", v8), "resizableImageWithCapInsets:", 0.0, 16.0, 0.0, 16.0), 0);
      -[UISearchBar setSearchFieldBackgroundImage:forState:](self->_searchBar, "setSearchFieldBackgroundImage:forState:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISearchInactive", v8), "resizableImageWithCapInsets:", 0.0, 16.0, 0.0, 16.0), 2);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", [MEMORY[0x263F1C6B0] imageNamed:@"UISearchBarClear" inBundle:v8], 1, 0);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", [MEMORY[0x263F1C6B0] imageNamed:@"UISearchBarClearPressed" inBundle:v8], 1, 1);
      -[UISearchBar setPositionAdjustment:forSearchBarIcon:](self->_searchBar, "setPositionAdjustment:forSearchBarIcon:", 1, 0.0, -1.0);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", [MEMORY[0x263F1C6B0] imageNamed:@"UISearchBarResultsList" inBundle:v8], 3, 0);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", [MEMORY[0x263F1C6B0] imageNamed:@"UISearchBarResultsListPressed" inBundle:v8], 3, 1);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", [MEMORY[0x263F1C6B0] imageNamed:@"UISearchBarSearch" inBundle:v8], 0, 0);
      objc_msgSend(v4, "setShadowColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.08, 1.0));
      objc_msgSend(v4, "setShadowOffset:", 0.0, -1.0);
      uint64_t v5 = [MEMORY[0x263F1C550] colorWithWhite:0.73 alpha:1.0];
    }
    [v4 setTextColor:v5];
  }
  else
  {
    objc_msgSend(v4, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:", 14.0));
    searchBar = self->_searchBar;
    if (self->_searchFieldStyle)
    {
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 1;
      }
    }
    else
    {
      uint64_t v7 = 2;
    }
    [(UISearchBar *)searchBar setSearchBarStyle:v7];
  }
  [(UISearchBar *)self->_searchBar setPlaceholder:[(SUSearchFieldConfiguration *)self->_configuration placeholderString]];
  v9 = self->_searchBar;
  BOOL v10 = self->_searchFieldStyle != 0;

  [(UISearchBar *)v9 setDrawsBackground:v10];
}

- (void)_resizeSearchBarForOrientation:(int64_t)a3
{
  -[SUSearchFieldConfiguration widthForOrientation:](self->_configuration, "widthForOrientation:");
  double v6 = v5;
  if (v5 < 0.00000011920929)
  {
    objc_msgSend(+[SUSearchFieldConfiguration defaultConfigurationWithClientInterface:](SUSearchFieldConfiguration, "defaultConfigurationWithClientInterface:", self->_clientInterface), "widthForOrientation:", a3);
    double v6 = v7;
  }
  [(UISearchBar *)self->_searchBar frame];
  double v9 = v8;
  double v11 = v10;
  -[UISearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", v6, 0.0);
  -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v9, v11, v12, v13);
  uint64_t v14 = (void *)[(UISearchBar *)self->_searchBar superview];

  [v14 setNeedsLayout];
}

- (void)_saveSearchTermToDefaults:(id)a3
{
  double v5 = [(SUSearchFieldConfiguration *)self->_configuration userDefaultsKey];
  if (v5)
  {
    double v6 = v5;
    uint64_t v7 = [a3 length];
    double v8 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    if (v7) {
      [v8 setObject:a3 forKey:v6];
    }
    else {
      [v8 removeObjectForKey:v6];
    }
    double v9 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v9 postNotificationName:@"SUSearchFieldControllerSavedSearchTermNotification" object:self];
  }
}

- (id)_searchGroupForSearchKind:(id)a3
{
  if (([a3 isEqualToString:@"epubBook"] & 1) != 0
    || ([a3 isEqualToString:@"metaEbook"] & 1) != 0
    || ([a3 isEqualToString:@"ibook"] & 1) != 0
    || ([a3 isEqualToString:@"ibookTextbook"] & 1) != 0)
  {
    return @"ebook";
  }
  if ([a3 isEqualToString:@"book"]) {
    return @"audiobook";
  }
  if (([a3 isEqualToString:@"iMix"] & 1) != 0
    || ([a3 isEqualToString:@"itunesMix"] & 1) != 0
    || ([a3 isEqualToString:@"mix"] & 1) != 0
    || ([a3 isEqualToString:@"preorderAlbum"] & 1) != 0)
  {
    return @"album";
  }
  if ([a3 isEqualToString:@"shortFilm"]) {
    return @"movie";
  }
  if ([a3 isEqualToString:@"tvEpisode"]) {
    return @"tvSeason";
  }
  if ([a3 isEqualToString:@"podcastEpisode"]) {
    return @"podcast";
  }
  if ([a3 isEqualToString:@"tone"]) {
    return @"ringtone";
  }
  if ([a3 isEqualToString:@"course"]) {
    return @"iTunesUCourse";
  }
  return a3;
}

- (void)_sendOnXEventWithTerm:(id)a3 URL:(id)a4 completionBlock:(id)a5
{
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", @"search", @"type", 0);
  double v10 = v9;
  if (a3) {
    [v9 setObject:a3 forKey:@"term"];
  }
  if (a4) {
    objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a4, "absoluteString"), @"url");
  }
  clientInterface = self->_clientInterface;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__SUSearchFieldController__sendOnXEventWithTerm_URL_completionBlock___block_invoke;
  v12[3] = &unk_264812830;
  v12[4] = a5;
  [(SUClientInterface *)clientInterface _dispatchXEvent:v10 withCompletionBlock:v12];
}

void __69__SUSearchFieldController__sendOnXEventWithTerm_URL_completionBlock___block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __69__SUSearchFieldController__sendOnXEventWithTerm_URL_completionBlock___block_invoke_2;
  v2[3] = &unk_2648141F8;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __69__SUSearchFieldController__sendOnXEventWithTerm_URL_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_showDimmerView
{
  if (_UIApplicationUsesLegacyUI())
  {
    dimmerView = self->_dimmerView;
    if (!dimmerView)
    {
      id v4 = (UIControl *)objc_alloc_init(MEMORY[0x263F1C598]);
      self->_dimmerView = v4;
      [(UIControl *)v4 setAutoresizingMask:18];
      -[UIControl setBackgroundColor:](self->_dimmerView, "setBackgroundColor:", [MEMORY[0x263F1C550] blackColor]);
      [(UIControl *)self->_dimmerView addTarget:self action:sel__dimmerViewAction_ forControlEvents:64];
      dimmerView = self->_dimmerView;
    }
    if (![(UIControl *)dimmerView superview])
    {
      double v5 = [(UISearchDisplayController *)self->_searchController searchContentsController];
      [(UIControl *)self->_dimmerView setAlpha:0.0];
      double v6 = [(UIViewController *)v5 parentViewController];
      if (v6)
      {
        uint64_t v7 = [(UIViewController *)v6 view];
        double v8 = [(UIViewController *)v5 view];
        [(UIView *)v8 frame];
        -[UIView convertRect:fromView:](v7, "convertRect:fromView:", [(UIView *)v8 superview], v9, v10, v11, v12);
      }
      else
      {
        uint64_t v7 = [(UIViewController *)v5 view];
        [(UIView *)v7 bounds];
      }
      -[UIControl setFrame:](self->_dimmerView, "setFrame:");
      [(UIView *)v7 addSubview:self->_dimmerView];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __42__SUSearchFieldController__showDimmerView__block_invoke;
      v13[3] = &unk_264812130;
      v13[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v13 options:&__block_literal_global_11 animations:0.3 completion:0.0];
    }
  }
}

uint64_t __42__SUSearchFieldController__showDimmerView__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  UIInterfaceGetContentDisabledAlpha();

  return objc_msgSend(v1, "setAlpha:");
}

- (id)_targetViewController
{
  char v3 = [(UISearchDisplayController *)self->_searchController searchContentsController];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    if (__SharedTransientViewController)
    {
      id v4 = [(SUSearchFieldController *)self _newBlankStorePageViewController];
      objc_msgSend((id)__SharedTransientViewController, "setViewControllers:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, 0));

      id v5 = (id)__SharedTransientViewController;
    }
    else
    {
      id v5 = [(SUSearchFieldController *)self _newTransientViewController];
      __SharedTransientViewController = (uint64_t)v5;
    }
    double v6 = (void *)[v5 topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v6 = (void *)[v6 embeddedViewController];
    }
    uint64_t v7 = self;
    double v8 = [(UIViewController *)v3 tabBarController];
    [(UITabBarController *)v8 setTransientViewController:__SharedTransientViewController animated:0];
    return v6;
  }
  return v3;
}

- (void)_tearDownDimmerView
{
  self->_dimmerView = 0;
}

- (SUSearchFieldConfiguration)searchFieldConfiguration
{
  return self->_configuration;
}

- (int64_t)searchFieldStyle
{
  return self->_searchFieldStyle;
}

@end