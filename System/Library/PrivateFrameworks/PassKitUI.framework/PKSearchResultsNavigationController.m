@interface PKSearchResultsNavigationController
- (PKSearchResultsSearchController)searchController;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setSearchController:(id)a3;
@end

@implementation PKSearchResultsNavigationController

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKSearchResultsNavigationController;
  [(PKNavigationController *)&v18 navigationController:v8 willShowViewController:v9 animated:v5];
  v10 = [(PKSearchResultsNavigationController *)self viewControllers];
  if ((unint64_t)[v10 count] <= 2)
  {
    BOOL v11 = [v10 indexOfObject:v9] == 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);
    [WeakRetained setSearchBarVisible:v11];
  }
  v13 = [v8 topViewController];
  v14 = [v13 transitionCoordinator];

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__PKSearchResultsNavigationController_navigationController_willShowViewController_animated___block_invoke;
  v15[3] = &unk_1E59D63E0;
  objc_copyWeak(&v16, &location);
  [v14 notifyWhenInteractionChangesUsingBlock:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __92__PKSearchResultsNavigationController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = [WeakRetained searchController];
    [v3 setSearchBarVisible:0];
  }
}

- (PKSearchResultsSearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);

  return (PKSearchResultsSearchController *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end