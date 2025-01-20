@interface SUUIExploreDocumentViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)managesNavigationBarContents;
- (BOOL)prefersNavigationBarBackgroundViewHidden;
- (BOOL)prefersNavigationBarHidden;
- (BOOL)splitViewController:(id)a3 shouldHideViewController:(id)a4 inOrientation:(int64_t)a5;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (SUUIExploreDocumentViewController)initWithTemplateElement:(id)a3;
- (double)_leftColumnWidth;
- (id)_leftPageComponentsAtIndex:(int64_t)a3;
- (id)_newSectionsViewControllerAtIndex:(int64_t)a3;
- (id)_pageComponentsAtIndex:(int64_t)a3;
- (id)_rightPageComponents;
- (id)_rightVCColorScheme;
- (id)_rootNavigationTitle;
- (id)contentScrollView;
- (id)impressionableViewElements;
- (id)navigationBarTintColor;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (void)_beginActiveImpressionsForImpressionableViewElements;
- (void)_contentInsetDidChange:(id)a3;
- (void)_endAllPendingActiveImpression;
- (void)_getPageComponents:(id *)a3 title:(id *)a4 forViewControllerAtIndex:(int64_t)a5;
- (void)_reloadData;
- (void)_reloadLeftViewControllers;
- (void)_reloadRightViewController;
- (void)_reloadSelectionForViewController:(id)a3;
- (void)_updateChildViewControllers;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)documentMediaQueriesDidUpdate:(id)a3;
- (void)loadView;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)selectGenreListComponent:(id)a3;
- (void)setClientContext:(id)a3;
- (void)stackedBar:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUUIExploreDocumentViewController

- (SUUIExploreDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIExploreDocumentViewController;
  v6 = [(SUUIExploreDocumentViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_exploreTemplate, a3);
    v8 = objc_alloc_init(SUUIMetricsImpressionSession);
    activeMetricsImpressionSession = v7->_activeMetricsImpressionSession;
    v7->_activeMetricsImpressionSession = v8;
  }
  return v7;
}

- (void)dealloc
{
  [(CLLocationManager *)self->_locationManager setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIExploreDocumentViewController;
  [(SUUIViewController *)&v3 dealloc];
}

- (void)selectGenreListComponent:(id)a3
{
  id v3 = [a3 viewElement];
  [v3 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (BOOL)managesNavigationBarContents
{
  return ![(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits];
}

- (void)setClientContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIExploreDocumentViewController;
  id v4 = a3;
  [(SUUIViewController *)&v5 setClientContext:v4];
  -[SUUIViewController setClientContext:](self->_rightVC, "setClientContext:", v4, v5.receiver, v5.super_class);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)contentScrollView
{
  return self->_contentScrollView;
}

- (void)loadView
{
  id v6 = objc_alloc_init(MEMORY[0x263F82E00]);
  [(SUUIExploreDocumentViewController *)self setView:v6];
  [(SUUIExploreDocumentViewController *)self _updateChildViewControllers];
  id v3 = objc_alloc_init(SUUIContentInsetScrollView);
  contentScrollView = self->_contentScrollView;
  self->_contentScrollView = v3;

  [v6 addSubview:self->_contentScrollView];
  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__contentInsetDidChange_ name:0x270502910 object:self->_contentScrollView];

  if ([(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits])
  {
    [(SUUIExploreDocumentViewController *)self _reloadLeftViewControllers];
    [(SUUIExploreDocumentViewController *)self _reloadRightViewController];
  }
  else
  {
    [(SUUIExploreDocumentViewController *)self _reloadData];
  }
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  CGFloat height = a4.height;
  double width = a4.width;
  if (self->_rightVC == a3)
  {
    [(UISplitViewController *)self->_splitVC primaryColumnWidth];
    double v10 = width - v9;
    [(UISplitViewController *)self->_splitVC gutterWidth];
    double v7 = v10 - v11;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIExploreDocumentViewController;
    [(SUUIExploreDocumentViewController *)&v13 sizeForChildContentContainer:a4.width withParentContainerSize:a4.height];
    CGFloat height = v8;
  }
  double v12 = height;
  result.CGFloat height = v12;
  result.double width = v7;
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SUUIExploreDocumentViewController *)self navigationController];
  [v5 setNavigationBarHidden:0 animated:v3];

  [(SUUIExploreDocumentViewController *)self _endAllPendingActiveImpression];
  v6.receiver = self;
  v6.super_class = (Class)SUUIExploreDocumentViewController;
  [(SUUIExploreDocumentViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SUUIExploreDocumentViewController *)self navigationController];
  objc_msgSend(v5, "setNavigationBarHidden:animated:", -[SUUIExploreTemplateElement usesSplits](self->_exploreTemplate, "usesSplits") ^ 1, v3);

  [(SUUIExploreDocumentViewController *)self _beginActiveImpressionsForImpressionableViewElements];
  v6.receiver = self;
  v6.super_class = (Class)SUUIExploreDocumentViewController;
  [(SUUIViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"SUUIApplicationPageDidDisplayNotification" object:self];

  v6.receiver = self;
  v6.super_class = (Class)SUUIExploreDocumentViewController;
  [(SUUIExploreDocumentViewController *)&v6 viewDidAppear:v3];
}

- (void)documentDidUpdate:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"SUUIApplicationPageDidUpdateNotification" object:self];

  objc_super v6 = [v4 templateElement];
  exploreTemplate = self->_exploreTemplate;
  self->_exploreTemplate = v6;

  [(SUUIExploreDocumentViewController *)self _updateChildViewControllers];
  BOOL v8 = [(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits];
  if (v8)
  {
    v32 = v4;
    double v9 = [MEMORY[0x263EFF980] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    double v10 = [(UINavigationController *)self->_leftVC viewControllers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v33 + 1) + 8 * i) contentScrollView];
          [v15 contentOffset];
          double v17 = v16;
          double v19 = v18;

          v20 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v17, v19);
          [(NSArray *)v9 addObject:v20];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    contentOffsets = self->_contentOffsets;
    self->_contentOffsets = v9;
    v22 = v9;

    id v4 = v32;
    v23 = [v32 templateElement];
    v24 = self->_exploreTemplate;
    self->_exploreTemplate = v23;

    [(SUUIExploreDocumentViewController *)self _reloadLeftViewControllers];
    [(SUUIExploreDocumentViewController *)self _reloadRightViewController];
    v25 = [(UINavigationController *)self->_leftVC topViewController];

    [(SUUIExploreDocumentViewController *)self _reloadSelectionForViewController:v25];
  }
  else
  {
    [(SUUIExploreDocumentViewController *)self _reloadData];
  }
  v26 = [(SUUIExploreDocumentViewController *)self navigationController];
  v27 = [v26 topViewController];
  BOOL IsDescendent = SUUIViewControllerIsDescendent(self, v27);

  if (IsDescendent)
  {
    if (v8)
    {
      v29 = +[SUUINavigationControllerAssistant existingAssistantForNavigationController:v26];
      [v29 setPalettePinningBarHidden:0];
    }
    [v26 setNavigationBarHidden:v8 ^ 1 animated:0];
  }
  v30 = [(UINavigationController *)self->_navigationController view];
  [v30 setHidden:v8];

  v31 = [(UISplitViewController *)self->_splitVC view];
  [v31 setHidden:v8 ^ 1];
}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
  id v4 = [(UINavigationController *)self->_leftVC viewControllers];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_18];

  rightVC = self->_rightVC;
  [(SUUIStorePageSectionsViewController *)rightVC invalidateAndReload];
}

uint64_t __67__SUUIExploreDocumentViewController_documentMediaQueriesDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidateAndReload];
}

- (void)_updateChildViewControllers
{
  v34[2] = *MEMORY[0x263EF8340];
  if ([(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits])
  {
    if (!self->_splitVC)
    {
      BOOL v3 = (UINavigationController *)objc_alloc_init(MEMORY[0x263F829B8]);
      leftVC = self->_leftVC;
      self->_leftVC = v3;

      [(UINavigationController *)self->_leftVC setNavigationBarHidden:1];
      [(UINavigationController *)self->_leftVC setDelegate:self];
      objc_super v5 = [[SUUIStorePageSectionsViewController alloc] initWithLayoutStyle:2];
      rightVC = self->_rightVC;
      self->_rightVC = v5;

      double v7 = self->_rightVC;
      BOOL v8 = [(SUUIViewController *)self clientContext];
      [(SUUIViewController *)v7 setClientContext:v8];

      double v9 = self->_rightVC;
      double v10 = [(SUUIViewController *)self operationQueue];
      [(SUUIViewController *)v9 setOperationQueue:v10];

      [(SUUIStorePageSectionsViewController *)self->_rightVC setActiveMetricsImpressionSession:self->_activeMetricsImpressionSession];
      uint64_t v11 = (UISplitViewController *)objc_alloc_init(MEMORY[0x263F82BE8]);
      splitVC = self->_splitVC;
      self->_splitVC = v11;

      uint64_t v13 = self->_splitVC;
      [(SUUIExploreDocumentViewController *)self _leftColumnWidth];
      -[UISplitViewController setMaximumPrimaryColumnWidth:](v13, "setMaximumPrimaryColumnWidth:");
      v14 = self->_splitVC;
      [(SUUIExploreDocumentViewController *)self _leftColumnWidth];
      -[UISplitViewController setMinimumPrimaryColumnWidth:](v14, "setMinimumPrimaryColumnWidth:");
      v15 = self->_splitVC;
      double v16 = self->_rightVC;
      v34[0] = self->_leftVC;
      v34[1] = v16;
      double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
      [(UISplitViewController *)v15 setViewControllers:v17];

      [(UISplitViewController *)self->_splitVC setDelegate:self];
      [(SUUIExploreDocumentViewController *)self addChildViewController:self->_splitVC];
      double v18 = [(UISplitViewController *)self->_splitVC view];
      [v18 setAutoresizingMask:18];
      double v19 = [(SUUIExploreDocumentViewController *)self view];
      [v19 bounds];
      objc_msgSend(v18, "setFrame:");

      v20 = [(SUUIExploreDocumentViewController *)self view];
      [v20 addSubview:v18];
    }
    navigationController = self->_navigationController;
    if (navigationController)
    {
      v22 = [(UINavigationController *)navigationController view];
      [v22 removeFromSuperview];

      [(SUUIExploreDocumentViewController *)self removeChildViewController:self->_navigationController];
      [(UINavigationController *)self->_navigationController setDelegate:0];
      v23 = self->_navigationController;
      self->_navigationController = 0;
    }
  }
  else
  {
    if (!self->_navigationController)
    {
      v24 = (UINavigationController *)objc_alloc_init(MEMORY[0x263F829B8]);
      v25 = self->_navigationController;
      self->_navigationController = v24;

      [(UINavigationController *)self->_navigationController setDelegate:self];
      [(UINavigationController *)self->_navigationController setNavigationBarHidden:1 animated:0];
      [(SUUIExploreDocumentViewController *)self addChildViewController:self->_navigationController];
      v26 = [(UINavigationController *)self->_navigationController view];
      [v26 setAutoresizingMask:18];
      v27 = [(SUUIExploreDocumentViewController *)self view];
      [v27 bounds];
      objc_msgSend(v26, "setFrame:");

      v28 = [(SUUIExploreDocumentViewController *)self view];
      [v28 addSubview:v26];
    }
    v29 = self->_splitVC;
    if (v29)
    {
      v30 = [(UISplitViewController *)v29 view];
      [v30 removeFromSuperview];

      [(SUUIExploreDocumentViewController *)self removeChildViewController:self->_splitVC];
      [(UISplitViewController *)self->_splitVC setDelegate:0];
      v31 = self->_splitVC;
      self->_splitVC = 0;

      [(UINavigationController *)self->_leftVC setDelegate:0];
      v32 = self->_leftVC;
      self->_leftVC = 0;

      long long v33 = self->_rightVC;
      self->_rightVC = 0;
    }
  }
}

- (id)impressionableViewElements
{
  if ([(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits])
  {
    BOOL v3 = [(UINavigationController *)self->_leftVC visibleViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 _impressionableViewElements];
    }
    else
    {
      id v4 = 0;
    }
    objc_super v5 = [(SUUIStorePageSectionsViewController *)self->_rightVC _impressionableViewElements];
    objc_super v6 = v5;
    if (v5)
    {
      if (v4)
      {
        uint64_t v7 = [v4 arrayByAddingObjectsFromArray:v5];

        id v4 = (id)v7;
      }
      else
      {
        id v4 = v5;
      }
    }
  }
  else
  {
    BOOL v3 = [(UINavigationController *)self->_navigationController visibleViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 _impressionableViewElements];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  BOOL IsEnabledForAuthorizationStatus = SUUINearMeIsEnabledForAuthorizationStatus(a4);
  if (self->_nearMeEnabled != IsEnabledForAuthorizationStatus)
  {
    self->_nearMeEnabled = IsEnabledForAuthorizationStatus;
    if ([(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits])
    {
      [(SUUIExploreDocumentViewController *)self _reloadRightViewController];
    }
    else
    {
      [(SUUIExploreDocumentViewController *)self _reloadData];
    }
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  v20 = (UINavigationController *)a3;
  id v7 = a4;
  if (self->_leftVC == v20)
  {
    BOOL v8 = [v7 contentScrollView];
    [(SUUIContentInsetScrollView *)self->_contentScrollView scrollIndicatorInsets];
    SUUIScrollViewSetContentInsets(v8, "SUUIExploreDocumentViewController", v9, v10, v11, v12);

    SUUIStackedBarNavDidShow(v20, v7);
    uint64_t v13 = [(UINavigationController *)v20 viewControllers];
    unint64_t v14 = [v13 indexOfObject:v7];

    if ([(NSArray *)self->_contentOffsets count] > v14)
    {
      v15 = [(UINavigationController *)v20 viewControllers];
      uint64_t v16 = [v15 count];
      NSUInteger v17 = [(NSArray *)self->_contentOffsets count];

      if (v16 == v17)
      {
        double v18 = [v7 contentScrollView];
        double v19 = [(NSArray *)self->_contentOffsets objectAtIndex:v14];
        [v19 CGPointValue];
        objc_msgSend(v18, "setContentOffset:");
      }
    }
  }
  else
  {
    SUUIStackedBarNavDidShow(v20, v7);
  }
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  double v10 = (UINavigationController *)a3;
  id v11 = a5;
  id v12 = a6;
  if (self->_leftVC == v10)
  {
    double v18 = SUUIStackedBarNavAnimationController(v10, a4, v11, v12);
    goto LABEL_14;
  }
  uint64_t v13 = [(UINavigationController *)v10 viewControllers];
  unint64_t v14 = v13;
  if (a4 == 1)
  {
    if ((unint64_t)[v13 count] < 2) {
      goto LABEL_13;
    }
    id v19 = [v14 objectAtIndex:1];

    if (v19 != v12) {
      goto LABEL_13;
    }
    id v21 = 0;
    [(SUUIExploreDocumentViewController *)self _getPageComponents:0 title:&v21 forViewControllerAtIndex:0];
    id v16 = v21;
    NSUInteger v17 = v11;
    goto LABEL_11;
  }
  if (a4 != 2) {
    goto LABEL_13;
  }
  id v15 = [v13 firstObject];

  if (v15 != v12) {
    goto LABEL_13;
  }
  id v16 = [(SUUIExploreDocumentViewController *)self _rootNavigationTitle];
  if (v16)
  {
    NSUInteger v17 = v12;
LABEL_11:
    [v17 setTitle:v16];
  }

LABEL_13:
  double v18 = SUUIStackedBarNavAnimationController(v10, a4, v11, v12);

LABEL_14:
  return v18;
}

- (BOOL)prefersNavigationBarBackgroundViewHidden
{
  return 0;
}

- (id)navigationBarTintColor
{
  return 0;
}

- (BOOL)prefersNavigationBarHidden
{
  return ![(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits];
}

- (void)stackedBar:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  if ((a4 & 0x8000000000000000) == 0)
  {
    objc_super v6 = [(SUUIExploreTemplateElement *)self->_exploreTemplate childViewElements];
    unint64_t v7 = [v6 count];

    if (v7 > a4)
    {
      BOOL v8 = [(SUUIExploreTemplateElement *)self->_exploreTemplate childViewElements];
      id v9 = [v8 objectAtIndex:a4];

      [v9 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
    }
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  v20 = (UINavigationController *)a3;
  id v7 = a4;
  if (self->_leftVC == v20)
  {
    BOOL v8 = [v7 contentScrollView];
    [(SUUIContentInsetScrollView *)self->_contentScrollView scrollIndicatorInsets];
    SUUIScrollViewSetContentInsets(v8, "SUUIExploreDocumentViewController", v9, v10, v11, v12);

    [(SUUIExploreDocumentViewController *)self _reloadSelectionForViewController:v7];
    uint64_t v13 = [(UINavigationController *)v20 viewControllers];
    unint64_t v14 = [v13 indexOfObject:v7];

    if ([(NSArray *)self->_contentOffsets count] > v14)
    {
      id v15 = [(UINavigationController *)v20 viewControllers];
      uint64_t v16 = [v15 count];
      NSUInteger v17 = [(NSArray *)self->_contentOffsets count];

      if (v16 == v17)
      {
        double v18 = [v7 contentScrollView];
        id v19 = [(NSArray *)self->_contentOffsets objectAtIndex:v14];
        [v19 CGPointValue];
        objc_msgSend(v18, "setContentOffset:");
      }
    }
  }
}

- (BOOL)splitViewController:(id)a3 shouldHideViewController:(id)a4 inOrientation:(int64_t)a5
{
  return 0;
}

- (void)_contentInsetDidChange:(id)a3
{
  if ([(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits])
  {
    id v4 = [(UINavigationController *)self->_leftVC viewControllers];
    objc_super v5 = [v4 firstObject];
    id v6 = (id)[v5 view];

    id v7 = (id)[(SUUIStorePageSectionsViewController *)self->_rightVC view];
    [(SUUIContentInsetScrollView *)self->_contentScrollView scrollIndicatorInsets];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    uint64_t v16 = [(SUUIStorePageSectionsViewController *)self->_rightVC contentScrollView];
    SUUIScrollViewSetContentInsets(v16, "SUUIExploreDocumentViewController", v9, v11, v13, v15);

    id v19 = [(UINavigationController *)self->_leftVC viewControllers];
    NSUInteger v17 = [v19 firstObject];
    double v18 = [v17 contentScrollView];
    SUUIScrollViewSetContentInsets(v18, "SUUIExploreDocumentViewController", v9, v11, 0.0, v15);
  }
}

- (id)_rootNavigationTitle
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__33;
  double v10 = __Block_byref_object_dispose__33;
  id v11 = 0;
  v2 = [(SUUIExploreTemplateElement *)self->_exploreTemplate navigationBarElement];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__SUUIExploreDocumentViewController__rootNavigationTitle__block_invoke;
  v5[3] = &unk_265400D50;
  v5[4] = &v6;
  [v2 enumerateChildrenUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __57__SUUIExploreDocumentViewController__rootNavigationTitle__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v11;
  if (isKindOfClass)
  {
    id v5 = v11;
    if ([v5 labelViewStyle] == 5)
    {
      uint64_t v6 = [v5 text];
      uint64_t v7 = [v6 string];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      double v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    id v4 = v11;
  }
  return MEMORY[0x270F9A758](isKindOfClass, v4);
}

- (void)_getPageComponents:(id *)a3 title:(id *)a4 forViewControllerAtIndex:(int64_t)a5
{
  id v12 = [(SUUIExploreTemplateElement *)self->_exploreTemplate childViewElements];
  if ([v12 count] <= (unint64_t)a5)
  {
    double v10 = 0;
    id v11 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  double v9 = [v12 objectAtIndex:a5];
  double v10 = [v9 title];

  id v11 = [(SUUIExploreDocumentViewController *)self _pageComponentsAtIndex:a5];
  if (a4) {
LABEL_5:
  }
    *a4 = v10;
LABEL_6:
  if (a3) {
    *a3 = v11;
  }
}

- (id)_newSectionsViewControllerAtIndex:(int64_t)a3
{
  id v13 = 0;
  id v14 = 0;
  [(SUUIExploreDocumentViewController *)self _getPageComponents:&v14 title:&v13 forViewControllerAtIndex:a3];
  id v5 = v14;
  id v6 = v13;
  uint64_t v7 = objc_alloc_init(SUUIStackedBar);
  [(SUUIStackedBar *)v7 setDelegate:self];
  [(SUUIStackedBar *)v7 setSplitViewStyle:[(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits]];
  if ([(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits]) {
    [(SUUIStackedBar *)v7 setZeroHeightWhenFirstChildExpanded:a3 == 0];
  }
  if ([(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  double v9 = [[SUUIStorePageSectionsViewController alloc] initWithLayoutStyle:v8];
  double v10 = [(SUUIViewController *)self clientContext];
  [(SUUIViewController *)v9 setClientContext:v10];

  id v11 = [(SUUIViewController *)self operationQueue];
  [(SUUIViewController *)v9 setOperationQueue:v11];

  [(SUUIStorePageSectionsViewController *)v9 setSectionsWithPageComponents:v5];
  [(SUUIStorePageSectionsViewController *)v9 setSUUIStackedBar:v7];
  if ([(SUUIExploreTemplateElement *)self->_exploreTemplate usesSplits]) {
    [(SUUIStorePageSectionsViewController *)v9 setAutomaticallyAdjustsScrollViewInsets:0];
  }
  [(SUUIStorePageSectionsViewController *)v9 setTitle:v6];
  [(SUUIStorePageSectionsViewController *)v9 setActiveMetricsImpressionSession:self->_activeMetricsImpressionSession];

  return v9;
}

- (id)_pageComponentsAtIndex:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [(SUUIExploreTemplateElement *)self->_exploreTemplate childViewElements];
  uint64_t v7 = [v6 objectAtIndex:a3];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __60__SUUIExploreDocumentViewController__pageComponentsAtIndex___block_invoke;
  v23[3] = &unk_2654008B8;
  id v8 = v5;
  id v24 = v8;
  [v7 enumerateChildrenUsingBlock:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      uint64_t v14 = 0;
      double v15 = v12;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
        if (objc_msgSend(v16, "componentType", (void)v19) == 16)
        {
          if ([v15 componentType] != 17) {
            [v16 setShowTopBorder:1];
          }
          id v12 = v15;
          goto LABEL_14;
        }
        id v12 = v16;

        ++v14;
        double v15 = v12;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v12 = 0;
  }
LABEL_14:

  id v17 = v9;
  return v17;
}

void __60__SUUIExploreDocumentViewController__pageComponentsAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (objc_class *)SUUIPageComponentClassForComponentType([v5 pageComponentType]);
  if (v3)
  {
    id v4 = (void *)[[v3 alloc] initWithViewElement:v5];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

- (void)_reloadData
{
  if (!self->_locationManager)
  {
    uint64_t v3 = SUUICoreLocationFramework();
    id v4 = (CLLocationManager *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Cllocationmana.isa, v3));
    locationManager = self->_locationManager;
    self->_locationManager = v4;

    [(CLLocationManager *)self->_locationManager setDelegate:self];
    id v6 = objc_opt_class();
    self->_nearMeEnabled = SUUINearMeIsEnabledForAuthorizationStatus([v6 authorizationStatus]);
  }
  uint64_t v7 = [(UINavigationController *)self->_navigationController viewControllers];
  id v8 = [MEMORY[0x263EFF980] array];
  id v9 = [(SUUIExploreTemplateElement *)self->_exploreTemplate childViewElements];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    do
    {
      if ([v7 count] <= v11)
      {
        id v14 = [(SUUIExploreDocumentViewController *)self _newSectionsViewControllerAtIndex:v11];
      }
      else
      {
        id v23 = 0;
        id v24 = 0;
        [(SUUIExploreDocumentViewController *)self _getPageComponents:&v24 title:&v23 forViewControllerAtIndex:v11];
        id v12 = v24;
        id v13 = v23;
        id v14 = [v7 objectAtIndex:v11];
        [v14 setSectionsWithPageComponents:v12];
      }
      double v15 = [(SUUIExploreTemplateElement *)self->_exploreTemplate childViewElements];
      uint64_t v16 = [v15 count];

      if (v16 == 1)
      {
        id v17 = [(SUUIExploreDocumentViewController *)self _rootNavigationTitle];
        if (v17) {
          [v14 setTitle:v17];
        }
      }
      [v8 addObject:v14];

      ++v11;
      double v18 = [(SUUIExploreTemplateElement *)self->_exploreTemplate childViewElements];
      unint64_t v19 = [v18 count];
    }
    while (v11 < v19);
  }
  if ([v7 count])
  {
    uint64_t v20 = [v7 count];
    if (v20 != [v8 count])
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __48__SUUIExploreDocumentViewController__reloadData__block_invoke;
      v21[3] = &unk_265400890;
      v21[4] = self;
      id v22 = v8;
      dispatch_async(MEMORY[0x263EF83A0], v21);
    }
  }
  else
  {
    [(UINavigationController *)self->_navigationController setViewControllers:v8 animated:0];
  }
}

uint64_t __48__SUUIExploreDocumentViewController__reloadData__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1096) setViewControllers:*(void *)(a1 + 40) animated:1];
}

- (void)_reloadLeftViewControllers
{
  uint64_t v3 = [(UINavigationController *)self->_leftVC viewControllers];
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [(SUUIExploreTemplateElement *)self->_exploreTemplate childViewElements];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      if ([v3 count] <= v7)
      {
        id v10 = [(SUUIExploreDocumentViewController *)self _newSectionsViewControllerAtIndex:v7];
      }
      else
      {
        id v16 = 0;
        id v17 = 0;
        [(SUUIExploreDocumentViewController *)self _getPageComponents:&v17 title:&v16 forViewControllerAtIndex:v7];
        id v8 = v17;
        id v9 = v16;
        id v10 = [v3 objectAtIndex:v7];
        [v10 setTitle:v9];
        [v10 setSectionsWithPageComponents:v8];
      }
      [v4 addObject:v10];

      ++v7;
      unint64_t v11 = [(SUUIExploreTemplateElement *)self->_exploreTemplate childViewElements];
      unint64_t v12 = [v11 count];
    }
    while (v7 < v12);
  }
  if ([v3 count])
  {
    uint64_t v13 = [v3 count];
    if (v13 != [v4 count])
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __63__SUUIExploreDocumentViewController__reloadLeftViewControllers__block_invoke;
      v14[3] = &unk_265400890;
      v14[4] = self;
      id v15 = v4;
      dispatch_async(MEMORY[0x263EF83A0], v14);
    }
  }
  else
  {
    [(UINavigationController *)self->_leftVC setViewControllers:v4 animated:0];
  }
}

uint64_t __63__SUUIExploreDocumentViewController__reloadLeftViewControllers__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1080) setViewControllers:*(void *)(a1 + 40) animated:1];
}

- (void)_reloadSelectionForViewController:(id)a3
{
  id v11 = a3;
  uint64_t v3 = [v11 sections];
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [v3 objectAtIndex:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [v5 pageComponent];
        unint64_t v7 = [v6 viewElement];
        int v8 = [v7 isSelected];

        if (v8)
        {
          id v9 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v4];
          id v10 = [v11 collectionView];
          [v10 selectItemAtIndexPath:v9 animated:0 scrollPosition:0];
        }
      }

      ++v4;
    }
    while (v4 < [v3 count]);
  }
}

- (void)_reloadRightViewController
{
  if (!self->_locationManager)
  {
    uint64_t v3 = SUUICoreLocationFramework();
    unint64_t v4 = (CLLocationManager *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Cllocationmana.isa, v3));
    locationManager = self->_locationManager;
    self->_locationManager = v4;

    [(CLLocationManager *)self->_locationManager setDelegate:self];
    uint64_t v6 = objc_opt_class();
    self->_nearMeEnabled = SUUINearMeIsEnabledForAuthorizationStatus([v6 authorizationStatus]);
  }
  rightVC = self->_rightVC;
  int v8 = [(SUUIExploreDocumentViewController *)self _rightPageComponents];
  [(SUUIStorePageSectionsViewController *)rightVC setSectionsWithPageComponents:v8];

  id v9 = [(SUUIExploreDocumentViewController *)self _rightVCColorScheme];
  [(SUUIStorePageSectionsViewController *)self->_rightVC setColorScheme:v9];
}

- (double)_leftColumnWidth
{
  v2 = [MEMORY[0x263F82E88] keyWindow];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.double width = v8;
  v12.size.CGFloat height = v10;
  if (CGRectGetWidth(v12) >= 1024.0
    && (v13.origin.x = v4, v13.origin.y = v6, v13.size.width = v8, v13.size.CGFloat height = v10, CGRectGetHeight(v13) >= 1024.0))
  {
    return 375.0;
  }
  else
  {
    return 300.0;
  }
}

- (id)_leftPageComponentsAtIndex:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  CGFloat v6 = [(SUUIExploreTemplateElement *)self->_exploreTemplate childViewElements];
  double v7 = [v6 objectAtIndex:a3];

  CGFloat v8 = [v7 flattenedChildren];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v15 = (objc_class *)SUUIPageComponentClassForComponentType([v14 pageComponentType]);
        if (v15)
        {
          id v16 = (void *)[[v15 alloc] initWithViewElement:v14];
          if (v16)
          {
            [v5 addObject:v16];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v16 setIndex:v11++];
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)_rightPageComponents
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  CGFloat v4 = [(SUUIExploreTemplateElement *)self->_exploreTemplate rightSplit];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__SUUIExploreDocumentViewController__rightPageComponents__block_invoke;
  v7[3] = &unk_2654008B8;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateChildrenUsingBlock:v7];

  return v5;
}

void __57__SUUIExploreDocumentViewController__rightPageComponents__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (objc_class *)SUUIPageComponentClassForComponentType([v5 pageComponentType]);
  if (v3)
  {
    CGFloat v4 = (void *)[[v3 alloc] initWithViewElement:v5];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

- (id)_rightVCColorScheme
{
  v2 = [(SUUIExploreTemplateElement *)self->_exploreTemplate rightSplit];
  id v3 = [v2 style];
  CGFloat v4 = [v3 ikBackgroundColor];
  id v5 = [v4 color];

  if (v5)
  {
    CGFloat v6 = objc_alloc_init(SUUIColorScheme);
    [(SUUIColorScheme *)v6 setBackgroundColor:v5];
  }
  else
  {
    CGFloat v6 = 0;
  }

  return v6;
}

- (void)_beginActiveImpressionsForImpressionableViewElements
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(SUUIExploreDocumentViewController *)self impressionableViewElements];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SUUIMetricsImpressionSession *)self->_activeMetricsImpressionSession beginActiveImpressionForViewElement:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_endAllPendingActiveImpression
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitVC, 0);
  objc_storeStrong((id *)&self->_rightVC, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_leftVC, 0);
  objc_storeStrong((id *)&self->_exploreTemplate, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_contentOffsets, 0);
  objc_storeStrong((id *)&self->_activeMetricsImpressionSession, 0);
}

@end