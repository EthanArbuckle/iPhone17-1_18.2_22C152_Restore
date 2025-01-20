@interface SUUISearchBarController
- (BOOL)canBecomeActive;
- (BOOL)displaysSearchBarInNavigationBar;
- (BOOL)showsResultsForEmptyField;
- (SUUIClientContext)clientContext;
- (SUUISearchBarController)initWithSearchBarViewElement:(id)a3;
- (SUUISearchBarViewElement)searchBarViewElement;
- (UISearchBar)searchBar;
- (UIViewController)parentViewController;
- (id)_newSearchFieldController;
- (id)_searchFieldController;
- (void)_cancelGestureAction:(id)a3;
- (void)_customizeSearchBar:(id)a3;
- (void)_customizeSearchFieldController:(id)a3;
- (void)_dispatchChangeEventWithText:(id)a3;
- (void)_dispatchSubmitEventWithText:(id)a3 URL:(id)a4 searchHintOriginalTerm:(id)a5 searchHintIndex:(id)a6;
- (void)_removeCancelTouchGestureRecognizer;
- (void)becomeActive;
- (void)dealloc;
- (void)reloadAfterDocumentUpdate;
- (void)resignActive:(BOOL)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchFieldController:(id)a3 requestSearch:(id)a4;
- (void)searchFieldController:(id)a3 searchBarDidChangeText:(id)a4;
- (void)setClientContext:(id)a3;
- (void)setDisplaysSearchBarInNavigationBar:(BOOL)a3;
- (void)setParentViewController:(id)a3;
- (void)setSearchBarViewElement:(id)a3;
- (void)setShowsResultsForEmptyField:(BOOL)a3;
@end

@implementation SUUISearchBarController

- (SUUISearchBarController)initWithSearchBarViewElement:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUISearchBarController;
  v6 = [(SUUISearchBarController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewElement, a3);
    uint64_t v8 = [(SUUISearchBarViewElement *)v7->_viewElement searchHintsURLString];
    uint64_t v9 = [(SUUISearchBarViewElement *)v7->_viewElement trendingSearchURLString];
    if (v8 | v9) {
      v7->_usesSearchFieldController = 1;
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v3 = 48;
  if (!self->_usesSearchFieldController) {
    uint64_t v3 = 40;
  }
  [*(id *)((char *)&self->super.isa + v3) setDelegate:0];
  [(SUUIFocusedTouchGestureRecognizer *)self->_cancelTouchGestureRecognizer removeTarget:self action:0];
  v4.receiver = self;
  v4.super_class = (Class)SUUISearchBarController;
  [(SUUISearchBarController *)&v4 dealloc];
}

- (void)reloadAfterDocumentUpdate
{
  if (self->_searchFieldController)
  {
    -[SUUISearchBarController _customizeSearchFieldController:](self, "_customizeSearchFieldController:");
    id v3 = [(SUUISearchFieldController *)self->_searchFieldController searchBar];
    [(SUUISearchBarController *)self _customizeSearchBar:v3];
  }
}

- (BOOL)canBecomeActive
{
  return [(SUUISearchFieldController *)self->_searchFieldController canBecomeActive];
}

- (void)becomeActive
{
}

- (void)resignActive:(BOOL)a3
{
}

- (UISearchBar)searchBar
{
  if (!self->_searchBar)
  {
    if (self->_usesSearchFieldController)
    {
      id v3 = [(SUUISearchBarController *)self _searchFieldController];
      objc_super v4 = [v3 searchBar];
      searchBar = self->_searchBar;
      self->_searchBar = v4;
    }
    else
    {
      id v3 = [(SUUISearchBarController *)self _newSearchFieldController];
      v6 = [v3 searchBar];
      v7 = self->_searchBar;
      self->_searchBar = v6;

      [(UISearchBar *)self->_searchBar setDelegate:self];
    }
  }
  uint64_t v8 = self->_searchBar;
  return v8;
}

- (void)setDisplaysSearchBarInNavigationBar:(BOOL)a3
{
  if (self->_displaysSearchBarInNavigationBar != a3)
  {
    self->_displaysSearchBarInNavigationBar = a3;
    -[SUUISearchFieldController setDisplaysSearchBarInNavigationBar:](self->_searchFieldController, "setDisplaysSearchBarInNavigationBar:");
  }
}

- (void)setSearchBarViewElement:(id)a3
{
  id v5 = (SUUISearchBarViewElement *)a3;
  p_viewElement = &self->_viewElement;
  if (self->_viewElement != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_viewElement, a3);
    p_viewElement = (SUUISearchBarViewElement **)[(SUUISearchBarController *)self reloadAfterDocumentUpdate];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_viewElement, v5);
}

- (void)searchFieldController:(id)a3 requestSearch:(id)a4
{
  id v5 = a4;
  v6 = [v5 term];
  +[SUUIIPadSearchController setLastSearchTerm:v6];

  id v10 = [v5 term];
  v7 = [v5 URL];
  uint64_t v8 = [v5 searchHintOriginalTerm];
  uint64_t v9 = [v5 searchHintIndex];

  [(SUUISearchBarController *)self _dispatchSubmitEventWithText:v10 URL:v7 searchHintOriginalTerm:v8 searchHintIndex:v9];
}

- (void)searchFieldController:(id)a3 searchBarDidChangeText:(id)a4
{
  id v5 = a4;
  +[SUUIIPadSearchController setLastSearchTerm:v5];
  [(SUUISearchBarController *)self _dispatchChangeEventWithText:v5];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v11 = a3;
  cancelTouchGestureRecognizer = self->_cancelTouchGestureRecognizer;
  if (cancelTouchGestureRecognizer)
  {
    [(SUUIFocusedTouchGestureRecognizer *)cancelTouchGestureRecognizer removeTarget:self action:0];
    id v5 = [(SUUIFocusedTouchGestureRecognizer *)self->_cancelTouchGestureRecognizer view];
    [v5 removeGestureRecognizer:self->_cancelTouchGestureRecognizer];

    v6 = self->_cancelTouchGestureRecognizer;
    self->_cancelTouchGestureRecognizer = 0;
  }
  v7 = [SUUIFocusedTouchGestureRecognizer alloc];
  uint64_t v8 = -[SUUIFocusedTouchGestureRecognizer initWithFocusedView:touchAllowance:](v7, "initWithFocusedView:touchAllowance:", v11, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  uint64_t v9 = self->_cancelTouchGestureRecognizer;
  self->_cancelTouchGestureRecognizer = v8;

  [(SUUIFocusedTouchGestureRecognizer *)self->_cancelTouchGestureRecognizer addTarget:self action:sel__cancelGestureAction_];
  id v10 = [v11 window];
  [v10 addGestureRecognizer:self->_cancelTouchGestureRecognizer];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  [v4 resignFirstResponder];
  id v5 = [v4 text];

  [(SUUISearchBarController *)self _dispatchSubmitEventWithText:v5 URL:0 searchHintOriginalTerm:0 searchHintIndex:0];
}

- (void)_cancelGestureAction:(id)a3
{
  if (self->_cancelTouchGestureRecognizer == a3)
  {
    [(UISearchBar *)self->_searchBar resignFirstResponder];
    [(SUUISearchBarController *)self _removeCancelTouchGestureRecognizer];
  }
}

- (void)_customizeSearchBar:(id)a3
{
  id v10 = a3;
  id v4 = [v10 searchField];
  id v5 = [(SUUISearchBarViewElement *)self->_viewElement style];
  v6 = SUUIViewElementPlainColorWithStyle(v5, 0);

  if (v6) {
    [v4 setTextColor:v6];
  }
  if (([v10 isFirstResponder] & 1) == 0)
  {
    v7 = [(SUUISearchBarViewElement *)self->_viewElement defaultText];
    uint64_t v8 = [v7 string];
    [v4 setText:v8];
  }
  uint64_t v9 = [(SUUISearchBarViewElement *)self->_viewElement placeholderString];
  [v4 setPlaceholder:v9];
}

- (void)_customizeSearchFieldController:(id)a3
{
  viewElement = self->_viewElement;
  id v5 = a3;
  v6 = [(SUUISearchBarViewElement *)viewElement accessoryText];
  [v5 setSearchBarAccessoryText:v6];

  v7 = [(SUUISearchBarViewElement *)self->_viewElement searchHintsURLString];
  [v5 setSearchHintsURLString:v7];

  id v8 = [(SUUISearchBarViewElement *)self->_viewElement trendingSearchURLString];
  [v5 setTrendingSearchURLString:v8];
}

- (void)_dispatchChangeEventWithText:(id)a3
{
  id v4 = (objc_class *)NSDictionary;
  id v5 = a3;
  id v6 = (id)objc_msgSend([v4 alloc], "initWithObjectsAndKeys:", v5, @"term", 0);

  [(SUUISearchBarViewElement *)self->_viewElement dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v6 completionBlock:0];
}

- (void)_dispatchSubmitEventWithText:(id)a3 URL:(id)a4 searchHintOriginalTerm:(id)a5 searchHintIndex:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v14 = v13;
  if (v16) {
    [v13 setObject:v16 forKey:@"term"];
  }
  if (v10)
  {
    v15 = [v10 absoluteString];
    [v14 setObject:v15 forKey:@"url"];
  }
  if (v11) {
    [v14 setObject:v11 forKey:@"searchHintOriginalTerm"];
  }
  if (v12) {
    [v14 setObject:v12 forKey:@"searchHintIndex"];
  }
  if ([v14 count]) {
    [(SUUISearchBarViewElement *)self->_viewElement dispatchEventOfType:14 canBubble:1 isCancelable:1 extraInfo:v14 completionBlock:0];
  }
}

- (id)_newSearchFieldController
{
  id v3 = [SUUISearchFieldController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  id v5 = [(SUUISearchFieldController *)v3 initWithContentsController:WeakRetained clientContext:self->_clientContext];

  [(SUUISearchBarController *)self _customizeSearchFieldController:v5];
  if (self->_displaysSearchBarInNavigationBar) {
    [(SUUISearchFieldController *)v5 setDisplaysSearchBarInNavigationBar:1];
  }
  if (self->_showsResultsForEmptyField) {
    [(SUUISearchFieldController *)v5 setShowsResultsForEmptyField:1];
  }
  id v6 = [(SUUISearchFieldController *)v5 searchBar];
  [(SUUISearchBarController *)self _customizeSearchBar:v6];

  return v5;
}

- (void)_removeCancelTouchGestureRecognizer
{
  [(SUUIFocusedTouchGestureRecognizer *)self->_cancelTouchGestureRecognizer removeTarget:self action:0];
  id v3 = [(SUUIFocusedTouchGestureRecognizer *)self->_cancelTouchGestureRecognizer view];
  [v3 removeGestureRecognizer:self->_cancelTouchGestureRecognizer];

  cancelTouchGestureRecognizer = self->_cancelTouchGestureRecognizer;
  self->_cancelTouchGestureRecognizer = 0;
}

- (id)_searchFieldController
{
  searchFieldController = self->_searchFieldController;
  if (!searchFieldController)
  {
    id v4 = [(SUUISearchBarController *)self _newSearchFieldController];
    id v5 = self->_searchFieldController;
    self->_searchFieldController = v4;

    [(SUUISearchFieldController *)self->_searchFieldController setDelegate:self];
    searchFieldController = self->_searchFieldController;
  }
  return searchFieldController;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (BOOL)displaysSearchBarInNavigationBar
{
  return self->_displaysSearchBarInNavigationBar;
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (SUUISearchBarViewElement)searchBarViewElement
{
  return self->_viewElement;
}

- (BOOL)showsResultsForEmptyField
{
  return self->_showsResultsForEmptyField;
}

- (void)setShowsResultsForEmptyField:(BOOL)a3
{
  self->_showsResultsForEmptyField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_searchFieldController, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_cancelTouchGestureRecognizer, 0);
}

@end