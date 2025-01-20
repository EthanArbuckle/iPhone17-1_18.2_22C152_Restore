@interface SUUIApplicationController
+ (SUUIConfigurationPreloader)configurationPreloader;
+ (id)_referrerAppForSourceApplication:(id)a3 launchURL:(id *)a4;
+ (id)applicationOptionsWithLaunchOptions:(id)a3;
+ (void)finishedWithConfigurationPreloader;
+ (void)prepareForLaunch;
- (BOOL)URLResolver:(id)a3 shouldPerformDefaultActionForURL:(id)a4;
- (BOOL)_hidesTabBar;
- (BOOL)_isDisplayingAccountViewController;
- (BOOL)_isStoreFront:(id)a3 equalToStoreFront:(id)a4;
- (BOOL)_needsStatusOverlay;
- (BOOL)_playPreviewForPreviewTemplate:(id)a3;
- (BOOL)_sendNativeBackButtonMetricEvents;
- (BOOL)_shouldUseLegacyURLHandlingForExternalURL:(id)a3;
- (BOOL)_usesFloatingStatusOverlayForWidth:(double)a3;
- (BOOL)appIsTrusted;
- (BOOL)appJSURLTrusted;
- (BOOL)mescalPrimeEnabledForXHRRequests;
- (BOOL)shouldIgnoreJSValidation;
- (BOOL)tabBarController:(id)a3 shouldFallbackToRootForController:(id)a4;
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (CGSize)sizeForNavigationDocument:(id)a3;
- (Class)_JSITunesStoreClass;
- (Class)_scrollingTabBarControllerClass;
- (Class)_tabBarControllerClass;
- (NSArray)_navigationControllers;
- (NSArray)tabBarItems;
- (SUUIApplicationController)init;
- (SUUIApplicationController)initWithClientContextClass:(Class)a3;
- (SUUIApplicationController)initWithClientContextClass:(Class)a3 options:(id)a4;
- (SUUIApplicationController)initWithClientContextClass:(Class)a3 tabBarControllerStyle:(int64_t)a4;
- (SUUIApplicationControllerOptions)options;
- (SUUIApplicationDelegate)delegate;
- (SUUIClientContext)clientContext;
- (SUUIModalDocumentController)modalDocumentController;
- (SUUINavigationDocumentController)_transientNavigationController;
- (SUUIPreviewDocumentController)_previewOverlayDocumentController;
- (SUUIScrollingTabBarController)scrollingTabBarController;
- (UITabBarController)tabBarController;
- (UIViewController)rootViewController;
- (id)_activeNavigationController;
- (id)_documentControllerForNavigationController:(id)a3;
- (id)_existingTabBarController;
- (id)_launchOptionsWithURL:(id)a3;
- (id)_navigationContainerViewController;
- (id)_newNavigationControllerWithTabBarItem:(id)a3;
- (id)_operationQueue;
- (id)_overlayNavigationControllerForViewController:(id)a3;
- (id)_rootDocuments;
- (id)_statusOverlayProviderForViewController:(id)a3;
- (id)_tabBarController;
- (id)_transientNavigationDocument;
- (id)activeDocument;
- (id)appIdentifier;
- (id)appJSURL;
- (id)appLaunchParams;
- (id)deviceConfigForContext:(id)a3;
- (id)jsNavigationDocumentForNavigationController:(id)a3 inContext:(id)a4;
- (id)jsNavigationDocumentForNavigationDocumentController:(id)a3 inContext:(id)a4;
- (id)localStorage;
- (id)navigationControllerForContext:(id)a3;
- (id)presentationViewControllerForAppContext:(id)a3;
- (id)selectTabWithIdentifier:(id)a3;
- (id)vendorIdentifier;
- (id)vendorStorage;
- (int64_t)_applicationMode;
- (int64_t)_selectedTabBarIndex;
- (int64_t)modalDocumentController:(id)a3 barStyleForStackItem:(id)a4;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3;
- (void)URLResolver:(id)a3 didFinishWithResult:(BOOL)a4;
- (void)URLResolver:(id)a3 showTransientViewController:(id)a4;
- (void)URLResolver:(id)a3 showURL:(id)a4 withTabIdentifier:(id)a5;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_attemptAMSURLHandlingIfPossibleForExternalURL:(id)a3 fallback:(id)a4;
- (void)_dispatchTabBarOnNeedsContentForTabAtIndex:(unint64_t)a3;
- (void)_dispatchTabBarOnSelect;
- (void)_ensureStackConsistencyForNavigationController:(id)a3;
- (void)_failReloadWithError:(id)a3;
- (void)_failWithError:(id)a3;
- (void)_finishWillResignActiveWithDialogState:(BOOL)a3;
- (void)_fireBlocksAfterLoad;
- (void)_handleScriptUnavailable;
- (void)_invalidateApplication;
- (void)_jsLaunchFinishedWithLaunchMetrics:(id)a3;
- (void)_legacyResolveExternalURL:(id)a3;
- (void)_loadApplicationScript;
- (void)_previewDocumentIsActiveChangeNotification:(id)a3;
- (void)_recordTabBarMetricsEventToSelectViewController:(id)a3;
- (void)_reloadAfterNetworkChange:(id)a3;
- (void)_reloadApplication;
- (void)_reloadRootViewControllers;
- (void)_reloadTabBarWithClientContext:(id)a3;
- (void)_removeObserversForReloadNotifications;
- (void)_removeStatusOverlayFromAllNavigationControllers;
- (void)_resetDocumentControllers;
- (void)_resetUserInterfaceAfterStoreFrontChange;
- (void)_retryAfterFailure;
- (void)_sendClientContextDidChange;
- (void)_sendDidDisplayFirstPageIfNecessary;
- (void)_setClientContextWithDictionary:(id)a3;
- (void)_setHidesTabBar:(BOOL)a3;
- (void)_setSelectedTabBarIndex:(int64_t)a3;
- (void)_showFloatingStatusOverlayAnimated:(BOOL)a3;
- (void)_showStatusOverlayForNavigationController:(id)a3 viewController:(id)a4 animated:(BOOL)a5;
- (void)_startScriptContextWithURL:(id)a3;
- (void)_stopApplication;
- (void)_stopScriptContextForReload;
- (void)_storeFrontChangeNotification:(id)a3;
- (void)_tintTabBarWithViewController:(id)a3;
- (void)_updateOverlayNavigationController:(id)a3;
- (void)appContext:(id)a3 didCompletePurchase:(id)a4;
- (void)appContext:(id)a3 didCompleteSoftwarePurchase:(id)a4;
- (void)appContext:(id)a3 didExitWithOptions:(id)a4;
- (void)appContext:(id)a3 didFailWithError:(id)a4;
- (void)appContext:(id)a3 didStartWithOptions:(id)a4;
- (void)appContext:(id)a3 didStopWithOptions:(id)a4;
- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4;
- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5;
- (void)appContext:(id)a3 setPreviewOverlayDocument:(id)a4 withOptions:(id)a5;
- (void)appContextNeedsRestart:(id)a3;
- (void)application:(id)a3 didReceiveURL:(id)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)dealloc;
- (void)evaluateBlockWhenLoaded:(id)a3;
- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4;
- (void)hideStatusOverlayForProvider:(id)a3 animated:(BOOL)a4;
- (void)loadApplication;
- (void)loadApplicationWithOptions:(id)a3;
- (void)modalDocumentControllerDidFinish:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationDocumentController:(id)a3 requestsAccessToAppContextUsingBlock:(id)a4;
- (void)navigationDocumentStackDidChange:(id)a3;
- (void)recordMetricsEvent:(id)a3 flushImmediately:(BOOL)a4;
- (void)resumeApplicationWithOptions:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMescalPrimeEnabledForXHRRequests:(BOOL)a3;
- (void)setTabBarItems:(id)a3;
- (void)setUserInterfaceOverrideOnTabBarController:(id)a3 forViewController:(id)a4;
- (void)showErrorViewForLaunchFailure;
- (void)showErrorViewWithTitle:(id)a3 message:(id)a4;
- (void)showErrorViewWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6;
- (void)showExternalURL:(id)a3;
- (void)showStatusOverlayUsingProvider:(id)a3 animated:(BOOL)a4;
- (void)showTransientViewController:(id)a3;
- (void)suspendApplicationWithOptions:(id)a3;
- (void)tabBarController:(id)a3 didEndCustomizingViewControllers:(id)a4 changed:(BOOL)a5;
- (void)tabBarController:(id)a3 didReselectViewController:(id)a4;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)tabBarController:(id)a3 willDisplayViewController:(id)a4;
- (void)tabBarController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)updateTabBarWithItems:(id)a3 animated:(BOOL)a4;
- (void)updateTabBarWithItems:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation SUUIApplicationController

- (void)setTabBarItems:(id)a3
{
  if (self->_tabBarItems != a3)
  {
    v4 = (NSArray *)[a3 copy];
    tabBarItems = self->_tabBarItems;
    self->_tabBarItems = v4;

    [(SUUIApplicationController *)self _reloadRootViewControllers];
  }
}

- (SUUIApplicationController)initWithClientContextClass:(Class)a3 options:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SUUIApplicationController;
  v7 = [(SUUIApplicationController *)&v15 init];
  v8 = v7;
  if (v7)
  {
    v7->_clientContextClass = a3;
    uint64_t v9 = [v6 copy];
    options = v8->_options;
    v8->_options = (SUUIApplicationControllerOptions *)v9;

    if (!v8->_options)
    {
      v11 = objc_alloc_init(SUUIApplicationControllerOptions);
      v12 = v8->_options;
      v8->_options = v11;
    }
    v8->_indexOfLastTabNeedingContent = 0x7FFFFFFFFFFFFFFFLL;
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v8 selector:sel__pageDidDisplayNotification_ name:@"SUUIApplicationPageDidDisplayNotification" object:0];
    [v13 addObserver:v8 selector:sel__storeFrontChangeNotification_ name:*MEMORY[0x263F7B4D8] object:0];
    [v13 addObserver:v8 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
    [v13 addObserver:v8 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
  }
  return v8;
}

- (void)_reloadRootViewControllers
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  NSLog(&cfstr_ReloadRootView.isa, v4, self->_clientContext);

  v47 = (void *)[(NSMutableArray *)self->_navigationDocumentControllers copy];
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  navigationDocumentControllers = self->_navigationDocumentControllers;
  self->_navigationDocumentControllers = v5;

  v7 = [(SUUIApplicationController *)self clientContext];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obj = self->_tabBarItems;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v56;
    v12 = &selRef_reloadMediaLibrary_;
    do
    {
      uint64_t v13 = 0;
      uint64_t v48 = v10;
      do
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v55 + 1) + 8 * v13);
        objc_super v15 = [v14 customRootViewController];

        if (v15)
        {
          v16 = [v14 customRootViewController];
          if ([v16 conformsToProtocol:v12[387]])
          {
            v17 = [v16 appNavigationController];
            [v17 setClientContext:v7];
            [v17 setDelegate:self];
            v18 = self->_navigationDocumentControllers;
          }
          else
          {
            uint64_t v21 = v11;
            v22 = v12;
            id v23 = v8;
            v24 = v7;
            v25 = self->_navigationDocumentControllers;
            v17 = [MEMORY[0x263EFF9D0] null];
            v18 = v25;
            v7 = v24;
            id v8 = v23;
            v12 = v22;
            uint64_t v11 = v21;
            uint64_t v10 = v48;
          }
          [(NSMutableArray *)v18 addObject:v17];

          v19 = [v14 customRootViewController];
          v20 = v19;
        }
        else
        {
          v19 = [(SUUIApplicationController *)self _newNavigationControllerWithTabBarItem:v14];
          v20 = [[SUUINavigationDocumentController alloc] initWithNavigationController:v19];
          [(SUUINavigationDocumentController *)v20 setClientContext:v7];
          [(SUUINavigationDocumentController *)v20 setDelegate:self];
          [(NSMutableArray *)self->_navigationDocumentControllers addObject:v20];
          [(SUUIApplicationController *)self _ensureStackConsistencyForNavigationController:v19];
          v16 = v19;
        }
        [v8 addObject:v19];

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v10);
  }

  if (self->_hidesTabBar)
  {
    v26 = [(SUUIApplicationController *)self _navigationContainerViewController];
    v27 = [v8 firstObject];
    [v26 setContentViewController:v27];

    v28 = [(SUUIApplicationController *)self _existingTabBarController];
    [v28 setViewControllers:0 animated:0];
  }
  else
  {
    v28 = [(SUUIApplicationController *)self _tabBarController];
    [(SUUISimpleContainerViewController *)self->_navigationContainerViewController setContentViewController:0];
    [v28 setViewControllers:v8 animated:0];
    v29 = SUUITabBarControllerGetMoreNavigationController(v28);
    [v29 setDelegate:self];
    v30 = [(NSDictionary *)self->_launchOptions objectForKey:@"url"];
    if (v30)
    {
      v31 = [SUUIURL alloc];
      v32 = [NSURL URLWithString:v30];
      v33 = [(SUUIURL *)v31 initWithURL:v32];

      v34 = +[SUUIURLResolver tabIdentifierForURL:v33];
      v35 = v34;
      if (v34)
      {
        v36 = v7;
        tabBarItems = self->_tabBarItems;
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __55__SUUIApplicationController__reloadRootViewControllers__block_invoke;
        v53[3] = &unk_2654083D8;
        id v54 = v34;
        unint64_t v38 = [(NSArray *)tabBarItems indexOfObjectPassingTest:v53];
        if (v38 < [v8 count])
        {
          v39 = [v8 objectAtIndex:v38];
          [v28 setSelectedViewController:v39];
        }
        v7 = v36;
      }
    }
    v40 = [v28 selectedViewController];
    [(SUUIApplicationController *)self _tintTabBarWithViewController:v40];
  }
  modalDocumentController = self->_modalDocumentController;
  v42 = [(SUUIApplicationController *)self rootViewController];
  [(SUUIModalDocumentController *)modalDocumentController setRootViewController:v42];

  v43 = [(SUUIApplicationController *)self tabBarController];
  v44 = [v43 selectedViewController];
  [(SUUIApplicationController *)self _updateOverlayNavigationController:v44];

  scriptContext = self->_scriptContext;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __55__SUUIApplicationController__reloadRootViewControllers__block_invoke_3;
  v50[3] = &unk_265406868;
  id v51 = v47;
  v52 = self;
  id v46 = v47;
  [(IKAppContext *)scriptContext evaluate:&__block_literal_global_376 completionBlock:v50];
}

- (SUUIClientContext)clientContext
{
  clientContext = self->_clientContext;
  if (!clientContext)
  {
    v4 = [(objc_class *)self->_clientContextClass defaultContext];
    [(SUUIApplicationController *)self setClientContext:v4];

    clientContext = self->_clientContext;
  }
  return clientContext;
}

- (id)_newNavigationControllerWithTabBarItem:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || (id v7 = objc_loadWeakRetained((id *)&self->_delegate),
        [v7 application:self navigationControllerWithTabBarItem:v4],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    uint64_t v9 = (Class *)0x263F89648;
    if (self->_scriptLoadState != 4) {
      uint64_t v9 = (Class *)0x263F829B8;
    }
    id v8 = objc_alloc_init(*v9);
    if ([v4 barTintStyle] == 1)
    {
      uint64_t v10 = [v8 navigationBar];
      [v10 setBarStyle:1];
    }
  }
  [v8 setDelegate:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v8 section];

    if (!v11)
    {
      v12 = [(SUUIClientContext *)self->_clientContext clientInterface];
      [v8 setClientInterface:v12];
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F89698]) initWithClientInterface:v12 sectionType:0 defaultPNGStyle:0];
      if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
      {
        v14 = [MEMORY[0x263F89690] defaultConfigurationWithClientInterface:v12];
        [v13 setSearchFieldConfiguration:v14];
      }
      [v8 setSection:v13];
    }
  }
  if (self->_clientContext
    && (self->_scriptLoadState == 4 || [v4 alwaysCreatesRootViewController])
    && (uint64_t v15 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "rootViewControllerClass")), "initWithTabBarItem:", v4)) != 0)
  {
    v16 = (void *)v15;
    if (objc_opt_respondsToSelector()) {
      [v16 setClientContext:self->_clientContext];
    }
    [v8 pushViewController:v16 animated:0];
  }
  else
  {
    v16 = [v8 view];
    v17 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v16 setBackgroundColor:v17];
  }
  v18 = [v4 underlyingTabBarItem];
  [v8 setTabBarItem:v18];

  return v8;
}

- (void)_ensureStackConsistencyForNavigationController:(id)a3
{
  id v7 = a3;
  self->_lastNavigationControllerOperation = [v7 lastOperation];
  id v4 = [(SUUIApplicationController *)self _documentControllerForNavigationController:v7];
  [v4 ensureStackConsistencyForNavigationControllerOperation:self->_lastNavigationControllerOperation operationDidComplete:0];
  if (self->_lastNavigationControllerOperation == 2)
  {
    v5 = [v7 disappearingViewController];
    lastPoppedViewController = self->_lastPoppedViewController;
    self->_lastPoppedViewController = v5;
  }
  else
  {
    lastPoppedViewController = self->_lastPoppedViewController;
    self->_lastPoppedViewController = 0;
  }
}

- (id)_documentControllerForNavigationController:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = self->_navigationDocumentControllers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(MEMORY[0x263EFF9D0], "null", (void)v16);

      if (v10 != v11)
      {
        id v12 = [v10 navigationController];

        if (v12 == v4) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    uint64_t v13 = v10;

    if (v13) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_10:
  }
  -[SUUIModalDocumentController navigationDocumentForNavigationController:](self->_modalDocumentController, "navigationDocumentForNavigationController:", v4, (void)v16);
  uint64_t v13 = (SUUINavigationDocumentController *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    id v14 = [(SUUINavigationDocumentController *)self->_transientNavigationDocument navigationController];

    if (v14 == v4) {
      uint64_t v13 = self->_transientNavigationDocument;
    }
    else {
      uint64_t v13 = 0;
    }
  }
LABEL_16:

  return v13;
}

- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3
{
  id v3 = a3;
  id v4 = [v3 transientViewController];
  if (v4 || ([v3 selectedViewController], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v5 = [v4 supportedInterfaceOrientations];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 1)
    {
      unint64_t v5 = 30;
    }
    else if (SUUIAllowsLandscapePhone())
    {
      unint64_t v5 = 26;
    }
    else
    {
      unint64_t v5 = 2;
    }
  }

  return v5;
}

- (UITabBarController)tabBarController
{
  return &self->_tabBarController->super;
}

- (UIViewController)rootViewController
{
  if (self->_hidesTabBar) {
    [(SUUIApplicationController *)self _navigationContainerViewController];
  }
  else {
  v2 = [(SUUIApplicationController *)self _tabBarController];
  }
  return (UIViewController *)v2;
}

- (id)_tabBarController
{
  int64_t v3 = [(SUUIApplicationControllerOptions *)self->_options tabBarControllerStyle];
  if (v3 == 1)
  {
    id scrollingTabBarController = self->_scrollingTabBarController;
    if (!scrollingTabBarController)
    {
      p_id scrollingTabBarController = (id *)&self->_scrollingTabBarController;
      uint64_t v6 = [(SUUIApplicationController *)self _scrollingTabBarControllerClass];
      goto LABEL_7;
    }
LABEL_8:
    id v9 = scrollingTabBarController;
    goto LABEL_10;
  }
  if (!v3)
  {
    p_id scrollingTabBarController = (id *)&self->_tabBarController;
    id scrollingTabBarController = self->_tabBarController;
    if (!scrollingTabBarController)
    {
      uint64_t v6 = [(SUUIApplicationController *)self _tabBarControllerClass];
LABEL_7:
      id v7 = objc_alloc_init(v6);
      id v8 = *p_scrollingTabBarController;
      *p_id scrollingTabBarController = v7;

      [*p_scrollingTabBarController setDelegate:self];
      id scrollingTabBarController = *p_scrollingTabBarController;
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v9 = 0;
LABEL_10:
  return v9;
}

- (void)setClientContext:(id)a3
{
  id v4 = (SUUIClientContext *)a3;
  unint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  NSLog(&cfstr_SetClientConte.isa, v6, v4);

  clientContext = self->_clientContext;
  self->_clientContext = v4;
  id v8 = v4;

  SUUISetShouldReverseLayoutDirectionWithContext(self->_clientContext);
  [(SUUIClientContext *)self->_clientContext _setApplicationController:self];
  [(SUUIClientContext *)self->_clientContext setPurchaseReferrerURL:self->_activationURL];
}

- (void)navigationDocumentController:(id)a3 requestsAccessToAppContextUsingBlock:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __95__SUUIApplicationController_navigationDocumentController_requestsAccessToAppContextUsingBlock___block_invoke;
  v7[3] = &unk_265400AF0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(SUUIApplicationController *)self evaluateBlockWhenLoaded:v7];
}

- (void)evaluateBlockWhenLoaded:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v10 = v4;
  if ((unint64_t)(self->_scriptLoadState - 3) > 1)
  {
    if (!self->_whenLoadedBlocks)
    {
      id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      whenLoadedBlocks = self->_whenLoadedBlocks;
      self->_whenLoadedBlocks = v5;

      id v4 = v10;
    }
    id v7 = (void *)[v4 copy];
    id v8 = self->_whenLoadedBlocks;
    id v9 = _Block_copy(v7);
    [(NSMutableArray *)v8 addObject:v9];
  }
  else
  {
    v4[2]();
  }
}

- (void)_updateOverlayNavigationController:(id)a3
{
  id v12 = [(SUUIApplicationController *)self _overlayNavigationControllerForViewController:a3];
  BOOL v5 = SUUIUserInterfaceIdiom(self->_clientContext) == 1;
  id v4 = v12;
  BOOL v5 = !v5 || v12 == 0;
  if (!v5)
  {
    id v6 = [MEMORY[0x263F82438] sharedApplication];
    id v7 = [v6 keyWindow];
    [v7 bounds];
    double v9 = v8;
    double v10 = SUUICompactThreshold();

    if (v9 <= v10) {
      id v11 = v12;
    }
    else {
      id v11 = 0;
    }
    [(SUUIModalDocumentController *)self->_modalDocumentController setOverlayNavigationController:v11 withTransitionCoordinator:0];
    id v4 = v12;
  }
}

- (void)_tintTabBarWithViewController:(id)a3
{
  id v4 = a3;
  id v14 = [(SUUIApplicationController *)self _existingTabBarController];
  BOOL v5 = [v14 viewControllers];
  unint64_t v6 = [v5 indexOfObjectIdenticalTo:v4];

  if (v6 >= [(NSArray *)self->_tabBarItems count])
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    double v10 = 0;
  }
  else
  {
    id v7 = [(NSArray *)self->_tabBarItems objectAtIndex:v6];
    if ([v7 barTintStyle] == 1)
    {
      uint64_t v8 = 2;
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v11 = [v7 barTintStyle];
      uint64_t v8 = v11 == 0;
      if (v11) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = 3;
      }
    }
    double v10 = [v7 userInterfaceTintColor];
  }
  [v14 setForcedUserInterfaceStyle:v8];
  [v14 setNeedsUserInterfaceAppearanceUpdate];
  id v12 = [MEMORY[0x263F82438] sharedApplication];
  [v12 setStatusBarStyle:v9];

  uint64_t v13 = [v14 tabBar];
  [v13 setTintColor:v10];
}

- (Class)_tabBarControllerClass
{
  return (Class)objc_opt_class();
}

- (id)_overlayNavigationControllerForViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    BOOL v5 = v4;
    goto LABEL_7;
  }
  if ([v3 conformsToProtocol:&unk_2706A77A0])
  {
    id v4 = [v3 overlayNavigationController];
    goto LABEL_5;
  }
  BOOL v5 = 0;
LABEL_7:

  return v5;
}

- (id)_existingTabBarController
{
  int64_t v3 = [(SUUIApplicationControllerOptions *)self->_options tabBarControllerStyle];
  if (!v3)
  {
    uint64_t v4 = 248;
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    uint64_t v4 = 304;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.isa + v4);
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  return v5;
}

- (NSArray)tabBarItems
{
  return self->_tabBarItems;
}

- (void)setDelegate:(id)a3
{
}

+ (void)prepareForLaunch
{
  int64_t v3 = (void *)MEMORY[0x25A2A9B80](a1, a2);
  +[SUUIMetricsAppLaunchEvent createPendingLaunchEvent];
  +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:&__block_literal_global_60];
  uint64_t v4 = [a1 configurationPreloader];
  [v4 preloadConfigurationForPurpose:0 withCompletionBlock:&__block_literal_global_41];
}

void __45__SUUIApplicationController_prepareForLaunch__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (!v4)
  {
    unint64_t v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      int v10 = v8;
    }
    else {
      int v10 = v8 & 2;
    }
    if (v10)
    {
      int v13 = 138412290;
      id v14 = v5;
      LODWORD(v12) = 12;
      uint64_t v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v13, v12);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  if ([v4 count]) {
    +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:&__block_literal_global_49];
  }
LABEL_15:
}

void __45__SUUIApplicationController_prepareForLaunch__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF910];
  id v3 = a2;
  id v4 = [v2 date];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "setMainTime:");
}

+ (SUUIConfigurationPreloader)configurationPreloader
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    int v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"SUUIApplicationController.m" lineNumber:223 description:@"This property is main thread only."];
  }
  id v4 = (void *)_SUUIApplicationControllerConfigurationPreloader;
  if (!_SUUIApplicationControllerConfigurationPreloader)
  {
    id v5 = objc_alloc_init(SUUIConfigurationPreloader);
    unint64_t v6 = (void *)_SUUIApplicationControllerConfigurationPreloader;
    _SUUIApplicationControllerConfigurationPreloader = (uint64_t)v5;

    id v4 = (void *)_SUUIApplicationControllerConfigurationPreloader;
  }
  return (SUUIConfigurationPreloader *)v4;
}

+ (void)finishedWithConfigurationPreloader
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:a1 file:@"SUUIApplicationController.m" lineNumber:231 description:@"This method is main thread only."];
  }
  id v4 = (void *)_SUUIApplicationControllerConfigurationPreloader;
  _SUUIApplicationControllerConfigurationPreloader = 0;
}

void __45__SUUIApplicationController_prepareForLaunch__block_invoke_47(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF910];
  id v3 = a2;
  id v4 = [v2 date];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "setClientConfigurationLoadTime:");
}

- (SUUIApplicationController)init
{
  uint64_t v3 = objc_opt_class();
  return [(SUUIApplicationController *)self initWithClientContextClass:v3];
}

- (SUUIApplicationController)initWithClientContextClass:(Class)a3
{
  return [(SUUIApplicationController *)self initWithClientContextClass:a3 options:0];
}

- (SUUIApplicationController)initWithClientContextClass:(Class)a3 tabBarControllerStyle:(int64_t)a4
{
  int v7 = objc_alloc_init(SUUIMutableApplicationControllerOptions);
  [(SUUIMutableApplicationControllerOptions *)v7 setTabBarControllerStyle:a4];
  int v8 = [(SUUIApplicationController *)self initWithClientContextClass:a3 options:v7];

  return v8;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89418] object:0];
  [v3 removeObserver:self name:@"SUUIApplicationPageDidDisplayNotification" object:0];
  [v3 removeObserver:self name:0x2704F80F0 object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F7B4D8] object:0];
  [v3 removeObserver:self name:@"SUAccountViewControllerDidDisappearNotification" object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83330] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F833B8] object:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_navigationDocumentControllers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        int v10 = [MEMORY[0x263EFF9D0] null];

        if (v9 != v10) {
          [v9 setDelegate:0];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(SUUIClientContext *)self->_clientContext _setApplicationController:0];
  [(SUUIClientContext *)self->_clientContext _setScriptAppContext:0];
  [(SUUIModalDocumentController *)self->_modalDocumentController setDelegate:0];
  [(SUUIModalDocumentController *)self->_modalDocumentController setModalSourceViewProvider:0];
  [(SUUIModalDocumentController *)self->_modalDocumentController setNavigationControllerDelegate:0];
  uint64_t v11 = [(SUUIApplicationController *)self _existingTabBarController];
  uint64_t v12 = SUUITabBarControllerGetMoreNavigationController(v11);
  [v12 setDelegate:0];
  [v11 setDelegate:0];
  [(SUUINavigationDocumentController *)self->_transientNavigationDocument setDelegate:0];
  [(SUUIURLResolver *)self->_urlResolver setDelegate:0];
  [(SUUIURLResolver *)self->_urlResolver setNavigationControllerDelegate:0];

  v13.receiver = self;
  v13.super_class = (Class)SUUIApplicationController;
  [(SUUIApplicationController *)&v13 dealloc];
}

+ (id)applicationOptionsWithLaunchOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = *MEMORY[0x263F83360];
  uint64_t v7 = [v4 objectForKey:*MEMORY[0x263F83360]];
  uint64_t v8 = *MEMORY[0x263F83358];
  uint64_t v9 = [v4 objectForKey:*MEMORY[0x263F83358]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v7;
    int v10 = [a1 _referrerAppForSourceApplication:v9 launchURL:&v22];
    id v11 = v22;

    [v5 setObject:v10 forKey:@"refApp"];
    uint64_t v7 = v11;
  }
  [v5 removeObjectForKey:v8];
  if (v7)
  {
    uint64_t v12 = [[SUUIURL alloc] initWithURL:v7];
    objc_super v13 = [(SUUIURL *)v12 underlyingURL];
    long long v14 = [v13 absoluteString];
    [v5 setObject:v14 forKey:@"url"];

    [v5 removeObjectForKey:v6];
  }
  uint64_t v15 = *MEMORY[0x263F83348];
  long long v16 = [v4 objectForKey:*MEMORY[0x263F83348]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = (void *)SUUIMobileCoreServicesFramework();
    id v18 = *(id *)SUUIWeakLinkedSymbolForString("LSReferrerURLKey", v17);
    if (v18)
    {
      uint64_t v19 = [v16 objectForKey:v18];
    }
    else
    {
      uint64_t v19 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 setObject:v19 forKey:@"refUrl"];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [v19 absoluteString];
        [v5 setObject:v20 forKey:@"refUrl"];
      }
    }
  }
  [v5 removeObjectForKey:v15];
  if (![v5 count])
  {

    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)_referrerAppForSourceApplication:(id)a3 launchURL:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 isEqualToString:@"com.apple.ios.StoreKitUIService"])
  {
    uint64_t v19 = a4;
    uint64_t v6 = [MEMORY[0x263F08BA0] componentsWithURL:*a4 resolvingAgainstBaseURL:0];
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v18 = v6;
    uint64_t v8 = [v6 queryItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v14 = [v13 name];
          int v15 = [v14 isEqualToString:@"SUUIServiceRefApp"];

          if (v15)
          {
            uint64_t v16 = [v13 value];

            id v5 = (id)v16;
          }
          else
          {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    [v18 setQueryItems:v7];
    id *v19 = [v18 URL];
  }
  return v5;
}

- (void)application:(id)a3 didReceiveURL:(id)a4
{
  id v7 = a4;
  id v5 = (SUUIURL *)[v7 copy];
  activationURL = self->_activationURL;
  self->_activationURL = v5;

  self->_ignoreDidBecomeActive = 1;
  [(SUUIClientContext *)self->_clientContext setPurchaseReferrerURL:v7];
}

- (void)applicationDidBecomeActive:(id)a3
{
  if (!self->_ignoreDidBecomeActive) {
    [(SUUIApplicationController *)self resumeApplicationWithOptions:0];
  }
}

- (void)applicationWillResignActive:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  unint64_t v6 = *MEMORY[0x263F833E0];
  if (self->_resignActiveTaskID != *MEMORY[0x263F833E0])
  {
    objc_msgSend(v4, "endBackgroundTask:");
    self->_unint64_t resignActiveTaskID = v6;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__SUUIApplicationController_applicationWillResignActive___block_invoke;
  v11[3] = &unk_265400890;
  id v12 = v5;
  objc_super v13 = self;
  id v7 = v5;
  self->_unint64_t resignActiveTaskID = [v7 beginBackgroundTaskWithName:@"SUUIApplicationController.resignActive" expirationHandler:v11];
  block[6] = MEMORY[0x263EF8330];
  block[7] = 3221225472;
  block[8] = __57__SUUIApplicationController_applicationWillResignActive___block_invoke_2;
  block[9] = &unk_265400AC8;
  block[10] = self;
  SSDialogGetDaemonDialogState();
  unint64_t resignActiveTaskID = self->_resignActiveTaskID;
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUUIApplicationController_applicationWillResignActive___block_invoke_4;
  block[3] = &unk_2654019B0;
  block[4] = self;
  block[5] = resignActiveTaskID;
  dispatch_after(v9, MEMORY[0x263EF83A0], block);
}

uint64_t __57__SUUIApplicationController_applicationWillResignActive___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) endBackgroundTask:*(void *)(*(void *)(a1 + 40) + 192)];
  *(void *)(*(void *)(a1 + 40) + 192) = *MEMORY[0x263F833E0];
  return result;
}

void __57__SUUIApplicationController_applicationWillResignActive___block_invoke_2(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__SUUIApplicationController_applicationWillResignActive___block_invoke_3;
  v2[3] = &unk_265404138;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __57__SUUIApplicationController_applicationWillResignActive___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWillResignActiveWithDialogState:*(unsigned __int8 *)(a1 + 40)];
}

void *__57__SUUIApplicationController_applicationWillResignActive___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[24] == *(void *)(a1 + 40)) {
    return (void *)[result _finishWillResignActiveWithDialogState:0];
  }
  return result;
}

- (void)hideStatusOverlayForProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (SUUIStatusOverlayProvider *)a3;
  if (v6 && self->_statusOverlayProvider == v6)
  {
    self->_statusOverlayProvider = 0;
    dispatch_time_t v9 = v6;

    if (self->_floatingStatusOverlayViewController)
    {
      id v7 = [(SUUIApplicationController *)self _existingTabBarController];
      SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v7, 0, v4);

      floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
      self->_floatingStatusOverlayViewController = 0;
    }
    else
    {
      [(SUUIApplicationController *)self _removeStatusOverlayFromAllNavigationControllers];
    }
    unint64_t v6 = v9;
  }
}

- (void)loadApplication
{
}

- (void)loadApplicationWithOptions:(id)a3
{
  v41[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  unint64_t v6 = NSStringFromClass(v5);
  NSLog(&cfstr_LoadApplicatio.isa, v6, v4);

  id v7 = [(SUUIApplicationController *)self clientContext];
  uint64_t v8 = (void *)[v4 mutableCopy];
  if (!v8) {
    uint64_t v8 = objc_opt_new();
  }
  +[SUUIMetricsAppLaunchEvent processStartTime];
  double v10 = v9;
  if (v9 < 2.22044605e-16)
  {
    uint64_t v11 = [MEMORY[0x263EFF910] date];
    [v11 timeIntervalSince1970];
    double v10 = v12;
  }
  objc_super v13 = [NSNumber numberWithLongLong:(uint64_t)(v10 * 1000.0)];
  [v8 setObject:v13 forKey:@"launchTime"];

  long long v14 = NSDictionary;
  int v15 = [(SUUIApplicationController *)self rootViewController];
  uint64_t v16 = [v15 view];
  [v16 bounds];
  uint64_t v19 = objc_msgSend(v14, "su_dictionaryWithSize:", v17, v18);
  [v8 setObject:v19 forKey:@"windowSize"];

  long long v20 = (NSDictionary *)[v8 copy];
  launchOptions = self->_launchOptions;
  self->_launchOptions = v20;

  long long v22 = objc_alloc_init(SUUIModalDocumentController);
  modalDocumentController = self->_modalDocumentController;
  self->_modalDocumentController = v22;

  [(SUUIModalDocumentController *)self->_modalDocumentController setClientContext:v7];
  [(SUUIModalDocumentController *)self->_modalDocumentController setDelegate:self];
  [(SUUIModalDocumentController *)self->_modalDocumentController setModalSourceViewProvider:self];
  [(SUUIModalDocumentController *)self->_modalDocumentController setNavigationControllerDelegate:self];
  v24 = self->_modalDocumentController;
  uint64_t v25 = [(SUUIApplicationController *)self rootViewController];
  [(SUUIModalDocumentController *)v24 setRootViewController:v25];

  v26 = +[SUUINearMeController sharedController];
  [v26 setClientContext:v7];

  v27 = +[SUUIFamilyCircleController sharedController];
  [v27 setClientContext:v7];

  v28 = [MEMORY[0x263F7B370] sharedManager];
  v41[0] = objc_opt_class();
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
  [v28 setCustomURLProtocols:v29];

  [MEMORY[0x263EFC628] registerClass:objc_opt_class()];
  v30 = [MEMORY[0x263F82438] sharedApplication];
  LODWORD(v29) = [v30 launchedToTest];

  if (v29) {
    [MEMORY[0x263EFC628] registerClass:objc_opt_class()];
  }
  if (!v7)
  {
    objc_initWeak(&location, self);
    v35 = [(id)objc_opt_class() configurationPreloader];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_4;
    v36[3] = &unk_2654057F8;
    objc_copyWeak(&v37, &location);
    [v35 preloadConfigurationForPurpose:1 withCompletionBlock:v36];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  [(SUUIApplicationController *)self _loadApplicationScript];
  id WeakRetained = (SUUIExplicitRestrictionAlertController *)objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_11;
  }
  id v32 = objc_loadWeakRetained((id *)&self->_delegate);
  int v33 = [v32 shouldShowExplicitRestrictionAlertOnLaunch];

  if (v33)
  {
    id WeakRetained = [[SUUIExplicitRestrictionAlertController alloc] initWithClientContext:v7];
    [(SUUIExplicitRestrictionAlertController *)WeakRetained presentExplicitRestrictionAlertIfNeededOfType:0 completionBlock:0];
LABEL_11:
  }
  objc_initWeak(&location, self);
  dispatch_time_t v34 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke;
  block[3] = &unk_265402A38;
  block[4] = self;
  objc_copyWeak(&v39, &location);
  dispatch_after(v34, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
LABEL_14:
}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x25A2A9B80]();
  char v3 = [(id)objc_opt_class() configurationPreloader];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_2;
  v4[3] = &unk_2654057F8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v3 preloadConfigurationForPurpose:2 withCompletionBlock:v4];
  objc_destroyWeak(&v5);
}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_3;
    v5[3] = &unk_265402A38;
    id v6 = v3;
    objc_copyWeak(&v7, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x263EF83A0], v5);
    objc_destroyWeak(&v7);
  }
}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_3(uint64_t a1)
{
  v1 = (id *)a1;
  id v4 = [[SUUIClientContext alloc] initWithConfigurationDictionary:*(void *)(a1 + 32)];
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  [WeakRetained _reloadTabBarWithClientContext:v4];

  id v3 = objc_loadWeakRetained(v1);
  [(id)objc_opt_class() finishedWithConfigurationPreloader];
}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v7);
  double v9 = WeakRetained;
  if (v5)
  {
    [WeakRetained _setClientContextWithDictionary:v5];

    +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:&__block_literal_global_106];
  }
  else
  {
    [WeakRetained _failReloadWithError:v6];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_6;
  block[3] = &unk_265401538;
  objc_copyWeak(&v11, v7);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v11);
}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setRequiredBlockingBagLoad:1];
  id v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSince1970];
  objc_msgSend(v2, "setClientConfigurationLoadTime:");
}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [(id)objc_opt_class() finishedWithConfigurationPreloader];
}

- (void)recordMetricsEvent:(id)a3 flushImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v8 = v7;
  metricsController = self->_metricsController;
  if (metricsController)
  {
    double v10 = SUUIMetricsWindowOrientationForInterfaceOrientation([v7 statusBarOrientation]);
    [(SUUIMetricsController *)metricsController setWindowOrientation:v10];

    if (v4)
    {
      [(id)objc_opt_class() flushImmediately];
      [v6 originalTime];
      [v6 setOriginalTime:v11 + 1.0];
      [(SUUIMetricsController *)self->_metricsController recordEvent:v6];
      [(id)objc_opt_class() flushImmediately];
    }
    else
    {
      [(SUUIMetricsController *)self->_metricsController recordEvent:v6];
    }
  }
  else if (self->_clientContext)
  {
    uint64_t v12 = *MEMORY[0x263F833E0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__SUUIApplicationController_recordMetricsEvent_flushImmediately___block_invoke;
    v21[3] = &unk_2654019B0;
    id v13 = v7;
    id v22 = v13;
    uint64_t v23 = v12;
    uint64_t v14 = [v13 beginBackgroundTaskWithName:@"SUUIApplicationController.recordMetricsEvent" expirationHandler:v21];
    clientContext = self->_clientContext;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __65__SUUIApplicationController_recordMetricsEvent_flushImmediately___block_invoke_2;
    v16[3] = &unk_265408310;
    v16[4] = self;
    id v17 = v13;
    BOOL v20 = v4;
    id v18 = v6;
    uint64_t v19 = v14;
    [(SUUIClientContext *)clientContext getDefaultMetricsControllerWithCompletionBlock:v16];
  }
}

uint64_t __65__SUUIApplicationController_recordMetricsEvent_flushImmediately___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTask:*(void *)(a1 + 40)];
}

void __65__SUUIApplicationController_recordMetricsEvent_flushImmediately___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = *(void **)(v4 + 136);
  id v5 = (id *)(v4 + 136);
  id v6 = v7;
  if (!v7)
  {
    objc_storeStrong(v5, a2);
    id v6 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  uint64_t v8 = SUUIMetricsWindowOrientationForInterfaceOrientation([*(id *)(a1 + 40) statusBarOrientation]);
  [v6 setWindowOrientation:v8];

  if (*(unsigned char *)(a1 + 64)) {
    [(id)objc_opt_class() flushImmediately];
  }
  [*(id *)(*(void *)(a1 + 32) + 136) recordEvent:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 64)) {
    [(id)objc_opt_class() flushImmediately];
  }
  [*(id *)(a1 + 40) endBackgroundTask:*(void *)(a1 + 56)];
}

- (void)resumeApplicationWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIApplicationController *)self rootViewController];
  id v6 = [v5 presentedViewController];
  id v7 = [v6 transitionCoordinator];

  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__SUUIApplicationController_resumeApplicationWithOptions___block_invoke;
    v8[3] = &unk_265406818;
    v8[4] = self;
    id v9 = v4;
    [v7 animateAlongsideTransition:0 completion:v8];
  }
  else
  {
    [(IKAppContext *)self->_scriptContext resumeWithOptions:v4];
  }
}

uint64_t __58__SUUIApplicationController_resumeApplicationWithOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) resumeWithOptions:*(void *)(a1 + 40)];
}

- (void)suspendApplicationWithOptions:(id)a3
{
}

- (id)selectTabWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__91;
  v26 = __Block_byref_object_dispose__91;
  id v27 = 0;
  if (self->_hidesTabBar)
  {
    id v5 = [(NSMutableArray *)self->_navigationDocumentControllers firstObject];
    id v6 = [MEMORY[0x263EFF9D0] null];

    if (v5 == v6) {
      goto LABEL_8;
    }
    uint64_t v7 = [v5 navigationController];
    id v8 = (id)v23[5];
    v23[5] = v7;
  }
  else
  {
    id v9 = [(SUUIApplicationController *)self _existingTabBarController];
    double v10 = [v9 viewControllers];
    tabBarItems = self->_tabBarItems;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__SUUIApplicationController_selectTabWithIdentifier___block_invoke;
    v16[3] = &unk_265408338;
    id v17 = v4;
    id v8 = v10;
    id v18 = v8;
    id v5 = v9;
    BOOL v20 = self;
    long long v21 = &v22;
    id v19 = v5;
    [(NSArray *)tabBarItems enumerateObjectsUsingBlock:v16];
    if (!v23[5])
    {
      uint64_t v12 = [v5 selectedViewController];
      id v13 = (void *)v23[5];
      v23[5] = v12;
    }
    [(SUUIApplicationController *)self _dispatchTabBarOnSelect];
    [(SUUIApplicationController *)self _tintTabBarWithViewController:v23[5]];
    [(SUUIApplicationController *)self _updateOverlayNavigationController:v23[5]];
  }
LABEL_8:

  id v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __53__SUUIApplicationController_selectTabWithIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 tabIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    if ([*(id *)(a1 + 40) count] > a3)
    {
      id v9 = [*(id *)(a1 + 40) objectAtIndex:a3];
      double v10 = [*(id *)(a1 + 48) selectedViewController];

      if (v9 != v10)
      {
        [*(id *)(a1 + 48) setSelectedViewController:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v9);
        }
        [*(id *)(*(void *)(a1 + 56) + 128) popAllDocuments];
      }
    }
    *a4 = 1;
  }
}

- (void)showErrorViewWithTitle:(id)a3 message:(id)a4
{
}

- (void)showErrorViewWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6
{
  double v10 = (__CFString *)a4;
  double v11 = (objc_class *)MEMORY[0x263F82EF0];
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = [v11 alloc];
  uint64_t v16 = objc_msgSend(v15, "initWithFrame:title:style:", v14, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  if (v13) {
    BOOL v17 = v10 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17) {
    id v18 = &stru_2704F8130;
  }
  else {
    id v18 = v10;
  }
  long long v21 = v18;
  objc_msgSend(v16, "setMessage:");
  [v16 setButtonTitle:v13];

  [v16 setButtonAction:v12];
  id v19 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v16 setBackgroundColor:v19];

  BOOL v20 = objc_alloc_init(SUUILaunchErrorViewController);
  [(SUUILaunchErrorViewController *)v20 setView:v16];
  [(SUUIApplicationController *)self showTransientViewController:v20];
}

- (void)showErrorViewForLaunchFailure
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke;
  v10[3] = &unk_265400980;
  v10[4] = self;
  [(SUUIApplicationController *)self evaluateBlockWhenLoaded:v10];
  objc_initWeak(&location, self);
  id v3 = SUUIErrorDocumentTitle(self->_clientContext);
  id v4 = self->_clientContext;
  id v5 = v4;
  if (v4) {
    [(SUUIClientContext *)v4 localizedStringForKey:@"NETWORK_ERROR_BUTTON_RETRY"];
  }
  else {
  id v6 = +[SUUIClientContext localizedStringForKey:@"NETWORK_ERROR_BUTTON_RETRY" inBundles:0];
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke_2;
  v7[3] = &unk_265401538;
  objc_copyWeak(&v8, &location);
  [(SUUIApplicationController *)self showErrorViewWithTitle:v3 message:0 buttonTitle:v6 buttonAction:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke(uint64_t a1)
{
  id v2 = +[SUUIMetricsUtilities newErrorPageEvent];
  [v2 setPageType:@"SUUIApplicationController"];
  [*(id *)(a1 + 32) recordMetricsEvent:v2 flushImmediately:0];
}

void __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _reloadApplication];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke_3;
    v3[3] = &unk_265400980;
    v3[4] = v2;
    [v2 evaluateBlockWhenLoaded:v3];
  }
}

void __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke_3(uint64_t a1)
{
  id v2 = +[SUUIMetricsUtilities newErrorRetryClickEvent];
  [v2 setPageType:@"SUUIApplicationController"];
  [*(id *)(a1 + 32) recordMetricsEvent:v2 flushImmediately:0];
}

- (void)showExternalURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForQueryParameter:@"referrer"];
  id v6 = [v4 referrerApplicationName];
  if (v6 || !v5)
  {
  }
  else if (![v5 caseInsensitiveCompare:@"siri"])
  {
    [v4 setReferrerApplicationName:@"com.apple.Siri"];
  }
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SUUIApplicationController_showExternalURL___block_invoke;
  v8[3] = &unk_2654012C8;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v9 = v7;
  double v10 = self;
  [(SUUIApplicationController *)self _attemptAMSURLHandlingIfPossibleForExternalURL:v7 fallback:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __45__SUUIApplicationController_showExternalURL___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = [WeakRetained _shouldUseLegacyURLHandlingForExternalURL:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5[14])
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isEqual:")) {
        return;
      }
      id v5 = *(void **)(a1 + 40);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    [v5 _legacyResolveExternalURL:v11];
  }
  else
  {
    id v6 = objc_loadWeakRetained(v2);
    id v12 = [v6 _launchOptionsWithURL:*(void *)(a1 + 32)];

    id v7 = *(void **)(*(void *)(a1 + 40) + 104);
    if (v7)
    {
      id v8 = (void *)[v7 mutableCopy];
      [v8 addEntriesFromDictionary:v12];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(id *)(v9 + 104);
      *(void *)(v9 + 104) = v8;
    }
    else
    {
      id v10 = objc_loadWeakRetained(v2);
      [v10 resumeApplicationWithOptions:v12];
    }
  }
}

- (void)showStatusOverlayUsingProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (SUUIStatusOverlayProvider *)a3;
  p_statusOverlayProvider = &self->_statusOverlayProvider;
  statusOverlayProvider = self->_statusOverlayProvider;
  if (v7)
  {
    if (statusOverlayProvider == v7) {
      goto LABEL_6;
    }
    id v12 = v7;
    objc_storeStrong((id *)p_statusOverlayProvider, a3);
    id v10 = [(SUUIApplicationController *)self _activeNavigationController];
    uint64_t v11 = [v10 topViewController];
    [(SUUIApplicationController *)self _showStatusOverlayForNavigationController:v10 viewController:v11 animated:v4];
  }
  else
  {
    id v12 = 0;
    p_statusOverlayProvider = (SUUIStatusOverlayProvider **)[(SUUIApplicationController *)self hideStatusOverlayForProvider:statusOverlayProvider animated:v4];
  }
  id v7 = v12;
LABEL_6:
  MEMORY[0x270F9A758](p_statusOverlayProvider, v7);
}

- (void)showTransientViewController:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUUIApplicationController *)self _transientNavigationDocument];
  id v6 = [v5 navigationController];
  if (v4)
  {
    [v5 ensureStackConsistencyForNavigationControllerOperation:3 operationDidComplete:0];
    v9[0] = v4;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [v6 setViewControllers:v7 animated:0];

    [v5 ensureStackConsistencyForNavigationControllerOperation:3 operationDidComplete:1];
  }
  else
  {
    [v5 setStackItems:MEMORY[0x263EFFA68] animated:0];
  }
  id v8 = [(SUUIApplicationController *)self _existingTabBarController];
  [v8 setTransientViewController:v6 animated:0];

  [(SUUIApplicationController *)self _tintTabBarWithViewController:v6];
}

- (void)setMescalPrimeEnabledForXHRRequests:(BOOL)a3
{
  self->_mescalPrimeEnabledForXHRRequests = a3;
  scriptContext = self->_scriptContext;
  if (scriptContext) {
    -[IKAppContext setMescalPrimeEnabledForXHRRequests:](scriptContext, "setMescalPrimeEnabledForXHRRequests:");
  }
}

- (void)updateTabBarWithItems:(id)a3 animated:(BOOL)a4
{
}

- (void)updateTabBarWithItems:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v38 = a4;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v39 = a5;
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  NSLog(&cfstr_UpdateTabBarIt.isa, v9, self->_clientContext, v7);

  id v10 = (void *)[(NSMutableArray *)self->_navigationDocumentControllers copy];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  navigationDocumentControllers = self->_navigationDocumentControllers;
  self->_navigationDocumentControllers = v12;

  v41 = [(SUUIApplicationController *)self clientContext];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v7;
  uint64_t v14 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v48;
    v40 = v10;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v19 = [v18 customRootViewController];

        if (v19)
        {
          BOOL v20 = [v18 customRootViewController];
          if ([v20 conformsToProtocol:&unk_2706A7860])
          {
            long long v21 = [v20 appNavigationController];
            [v21 setClientContext:v41];
            [v21 setDelegate:self];
            uint64_t v22 = self->_navigationDocumentControllers;
          }
          else
          {
            uint64_t v24 = self->_navigationDocumentControllers;
            long long v21 = [MEMORY[0x263EFF9D0] null];
            uint64_t v22 = v24;
          }
          [(NSMutableArray *)v22 addObject:v21];

          uint64_t v25 = [v18 customRootViewController];
          [v11 addObject:v25];
        }
        else
        {
          unint64_t v23 = [(NSArray *)self->_tabBarItems indexOfObject:v18];
          if (v23 >= [v10 count])
          {
            BOOL v20 = 0;
          }
          else
          {
            BOOL v20 = [v10 objectAtIndex:v23];
          }
          uint64_t v25 = [v20 navigationController];
          if (v25)
          {
            v26 = [v20 clientContext];

            if (!v26) {
              [v20 setClientContext:v41];
            }
            id v27 = [(NSArray *)self->_tabBarItems objectAtIndex:v23];
            v28 = [v27 underlyingTabBarItem];
            [v18 setUnderlyingTabBarItem:v28];

            [(NSMutableArray *)self->_navigationDocumentControllers addObject:v20];
            [v11 addObject:v25];
            id v10 = v40;
          }
          else
          {
            id v29 = [(SUUIApplicationController *)self _newNavigationControllerWithTabBarItem:v18];
            if (v29)
            {
              v30 = [[SUUINavigationDocumentController alloc] initWithNavigationController:v29];
              [(SUUINavigationDocumentController *)v30 setClientContext:v41];
              [(SUUINavigationDocumentController *)v30 setDelegate:self];
              [(NSMutableArray *)self->_navigationDocumentControllers addObject:v30];
              [v11 addObject:v29];

              id v10 = v40;
            }
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v15);
  }

  v31 = (NSArray *)[obj copy];
  tabBarItems = self->_tabBarItems;
  self->_tabBarItems = v31;

  int v33 = [(SUUIApplicationController *)self _existingTabBarController];
  [v33 setViewControllers:v11 animated:v38];

  dispatch_time_t v34 = [(SUUITabBarController *)self->_tabBarController selectedViewController];
  [(SUUIApplicationController *)self _tintTabBarWithViewController:v34];

  scriptContext = self->_scriptContext;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __71__SUUIApplicationController_updateTabBarWithItems_animated_completion___block_invoke;
  v45[3] = &unk_265408360;
  id v46 = v39;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __71__SUUIApplicationController_updateTabBarWithItems_animated_completion___block_invoke_2;
  v43[3] = &unk_265400AC8;
  id v44 = v10;
  id v36 = v10;
  id v37 = v39;
  [(IKAppContext *)scriptContext evaluate:v45 completionBlock:v43];
}

void __71__SUUIApplicationController_updateTabBarWithItems_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"TabBar"];
  id v4 = [v3 toObjectOfClass:objc_opt_class()];

  [v4 sendOnUpdateWithCompletion:*(void *)(a1 + 32)];
}

uint64_t __71__SUUIApplicationController_updateTabBarWithItems_animated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) count];
}

- (Class)_JSITunesStoreClass
{
  return (Class)objc_opt_class();
}

- (Class)_scrollingTabBarControllerClass
{
  return (Class)objc_opt_class();
}

- (void)appContext:(id)a3 didCompletePurchase:(id)a4
{
  id v6 = a4;
  id v5 = [(SUUIApplicationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 application:self didCompletePurchase:v6];
  }
}

- (void)appContext:(id)a3 didCompleteSoftwarePurchase:(id)a4
{
  id v6 = a4;
  id v5 = [(SUUIApplicationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 application:self didCompleteSoftwarePurchase:v6];
  }
}

- (void)appContext:(id)a3 didExitWithOptions:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectForKey:@"url"];
  uint64_t v7 = *MEMORY[0x263F833E0];
  if ([v6 length])
  {
    id v8 = [MEMORY[0x263F82438] sharedApplication];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__SUUIApplicationController_appContext_didExitWithOptions___block_invoke;
    v12[3] = &__block_descriptor_40_e5_v8__0l;
    v12[4] = v7;
    uint64_t v7 = [v8 beginBackgroundTaskWithName:@"com.apple.ios.StoreKitUIService.openURL" expirationHandler:v12];
  }
  uint64_t v9 = [(SUUIApplicationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 application:self didStopWithOptions:v5];
  }
  if ([v6 length])
  {
    id v10 = (void *)[objc_alloc(NSURL) initWithString:v6];
    SUUIMetricsOpenSensitiveURL(v10, 0);
    id v11 = [MEMORY[0x263F82438] sharedApplication];
    [v11 endBackgroundTask:v7];
  }
}

void __59__SUUIApplicationController_appContext_didExitWithOptions___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 endBackgroundTask:*(void *)(a1 + 32)];
}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  scriptContext = self->_scriptContext;
  id v7 = a4;
  id v6 = [(IKAppContext *)scriptContext appScriptFallbackHandler];
  [v6 invalidate];

  [(SUUIApplicationController *)self _failWithError:v7];
}

- (void)appContext:(id)a3 didStartWithOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  NSLog(&cfstr_ContextDidStar.isa, v9, v7, v6);

  self->_scriptLoadState = 3;
  [(SUUIApplicationController *)self _fireBlocksAfterLoad];
  launchOptions = self->_launchOptions;
  self->_launchOptions = 0;

  legacyLaunchURL = self->_legacyLaunchURL;
  self->_legacyLaunchURL = 0;

  if (self->_indexOfLastTabNeedingContent != 0x7FFFFFFFFFFFFFFFLL) {
    -[SUUIApplicationController _dispatchTabBarOnNeedsContentForTabAtIndex:](self, "_dispatchTabBarOnNeedsContentForTabAtIndex:");
  }
  +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:&__block_literal_global_207];
}

void __60__SUUIApplicationController_appContext_didStartWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFF910];
  id v3 = a2;
  id v4 = [v2 date];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "setBootstrapEndTime:");
}

- (void)appContext:(id)a3 didStopWithOptions:(id)a4
{
  id v10 = a4;
  [(SUUIApplicationController *)self _removeObserversForReloadNotifications];
  int64_t scriptLoadState = self->_scriptLoadState;
  if (scriptLoadState == 5)
  {
    id v6 = [MEMORY[0x263F82438] sharedApplication];
    if ([v6 applicationState] == 2)
    {
      self->_reloadApplicationOnForegroundNotification = 1;
      [(SUUIApplicationController *)self _invalidateApplication];
      uint64_t v7 = *MEMORY[0x263F83308];
      id v8 = [MEMORY[0x263F82B60] mainScreen];
      [v6 removeDefaultImage:v7 forScreen:v8];
    }
    else
    {
      [(SUUIApplicationController *)self _reloadApplication];
    }
    [(_SUUIApplicationShutdownHelper *)self->_shutdownHelper stop];
    shutdownHelper = self->_shutdownHelper;
    self->_shutdownHelper = 0;
  }
  else if (scriptLoadState == 6)
  {
    [(SUUIApplicationController *)self _invalidateApplication];
    [(_SUUIApplicationShutdownHelper *)self->_shutdownHelper stop];
    id v6 = self->_shutdownHelper;
    self->_shutdownHelper = 0;
  }
  else
  {
    id v6 = [(SUUIApplicationController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 application:self didStopWithOptions:v10];
    }
    else {
      [(SUUIApplicationController *)self _reloadApplication];
    }
  }
}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[SUUIJSApplication alloc] initWithAppContext:v6 applicationController:self];
  [v7 setObject:v8 forKeyedSubscript:@"App"];

  uint64_t v9 = [[SUUIJSTabBar alloc] initWithAppContext:v6 controller:self];
  [v7 setObject:v9 forKeyedSubscript:@"TabBar"];

  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  int v33 = __Block_byref_object_copy__91;
  dispatch_time_t v34 = __Block_byref_object_dispose__91;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__91;
  v28 = __Block_byref_object_dispose__91;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__91;
  uint64_t v22 = __Block_byref_object_dispose__91;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__SUUIApplicationController_appContext_evaluateAppJavaScriptInContext___block_invoke;
  v17[3] = &unk_265408388;
  v17[4] = self;
  v17[5] = &v30;
  v17[6] = &v24;
  v17[7] = &v18;
  [v6 evaluateDelegateBlockSync:v17];
  id v10 = objc_alloc([(SUUIApplicationController *)self _JSITunesStoreClass]);
  id v11 = (void *)[v10 initWithAppContext:v6 clientContext:v31[5]];
  [v7 setObject:v11 forKeyedSubscript:@"itms"];

  id v12 = [SUUIJSModalDocumentController alloc];
  id v13 = [(SUUIJSModalDocumentController *)v12 initWithAppContext:v6 modalDocumentController:v19[5]];
  [v7 setObject:v13 forKeyedSubscript:@"modal"];

  uint64_t v14 = [[SUUIJSTelephony alloc] initWithAppContext:v6];
  [v7 setObject:v14 forKeyedSubscript:@"Telephony"];

  uint64_t v15 = [SUUIJSImageColorAnalyzer alloc];
  uint64_t v16 = [(SUUIJSImageColorAnalyzer *)v15 initWithAppContext:v6 clientContext:v31[5]];
  [v7 setObject:v16 forKeyedSubscript:@"ImageColorAnalyzer"];

  if (objc_opt_respondsToSelector()) {
    [(id)v25[5] application:self evaluateAppJavaScriptInContext:v6 JSContext:v7];
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

void __71__SUUIApplicationController_appContext_evaluateAppJavaScriptInContext___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  id v5 = *(void **)(a1[4] + 128);
  id v6 = (id *)(*(void *)(a1[7] + 8) + 40);
  objc_storeStrong(v6, v5);
}

- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4
{
}

- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5
{
  if (self->_scriptContext == a3)
  {
    if ([(SUUIApplicationControllerOptions *)self->_options supportsFullApplicationReload])
    {
      if (a4 == 1)
      {
        self->_stopApplicationOnBackgroundNotification = 1;
      }
      else if (!a4)
      {
        uint64_t v7 = objc_opt_class();
        NSLog(&cfstr_ReloadingAppIm.isa, v7);
        [(SUUIApplicationController *)self _stopScriptContextForReload];
      }
    }
    else
    {
      NSLog(&cfstr_SkippingFullAp.isa);
    }
  }
}

- (void)appContextNeedsRestart:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3);
  uint64_t v4 = *MEMORY[0x263F833E0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__SUUIApplicationController_appContextNeedsRestart___block_invoke;
  v12[3] = &unk_2654019B0;
  id v5 = v3;
  id v13 = v5;
  uint64_t v14 = v4;
  uint64_t v6 = [v5 beginBackgroundTaskWithName:@"SUUIApplicationController.restartApp" expirationHandler:v12];
  [v5 suspend];
  id v7 = objc_alloc_init(MEMORY[0x263F7B108]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __52__SUUIApplicationController_appContextNeedsRestart___block_invoke_2;
  v9[3] = &unk_2654020C0;
  id v10 = v5;
  uint64_t v11 = v6;
  id v8 = v5;
  [v7 restartApplication:v9];
}

uint64_t __52__SUUIApplicationController_appContextNeedsRestart___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTask:*(void *)(a1 + 40)];
}

uint64_t __52__SUUIApplicationController_appContextNeedsRestart___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTask:*(void *)(a1 + 40)];
}

- (void)appContext:(id)a3 setPreviewOverlayDocument:(id)a4 withOptions:(id)a5
{
  id v28 = a4;
  id v7 = a5;
  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  id v9 = v28;
  if (v28)
  {
    id v10 = [v28 templateElement];
    if ([v10 elementType] == 91)
    {
      id v9 = v28;
    }
    else
    {
      NSLog(&cfstr_InvalidPreview.isa, v10);

      id v10 = 0;
      id v9 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v29 = v9;
  previewDocumentController = self->_previewDocumentController;
  if (previewDocumentController)
  {
    [v8 removeObserver:self name:0x2704F80F0 object:self->_previewDocumentController];
    id v12 = self->_previewDocumentController;
    self->_previewDocumentController = 0;
  }
  id v13 = [(SUUIApplicationController *)self _existingTabBarController];
  if (v29)
  {
    uint64_t v14 = [[SUUIPreviewDocumentController alloc] initWithDocument:v29];
    uint64_t v15 = self->_previewDocumentController;
    self->_previewDocumentController = v14;

    uint64_t v16 = self->_previewDocumentController;
    BOOL v17 = [(SUUIApplicationController *)self clientContext];
    [(SUUIPreviewDocumentController *)v16 setClientContext:v17];

    [v8 addObserver:self selector:sel__previewDocumentIsActiveChangeNotification_ name:0x2704F80F0 object:self->_previewDocumentController];
    BOOL v18 = [(SUUIPreviewDocumentController *)self->_previewDocumentController isPreviewActive];
    if (previewDocumentController) {
      char v19 = 1;
    }
    else {
      char v19 = v18;
    }
    if (self->_floatingStatusOverlayViewController)
    {
      if (v18)
      {
        uint64_t v20 = [v13 traitCollection];
        -[SUUIPreviewDocumentController overlayViewControllerWithBackgroundStyle:](self->_previewDocumentController, "overlayViewControllerWithBackgroundStyle:", [v20 userInterfaceStyle] != 1);
        long long v21 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v21 = 0;
      }
      floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
      self->_floatingStatusOverlayViewController = v21;
      uint64_t v24 = v21;

      SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v13, self->_floatingStatusOverlayViewController, 1);
    }
    uint64_t v25 = [v7 objectForKey:@"playsImmediately"];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v25 BOOLValue]
      && [(SUUIApplicationController *)self _playPreviewForPreviewTemplate:v10])
    {
      uint64_t v26 = [(SUUIApplicationController *)self _activeNavigationController];
      id v27 = [v26 topViewController];
      [(SUUIApplicationController *)self _showStatusOverlayForNavigationController:v26 viewController:v27 animated:1];
    }
    if (v19) {
LABEL_26:
    }
      [v8 postNotificationName:@"SUUIApplicationControllerPreviewOverlayDidChangeNotification" object:self userInfo:0];
  }
  else
  {
    if (self->_floatingStatusOverlayViewController)
    {
      SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v13, 0, 1);
      uint64_t v22 = self->_floatingStatusOverlayViewController;
      self->_floatingStatusOverlayViewController = 0;
    }
    if (previewDocumentController) {
      goto LABEL_26;
    }
  }
}

- (id)deviceConfigForContext:(id)a3
{
  deviceConfig = self->_deviceConfig;
  if (!deviceConfig)
  {
    id v5 = objc_alloc_init(SUUIAppDeviceConfig);
    uint64_t v6 = self->_deviceConfig;
    self->_deviceConfig = v5;

    deviceConfig = self->_deviceConfig;
  }
  return deviceConfig;
}

- (id)navigationControllerForContext:(id)a3
{
  id v4 = a3;
  if (self->_hidesTabBar)
  {
    id v5 = [(NSMutableArray *)self->_navigationDocumentControllers firstObject];
    uint64_t v6 = [MEMORY[0x263EFF9D0] null];

    if (v5 != v6) {
      goto LABEL_5;
    }
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

- (id)presentationViewControllerForAppContext:(id)a3
{
  uint64_t v3 = [(SUUIApplicationController *)self rootViewController];
  id v4 = [v3 presentedViewController];

  if (v4)
  {
    do
    {
      id v5 = [v3 presentedViewController];

      uint64_t v6 = [v5 presentedViewController];

      uint64_t v3 = v5;
    }
    while (v6);
  }
  else
  {
    id v5 = v3;
  }
  return v5;
}

- (id)activeDocument
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SUUIModalDocumentController *)self->_modalDocumentController documents];
  if ([v3 count])
  {
    id v4 = [v3 lastObject];
    goto LABEL_11;
  }
  if (self->_hidesTabBar)
  {
    id v5 = [(NSMutableArray *)self->_navigationDocumentControllers firstObject];
    uint64_t v6 = [MEMORY[0x263EFF9D0] null];

    if (v5 == v6)
    {
      id v4 = 0;
      goto LABEL_10;
    }
    id v7 = [v5 documents];
    id v4 = [(NSMutableArray *)v7 lastObject];
  }
  else
  {
    id v8 = [(SUUIApplicationController *)self _existingTabBarController];
    id v9 = [v8 transientViewController];

    if (v9)
    {
      id v5 = [(SUUINavigationDocumentController *)self->_transientNavigationDocument documents];
      id v4 = [v5 lastObject];
      goto LABEL_10;
    }
    uint64_t v11 = [(SUUIApplicationController *)self _existingTabBarController];
    id v5 = [v11 selectedViewController];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = self->_navigationDocumentControllers;
    id v4 = (void *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v4)
    {
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(MEMORY[0x263EFF9D0], "null", (void)v21);
          if (v14 == (void *)v15)
          {
          }
          else
          {
            uint64_t v16 = (void *)v15;
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              BOOL v18 = [v14 navigationController];

              if (v18 == v5
                || [v5 conformsToProtocol:&unk_2706A7860]
                && ([v5 appNavigationController],
                    char v19 = objc_claimAutoreleasedReturnValue(),
                    v19,
                    v19 == v14))
              {
                uint64_t v20 = [v14 documents];
                id v4 = [v20 lastObject];

                goto LABEL_6;
              }
            }
          }
        }
        id v4 = (void *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
  }
LABEL_6:

LABEL_10:
LABEL_11:

  return v4;
}

- (id)appIdentifier
{
  return @"com.apple.iTunesStoreUI.ITML";
}

- (BOOL)appIsTrusted
{
  return 1;
}

- (id)appJSURL
{
  return self->_applicationScriptURL;
}

- (BOOL)appJSURLTrusted
{
  return 1;
}

- (id)appLaunchParams
{
  return self->_launchOptions;
}

- (id)localStorage
{
  v16[3] = *MEMORY[0x263EF8340];
  if (!self->_localStorage)
  {
    if ([(SUUIApplicationControllerOptions *)self->_options useTransientStorageForTests])
    {
      uint64_t v3 = objc_alloc_init(SUUITransientAppDataStorage);
      localStorage = self->_localStorage;
      self->_localStorage = (IKAppDataStoring *)v3;
    }
    else
    {
      id v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      uint64_t v6 = [v5 firstObject];

      if (v6)
      {
        id v7 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", v6);
        id v8 = [v7 bundleIdentifier];
        v16[1] = v8;
        v16[2] = @"com.apple.iTunesStoreUI.localStorage";
        id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

        id v10 = [NSString pathWithComponents:v9];
        uint64_t v11 = [v10 stringByAppendingPathExtension:@"plist"];

        uint64_t v12 = (IKAppDataStoring *)[objc_alloc(MEMORY[0x263F4B3D0]) initWithFilePath:v11 identifier:@"com.apple.iTunesStoreUI.localStorage"];
        id v13 = self->_localStorage;
        self->_localStorage = v12;
      }
    }
  }
  uint64_t v14 = self->_localStorage;
  return v14;
}

- (BOOL)shouldIgnoreJSValidation
{
  return 1;
}

- (id)vendorIdentifier
{
  id v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 identifierForVendor];
  id v4 = [v3 UUIDString];

  return v4;
}

- (id)vendorStorage
{
  v16[3] = *MEMORY[0x263EF8340];
  if (!self->_vendorStorage)
  {
    if ([(SUUIApplicationControllerOptions *)self->_options useTransientStorageForTests])
    {
      uint64_t v3 = objc_alloc_init(SUUITransientAppDataStorage);
      vendorStorage = self->_vendorStorage;
      self->_vendorStorage = (IKAppDataStoring *)v3;
    }
    else
    {
      id v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      uint64_t v6 = [v5 firstObject];

      if (v6)
      {
        id v7 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", v6);
        id v8 = [v7 bundleIdentifier];
        v16[1] = v8;
        v16[2] = @"com.apple.iTunesStoreUI.vendorStorage";
        id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

        id v10 = [NSString pathWithComponents:v9];
        uint64_t v11 = [v10 stringByAppendingPathExtension:@"plist"];

        uint64_t v12 = (IKAppDataStoring *)[objc_alloc(MEMORY[0x263F4B3D0]) initWithFilePath:v11 identifier:@"com.apple.iTunesStoreUI.vendorStorage"];
        id v13 = self->_vendorStorage;
        self->_vendorStorage = v12;
      }
    }
  }
  uint64_t v14 = self->_vendorStorage;
  return v14;
}

- (int64_t)modalDocumentController:(id)a3 barStyleForStackItem:(id)a4
{
  id v5 = objc_msgSend(a4, "presentationType", a3);
  int v6 = [v5 isEqualToString:0x27050BF50];

  if (!v6) {
    return 0;
  }
  if (self->_hidesTabBar)
  {
    id v7 = [(NSMutableArray *)self->_navigationDocumentControllers firstObject];
    id v8 = [MEMORY[0x263EFF9D0] null];

    if (v7 == v8)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [v7 navigationController];
    }
  }
  else
  {
    id v7 = [(SUUIApplicationController *)self _existingTabBarController];
    uint64_t v11 = [v7 transientViewController];
    if (!v11)
    {
      uint64_t v11 = [v7 selectedViewController];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
    }
    else
    {
      id v12 = [v11 navigationController];
    }
    id v9 = v12;
  }
  if (v9)
  {
    id v13 = [v9 navigationBar];
    int64_t v10 = [v13 barStyle];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (void)modalDocumentControllerDidFinish:(id)a3
{
  if ([(SUUIApplicationController *)self _needsStatusOverlay])
  {
    id v4 = [(SUUIApplicationController *)self rootViewController];
    id v5 = [v4 view];

    [v5 bounds];
    if ([(SUUIApplicationController *)self _usesFloatingStatusOverlayForWidth:v6])
    {
      [(SUUIApplicationController *)self _showFloatingStatusOverlayAnimated:1];
    }
  }
  id v10 = [(SUUIApplicationController *)self _activeNavigationController];
  id v7 = [v10 topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v7, "suui_viewWillAppear:", 1);
  }
  id v8 = [(SUUIApplicationController *)self activeDocument];
  id v9 = v8;
  if (v8) {
    [v8 onAppear];
  }
}

- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4
{
  id v12 = a3;
  double v6 = (void (**)(id, void))a4;
  if (!self->_hidesTabBar)
  {
    id v7 = [(SUUIApplicationController *)self _existingTabBarController];
    id v9 = [v7 transientViewController];
    if (!v9)
    {
      id v9 = [v7 selectedViewController];
    }
    uint64_t v10 = SUUIViewControllerGetTopMostViewController(v9);
    goto LABEL_7;
  }
  id v7 = [(NSMutableArray *)self->_navigationDocumentControllers firstObject];
  id v8 = [MEMORY[0x263EFF9D0] null];

  if (v7 != v8)
  {
    id v9 = [v7 navigationController];
    uint64_t v10 = [v9 topViewController];
LABEL_7:
    uint64_t v11 = (void *)v10;

    goto LABEL_9;
  }
  uint64_t v11 = 0;
LABEL_9:

  if ([v11 conformsToProtocol:&unk_270654A60]) {
    [v11 getModalSourceViewForElementIdentifier:v12 completionBlock:v6];
  }
  else {
    v6[2](v6, 0);
  }
}

- (id)jsNavigationDocumentForNavigationController:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SUUIApplicationController.m" lineNumber:1314 description:@"This is invalid."];
  }
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__91;
  long long v22 = __Block_byref_object_dispose__91;
  id v23 = 0;
  id v9 = [(SUUIClientContext *)self->_clientContext _scriptAppContext];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__SUUIApplicationController_jsNavigationDocumentForNavigationController_inContext___block_invoke;
  v15[3] = &unk_2654083B0;
  BOOL v17 = &v18;
  v15[4] = self;
  id v10 = v7;
  id v16 = v10;
  [v9 evaluateDelegateBlockSync:v15];

  uint64_t v11 = v19[5];
  if (v11)
  {
    id v12 = [(SUUIApplicationController *)self jsNavigationDocumentForNavigationDocumentController:v11 inContext:v8];
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __83__SUUIApplicationController_jsNavigationDocumentForNavigationController_inContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _documentControllerForNavigationController:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)jsNavigationDocumentForNavigationDocumentController:(id)a3 inContext:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SUUIApplicationController.m" lineNumber:1333 description:@"This is invalid."];
  }
  id v9 = [v8 objectForKeyedSubscript:@"TabBar"];
  id v10 = [v9 toObjectOfClass:objc_opt_class()];

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__91;
  uint64_t v30 = __Block_byref_object_dispose__91;
  id v31 = 0;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v11 = [(SUUIApplicationController *)self _transientNavigationController];
    id v12 = (void *)v27[5];
    v27[5] = v11;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__SUUIApplicationController_jsNavigationDocumentForNavigationDocumentController_inContext___block_invoke;
    block[3] = &unk_2654008E0;
    void block[4] = self;
    void block[5] = &v26;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
  if ((id)v27[5] == v7)
  {
    id v13 = [v10 transientTab];
    BOOL v17 = [v13 navigationDocument];
  }
  else
  {
    [v10 tabs];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v13);
          }
          BOOL v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "navigationDocument", (void)v21);
          id v18 = [v17 navigationControllerDelegate];
          if (v18 == v7)
          {

            goto LABEL_17;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v32 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    BOOL v17 = 0;
LABEL_17:
  }
  _Block_object_dispose(&v26, 8);

  return v17;
}

uint64_t __91__SUUIApplicationController_jsNavigationDocumentForNavigationDocumentController_inContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _transientNavigationController];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

void __95__SUUIApplicationController_navigationDocumentController_requestsAccessToAppContextUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) _scriptAppContext];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)navigationDocumentStackDidChange:(id)a3
{
  uint64_t v4 = [a3 documents];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(SUUIApplicationController *)self _sendDidDisplayFirstPageIfNecessary];
  }
}

- (void)tabBarController:(id)a3 willDisplayViewController:(id)a4
{
  id v6 = a4;
  id v7 = [a3 viewControllers];
  uint64_t v8 = [v7 indexOfObject:v6];

  [(SUUIApplicationController *)self _dispatchTabBarOnNeedsContentForTabAtIndex:v8];
}

- (void)URLResolver:(id)a3 didFinishWithResult:(BOOL)a4
{
  -[SUUIURLResolver setDelegate:](self->_urlResolver, "setDelegate:", 0, a4);
  [(SUUIURLResolver *)self->_urlResolver setNavigationControllerDelegate:0];
  urlResolver = self->_urlResolver;
  self->_urlResolver = 0;
}

- (BOOL)URLResolver:(id)a3 shouldPerformDefaultActionForURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  scriptContext = self->_scriptContext;
  if (scriptContext)
  {
    launchOptions = self->_launchOptions;
    if (launchOptions)
    {
      id v10 = (NSDictionary *)[(NSDictionary *)launchOptions mutableCopy];
      uint64_t v11 = [v7 underlyingURL];
      id v12 = [v11 absoluteString];

      [(NSDictionary *)v10 setValue:v12 forKey:@"url"];
      id v13 = self->_launchOptions;
      self->_launchOptions = v10;
    }
    else
    {
      id v12 = [(SUUIApplicationController *)self _launchOptionsWithURL:v7];
      id v13 = +[SUUIURLResolver tabIdentifierForURL:v7];
      if (v13)
      {
        [v12 removeObjectForKey:@"url"];
        [v12 setObject:v13 forKeyedSubscript:@"selectedTabId"];
      }
      [(SUUIApplicationController *)self resumeApplicationWithOptions:v12];
    }
  }
  return scriptContext == 0;
}

- (void)URLResolver:(id)a3 showTransientViewController:(id)a4
{
}

- (void)URLResolver:(id)a3 showURL:(id)a4 withTabIdentifier:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  uint64_t v8 = [(SUUIApplicationController *)self _existingTabBarController];
  [v8 setTransientViewController:0 animated:0];

  id v9 = [(SUUIApplicationController *)self selectTabWithIdentifier:v7];

  if (v9)
  {
    id v10 = (id)[v9 popToRootViewControllerAnimated:0];
    uint64_t v11 = [v9 viewControllers];
    id v12 = [v11 firstObject];

    if (v13 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v12 showExternalURL:v13];
    }
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a3;
  if ([(SUUIApplicationController *)self _sendNativeBackButtonMetricEvents]
    && self->_lastNavigationControllerOperation == 2)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F7B228]);
    [v7 setActionType:*MEMORY[0x263F7BB08]];
    [v7 setTargetType:*MEMORY[0x263F7BBA8]];
    [v7 setTargetIdentifier:@"back"];
    if (self->_lastPoppedViewController
      && ((objc_opt_respondsToSelector() & 1) == 0
        ? (uint64_t v8 = 0)
        : ([(UIViewController *)self->_lastPoppedViewController activeMetricsController],
           uint64_t v8 = objc_claimAutoreleasedReturnValue()),
          -[SUUIClientContext metricsPageContextForViewController:](self->_clientContext, "metricsPageContextForViewController:", self->_lastPoppedViewController), id v9 = objc_claimAutoreleasedReturnValue(), [v7 setPageContext:v9], v9, v8))
    {
      [v8 recordEvent:v7];
    }
    else
    {
      [(SUUIApplicationController *)self recordMetricsEvent:v7 flushImmediately:0];
    }
  }
  id v11 = [(SUUIApplicationController *)self _documentControllerForNavigationController:v6];
  [v11 ensureStackConsistencyForNavigationControllerOperation:self->_lastNavigationControllerOperation operationDidComplete:1];
  [(SUUIModalDocumentController *)self->_modalDocumentController ensureOverlayNavigationControllerStackConsistencyForNavigationController:v6];

  lastPoppedViewController = self->_lastPoppedViewController;
  self->_lastPoppedViewController = 0;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(SUUIApplicationController *)self _ensureStackConsistencyForNavigationController:v8];
  if ([(SUUIApplicationController *)self _needsStatusOverlay]) {
    [(SUUIApplicationController *)self _showStatusOverlayForNavigationController:v8 viewController:v9 animated:v5];
  }
  id v10 = +[SUUINavigationControllerAssistant assistantForNavigationController:v8 clientContext:self->_clientContext];
  [v10 willShowViewController:v9 animated:v5];
  if (self->_lastNavigationControllerOperation == 2)
  {
    char v11 = [v8 isInteractiveTransition];
    scriptContext = self->_scriptContext;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __82__SUUIApplicationController_navigationController_willShowViewController_animated___block_invoke;
    v13[3] = &__block_descriptor_33_e19_v16__0__JSContext_8l;
    char v14 = v11;
    [(IKAppContext *)scriptContext evaluate:v13 completionBlock:0];
  }
}

void __82__SUUIApplicationController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"itms"];
  id v4 = [v3 toObjectOfClass:objc_opt_class()];

  [v4 sendOnNavigationStackWillPop:*(unsigned __int8 *)(a1 + 32)];
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  uint64_t v3 = [a3 topViewController];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 supportedInterfaceOrientations];
  }
  else
  {
    id v6 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 == 1)
    {
      unint64_t v5 = 30;
    }
    else if (SUUIAllowsLandscapePhone())
    {
      unint64_t v5 = 26;
    }
    else
    {
      unint64_t v5 = 2;
    }
  }

  return v5;
}

- (void)tabBarController:(id)a3 didEndCustomizingViewControllers:(id)a4 changed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (v5)
  {
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v7;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      uint64_t v26 = v30;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * v12);
          navigationDocumentControllers = self->_navigationDocumentControllers;
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __87__SUUIApplicationController_tabBarController_didEndCustomizingViewControllers_changed___block_invoke;
          v31[3] = &unk_265405FD0;
          v31[4] = v13;
          uint64_t v15 = -[NSMutableArray indexOfObjectPassingTest:](navigationDocumentControllers, "indexOfObjectPassingTest:", v31, v25, v26);
          if (v15 != 0x7FFFFFFFFFFFFFFFLL
            || (tabBarItems = self->_tabBarItems,
                v29[0] = MEMORY[0x263EF8330],
                v29[1] = 3221225472,
                v30[0] = __87__SUUIApplicationController_tabBarController_didEndCustomizingViewControllers_changed___block_invoke_2,
                v30[1] = &unk_2654083D8,
                v30[2] = v13,
                uint64_t v15 = [(NSArray *)tabBarItems indexOfObjectPassingTest:v29],
                v15 != 0x7FFFFFFFFFFFFFFFLL))
          {
            BOOL v17 = [(NSMutableArray *)self->_navigationDocumentControllers objectAtIndex:v15];
            [(NSMutableArray *)v8 addObject:v17];

            id v18 = [(NSArray *)self->_tabBarItems objectAtIndex:v15];
            [v28 addObject:v18];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v10);
    }

    char v19 = self->_navigationDocumentControllers;
    self->_navigationDocumentControllers = v8;
    uint64_t v20 = v8;

    long long v21 = (NSArray *)[v28 copy];
    long long v22 = self->_tabBarItems;
    self->_tabBarItems = v21;

    [(IKAppContext *)self->_scriptContext evaluate:&__block_literal_global_292 completionBlock:0];
    long long v23 = [(SUUIApplicationController *)self delegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24) {
      [v23 applicationDidCustomizeTabBarItems:self];
    }

    id v7 = v25;
  }
}

BOOL __87__SUUIApplicationController_tabBarController_didEndCustomizingViewControllers_changed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9D0] null];
  if (v4 == v3)
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v5 = [v3 navigationController];
    BOOL v6 = v5 == *(void **)(a1 + 32);
  }
  return v6;
}

BOOL __87__SUUIApplicationController_tabBarController_didEndCustomizingViewControllers_changed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 customRootViewController];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __87__SUUIApplicationController_tabBarController_didEndCustomizingViewControllers_changed___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:@"TabBar"];
  id v3 = [v2 toObjectOfClass:objc_opt_class()];

  [v3 sendOnUpdate];
}

- (void)tabBarController:(id)a3 didReselectViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(SUUIApplicationController *)self delegate];
  id v8 = [v7 allViewControllers];

  unint64_t v9 = [v8 indexOfObjectIdenticalTo:v6];
  if (v9 < [(NSArray *)self->_tabBarItems count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v10 = [(NSArray *)self->_tabBarItems objectAtIndex:v9];
    [v11 application:self didReselectTabBarItem:v10];
  }
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = [v24 allViewControllers];
  uint64_t v8 = [v7 indexOfObjectIdenticalTo:v6];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_21;
  }
  int64_t v9 = v8;
  uint64_t v10 = SUUITabBarControllerGetMoreNavigationController(v24);
  if (v10 && (uint64_t v11 = [v7 indexOfObjectIdenticalTo:v10], v9 >= v11))
  {
    if (v9 <= v11) {
      goto LABEL_8;
    }
    uint64_t v12 = [(NSMutableArray *)self->_navigationDocumentControllers objectAtIndex:v9 - 1];
    long long v23 = [MEMORY[0x263EFF9D0] null];

    if (v12 != v23)
    {
      char v14 = v12;
      uint64_t v15 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = [(NSMutableArray *)self->_navigationDocumentControllers objectAtIndex:v9];
    uint64_t v13 = [MEMORY[0x263EFF9D0] null];

    if (v12 != v13)
    {
      char v14 = v12;
      uint64_t v15 = 0;
LABEL_6:
      [v14 setMoreNavigationController:v15];
    }
  }

LABEL_8:
  [(SUUIApplicationController *)self _dispatchTabBarOnSelect];
  [(SUUIApplicationController *)self _tintTabBarWithViewController:v6];
  id v16 = [(SUUIApplicationController *)self _overlayNavigationControllerForViewController:v6];
  if (!v16)
  {
    id v16 = [v6 navigationController];
  }
  if ([(SUUIApplicationController *)self _needsStatusOverlay])
  {
    BOOL v17 = [v16 topViewController];
    [(SUUIApplicationController *)self _showStatusOverlayForNavigationController:v16 viewController:v17 animated:0];
  }
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1 && v16)
  {
    id v18 = [(SUUIApplicationController *)self rootViewController];
    char v19 = [v18 view];

    [v19 bounds];
    if (v20 > SUUICompactThreshold())
    {
      [(SUUIModalDocumentController *)self->_modalDocumentController presentOverlayViewControllersFromNavigationController:v16];

      id v16 = 0;
    }
    [(SUUIModalDocumentController *)self->_modalDocumentController setOverlayNavigationController:v16 withTransitionCoordinator:0];
  }
  long long v21 = [(SUUIApplicationController *)self delegate];
  if (v9 < [(NSArray *)self->_tabBarItems count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v22 = [(NSArray *)self->_tabBarItems objectAtIndex:v9];
    [v21 application:self didSelectTabBarItem:v22];
  }
LABEL_21:
}

- (BOOL)tabBarController:(id)a3 shouldFallbackToRootForController:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 topViewController];

    id v4 = (id)v5;
  }
  char v6 = [v4 isEditing];

  return v6 ^ 1;
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 containsTransientViewControllerOnly])
  {
    BOOL v8 = 0;
  }
  else
  {
    int64_t scriptLoadState = self->_scriptLoadState;
    if (scriptLoadState == 1)
    {
      [(SUUIApplicationController *)self _retryAfterFailure];
    }
    else if (scriptLoadState == 4)
    {
      [(SUUIApplicationController *)self _recordTabBarMetricsEventToSelectViewController:v7];
    }
    [(SUUIApplicationController *)self setUserInterfaceOverrideOnTabBarController:v6 forViewController:v7];
    BOOL v8 = 1;
  }

  return v8;
}

- (void)setUserInterfaceOverrideOnTabBarController:(id)a3 forViewController:(id)a4
{
  id v6 = a4;
  id v11 = a3;
  id v7 = [v11 viewControllers];
  unint64_t v8 = [v7 indexOfObjectIdenticalTo:v6];

  if (v8 >= [(NSArray *)self->_tabBarItems count])
  {
    uint64_t v10 = 0;
  }
  else
  {
    int64_t v9 = [(NSArray *)self->_tabBarItems objectAtIndex:v8];
    if ([v9 barTintStyle] == 1) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = [v9 barTintStyle] == 0;
    }
  }
  [v11 setForcedUserInterfaceStyle:v10];
  [v11 setNeedsUserInterfaceAppearanceUpdate];
}

- (void)tabBarController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = self->_floatingStatusOverlayViewController != 0;
  BOOL v12 = [(SUUIApplicationController *)self _usesFloatingStatusOverlayForWidth:width];
  if ([(SUUIApplicationController *)self _needsStatusOverlay] && !v12)
  {
    SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v9, 0, [v10 isAnimated]);
    floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
    self->_floatingStatusOverlayViewController = 0;
  }
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __93__SUUIApplicationController_tabBarController_willTransitionToSize_withTransitionCoordinator___block_invoke;
  v40[3] = &unk_265408400;
  v40[4] = self;
  double v43 = width;
  double v44 = height;
  BOOL v45 = v11;
  BOOL v46 = v12;
  id v14 = v9;
  id v41 = v14;
  id v15 = v10;
  id v42 = v15;
  [v15 animateAlongsideTransition:0 completion:v40];
  id v16 = [(SUUIApplicationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v16, "application:willTransitionToSize:withTransitionCoordinator:", self, v15, width, height);
  }
  BOOL v17 = [v14 selectedViewController];
  id v18 = [(SUUIApplicationController *)self clientContext];
  char v19 = [(SUUIApplicationController *)self rootViewController];
  double v20 = [v19 view];
  [v20 bounds];
  uint64_t v22 = [v18 tabBarStyleForWidth:v21];

  long long v23 = [(SUUIApplicationController *)self clientContext];
  uint64_t v24 = [v23 tabBarStyleForWidth:width];

  char v25 = v24 == 0;
  char v26 = v22 == 0;
  id v39 = v16;
  if ([v17 conformsToProtocol:&unk_2706A77A0])
  {
    char v25 = [v17 documentViewControllerIsCompactForWidth:width];
    id v27 = [(SUUIApplicationController *)self rootViewController];
    id v28 = [v27 view];
    [v28 bounds];
    char v26 = [v17 documentViewControllerIsCompactForWidth:v29];
  }
  uint64_t v30 = [v17 presentedViewController];
  if (v22 == v24) {
    char v31 = v26 ^ v25 ^ 1;
  }
  else {
    char v31 = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((v31 & 1) == 0 && (isKindOfClass & 1) == 0)
  {
    long long v33 = [(SUUIApplicationController *)self delegate];
    char v34 = objc_opt_respondsToSelector();

    if ((v34 & 1) == 0
      || ([(SUUIApplicationController *)self delegate],
          long long v35 = objc_claimAutoreleasedReturnValue(),
          int v36 = [v35 application:self shouldDismissPopoverOnTraitCollectionChange:v30],
          v35,
          v36))
    {
      if (v30 && [v30 modalPresentationStyle] == 7) {
        [v30 dismissViewControllerAnimated:0 completion:0];
      }
    }
  }
  uint64_t v37 = [(SUUIApplicationController *)self _overlayNavigationControllerForViewController:v17];
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1 && v37)
  {
    if (width <= SUUICompactThreshold()) {
      BOOL v38 = v37;
    }
    else {
      BOOL v38 = 0;
    }
    [(SUUIModalDocumentController *)self->_modalDocumentController setOverlayNavigationController:v38 withTransitionCoordinator:v15];
  }
}

uint64_t __93__SUUIApplicationController_tabBarController_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "sendApplicationWindowSizeDidUpdate:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t result = [*(id *)(a1 + 32) _needsStatusOverlay];
  if (!result || *(unsigned __int8 *)(a1 + 72) == *(unsigned __int8 *)(a1 + 73)) {
    return result;
  }
  id v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 73))
  {
    [v3 _removeStatusOverlayFromAllNavigationControllers];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 264) navigationController];
    BOOL v17 = +[SUUINavigationControllerAssistant existingAssistantForNavigationController:v4];

    [v17 setStatusOverlayProvider:0];
    uint64_t v5 = [*(id *)(a1 + 40) allViewControllers];
    unint64_t v6 = [v5 count];
    id v7 = [*(id *)(a1 + 40) viewControllers];
    unint64_t v8 = [v7 count];

    if (v6 > v8)
    {
      id v9 = SUUITabBarControllerGetMoreNavigationController(*(void **)(a1 + 40));
      id v10 = +[SUUINavigationControllerAssistant existingAssistantForNavigationController:v9];
      [v10 setStatusOverlayProvider:0];
    }
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "_showFloatingStatusOverlayAnimated:", objc_msgSend(*(id *)(a1 + 48), "isAnimated"));
    goto LABEL_10;
  }
  uint64_t v11 = [v3 _activeNavigationController];
  uint64_t v12 = v11;
  if (v11)
  {
    BOOL v17 = (void *)v11;
    uint64_t v13 = +[SUUINavigationControllerAssistant assistantForNavigationController:v11 clientContext:*(void *)(*(void *)(a1 + 32) + 32)];
    id v14 = *(void **)(a1 + 32);
    id v15 = [v17 topViewController];
    id v16 = [v14 _statusOverlayProviderForViewController:v15];
    [v13 setStatusOverlayProvider:v16];

LABEL_10:
    uint64_t v12 = (uint64_t)v17;
  }
  return MEMORY[0x270F9A758](v11, v12);
}

- (void)_previewDocumentIsActiveChangeNotification:(id)a3
{
  id v4 = a3;
  if (self->_previewDocumentController)
  {
    id v12 = v4;
    uint64_t v5 = [v4 object];
    unint64_t v6 = v5;
    if (v5 == self->_previewDocumentController)
    {
      BOOL v7 = [(SUUIPreviewDocumentController *)v5 isPreviewActive];

      id v4 = v12;
      if (v7) {
        goto LABEL_8;
      }
      unint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
      unint64_t v8 = [v12 name];
      [v6 removeObserver:self name:v8 object:self->_previewDocumentController];

      previewDocumentController = self->_previewDocumentController;
      self->_previewDocumentController = 0;

      if (self->_floatingStatusOverlayViewController)
      {
        id v10 = [(SUUIApplicationController *)self _existingTabBarController];
        SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v10, 0, 1);

        floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
        self->_floatingStatusOverlayViewController = 0;
      }
      [v6 postNotificationName:@"SUUIApplicationControllerPreviewOverlayDidChangeNotification" object:self userInfo:0];
    }

    id v4 = v12;
  }
LABEL_8:
}

- (void)_reloadAfterNetworkChange:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUUIApplicationController__reloadAfterNetworkChange___block_invoke;
  block[3] = &unk_265400980;
  void block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __55__SUUIApplicationController__reloadAfterNetworkChange___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 216) == 1)
  {
    id v2 = [MEMORY[0x263F894C0] sharedInstance];
    uint64_t v3 = [v2 networkType];

    if (v3)
    {
      dispatch_time_t v4 = *(void **)(a1 + 32);
      [v4 _retryAfterFailure];
    }
  }
}

- (void)_removeStatusOverlayFromAllNavigationControllers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = self->_navigationDocumentControllers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        unint64_t v8 = objc_msgSend(MEMORY[0x263EFF9D0], "null", (void)v11);

        if (v7 != v8)
        {
          id v9 = [v7 navigationController];
          id v10 = +[SUUINavigationControllerAssistant existingAssistantForNavigationController:v9];

          [v10 setStatusOverlayProvider:0];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)_storeFrontChangeNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUUIApplicationController__storeFrontChangeNotification___block_invoke;
  block[3] = &unk_265400980;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__SUUIApplicationController__storeFrontChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F7B148] currentDevice];
  id v9 = [v2 storeFrontIdentifier];

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) storeFrontIdentifier];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4[4] && ([v4 _isStoreFront:v3 equalToStoreFront:v9] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 208) appScriptFallbackHandler];
    [v5 invalidate];

    uint64_t v6 = [MEMORY[0x263F89540] sharedCache];
    [v6 invalidateAllURLBags];

    BOOL v7 = [MEMORY[0x263F7B0E8] defaultStore];
    [v7 reloadAccounts];

    if ([*(id *)(a1 + 32) _isDisplayingAccountViewController])
    {
      unint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 removeObserver:*(void *)(a1 + 32) name:@"SUAccountViewControllerDidDisappearNotification" object:0];
      [v8 addObserver:*(void *)(a1 + 32) selector:sel__resetUserInteraceForAccountViewDisappear_ name:@"SUAccountViewControllerDidDisappearNotification" object:0];
    }
    else
    {
      [*(id *)(a1 + 32) _resetUserInterfaceAfterStoreFrontChange];
    }
  }
}

- (int64_t)_applicationMode
{
  int64_t scriptLoadState = self->_scriptLoadState;
  if (scriptLoadState == 4) {
    return 2;
  }
  else {
    return scriptLoadState == 3;
  }
}

- (NSArray)_navigationControllers
{
  return (NSArray *)self->_navigationDocumentControllers;
}

- (void)_resetDocumentControllers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = self->_navigationDocumentControllers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = objc_msgSend(MEMORY[0x263EFF9D0], "null", (void)v10);

        if (v8 != v9) {
          [v8 popAllDocuments];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(SUUINavigationDocumentController *)self->_transientNavigationDocument popAllDocuments];
  if ([(SUUIApplicationController *)self _applicationMode] == 2) {
    [(SUUIApplicationController *)self _reloadRootViewControllers];
  }
}

- (int64_t)_selectedTabBarIndex
{
  if (self->_hidesTabBar) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v3 = [(SUUIApplicationController *)self _existingTabBarController];
  uint64_t v4 = v3;
  if (v3) {
    int64_t v2 = [v3 selectedIndex];
  }
  else {
    int64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

- (void)_setSelectedTabBarIndex:(int64_t)a3
{
  id v8 = [(SUUIApplicationController *)self _existingTabBarController];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(SUUIApplicationController *)self _transientNavigationDocument];
    uint64_t v6 = [v5 navigationController];

    [v8 setTransientViewController:v6 animated:0];
    [(SUUIApplicationController *)self _tintTabBarWithViewController:v6];
  }
  else
  {
    [v8 setSelectedIndex:a3];
    uint64_t v7 = [v8 selectedViewController];
    [(SUUIApplicationController *)self _tintTabBarWithViewController:v7];

    uint64_t v6 = [v8 selectedViewController];
    [(SUUIApplicationController *)self _updateOverlayNavigationController:v6];
  }
}

- (void)_stopApplication
{
  if (self->_scriptContext && self->_scriptLoadState != 6)
  {
    uint64_t v3 = [[_SUUIApplicationShutdownHelper alloc] initWithApplicationController:self];
    shutdownHelper = self->_shutdownHelper;
    self->_shutdownHelper = v3;

    [(_SUUIApplicationShutdownHelper *)self->_shutdownHelper start];
    self->_int64_t scriptLoadState = 6;
    scriptContext = self->_scriptContext;
    [(IKAppContext *)scriptContext stop];
  }
}

- (SUUINavigationDocumentController)_transientNavigationController
{
  if (self->_hidesTabBar) {
    [(NSMutableArray *)self->_navigationDocumentControllers firstObject];
  }
  else {
  int64_t v2 = [(SUUIApplicationController *)self _transientNavigationDocument];
  }
  return (SUUINavigationDocumentController *)v2;
}

- (id)_activeNavigationController
{
  if (!self->_hidesTabBar)
  {
    int64_t v2 = [(SUUIApplicationController *)self _existingTabBarController];
    uint64_t v4 = SUUITabBarControllerGetActiveNavigationController(v2);
    goto LABEL_5;
  }
  int64_t v2 = [(NSMutableArray *)self->_navigationDocumentControllers firstObject];
  uint64_t v3 = [MEMORY[0x263EFF9D0] null];

  if (v2 != v3)
  {
    uint64_t v4 = [v2 navigationController];
LABEL_5:
    uint64_t v5 = (void *)v4;
    goto LABEL_7;
  }
  uint64_t v5 = 0;
LABEL_7:

  return v5;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  [(SUUIClientContext *)self->_clientContext sendApplicationDidEnterBackground];
  if (self->_stopApplicationOnBackgroundNotification)
  {
    self->_stopApplicationOnBackgroundNotification = 0;
    [(SUUIApplicationController *)self _removeObserversForReloadNotifications];
    [(_SUUIApplicationShutdownHelper *)self->_shutdownHelper stop];
    uint64_t v4 = [[_SUUIApplicationShutdownHelper alloc] initWithApplicationController:self];
    shutdownHelper = self->_shutdownHelper;
    self->_shutdownHelper = v4;

    [(_SUUIApplicationShutdownHelper *)self->_shutdownHelper start];
    uint64_t v6 = objc_opt_class();
    NSLog(&cfstr_ReloadingAppOn.isa, v6);
    [(SUUIApplicationController *)self _stopScriptContextForReload];
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  [(SUUIClientContext *)self->_clientContext sendApplicationWillEnterForeground];
  if (self->_reloadApplicationOnForegroundNotification)
  {
    self->_reloadApplicationOnForegroundNotification = 0;
    if (self->_scriptLoadState == 1)
    {
      [(SUUIApplicationController *)self _retryAfterFailure];
    }
    else
    {
      [(SUUIApplicationController *)self _reloadApplication];
    }
  }
}

- (void)_dispatchTabBarOnNeedsContentForTabAtIndex:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = v3;
    uint64_t v16 = v4;
    if ([(NSArray *)self->_tabBarItems count] > a3)
    {
      uint64_t v7 = [(NSArray *)self->_tabBarItems objectAtIndex:a3];
      id v8 = [(NSMutableArray *)self->_navigationDocumentControllers objectAtIndex:a3];
      id v9 = [MEMORY[0x263EFF9D0] null];

      if (v8 == v9
        || ([v8 documentStackItems],
            long long v10 = objc_claimAutoreleasedReturnValue(),
            uint64_t v11 = [v10 count],
            v10,
            !v11))
      {
        if (self->_scriptLoadState == 3)
        {
          scriptContext = self->_scriptContext;
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __72__SUUIApplicationController__dispatchTabBarOnNeedsContentForTabAtIndex___block_invoke;
          v13[3] = &unk_2654022D0;
          id v14 = v7;
          [(IKAppContext *)scriptContext evaluate:v13 completionBlock:0];
          self->_indexOfLastTabNeedingContent = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          self->_indexOfLastTabNeedingContent = a3;
        }
      }
    }
  }
}

void __72__SUUIApplicationController__dispatchTabBarOnNeedsContentForTabAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"TabBar"];
  id v4 = [v3 toObjectOfClass:objc_opt_class()];

  [v4 sendOnNeedsContentForTabBarItem:*(void *)(a1 + 32)];
}

- (void)_dispatchTabBarOnSelect
{
}

void __52__SUUIApplicationController__dispatchTabBarOnSelect__block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = [a2 objectForKeyedSubscript:@"TabBar"];
  id v4 = [v2 toObjectOfClass:objc_opt_class()];

  id v3 = (id)[v4 invokeMethod:@"onSelect" withArguments:0];
}

- (void)_failReloadWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(objc_class *)self->_clientContextClass _fallbackConfigurationDictionary];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    NSLog(&cfstr_DidFailLoading.isa, v5, v6);
    [(SUUIApplicationController *)self _setClientContextWithDictionary:v4];
  }
  else
  {
    [(SUUIApplicationController *)self _failWithError:v6];
  }
}

- (void)_failWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  NSLog(&cfstr_DidFailWithErr.isa, v5, v4);
  self->_int64_t scriptLoadState = 1;
  if (([(IKAppContext *)self->_scriptContext isValid] & 1) == 0)
  {
    scriptContext = self->_scriptContext;
    self->_scriptContext = 0;
  }
  +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:&__block_literal_global_331];
  if (ISErrorIsEqual())
  {
    uint64_t v7 = [MEMORY[0x263EFC600] sharedURLCache];
    [v7 removeAllCachedResponses];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 application:self didFailToLoadWithError:v4];
  }
  if (!self->_clientContext)
  {
    uint64_t v11 = [(NSMutableArray *)self->_navigationDocumentControllers count];
    tabBarItems = self->_tabBarItems;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __44__SUUIApplicationController__failWithError___block_invoke_2;
    v16[3] = &unk_265408428;
    void v16[4] = self;
    void v16[5] = v11;
    [(NSArray *)tabBarItems enumerateObjectsUsingBlock:v16];
  }
  long long v13 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v14 = *MEMORY[0x263F89418];
  uint64_t v15 = [MEMORY[0x263F894C0] sharedInstance];
  [v13 addObserver:self selector:sel__reloadAfterNetworkChange_ name:v14 object:v15];

  self->_reloadApplicationOnForegroundNotification = 1;
}

void __44__SUUIApplicationController__failWithError___block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = (void *)MEMORY[0x263EFF910];
  id v3 = a2;
  id v4 = [v2 date];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "setLaunchFailureTime:");
}

void __44__SUUIApplicationController__failWithError___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 40) > a3)
  {
    id v16 = v5;
    id v6 = SUUIErrorDocumentTitle(*(void **)(*(void *)(a1 + 32) + 32));
    BOOL v7 = [v16 barTintStyle] == 1;
    id v8 = [*(id *)(*(void *)(a1 + 32) + 160) objectAtIndex:a3];
    char v9 = [MEMORY[0x263EFF9D0] null];

    if (v8 != v9)
    {
      id v10 = [v8 navigationController];
      uint64_t v11 = [v10 viewControllers];
      uint64_t v12 = [v11 count];

      if (!v12)
      {
        if (![v16 alwaysCreatesRootViewController]
          || (id v13 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v16, "rootViewControllerClass")), "initWithTabBarItem:", v16)) == 0)
        {
          id v14 = objc_alloc(MEMORY[0x263F82EF0]);
          uint64_t v15 = objc_msgSend(v14, "initWithFrame:title:style:", v6, v7, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
          id v13 = objc_alloc_init(MEMORY[0x263F82E10]);
          [v13 setView:v15];
        }
        [v10 pushViewController:v13 animated:0];
      }
    }

    id v5 = v16;
  }
}

- (void)_finishWillResignActiveWithDialogState:(BOOL)a3
{
  unint64_t v3 = *MEMORY[0x263F833E0];
  if (self->_resignActiveTaskID != *MEMORY[0x263F833E0])
  {
    BOOL v4 = a3;
    id v7 = [MEMORY[0x263F82438] sharedApplication];
    if ([v7 applicationState])
    {
      if (v4)
      {
        self->_ignoreDidBecomeActive = 1;
      }
      else
      {
        activationURL = self->_activationURL;
        self->_activationURL = 0;

        self->_ignoreDidBecomeActive = 0;
        [(SUUIClientContext *)self->_clientContext setPurchaseReferrerURL:0];
        [(SUUIApplicationController *)self suspendApplicationWithOptions:0];
      }
    }
    [v7 endBackgroundTask:self->_resignActiveTaskID];
    self->_unint64_t resignActiveTaskID = v3;
  }
}

- (void)_fireBlocksAfterLoad
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v3 = (void *)[(NSMutableArray *)self->_whenLoadedBlocks copy];
  whenLoadedBlocks = self->_whenLoadedBlocks;
  self->_whenLoadedBlocks = 0;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x25A2A9B80](v6);
        (*(void (**)(uint64_t))(v10 + 16))(v10);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }
}

- (CGSize)sizeForNavigationDocument:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 navigationControllerDelegate];
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v6 = [v5 navigationController];
LABEL_8:
      uint64_t v8 = v6;
      goto LABEL_14;
    }
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v4 modalDocumentController];
    id v5 = [v7 _overlayNavigationController];

    if (v5)
    {
      id v6 = v5;
      id v5 = v6;
      goto LABEL_8;
    }
    uint64_t v9 = [v4 modalDocumentController];
    uint64_t v10 = [v9 _overlayViewController];

    if (v10)
    {
      uint64_t v8 = [(SUUIApplicationController *)self tabBarController];
    }
    else
    {
      uint64_t v8 = 0;
    }

LABEL_14:
    if (v8) {
      goto LABEL_16;
    }
  }
  uint64_t v8 = [(SUUIApplicationController *)self tabBarController];
LABEL_16:
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3010000000;
  char v25 = "";
  long long v26 = *MEMORY[0x263F001B0];
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v11 = [v8 view];
    [v11 bounds];
    long long v12 = v23;
    v23[4] = v13;
    void v12[5] = v14;
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__SUUIApplicationController_sizeForNavigationDocument___block_invoke;
    v19[3] = &unk_2654008E0;
    double v21 = &v22;
    id v20 = v8;
    dispatch_sync(MEMORY[0x263EF83A0], v19);
    uint64_t v11 = v20;
  }

  double v15 = *((double *)v23 + 4);
  double v16 = *((double *)v23 + 5);
  _Block_object_dispose(&v22, 8);

  double v17 = v15;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

void __55__SUUIApplicationController_sizeForNavigationDocument___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) view];
  [v5 bounds];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
}

- (void)_handleScriptUnavailable
{
  self->_int64_t scriptLoadState = 4;
  [(SUUIApplicationController *)self _reloadRootViewControllers];
  [(SUUIApplicationController *)self _fireBlocksAfterLoad];
}

- (void)_invalidateApplication
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:0x2704F80F0 object:0];
  [v3 removeObserver:self name:@"SUAccountViewControllerDidDisappearNotification" object:0];
  [(SUUIClientContext *)self->_clientContext _setApplicationController:0];
  [(SUUIClientContext *)self->_clientContext _setScriptAppContext:0];
  clientContext = self->_clientContext;
  self->_clientContext = 0;

  self->_didDisplayFirstPage = 0;
  scriptContext = self->_scriptContext;
  self->_scriptContext = 0;

  self->_int64_t scriptLoadState = 0;
  id v6 = [(SUUIApplicationController *)self _existingTabBarController];
  SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v6, 0, 0);
  previewDocumentController = self->_previewDocumentController;
  self->_previewDocumentController = 0;

  floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
  self->_floatingStatusOverlayViewController = 0;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = self->_navigationDocumentControllers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        double v15 = objc_msgSend(MEMORY[0x263EFF9D0], "null", (void)v19);

        if (v14 != v15)
        {
          [v14 setDelegate:0];
          [v14 popAllDocuments];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  navigationDocumentControllers = self->_navigationDocumentControllers;
  self->_navigationDocumentControllers = 0;

  [(SUUIModalDocumentController *)self->_modalDocumentController setModalSourceViewProvider:0];
  [(SUUIModalDocumentController *)self->_modalDocumentController setNavigationControllerDelegate:0];
  [(SUUIModalDocumentController *)self->_modalDocumentController popAllDocuments];
  [(SUUIModalDocumentController *)self->_modalDocumentController setDelegate:0];
  modalDocumentController = self->_modalDocumentController;
  self->_modalDocumentController = 0;

  [(SUUINavigationDocumentController *)self->_transientNavigationDocument setDelegate:0];
  transientNavigationDocument = self->_transientNavigationDocument;
  self->_transientNavigationDocument = 0;

  [(SUUISimpleContainerViewController *)self->_navigationContainerViewController setContentViewController:0];
  [v6 setTransientViewController:0 animated:0];
  [v6 setViewControllers:0];
}

- (BOOL)_isDisplayingAccountViewController
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v4 = [(SUUIApplicationController *)self rootViewController];
  id v5 = [v4 presentedViewController];
  id v6 = objc_msgSend(v3, "initWithObjects:", v5, 0);

  uint64_t v7 = [v6 count];
  BOOL v8 = v7 != 0;
  if (v7)
  {
    while (1)
    {
      uint64_t v9 = [v6 objectAtIndex:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v10 = [v9 childViewControllers];
      if ([v10 count]) {
        [v6 addObjectsFromArray:v10];
      }
      uint64_t v11 = [v9 presentedViewController];
      if (v11 && ([v10 containsObject:v11] & 1) == 0) {
        [v6 addObject:v11];
      }

      [v6 removeObjectAtIndex:0];
      uint64_t v12 = [v6 count];
      BOOL v8 = v12 != 0;
      if (!v12) {
        goto LABEL_11;
      }
    }
    [v6 removeObjectAtIndex:0];
  }
LABEL_11:

  return v8;
}

- (BOOL)_isStoreFront:(id)a3 equalToStoreFront:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 rangeOfString:@" "];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v5 substringToIndex:v7];

    id v5 = (id)v8;
  }
  uint64_t v9 = [v6 rangeOfString:@" "];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [v6 substringToIndex:v9];

    id v6 = (id)v10;
  }
  char v11 = [v5 isEqualToString:v6];

  return v11;
}

- (id)_launchOptionsWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 underlyingURL];
  id v6 = [v5 absoluteString];

  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v6, @"url", 0);
  uint64_t v8 = [v4 referrerApplicationName];
  if (v8)
  {
    uint64_t v9 = [NSURL URLWithString:v6];
    id v21 = v9;
    uint64_t v10 = [(id)objc_opt_class() _referrerAppForSourceApplication:v8 launchURL:&v21];
    id v11 = v21;

    uint64_t v12 = [v11 absoluteString];

    [v7 setObject:v12 forKey:@"url"];
    [v7 setObject:v10 forKey:@"refApp"];
  }
  uint64_t v13 = [v4 referrerURLString];

  if (v13) {
    [v7 setObject:v13 forKey:@"refUrl"];
  }
  uint64_t v14 = NSDictionary;
  double v15 = [(SUUIApplicationController *)self rootViewController];
  double v16 = [v15 view];
  [v16 bounds];
  long long v19 = objc_msgSend(v14, "su_dictionaryWithSize:", v17, v18);
  [v7 setObject:v19 forKey:@"windowSize"];

  return v7;
}

- (void)_legacyResolveExternalURL:(id)a3
{
  urlResolver = self->_urlResolver;
  id v10 = a3;
  [(SUUIURLResolver *)urlResolver setDelegate:0];
  [(SUUIURLResolver *)self->_urlResolver setNavigationControllerDelegate:0];
  id v5 = self->_urlResolver;
  self->_urlResolver = 0;

  id v6 = [[SUUIURLResolver alloc] initWithClientContext:self->_clientContext];
  uint64_t v7 = self->_urlResolver;
  self->_urlResolver = v6;

  [(SUUIURLResolver *)self->_urlResolver setDelegate:self];
  [(SUUIURLResolver *)self->_urlResolver setNavigationControllerDelegate:self];
  uint64_t v8 = self->_urlResolver;
  uint64_t v9 = [(SUUIApplicationController *)self _operationQueue];
  [(SUUIURLResolver *)v8 setOperationQueue:v9];

  [(SUUIURLResolver *)self->_urlResolver resolveURL:v10];
}

- (void)_loadApplicationScript
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  NSLog(&cfstr_LoadApplicatio_0.isa, v4);

  self->_int64_t scriptLoadState = 2;
  id v5 = [(SUUIApplicationController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 bootstrapScriptURLForApplication:self];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      [(SUUIApplicationController *)self _startScriptContextWithURL:v6];
LABEL_9:

      goto LABEL_10;
    }
  }
  uint64_t v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v7 = [v8 stringForKey:@"SUUIITMLURL"];

  if (v7
    || ([(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"appjs.v2"], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([v7 length])
    {
      uint64_t v9 = [NSURL URLWithString:v7];
      [(SUUIApplicationController *)self _startScriptContextWithURL:v9];
    }
    else
    {
      [(SUUIApplicationController *)self _handleScriptUnavailable];
    }
    goto LABEL_9;
  }
  objc_initWeak(&location, self);
  double v17 = [(SUUIClientContext *)self->_clientContext URLBag];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __51__SUUIApplicationController__loadApplicationScript__block_invoke;
  v18[3] = &unk_265402320;
  objc_copyWeak(&v19, &location);
  [v17 loadValueForKey:@"itml-store" completionBlock:v18];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
LABEL_10:
  id v10 = [(NSDictionary *)self->_launchOptions valueForKey:@"url"];
  if (v10)
  {
    id v11 = (NSDictionary *)[(NSDictionary *)self->_launchOptions mutableCopy];
    uint64_t v12 = [SUUIURL alloc];
    uint64_t v13 = (void *)[objc_alloc(NSURL) initWithString:v10];
    uint64_t v14 = [(SUUIURL *)v12 initWithURL:v13];

    double v15 = +[SUUIURLResolver tabIdentifierForURL:v14];
    if (v15)
    {
      [(NSDictionary *)v11 removeObjectForKey:@"url"];
      [(NSDictionary *)v11 setObject:v15 forKeyedSubscript:@"selectedTabId"];
    }
    else if ([(SUUIApplicationController *)self _shouldUseLegacyURLHandlingForExternalURL:v14])
    {
      [(NSDictionary *)v11 removeObjectForKey:@"url"];
      objc_storeStrong((id *)&self->_legacyLaunchURL, v14);
    }
    launchOptions = self->_launchOptions;
    self->_launchOptions = v11;
  }
}

void __51__SUUIApplicationController__loadApplicationScript__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUUIApplicationController__loadApplicationScript__block_invoke_2;
  block[3] = &unk_2654012A0;
  id v10 = v5;
  id v7 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v11 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __51__SUUIApplicationController__loadApplicationScript__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v2 = [NSURL URLWithString:*(void *)(a1 + 32)];
    [WeakRetained _startScriptContextWithURL:v2];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = objc_loadWeakRetained((id *)(a1 + 48));
    id WeakRetained = v4;
    if (v3) {
      [v4 _failWithError:*(void *)(a1 + 40)];
    }
    else {
      [v4 _handleScriptUnavailable];
    }
  }
}

- (id)_navigationContainerViewController
{
  navigationContainerViewController = self->_navigationContainerViewController;
  if (!navigationContainerViewController)
  {
    id v4 = objc_alloc_init(SUUISimpleContainerViewController);
    id v5 = self->_navigationContainerViewController;
    self->_navigationContainerViewController = v4;

    navigationContainerViewController = self->_navigationContainerViewController;
  }
  return navigationContainerViewController;
}

- (id)_operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    id v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.iTunesStoreUI.SUUIApplicationController"];
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (BOOL)_needsStatusOverlay
{
  return self->_statusOverlayProvider
      || [(SUUIPreviewDocumentController *)self->_previewDocumentController isPreviewActive];
}

- (BOOL)_playPreviewForPreviewTemplate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 previewURLString];
  if (v4)
  {
    id v5 = [MEMORY[0x263F895C8] sessionManager];
    id v6 = (void *)[objc_alloc(NSURL) initWithString:v4];
    id v7 = [v5 audioPlayerForURL:v6];
    id v8 = v7;
    if (v7)
    {
      [v7 play];
    }
    else
    {
      id v9 = (id)[v5 stopAllAudioPlayerSessions];
      id v10 = [v5 startSessionWithURL:v6];
      objc_msgSend(v10, "setStoreItemIdentifier:", objc_msgSend(v3, "itemIdentifier"));
      [v10 play];
    }
  }

  return v4 != 0;
}

- (void)_recordTabBarMetricsEventToSelectViewController:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIApplicationController *)self _existingTabBarController];
  unint64_t v5 = [v4 selectedIndex];
  id v6 = [v4 viewControllers];
  if (v5 >= [v6 count])
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v6 objectAtIndex:v5];
  }
  int64_t v8 = [v6 indexOfObjectIdenticalTo:v15];
  if (v8 < (int64_t)[(NSArray *)self->_tabBarItems count])
  {
    id v9 = objc_alloc_init(MEMORY[0x263F7B228]);
    [v9 setTargetType:*MEMORY[0x263F7BBC0]];
    id v10 = [(NSArray *)self->_tabBarItems objectAtIndex:v8];
    id v11 = [v10 metricsIdentifier];
    [v9 setTargetIdentifier:v11];

    if (!v7) {
      goto LABEL_16;
    }
    if (objc_opt_respondsToSelector())
    {
      id v12 = [v7 activeMetricsController];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v7 topViewController];
        if (objc_opt_respondsToSelector())
        {
          id v12 = [v13 activeMetricsController];
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
    }
    uint64_t v14 = [(SUUIClientContext *)self->_clientContext metricsPageContextForViewController:v7];
    [v9 setPageContext:v14];

    if (v12)
    {
      [v12 recordEvent:v9];
    }
    else
    {
LABEL_16:
      [(SUUIApplicationController *)self recordMetricsEvent:v9 flushImmediately:0];
    }
  }
}

- (void)_reloadApplication
{
  [(SUUIApplicationController *)self _removeObserversForReloadNotifications];
  [(SUUIApplicationController *)self _invalidateApplication];
  [(SUUIApplicationController *)self loadApplication];
  [(SUUIApplicationController *)self _sendClientContextDidChange];
}

uint64_t __55__SUUIApplicationController__reloadRootViewControllers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tabIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __55__SUUIApplicationController__reloadRootViewControllers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:@"TabBar"];
  id v3 = [v2 toObjectOfClass:objc_opt_class()];

  [v3 sendOnUpdate];
}

uint64_t __55__SUUIApplicationController__reloadRootViewControllers__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 _dispatchTabBarOnSelect];
}

- (void)_reloadTabBarWithClientContext:(id)a3
{
  if (a3)
  {
    clientContext = self->_clientContext;
    if (clientContext)
    {
      id v5 = a3;
      id v7 = [(SUUIClientContext *)clientContext valueForConfigurationKey:@"tabs"];
      id v6 = [v5 valueForConfigurationKey:@"tabs"];

      if (v6 && ([v7 isEqual:v6] & 1) == 0)
      {
        [(SUUIClientContext *)self->_clientContext _setValue:v6 forConfigurationKey:@"tabs"];
        [(SUUIApplicationController *)self _sendClientContextDidChange];
      }
    }
  }
}

- (void)_removeObserversForReloadNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89418] object:0];
}

- (void)_resetUserInterfaceAfterStoreFrontChange
{
  if ([(SUUIApplicationControllerOptions *)self->_options supportsFullApplicationReload])
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:@"SUAccountViewControllerDidDisappearNotification" object:0];
    scriptContext = self->_scriptContext;
    if (scriptContext) {
      [(IKAppContext *)scriptContext stop];
    }
    else {
      [(SUUIApplicationController *)self _reloadApplication];
    }
  }
}

- (void)_retryAfterFailure
{
  [(SUUIApplicationController *)self _removeObserversForReloadNotifications];
  if (self->_tabBarController)
  {
    id v3 = [(SUUIApplicationController *)self _transientNavigationDocument];
    id v4 = [v3 navigationController];

    [v4 setViewControllers:MEMORY[0x263EFFA68] animated:0];
    id v5 = [v4 view];
    [v5 layoutSubviews];

    [(SUUITabBarController *)self->_tabBarController setTransientViewController:0 animated:0];
  }
  launchOptions = self->_launchOptions;
  [(SUUIApplicationController *)self loadApplicationWithOptions:launchOptions];
}

- (void)_sendClientContextDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained applicationDidChangeClientContext:self];
  }
}

- (void)_sendDidDisplayFirstPageIfNecessary
{
  if (!self->_didDisplayFirstPage)
  {
    clientContext = self->_clientContext;
    id v4 = [(SUUIApplicationController *)self rootViewController];
    uint64_t v5 = [v4 view];
    [(id)v5 bounds];
    -[SUUIClientContext sendApplicationWindowSizeDidUpdate:](clientContext, "sendApplicationWindowSizeDidUpdate:", v6, v7);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 applicationDidDisplayFirstPage:self];
    }
    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 removeObserver:self name:@"SUUIApplicationPageDidDisplayNotification" object:0];

    self->_didDisplayFirstPage = 1;
  }
}

- (BOOL)_sendNativeBackButtonMetricEvents
{
  return 1;
}

- (void)_setClientContextWithDictionary:(id)a3
{
  clientContextClass = self->_clientContextClass;
  id v5 = a3;
  double v6 = (void *)[[clientContextClass alloc] initWithConfigurationDictionary:v5];

  [(SUUIApplicationController *)self setClientContext:v6];
  [(SUUIModalDocumentController *)self->_modalDocumentController setClientContext:self->_clientContext];
  [(SUUINavigationDocumentController *)self->_transientNavigationDocument setClientContext:self->_clientContext];
  double v7 = +[SUUINearMeController sharedController];
  [v7 setClientContext:self->_clientContext];

  int64_t v8 = +[SUUIFamilyCircleController sharedController];
  [v8 setClientContext:self->_clientContext];

  [(SUUIApplicationController *)self _reloadRootViewControllers];
  [(SUUIApplicationController *)self _sendClientContextDidChange];
  [(SUUIApplicationController *)self _loadApplicationScript];
}

- (BOOL)_shouldUseLegacyURLHandlingForExternalURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 actionString];
  if ([v5 isEqualToString:@"account"]) {
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"donate"]) {
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"gift"]) {
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"redeem"]) {
    goto LABEL_7;
  }
  double v6 = [v4 underlyingURL];
  double v7 = [v6 host];
  uint64_t v8 = [v7 length];

  if (!v8
    || (+[SUUIURLResolver tabIdentifierForURL:v4],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
LABEL_7:
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = self->_scriptLoadState == 4;
  }

  return v10;
}

- (void)_attemptAMSURLHandlingIfPossibleForExternalURL:(id)a3 fallback:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SUUIClientContext amsBag];
  id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  id v12 = [v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    int v13 = v11;
  }
  else {
    int v13 = v11 & 2;
  }
  if (v13)
  {
    uint64_t v14 = [v6 underlyingURL];
    [v14 absoluteString];
    *(void *)((char *)&location + 4) = LODWORD(location) = 138412290;
    LODWORD(v24) = 12;
    id v15 = (void *)_os_log_send_and_compose_impl();

    if (v15)
    {
      double v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &location, v24);
      free(v15);
      SSFileLog();
    }
  }
  else
  {
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  double v17 = (void *)getAMSURLParserClass_softClass;
  uint64_t v32 = getAMSURLParserClass_softClass;
  if (!getAMSURLParserClass_softClass)
  {
    *(void *)&long long location = MEMORY[0x263EF8330];
    *((void *)&location + 1) = 3221225472;
    char v34 = __getAMSURLParserClass_block_invoke;
    long long v35 = &unk_265405DA0;
    int v36 = &v29;
    __getAMSURLParserClass_block_invoke((uint64_t)&location);
    double v17 = (void *)v30[3];
  }
  double v18 = v17;
  _Block_object_dispose(&v29, 8);
  id v19 = (void *)[[v18 alloc] initWithBag:v8];
  long long v20 = [v6 underlyingURL];
  id v21 = [v19 typeForURL:v20];

  objc_initWeak((id *)&location, self);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __85__SUUIApplicationController__attemptAMSURLHandlingIfPossibleForExternalURL_fallback___block_invoke;
  v25[3] = &unk_265408478;
  id v22 = v7;
  id v27 = v22;
  objc_copyWeak(&v28, (id *)&location);
  id v23 = v6;
  id v26 = v23;
  [v21 addFinishBlock:v25];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)&location);
}

void __85__SUUIApplicationController__attemptAMSURLHandlingIfPossibleForExternalURL_fallback___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__SUUIApplicationController__attemptAMSURLHandlingIfPossibleForExternalURL_fallback___block_invoke_2;
  block[3] = &unk_265408450;
  id v10 = v6;
  id v13 = a1[5];
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  objc_copyWeak(&v14, a1 + 6);
  id v12 = a1[4];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v14);
}

void __85__SUUIApplicationController__attemptAMSURLHandlingIfPossibleForExternalURL_fallback___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    int v7 = v5;
  }
  else {
    int v7 = v5 & 2;
  }
  if (v2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v21 = 138543362;
      uint64_t v22 = v8;
      LODWORD(v20) = 12;
      id v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_12:

        goto LABEL_18;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v21, v20);
      free(v9);
      SSFileLog();
    }

    goto LABEL_12;
  }
  if (v7)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    int v21 = 138543362;
    uint64_t v22 = v10;
    LODWORD(v20) = 12;
    id v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_17;
    }
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v21, v20);
    free(v11);
    SSFileLog();
  }

LABEL_17:
  uint64_t v12 = [*(id *)(a1 + 40) integerValue];
  if ((v12 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    uint64_t v13 = v12;
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained[34] setDelegate:0];
    [WeakRetained[34] setNavigationControllerDelegate:0];
    id v15 = WeakRetained[34];
    WeakRetained[34] = 0;

    double v16 = [[SUUIURLResolver alloc] initWithClientContext:WeakRetained[4]];
    id v17 = WeakRetained[34];
    WeakRetained[34] = v16;

    [WeakRetained[34] setDelegate:WeakRetained];
    [WeakRetained[34] setNavigationControllerDelegate:WeakRetained];
    id v18 = WeakRetained[34];
    id v19 = [WeakRetained _operationQueue];
    [v18 setOperationQueue:v19];

    [WeakRetained[34] amsResolveURL:*(void *)(a1 + 48) forURLType:v13];
    return;
  }
LABEL_18:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_showFloatingStatusOverlayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_floatingStatusOverlayViewController)
  {
    previewDocumentController = self->_previewDocumentController;
    if (!previewDocumentController) {
      previewDocumentController = self->_statusOverlayProvider;
    }
    id v6 = previewDocumentController;
    int v7 = [(SUUIApplicationController *)self _existingTabBarController];
    uint64_t v8 = [v7 traitCollection];

    objc_msgSend(v6, "overlayViewControllerWithBackgroundStyle:", objc_msgSend(v8, "userInterfaceStyle") != 1);
    id v9 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
    self->_floatingStatusOverlayViewController = v9;
  }
  id v11 = [(SUUIApplicationController *)self _existingTabBarController];
  SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v11, self->_floatingStatusOverlayViewController, v3);
}

- (void)_showStatusOverlayForNavigationController:(id)a3 viewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(SUUIApplicationController *)self rootViewController];
  id v11 = [v10 view];

  [v11 bounds];
  if ([(SUUIApplicationController *)self _usesFloatingStatusOverlayForWidth:v12])
  {
    [(SUUIApplicationController *)self _showFloatingStatusOverlayAnimated:v5];
  }
  else if (v8)
  {
    uint64_t v13 = +[SUUINavigationControllerAssistant assistantForNavigationController:v8 clientContext:self->_clientContext];
    id v14 = [v13 statusOverlayProvider];
    id v15 = [v9 transitionCoordinator];
    double v16 = [(SUUIApplicationController *)self _statusOverlayProviderForViewController:v9];
    [v13 setStatusOverlayProvider:v16 animated:v5];

    [v13 willShowViewController:v9 animated:v5];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __95__SUUIApplicationController__showStatusOverlayForNavigationController_viewController_animated___block_invoke;
    v19[3] = &unk_265406818;
    id v20 = v13;
    id v21 = v14;
    id v17 = v14;
    id v18 = v13;
    [v15 notifyWhenInteractionEndsUsingBlock:v19];
  }
}

void __95__SUUIApplicationController__showStatusOverlayForNavigationController_viewController_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isCancelled]) {
    objc_msgSend(*(id *)(a1 + 32), "setStatusOverlayProvider:animated:", *(void *)(a1 + 40), objc_msgSend(v3, "isAnimated"));
  }
}

- (void)_startScriptContextWithURL:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  NSLog(&cfstr_StartScriptWit.isa, v6, v4);

  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    int v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v12 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    uint64_t v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      int v14 = v13;
    }
    else {
      int v14 = v13 & 2;
    }
    if (!v14) {
      goto LABEL_21;
    }
    LODWORD(v32) = 138412290;
    *(void *)((char *)&v32 + 4) = v4;
    LODWORD(v31) = 12;
    goto LABEL_19;
  }
  if (self->_scriptContext)
  {
    int v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (!v11) {
      goto LABEL_21;
    }
    LODWORD(v32) = 138412290;
    *(void *)((char *)&v32 + 4) = v4;
    LODWORD(v31) = 12;
LABEL_19:
    id v15 = (void *)_os_log_send_and_compose_impl();

    if (!v15)
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v32, v31, v32);
    free(v15);
    SSFileLog();
LABEL_21:

    goto LABEL_22;
  }
  SUUIInitializeDOMFeatureFactory();
  SUUIInitializeViewElementFactory();
  SUUIInitializeViewElementStyleFactory();
  double v16 = (NSURL *)[v4 copy];
  applicationScriptURL = self->_applicationScriptURL;
  self->_applicationScriptURL = v16;

  id v18 = [(SUUIClientContext *)self->_clientContext URLBag];
  id v19 = (void *)MEMORY[0x263F7B350];
  id v20 = [v18 URLBagContext];
  [v19 setURLBag:v18 forContext:v20];

  uint64_t v21 = [(SUUIApplicationControllerOptions *)self->_options requiresLocalBootstrapScript];
  uint64_t v22 = (IKAppContext *)[objc_alloc(MEMORY[0x263F4B3C8]) initWithApplication:self mode:v21 delegate:self];
  scriptContext = self->_scriptContext;
  self->_scriptContext = v22;

  [(IKAppContext *)self->_scriptContext setRemoteInspectionEnabled:1];
  [(IKAppContext *)self->_scriptContext setMescalPrimeEnabledForXHRRequests:self->_mescalPrimeEnabledForXHRRequests];
  uint64_t v24 = self->_scriptContext;
  [(SUUIApplicationControllerOptions *)self->_options bootstrapScriptTimeoutInterval];
  [(IKAppContext *)v24 setAppScriptTimeoutInterval:"setAppScriptTimeoutInterval:"];
  [(SUUIClientContext *)self->_clientContext _setScriptAppContext:self->_scriptContext];
  if ([(SUUIApplicationControllerOptions *)self->_options isBootstrapScriptFallbackEnabled])
  {
    uint64_t v25 = [(SUUIClientContext *)self->_clientContext storeFrontIdentifier];
    if (v25)
    {
      id v26 = (void *)v25;
      BOOL v27 = [(SUUIClientContext *)self->_clientContext isBootstrapScriptFallbackDisabled];

      if (!v27)
      {
        id v28 = [(SUUIClientContext *)self->_clientContext storeFrontIdentifier];
        uint64_t v29 = +[SUUIBootstrapScriptFallback cacheFilenameForStoreFrontIdentifier:v28];

        uint64_t v30 = [[SUUIBootstrapScriptFallback alloc] initWithFilename:v29];
        [(SUUIApplicationControllerOptions *)self->_options bootstrapScriptFallbackMaximumAge];
        -[SUUIBootstrapScriptFallback setMaximumAge:](v30, "setMaximumAge:");
        [(IKAppContext *)self->_scriptContext setAppScriptFallbackHandler:v30];
      }
    }
  }
  [(IKAppContext *)self->_scriptContext start];
  +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:&__block_literal_global_389];

LABEL_23:
}

void __56__SUUIApplicationController__startScriptContextWithURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263EFF910];
  id v3 = a2;
  id v4 = [v2 date];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "setBootstrapStartTime:");
}

- (void)_jsLaunchFinishedWithLaunchMetrics:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[SUUIMetricsAppLaunchEvent consumePendingLaunchEvent];
  if (v5)
  {
    id v6 = [MEMORY[0x263EFF910] date];
    [v6 timeIntervalSince1970];
    objc_msgSend(v5, "setLaunchEndTime:");

    int v7 = [v4 objectForKeyedSubscript:@"jsResourcesStartTime"];
    if (v7)
    {
      +[SUUIMetricsUtilities timeIntervalFromJSTime:v7];
      objc_msgSend(v5, "setJsResourcesStartTime:");
    }
    int v8 = [v4 objectForKeyedSubscript:@"jsResourcesEndTime"];
    if (v8)
    {
      +[SUUIMetricsUtilities timeIntervalFromJSTime:v8];
      objc_msgSend(v5, "setJsResourcesEndTime:");
    }
    int v9 = [v4 objectForKeyedSubscript:@"initialTabMetrics"];
    uint64_t v10 = v9;
    if (v9)
    {
      int v11 = [v9 objectForKeyedSubscript:@"requestStartTime"];
      if (v11)
      {
        +[SUUIMetricsUtilities timeIntervalFromJSTime:v11];
        objc_msgSend(v5, "setInitialTabRequestStartTime:");
      }
      int v12 = [v10 objectForKeyedSubscript:@"responseStartTime"];
      if (v12)
      {
        +[SUUIMetricsUtilities timeIntervalFromJSTime:v12];
        objc_msgSend(v5, "setInitialTabResponseStartTime:");
      }
      int v13 = [v10 objectForKeyedSubscript:@"responseEndTime"];
      if (v13)
      {
        +[SUUIMetricsUtilities timeIntervalFromJSTime:v13];
        objc_msgSend(v5, "setInitialTabResponseEndTime:");
      }
    }
    if (+[SUUIMetricsUtilities shouldLogTimingMetrics])
    {
      SSDebugLevel();
      SSDebugFileLevel();
      double v16 = v5;
      SSDebugLog();
    }
    if (+[SUUIMetricsUtilities showEventNotifications])
    {
      int v14 = +[SUUIStatusBarAlertCenter sharedCenter];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __64__SUUIApplicationController__jsLaunchFinishedWithLaunchMetrics___block_invoke;
      v17[3] = &unk_265400980;
      id v18 = v5;
      [v14 showMessage:@"App Launched" withStyle:0 forDuration:v17 actionBlock:0.0];
    }
    [(SUUIApplicationController *)self recordMetricsEvent:v5 flushImmediately:0];
  }
  else
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext getDefaultMetricsControllerWithCompletionBlock:&__block_literal_global_417];
    }
  }
}

uint64_t __64__SUUIApplicationController__jsLaunchFinishedWithLaunchMetrics___block_invoke(uint64_t a1)
{
  return +[SUUIObjectInspectorViewController showInspectableObject:*(void *)(a1 + 32)];
}

- (id)_statusOverlayProviderForViewController:(id)a3
{
  id v4 = a3;
  previewDocumentController = self->_previewDocumentController;
  if (previewDocumentController) {
    goto LABEL_2;
  }
  if (self->_statusOverlayProvider)
  {
    char v7 = objc_opt_respondsToSelector();
    previewDocumentController = self->_statusOverlayProvider;
    if ((v7 & 1) == 0)
    {
LABEL_2:
      id v6 = previewDocumentController;
      goto LABEL_8;
    }
    if ([previewDocumentController shouldShowStatusOverlayForViewController:v4])
    {
      previewDocumentController = self->_statusOverlayProvider;
      goto LABEL_2;
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (void)_stopScriptContextForReload
{
  [(SUUIMetricsController *)self->_metricsController flushImmediately];
  id v3 = [MEMORY[0x263F7B0E8] defaultStore];
  id v4 = [v3 activeAccount];
  SSVStoreFrontIdentifierForAccount();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F08850]);
    id v6 = +[SUUIClientContext _cachePathForStoreFrontIdentifier:v10];
    [v5 removeItemAtPath:v6 error:0];
  }
  if ([MEMORY[0x263F89550] sharedCFURLCache]) {
    CFURLCacheRemoveAllCachedResponses();
  }
  char v7 = [MEMORY[0x263EFC600] sharedURLCache];
  [v7 removeAllCachedResponses];

  int v8 = [MEMORY[0x263F89540] sharedCache];
  [v8 invalidateAllURLBags];

  int v9 = [(IKAppContext *)self->_scriptContext appScriptFallbackHandler];
  [v9 invalidate];

  self->_int64_t scriptLoadState = 5;
  [(IKAppContext *)self->_scriptContext stop];
}

- (id)_transientNavigationDocument
{
  transientNavigationDocument = self->_transientNavigationDocument;
  if (!transientNavigationDocument)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0
      || (id v6 = objc_loadWeakRetained((id *)&self->_delegate),
          [v6 application:self navigationControllerWithTabBarItem:0],
          id v7 = (id)objc_claimAutoreleasedReturnValue(),
          v6,
          !v7))
    {
      id v7 = objc_alloc_init(MEMORY[0x263F829B8]);
    }
    [v7 setDelegate:self];
    int v8 = [[SUUINavigationDocumentController alloc] initWithNavigationController:v7];
    int v9 = self->_transientNavigationDocument;
    self->_transientNavigationDocument = v8;

    id v10 = self->_transientNavigationDocument;
    int v11 = [(SUUIApplicationController *)self clientContext];
    [(SUUINavigationDocumentController *)v10 setClientContext:v11];

    [(SUUINavigationDocumentController *)self->_transientNavigationDocument setDelegate:self];
    transientNavigationDocument = self->_transientNavigationDocument;
  }
  return transientNavigationDocument;
}

- (BOOL)_usesFloatingStatusOverlayForWidth:(double)a3
{
  id v4 = [(SUUIApplicationController *)self _existingTabBarController];
  BOOL v5 = (!v4 || (objc_opt_respondsToSelector() & 1) != 0) && 320.0 / a3 < 0.5;

  return v5;
}

- (id)_rootDocuments
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_navigationDocumentControllers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = objc_msgSend(MEMORY[0x263EFF9D0], "null", (void)v16);

        if (v9 != v10)
        {
          int v11 = [v9 documents];
          uint64_t v12 = [v11 count];

          if (v12)
          {
            int v13 = [v9 documents];
            int v14 = [v13 firstObject];

            if (v14) {
              [v3 addObject:v14];
            }
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v3;
}

- (SUUIApplicationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIApplicationDelegate *)WeakRetained;
}

- (BOOL)_hidesTabBar
{
  return self->_hidesTabBar;
}

- (void)_setHidesTabBar:(BOOL)a3
{
  self->_hidesTabBar = a3;
}

- (BOOL)mescalPrimeEnabledForXHRRequests
{
  return self->_mescalPrimeEnabledForXHRRequests;
}

- (SUUIPreviewDocumentController)_previewOverlayDocumentController
{
  return self->_previewDocumentController;
}

- (SUUIModalDocumentController)modalDocumentController
{
  return self->_modalDocumentController;
}

- (SUUIApplicationControllerOptions)options
{
  return self->_options;
}

- (SUUIScrollingTabBarController)scrollingTabBarController
{
  return self->_scrollingTabBarController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollingTabBarController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_whenLoadedBlocks, 0);
  objc_storeStrong((id *)&self->_vendorStorage, 0);
  objc_storeStrong((id *)&self->_urlResolver, 0);
  objc_storeStrong((id *)&self->_transientNavigationDocument, 0);
  objc_storeStrong((id *)&self->_tabBarItems, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_shutdownHelper, 0);
  objc_storeStrong((id *)&self->_statusOverlayProvider, 0);
  objc_storeStrong((id *)&self->_scriptContext, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_previewDocumentController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_navigationDocumentControllers, 0);
  objc_storeStrong((id *)&self->_navigationContainerViewController, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_modalDocumentController, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
  objc_storeStrong((id *)&self->_legacyLaunchURL, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_lastPoppedViewController, 0);
  objc_storeStrong((id *)&self->_floatingStatusOverlayViewController, 0);
  objc_storeStrong((id *)&self->_deviceConfig, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_applicationScriptURL, 0);
  objc_storeStrong((id *)&self->_activationURL, 0);
}

@end