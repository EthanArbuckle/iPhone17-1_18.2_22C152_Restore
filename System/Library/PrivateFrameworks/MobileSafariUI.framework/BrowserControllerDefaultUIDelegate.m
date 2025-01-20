@interface BrowserControllerDefaultUIDelegate
- (BOOL)automationOverlayControllerShouldAllowUserInteraction:(id)a3;
- (BOOL)browserControllerShouldIncreaseTopPaddingForStartPage:(id)a3;
- (BOOL)browserControllerShouldUpdateSnapshotForActiveTab:(id)a3;
- (BOOL)browserControllerShouldUpdateWebViewGeometryOnScroll:(id)a3;
- (BrowserControllerDefaultUIDelegate)initWithBrowserController:(id)a3;
- (CGRect)browserControllerWindowFrame:(id)a3;
- (double)browserControllerCatalogViewPopoverWidth:(id)a3;
- (double)browserControllerStatusBarWidth:(id)a3;
- (id)browserController:(id)a3 delegateForBannerController:(id)a4;
- (id)browserController:(id)a3 tabDocumentViewGeometryProviderForTabDocumentView:(id)a4;
- (id)browserController:(id)a3 tabSnapshotContentProviderForTabDocument:(id)a4;
- (id)browserControllerCatalogViewController:(id)a3;
- (id)browserControllerContentContainerView:(id)a3;
- (id)browserControllerFocusItemContainer:(id)a3;
- (id)browserControllerNavigationBar:(id)a3;
- (id)browserControllerNextResponder:(id)a3;
- (id)browserControllerParentFocusEnvironment:(id)a3;
- (id)browserControllerPreferredFocusEnvironments:(id)a3;
- (id)browserControllerTabBarManager:(id)a3;
- (id)browserControllerTabContentContainerView:(id)a3;
- (id)browserControllerTabHoverPreview:(id)a3;
- (id)sidebarUIProxyForBrowserController:(id)a3;
- (id)tabSnapshotGeneratorDelegateForBrowserController:(id)a3;
- (id)viewControllerToPresentFromForBrowserController:(id)a3;
- (void)_setUpAutomationOverlay;
- (void)_tearDownAutomationOverlay;
- (void)_windowDidResignKeyWindow:(id)a3;
- (void)automationOverlayController:(id)a3 didChangeAllowsUserInteraction:(BOOL)a4;
- (void)automationOverlayControllerDidCancelAutomation:(id)a3;
- (void)automationOverlayControllerDidDisableAutomation:(id)a3;
- (void)browserController:(id)a3 animateLinkImage:(CGImage *)a4 fromRect:(CGRect)a5 inView:(id)a6 toBarItem:(int64_t)a7;
- (void)browserController:(id)a3 animateSafariIconLinkFromPoint:(CGPoint)a4 inView:(id)a5;
- (void)browserController:(id)a3 didDisconnectFromScene:(id)a4;
- (void)browserController:(id)a3 scrollViewDidScroll:(id)a4;
- (void)browserController:(id)a3 setCatalogViewController:(id)a4;
- (void)browserController:(id)a3 updateViewForActiveTabDocument:(id)a4;
- (void)browserController:(id)a3 willConnectToScene:(id)a4 session:(id)a5 options:(id)a6;
- (void)browserControllerContentContainerViewFrameDidChange:(id)a3;
- (void)browserControllerDidBeginIgnoringUserInteraction:(id)a3;
- (void)browserControllerDidEndIgnoringUserInteraction:(id)a3;
- (void)browserControllerDidEndNavigationGesture:(id)a3;
- (void)browserControllerDidEndObfuscating:(id)a3;
- (void)browserControllerLayOutCatalogView:(id)a3;
- (void)browserControllerMakeKey:(id)a3;
- (void)browserControllerMakeKeyAndVisible:(id)a3;
- (void)browserControllerShouldUpdateUnifiedBarVisibility:(id)a3;
- (void)browserControllerStartPageUpdatePolicyDidChange:(id)a3;
- (void)browserControllerWillBeginNavigationGesture:(id)a3;
- (void)browserControllerWillBeginObfuscating:(id)a3;
- (void)handleTabViewPinchForBrowserController:(id)a3;
- (void)safariWindow:(id)a3 statusBarChangedFromHeight:(double)a4 toHeight:(double)a5;
- (void)updateTabViewPinchRecognizerForBrowserController:(id)a3;
@end

@implementation BrowserControllerDefaultUIDelegate

- (BOOL)browserControllerShouldUpdateSnapshotForActiveTab:(id)a3
{
  v3 = [(BrowserController *)self->_browserController tabCollectionViewProvider];
  v4 = [v3 tabThumbnailCollectionView];
  BOOL v5 = [v4 presentationState] == 1 || objc_msgSend(v4, "presentationState") == 2;

  return v5;
}

- (void)updateTabViewPinchRecognizerForBrowserController:(id)a3
{
  id v3 = [(BrowserController *)self->_browserController rootViewController];
  [v3 updateTabViewPinchRecognizer];
}

- (void)browserControllerContentContainerViewFrameDidChange:(id)a3
{
  id v3 = [(BrowserController *)self->_browserController rootViewController];
  [v3 updateViewsAfterContentContainerViewBoundsChange];
}

- (id)viewControllerToPresentFromForBrowserController:(id)a3
{
  return [(BrowserController *)self->_browserController rootViewController];
}

- (id)browserControllerCatalogViewController:(id)a3
{
  id v3 = [(BrowserController *)self->_browserController rootViewController];
  v4 = [v3 catalogViewController];

  return v4;
}

- (id)browserControllerTabBarManager:(id)a3
{
  id v3 = [a3 rootViewController];
  v4 = [v3 tabBarManager];

  return v4;
}

- (id)browserControllerNextResponder:(id)a3
{
  return [(BrowserController *)self->_browserController rootViewController];
}

- (id)browserControllerContentContainerView:(id)a3
{
  id v3 = [(BrowserController *)self->_browserController rootViewController];
  v4 = [v3 contentContainerView];

  return v4;
}

- (double)browserControllerCatalogViewPopoverWidth:(id)a3
{
  id v3 = [(BrowserController *)self->_browserController rootViewController];
  v4 = [v3 contentContainerView];
  [v4 bounds];
  double Width = CGRectGetWidth(v9);
  [v3 horizontalMarginForCatalogViewInPopover];
  double v7 = Width - v6;

  return v7;
}

- (id)sidebarUIProxyForBrowserController:(id)a3
{
  return [(BrowserController *)self->_browserController rootViewController];
}

- (BrowserControllerDefaultUIDelegate)initWithBrowserController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BrowserControllerDefaultUIDelegate;
  double v6 = [(BrowserControllerDefaultUIDelegate *)&v10 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_browserController, a3);
    v8 = v7;
  }

  return v7;
}

- (id)browserController:(id)a3 delegateForBannerController:(id)a4
{
  return [(BrowserController *)self->_browserController rootViewController];
}

- (BOOL)browserControllerShouldIncreaseTopPaddingForStartPage:(id)a3
{
  v4 = [(BrowserController *)self->_browserController rootViewController];
  id v5 = [v4 capsuleCollectionViewLayout];

  if (v5 && [v5 integerValue] == 2)
  {
    BOOL v6 = 1;
  }
  else
  {
    double v7 = [(BrowserController *)self->_browserController rootViewController];
    if ([v7 usingUnifiedBar]) {
      BOOL v6 = [(BrowserController *)self->_browserController tabBarDisplayMode] == 2;
    }
    else {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (void)browserControllerStartPageUpdatePolicyDidChange:(id)a3
{
  id v4 = [(BrowserController *)self->_browserController rootViewController];
  id v3 = [v4 catalogViewController];
  [v3 startPageUpdatePolicyDidChange];
}

- (BOOL)browserControllerShouldUpdateWebViewGeometryOnScroll:(id)a3
{
  return 1;
}

- (void)browserController:(id)a3 scrollViewDidScroll:(id)a4
{
  browserController = self->_browserController;
  id v5 = a4;
  id v6 = [(BrowserController *)browserController rootViewController];
  [v6 scrollViewDidScroll:v5];
}

- (void)browserControllerShouldUpdateUnifiedBarVisibility:(id)a3
{
  id v3 = [a3 rootViewController];
  [v3 updateUnifiedBarVisibility];
}

- (void)browserController:(id)a3 updateViewForActiveTabDocument:(id)a4
{
  id v5 = a4;
  id v6 = [a3 rootViewController];
  [v6 updateViewForTabDocument:v5];
}

- (id)browserController:(id)a3 tabDocumentViewGeometryProviderForTabDocumentView:(id)a4
{
  return [(BrowserController *)self->_browserController rootViewController];
}

- (void)browserControllerDidEndObfuscating:(id)a3
{
  obfuscationWindow = self->_obfuscationWindow;
  if (obfuscationWindow)
  {
    [(PrivateBrowsingObfuscationWindow *)obfuscationWindow setHidden:1];
    id v5 = self->_obfuscationWindow;
    self->_obfuscationWindow = 0;
  }
}

- (id)browserControllerTabContentContainerView:(id)a3
{
  id v3 = [(BrowserController *)self->_browserController rootViewController];
  id v4 = [v3 contentContainerView];

  return v4;
}

- (void)browserControllerMakeKey:(id)a3
{
}

- (void)browserControllerLayOutCatalogView:(id)a3
{
  id v3 = [(BrowserController *)self->_browserController rootViewController];
  [v3 layOutCatalogView];
}

- (void)browserController:(id)a3 setCatalogViewController:(id)a4
{
  browserController = self->_browserController;
  id v5 = a4;
  id v6 = [(BrowserController *)browserController rootViewController];
  [v6 setCatalogViewController:v5];
}

- (id)browserControllerNavigationBar:(id)a3
{
  id v3 = [(BrowserController *)self->_browserController rootViewController];
  id v4 = [v3 topBar];

  return v4;
}

- (void)browserController:(id)a3 willConnectToScene:(id)a4 session:(id)a5 options:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  window = self->_window;
  if (window)
  {
    [(MobileSafariWindow *)window setWindowScene:v10];
    [(MobileSafariWindow *)self->_window makeKeyAndVisible];
  }
  else
  {
    v14 = [[MobileSafariWindow alloc] initWithWindowScene:v10];
    v15 = self->_window;
    self->_window = v14;

    [(MobileSafariWindow *)self->_window setSafariWindowDelegate:self];
    v16 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    [(MobileSafariWindow *)self->_window setTintColor:v16];

    [(MobileSafariWindow *)self->_window setOpaque:0];
    v17 = [(MobileSafariWindow *)self->_window layer];
    [v17 setHitTestsAsOpaque:1];

    v18 = [v20 rootViewController];
    [(MobileSafariWindow *)self->_window setRootViewController:v18];

    [(MobileSafariWindow *)self->_window makeKeyAndVisible];
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:self selector:sel__windowDidResignKeyWindow_ name:*MEMORY[0x1E4FB30F8] object:self->_window];
  }
  if ([(BrowserController *)self->_browserController isControlledByAutomation]) {
    [(BrowserControllerDefaultUIDelegate *)self _setUpAutomationOverlay];
  }
}

- (void)browserController:(id)a3 didDisconnectFromScene:(id)a4
{
  -[MobileSafariWindow setWindowScene:](self->_window, "setWindowScene:", 0, a4);
  if ([(BrowserController *)self->_browserController isControlledByAutomation])
  {
    [(BrowserControllerDefaultUIDelegate *)self _tearDownAutomationOverlay];
  }
}

- (void)browserControllerMakeKeyAndVisible:(id)a3
{
}

- (void)browserControllerDidBeginIgnoringUserInteraction:(id)a3
{
}

- (void)browserControllerDidEndIgnoringUserInteraction:(id)a3
{
}

- (void)browserControllerWillBeginObfuscating:(id)a3
{
  if (!self->_obfuscationWindow)
  {
    id v4 = +[PrivateBrowsingObfuscationWindow showPrivateBrowsingObfuscationWindowForApplicationWindow:self->_window];
    obfuscationWindow = self->_obfuscationWindow;
    self->_obfuscationWindow = v4;
  }
}

- (void)browserControllerWillBeginNavigationGesture:(id)a3
{
}

- (void)browserControllerDidEndNavigationGesture:(id)a3
{
}

- (CGRect)browserControllerWindowFrame:(id)a3
{
  [(MobileSafariWindow *)self->_window frame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)browserControllerStatusBarWidth:(id)a3
{
  [(MobileSafariWindow *)self->_window bounds];
  return CGRectGetWidth(*(CGRect *)&v3);
}

- (void)handleTabViewPinchForBrowserController:(id)a3
{
}

- (id)browserController:(id)a3 tabSnapshotContentProviderForTabDocument:(id)a4
{
  id v5 = a4;
  double v6 = [a3 rootViewController];
  double v7 = [v6 snapshotContentProviderForTab:v5];

  return v7;
}

- (id)tabSnapshotGeneratorDelegateForBrowserController:(id)a3
{
  return (id)[a3 rootViewController];
}

- (id)browserControllerTabHoverPreview:(id)a3
{
  uint64_t v3 = [a3 rootViewController];
  double v4 = [v3 tabHoverPreview];

  return v4;
}

- (id)browserControllerParentFocusEnvironment:(id)a3
{
  return (id)[a3 rootViewController];
}

- (id)browserControllerFocusItemContainer:(id)a3
{
  uint64_t v3 = [a3 rootViewController];
  double v4 = [v3 view];

  return v4;
}

- (id)browserControllerPreferredFocusEnvironments:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 rootViewController];
  v6[0] = v3;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)safariWindow:(id)a3 statusBarChangedFromHeight:(double)a4 toHeight:(double)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v14 = a4;
    __int16 v15 = 2048;
    double v16 = a5;
    _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Status bar height changed from %.f to %.f", buf, 0x16u);
  }
  CGRect v9 = [(BrowserController *)self->_browserController tabController];
  id v10 = [v9 activeTabDocument];
  int v11 = [v10 webViewIsFullscreen];

  if (v11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__BrowserControllerDefaultUIDelegate_safariWindow_statusBarChangedFromHeight_toHeight___block_invoke;
    v12[3] = &unk_1E6D77E20;
    v12[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v12];
  }
  else
  {
    [(BrowserController *)self->_browserController statusBarHeightChanged];
  }
}

uint64_t __87__BrowserControllerDefaultUIDelegate_safariWindow_statusBarChangedFromHeight_toHeight___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) statusBarHeightChanged];
}

- (void)_windowDidResignKeyWindow:(id)a3
{
  double v4 = [(BrowserController *)self->_browserController tabController];
  id v5 = [v4 activeTabDocument];
  int v6 = [v5 webViewIsFullscreen];

  if (v6)
  {
    browserController = self->_browserController;
    [(BrowserController *)browserController cancelFavorites];
  }
}

- (void)_setUpAutomationOverlay
{
  uint64_t v3 = [AutomationOverlayWindow alloc];
  double v4 = [(MobileSafariWindow *)self->_window windowScene];
  id v5 = [(AutomationOverlayWindow *)v3 initWithWindowScene:v4];
  windowForAutomationOverlay = self->_windowForAutomationOverlay;
  self->_windowForAutomationOverlay = v5;

  double v7 = [[AutomationOverlayViewController alloc] initWithDelegate:self];
  [(AutomationOverlayWindow *)self->_windowForAutomationOverlay setRootViewController:v7];
  [(AutomationOverlayWindow *)self->_windowForAutomationOverlay setAutomationWindowDelegate:v7];
  [(AutomationOverlayWindow *)self->_windowForAutomationOverlay makeKeyAndVisible];
}

- (void)_tearDownAutomationOverlay
{
  [(AutomationOverlayWindow *)self->_windowForAutomationOverlay setHidden:1];
  windowForAutomationOverlay = self->_windowForAutomationOverlay;
  self->_windowForAutomationOverlay = 0;
}

- (BOOL)automationOverlayControllerShouldAllowUserInteraction:(id)a3
{
  uint64_t v3 = +[Application sharedApplication];
  double v4 = [v3 automationController];
  id v5 = [v4 automationSession];

  if (v5) {
    char v6 = [v5 isSimulatingUserInteraction];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)browserController:(id)a3 animateSafariIconLinkFromPoint:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  id v9 = a3;
  id v18 = [v9 rootViewController];
  id v10 = [v9 sidebarUIProxy];

  LODWORD(v9) = [v10 isShowingSidebar];
  if (v9)
  {
    int v11 = [v18 sidebarButtonEmbeddedInSidebar];
    id v12 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v13 = _SFSafariIconLinkImage();
    [v11 bounds];
    objc_msgSend(v12, "_sf_animateLinkImage:withAnimation:fromPoint:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", v13, 1, v8, v11, 0, 0, x, y, v14, v15, v16, v17);

    id v8 = (id)v13;
  }
  else
  {
    int v11 = [v18 primaryBar];
    objc_msgSend(v11, "animateSafariIconLinkFromPoint:inView:", v8, x, y);
  }
}

- (void)browserController:(id)a3 animateLinkImage:(CGImage *)a4 fromRect:(CGRect)a5 inView:(id)a6 toBarItem:(int64_t)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v14 = a3;
  id v15 = a6;
  [v14 showBars];
  double v16 = [v14 rootViewController];
  double v17 = [v16 navigationBar];
  if ([v17 containsBarItem:a7]) {
    [v16 navigationBar];
  }
  else {
  id v18 = [v16 primaryBar];
  }

  if (a7 != 3 || ![v16 isShowingSidebar])
  {
    CGImageRetain(a4);
    objc_initWeak(&location, v14);
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke_2;
    v38 = &unk_1E6D7B030;
    objc_copyWeak(v41, &location);
    id v39 = v18;
    v41[1] = a4;
    v41[2] = *(id *)&x;
    v41[3] = *(id *)&y;
    v41[4] = *(id *)&width;
    v41[5] = *(id *)&height;
    id v40 = v15;
    v41[6] = (id)a7;
    v29 = (void (**)(void))MEMORY[0x1E4E42950](&v35);
    v30 = objc_msgSend(v14, "tabBarManager", v35, v36, v37, v38);
    v31 = [v30 inlineTabBar];
    if (v31)
    {
      v32 = [v16 dynamicBarAnimator];
      char v33 = [v32 isInSteadyState];

      if ((v33 & 1) == 0)
      {
        [v14 setAnimationPendingDynamicBarAnimatorSteadyState:v29];
LABEL_12:

        objc_destroyWeak(v41);
        objc_destroyWeak(&location);
        goto LABEL_13;
      }
    }
    else
    {
    }
    v34 = [v16 view];
    [v34 layoutIfNeeded];

    v29[2](v29);
    goto LABEL_12;
  }
  v19 = [v16 sidebarButtonEmbeddedInSidebar];
  [v14 beginIgnoringUserInteraction:@"animateLinkImage"];
  id v20 = (void *)MEMORY[0x1E4FB1EB0];
  [v19 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke;
  v43[3] = &unk_1E6D77E20;
  id v44 = v14;
  objc_msgSend(v20, "_sf_animateLinkImage:withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", a4, 1, v15, v19, 0, v43, x, y, width, height, v22, v24, v26, v28);

LABEL_13:
}

uint64_t __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endIgnoringUserInteraction:@"animateLinkImage"];
}

void __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained beginIgnoringUserInteraction:@"animateLinkImage"];
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 96);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke_3;
    v8[3] = &unk_1E6D77E20;
    id v9 = v3;
    objc_msgSend(v5, "animateLinkImage:fromRect:inView:toBarItem:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", v4, v6, v7, 0, v8, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    CGImageRelease(*(CGImageRef *)(a1 + 56));
  }
}

uint64_t __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) endIgnoringUserInteraction:@"animateLinkImage"];
}

- (void)automationOverlayController:(id)a3 didChangeAllowsUserInteraction:(BOOL)a4
{
  windowForAutomationOverladouble y = self->_windowForAutomationOverlay;
  if (a4)
  {
    [windowForAutomationOverlay setHidden:1];
    windowForAutomationOverladouble y = self->_window;
  }
  objc_msgSend(windowForAutomationOverlay, "makeKeyAndVisible", a3);
}

- (void)automationOverlayControllerDidDisableAutomation:(id)a3
{
  id v4 = +[Application sharedApplication];
  uint64_t v3 = [v4 automationController];
  [v3 setAllowsRemoteAutomation:0];
}

- (void)automationOverlayControllerDidCancelAutomation:(id)a3
{
  id v4 = +[Application sharedApplication];
  uint64_t v3 = [v4 automationController];
  [v3 terminateSession];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowForAutomationOverlay, 0);
  objc_storeStrong((id *)&self->_obfuscationWindow, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_browserController, 0);
}

@end