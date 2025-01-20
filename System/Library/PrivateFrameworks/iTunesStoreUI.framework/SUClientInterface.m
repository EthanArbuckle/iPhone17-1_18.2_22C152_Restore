@interface SUClientInterface
+ (id)_defaultApplicationIdentifier;
+ (id)_defaultApplicationVersion;
- (BOOL)_ignoresExpectedClientsProtocol;
- (BOOL)ignoreDefaultKeyboardNotifications;
- (BOOL)inAskToBuyApprovalFlow;
- (BOOL)isFinanceInterruption;
- (BOOL)showDialogOnError;
- (BOOL)wasLaunchedFromLibrary;
- (NSString)applicationIdentifier;
- (NSString)applicationVersion;
- (NSString)askToBuyApprovalPrompt;
- (NSString)clientIdentifier;
- (NSString)hostApplicationIdentifier;
- (NSString)localStoragePath;
- (NSString)userAgent;
- (SUClientInterface)init;
- (SUClientInterfaceDelegate)delegate;
- (SUPreviewOverlayViewController)previewOverlay;
- (SUPurchaseManager)purchaseManager;
- (SUQueueSessionManager)queueSessionManager;
- (SUTabBarController)tabBarController;
- (SUUIAppearance)appearance;
- (SUViewControllerFactory)viewControllerFactory;
- (UIColor)darkKeyColor;
- (UIColor)lightKeyColor;
- (id)URLBagKeyForIdentifier:(id)a3;
- (id)_newScriptInterface;
- (void)_dismissModalViewControllerFromViewController:(id)a3 withTransition:(int)a4;
- (void)_dismissViewControllerFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_dispatchOnPageResponseWithData:(id)a3 response:(id)a4;
- (void)_dispatchXEvent:(id)a3 withCompletionBlock:(id)a4;
- (void)_exitStoreWithReason:(int64_t)a3;
- (void)_hidePreviewOverlayAnimated:(BOOL)a3;
- (void)_mediaPlayerViewControllerWillDismiss:(id)a3 animated:(BOOL)a4;
- (void)_presentDialog:(id)a3;
- (void)_presentViewController:(id)a3 fromViewController:(id)a4 withTransition:(int)a5;
- (void)_returnToLibrary;
- (void)_setIgnoresExpectedClientsProtocol:(BOOL)a3;
- (void)_setStatusBarHidden:(BOOL)a3 withAnimation:(int64_t)a4;
- (void)_setStatusBarStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)_showPreviewOverlayAnimated:(BOOL)a3;
- (void)dealloc;
- (void)setAppearance:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setAskToBuyApprovalPrompt:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDarkKeyColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFinanceInterruption:(BOOL)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setIgnoreDefaultKeyboardNotifications:(BOOL)a3;
- (void)setInAskToBuyApprovalFlow:(BOOL)a3;
- (void)setLightKeyColor:(id)a3;
- (void)setLocalStoragePath:(id)a3;
- (void)setPurchaseManager:(id)a3;
- (void)setQueueSessionManager:(id)a3;
- (void)setShowDialogOnError:(BOOL)a3;
- (void)setURLBagKey:(id)a3 forIdentifier:(id)a4;
- (void)setUserAgent:(id)a3;
- (void)setViewControllerFactory:(id)a3;
- (void)setWasLaunchedFromLibrary:(BOOL)a3;
@end

@implementation SUClientInterface

- (void)setViewControllerFactory:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUClientInterfaceDelegatePrivate *)a3;
}

- (SUQueueSessionManager)queueSessionManager
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SUClientInterface_queueSessionManager__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SUQueueSessionManager *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setClientIdentifier:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__SUClientInterface_setClientIdentifier___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __41__SUClientInterface_setClientIdentifier___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 48);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 48) = result;
  }
  return result;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)SUClientInterface;
  [(SUClientInterface *)&v3 dealloc];
}

- (void)setURLBagKey:(id)a3 forIdentifier:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUClientInterface_setURLBagKey_forIdentifier___block_invoke;
  block[3] = &unk_264812808;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SUClientInterface_appearance__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 32) = +[SUUIAppearance defaultAppearance];
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t result = [v2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUClientInterface)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUClientInterface;
  uint64_t v2 = [(SUClientInterface *)&v6 init];
  if (v2)
  {
    objc_super v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.iTunesStoreUI.%p", v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v3 UTF8String], 0);
    v2->_applicationIdentifier = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultApplicationIdentifier"), "copy");
    v2->_applicationVersion = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultApplicationVersion"), "copy");
    v2->_queueSessionManager = objc_alloc_init(SUQueueSessionManager);
    v2->_viewControllerFactory = objc_alloc_init(SUViewControllerFactory);
    v4 = objc_alloc_init(SUPurchaseManager);
    v2->_purchaseManager = v4;
    [(SUPurchaseManager *)v4 setQueueSessionManager:v2->_queueSessionManager];
  }
  return v2;
}

- (SUUIAppearance)appearance
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__SUClientInterface_appearance__block_invoke;
  v5[3] = &unk_264812E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (SUUIAppearance *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (UIColor)lightKeyColor
{
  return self->_lightKeyColor;
}

- (UIColor)darkKeyColor
{
  return self->_darkKeyColor;
}

+ (id)_defaultApplicationVersion
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "infoDictionary");

  return (id)[v2 objectForKey:@"CFBundleVersion"];
}

+ (id)_defaultApplicationIdentifier
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "infoDictionary");

  return (id)[v2 objectForKey:@"CFBundleIdentifier"];
}

- (void)setLightKeyColor:(id)a3
{
}

- (void)setDarkKeyColor:(id)a3
{
}

- (SUViewControllerFactory)viewControllerFactory
{
  return (SUViewControllerFactory *)objc_getProperty(self, a2, 144, 1);
}

uint64_t __48__SUClientInterface_setURLBagKey_forIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  objc_super v3 = *(void **)(a1[5] + 128);
  if (v2)
  {
    if (!v3)
    {
      *(void *)(a1[5] + 128) = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v2 = a1[4];
      objc_super v3 = *(void **)(a1[5] + 128);
    }
    uint64_t v4 = a1[6];
    return [v3 setObject:v2 forKey:v4];
  }
  else
  {
    uint64_t v6 = a1[6];
    return [v3 removeObjectForKey:v6];
  }
}

id __40__SUClientInterface_queueSessionManager__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 112);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)applicationIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__SUClientInterface_applicationIdentifier__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __42__SUClientInterface_applicationIdentifier__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)applicationVersion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__SUClientInterface_applicationVersion__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __39__SUClientInterface_applicationVersion__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 16);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)clientIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SUClientInterface_clientIdentifier__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__SUClientInterface_clientIdentifier__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 48);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)ignoreDefaultKeyboardNotifications
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__SUClientInterface_ignoreDefaultKeyboardNotifications__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SUClientInterface_ignoreDefaultKeyboardNotifications__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 153);
  return result;
}

- (NSString)localStoragePath
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SUClientInterface_localStoragePath__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__SUClientInterface_localStoragePath__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 96);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUPreviewOverlayViewController)previewOverlay
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return (SUPreviewOverlayViewController *)[(SUClientInterfaceDelegatePrivate *)delegate previewOverlayForClientInterface:self];
}

- (SUPurchaseManager)purchaseManager
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SUClientInterface_purchaseManager__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (SUPurchaseManager *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __36__SUClientInterface_purchaseManager__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 104);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setApplicationIdentifier:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SUClientInterface_setApplicationIdentifier___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __46__SUClientInterface_setApplicationIdentifier___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 8);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    id result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 8) = result;
  }
  return result;
}

- (void)setApplicationVersion:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SUClientInterface_setApplicationVersion___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __43__SUClientInterface_setApplicationVersion___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 16);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    id result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 16) = result;
  }
  return result;
}

- (void)setAppearance:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__SUClientInterface_setAppearance___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __35__SUClientInterface_setAppearance___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 32);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    id result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 32) = result;
  }
  return result;
}

- (void)setIgnoreDefaultKeyboardNotifications:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SUClientInterface_setIgnoreDefaultKeyboardNotifications___block_invoke;
  v4[3] = &unk_2648132C0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __59__SUClientInterface_setIgnoreDefaultKeyboardNotifications___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 153) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setLocalStoragePath:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__SUClientInterface_setLocalStoragePath___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __41__SUClientInterface_setLocalStoragePath___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 96);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    id result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 96) = result;
  }
  return result;
}

- (void)setPurchaseManager:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__SUClientInterface_setPurchaseManager___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __40__SUClientInterface_setPurchaseManager___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 104);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    *(void *)(*(void *)(v2 + 32) + 104) = *(id *)(v2 + 40);
    id result = [*(id *)(*(void *)(v2 + 32) + 104) queueSessionManager];
    if (!result)
    {
      uint64_t v3 = *(void *)(v2 + 32);
      uint64_t v4 = *(void **)(v3 + 104);
      uint64_t v5 = *(void *)(v3 + 112);
      return [v4 setQueueSessionManager:v5];
    }
  }
  return result;
}

- (void)setQueueSessionManager:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SUClientInterface_setQueueSessionManager___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void *__44__SUClientInterface_setQueueSessionManager___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (*(void *)(v1 + 112) != result[5])
  {
    uint64_t v2 = result;
    uint64_t v3 = [*(id *)(v1 + 104) queueSessionManager];
    uint64_t v4 = *(void **)(v2[4] + 112);

    id result = (id)v2[5];
    *(void *)(v2[4] + 112) = result;
    if ((void *)v3 == v4)
    {
      uint64_t v5 = v2[4];
      uint64_t v6 = *(void **)(v5 + 104);
      uint64_t v7 = *(void *)(v5 + 112);
      return (void *)[v6 setQueueSessionManager:v7];
    }
  }
  return result;
}

- (void)setUserAgent:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__SUClientInterface_setUserAgent___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__SUClientInterface_setUserAgent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 136);
  if (v2 != *(void **)(a1 + 40))
  {

    *(void *)(*(void *)(a1 + 32) + 136) = [*(id *)(a1 + 40) copy];
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  uint64_t v4 = *(void **)(v1 + 104);

  return [v4 setUserAgent:v2];
}

- (void)setWasLaunchedFromLibrary:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__SUClientInterface_setWasLaunchedFromLibrary___block_invoke;
  v4[3] = &unk_2648132C0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SUClientInterface_setWasLaunchedFromLibrary___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 152) = *(unsigned char *)(result + 40);
  return result;
}

- (SUTabBarController)tabBarController
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return (SUTabBarController *)[(SUClientInterfaceDelegatePrivate *)delegate tabBarControllerForClientInterface:self];
}

- (id)URLBagKeyForIdentifier:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__49;
  uint64_t v11 = __Block_byref_object_dispose__49;
  uint64_t v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SUClientInterface_URLBagKeyForIdentifier___block_invoke;
  block[3] = &unk_2648135A8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __44__SUClientInterface_URLBagKeyForIdentifier___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 128) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (NSString)userAgent
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__SUClientInterface_userAgent__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSString *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__SUClientInterface_userAgent__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 136);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)wasLaunchedFromLibrary
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__SUClientInterface_wasLaunchedFromLibrary__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SUClientInterface_wasLaunchedFromLibrary__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 152);
  return result;
}

- (void)_dismissModalViewControllerFromViewController:(id)a3 withTransition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (objc_opt_respondsToSelector()) {
    [(SUClientInterfaceDelegatePrivate *)self->_delegate clientInterface:self willDismissViewController:a3];
  }

  [a3 dismissModalViewControllerWithTransition:v4];
}

- (void)_dismissViewControllerFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(SUClientInterfaceDelegatePrivate *)self->_delegate clientInterface:self willDismissViewController:a3];
  }
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate clientInterface:self dismissViewController:a3 animated:v6 completion:a5];
  }
  else
  {
    [a3 dismissViewControllerAnimated:v6 completion:a5];
  }
}

- (void)_dispatchOnPageResponseWithData:(id)a3 response:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate clientInterface:self dispatchOnPageResponseWithData:a3 response:a4];
  }
}

- (void)_dispatchXEvent:(id)a3 withCompletionBlock:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate clientInterface:self dispatchXEvent:a3 completionBlock:a4];
  }
  else
  {
    uint64_t v8 = (void (*)(id, void))*((void *)a4 + 2);
    v8(a4, 0);
  }
}

- (void)_exitStoreWithReason:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate clientInterface:self exitStoreWithReason:a3];
  }
}

- (void)_hidePreviewOverlayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate clientInterface:self hidePreviewOverlayAnimated:v3];
  }
}

- (BOOL)_ignoresExpectedClientsProtocol
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__SUClientInterface__ignoresExpectedClientsProtocol__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__SUClientInterface__ignoresExpectedClientsProtocol__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)_mediaPlayerViewControllerWillDismiss:(id)a3 animated:(BOOL)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate clientInterface:self willDismissViewController:a3];
  }
}

- (void)_presentDialog:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate clientInterface:self presentDialog:a3];
  }
}

- (void)_presentViewController:(id)a3 fromViewController:(id)a4 withTransition:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (objc_opt_respondsToSelector()) {
    [(SUClientInterfaceDelegatePrivate *)self->_delegate clientInterface:self willPresentViewController:a3];
  }

  [a4 presentViewController:a3 withTransition:v5 completion:0];
}

- (id)_newScriptInterface
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  char v3 = (void *)[(SUClientInterfaceDelegatePrivate *)self->_delegate scriptInterfaceForClientInterface:self];

  return v3;
}

- (void)_returnToLibrary
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate returnToLibraryForClientInterface:self];
  }
}

- (void)_setStatusBarHidden:(BOOL)a3 withAnimation:(int64_t)a4
{
  BOOL v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate clientInterface:self setStatusBarHidden:v5 withAnimation:a4];
  }
}

- (void)_setStatusBarStyle:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate clientInterface:self setStatusBarStyle:a3 animated:v4];
  }
}

- (void)_setIgnoresExpectedClientsProtocol:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUClientInterface__setIgnoresExpectedClientsProtocol___block_invoke;
  v4[3] = &unk_2648132C0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __56__SUClientInterface__setIgnoresExpectedClientsProtocol___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_showPreviewOverlayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SUClientInterfaceDelegatePrivate *)delegate clientInterface:self showPreviewOverlayAnimated:v3];
  }
}

- (NSString)askToBuyApprovalPrompt
{
  return self->_askToBuyApprovalPrompt;
}

- (void)setAskToBuyApprovalPrompt:(id)a3
{
}

- (BOOL)inAskToBuyApprovalFlow
{
  return self->inAskToBuyApprovalFlow;
}

- (void)setInAskToBuyApprovalFlow:(BOOL)a3
{
  self->inAskToBuyApprovalFlow = a3;
}

- (SUClientInterfaceDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)isFinanceInterruption
{
  return self->_financeInterruption;
}

- (void)setFinanceInterruption:(BOOL)a3
{
  self->_financeInterruption = a3;
}

- (NSString)hostApplicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (BOOL)showDialogOnError
{
  return self->_showDialogOnError;
}

- (void)setShowDialogOnError:(BOOL)a3
{
  self->_showDialogOnError = a3;
}

@end