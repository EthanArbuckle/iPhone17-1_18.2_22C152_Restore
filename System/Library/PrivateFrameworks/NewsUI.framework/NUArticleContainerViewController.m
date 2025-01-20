@interface NUArticleContainerViewController
- (BOOL)isLinkPreviewing;
- (NUArticleBarButtonItemManager)barButtonItemManager;
- (NUArticleContainerViewController)init;
- (NUArticleContainerViewController)initWithPagingFactory:(id)a3 router:(id)a4;
- (NUArticleContainerViewControllerDelegate)delegate;
- (NUArticleNavigationController)navigationController;
- (NUPageViewController)pageViewController;
- (NUPaging)paging;
- (NUPagingFactory)pagingFactory;
- (NURouter)router;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (id)viewControllerPageableForViewController:(id)a3;
- (void)articleBarButtonItemManager:(id)a3 performDoneActionForBarButtonItem:(id)a4;
- (void)articleBarButtonItemManager:(id)a3 performNextActionForBarButtonItem:(id)a4;
- (void)articleBarButtonItemManager:(id)a3 performShareActionForBarButtonItem:(id)a4;
- (void)articleBarButtonItemManagerDidLayoutBarButtonItems:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)enableNavigation:(BOOL)a3;
- (void)loadWithArticleIDs:(id)a3;
- (void)loadingDidFinishWithError:(id)a3;
- (void)loadingWillStart;
- (void)pageViewController:(id)a3 didChangeVisibleViewControllerFromViewController:(id)a4 direction:(unint64_t)a5;
- (void)pageViewController:(id)a3 viewController:(id)a4 changedVisibilityFactor:(double)a5;
- (void)setDelegate:(id)a3;
- (void)setLinkPreviewing:(BOOL)a3;
- (void)setPaging:(id)a3;
- (void)styleNavigationForPage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NUArticleContainerViewController

- (NUArticleContainerViewController)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:@"Unavailable" reason:@"Must use initWithPagingFactory:interstitialAdManager:router:" userInfo:0];
  objc_exception_throw(v2);
}

- (NUArticleContainerViewController)initWithPagingFactory:(id)a3 router:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NUArticleContainerViewController;
  v9 = [(NUArticleContainerViewController *)&v21 init];
  v10 = v9;
  if (v9)
  {
    v9->_linkPreviewing = 0;
    objc_storeStrong((id *)&v9->_pagingFactory, a3);
    objc_storeStrong((id *)&v10->_router, a4);
    v11 = [[NUPageViewController alloc] initWithNibName:0 bundle:0];
    pageViewController = v10->_pageViewController;
    v10->_pageViewController = v11;

    [(NUPageViewController *)v10->_pageViewController setDelegate:v10];
    [(NUPageViewController *)v10->_pageViewController setDataSource:v10];
    v13 = [NUArticleContainerTitleView alloc];
    v14 = -[NUArticleContainerTitleView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v15 = [(NUPageViewController *)v10->_pageViewController navigationItem];
    [v15 setTitleView:v14];

    v16 = [[NUArticleNavigationController alloc] initWithRootViewController:v10->_pageViewController];
    navigationController = v10->_navigationController;
    v10->_navigationController = v16;

    v18 = [[NUArticleBarButtonItemManager alloc] initWithViewController:v10->_pageViewController];
    barButtonItemManager = v10->_barButtonItemManager;
    v10->_barButtonItemManager = v18;

    [(NUArticleBarButtonItemManager *)v10->_barButtonItemManager setDelegate:v10];
  }

  return v10;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)NUArticleContainerViewController;
  [(NUArticleContainerViewController *)&v15 viewDidLoad];
  v3 = [(NUArticleContainerViewController *)self navigationController];
  [(NUArticleContainerViewController *)self addChildViewController:v3];

  v4 = [(NUArticleContainerViewController *)self view];
  v5 = [(NUArticleContainerViewController *)self navigationController];
  v6 = [v5 view];
  [v4 addSubview:v6];

  id v7 = [(NUArticleContainerViewController *)self navigationController];
  [v7 didMoveToParentViewController:self];

  id v8 = [(NUArticleContainerViewController *)self pageViewController];

  if (v8)
  {
    v9 = [(NUArticleContainerViewController *)self pageViewController];
    v10 = [v9 navigationItem];
    v11 = [v10 titleView];
    [v11 setAutoresizingMask:2];

    v12 = [MEMORY[0x263F1C550] colorWithWhite:0.850980392 alpha:1.0];
    v13 = [(NUArticleContainerViewController *)self pageViewController];
    v14 = [v13 view];
    [v14 setBackgroundColor:v12];
  }
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)NUArticleContainerViewController;
  [(NUArticleContainerViewController *)&v22 viewDidLayoutSubviews];
  v3 = [(NUArticleContainerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NUArticleContainerViewController *)self navigationController];
  v13 = [v12 view];
  objc_msgSend(v13, "setBounds:", v5, v7, v9, v11);

  v14 = [(NUArticleContainerViewController *)self navigationController];
  objc_super v15 = [v14 navigationBar];
  [v15 bounds];
  double Height = CGRectGetHeight(v23);

  v17 = [(NUArticleContainerViewController *)self pageViewController];
  v18 = [v17 navigationItem];
  v19 = [v18 titleView];
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, 180.0, Height);

  v20 = [(NUArticleContainerViewController *)self barButtonItemManager];
  objc_super v21 = [(NUArticleContainerViewController *)self traitCollection];
  [v20 sizeBarButtonItemsForTraitCollection:v21];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NUArticleContainerViewController;
  [(NUArticleContainerViewController *)&v6 traitCollectionDidChange:a3];
  double v4 = [(NUArticleContainerViewController *)self barButtonItemManager];
  double v5 = [(NUArticleContainerViewController *)self traitCollection];
  [v4 positionBarButtonItemsForTraitCollection:v5];
}

- (void)didReceiveMemoryWarning
{
  v11.receiver = self;
  v11.super_class = (Class)NUArticleContainerViewController;
  [(NUArticleContainerViewController *)&v11 didReceiveMemoryWarning];
  v3 = [(NUArticleContainerViewController *)self pageViewController];
  double v4 = [v3 visibleViewController];
  double v5 = [(NUArticleContainerViewController *)self viewControllerPageableForViewController:v4];

  objc_super v6 = [(NUArticleContainerViewController *)self paging];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__NUArticleContainerViewController_didReceiveMemoryWarning__block_invoke;
  v8[3] = &unk_2645FE4A0;
  id v9 = v5;
  double v10 = self;
  id v7 = v5;
  [v6 forEachPage:v8];
}

void __59__NUArticleContainerViewController_didReceiveMemoryWarning__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = [*(id *)(a1 + 32) pageIdentifier];

  if (!v3)
  {
LABEL_5:
    [v13 unprepare];
    goto LABEL_9;
  }
  double v4 = [*(id *)(a1 + 40) paging];
  double v5 = [*(id *)(a1 + 32) pageIdentifier];
  id v6 = [v4 pageForIdentifier:v5];
  if (v6 == v13)
  {
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) paging];
    double v8 = [*(id *)(a1 + 32) pageIdentifier];
    id v9 = [v7 pageBeforeForIdentifier:v8];
    if (v9 != v13)
    {
      double v10 = [*(id *)(a1 + 40) paging];
      objc_super v11 = [*(id *)(a1 + 32) pageIdentifier];
      id v12 = [v10 pageAfterIdentifier:v11];

      if (v12 == v13) {
        goto LABEL_9;
      }
      goto LABEL_5;
    }
  }
LABEL_9:
}

- (void)loadWithArticleIDs:(id)a3
{
  id v4 = a3;
  double v5 = [(NUArticleContainerViewController *)self pagingFactory];
  id v6 = [v5 createPagingForArticleIDs:v4];

  [(NUArticleContainerViewController *)self setPaging:v6];
  id v7 = [(NUArticleContainerViewController *)self paging];
  id v12 = [v7 firstPage];

  if (v12)
  {
    double v8 = [(NUArticleContainerViewController *)self paging];
    id v9 = [v8 firstPage];
    double v10 = [v9 viewController];

    [v10 setLoadingDelegate:self];
    objc_super v11 = [(NUArticleContainerViewController *)self pageViewController];
    [v11 setVisibleViewController:v10];

    [(NUArticleContainerViewController *)self styleNavigationForPage:v12];
  }
}

- (void)setLinkPreviewing:(BOOL)a3
{
  BOOL v3 = a3;
  self->_linkPreviewing = a3;
  double v5 = [(NUArticleContainerViewController *)self navigationController];
  [v5 setToolbarHidden:v3];

  id v6 = [(NUArticleContainerViewController *)self navigationController];
  [v6 setNavigationBarHidden:v3];
}

- (void)pageViewController:(id)a3 didChangeVisibleViewControllerFromViewController:(id)a4 direction:(unint64_t)a5
{
  id v6 = [a3 visibleViewController];
  id v10 = [(NUArticleContainerViewController *)self viewControllerPageableForViewController:v6];

  id v7 = [(NUArticleContainerViewController *)self paging];
  double v8 = [v10 pageIdentifier];
  id v9 = [v7 pageForIdentifier:v8];

  [(NUArticleContainerViewController *)self styleNavigationForPage:v9];
}

- (void)pageViewController:(id)a3 viewController:(id)a4 changedVisibilityFactor:(double)a5
{
  if (a5 > 0.5)
  {
    id v7 = [(NUArticleContainerViewController *)self viewControllerPageableForViewController:a4];
    if (v7)
    {
      id v11 = v7;
      double v8 = [(NUArticleContainerViewController *)self paging];
      id v9 = [v11 pageIdentifier];
      id v10 = [v8 pageForIdentifier:v9];

      if (v10) {
        [(NUArticleContainerViewController *)self styleNavigationForPage:v10];
      }

      id v7 = v11;
    }
  }
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  uint64_t v5 = [(NUArticleContainerViewController *)self viewControllerPageableForViewController:a4];
  if (v5)
  {
    id v6 = [(NUArticleContainerViewController *)self paging];
    id v7 = [v5 pageIdentifier];
    double v8 = [v6 pageBeforeForIdentifier:v7];

    if (v8)
    {
      id v9 = [(NUArticleContainerViewController *)self paging];
      id v10 = [v8 identifier];
      id v11 = [v9 pageBeforeForIdentifier:v10];

      if (v11)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __90__NUArticleContainerViewController_pageViewController_viewControllerBeforeViewController___block_invoke_3;
        block[3] = &unk_2645FE4C8;
        id v15 = v11;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      id v12 = [v8 viewController];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __90__NUArticleContainerViewController_pageViewController_viewControllerBeforeViewController___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepare];
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  uint64_t v5 = [(NUArticleContainerViewController *)self viewControllerPageableForViewController:a4];
  if (v5)
  {
    id v6 = [(NUArticleContainerViewController *)self paging];
    id v7 = [v5 pageIdentifier];
    double v8 = [v6 pageAfterIdentifier:v7];

    if (v8)
    {
      id v9 = [(NUArticleContainerViewController *)self paging];
      id v10 = [v8 identifier];
      id v11 = [v9 pageAfterIdentifier:v10];

      if (v11)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __89__NUArticleContainerViewController_pageViewController_viewControllerAfterViewController___block_invoke_3;
        block[3] = &unk_2645FE4C8;
        id v15 = v11;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      id v12 = [v8 viewController];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __89__NUArticleContainerViewController_pageViewController_viewControllerAfterViewController___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepare];
}

- (void)articleBarButtonItemManager:(id)a3 performDoneActionForBarButtonItem:(id)a4
{
  id v5 = [(NUArticleContainerViewController *)self delegate];
  [v5 articleContainerViewControllerDidFinishPresenting:self];
}

- (void)articleBarButtonItemManager:(id)a3 performNextActionForBarButtonItem:(id)a4
{
  id v5 = [(NUArticleContainerViewController *)self pageViewController];
  id v6 = [v5 visibleViewController];
  id v12 = [(NUArticleContainerViewController *)self viewControllerPageableForViewController:v6];

  id v7 = [(NUArticleContainerViewController *)self paging];
  double v8 = [v12 pageIdentifier];
  id v9 = [v7 pageAfterIdentifier:v8];

  if (v9)
  {
    unint64_t v10 = [v9 pageNextAction];
    if (v10 == 2)
    {
      id v11 = [(NUArticleContainerViewController *)self router];
      [v11 routeToNewsAppForYouFeed];
    }
    else
    {
      if (v10 > 1) {
        goto LABEL_7;
      }
      id v11 = [(NUArticleContainerViewController *)self pageViewController];
      [v11 keyboardOrActionSwitchToNextViewController];
    }
  }
LABEL_7:
}

- (void)articleBarButtonItemManager:(id)a3 performShareActionForBarButtonItem:(id)a4
{
  id v5 = a4;
  id v6 = [(NUArticleContainerViewController *)self pageViewController];
  id v7 = [v6 visibleViewController];
  double v8 = [(NUArticleContainerViewController *)self viewControllerPageableForViewController:v7];

  id v9 = [(NUArticleContainerViewController *)self paging];
  unint64_t v10 = [v8 pageIdentifier];
  id v11 = [v9 pageForIdentifier:v10];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __99__NUArticleContainerViewController_articleBarButtonItemManager_performShareActionForBarButtonItem___block_invoke;
  v13[3] = &unk_2645FE4F0;
  id v14 = v5;
  id v15 = self;
  id v12 = v5;
  [v11 activityProvider:v13];
}

void __99__NUArticleContainerViewController_articleBarButtonItemManager_performShareActionForBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  v15[6] = *MEMORY[0x263EF8340];
  BOOL v3 = (objc_class *)MEMORY[0x263F1C3E8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 activityItemSources];
  id v7 = [v4 activities];

  double v8 = (void *)[v5 initWithActivityItems:v6 applicationActivities:v7];
  uint64_t v9 = *MEMORY[0x263F1D008];
  v15[0] = *MEMORY[0x263F1CF98];
  v15[1] = v9;
  uint64_t v10 = *MEMORY[0x263F1D010];
  v15[2] = *MEMORY[0x263F1CFA8];
  v15[3] = v10;
  uint64_t v11 = *MEMORY[0x263F1CFF8];
  v15[4] = *MEMORY[0x263F1CFE0];
  v15[5] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:6];
  [v8 setExcludedActivityTypes:v12];

  id v13 = [v8 popoverPresentationController];
  [v13 setBarButtonItem:*(void *)(a1 + 32)];
  id v14 = [*(id *)(a1 + 40) navigationController];
  [v14 presentViewController:v8 animated:1 completion:0];
}

- (void)articleBarButtonItemManagerDidLayoutBarButtonItems:(id)a3
{
  if ([(NUArticleContainerViewController *)self isLinkPreviewing])
  {
    id v4 = [(NUArticleContainerViewController *)self navigationController];
    [v4 setToolbarHidden:1];
  }
}

- (void)enableNavigation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NUArticleContainerViewController *)self pageViewController];
  [v4 setPagingEnabled:v3];
}

- (void)loadingWillStart
{
  BOOL v3 = [(NUArticleContainerViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(NUArticleContainerViewController *)self paging];
    id v8 = [v5 firstPage];

    id v6 = [(NUArticleContainerViewController *)self delegate];
    id v7 = [v8 identifier];
    [v6 articleContainerViewController:self willLoadFirstPageWithIdentifier:v7];
  }
}

- (void)loadingDidFinishWithError:(id)a3
{
  id v10 = a3;
  char v4 = [(NUArticleContainerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NUArticleContainerViewController *)self paging];
    id v7 = [v6 firstPage];

    id v8 = [(NUArticleContainerViewController *)self delegate];
    uint64_t v9 = [v7 identifier];
    [v8 articleContainerViewController:self didLoadFirstPageWithIdentifier:v9 error:v10];
  }
}

- (void)styleNavigationForPage:(id)a3
{
  id v4 = a3;
  char v5 = [(NUArticleContainerViewController *)self pageViewController];
  id v6 = [v5 navigationItem];
  id v7 = [v6 titleView];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__NUArticleContainerViewController_styleNavigationForPage___block_invoke_2;
    v13[3] = &unk_2645FE518;
    objc_copyWeak(&v15, &location);
    id v14 = v7;
    [v4 pageStyling:v13];
    id v8 = [(NUArticleContainerViewController *)self paging];
    uint64_t v9 = [v4 identifier];
    id v10 = [v8 pageAfterIdentifier:v9];

    if (v10)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __59__NUArticleContainerViewController_styleNavigationForPage___block_invoke_4;
      v11[3] = &unk_2645FE540;
      objc_copyWeak(&v12, &location);
      [v10 pageStyling:v11];
      objc_destroyWeak(&v12);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __59__NUArticleContainerViewController_styleNavigationForPage___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [*(id *)(a1 + 32) applyPageStyle:v13];
    if (([v5 isLinkPreviewing] & 1) == 0)
    {
      if ([v13 hideToolbar]
        && ([v5 navigationController],
            id v6 = objc_claimAutoreleasedReturnValue(),
            char v7 = [v6 isToolbarHidden],
            v6,
            (v7 & 1) == 0))
      {
        id v10 = [v5 navigationController];
        uint64_t v11 = v10;
        uint64_t v12 = 1;
      }
      else
      {
        if ([v13 hideToolbar]) {
          goto LABEL_10;
        }
        id v8 = [v5 navigationController];
        int v9 = [v8 isToolbarHidden];

        if (!v9) {
          goto LABEL_10;
        }
        id v10 = [v5 navigationController];
        uint64_t v11 = v10;
        uint64_t v12 = 0;
      }
      [v10 setToolbarHidden:v12 animated:1];
    }
LABEL_10:
  }
}

void __59__NUArticleContainerViewController_styleNavigationForPage___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained barButtonItemManager];
  [v4 applyPageStyleToNextBarButtonItem:v3];
}

- (id)viewControllerPageableForViewController:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 conformsToProtocol:&unk_26D4CA108]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (NUArticleContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUArticleContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isLinkPreviewing
{
  return self->_linkPreviewing;
}

- (NUArticleNavigationController)navigationController
{
  return self->_navigationController;
}

- (NUPageViewController)pageViewController
{
  return self->_pageViewController;
}

- (NUPagingFactory)pagingFactory
{
  return self->_pagingFactory;
}

- (NUPaging)paging
{
  return self->_paging;
}

- (void)setPaging:(id)a3
{
}

- (NUArticleBarButtonItemManager)barButtonItemManager
{
  return self->_barButtonItemManager;
}

- (NURouter)router
{
  return self->_router;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_barButtonItemManager, 0);
  objc_storeStrong((id *)&self->_paging, 0);
  objc_storeStrong((id *)&self->_pagingFactory, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end