@interface UISearchContainerViewController
- (BOOL)_isTVSearchControllerContainer;
- (BOOL)_transitionsChildViewControllers;
- (BOOL)isPresentingSearchController;
- (UISearchContainerViewController)initWithCoder:(id)a3;
- (UISearchContainerViewController)initWithSearchController:(UISearchController *)searchController;
- (UISearchController)searchController;
- (void)_prepareForContainerTransition:(id)a3;
- (void)_presentSearchControllerIfNecessary;
- (void)commonInit;
- (void)encodeWithCoder:(id)a3;
- (void)setIsPresentingSearchController:(BOOL)a3;
- (void)setSearchController:(id)a3;
- (void)setTabBarObservedScrollView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation UISearchContainerViewController

- (UISearchContainerViewController)initWithSearchController:(UISearchController *)searchController
{
  v5 = searchController;
  v9.receiver = self;
  v9.super_class = (Class)UISearchContainerViewController;
  v6 = [(UIViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchController, searchController);
    [(UISearchContainerViewController *)v7 commonInit];
  }

  return v7;
}

- (UISearchContainerViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISearchContainerViewController;
  v5 = [(UIViewController *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UISearchContainerViewControllerSearchController"];
    searchController = v5->_searchController;
    v5->_searchController = (UISearchController *)v6;

    [(UISearchContainerViewController *)v5 commonInit];
  }

  return v5;
}

- (void)commonInit
{
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISearchContainerViewController;
  id v4 = a3;
  [(UIViewController *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchController, @"UISearchContainerViewControllerSearchController", v5.receiver, v5.super_class);
}

- (void)_presentSearchControllerIfNecessary
{
  v3 = [(UIViewController *)self view];
  uint64_t v4 = [v3 window];
  if (!v4) {
    goto LABEL_6;
  }
  objc_super v5 = (void *)v4;
  uint64_t v6 = [(UISearchContainerViewController *)self searchController];
  v7 = [v6 presentingViewController];
  if (v7 == self)
  {

LABEL_6:
    goto LABEL_7;
  }
  v8 = v7;
  BOOL v9 = [(UISearchContainerViewController *)self isPresentingSearchController];

  if (!v9)
  {
    [(UISearchContainerViewController *)self setIsPresentingSearchController:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__UISearchContainerViewController__presentSearchControllerIfNecessary__block_invoke;
    v14[3] = &unk_1E52D9F70;
    v14[4] = self;
    +[UIViewController _performWithoutDeferringTransitions:v14];
    return;
  }
LABEL_7:
  v10 = [(UISearchContainerViewController *)self searchController];
  [v10 _updateSystemInputViewController];

  v11 = [(UIViewController *)self traitCollection];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 3)
  {
    id v13 = [(UISearchContainerViewController *)self searchController];
    [v13 _limitedUIDidChangeAnimated:0];
  }
}

void __70__UISearchContainerViewController__presentSearchControllerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tabBarController];
  if (v2)
  {
    v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 32) tabBarController];
    objc_super v5 = [v4 selectedViewController];
    uint64_t v6 = v5;
    if (v5 == *(void **)(a1 + 32))
    {
      v7 = [v5 tabBarController];
      int v8 = [v7 _isFocusedTabVisible];

      if (!v8) {
        return;
      }
    }
    else
    {
    }
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  BOOL v9 = *(void **)(a1 + 32);
  v10 = [v9 searchController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__UISearchContainerViewController__presentSearchControllerIfNecessary__block_invoke_2;
  v11[3] = &unk_1E52DC308;
  objc_copyWeak(&v12, &location);
  [v9 presentViewController:v10 animated:0 completion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__UISearchContainerViewController__presentSearchControllerIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsPresentingSearchController:0];
}

- (void)_prepareForContainerTransition:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self parentViewController];

  if (v5 == v4)
  {
    [(UISearchContainerViewController *)self _presentSearchControllerIfNecessary];
  }
}

- (BOOL)_transitionsChildViewControllers
{
  return 0;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchContainerViewController;
  [(UIViewController *)&v3 viewDidLoad];
  [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:_UIBarsApplyChromelessEverywhere() ^ 1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISearchContainerViewController;
  [(UIViewController *)&v5 viewDidAppear:a3];
  [(UISearchContainerViewController *)self _presentSearchControllerIfNecessary];
  id v4 = [(UISearchContainerViewController *)self searchController];
  objc_msgSend(v4, "set_shouldLogAppearance:", 0);

  AnalyticsSendEventLazy();
}

id __49__UISearchContainerViewController_viewDidAppear___block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = _UIPrivateMainBundleIdentifier();
  v1 = (void *)v0;
  if (v0)
  {
    id v4 = @"bundle_id";
    v5[0] = v0;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchContainerViewController;
  [(UIViewController *)&v3 viewDidDisappear:a3];
  AnalyticsSendEventLazy();
}

id __52__UISearchContainerViewController_viewDidDisappear___block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = _UIPrivateMainBundleIdentifier();
  v1 = (void *)v0;
  if (v0)
  {
    id v4 = @"bundle_id";
    v5[0] = v0;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)setTabBarObservedScrollView:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UISearchContainerViewController *)self searchController];
  int v6 = [v5 _tvShouldScrollWithObservedScrollViewIfPossible];

  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchContainerViewController;
    [(UISearchContainerViewController *)&v7 setTabBarObservedScrollView:v4];
  }
}

- (BOOL)_isTVSearchControllerContainer
{
  return 0;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (BOOL)isPresentingSearchController
{
  return self->_isPresentingSearchController;
}

- (void)setIsPresentingSearchController:(BOOL)a3
{
  self->_isPresentingSearchController = a3;
}

- (void).cxx_destruct
{
}

@end