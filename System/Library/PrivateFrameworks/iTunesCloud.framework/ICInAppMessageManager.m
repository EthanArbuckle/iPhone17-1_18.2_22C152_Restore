@interface ICInAppMessageManager
+ (ICInAppMessageManager)sharedManager;
- (BOOL)_privacyAcknowledgementRequired;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICInAppMessageManager)initWithMessageStore:(id)a3 identityStore:(id)a4;
- (ICInAppMessageStore)_unsafeMessageStore;
- (id)_init;
- (id)_resourceCacheDirectoryPath;
- (id)_storeRequestContext;
- (id)_xpcClientConnection;
- (void)_addConnection:(id)a3;
- (void)_addMessageEntry:(id)a3 completion:(id)a4;
- (void)_checkForMessageResourcesNeedingDownloadForcingIfNecessary:(BOOL)a3;
- (void)_downloadResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)_handleICInAppMessagesDidChangeDistributedNotification:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_loadConfigurationWithCompletion:(id)a3;
- (void)_performCacheConsistencyCheck;
- (void)_performSyncRetryIfPending:(BOOL)a3;
- (void)_performSyncWithCompletion:(id)a3;
- (void)_processSyncResponse:(id)a3 completion:(id)a4;
- (void)_removeAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)_removeConnection:(id)a3;
- (void)_removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)_schedulePeriodicUpdate;
- (void)_updateShouldDownloadResources:(BOOL)a3 onMessageWithIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6;
- (void)addMessageEntry:(id)a3 completion:(id)a4;
- (void)addMessageEntryFromAMSDialogRequest:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)allMessageEntriesWithCompletion:(id)a3;
- (void)clearCachedResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)downloadResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)flushEventsWithCompletion:(id)a3;
- (void)getAllMetadataForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getAllMetadataForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)getGlobalPropertyForKey:(id)a3 completion:(id)a4;
- (void)getMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)getPropertyForKey:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)messageEntriesForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)messageEntriesForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)messageEntryWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)removeAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)removeApplicationBadgeForBundleIdentifier:(id)a3 fromPresentedMessageEntry:(id)a4 completion:(id)a5;
- (void)removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)removeMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 completion:(id)a5;
- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 flushImmediately:(BOOL)a5 completion:(id)a6;
- (void)resetMessagesWithCompletion:(id)a3;
- (void)setGlobalProperty:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setProperty:(id)a3 forKey:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6;
- (void)startSystemService;
- (void)stopSystemService;
- (void)syncMessagesWithCompletion:(id)a3;
- (void)updateMessageEntry:(id)a3 completion:(id)a4;
- (void)updateMetadata:(id)a3 messageIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6;
@end

@implementation ICInAppMessageManager

void __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_4(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      int v10 = 138543874;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load messages for bundle identifiers %{public}@. err=%{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __38__ICInAppMessageManager_sharedManager__block_invoke()
{
  sharedManager_sSharedManager = [[ICInAppMessageManager alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v3 = objc_alloc_init(ICInAppMessageStore);
  v4 = +[ICUserIdentityStore defaultIdentityStore];
  id v5 = [(ICInAppMessageManager *)self initWithMessageStore:v3 identityStore:v4];

  return v5;
}

uint64_t __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getPropertyForKey:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = v8;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_4;
    v19[3] = &unk_1E5AC7058;
    v19[4] = self;
    uint64_t v11 = &v20;
    id v20 = v8;
    id v12 = a4;
    id v13 = a3;
    [(ICInAppMessageStore *)messageStore getStorePropertyForKey:v13 bundleIdentifier:v12 completion:v19];
  }
  else
  {
    id v14 = a4;
    id v15 = a3;
    uint64_t v16 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke;
    v23[3] = &unk_1E5ACD8E0;
    v23[4] = self;
    uint64_t v11 = &v24;
    id v17 = v9;
    id v24 = v17;
    v18 = [v16 remoteObjectProxyWithErrorHandler:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_2;
    v21[3] = &unk_1E5AC7058;
    v21[4] = self;
    id v22 = v17;
    [v18 getPropertyForKey:v15 bundleIdentifier:v14 completion:v21];
  }
}

- (id)_xpcClientConnection
{
  xpcClientConnection = self->_xpcClientConnection;
  if (!xpcClientConnection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.itunescloud.in-app-message-service" options:0];
    id v5 = self->_xpcClientConnection;
    self->_xpcClientConnection = v4;

    [(NSXPCConnection *)self->_xpcClientConnection setExportedObject:self];
    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF645DF8];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    [v6 setClasses:v9 forSelector:sel_allMessageEntriesWithCompletion_ argumentIndex:0 ofReply:1];

    int v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    [v6 setClasses:v12 forSelector:sel_messageEntriesForBundleIdentifiers_completion_ argumentIndex:0 ofReply:1];

    id v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v6 setClasses:v13 forSelector:sel_addMessageEntry_completion_ argumentIndex:0 ofReply:0];

    id v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    id v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    [v6 setClasses:v17 forSelector:sel_getAllMetadataForBundleIdentifiers_completion_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)self->_xpcClientConnection setRemoteObjectInterface:v6];
    [(NSXPCConnection *)self->_xpcClientConnection setInterruptionHandler:&__block_literal_global_361];
    v18 = self->_xpcClientConnection;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __45__ICInAppMessageManager__xpcClientConnection__block_invoke_362;
    v20[3] = &unk_1E5ACD750;
    v20[4] = self;
    [(NSXPCConnection *)v18 setInvalidationHandler:v20];
    [(NSXPCConnection *)self->_xpcClientConnection resume];

    xpcClientConnection = self->_xpcClientConnection;
  }

  return xpcClientConnection;
}

+ (ICInAppMessageManager)sharedManager
{
  if (sharedManager_sOnceToken != -1) {
    dispatch_once(&sharedManager_sOnceToken, &__block_literal_global_2650);
  }
  v2 = (void *)sharedManager_sSharedManager;

  return (ICInAppMessageManager *)v2;
}

void __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 objectForKey:@"syncPending"];
  int v5 = [v4 BOOLValue];

  id v6 = [v3 objectForKey:@"lastSyncAttempt"];

  uint64_t v7 = [v6 longLongValue];
  if (v5
    && (*(unsigned char *)(a1 + 48)
     || !v7
     || ([MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate], v8 - (double)v7 > 3600.0)))
  {
    uint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Had pending sync - retrying now", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke_408;
    v13[3] = &unk_1E5ACC7B0;
    uint64_t v11 = *(void **)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    [v11 _performSyncWithCompletion:v13];
  }
  else
  {
    id v12 = *(void **)(a1 + 40);
    [v12 finishWithError:0];
  }
}

- (ICInAppMessageManager)initWithMessageStore:(id)a3 identityStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ICInAppMessageManager;
  uint64_t v9 = [(ICInAppMessageManager *)&v21 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageStore, a3);
    objc_storeStrong((id *)&v10->_identityStore, a4);
    uint64_t v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v11;

    [(NSOperationQueue *)v10->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v10->_operationQueue setName:@"com.apple.iTunesCloud.ICInAppMessageManager.operationQueue"];
    [(NSOperationQueue *)v10->_operationQueue setQualityOfService:25];
    id v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    downloadOperationQueue = v10->_downloadOperationQueue;
    v10->_downloadOperationQueue = v13;

    [(NSOperationQueue *)v10->_downloadOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v10->_downloadOperationQueue setName:@"com.apple.iTunesCloud.ICInAppMessageManager.downloadOperationQueue"];
    [(NSOperationQueue *)v10->_downloadOperationQueue setQualityOfService:17];
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageManager.accessQueue", 0);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageManager.accessQueue", MEMORY[0x1E4F14430]);
    callbackQueue = v10->_callbackQueue;
    v10->_callbackQueue = (OS_dispatch_queue *)v17;

    v19 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v19 addObserver:v10 selector:sel__handleICInAppMessagesDidChangeDistributedNotification_ name:@"com.apple.itunescloud.ICInAppMessagesDidChangeDistributedNotification" object:0];
  }
  return v10;
}

void __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_5;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "auditToken", v16);
  }
  else
  {
    long long v27 = 0u;
    long long v26 = 0u;
  }
  id v8 = MSVBundleIDForAuditToken();
  id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v29 = self;
    __int16 v30 = 2114;
    v31 = v8;
    __int16 v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Receiving New incoming connection from %{public}@: %{public}@", buf, 0x20u);
  }

  id v10 = [v7 valueForEntitlement:@"com.apple.itunescloud.in-app-message-service"];
  char v11 = [v10 BOOLValue];

  if (v11)
  {
    [(ICInAppMessageManager *)self _performSyncRetryIfPending:0];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v7);
    id v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF645DF8];
    [v7 setExportedInterface:v12];
    [v7 setExportedObject:self];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__ICInAppMessageManager_listener_shouldAcceptNewConnection___block_invoke;
    v21[3] = &unk_1E5AC73C8;
    objc_copyWeak(&v23, (id *)buf);
    objc_copyWeak(&v24, &location);
    id v13 = v8;
    id v22 = v13;
    [v7 setInterruptionHandler:v21];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__ICInAppMessageManager_listener_shouldAcceptNewConnection___block_invoke_451;
    v17[3] = &unk_1E5AC73C8;
    objc_copyWeak(&v19, (id *)buf);
    objc_copyWeak(&v20, &location);
    id v18 = v13;
    [v7 setInvalidationHandler:v17];
    [(ICInAppMessageManager *)self _addConnection:v7];
    [v7 resume];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      __int16 v30 = 2114;
      v31 = v8;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Client process %{public}@ does not have required entitlements - rejecting connection", buf, 0x16u);
    }
  }
  return v11;
}

- (void)_performSyncRetryIfPending:(BOOL)a3
{
  id v5 = [ICAsyncBlockOperation alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke;
  v7[3] = &unk_1E5AC7238;
  v7[4] = self;
  BOOL v8 = a3;
  id v6 = [(ICAsyncBlockOperation *)v5 initWithStartHandler:v7];
  [(ICAsyncBlockOperation *)v6 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.performSyncRetryIfPending"];
  [(NSOperationQueue *)self->_operationQueue addOperation:v6];
}

- (void)_addConnection:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ICInAppMessageManager__addConnection___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

void __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

- (void)messageEntriesForBundleIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v26 = self;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching messages for bundle identifiers %{public}@", buf, 0x16u);
  }

  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_4;
    v18[3] = &unk_1E5ACC400;
    v18[4] = self;
    id v10 = &v19;
    id v11 = v6;
    id v19 = v11;
    id v20 = v7;
    id v12 = v7;
    [(ICInAppMessageStore *)messageStore getAllMessageEntriesForBundleIdentifiers:v11 completion:v18];
    id v13 = v20;
  }
  else
  {
    id v14 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke;
    v23[3] = &unk_1E5ACD8E0;
    v23[4] = self;
    id v10 = &v24;
    id v15 = v7;
    id v24 = v15;
    id v16 = [v14 remoteObjectProxyWithErrorHandler:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_2;
    v21[3] = &unk_1E5ACC478;
    void v21[4] = self;
    id v22 = v15;
    id v17 = v15;
    [v16 messageEntriesForBundleIdentifiers:v6 completion:v21];

    id v13 = v22;
  }
}

void __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_3;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke_2;
  v7[3] = &unk_1E5AC7210;
  char v9 = *(unsigned char *)(a1 + 40);
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 allStorePropertiesWithCompletion:v7];
}

uint64_t __40__ICInAppMessageManager__addConnection___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 96);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClientConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcServiceListener, 0);
  objc_storeStrong((id *)&self->_fitnessPrivacyObserverToken, 0);
  objc_storeStrong((id *)&self->_musicPrivacyObserverToken, 0);
  objc_storeStrong((id *)&self->_foregroundApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_downloadOperationQueue, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (ICInAppMessageStore)_unsafeMessageStore
{
  return self->_messageStore;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  if ([v4 isRemoteServerLikelyReachable]
    && ((unint64_t)([v4 networkType] - 1) > 0x1F2
     || [v4 isCurrentNetworkLinkHighQuality]))
  {
    [(ICInAppMessageManager *)self _checkForMessageResourcesNeedingDownloadForcingIfNecessary:0];
  }
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ICInAppMessageManager__removeConnection___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __43__ICInAppMessageManager__removeConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) removeObject:*(void *)(a1 + 40)];
}

void __60__ICInAppMessageManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543874;
      id v7 = WeakRetained;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection from %{public}@ interrupted - removing connection %{public}@", (uint8_t *)&v6, 0x20u);
    }

    if (v3) {
      [WeakRetained _removeConnection:v3];
    }
  }
}

void __60__ICInAppMessageManager_listener_shouldAcceptNewConnection___block_invoke_451(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543874;
      id v7 = WeakRetained;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection from %{public}@ invalidated - removing connection %{public}@", (uint8_t *)&v6, 0x20u);
    }

    if (v3) {
      [WeakRetained _removeConnection:v3];
    }
  }
}

- (BOOL)_privacyAcknowledgementRequired
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  v23[0] = @"Music";
  v23[1] = @"TV";
  v23[2] = @"AppStore";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  id v4 = [v2 arrayWithArray:v3];

  uint64_t v5 = +[ICDeviceInfo currentDeviceInfo];
  char v6 = [v5 isMac];

  if ((v6 & 1) == 0)
  {
    v22[0] = @"FitnessPlus";
    v22[1] = @"ImproveFitnessPlus";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    [v4 addObjectsFromArray:v7];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = +[ICPrivacyInfo sharedPrivacyInfo];
        LODWORD(v13) = [v14 privacyAcknowledgementRequiredForIdentifier:v13];

        if (!v13)
        {
          BOOL v15 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_13:

  return v15;
}

- (void)_performCacheConsistencyCheck
{
  id v3 = [ICAsyncBlockOperation alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ICInAppMessageManager__performCacheConsistencyCheck__block_invoke;
  v5[3] = &unk_1E5ACA1A0;
  v5[4] = self;
  id v4 = [(ICAsyncBlockOperation *)v3 initWithStartHandler:v5];
  [(ICAsyncBlockOperation *)v4 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.performCacheConsistencyCheck"];
  [(NSOperationQueue *)self->_operationQueue addOperation:v4];
}

void __54__ICInAppMessageManager__performCacheConsistencyCheck__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ICInAppMessageManager__performCacheConsistencyCheck__block_invoke_2;
  v7[3] = &unk_1E5AC7288;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 getAllMessageEntriesWithCompletion:v7];
}

void __54__ICInAppMessageManager__performCacheConsistencyCheck__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v2, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v53 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v52 + 1) + 8 * i) applicationMessage];
        uint64_t v10 = [v9 identifier];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v6);
  }
  v35 = v4;

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CB10];
  id v14 = [*(id *)(a1 + 32) _resourceCacheDirectoryPath];
  uint64_t v15 = [v13 fileURLWithPath:v14];

  v39 = v12;
  uint64_t v34 = (void *)v15;
  [v12 enumeratorAtURL:v15 includingPropertiesForKeys:0 options:5 errorHandler:0];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v38 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(obj);
        }
        long long v19 = [v39 enumeratorAtURL:*(void *)(*((void *)&v48 + 1) + 8 * j) includingPropertiesForKeys:0 options:5 errorHandler:0];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v61 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v45;
          do
          {
            for (uint64_t k = 0; k != v21; ++k)
            {
              if (*(void *)v45 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v44 + 1) + 8 * k);
              v25 = [v24 lastPathComponent];
              if (([v3 containsObject:v25] & 1) == 0) {
                [v11 addObject:v24];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v61 count:16];
          }
          while (v21);
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v17);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v26 = v11;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v60 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v40 + 1) + 8 * m);
        __int16 v32 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v57 = v33;
          __int16 v58 = 2114;
          uint64_t v59 = v31;
          _os_log_impl(&dword_1A2D01000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Purging orphaned cache directory %{public}@", buf, 0x16u);
        }

        [v39 removeItemAtURL:v31 error:0];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v40 objects:v60 count:16];
    }
    while (v28);
  }

  [*(id *)(a1 + 40) finishWithError:0];
}

- (void)_loadConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ICURLBagProvider sharedBagProvider];
  uint64_t v6 = [(ICInAppMessageManager *)self _storeRequestContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ICInAppMessageManager__loadConfigurationWithCompletion___block_invoke;
  v8[3] = &unk_1E5AC9E30;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 getBagForRequestContext:v6 withCompletionHandler:v8];
}

void __58__ICInAppMessageManager__loadConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v14 = 138543618;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to load bag for configuration. err=%{public}@", (uint8_t *)&v14, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = [a2 dictionaryForBagKey:@"inAppMessages"];
    if (_NSIsNSDictionary())
    {
      id v9 = [[ICInAppMessageConfiguration alloc] initWithDictionary:v8];
      uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v14 = 138543362;
        uint64_t v15 = v12;
        _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to load configuration from bag", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v13 = *(void *)(a1 + 40);
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      uint64_t v10 = *(void (**)(void))(v13 + 16);
    }
    v10();
  }
}

- (id)_resourceCacheDirectoryPath
{
  id v2 = ICDefaultCacheDirectory();
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v2, @"InAppMessages", @"ResourceCache", 0);
  id v4 = [NSString pathWithComponents:v3];

  return v4;
}

- (void)_downloadResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [[ICNetworkConstraints alloc] initWithBundleIdentifier:v9];
  uint64_t v12 = +[ICEnvironmentMonitor sharedMonitor];
  uint64_t v13 = [v12 lastKnownNetworkType];

  if ([(ICNetworkConstraints *)v11 shouldAllowDataForNetworkType:v13])
  {
    messageStore = self->_messageStore;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke;
    v17[3] = &unk_1E5AC6F90;
    void v17[4] = self;
    id v18 = v9;
    id v19 = v8;
    id v20 = v10;
    [(ICInAppMessageStore *)messageStore getMessageEntryWithIdentifier:v19 bundleIdentifier:v18 completion:v17];
  }
  else
  {
    uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = self;
      __int16 v23 = 2114;
      id v24 = v9;
      __int16 v25 = 2114;
      id v26 = v8;
      __int16 v27 = 1024;
      int v28 = v13;
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping downloads for message %{public}@:%{public}@ as its not allowed on the current network type (%d)", buf, 0x26u);
    }

    __int16 v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7004 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v16);
  }
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v8;
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to fetch message %{public}@:%{public}@ to set the download flag on. err=%{public}@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v11 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_422;
    v15[3] = &unk_1E5AC73A0;
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = *(void **)(a1 + 40);
    id v20 = v12;
    v15[4] = v13;
    id v16 = v14;
    id v17 = *(id *)(a1 + 48);
    id v18 = v5;
    id v19 = 0;
    [v11 _loadConfigurationWithCompletion:v15];
  }
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_422(uint64_t a1, void *a2, void *a3)
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v93 = v5;
  if (!v6)
  {
    uint64_t v95 = a1;
    uint64_t v7 = [v5 resourceDomainURL];

    if (!v7)
    {
      v84 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v85 = *(void *)(a1 + 32);
        LODWORD(v146) = 138543362;
        *(void *)((char *)&v146 + 4) = v85;
        _os_log_impl(&dword_1A2D01000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ base resource url missing from configuration - skipping download", (uint8_t *)&v146, 0xCu);
      }

      uint64_t v86 = *(void *)(a1 + 72);
      v87 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      (*(void (**)(uint64_t, void *))(v86 + 16))(v86, v87);

      goto LABEL_39;
    }
    *(void *)&long long v146 = 0;
    *((void *)&v146 + 1) = &v146;
    uint64_t v147 = 0x3032000000;
    v148 = __Block_byref_object_copy__2541;
    v149 = __Block_byref_object_dispose__2542;
    id v150 = 0;
    v134[0] = 0;
    v134[1] = v134;
    v134[2] = 0x3032000000;
    v134[3] = __Block_byref_object_copy__2541;
    v134[4] = __Block_byref_object_dispose__2542;
    id v135 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = [*(id *)(a1 + 32) _resourceCacheDirectoryPath];
    uint64_t v9 = [v8 stringByAppendingPathComponent:*(void *)(a1 + 40)];
    v92 = [v9 stringByAppendingPathComponent:*(void *)(a1 + 48)];

    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v133 = 0;
    [v10 createDirectoryAtPath:v92 withIntermediateDirectories:1 attributes:0 error:&v133];
    id v88 = v133;

    group = dispatch_group_create();
    uint64_t v11 = [*(id *)(a1 + 56) applicationMessage];
    LODWORD(v9) = [v11 hasWebArchiveURL];

    if (v9)
    {
      id v12 = [*(id *)(a1 + 56) cachedLocationForResourceWithIdentifier:@"ICInAppMessageEntryResourceIdentifierWebArchive"];
      BOOL v13 = v12 == 0;

      if (v13)
      {
        int v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          id v16 = *(void **)(a1 + 40);
          uint64_t v17 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          uint64_t v137 = v15;
          __int16 v138 = 2114;
          v139 = v16;
          __int16 v140 = 2114;
          uint64_t v141 = v17;
          _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Downloading web archive for message %{public}@:%{public}@", buf, 0x20u);
        }

        dispatch_group_enter(group);
        id v18 = (void *)MEMORY[0x1E4F1CB10];
        id v19 = [*(id *)(a1 + 56) applicationMessage];
        id v20 = [v19 webArchiveURL];
        uint64_t v21 = [v93 resourceDomainURL];
        uint64_t v22 = [v18 URLWithString:v20 relativeToURL:v21];

        __int16 v23 = [v22 lastPathComponent];
        uint64_t v24 = [v92 stringByAppendingPathComponent:v23];

        __int16 v25 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v25 removeItemAtPath:v24 error:0];

        uint64_t v26 = [ICURLRequest alloc];
        __int16 v27 = [*(id *)(a1 + 32) _storeRequestContext];
        id v28 = [(ICURLRequest *)v26 initWithURL:v22 requestContext:v27];

        uint64_t v29 = +[ICURLSessionManager defaultSession];
        __int16 v30 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v24];
        v126[0] = MEMORY[0x1E4F143A8];
        v126[1] = 3221225472;
        v126[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_426;
        v126[3] = &unk_1E5AC72B0;
        uint64_t v31 = *(void *)(a1 + 32);
        v131 = &v146;
        v126[4] = v31;
        id v127 = *(id *)(a1 + 56);
        id v128 = *(id *)(a1 + 64);
        v132 = v134;
        id v32 = v24;
        id v129 = v32;
        v130 = group;
        [v29 enqueueDownloadRequest:v28 toDestination:v30 withCompletionHandler:v126];
      }
    }
    uint64_t v33 = [*(id *)(a1 + 56) applicationMessage];
    if ([v33 hasTemplateURL])
    {
      uint64_t v34 = [*(id *)(a1 + 56) cachedLocationForResourceWithIdentifier:@"ICInAppMessageEntryResourceIdentifierTemplate"];
      BOOL v35 = v34 == 0;

      if (!v35)
      {
LABEL_15:
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v54 = [*(id *)(a1 + 56) applicationMessage];
        obuint64_t j = [v54 contentPages];

        uint64_t v55 = [obj countByEnumeratingWithState:&v115 objects:v145 count:16];
        if (v55)
        {
          uint64_t v90 = *(void *)v116;
          do
          {
            for (uint64_t i = 0; i != v55; ++i)
            {
              if (*(void *)v116 != v90) {
                objc_enumerationMutation(obj);
              }
              v56 = *(void **)(*((void *)&v115 + 1) + 8 * i);
              long long v111 = 0u;
              long long v112 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              uint64_t v57 = [v56 images];
              uint64_t v58 = [v57 countByEnumeratingWithState:&v111 objects:v144 count:16];
              if (v58)
              {
                id v96 = v57;
                uint64_t v97 = *(void *)v112;
                do
                {
                  for (uint64_t j = 0; j != v58; ++j)
                  {
                    if (*(void *)v112 != v97) {
                      objc_enumerationMutation(v96);
                    }
                    v60 = *(void **)(*((void *)&v111 + 1) + 8 * j);
                    if ([v60 hasIdentifier])
                    {
                      if ([v60 hasURL])
                      {
                        v61 = *(void **)(v95 + 56);
                        v62 = [v60 identifier];
                        v63 = [v61 cachedLocationForResourceWithIdentifier:v62];
                        LODWORD(v61) = v63 == 0;

                        if (v61)
                        {
                          uint64_t v64 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                          {
                            uint64_t v65 = *(void *)(v95 + 32);
                            v66 = [v60 identifier];
                            uint64_t v67 = *(void *)(v95 + 40);
                            uint64_t v68 = *(void *)(v95 + 48);
                            *(_DWORD *)buf = 138544130;
                            uint64_t v137 = v65;
                            __int16 v138 = 2114;
                            v139 = v66;
                            __int16 v140 = 2114;
                            uint64_t v141 = v67;
                            __int16 v142 = 2114;
                            uint64_t v143 = v68;
                            _os_log_impl(&dword_1A2D01000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ Downloading image %{public}@ for message %{public}@:%{public}@", buf, 0x2Au);
                          }
                          dispatch_group_enter(group);
                          v69 = (void *)MEMORY[0x1E4F1CB10];
                          v70 = [v60 uRL];
                          v71 = [v93 resourceDomainURL];
                          v72 = [v69 URLWithString:v70 relativeToURL:v71];

                          v73 = [v72 lastPathComponent];
                          v74 = [v92 stringByAppendingPathComponent:v73];

                          v75 = [MEMORY[0x1E4F28CB8] defaultManager];
                          [v75 removeItemAtPath:v74 error:0];

                          v76 = [ICURLRequest alloc];
                          v77 = [*(id *)(v95 + 32) _storeRequestContext];
                          v78 = [(ICURLRequest *)v76 initWithURL:v72 requestContext:v77];

                          v79 = +[ICURLSessionManager defaultSession];
                          v80 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v74];
                          v104[0] = MEMORY[0x1E4F143A8];
                          v104[1] = 3221225472;
                          v104[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_431;
                          v104[3] = &unk_1E5AC72D8;
                          v109 = &v146;
                          v104[4] = *(void *)(v95 + 32);
                          v104[5] = v60;
                          id v105 = *(id *)(v95 + 56);
                          id v106 = *(id *)(v95 + 64);
                          v110 = v134;
                          id v81 = v74;
                          id v107 = v81;
                          v108 = group;
                          [v79 enqueueDownloadRequest:v78 toDestination:v80 withCompletionHandler:v104];
                        }
                      }
                    }
                  }
                  uint64_t v57 = v96;
                  uint64_t v58 = [v96 countByEnumeratingWithState:&v111 objects:v144 count:16];
                }
                while (v58);
              }
            }
            uint64_t v55 = [obj countByEnumeratingWithState:&v115 objects:v145 count:16];
          }
          while (v55);
        }

        v82 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2;
        block[3] = &unk_1E5AC7378;
        v83 = *(void **)(v95 + 40);
        void block[4] = *(void *)(v95 + 32);
        v102 = v134;
        id v99 = v83;
        id v100 = *(id *)(v95 + 48);
        id v101 = *(id *)(v95 + 72);
        v103 = &v146;
        dispatch_group_notify(group, v82, block);

        _Block_object_dispose(v134, 8);
        _Block_object_dispose(&v146, 8);

LABEL_39:
        id v6 = 0;
        goto LABEL_40;
      }
      v36 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = *(void *)(a1 + 32);
        uint64_t v38 = *(void **)(a1 + 40);
        uint64_t v39 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v137 = v37;
        __int16 v138 = 2114;
        v139 = v38;
        __int16 v140 = 2114;
        uint64_t v141 = v39;
        _os_log_impl(&dword_1A2D01000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Downloading template file for message %{public}@:%{public}@", buf, 0x20u);
      }

      dispatch_group_enter(group);
      long long v40 = (void *)MEMORY[0x1E4F1CB10];
      long long v41 = [*(id *)(a1 + 56) applicationMessage];
      long long v42 = [v41 templateURL];
      long long v43 = [v93 resourceDomainURL];
      uint64_t v33 = [v40 URLWithString:v42 relativeToURL:v43];

      long long v44 = [v33 lastPathComponent];
      long long v45 = [v92 stringByAppendingPathComponent:v44];

      long long v46 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v46 removeItemAtPath:v45 error:0];

      long long v47 = [ICURLRequest alloc];
      long long v48 = [*(id *)(a1 + 32) _storeRequestContext];
      long long v49 = [(ICURLRequest *)v47 initWithURL:v33 requestContext:v48];

      long long v50 = +[ICURLSessionManager defaultSession];
      long long v51 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v45];
      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v119[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_429;
      v119[3] = &unk_1E5AC72B0;
      uint64_t v52 = *(void *)(a1 + 32);
      v124 = &v146;
      v119[4] = v52;
      id v120 = *(id *)(a1 + 56);
      id v121 = *(id *)(a1 + 64);
      v125 = v134;
      id v53 = v45;
      id v122 = v53;
      v123 = group;
      [v50 enqueueDownloadRequest:v49 toDestination:v51 withCompletionHandler:v119];
    }
    goto LABEL_15;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_40:
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_426(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to download web archive for message %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_427;
    v11[3] = &unk_1E5ACD880;
    uint64_t v13 = *(void *)(a1 + 80);
    id v12 = *(id *)(a1 + 56);
    dispatch_sync(v10, v11);
    id v6 = v12;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_429(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to download template for message %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_430;
    v11[3] = &unk_1E5ACD880;
    uint64_t v13 = *(void *)(a1 + 80);
    id v12 = *(id *)(a1 + 56);
    dispatch_sync(v10, v11);
    id v6 = v12;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_431(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a3);
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [*(id *)(a1 + 40) identifier];
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      uint64_t v21 = v8;
      __int16 v22 = 2114;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      uint64_t v25 = v10;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to download image %{public}@ for message %{public}@. err=%{public}@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_432;
    block[3] = &unk_1E5ACCC88;
    uint64_t v17 = *(void *)(a1 + 88);
    id v12 = *(id *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v15 = v12;
    uint64_t v16 = v13;
    dispatch_sync(v11, block);
    id v6 = v15;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    uint64_t v19 = v3;
    __int16 v20 = 1024;
    int v21 = v4;
    __int16 v22 = 2114;
    uint64_t v23 = v5;
    __int16 v24 = 2114;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Downloaded %d resources for message %{public}@:%{public}@", buf, 0x26u);
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    uint64_t v7 = [ICAsyncBlockOperation alloc];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_433;
    id v12 = &unk_1E5AC7350;
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 56);
    long long v17 = *(_OWORD *)(a1 + 64);
    uint64_t v8 = [(ICAsyncBlockOperation *)v7 initWithStartHandler:&v9];
    [(ICAsyncBlockOperation *)v8 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.setShouldDownloadResources", v9, v10, v11, v12, v13];
    [*(id *)(*(void *)(a1 + 32) + 8) addOperation:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_433(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(v4 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2_434;
  v10[3] = &unk_1E5AC7328;
  v10[4] = v4;
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v11 = v3;
  id v12 = v8;
  long long v13 = *(_OWORD *)(a1 + 64);
  id v9 = v3;
  [v6 getMessageEntryWithIdentifier:v5 bundleIdentifier:v7 completion:v10];
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2_434(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v8;
      __int16 v24 = 2114;
      id v25 = v5;
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to fetch message %{public}@ to update with cached resource locations. err=%{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_435;
    v20[3] = &unk_1E5ACADD0;
    id v10 = v5;
    id v21 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:v20];
    [v10 setDidCacheRequiredResources:1];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2_437;
    v15[3] = &unk_1E5AC7300;
    v15[4] = v11;
    id v16 = v10;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    id v18 = v13;
    uint64_t v19 = v14;
    id v17 = *(id *)(a1 + 40);
    [v12 updateMessageEntry:v16 completion:v15];
  }
}

uint64_t __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_435(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setCacheLocation:a3 forResourceWithIdentifier:a2];
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2_437(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to update resource cache locations for message %{public}@. err=%{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 48) finishWithError:v3];
  uint64_t v7 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v7 postNotificationName:@"com.apple.itunescloud.ICInAppMessagesDidChangeDistributedNotification" object:0];
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_432(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v1 setObject:v2 forKey:v3];
}

uint64_t __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_430(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:*(void *)(a1 + 32) forKey:@"ICInAppMessageEntryResourceIdentifierTemplate"];
}

uint64_t __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_427(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:*(void *)(a1 + 32) forKey:@"ICInAppMessageEntryResourceIdentifierWebArchive"];
}

- (void)_checkForMessageResourcesNeedingDownloadForcingIfNecessary:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 || ![(NSOperationQueue *)self->_downloadOperationQueue operationCount])
  {
    uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = self;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Initiating downloads for messages marked for caching", buf, 0xCu);
    }

    uint64_t v5 = [ICAsyncBlockOperation alloc];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke;
    v7[3] = &unk_1E5ACA1A0;
    v7[4] = self;
    uint64_t v6 = [(ICAsyncBlockOperation *)v5 initWithStartHandler:v7];
    [(ICAsyncBlockOperation *)v6 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.downloadMessageResources"];
    [(NSOperationQueue *)self->_downloadOperationQueue addOperation:v6];
  }
}

void __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_2;
  v7[3] = &unk_1E5AC7288;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 getAllMessageEntriesWithCompletion:v7];
}

void __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v7;
      __int16 v32 = 2114;
      id v33 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to load messages to check for downloads. err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v6 = dispatch_group_create();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v13 shouldDownloadResources])
          {
            dispatch_group_enter(v6);
            uint64_t v14 = *(void **)(a1 + 32);
            id v15 = [v13 applicationMessage];
            id v16 = [v15 identifier];
            id v17 = [v13 bundleIdentifier];
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_416;
            v23[3] = &unk_1E5ACC7B0;
            __int16 v24 = v6;
            [v14 _downloadResourcesForMessageWithIdentifier:v16 bundleIdentifier:v17 completion:v23];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    id v18 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_2_417;
    block[3] = &unk_1E5ACD750;
    id v22 = *(id *)(a1 + 40);
    dispatch_group_notify(v6, v18, block);

    id v5 = 0;
    id v4 = v19;
  }
}

void __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_416(uint64_t a1)
{
}

uint64_t __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_2_417(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:0];
}

- (void)_updateShouldDownloadResources:(BOOL)a3 onMessageWithIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [ICAsyncBlockOperation alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke;
  v18[3] = &unk_1E5AC6FE0;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  BOOL v22 = a3;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = [(ICAsyncBlockOperation *)v13 initWithStartHandler:v18];
  [(ICAsyncBlockOperation *)v17 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.setShouldDownloadResources"];
  [(NSOperationQueue *)self->_operationQueue addOperation:v17];
}

void __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v4 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2;
  v10[3] = &unk_1E5AC7260;
  v10[4] = v4;
  id v11 = v7;
  id v12 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 56);
  id v13 = v3;
  id v14 = v8;
  char v15 = *(unsigned char *)(a1 + 64);
  id v9 = v3;
  [v6 getMessageEntryWithIdentifier:v5 bundleIdentifier:v11 completion:v10];
}

void __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to fetch message %{public}@:%{public}@ to set the download setting on. err=%{public}@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 56) finishWithError:v6];
  }
  else
  {
    [v5 setShouldDownloadResources:*(unsigned __int8 *)(a1 + 72)];
    if (!*(unsigned char *)(a1 + 72)) {
      [v5 clearCachedResources];
    }
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke_412;
    v13[3] = &unk_1E5AC9FC8;
    void v13[4] = v11;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 56);
    [v12 updateMessageEntry:v5 completion:v13];
  }
}

void __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke_412(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138544130;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to update message %{public}@:%{public}@ with the updated download setting. err=%{public}@", (uint8_t *)&v8, 0x2Au);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 56) finishWithError:v3];
}

uint64_t __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke_408(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (void)_handleICInAppMessagesDidChangeDistributedNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"ICInAppMessagesDidChangeNotification" object:self];
}

- (void)_removeAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messageStore = self->_messageStore;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke;
  v11[3] = &unk_1E5ACC400;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ICInAppMessageStore *)messageStore getAllMessageEntriesForBundleIdentifier:v10 completion:v11];
}

void __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v43 = v7;
      __int16 v44 = 2114;
      id v45 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to gather messages to remove - some additional cleanup will be skipped. err=%{public}@", buf, 0x16u);
    }
  }
  int v8 = +[ICDeviceInfo currentDeviceInfo];
  char v9 = [v8 isMac];

  id v10 = (void *)&unk_1A3032000;
  if ((v9 & 1) == 0)
  {
    id v27 = v5;
    id v28 = v4;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v4;
    uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v16 = [v15 applicationMessage];
          id v17 = [v16 identifier];

          if ([v17 hasPrefix:@"ams"])
          {
            id v18 = v17;
          }
          else
          {
            id v18 = [NSString stringWithFormat:@"ams_%@", v17];
          }
          uint64_t v19 = v18;
          +[ICInAppMessageUserNotificationCoordinator removeNotificationWithIdentifier:v18 forBundleIdentifier:*(void *)(a1 + 40)];
          if ([v15 isBadgingApplication])
          {
            __int16 v20 = [v15 applicationMessage];
            uint64_t v21 = [v20 applicationBadge];

            __int16 v22 = [v21 bundleIdentifier];
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_405;
            v34[3] = &unk_1E5ACC788;
            id v35 = *(id *)(a1 + 40);
            id v36 = v21;
            id v23 = v21;
            +[ICInAppMessageUserNotificationCoordinator removeBadgeIconForBundleIdentifier:v22 completion:v34];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v12);
    }

    id v5 = v27;
    id v4 = v28;
    id v10 = &unk_1A3032000;
  }
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = *(void **)(a1 + 40);
  uint64_t v26 = *(void **)(v24 + 40);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = v10[316];
  v31[2] = __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_406;
  v31[3] = &unk_1E5ACB578;
  v31[4] = v24;
  id v32 = v25;
  id v33 = *(id *)(a1 + 48);
  [v26 removeAllMessageEntriesForBundleIdentifier:v32 completion:v31];
}

void __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_405(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = [*(id *)(a1 + 40) identifier];
      int v7 = 138543874;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Failed to remove badge for application with bundleId=%{public}@ and badgeId=%{public}@. err=%{public}@", (uint8_t *)&v7, 0x20u);
    }
  }
}

void __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_406(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v5;
      __int16 v18 = 2114;
      uint64_t v19 = v6;
      __int16 v20 = 2114;
      id v21 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove messages for bundle identifier %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  __int16 v9 = *(void **)(v7 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_407;
  v12[3] = &unk_1E5ACB550;
  v12[4] = v7;
  id v13 = v8;
  id v10 = *(id *)(a1 + 48);
  id v14 = v3;
  id v15 = v10;
  id v11 = v3;
  [v9 removeAllMetadataForBundleIdentifier:v13 completion:v12];
}

void __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_407(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v10 = 138543874;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove message metadata for bundle identifier %{public}@. err=%{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v7 = [*(id *)(a1 + 32) _resourceCacheDirectoryPath];
  uint64_t v8 = [v7 stringByAppendingPathComponent:*(void *)(a1 + 40)];

  __int16 v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v9 removeItemAtPath:v8 error:0];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  messageStore = self->_messageStore;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5AC6F90;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(ICInAppMessageStore *)messageStore getMessageEntryWithIdentifier:v14 bundleIdentifier:v13 completion:v15];
}

void __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v8;
      __int16 v32 = 2114;
      id v33 = v9;
      __int16 v34 = 2114;
      id v35 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to fetch with message with identifier:  %{public}@. err=%{public}@. Will not remove badge.", buf, 0x20u);
    }
  }
  id v10 = +[ICDeviceInfo currentDeviceInfo];
  char v11 = [v10 isMac];

  if ((v11 & 1) == 0)
  {
    if ([*(id *)(a1 + 40) hasPrefix:@"ams"])
    {
      id v12 = *(id *)(a1 + 40);
    }
    else
    {
      id v12 = [NSString stringWithFormat:@"ams_%@", *(void *)(a1 + 40)];
    }
    id v13 = v12;
    id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v15;
      __int16 v32 = 2114;
      id v33 = v13;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ removing user notifications with identifier %{public}@", buf, 0x16u);
    }

    +[ICInAppMessageUserNotificationCoordinator removeNotificationWithIdentifier:v13 forBundleIdentifier:*(void *)(a1 + 48)];
    if ([v5 isBadgingApplication])
    {
      id v16 = [v5 applicationMessage];
      id v17 = [v16 applicationBadge];

      id v18 = [v17 bundleIdentifier];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_402;
      v28[3] = &unk_1E5ACC7B0;
      id v29 = v17;
      id v19 = v17;
      +[ICInAppMessageUserNotificationCoordinator removeBadgeIconForBundleIdentifier:v18 completion:v28];
    }
  }
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = *(void **)(a1 + 40);
  uint64_t v22 = *(void **)(v20 + 40);
  uint64_t v23 = *(void *)(a1 + 48);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_403;
  v24[3] = &unk_1E5ACB550;
  v24[4] = v20;
  id v25 = v21;
  id v26 = *(id *)(a1 + 48);
  id v27 = *(id *)(a1 + 56);
  [v22 removeMessageEntryWithIdentifier:v25 forBundleIdentifier:v23 completion:v24];
}

void __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_402(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) bundleIdentifier];
      id v6 = [*(id *)(a1 + 32) identifier];
      int v7 = 138543874;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Failed to remove badge for application with bundleId=%{public}@ and badgeId=%{public}@. err=%{public}@", (uint8_t *)&v7, 0x20u);
    }
  }
}

void __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_403(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v5;
      __int16 v20 = 2114;
      uint64_t v21 = v6;
      __int16 v22 = 2114;
      id v23 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove message %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  __int16 v9 = *(void **)(v7 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_404;
  v13[3] = &unk_1E5AC9FC8;
  void v13[4] = v7;
  id v14 = v8;
  id v15 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v16 = v3;
  id v17 = v11;
  id v12 = v3;
  [v9 removeMetadataForMessageIdentifier:v14 bundleIdentifier:v10 completion:v13];
}

void __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_404(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v11 = 138543874;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      id v16 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove message metadata for identifier %{public}@. err=%{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v7 = [*(id *)(a1 + 32) _resourceCacheDirectoryPath];
  uint64_t v8 = [v7 stringByAppendingPathComponent:*(void *)(a1 + 48)];
  __int16 v9 = [v8 stringByAppendingPathComponent:*(void *)(a1 + 40)];

  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v10 removeItemAtPath:v9 error:0];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_addMessageEntry:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 applicationMessage];
  if ([v8 hasAssetPrefetchStrategy]
    && [v8 assetPrefetchStrategy] == 1)
  {
    [v6 setShouldDownloadResources:1];
  }
  __int16 v9 = self;
  messageStore = v9->_messageStore;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__ICInAppMessageManager__addMessageEntry_completion___block_invoke;
  v15[3] = &unk_1E5ACB550;
  id v16 = v9;
  id v17 = v8;
  id v18 = v6;
  id v19 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  uint64_t v14 = v9;
  [(ICInAppMessageStore *)messageStore addMessageEntry:v12 completion:v15];
}

void __53__ICInAppMessageManager__addMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  if (!v3)
  {
    id v7 = [*(id *)(a1 + 40) applicationBadge];
    os_log_t v5 = v7;
    if (v7 && [v7 hasBundleIdentifier])
    {
      uint64_t v8 = [v5 bundleIdentifier];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __53__ICInAppMessageManager__addMessageEntry_completion___block_invoke_384;
      v51[3] = &unk_1E5ACC788;
      uint64_t v52 = v5;
      id v53 = *(id *)(a1 + 48);
      +[ICInAppMessageUserNotificationCoordinator addBadgeIconForBundleIdentifier:v8 completion:v51];
    }
    id v6 = [*(id *)(a1 + 40) localNotification];
    if (!v6) {
      goto LABEL_41;
    }
    __int16 v9 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 138543618;
      id v59 = v4;
      __int16 v60 = 2114;
      v61 = v10;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing local user notification in message %{public}@", buf, 0x16u);
    }
    id v11 = objc_alloc(MEMORY[0x1E4F4E278]);
    id v12 = [*(id *)(a1 + 48) bundleIdentifier];
    v66[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
    uint64_t v14 = (void *)[v11 initWithBundleIDs:v13 states:*MEMORY[0x1E4F4E220]];

    __int16 v15 = [*(id *)(a1 + 48) bundleIdentifier];
    LOBYTE(v13) = [v14 applicationStateForApplication:v15];

    [v14 invalidate];
    if ((v13 & 8) != 0)
    {
      id v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [*(id *)(a1 + 40) identifier];
        *(_DWORD *)buf = 138543618;
        id v59 = v4;
        __int16 v60 = 2114;
        v61 = v28;
        _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Not posting local notification in message %{public}@ because the target app is in the foreground", buf, 0x16u);
      }
      goto LABEL_40;
    }
    id v16 = [v6 notification];
    if (!v16)
    {
      id v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [*(id *)(a1 + 40) identifier];
        *(_DWORD *)buf = 138543618;
        id v59 = v4;
        __int16 v60 = 2114;
        v61 = v29;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring local notification in message %{public}@ because the notification string was not provided", buf, 0x16u);
      }
      goto LABEL_39;
    }
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:0];
    long long v48 = (void *)v17;
    long long v49 = v16;
    if (v17)
    {
      id v50 = 0;
      id v18 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v17 options:0 error:&v50];
      id v19 = v50;
      if (v18)
      {
        uint64_t v47 = [*(id *)(a1 + 48) bundleIdentifier];
        if (v47)
        {
          id v45 = v19;
          __int16 v20 = _ICLogCategoryDefault_Oversize();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v59 = v4;
            __int16 v60 = 2114;
            v61 = v18;
            _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Extracted notification content: %{public}@", buf, 0x16u);
          }
          uint64_t v46 = v18;

          long long v42 = +[ICUserIdentityStore defaultIdentityStore];
          uint64_t v21 = +[ICUserIdentity activeAccount];
          __int16 v22 = [v42 DSIDForUserIdentity:v21 outError:0];
          uint64_t v23 = [v22 stringValue];

          __int16 v44 = (void *)v23;
          if (v23)
          {
            v54[0] = @"0";
            v54[1] = @"1";
            v55[0] = v23;
            v55[1] = &unk_1EF6407C8;
            v54[2] = @"2";
            v54[3] = @"aps";
            v55[2] = v47;
            v55[3] = v46;
            uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
            id v25 = v55;
            id v26 = v54;
            uint64_t v27 = 4;
          }
          else
          {
            id v35 = _ICLogCategoryDefault();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = +[ICUserIdentity activeAccount];
              *(_DWORD *)buf = 138543618;
              id v59 = v4;
              __int16 v60 = 2114;
              v61 = v36;
              _os_log_impl(&dword_1A2D01000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Could not get DSID for userIdentity=%{public}@.", buf, 0x16u);
            }
            v56[0] = @"1";
            v56[1] = @"2";
            v57[0] = &unk_1EF6407C8;
            v57[1] = v47;
            v56[2] = @"aps";
            v57[2] = v46;
            uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
            id v25 = v57;
            id v26 = v56;
            uint64_t v27 = 3;
          }
          uint64_t v37 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:v27];
          long long v38 = [*(id *)(a1 + 48) bundleIdentifier];
          uint64_t v43 = v37;
          BOOL v39 = +[ICInAppMessageUserNotificationCoordinator scheduleNotificationWithPayload:v37 forBundleIdentifier:v38];

          if (!v39)
          {
            long long v40 = _ICLogCategoryDefault_Oversize();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              long long v41 = [*(id *)(a1 + 40) identifier];
              *(_DWORD *)buf = 138543874;
              id v59 = v4;
              __int16 v60 = 2114;
              v61 = v41;
              __int16 v62 = 2114;
              v63 = v49;
              _os_log_impl(&dword_1A2D01000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to process notification for message %{public}@. payload=%{public}@", buf, 0x20u);
            }
          }

          id v19 = v45;
          id v18 = v46;
          id v33 = v43;
        }
        else
        {
          id v33 = _ICLogCategoryDefault();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            __int16 v34 = *(NSObject **)(a1 + 48);
            *(_DWORD *)buf = 138543618;
            id v59 = v4;
            __int16 v60 = 2114;
            v61 = v34;
            _os_log_impl(&dword_1A2D01000, v33, OS_LOG_TYPE_ERROR, "%{public}@ Skipping notification for messageEntry=%{public}@ as there is no bundleIdentifier", buf, 0x16u);
          }
        }

        os_log_t v30 = (os_log_t)v47;
LABEL_38:

        id v16 = v49;
LABEL_39:

LABEL_40:
        goto LABEL_41;
      }
    }
    else
    {
      id v19 = 0;
    }
    os_log_t v30 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) identifier];
      __int16 v32 = v31 = v19;
      *(_DWORD *)buf = 138544130;
      id v59 = v4;
      __int16 v60 = 2114;
      v61 = v32;
      __int16 v62 = 2114;
      v63 = v31;
      __int16 v64 = 2114;
      uint64_t v65 = v49;
      _os_log_impl(&dword_1A2D01000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to parse notification for message %{public}@. err=%{public}@, payload=%{public}@", buf, 0x2Au);

      id v19 = v31;
    }
    id v18 = 0;
    goto LABEL_38;
  }
  os_log_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 40) identifier];
    *(_DWORD *)buf = 138543874;
    id v59 = v4;
    __int16 v60 = 2114;
    v61 = v6;
    __int16 v62 = 2114;
    v63 = v3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to add message %{public}@. err=%{public}@", buf, 0x20u);
LABEL_41:
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __53__ICInAppMessageManager__addMessageEntry_completion___block_invoke_384(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
      id v6 = [*(id *)(a1 + 32) identifier];
      int v7 = 138543874;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Failed to badge application with bundleId=%{public}@ and badgeId=%{public}@. err=%{public}@", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) setIsBadgingApplication:1];
  }
}

- (void)_processSyncResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messageStore = self->_messageStore;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke;
  v11[3] = &unk_1E5AC71E8;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(ICInAppMessageStore *)messageStore getStorePropertyForKey:@"serverRevision" completion:v11];
}

void __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v46 = v5;
  id v47 = a3;
  if (v47)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = a1[4];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v47;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to get current server revision from message store. err=%{public}@", buf, 0x16u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v77 = __Block_byref_object_copy__2541;
    v78 = __Block_byref_object_dispose__2542;
    id v79 = 0;
    uint64_t v8 = [v5 longLongValue];
    unint64_t v48 = 0;
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    char v67 = 0;
    id v9 = "com.apple.amp.iTunesCloud";
    id v10 = "Default";
    while (1)
    {
      unint64_t v11 = [a1[5] applicationMessageSyncResponsesCount];
      uint64_t v12 = *(void *)(*(void *)&buf[8] + 40);
      if (v48 >= v11) {
        break;
      }
      if (v12) {
        goto LABEL_32;
      }
      id v13 = [a1[5] applicationMessageSyncResponsesAtIndex:v48];
      long long v49 = [v13 bundleID];
      for (unint64_t i = 0; i < [v13 syncCommandsCount] && !*(void *)(*(void *)&buf[8] + 40); ++i)
      {
        __int16 v15 = [v13 syncCommandsAtIndex:i];
        if ([v15 commandSerialNumber] <= v8)
        {
          log = os_log_create(v9, v10);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            id v25 = a1[4];
            uint64_t v26 = [v15 commandSerialNumber];
            *(_DWORD *)uint64_t v68 = 138543874;
            id v69 = v25;
            __int16 v70 = 2048;
            uint64_t v71 = v26;
            __int16 v72 = 2048;
            uint64_t v73 = v8;
            _os_log_impl(&dword_1A2D01000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring sync command we've already applied (serial# %lld, currentRevision=%lld)", v68, 0x20u);
          }
        }
        else
        {
          log = [v15 applicationMessage];
          id v16 = os_log_create(v9, v10);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v50 = i;
            uint64_t v17 = v13;
            id v18 = v10;
            id v19 = v9;
            __int16 v20 = a1;
            id v21 = a1[4];
            uint64_t v22 = [v15 commandSerialNumber];
            uint64_t v23 = [v15 commandType];
            if (v23 >= 4)
            {
              uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23, v46);
            }
            else
            {
              uint64_t v24 = *(&off_1E5AC73E8 + v23);
            }
            id v27 = v24;
            id v28 = [log identifier];
            *(_DWORD *)uint64_t v68 = 138544130;
            id v69 = v21;
            __int16 v70 = 2048;
            uint64_t v71 = v22;
            __int16 v72 = 2114;
            uint64_t v73 = (uint64_t)v27;
            __int16 v74 = 2114;
            v75 = v28;
            _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing sync command #%lld: %{public}@ %{public}@", v68, 0x2Au);

            a1 = v20;
            id v9 = v19;
            id v10 = v18;
            id v13 = v17;
            unint64_t i = v50;
          }
          switch([v15 commandType])
          {
            case 0u:
              id v29 = [[ICInAppMessageEntry alloc] initWithApplicationMessage:log bundleIdentifier:v49];
              dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
              id v31 = a1[4];
              v61[0] = MEMORY[0x1E4F143A8];
              v61[1] = 3221225472;
              v61[2] = __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_380;
              v61[3] = &unk_1E5AC7198;
              __int16 v32 = v29;
              __int16 v62 = v32;
              __int16 v64 = v66;
              uint64_t v65 = buf;
              id v33 = v30;
              v63 = v33;
              [v31 _addMessageEntry:v32 completion:v61];
              dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);

              goto LABEL_23;
            case 1u:
              dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
              id v35 = a1[4];
              uint64_t v36 = [log identifier];
              v58[0] = MEMORY[0x1E4F143A8];
              v58[1] = 3221225472;
              v58[2] = __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_2;
              v58[3] = &unk_1E5AC7D98;
              __int16 v60 = buf;
              __int16 v32 = v34;
              id v59 = v32;
              [v35 _removeMessageEntryWithIdentifier:v36 forBundleIdentifier:v49 completion:v58];

              dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
              id v33 = v59;
              goto LABEL_23;
            case 2u:
              dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
              id v38 = a1[4];
              v55[0] = MEMORY[0x1E4F143A8];
              v55[1] = 3221225472;
              v55[2] = __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_3;
              v55[3] = &unk_1E5AC7D98;
              uint64_t v57 = buf;
              __int16 v32 = v37;
              v56 = v32;
              [v38 _removeAllMessageEntriesForBundleIdentifier:v49 completion:v55];
              dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
              id v33 = v56;
LABEL_23:

              break;
            case 3u:
              [a1[4] resetMessagesWithCompletion:&__block_literal_global_382];
              break;
            default:
              break;
          }
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            BOOL v39 = os_log_create(v9, v10);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              id v40 = a1[4];
              uint64_t v41 = *(void *)(*(void *)&buf[8] + 40);
              *(_DWORD *)uint64_t v68 = 138543618;
              id v69 = v40;
              __int16 v70 = 2114;
              uint64_t v71 = v41;
              _os_log_impl(&dword_1A2D01000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to process sync command. err=%{public}@", v68, 0x16u);
            }
          }
        }

        uint64_t v8 = [v15 commandSerialNumber];
      }

      ++v48;
    }
    if (v12)
    {
LABEL_32:
      (*((void (**)(void))a1[6] + 2))();
      goto LABEL_33;
    }
    long long v42 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = a1[4];
      *(_DWORD *)uint64_t v68 = 138543618;
      id v69 = v43;
      __int16 v70 = 2048;
      uint64_t v71 = v8;
      _os_log_impl(&dword_1A2D01000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished processing sync commands. currentSyncRevision=%lld", v68, 0x16u);
    }

    __int16 v44 = (void *)*((void *)a1[4] + 5);
    id v45 = [NSNumber numberWithLongLong:v8];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_383;
    v52[3] = &unk_1E5AC71C0;
    id v53 = a1[6];
    long long v54 = v66;
    v52[4] = a1[4];
    [v44 updateStoreProperty:v45 forKey:@"serverRevision" completion:v52];

LABEL_33:
    _Block_object_dispose(v66, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_380(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldDownloadResources]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_383(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) _checkForMessageResourcesNeedingDownloadForcingIfNecessary:1];
  }
  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v2 postNotificationName:@"com.apple.itunescloud.ICInAppMessagesDidChangeDistributedNotification" object:0];
}

- (void)_performSyncWithCompletion:(id)a3
{
  id v4 = a3;
  messageStore = self->_messageStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD8E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICInAppMessageStore *)messageStore updateStoreProperty:MEMORY[0x1E4F1CC38] forKey:@"syncPending" completion:v7];
}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update sync pending flag. err=%{public}@", buf, 0x16u);
    }
  }
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  id v7 = +[ICUserIdentity activeAccount];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_372;
  v9[3] = &unk_1E5AC7170;
  id v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [v6 getPropertiesForUserIdentity:v7 completionHandler:v9];
}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_372(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v8;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to get properties for active account for sync. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_15;
  }
  if (!v5)
  {
    __int16 v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Not performing sync because there's no active account", buf, 0xCu);
    }

    uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_373;
    v21[3] = &unk_1E5ACAC90;
    id v22 = *(id *)(a1 + 40);
    [v15 updateStoreProperty:MEMORY[0x1E4F1CC28] forKey:@"syncPending" completion:v21];
    id v16 = v22;
    goto LABEL_14;
  }
  if (![*(id *)(a1 + 32) _privacyAcknowledgementRequired])
  {
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(v17 + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_374;
    v19[3] = &unk_1E5AC7058;
    v19[4] = v17;
    id v20 = *(id *)(a1 + 40);
    [v18 getStorePropertyForKey:@"serverRevision" completion:v19];
    id v16 = v20;
LABEL_14:

    goto LABEL_15;
  }
  id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v10;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Not syncing because privacy acknowledgement is required", buf, 0xCu);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7007 userInfo:0];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

LABEL_15:
}

uint64_t __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_373(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_374(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to get current server revision from message store. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v11 = [NSNumber numberWithLongLong:(uint64_t)v9];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_375;
    v15[3] = &unk_1E5ACB578;
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(a1 + 40);
    id v16 = v12;
    uint64_t v17 = v13;
    id v18 = v14;
    [v10 updateStoreProperty:v11 forKey:@"lastSyncAttempt" completion:v15];
  }
}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_375(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) longLongValue];
  id v3 = [*(id *)(a1 + 40) _storeRequestContext];
  id v4 = [[ICInAppMessageSyncRequest alloc] initWithStoreRequestContext:v3 fromRevision:v2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5AC7148;
  id v5 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [(ICInAppMessageSyncRequest *)v4 performRequestWithResponseHandler:v6];
}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Sync request failed. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_377;
    v9[3] = &unk_1E5ACD8E0;
    v9[4] = v8;
    id v10 = *(id *)(a1 + 40);
    [v8 _processSyncResponse:a2 completion:v9];
  }
}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_377(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Sync completed. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_378;
  v9[3] = &unk_1E5ACD8E0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  [v6 updateStoreProperty:MEMORY[0x1E4F1CC28] forKey:@"syncPending" completion:v9];
}

uint64_t __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_378(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_storeRequestContext
{
  id v3 = [ICStoreRequestContext alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__ICInAppMessageManager__storeRequestContext__block_invoke;
  v6[3] = &unk_1E5ACC698;
  v6[4] = self;
  id v4 = [(ICStoreRequestContext *)v3 initWithBlock:v6];

  return v4;
}

void __45__ICInAppMessageManager__storeRequestContext__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[ICUserIdentity activeAccount];
  [v5 setIdentity:v3];

  [v5 setIdentityStore:*(void *)(*(void *)(a1 + 32) + 48)];
  id v4 = [(ICURLResponseAuthenticationProvider *)[ICStoreURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:1];
  [v5 setAuthenticationProvider:v4];

  [v5 setAllowsExpiredBags:1];
  [v5 setPersonalizationStyle:2];
}

- (void)_schedulePeriodicUpdate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke;
  v2[3] = &unk_1E5AC7120;
  v2[4] = self;
  [(ICInAppMessageManager *)self _loadConfigurationWithCompletion:v2];
}

void __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [a2 syncPollingInterval];
  id v4 = +[ICDefaults standardDefaults];
  char v5 = [v4 bypassBagSanityChecks];

  int64_t v6 = *MEMORY[0x1E4F141E8];
  if ((v5 & 1) == 0 && v3 < v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      int64_t v17 = v3;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Adjusting bag refresh interval of %llds --> 7 days", buf, 0x16u);
    }

    int64_t v3 = *MEMORY[0x1E4F14228];
  }
  if (v3 >= v6) {
    int64_t v9 = *MEMORY[0x1E4F141F8];
  }
  else {
    int64_t v9 = 10;
  }
  id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v11;
    __int16 v16 = 2048;
    int64_t v17 = v3;
    __int16 v18 = 2048;
    int64_t v19 = v9;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting timer to perform periodic poll for %llds (+/- %llds)", buf, 0x20u);
  }

  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_int64(v12, (const char *)*MEMORY[0x1E4F141C8], v3);
  xpc_dictionary_set_int64(v12, (const char *)*MEMORY[0x1E4F141A8], v9);
  xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x1E4F14340], 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_365;
  handler[3] = &unk_1E5ACA240;
  handler[4] = *(void *)(a1 + 32);
  xpc_activity_register("com.apple.itunescloud.ICInAppMessageManager.periodic-poll-activity", v12, handler);
}

uint64_t __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_365(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing periodic sync", buf, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_366;
  v6[3] = &unk_1E5ACC7B0;
  v6[4] = v4;
  return [v4 flushEventsWithCompletion:v6];
}

uint64_t __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_366(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_2;
  v3[3] = &unk_1E5ACC7B0;
  v3[4] = v1;
  return [v1 syncMessagesWithCompletion:v3];
}

void __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Periodic sync completed. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) _performCacheConsistencyCheck];
  [*(id *)(a1 + 32) _schedulePeriodicUpdate];
}

void __45__ICInAppMessageManager__xpcClientConnection__block_invoke_362(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "Connection to in-app message service invalidated", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = 0;
}

void __45__ICInAppMessageManager__xpcClientConnection__block_invoke()
{
  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A2D01000, v0, OS_LOG_TYPE_DEFAULT, "Connection to in-app message service interrupted", v1, 2u);
  }
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = [ICAsyncBlockOperation alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke;
  v6[3] = &unk_1E5ACA1A0;
  v6[4] = self;
  uint64_t v5 = [(ICAsyncBlockOperation *)v4 initWithStartHandler:v6];
  [(ICAsyncBlockOperation *)v5 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.handleAccountChange"];
  [(NSOperationQueue *)self->_operationQueue addOperation:v5];
}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v5 = +[ICUserIdentity activeAccount];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_2;
  v8[3] = &unk_1E5AC70F8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v4 getPropertiesForUserIdentity:v5 completionHandler:v8];
}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get account properties. err=%{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    __int16 v8 = *(void **)(*(void *)(a1 + 40) + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_258;
    v11[3] = &unk_1E5AC70D0;
    id v12 = *(id *)(a1 + 32);
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 40);
    id v13 = v9;
    uint64_t v14 = v10;
    [v8 getStorePropertyForKey:@"accountDSID" completion:v11];
  }
}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_258(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get message store account property. err=%{public}@", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 32);
    id v8 = v5;
    goto LABEL_7;
  }
  uint64_t v9 = [a2 longLongValue];
  uint64_t v10 = [*(id *)(a1 + 40) DSID];
  uint64_t v11 = [v10 longLongValue];

  if (v11 == v9)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = 0;
LABEL_7:
    [v7 finishWithError:v8];
    goto LABEL_8;
  }
  id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    id v20 = v13;
    __int16 v21 = 2048;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = v11;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ account changed from %lld --> %lld - performing reset", buf, 0x20u);
  }

  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void **)(v14 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_259;
  v16[3] = &unk_1E5AC70A8;
  v16[4] = v14;
  id v17 = *(id *)(a1 + 32);
  uint64_t v18 = v11;
  [v15 resetStoreWithCompletion:v16];

LABEL_8:
}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_259(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to reset message store. err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 40);
    id v7 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_261;
    v9[3] = &unk_1E5ACC788;
    id v8 = *(void **)(a1 + 40);
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v6 updateStoreProperty:v7 forKey:@"accountDSID" completion:v9];
  }
}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_261(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update message store account property. err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_262;
    v7[3] = &unk_1E5ACC788;
    v7[4] = v6;
    id v8 = *(id *)(a1 + 40);
    [v6 _performSyncWithCompletion:v7];
  }
}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_262(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to sync after the reset. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)removeApplicationBadgeForBundleIdentifier:(id)a3 fromPresentedMessageEntry:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if ([v11 isBadgingApplication])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __104__ICInAppMessageManager_removeApplicationBadgeForBundleIdentifier_fromPresentedMessageEntry_completion___block_invoke;
    v12[3] = &unk_1E5AC9FC8;
    id v13 = v11;
    id v14 = self;
    id v15 = v8;
    id v16 = v13;
    id v17 = v10;
    +[ICInAppMessageUserNotificationCoordinator removeBadgeIconForBundleIdentifier:v15 completion:v12];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __104__ICInAppMessageManager_removeApplicationBadgeForBundleIdentifier_fromPresentedMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) applicationMessage];
  uint64_t v5 = [v4 identifier];

  if (v3)
  {
    int v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      id v20 = v5;
      __int16 v21 = 2114;
      id v22 = v3;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove badge for application with bundleId=%{public}@ and messageId=%{public}@. err=%{public}@", buf, 0x2Au);
    }
  }
  else
  {
    [*(id *)(a1 + 56) setIsBadgingApplication:0];
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __104__ICInAppMessageManager_removeApplicationBadgeForBundleIdentifier_fromPresentedMessageEntry_completion___block_invoke_257;
    v11[3] = &unk_1E5AC7080;
    id v12 = 0;
    id v13 = v9;
    id v14 = v5;
    [v9 updateMessageEntry:v10 completion:v11];

    int v6 = v12;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __104__ICInAppMessageManager_removeApplicationBadgeForBundleIdentifier_fromPresentedMessageEntry_completion___block_invoke_257(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1[4])
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[5];
      uint64_t v6 = a1[6];
      int v7 = 138543874;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update messageEntry for messageId=%{public}@. err=%{public}@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)setProperty:(id)a3 forKey:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a6;
  __int16 v11 = v10;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_4;
    v23[3] = &unk_1E5ACD8E0;
    void v23[4] = self;
    uint64_t v13 = &v24;
    id v24 = v10;
    id v14 = a5;
    id v15 = a4;
    id v16 = a3;
    [(ICInAppMessageStore *)messageStore updateStoreProperty:v16 forKey:v15 bundleIdentifier:v14 completion:v23];
  }
  else
  {
    id v17 = a5;
    id v18 = a4;
    id v19 = a3;
    id v20 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke;
    v27[3] = &unk_1E5ACD8E0;
    v27[4] = self;
    uint64_t v13 = &v28;
    id v21 = v11;
    id v28 = v21;
    id v22 = [v20 remoteObjectProxyWithErrorHandler:v27];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_2;
    v25[3] = &unk_1E5ACD8E0;
    v25[4] = self;
    id v26 = v21;
    [v22 setProperty:v19 forKey:v18 bundleIdentifier:v17 completion:v25];
  }
}

void __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_255;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_5;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_255(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_254;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

uint64_t __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_254(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)setGlobalProperty:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_4;
    v19[3] = &unk_1E5ACD8E0;
    v19[4] = self;
    id v11 = &v20;
    id v20 = v8;
    id v12 = a4;
    id v13 = a3;
    [(ICInAppMessageStore *)messageStore updateStoreProperty:v13 forKey:v12 completion:v19];
  }
  else
  {
    id v14 = a4;
    id v15 = a3;
    uint64_t v16 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke;
    v23[3] = &unk_1E5ACD8E0;
    void v23[4] = self;
    id v11 = &v24;
    id v17 = v9;
    id v24 = v17;
    id v18 = [v16 remoteObjectProxyWithErrorHandler:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_2;
    v21[3] = &unk_1E5ACD8E0;
    void v21[4] = self;
    id v22 = v17;
    [v18 setGlobalProperty:v15 forKey:v14 completion:v21];
  }
}

void __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_253;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_5;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_253(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getGlobalPropertyForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_4;
    v15[3] = &unk_1E5AC7058;
    void v15[4] = self;
    id v9 = &v16;
    id v16 = v6;
    id v10 = a3;
    [(ICInAppMessageStore *)messageStore getStorePropertyForKey:v10 completion:v15];
  }
  else
  {
    id v11 = a3;
    id v12 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke;
    v19[3] = &unk_1E5ACD8E0;
    v19[4] = self;
    id v9 = &v20;
    id v13 = v7;
    id v20 = v13;
    __int16 v14 = [v12 remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_2;
    v17[3] = &unk_1E5AC7058;
    void v17[4] = self;
    id v18 = v13;
    [v14 getGlobalPropertyForKey:v11 completion:v17];
  }
}

void __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_252;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_3;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_5;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_252(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)removeMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_isSystemService)
  {
    id v11 = [ICAsyncBlockOperation alloc];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_4;
    uint64_t v23 = &unk_1E5ACC088;
    id v24 = self;
    id v12 = &v25;
    id v25 = v8;
    id v26 = v9;
    id v27 = v10;
    id v13 = v10;
    id v14 = [(ICAsyncBlockOperation *)v11 initWithStartHandler:&v20];
    [(ICAsyncBlockOperation *)v14 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.clearMetadataForMessageIdentifier", v20, v21, v22, v23, v24];
    [(NSOperationQueue *)self->_operationQueue addOperation:v14];

    id v15 = v26;
  }
  else
  {
    uint64_t v16 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke;
    v30[3] = &unk_1E5ACD8E0;
    v30[4] = self;
    id v12 = &v31;
    id v17 = v10;
    id v31 = v17;
    id v18 = [v16 remoteObjectProxyWithErrorHandler:v30];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2;
    v28[3] = &unk_1E5ACD8E0;
    void v28[4] = self;
    id v29 = v17;
    id v19 = v17;
    [v18 removeMetadataForMessageIdentifier:v8 bundleIdentifier:v9 completion:v28];

    id v15 = v29;
  }
}

void __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_248;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v4 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_5;
  v10[3] = &unk_1E5ACB578;
  v10[4] = v4;
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  [v6 removeMetadataForMessageIdentifier:v5 bundleIdentifier:v7 completion:v10];
}

void __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_6;
  id v10 = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v5;
  id v6 = v3;
  dispatch_async(v4, &v7);
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6, v7, v8, v9, v10);
}

uint64_t __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_248(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)updateMetadata:(id)a3 messageIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_isSystemService)
  {
    __int16 v14 = [ICAsyncBlockOperation alloc];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    id v25 = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_4;
    id v26 = &unk_1E5AC7030;
    id v27 = self;
    id v15 = &v28;
    id v28 = v10;
    id v29 = v11;
    id v30 = v12;
    id v31 = v13;
    id v16 = v13;
    id v17 = [(ICAsyncBlockOperation *)v14 initWithStartHandler:&v23];
    [(ICAsyncBlockOperation *)v17 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.updateMetadata", v23, v24, v25, v26, v27];
    [(NSOperationQueue *)self->_operationQueue addOperation:v17];

    id v18 = v29;
  }
  else
  {
    id v19 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke;
    v34[3] = &unk_1E5ACD8E0;
    void v34[4] = self;
    id v15 = &v35;
    id v20 = v13;
    id v35 = v20;
    uint64_t v21 = [v19 remoteObjectProxyWithErrorHandler:v34];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_2;
    v32[3] = &unk_1E5ACD8E0;
    v32[4] = self;
    id v33 = v20;
    id v22 = v20;
    [v21 updateMetadata:v10 messageIdentifier:v11 bundleIdentifier:v12 completion:v32];

    id v18 = v33;
  }
}

void __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_244;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v4 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_5;
  v11[3] = &unk_1E5ACB578;
  void v11[4] = v4;
  id v9 = *(id *)(a1 + 64);
  id v12 = v3;
  id v13 = v9;
  id v10 = v3;
  [v6 updateMetadata:v5 messageIdentifier:v7 bundleIdentifier:v8 completion:v11];
}

void __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_6;
  id v10 = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v5;
  id v6 = v3;
  dispatch_async(v4, &v7);
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6, v7, v8, v9, v10);
}

uint64_t __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_244(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getAllMetadataForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_4;
    v15[3] = &unk_1E5ACA018;
    void v15[4] = self;
    id v9 = &v16;
    id v16 = v6;
    id v10 = a3;
    [(ICInAppMessageStore *)messageStore getAllMetadataForBundleIdentifiers:v10 completion:v15];
  }
  else
  {
    id v11 = a3;
    id v12 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke;
    v19[3] = &unk_1E5ACD8E0;
    v19[4] = self;
    id v9 = &v20;
    id v13 = v7;
    id v20 = v13;
    __int16 v14 = [v12 remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_2;
    v17[3] = &unk_1E5ACA018;
    void v17[4] = self;
    id v18 = v13;
    [v14 getAllMetadataForBundleIdentifiers:v11 completion:v17];
  }
}

void __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_242;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_3;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_5;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_242(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)getAllMetadataForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = [v6 setWithObject:a3];
  [(ICInAppMessageManager *)self getAllMetadataForBundleIdentifiers:v8 completion:v7];
}

- (void)getMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_4;
    v19[3] = &unk_1E5AC7008;
    v19[4] = self;
    id v11 = &v20;
    id v20 = v8;
    id v12 = a4;
    id v13 = a3;
    [(ICInAppMessageStore *)messageStore getMetadataForMessageIdentifier:v13 bundleIdentifier:v12 completion:v19];
  }
  else
  {
    id v14 = a4;
    id v15 = a3;
    uint64_t v16 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke;
    v23[3] = &unk_1E5ACD8E0;
    void v23[4] = self;
    id v11 = &v24;
    id v17 = v9;
    id v24 = v17;
    id v18 = [v16 remoteObjectProxyWithErrorHandler:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2;
    v21[3] = &unk_1E5AC7008;
    void v21[4] = self;
    id v22 = v17;
    [v18 getMetadataForMessageIdentifier:v15 bundleIdentifier:v14 completion:v21];
  }
}

void __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_239;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  unint64_t v6 = a3;
  id v7 = v5;
  id v8 = (ICInAppMessageMetadataEntry *)v7;
  if (!((unint64_t)v7 | v6)) {
    id v8 = objc_alloc_init(ICInAppMessageMetadataEntry);
  }
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_5;
  block[3] = &unk_1E5ACD250;
  id v10 = *(id *)(a1 + 40);
  id v15 = (id)v6;
  id v16 = v10;
  id v14 = v8;
  id v11 = (id)v6;
  id v12 = v8;
  dispatch_async(v9, block);
}

uint64_t __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_239(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)clearCachedResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = v9;
    __int16 v28 = 2114;
    id v29 = v8;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing cached resources for message %{public}@:%{public}@", buf, 0x20u);
  }

  if (self->_isSystemService)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_4;
    v18[3] = &unk_1E5ACAC90;
    id v19 = v10;
    id v12 = v10;
    [(ICInAppMessageManager *)self _updateShouldDownloadResources:0 onMessageWithIdentifier:v8 bundleIdentifier:v9 completion:v18];
    id v13 = v19;
  }
  else
  {
    id v14 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke;
    v22[3] = &unk_1E5ACD8E0;
    v22[4] = self;
    id v15 = v10;
    id v23 = v15;
    id v16 = [v14 remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2;
    v20[3] = &unk_1E5ACD8E0;
    void v20[4] = self;
    id v21 = v15;
    id v17 = v15;
    [v16 clearCachedResourcesForMessageWithIdentifier:v8 bundleIdentifier:v9 completion:v20];

    id v13 = v23;
  }
}

void __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  unint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_238;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_238(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)downloadResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v27 = self;
    __int16 v28 = 2114;
    id v29 = v9;
    __int16 v30 = 2114;
    id v31 = v8;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading resources for message %{public}@:%{public}@", buf, 0x20u);
  }

  if (self->_isSystemService)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_4;
    v18[3] = &unk_1E5ACB550;
    id v21 = v10;
    void v18[4] = self;
    id v19 = v8;
    id v20 = v9;
    id v12 = v10;
    [(ICInAppMessageManager *)self _updateShouldDownloadResources:1 onMessageWithIdentifier:v19 bundleIdentifier:v20 completion:v18];

    uint64_t v13 = v21;
  }
  else
  {
    __int16 v14 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke;
    v24[3] = &unk_1E5ACD8E0;
    v24[4] = self;
    id v15 = v10;
    id v25 = v15;
    uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2;
    v22[3] = &unk_1E5ACD8E0;
    v22[4] = self;
    id v23 = v15;
    id v17 = v15;
    [v16 downloadResourcesForMessageWithIdentifier:v8 bundleIdentifier:v9 completion:v22];

    uint64_t v13 = v25;
  }
}

void __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_234;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = [ICAsyncBlockOperation alloc];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_5;
    id v10 = &unk_1E5ACC088;
    id v5 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v5;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v6 = [(ICAsyncBlockOperation *)v4 initWithStartHandler:&v7];
    [(ICAsyncBlockOperation *)v6 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.downloadResourcesForMessageWithIdentifier", v7, v8, v9, v10, v11];
    [*(id *)(*(void *)(a1 + 32) + 16) addOperation:v6];
  }
}

void __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_6;
  v9[3] = &unk_1E5ACD8E0;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  [v4 _downloadResourcesForMessageWithIdentifier:v5 bundleIdentifier:v6 completion:v9];
}

void __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  [*(id *)(a1 + 32) finishWithError:v5];
}

uint64_t __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_234(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)flushEventsWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = self;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Flushing message events", buf, 0xCu);
  }

  if (!self->_isSystemService)
  {
    id v8 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke;
    v22[3] = &unk_1E5ACD8E0;
    v22[4] = self;
    id v9 = v4;
    id v23 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2;
    v20[3] = &unk_1E5ACD8E0;
    void v20[4] = self;
    id v21 = v9;
    [v10 flushEventsWithCompletion:v20];

    id v11 = v23;
LABEL_10:

    goto LABEL_11;
  }
  if (![(ICInAppMessageManager *)self _privacyAcknowledgementRequired])
  {
    id v12 = [ICAsyncBlockOperation alloc];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_223;
    id v17 = &unk_1E5ACB5A0;
    id v18 = self;
    id v19 = v4;
    id v13 = [(ICAsyncBlockOperation *)v12 initWithStartHandler:&v14];
    [(ICAsyncBlockOperation *)v13 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.flushEvents", v14, v15, v16, v17, v18];
    [(NSOperationQueue *)self->_operationQueue addOperation:v13];

    id v11 = v19;
    goto LABEL_10;
  }
  uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = self;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Not flushing events because privacy acknowledgement is required", buf, 0xCu);
  }

  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7007 userInfo:0];
  (*((void (**)(id, void *))v4 + 2))(v4, v7);

LABEL_11:
}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_221;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_223(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2_224;
  v8[3] = &unk_1E5ACC400;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  [v4 pendingMessageEventsWithCompletion:v8];
}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2_224(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  id v21 = v5;
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "Failed to load message events. err=%{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) finishWithError:v5];
  }
  else
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = [v20 count];
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Flushing %d events", buf, 0x12u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v33 = __Block_byref_object_copy__2541;
    dispatch_semaphore_t v34 = __Block_byref_object_dispose__2542;
    id v35 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v20;
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      uint64_t v23 = *(void *)v28;
LABEL_9:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
        dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
        uint64_t v13 = [ICInAppReportEventRequest alloc];
        __int16 v14 = [*(id *)(a1 + 40) _storeRequestContext];
        uint64_t v15 = [v11 messageIdentifier];
        uint64_t v16 = [v11 params];
        id v17 = [(ICInAppReportEventRequest *)v13 initWithStoreRequestContext:v14 messageIdentifier:v15 params:v16];

        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_226;
        v24[3] = &unk_1E5ACB098;
        uint64_t v26 = buf;
        uint64_t v18 = *(void *)(a1 + 40);
        v24[4] = v11;
        void v24[5] = v18;
        id v19 = v12;
        id v25 = v19;
        [(ICInAppReportEventRequest *)v17 performRequestWithResponseHandler:v24];
        dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
        LOBYTE(v15) = *(void *)(*(void *)&buf[8] + 40) == 0;

        if ((v15 & 1) == 0) {
          break;
        }
        if (v9 == ++v10)
        {
          uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v9) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) finishWithError:*(void *)(*(void *)&buf[8] + 40)];
    _Block_object_dispose(buf, 8);
  }
}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_226(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) eventIdentifier];
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      dispatch_semaphore_t v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Failed to flush message event %{public}@. err=%{public}@", buf, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 40) + 40) updateStoreProperty:MEMORY[0x1E4F1CC38] forKey:@"syncPending" completion:&__block_literal_global_229];
  }
  else
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 40);
    uint64_t v9 = [*(id *)(a1 + 32) eventIdentifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2_230;
    v10[3] = &unk_1E5ACC7B0;
    v10[4] = *(void *)(a1 + 32);
    [v8 removePendingMessageEventWithIdentifier:v9 completion:v10];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2_230(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) eventIdentifier];
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Failed to remove completed event %{public}@. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

uint64_t __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_221(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 flushImmediately:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int16 v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    dispatch_semaphore_t v34 = self;
    __int16 v35 = 2114;
    id v36 = v10;
    __int16 v37 = 2114;
    id v38 = v11;
    _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Reporting event for message identifier %{public}@: %{public}@", buf, 0x20u);
  }

  if (self->_isSystemService)
  {
    uint64_t v14 = [ICAsyncBlockOperation alloc];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_4;
    v24[3] = &unk_1E5AC6FE0;
    v24[4] = self;
    uint64_t v15 = &v25;
    id v25 = v10;
    id v16 = v11;
    BOOL v28 = v7;
    id v26 = v16;
    id v27 = v12;
    id v17 = v12;
    uint64_t v18 = [(ICAsyncBlockOperation *)v14 initWithStartHandler:v24];
    [(ICAsyncBlockOperation *)v18 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.reportEvents"];
    [(NSOperationQueue *)self->_operationQueue addOperation:v18];

    id v19 = v26;
  }
  else
  {
    id v20 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke;
    v31[3] = &unk_1E5ACD8E0;
    v31[4] = self;
    uint64_t v15 = &v32;
    id v21 = v12;
    id v32 = v21;
    id v22 = [v20 remoteObjectProxyWithErrorHandler:v31];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_2;
    v29[3] = &unk_1E5ACD8E0;
    v29[4] = self;
    id v30 = v21;
    id v23 = v21;
    [v22 reportEventForMessageIdentifier:v10 withParams:v11 flushImmediately:v7 completion:v29];

    id v19 = v30;
  }
}

void __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  int v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_213;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = [[ICInAppMessageEventEntry alloc] initWithMessageIdentifier:*(void *)(a1 + 40) params:*(void *)(a1 + 48)];
  id v5 = *(void **)(*(void *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_5;
  v8[3] = &unk_1E5AC6FB8;
  objc_copyWeak(&v12, &location);
  id v6 = v4;
  id v9 = v6;
  char v13 = *(unsigned char *)(a1 + 64);
  id v11 = *(id *)(a1 + 56);
  id v7 = v3;
  id v10 = v7;
  [v5 addPendingMessageEvent:v6 completion:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      int v8 = 138543618;
      id v9 = WeakRetained;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to add message event. err=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (v6)
  {
    id v7 = [*(id *)(a1 + 32) eventIdentifier];
    int v8 = 138543618;
    id v9 = WeakRetained;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Added message event %{public}@ for message ", (uint8_t *)&v8, 0x16u);
  }
  if (*(unsigned char *)(a1 + 64)) {
    [WeakRetained flushEventsWithCompletion:&__block_literal_global_217];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) finishWithError:v3];
}

uint64_t __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_213(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 completion:(id)a5
{
}

- (void)resetMessagesWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isSystemService)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = self;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing reset", buf, 0xCu);
    }

    BOOL v6 = [ICAsyncBlockOperation alloc];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_207;
    id v17 = &unk_1E5ACB5A0;
    id v7 = &v19;
    uint64_t v18 = self;
    id v19 = v4;
    id v8 = v4;
    id v9 = [(ICAsyncBlockOperation *)v6 initWithStartHandler:&v14];
    [(ICAsyncBlockOperation *)v9 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.resetMessages", v14, v15, v16, v17, v18];
    [(NSOperationQueue *)self->_operationQueue addOperation:v9];
  }
  else
  {
    __int16 v10 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke;
    v22[3] = &unk_1E5ACD8E0;
    v22[4] = self;
    id v7 = &v23;
    id v11 = v4;
    id v23 = v11;
    uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_2;
    v20[3] = &unk_1E5ACD8E0;
    void v20[4] = self;
    id v21 = v11;
    id v13 = v11;
    [v12 resetMessagesWithCompletion:v20];
  }
}

void __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  BOOL v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_206;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_207(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _resourceCacheDirectoryPath];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v5 removeItemAtPath:v4 error:0];

  id v6 = *(void **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_2_209;
  v9[3] = &unk_1E5ACD8E0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  [v6 resetStoreWithCompletion:v9];
}

void __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_2_209(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Failed to reset message store. err=%{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) finishWithError:v3];
}

uint64_t __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_206(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)syncMessagesWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = self;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing sync", buf, 0xCu);
  }

  if (self->_isSystemService)
  {
    id v6 = [ICAsyncBlockOperation alloc];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_4;
    id v17 = &unk_1E5ACB5A0;
    uint64_t v7 = &v19;
    uint64_t v18 = self;
    id v19 = v4;
    id v8 = v4;
    id v9 = [(ICAsyncBlockOperation *)v6 initWithStartHandler:&v14];
    [(ICAsyncBlockOperation *)v9 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.syncMessages", v14, v15, v16, v17, v18];
    [(NSOperationQueue *)self->_operationQueue addOperation:v9];
  }
  else
  {
    id v10 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke;
    v22[3] = &unk_1E5ACD8E0;
    v22[4] = self;
    uint64_t v7 = &v23;
    id v11 = v4;
    id v23 = v11;
    uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_2;
    v20[3] = &unk_1E5ACD8E0;
    void v20[4] = self;
    id v21 = v11;
    id v13 = v11;
    [v12 syncMessagesWithCompletion:v20];
  }
}

void __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_202;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_5;
  v7[3] = &unk_1E5ACD8E0;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 _performSyncWithCompletion:v7];
}

void __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  [*(id *)(a1 + 32) finishWithError:v5];
}

uint64_t __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_202(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addMessageEntryFromAMSDialogRequest:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v63 = a5;
  id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v85 = self;
    __int16 v86 = 2114;
    id v87 = v9;
    __int16 v88 = 2114;
    id v89 = v8;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding message for bundle identifier '%{public}@' from dialog request %{public}@", buf, 0x20u);
  }

  id v11 = [v8 identifier];
  uint64_t v12 = v11;
  v61 = self;
  if (v11)
  {
    id v65 = v11;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    id v65 = [v13 UUIDString];
  }
  id v59 = v9;

  __int16 v14 = [v8 defaultAction];
  id v15 = [v14 deepLink];

  __int16 v62 = v15;
  if (v15)
  {
    uint64_t v16 = [v15 absoluteString];
  }
  else
  {
    uint64_t v16 = @"music://itunes.apple.com";
  }
  id v17 = objc_alloc_init(ICIAMApplicationMessage);
  [(ICIAMApplicationMessage *)v17 setIdentifier:v65];
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
  [v18 timeIntervalSince1970];
  -[ICIAMApplicationMessage setStartDate:](v17, "setStartDate:");

  id v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1209600.0];
  [v19 timeIntervalSince1970];
  -[ICIAMApplicationMessage setEndDate:](v17, "setEndDate:");

  [(ICIAMApplicationMessage *)v17 setAssetPrefetchStrategy:1];
  [(ICIAMApplicationMessage *)v17 setHasCloseButton:1];
  [(ICIAMApplicationMessage *)v17 setMaximumDisplays:1];
  [(ICIAMApplicationMessage *)v17 setMessageType:2];
  id v20 = objc_alloc_init(ICIAMMessageContent);
  [(ICIAMMessageContent *)v20 setIdentifier:@"content-identifier"];
  id v21 = [v8 title];
  [(ICIAMMessageContent *)v20 setTitle:v21];

  id v22 = [v8 message];
  [(ICIAMMessageContent *)v20 setSubtitle:v22];

  uint64_t v58 = v20;
  [(ICIAMApplicationMessage *)v17 addContentPages:v20];
  id v23 = [MEMORY[0x1E4F1CA60] dictionary];
  v82[0] = @"title";
  id v24 = [v8 title];
  v83[0] = v24;
  v82[1] = @"body";
  __int16 v64 = v8;
  id v25 = [v8 message];
  v82[2] = @"level";
  v83[1] = v25;
  v83[2] = &unk_1EF640780;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:3];

  uint64_t v57 = (void *)v26;
  [v23 setObject:v26 forKey:@"alert"];
  id v27 = [MEMORY[0x1E4F1CA48] array];
  v80[0] = @"_tp";
  v80[1] = @"_url";
  v81[0] = &unk_1EF640798;
  v81[1] = v16;
  v80[2] = @"_mt";
  v78[0] = @"actionType";
  v78[1] = @"actionUrl";
  v79[0] = @"tap";
  v79[1] = v16;
  __int16 v60 = v16;
  v78[2] = @"eventType";
  v78[3] = @"eventVersion";
  v79[2] = @"notificationAction";
  v79[3] = &unk_1EF640798;
  v78[4] = @"notificationId";
  v78[5] = @"targetType";
  v79[4] = v65;
  v79[5] = @"notification";
  v78[6] = @"topic";
  v78[7] = @"app";
  v79[6] = @"xp_amp_notifications";
  v79[7] = v59;
  v79[8] = @"Content";
  v78[8] = @"notificationType";
  v78[9] = @"details";
  v76 = @"notificationSubtype";
  v77 = @"MusicAlertMessage";
  BOOL v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  v79[9] = v28;
  long long v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:10];
  v81[2] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:3];

  uint64_t v55 = (void *)v30;
  [v27 addObject:v30];
  v56 = v27;
  [v23 setObject:v27 forKey:@"_ba"];
  [v23 setObject:&unk_1EF640798 forKey:@"content-available"];
  id v31 = +[ICUserIdentityStore defaultIdentityStore];
  id v32 = +[ICUserIdentity activeAccount];
  id v33 = [v31 DSIDForUserIdentity:v32 outError:0];

  long long v54 = v33;
  if (v33)
  {
    dispatch_semaphore_t v34 = [v33 stringValue];
    [v23 setObject:v34 forKey:@"_ds"];
  }
  else
  {
    [v23 setObject:@"0" forKey:@"_ds"];
  }
  [v23 setObject:&unk_1EF6407B0 forKey:@"_it"];
  __int16 v35 = [NSString stringWithFormat:@"ams_%@", v65];
  [v23 setObject:v35 forKey:@"_id"];

  [v23 setObject:v59 forKey:@"_bid"];
  v74[0] = @"eventType";
  v74[1] = @"eventVersion";
  v75[0] = @"notificationRequest";
  v75[1] = &unk_1EF640798;
  v74[2] = @"language";
  id v36 = +[ICDeviceInfo currentDeviceInfo];
  uint64_t v37 = [v36 currentLocale];
  id v38 = (void *)v37;
  uint64_t v39 = &stru_1EF5F5C40;
  if (v37) {
    uint64_t v39 = (__CFString *)v37;
  }
  v75[2] = v39;
  v75[3] = v65;
  v74[3] = @"notificationId";
  v74[4] = @"notificationType";
  v75[4] = @"Content";
  v75[5] = @"29";
  v74[5] = @"platformId";
  v74[6] = @"platformName";
  v75[6] = @"P84";
  v75[7] = @"xp_amp_notifications";
  v74[7] = @"topic";
  v74[8] = @"app";
  v75[8] = v59;
  v74[9] = @"details";
  __int16 v72 = @"notificationSubtype";
  uint64_t v73 = @"MusicAlertMessage";
  id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  v75[9] = v40;
  uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:10];

  [v23 setObject:v41 forKey:@"_mt"];
  long long v42 = objc_alloc_init(ICIAMLocalNotification);
  id v71 = 0;
  id v43 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v23 options:0 error:&v71];
  id v44 = v71;
  if (v43
    && ([v43 base64EncodedStringWithOptions:0], (uint64_t v45 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v46 = v45;
    [(ICIAMLocalNotification *)v42 setNotification:v45];
    [(ICIAMApplicationMessage *)v17 setLocalNotification:v42];
    id v47 = v61;
  }
  else
  {
    uint64_t v46 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    id v47 = v61;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v85 = v61;
      __int16 v86 = 2114;
      id v87 = v44;
      _os_log_impl(&dword_1A2D01000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Failed to serialize local notification data. err=%{public}@", buf, 0x16u);
    }
  }

  unint64_t v48 = [[ICInAppMessageEntry alloc] initWithApplicationMessage:v17 bundleIdentifier:v59];
  long long v49 = v47;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __89__ICInAppMessageManager_addMessageEntryFromAMSDialogRequest_bundleIdentifier_completion___block_invoke;
  void v66[3] = &unk_1E5ACB550;
  char v67 = v49;
  uint64_t v68 = v17;
  id v69 = v59;
  id v70 = v63;
  id v50 = v59;
  long long v51 = v17;
  id v52 = v63;
  id v53 = v49;
  [(ICInAppMessageManager *)v53 addMessageEntry:v48 completion:v66];
}

void __89__ICInAppMessageManager_addMessageEntryFromAMSDialogRequest_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = v4;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished adding message for dialog request. err=%{public}@", buf, 0x16u);
  }

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = +[ICInAppMessageManager sharedManager];
    id v7 = [*(id *)(a1 + 40) identifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __89__ICInAppMessageManager_addMessageEntryFromAMSDialogRequest_bundleIdentifier_completion___block_invoke_201;
    v9[3] = &unk_1E5ACAC90;
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    [v6 downloadResourcesForMessageWithIdentifier:v7 bundleIdentifier:v8 completion:v9];
  }
}

uint64_t __89__ICInAppMessageManager_addMessageEntryFromAMSDialogRequest_bundleIdentifier_completion___block_invoke_201(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = self;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all messages for bundle identifier %{public}@", buf, 0x16u);
  }

  if (self->_isSystemService)
  {
    id v9 = [ICAsyncBlockOperation alloc];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_4;
    v18[3] = &unk_1E5ACC0B0;
    void v18[4] = self;
    id v10 = &v19;
    id v19 = v6;
    id v20 = v7;
    id v11 = v7;
    id v12 = [(ICAsyncBlockOperation *)v9 initWithStartHandler:v18];
    [(ICAsyncBlockOperation *)v12 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.removeAllMessagesForBundleIdentifier"];
    [(NSOperationQueue *)self->_operationQueue addOperation:v12];

    __int16 v13 = v20;
  }
  else
  {
    id v14 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke;
    v23[3] = &unk_1E5ACD8E0;
    void v23[4] = self;
    id v10 = &v24;
    id v15 = v7;
    id v24 = v15;
    uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_2;
    v21[3] = &unk_1E5ACD8E0;
    void v21[4] = self;
    id v22 = v15;
    id v17 = v15;
    [v16 removeAllMessageEntriesForBundleIdentifier:v6 completion:v21];

    __int16 v13 = v22;
  }
}

void __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_56;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_5;
  v8[3] = &unk_1E5ACD8E0;
  id v6 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 _removeAllMessageEntriesForBundleIdentifier:v5 completion:v8];
}

void __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  [*(id *)(a1 + 32) finishWithError:v5];
}

uint64_t __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    dispatch_semaphore_t v34 = self;
    __int16 v35 = 2114;
    id v36 = v8;
    __int16 v37 = 2114;
    id v38 = v9;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing message %{public}@ for bundle identifier %{public}@", buf, 0x20u);
  }

  if (self->_isSystemService)
  {
    id v12 = [ICAsyncBlockOperation alloc];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_4;
    id v24 = &unk_1E5ACC088;
    id v25 = self;
    uint64_t v13 = &v26;
    id v26 = v8;
    id v27 = v9;
    id v28 = v10;
    id v14 = v10;
    id v15 = [(ICAsyncBlockOperation *)v12 initWithStartHandler:&v21];
    [(ICAsyncBlockOperation *)v15 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.removeMessageWithIdentifier", v21, v22, v23, v24, v25];
    [(NSOperationQueue *)self->_operationQueue addOperation:v15];

    uint64_t v16 = v27;
  }
  else
  {
    id v17 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke;
    v31[3] = &unk_1E5ACD8E0;
    v31[4] = self;
    uint64_t v13 = &v32;
    id v18 = v10;
    id v32 = v18;
    id v19 = [v17 remoteObjectProxyWithErrorHandler:v31];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_2;
    v29[3] = &unk_1E5ACD8E0;
    v29[4] = self;
    id v30 = v18;
    id v20 = v18;
    [v19 removeMessageEntryWithIdentifier:v8 forBundleIdentifier:v9 completion:v29];

    uint64_t v16 = v30;
  }
}

void __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_52;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_5;
  v9[3] = &unk_1E5ACD8E0;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  [v4 _removeMessageEntryWithIdentifier:v5 forBundleIdentifier:v6 completion:v9];
}

void __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  [*(id *)(a1 + 32) finishWithError:v5];
}

uint64_t __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)updateMessageEntry:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = self;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updating message %{public}@", buf, 0x16u);
  }

  if (self->_isSystemService)
  {
    id v9 = [ICAsyncBlockOperation alloc];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_4;
    v18[3] = &unk_1E5ACC0B0;
    void v18[4] = self;
    id v10 = &v19;
    id v19 = v6;
    id v20 = v7;
    id v11 = v7;
    id v12 = [(ICAsyncBlockOperation *)v9 initWithStartHandler:v18];
    [(ICAsyncBlockOperation *)v12 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.updateMessage"];
    [(NSOperationQueue *)self->_operationQueue addOperation:v12];

    uint64_t v13 = v20;
  }
  else
  {
    __int16 v14 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke;
    v23[3] = &unk_1E5ACD8E0;
    void v23[4] = self;
    id v10 = &v24;
    id v15 = v7;
    id v24 = v15;
    uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_2;
    v21[3] = &unk_1E5ACD8E0;
    void v21[4] = self;
    id v22 = v15;
    id v17 = v15;
    [v16 updateMessageEntry:v6 completion:v21];

    uint64_t v13 = v22;
  }
}

void __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_48;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_5;
  v8[3] = &unk_1E5ACB578;
  id v9 = v4;
  id v6 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  [v5 updateMessageEntry:v9 completion:v8];
}

void __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Failed to update message %{public}@. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) finishWithError:v3];
}

uint64_t __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addMessageEntry:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = self;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ adding message: %{public}@", buf, 0x16u);
  }

  if (self->_isSystemService)
  {
    id v9 = [ICAsyncBlockOperation alloc];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_4;
    v18[3] = &unk_1E5ACC0B0;
    void v18[4] = self;
    uint64_t v10 = &v19;
    id v19 = v6;
    id v20 = v7;
    id v11 = v7;
    id v12 = [(ICAsyncBlockOperation *)v9 initWithStartHandler:v18];
    [(ICAsyncBlockOperation *)v12 setName:@"com.apple.iTunesCloud.ICInAppMessageManager.addMessage"];
    [(NSOperationQueue *)self->_operationQueue addOperation:v12];

    uint64_t v13 = v20;
  }
  else
  {
    __int16 v14 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke;
    v23[3] = &unk_1E5ACD8E0;
    void v23[4] = self;
    uint64_t v10 = &v24;
    id v15 = v7;
    id v24 = v15;
    uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_2;
    v21[3] = &unk_1E5ACD8E0;
    void v21[4] = self;
    id v22 = v15;
    id v17 = v15;
    [v16 addMessageEntry:v6 completion:v21];

    uint64_t v13 = v22;
  }
}

void __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_42;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_5;
  v8[3] = &unk_1E5ACB578;
  id v9 = v4;
  id v6 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  [v5 _addMessageEntry:v9 completion:v8];
}

void __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Failed to add message %{public}@. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) finishWithError:v3];
}

uint64_t __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)messageEntryWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v31 = self;
    __int16 v32 = 2114;
    id v33 = v8;
    __int16 v34 = 2114;
    id v35 = v9;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching message with identifier %{public}@ for bundle identifier %{public}@", buf, 0x20u);
  }

  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_4;
    v22[3] = &unk_1E5AC6F90;
    v22[4] = self;
    uint64_t v13 = &v23;
    id v14 = v8;
    id v23 = v14;
    id v15 = v9;
    id v24 = v15;
    id v25 = v10;
    id v16 = v10;
    [(ICInAppMessageStore *)messageStore getMessageEntryWithIdentifier:v14 bundleIdentifier:v15 completion:v22];

    id v17 = v24;
  }
  else
  {
    id v18 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke;
    v28[3] = &unk_1E5ACD8E0;
    void v28[4] = self;
    uint64_t v13 = &v29;
    id v19 = v10;
    id v29 = v19;
    id v20 = [v18 remoteObjectProxyWithErrorHandler:v28];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_2;
    v26[3] = &unk_1E5AC6F68;
    v26[4] = self;
    id v27 = v19;
    id v21 = v19;
    [v20 messageEntryWithIdentifier:v8 bundleIdentifier:v9 completion:v26];

    id v17 = v27;
  }
}

void __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  int v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_40;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_4(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      uint64_t v10 = a1[6];
      int v11 = 138544130;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load message %{public}@ for bundle identifier %{public}@. err=%{public}@", (uint8_t *)&v11, 0x2Au);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_39;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

uint64_t __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)messageEntriesForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = [v6 setWithObject:a3];
  [(ICInAppMessageManager *)self messageEntriesForBundleIdentifiers:v8 completion:v7];
}

- (void)allMessageEntriesWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = self;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching all messages", buf, 0xCu);
  }

  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_4;
    v13[3] = &unk_1E5ACC478;
    id v7 = &v14;
    void v13[4] = self;
    id v14 = v4;
    id v8 = v4;
    [(ICInAppMessageStore *)messageStore getAllMessageEntriesWithCompletion:v13];
  }
  else
  {
    uint64_t v9 = [(ICInAppMessageManager *)self _xpcClientConnection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke;
    v17[3] = &unk_1E5ACD8E0;
    void v17[4] = self;
    id v7 = &v18;
    id v10 = v4;
    id v18 = v10;
    id v11 = [v9 remoteObjectProxyWithErrorHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_2;
    v15[3] = &unk_1E5ACC478;
    void v15[4] = self;
    id v16 = v10;
    id v12 = v10;
    [v11 allMessageEntriesWithCompletion:v15];
  }
}

void __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_36;
  v9[3] = &unk_1E5ACD2F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_3;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load all messages. err=%{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)stopSystemService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    uint64_t v10 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping system service...", (uint8_t *)&v9, 0xCu);
  }

  self->_isSystemService = 0;
  if (self->_musicPrivacyObserverToken)
  {
    id v4 = +[ICPrivacyInfo sharedPrivacyInfo];
    [v4 endObservingPrivacyAcknowledgementForIdentifier:@"Music" withToken:self->_musicPrivacyObserverToken];

    musicPrivacyObserverToken = self->_musicPrivacyObserverToken;
    self->_musicPrivacyObserverToken = 0;
  }
  if (self->_fitnessPrivacyObserverToken)
  {
    id v6 = +[ICPrivacyInfo sharedPrivacyInfo];
    [v6 endObservingPrivacyAcknowledgementForIdentifier:@"FitnessPlus" withToken:self->_fitnessPrivacyObserverToken];

    fitnessPrivacyObserverToken = self->_fitnessPrivacyObserverToken;
    self->_fitnessPrivacyObserverToken = 0;
  }
  uint64_t v8 = +[ICEnvironmentMonitor sharedMonitor];
  [v8 unregisterObserver:self];

  [(NSXPCListener *)self->_xpcServiceListener invalidate];
}

- (void)startSystemService
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting system service...", buf, 0xCu);
  }

  self->_isSystemService = 1;
  id v4 = +[ICDeviceInfo currentDeviceInfo];
  if (([v4 isWatch] & 1) == 0
    && ([v4 isAudioAccessory] & 1) == 0
    && ([v4 isROSDevice] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__handleUserIdentityStoreDidChangeNotification_ name:@"ICUserIdentityStoreDidChangeNotification" object:self->_identityStore];

    id v6 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.itunescloud.in-app-message-service"];
    xpcServiceListener = self->_xpcServiceListener;
    self->_xpcServiceListener = v6;

    [(NSXPCListener *)self->_xpcServiceListener setDelegate:self];
    [(NSXPCListener *)self->_xpcServiceListener resume];
    [(ICInAppMessageManager *)self _schedulePeriodicUpdate];
    [(ICInAppMessageManager *)self _handleUserIdentityStoreDidChangeNotification:0];
    messageStore = self->_messageStore;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __43__ICInAppMessageManager_startSystemService__block_invoke;
    v20[3] = &unk_1E5AC6F18;
    void v20[4] = self;
    [(ICInAppMessageStore *)messageStore getStorePropertyForKey:@"lastSyncedOSVersion" completion:v20];
    int v9 = +[ICEnvironmentMonitor sharedMonitor];
    [v9 registerObserver:self];

    uint64_t v10 = +[ICPrivacyInfo sharedPrivacyInfo];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__ICInAppMessageManager_startSystemService__block_invoke_3;
    v19[3] = &unk_1E5AC6F40;
    v19[4] = self;
    uint64_t v11 = [v10 beginObservingPrivacyAcknowledgementForIdentifier:@"Music" handler:v19];
    musicPrivacyObserverToken = self->_musicPrivacyObserverToken;
    self->_musicPrivacyObserverToken = v11;

    uint64_t v13 = +[ICDeviceInfo currentDeviceInfo];
    char v14 = [v13 isMac];

    if ((v14 & 1) == 0)
    {
      id v15 = +[ICPrivacyInfo sharedPrivacyInfo];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __43__ICInAppMessageManager_startSystemService__block_invoke_4;
      v18[3] = &unk_1E5AC6F40;
      void v18[4] = self;
      uint64_t v16 = [v15 beginObservingPrivacyAcknowledgementForIdentifier:@"FitnessPlus" handler:v18];
      fitnessPrivacyObserverToken = self->_fitnessPrivacyObserverToken;
      self->_fitnessPrivacyObserverToken = v16;
    }
  }
}

void __43__ICInAppMessageManager_startSystemService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[ICDeviceInfo currentDeviceInfo];
  id v5 = [v4 buildVersion];

  if (!_NSIsNSString() || ([v3 isEqualToString:v5] & 1) == 0)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Requesting a sync because the system version has changed from %{public}@ --> %{public}@", (uint8_t *)&v8, 0x20u);
    }

    [*(id *)(a1 + 32) syncMessagesWithCompletion:&__block_literal_global_29];
    [*(id *)(*(void *)(a1 + 32) + 40) updateStoreProperty:v5 forKey:@"lastSyncedOSVersion" completion:&__block_literal_global_31];
  }
}

uint64_t __43__ICInAppMessageManager_startSystemService__block_invoke_3(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return [*(id *)(result + 32) _performSyncRetryIfPending:1];
  }
  return result;
}

uint64_t __43__ICInAppMessageManager_startSystemService__block_invoke_4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return [*(id *)(result + 32) _performSyncRetryIfPending:1];
  }
  return result;
}

@end