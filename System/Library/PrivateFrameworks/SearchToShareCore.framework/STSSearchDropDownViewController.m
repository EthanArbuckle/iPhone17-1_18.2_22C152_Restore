@interface STSSearchDropDownViewController
- (BOOL)sendFeedbackOnViewDidAppear;
- (BOOL)shouldShowLegalNotice;
- (CategoriesDataSource)categoriesDataSource;
- (NSString)query;
- (NSString)sceneIdentifier;
- (PopUpPlugin)popUpPlugin;
- (PopUpSearchViewDelegate)locationDelegate;
- (STSSearchDropDownViewController)initWithSearchModel:(id)a3;
- (STSSearchDropDownViewControllerDelegate)delegate;
- (STSSearchModel)searchModel;
- (SuggestionsDataSource)suggestionsDataSource;
- (void)_updateSuggestions;
- (void)categoryViewController:(id)a3 didSelectCategory:(id)a4 suggested:(BOOL)a5;
- (void)categoryViewController:(id)a3 didSelectRecent:(id)a4;
- (void)categoryViewControllerDidSelectClearRecentsButton:(id)a3;
- (void)clearRecents;
- (void)close;
- (void)didCloseDropDown;
- (void)didPressDownKey;
- (void)didPressReturnKey:(id)a3;
- (void)didPressUpKey;
- (void)didRequestClose;
- (void)dropDownContentViewControllerShouldDismiss;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchModelUpdated;
- (void)searchModelUpdatedQuerySuggestions:(id)a3;
- (void)sendVisibleResultsFeedback;
- (void)setCategoriesDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocationDelegate:(id)a3;
- (void)setPopUpPlugin:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSendFeedbackOnViewDidAppear:(BOOL)a3;
- (void)setSuggestionsDataSource:(id)a3;
- (void)showCategories;
- (void)showPickerAndPerformQuery:(id)a3 requestType:(int64_t)a4;
- (void)showSuggestions;
- (void)showSuggestionsIfNeccessary;
- (void)suggestionViewController:(id)a3 didSelectSuggestion:(id)a4 suggested:(BOOL)a5;
@end

@implementation STSSearchDropDownViewController

- (STSSearchDropDownViewController)initWithSearchModel:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)STSSearchDropDownViewController;
  v6 = [(STSSearchDropDownViewController *)&v27 init];
  v7 = v6;
  if (v6)
  {
    v8 = [(STSSearchDropDownViewController *)v6 view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(STSSearchDropDownViewController *)v7 view];
    v10 = [MEMORY[0x263F825C8] clearColor];
    [v9 setBackgroundColor:v10];

    objc_storeStrong((id *)&v7->_searchModel, a3);
    v11 = [[CategoriesDataSource alloc] initWithSearchModel:v5];
    categoriesDataSource = v7->_categoriesDataSource;
    v7->_categoriesDataSource = v11;

    v13 = [[SuggestionsDataSource alloc] initWithSearchModel:v5];
    suggestionsDataSource = v7->_suggestionsDataSource;
    v7->_suggestionsDataSource = v13;

    [(CategoriesDataSource *)v7->_categoriesDataSource setSelectionDelegate:v7];
    [(CategoriesDataSource *)v7->_categoriesDataSource setUpdateDelegate:v7];
    [(SuggestionsDataSource *)v7->_suggestionsDataSource setSelectionDelegate:v7];
    [(SuggestionsDataSource *)v7->_suggestionsDataSource setUpdateDelgate:v7];
    v15 = objc_alloc_init(STSDropDownRootView);
    [(STSDropDownRootView *)v15 setUserInteractionEnabled:1];
    [(STSSearchDropDownViewController *)v7 setView:v15];
    v16 = [(STSSearchDropDownViewController *)v7 view];
    v17 = [v16 layer];
    [v17 setMasksToBounds:1];

    v18 = [(STSSearchDropDownViewController *)v7 view];
    v19 = [v18 layer];
    [v19 setCornerRadius:6.0];

    v20 = [(STSSearchDropDownViewController *)v7 view];
    v21 = [v20 layer];
    [v21 setBorderWidth:1.0];

    id v22 = [MEMORY[0x263F825C8] separatorColor];
    uint64_t v23 = [v22 CGColor];
    v24 = [(STSSearchDropDownViewController *)v7 view];
    v25 = [v24 layer];
    [v25 setBorderColor:v23];
  }
  return v7;
}

- (void)setSceneIdentifier:(id)a3
{
  p_sceneIdentifier = &self->_sceneIdentifier;
  objc_storeStrong((id *)&self->_sceneIdentifier, a3);
  id v6 = a3;
  [(PopUpPlugin *)self->_popUpPlugin setSceneIdentifier:*p_sceneIdentifier];
}

- (void)close
{
  self->_popUpShowing = 3;
  query = self->_query;
  self->_query = 0;

  [(PopUpPlugin *)self->_popUpPlugin close];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained searchDropDownViewControllerDidDismiss];
}

- (void)showCategories
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v4 = objc_msgSend(v3, "sts_legalNoticeCount");

  if (v4 >= 3)
  {
    if (self->_popUpShowing == 1)
    {
      if (!self->_didSendCategoryResultFeedback)
      {
        self->_didSendCategoryResultFeedback = 1;
        [(CategoriesDataSource *)self->_categoriesDataSource sendRankSectionsFeedback];
        [(STSSearchDropDownViewController *)self sendVisibleResultsFeedback];
      }
    }
    else
    {
      [(PopUpPlugin *)self->_popUpPlugin setDataSource:self->_categoriesDataSource];
      [(PopUpPlugin *)self->_popUpPlugin setDelegate:self->_categoriesDataSource];
      popUpPlugin = self->_popUpPlugin;
      if (self->_popUpShowing == 3)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_locationDelegate);
        [WeakRetained locationForPopUp];
        -[PopUpPlugin showInRect:](popUpPlugin, "showInRect:");
      }
      else
      {
        [(PopUpPlugin *)popUpPlugin update];
      }
      self->_popUpShowing = 1;
      if (!self->_didSendCategoryResultFeedback)
      {
        self->_didSendCategoryResultFeedback = 1;
        [(CategoriesDataSource *)self->_categoriesDataSource sendRankSectionsFeedback];
        [(STSSearchDropDownViewController *)self setSendFeedbackOnViewDidAppear:1];
      }
    }
  }
  else
  {
    [(STSSearchDropDownViewController *)self _showLegalNotice];
  }
}

- (void)showSuggestionsIfNeccessary
{
  if ((self->_popUpShowing | 2) != 2)
  {
    [(PopUpPlugin *)self->_popUpPlugin setDataSource:self->_suggestionsDataSource];
    [(PopUpPlugin *)self->_popUpPlugin setDelegate:self->_suggestionsDataSource];
    [(STSSearchDropDownViewController *)self _updateSuggestions];
    popUpPlugin = self->_popUpPlugin;
    if (self->_popUpShowing == 3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_locationDelegate);
      [WeakRetained locationForPopUp];
      -[PopUpPlugin showInRect:](popUpPlugin, "showInRect:");
    }
    else
    {
      [(PopUpPlugin *)self->_popUpPlugin update];
    }
    self->_popUpShowing = 0;
  }
}

- (void)showSuggestions
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v4 = objc_msgSend(v3, "sts_legalNoticeCount");

  if (v4 >= 3)
  {
    if (self->_popUpShowing)
    {
      [(PopUpPlugin *)self->_popUpPlugin setDataSource:self->_suggestionsDataSource];
      [(PopUpPlugin *)self->_popUpPlugin setDelegate:self->_suggestionsDataSource];
      id v5 = [(STSSearchDropDownViewController *)self query];
      uint64_t v6 = [v5 length];

      if (!v6)
      {
        v7 = [(STSSearchDropDownViewController *)self suggestionsDataSource];
        [v7 clearSuggestions];
      }
      [(STSSearchDropDownViewController *)self _updateSuggestions];
      popUpPlugin = self->_popUpPlugin;
      if (self->_popUpShowing == 3)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_locationDelegate);
        [WeakRetained locationForPopUp];
        -[PopUpPlugin showInRect:](popUpPlugin, "showInRect:");
      }
      else
      {
        [(PopUpPlugin *)self->_popUpPlugin update];
      }
      self->_popUpShowing = 0;
      v10 = [(STSSearchDropDownViewController *)self query];
      uint64_t v11 = [v10 length];

      if (!v11)
      {
        id v12 = [(STSSearchDropDownViewController *)self suggestionsDataSource];
        [v12 clearSuggestions];
      }
    }
  }
  else
  {
    [(STSSearchDropDownViewController *)self _showLegalNotice];
  }
}

- (void)_updateSuggestions
{
  v3 = [(STSSearchModel *)self->_searchModel predictedSuggestions];
  uint64_t v4 = (void *)[v3 mutableCopy];

  id v5 = [(CategoriesDataSource *)self->_categoriesDataSource recentQueries];
  uint64_t v6 = objc_msgSend(v5, "sts_map:", &__block_literal_global_1);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__STSSearchDropDownViewController__updateSuggestions__block_invoke_2;
  v12[3] = &unk_264A05CB8;
  id v7 = v4;
  id v13 = v7;
  [v6 enumerateObjectsUsingBlock:v12];
  if (!v7)
  {
    if (!v6) {
      goto LABEL_8;
    }
    id v9 = v6;
LABEL_7:
    uint64_t v11 = [(STSSearchDropDownViewController *)self suggestionsDataSource];
    [v11 updateQuerySuggestions:v9];

    goto LABEL_8;
  }
  id v8 = v7;
  id v9 = v8;
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v6];

  id v9 = (id)v10;
  if (v10) {
    goto LABEL_7;
  }
LABEL_8:
}

id __53__STSSearchDropDownViewController__updateSuggestions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F67A10];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithSuggestion:v3 query:v3 score:3 type:0.0];

  return v4;
}

void __53__STSSearchDropDownViewController__updateSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = *(void **)(a1 + 32);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __53__STSSearchDropDownViewController__updateSuggestions__block_invoke_3;
  uint64_t v11 = &unk_264A05440;
  id v12 = v3;
  id v13 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:&v8];
  objc_msgSend(*(id *)(a1 + 32), "removeObjectsInArray:", v6, v8, v9, v10, v11);
}

void __53__STSSearchDropDownViewController__updateSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) suggestion];
  id v4 = [v3 lowercaseString];
  id v5 = [v8 suggestion];
  id v6 = [v5 lowercaseString];
  int v7 = [v4 isEqualToString:v6];

  if (v7) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = [a3 searchTextField];
  id v6 = [v5 text];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    [(STSSearchDropDownViewController *)self showSuggestions];
  }
  else
  {
    id v8 = +[STSFeedbackReporter sharedInstance];
    [v8 didClearSearchBarInput];

    +[STSSearchModel incrementClientQueryId];
    [(STSSearchDropDownViewController *)self showCategories];
  }
}

- (void)showPickerAndPerformQuery:(id)a3 requestType:(int64_t)a4
{
  categoriesDataSource = self->_categoriesDataSource;
  id v7 = a3;
  [(CategoriesDataSource *)categoriesDataSource addQueryToRecents:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained searchDropDownViewController:self didQueryFor:v7 requestType:a4];
}

- (void)sendVisibleResultsFeedback
{
  id v5 = [(PopUpPlugin *)self->_popUpPlugin indexPathsForVisibleRows];
  id v3 = -[CategoriesDataSource visibleResultsForIndexPaths:](self->_categoriesDataSource, "visibleResultsForIndexPaths:");
  if ([v3 count])
  {
    id v4 = +[STSFeedbackReporter sharedInstance];
    [v4 didShowResults:v3 scrolling:0];
  }
}

- (void)categoryViewController:(id)a3 didSelectCategory:(id)a4 suggested:(BOOL)a5
{
  id v6 = a4;
  [(STSSearchDropDownViewController *)self showPickerAndPerformQuery:v6 requestType:5];
  [(CategoriesDataSource *)self->_categoriesDataSource addQueryToRecents:v6];
}

- (void)categoryViewController:(id)a3 didSelectRecent:(id)a4
{
  [(STSSearchDropDownViewController *)self showPickerAndPerformQuery:a4 requestType:6];
  suggestionsDataSource = self->_suggestionsDataSource;

  [(SuggestionsDataSource *)suggestionsDataSource clearSuggestions];
}

- (void)clearRecents
{
  [(CategoriesDataSource *)self->_categoriesDataSource clearRecents];
  id v2 = +[STSFeedbackReporter sharedInstance];
  [v2 didClearRecents];
}

- (void)categoryViewControllerDidSelectClearRecentsButton:(id)a3
{
  [(CategoriesDataSource *)self->_categoriesDataSource clearRecents];
  id v3 = +[STSFeedbackReporter sharedInstance];
  [v3 didClearRecents];
}

- (void)suggestionViewController:(id)a3 didSelectSuggestion:(id)a4 suggested:(BOOL)a5
{
  objc_msgSend(a4, "suggestion", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(STSSearchDropDownViewController *)self showPickerAndPerformQuery:v6 requestType:1];
}

- (void)dropDownContentViewControllerShouldDismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained searchDropDownViewControllerShouldDismiss];
}

- (void)searchModelUpdated
{
}

- (void)searchModelUpdatedQuerySuggestions:(id)a3
{
  id v4 = [a3 querySuggestions];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchDropDownViewControllerShouldDismiss];
  }
  popUpPlugin = self->_popUpPlugin;

  [(PopUpPlugin *)popUpPlugin update];
}

- (void)didCloseDropDown
{
  self->_popUpShowing = 3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained searchDropDownViewControllerDidDismiss];
}

- (BOOL)shouldShowLegalNotice
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = objc_msgSend(v2, "sts_legalNoticeCount") < 3;

  return v3;
}

- (void)didPressDownKey
{
  if (self->_popUpShowing == 3)
  {
    BOOL v3 = [(STSSearchDropDownViewController *)self query];
    uint64_t v4 = [v3 length];

    if (v4) {
      [(STSSearchDropDownViewController *)self showSuggestions];
    }
    else {
      [(STSSearchDropDownViewController *)self showCategories];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchDropDownViewControllerDidPresent];
  }
  else
  {
    popUpPlugin = self->_popUpPlugin;
    [(PopUpPlugin *)popUpPlugin moveSelectionDown];
  }
}

- (void)didPressReturnKey:(id)a3
{
  id v4 = a3;
  unint64_t popUpShowing = self->_popUpShowing;
  id v12 = v4;
  if (popUpShowing >= 2)
  {
    if (popUpShowing == 2) {
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = [(PopUpPlugin *)self->_popUpPlugin getSelection];
    uint64_t v7 = [v6 length];

    id v4 = v12;
    if (v7)
    {
      id v8 = [(PopUpPlugin *)self->_popUpPlugin getSelection];
      [(CategoriesDataSource *)self->_categoriesDataSource addQueryToRecents:v8];
      uint64_t v9 = [(STSSearchDropDownViewController *)self delegate];
      [v9 searchDropDownViewController:self didQueryFor:v8 requestType:1];

      [(CategoriesDataSource *)self->_categoriesDataSource addQueryToRecents:v8];
LABEL_8:

      goto LABEL_9;
    }
  }
  uint64_t v10 = [v4 length];
  uint64_t v11 = [(STSSearchDropDownViewController *)self delegate];
  id v8 = v11;
  if (!v10)
  {
    [v11 searchDropDownViewControllerShouldPresent];
    goto LABEL_8;
  }
  [v11 searchDropDownViewController:self didQueryFor:v12 requestType:1];

  [(CategoriesDataSource *)self->_categoriesDataSource addQueryToRecents:v12];
LABEL_9:
  id v4 = v12;
LABEL_10:
}

- (void)didPressUpKey
{
  if (self->_popUpShowing <= 1) {
    [(PopUpPlugin *)self->_popUpPlugin moveSelectionUp];
  }
}

- (void)didRequestClose
{
  if (self->_popUpShowing <= 2) {
    [(STSSearchDropDownViewController *)self close];
  }
}

- (PopUpPlugin)popUpPlugin
{
  return self->_popUpPlugin;
}

- (void)setPopUpPlugin:(id)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (BOOL)sendFeedbackOnViewDidAppear
{
  return self->_sendFeedbackOnViewDidAppear;
}

- (void)setSendFeedbackOnViewDidAppear:(BOOL)a3
{
  self->_sendFeedbackOnViewDidAppear = a3;
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (STSSearchDropDownViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STSSearchDropDownViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PopUpSearchViewDelegate)locationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationDelegate);

  return (PopUpSearchViewDelegate *)WeakRetained;
}

- (void)setLocationDelegate:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (CategoriesDataSource)categoriesDataSource
{
  return self->_categoriesDataSource;
}

- (void)setCategoriesDataSource:(id)a3
{
}

- (SuggestionsDataSource)suggestionsDataSource
{
  return self->_suggestionsDataSource;
}

- (void)setSuggestionsDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_categoriesDataSource, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_locationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_popUpPlugin, 0);

  objc_storeStrong((id *)&self->_currentQuery, 0);
}

@end