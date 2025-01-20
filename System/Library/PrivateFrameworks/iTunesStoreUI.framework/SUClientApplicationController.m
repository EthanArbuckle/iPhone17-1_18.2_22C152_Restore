@interface SUClientApplicationController
+ (id)sharedController;
+ (void)setSharedController:(id)a3;
- (BOOL)_displayClientURL:(id)a3;
- (BOOL)_loadSectionsAllowingCache:(BOOL)a3 withCompletionBlock:(id)a4;
- (BOOL)_reloadForStorefrontChange;
- (BOOL)_showWildcatAccountViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)dismissTopViewControllerAnimated:(BOOL)a3;
- (BOOL)displayClientURL:(id)a3 withSourceApplication:(id)a4 sourceURLString:(id)a5;
- (BOOL)isIgnoringDownloadQueueChanges;
- (BOOL)isTabBarControllerLoaded;
- (BOOL)openClientURL:(id)a3 withSourceApplication:(id)a4 sourceURLString:(id)a5;
- (BOOL)presentAccountViewController:(id)a3 showNavigationBar:(BOOL)a4 animated:(BOOL)a5;
- (BOOL)presentOverlayBackgroundViewController:(id)a3;
- (BOOL)reloadSectionWithIdentifier:(id)a3 url:(id)a4;
- (BOOL)selectSectionWithIdentifier:(id)a3;
- (BOOL)shouldPrepareUserInterfaceWhenActivated;
- (BOOL)tabBarController:(id)a3 shouldShowSection:(id)a4;
- (BOOL)wasLaunchedFromLibrary;
- (NSString)defaultPNGNameForSuspend;
- (NSString)exitStoreButtonTitle;
- (NSURL)launchURL;
- (SUClientApplicationController)initWithClientInterface:(id)a3;
- (SUMediaPlayerViewController)_activeMediaPlayer;
- (SUTabBarController)tabBarController;
- (UINavigationController)topNavigationController;
- (double)defaultImageSnapshotExpiration;
- (id)_accountViewController;
- (id)_newTabBarController;
- (id)_previewOverlayViewController;
- (id)_resumableViewController;
- (id)_showPageForExternalOriginatedURLBagKey:(id)a3;
- (id)copySuspendSettings;
- (id)overlayBackgroundViewController;
- (id)previewOverlayForClientInterface:(id)a3;
- (id)showMainPageForItemKind:(id)a3 sectionIdentifiers:(id)a4;
- (void)_accountControllerDisappearedNotification:(id)a3;
- (void)_cancelLoadSectionsOperation;
- (void)_cancelSectionFetchPlaceholder;
- (void)_cancelSuspendAfterDialogsDismissed;
- (void)_defaultHandleApplicationURLRequestProperties:(id)a3;
- (void)_dialogDidFinishNotification:(id)a3;
- (void)_handleAccountURL:(id)a3;
- (void)_handleAddPassbookPassURL:(id)a3;
- (void)_handleDonationURL:(id)a3;
- (void)_handleFinishedBackgroundLoadSectionsOperation:(id)a3;
- (void)_handleFinishedLoadSectionsOperation:(id)a3;
- (void)_handleSearchURL:(id)a3 withSourceApplication:(id)a4 sourceURL:(id)a5;
- (void)_handleSectionsLoadFailedWithError:(id)a3;
- (void)_openClientURL:(id)a3;
- (void)_presentSectionFetchUI;
- (void)_reloadWithSectionsResponse:(id)a3;
- (void)_restorePreMediaPlayerSettings;
- (void)_restrictionsChangedNotification:(id)a3;
- (void)_retrySectionsAfterNetworkTransition;
- (void)_selectFooterSectionNotification:(id)a3;
- (void)_setActiveMediaPlayer:(id)a3;
- (void)_setupTabBarController;
- (void)_showPreviewOverlayAnimated:(BOOL)a3;
- (void)_storeFrontChangedNotification:(id)a3;
- (void)bagDidLoadNotification:(id)a3;
- (void)becomeActive;
- (void)beginIgnoringDownloadQueueChanges;
- (void)cancelAllOperations;
- (void)clientInterface:(id)a3 hidePreviewOverlayAnimated:(BOOL)a4;
- (void)clientInterface:(id)a3 showPreviewOverlayAnimated:(BOOL)a4;
- (void)dealloc;
- (void)dismissOverlayBackgroundViewController;
- (void)endIgnoringDownloadQueueChanges;
- (void)exitStoreAfterDialogsDismiss;
- (void)passbookLoaderDidFinish:(id)a3;
- (void)prepareUserInterface;
- (void)presentExternalURLViewController:(id)a3;
- (void)resignActive;
- (void)setExitStoreButtonTitle:(id)a3;
- (void)setShouldPrepareUserInterfaceWhenActivated:(BOOL)a3;
- (void)setupUI;
- (void)tearDownUI;
@end

@implementation SUClientApplicationController

- (SUClientApplicationController)initWithClientInterface:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)SUClientApplicationController;
  v4 = -[SUClientController initWithClientInterface:](&v21, sel_initWithClientInterface_);
  if (v4)
  {
    id v5 = +[SUSectionsResponse lastCachedVersionIdentifier];
    if (v5)
    {
      id v6 = v5;
      double Current = CFAbsoluteTimeGetCurrent();
      v8 = -[SUSectionsResponse initWithClientInterface:cacheDirectory:]([SUSectionsResponse alloc], "initWithClientInterface:cacheDirectory:", a3, objc_msgSend(+[SUSectionsResponse sectionsCacheDirectory](SUSectionsResponse, "sectionsCacheDirectory"), "stringByAppendingPathComponent:", v6));
      v4->_lastSectionsResponse = v8;
      if (v8)
      {
        v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        int v10 = [v9 shouldLog];
        if ([v9 shouldLogToDisk]) {
          int v11 = v10 | 2;
        }
        else {
          int v11 = v10;
        }
        if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v11 &= 2u;
        }
        if (v11)
        {
          uint64_t v12 = objc_opt_class();
          CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent();
          int v22 = 138412546;
          uint64_t v23 = v12;
          __int16 v24 = 2048;
          double v25 = v13 - Current;
          LODWORD(v20) = 22;
          v19 = &v22;
          uint64_t v14 = _os_log_send_and_compose_impl();
          if (v14)
          {
            v15 = (void *)v14;
            uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v22, v20);
            free(v15);
            v19 = (int *)v16;
            SSFileLog();
          }
        }
      }
    }
    v4->_shouldPrepareUserInterfaceWhenActivated = 1;
    v17 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v19);
    [v17 addObserver:v4 selector:sel__selectFooterSectionNotification_ name:*MEMORY[0x263F89430] object:0];
    [v17 addObserver:v4 selector:sel__restrictionsChangedNotification_ name:*MEMORY[0x263F536E0] object:0];
    [v17 addObserver:v4 selector:sel__storeFrontChangedNotification_ name:*MEMORY[0x263F7B4D8] object:0];
    [v17 addObserver:v4 selector:sel__accountControllerDisappearedNotification_ name:@"SUAccountViewControllerDidDisappearNotification" object:0];
    [v17 addObserver:v4 selector:sel__reloadForNetworkTypeChange_ name:@"SUNetworkTypeChangedNotification" object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89430] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F536E0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F7B4D8] object:0];
  [v3 removeObserver:self name:@"SUAccountViewControllerDidDisappearNotification" object:0];
  [v3 removeObserver:self name:@"SUDialogDidFinishNotification" object:0];
  [v3 removeObserver:self name:@"SUNetworkTypeChangedNotification" object:0];

  [(SUUIPassbookLoader *)self->_passbookLoader setDelegate:0];
  [(SUTabBarController *)self->_tabBarController setDelegate:0];

  [(SUClientApplicationController *)self _cancelLoadSectionsOperation];
  v4.receiver = self;
  v4.super_class = (Class)SUClientApplicationController;
  [(SUClientController *)&v4 dealloc];
}

+ (void)setSharedController:(id)a3
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SUClientApplicationController;
  objc_msgSendSuper2(&v3, sel_setSharedController_, a3);
}

+ (id)sharedController
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SUClientApplicationController;
  return objc_msgSendSuper2(&v3, sel_sharedController);
}

- (void)beginIgnoringDownloadQueueChanges
{
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
    objc_super v4 = (void *)[MEMORY[0x263EFF910] distantPast];
    [v4 timeIntervalSinceReferenceDate];
  }
  else
  {
    double v6 = v3;
    if ([(SUClientApplicationController *)self isTabBarControllerLoaded]
      && (v7 = [(UINavigationController *)[(SUClientApplicationController *)self topNavigationController] topViewController], (objc_opt_respondsToSelector() & 1) != 0))
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

- (NSString)defaultPNGNameForSuspend
{
  double v3 = (NSString *)objc_msgSend(-[SUClientApplicationController _resumableViewController](self, "_resumableViewController"), "defaultPNGName");

  self->_preMediaDefaultPNG = 0;
  objc_super v4 = [(SUClientApplicationController *)self _activeMediaPlayer];
  if (!v4) {
    return v3;
  }
  id v5 = v4;
  self->_preMediaDefaultPNG = v3;

  return (NSString *)[(SUMediaPlayerViewController *)v5 defaultPNGName];
}

- (void)endIgnoringDownloadQueueChanges
{
  int64_t ignoreDownloadQueueChangeCount = self->_ignoreDownloadQueueChangeCount;
  BOOL v3 = ignoreDownloadQueueChangeCount == 1;
  BOOL v4 = ignoreDownloadQueueChangeCount < 1;
  int64_t v5 = ignoreDownloadQueueChangeCount - 1;
  if (!v4)
  {
    self->_int64_t ignoreDownloadQueueChangeCount = v5;
    if (v3)
    {
      v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v7 postNotificationName:@"SUClientDidStopIgnoringDownloadQueueNotification" object:self];
    }
  }
}

- (void)exitStoreAfterDialogsDismiss
{
  if ([+[SUDialogManager sharedInstance] numberOfPendingDialogs])
  {
    [(SUClientApplicationController *)self _cancelSuspendAfterDialogsDismissed];
    BOOL v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__dialogDidFinishNotification_ name:@"SUDialogDidFinishNotification" object:0];
  }
  else
  {
    [(SUClientController *)self exitStoreWithReason:0];
  }
}

- (BOOL)isIgnoringDownloadQueueChanges
{
  return self->_ignoreDownloadQueueChangeCount > 0;
}

- (BOOL)isTabBarControllerLoaded
{
  return self->_tabBarController != 0;
}

- (NSURL)launchURL
{
  return (NSURL *)[(SUUIURL *)self->_launchURL underlyingURL];
}

- (void)prepareUserInterface
{
  [(SUClientApplicationController *)self tabBarController];

  [(SUClientApplicationController *)self _setupTabBarController];
}

- (BOOL)reloadSectionWithIdentifier:(id)a3 url:(id)a4
{
  return 1;
}

- (BOOL)selectSectionWithIdentifier:(id)a3
{
  return 1;
}

- (void)setExitStoreButtonTitle:(id)a3
{
  exitStoreButtonTitle = self->_exitStoreButtonTitle;
  if (exitStoreButtonTitle != a3 && !-[NSString isEqualToString:](exitStoreButtonTitle, "isEqualToString:"))
  {

    self->_exitStoreButtonTitle = (NSString *)[a3 copy];
    double v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"SUClientExitStoreButtonDidChangeNotification" object:self];
  }
}

- (void)setupUI
{
  self->_preMediaDefaultPNG = 0;
  launchURL = self->_launchURL;
  if (launchURL)
  {
    BOOL v4 = launchURL;

    self->_launchURL = 0;
    [(SUClientApplicationController *)self _openClientURL:v4];
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "shouldLaunchSafe") & 1) == 0)
  {
    [(SUClientController *)self composeEmailByRestoringAutosavedMessage];
  }
}

- (id)showMainPageForItemKind:(id)a3 sectionIdentifiers:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = [MEMORY[0x263F89538] storeFrontURLBagKeyForItemKind:a3];
  if (v6)
  {
    return [(SUClientApplicationController *)self _showPageForExternalOriginatedURLBagKey:v6];
  }
  else
  {
    v8 = [(SUClientApplicationController *)self tabBarController];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id result = (id)[a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (result)
    {
      id v9 = result;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        int v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(a4);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v11);
          if ([(SUTabBarController *)v8 viewControllerForSectionIdentifier:v12])
          {
            [(SUTabBarController *)v8 setSelectedIdentifier:v12];
            return [(SUTabBarController *)v8 selectedViewController];
          }
          int v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id result = (id)[a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        id v9 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (SUTabBarController)tabBarController
{
  tabBarController = self->_tabBarController;
  if (!tabBarController)
  {
    tabBarController = [(SUClientApplicationController *)self _newTabBarController];
    self->_tabBarController = tabBarController;
    if (!self->super._rootViewController)
    {
      [(SUClientController *)self setRootViewController:tabBarController];
      return self->_tabBarController;
    }
  }
  return tabBarController;
}

- (void)tearDownUI
{
  [(SUClientApplicationController *)self _cancelSuspendAfterDialogsDismissed];
  tabBarController = self->_tabBarController;
  if ((SUTabBarController *)self->super._rootViewController == tabBarController)
  {
    [(SUClientController *)self setRootViewController:0];
    tabBarController = self->_tabBarController;
  }
  [(SUTabBarController *)tabBarController setDelegate:0];
  if ([(SUTabBarController *)self->_tabBarController isViewLoaded]) {
    objc_msgSend((id)-[SUTabBarController view](self->_tabBarController, "view"), "removeFromSuperview");
  }

  self->_tabBarController = 0;
}

- (UINavigationController)topNavigationController
{
  BOOL v3 = (UINavigationController *)[(SUTabBarController *)[(SUClientApplicationController *)self tabBarController] transientViewController];
  if (!v3) {
    BOOL v3 = [(UITabBarController *)[(SUClientApplicationController *)self tabBarController] selectedNavigationController];
  }
  for (i = v3; [(UINavigationController *)i presentedViewController]; BOOL v3 = i)
    i = (UINavigationController *)[(UINavigationController *)v3 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }

  return (UINavigationController *)[(UINavigationController *)v3 navigationController];
}

- (BOOL)wasLaunchedFromLibrary
{
  return 0;
}

- (void)becomeActive
{
  BOOL v3 = [(SUClientController *)self isActive];
  v4.receiver = self;
  v4.super_class = (Class)SUClientApplicationController;
  [(SUClientController *)&v4 becomeActive];
  if (!v3 && ([MEMORY[0x263F1C408] shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    if ([(SUClientApplicationController *)self shouldPrepareUserInterfaceWhenActivated])
    {
      [(SUClientApplicationController *)self _setupTabBarController];
    }
  }
}

- (void)cancelAllOperations
{
  [(SUClientApplicationController *)self _cancelLoadSectionsOperation];
  v3.receiver = self;
  v3.super_class = (Class)SUClientApplicationController;
  [(SUClientController *)&v3 cancelAllOperations];
}

- (void)dismissOverlayBackgroundViewController
{
}

- (BOOL)dismissTopViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = [(UINavigationController *)[(SUClientApplicationController *)self topNavigationController] topViewController];
  [(UIViewController *)v4 dismissAnimated:v3];
  return v4 != 0;
}

- (BOOL)displayClientURL:(id)a3 withSourceApplication:(id)a4 sourceURLString:(id)a5
{
  uint64_t v9 = [a3 storeURLType];
  uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
  if (v9 != 1 || v10 == 1)
  {
    switch(v9)
    {
      case 4:
        [(SUClientApplicationController *)self _handleAddPassbookPassURL:a3];
        break;
      case 3:
        [(SUClientApplicationController *)self _handleDonationURL:a3];
        break;
      case 2:
        [(SUClientApplicationController *)self _handleAccountURL:a3];
        break;
      default:
        int v11 = objc_msgSend(objc_alloc(MEMORY[0x263F7B290]), "initWithURL:", objc_msgSend(a3, "schemeSwizzledURL"));
        [v11 setValue:a5 forHTTPHeaderField:@"referer"];
        [v11 setValue:a4 forHTTPHeaderField:@"ref-user-agent"];
        [(SUClientApplicationController *)self _defaultHandleApplicationURLRequestProperties:v11];

        break;
    }
  }
  else
  {
    [(SUClientApplicationController *)self _handleSearchURL:a3 withSourceApplication:a4 sourceURL:a5];
  }
  return 1;
}

- (BOOL)openClientURL:(id)a3 withSourceApplication:(id)a4 sourceURLString:(id)a5
{
  uint64_t v9 = ISUIMobileStoreUIFramework();
  uint64_t v10 = objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(&cfstr_Suuiurl.isa, v9)), "initWithURL:", a3);
  [v10 setReferrerApplicationName:a4];
  [v10 setReferrerURLString:a5];
  if (self->_lastSectionsResponse)
  {
    BOOL v11 = [(SUClientApplicationController *)self _displayClientURL:v10];
  }
  else
  {

    self->_launchURL = (SUUIURL *)v10;
    BOOL v11 = 1;
  }

  return v11;
}

- (id)overlayBackgroundViewController
{
  return [(SUTabBarController *)self->_tabBarController overlayBackgroundViewController];
}

- (BOOL)presentAccountViewController:(id)a3 showNavigationBar:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v9 = [[SUNavigationController alloc] initWithRootViewController:a3];
  -[SUNavigationController setClientInterface:](v9, "setClientInterface:", [a3 clientInterface]);
  [(SUNavigationController *)v9 setNavigationBarHidden:!v6];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    BOOL v10 = [(SUClientApplicationController *)self _showWildcatAccountViewController:v9 animated:v5];
  }
  else
  {
    for (i = [(SUClientApplicationController *)self tabBarController];
          ;
          i = (SUTabBarController *)[(SUTabBarController *)v12 presentedViewController])
    {
      uint64_t v12 = i;
      if (![(SUTabBarController *)i presentedViewController]) {
        break;
      }
    }
    [(UIViewController *)v12 transitionSafePresentModalViewController:v9 animated:v5];
    BOOL v10 = v12 != 0;
  }

  return v10;
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
    && (id v6 = [(SUClientController *)self overlayConfigurationForStorePage:v5]) != 0)
  {
    id v7 = v6;
    v8 = [(SUClientApplicationController *)self tabBarController];
    [(UIViewController *)v8 presentViewController:a3 inOverlayWithConfiguration:v7];
  }
  else
  {
    uint64_t v9 = [(SUClientApplicationController *)self tabBarController];
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

- (void)resignActive
{
  if ([(SUClientController *)self isActive])
  {
    [(SUClientApplicationController *)self _cancelLoadSectionsOperation];
    if (self->super._mailComposeViewController)
    {
      uint64_t v8 = 0;
      uint64_t v9 = &v8;
      uint64_t v10 = 0x2020000000;
      uint64_t v11 = *MEMORY[0x263F1D108];
      BOOL v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __45__SUClientApplicationController_resignActive__block_invoke;
      v7[3] = &unk_264812108;
      v7[4] = &v8;
      uint64_t v4 = [v3 beginBackgroundTaskWithExpirationHandler:v7];
      v9[3] = v4;
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __45__SUClientApplicationController_resignActive__block_invoke_2;
      v6[3] = &unk_264812108;
      v6[4] = &v8;
      [(SUClientController *)self autosaveMessageWithCompletionBlock:v6];
      _Block_object_dispose(&v8, 8);
    }
    if (self->_lastSectionsResponse) {
      [(SUTabBarController *)self->_tabBarController saveToDefaults];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SUClientApplicationController;
  [(SUClientController *)&v5 resignActive];
}

uint64_t __45__SUClientApplicationController_resignActive__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *MEMORY[0x263F1D108];
  return result;
}

uint64_t __45__SUClientApplicationController_resignActive__block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *MEMORY[0x263F1D108];
  return result;
}

- (id)_newTabBarController
{
  BOOL v3 = [[SUTabBarController alloc] initWithClientInterface:[(SUClientController *)self clientInterface]];
  [(SUTabBarController *)v3 setDelegate:self];
  uint64_t v4 = (void *)[(SUTabBarController *)v3 view];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  objc_msgSend(v4, "setFrame:");
  if ([MEMORY[0x263F1C408] shouldMakeUIForDefaultPNG])
  {
    objc_super v5 = objc_msgSend(-[SUClientController viewControllerFactory](self, "viewControllerFactory"), "newPlaceholderViewController");
    objc_msgSend(v5, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
    id v6 = [[SUNavigationController alloc] initWithRootViewController:v5];
    [(SUNavigationController *)v6 setClientInterface:[(SUClientController *)self clientInterface]];
    [(SUTabBarController *)v3 setTransientViewController:v6];
  }
  return v3;
}

- (void)_restorePreMediaPlayerSettings
{
  if (self->_preMediaDefaultPNG)
  {
    id v3 = objc_alloc(NSDictionary);
    uint64_t v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", self->_preMediaDefaultPNG, *MEMORY[0x263F1D918], 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "updateSuspendedSettings:", v4);

    self->_preMediaDefaultPNG = 0;
  }
}

- (void)_setActiveMediaPlayer:(id)a3
{
  activeMediaPlayer = self->_activeMediaPlayer;
  if (activeMediaPlayer != a3)
  {

    id v6 = (SUMediaPlayerViewController *)a3;
    self->_activeMediaPlayer = v6;
    if (!v6)
    {
      [(SUClientApplicationController *)self _restorePreMediaPlayerSettings];
    }
  }
}

- (id)_showPageForExternalOriginatedURLBagKey:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v5 setURLBagKey:a3];
  id v6 = objc_msgSend(-[SUClientController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", 0);
  objc_msgSend(v6, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
  [v6 setExternalRequest:1];
  [v6 setURLRequestProperties:v5];
  id v7 = [[SUNavigationController alloc] initWithRootViewController:v6];
  [(SUNavigationController *)v7 setClientInterface:[(SUClientController *)self clientInterface]];
  [(SUClientApplicationController *)self presentExternalURLViewController:v7];

  return v6;
}

- (void)clientInterface:(id)a3 hidePreviewOverlayAnimated:(BOOL)a4
{
  if (self->_previewOverlay)
  {
    BOOL v4 = a4;
    id v5 = [(SUClientApplicationController *)self tabBarController];
    [(SUTabBarController *)v5 _hidePreviewOverlayAnimated:v4];
  }
}

- (void)clientInterface:(id)a3 showPreviewOverlayAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = [(SUClientApplicationController *)self _previewOverlayViewController];
  if ([v6 isContentLoaded])
  {
    id v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v30 = 138412546;
      uint64_t v31 = objc_opt_class();
      __int16 v32 = 2112;
      id v33 = v6;
      LODWORD(v27) = 22;
      uint64_t v26 = &v30;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v30, v27);
        free(v11);
        uint64_t v26 = (int *)v12;
        SSFileLog();
      }
    }
    -[SUClientApplicationController _showPreviewOverlayAnimated:](self, "_showPreviewOverlayAnimated:", v4, v26);
  }
  else
  {
    int v13 = [v6 isSkLoaded];
    long long v14 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    v17 = [v14 OSLogObject];
    if (v13)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        int v18 = v16;
      }
      else {
        int v18 = v16 & 2;
      }
      if (v18)
      {
        int v30 = 138412290;
        uint64_t v31 = objc_opt_class();
        LODWORD(v27) = 12;
        uint64_t v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          uint64_t v20 = (void *)v19;
          objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v30, v27);
          free(v20);
          SSFileLog();
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        int v21 = v16;
      }
      else {
        int v21 = v16 & 2;
      }
      if (v21)
      {
        int v30 = 138412290;
        uint64_t v31 = objc_opt_class();
        LODWORD(v27) = 12;
        uint64_t v26 = &v30;
        uint64_t v22 = _os_log_send_and_compose_impl();
        if (v22)
        {
          uint64_t v23 = (void *)v22;
          uint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v30, v27);
          free(v23);
          uint64_t v26 = (int *)v24;
          SSFileLog();
        }
      }
      uint64_t v25 = objc_msgSend(MEMORY[0x263F7B420], "weakReferenceWithObject:", self, v26);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __76__SUClientApplicationController_clientInterface_showPreviewOverlayAnimated___block_invoke;
      v28[3] = &unk_264814B90;
      v28[4] = v25;
      BOOL v29 = v4;
      [v6 loadWithCompletionBlock:v28];
    }
  }
}

uint64_t __76__SUClientApplicationController_clientInterface_showPreviewOverlayAnimated___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = (void *)[*(id *)(result + 32) object];
    uint64_t v4 = *(unsigned __int8 *)(v2 + 40);
    return [v3 _showPreviewOverlayAnimated:v4];
  }
  return result;
}

- (id)previewOverlayForClientInterface:(id)a3
{
  id v3 = [(SUClientApplicationController *)self _previewOverlayViewController];

  return v3;
}

- (void)passbookLoaderDidFinish:(id)a3
{
  if (self->_passbookLoader == a3)
  {
    [a3 setDelegate:0];

    self->_passbookLoader = 0;
  }
}

- (BOOL)tabBarController:(id)a3 shouldShowSection:(id)a4
{
  return 1;
}

- (void)_accountControllerDisappearedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_reloadForStorefrontChangeAfterAccountSetup)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3);
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
        int v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v12, v11);
        free(v8);
        uint64_t v10 = (int *)v9;
        SSFileLog();
      }
    }
    self->_reloadForStorefrontChangeAfterAccountSetup = 0;
    [(SUClientApplicationController *)self _reloadForStorefrontChange];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3), "postNotificationName:object:", @"SUStoreEnabledChangedNotification", self);
}

- (void)bagDidLoadNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(SUClientApplicationController *)self _accountViewController])
  {
    int v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v17 = 138412290;
      uint64_t v18 = objc_opt_class();
      LODWORD(v15) = 12;
      uint64_t v14 = &v17;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v17, v15);
        free(v9);
        uint64_t v14 = (int *)v10;
        SSFileLog();
      }
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SUStoreEnabledChangedNotification", self);
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x263F89540], "sharedCache", v14);
  int v12 = objc_msgSend((id)objc_msgSend(v11, "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0)), "valueForKey:", @"platform-gradients");
  objc_opt_class();
  uint64_t v13 = 0;
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = objc_msgSend(v12, "objectForKey:", -[SUClientController clientIdentifier](self, "clientIdentifier"));
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "setObject:forKey:", v13, @"SUPlatformGradients");
  v16.receiver = self;
  v16.super_class = (Class)SUClientApplicationController;
  [(SUClientController *)&v16 bagDidLoadNotification:a3];
}

- (void)_dialogDidFinishNotification:(id)a3
{
  if (![+[SUDialogManager sharedInstance] numberOfPendingDialogs])
  {
    [(SUClientController *)self exitStoreWithReason:0];
  }
}

- (void)_restrictionsChangedNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SUClientApplicationController__restrictionsChangedNotification___block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__SUClientApplicationController__restrictionsChangedNotification___block_invoke(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(result + 32) + 160))
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
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
      uint64_t v8 = &v10;
      uint64_t v5 = _os_log_send_and_compose_impl();
      if (v5)
      {
        int v6 = (void *)v5;
        uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4, &v10, v9);
        free(v6);
        uint64_t v8 = (int *)v7;
        SSFileLog();
      }
    }
    return objc_msgSend(*(id *)(*(void *)(v1 + 32) + 216), "setSections:", objc_msgSend(*(id *)(*(void *)(v1 + 32) + 160), "sections", v8));
  }
  return result;
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SUClientApplicationController__storeFrontChangedNotification___block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __64__SUClientApplicationController__storeFrontChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "applicationState") == 2)
  {
    uint64_t v2 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    uint64_t result = os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_DEBUG);
    if (!result) {
      v4 &= 2u;
    }
    if (v4)
    {
      int v13 = 138412290;
      uint64_t v14 = objc_opt_class();
      LODWORD(v12) = 12;
      uint64_t result = _os_log_send_and_compose_impl();
      if (result)
      {
        int v6 = (void *)result;
        objc_msgSend(NSString, "stringWithCString:encoding:", result, 4, &v13, v12);
        free(v6);
        return SSFileLog();
      }
    }
  }
  else if ([*(id *)(a1 + 32) _accountViewController])
  {
    int v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    uint64_t result = os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG);
    if (!result) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v13 = 138412290;
      uint64_t v14 = objc_opt_class();
      LODWORD(v12) = 12;
      uint64_t result = _os_log_send_and_compose_impl();
      if (result)
      {
        int v10 = (void *)result;
        objc_msgSend(NSString, "stringWithCString:encoding:", result, 4, &v13, v12);
        free(v10);
        uint64_t result = SSFileLog();
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 208) = 1;
  }
  else
  {
    uint64_t v11 = *(void **)(a1 + 32);
    return [v11 _reloadForStorefrontChange];
  }
  return result;
}

- (void)_cancelLoadSectionsOperation
{
  self->_loadSectionsOperation = 0;
}

- (void)_cancelSectionFetchPlaceholder
{
  self->_fetchSectionsPlaceholder = 0;
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
      int v14 = 138412290;
      uint64_t v15 = objc_opt_class();
      LODWORD(v13) = 12;
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
    self->_lastBackgroundSectionsResponse = (SUSectionsResponse *)v5;
    self->_reloadSectionsOnNextLaunch = 1;
  }
  [(SUClientApplicationController *)self _cancelLoadSectionsOperation];
}

- (void)_handleFinishedLoadSectionsOperation:(id)a3
{
  if ([a3 success])
  {
    uint64_t v5 = (void *)[a3 sectionsResponse];
    if (objc_msgSend((id)objc_msgSend(v5, "sections"), "count"))
    {
      [(SUClientApplicationController *)self _reloadWithSectionsResponse:v5];
      goto LABEL_7;
    }
    int v7 = self;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [a3 error];
    int v7 = self;
  }
  [(SUClientApplicationController *)v7 _handleSectionsLoadFailedWithError:v6];
LABEL_7:

  [(SUClientApplicationController *)self _cancelLoadSectionsOperation];
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
    [(SUClientApplicationController *)self _retrySectionsAfterNetworkTransition];
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
    [(SUClientApplicationController *)self exitStoreAfterDialogsDismiss];
  }
}

- (BOOL)_loadSectionsAllowingCache:(BOOL)a3 withCompletionBlock:(id)a4
{
  loadSectionsOperation = self->_loadSectionsOperation;
  if (!loadSectionsOperation)
  {
    BOOL v6 = a3;
    uint64_t v8 = [[SULoadSectionsOperation alloc] initWithClientInterface:[(SUClientController *)self clientInterface]];
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
  int v3 = (SUPlaceholderViewController *)objc_msgSend(-[SUClientController viewControllerFactory](self, "viewControllerFactory"), "newPlaceholderViewController");
  self->_fetchSectionsPlaceholder = v3;
  [(SUViewController *)v3 setClientInterface:[(SUClientController *)self clientInterface]];
  int v4 = [[SUNavigationController alloc] initWithRootViewController:self->_fetchSectionsPlaceholder];
  [(SUNavigationController *)v4 setClientInterface:[(SUClientController *)self clientInterface]];
  [(SUPlaceholderViewController *)self->_fetchSectionsPlaceholder setSkLoading:1];
  [(SUTabBarController *)self->_tabBarController setTransientViewController:v4 animated:0];
}

- (BOOL)_reloadForStorefrontChange
{
  if (self->_loadSectionsOperation) {
    return 1;
  }
  [(SUTabBarController *)self->_tabBarController saveToDefaults];
  [(SUTabBarController *)self->_tabBarController dismissViewControllerAnimated:0 completion:0];
  [(SUTabBarController *)self->_tabBarController setViewControllers:0];
  [(SUClientApplicationController *)self _presentSectionFetchUI];

  self->_lastBackgroundSectionsResponse = 0;
  self->_lastSectionsResponse = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SUClientApplicationController__reloadForStorefrontChange__block_invoke;
  v4[3] = &unk_264812130;
  v4[4] = self;
  return [(SUClientApplicationController *)self _loadSectionsAllowingCache:0 withCompletionBlock:v4];
}

void __59__SUClientApplicationController__reloadForStorefrontChange__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUClientApplicationController__reloadForStorefrontChange__block_invoke_2;
  block[3] = &unk_264812130;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__SUClientApplicationController__reloadForStorefrontChange__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelSectionFetchPlaceholder];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[21];

  return [v2 _handleFinishedLoadSectionsOperation:v3];
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
  [(SUTabBarController *)self->_tabBarController setMoreListSelectedImage:[(SUSectionsResponse *)self->_lastSectionsResponse moreListSelectedImage] unselectedImage:[(SUSectionsResponse *)self->_lastSectionsResponse moreListImage]];
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

  [(SUClientApplicationController *)self setupUI];
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
    [(SUClientApplicationController *)self _presentSectionFetchUI];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__SUClientApplicationController__retrySectionsAfterNetworkTransition__block_invoke;
    v11[3] = &unk_264812130;
    v11[4] = self;
    [(SUClientApplicationController *)self _loadSectionsAllowingCache:1 withCompletionBlock:v11];
  }
}

void __69__SUClientApplicationController__retrySectionsAfterNetworkTransition__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__SUClientApplicationController__retrySectionsAfterNetworkTransition__block_invoke_2;
  block[3] = &unk_264812130;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __69__SUClientApplicationController__retrySectionsAfterNetworkTransition__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelSectionFetchPlaceholder];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[21];

  return [v2 _handleFinishedLoadSectionsOperation:v3];
}

- (void)_defaultHandleApplicationURLRequestProperties:(id)a3
{
  uint64_t v5 = objc_msgSend(-[SUTabBarController selectedViewController](-[SUClientApplicationController tabBarController](self, "tabBarController"), "selectedViewController"), "section");
  id v7 = (id)objc_msgSend(-[SUClientController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", 0);
  objc_msgSend(v7, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
  [v7 setExternalRequest:1];
  [v7 setURLRequestProperties:a3];
  uint64_t v6 = [[SUNavigationController alloc] initWithSection:v5 rootViewController:v7];
  [(SUNavigationController *)v6 setClientInterface:[(SUClientController *)self clientInterface]];
  [(SUClientApplicationController *)self presentExternalURLViewController:v6];
}

- (void)_handleAccountURL:(id)a3
{
  int v4 = [[SUAccountViewController alloc] initWithExternalAccountURL:a3];
  [(SUViewController *)v4 setClientInterface:[(SUClientController *)self clientInterface]];
  [(SUClientController *)self presentAccountViewController:v4 animated:1];
}

- (void)_handleAddPassbookPassURL:(id)a3
{
  passbookLoader = self->_passbookLoader;
  if (!passbookLoader)
  {
    uint64_t v6 = ISUIMobileStoreUIFramework();
    id v7 = ISUIWeakLinkedClassForString(&cfstr_Suuiclientcont.isa, v6);
    uint64_t v8 = ISUIMobileStoreUIFramework();
    uint64_t v9 = (SUUIPassbookLoader *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(&cfstr_Suuipassbooklo.isa, v8)), "initWithClientContext:", objc_msgSend(v7, "defaultContext"));
    self->_passbookLoader = v9;
    [(SUUIPassbookLoader *)v9 setDelegate:self];
    passbookLoader = self->_passbookLoader;
  }

  [(SUUIPassbookLoader *)passbookLoader loadPassWithURL:a3];
}

- (void)_handleDonationURL:(id)a3
{
  uint64_t v5 = ISUIMobileStoreUIFramework();
  id v9 = (id)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(&cfstr_Suuiurl.isa, v5)), "initWithURL:", a3);
  uint64_t v6 = ISUIMobileStoreUIFramework();
  id v7 = objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(&cfstr_Suuidonationvi.isa, v6)), "initWithURL:", v9);
  uint64_t v8 = ISUIMobileStoreUIFramework();
  objc_msgSend(v7, "setClientContext:", objc_msgSend(ISUIWeakLinkedClassForString(&cfstr_Suuiclientcont.isa, v8), "defaultContext"));
  [(SUTabBarController *)[(SUClientApplicationController *)self tabBarController] presentViewController:v7 animated:1 completion:0];
}

- (void)_handleSearchURL:(id)a3 withSourceApplication:(id)a4 sourceURL:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = [(SUClientApplicationController *)self tabBarController];
  uint64_t v10 = [(SUTabBarController *)v9 sections];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      int v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      uint64_t v16 = (void *)[v15 searchFieldConfiguration];
      if (v16)
      {
        if ([v16 location] != 2) {
          break;
        }
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    if (!v15) {
      goto LABEL_13;
    }
    -[SUTabBarController setSelectedIdentifier:](v9, "setSelectedIdentifier:", [v15 identifier]);
  }
  else
  {
LABEL_13:
    [(SUTabBarController *)v9 selectSectionOfType:1];
  }
  uint64_t v17 = [(UINavigationController *)[(SUClientApplicationController *)self topNavigationController] topViewController];
  if (objc_opt_respondsToSelector())
  {
    -[UIViewController handleApplicationURL:withSourceApplication:sourceURL:](v17, "handleApplicationURL:withSourceApplication:sourceURL:", [a3 schemeSwizzledURL], a4, a5);
  }
  else if (objc_opt_respondsToSelector())
  {
    -[UIViewController handleApplicationURL:](v17, "handleApplicationURL:", [a3 schemeSwizzledURL]);
  }
}

- (id)_accountViewController
{
  uint64_t v3 = (void *)[(SUTabBarController *)self->_tabBarController presentedViewController];
  if (!v3) {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(-[SUTabBarController overlayBackgroundViewController](self->_tabBarController, "overlayBackgroundViewController"), "selectedViewController"), "activeViewController");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = (void *)[v3 topViewController];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)_cancelSuspendAfterDialogsDismissed
{
  uint64_t v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v3 removeObserver:self name:@"SUDialogDidFinishNotification" object:0];
}

- (BOOL)_displayClientURL:(id)a3
{
  uint64_t v5 = +[SUClientApplicationController instanceMethodForSelector:sel_displayClientURL_];
  uint64_t v6 = [(SUClientApplicationController *)self methodForSelector:sel_displayClientURL_];
  uint64_t v7 = [a3 underlyingURL];
  if (v6 == v5)
  {
    uint64_t v9 = [a3 referrerApplicationName];
    uint64_t v10 = [a3 referrerURLString];
    return [(SUClientApplicationController *)self displayClientURL:v7 withSourceApplication:v9 sourceURLString:v10];
  }
  else
  {
    return [(SUClientController *)self displayClientURL:v7];
  }
}

- (void)_openClientURL:(id)a3
{
  uint64_t v5 = +[SUClientApplicationController instanceMethodForSelector:sel_openClientURL_];
  uint64_t v6 = [(SUClientApplicationController *)self methodForSelector:sel_openClientURL_];
  uint64_t v7 = [a3 underlyingURL];
  if (v6 == v5)
  {
    uint64_t v8 = [a3 referrerApplicationName];
    uint64_t v9 = [a3 referrerURLString];
    [(SUClientApplicationController *)self openClientURL:v7 withSourceApplication:v8 sourceURLString:v9];
  }
  else
  {
    [(SUClientController *)self openClientURL:v7];
  }
}

- (id)_previewOverlayViewController
{
  id result = self->_previewOverlay;
  if (!result)
  {
    int v4 = objc_alloc_init(SUPreviewOverlayViewController);
    self->_previewOverlay = v4;
    [(SUViewController *)v4 setClientInterface:[(SUClientController *)self clientInterface]];
    return self->_previewOverlay;
  }
  return result;
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
  int v4 = (void *)[v2 viewControllers];
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

- (void)_setupTabBarController
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SUClientApplicationController *)self tabBarController];
  if ([(SUClientController *)self storeFrontDidChangeSinceLastSuspend])
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
      int v35 = 138412290;
      uint64_t v36 = objc_opt_class();
      LODWORD(v32) = 12;
      int v30 = &v35;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v35, v32);
        free(v8);
        int v30 = (int *)v9;
        SSFileLog();
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache", v30), "invalidateAllURLBags");
    uint64_t v10 = 0;
    char v11 = 1;
  }
  else if (self->_reloadSectionsOnNextLaunch || (lastSectionsResponse = self->_lastSectionsResponse) == 0)
  {
    char v11 = 1;
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v13 = [(SUSectionsResponse *)lastSectionsResponse storeFrontIdentifier];
    uint64_t v10 = -[NSString isEqualToString:](v13, "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "storeFrontIdentifier"));
    if ((v10 & 1) == 0)
    {
      uint64_t v14 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v16 &= 2u;
      }
      if (v16)
      {
        int v35 = 138412290;
        uint64_t v36 = objc_opt_class();
        LODWORD(v32) = 12;
        int v30 = &v35;
        uint64_t v17 = _os_log_send_and_compose_impl();
        if (v17)
        {
          long long v18 = (void *)v17;
          uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v35, v32);
          free(v18);
          int v30 = (int *)v19;
          SSFileLog();
        }
      }
    }
    char v11 = v10 ^ 1;
  }
  self->_reloadSectionsOnNextLaunch = 0;
  long long v20 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", v30), "objectForKey:", @"SUNavigationAccountID");
  uint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore"), "activeAccount"), "uniqueIdentifier");
  if ((void *)v21 != v20 && ([v20 isEqual:v21] & 1) == 0)
  {
    uint64_t v22 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v24 &= 2u;
    }
    if (v24)
    {
      uint64_t v25 = objc_opt_class();
      int v35 = 138412290;
      uint64_t v36 = v25;
      LODWORD(v32) = 12;
      uint64_t v31 = &v35;
      uint64_t v26 = _os_log_send_and_compose_impl();
      if (v26)
      {
        uint64_t v27 = (void *)v26;
        uint64_t v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v35, v32);
        free(v27);
        uint64_t v31 = (int *)v28;
        SSFileLog();
      }
    }
    [(SUTabBarController *)v3 resetToSystemDefaults];
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "launchedToTest") & 1) == 0)
  {
    if (v11)
    {
      [+[SUNetworkObserver sharedInstance] startNetworkAvailabilityTimer];
      [(SUTabBarController *)v3 dismissViewControllerAnimated:0 completion:0];
      [(SUTabBarController *)v3 setSections:0];
      [(SUClientApplicationController *)self _presentSectionFetchUI];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __55__SUClientApplicationController__setupTabBarController__block_invoke_4;
      v33[3] = &unk_264812130;
      v33[4] = self;
      [(SUClientApplicationController *)self _loadSectionsAllowingCache:v10 withCompletionBlock:v33];
    }
    else
    {
      if (![(SUTabBarController *)v3 sections])
      {
        [(SUTabBarController *)v3 loadFromDefaultsAndSetSections:[(SUSectionsResponse *)self->_lastSectionsResponse sections]];
        [(SUClientApplicationController *)self setupUI];
      }
      dispatch_time_t v29 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__SUClientApplicationController__setupTabBarController__block_invoke;
      block[3] = &unk_264812130;
      block[4] = self;
      dispatch_after(v29, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __55__SUClientApplicationController__setupTabBarController__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__SUClientApplicationController__setupTabBarController__block_invoke_2;
  v3[3] = &unk_264812130;
  v3[4] = v1;
  return [v1 _loadSectionsAllowingCache:1 withCompletionBlock:v3];
}

void __55__SUClientApplicationController__setupTabBarController__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUClientApplicationController__setupTabBarController__block_invoke_3;
  block[3] = &unk_264812130;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__SUClientApplicationController__setupTabBarController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFinishedBackgroundLoadSectionsOperation:*(void *)(*(void *)(a1 + 32) + 168)];
}

void __55__SUClientApplicationController__setupTabBarController__block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUClientApplicationController__setupTabBarController__block_invoke_5;
  block[3] = &unk_264812130;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__SUClientApplicationController__setupTabBarController__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelSectionFetchPlaceholder];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[21];

  return [v2 _handleFinishedLoadSectionsOperation:v3];
}

- (void)_showPreviewOverlayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUClientApplicationController *)self _previewOverlayViewController];
  int v6 = [(SUClientApplicationController *)self tabBarController];

  [(SUTabBarController *)v6 _showPreviewOverlay:v5 animated:v3];
}

- (BOOL)_showWildcatAccountViewController:(id)a3 animated:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v6 = objc_msgSend(-[SUTabBarController overlayBackgroundViewController](self->_tabBarController, "overlayBackgroundViewController", a3, a4), "viewControllers");
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
      char v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      uint64_t v12 = (void *)[v11 backViewController];
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
    [(SUClientApplicationController *)self presentExternalURLViewController:a3];
  }
  return 1;
}

- (SUMediaPlayerViewController)_activeMediaPlayer
{
  return self->_activeMediaPlayer;
}

- (NSString)exitStoreButtonTitle
{
  return self->_exitStoreButtonTitle;
}

- (BOOL)shouldPrepareUserInterfaceWhenActivated
{
  return self->_shouldPrepareUserInterfaceWhenActivated;
}

- (void)setShouldPrepareUserInterfaceWhenActivated:(BOOL)a3
{
  self->_shouldPrepareUserInterfaceWhenActivated = a3;
}

@end