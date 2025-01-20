@interface SUStorePageViewController
- (BOOL)_isCacheExpired;
- (BOOL)_isInTransientViewController;
- (BOOL)_reloadWithURLRequestProperties:(id)a3 completionBlock:(id)a4;
- (BOOL)_reloadWithURLRequestProperties:(id)a3 preserveSectionControl:(BOOL)a4;
- (BOOL)_reloadsWhenCacheExpired;
- (BOOL)_sectionIsNetworkConstrained;
- (BOOL)_shouldDisplayControlsInNavigationBar;
- (BOOL)_shouldFetchAutomatically;
- (BOOL)_shouldReloadForAppearance;
- (BOOL)_shouldShowPlaceholderForEmptyPage;
- (BOOL)canBeResolved;
- (BOOL)canMoveToOverlay;
- (BOOL)decidePolicyForWebNavigationAction:(id)a3 request:(id)a4 decisionListener:(id)a5;
- (BOOL)didPageViewLoad;
- (BOOL)isExternalRequest;
- (BOOL)isShowingPreviewOverlay;
- (BOOL)isSkLoaded;
- (BOOL)loadMoreWithURL:(id)a3;
- (BOOL)loadsWhenHidden;
- (BOOL)needsAuthentication;
- (BOOL)pushStorePage:(id)a3 withTarget:(int64_t)a4 animated:(BOOL)a5;
- (BOOL)reloadForSectionsWithGroup:(id)a3;
- (BOOL)reloadWithURLRequestProperties:(id)a3;
- (BOOL)shouldAdjustContentOffsets;
- (BOOL)shouldExcludeFromNavigationHistory;
- (BOOL)showPreviewOverlay:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (BOOL)viewIsReady;
- (CGRect)_frameForActiveViewController;
- (CGRect)documentBounds;
- (NSString)scriptUserInfo;
- (SSAuthenticationContext)authenticationContext;
- (SSURLRequestProperties)URLRequestProperties;
- (SUPageSectionGroup)sectionGroup;
- (SUSearchFieldController)searchFieldController;
- (SUSegmentedControl)sectionSegmentedControl;
- (SUStorePageViewController)init;
- (SUStorePageViewController)initWithTabBarItem:(id)a3;
- (SUStorePageViewControllerDelegate)delegate;
- (SUViewController)activeChildViewController;
- (double)_expirationTime;
- (id)URLRequest;
- (id)_activeChildViewController;
- (id)_activePageSection;
- (id)_newBarButtonItemsWithButtonItems:(id)a3 replacingItemWithTag:(int64_t)a4 withButtonItem:(id)a5;
- (id)_newSegmentedControlWithItems:(id)a3;
- (id)copyArchivableContext;
- (id)copyDefaultScriptProperties;
- (id)copyObjectForScriptFromPoolWithClass:(Class)a3;
- (id)copyScriptProperties;
- (id)copyScriptViewController;
- (id)displayedURL;
- (id)iTunesStoreUI_searchFieldController;
- (id)navigationItemForScriptInterface;
- (id)newFetchOperation;
- (id)newPlaceholderViewController;
- (id)newRotationController;
- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4 returningError:(id *)a5;
- (id)setDisplayedSectionGroup:(id)a3;
- (id)storePageProtocol;
- (id)urlBagKey;
- (void)_applyPropertiesToViewController:(id)a3;
- (void)_dismissNavigationMenuViewController;
- (void)_displaySegmentedControl:(id)a3;
- (void)_documentBoundsChangeNotification:(id)a3;
- (void)_fetchPage:(BOOL)a3;
- (void)_finishHandlingFailure;
- (void)_finishSuccessfulLoad;
- (void)_finishWebViewLoadWithResult:(BOOL)a3 error:(id)a4;
- (void)_handleFailureWithError:(id)a3;
- (void)_handleViewControllerBecameReady:(id)a3;
- (void)_logInternalEventWithOperation:(id)a3;
- (void)_moveChildViewController:(id)a3 toOverlayForProtocol:(id)a4;
- (void)_moveToRootSectionForChildViewController:(id)a3 protocol:(id)a4;
- (void)_navigationButtonAction:(id)a3;
- (void)_navigationMenuButtonAction:(id)a3;
- (void)_performActionForProtocolButton:(id)a3;
- (void)_reloadBackgroundViewProperties;
- (void)_reloadForAppearance:(BOOL)a3;
- (void)_reloadForNetworkTypeChange:(id)a3;
- (void)_reloadNavigationBar;
- (void)_reloadNavigationButtons;
- (void)_reloadNavigationMenus;
- (void)_reloadPreviewOverlayVisibility;
- (void)_reloadSearchFieldWithSection:(id)a3;
- (void)_reloadSectionButtons;
- (void)_reloadSectionsControlWithGroup:(id)a3;
- (void)_renderStorePage:(id)a3 withType:(int64_t)a4 viewController:(id)a5 block:(id)a6;
- (void)_repositionForChildViewController:(id)a3;
- (void)_requestWebScriptReloadWithContext:(id)a3;
- (void)_scriptEventNotification:(id)a3;
- (void)_sectionControlAction:(id)a3;
- (void)_sendFailureAfterDialogsFinished:(id)a3;
- (void)_setActiveChildViewController:(id)a3 shouldTearDown:(BOOL)a4;
- (void)_setHeaderView:(id)a3;
- (void)_setLeftNavigationItem:(id)a3 forTag:(int64_t)a4;
- (void)_setPendingChildViewController:(id)a3;
- (void)_setReloadsWhenCacheExpired:(BOOL)a3;
- (void)_setRightNavigationItem:(id)a3 forTag:(int64_t)a4;
- (void)_setSegmentedControl:(id)a3;
- (void)_setUseWebViewFastPath:(BOOL)a3;
- (void)_showPlaceholderViewControllerWithTearDown:(BOOL)a3;
- (void)_tabConfigurationChanged:(id)a3;
- (void)_tearDownNavigationMenu;
- (void)_verifyStorePageProtocol:(id)a3;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)enqueueFetchOperation;
- (void)enqueueFetchOperationForPageSection:(id)a3;
- (void)forceLoadingForNeverAppearedPage;
- (void)handleApplicationURL:(id)a3 withSourceApplication:(id)a4 sourceURL:(id)a5;
- (void)handleFailureWithError:(id)a3;
- (void)hidePreviewOverlay:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)iTunesStoreUI_searchFieldControllerDidChange:(id)a3;
- (void)invalidate;
- (void)invalidateForMemoryPurge;
- (void)loadView;
- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)menuViewController:(id)a3 didTapButton:(id)a4;
- (void)menuViewControllerDidCancel:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)reload;
- (void)reloadWithStorePage:(id)a3 ofType:(int64_t)a4 forURL:(id)a5;
- (void)requestWebScriptReloadWithContext:(id)a3;
- (void)resetNavigationItem:(id)a3;
- (void)restoreArchivableContext:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setCanMoveToOverlay:(BOOL)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidPageViewLoad:(BOOL)a3;
- (void)setExternalRequest:(BOOL)a3;
- (void)setLoadsWhenHidden:(BOOL)a3;
- (void)setNeedsAuthentication:(BOOL)a3;
- (void)setParentViewController:(id)a3;
- (void)setScriptProperties:(id)a3;
- (void)setScriptUserInfo:(id)a3;
- (void)setSection:(id)a3;
- (void)setShouldAdjustContentOffsets:(BOOL)a3;
- (void)setSkLoading:(BOOL)a3;
- (void)setURLRequest:(id)a3;
- (void)setURLRequestProperties:(id)a3;
- (void)setUrlBagKey:(id)a3;
- (void)showExternalURL:(id)a3;
- (void)showPlaceholderViewController;
- (void)storePageProtocolDidChange;
- (void)tabBarControllerDidLongPressTabBarItem:(id)a3;
- (void)tabBarControllerDidReselectTabBarItem:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation SUStorePageViewController

- (SUStorePageViewController)init
{
  if (init_sOnce != -1) {
    dispatch_once(&init_sOnce, &__block_literal_global_1);
  }
  v8.receiver = self;
  v8.super_class = (Class)SUStorePageViewController;
  v3 = [(SUViewController *)&v8 init];
  v4 = v3;
  if (v3)
  {
    v3->_canMoveToOverlay = 1;
    v3->_shouldAdjustContentOffsets = 1;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "distantFuture"), "timeIntervalSinceReferenceDate");
    v4->_expirationTime = v5;
    v4->_reloadsWhenCacheExpired = 0;
    v4->_urlRequestProperties = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x263F7B290]);
    v4->_useWebViewFastPath = (init_sUseWebViewFastPath & 1) == 0;
    v4->_isInBackground = 0;
    v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v4 selector:sel__reloadForNetworkTypeChange_ name:@"SUNetworkTypeChangedNotification" object:0];
    [v6 addObserver:v4 selector:sel__reloadPreviewOverlayVisibility name:@"SUPreviewOverlayVisibilityDidChangeNotification" object:0];
    [v6 addObserver:v4 selector:sel__scriptEventNotification_ name:@"SUScriptInterfaceGlobalEventNotification" object:0];
    [v6 addObserver:v4 selector:sel__tabConfigurationChanged_ name:@"SUTabBarConfigurationChangedNotification" object:0];
    [v6 addObserver:v4 selector:sel__documentBoundsChangeNotification_ name:@"SUViewControllerDocumentBoundsDidChangeNotification" object:0];
  }
  return v4;
}

uint64_t __33__SUStorePageViewController_init__block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  if ((result & 1) == 0)
  {
    v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier");
    uint64_t result = [v1 isEqualToString:*MEMORY[0x263F893E0]];
    if (result) {
      init_sUseWebViewFastPath = 1;
    }
  }
  return result;
}

- (SUStorePageViewController)initWithTabBarItem:(id)a3
{
  v4 = [(SUStorePageViewController *)self init];
  if (v4)
  {
    double v5 = (void *)[a3 underlyingTabBarItem];
    [(SUStorePageViewController *)v4 setTabBarItem:v5];
    -[SUViewController setTitle:](v4, "setTitle:", [v5 _internalTitle]);
    -[SSMutableURLRequestProperties setURL:](v4->_urlRequestProperties, "setURL:", [a3 rootURL]);
  }
  return v4;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SUDialogDidFinishNotification" object:0];
  [v3 removeObserver:self name:@"SUNetworkTypeChangedNotification" object:0];
  [v3 removeObserver:self name:@"SUPreviewOverlayVisibilityDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"SUScriptInterfaceGlobalEventNotification" object:0];
  [v3 removeObserver:self name:@"SUTabBarConfigurationChangedNotification" object:0];
  [v3 removeObserver:self name:@"SUViewControllerDocumentBoundsDidChangeNotification" object:0];
  if (self->_activeChildViewController)
  {
    -[SUStorePageViewController removeChildViewController:](self, "removeChildViewController:");
    activeChildViewController = self->_activeChildViewController;
  }
  else
  {
    activeChildViewController = 0;
  }

  [(SUViewController *)self->_pendingChildViewController removeObserver:self forKeyPath:@"viewIsReady"];
  allowedInterfaceOrientations = self->_allowedInterfaceOrientations;
  if (allowedInterfaceOrientations) {
    CFRelease(allowedInterfaceOrientations);
  }
  [(SUMenuViewController *)self->_navigationMenuViewController setDelegate:0];

  [(UIPopoverController *)self->_navigationMenuPopover setDelegate:0];
  [(SUSegmentedControl *)self->_segmentedControl removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v6.receiver = self;
  v6.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v6 dealloc];
}

- (BOOL)canBeResolved
{
  return [(SSMutableURLRequestProperties *)self->_urlRequestProperties canBeResolved];
}

- (BOOL)decidePolicyForWebNavigationAction:(id)a3 request:(id)a4 decisionListener:(id)a5
{
  return 0;
}

- (void)_finishWebViewLoadWithResult:(BOOL)a3 error:(id)a4
{
  if (!a3)
  {
    if (ISErrorIsEqual())
    {
      self->_useWebViewFastPath = 0;
      [(SUStorePageViewController *)self _fetchPage:1];
    }
    else
    {
      [(SUStorePageViewController *)self _handleFailureWithError:a4];
    }
  }
}

- (void)enqueueFetchOperation
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(SUStorePageViewController *)self newFetchOperation];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __50__SUStorePageViewController_enqueueFetchOperation__block_invoke;
  v27[3] = &__block_descriptor_48_e5_v8__0ls32l8s40l8;
  v27[4] = self;
  v27[5] = v3;
  [v3 setCompletionBlock:v27];
  if (self->_useWebViewFastPath)
  {
    v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v6 &= 2u;
    }
    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      int v28 = 138543362;
      uint64_t v29 = v7;
      LODWORD(v25) = 12;
      v24 = &v28;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v28, v25);
        free(v9);
        v24 = (int *)v10;
        SSFileLog();
      }
    }
    id v11 = -[SUStorePageViewController newViewControllerForPage:ofType:returningError:](self, "newViewControllerForPage:ofType:returningError:", 0, 1, 0, v24);
  }
  else
  {
    id v11 = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v13 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v15 &= 2u;
  }
  if (isKindOfClass)
  {
    if (v15)
    {
      uint64_t v16 = objc_opt_class();
      int v28 = 138543362;
      uint64_t v29 = v16;
      LODWORD(v25) = 12;
      v24 = &v28;
      uint64_t v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        v18 = (void *)v17;
        uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v28, v25);
        free(v18);
        v24 = (int *)v19;
        SSFileLog();
      }
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __50__SUStorePageViewController_enqueueFetchOperation__block_invoke_32;
    v26[3] = &unk_2648127E0;
    v26[4] = v11;
    v26[5] = v3;
    v26[6] = self;
    -[SUStorePageViewController _renderStorePage:withType:viewController:block:](self, "_renderStorePage:withType:viewController:block:", 0, 1, v11, v26, v24);
  }
  else
  {
    if (v15)
    {
      uint64_t v20 = objc_opt_class();
      int v28 = 138543362;
      uint64_t v29 = v20;
      LODWORD(v25) = 12;
      v24 = &v28;
      uint64_t v21 = _os_log_send_and_compose_impl();
      if (v21)
      {
        v22 = (void *)v21;
        uint64_t v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v28, v25);
        free(v22);
        v24 = (int *)v23;
        SSFileLog();
      }
    }
    -[SUViewController enqueueOperation:cancelOnDealloc:](self, "enqueueOperation:cancelOnDealloc:", v3, 1, v24);
  }
  [(SUStorePageViewController *)self _logInternalEventWithOperation:v3];
}

uint64_t __50__SUStorePageViewController_enqueueFetchOperation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) success];

  return [v1 setDidPageViewLoad:v2];
}

uint64_t __50__SUStorePageViewController_enqueueFetchOperation__block_invoke_32(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SUStorePageViewController_enqueueFetchOperation__block_invoke_2;
  v4[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12ls32l8;
  v4[4] = a1[6];
  return [v2 _loadWithURLOperation:v1 completionBlock:v4];
}

uint64_t __50__SUStorePageViewController_enqueueFetchOperation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishWebViewLoadWithResult:a2 error:a3];
}

- (void)enqueueFetchOperationForPageSection:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = [(SUStorePageViewController *)self newFetchOperation];
  int v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v15 = 138543618;
    uint64_t v16 = objc_opt_class();
    __int16 v17 = 2112;
    uint64_t v18 = objc_msgSend((id)objc_msgSend(v5, "requestProperties"), "URL");
    LODWORD(v14) = 22;
    v13 = &v15;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v15, v14);
      free(v10);
      v13 = (int *)v11;
      SSFileLog();
    }
  }
  uint64_t v12 = objc_msgSend(a3, "URLRequestProperties", v13);
  [v5 setRequestProperties:v12];
  [(SUStorePageViewController *)self setSkLoading:1];
  [(SUStorePageViewController *)self setURLRequestProperties:v12];
  [(SUViewController *)self enqueueOperation:v5 cancelOnDealloc:1];
}

- (void)forceLoadingForNeverAppearedPage
{
}

- (id)newFetchOperation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F89528]);
  objc_msgSend(v3, "setAuthenticationContext:", -[SUStorePageViewController authenticationContext](self, "authenticationContext"));
  objc_msgSend(v3, "setNeedsAuthentication:", -[SUStorePageViewController needsAuthentication](self, "needsAuthentication"));
  [v3 setTracksPerformanceMetrics:SSDebugShouldTrackPerformance()];
  v4 = [(SUViewController *)self clientInterface];
  id v5 = objc_alloc_init(SUStorePageDataProvider);
  [(SUStorePageDataProvider *)v5 setClientInterface:v4];
  [v3 setDataProvider:v5];

  id v6 = [(UIViewController *)self section];
  int v7 = (void *)[v6 searchFieldConfiguration];
  if ([(UIViewController *)self isRootViewController])
  {
    if ([v6 type] == 1)
    {
      if (v7)
      {
        int v8 = objc_msgSend((id)objc_msgSend(v7, "searchURLRequestPropertiesForNetworkType:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "networkType")), "requestParameters");
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              -[SSMutableURLRequestProperties setValue:forRequestParameter:](self->_urlRequestProperties, "setValue:forRequestParameter:", [v8 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)], *(void *)(*((void *)&v17 + 1) + 8 * i));
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v10);
        }
      }
    }
  }
  v13 = (void *)[(SSMutableURLRequestProperties *)self->_urlRequestProperties mutableCopy];
  uint64_t v14 = [(SUClientInterface *)v4 userAgent];
  if (v14) {
    [v13 setValue:v14 forHTTPHeaderField:*MEMORY[0x263F7B788]];
  }
  uint64_t v15 = [(SUClientInterface *)v4 clientIdentifier];
  if (v15) {
    [v13 setClientIdentifier:v15];
  }
  if (-[NSString isEqualToString:](-[SUClientInterface hostApplicationIdentifier](v4, "hostApplicationIdentifier"), "isEqualToString:", @"com.apple.appstored")&& objc_msgSend((id)objc_msgSend((id)-[SSMutableURLRequestProperties URL](self->_urlRequestProperties, "URL"), "host"), "isEqualToString:", @"localhost"))
  {
    [v13 setURLBagType:3];
  }
  [v3 setRequestProperties:v13];

  return v3;
}

- (id)newPlaceholderViewController
{
  id v3 = objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newPlaceholderViewController");
  objc_msgSend(v3, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  id v4 = [(SUStorePageViewController *)self copyScriptProperties];
  id v5 = [(UIViewController *)self section];
  if ([v4 placeholderBackgroundGradient])
  {
    uint64_t v6 = [v4 placeholderBackgroundGradient];
  }
  else
  {
    uint64_t v6 = [v5 backgroundGradient];
    if (!v6) {
      goto LABEL_5;
    }
  }
  [v3 setBackgroundGradient:v6];
LABEL_5:
  if ([v4 backgroundColor]) {
    uint64_t v7 = [v4 backgroundColor];
  }
  else {
    uint64_t v7 = [MEMORY[0x263F1C550] systemBackgroundColor];
  }
  objc_msgSend((id)objc_msgSend(v3, "view"), "setBackgroundColor:", v7);
  int v8 = (void *)[v3 loadingView];
  objc_msgSend(v8, "setActivityIndicatorStyle:", objc_msgSend(v4, "loadingIndicatorStyle"));
  uint64_t v9 = [v5 loadingIndicatorColor];
  if (v9) {
    [v8 setActivityIndicatorColor:v9];
  }
  uint64_t v10 = [v4 loadingTextColor];
  if (v10 || (uint64_t v10 = [v5 loadingTextColor]) != 0) {
    [v8 setTextColor:v10];
  }
  uint64_t v11 = objc_msgSend(v4, "loadingTextShadowColor", v10);
  if (!v11) {
    uint64_t v11 = [v5 loadingTextShadowColor];
  }
  if ([v4 loadingTextShadowColor]) {
    [v8 setTextShadowColor:v11];
  }

  return v3;
}

- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4 returningError:(id *)a5
{
  uint64_t v7 = objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newViewControllerForPage:ofType:", a3, a4);
  objc_msgSend(v7, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 _setPerformanceMetrics:self->_performanceMetrics];
  }
  if (a5) {
    *a5 = 0;
  }
  return v7;
}

- (void)handleFailureWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v7 &= 2u;
  }
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [(SSMutableURLRequestProperties *)self->_urlRequestProperties URL];
    int v16 = 138543874;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = a3;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    LODWORD(v15) = 32;
    uint64_t v14 = &v16;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v16, v15);
      free(v11);
      uint64_t v14 = (int *)v12;
      SSFileLog();
    }
  }
  v13 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v14);
  [v13 addObserver:self selector:sel__sendFailureAfterDialogsFinished_ name:@"SUDialogDidFinishNotification" object:0];
  if (!-[SUViewController presentDialogForError:pendUntilVisible:](self, "presentDialogForError:pendUntilVisible:", a3, 1))[v13 removeObserver:self name:@"SUDialogDidFinishNotification" object:0]; {
}
  }

- (BOOL)isSkLoaded
{
  if (self->_reloadOnAppear) {
    return 0;
  }
  if (![(SUStorePageViewController *)self isViewLoaded]) {
    return 0;
  }
  if ([(SUViewController *)self isSkLoading]) {
    return 0;
  }
  activeChildViewController = self->_activeChildViewController;
  if (!activeChildViewController
    || ![(SUViewController *)activeChildViewController isViewLoaded]
    || [(UIViewController *)self->_activeChildViewController isSkLoaded])
  {
    return 0;
  }
  id v5 = self->_activeChildViewController;

  return [(UIViewController *)v5 viewIsReady];
}

- (void)reloadWithStorePage:(id)a3 ofType:(int64_t)a4 forURL:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  id v9 = [(SUStorePageViewController *)self newViewControllerForPage:a3 ofType:a4 returningError:&v29];
  if (v9)
  {
    uint64_t v10 = v9;
    if ([(SSMutableURLRequestProperties *)self->_urlRequestProperties URL]) {
      [(SSMutableURLRequestProperties *)self->_urlRequestProperties setURL:a5];
    }
    BOOL v11 = [(SUStorePageViewController *)self canBeResolved];
    uint64_t v12 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v14 &= 2u;
    }
    if (v11)
    {
      if (v14)
      {
LABEL_22:
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = objc_opt_class();
        int v30 = 138543874;
        uint64_t v31 = v22;
        __int16 v32 = 2114;
        uint64_t v33 = v23;
        __int16 v34 = 2112;
        id v35 = a5;
        LODWORD(v27) = 32;
        v26 = &v30;
        v24 = (void *)_os_log_send_and_compose_impl();
        if (v24)
        {
          uint64_t v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v30, v27);
          free(v24);
          v26 = (int *)v25;
          SSFileLog();
        }
      }
    }
    else if (v14)
    {
      goto LABEL_22;
    }
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __63__SUStorePageViewController_reloadWithStorePage_ofType_forURL___block_invoke;
    v28[3] = &unk_264812808;
    v28[4] = v10;
    v28[5] = a3;
    v28[6] = a5;
    -[SUStorePageViewController _renderStorePage:withType:viewController:block:](self, "_renderStorePage:withType:viewController:block:", a3, a4, v10, v28, v26);

    return;
  }
  uint64_t v15 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v16 = [v15 shouldLog];
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v17 &= 2u;
  }
  if (v17)
  {
    uint64_t v18 = objc_opt_class();
    int v30 = 138543618;
    uint64_t v31 = v18;
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)a5;
    LODWORD(v27) = 22;
    v26 = &v30;
    uint64_t v19 = _os_log_send_and_compose_impl();
    if (v19)
    {
      __int16 v20 = (void *)v19;
      uint64_t v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v30, v27);
      free(v20);
      v26 = (int *)v21;
      SSFileLog();
    }
  }
  -[SUStorePageViewController _handleFailureWithError:](self, "_handleFailureWithError:", v29, v26);
}

uint64_t __63__SUStorePageViewController_reloadWithStorePage_ofType_forURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadWithStorePage:*(void *)(a1 + 40) forURL:*(void *)(a1 + 48)];
}

- (void)requestWebScriptReloadWithContext:(id)a3
{
  if (!self->_reloadOnAppear
    && [(SUStorePageViewController *)self isViewLoaded]
    && ![(SUViewController *)self isSkLoading]
    && (activeChildViewController = self->_activeChildViewController) != 0
    && [(SUViewController *)activeChildViewController isViewLoaded]
    && ![(SUViewController *)self->_activeChildViewController isSkLoading]
    && [(UIViewController *)self->_activeChildViewController viewIsReady])
  {
    [(SUStorePageViewController *)self _requestWebScriptReloadWithContext:a3];
  }
  else
  {
    pendingWebScriptReloadContext = self->_pendingWebScriptReloadContext;
    if (pendingWebScriptReloadContext != a3)
    {

      self->_pendingWebScriptReloadContext = (SUWebScriptReloadContext *)[a3 copy];
    }
  }
}

- (void)resetNavigationItem:(id)a3
{
  [a3 resetAllValues];
  [(SUStorePageViewController *)self _reloadSectionButtons];
  [(SUViewController *)self _reloadLibraryButton];
  id v4 = [(UIViewController *)self section];

  [(SUStorePageViewController *)self _reloadSearchFieldWithSection:v4];
}

- (void)setScriptUserInfo:(id)a3
{
  scriptUserInfo = self->_scriptUserInfo;
  if (scriptUserInfo != a3)
  {

    self->_scriptUserInfo = (NSString *)[a3 copy];
    int v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"SUStorePageViewControllerScriptUserInfoDidChangeNotification" object:self];
  }
}

- (void)setURLRequestProperties:(id)a3
{
  urlRequestProperties = self->_urlRequestProperties;
  if (urlRequestProperties != a3)
  {

    self->_urlRequestProperties = (SSMutableURLRequestProperties *)[a3 mutableCopy];
  }
}

- (void)showPlaceholderViewController
{
}

- (SSURLRequestProperties)URLRequestProperties
{
  uint64_t v2 = (void *)[(SSMutableURLRequestProperties *)self->_urlRequestProperties copy];

  return (SSURLRequestProperties *)v2;
}

- (void)setUrlBagKey:(id)a3
{
}

- (void)setURLRequest:(id)a3
{
  self->_urlRequestProperties = (SSMutableURLRequestProperties *)objc_msgSend((id)objc_msgSend(a3, "requestProperties"), "mutableCopy");
}

- (id)urlBagKey
{
  return (id)[(SSMutableURLRequestProperties *)self->_urlRequestProperties URLBagKey];
}

- (id)URLRequest
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F89560]) initWithRequestProperties:self->_urlRequestProperties];

  return v2;
}

- (void)applicationDidEnterBackground
{
  BOOL reloadOnAppear = self->_reloadOnAppear;
  BOOL v4 = 1;
  if (!reloadOnAppear) {
    BOOL v4 = [(SUStorePageViewController *)self isSkLoaded];
  }
  self->_BOOL reloadOnAppear = v4;
  self->_isInBackground = 1;
  [(SUViewController *)self cancelOperations];
  [(SUStorePageViewController *)self setSkLoading:0];
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v5 applicationDidEnterBackground];
}

- (void)applicationWillEnterForeground
{
  self->_isInBackground = 0;
  if ([(SUStorePageViewController *)self _shouldReloadForAppearance]) {
    [(SUStorePageViewController *)self _reloadForAppearance:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v3 applicationWillEnterForeground];
}

- (id)copyArchivableContext
{
  v7.receiver = self;
  v7.super_class = (Class)SUStorePageViewController;
  id v3 = [(SUViewController *)&v7 copyArchivableContext];
  if (v3)
  {
    id v4 = [(SUViewController *)self->_activeChildViewController copyArchivableContext];
    if (v4)
    {
      id v5 = v4;

      id v3 = v5;
    }
  }
  [v3 setType:1];
  if (![(SUStorePageViewController *)self shouldExcludeFromNavigationHistory])
  {
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUStorePageViewController displayedURL](self, "displayedURL"), @"url");
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUStorePageViewController scriptUserInfo](self, "scriptUserInfo"), @"scriptUserInfo");
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUStorePageViewController URLRequestProperties](self, "URLRequestProperties"), @"urlRequestProperties");
  }
  return v3;
}

- (id)copyDefaultScriptProperties
{
  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController)
  {
LABEL_4:
    id result = [(SUViewController *)pendingChildViewController copyDefaultScriptProperties];
    if (result) {
      return result;
    }
    goto LABEL_5;
  }
  if (![(SUStorePageViewController *)self isSkLoaded])
  {
    pendingChildViewController = self->_activeChildViewController;
    goto LABEL_4;
  }
LABEL_5:
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  return [(SUViewController *)&v5 copyDefaultScriptProperties];
}

- (id)copyObjectForScriptFromPoolWithClass:(Class)a3
{
  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController)
  {
LABEL_4:
    id result = [(UIViewController *)pendingChildViewController copyObjectForScriptFromPoolWithClass:a3];
    if (result) {
      return result;
    }
    goto LABEL_5;
  }
  if (![(SUStorePageViewController *)self isSkLoaded])
  {
    pendingChildViewController = self->_activeChildViewController;
    goto LABEL_4;
  }
LABEL_5:
  v7.receiver = self;
  v7.super_class = (Class)SUStorePageViewController;
  return [(UIViewController *)&v7 copyObjectForScriptFromPoolWithClass:a3];
}

- (id)copyScriptProperties
{
  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController)
  {
LABEL_4:
    id result = [(SUViewController *)pendingChildViewController copyScriptProperties];
    if (result) {
      return result;
    }
    goto LABEL_5;
  }
  if (![(SUStorePageViewController *)self isSkLoaded])
  {
    pendingChildViewController = self->_activeChildViewController;
    goto LABEL_4;
  }
LABEL_5:
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  return [(SUViewController *)&v5 copyScriptProperties];
}

- (id)copyScriptViewController
{
  id v3 = objc_alloc_init(SUScriptStorePageViewController);
  [(SUScriptStorePageViewController *)v3 setNativeViewController:self];
  return v3;
}

- (void)didMoveToParentViewController:(id)a3
{
  [(SUStorePageViewController *)self _reloadPreviewOverlayVisibility];
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  [(SUStorePageViewController *)&v5 didMoveToParentViewController:a3];
}

- (id)displayedURL
{
  id v3 = [(UIViewController *)self->_activeChildViewController displayedURL];
  id v4 = [(SUPageSectionGroup *)self->_sectionsGroup sections];
  if (v3) {
    return v3;
  }
  int v6 = v4;
  if ([(NSArray *)v4 count])
  {
    id v3 = (id)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", self->_activeSectionIndex), "URLRequestProperties"), "URL");
    if (v3) {
      return v3;
    }
  }
  urlRequestProperties = self->_urlRequestProperties;

  return (id)[(SSMutableURLRequestProperties *)urlRequestProperties URL];
}

- (CGRect)documentBounds
{
  activeChildViewController = self->_activeChildViewController;
  if (activeChildViewController && [(UIViewController *)activeChildViewController viewIsReady])
  {
    [(UIViewController *)self->_activeChildViewController documentBounds];
  }
  else
  {
    double v4 = *MEMORY[0x263F001A0];
    double v5 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v6 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v7 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)handleApplicationURL:(id)a3 withSourceApplication:(id)a4 sourceURL:(id)a5
{
  if ([a3 storeURLType] == 1)
  {
    [(SUStorePageViewController *)self _reloadSearchFieldWithSection:[(UIViewController *)self section]];
    searchFieldController = self->_searchFieldController;
    [(SUSearchFieldController *)searchFieldController handleSearchURL:a3 withSourceApplication:a4 sourceURL:a5];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SUStorePageViewController;
    [(SUViewController *)&v10 handleApplicationURL:a3 withSourceApplication:a4 sourceURL:a5];
  }
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v4 invalidate];
  id v3 = (id)[(SUNavigationItem *)[(SUViewController *)self navigationItem] title];
  [(SUViewController *)self cancelOperations];
  [(SUStorePageViewController *)self setSkLoading:0];
  [(SUStorePageViewController *)self _setPendingChildViewController:0];

  self->_sectionsGroup = 0;
  if ([(SUStorePageViewController *)self isViewLoaded])
  {
    [(SUStorePageViewController *)self showPlaceholderViewController];
    [(SUStorePageViewController *)self resetNavigationItem:[(SUStorePageViewController *)self navigationItemForScriptInterface]];
  }
  else
  {
    [(SUStorePageViewController *)self _setActiveChildViewController:0 shouldTearDown:1];
  }
  self->_BOOL reloadOnAppear = 1;
  [(SUNavigationItem *)[(SUViewController *)self navigationItem] setTitle:v3];
}

- (void)invalidateForMemoryPurge
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(SUViewController *)self isVisible]
    || [(SUStorePageViewController *)self presentedViewController]
    || self->_isInBackground)
  {
    id v3 = [(SUPageSectionGroup *)self->_sectionsGroup sections];
    uint64_t v4 = [(NSArray *)v3 count];
    if (v4 >= 1)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (i != self->_activeSectionIndex) {
          objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", i), "setUserInfo:", 0);
        }
      }
    }
  }
  else
  {
    double v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v16 = 138412546;
      uint64_t v17 = objc_opt_class();
      __int16 v18 = 2112;
      id v19 = [(SUStorePageViewController *)self displayedURL];
      LODWORD(v14) = 22;
      int v13 = &v16;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        BOOL v11 = (void *)v10;
        uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v16, v14);
        free(v11);
        int v13 = (int *)v12;
        SSFileLog();
      }
    }
    [(SUStorePageViewController *)self invalidate];
  }
  v15.receiver = self;
  v15.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v15 invalidateForMemoryPurge];
}

- (id)iTunesStoreUI_searchFieldController
{
  uint64_t v2 = self->_searchFieldController;

  return v2;
}

- (void)iTunesStoreUI_searchFieldControllerDidChange:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3), "userInterfaceIdiom") != 1)
  {
    uint64_t v4 = (void *)[(SUViewController *)self->_activeChildViewController view];
    [v4 setHidden:1];
  }
}

- (BOOL)loadMoreWithURL:(id)a3
{
  int64_t pageType = self->_pageType;
  if (pageType == 1)
  {
    -[SSMutableURLRequestProperties setURLs:](self->_urlRequestProperties, "setURLs:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0));
    [(SUStorePageViewController *)self reloadWithURLRequestProperties:self->_urlRequestProperties];
  }
  return pageType == 1;
}

- (BOOL)_shouldShowPlaceholderForEmptyPage
{
  return objc_msgSend(-[UIViewController section](self, "section"), "type") != 1
      || objc_msgSend(-[UIViewController section](self, "section"), "url") != 0;
}

- (void)loadView
{
  uint64_t v5 = -[SUStorePageView initWithFrame:]([SUStorePageView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 1.0);
  [(SUStorePageView *)v5 setAutoresizingMask:18];
  [(SUStorePageViewController *)self setView:v5];
  [(SUStorePageViewController *)self _reloadBackgroundViewProperties];
  activeChildViewController = self->_activeChildViewController;
  if (activeChildViewController)
  {
    uint64_t v4 = (void *)[(SUViewController *)activeChildViewController view];
    [(SUStorePageViewController *)self _frameForActiveViewController];
    objc_msgSend(v4, "setFrame:");
    [(SUStorePageView *)v5 setContentView:[(SUViewController *)self->_activeChildViewController view]];
    goto LABEL_7;
  }
  if ([(SUStorePageViewController *)self canBeResolved])
  {
    self->_BOOL reloadOnAppear = 1;
  }
  else if (![(SUStorePageViewController *)self _shouldShowPlaceholderForEmptyPage])
  {
    goto LABEL_7;
  }
  [(SUStorePageViewController *)self showPlaceholderViewController];
LABEL_7:
  [(SUStorePageViewController *)self _reloadSectionButtons];
  [(SUStorePageViewController *)self _reloadSearchFieldWithSection:[(UIViewController *)self section]];
}

- (id)navigationItemForScriptInterface
{
  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController)
  {
LABEL_4:
    id result = [(UIViewController *)pendingChildViewController navigationItemForScriptInterface];
    if (result) {
      return result;
    }
    goto LABEL_5;
  }
  if (![(SUStorePageViewController *)self isSkLoaded])
  {
    pendingChildViewController = self->_activeChildViewController;
    goto LABEL_4;
  }
LABEL_5:
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  return [(UIViewController *)&v5 navigationItemForScriptInterface];
}

- (id)newRotationController
{
  id v3 = [SUStorePageRotationController alloc];

  return [(SURotationController *)v3 initWithViewController:self];
}

- (BOOL)pushStorePage:(id)a3 withTarget:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [(UIViewController *)self overlayViewController];
  uint64_t v10 = (SUTabBarController *)[(SUStorePageViewController *)self tabBarController];
  if (!v10) {
    uint64_t v10 = [(SUClientInterface *)[(SUViewController *)self clientInterface] tabBarController];
  }
  [(SUTabBarController *)v10 dismissOverlayBackgroundViewController];
  if (a4 != 2) {
    goto LABEL_18;
  }
  if (!self) {
    goto LABEL_9;
  }
  BOOL v11 = self;
  do
  {
    uint64_t v12 = [(SUStorePageViewController *)v11 _popoverController];
    uint64_t v13 = [(SUStorePageViewController *)v11 popoverPresentationController];
    uint64_t v14 = [(SUStorePageViewController *)v11 parentViewController];
    if (v12 | v13) {
      break;
    }
    BOOL v11 = (SUStorePageViewController *)v14;
  }
  while (v14);
  if (!(v12 | v13))
  {
LABEL_9:
    if (!v9) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (v12)
  {
    [(id)v12 dismissPopoverAnimated:v5];
  }
  else if (v13)
  {
    [(SUStorePageViewController *)self dismissViewControllerAnimated:v5 completion:0];
  }
  id v15 = (id)[(SUTabBarController *)v10 transientViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_16:
  }
    id v15 = [(UITabBarController *)v10 selectedNavigationController];
  if (!v15) {
LABEL_18:
  }
    id v15 = [(SUViewController *)self navigationController];
  [v15 pushViewController:a3 animated:v5];
  return 1;
}

- (BOOL)reloadForSectionsWithGroup:(id)a3
{
  id v3 = a3;
  if (!a3 && self->_loadingForSectionChange)
  {
    id v3 = (id)[(SUPageSectionGroup *)self->_sectionsGroup copy];
    [v3 setDefaultSectionIndex:self->_activeSectionIndex];
  }
  if (![(SUPageSectionGroup *)self->_sectionsGroup isEqual:v3])
  {

    self->_sectionsGroup = (SUPageSectionGroup *)v3;
    self->_activeSectionIndex = [v3 defaultSectionIndex];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", self), "_reloadSectionsControlWithGroup:", v3);
  objc_msgSend(-[SUStorePageViewController _activePageSection](self, "_activePageSection"), "setExpirationTime:", self->_expirationTime);
  return 1;
}

- (void)reload
{
  id v3 = [(UIViewController *)self section];
  if (v3)
  {
    uint64_t v4 = v3;
    -[SSMutableURLRequestProperties setURLs:](self->_urlRequestProperties, "setURLs:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", objc_msgSend(v3, "url"), 0));
    -[SSMutableURLRequestProperties setURLBagKey:](self->_urlRequestProperties, "setURLBagKey:", [v4 urlBagKey]);
  }
  [(SUStorePageViewController *)self reloadWithURLRequestProperties:self->_urlRequestProperties];
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v5 reload];
}

- (BOOL)reloadWithURLRequestProperties:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v14 = 138543362;
    uint64_t v15 = objc_opt_class();
    LODWORD(v13) = 12;
    uint64_t v12 = &v14;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      id v9 = (void *)v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v14, v13);
      free(v9);
      uint64_t v12 = (int *)v10;
      SSFileLog();
    }
  }
  return -[SUStorePageViewController _reloadWithURLRequestProperties:completionBlock:](self, "_reloadWithURLRequestProperties:completionBlock:", a3, 0, v12);
}

- (void)restoreArchivableContext:(id)a3
{
  uint64_t v5 = [a3 valueForMetadataKey:@"scriptUserInfo"];
  if (v5) {
    [(SUStorePageViewController *)self setScriptUserInfo:v5];
  }
  int v6 = (void *)[a3 valueForMetadataKey:@"urlRequestProperties"];
  if (v6 || (int v6 = (void *)[a3 valueForMetadataKey:@"urlRequest"]) != 0)
  {

    self->_urlRequestProperties = (SSMutableURLRequestProperties *)[v6 mutableCopy];
  }
  uint64_t v7 = [a3 valueForMetadataKey:@"url"];
  if (v7) {
    -[SSMutableURLRequestProperties setURLs:](self->_urlRequestProperties, "setURLs:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v7, 0));
  }
  uint64_t v8 = [a3 valueForMetadataKey:@"urlBagKey"];
  if (v8) {
    [(SSMutableURLRequestProperties *)self->_urlRequestProperties setURLBagKey:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v9 restoreArchivableContext:a3];
}

- (id)setDisplayedSectionGroup:(id)a3
{
  uint64_t v5 = (void *)[a3 sections];
  if ([v5 count])
  {
    id v6 = -[SUStorePageViewController _newSegmentedControlWithItems:](self, "_newSegmentedControlWithItems:", [v5 valueForKey:@"segmentedControlItem"]);
    if (![a3 style] && _UIApplicationUsesLegacyUI()) {
      [v6 setSegmentedControlStyle:2];
    }
    objc_msgSend(v6, "setTintColor:", objc_msgSend(a3, "tintColor"));
    objc_msgSend(v6, "setTintStyle:", objc_msgSend(a3, "tintStyle"));
    [(SUStorePageViewController *)self _displaySegmentedControl:v6];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setSkLoading:(BOOL)a3
{
  BOOL v3 = a3;
  self->_lastLoadDidFail = 0;
  BOOL v5 = self->_loadingForSectionChange && a3;
  self->_loadingForSectionChange = v5;
  -[SUViewController setSkLoading:](self->_activeChildViewController, "setSkLoading:");
  v6.receiver = self;
  v6.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v6 setSkLoading:v3];
}

- (void)setParentViewController:(id)a3
{
  id v5 = [(UIViewController *)self section];
  v6.receiver = self;
  v6.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v6 setParentViewController:a3];
  if (a3
    && v5 != [(UIViewController *)self section]
    && [(SUStorePageViewController *)self isViewLoaded])
  {
    [(SUStorePageViewController *)self _reloadSearchFieldWithSection:[(UIViewController *)self section]];
  }
}

- (void)setSection:(id)a3
{
  if (![(SSMutableURLRequestProperties *)self->_urlRequestProperties URL]) {
    -[SSMutableURLRequestProperties setURLs:](self->_urlRequestProperties, "setURLs:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", objc_msgSend(a3, "url"), 0));
  }
  if (![(SSMutableURLRequestProperties *)self->_urlRequestProperties URLBagKey]) {
    -[SSMutableURLRequestProperties setURLBagKey:](self->_urlRequestProperties, "setURLBagKey:", [a3 urlBagKey]);
  }
  if ([(SUStorePageViewController *)self isViewLoaded]) {
    [(SUStorePageViewController *)self _reloadSearchFieldWithSection:a3];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v5 setSection:a3];
}

- (void)setScriptProperties:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v4 setScriptProperties:a3];
  if ([(SUStorePageViewController *)self isViewLoaded]) {
    [(SUStorePageViewController *)self _reloadBackgroundViewProperties];
  }
  [(SUStorePageViewController *)self _applyPropertiesToViewController:self->_pendingChildViewController];
  [(SUStorePageViewController *)self _applyPropertiesToViewController:self->_activeChildViewController];
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)SUStorePageViewController;
  if ([(SUViewController *)&v14 shouldExcludeFromNavigationHistory]
    || [(SUViewController *)self->_activeChildViewController shouldExcludeFromNavigationHistory])
  {
    goto LABEL_3;
  }
  objc_super v4 = objc_msgSend(-[SUStorePageViewController storePageProtocol](self, "storePageProtocol"), "expectedClientIdentifiers");
  uint64_t v3 = [v4 count];
  if (!v3) {
    return v3;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (!v5)
  {
LABEL_3:
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (+[SUClientDispatch matchesClientApplication:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          LOBYTE(v3) = 0;
          return v3;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      LOBYTE(v3) = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (id)storePageProtocol
{
  id result = [(UIViewController *)self->_activeChildViewController storePageProtocol];
  if (!result)
  {
    id result = self->_lastValidProtocol;
    if (!result)
    {
      v4.receiver = self;
      v4.super_class = (Class)SUStorePageViewController;
      return [(UIViewController *)&v4 storePageProtocol];
    }
  }
  return result;
}

- (void)storePageProtocolDidChange
{
  uint64_t v3 = [(SUStorePageViewController *)self storePageProtocol];
  objc_super v4 = v3;
  if (v3)
  {
    lastValidProtocol = self->_lastValidProtocol;
    if (lastValidProtocol != v3)
    {

      self->_lastValidProtocol = v4;
    }
  }
  [(SUStorePageViewController *)self _verifyStorePageProtocol:v4];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", self), "_reloadNavigationBar");
  if ([(SUStorePageViewController *)self isSkLoaded])
  {
    if ([(SUStorePageProtocol *)v4 shouldDisplayInOverlay]
      && ![(UIViewController *)self overlayViewController]
      && [(SUStorePageViewController *)self canMoveToOverlay])
    {
      [(SUStorePageViewController *)self _moveChildViewController:self->_activeChildViewController toOverlayForProtocol:v4];
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", self), "_repositionForChildViewController:", self->_activeChildViewController);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v6 storePageProtocolDidChange];
}

- (void)tabBarControllerDidLongPressTabBarItem:(id)a3
{
  if (![(SUStorePageViewController *)self isSkLoaded]
    && [(SUViewController *)self isVisibleAndFrontmost])
  {
    objc_super v4 = [(SUStorePageViewController *)self URLRequestProperties];
    if ([(SSURLRequestProperties *)v4 URL])
    {
      uint64_t v5 = (void *)[(SSURLRequestProperties *)v4 copyURLRequest];
      objc_msgSend((id)objc_msgSend(MEMORY[0x263EFC600], "sharedURLCache"), "removeCachedResponseForRequest:", v5);
    }
    [(SUStorePageViewController *)self reloadWithURLRequestProperties:v4];
  }
}

- (void)tabBarControllerDidReselectTabBarItem:(id)a3
{
  if (self->_lastLoadDidFail
    && ![(SUStorePageViewController *)self isSkLoaded]
    && [(SUViewController *)self isVisibleAndFrontmost])
  {
    objc_super v4 = [(SUStorePageViewController *)self URLRequestProperties];
    [(SUStorePageViewController *)self reloadWithURLRequestProperties:v4];
  }
}

- (BOOL)viewIsReady
{
  activeChildViewController = self->_activeChildViewController;
  if (activeChildViewController) {
    LOBYTE(activeChildViewController) = [(UIViewController *)activeChildViewController viewIsReady];
  }
  return (char)activeChildViewController;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_reloadOnAppear
    && [(SUStorePageViewController *)self _shouldFetchAutomatically])
  {
    [(SUStorePageViewController *)self _reloadForAppearance:v3];
    self->_BOOL reloadOnAppear = [(SUStorePageViewController *)self _sectionIsNetworkConstrained];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v5 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v4 viewDidDisappear:a3];
  if ([(SUViewController *)self isSkLoading])
  {
    self->_BOOL reloadOnAppear = 1;
    [(SUStorePageViewController *)self showPlaceholderViewController];
    [(SUStorePageViewController *)self setSkLoading:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[SUScriptNavigationSimulator transitioning])
  {
    id v5 = [(UIViewController *)self section];
    [(SUStorePageViewController *)self _reloadSearchFieldWithSection:v5];
    if ([v5 type] == 1)
    {
      if ([(UIViewController *)self isRootViewController])
      {
        if (![(SUStorePageViewController *)self _shouldFetchAutomatically])
        {
          objc_super v6 = [(UISearchBar *)[(SUSearchFieldController *)self->_searchFieldController searchBar] text];
          if ([(NSString *)v6 length])
          {
            id v7 = [(SUSearchFieldController *)self->_searchFieldController newRequestPropertiesWithSearchTerm:v6];
            if ([v7 URL]) {
              -[SSMutableURLRequestProperties setURL:](self->_urlRequestProperties, "setURL:", [v7 URL]);
            }
            if ([v7 URLBagKey]) {
              -[SSMutableURLRequestProperties setURLBagKey:](self->_urlRequestProperties, "setURLBagKey:", [v7 URLBagKey]);
            }
            if ([v7 requestParameters]) {
              -[SSMutableURLRequestProperties setRequestParameters:](self->_urlRequestProperties, "setRequestParameters:", [v7 requestParameters]);
            }
          }
        }
      }
    }
    [(SUStorePageViewController *)self _reloadForAppearance:v3];
    [(SUStorePageViewController *)self _reloadPreviewOverlayVisibility];
    v8.receiver = self;
    v8.super_class = (Class)SUStorePageViewController;
    [(SUViewController *)&v8 viewWillAppear:v3];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[SUScriptNavigationSimulator transitioning])
  {
    if (self->_navigationMenuPopover) {
      [(SUStorePageViewController *)self _dismissNavigationMenuViewController];
    }
    SUButtonActionDeactivateNavigationItem([(SUViewController *)self navigationItem]);
    [(SUViewController *)self cancelOperations];
    v5.receiver = self;
    v5.super_class = (Class)SUStorePageViewController;
    [(SUViewController *)&v5 viewWillDisappear:v3];
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  if (self->_navigationMenuPopover)
  {
    id v5 = [(SUStorePageViewController *)self navigationItemForScriptInterface];
    objc_super v6 = [(SUNavigationMenuViewController *)self->_navigationMenuViewController navigationMenu];
    if ([(SUNavigationMenu *)v6 location])
    {
      if ([(SUNavigationMenu *)v6 location] != 1) {
        goto LABEL_8;
      }
      uint64_t v8 = [v5 rightBarButtonItem];
    }
    else
    {
      uint64_t v8 = [v5 leftBarButtonItem];
    }
    uint64_t v7 = v8;
    if (v8)
    {
      [(UIPopoverController *)self->_navigationMenuPopover presentPopoverFromBarButtonItem:v8 permittedArrowDirections:15 animated:1];
      goto LABEL_9;
    }
LABEL_8:
    [(SUStorePageViewController *)self _tearDownNavigationMenu];
  }
LABEL_9:
  v9.receiver = self;
  v9.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v9 didRotateFromInterfaceOrientation:a3];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v4 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  [(UIPopoverController *)self->_navigationMenuPopover dismissPopoverAnimated:0];
  [(SUSearchFieldController *)self->_searchFieldController willRotateToInterfaceOrientation:a3];
  v7.receiver = self;
  v7.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v7 willRotateToInterfaceOrientation:a3 duration:a4];
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v16 = 138543874;
    uint64_t v17 = objc_opt_class();
    __int16 v18 = 2112;
    id v19 = a4;
    __int16 v20 = 2112;
    id v21 = [(SUStorePageViewController *)self displayedURL];
    LODWORD(v14) = 32;
    long long v13 = &v16;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      long long v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v16, v14);
      free(v11);
      long long v13 = (int *)v12;
      SSFileLog();
    }
  }
  -[SUStorePageViewController _handleFailureWithError:](self, "_handleFailureWithError:", a4, v13);
  v15.receiver = self;
  v15.super_class = (Class)SUStorePageViewController;
  [(SUViewController *)&v15 operation:a3 failedWithError:a4];
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  objc_super v7 = (void *)[a3 response];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "itunes_expirationInterval"), v8 >= 0.0)) {
    double v9 = v8 + CFAbsoluteTimeGetCurrent();
  }
  else {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "distantFuture"), "timeIntervalSinceReferenceDate");
  }
  self->_expirationTime = v9;

  self->_performanceMetrics = (ISURLRequestPerformance *)(id)[a3 performanceMetrics];
  uint64_t v10 = (void *)[a3 dataProvider];
  uint64_t v11 = [v10 outputType];
  uint64_t v12 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  if (os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    int v15 = v14;
  }
  else {
    int v15 = v14 & 2;
  }
  if (v15)
  {
    uint64_t v24 = objc_opt_class();
    v25[0] = @"statusCode";
    v26[0] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "statusCode"));
    v25[1] = @"correlationId";
    int v16 = (__CFString *)objc_msgSend((id)objc_msgSend(v7, "allHeaderFields"), "objectForKeyedSubscript:", @"X-Apple-Jingle-Correlation-Key");
    uint64_t v17 = v16 ? v16 : @"<unknown>";
    v26[1] = v17;
    v25[2] = @"pageType";
    v26[2] = [NSNumber numberWithInteger:v11];
    v25[3] = @"URL";
    __int16 v18 = (__CFString *)objc_msgSend((id)objc_msgSend(v7, "URL"), "absoluteString");
    id v19 = v18 ? v18 : @"<unknown>";
    v26[3] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    int v27 = 138543874;
    uint64_t v28 = v24;
    __int16 v29 = 2114;
    id v30 = a3;
    __int16 v31 = 2112;
    uint64_t v32 = v20;
    LODWORD(v23) = 32;
    uint64_t v21 = _os_log_send_and_compose_impl();
    if (v21)
    {
      uint64_t v22 = (void *)v21;
      objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v27, v23);
      free(v22);
      SSFileLog();
    }
  }
  if (v11 == 5) {
    [(SUClientInterface *)[(SUViewController *)self clientInterface] _dispatchOnPageResponseWithData:a4 response:v7];
  }
  else {
    -[SUStorePageViewController reloadWithStorePage:ofType:forURL:](self, "reloadWithStorePage:ofType:forURL:", a4, [v10 outputType], objc_msgSend(v7, "URL"));
  }
}

- (void)setClientContext:(id)a3
{
  uint64_t v4 = [a3 clientInterface];

  [(SUViewController *)self setClientInterface:v4];
}

- (void)showExternalURL:(id)a3
{
  uint64_t v5 = [a3 underlyingURL];
  uint64_t v6 = [a3 referrerApplicationName];
  uint64_t v7 = [a3 referrerURLString];

  [(SUStorePageViewController *)self handleApplicationURL:v5 withSourceApplication:v6 sourceURL:v7];
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  if (self->_navigationMenuViewController == a3)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "navigationMenu"), "menuItems"), "objectAtIndex:", a4);
    id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F7B368]), "initWithURL:", objc_msgSend(v5, "URL"));
    [(SUStorePageViewController *)self _dismissNavigationMenuViewController];
    [(SUStorePageViewController *)self _reloadWithURLRequestProperties:v6 preserveSectionControl:1];
  }
}

- (void)menuViewController:(id)a3 didTapButton:(id)a4
{
  if (self->_navigationMenuViewController == a3)
  {
    [(SUStorePageViewController *)self _dismissNavigationMenuViewController];
    id v6 = (void *)[MEMORY[0x263F1CB68] transitionSafePerformer:self];
    [v6 _performActionForProtocolButton:a4];
  }
}

- (void)menuViewControllerDidCancel:(id)a3
{
  if (self->_navigationMenuViewController == a3) {
    [(SUStorePageViewController *)self _dismissNavigationMenuViewController];
  }
}

- (void)hidePreviewOverlay:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  double v9 = (void *)[(SUStorePageViewController *)self view];
  uint64_t v10 = [a3 view];
  [v9 setPreviewOverlayView:v10];
  [v9 layoutIfNeeded];
  [v9 setPreviewOverlayView:0];
  [v9 addSubview:v10];
  double v11 = 0.0;
  if (v6) {
    +[SUPreviewOverlayViewController defaultAnimationDuration];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__SUStorePageViewController_hidePreviewOverlay_animated_completionBlock___block_invoke;
  v13[3] = &unk_264812158;
  v13[4] = v10;
  v13[5] = self;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__SUStorePageViewController_hidePreviewOverlay_animated_completionBlock___block_invoke_2;
  v12[3] = &unk_264812830;
  v12[4] = a5;
  [MEMORY[0x263F1CB60] animateWithDuration:v13 animations:v12 completion:v11];
}

uint64_t __73__SUStorePageViewController_hidePreviewOverlay_animated_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  uint64_t v2 = (void *)[*(id *)(a1 + 40) view];

  return [v2 layoutSubviews];
}

uint64_t __73__SUStorePageViewController_hidePreviewOverlay_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isShowingPreviewOverlay
{
  return objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "previewOverlayView") != 0;
}

- (BOOL)showPreviewOverlay:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  double v8 = (void *)[(SUStorePageViewController *)self view];
  uint64_t v9 = [v8 headerView];
  if (v9)
  {
    uint64_t v10 = (void *)[a3 view];
    [v8 setPreviewOverlayView:v10];
    [v8 bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [v10 frame];
    double v20 = v19;
    double v21 = *MEMORY[0x263F00148];
    double v22 = -v19;
    v28.origin.x = v12;
    v28.origin.y = v14;
    v28.size.width = v16;
    v28.size.height = v18;
    double Width = CGRectGetWidth(v28);
    objc_msgSend(v10, "setFrame:", v21, v22, Width, v20);
    double v24 = 0.0;
    if (v6) {
      [(id)objc_opt_class() defaultAnimationDuration];
    }
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __73__SUStorePageViewController_showPreviewOverlay_animated_completionBlock___block_invoke;
    v27[3] = &unk_264812130;
    v27[4] = v8;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __73__SUStorePageViewController_showPreviewOverlay_animated_completionBlock___block_invoke_2;
    v26[3] = &unk_264812858;
    *(double *)&v26[6] = v21;
    *(double *)&void v26[7] = v22;
    *(double *)&v26[8] = Width;
    *(double *)&v26[9] = v20;
    void v26[4] = v8;
    v26[5] = a5;
    [MEMORY[0x263F1CB60] animateWithDuration:v27 animations:v26 completion:v24];
  }
  return v9 != 0;
}

uint64_t __73__SUStorePageViewController_showPreviewOverlay_animated_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutSubviews];
}

void __73__SUStorePageViewController_showPreviewOverlay_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 32), "backgroundColor"));
  [*(id *)(a1 + 32) setPreviewOverlayView:v3];
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  if (self->_navigationMenuPopover == a3) {
    [(SUStorePageViewController *)self _tearDownNavigationMenu];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController
    && [(UIViewController *)pendingChildViewController viewIsReady])
  {
    double v8 = self->_pendingChildViewController;
    [(SUStorePageViewController *)self _handleViewControllerBecameReady:v8];
  }
}

- (void)_documentBoundsChangeNotification:(id)a3
{
  uint64_t v4 = (SUStorePageViewController *)[a3 object];
  if (v4 != self && [(UIViewController *)v4 isDescendantOfViewController:self])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"SUViewControllerDocumentBoundsDidChangeNotification" object:self];
  }
}

- (void)_reloadForNetworkTypeChange:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance", a3), "networkType") >= 1)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__SUStorePageViewController__reloadForNetworkTypeChange___block_invoke;
    block[3] = &unk_264812130;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __57__SUStorePageViewController__reloadForNetworkTypeChange___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isVisible];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _reloadForAppearance:0];
  }
  return result;
}

- (void)_scriptEventNotification:(id)a3
{
  uint64_t v4 = (void *)[a3 userInfo];
  if objc_msgSend((id)objc_msgSend(v4, "objectForKey:", @"viewController"), "isDescendantOfViewController:", self)&& (objc_opt_respondsToSelector())
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", @"payload"), "dataUsingEncoding:", 4);
    if (v5) {
      uint64_t v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:0];
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = self;
    delegate = self->_delegate;
    uint64_t v9 = [v4 objectForKey:@"name"];
    [(SUStorePageViewControllerDelegate *)delegate storePageViewController:self didReceiveScriptEvent:v9 payload:v6];
  }
}

- (void)_sendFailureAfterDialogsFinished:(id)a3
{
  if (![+[SUDialogManager sharedInstance] numberOfPendingDialogs])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, objc_msgSend(a3, "name"), objc_msgSend(a3, "object"));
    [(SUStorePageViewController *)self _finishHandlingFailure];
  }
}

- (void)_tabConfigurationChanged:(id)a3
{
  [(SUStorePageViewController *)self _reloadNavigationBar];
  id v4 = [(UIViewController *)self section];

  [(SUStorePageViewController *)self _reloadSearchFieldWithSection:v4];
}

- (void)_navigationButtonAction:(id)a3
{
  uint64_t v4 = [a3 tag];
  if (v4 == 1851944034)
  {
    uint64_t v5 = SUProtocolButtonLocationLeft;
  }
  else
  {
    if (v4 != 1851945570) {
      return;
    }
    uint64_t v5 = SUProtocolButtonLocationRight;
  }
  uint64_t v6 = objc_msgSend(-[SUStorePageViewController storePageProtocol](self, "storePageProtocol"), "navigationButtonForLocation:", *v5);
  if (v6)
  {
    [(SUStorePageViewController *)self _performActionForProtocolButton:v6];
  }
}

- (void)_navigationMenuButtonAction:(id)a3
{
  if (self->_navigationMenuViewController)
  {
    [(SUStorePageViewController *)self _dismissNavigationMenuViewController];
  }
  else
  {
    uint64_t v5 = [a3 tag];
    if (v5 == 1852664930)
    {
      uint64_t v6 = 0;
    }
    else
    {
      if (v5 != 1852666466) {
        return;
      }
      uint64_t v6 = 1;
    }
    uint64_t v7 = objc_msgSend(-[SUStorePageViewController storePageProtocol](self, "storePageProtocol"), "navigationMenuForLocation:", v6);
    if (v7)
    {
      double v8 = [[SUNavigationMenuViewController alloc] initWithNavigationMenu:v7];
      self->_navigationMenuViewController = v8;
      [(SUViewController *)v8 setClientInterface:[(SUViewController *)self clientInterface]];
      [(SUMenuViewController *)self->_navigationMenuViewController setDelegate:self];
      uint64_t v10 = [[SUNavigationController alloc] initWithRootViewController:self->_navigationMenuViewController];
      [(SUNavigationController *)v10 setClientInterface:[(SUViewController *)self clientInterface]];
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1)
      {
        uint64_t v9 = (UIPopoverController *)[objc_alloc(MEMORY[0x263F1C898]) initWithContentViewController:v10];
        self->_navigationMenuPopover = v9;
        [(UIPopoverController *)v9 _setPopoverBackgroundStyle:3];
        [(UIPopoverController *)self->_navigationMenuPopover setDelegate:self];
        [(UIPopoverController *)self->_navigationMenuPopover presentPopoverFromBarButtonItem:a3 permittedArrowDirections:15 animated:1];
      }
      else
      {
        [(SUStorePageViewController *)self presentViewController:v10 animated:1 completion:0];
      }
      [(UISearchBar *)[(SUSearchFieldController *)self->_searchFieldController searchBar] resignFirstResponder];
    }
  }
}

- (void)_sectionControlAction:(id)a3
{
  uint64_t v4 = [a3 selectedItemIndex];
  if (self->_activeSectionIndex != v4)
  {
    int64_t v5 = v4;
    uint64_t v6 = [(SUPageSectionGroup *)self->_sectionsGroup sections];
    if ([(SUStorePageViewController *)self isSkLoaded])
    {
      [(SUStorePageViewController *)self _setPendingChildViewController:0];
      [(SUViewController *)self cancelOperations];
    }
    else
    {
      objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", self->_activeSectionIndex), "setUserInfo:", self->_activeChildViewController);
    }
    [(SUStorePageViewController *)self _dismissNavigationMenuViewController];
    self->_activeSectionIndex = v5;
    [(SUSegmentedControl *)self->_segmentedControl setSelectedItemIndex:v5];
    id v7 = [(NSArray *)v6 objectAtIndex:self->_activeSectionIndex];
    if ([v7 userInfo]
      && ([(SUStorePageViewController *)self _expirationTime], v8 > CFAbsoluteTimeGetCurrent()))
    {
      uint64_t v9 = (void *)[v7 userInfo];
      objc_msgSend(v9, "_setExistingNavigationItem:", -[SUViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v9, "_setExistingTabBarItem:", -[SUStorePageViewController _existingTabBarItem](self, "_existingTabBarItem"));
      [(SUStorePageViewController *)self _setActiveChildViewController:v9 shouldTearDown:0];
      [(SUStorePageViewController *)self storePageProtocolDidChange];
      [(SUStorePageViewController *)self setSkLoading:0];
    }
    else
    {
      if (![(UIViewController *)self->_activeChildViewController canDisplaySectionGroup:self->_sectionsGroup])
      {
        [(SUStorePageViewController *)self _setPendingChildViewController:0];
        [(SUStorePageViewController *)self _showPlaceholderViewControllerWithTearDown:0];
      }
      self->_loadingForSectionChange = 1;
      [(SUStorePageViewController *)self enqueueFetchOperationForPageSection:v7];
    }
  }
}

- (BOOL)_isCacheExpired
{
  [(SUStorePageViewController *)self _expirationTime];
  return v2 < CFAbsoluteTimeGetCurrent();
}

- (BOOL)_reloadWithURLRequestProperties:(id)a3 completionBlock:(id)a4
{
  id loadBlock = self->_loadBlock;
  if (loadBlock != a4)
  {

    self->_id loadBlock = (id)[a4 copy];
  }
  [(SUStorePageViewController *)self setURLRequestProperties:a3];
  self->_BOOL reloadOnAppear = 1;
  if ([(SUStorePageViewController *)self _sectionIsNetworkConstrained]) {
    return 0;
  }

  return [(SUStorePageViewController *)self _reloadWithURLRequestProperties:a3 preserveSectionControl:0];
}

- (void)_setHeaderView:(id)a3
{
  int64_t v5 = (void *)[(SUStorePageViewController *)self view];
  if ((id)[v5 headerView] != a3)
  {
    [v5 setHeaderView:a3];
    [(SUStorePageViewController *)self _reloadPreviewOverlayVisibility];
  }
}

- (void)_setSegmentedControl:(id)a3
{
  if (self->_segmentedControl != a3)
  {
    id v5 = [(SUStorePageViewController *)self navigationItemForScriptInterface];
    uint64_t v6 = (SUSegmentedControl *)[v5 titleView];
    id v7 = v6;
    segmentedControl = self->_segmentedControl;
    if (v6 != segmentedControl)
    {
      if (-[SUSegmentedControl isDescendantOfView:](segmentedControl, "isDescendantOfView:", objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "headerView")))-[SUStorePageViewController _setHeaderView:](self, "_setHeaderView:", 0); {
      [(SUSegmentedControl *)self->_segmentedControl removeFromSuperview];
      }
      uint64_t v6 = self->_segmentedControl;
    }
    [(SUSegmentedControl *)v6 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

    self->_segmentedControl = (SUSegmentedControl *)a3;
    id v9 = [(UIViewController *)self section];
    if (v9) {
      -[SUSegmentedControl setTintStyle:](self->_segmentedControl, "setTintStyle:", [v9 defaultPNGStyle] == 1);
    }
    if (self->_segmentedControl) {
      -[SUStorePageViewController _displaySegmentedControl:](self, "_displaySegmentedControl:");
    }
    if (v7 == segmentedControl)
    {
      uint64_t v10 = self->_segmentedControl;
      if (!v10
        || [(SUSegmentedControl *)v10 isDescendantOfView:[(SUStorePageViewController *)self view]])
      {
        [v5 setTitleView:0];
      }
    }
    pendingChildViewController = self->_pendingChildViewController;
    if (!pendingChildViewController) {
      pendingChildViewController = self->_activeChildViewController;
    }
    if ([(SUViewController *)pendingChildViewController isViewLoaded])
    {
      CGFloat v12 = (void *)[(SUViewController *)pendingChildViewController view];
      [(SUStorePageViewController *)self _frameForActiveViewController];
      objc_msgSend(v12, "setFrame:");
    }
  }
}

- (void)_setUseWebViewFastPath:(BOOL)a3
{
  self->_useWebViewFastPath = a3;
}

- (id)_activeChildViewController
{
  return self->_activeChildViewController;
}

- (id)_activePageSection
{
  id v3 = [(SUPageSectionGroup *)self->_sectionsGroup sections];
  unint64_t activeSectionIndex = self->_activeSectionIndex;
  if (activeSectionIndex >= [(NSArray *)v3 count]) {
    return 0;
  }
  int64_t v5 = self->_activeSectionIndex;

  return [(NSArray *)v3 objectAtIndex:v5];
}

- (void)_applyPropertiesToViewController:(id)a3
{
  uint64_t v4 = [(SUViewController *)self _cachedScriptProperties];

  [a3 setScriptProperties:v4];
}

- (void)_dismissNavigationMenuViewController
{
  [(UIViewController *)self->_navigationMenuViewController dismissAnimated:1];

  [(SUStorePageViewController *)self _tearDownNavigationMenu];
}

- (void)_displaySegmentedControl:(id)a3
{
  if (-[SUStorePageViewController _shouldDisplaySegmentedControlInNavigationBar:](self, "_shouldDisplaySegmentedControlInNavigationBar:"))
  {
    if (_UIApplicationUsesLegacyUI()) {
      [a3 setSegmentedControlStyle:2];
    }
    [a3 sizeToFitUserInterfaceIdiom];
    id v5 = [(SUStorePageViewController *)self navigationItemForScriptInterface];
    [v5 setTitleView:a3];
  }
  else
  {
    uint64_t v6 = (void *)[(SUStorePageViewController *)self view];
    if ([a3 conformsToProtocol:&unk_26DC29798]) {
      [a3 setDeferringInterfaceUpdates:0];
    }
    [a3 setSegmentedControlStyle:7];
    id v7 = [[SUSegmentedControlBar alloc] initWithSegmentedControl:a3];
    [(SUSegmentedControlBar *)v7 sizeToFit];
    [(SUSegmentedControlBar *)v7 frame];
    [v6 bounds];
    -[SUSegmentedControlBar setFrame:](v7, "setFrame:", 0.0, 0.0);
    [(SUStorePageViewController *)self _setHeaderView:v7];
  }
}

- (double)_expirationTime
{
  id v3 = [(SUStorePageViewController *)self _activePageSection];
  if (!v3) {
    return self->_expirationTime;
  }

  [v3 expirationTime];
  return result;
}

- (void)_fetchPage:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(SUStorePageViewController *)self isSkLoaded] || v3)
  {
    [(SUStorePageViewController *)self setSkLoading:1];
    [(SUStorePageViewController *)self enqueueFetchOperation];
  }
}

- (void)_finishHandlingFailure
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    int v14 = 138543362;
    uint64_t v15 = objc_opt_class();
    LODWORD(v13) = 12;
    CGFloat v12 = &v14;
    uint64_t v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      id v7 = (void *)v6;
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v14, v13);
      free(v7);
      CGFloat v12 = (int *)v8;
      SSFileLog();
    }
  }
  id v9 = (void *)[(SUStorePageViewController *)self presentingViewController];
  uint64_t v10 = (void *)[(SUStorePageViewController *)self _popoverController];
  if (v10)
  {
    [v10 dismissPopoverAnimated:1];
  }
  else if (v9)
  {
    [v9 dismissViewControllerAnimated:1 completion:0];
  }
  objc_msgSend(-[NSObject responderChainProxy:](self, "responderChainProxy:", &unk_26DC6C688), "storePage:finishedWithSuccess:", self, 0);
  id loadBlock = (void (**)(id, void))self->_loadBlock;
  if (loadBlock)
  {
    loadBlock[2](loadBlock, 0);

    self->_id loadBlock = 0;
  }

  self->_pendingWebScriptReloadContext = 0;
}

- (void)_finishSuccessfulLoad
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    int v15 = 138543362;
    uint64_t v16 = objc_opt_class();
    LODWORD(v14) = 12;
    uint64_t v13 = &v15;
    uint64_t v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      id v7 = (void *)v6;
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v15, v14);
      free(v7);
      uint64_t v13 = (int *)v8;
      SSFileLog();
    }
  }
  -[SUStorePageViewController _setPendingChildViewController:](self, "_setPendingChildViewController:", 0, v13);
  [(SUStorePageViewController *)self setSkLoading:0];
  self->_BOOL reloadOnAppear = 0;
  [(SUStorePageViewController *)self _applyPropertiesToViewController:self->_activeChildViewController];
  if ((_finishSuccessfulLoad_sDidFinishOnce & 1) == 0)
  {
    id v9 = (void *)[MEMORY[0x263F1C408] sharedApplication];
    if ([v9 shouldRecordExtendedLaunchTime]) {
      objc_msgSend(v9, "finishedTest:extraResults:", objc_msgSend(v9, "_launchTestName"), 0);
    }
    _finishSuccessfulLoad_sDidFinishOnce = 1;
  }
  objc_msgSend(-[NSObject responderChainProxy:](self, "responderChainProxy:", &unk_26DC6C688), "storePage:finishedWithSuccess:", self, 1);
  id loadBlock = (void (**)(id, uint64_t))self->_loadBlock;
  if (loadBlock)
  {
    loadBlock[2](loadBlock, 1);

    self->_id loadBlock = 0;
  }
  pendingWebScriptReloadContext = self->_pendingWebScriptReloadContext;
  if (pendingWebScriptReloadContext)
  {
    CGFloat v12 = pendingWebScriptReloadContext;

    self->_pendingWebScriptReloadContext = 0;
    [(SUStorePageViewController *)self _requestWebScriptReloadWithContext:v12];
  }
}

- (CGRect)_frameForActiveViewController
{
  uint64_t v3 = [(SUStorePageViewController *)self view];
  if (v3)
  {
    int v4 = (void *)v3;
    objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "bounds");
    double v6 = v5;
    double MaxY = v7;
    double v10 = v9;
    double v12 = v11;
    if (![(UIViewController *)self->_activeChildViewController canDisplaySectionGroup:self->_sectionsGroup]&& [(SUSegmentedControl *)self->_segmentedControl isDescendantOfView:v4])
    {
      [(SUSegmentedControl *)self->_segmentedControl frame];
      double MaxY = CGRectGetMaxY(v17);
      [v4 bounds];
      double v12 = CGRectGetHeight(v18) - MaxY;
    }
  }
  else
  {
    double v6 = *MEMORY[0x263F001A8];
    double MaxY = *(double *)(MEMORY[0x263F001A8] + 8);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v13 = v6;
  double v14 = MaxY;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_handleFailureWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  self->_lastLoadDidFail = 1;
  self->_BOOL reloadOnAppear = 1;
  [(SUStorePageViewController *)self setSkLoading:0];
  [(SUStorePageViewController *)self handleFailureWithError:a3];
  if ([(NSArray *)[(SUViewController *)self _pendingDialogs] count]
    || [+[SUDialogManager sharedInstance] numberOfPendingDialogs])
  {
    double v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v17 = 138543874;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = 2048;
      NSUInteger v20 = [(NSArray *)[(SUViewController *)self _pendingDialogs] count];
      __int16 v21 = 2048;
      int64_t v22 = [+[SUDialogManager sharedInstance] numberOfPendingDialogs];
      LODWORD(v15) = 32;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        double v9 = (void *)v8;
        objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v17, v15);
        free(v9);
        SSFileLog();
      }
    }
  }
  else
  {
    BOOL v10 = [(SUClientInterface *)[(SUViewController *)self clientInterface] showDialogOnError];
    if (a3 && v10)
    {
      double v11 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v12 = objc_msgSend(MEMORY[0x263F1C3F8], "alertControllerWithTitle:message:preferredStyle:", objc_msgSend(v11, "localizedStringForKey:value:table:", @"GENERIC_ERROR", &stru_26DB8C5F8, 0), 0, 1);
      double v13 = (void *)MEMORY[0x263F1C3F0];
      uint64_t v14 = [v11 localizedStringForKey:@"OK" value:&stru_26DB8C5F8 table:0];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __53__SUStorePageViewController__handleFailureWithError___block_invoke;
      v16[3] = &unk_264812880;
      v16[4] = self;
      objc_msgSend(v12, "addAction:", objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v16));
      [(SUStorePageViewController *)self presentViewController:v12 animated:1 completion:0];
    }
    else
    {
      [(SUStorePageViewController *)self _finishHandlingFailure];
    }
  }
}

uint64_t __53__SUStorePageViewController__handleFailureWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishHandlingFailure];
}

- (void)_handleViewControllerBecameReady:(id)a3
{
  double v5 = (void *)[a3 storePageProtocol];
  if ([v5 shouldDisplayInOverlay]
    && ![(UIViewController *)self overlayViewController]
    && [(SUStorePageViewController *)self canMoveToOverlay])
  {
    [(SUStorePageViewController *)self _verifyStorePageProtocol:v5];
    [(SUStorePageViewController *)self _moveToRootSectionForChildViewController:a3 protocol:v5];
    [(SUStorePageViewController *)self _moveChildViewController:a3 toOverlayForProtocol:v5];
  }
  else
  {
    [(SUStorePageViewController *)self _setActiveChildViewController:a3 shouldTearDown:1];
    [(SUStorePageViewController *)self _finishSuccessfulLoad];
    [(SUStorePageViewController *)self storePageProtocolDidChange];
  }

  [(SUStorePageViewController *)self _reloadPreviewOverlayVisibility];
}

- (BOOL)_isInTransientViewController
{
  uint64_t v3 = objc_msgSend((id)-[SUStorePageViewController tabBarController](self, "tabBarController"), "transientViewController");
  if (v3)
  {
    LOBYTE(v3) = [(UIViewController *)self isDescendantOfViewController:v3];
  }
  return v3;
}

- (void)_logInternalEventWithOperation:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!self->_didRecordLoggingEvent)
  {
    self->_didRecordLoggingEvent = 1;
    double v5 = (void *)[MEMORY[0x263F89540] sharedCache];
    int v6 = objc_msgSend(v5, "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0));
    int v7 = SSIsInternalBuild();
    uint64_t v8 = (void *)[v6 valueForKey:@"samplePercentWebInternalLogging"];
    if (objc_opt_respondsToSelector())
    {
      [v8 doubleValue];
      double v10 = v9;
    }
    else
    {
      double v10 = v7 ? 1.0 : 0.1;
    }
    double v11 = drand48();
    if (v11 >= 0.0 && v11 <= 1.0 && v11 <= v10)
    {
      double v12 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v13 = [v12 shouldLog];
      if ([v12 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v14 &= 2u;
      }
      if (v14)
      {
        int v22 = 138412290;
        uint64_t v23 = objc_opt_class();
        LODWORD(v21) = 12;
        uint64_t v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          double v16 = (void *)v15;
          objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v22, v21);
          free(v16);
          SSFileLog();
        }
      }
      int v17 = (void *)[objc_alloc(MEMORY[0x263F27D68]) initWithSubsystem:@"iTunesStoreUI", objc_msgSend(NSString, "stringWithFormat:", @"%@:%@", objc_opt_class(), -[SUClientInterface hostApplicationIdentifier](-[SUViewController clientInterface](self, "clientInterface"), "hostApplicationIdentifier")), 0 category error];
      uint64_t v18 = NSString;
      __int16 v19 = objc_msgSend((id)objc_msgSend(a3, "requestProperties"), "URL");
      [v17 setErrorMessage:objc_msgSend(v18, "stringWithFormat:", @"%@", objc_msgSend(v19, "ams_URLByReplaceingQueryParameters:", MEMORY[0x263EFFA78]))];
      NSUInteger v20 = (void *)[objc_alloc(MEMORY[0x263F89458]) initWithURLBag:v6];
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F27D40], "internalInstanceUsingBag:", v20), "enqueueEvent:", v17);
    }
  }
}

- (void)_moveChildViewController:(id)a3 toOverlayForProtocol:(id)a4
{
  if (self->_activeChildViewController == a3)
  {
    [a3 storePageCleanupBeforeTearDown];
    [(SUViewController *)self->_activeChildViewController _setExistingNavigationItem:0];
    [(SUViewController *)self->_activeChildViewController _setExistingTabBarItem:0];
    int v7 = self->_activeChildViewController;
    self->_activeChildViewController = 0;
  }
  if ([a3 isViewLoaded]) {
    objc_msgSend((id)objc_msgSend(a3, "view"), "removeFromSuperview");
  }
  [(SUStorePageViewController *)self removeChildViewController:a3];
  id v15 = objc_alloc_init((Class)objc_opt_class());
  [v15 _setActiveChildViewController:a3 shouldTearDown:1];
  objc_msgSend(v15, "setAuthenticationContext:", -[SUStorePageViewController authenticationContext](self, "authenticationContext"));
  objc_msgSend(v15, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  objc_msgSend(v15, "setNeedsAuthentication:", -[SUStorePageViewController needsAuthentication](self, "needsAuthentication"));
  [v15 setURLRequestProperties:self->_urlRequestProperties];
  objc_msgSend((id)objc_msgSend(v15, "navigationItem"), "mergeValuesFromItem:", objc_msgSend(a3, "navigationItem"));
  objc_msgSend(a3, "_setExistingNavigationItem:", objc_msgSend(v15, "navigationItem"));
  objc_msgSend(a3, "_setExistingTabBarItem:", objc_msgSend(v15, "_existingTabBarItem"));
  id v8 = +[SUClientDispatch overlayConfigurationForStorePage:v15];
  if (v8)
  {
    id v9 = v8;
    double v10 = [[SUNavigationController alloc] initWithRootViewController:v15];
    [(SUNavigationController *)v10 setClientInterface:[(SUViewController *)self clientInterface]];
    [(UIViewController *)self presentViewController:v10 inOverlayWithConfiguration:v9];
  }
  else
  {
    double v10 = objc_alloc_init(SUOverlayViewController);
    [(SUNavigationController *)v10 setClientInterface:[(SUViewController *)self clientInterface]];
    if ([(SUViewController *)self navigationController])
    {
      double v11 = [[SUNavigationController alloc] initWithRootViewController:v15];
      [(SUNavigationController *)v11 setClientInterface:[(SUViewController *)self clientInterface]];
      [(SUNavigationController *)v11 setNavigationBarHidden:1];
      [(SUNavigationController *)v10 setBackViewController:v11];
    }
    else
    {
      [(SUNavigationController *)v10 setBackViewController:v15];
    }
    [(UIViewController *)self presentOverlayViewController:v10 withTransition:0];
  }

  objc_msgSend(-[UIViewController overlayBackgroundViewController](self, "overlayBackgroundViewController"), "populateNavigationHistoryWithItems:", objc_msgSend(a4, "navigationHistoryItems"));
  double v12 = (void *)[a4 overlayBackgroundURLRequestProperties];
  [(SUStorePageViewController *)self _finishSuccessfulLoad];
  [(SUStorePageViewController *)self showPlaceholderViewController];
  if (v12)
  {

    self->_urlRequestProperties = (SSMutableURLRequestProperties *)[v12 mutableCopy];
    [(SUStorePageViewController *)self _fetchPage:0];
  }
  else
  {
    int v13 = (void *)[(SUStorePageViewController *)self tabBarController];
    if (-[UIViewController isDescendantOfViewController:](self, "isDescendantOfViewController:", [v13 transientViewController]))
    {
      int v14 = self;
      [v13 setTransientViewController:0 animated:0];
    }
    else if ([(SUStorePageViewController *)self _popoverController])
    {
      objc_msgSend((id)-[SUStorePageViewController _popoverController](self, "_popoverController"), "dismissPopoverAnimated:", 0);
    }
    else
    {
      [(SUStorePageViewController *)self setURLRequestProperties:0];
    }
  }
}

- (void)_moveToRootSectionForChildViewController:(id)a3 protocol:(id)a4
{
  if ([(SUStorePageViewController *)self isExternalRequest])
  {
    if (+[SUClientDispatch isTabBarControllerLoaded])
    {
      id v7 = +[SUClientDispatch tabBarController];
      if ([(UIViewController *)self isDescendantOfViewController:v7])
      {
        char v8 = [a3 hasDisplayableContent];
        uint64_t v9 = [a4 rootSectionIdentifier];
        if (v9)
        {
          uint64_t v10 = v9;
          if (v8)
          {
            if ([a4 shouldReplaceRootViewController])
            {
              [v7 setTransientViewController:self onSectionWithIdentifier:v10];
            }
            else
            {
              [v7 pushTransientViewController:self onSectionWithIdentifier:v10];
            }
          }
          else
          {
            [v7 setSelectedIdentifier:v9];
          }
        }
        else if ((v8 & 1) == 0)
        {
          [v7 selectDefaultSection];
        }
      }
    }
  }
}

- (id)_newBarButtonItemsWithButtonItems:(id)a3 replacingItemWithTag:(int64_t)a4 withButtonItem:(id)a5
{
  id v7 = (void *)[a3 mutableCopy];
  id v8 = v7;
  if (a5)
  {
    if (!v7) {
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    if (![v8 count]) {
      goto LABEL_15;
    }
    uint64_t v9 = 0;
    while (objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v9), "tag") != a4)
    {
      if (++v9 >= (unint64_t)[v8 count]) {
        goto LABEL_15;
      }
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      [v8 replaceObjectAtIndex:v9 withObject:a5];
    }
    else {
LABEL_15:
    }
      [v8 addObject:a5];
  }
  else if ([v7 count])
  {
    uint64_t v10 = 0;
    while (objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v10), "tag") != a4)
    {
      if (++v10 >= (unint64_t)[v8 count]) {
        return v8;
      }
    }
    [v8 removeObjectAtIndex:v10];
  }
  return v8;
}

- (id)_newSegmentedControlWithItems:(id)a3
{
  id v5 = [(SUStorePageViewController *)self copyObjectForScriptFromPoolWithClass:objc_opt_class()];
  objc_msgSend(v5, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  [v5 setItems:a3];
  return v5;
}

- (void)_performActionForProtocolButton:(id)a3
{
  id v5 = (void *)[a3 buttonTarget];
  if ([v5 isEqualToString:@"external"])
  {
    uint64_t v6 = [a3 URL];
    id v7 = [(SUViewController *)self clientInterface];
    SUOpenExternalURL(v6, v7);
  }
  else
  {
    if ([v5 isEqualToString:@"self"])
    {
      id v10 = (id)[(SSMutableURLRequestProperties *)self->_urlRequestProperties mutableCopy];
      objc_msgSend(v10, "setURLs:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", objc_msgSend(a3, "URL"), 0));
      [(SUStorePageViewController *)self reloadWithURLRequestProperties:v10];
    }
    else
    {
      int v8 = [v5 isEqualToString:@"account"];
      id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F7B368]), "initWithURL:", objc_msgSend(a3, "URL"));
      if (v8)
      {
        uint64_t v9 = objc_alloc_init(SUAccountViewController);
        [(SUViewController *)v9 setClientInterface:[(SUViewController *)self clientInterface]];
        [(SUStorePageViewController *)v9 setURLRequestProperties:v10];
        +[SUClientDispatch enterAccountFlowWithViewController:v9 animated:1];
      }
      else
      {
        uint64_t v9 = (SUAccountViewController *)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", -[UIViewController section](self, "section"));
        [(SUViewController *)v9 setClientInterface:[(SUViewController *)self clientInterface]];
        [(SUStorePageViewController *)v9 setURLRequestProperties:v10];
        [(SUStorePageViewController *)self pushStorePage:v9 withTarget:0 animated:1];
      }
    }
  }
}

- (void)_reloadBackgroundViewProperties
{
  uint64_t v3 = (void *)[(SUStorePageViewController *)self view];
  id v7 = [(SUStorePageViewController *)self copyScriptProperties];
  if ([v7 usesBlurredBackground])
  {
    backdropView = self->_backdropView;
    if (!backdropView)
    {
      backdropView = (_UIBackdropView *)[objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:2020];
      self->_backdropView = backdropView;
    }
    [v3 setBackdropView:backdropView];
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
    [v3 setOpaque:0];
  }
  else
  {
    id v5 = (void *)[v7 backgroundColor];
    if (!v5) {
      id v5 = (void *)[MEMORY[0x263F1C550] systemBackgroundColor];
    }
    [v3 setBackgroundColor:v5];
    [v5 alphaComponent];
    [v3 setOpaque:v6 == 1.0];
    [v3 setBackdropView:0];

    self->_backdropView = 0;
  }
}

- (void)_reloadForAppearance:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v4 = [(SUStorePageViewController *)self _reloadsWhenCacheExpired];
  if ([(SUStorePageViewController *)self presentedViewController])
  {
    BOOL v4 = 0;
  }
  else if (![(UIViewController *)self overlayViewController] {
         && [(UIViewController *)self overlayBackgroundViewController])
  }
  {
    BOOL v4 = 0;
  }
  BOOL v5 = [(SUStorePageViewController *)self _sectionIsNetworkConstrained];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newNetworkLockoutViewControllerWithSection:", -[UIViewController section](self, "section"));
    objc_msgSend(v7, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    objc_msgSend(v7, "_setExistingNavigationItem:", -[SUViewController navigationItem](self, "navigationItem"));
    [(SUStorePageViewController *)self _setActiveChildViewController:v7 shouldTearDown:1];

    goto LABEL_28;
  }
  if ([(UIViewController *)self->_activeChildViewController viewIsReady] && !self->_reloadOnAppear)
  {
    if (v4 && [(SUStorePageViewController *)self _isCacheExpired])
    {
      id v10 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v12 &= 2u;
      }
      if (v12)
      {
        int v19 = 138412546;
        uint64_t v20 = objc_opt_class();
        __int16 v21 = 2112;
        id v22 = [(SUStorePageViewController *)self displayedURL];
        LODWORD(v18) = 22;
        int v17 = &v19;
        uint64_t v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          int v14 = (void *)v13;
          uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v19, v18);
          free(v14);
          int v17 = (int *)v15;
          SSFileLog();
        }
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "distantFuture", v17), "timeIntervalSinceReferenceDate");
      self->_expirationTime = v16;
      objc_msgSend(-[SUStorePageViewController _activePageSection](self, "_activePageSection"), "setExpirationTime:", self->_expirationTime);
      -[SSMutableURLRequestProperties setURLs:](self->_urlRequestProperties, "setURLs:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", -[SUStorePageViewController displayedURL](self, "displayedURL"), 0));
      [(SUStorePageViewController *)self _reloadWithURLRequestProperties:self->_urlRequestProperties preserveSectionControl:1];
      if (self->_reloadOnAppear)
      {
        int v8 = self;
        uint64_t v9 = 0;
        goto LABEL_13;
      }
    }
  }
  else
  {
    if ([(SUStorePageViewController *)self _shouldFetchAutomatically]
      && [(SUStorePageViewController *)self canBeResolved])
    {
      [(SUStorePageViewController *)self setSkLoading:1];
      int v8 = self;
      uint64_t v9 = 1;
LABEL_13:
      [(SUStorePageViewController *)v8 _fetchPage:v9];
      goto LABEL_28;
    }
    if ([(SUStorePageViewController *)self _shouldShowPlaceholderForEmptyPage]) {
      [(SUStorePageViewController *)self showPlaceholderViewController];
    }
  }
LABEL_28:
  self->_BOOL reloadOnAppear = v6;
}

- (void)_reloadNavigationBar
{
  [(SUStorePageViewController *)self _reloadNavigationButtons];
  [(SUStorePageViewController *)self _reloadNavigationMenus];
  if (self->_sectionsGroup)
  {
    -[SUStorePageViewController _reloadSectionsControlWithGroup:](self, "_reloadSectionsControlWithGroup:");
  }
  else
  {
    segmentedControl = self->_segmentedControl;
    if (segmentedControl)
    {
      BOOL v4 = segmentedControl;
      [(SUStorePageViewController *)self _setSegmentedControl:0];
      [(SUStorePageViewController *)self _setSegmentedControl:v4];
    }
  }
}

- (void)_reloadNavigationButtons
{
  id v3 = [(SUStorePageViewController *)self storePageProtocol];
  BOOL v4 = (SUBarButtonItem *)[v3 navigationButtonForLocation:@"left"];
  if (v4) {
    BOOL v4 = [[SUBarButtonItem alloc] initWithTitle:[(SUBarButtonItem *)v4 buttonTitle] style:0 target:self action:sel__navigationButtonAction_];
  }
  BOOL v5 = (void *)[v3 navigationButtonForLocation:@"right"];
  if (v5) {
    id v7 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", [v5 buttonTitle], 0, self, sel__navigationButtonAction_);
  }
  else {
    id v7 = 0;
  }
  BOOL v6 = [(SUClientInterface *)[(SUViewController *)self clientInterface] appearance];
  [(SUUIAppearance *)v6 styleBarButtonItem:v4];
  [(SUUIAppearance *)v6 styleBarButtonItem:v7];
  [(SUStorePageViewController *)self _setLeftNavigationItem:v4 forTag:1851944034];
  [(SUStorePageViewController *)self _setRightNavigationItem:v7 forTag:1851945570];
}

- (void)_reloadNavigationMenus
{
  id v3 = [(SUStorePageViewController *)self storePageProtocol];
  BOOL v4 = (void *)[v3 navigationMenuForLocation:0];
  if (v4)
  {
    BOOL v5 = v4;
    uint64_t v6 = [v4 closedTitle];
    if (!v6) {
      uint64_t v6 = [v5 openTitle];
    }
    id v7 = [[SUBarButtonItem alloc] initWithTitle:v6 style:0 target:self action:sel__navigationMenuButtonAction_];
  }
  else
  {
    id v7 = 0;
  }
  int v8 = (void *)[v3 navigationMenuForLocation:1];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = [v8 closedTitle];
    if (!v10) {
      uint64_t v10 = [v9 openTitle];
    }
    int v12 = [[SUBarButtonItem alloc] initWithTitle:v10 style:0 target:self action:sel__navigationMenuButtonAction_];
  }
  else
  {
    int v12 = 0;
  }
  int v11 = [(SUClientInterface *)[(SUViewController *)self clientInterface] appearance];
  [(SUUIAppearance *)v11 styleBarButtonItem:v7];
  [(SUUIAppearance *)v11 styleBarButtonItem:v12];
  [(SUStorePageViewController *)self _setLeftNavigationItem:v7 forTag:1852664930];
  [(SUStorePageViewController *)self _setRightNavigationItem:v12 forTag:1852666466];
}

- (void)_reloadPreviewOverlayVisibility
{
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
  {
    UIScrollView = SUViewFirstUIScrollView([(SUViewController *)self->_activeChildViewController view]);
    activeChildViewController = self->_activeChildViewController;
    +[SUPreviewOverlayViewController offsetScrollView:UIScrollView forViewController:activeChildViewController];
  }
}

- (void)_reloadSearchFieldWithSection:(id)a3
{
  BOOL v5 = [(SUViewController *)self navigationItem];
  uint64_t v6 = (void *)[a3 searchFieldConfiguration];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 location];
    BOOL v9 = [(SUStorePageViewController *)self _shouldDisplayControlsInNavigationBar];
    BOOL v10 = v8 != 2
       && ([(UIViewController *)self isRootViewController]
        || ([v7 isRootViewOnly] & 1) == 0)
       && (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom")
        || !-[UIViewController isDescendantOfViewController:](self, "isDescendantOfViewController:", objc_msgSend((id)-[SUStorePageViewController tabBarController](self, "tabBarController"), "transientViewController")))&& -[UIViewController overlayViewController](self, "overlayViewController") == 0;
  }
  else
  {
    BOOL v9 = [(SUStorePageViewController *)self _shouldDisplayControlsInNavigationBar];
    BOOL v10 = 0;
    uint64_t v8 = 2;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom")) {
    int v11 = v9;
  }
  else {
    int v11 = v10 && v9;
  }
  int v12 = [(SUSearchFieldController *)self->_searchFieldController searchBar];
  id v13 = [(SUStorePageViewController *)self navigationItemForScriptInterface];
  int v14 = v13;
  if (!v10 || !v9 || v8 != 1)
  {
    if (-[UISearchBar isDescendantOfView:](v12, "isDescendantOfView:", objc_msgSend((id)objc_msgSend(v13, "leftBarButtonItem"), "customView")))objc_msgSend(v14, "setLeftBarButtonItem:", 0); {
    if (!v8 && v10 && v9)
    }
      goto LABEL_63;
  }
  if (-[UISearchBar isDescendantOfView:](v12, "isDescendantOfView:", [v14 titleView])) {
    [v14 setTitleView:0];
  }
  if (v8 != 3 || !v10 || !v9)
  {
LABEL_63:
    if (-[UISearchBar isDescendantOfView:](v12, "isDescendantOfView:", objc_msgSend((id)objc_msgSend(v14, "rightBarButtonItem"), "customView")))objc_msgSend(v14, "setRightBarButtonItem:", 0); {
  }
    }
  if ((!v10 || v9)
    && [(SUStorePageViewController *)self isViewLoaded]
    && v12 == (UISearchBar *)objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "headerView"))
  {
    [(SUStorePageViewController *)self _setHeaderView:0];
  }
  searchFieldController = self->_searchFieldController;
  if (searchFieldController
    && [(SUSearchFieldController *)searchFieldController searchFieldStyle] != v24)
  {
    uint64_t v18 = (UISearchBar *)objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "headerView");
    if (v18 == [(SUSearchFieldController *)self->_searchFieldController searchBar]) {
      [(SUStorePageViewController *)self _setHeaderView:0];
    }

    self->_searchFieldController = 0;
  }
  int v19 = self->_searchFieldController;
  if (v7)
  {
    if (!v19)
    {
      int v19 = [[SUSearchFieldController alloc] initWithContentsController:self clientInterface:[(SUViewController *)self clientInterface] style:v24];
      self->_searchFieldController = v19;
    }
    [(SUSearchFieldController *)v19 setSearchFieldConfiguration:v7];
    uint64_t v20 = self->_searchFieldController;
  }
  else
  {

    uint64_t v20 = 0;
    self->_searchFieldController = 0;
  }
  __int16 v21 = [(SUSearchFieldController *)v20 searchBar];
  [(UISearchBar *)v21 setAlpha:1.0];
  char v22 = !v10;
  if (!v21) {
    char v22 = 1;
  }
  if ((v22 & 1) == 0)
  {
    if (v9)
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1)
      {
        if ((_UIApplicationUsesLegacyUI() & 1) == 0) {
          [(UISearchBar *)v21 setBarStyle:[(SUViewController *)self ITunesStoreUIBarStyle] == 2];
        }
        uint64_t v23 = [[SUBarButtonItem alloc] initWithCustomView:v21];
        [(SUUIAppearance *)[(SUClientInterface *)[(SUViewController *)self clientInterface] appearance] styleBarButtonItem:v23];
        switch(v8)
        {
          case 3:
            [v14 setRightBarButtonItem:v23];
            break;
          case 1:
            [v14 setLeftBarButtonItem:v23];
            break;
          case 0:
            [v14 setTitleView:v21];
            break;
        }
      }
    }
    else if ([(SUStorePageViewController *)self isViewLoaded])
    {
      [(SUStorePageViewController *)self _setHeaderView:v21];
    }
  }
  if (v5 != [(SUViewController *)self navigationItem])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__SUStorePageViewController__reloadSearchFieldWithSection___block_invoke;
    block[3] = &unk_264812130;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __59__SUStorePageViewController__reloadSearchFieldWithSection___block_invoke(uint64_t a1)
{
  CFAbsoluteTime v2 = (void *)[*(id *)(a1 + 32) navigationController];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "navigationController"), "viewControllers");

  return [v2 setViewControllers:v3 animated:0];
}

- (void)_reloadSectionButtons
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [(UIViewController *)self section];
  if (v3)
  {
    BOOL v4 = v3;
    if ([(UIViewController *)self isRootViewController])
    {
      if (![(SUStorePageViewController *)self _isInTransientViewController])
      {
        id v5 = [(SUStorePageViewController *)self navigationItemForScriptInterface];
        uint64_t v6 = [(SUClientInterface *)[(SUViewController *)self clientInterface] appearance];
        id v7 = (void *)[v4 leftSectionButtons];
        if ([v7 count])
        {
          uint64_t v23 = v5;
          id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v29;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v29 != v11) {
                  objc_enumerationMutation(v7);
                }
                id v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
                int v14 = objc_alloc_init(SUBarButtonItem);
                [v13 applyToBarButtonItem:v14];
                [(SUUIAppearance *)v6 styleBarButtonItem:v14];
                SUButtonActionAttachToBarButtonItem(v14);
                [v8 addObject:v14];

                ++v12;
              }
              while (v10 != v12);
              uint64_t v10 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
            }
            while (v10);
          }
          id v5 = v23;
          [v23 setLeftBarButtonItems:v8];
        }
        uint64_t v15 = (void *)[v4 rightSectionButtons];
        if ([v15 count])
        {
          id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v25;
            do
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v15);
                }
                __int16 v21 = *(void **)(*((void *)&v24 + 1) + 8 * v20);
                char v22 = objc_alloc_init(SUBarButtonItem);
                [v21 applyToBarButtonItem:v22];
                [(SUUIAppearance *)v6 styleBarButtonItem:v22];
                SUButtonActionAttachToBarButtonItem(v22);
                [v16 addObject:v22];

                ++v20;
              }
              while (v18 != v20);
              uint64_t v18 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v18);
          }
          [v5 setRightBarButtonItems:v16];
        }
      }
    }
  }
}

- (void)_reloadSectionsControlWithGroup:(id)a3
{
  pendingChildViewController = self->_pendingChildViewController;
  if (!pendingChildViewController) {
    pendingChildViewController = self->_activeChildViewController;
  }
  if ([(UIViewController *)pendingChildViewController canDisplaySectionGroup:a3])
  {
    uint64_t v6 = (SUStorePageViewController *)pendingChildViewController;
  }
  else
  {
    [(UIViewController *)pendingChildViewController setDisplayedSectionGroup:0];
    uint64_t v6 = self;
  }
  id v7 = [(SUStorePageViewController *)v6 setDisplayedSectionGroup:a3];
  [v7 addTarget:self action:sel__sectionControlAction_ forControlEvents:4096];
  [v7 setSelectedItemIndex:self->_activeSectionIndex];

  [(SUStorePageViewController *)self _setSegmentedControl:v7];
}

- (BOOL)_reloadWithURLRequestProperties:(id)a3 preserveSectionControl:(BOOL)a4
{
  BOOL v4 = a4;
  [(SUViewController *)self cancelOperations];
  [(SUStorePageViewController *)self setSkLoading:0];
  [(SUStorePageViewController *)self setURLRequestProperties:a3];
  if (v4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", self), "_reloadSectionsControlWithGroup:", self->_sectionsGroup);
  }
  else {
    [(SUStorePageViewController *)self reloadForSectionsWithGroup:0];
  }
  [(SUStorePageViewController *)self showPlaceholderViewController];
  [(SUStorePageViewController *)self resetNavigationItem:[(SUStorePageViewController *)self navigationItemForScriptInterface]];
  [(SUViewController *)self resetRestoredContext];
  if ([(SUStorePageViewController *)self _shouldReloadForAppearance])
  {
    [(SUStorePageViewController *)self _fetchPage:0];
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  self->_BOOL reloadOnAppear = v7;
  return 1;
}

- (void)_renderStorePage:(id)a3 withType:(int64_t)a4 viewController:(id)a5 block:(id)a6
{
  [(SUStorePageViewController *)self addChildViewController:a5];
  [(SUStorePageViewController *)self _applyPropertiesToViewController:a5];
  uint64_t v10 = [(SUViewController *)self navigationItem];
  -[UINavigationItem mergeValuesFromItem:](v10, "mergeValuesFromItem:", [a5 navigationItem]);
  [a5 _setExistingNavigationItem:v10];
  objc_msgSend(a5, "_setExistingTabBarItem:", -[SUStorePageViewController _existingTabBarItem](self, "_existingTabBarItem"));
  uint64_t v11 = (void *)[a5 view];
  objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "bounds");
  objc_msgSend(v11, "setFrame:");
  if ([(SUViewController *)self _restoredContext])
  {
    objc_msgSend(a5, "restoreArchivableContext:", -[SUViewController _restoredContext](self, "_restoredContext"));
    [(SUViewController *)self resetRestoredContext];
  }
  [(SUStorePageViewController *)self setSkLoading:1];
  (*((void (**)(id))a6 + 2))(a6);
  char v12 = [a5 viewIsReady];
  self->_int64_t pageType = a4;
  if (v12)
  {
    [(SUStorePageViewController *)self _handleViewControllerBecameReady:a5];
  }
  else
  {
    [(SUStorePageViewController *)self _setPendingChildViewController:a5];
  }
}

- (void)_repositionForChildViewController:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(SUStorePageViewController *)self isExternalRequest])
  {
    id v5 = (void *)[a3 storePageProtocol];
    [(SUStorePageViewController *)self _moveToRootSectionForChildViewController:a3 protocol:v5];
    if ([a3 hasDisplayableContent])
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
      BOOL v7 = [(SUViewController *)self clientInterface];
      id v8 = [(SUViewController *)self viewControllerFactory];
      uint64_t v18 = self;
      id v9 = [(UIViewController *)self section];
      uint64_t v10 = (void *)[v5 navigationHistoryItems];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
            id v16 = (void *)[v8 newStorePageViewControllerWithSection:v9];
            [v16 setClientInterface:v7];
            objc_msgSend(v16, "setTitle:", objc_msgSend(v15, "title"));
            objc_msgSend(v16, "setURLRequestProperties:", objc_msgSend(v15, "URLRequestProperties"));
            [v6 addObject:v16];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }
      if ([v6 count])
      {
        id v17 = [(SUViewController *)v18 navigationController];
        objc_msgSend(v6, "addObject:", objc_msgSend(v17, "topViewController"));
        [v17 setViewControllers:v6 animated:0];
      }
    }
  }
}

- (void)_requestWebScriptReloadWithContext:(id)a3
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  activeChildViewController = self->_activeChildViewController;
  if (isKindOfClass)
  {
    [(SUViewController *)activeChildViewController _requestWebScriptReloadWithContext:a3];
  }
  else
  {
    NSLog(&cfstr_RequestingAWeb.isa, self->_activeChildViewController);
  }
}

- (BOOL)_sectionIsNetworkConstrained
{
  id v2 = [(UIViewController *)self section];
  if (v2)
  {
    uint64_t v3 = [v2 minimumNetworkType];
    LOBYTE(v2) = v3 > objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "networkType");
  }
  return (char)v2;
}

- (void)_setActiveChildViewController:(id)a3 shouldTearDown:(BOOL)a4
{
  if (self->_activeChildViewController != a3)
  {
    BOOL v4 = a4;
    int v7 = [(SUStorePageViewController *)self isViewLoaded];
    activeChildViewController = self->_activeChildViewController;
    if (!activeChildViewController) {
      goto LABEL_10;
    }
    if (v7)
    {
      [(SUViewController *)activeChildViewController viewWillDisappear:0];
      activeChildViewController = self->_activeChildViewController;
    }
    if (v4)
    {
      [(UIViewController *)activeChildViewController storePageCleanupBeforeTearDown];
      activeChildViewController = self->_activeChildViewController;
    }
    [(SUViewController *)activeChildViewController _setExistingNavigationItem:0];
    [(SUViewController *)self->_activeChildViewController _setExistingTabBarItem:0];
    [(SUStorePageViewController *)self removeChildViewController:self->_activeChildViewController];
    activeChildViewController = self->_activeChildViewController;
    if (v7)
    {
      id v12 = (id)[(SUViewController *)activeChildViewController contentScrollView];
      objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "setContentView:", 0);
      objc_msgSend((id)-[SUViewController view](self->_activeChildViewController, "view"), "removeFromSuperview");
      [(SUViewController *)self->_activeChildViewController viewDidDisappear:0];
      activeChildViewController = self->_activeChildViewController;
    }
    else
    {
LABEL_10:
      id v12 = 0;
    }

    self->_activeChildViewController = (SUViewController *)a3;
    id v9 = [(SUStorePageViewController *)self navigationItemForScriptInterface];
    if (self->_activeChildViewController)
    {
      -[SUStorePageViewController addChildViewController:](self, "addChildViewController:");
      if (v7)
      {
        uint64_t v10 = (void *)[(SUViewController *)self->_activeChildViewController view];
        [(SUStorePageViewController *)self _frameForActiveViewController];
        objc_msgSend(v10, "setFrame:");
        [(SUViewController *)self->_activeChildViewController viewWillAppear:0];
        objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "setContentView:", -[SUViewController view](self->_activeChildViewController, "view"));
        [(SUViewController *)self->_activeChildViewController viewDidAppear:0];
      }
      [(SUViewController *)self->_activeChildViewController setSkLoading:[(SUStorePageViewController *)self isSkLoaded]];
      uint64_t v11 = [(SUViewController *)self->_activeChildViewController title];
      if (v11) {
        objc_msgSend(-[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface"), "setTitle:", v11);
      }
      if ([(SUViewController *)self _cachedScriptProperties]) {
        [(SUViewController *)self->_activeChildViewController setScriptProperties:[(SUViewController *)self _cachedScriptProperties]];
      }
    }
    else
    {
      [(SUStorePageViewController *)self resetNavigationItem:v9];
    }
  }
}

- (void)_setLeftNavigationItem:(id)a3 forTag:(int64_t)a4
{
  id v7 = [(SUStorePageViewController *)self navigationItemForScriptInterface];
  id v8 = -[SUStorePageViewController _newBarButtonItemsWithButtonItems:replacingItemWithTag:withButtonItem:](self, "_newBarButtonItemsWithButtonItems:replacingItemWithTag:withButtonItem:", [v7 leftBarButtonItems], a4, a3);
  [a3 setTag:a4];
  [v7 setLeftBarButtonItems:v8];
}

- (void)_setPendingChildViewController:(id)a3
{
  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController != a3)
  {
    if (pendingChildViewController && pendingChildViewController != self->_activeChildViewController)
    {
      -[SUStorePageViewController removeChildViewController:](self, "removeChildViewController:");
      pendingChildViewController = self->_pendingChildViewController;
    }
    [(SUViewController *)pendingChildViewController removeObserver:self forKeyPath:@"viewIsReady"];

    id v6 = (SUViewController *)a3;
    self->_pendingChildViewController = v6;
    [(SUViewController *)v6 addObserver:self forKeyPath:@"viewIsReady" options:0 context:0];
  }
}

- (void)_setRightNavigationItem:(id)a3 forTag:(int64_t)a4
{
  id v7 = [(SUStorePageViewController *)self navigationItemForScriptInterface];
  id v8 = -[SUStorePageViewController _newBarButtonItemsWithButtonItems:replacingItemWithTag:withButtonItem:](self, "_newBarButtonItemsWithButtonItems:replacingItemWithTag:withButtonItem:", [v7 rightBarButtonItems], a4, a3);
  [a3 setTag:a4];
  [v7 setRightBarButtonItems:v8];
}

- (BOOL)_shouldFetchAutomatically
{
  return ![(UIViewController *)self isRootViewController]
      || objc_msgSend(-[UIViewController section](self, "section"), "type") != 1
      || [(SSMutableURLRequestProperties *)self->_urlRequestProperties URL]
      || objc_msgSend((id)-[SSMutableURLRequestProperties requestParameters](self->_urlRequestProperties, "requestParameters"), "count") != 0;
}

- (BOOL)_shouldDisplayControlsInNavigationBar
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
  if (v3 != 1)
  {
    if ([(UIViewController *)self isInMoreList])
    {
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    id v4 = [(SUViewController *)self navigationController];
    if (!v4
      || ((uint64_t v5 = [v4 indexOfViewController:self]) == 0
        ? (LOBYTE(v3) = 1)
        : (LOBYTE(v3) = v5 == 0x7FFFFFFFFFFFFFFFLL),
          v5 == 0x7FFFFFFFFFFFFFFFLL || !v5))
    {
      id v6 = [(SUStorePageViewController *)self navigationItemForScriptInterface];
      if ([v6 leftBarButtonItem]) {
        goto LABEL_10;
      }
      LOBYTE(v3) = [v6 rightBarButtonItem] == 0;
    }
  }
  return v3;
}

- (BOOL)_shouldReloadForAppearance
{
  if ([(SUStorePageViewController *)self loadsWhenHidden]) {
    return 1;
  }

  return [(SUViewController *)self isVisible];
}

- (void)_showPlaceholderViewControllerWithTearDown:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUStorePageViewController *)self newPlaceholderViewController];
  objc_msgSend(v5, "_setExistingNavigationItem:", -[SUViewController navigationItem](self, "navigationItem"));
  [(SUStorePageViewController *)self _setActiveChildViewController:v5 shouldTearDown:v3];
}

- (void)_tearDownNavigationMenu
{
  self->_navigationMenuViewController = 0;
  [(UIPopoverController *)self->_navigationMenuPopover setDelegate:0];

  self->_navigationMenuPopover = 0;
}

- (void)_verifyStorePageProtocol:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = (void *)[a3 expectedClientIdentifiers];
  if ([v4 count]
    && ![(SUClientInterface *)[(SUViewController *)self clientInterface] _ignoresExpectedClientsProtocol])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v35;
LABEL_6:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        if (+[SUClientDispatch matchesClientApplication:*(void *)(*((void *)&v34 + 1) + 8 * v8)])
        {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v6) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      id v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v11 &= 2u;
      }
      if (v11)
      {
        uint64_t v12 = objc_opt_class();
        int v39 = 138412546;
        uint64_t v40 = v12;
        __int16 v41 = 2112;
        id v42 = v4;
        LODWORD(v29) = 22;
        long long v28 = &v39;
        uint64_t v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v39, v29);
          free(v14);
          long long v28 = (int *)v15;
          SSFileLog();
        }
      }
      -[UIViewController dismissAnimated:](self, "dismissAnimated:", 0, v28);
      id v16 = [(SUStorePageViewController *)self displayedURL];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v17 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v4);
            }
            uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            if (SUOpenURLInClient((uint64_t)v16, v21, [(SUViewController *)self clientInterface]))
            {
              long long v22 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
              int v23 = [v22 shouldLog];
              if ([v22 shouldLogToDisk]) {
                int v24 = v23 | 2;
              }
              else {
                int v24 = v23;
              }
              if (os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_DEBUG)) {
                int v25 = v24;
              }
              else {
                int v25 = v24 & 2;
              }
              if (v25)
              {
                int v39 = 138412546;
                uint64_t v40 = v21;
                __int16 v41 = 2112;
                id v42 = v16;
                LODWORD(v29) = 22;
                uint64_t v26 = _os_log_send_and_compose_impl();
                if (v26)
                {
                  long long v27 = (void *)v26;
                  objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v39, v29);
                  free(v27);
                  SSFileLog();
                }
              }
              return;
            }
          }
          uint64_t v18 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
    }
  }
}

- (SUViewController)activeChildViewController
{
  return self->_activeChildViewController;
}

- (BOOL)shouldAdjustContentOffsets
{
  return self->_shouldAdjustContentOffsets;
}

- (void)setShouldAdjustContentOffsets:(BOOL)a3
{
  self->_shouldAdjustContentOffsets = a3;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (SUStorePageViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUStorePageViewControllerDelegate *)a3;
}

- (BOOL)isExternalRequest
{
  return self->_externalRequest;
}

- (void)setExternalRequest:(BOOL)a3
{
  self->_externalRequest = a3;
}

- (BOOL)loadsWhenHidden
{
  return self->_loadsWhenHidden;
}

- (void)setLoadsWhenHidden:(BOOL)a3
{
  self->_loadsWhenHidden = a3;
}

- (BOOL)needsAuthentication
{
  return self->_needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (BOOL)_reloadsWhenCacheExpired
{
  return self->_reloadsWhenCacheExpired;
}

- (void)_setReloadsWhenCacheExpired:(BOOL)a3
{
  self->_reloadsWhenCacheExpired = a3;
}

- (NSString)scriptUserInfo
{
  return self->_scriptUserInfo;
}

- (SUSearchFieldController)searchFieldController
{
  return self->_searchFieldController;
}

- (SUPageSectionGroup)sectionGroup
{
  return self->_sectionsGroup;
}

- (SUSegmentedControl)sectionSegmentedControl
{
  return self->_segmentedControl;
}

- (BOOL)canMoveToOverlay
{
  return self->_canMoveToOverlay;
}

- (void)setCanMoveToOverlay:(BOOL)a3
{
  self->_canMoveToOverlay = a3;
}

- (BOOL)didPageViewLoad
{
  return self->_didPageViewLoad;
}

- (void)setDidPageViewLoad:(BOOL)a3
{
  self->_didPageViewLoad = a3;
}

@end