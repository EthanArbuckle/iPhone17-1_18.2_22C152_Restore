@interface MSPurchasesViewController
- (MSPurchasesViewController)initWithSection:(id)a3;
- (id)_activeViewController;
- (id)_newSegmentedControlWithPageSectionGroup:(id)a3;
- (id)_newViewControllerForPageSection:(id)a3;
- (id)copyArchivableContext;
- (void)_reloadSegmentedControlPlacement;
- (void)_reloadViewControllersWithSection:(id)a3;
- (void)_segmentedControlAction:(id)a3;
- (void)_setActiveViewControllerIndex:(int64_t)a3;
- (void)_showActiveViewController;
- (void)dealloc;
- (void)invalidateForMemoryPurge;
- (void)loadView;
- (void)restoreArchivableContext:(id)a3;
- (void)tabBarControllerDidReselectTabBarItem:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MSPurchasesViewController

- (MSPurchasesViewController)initWithSection:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MSPurchasesViewController;
  v4 = -[SUViewController initWithSection:](&v9, sel_initWithSection_);
  if (v4)
  {
    v5 = (void *)[a3 pageSectionGroup];
    if (objc_msgSend((id)objc_msgSend(v5, "sections"), "count"))
    {
      v4->_activeViewControllerIndex = [v5 defaultSectionIndex];
      v6 = [(MSPurchasesViewController *)v4 _newSegmentedControlWithPageSectionGroup:v5];
      v4->_segmentedControl = v6;
      [(SUSegmentedControl *)v6 addTarget:v4 action:sel__segmentedControlAction_ forControlEvents:4096];
    }
    v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v4 selector:sel__tabConfigurationChangedNotification_ name:*MEMORY[0x263F89788] object:0];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89788] object:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  viewControllers = self->_viewControllers;
  uint64_t v5 = [(NSArray *)viewControllers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(viewControllers);
        }
        [(MSPurchasesViewController *)self removeChildViewController:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSArray *)viewControllers countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(SUSegmentedControl *)self->_segmentedControl removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v9.receiver = self;
  v9.super_class = (Class)MSPurchasesViewController;
  [(SUViewController *)&v9 dealloc];
}

- (id)copyArchivableContext
{
  v5.receiver = self;
  v5.super_class = (Class)MSPurchasesViewController;
  id v3 = [(SUViewController *)&v5 copyArchivableContext];
  objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_activeViewControllerIndex), @"index");
  return v3;
}

- (void)invalidateForMemoryPurge
{
  [(NSArray *)self->_viewControllers makeObjectsPerformSelector:a2];
  [(MSPurchasesViewController *)self _reloadSegmentedControlPlacement];
  v3.receiver = self;
  v3.super_class = (Class)MSPurchasesViewController;
  [(SUViewController *)&v3 invalidateForMemoryPurge];
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)MSPurchasesViewController;
  [(SUViewController *)&v7 loadView];
  v6.receiver = self;
  v6.super_class = (Class)MSPurchasesViewController;
  id v3 = [(MSPurchasesViewController *)&v6 view];
  containerView = self->_containerView;
  if (!containerView)
  {
    objc_super v5 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    self->_containerView = v5;
    [(UIView *)v5 setAutoresizingMask:18];
    containerView = self->_containerView;
  }
  [v3 bounds];
  -[UIView setFrame:](containerView, "setFrame:");
  [v3 addSubview:self->_containerView];
  if (![(NSArray *)self->_viewControllers count]) {
    [(MSPurchasesViewController *)self _reloadViewControllersWithSection:[(MSPurchasesViewController *)self section]];
  }
  [(MSPurchasesViewController *)self _reloadSegmentedControlPlacement];
  [(MSPurchasesViewController *)self _showActiveViewController];
}

- (void)restoreArchivableContext:(id)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "valueForMetadataKey:", @"index"), "integerValue");
  NSUInteger v6 = [(NSArray *)self->_viewControllers count];
  if (v5 >= v6 - 1) {
    unint64_t v5 = v6 - 1;
  }
  [(MSPurchasesViewController *)self _setActiveViewControllerIndex:v5];
  [(SUSegmentedControl *)self->_segmentedControl setSelectedItemIndex:v5];
  v7.receiver = self;
  v7.super_class = (Class)MSPurchasesViewController;
  [(SUViewController *)&v7 restoreArchivableContext:a3];
}

- (void)tabBarControllerDidReselectTabBarItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  viewControllers = self->_viewControllers;
  uint64_t v5 = [(NSArray *)viewControllers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(viewControllers);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) tabBarControllerDidReselectTabBarItem:a3];
      }
      uint64_t v6 = [(NSArray *)viewControllers countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MSPurchasesViewController *)self _reloadSegmentedControlPlacement];
  v5.receiver = self;
  v5.super_class = (Class)MSPurchasesViewController;
  [(SUViewController *)&v5 viewWillAppear:v3];
}

- (void)_segmentedControlAction:(id)a3
{
  uint64_t v4 = [(SUSegmentedControl *)self->_segmentedControl selectedItemIndex];
  [(MSPurchasesViewController *)self _setActiveViewControllerIndex:v4];
}

- (id)_activeViewController
{
  return [(NSArray *)self->_viewControllers objectAtIndex:self->_activeViewControllerIndex];
}

- (id)_newSegmentedControlWithPageSectionGroup:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F896A0]);
  uint64_t v6 = (void *)[a3 sections];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "segmentedControlItem"));
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  objc_msgSend(v5, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  [v5 setItems:v7];
  [v5 setSelectedItemIndex:self->_activeViewControllerIndex];

  return v5;
}

- (id)_newViewControllerForPageSection:(id)a3
{
  id v5 = [(SUViewController *)self viewControllerFactory];
  if ([a3 structuredPageType] == 9)
  {
    uint64_t v6 = (void *)[v5 newDownloadsViewController];
  }
  else
  {
    uint64_t v6 = (void *)[v5 newStorePageViewControllerWithSection:0];
    objc_msgSend(v6, "setURLRequestProperties:", objc_msgSend(a3, "URLRequestProperties"));
  }
  objc_msgSend(v6, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  return v6;
}

- (void)_reloadSegmentedControlPlacement
{
  if (self->_segmentedControl && [(MSPurchasesViewController *)self isViewLoaded])
  {
    BOOL v3 = (void *)[(MSPurchasesViewController *)self view];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1
      || ![(MSPurchasesViewController *)self isInMoreList])
    {
      if ((void *)[(SUSegmentedControl *)self->_segmentedControl superview] == v3) {
        [(SUSegmentedControl *)self->_segmentedControl removeFromSuperview];
      }
      [(SUSegmentedControl *)self->_segmentedControl setAutoresizingMask:0];
      [(SUNavigationItem *)[(SUViewController *)self navigationItem] setTitleView:self->_segmentedControl];
    }
    else
    {
      [(SUNavigationItem *)[(SUViewController *)self navigationItem] setTitleView:0];
      [(SUSegmentedControl *)self->_segmentedControl setAutoresizingMask:2];
      [(SUSegmentedControl *)self->_segmentedControl setSegmentedControlStyle:7];
      [v3 addSubview:self->_segmentedControl];
    }
    [(SUSegmentedControl *)self->_segmentedControl sizeToFitUserInterfaceIdiom];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    if ((void *)[(SUSegmentedControl *)self->_segmentedControl superview] == v3)
    {
      [(SUSegmentedControl *)self->_segmentedControl frame];
      CGFloat v14 = v13;
      CGFloat v15 = *MEMORY[0x263F00148];
      double v16 = *(double *)(MEMORY[0x263F00148] + 8);
      -[SUSegmentedControl setFrame:](self->_segmentedControl, "setFrame:", *MEMORY[0x263F00148], v16, v9);
      p_containerView = &self->_containerView;
      [(UIView *)*p_containerView frame];
      double v18 = v17;
      v22.origin.x = v15;
      v22.origin.y = v16;
      v22.size.width = v9;
      v22.size.height = v14;
      double MaxY = CGRectGetMaxY(v22);
      v23.origin.x = v5;
      v23.origin.y = v7;
      v23.size.width = v9;
      v23.size.height = v11;
      double v11 = CGRectGetHeight(v23) - MaxY;
      double v5 = v18;
      double v7 = MaxY;
    }
    else
    {
      p_containerView = &self->_containerView;
    }
    v20 = *p_containerView;
    -[UIView setFrame:](v20, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)_reloadViewControllersWithSection:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v6 = objc_msgSend((id)objc_msgSend(a3, "pageSectionGroup"), "sections");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(MSPurchasesViewController *)self _newViewControllerForPageSection:*(void *)(*((void *)&v24 + 1) + 8 * v10)];
        if (v11)
        {
          long long v12 = v11;
          [v5 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }
  if (![v5 count])
  {
    double v13 = objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", a3);
    if (v13)
    {
      CGFloat v14 = v13;
      objc_msgSend(v13, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
      [v5 addObject:v14];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v5);
        }
        v19 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
        objc_msgSend(v19, "_setExistingNavigationItem:", -[SUViewController navigationItem](self, "navigationItem"));
        objc_msgSend(v19, "_setExistingTabBarItem:", -[SUViewController tabBarItem](self, "tabBarItem"));
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }

  self->_viewControllers = (NSArray *)[v5 copy];
}

- (void)_setActiveViewControllerIndex:(int64_t)a3
{
  if (self->_activeViewControllerIndex != a3)
  {
    if ([(MSPurchasesViewController *)self isViewLoaded])
    {
      id v5 = [(NSArray *)self->_viewControllers objectAtIndex:self->_activeViewControllerIndex];
      [v5 storePageCleanupBeforeTearDown];
      [(MSPurchasesViewController *)self removeChildViewController:v5];
      [v5 viewWillDisappear:0];
      objc_msgSend((id)objc_msgSend(v5, "view"), "removeFromSuperview");
      [v5 viewDidDisappear:0];
      self->_activeViewControllerIndex = a3;
      [(MSPurchasesViewController *)self _showActiveViewController];
    }
    else
    {
      self->_activeViewControllerIndex = a3;
    }
  }
}

- (void)_showActiveViewController
{
  id v3 = [(NSArray *)self->_viewControllers objectAtIndex:self->_activeViewControllerIndex];
  [(MSPurchasesViewController *)self addChildViewController:v3];
  [v3 viewWillAppear:0];
  double v4 = (void *)[v3 view];
  [(UIView *)self->_containerView bounds];
  objc_msgSend(v4, "setFrame:");
  [(UIView *)self->_containerView addSubview:v4];
  [v3 viewDidAppear:1];
}

@end