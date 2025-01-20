@interface ICDelegateAccountStoreServiceListener
+ (id)machServiceListener;
+ (id)testingListenerWithIdentityStore:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListenerEndpoint)XPCEndpoint;
- (id)_identityStore;
- (id)_initWithXPCListener:(id)a3 testingIdentityStore:(id)a4;
- (void)_userIdentityStoreDelegateAccountStoreDidChangeNotification:(id)a3;
- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)invalidate;
- (void)openWithCompletionHandler:(id)a3;
- (void)recreateWithCompletionHandler:(id)a3;
- (void)removeAllTokensWithCompletionHandler:(id)a3;
- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4;
- (void)resume;
- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)suspend;
@end

@implementation ICDelegateAccountStoreServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingIdentityStore, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)_identityStore
{
  testingIdentityStore = self->_testingIdentityStore;
  if (testingIdentityStore)
  {
    v3 = testingIdentityStore;
  }
  else
  {
    v3 = +[ICUserIdentityStore defaultIdentityStore];
  }

  return v3;
}

- (void)_userIdentityStoreDelegateAccountStoreDidChangeNotification:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__ICDelegateAccountStoreServiceListener__userIdentityStoreDelegateAccountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

void __101__ICDelegateAccountStoreServiceListener__userIdentityStoreDelegateAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__ICDelegateAccountStoreServiceListener__userIdentityStoreDelegateAccountStoreDidChangeNotification___block_invoke_2;
  block[3] = &unk_1E5ACD750;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

void __101__ICDelegateAccountStoreServiceListener__userIdentityStoreDelegateAccountStoreDidChangeNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "remoteObjectProxy", (void)v7);
        [v6 delegateAccountStoreDidChange];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = v7;
  if (self->_ignoresEntitlements) {
    goto LABEL_2;
  }
  v15 = [v7 valueForEntitlement:@"com.apple.itunescloud.delegate-account-store"];
  if ((_NSIsNSNumber() & 1) == 0)
  {

LABEL_7:
    BOOL v14 = 0;
    goto LABEL_8;
  }
  int v16 = [v15 BOOLValue];

  if (!v16) {
    goto LABEL_7;
  }
LABEL_2:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E5ACD4C8;
  void block[4] = self;
  id v10 = v8;
  id v27 = v10;
  dispatch_barrier_async(accessQueue, block);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v21 = &unk_1E5ACA2F0;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  v11 = (void *)MEMORY[0x1A6240BF0](&v18);
  objc_msgSend(v10, "setInvalidationHandler:", v11, v18, v19, v20, v21);
  [v10 setInterruptionHandler:v11];
  uint64_t v12 = ICDelegateAccountStoreServiceGetInterface();
  [v10 setExportedInterface:v12];

  [v10 setExportedObject:self];
  v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF65AD10];
  [v10 setRemoteObjectInterface:v13];

  [v10 resume];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  BOOL v14 = 1;
LABEL_8:

  return v14;
}

uint64_t __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

void __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = v3;
  if (WeakRetained && v3)
  {
    uint64_t v5 = WeakRetained[1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke_3;
    v6[3] = &unk_1E5ACD4C8;
    id v7 = WeakRetained;
    id v8 = v4;
    dispatch_barrier_async(v5, v6);
  }
}

uint64_t __76__ICDelegateAccountStoreServiceListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(ICDelegateAccountStoreServiceListener *)self _identityStore];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__ICDelegateAccountStoreServiceListener_setToken_forUserIdentity_completionHandler___block_invoke;
  v13[3] = &unk_1E5AC84D8;
  id v14 = v8;
  id v12 = v8;
  [v11 updatePropertiesForUserIdentity:v10 usingBlock:v13 completionHandler:v9];
}

uint64_t __84__ICDelegateAccountStoreServiceListener_setToken_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegateToken:*(void *)(a1 + 32)];
}

- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(ICDelegateAccountStoreServiceListener *)self _identityStore];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__ICDelegateAccountStoreServiceListener_setIdentityProperties_forUserIdentity_completionHandler___block_invoke;
  v13[3] = &unk_1E5AC84B0;
  id v14 = v8;
  id v12 = v8;
  [v11 insertPropertiesForUserIdentity:v10 usingBlock:v13 completionHandler:v9];
}

void __97__ICDelegateAccountStoreServiceListener_setIdentityProperties_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 replaceValuesWithValuesFromProperties:v2];
  [v3 setDelegated:1];
}

- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICDelegateAccountStoreServiceListener *)self _identityStore];
  [v8 removeDelegateTokensExpiringBeforeDate:v7 completionHandler:v6];
}

- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICDelegateAccountStoreServiceListener *)self _identityStore];
  [v8 removeDelegateTokenForUserIdentity:v7 completionHandler:v6];
}

- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICDelegateAccountStoreServiceListener *)self _identityStore];
  [v8 removePropertiesForUserIdentity:v7 completionHandler:v6];
}

- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ICDelegateAccountStoreServiceListener *)self _identityStore];
  [v11 removeDelegationUUIDs:v10 forUserIdentity:v9 completionHandler:v8];
}

- (void)removeAllTokensWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDelegateAccountStoreServiceListener *)self _identityStore];
  [v5 removeAllDelegateTokensWithCompletionHandler:v4];
}

- (void)recreateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDelegateAccountStoreServiceListener *)self _identityStore];
  [v5 _resetDelegateAccountStoreWithCompletionHandler:v4];
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDelegateAccountStoreServiceListener *)self _identityStore];
  [v5 _prepareDelegateAccountStoreWithCompletionHandler:v4];
}

- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ICDelegateAccountStoreServiceListener *)self _identityStore];
  [v11 addDelegationUUIDs:v10 forUserIdentity:v9 completionHandler:v8];
}

- (NSXPCListenerEndpoint)XPCEndpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (void)suspend
{
}

- (void)resume
{
}

- (void)invalidate
{
}

- (id)_initWithXPCListener:(id)a3 testingIdentityStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICDelegateAccountStoreServiceListener;
  id v9 = [(ICDelegateAccountStoreServiceListener *)&v17 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegateAccountStoreServiceListener.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegateAccountStoreServiceListener.callbackQueue", 0);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_listener, a3);
    [(NSXPCListener *)v9->_listener setDelegate:v9];
    if (v8)
    {
      v9->_ignoresEntitlements = 1;
      objc_storeStrong((id *)&v9->_testingIdentityStore, a4);
    }
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v15 = [(ICDelegateAccountStoreServiceListener *)v9 _identityStore];
    [v14 addObserver:v9 selector:sel__userIdentityStoreDelegateAccountStoreDidChangeNotification_ name:@"ICUserIdentityStoreDelegateAccountStoreDidChangeNotification" object:v15];
  }
  return v9;
}

+ (id)testingListenerWithIdentityStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [MEMORY[0x1E4F29290] anonymousListener];
  id v7 = (void *)[v5 _initWithXPCListener:v6 testingIdentityStore:v4];

  return v7;
}

+ (id)machServiceListener
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.itunescloud.delegate-account-store"];
  id v4 = (void *)[objc_alloc((Class)a1) _initWithXPCListener:v3 testingIdentityStore:0];

  return v4;
}

@end