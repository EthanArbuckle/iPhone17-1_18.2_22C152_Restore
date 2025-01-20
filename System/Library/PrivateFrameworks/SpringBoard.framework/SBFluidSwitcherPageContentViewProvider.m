@interface SBFluidSwitcherPageContentViewProvider
- (BOOL)isSuitableForRecycledItemContainer:(id)a3;
- (CGSize)_pageViewSizeForAppLayout:(id)a3;
- (SBFluidSwitcherPageContentViewProvider)init;
- (SBFluidSwitcherPageContentViewProvider)initWithDelegate:(id)a3 snapshotCache:(id)a4 lockoutViewProvider:(id)a5;
- (SBFluidSwitcherPageContentViewProviderDelegate)delegate;
- (id)_containerViewController;
- (id)_snapshotViewDelegate;
- (id)_snapshotViewForAppLayout:(id)a3 setActive:(BOOL)a4;
- (id)_viewForService:(id)a3 appLayout:(id)a4;
- (id)existingTransientOverlayViewControllerForAppLayout:(id)a3;
- (id)pageContentViewForAppLayout:(id)a3 setActive:(BOOL)a4;
- (int64_t)_interfaceOrientation;
- (int64_t)_preferredContentInterfaceOrientationForViewController:(id)a3 preferredInterfaceOrientation:(int64_t)a4;
- (void)_applyTransientOverlayViewController:(id)a3 toPageContentView:(id)a4;
- (void)_relinquishTransientOverlayViewController:(id)a3 forPageContentView:(id)a4;
- (void)acquiredViewController:(id)a3 forTransientOverlayAppLayout:(id)a4;
- (void)appSwitcherTransientOverlayPageContentViewDidChangeActive:(id)a3;
- (void)appSwitcherTransientOverlayPageContentViewDidChangeContainerOrientation:(id)a3;
- (void)purgePageContentViewForAppLayout:(id)a3;
- (void)relinquishTransientOverlayViewController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBFluidSwitcherPageContentViewProvider

- (BOOL)isSuitableForRecycledItemContainer:(id)a3
{
  return [a3 type] == 0;
}

- (SBFluidSwitcherPageContentViewProvider)initWithDelegate:(id)a3 snapshotCache:(id)a4 lockoutViewProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBFluidSwitcherPageContentViewProvider;
  v12 = [(SBFluidSwitcherPageContentViewProvider *)&v16 init];
  if (v12)
  {
    if (v9)
    {
      if (v10)
      {
LABEL_4:
        objc_storeWeak((id *)&v12->_delegate, v9);
        objc_storeStrong((id *)&v12->_snapshotCache, a4);
        objc_storeStrong((id *)&v12->_lockoutVCProvider, a5);
        goto LABEL_5;
      }
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v12, @"SBFluidSwitcherPageContentViewProvider.m", 58, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

      if (v10) {
        goto LABEL_4;
      }
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, v12, @"SBFluidSwitcherPageContentViewProvider.m", 59, @"Invalid parameter not satisfying: %@", @"cache" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (SBFluidSwitcherPageContentViewProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherPageContentViewProvider.m" lineNumber:68 description:@"use initWithDelegate:snapshotCache:"];

  return 0;
}

- (void)acquiredViewController:(id)a3 forTransientOverlayAppLayout:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(NSMapTable *)self->_pageContentViewToTransientOverlayViewController objectEnumerator];
  v7 = [v6 allObjects];
  char v8 = [v7 containsObject:v5];

  if ((v8 & 1) == 0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = self->_transientOverlayPageContentViews;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v15 = -[NSMapTable objectForKey:](self->_pageContentViewToTransientOverlayViewController, "objectForKey:", v14, (void)v16);
          if (!v15 && [v14 isActive])
          {
            [(SBFluidSwitcherPageContentViewProvider *)self _applyTransientOverlayViewController:v5 toPageContentView:v14];
            goto LABEL_13;
          }
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (id)existingTransientOverlayViewControllerForAppLayout:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 type] == 2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self->_pageContentViewToTransientOverlayViewController;
    uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "appLayout", (void)v15);
          int v12 = [v11 isEqual:v4];

          if (v12)
          {
            v13 = [(NSMapTable *)self->_pageContentViewToTransientOverlayViewController objectForKey:v10];
            goto LABEL_13;
          }
        }
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    v13 = 0;
LABEL_13:
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)pageContentViewForAppLayout:(id)a3 setActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 type] == 3)
  {
    uint64_t v7 = +[SBAppSwitcherServiceManager sharedInstance];
    uint64_t v8 = [v7 registeredServicesSnapshot];

    id v9 = [v6 itemForLayoutRole:1];
    uint64_t v10 = [v9 bundleIdentifier];
    uint64_t v11 = [v8 serviceForBundleIdentifier:v10];
    int v12 = [(SBFluidSwitcherPageContentViewProvider *)self _viewForService:v11 appLayout:v6];
    [(SBAppSwitcherTransientOverlayPageContentView *)v12 setActive:v4];
    [(SBAppSwitcherTransientOverlayPageContentView *)v12 setOrientation:[(SBFluidSwitcherPageContentViewProvider *)self _interfaceOrientation]];

    goto LABEL_13;
  }
  if ([v6 type] != 2)
  {
    if ([v6 type])
    {
      if ([v6 type] != 5)
      {
        int v12 = 0;
        goto LABEL_13;
      }
      long long v17 = [SBPlusSwitcherPageContentView alloc];
      uint64_t v18 = -[SBPlusSwitcherPageContentView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    else
    {
      uint64_t v18 = [(SBFluidSwitcherPageContentViewProvider *)self _snapshotViewForAppLayout:v6 setActive:v4];
    }
    int v12 = (SBAppSwitcherTransientOverlayPageContentView *)v18;
    goto LABEL_13;
  }
  v13 = [SBAppSwitcherTransientOverlayPageContentView alloc];
  [(SBFluidSwitcherPageContentViewProvider *)self _pageViewSizeForAppLayout:v6];
  SBRectWithSize();
  int v12 = -[SBAppSwitcherTransientOverlayPageContentView initWithFrame:appLayout:](v13, "initWithFrame:appLayout:", v6);
  [(SBAppSwitcherTransientOverlayPageContentView *)v12 setDelegate:self];
  [(SBAppSwitcherTransientOverlayPageContentView *)v12 setActive:v4];
  [(SBAppSwitcherTransientOverlayPageContentView *)v12 setOrientation:[(SBFluidSwitcherPageContentViewProvider *)self _interfaceOrientation]];
  transientOverlayPageContentViews = self->_transientOverlayPageContentViews;
  if (!transientOverlayPageContentViews)
  {
    long long v15 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    long long v16 = self->_transientOverlayPageContentViews;
    self->_transientOverlayPageContentViews = v15;

    transientOverlayPageContentViews = self->_transientOverlayPageContentViews;
  }
  [(NSMutableArray *)transientOverlayPageContentViews addObject:v12];
LABEL_13:

  return v12;
}

- (void)purgePageContentViewForAppLayout:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 type] == 3)
  {
    id v5 = [v4 itemForLayoutRole:1];
    switcherServiceViewControllerMap = self->_switcherServiceViewControllerMap;
    id v7 = [v5 bundleIdentifier];
    [(NSMutableDictionary *)switcherServiceViewControllerMap removeObjectForKey:v7];
LABEL_3:

    goto LABEL_4;
  }
  if ([v4 type] != 2) {
    goto LABEL_18;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = self->_transientOverlayPageContentViews;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v5 = 0;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v14 = [v13 appLayout];
        int v15 = [v14 isEqual:v4];

        if (v15)
        {
          if (!v5) {
            id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          }
          [v5 addObject:v13];
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }
  else
  {
    id v5 = 0;
  }

  if ([v5 count])
  {
    [(NSMutableArray *)self->_transientOverlayPageContentViews removeObjectsInArray:v5];
    if (![(NSMutableArray *)self->_transientOverlayPageContentViews count])
    {
      transientOverlayPageContentViews = self->_transientOverlayPageContentViews;
      self->_transientOverlayPageContentViews = 0;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    uint64_t v17 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v7);
          }
          uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * j);
          v22 = -[NSMapTable objectForKey:](self->_pageContentViewToTransientOverlayViewController, "objectForKey:", v21, (void)v23);
          if (v22) {
            [(SBFluidSwitcherPageContentViewProvider *)self _relinquishTransientOverlayViewController:v22 forPageContentView:v21];
          }
        }
        uint64_t v18 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }
    goto LABEL_3;
  }
LABEL_4:

LABEL_18:
}

- (void)relinquishTransientOverlayViewController:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(NSMapTable *)self->_pageContentViewToTransientOverlayViewController copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11, (void)v13);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        if (v12 == v4) {
          [(SBFluidSwitcherPageContentViewProvider *)self _relinquishTransientOverlayViewController:v4 forPageContentView:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)appSwitcherTransientOverlayPageContentViewDidChangeActive:(id)a3
{
  id v9 = a3;
  char v4 = [v9 isActive];
  id v5 = [(NSMapTable *)self->_pageContentViewToTransientOverlayViewController objectForKey:v9];
  id v6 = v5;
  if (v4)
  {

    if (v6) {
      goto LABEL_10;
    }
    id v6 = [v9 appLayout];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v8 = [WeakRetained viewControllerForTransientOverlayAppLayout:v6 fromProvider:self];

    if (v8) {
      [(SBFluidSwitcherPageContentViewProvider *)self _applyTransientOverlayViewController:v8 toPageContentView:v9];
    }
    else {
      [v9 setContentView:0];
    }
  }
  else if (v5)
  {
    [(SBFluidSwitcherPageContentViewProvider *)self _relinquishTransientOverlayViewController:v5 forPageContentView:v9];
  }

LABEL_10:
}

- (void)appSwitcherTransientOverlayPageContentViewDidChangeContainerOrientation:(id)a3
{
  pageContentViewToTransientOverlayViewController = self->_pageContentViewToTransientOverlayViewController;
  id v5 = a3;
  id v7 = [(NSMapTable *)pageContentViewToTransientOverlayViewController objectForKey:v5];
  int64_t v6 = -[SBFluidSwitcherPageContentViewProvider _preferredContentInterfaceOrientationForViewController:preferredInterfaceOrientation:](self, "_preferredContentInterfaceOrientationForViewController:preferredInterfaceOrientation:", v7, [v5 orientation]);
  [v7 setContainerOrientation:v6];
  [v5 setContentOrientation:v6];
}

- (int64_t)_preferredContentInterfaceOrientationForViewController:(id)a3 preferredInterfaceOrientation:(int64_t)a4
{
  uint64_t v5 = [a3 supportedInterfaceOrientations];
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 2;
  }
  uint64_t v7 = XBInterfaceOrientationMaskForInterfaceOrientation();
  int64_t v8 = 1;
  uint64_t v9 = 4;
  uint64_t v10 = 2;
  if ((v6 & 8) != 0) {
    uint64_t v10 = 3;
  }
  if ((v6 & 0x10) == 0) {
    uint64_t v9 = v10;
  }
  if ((v6 & 2) == 0) {
    int64_t v8 = v9;
  }
  if ((v6 & v7) != 0) {
    return a4;
  }
  else {
    return v8;
  }
}

- (int64_t)_interfaceOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v4 = [WeakRetained orientationForPageViewFromProvider:self];

  return v4;
}

- (CGSize)_pageViewSizeForAppLayout:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained sizeForAppLayout:v5 fromProvider:self];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v4 = [WeakRetained containerViewControllerForPageViewFromProvider:self];

  return v4;
}

- (id)_snapshotViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v4 = [WeakRetained delegateForSnapshotPageViewFromProvider:self];

  return v4;
}

- (id)_snapshotViewForAppLayout:(id)a3 setActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [SBAppSwitcherReusableSnapshotView alloc];
  double v8 = [(SBFluidSwitcherPageContentViewProvider *)self _snapshotViewDelegate];
  snapshotCache = self->_snapshotCache;
  lockoutVCProvider = self->_lockoutVCProvider;
  double v11 = [(id)SBApp appClipOverlayCoordinator];
  double v12 = [(SBFluidSwitcherPageContentViewProvider *)self _containerViewController];
  long long v13 = [(SBAppSwitcherReusableSnapshotView *)v7 initWithDelegate:v8 snapshotCache:snapshotCache lockoutVCProvider:lockoutVCProvider appClipOverlayCoordinator:v11 containerViewController:v12];

  [(SBAppSwitcherReusableSnapshotView *)v13 setActive:v4];
  [(SBAppSwitcherReusableSnapshotView *)v13 setAppLayout:v6];
  [(SBFluidSwitcherPageContentViewProvider *)self _pageViewSizeForAppLayout:v6];

  SBRectWithSize();
  -[SBAppSwitcherReusableSnapshotView setFrame:](v13, "setFrame:");
  return v13;
}

- (id)_viewForService:(id)a3 appLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [SBAppSwitcherServicePageContentView alloc];
  [(SBFluidSwitcherPageContentViewProvider *)self _pageViewSizeForAppLayout:v7];

  SBRectWithSize();
  double v9 = -[SBAppSwitcherServicePageContentView initWithFrame:](v8, "initWithFrame:");
  if (!self->_switcherServiceViewControllerMap)
  {
    double v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    switcherServiceViewControllerMap = self->_switcherServiceViewControllerMap;
    self->_switcherServiceViewControllerMap = v10;
  }
  double v12 = [v6 bundleIdentifier];
  long long v13 = [(NSMutableDictionary *)self->_switcherServiceViewControllerMap objectForKey:v12];
  if (v13)
  {
    long long v14 = [(SBFluidSwitcherPageContentViewProvider *)self _containerViewController];
    [v13 beginAppearanceTransition:1 animated:0];
    [v14 addChildViewController:v13];
    long long v15 = [v13 view];
    [(SBAppSwitcherServicePageContentView *)v9 bounds];
    objc_msgSend(v15, "setFrame:");
    [v15 setAutoresizingMask:18];
    [(SBAppSwitcherServicePageContentView *)v9 addSubview:v15];
    [v13 didMoveToParentViewController:v14];
    objc_msgSend(v13, "bs_endAppearanceTransition");
  }
  else
  {
    long long v16 = [v6 viewServiceClassName];
    uint64_t v17 = [v6 bundleIdentifier];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__SBFluidSwitcherPageContentViewProvider__viewForService_appLayout___block_invoke;
    v20[3] = &unk_1E6B0A700;
    v20[4] = self;
    uint64_t v21 = v9;
    id v22 = v12;
    id v18 = +[_UIRemoteViewController requestViewController:v16 fromServiceWithBundleIdentifier:v17 connectionHandler:v20];
  }
  return v9;
}

void __68__SBFluidSwitcherPageContentViewProvider__viewForService_appLayout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    double v8 = [*(id *)(a1 + 32) _containerViewController];
    [v5 beginAppearanceTransition:1 animated:0];
    [v8 addChildViewController:v5];
    double v9 = [v5 view];
    [*(id *)(a1 + 40) bounds];
    objc_msgSend(v9, "setFrame:");
    [v9 setAutoresizingMask:18];
    [*(id *)(a1 + 40) addSubview:v9];
    [*(id *)(*(void *)(a1 + 32) + 48) setObject:v5 forKey:*(void *)(a1 + 48)];
    [v5 didMoveToParentViewController:v8];
    objc_msgSend(v5, "bs_endAppearanceTransition");
  }
  else
  {
    if (!v6) {
      goto LABEL_4;
    }
    double v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      long long v14 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Failed to load remote view service: %{public}@. %@", (uint8_t *)&v11, 0x16u);
    }
  }

LABEL_4:
}

- (void)_applyTransientOverlayViewController:(id)a3 toPageContentView:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  pageContentViewToTransientOverlayViewController = self->_pageContentViewToTransientOverlayViewController;
  if (!pageContentViewToTransientOverlayViewController)
  {
    double v8 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:1];
    double v9 = self->_pageContentViewToTransientOverlayViewController;
    self->_pageContentViewToTransientOverlayViewController = v8;

    pageContentViewToTransientOverlayViewController = self->_pageContentViewToTransientOverlayViewController;
  }
  [(NSMapTable *)pageContentViewToTransientOverlayViewController setObject:v13 forKey:v6];
  uint64_t v10 = [(SBFluidSwitcherPageContentViewProvider *)self _containerViewController];
  [v10 addChildViewController:v13];
  [v13 didMoveToParentViewController:v10];
  objc_msgSend(v13, "bs_beginAppearanceTransition:animated:", 1, 0);
  objc_msgSend(v6, "setOrientation:", -[SBFluidSwitcherPageContentViewProvider _interfaceOrientation](self, "_interfaceOrientation"));
  int64_t v11 = -[SBFluidSwitcherPageContentViewProvider _preferredContentInterfaceOrientationForViewController:preferredInterfaceOrientation:](self, "_preferredContentInterfaceOrientationForViewController:preferredInterfaceOrientation:", v13, [v6 orientation]);
  [v13 setContainerOrientation:v11];
  [v6 setContentOrientation:v11];
  uint64_t v12 = [v13 view];
  [v6 setContentView:v12];

  objc_msgSend(v13, "bs_endAppearanceTransition:", 1);
}

- (void)_relinquishTransientOverlayViewController:(id)a3 forPageContentView:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    objc_msgSend(v8, "bs_beginAppearanceTransition:animated:", 0, 0);
    [v6 setContentView:0];
    objc_msgSend(v8, "bs_endAppearanceTransition:", 0);
    [v8 willMoveToParentViewController:0];
    [v8 removeFromParentViewController];
    [(NSMapTable *)self->_pageContentViewToTransientOverlayViewController removeObjectForKey:v6];
    if (![(NSMapTable *)self->_pageContentViewToTransientOverlayViewController count])
    {
      pageContentViewToTransientOverlayViewController = self->_pageContentViewToTransientOverlayViewController;
      self->_pageContentViewToTransientOverlayViewController = 0;
    }
  }
}

- (SBFluidSwitcherPageContentViewProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherPageContentViewProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherServiceViewControllerMap, 0);
  objc_storeStrong((id *)&self->_transientOverlayPageContentViews, 0);
  objc_storeStrong((id *)&self->_pageContentViewToTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_lockoutVCProvider, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end