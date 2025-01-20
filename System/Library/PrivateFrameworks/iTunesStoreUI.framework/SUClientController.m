@interface SUClientController
+ (id)sharedController;
+ (void)setSharedController:(id)a3;
- (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)dismissTopViewControllerAnimated:(BOOL)a3;
- (BOOL)displayClientURL:(id)a3;
- (BOOL)displayClientURL:(id)a3 withSourceApplication:(id)a4 sourceURLString:(id)a5;
- (BOOL)ignoresExpectedClientsProtocol;
- (BOOL)isActive;
- (BOOL)isComposingEmail;
- (BOOL)isStoreEnabled;
- (BOOL)libraryContainsItemIdentifier:(unint64_t)a3;
- (BOOL)openClientURL:(id)a3;
- (BOOL)openURL:(id)a3;
- (BOOL)openURL:(id)a3 inClientWithIdentifier:(id)a4;
- (BOOL)performActionForDialog:(id)a3 button:(id)a4;
- (BOOL)presentAccountViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)presentAccountViewController:(id)a3 showNavigationBar:(BOOL)a4 animated:(BOOL)a5;
- (BOOL)presentOverlayBackgroundViewController:(id)a3;
- (BOOL)storeFrontDidChangeSinceLastSuspend;
- (ISURLOperationPool)imageOperationPool;
- (NSString)storeContentLanguage;
- (SUClientController)init;
- (SUClientController)initWithClientIdentifier:(id)a3;
- (SUClientController)initWithClientInterface:(id)a3;
- (SUClientInterface)clientInterface;
- (SUImageCache)imageCache;
- (SUScriptExecutionContext)scriptExecutionContext;
- (UIViewController)rootViewController;
- (__CFArray)offeredAssetTypes;
- (id)URLBagKeyForIdentifier:(id)a3;
- (id)_newAccountViewControllerForButtonAction:(id)a3;
- (id)_newComposeReviewViewControllerForButtonAction:(id)a3;
- (id)clientIdentifier;
- (id)newScriptInterface;
- (id)overlayBackgroundViewController;
- (id)overlayConfigurationForStorePage:(id)a3;
- (id)scriptInterfaceForClientInterface:(id)a3;
- (id)userAgent;
- (id)viewControllerFactory;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_dialogNotification:(id)a3;
- (void)_memoryWarningNotification:(id)a3;
- (void)_presentDialog:(id)a3;
- (void)_purgeCaches;
- (void)_reloadOverlayConfigurationsFromURLBag;
- (void)_reloadScriptExecutionContextFromURLBag;
- (void)_reloadUserDefaultsFromURLBag;
- (void)autosaveMessageWithCompletionBlock:(id)a3;
- (void)bagDidLoadNotification:(id)a3;
- (void)becomeActive;
- (void)cancelAllOperations;
- (void)clientInterface:(id)a3 exitStoreWithReason:(int64_t)a4;
- (void)clientInterface:(id)a3 presentDialog:(id)a4;
- (void)clientInterface:(id)a3 setStatusBarHidden:(BOOL)a4 withAnimation:(int64_t)a5;
- (void)clientInterface:(id)a3 setStatusBarStyle:(int64_t)a4 animated:(BOOL)a5;
- (void)composeEmailByRestoringAutosavedMessage;
- (void)composeEmailWithSubject:(id)a3 body:(id)a4;
- (void)composeEmailWithSubject:(id)a3 body:(id)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)dismissMailComposeViewControllerAnimated:(BOOL)a3;
- (void)exitStoreWithReason:(int64_t)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)presentMailComposeViewController:(id)a3 animated:(BOOL)a4;
- (void)resignActive;
- (void)setClientInterface:(id)a3;
- (void)setIgnoresExpectedClientsProtocol:(BOOL)a3;
- (void)setImageCache:(id)a3;
- (void)setImageOperationPool:(id)a3;
- (void)setOfferedAssetTypes:(__CFArray *)a3;
- (void)setRootViewController:(id)a3;
- (void)setURLBagKey:(id)a3 forIdentifier:(id)a4;
- (void)setUserAgent:(id)a3;
- (void)setViewControllerFactory:(id)a3;
@end

@implementation SUClientController

- (SUClientController)init
{
  return [(SUClientController *)self initWithClientInterface:0];
}

- (SUClientController)initWithClientInterface:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SUClientController;
  v4 = [(SUClientController *)&v13 init];
  if (v4)
  {
    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.iTunesStoreUI.SUClientController.%p", v4);
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v5 UTF8String], 0);

    if (a3)
    {
      [(SUClientController *)v4 setClientInterface:a3];
    }
    else
    {
      a3 = objc_alloc_init(SUClientInterface);
      [(SUClientController *)v4 setClientInterface:a3];
      id v6 = a3;
    }
    if (![a3 localStoragePath]) {
      objc_msgSend(a3, "setLocalStoragePath:", +[SUWebViewManager defaultLocalStoragePath](SUWebViewManager, "defaultLocalStoragePath"));
    }
    +[SUNetworkObserver sharedInstance];
    uint64_t v7 = [a3 clientIdentifier];
    if (v7) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F89468], "currentClient"), "setAppleClientApplication:", v7);
    }
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F89480], "sharedInstance"), "copyProtocolConditionalContext");
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3052000000;
    v12[3] = __Block_byref_object_copy__42;
    v12[4] = __Block_byref_object_dispose__42;
    v12[5] = v4;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__SUClientController_initWithClientInterface___block_invoke;
    v11[3] = &unk_264814298;
    v11[4] = v12;
    [v8 setItemLookupBlock:v11];
    [MEMORY[0x263F7B2D0] setDefaultConditionalContext:v8];

    v9 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v4 selector:sel_bagDidLoadNotification_ name:*MEMORY[0x263F89450] object:0];
    [v9 addObserver:v4 selector:sel__dialogNotification_ name:*MEMORY[0x263F893F8] object:0];
    [v9 addObserver:v4 selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x263F1D050] object:0];
    [v9 addObserver:v4 selector:sel__memoryWarningNotification_ name:*MEMORY[0x263F1D060] object:0];
    _Block_object_dispose(v12, 8);
  }
  return v4;
}

uint64_t __46__SUClientController_initWithClientInterface___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) libraryContainsItemIdentifier:a2];
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89450] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F893F8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D050] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D060] object:0];
  [(SUClientInterface *)self->_clientInterface setDelegate:0];
  [(SUPurchaseManager *)[(SUClientInterface *)self->_clientInterface purchaseManager] setDelegate:0];
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F89480], "sharedInstance"), "copyProtocolConditionalContext");
  [MEMORY[0x263F7B2D0] setDefaultConditionalContext:v4];

  [(MFMailComposeViewController *)self->_mailComposeViewController setDelegate:0];
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  offeredAssetTypes = self->_offeredAssetTypes;
  if (offeredAssetTypes) {
    CFRelease(offeredAssetTypes);
  }

  v7.receiver = self;
  v7.super_class = (Class)SUClientController;
  [(SUClientController *)&v7 dealloc];
}

+ (void)setSharedController:(id)a3
{
  if ((id)__SharedController != a3)
  {

    __SharedController = (uint64_t)a3;
  }
}

+ (id)sharedController
{
  id v2 = (id)__SharedController;

  return v2;
}

- (void)becomeActive
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__SUClientController_becomeActive__block_invoke;
  v3[3] = &unk_264812E48;
  v3[4] = self;
  v3[5] = &v4;
  dispatch_sync(dispatchQueue, v3);
  if (*((unsigned char *)v5 + 24))
  {
    [MEMORY[0x263F89518] invalidateCurrentMap];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "reloadNetworkType");
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "existingDefaultStore"), "reloadAccounts");
  }
  _Block_object_dispose(&v4, 8);
}

uint64_t __34__SUClientController_becomeActive__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  }
  return result;
}

- (void)cancelAllOperations
{
  id v2 = (void *)[MEMORY[0x263F894E0] mainQueue];

  [v2 cancelAllOperations];
}

- (SUClientInterface)clientInterface
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__42;
  v10 = __Block_byref_object_dispose__42;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SUClientController_clientInterface__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SUClientInterface *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__SUClientController_clientInterface__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 16);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4
{
  v5 = [(SUClientController *)self rootViewController];
  uint64_t v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__SUClientController_composeReviewWithViewController_animated___block_invoke;
    v8[3] = &unk_264813D98;
    v8[4] = v5;
    v8[5] = a3;
    [a3 prepareWithCompletionBlock:v8];
  }
  return v6 != 0;
}

uint64_t __63__SUClientController_composeReviewWithViewController_animated___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    v3 = (void *)[MEMORY[0x263F1CB68] transitionSafePerformer:*(void *)(result + 32)];
    uint64_t v4 = *(void *)(v2 + 40);
    return [v3 presentViewController:v4 animated:1 completion:0];
  }
  return result;
}

- (BOOL)dismissTopViewControllerAnimated:(BOOL)a3
{
  return 0;
}

- (BOOL)displayClientURL:(id)a3
{
  return [(SUClientController *)self displayClientURL:a3 withSourceApplication:0 sourceURLString:0];
}

- (BOOL)displayClientURL:(id)a3 withSourceApplication:(id)a4 sourceURLString:(id)a5
{
  return 0;
}

- (void)exitStoreWithReason:(int64_t)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);

  [v3 suspend];
}

- (BOOL)ignoresExpectedClientsProtocol
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__SUClientController_ignoresExpectedClientsProtocol__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__SUClientController_ignoresExpectedClientsProtocol__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) _ignoresExpectedClientsProtocol];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isStoreEnabled
{
  char v3 = (void *)[MEMORY[0x263F89540] sharedCache];
  uint64_t v4 = objc_msgSend(v3, "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0));
  if (!v4) {
    return 0;
  }
  v5 = (void *)v4;
  uint64_t v6 = [(SUClientController *)self offeredAssetTypes];
  if (!v6) {
    return 1;
  }
  CFArrayRef v7 = v6;
  CFIndex Count = CFArrayGetCount(v6);
  char v9 = Count == 0;
  if (Count >= 1)
  {
    CFIndex v10 = Count;
    CFIndex v11 = 0;
    char v9 = 0;
    do
    {
      CFArrayGetValueAtIndex(v7, v11);
      uint64_t v12 = SSDownloadKindForAssetType();
      if (v9) {
        char v9 = 1;
      }
      else {
        char v9 = objc_msgSend((id)objc_msgSend(v5, "networkConstraintsForDownloadKind:", v12), "isAnyNetworkTypeEnabled");
      }
      ++v11;
    }
    while (v10 != v11);
  }
  return v9;
}

- (BOOL)libraryContainsItemIdentifier:(unint64_t)a3
{
  return 0;
}

- (id)newScriptInterface
{
  return objc_alloc_init(SUScriptInterface);
}

- (__CFArray)offeredAssetTypes
{
  return self->_offeredAssetTypes;
}

- (BOOL)openClientURL:(id)a3
{
  return [(SUClientController *)self openClientURL:a3 withSourceApplication:0 sourceURLString:0];
}

- (BOOL)openURL:(id)a3
{
  uint64_t v4 = [(SUClientController *)self clientInterface];

  return SUOpenExternalURL((uint64_t)a3, v4);
}

- (BOOL)openURL:(id)a3 inClientWithIdentifier:(id)a4
{
  uint64_t v6 = [(SUClientController *)self clientInterface];

  return SUOpenURLInClient((uint64_t)a3, (uint64_t)a4, v6);
}

- (id)overlayBackgroundViewController
{
  return 0;
}

- (id)overlayConfigurationForStorePage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[a3 URLRequestProperties];
  uint64_t v5 = [v4 URLBagKey];
  uint64_t v6 = [v4 URL];
  overlayConfigurations = self->_overlayConfigurations;
  if (!overlayConfigurations)
  {
    [(SUClientController *)self _reloadOverlayConfigurationsFromURLBag];
    overlayConfigurations = self->_overlayConfigurations;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [(NSArray *)overlayConfigurations countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_5:
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
          break;
        }
      }
      if (v5 && ([v12 matchesURLBagKey:v5] & 1) != 0) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSArray *)overlayConfigurations countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    uint64_t v12 = 0;
  }
  return v12;
}

- (BOOL)presentAccountViewController:(id)a3 animated:(BOOL)a4
{
  return [(SUClientController *)self presentAccountViewController:a3 showNavigationBar:0 animated:a4];
}

- (BOOL)presentAccountViewController:(id)a3 showNavigationBar:(BOOL)a4 animated:(BOOL)a5
{
  return 0;
}

- (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  return 0;
}

- (void)resignActive
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SUClientController_resignActive__block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

void *__34__SUClientController_resignActive__block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 8) = 0;
    char v3 = (void *)[MEMORY[0x263F7B148] currentDevice];

    *(void *)(v2[4] + 48) = (id)[v3 storeFrontIdentifier];
    uint64_t result = (id)[v3 synchedStoreFrontIdentifier];
    *(void *)(v2[4] + 96) = result;
  }
  return result;
}

- (void)setClientInterface:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__SUClientController_setClientInterface___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void *__41__SUClientController_setClientInterface___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t result = *(void **)(*(void *)(a1 + 32) + 16);
  if (result != v2)
  {
    objc_msgSend((id)objc_msgSend(result, "purchaseManager"), "setDelegate:", 0);
    [*(id *)(*(void *)(a1 + 32) + 16) setDelegate:0];

    *(void *)(*(void *)(a1 + 32) + 16) = *(id *)(a1 + 40);
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "purchaseManager"), "setDelegate:", *(void *)(a1 + 32));
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
    return objc_msgSend(v4, "setDelegate:");
  }
  return result;
}

- (void)setIgnoresExpectedClientsProtocol:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUClientController_setIgnoresExpectedClientsProtocol___block_invoke;
  v4[3] = &unk_2648132C0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __56__SUClientController_setIgnoresExpectedClientsProtocol___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) _setIgnoresExpectedClientsProtocol:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setOfferedAssetTypes:(__CFArray *)a3
{
  offeredAssetTypes = self->_offeredAssetTypes;
  if (offeredAssetTypes != a3)
  {
    if (offeredAssetTypes) {
      CFRelease(offeredAssetTypes);
    }
    self->_offeredAssetTypes = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (void)setURLBagKey:(id)a3 forIdentifier:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUClientController_setURLBagKey_forIdentifier___block_invoke;
  block[3] = &unk_264812808;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __49__SUClientController_setURLBagKey_forIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setURLBagKey:a1[5] forIdentifier:a1[6]];
}

- (id)URLBagKeyForIdentifier:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__42;
  uint64_t v11 = __Block_byref_object_dispose__42;
  uint64_t v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUClientController_URLBagKeyForIdentifier___block_invoke;
  block[3] = &unk_2648135A8;
  void block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __45__SUClientController_URLBagKeyForIdentifier___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 16) URLBagKeyForIdentifier:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)autosaveMessageWithCompletionBlock:(id)a3
{
  mailComposeViewController = self->_mailComposeViewController;
  if (mailComposeViewController)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __57__SUClientController_autosaveMessageWithCompletionBlock___block_invoke;
    v5[3] = &unk_264814B30;
    v5[4] = a3;
    [(MFMailComposeViewController *)mailComposeViewController autosaveWithHandler:v5];
  }
  else if (a3)
  {
    id v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
}

uint64_t __57__SUClientController_autosaveMessageWithCompletionBlock___block_invoke(uint64_t a1, const void *a2)
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE60];
  CFPreferencesSetAppValue(@"SUAutosavedMessageID", a2, (CFStringRef)*MEMORY[0x263EFFE60]);
  CFPreferencesAppSynchronize(v3);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)composeEmailByRestoringAutosavedMessage
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE60];
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(@"SUAutosavedMessageID", (CFStringRef)*MEMORY[0x263EFFE60]);
  if (v4)
  {
    id v7 = (id)v4;
    if (CPCanSendMail() && ![(SUClientController *)self isComposingEmail])
    {
      BOOL v5 = (objc_class *)ISWeakLinkedClassForString();
      if ([(objc_class *)v5 hasAutosavedMessageWithIdentifier:v7])
      {
        uint64_t v6 = (MFMailComposeViewController *)objc_alloc_init(v5);
        self->_mailComposeViewController = v6;
        [(MFMailComposeViewController *)v6 setKeyboardVisible:1];
        [(MFMailComposeViewController *)self->_mailComposeViewController setMailComposeDelegate:self];
        [(MFMailComposeViewController *)self->_mailComposeViewController recoverAutosavedMessageWithIdentifier:v7];
        [(SUClientController *)self presentMailComposeViewController:self->_mailComposeViewController animated:0];
      }
      CFPreferencesSetAppValue(@"SUAutosavedMessageID", 0, v3);
      CFPreferencesAppSynchronize(v3);
    }
  }
}

- (void)composeEmailWithSubject:(id)a3 body:(id)a4
{
}

- (void)composeEmailWithSubject:(id)a3 body:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if (CPCanSendMail() && ![(SUClientController *)self isComposingEmail])
  {
    uint64_t v9 = (MFMailComposeViewController *)objc_alloc_init((Class)ISWeakLinkedClassForString());
    self->_mailComposeViewController = v9;
    [(MFMailComposeViewController *)v9 setKeyboardVisible:1];
    [(MFMailComposeViewController *)self->_mailComposeViewController setMailComposeDelegate:self];
    [(MFMailComposeViewController *)self->_mailComposeViewController setSubject:a3];
    [(MFMailComposeViewController *)self->_mailComposeViewController setMessageBody:a4 isHTML:1];
    mailComposeViewController = self->_mailComposeViewController;
    [(SUClientController *)self presentMailComposeViewController:mailComposeViewController animated:v5];
  }
}

- (void)dismissMailComposeViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  CFPropertyListRef v4 = [(SUClientController *)self rootViewController];

  [(UIViewController *)v4 dismissViewControllerAnimated:v3 completion:0];
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
  uint64_t v6 = [(SUClientController *)self rootViewController];

  [(UIViewController *)v6 presentViewController:a3 animated:v4 completion:0];
}

- (SUImageCache)imageCache
{
  uint64_t result = self->_imageCache;
  if (!result)
  {
    uint64_t result = objc_alloc_init(SUImageCache);
    self->_imageCache = result;
  }
  return result;
}

- (ISURLOperationPool)imageOperationPool
{
  uint64_t result = self->_imagePool;
  if (!result)
  {
    self->_imagePool = (ISURLOperationPool *)objc_alloc_init(MEMORY[0x263F89558]);
    id v4 = objc_alloc_init(MEMORY[0x263F894E0]);
    if (MGGetBoolAnswer()) {
      [v4 setMaxConcurrentOperationCount:2];
    }
    [(ISURLOperationPool *)self->_imagePool setOperationQueue:v4];

    return self->_imagePool;
  }
  return result;
}

- (BOOL)performActionForDialog:(id)a3 button:(id)a4
{
  int v6 = objc_msgSend(a4, "actionType", a3);
  BOOL result = 0;
  switch(v6)
  {
    case 1:
      uint64_t v8 = (void *)[a4 parameter];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = (void *)[NSURL URLWithString:v8];
      }
      uint64_t v9 = [v8 schemeSwizzledURL];
      uint64_t v10 = [a4 urlType];
      if (v10 == 2)
      {
        id v18 = objc_alloc(MEMORY[0x263F7B290]);
        uint64_t v19 = objc_msgSend(v18, "initWithURLRequest:", objc_msgSend(MEMORY[0x263EFC630], "requestWithURL:", v9));
        [v19 setITunesStoreRequest:1];
        [v19 setShouldProcessProtocol:1];
        v20 = (void *)[objc_alloc(MEMORY[0x263F7B360]) initWithRequestProperties:v19];
        [v20 start];

        goto LABEL_20;
      }
      if (v10 == 1)
      {
        id v11 = [(SUClientController *)self _newAccountViewControllerForButtonAction:a4];
        BOOL v12 = [(SUClientController *)self presentAccountViewController:v11 animated:1];
        goto LABEL_17;
      }
      [(SUClientController *)self openClientURL:v9];
      goto LABEL_22;
    case 3:
      id v13 = objc_alloc_init(MEMORY[0x263F7B2D8]);
      objc_msgSend(v13, "setBuyParameters:", objc_msgSend(a4, "parameter"));
      long long v14 = [(SUClientInterface *)[(SUClientController *)self clientInterface] purchaseManager];
      long long v15 = objc_alloc_init(SUPurchaseBatch);
      [(SUPurchaseBatch *)v15 setPurchaseManager:v14];
      -[SUPurchaseBatch setPurchasesAndContinuationsFromPurchases:](v15, "setPurchasesAndContinuationsFromPurchases:", [MEMORY[0x263EFF8C0] arrayWithObject:v13]);
      [(SUPurchaseManager *)v14 addPurchaseBatch:v15];

LABEL_22:
      BOOL result = 1;
      break;
    case 4:
      uint64_t v16 = [a4 parameter];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v16 = [NSURL URLWithString:v16];
      }
      BOOL result = [(SUClientController *)self openURL:v16];
      break;
    case 5:
      BOOL result = [(SUClientController *)self dismissTopViewControllerAnimated:1];
      break;
    case 8:
      id v11 = [(SUClientController *)self _newComposeReviewViewControllerForButtonAction:a4];
      BOOL v12 = [(SUClientController *)self composeReviewWithViewController:v11 animated:1];
LABEL_17:
      BOOL v17 = v12;

      BOOL result = v17;
      break;
    case 9:
      [MEMORY[0x263F7B178] retryAllRestoreDownloads];
LABEL_20:
      BOOL result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (SUScriptExecutionContext)scriptExecutionContext
{
  BOOL result = self->_scriptExecutionContext;
  if (!result)
  {
    BOOL result = objc_alloc_init(SUScriptExecutionContext);
    self->_scriptExecutionContext = result;
  }
  return result;
}

- (NSString)storeContentLanguage
{
  BOOL result = (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "storeFrontIdentifier");
  if (result)
  {
    BOOL v3 = result;
    uint64_t v4 = [(NSString *)result rangeOfString:@"-", 0, 0, [(NSString *)result length] options range];
    uint64_t v5 = [(NSString *)v3 rangeOfString:@",", 0, 0, [(NSString *)v3 length] options range];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_6:
        id v6 = objc_alloc(NSDictionary);
        id v7 = objc_msgSend(v6, "initWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"StoreFrontLanguages", @"plist"));
        uint64_t v8 = (NSString *)(id)objc_msgSend((id)objc_msgSend(v7, "objectForKey:", v3), "objectForKey:", @"LanguageCode");

        return v8;
      }
      uint64_t v4 = v5;
    }
    BOOL v3 = [(NSString *)v3 substringToIndex:v4];
    goto LABEL_6;
  }
  return result;
}

- (BOOL)storeFrontDidChangeSinceLastSuspend
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__42;
  v21 = __Block_byref_object_dispose__42;
  uint64_t v22 = 0;
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x3052000000;
  long long v14 = __Block_byref_object_copy__42;
  long long v15 = __Block_byref_object_dispose__42;
  uint64_t v16 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUClientController_storeFrontDidChangeSinceLastSuspend__block_invoke;
  block[3] = &unk_264814B58;
  block[4] = self;
  void block[5] = &v17;
  block[6] = &v11;
  dispatch_sync(dispatchQueue, block);
  if (!v18[5] && !v12[5]) {
    goto LABEL_8;
  }
  BOOL v3 = (void *)[MEMORY[0x263F7B148] currentDevice];
  [v3 reloadStoreFrontIdentifier];
  uint64_t v4 = [v3 storeFrontIdentifier];
  uint64_t v5 = (void *)v18[5];
  if (v5 != (void *)v4 && !objc_msgSend(v5, "isEqualToString:"))
  {
    LOBYTE(v8) = 1;
    goto LABEL_10;
  }
  if ([v3 isStoreFrontIdentifierTransient]
    && (uint64_t v6 = [v3 synchedStoreFrontIdentifier], v7 = (void *)v12[5], v7 != (void *)v6))
  {
    int v8 = objc_msgSend(v7, "isEqualToString:") ^ 1;
  }
  else
  {
LABEL_8:
    LOBYTE(v8) = 0;
  }
LABEL_10:
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

id __57__SUClientController_storeFrontDidChangeSinceLastSuspend__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = (id)[*(id *)(a1[4] + 48) copy];
  id result = (id)[*(id *)(a1[4] + 96) copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (SUClientController)initWithClientIdentifier:(id)a3
{
  uint64_t v5 = objc_alloc_init(SUClientInterface);
  [(SUClientInterface *)v5 setClientIdentifier:a3];
  uint64_t v6 = [(SUClientController *)self initWithClientInterface:v5];

  return v6;
}

- (id)clientIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__42;
  uint64_t v10 = __Block_byref_object_dispose__42;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__SUClientController_clientIdentifier__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __38__SUClientController_clientIdentifier__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 16) clientIdentifier];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setUserAgent:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__SUClientController_setUserAgent___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __35__SUClientController_setUserAgent___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setUserAgent:*(void *)(a1 + 40)];
}

- (void)setViewControllerFactory:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__SUClientController_setViewControllerFactory___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SUClientController_setViewControllerFactory___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setViewControllerFactory:*(void *)(a1 + 40)];
}

- (id)userAgent
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__42;
  uint64_t v10 = __Block_byref_object_dispose__42;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__SUClientController_userAgent__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __31__SUClientController_userAgent__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 16) userAgent];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)viewControllerFactory
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__42;
  uint64_t v10 = __Block_byref_object_dispose__42;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__SUClientController_viewControllerFactory__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__SUClientController_viewControllerFactory__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 16) viewControllerFactory];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)clientInterface:(id)a3 exitStoreWithReason:(int64_t)a4
{
}

- (void)clientInterface:(id)a3 presentDialog:(id)a4
{
}

- (void)clientInterface:(id)a3 setStatusBarHidden:(BOOL)a4 withAnimation:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);

  [v7 setStatusBarHidden:v6 withAnimation:a5];
}

- (void)clientInterface:(id)a3 setStatusBarStyle:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);

  [v7 setStatusBarStyle:a4 animated:v5];
}

- (id)scriptInterfaceForClientInterface:(id)a3
{
  id v3 = [(SUClientController *)self newScriptInterface];

  return v3;
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = *MEMORY[0x263F1D108];
  uint64_t v4 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__SUClientController__applicationDidEnterBackgroundNotification___block_invoke;
  v8[3] = &unk_264812108;
  v8[4] = &v9;
  uint64_t v5 = [v4 beginBackgroundTaskWithExpirationHandler:v8];
  v10[3] = v5;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SUClientController__applicationDidEnterBackgroundNotification___block_invoke_2;
  block[3] = &unk_264812E48;
  block[4] = self;
  void block[5] = &v9;
  dispatch_async(global_queue, block);
  _Block_object_dispose(&v9, 8);
}

uint64_t __65__SUClientController__applicationDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *MEMORY[0x263F1D108];
  return result;
}

uint64_t __65__SUClientController__applicationDidEnterBackgroundNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
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
    int v11 = 138412290;
    uint64_t v12 = objc_opt_class();
    LODWORD(v10) = 12;
    uint64_t v9 = &v11;
    uint64_t v5 = _os_log_send_and_compose_impl();
    if (v5)
    {
      BOOL v6 = (void *)v5;
      uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4, &v11, v10);
      free(v6);
      uint64_t v9 = (int *)v7;
      SSFileLog();
    }
  }
  objc_msgSend(MEMORY[0x263EFC600], "sharedURLCache", v9);
  ISURLCacheSaveMemoryCache();
  [*(id *)(a1 + 32) _purgeCaches];
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *MEMORY[0x263F1D108];
  return result;
}

- (void)_dialogNotification:(id)a3
{
  uint64_t v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __42__SUClientController__dialogNotification___block_invoke;
    v5[3] = &unk_264812158;
    v5[4] = self;
    void v5[5] = v4;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __42__SUClientController__dialogNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentDialog:*(void *)(a1 + 40)];
}

- (void)bagDidLoadNotification:(id)a3
{
  [(SUClientController *)self _reloadOverlayConfigurationsFromURLBag];
  [(SUClientController *)self _reloadScriptExecutionContextFromURLBag];

  [(SUClientController *)self _reloadUserDefaultsFromURLBag];
}

- (void)_memoryWarningNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
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
      uint64_t v8 = (void *)v7;
      uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v12, v11);
      free(v8);
      uint64_t v10 = (int *)v9;
      SSFileLog();
    }
  }
  [(SUClientController *)self _purgeCaches];
}

- (id)_newAccountViewControllerForButtonAction:(id)a3
{
  int v5 = objc_alloc_init(SUAccountViewController);
  [(SUViewController *)v5 setClientInterface:[(SUClientController *)self clientInterface]];
  int v6 = (void *)[a3 parameter];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v6 = (void *)[NSURL URLWithString:v6];
  }
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263F7B368]), "initWithURL:", objc_msgSend(v6, "schemeSwizzledURL"));
  [(SUStorePageViewController *)v5 setURLRequestProperties:v7];

  return v5;
}

- (id)_newComposeReviewViewControllerForButtonAction:(id)a3
{
  uint64_t v4 = [a3 parameter];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [NSURL URLWithString:v4];
  }
  int v5 = [(SUClientController *)self clientInterface];
  int v6 = [(SUViewControllerFactory *)[(SUClientInterface *)v5 viewControllerFactory] newComposeReviewViewControllerWithCompositionURL:v4];
  if (!v6) {
    int v6 = [[SUComposeReviewViewController alloc] initWithCompositionURL:v4];
  }
  [(SUViewController *)v6 setClientInterface:v5];
  return v6;
}

- (void)_presentDialog:(id)a3
{
  int v5 = +[SUDialogManager sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SUClientController__presentDialog___block_invoke;
  v6[3] = &unk_264812A88;
  v6[4] = a3;
  v6[5] = self;
  [(SUDialogManager *)v5 presentDialog:a3 withCompletionBlock:v6];
}

void *__37__SUClientController__presentDialog___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = (void *)[*(id *)(a1 + 32) buttons];
  if ((a2 & 0x8000000000000000) == 0)
  {
    int v5 = result;
    uint64_t result = (void *)[result count];
    if ((unint64_t)result > a2)
    {
      uint64_t v8 = a1 + 32;
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v8 + 8);
      uint64_t v9 = [v5 objectAtIndex:a2];
      return (void *)[v7 performActionForDialog:v6 button:v9];
    }
  }
  return result;
}

- (void)_purgeCaches
{
  [MEMORY[0x263EFC600] sharedURLCache];
  ISURLCachePurgeMemoryCache();
  imageCache = self->_imageCache;

  [(SUImageCache *)imageCache removeAllCachedImages];
}

- (void)_reloadOverlayConfigurationsFromURLBag
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1
    && (uint64_t v3 = [MEMORY[0x263F7B358] contextWithBagType:0],
        uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache"), "URLBagForContext:", v3), "valueForKey:", @"p2-overlay-actions"), objc_msgSend(v4, "count")))
  {
    int v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
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
    int v5 = 0;
  }

  self->_overlayConfigurations = v5;
}

- (void)_reloadScriptExecutionContextFromURLBag
{
  id v3 = [(SUClientController *)self clientIdentifier];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = [MEMORY[0x263F7B358] contextWithBagType:0];
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache"), "URLBagForContext:", v5), "valueForKey:", @"p2-global-javascript");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 objectForKey:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [objc_alloc(NSURL) initWithString:v7];
        if (v8)
        {
          id v9 = (id)v8;
          [(SUScriptExecutionContext *)[(SUClientController *)self scriptExecutionContext] evaluateScriptAtURL:v8];
        }
      }
    }
  }
}

- (void)_reloadUserDefaultsFromURLBag
{
  uint64_t v2 = [MEMORY[0x263F7B358] contextWithBagType:0];
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache"), "URLBagForContext:", v2), "valueForKey:", @"p2-more-like-this");
  id v4 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!v3) {
    id v4 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"ISGeniusLookupAvailable", *v4, @"com.apple.mobileipod");

  CFPreferencesAppSynchronize(@"com.apple.mobileipod");
}

- (BOOL)isActive
{
  return self->_active;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (void)setImageCache:(id)a3
{
}

- (void)setImageOperationPool:(id)a3
{
}

@end