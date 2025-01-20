@interface STSSearchBrowserRootViewController
- (BOOL)isPickerVisible;
- (BOOL)requestedExpandedPresentation;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (NSString)conversationID;
- (STSCategoryViewController)categoryViewController;
- (STSFeedbackReporter)feedbackReporter;
- (STSPicker)pickerViewController;
- (STSPickerSelectionDelegate)pickerSelectionDelegate;
- (STSSearchBrowserHeaderView)searchHeaderView;
- (STSSearchBrowserRootViewController)initWithSearchModel:(id)a3;
- (STSSearchBrowserRootViewControllerDelegate)selectionDelegate;
- (STSSearchModel)searchModel;
- (STSSuggestionViewController)suggestionViewController;
- (unint64_t)presentationStyle;
- (void)_addQueryToRecents:(id)a3;
- (void)_clearRecents;
- (void)_clearSuggestions;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_showLegalNotice;
- (void)_transitionContentFromViewController:(id)a3 toViewController:(id)a4 completion:(id)a5;
- (void)_updateContentInsets;
- (void)categoryViewController:(id)a3 didSelectCategory:(id)a4 suggested:(BOOL)a5;
- (void)categoryViewController:(id)a3 didSelectRecent:(id)a4;
- (void)categoryViewControllerDidSelectClearRecentsButton:(id)a3;
- (void)categoryViewControllerScrollViewWillBeginDragging:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)fetchCategories;
- (void)loadView;
- (void)resetContentOffset;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)sendVisibleResultsFeedback;
- (void)setBottomInset:(double)a3;
- (void)setCategoryViewController:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setPickerSelectionDelegate:(id)a3;
- (void)setPickerViewController:(id)a3;
- (void)setPresentationStyle:(unint64_t)a3;
- (void)setRequestedExpandedPresentation:(BOOL)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setSuggestionViewController:(id)a3;
- (void)setTopInset:(double)a3;
- (void)showCategories;
- (void)showPickerAndPerformQuery:(id)a3 requestType:(int64_t)a4;
- (void)showSuggestions;
- (void)suggestionViewController:(id)a3 didSelectSuggestionAtIndex:(unint64_t)a4;
- (void)suggestionViewControllerDidTapLogo:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STSSearchBrowserRootViewController

- (STSSearchBrowserRootViewController)initWithSearchModel:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)STSSearchBrowserRootViewController;
  v6 = [(STSSearchBrowserRootViewController *)&v24 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    p_searchModel = (id *)&v6->_searchModel;
    objc_storeStrong((id *)&v6->_searchModel, a3);
    v9 = objc_alloc_init(STSSuggestionViewController);
    suggestionViewController = v7->_suggestionViewController;
    v7->_suggestionViewController = v9;

    [(STSSuggestionViewController *)v7->_suggestionViewController setSearchModel:*p_searchModel];
    [*p_searchModel setQuerySuggestionsDelegate:v7->_suggestionViewController];
    [(STSSuggestionViewController *)v7->_suggestionViewController setSelectionDelegate:v7];
    [(STSSuggestionViewController *)v7->_suggestionViewController setAutomaticallyAdjustsScrollViewInsets:0];
    v11 = [[STSPicker alloc] initWithSearchModel:*p_searchModel showSuggestions:0];
    pickerViewController = v7->_pickerViewController;
    v7->_pickerViewController = v11;

    [*p_searchModel setDelegate:v7->_pickerViewController];
    v13 = objc_alloc_init(STSCategoryViewController);
    categoryViewController = v7->_categoryViewController;
    v7->_categoryViewController = v13;

    [(STSCategoryViewController *)v7->_categoryViewController setSelectionDelegate:v7];
    [(STSCategoryViewController *)v7->_categoryViewController setSearchModel:*p_searchModel];
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v7 selector:sel__keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v7 selector:sel__keyboardWillHide_ name:*MEMORY[0x263F83800] object:0];

    v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v18 = [v17 objectForKey:@"STSRecentQueries"];
    uint64_t v19 = [v18 mutableCopy];
    recentQueries = v7->_recentQueries;
    v7->_recentQueries = (NSMutableArray *)v19;

    if (!v7->_recentQueries)
    {
      uint64_t v21 = objc_opt_new();
      v22 = v7->_recentQueries;
      v7->_recentQueries = (NSMutableArray *)v21;
    }
    [(STSSearchBrowserRootViewController *)v7 setRequestedExpandedPresentation:0];
    v7->_didSendCategoryResultFeedback = 0;
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STSSearchBrowserRootViewController;
  [(STSSearchBrowserRootViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v5 = objc_alloc_init(STSSearchBrowserRootView);
  v3 = objc_alloc_init(STSSearchBrowserHeaderView);
  [(STSSearchBrowserHeaderView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v4 = [(STSSearchBrowserHeaderView *)v3 searchBar];
  [v4 setDelegate:self];

  [(STSSearchBrowserRootView *)v5 setHeaderView:v3];
  [(STSSearchBrowserRootViewController *)self setView:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(STSSearchBrowserRootViewController *)self _updateContentInsets];
  v28.receiver = self;
  v28.super_class = (Class)STSSearchBrowserRootViewController;
  [(STSSearchBrowserRootViewController *)&v28 viewWillAppear:v3];
  id v5 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  v6 = [v5 searchBar];
  v7 = [v6 text];
  uint64_t v8 = [v7 length];

  if (!v8) {
    goto LABEL_4;
  }
  v9 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  v10 = [v9 searchBar];
  v11 = [v10 text];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
    v14 = [v13 searchBar];
    v15 = [v14 searchTextField];
    v16 = [v15 endOfDocument];

    v17 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
    v18 = [v17 searchBar];
    uint64_t v19 = [v18 searchTextField];
    v20 = [v19 endOfDocument];

    uint64_t v21 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
    v22 = [v21 searchBar];
    v23 = [v22 searchTextField];
    objc_super v24 = [v23 textRangeFromPosition:v16 toPosition:v20];

    v25 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
    v26 = [v25 searchBar];
    v27 = [v26 searchTextField];
    [v27 setSelectedTextRange:v24];
  }
  else
  {
LABEL_4:
    [(STSSearchBrowserRootViewController *)self showCategories];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  self->_didSendCategoryResultFeedback = 0;
}

- (void)didMoveToParentViewController:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)STSSearchBrowserRootViewController;
  [(STSSearchBrowserRootViewController *)&v3 didMoveToParentViewController:a3];
}

- (void)suggestionViewController:(id)a3 didSelectSuggestionAtIndex:(unint64_t)a4
{
  v6 = [(STSPicker *)self->_pickerViewController querySuggestions];
  id v14 = [v6 objectAtIndex:a4];

  v7 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  uint64_t v8 = [v7 searchBar];
  v9 = [v14 suggestion];
  [v8 setText:v9];

  v10 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  v11 = [v10 searchBar];
  [v11 resignFirstResponder];

  uint64_t v12 = [v14 suggestion];
  [(STSSearchBrowserRootViewController *)self showPickerAndPerformQuery:v12 requestType:2];

  v13 = +[STSFeedbackReporter sharedInstance];
  [v13 didSearchWithSuggestedQuery:v14];

  [(STSSearchBrowserRootViewController *)self _clearSuggestions];
}

- (void)suggestionViewControllerDidTapLogo:(id)a3
{
  objc_super v4 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  id v5 = [v4 searchBar];
  id v13 = [v5 text];

  v6 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v7 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v6];

  uint64_t v8 = NSURL;
  v9 = [NSString stringWithFormat:@"http://www.bing.com/images/search?q=%@", v7];
  v10 = [v8 URLWithString:v9];

  v11 = +[STSFeedbackReporter sharedInstance];
  [v11 didEngageProviderLogo];

  uint64_t v12 = [(STSSearchBrowserRootViewController *)self extensionContext];
  [v12 openURL:v10 completionHandler:0];
}

- (void)categoryViewController:(id)a3 didSelectCategory:(id)a4 suggested:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  uint64_t v8 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  v9 = [v8 searchBar];
  [v9 setText:v7];

  v10 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  v11 = [v10 searchBar];
  [v11 resignFirstResponder];

  if (v5) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 5;
  }
  [(STSSearchBrowserRootViewController *)self showPickerAndPerformQuery:v7 requestType:v12];

  [(STSSearchBrowserRootViewController *)self _clearSuggestions];
}

- (void)categoryViewController:(id)a3 didSelectRecent:(id)a4
{
  id v5 = a4;
  v6 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  id v7 = [v6 searchBar];
  [v7 setText:v5];

  uint64_t v8 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  v9 = [v8 searchBar];
  [v9 resignFirstResponder];

  [(STSSearchBrowserRootViewController *)self showPickerAndPerformQuery:v5 requestType:6];

  [(STSSearchBrowserRootViewController *)self _clearSuggestions];
}

- (void)categoryViewControllerDidSelectClearRecentsButton:(id)a3
{
  [(STSSearchBrowserRootViewController *)self _clearRecents];
  id v3 = +[STSFeedbackReporter sharedInstance];
  [v3 didClearRecents];
}

- (void)categoryViewControllerScrollViewWillBeginDragging:(id)a3
{
  id v4 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  id v3 = [v4 searchBar];
  [v3 resignFirstResponder];
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  [(STSCategoryViewController *)self->_categoryViewController sendVisibleResultsFeedback];
  id v4 = [(STSSearchBrowserRootViewController *)self selectionDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 1;
  }
  v6 = [(STSSearchBrowserRootViewController *)self selectionDelegate];
  char v7 = [v6 searchBrowserRootViewControllerSearchBarShouldBeginEditing:self];

  return v7;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v11 = a3;
  id v4 = [(STSSearchBrowserRootViewController *)self pickerViewController];
  [v4 cancelImageDownloads];

  currentChildViewController = self->_currentChildViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_legalNoticeViewController);
  LOBYTE(currentChildViewController) = [(UIViewController *)currentChildViewController isEqual:WeakRetained];

  if ((currentChildViewController & 1) == 0)
  {
    char v7 = [v11 text];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      v9 = [(STSSearchBrowserRootViewController *)self pickerViewController];
      v10 = [v11 text];
      [v9 performSearchWithQueryString:v10 requestType:0];

      [(STSSearchBrowserRootViewController *)self showSuggestions];
    }
    else
    {
      [(STSSearchBrowserRootViewController *)self showCategories];
    }
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = [(STSSearchBrowserRootViewController *)self pickerViewController];
  [v4 cancelImageDownloads];

  char v5 = [(STSSearchBrowserRootViewController *)self pickerViewController];
  [v5 resetContent];

  v6 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  char v7 = [v6 searchBar];
  [v7 setText:0];

  [(STSSearchBrowserRootViewController *)self _clearSuggestions];
  uint64_t v8 = [(STSSearchBrowserRootViewController *)self selectionDelegate];
  [v8 searchBrowserRootViewControllerDidSelectCancel:self];

  id v9 = +[STSFeedbackReporter sharedInstance];
  [v9 searchBarDidCancel];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  char v5 = [(STSSearchBrowserRootViewController *)self pickerViewController];
  [v5 resetContent];

  [v4 resignFirstResponder];
  id v7 = [v4 text];

  [(STSSearchBrowserRootViewController *)self showPickerAndPerformQuery:v7 requestType:8];
  v6 = +[STSFeedbackReporter sharedInstance];
  [v6 didSearchWithCustomQuery:v7];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ((unint64_t)[v6 length] <= 0xC7)
  {
    id v7 = [v12 searchTextField];
    uint64_t v8 = [v7 text];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      v10 = [(STSSearchBrowserRootViewController *)self pickerViewController];
      [v10 performSearchWithQueryString:v6 requestType:0];

      [(STSSearchBrowserRootViewController *)self showSuggestions];
    }
    else
    {
      id v11 = +[STSFeedbackReporter sharedInstance];
      [v11 didClearSearchBarInput];

      +[STSSearchModel incrementClientQueryId];
      [(STSSearchBrowserRootViewController *)self _clearSuggestions];
      [(STSSearchBrowserRootViewController *)self showCategories];
    }
  }
}

- (void)_clearSuggestions
{
  id v2 = [(STSSearchBrowserRootViewController *)self suggestionViewController];
  [v2 clearSuggestions];
}

- (void)showPickerAndPerformQuery:(id)a3 requestType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(STSSearchBrowserRootViewController *)self pickerViewController];
  [v7 resetContent];

  [(STSSearchBrowserRootViewController *)self _addQueryToRecents:v6];
  if (a4 == 3
    && ([MEMORY[0x263EFFA40] standardUserDefaults],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = objc_msgSend(v8, "sts_legalNoticeCount"),
        v8,
        v9 < 3))
  {
    v10 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
    id v11 = [v10 searchBar];
    [v11 setText:v6];

    [(STSSearchBrowserRootViewController *)self _showLegalNotice];
  }
  else
  {
    if ([(UIViewController *)self->_currentChildViewController isEqual:self->_pickerViewController])
    {
      if (v6)
      {
        id v12 = [(STSSearchBrowserRootViewController *)self pickerViewController];
        [v12 performSearchWithQueryString:v6 requestType:a4];
      }
    }
    else
    {
      currentChildViewController = self->_currentChildViewController;
      pickerViewController = self->_pickerViewController;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __76__STSSearchBrowserRootViewController_showPickerAndPerformQuery_requestType___block_invoke;
      v17[3] = &unk_264A05A70;
      id v18 = v6;
      uint64_t v19 = self;
      int64_t v20 = a4;
      [(STSSearchBrowserRootViewController *)self _transitionContentFromViewController:currentChildViewController toViewController:pickerViewController completion:v17];
    }
    v15 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
    v16 = [v15 searchBar];
    [v16 setText:v6];
  }
}

void __76__STSSearchBrowserRootViewController_showPickerAndPerformQuery_requestType___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) pickerViewController];
    [v2 performSearchWithQueryString:*(void *)(a1 + 32) requestType:*(void *)(a1 + 48)];
  }
}

- (void)showCategories
{
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v4 = objc_msgSend(v3, "sts_legalNoticeCount");

  if (v4 >= 3)
  {
    categoryViewController = self->_categoryViewController;
    if ((STSCategoryViewController *)self->_currentChildViewController == categoryViewController)
    {
      if (!self->_didSendCategoryResultFeedback)
      {
        self->_didSendCategoryResultFeedback = 1;
        [(STSCategoryViewController *)self->_categoryViewController sendRankSectionsFeedback];
        id v7 = self->_categoryViewController;
        [(STSCategoryViewController *)v7 sendVisibleResultsFeedback];
      }
    }
    else
    {
      [(STSCategoryViewController *)categoryViewController updateRecents:self->_recentQueries];
      [(STSSearchBrowserRootViewController *)self _transitionContentFromViewController:self->_currentChildViewController toViewController:self->_categoryViewController completion:0];
      if (!self->_didSendCategoryResultFeedback)
      {
        self->_didSendCategoryResultFeedback = 1;
        [(STSCategoryViewController *)self->_categoryViewController sendRankSectionsFeedback];
        id v6 = self->_categoryViewController;
        [(STSCategoryViewController *)v6 setSendFeedbackOnViewDidAppear:1];
      }
    }
  }
  else
  {
    [(STSSearchBrowserRootViewController *)self _showLegalNotice];
  }
}

- (void)showSuggestions
{
  if (self->_currentChildViewController != &self->_suggestionViewController->super) {
    -[STSSearchBrowserRootViewController _transitionContentFromViewController:toViewController:completion:](self, "_transitionContentFromViewController:toViewController:completion:");
  }
}

void __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 976) isEqual:*(void *)(*(void *)(a1 + 32) + 1048)])
  {
    [*(id *)(a1 + 32) _updateContentInsets];
    id v2 = [*(id *)(a1 + 32) searchHeaderView];
    id v3 = [v2 searchBar];
    uint64_t v4 = [v3 text];
    uint64_t v5 = [v4 length];

    if (v5)
    {
LABEL_11:
      v15 = [*(id *)(a1 + 32) pickerViewController];
      [v15 resetContent];

      return;
    }
    id v6 = [*(id *)(a1 + 32) suggestionViewController];
    [v6 clearSuggestions];

    id v7 = [*(id *)(*(void *)(a1 + 32) + 1088) predictedSuggestions];
    uint64_t v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1016), "sts_map:", &__block_literal_global_2);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke_3;
    v16[3] = &unk_264A05CB8;
    id v10 = v8;
    id v17 = v10;
    [v9 enumerateObjectsUsingBlock:v16];
    if (v10)
    {
      id v11 = v10;
      id v12 = v11;
      if (v9)
      {
        uint64_t v13 = [v11 arrayByAddingObjectsFromArray:v9];

        id v12 = (id)v13;
        if (!v13) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      if (!v9)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v12 = v9;
    }
    id v14 = [*(id *)(a1 + 32) suggestionViewController];
    [v14 updateQuerySuggestions:v12];

    goto LABEL_10;
  }
}

id __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F67A10];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithSuggestion:v3 query:v3 score:3 type:0.0];

  return v4;
}

void __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke_4;
  id v11 = &unk_264A05440;
  id v12 = v3;
  id v13 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:&v8];
  objc_msgSend(*(id *)(a1 + 32), "removeObjectsInArray:", v6, v8, v9, v10, v11);
}

void __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) suggestion];
  id v4 = [v3 lowercaseString];
  uint64_t v5 = [v8 suggestion];
  id v6 = [v5 lowercaseString];
  int v7 = [v4 isEqualToString:v6];

  if (v7) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)_showLegalNotice
{
  currentChildViewController = self->_currentChildViewController;
  p_legalNoticeViewController = &self->_legalNoticeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_legalNoticeViewController);
  LOBYTE(currentChildViewController) = [(UIViewController *)currentChildViewController isEqual:WeakRetained];

  if ((currentChildViewController & 1) == 0)
  {
    id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v7 = objc_msgSend(v6, "sts_legalNoticeCount") + 1;

    id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    objc_msgSend(v8, "sts_setLegalNoticeCount:", v7);

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F82E10]) initWithNibName:0 bundle:0];
    id v10 = objc_alloc_init(STSSearchNoticeView);
    id v11 = STSLocalizedString(@"FTE_NOTICE_LEGAL_TEXT");
    [(STSSearchNoticeView *)v10 setText:v11];

    objc_initWeak(&location, self);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    id v14 = __54__STSSearchBrowserRootViewController__showLegalNotice__block_invoke;
    v15 = &unk_264A05CE0;
    objc_copyWeak(&v16, &location);
    [(STSSearchNoticeView *)v10 setContinueButtonAction:&v12];
    objc_msgSend(v9, "setView:", v10, v12, v13, v14, v15);
    objc_storeWeak((id *)p_legalNoticeViewController, v9);
    [(STSSearchBrowserRootViewController *)self _updateContentInsets];
    [(STSSearchBrowserRootViewController *)self _transitionContentFromViewController:self->_currentChildViewController toViewController:v9 completion:0];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __54__STSSearchBrowserRootViewController__showLegalNotice__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    objc_msgSend(v2, "sts_setLegalNoticeCount:", 3);

    id v3 = [v6 searchHeaderView];
    id v4 = [v3 searchBar];
    uint64_t v5 = [v4 text];

    if ([v5 length]) {
      [v6 showPickerAndPerformQuery:v5 requestType:3];
    }
    else {
      [v6 showCategories];
    }

    id WeakRetained = v6;
  }
}

- (void)_transitionContentFromViewController:(id)a3 toViewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (UIViewController *)a4;
  id v10 = (void (**)(void))a5;
  self->_didSendCategoryResultFeedback = 0;
  if (self->_currentChildViewController != v9)
  {
    objc_storeStrong((id *)&self->_currentChildViewController, a4);
    [(STSSearchBrowserRootViewController *)self addChildViewController:v9];
    id v11 = [v8 parentViewController];

    if (v11)
    {
      [v8 willMoveToParentViewController:0];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __103__STSSearchBrowserRootViewController__transitionContentFromViewController_toViewController_completion___block_invoke;
      v20[3] = &unk_264A053F0;
      v20[4] = self;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __103__STSSearchBrowserRootViewController__transitionContentFromViewController_toViewController_completion___block_invoke_2;
      v15[3] = &unk_264A05D08;
      id v16 = v8;
      id v17 = self;
      id v18 = v9;
      uint64_t v19 = v10;
      [(STSSearchBrowserRootViewController *)self transitionFromViewController:v16 toViewController:v18 duration:5242880 options:v20 animations:v15 completion:0.0];

      goto LABEL_7;
    }
    uint64_t v12 = [(STSSearchBrowserRootViewController *)self view];
    uint64_t v13 = [(UIViewController *)v9 view];
    [v12 setContentView:v13];

    [(STSSearchBrowserRootViewController *)self addChildViewController:v9];
    [(UIViewController *)v9 didMoveToParentViewController:self];
    id v14 = [(STSSearchBrowserRootViewController *)self view];
    [v14 setNeedsLayout];

    [(STSSearchBrowserRootViewController *)self _updateContentInsets];
  }
  if (v10) {
    v10[2](v10);
  }
LABEL_7:
}

uint64_t __103__STSSearchBrowserRootViewController__transitionContentFromViewController_toViewController_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContentInsets];
}

uint64_t __103__STSSearchBrowserRootViewController__transitionContentFromViewController_toViewController_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromParentViewController];
  id v2 = [*(id *)(a1 + 40) view];
  id v3 = [*(id *)(a1 + 48) view];
  [v2 setContentView:v3];

  [*(id *)(a1 + 48) didMoveToParentViewController:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 40) searchHeaderView];
  [v4 invalidateIntrinsicContentSize];

  uint64_t v5 = [*(id *)(a1 + 40) view];
  [v5 setNeedsLayout];

  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (STSSearchBrowserHeaderView)searchHeaderView
{
  id v2 = [(STSSearchBrowserRootViewController *)self view];
  id v3 = [v2 headerView];

  return (STSSearchBrowserHeaderView *)v3;
}

- (void)setPickerSelectionDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerSelectionDelegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_pickerSelectionDelegate, obj);
    pickerViewController = self->_pickerViewController;
    id v7 = v5;
    [(STSPicker *)pickerViewController setSelectionDelegate:obj];
  }
}

- (void)_keyboardWillShow:(id)a3
{
  id v36 = a3;
  id v4 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  id v5 = [v4 searchBar];
  int v6 = [v5 isFirstResponder];

  if (v6)
  {
    id v7 = [(STSSearchBrowserRootViewController *)self view];
    [v7 bounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    id v16 = [v36 userInfo];
    id v17 = [v16 objectForKey:*MEMORY[0x263F837B8]];
    [v17 CGRectValue];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    v26 = [(STSSearchBrowserRootViewController *)self view];
    objc_msgSend(v26, "convertRect:fromView:", 0, v19, v21, v23, v25);
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;

    v38.origin.x = v9;
    v38.origin.y = v11;
    v38.size.width = v13;
    v38.size.height = v15;
    double Height = CGRectGetHeight(v38);
    v39.origin.x = v28;
    v39.origin.y = v30;
    v39.size.width = v32;
    v39.size.height = v34;
    self->_keyboarddouble Height = fmax(Height - CGRectGetMinY(v39), 0.0);
    [(STSSearchBrowserRootViewController *)self _updateContentInsets];
  }
}

- (void)_keyboardWillHide:(id)a3
{
  self->_keyboarddouble Height = 0.0;
  [(STSSearchBrowserRootViewController *)self _updateContentInsets];
}

- (void)setTopInset:(double)a3
{
  if (self->_topInset != a3)
  {
    self->_topInset = a3;
    [(STSSearchBrowserRootViewController *)self _updateContentInsets];
  }
}

- (void)setBottomInset:(double)a3
{
  if (self->_bottomInset != a3)
  {
    self->_bottomInset = a3;
    [(STSSearchBrowserRootViewController *)self _updateContentInsets];
  }
}

- (void)resetContentOffset
{
  double v3 = -(self->_topInset + 58.0);
  [(STSCategoryViewController *)self->_categoryViewController updateContentOffset:v3];
  [(STSSuggestionViewController *)self->_suggestionViewController updateContentOffset:v3];
  pickerViewController = self->_pickerViewController;

  [(STSPicker *)pickerViewController updateContentOffset:v3];
}

- (BOOL)isPickerVisible
{
  double v3 = [(STSSearchBrowserRootViewController *)self childViewControllers];
  id v4 = [v3 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    int v6 = [(STSSearchBrowserRootViewController *)self childViewControllers];
    id v7 = [v6 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)_updateContentInsets
{
  double v3 = [(STSSearchBrowserRootViewController *)self searchHeaderView];
  [v3 frame];
  CGRectGetHeight(v38);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_legalNoticeViewController);
  if (WeakRetained)
  {
    id v5 = [(STSSearchBrowserRootViewController *)self view];
    [v5 bounds];
    CGFloat v7 = *(double *)&v6;
    CGFloat v34 = v8;
    id v35 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v39.origin.x = v7;
    v39.origin.y = v9;
    v39.size.width = v11;
    v39.size.height = v13;
    CGRectGetHeight(v39);
    double v14 = [(STSSearchBrowserRootViewController *)self view];
    UIFloorToViewScale();
    double v16 = v15;

    id v17 = [(STSSearchBrowserRootViewController *)self view];
    double v18 = [v17 readableContentGuide];
    [v18 layoutFrame];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    v40.origin.x = v20;
    v40.origin.y = v22;
    v40.size.width = v24;
    v40.size.height = v26;
    double MinX = CGRectGetMinX(v40);
    v41.origin.y = v34;
    *(void *)&v41.origin.x = v35;
    v41.size.width = v11;
    v41.size.height = v13;
    double Width = CGRectGetWidth(v41);
    v42.origin.x = v20;
    v42.origin.y = v22;
    v42.size.width = v24;
    v42.size.height = v26;
    double v29 = Width - CGRectGetMaxX(v42);
    if (MinX >= 30.0) {
      double v30 = MinX;
    }
    else {
      double v30 = 30.0;
    }
    if (v29 >= 30.0) {
      double v31 = v29;
    }
    else {
      double v31 = 30.0;
    }
    if (v16 >= self->_topInset + 0.0 + 58.0) {
      double v32 = v16;
    }
    else {
      double v32 = self->_topInset + 0.0 + 58.0;
    }
    id v33 = objc_loadWeakRetained((id *)&self->_legalNoticeViewController);
    id v36 = [v33 view];

    objc_msgSend(v36, "setContentInsets:", v32, v30, 30.0, v31);
  }
}

- (void)_addQueryToRecents:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  int v6 = [v4 whitespaceCharacterSet];
  CGFloat v7 = [v5 stringByTrimmingCharactersInSet:v6];

  if ([v7 length])
  {
    recentQueries = self->_recentQueries;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __57__STSSearchBrowserRootViewController__addQueryToRecents___block_invoke;
    v14[3] = &unk_264A05490;
    id v9 = v7;
    id v15 = v9;
    uint64_t v10 = [(NSMutableArray *)recentQueries indexOfObjectPassingTest:v14];
    CGFloat v11 = self->_recentQueries;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)v11 insertObject:v9 atIndex:0];
      if ((unint64_t)[(NSMutableArray *)self->_recentQueries count] >= 4) {
        [(NSMutableArray *)self->_recentQueries removeLastObject];
      }
    }
    else
    {
      double v12 = [(NSMutableArray *)v11 objectAtIndex:v10];
      [(NSMutableArray *)self->_recentQueries removeObjectAtIndex:v10];
      [(NSMutableArray *)self->_recentQueries insertObject:v12 atIndex:0];
    }
    CGFloat v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v13 setObject:self->_recentQueries forKey:@"STSRecentQueries"];
    [v13 synchronize];
  }
}

BOOL __57__STSSearchBrowserRootViewController__addQueryToRecents___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) caseInsensitiveCompare:a2] == 0;
}

- (void)_clearRecents
{
  [(NSMutableArray *)self->_recentQueries removeAllObjects];
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 setObject:self->_recentQueries forKey:@"STSRecentQueries"];
  [v3 synchronize];
}

- (void)fetchCategories
{
}

- (void)sendVisibleResultsFeedback
{
  id v3 = [(STSPicker *)self->_pickerViewController parentViewController];

  if (v3)
  {
    pickerViewController = self->_pickerViewController;
    [(STSPicker *)pickerViewController sendVisibleResultsFeedback];
  }
}

- (STSSuggestionViewController)suggestionViewController
{
  return self->_suggestionViewController;
}

- (void)setSuggestionViewController:(id)a3
{
}

- (STSPicker)pickerViewController
{
  return self->_pickerViewController;
}

- (void)setPickerViewController:(id)a3
{
}

- (STSSearchBrowserRootViewControllerDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (STSSearchBrowserRootViewControllerDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (STSPickerSelectionDelegate)pickerSelectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerSelectionDelegate);

  return (STSPickerSelectionDelegate *)WeakRetained;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (STSFeedbackReporter)feedbackReporter
{
  return self->_feedbackReporter;
}

- (BOOL)requestedExpandedPresentation
{
  return self->_requestedExpandedPresentation;
}

- (void)setRequestedExpandedPresentation:(BOOL)a3
{
  self->_requestedExpandedPresentation = a3;
}

- (STSCategoryViewController)categoryViewController
{
  return self->_categoryViewController;
}

- (void)setCategoryViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryViewController, 0);
  objc_storeStrong((id *)&self->_feedbackReporter, 0);
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_destroyWeak((id *)&self->_pickerSelectionDelegate);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
  objc_storeStrong((id *)&self->_suggestionViewController, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_recentQueries, 0);
  objc_destroyWeak((id *)&self->_legalNoticeViewController);

  objc_storeStrong((id *)&self->_currentChildViewController, 0);
}

@end