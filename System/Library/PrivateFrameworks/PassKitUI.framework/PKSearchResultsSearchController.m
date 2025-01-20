@interface PKSearchResultsSearchController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKSearchResultsSearchController)initWithPaymentDataProvider:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5;
- (int64_t)preferredStatusBarStyle;
- (void)_updateSearchBarFrame;
- (void)preflightWithCompletion:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSearchBarVisible:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKSearchResultsSearchController

- (PKSearchResultsSearchController)initWithPaymentDataProvider:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[PKSearchResultsViewController alloc] initWithPaymentDataProvider:v10 transactionSourceCollection:v9 familyCollection:v8];

  v12 = [(PKNavigationController *)[PKSearchResultsNavigationController alloc] initWithRootViewController:v11];
  v19.receiver = self;
  v19.super_class = (Class)PKSearchResultsSearchController;
  v13 = [(PKSearchResultsSearchController *)&v19 initWithSearchResultsController:v12];
  v14 = v13;
  if (v13)
  {
    v13->_showSearchBar = 1;
    objc_storeWeak((id *)&v13->_resultsVC, v11);
    objc_storeWeak((id *)&v14->_navVC, v12);
    [(PKSearchResultsNavigationController *)v12 setSearchController:v14];
    v15 = [(PKSearchResultsSearchController *)v14 searchBar];
    [v15 setShowsCancelButton:1];
    v16 = +[PKDashboardViewController backgroundColor];
    [v15 setBackgroundColor:v16];

    v17 = [v15 searchTextField];
    [v17 setAllowsCopyingTokens:0];

    [(PKSearchResultsSearchController *)v14 setShowsSearchResultsController:1];
    [(PKSearchResultsSearchController *)v14 setSearchResultsUpdater:v11];
    [(PKSearchResultsSearchController *)v14 setHidesNavigationBarDuringPresentation:0];
  }
  return v14;
}

- (void)preflightWithCompletion:(id)a3
{
  p_resultsVC = &self->_resultsVC;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_resultsVC);
  [WeakRetained preflightWithCompletion:v4];
}

- (void)setQuery:(id)a3
{
  p_resultsVC = &self->_resultsVC;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_resultsVC);
  [WeakRetained setQuery:v4];
}

- (int64_t)preferredStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navVC);
  int64_t v3 = [WeakRetained preferredStatusBarStyle];

  return v3;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKSearchResultsSearchController;
  [(PKSearchResultsSearchController *)&v3 viewWillLayoutSubviews];
  [(PKSearchResultsSearchController *)self _updateSearchBarFrame];
}

- (void)_updateSearchBarFrame
{
  id v19 = [(PKSearchResultsSearchController *)self searchBar];
  [v19 frame];
  CGFloat v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PKSearchResultsSearchController *)self view];
  v12 = v11;
  if (self->_showSearchBar)
  {
    [v11 safeAreaInsets];
    double v14 = v13;
  }
  else
  {
    int v15 = [v11 _shouldReverseLayoutDirection];
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    double Width = CGRectGetWidth(v21);
    [v12 safeAreaInsets];
    if (v15) {
      double v14 = Width + v18;
    }
    else {
      double v14 = -Width - v17;
    }
  }
  objc_msgSend(v19, "setFrame:", v14, v6, v8, v10);
}

- (void)setSearchBarVisible:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PKSearchResultsSearchController *)self searchBar];
  double v6 = [(PKSearchResultsSearchController *)self view];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navVC);
  double v8 = [WeakRetained transitionCoordinator];

  objc_initWeak(&location, self);
  if (v3)
  {
    self->_showSearchBar = 1;
    if (!v8)
    {
      v12 = [(PKSearchResultsSearchController *)self view];
      [v12 setNeedsLayout];

      goto LABEL_9;
    }
    double v9 = [v5 superview];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke;
    v18[3] = &unk_1E59D63E0;
    objc_copyWeak(&v19, &location);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke_2;
    v15[3] = &unk_1E59D1028;
    objc_copyWeak(&v17, &location);
    id v16 = v5;
    [v8 animateAlongsideTransitionInView:v9 animation:v18 completion:v15];

    objc_destroyWeak(&v17);
    double v10 = &v19;
  }
  else
  {
    self->_searchBarWasFirstResponder = [v5 isFirstResponder];
    [v5 resignFirstResponder];
    self->_showSearchBar = 0;
    if (!v8)
    {
      [v6 setNeedsLayout];
      goto LABEL_9;
    }
    v11 = [v5 superview];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke_3;
    v13[3] = &unk_1E59D63E0;
    objc_copyWeak(&v14, &location);
    [v8 animateAlongsideTransitionInView:v11 animation:v13 completion:0];

    double v10 = &v14;
  }
  objc_destroyWeak(v10);
LABEL_9:
  objc_destroyWeak(&location);
}

void __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateSearchBarFrame];
    id WeakRetained = v2;
  }
}

void __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && ([v4 isCancelled] & 1) == 0 && WeakRetained[1336]) {
    [*(id *)(a1 + 32) becomeFirstResponder];
  }
}

void __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateSearchBarFrame];
    id WeakRetained = v2;
  }
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resultsVC);

  objc_destroyWeak((id *)&self->_navVC);
}

@end