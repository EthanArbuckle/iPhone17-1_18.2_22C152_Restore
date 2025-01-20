@interface SUStoreController
+ (id)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (BOOL)_isAccountViewControllerVisible;
- (BOOL)_loadSectionsAllowingCache:(BOOL)a3 withCompletionBlock:(id)a4;
- (BOOL)_reloadForStorefrontChange;
- (BOOL)_showWildcatAccountViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)application:(id)a3 handleOpenURL:(id)a4;
- (BOOL)client:(id)a3 openInternalURL:(id)a4;
- (BOOL)client:(id)a3 presentAccountViewController:(id)a4 animated:(BOOL)a5;
- (BOOL)client:(id)a3 presentModalViewController:(id)a4 animated:(BOOL)a5;
- (BOOL)isComposingEmail;
- (BOOL)isStoreEnabled;
- (BOOL)isTabBarControllerLoaded;
- (BOOL)libraryContainsItemIdentifier:(unint64_t)a3;
- (BOOL)matchesClientApplication:(id)a3;
- (BOOL)presentOverlayBackgroundViewController:(id)a3;
- (BOOL)reloadSectionWithIdentifier:(id)a3 url:(id)a4;
- (BOOL)selectSectionWithIdentifier:(id)a3;
- (BOOL)showDialogForCapabilities:(id)a3 mismatches:(id)a4;
- (NSString)defaultPNGNameForSuspend;
- (NSURL)launchURL;
- (SUStoreController)init;
- (SUTabBarController)tabBarController;
- (UINavigationController)topNavigationController;
- (double)defaultImageSnapshotExpiration;
- (id)_resumableViewController;
- (id)copySuspendSettings;
- (id)downloadQueueForClient:(id)a3 downloadKinds:(id)a4;
- (id)newScriptInterface;
- (id)overlayBackgroundViewController;
- (id)overlayConfigurationForStorePage:(id)a3;
- (id)storeContentLanguage;
- (id)topViewControllerForClient:(id)a3;
- (void)_accountControllerDisappearedNotification:(id)a3;
- (void)_bagDidLoadNotification:(id)a3;
- (void)_cancelLoadSectionsOperation;
- (void)_cancelSuspendAfterDialogsDismissed;
- (void)_defaultHandleApplicationURLRequestProperties:(id)a3;
- (void)_dialogDidFinishNotification:(id)a3;
- (void)_handleAccountURL:(id)a3;
- (void)_handleFinishedBackgroundLoadSectionsOperation:(id)a3;
- (void)_handleFinishedLoadSectionsOperation:(id)a3;
- (void)_handleSearchURL:(id)a3;
- (void)_handleSectionsLoadFailedWithError:(id)a3;
- (void)_mainThreadStoreFrontChangedNotification:(id)a3;
- (void)_presentSectionFetchUI;
- (void)_reloadOverlayConfigurations;
- (void)_reloadWithSectionsResponse:(id)a3;
- (void)_restrictionsChangedNotification:(id)a3;
- (void)_retrySectionsAfterNetworkTransition;
- (void)_saveArchivedNavigationPath;
- (void)_selectFooterSectionNotification:(id)a3;
- (void)_storeFrontChangedNotification:(id)a3;
- (void)cancelAllOperations;
- (void)composeEmailByRestoringAutosavedMessage;
- (void)composeEmailWithSubject:(id)a3 body:(id)a4;
- (void)connect;
- (void)dealloc;
- (void)dismissMailComposeViewControllerAnimated:(BOOL)a3;
- (void)dismissOverlayBackgroundViewController;
- (void)exitStoreAfterDialogsDismiss;
- (void)exitStoreWithReason:(int64_t)a3;
- (void)handleApplicationURL:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)prepareForSuspend;
- (void)presentExternalURLViewController:(id)a3;
- (void)presentMailComposeViewController:(id)a3 animated:(BOOL)a4;
- (void)setLaunchURL:(id)a3;
- (void)setupUI;
- (void)tabBarController:(id)a3 didEndCustomizingViewControllers:(id)a4 changed:(BOOL)a5;
- (void)tearDownUI;
@end

@implementation SUStoreController

- (SUStoreController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SUStoreController;
  v2 = [(SUStoreController *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(SUClient);
    v2->_client = v3;
    [(SUClient *)v3 setDelegate:v2];
    +[SUClient setSharedClient:v2->_client];
    [(SUPurchaseManager *)[(SUClientInterface *)[(SUClient *)v2->_client clientInterface] purchaseManager] setDelegate:v2];
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F89480], "sharedInstance"), "copyProtocolConditionalContext");
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3052000000;
    v8[3] = __Block_byref_object_copy__41;
    v8[4] = __Block_byref_object_dispose__41;
    v8[5] = v2;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __25__SUStoreController_init__block_invoke;
    v7[3] = &unk_264814298;
    v7[4] = v8;
    [v4 setItemLookupBlock:v7];
    [MEMORY[0x263F7B2D0] setDefaultConditionalContext:v4];

    +[SURemoteNotificationController sharedInstance];
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__selectFooterSectionNotification_ name:*MEMORY[0x263F89430] object:0];
    [v5 addObserver:v2 selector:sel__storeFrontChangedNotification_ name:*MEMORY[0x263F7B4D8] object:0];
    [v5 addObserver:v2 selector:sel__bagDidLoadNotification_ name:*MEMORY[0x263F89450] object:0];
    [v5 addObserver:v2 selector:sel__restrictionsChangedNotification_ name:*MEMORY[0x263F536E0] object:0];
    [v5 addObserver:v2 selector:sel__accountControllerDisappearedNotification_ name:@"SUAccountViewControllerDidDisappearNotification" object:0];
    [v5 addObserver:v2 selector:sel__reloadForNetworkTypeChange_ name:@"SUNetworkTypeChangedNotification" object:0];
    _Block_object_dispose(v8, 8);
  }
  return v2;
}

uint64_t __25__SUStoreController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) libraryContainsItemIdentifier:a2];
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89430] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F7B4D8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F89450] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F536E0] object:0];
  [v3 removeObserver:self name:@"SUAccountViewControllerDidDisappearNotification" object:0];
  [v3 removeObserver:self name:@"SUNetworkTypeChangedNotification" object:0];
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F89480], "sharedInstance"), "copyProtocolConditionalContext");
  [MEMORY[0x263F7B2D0] setDefaultConditionalContext:v4];

  v5 = [(SUClientInterface *)[(SUClient *)self->_client clientInterface] purchaseManager];
  if ((SUStoreController *)[(SUPurchaseManager *)v5 delegate] == self) {
    [(SUPurchaseManager *)v5 setDelegate:0];
  }
  +[SUClient setSharedClient:0];
  [(SUClient *)self->_client setDelegate:0];

  self->_client = 0;
  [(SUStoreController *)self tearDownUI];
  [(SUStoreController *)self _cancelLoadSectionsOperation];

  v6.receiver = self;
  v6.super_class = (Class)SUStoreController;
  [(SUStoreController *)&v6 dealloc];
}

+ (id)sharedInstance
{
  return (id)__SharedInstance_2;
}

+ (void)setSharedInstance:(id)a3
{
  if ((id)__SharedInstance_2 != a3)
  {

    __SharedInstance_2 = (uint64_t)a3;
  }
}

- (BOOL)application:(id)a3 handleOpenURL:(id)a4
{
  if (self->_lastSectionsResponse) {
    [(SUStoreController *)self handleApplicationURL:a4];
  }
  else {
    [(SUStoreController *)self setLaunchURL:a4];
  }
  return 1;
}

- (void)cancelAllOperations
{
  [(SUStoreController *)self _cancelLoadSectionsOperation];
  v2 = (void *)[MEMORY[0x263F894E0] mainQueue];

  [v2 cancelAllOperations];
}

- (void)connect
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F89518] invalidateCurrentMap];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "reloadNetworkType");
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "existingDefaultStore"), "reloadAccounts");
  if (self->_localStoreFrontAtLastSuspend || self->_synchedStoreFrontAtLastSuspend)
  {
    if (((v3 = (void *)[MEMORY[0x263F7B148] currentDevice],
           [v3 reloadStoreFrontIdentifier],
           uint64_t v4 = [v3 storeFrontIdentifier],
           localStoreFrontAtLastSuspend = self->_localStoreFrontAtLastSuspend,
           localStoreFrontAtLastSuspend == (NSString *)v4)
       || -[NSString isEqualToString:](localStoreFrontAtLastSuspend, "isEqualToString:"))
      && (![v3 isStoreFrontIdentifierTransient]
       || (uint64_t v6 = [v3 synchedStoreFrontIdentifier],
           synchedStoreFrontAtLastSuspend = self->_synchedStoreFrontAtLastSuspend,
           synchedStoreFrontAtLastSuspend == (NSString *)v6)
       || -[NSString isEqualToString:](synchedStoreFrontAtLastSuspend, "isEqualToString:")))
    {
      char v8 = 0;
    }
    else
    {
      objc_super v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
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
        int v34 = 138412290;
        uint64_t v35 = objc_opt_class();
        LODWORD(v31) = 12;
        v30 = &v34;
        uint64_t v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          v13 = (void *)v12;
          uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v34, v31);
          free(v13);
          v30 = (int *)v14;
          SSFileLog();
        }
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache", v30), "invalidateAllURLBags");
      char v8 = 1;
    }
    v15 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:self selector:sel__storeFrontChangedNotification_ name:*MEMORY[0x263F7B4D8] object:0];

    self->_localStoreFrontAtLastSuspend = 0;
    self->_synchedStoreFrontAtLastSuspend = 0;
    if (v8)
    {
      uint64_t v16 = 0;
LABEL_23:
      BOOL reloadSectionsOnNextLaunch = 1;
      goto LABEL_24;
    }
  }
  if (!self->_lastSectionsResponse)
  {
    uint64_t v16 = 1;
    goto LABEL_23;
  }
  BOOL reloadSectionsOnNextLaunch = self->_reloadSectionsOnNextLaunch;
  uint64_t v16 = 1;
LABEL_24:
  self->_BOOL reloadSectionsOnNextLaunch = 0;
  v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"SUNavigationAccountID");
  uint64_t v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore"), "activeAccount"), "uniqueIdentifier");
  if ((void *)v19 != v18 && ([v18 isEqual:v19] & 1) == 0)
  {
    v20 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v22 &= 2u;
    }
    if (v22)
    {
      uint64_t v23 = objc_opt_class();
      int v34 = 138412290;
      uint64_t v35 = v23;
      LODWORD(v31) = 12;
      v30 = &v34;
      uint64_t v24 = _os_log_send_and_compose_impl();
      if (v24)
      {
        v25 = (void *)v24;
        uint64_t v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v34, v31);
        free(v25);
        v30 = (int *)v26;
        SSFileLog();
      }
    }
    [(SUTabBarController *)self->_tabBarController resetToSystemDefaults];
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "launchedToTest") & 1) == 0)
  {
    if (reloadSectionsOnNextLaunch)
    {
      [+[SUNetworkObserver sharedInstance] startNetworkAvailabilityTimer];
      [(SUTabBarController *)self->_tabBarController dismissViewControllerAnimated:0 completion:0];
      [(SUTabBarController *)self->_tabBarController setSections:0];
      [(SUStoreController *)self _presentSectionFetchUI];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __28__SUStoreController_connect__block_invoke_2;
      v32[3] = &unk_264812130;
      v32[4] = self;
      v27 = v32;
      v28 = self;
      uint64_t v29 = v16;
    }
    else
    {
      if (![(SUTabBarController *)self->_tabBarController sections])
      {
        [(SUTabBarController *)self->_tabBarController setSections:[(SUSectionsResponse *)self->_lastSectionsResponse sections]];
        [(SUTabBarController *)self->_tabBarController loadFromDefaults];
        [(SUStoreController *)self setupUI];
      }
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __28__SUStoreController_connect__block_invoke;
      v33[3] = &unk_264812130;
      v33[4] = self;
      v27 = v33;
      v28 = self;
      uint64_t v29 = 1;
    }
    [(SUStoreController *)v28 _loadSectionsAllowingCache:v29 withCompletionBlock:v27];
  }
}

uint64_t __28__SUStoreController_connect__block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) mainThreadProxy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);

  return [v2 _handleFinishedBackgroundLoadSectionsOperation:v3];
}

uint64_t __28__SUStoreController_connect__block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) mainThreadProxy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);

  return [v2 _handleFinishedLoadSectionsOperation:v3];
}

- (id)copySuspendSettings
{
  return objc_alloc_init(MEMORY[0x263EFF9A0]);
}

- (double)defaultImageSnapshotExpiration
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "distantFuture"), "timeIntervalSinceReferenceDate");
  if (self->_reloadSectionsOnNextLaunch)
  {
    uint64_t v4 = (void *)[MEMORY[0x263EFF910] distantPast];
    [v4 timeIntervalSinceReferenceDate];
  }
  else
  {
    double v6 = v3;
    if ([(SUStoreController *)self isTabBarControllerLoaded]
      && (v7 = [(UINavigationController *)[(SUStoreController *)self topNavigationController] topViewController], (objc_opt_respondsToSelector() & 1) != 0))
    {
      [(UIViewController *)v7 defaultPNGExpirationTime];
    }
    else
    {
      return v6;
    }
  }
  return result;
}

- (void)dismissOverlayBackgroundViewController
{
}

- (void)exitStoreAfterDialogsDismiss
{
  if ([+[SUDialogManager sharedInstance] numberOfPendingDialogs])
  {
    [(SUStoreController *)self _cancelSuspendAfterDialogsDismissed];
    double v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__dialogDidFinishNotification_ name:@"SUDialogDidFinishNotification" object:0];
  }
  else
  {
    [(SUStoreController *)self exitStoreWithReason:0];
  }
}

- (void)exitStoreWithReason:(int64_t)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);

  [v3 suspend];
}

- (BOOL)isStoreEnabled
{
  v2 = (void *)[MEMORY[0x263F89540] sharedCache];
  uint64_t v3 = objc_msgSend(v2, "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0));
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (void *)v3;
  CFArrayRef v5 = (const __CFArray *)objc_msgSend(+[SUClient sharedClient](SUClient, "sharedClient"), "assetTypes");
  if (!v5) {
    return 1;
  }
  CFArrayRef v6 = v5;
  CFIndex Count = CFArrayGetCount(v5);
  char v8 = Count == 0;
  if (Count >= 1)
  {
    CFIndex v9 = Count;
    CFIndex v10 = 0;
    char v8 = 0;
    do
    {
      CFArrayGetValueAtIndex(v6, v10);
      uint64_t v11 = SSDownloadKindForAssetType();
      if (v8) {
        char v8 = 1;
      }
      else {
        char v8 = objc_msgSend((id)objc_msgSend(v4, "networkConstraintsForDownloadKind:", v11), "isAnyNetworkTypeEnabled");
      }
      ++v10;
    }
    while (v9 != v10);
  }
  return v8;
}

- (BOOL)isTabBarControllerLoaded
{
  return self->_tabBarController != 0;
}

- (BOOL)libraryContainsItemIdentifier:(unint64_t)a3
{
  return 0;
}

- (BOOL)matchesClientApplication:(id)a3
{
  return 1;
}

- (id)overlayBackgroundViewController
{
  return [(SUTabBarController *)self->_tabBarController overlayBackgroundViewController];
}

- (id)overlayConfigurationForStorePage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[a3 URLRequestProperties];
  uint64_t v5 = [v4 URLBagKey];
  uint64_t v6 = [v4 URL];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  overlayConfigurations = self->_overlayConfigurations;
  uint64_t v8 = [(NSArray *)overlayConfigurations countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v15;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v15 != v10) {
      objc_enumerationMutation(overlayConfigurations);
    }
    uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
    if (v6)
    {
      if ([*(id *)(*((void *)&v14 + 1) + 8 * v11) matchesURL:v6]) {
        return v12;
      }
    }
    if (v5 && ([v12 matchesURLBagKey:v5] & 1) != 0) {
      return v12;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [(NSArray *)overlayConfigurations countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)prepareForSuspend
{
  if (self->_mailComposeViewController)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = *MEMORY[0x263F1D108];
    uint64_t v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__SUStoreController_prepareForSuspend__block_invoke;
    v10[3] = &unk_264812108;
    v10[4] = &v11;
    uint64_t v4 = [v3 beginBackgroundTaskWithExpirationHandler:v10];
    v12[3] = v4;
    mailComposeViewController = self->_mailComposeViewController;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__SUStoreController_prepareForSuspend__block_invoke_2;
    v9[3] = &unk_2648142C0;
    v9[4] = &v11;
    [(MFMailComposeViewController *)mailComposeViewController autosaveWithHandler:v9];
    _Block_object_dispose(&v11, 8);
  }
  [MEMORY[0x263EFC600] sharedURLCache];
  ISURLCacheSaveMemoryCache();
  if ([(SUStoreController *)self _isAccountViewControllerVisible]) {
    [(SUTabBarController *)self->_tabBarController dismissViewControllerAnimated:0 completion:0];
  }
  uint64_t v6 = (void *)[MEMORY[0x263F7B148] currentDevice];

  self->_localStoreFrontAtLastSuspend = (NSString *)(id)[v6 storeFrontIdentifier];
  id v7 = (id)[v6 synchedStoreFrontIdentifier];
  self->_synchedStoreFrontAtLastSuspend = (NSString *)v7;
  if ((unint64_t)self->_localStoreFrontAtLastSuspend | (unint64_t)v7)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v8 removeObserver:self name:*MEMORY[0x263F7B4D8] object:0];
  }
  [(SUStoreController *)self _saveArchivedNavigationPath];
  [(SUStoreController *)self _cancelLoadSectionsOperation];
}

uint64_t __38__SUStoreController_prepareForSuspend__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *MEMORY[0x263F1D108];
  return result;
}

uint64_t __38__SUStoreController_prepareForSuspend__block_invoke_2(uint64_t a1, const void *a2)
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE60];
  CFPreferencesSetAppValue(@"SUAutosavedMessageID", a2, (CFStringRef)*MEMORY[0x263EFFE60]);
  CFPreferencesAppSynchronize(v3);
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *MEMORY[0x263F1D108];
  return result;
}

- (void)presentExternalURLViewController:(id)a3
{
  objc_opt_class();
  id v5 = a3;
  if (objc_opt_isKindOfClass()) {
    id v5 = (id)[a3 topViewController];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (id v6 = [(SUStoreController *)self overlayConfigurationForStorePage:v5]) != 0)
  {
    id v7 = v6;
    uint64_t v8 = [(SUStoreController *)self tabBarController];
    [(UIViewController *)v8 presentViewController:a3 inOverlayWithConfiguration:v7];
  }
  else
  {
    uint64_t v9 = [(SUStoreController *)self tabBarController];
    [(SUTabBarController *)v9 setTransientViewController:a3 animated:0];
    if ([(SUTabBarController *)v9 presentedViewController])
    {
      [(SUTabBarController *)v9 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  return [(SUTabBarController *)self->_tabBarController presentOverlayBackgroundViewController:a3];
}

- (BOOL)reloadSectionWithIdentifier:(id)a3 url:(id)a4
{
  return 1;
}

- (BOOL)selectSectionWithIdentifier:(id)a3
{
  return 1;
}

- (BOOL)showDialogForCapabilities:(id)a3 mismatches:(id)a4
{
  return 0;
}

- (void)tearDownUI
{
  if ([(SUTabBarController *)self->_tabBarController isViewLoaded]) {
    objc_msgSend((id)-[SUTabBarController view](self->_tabBarController, "view"), "removeFromSuperview");
  }

  self->_tabBarController = 0;
}

- (NSString)defaultPNGNameForSuspend
{
  id v2 = [(SUStoreController *)self _resumableViewController];

  return (NSString *)[v2 defaultPNGName];
}

- (id)storeContentLanguage
{
  if (!self->_storeFrontLanguages)
  {
    id v3 = objc_alloc(NSDictionary);
    self->_storeFrontLanguages = (NSDictionary *)objc_msgSend(v3, "initWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"StoreFrontLanguages", @"plist"));
  }
  id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "storeFrontIdentifier");
  if (result)
  {
    id v5 = result;
    uint64_t v6 = objc_msgSend(result, "rangeOfString:options:range:", @"-", 0, 0, objc_msgSend(result, "length"));
    uint64_t v7 = objc_msgSend(v5, "rangeOfString:options:range:", @",", 0, 0, objc_msgSend(v5, "length"));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_8:
        id v8 = [(NSDictionary *)self->_storeFrontLanguages objectForKey:v5];
        return (id)[v8 objectForKey:@"LanguageCode"];
      }
      uint64_t v6 = v7;
    }
    id v5 = (id)[v5 substringToIndex:v6];
    goto LABEL_8;
  }
  return result;
}

- (SUTabBarController)tabBarController
{
  if (!self->_tabBarController)
  {
    id v3 = [[SUTabBarController alloc] initWithClientInterface:[(SUClient *)self->_client clientInterface]];
    self->_tabBarController = v3;
    [(SUTabBarController *)v3 setDelegate:self];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    objc_msgSend((id)-[SUTabBarController view](self->_tabBarController, "view"), "setFrame:", v4, v5, v6, v7);
    if ([MEMORY[0x263F1C408] shouldMakeUIForDefaultPNG])
    {
      id v8 = objc_msgSend(-[SUClient viewControllerFactory](self->_client, "viewControllerFactory"), "newPlaceholderViewController");
      objc_msgSend(v8, "setClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
      uint64_t v9 = [[SUNavigationController alloc] initWithRootViewController:v8];
      [(SUNavigationController *)v9 setClientInterface:[(SUClient *)self->_client clientInterface]];
      [(SUTabBarController *)self->_tabBarController setTransientViewController:v9];
    }
  }
  return self->_tabBarController;
}

- (UINavigationController)topNavigationController
{
  id v3 = (UINavigationController *)[(SUTabBarController *)[(SUStoreController *)self tabBarController] transientViewController];
  if (!v3) {
    id v3 = [(UITabBarController *)[(SUStoreController *)self tabBarController] selectedNavigationController];
  }
  for (i = v3; [(UINavigationController *)i presentedViewController]; id v3 = i)
    i = (UINavigationController *)[(UINavigationController *)v3 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }

  return (UINavigationController *)[(UINavigationController *)v3 navigationController];
}

- (id)newScriptInterface
{
  return objc_alloc_init(SUScriptInterface);
}

- (void)_accountControllerDisappearedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_reloadForStorefrontChangeAfterAccountSetup)
  {
    double v4 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3);
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v12 = 138412290;
      uint64_t v13 = objc_opt_class();
      LODWORD(v11) = 12;
      uint64_t v10 = &v12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        id v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v12, v11);
        free(v8);
        uint64_t v10 = (int *)v9;
        SSFileLog();
      }
    }
    self->_reloadForStorefrontChangeAfterAccountSetup = 0;
    [(SUStoreController *)self _reloadForStorefrontChange];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3), "postNotificationName:object:", @"SUStoreEnabledChangedNotification", self);
}

- (void)_bagDidLoadNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(SUStoreController *)self _isAccountViewControllerVisible])
  {
    double v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v12 = 138412290;
      uint64_t v13 = objc_opt_class();
      LODWORD(v11) = 12;
      uint64_t v10 = &v12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        id v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v12, v11);
        free(v8);
        SSFileLog();
        [(SUStoreController *)self _reloadOverlayConfigurations];
        return;
      }
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SUStoreEnabledChangedNotification", self);
  }
  [(SUStoreController *)self _reloadOverlayConfigurations];
}

- (void)_dialogDidFinishNotification:(id)a3
{
  if (![+[SUDialogManager sharedInstance] numberOfPendingDialogs])
  {
    [(SUStoreController *)self exitStoreWithReason:0];
  }
}

- (void)_restrictionsChangedNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SUStoreController__restrictionsChangedNotification___block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __54__SUStoreController__restrictionsChangedNotification___block_invoke(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(result + 32) + 24))
  {
    uint64_t v1 = result;
    id v2 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    if (!os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v4 &= 2u;
    }
    if (v4)
    {
      int v10 = 138412290;
      uint64_t v11 = objc_opt_class();
      LODWORD(v9) = 12;
      id v8 = &v10;
      uint64_t v5 = _os_log_send_and_compose_impl();
      if (v5)
      {
        int v6 = (void *)v5;
        uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4, &v10, v9);
        free(v6);
        id v8 = (int *)v7;
        SSFileLog();
      }
    }
    return objc_msgSend(*(id *)(*(void *)(v1 + 32) + 88), "setSections:", objc_msgSend(*(id *)(*(void *)(v1 + 32) + 24), "sections", v8));
  }
  return result;
}

- (void)_mainThreadStoreFrontChangedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(SUStoreController *)self _isAccountViewControllerVisible])
  {
    int v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v10 = 138412290;
      uint64_t v11 = objc_opt_class();
      LODWORD(v9) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        id v8 = (void *)v7;
        objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v10, v9);
        free(v8);
        SSFileLog();
      }
    }
    self->_reloadForStorefrontChangeAfterAccountSetup = 1;
  }
  else
  {
    [(SUStoreController *)self _reloadForStorefrontChange];
  }
}

- (void)_selectFooterSectionNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v4 = (void *)[a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F89428]];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "isSuspended") & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v7 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v8 &= 2u;
      }
      if (v8)
      {
        int v14 = 138412546;
        uint64_t v15 = objc_opt_class();
        __int16 v16 = 2112;
        uint64_t v17 = v5;
        LODWORD(v13) = 22;
        uint64_t v12 = &v14;
        uint64_t v9 = _os_log_send_and_compose_impl();
        if (v9)
        {
          int v10 = (void *)v9;
          uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v14, v13);
          free(v10);
          uint64_t v12 = (int *)v11;
          SSFileLog();
        }
      }
      -[SUTabBarController setSelectedIdentifier:](self->_tabBarController, "setSelectedIdentifier:", v5, v12);
    }
  }
}

- (void)_storeFrontChangedNotification:(id)a3
{
  int v4 = (void *)[(SUStoreController *)self mainThreadProxy];

  [v4 _mainThreadStoreFrontChangedNotification:a3];
}

- (BOOL)client:(id)a3 openInternalURL:(id)a4
{
  return 1;
}

- (BOOL)client:(id)a3 presentAccountViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  int v8 = [[SUNavigationController alloc] initWithRootViewController:a4];
  -[SUNavigationController setClientInterface:](v8, "setClientInterface:", [a3 clientInterface]);
  [(SUNavigationController *)v8 setNavigationBarHidden:1];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1) {
    BOOL v9 = [(SUStoreController *)self _showWildcatAccountViewController:v8 animated:v5];
  }
  else {
    BOOL v9 = [(SUStoreController *)self client:a3 presentModalViewController:v8 animated:v5];
  }
  BOOL v10 = v9;

  return v10;
}

- (BOOL)client:(id)a3 presentModalViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  for (i = [(SUStoreController *)self tabBarController];
        ;
        i = (SUTabBarController *)[(SUTabBarController *)v8 presentedViewController])
  {
    int v8 = i;
    if (![(SUTabBarController *)i presentedViewController]) {
      break;
    }
  }
  [(UIViewController *)v8 transitionSafePresentModalViewController:a4 animated:v5];
  return v8 != 0;
}

- (id)downloadQueueForClient:(id)a3 downloadKinds:(id)a4
{
  return 0;
}

- (id)topViewControllerForClient:(id)a3
{
  int v3 = [(SUStoreController *)self topNavigationController];

  return [(UINavigationController *)v3 topViewController];
}

- (void)tabBarController:(id)a3 didEndCustomizingViewControllers:(id)a4 changed:(BOOL)a5
{
  if (a5) {
    [(SUTabBarController *)self->_tabBarController saveOrderingToDefaults];
  }
}

- (void)handleApplicationURL:(id)a3
{
  uint64_t v5 = [a3 storeURLType];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
  if (v5 != 1 || v6 == 1)
  {
    if (v5 == 2)
    {
      [(SUStoreController *)self _handleAccountURL:a3];
    }
    else
    {
      id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F7B368]), "initWithURL:", objc_msgSend(a3, "schemeSwizzledURL"));
      [(SUStoreController *)self _defaultHandleApplicationURLRequestProperties:v7];
    }
  }
  else
  {
    [(SUStoreController *)self _handleSearchURL:a3];
  }
}

- (void)setupUI
{
  int v3 = [(SUStoreController *)self launchURL];
  if (v3) {
    [(SUStoreController *)self handleApplicationURL:v3];
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "shouldLaunchSafe") & 1) == 0)
  {
    [(SUStoreController *)self composeEmailByRestoringAutosavedMessage];
  }
}

- (void)_cancelLoadSectionsOperation
{
  self->_loadSectionsOperation = 0;
}

- (void)_handleFinishedBackgroundLoadSectionsOperation:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[a3 sectionsResponse];

  self->_lastBackgroundSectionsResponse = 0;
  if ([a3 success]
    && [v5 responseType] == 1
    && (objc_msgSend((id)objc_msgSend(v5, "versionString"), "isEqualToString:", -[SUSectionsResponse versionString](self->_lastSectionsResponse, "versionString")) & 1) == 0)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v14 = 138412290;
      uint64_t v15 = objc_opt_class();
      LODWORD(v13) = 12;
      uint64_t v12 = &v14;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        BOOL v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v14, v13);
        free(v10);
        uint64_t v12 = (int *)v11;
        SSFileLog();
      }
    }
    self->_lastBackgroundSectionsResponse = (SUSectionsResponse *)v5;
    self->_BOOL reloadSectionsOnNextLaunch = 1;
  }
  [(SUStoreController *)self _cancelLoadSectionsOperation];
}

- (void)_handleFinishedLoadSectionsOperation:(id)a3
{
  if ([a3 success]) {
    -[SUStoreController _reloadWithSectionsResponse:](self, "_reloadWithSectionsResponse:", [a3 sectionsResponse]);
  }
  else {
    -[SUStoreController _handleSectionsLoadFailedWithError:](self, "_handleSectionsLoadFailedWithError:", [a3 error]);
  }

  [(SUStoreController *)self _cancelLoadSectionsOperation];
}

- (void)_handleSectionsLoadFailedWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (ISErrorIndicatesSlowNetwork())
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
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
      int v15 = 138412290;
      uint64_t v16 = objc_opt_class();
      LODWORD(v14) = 12;
      uint64_t v13 = &v15;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v15, v14);
        free(v9);
        uint64_t v13 = (int *)v10;
        SSFileLog();
      }
    }
    [+[SUDialogManager sharedInstance] presentDialogForError:a3];
    [(SUStoreController *)self _retrySectionsAfterNetworkTransition];
  }
  else
  {
    uint64_t v11 = (void *)[(SUTabBarController *)self->_tabBarController transientViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = (void *)[v11 topViewController];
    }
    if (objc_opt_respondsToSelector()) {
      [v11 setSkLoading:0];
    }
    uint64_t v12 = +[SUDialogManager sharedInstance];
    if (![(SUDialogManager *)v12 numberOfPendingDialogs])
    {
      if (!a3) {
        a3 = (id)ISError();
      }
      [(SUDialogManager *)v12 presentDialogForError:a3];
    }
    [(SUStoreController *)self exitStoreAfterDialogsDismiss];
  }
}

- (BOOL)_loadSectionsAllowingCache:(BOOL)a3 withCompletionBlock:(id)a4
{
  loadSectionsOperation = self->_loadSectionsOperation;
  if (!loadSectionsOperation)
  {
    BOOL v6 = a3;
    uint64_t v8 = [[SULoadSectionsOperation alloc] initWithClientInterface:[(SUClient *)self->_client clientInterface]];
    [(SULoadSectionsOperation *)v8 setActiveSectionVersionString:[(SUSectionsResponse *)self->_lastSectionsResponse versionString]];
    [(SULoadSectionsOperation *)v8 setCompletionBlock:a4];
    [(SULoadSectionsOperation *)v8 setShouldUseCache:v6];
    self->_loadSectionsOperation = &v8->super;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v8);
  }
  return loadSectionsOperation == 0;
}

- (void)_presentSectionFetchUI
{
  id v4 = (id)objc_msgSend(-[SUClient viewControllerFactory](self->_client, "viewControllerFactory"), "newPlaceholderViewController");
  objc_msgSend(v4, "setClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
  int v3 = [[SUNavigationController alloc] initWithRootViewController:v4];
  [(SUNavigationController *)v3 setClientInterface:[(SUClient *)self->_client clientInterface]];
  [v4 setSkLoading:1];
  [(SUTabBarController *)self->_tabBarController setTransientViewController:v3 animated:0];
}

- (BOOL)_reloadForStorefrontChange
{
  [(SUTabBarController *)self->_tabBarController dismissViewControllerAnimated:0 completion:0];
  [(SUTabBarController *)self->_tabBarController setViewControllers:0];
  [(SUStoreController *)self _presentSectionFetchUI];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__SUStoreController__reloadForStorefrontChange__block_invoke;
  v4[3] = &unk_264812130;
  v4[4] = self;
  return [(SUStoreController *)self _loadSectionsAllowingCache:0 withCompletionBlock:v4];
}

uint64_t __47__SUStoreController__reloadForStorefrontChange__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) mainThreadProxy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);

  return [v2 _handleFinishedLoadSectionsOperation:v3];
}

- (void)_retrySectionsAfterNetworkTransition
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_lastSectionsResponse
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "networkType") >= 1)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v5 &= 2u;
    }
    if (v5)
    {
      int v12 = 138412290;
      uint64_t v13 = objc_opt_class();
      LODWORD(v10) = 12;
      uint64_t v9 = &v12;
      uint64_t v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        int v7 = (void *)v6;
        uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v12, v10);
        free(v7);
        uint64_t v9 = (int *)v8;
        SSFileLog();
      }
    }
    [(SUStoreController *)self _presentSectionFetchUI];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__SUStoreController__retrySectionsAfterNetworkTransition__block_invoke;
    v11[3] = &unk_264812130;
    v11[4] = self;
    [(SUStoreController *)self _loadSectionsAllowingCache:1 withCompletionBlock:v11];
  }
}

uint64_t __57__SUStoreController__retrySectionsAfterNetworkTransition__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) mainThreadProxy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);

  return [v2 _handleFinishedLoadSectionsOperation:v3];
}

- (void)_cancelSuspendAfterDialogsDismissed
{
  uint64_t v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v3 removeObserver:self name:@"SUDialogDidFinishNotification" object:0];
}

- (void)_defaultHandleApplicationURLRequestProperties:(id)a3
{
  uint64_t v5 = objc_msgSend(-[SUTabBarController selectedViewController](-[SUStoreController tabBarController](self, "tabBarController"), "selectedViewController"), "section");
  id v7 = (id)objc_msgSend(-[SUClient viewControllerFactory](self->_client, "viewControllerFactory"), "newStorePageViewControllerWithSection:", 0);
  objc_msgSend(v7, "setClientInterface:", -[SUClient clientInterface](self->_client, "clientInterface"));
  [v7 setExternalRequest:1];
  [v7 setURLRequestProperties:a3];
  uint64_t v6 = [[SUNavigationController alloc] initWithSection:v5 rootViewController:v7];
  [(SUNavigationController *)v6 setClientInterface:[(SUClient *)self->_client clientInterface]];
  [(SUStoreController *)self presentExternalURLViewController:v6];
}

- (void)_handleAccountURL:(id)a3
{
  BOOL v4 = 1;
  id v14 = (id)[a3 copyQueryStringDictionaryWithUnescapedValues:1];
  uint64_t v5 = [v14 objectForKey:@"url"];
  if (v5)
  {
    uint64_t v6 = (void *)[NSURL URLWithString:v5];
    BOOL v4 = v6 == 0;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v14 objectForKey:@"continuation"];
  if (v7) {
    uint64_t v8 = (void *)[NSURL copyDictionaryForQueryString:v7 unescapedValues:1];
  }
  else {
    uint64_t v8 = 0;
  }
  if ([v14 objectForKey:@"dsid"]) {
    UniqueIdentifierFromValue = (void *)SSAccountGetUniqueIdentifierFromValue();
  }
  else {
    UniqueIdentifierFromValue = 0;
  }
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F7B290]), "initWithURL:", objc_msgSend(v6, "schemeSwizzledURL"));
  [v10 setRequestParameters:v8];
  uint64_t v11 = objc_alloc_init(SUAccountViewController);
  [(SUViewController *)v11 setClientInterface:[(SUClient *)self->_client clientInterface]];
  [(SUStorePageViewController *)v11 setExternalRequest:1];
  [(SUStorePageViewController *)v11 setURLRequestProperties:v10];
  [(SUAccountViewController *)v11 setStyle:v4];
  if (UniqueIdentifierFromValue && [UniqueIdentifierFromValue unsignedLongLongValue])
  {
    int v12 = (void *)[(SSAuthenticationContext *)[(SUStorePageViewController *)v11 authenticationContext] mutableCopy];
    if (v12)
    {
      uint64_t v13 = v12;
      [v12 setRequiredUniqueIdentifier:UniqueIdentifierFromValue];
    }
    else
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccountIdentifier:UniqueIdentifierFromValue];
    }
    [(SUStorePageViewController *)v11 setAuthenticationContext:v13];
  }
  objc_msgSend(+[SUClient sharedClient](SUClient, "sharedClient"), "enterAccountFlowWithViewController:animated:", v11, 1);
}

- (void)_handleSearchURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SUStoreController *)self tabBarController];
  uint64_t v6 = [(SUTabBarController *)v5 sections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      int v12 = (void *)[v11 searchFieldConfiguration];
      if (v12)
      {
        if ([v12 location] != 2) {
          break;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    if (!v11) {
      goto LABEL_13;
    }
    -[SUTabBarController setSelectedIdentifier:](v5, "setSelectedIdentifier:", [v11 identifier]);
  }
  else
  {
LABEL_13:
    [(SUTabBarController *)v5 selectSectionOfType:1];
  }
  uint64_t v13 = [(UINavigationController *)[(SUStoreController *)self topNavigationController] topViewController];
  if (objc_opt_respondsToSelector()) {
    -[UIViewController handleApplicationURL:](v13, "handleApplicationURL:", [a3 schemeSwizzledURL]);
  }
}

- (BOOL)_isAccountViewControllerVisible
{
  id v2 = (void *)[(SUTabBarController *)self->_tabBarController presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 topViewController];
  }
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)_reloadOverlayConfigurations
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1
    && (uint64_t v3 = [MEMORY[0x263F7B358] contextWithBagType:0],
        BOOL v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache"), "URLBagForContext:", v3), "valueForKey:", @"p2-overlay-actions"), objc_msgSend(v4, "count")))
  {
    uint64_t v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = [[SUOverlayConfiguration alloc] initWithDictionary:*(void *)(*((void *)&v12 + 1) + 8 * i)];
          if (v10)
          {
            uint64_t v11 = v10;
            [(NSArray *)v5 addObject:v10];
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  self->_overlayConfigurations = v5;
}

- (void)_reloadWithSectionsResponse:(id)a3
{
  lastSectionsResponse = self->_lastSectionsResponse;
  if (lastSectionsResponse != a3)
  {

    self->_lastSectionsResponse = (SUSectionsResponse *)a3;
  }
  [(SUTabBarController *)self->_tabBarController setTransientViewController:0 animated:0];
  [(SUTabBarController *)self->_tabBarController setSections:[(SUSectionsResponse *)self->_lastSectionsResponse sections]];
  [(SUTabBarController *)self->_tabBarController setMoreListTitle:[(SUSectionsResponse *)self->_lastSectionsResponse moreListTitle]];
  lastBackgroundSectionsResponse = self->_lastBackgroundSectionsResponse;
  if (!lastBackgroundSectionsResponse
    || ![(NSString *)[(SUSectionsResponse *)lastBackgroundSectionsResponse versionString] isEqualToString:[(SUSectionsResponse *)self->_lastSectionsResponse versionString]])
  {
    if (![(SUSectionsResponse *)self->_lastSectionsResponse shouldResetUserOrdering]
      || ![(SUSectionsResponse *)self->_lastSectionsResponse responseType])
    {
      goto LABEL_10;
    }
LABEL_9:
    [(SUTabBarController *)self->_tabBarController selectDefaultSection];
    [(SUTabBarController *)self->_tabBarController resetUserDefaults];
    goto LABEL_11;
  }
  if ([(SUSectionsResponse *)self->_lastBackgroundSectionsResponse shouldResetUserOrdering]) {
    goto LABEL_9;
  }
LABEL_10:
  [(SUTabBarController *)self->_tabBarController loadFromDefaults];
LABEL_11:

  self->_lastBackgroundSectionsResponse = 0;

  [(SUStoreController *)self setupUI];
}

- (id)_resumableViewController
{
  id v2 = [(SUTabBarController *)self->_tabBarController selectedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = (void *)[v2 copyArchivableContext];
    if (v3)
    {

      return v2;
    }
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  BOOL v4 = (void *)[v2 viewControllers];
  uint64_t v5 = [v4 count];
  if (v5 < 1) {
    return 0;
  }
  unint64_t v6 = v5;
  do
  {
    id v2 = (id)[v4 objectAtIndex:v6 - 1];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (uint64_t v7 = (void *)[v2 copyArchivableContext]) != 0) {

    }
    else {
      id v2 = 0;
    }
    if (v6 < 2) {
      break;
    }
    --v6;
  }
  while (!v2);
  return v2;
}

- (void)_saveArchivedNavigationPath
{
  if ((objc_msgSend(+[SUClient sharedClient](SUClient, "sharedClient"), "dontSaveNavigationPath") & 1) == 0
    && self->_lastSectionsResponse)
  {
    [(SUTabBarController *)self->_tabBarController saveToDefaults];
  }
  id v3 = +[SUClient sharedClient];

  [v3 setDontSaveNavigationPath:0];
}

- (BOOL)_showWildcatAccountViewController:(id)a3 animated:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v6 = objc_msgSend(-[SUTabBarController overlayBackgroundViewController](self->_tabBarController, "overlayBackgroundViewController", a3, a4), "viewControllers");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      long long v12 = (void *)[v11 backViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v12 topViewController];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
    if (!v11) {
      goto LABEL_14;
    }
    [v11 setBackViewController:a3];
  }
  else
  {
LABEL_14:
    [(SUStoreController *)self presentExternalURLViewController:a3];
  }
  return 1;
}

- (void)composeEmailByRestoringAutosavedMessage
{
  if (CPCanSendMail())
  {
    if (![(SUStoreController *)self isComposingEmail])
    {
      CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE60];
      id v6 = (id)CFPreferencesCopyAppValue(@"SUAutosavedMessageID", (CFStringRef)*MEMORY[0x263EFFE60]);
      if (v6)
      {
        BOOL v4 = (objc_class *)ISWeakLinkedClassForString();
        if ([(objc_class *)v4 hasAutosavedMessageWithIdentifier:v6])
        {
          uint64_t v5 = (MFMailComposeViewController *)objc_alloc_init(v4);
          self->_mailComposeViewController = v5;
          [(MFMailComposeViewController *)v5 setKeyboardVisible:1];
          [(MFMailComposeViewController *)self->_mailComposeViewController setMailComposeDelegate:self];
          [(MFMailComposeViewController *)self->_mailComposeViewController recoverAutosavedMessageWithIdentifier:v6];
          [(SUStoreController *)self presentMailComposeViewController:self->_mailComposeViewController animated:0];
        }
        CFPreferencesSetAppValue(@"SUAutosavedMessageID", 0, v3);
        CFPreferencesAppSynchronize(v3);
      }
    }
  }
}

- (void)composeEmailWithSubject:(id)a3 body:(id)a4
{
  if (CPCanSendMail() && ![(SUStoreController *)self isComposingEmail])
  {
    uint64_t v7 = (MFMailComposeViewController *)objc_alloc_init((Class)ISWeakLinkedClassForString());
    self->_mailComposeViewController = v7;
    [(MFMailComposeViewController *)v7 setKeyboardVisible:1];
    [(MFMailComposeViewController *)self->_mailComposeViewController setMailComposeDelegate:self];
    [(MFMailComposeViewController *)self->_mailComposeViewController setSubject:a3];
    [(MFMailComposeViewController *)self->_mailComposeViewController setMessageBody:a4 isHTML:1];
    mailComposeViewController = self->_mailComposeViewController;
    [(SUStoreController *)self presentMailComposeViewController:mailComposeViewController animated:1];
  }
}

- (void)dismissMailComposeViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(SUStoreController *)self tabBarController];

  [(SUTabBarController *)v4 dismissViewControllerAnimated:v3 completion:0];
}

- (BOOL)isComposingEmail
{
  return self->_mailComposeViewController != 0;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  self->_mailComposeViewController = 0;
}

- (void)presentMailComposeViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SUStoreController *)self topNavigationController];

  [(UINavigationController *)v6 presentViewController:a3 animated:v4 completion:0];
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
}

@end