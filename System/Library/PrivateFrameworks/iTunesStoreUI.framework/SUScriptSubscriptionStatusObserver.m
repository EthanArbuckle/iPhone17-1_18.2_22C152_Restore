@interface SUScriptSubscriptionStatusObserver
+ (id)sharedObserver;
- (SUScriptSubscriptionStatusObserver)init;
- (void)_updateWithSubscriptionStatus:(id)a3;
- (void)dealloc;
@end

@implementation SUScriptSubscriptionStatusObserver

+ (id)sharedObserver
{
  if (sharedObserver_sSharedObserverOnceToken != -1) {
    dispatch_once(&sharedObserver_sSharedObserverOnceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedObserver_sSharedObserver;

  return v2;
}

uint64_t __52__SUScriptSubscriptionStatusObserver_sharedObserver__block_invoke()
{
  sharedObserver_sSharedObserver = objc_alloc_init(SUScriptSubscriptionStatusObserver);

  return MEMORY[0x270F9A758]();
}

- (SUScriptSubscriptionStatusObserver)init
{
  v22.receiver = self;
  v22.super_class = (Class)SUScriptSubscriptionStatusObserver;
  v2 = [(SUScriptSubscriptionStatusObserver *)&v22 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUScriptSubscriptionStatusObserver", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = [(objc_class *)getICUserIdentityClass_1() autoupdatingActiveAccount];
    uint64_t v6 = [(objc_class *)getICMusicSubscriptionStatusMonitorClass_1() sharedMonitorForIdentity:v5];
    subscriptionStatusMonitor = v2->_subscriptionStatusMonitor;
    v2->_subscriptionStatusMonitor = (ICMusicSubscriptionStatusMonitor *)v6;

    v8 = [(ICMusicSubscriptionStatusMonitor *)v2->_subscriptionStatusMonitor subscriptionStatus];
    v9 = v2->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__SUScriptSubscriptionStatusObserver_init__block_invoke;
    block[3] = &unk_264812290;
    v10 = v2;
    v20 = v10;
    id v11 = v8;
    id v21 = v11;
    dispatch_sync(v9, block);
    objc_initWeak(&location, v10);
    v12 = v2->_subscriptionStatusMonitor;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __42__SUScriptSubscriptionStatusObserver_init__block_invoke_2;
    v16[3] = &unk_264814E70;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = [(ICMusicSubscriptionStatusMonitor *)v12 beginObservingSubscriptionStatusWithHandler:v16];
    subscriptionStatusMonitorObservationToken = v10->_subscriptionStatusMonitorObservationToken;
    v10->_subscriptionStatusMonitorObservationToken = (NSCopying *)v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__SUScriptSubscriptionStatusObserver_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    dispatch_queue_t v3 = [[SUScriptSubscriptionStatusResponse alloc] initWithSubscriptionStatus:*(void *)(a1 + 40) isFinal:1];
  }
  else {
    dispatch_queue_t v3 = 0;
  }
  v4 = v3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v3);
  if (v2)
  {
  }
}

void __42__SUScriptSubscriptionStatusObserver_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  dispatch_queue_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _updateWithSubscriptionStatus:v4];
}

- (void)dealloc
{
  [(ICMusicSubscriptionStatusMonitor *)self->_subscriptionStatusMonitor endObservingSubscriptionStatusWithToken:self->_subscriptionStatusMonitorObservationToken];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSubscriptionStatusObserver;
  [(SUScriptSubscriptionStatusObserver *)&v3 dealloc];
}

- (void)_updateWithSubscriptionStatus:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = (SUScriptSubscriptionStatusResponse *)a3;
  v5 = v4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  if (v4) {
    id v4 = [[SUScriptSubscriptionStatusResponse alloc] initWithSubscriptionStatus:v4 isFinal:1];
  }
  accessQueue = self->_accessQueue;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __68__SUScriptSubscriptionStatusObserver__updateWithSubscriptionStatus___block_invoke;
  uint64_t v13 = &unk_264814E98;
  v14 = self;
  v7 = v4;
  v15 = v7;
  v16 = &v17;
  dispatch_sync(accessQueue, &v10);
  if (*((unsigned char *)v18 + 24))
  {
    v8 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v10, v11, v12, v13, v14);
    id v21 = @"service";
    v22[0] = @"AppleMusic";
    v9 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [v8 postNotificationName:@"SUScriptSubscriptionStatusDidChangeNotification" object:self userInfo:v9];
  }
  _Block_object_dispose(&v17, 8);
}

void __68__SUScriptSubscriptionStatusObserver__updateWithSubscriptionStatus___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatusMonitorObservationToken, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusMonitor, 0);
  objc_storeStrong((id *)&self->_lastKnownSubscriptionStatusResponse, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end