@interface SUClient
+ (id)imagePool;
+ (id)sharedClient;
+ (id)viewControllerFactory;
+ (void)setSharedClient:(id)a3;
- (BOOL)_presentModalViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)dismissTopViewControllerAnimated:(BOOL)a3;
- (BOOL)dontSaveNavigationPath;
- (BOOL)enterAccountFlowWithViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)openExternalURL:(id)a3;
- (BOOL)openInternalURL:(id)a3;
- (BOOL)openURL:(id)a3 inClientApplication:(id)a4;
- (BOOL)sendActionForDialog:(id)a3 button:(id)a4;
- (ISURLOperationPool)imagePool;
- (NSString)searchHintsURLBagKey;
- (NSString)searchURLBagKey;
- (SUClient)init;
- (SUClient)initWithClientInterface:(id)a3;
- (SUClientDelegate)delegate;
- (SUClientInterface)clientInterface;
- (SUImageCache)imageCache;
- (SUScriptExecutionContext)scriptExecutionContext;
- (__CFArray)assetTypes;
- (id)_newAccountViewControllerForButtonAction:(id)a3;
- (id)_newComposeReviewViewControllerForButtonAction:(id)a3;
- (id)clientIdentifier;
- (id)queueSessionManager;
- (id)viewControllerFactory;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_bagDidLoadNotification:(id)a3;
- (void)_memoryWarningNotification:(id)a3;
- (void)_purgeCaches;
- (void)_reloadScriptExecutionContext;
- (void)dealloc;
- (void)setAssetTypes:(__CFArray *)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDontSaveNavigationPath:(BOOL)a3;
- (void)setImageCache:(id)a3;
- (void)setImagePool:(id)a3;
- (void)setQueueSessionManager:(id)a3;
- (void)setSearchHintsURLBagKey:(id)a3;
- (void)setSearchURLBagKey:(id)a3;
- (void)setViewControllerFactory:(id)a3;
@end

@implementation SUClient

- (SUClient)init
{
  return [(SUClient *)self initWithClientInterface:0];
}

- (SUClient)initWithClientInterface:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUClient;
  v4 = [(SUClient *)&v8 init];
  if (v4)
  {
    if (a3) {
      v5 = (SUClientInterface *)a3;
    }
    else {
      v5 = objc_alloc_init(SUClientInterface);
    }
    v4->_clientInterface = v5;
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    if (![(SUClientInterface *)v4->_clientInterface localStoragePath]) {
      [(SUClientInterface *)v4->_clientInterface setLocalStoragePath:+[SUWebViewManager defaultLocalStoragePath]];
    }
    +[SUDialogManager sharedInstance];
    +[SUNetworkObserver sharedInstance];
    v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v4 selector:sel__bagDidLoadNotification_ name:*MEMORY[0x263F89450] object:0];
    [v6 addObserver:v4 selector:sel__memoryWarningNotification_ name:*MEMORY[0x263F1D060] object:0];
    [v6 addObserver:v4 selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x263F1D050] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89450] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D060] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D050] object:0];
  assetTypes = self->_assetTypes;
  if (assetTypes) {
    CFRelease(assetTypes);
  }

  v5.receiver = self;
  v5.super_class = (Class)SUClient;
  [(SUClient *)&v5 dealloc];
}

+ (void)setSharedClient:(id)a3
{
  _os_nospin_lock_lock();
  if ((id)__SharedClient != a3)
  {

    __SharedClient = (uint64_t)a3;
  }

  _os_nospin_lock_unlock();
}

+ (id)sharedClient
{
  _os_nospin_lock_lock();
  id v2 = (id)__SharedClient;
  _os_nospin_lock_unlock();
  return v2;
}

+ (id)imagePool
{
  id v2 = (void *)[a1 sharedClient];

  return (id)[v2 imagePool];
}

+ (id)viewControllerFactory
{
  id v2 = (void *)[a1 sharedClient];

  return (id)[v2 viewControllerFactory];
}

- (__CFArray)assetTypes
{
  return self->_assetTypes;
}

- (SUClientInterface)clientInterface
{
  [(NSLock *)self->_lock lock];
  v3 = self->_clientInterface;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (id)clientIdentifier
{
  [(NSLock *)self->_lock lock];
  v3 = [(SUClientInterface *)self->_clientInterface clientIdentifier];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!*((unsigned char *)v14 + 24)) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v9 = 1;
    goto LABEL_6;
  }
  int v7 = [(SUClientDelegate *)self->_delegate client:self presentComposeReviewViewController:a3 animated:v4];
  *((unsigned char *)v14 + 24) = v7;
  if (v7) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__SUClient_composeReviewWithViewController_animated___block_invoke;
  v11[3] = &unk_264812DF8;
  v11[5] = a3;
  v11[6] = &v13;
  v11[4] = v8;
  BOOL v12 = v4;
  [a3 prepareWithCompletionBlock:v11];
  BOOL v9 = *((unsigned char *)v14 + 24) != 0;
LABEL_6:
  _Block_object_dispose(&v13, 8);
  return v9;
}

uint64_t __53__SUClient_composeReviewWithViewController_animated___block_invoke(uint64_t a1, int a2)
{
  uint64_t result = [*(id *)(a1 + 32) object];
  if (result) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t result = [*(id *)(result + 24) client:result presentModalViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

- (BOOL)dismissTopViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = (void *)[(SUClientDelegate *)self->_delegate topViewControllerForClient:self];
    if (v5)
    {
      [v5 dismissAnimated:v3];
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)enterAccountFlowWithViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(SUClientDelegate *)self->_delegate client:self presentAccountViewController:a3 animated:v4] & 1) != 0)
  {
    return 1;
  }
  delegate = self->_delegate;

  return [(SUClientDelegate *)delegate client:self presentModalViewController:a3 animated:v4];
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

- (ISURLOperationPool)imagePool
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

- (BOOL)openExternalURL:(id)a3
{
  id v4 = [(SUClient *)self clientInterface];

  return SUOpenExternalURL((uint64_t)a3, v4);
}

- (BOOL)openInternalURL:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(SUClientDelegate *)self->_delegate client:self openInternalURL:a3] & 1) != 0)
  {
    return 1;
  }
  v6 = [(SUClient *)self clientInterface];

  return SUOpenExternalURL((uint64_t)a3, v6);
}

- (BOOL)openURL:(id)a3 inClientApplication:(id)a4
{
  v6 = [(SUClient *)self clientInterface];

  return SUOpenURLInClient((uint64_t)a3, (uint64_t)a4, v6);
}

- (id)queueSessionManager
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = [(SUClientInterface *)self->_clientInterface queueSessionManager];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (SUScriptExecutionContext)scriptExecutionContext
{
  uint64_t result = self->_scriptExecutionContext;
  if (!result)
  {
    uint64_t result = objc_alloc_init(SUScriptExecutionContext);
    self->_scriptExecutionContext = result;
  }
  return result;
}

- (NSString)searchHintsURLBagKey
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = [(SUClientInterface *)self->_clientInterface URLBagKeyForIdentifier:@"SUURLBagKeySearchHints"];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (NSString)searchURLBagKey
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = [(SUClientInterface *)self->_clientInterface URLBagKeyForIdentifier:@"SUURLBagKeySearch"];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (BOOL)sendActionForDialog:(id)a3 button:(id)a4
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
        id v19 = objc_alloc(MEMORY[0x263F7B290]);
        v20 = objc_msgSend(v19, "initWithURLRequest:", objc_msgSend(MEMORY[0x263EFC630], "requestWithURL:", v9));
        [v20 setITunesStoreRequest:1];
        [v20 setShouldProcessProtocol:1];
        v21 = (void *)[objc_alloc(MEMORY[0x263F7B360]) initWithRequestProperties:v20];
        [v21 start];

        goto LABEL_20;
      }
      if (v10 == 1)
      {
        id v11 = [(SUClient *)self _newAccountViewControllerForButtonAction:a4];
        BOOL v12 = [(SUClient *)self enterAccountFlowWithViewController:v11 animated:1];
        goto LABEL_17;
      }
      [(SUClient *)self openInternalURL:v9];
      goto LABEL_22;
    case 3:
      id v13 = objc_alloc_init(MEMORY[0x263F7B2D8]);
      objc_msgSend(v13, "setBuyParameters:", objc_msgSend(a4, "parameter"));
      v14 = [(SUClientInterface *)[(SUClient *)self clientInterface] purchaseManager];
      uint64_t v15 = objc_alloc_init(SUPurchaseBatch);
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
      v17 = [(SUClient *)self clientInterface];
      BOOL result = SUOpenExternalURL(v16, v17);
      break;
    case 5:
      BOOL result = [(SUClient *)self dismissTopViewControllerAnimated:1];
      break;
    case 8:
      id v11 = [(SUClient *)self _newComposeReviewViewControllerForButtonAction:a4];
      BOOL v12 = [(SUClient *)self composeReviewWithViewController:v11 animated:1];
LABEL_17:
      BOOL v18 = v12;

      BOOL result = v18;
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

- (void)setAssetTypes:(__CFArray *)a3
{
  assetTypes = self->_assetTypes;
  if (assetTypes != a3)
  {
    if (assetTypes) {
      CFRelease(assetTypes);
    }
    self->_assetTypes = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (void)setClientIdentifier:(id)a3
{
  [(NSLock *)self->_lock lock];
  [(SUClientInterface *)self->_clientInterface setClientIdentifier:a3];
  [(NSLock *)self->_lock unlock];
  BOOL v5 = (void *)[MEMORY[0x263F89468] currentClient];

  [v5 setAppleClientApplication:a3];
}

- (void)setQueueSessionManager:(id)a3
{
  [(NSLock *)self->_lock lock];
  [(SUClientInterface *)self->_clientInterface setQueueSessionManager:a3];
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setSearchHintsURLBagKey:(id)a3
{
  [(NSLock *)self->_lock lock];
  [(SUClientInterface *)self->_clientInterface setURLBagKey:a3 forIdentifier:@"SUURLBagKeySearchHints"];
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setSearchURLBagKey:(id)a3
{
  [(NSLock *)self->_lock lock];
  [(SUClientInterface *)self->_clientInterface setURLBagKey:a3 forIdentifier:@"SUURLBagKeySearch"];
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setViewControllerFactory:(id)a3
{
  [(NSLock *)self->_lock lock];
  [(SUClientInterface *)self->_clientInterface setViewControllerFactory:a3];
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (id)viewControllerFactory
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = [(SUClientInterface *)self->_clientInterface viewControllerFactory];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3);
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
  [(SUClient *)self _purgeCaches];
}

- (void)_bagDidLoadNotification:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F7B358] contextWithBagType:0];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache"), "URLBagForContext:", v4), "valueForKey:", @"p2-more-like-this");
  int v6 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!v5) {
    int v6 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"ISGeniusLookupAvailable", *v6, @"com.apple.mobileipod");
  CFPreferencesAppSynchronize(@"com.apple.mobileipod");

  [(SUClient *)self _reloadScriptExecutionContext];
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
  [(SUClient *)self _purgeCaches];
}

- (id)_newAccountViewControllerForButtonAction:(id)a3
{
  int v5 = objc_alloc_init(SUAccountViewController);
  [(SUViewController *)v5 setClientInterface:[(SUClient *)self clientInterface]];
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
  int v5 = [(SUClient *)self clientInterface];
  int v6 = [(SUViewControllerFactory *)[(SUClientInterface *)v5 viewControllerFactory] newComposeReviewViewControllerWithCompositionURL:v4];
  if (!v6) {
    int v6 = [[SUComposeReviewViewController alloc] initWithCompositionURL:v4];
  }
  [(SUViewController *)v6 setClientInterface:v5];
  return v6;
}

- (BOOL)_presentModalViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return [(SUClientDelegate *)delegate client:self presentModalViewController:a3 animated:v4];
}

- (void)_purgeCaches
{
  [MEMORY[0x263EFC600] sharedURLCache];
  ISURLCachePurgeMemoryCache();
  imageCache = self->_imageCache;

  [(SUImageCache *)imageCache removeAllCachedImages];
}

- (void)_reloadScriptExecutionContext
{
  id v3 = [(SUClient *)self clientIdentifier];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = [MEMORY[0x263F7B358] contextWithBagType:0];
    int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache"), "URLBagForContext:", v5), "valueForKey:", @"p2-global-javascript");
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
          [(SUScriptExecutionContext *)[(SUClient *)self scriptExecutionContext] evaluateScriptAtURL:v8];
        }
      }
    }
  }
}

- (SUClientDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUClientDelegate *)a3;
}

- (BOOL)dontSaveNavigationPath
{
  return self->_dontSaveNavigationPath;
}

- (void)setDontSaveNavigationPath:(BOOL)a3
{
  self->_dontSaveNavigationPath = a3;
}

- (void)setImageCache:(id)a3
{
}

- (void)setImagePool:(id)a3
{
}

@end