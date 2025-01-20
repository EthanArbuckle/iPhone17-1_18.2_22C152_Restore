@interface ICMusicSubscriptionStatusController
+ (BOOL)_canConnectToMusicSubscriptionStatusService;
+ (ICMusicSubscriptionStatusController)sharedStatusController;
- (BOOL)_willPerformSubscriptionStatusRequest:(id)a3 withStatusHandler:(id)a4;
- (ICMusicSubscriptionStatusController)init;
- (id)_remoteRequestingClientConnection;
- (void)_cancelPendingRequests;
- (void)_cancelRemoteRequestingClientConnectionInvalidationTimer;
- (void)_deliverSubscriptionStatusResponse:(id)a3 forRequest:(id)a4 error:(id)a5;
- (void)_didEndRemoteRequestWithUniqueIdentifier:(id)a3;
- (void)_handlePrivacyAcknowledgementRequirementChanged:(BOOL)a3;
- (void)_handleSeveredRemoteClientConnectionWithIdentifier:(id)a3;
- (void)_handleSubscriptionStatusCacheDidChangeNotification:(id)a3;
- (void)_handleSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification:(id)a3;
- (void)_handleSubscriptionStatusDidChangeDistributedNotification:(id)a3;
- (void)_handleSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementNotification:(id)a3;
- (void)_invalidateRemoteRequestingClientConnection;
- (void)_remoteRequestingClientConnectionInvalidationTimerDidExpire;
- (void)_scheduleInvalidationOfRemoteRequestingClientConnection;
- (void)_willBeginRemoteRequestWithUniqueIdentifier:(id)a3 statusHandler:(id)a4;
- (void)dealloc;
- (void)deliverSubscriptionStatusResponse:(id)a3 forRemoteRequestWithUniqueIdentifier:(id)a4 error:(id)a5;
- (void)disableSubscriptionForUserIdentity:(id)a3 withCompletionHandler:(id)a4;
- (void)disableSubscriptionWithCompletionHandler:(id)a3;
- (void)enableSubscriptionForUserIdentity:(id)a3 withCompletionHandler:(id)a4;
- (void)enableSubscriptionWithCompletionHandler:(id)a3;
- (void)getSubscriptionStatusForUserIdentity:(id)a3 bypassingCache:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)getSubscriptionStatusForUserIdentity:(id)a3 withCompletionHandler:(id)a4;
- (void)getSubscriptionStatusWithCompletionHandler:(id)a3;
- (void)invalidateCachedSubscriptionStatusForUserIdentity:(id)a3 withCompletionHandler:(id)a4;
- (void)invalidateCachedSubscriptionStatusWithCompletionHandler:(id)a3;
- (void)performSubscriptionStatusRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)performSubscriptionStatusRequest:(id)a3 withStatusHandler:(id)a4;
- (void)refreshSubscriptionForUserIdentity:(id)a3 withCompletionHandler:(id)a4;
- (void)refreshSubscriptionUsingRequestContext:(id)a3 withCompletionHandler:(id)a4;
- (void)refreshSubscriptionWithCompletionHandler:(id)a3;
@end

@implementation ICMusicSubscriptionStatusController

uint64_t __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deliverSubscriptionStatusResponse:*(void *)(a1 + 40) forRequest:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __113__ICMusicSubscriptionStatusController_getSubscriptionStatusForUserIdentity_bypassingCache_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setIdentity:v2];
  v4 = [(ICURLResponseAuthenticationProvider *)[ICStoreURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:1];
  [v3 setAuthenticationProvider:v4];
}

- (void)getSubscriptionStatusForUserIdentity:(id)a3 bypassingCache:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [ICStoreRequestContext alloc];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __113__ICMusicSubscriptionStatusController_getSubscriptionStatusForUserIdentity_bypassingCache_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E5ACB4B0;
  id v18 = v8;
  id v11 = v8;
  v12 = [(ICStoreRequestContext *)v10 initWithBlock:v17];
  v13 = [[ICMusicSubscriptionStatusRequest alloc] initWithStoreRequestContext:v12];
  [(ICMusicSubscriptionStatusRequest *)v13 setCarrierBundleProvisioningStyle:1];
  [(ICMusicSubscriptionStatusRequest *)v13 setShouldIgnoreCache:v6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__ICMusicSubscriptionStatusController_getSubscriptionStatusForUserIdentity_bypassingCache_withCompletionHandler___block_invoke_2;
  v15[3] = &unk_1E5ACB4D8;
  id v16 = v9;
  id v14 = v9;
  [(ICMusicSubscriptionStatusController *)self performSubscriptionStatusRequest:v13 withCompletionHandler:v15];
}

void __91__ICMusicSubscriptionStatusController__deliverSubscriptionStatusResponse_forRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __94__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    long long v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (![v5 isFinalResponse]) {
      goto LABEL_6;
    }
    long long v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
LABEL_6:

  return MEMORY[0x1F41817F8]();
}

uint64_t __116__ICMusicSubscriptionStatusController_deliverSubscriptionStatusResponse_forRemoteRequestWithUniqueIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 32) _deliverSubscriptionStatusResponse:*(void *)(a1 + 48) forRequest:v2 error:*(void *)(a1 + 56)];
    if (([*(id *)(a1 + 48) isFinalResponse] & 1) != 0 || *(void *)(a1 + 56)) {
      [*(id *)(a1 + 32) _didEndRemoteRequestWithUniqueIdentifier:*(void *)(a1 + 40)];
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __95__ICMusicSubscriptionStatusController__willPerformSubscriptionStatusRequest_withStatusHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__32226;
  v20 = __Block_byref_object_dispose__32227;
  id v21 = 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__ICMusicSubscriptionStatusController__willPerformSubscriptionStatusRequest_withStatusHandler___block_invoke_2;
  v12[3] = &unk_1E5ACB618;
  id v13 = *(id *)(a1 + 40);
  id v14 = &v16;
  uint64_t v15 = *(void *)(a1 + 56);
  [v2 enumerateKeysAndObjectsUsingBlock:v12];
  if (v17[5])
  {
    uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "objectForKey:");
    uint64_t v4 = (void *)MEMORY[0x1A6240BF0](*(void *)(a1 + 48));
    [v3 addObject:v4];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CA48];
    long long v6 = (void *)MEMORY[0x1A6240BF0](*(void *)(a1 + 48));
    uint64_t v3 = [v5 arrayWithObject:v6];

    long long v7 = *(void **)(*(void *)(a1 + 32) + 72);
    long long v8 = [*(id *)(a1 + 40) requestIdentifier];
    [v7 setObject:v3 forKey:v8];

    long long v9 = *(void **)(a1 + 40);
    v10 = *(void **)(*(void *)(a1 + 32) + 80);
    uint64_t v11 = [v9 requestIdentifier];
    [v10 setObject:v9 forKey:v11];
  }
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v3 count];

  _Block_object_dispose(&v16, 8);
}

- (void)_deliverSubscriptionStatusResponse:(id)a3 forRequest:(id)a4 error:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__32226;
  v43 = __Block_byref_object_dispose__32227;
  id v44 = 0;
  statusHandlersForPendingIdenticalRequests = self->_statusHandlersForPendingIdenticalRequests;
  v12 = [v9 requestIdentifier];
  id v13 = [(NSMutableDictionary *)statusHandlersForPendingIdenticalRequests objectForKey:v12];
  uint64_t v14 = [v13 copy];
  uint64_t v15 = (void *)v40[5];
  v40[5] = v14;

  pendingRequests = self->_pendingRequests;
  v17 = [v9 requestIdentifier];
  uint64_t v18 = [(NSMutableDictionary *)pendingRequests objectForKey:v17];

  int v19 = [v8 isFinalResponse] ^ 1;
  if (v10) {
    LOBYTE(v19) = 0;
  }
  if ((v19 & 1) == 0)
  {
    v20 = self->_pendingRequests;
    id v21 = [v9 requestIdentifier];
    [(NSMutableDictionary *)v20 removeObjectForKey:v21];

    v22 = self->_statusHandlersForPendingIdenticalRequests;
    v23 = [v9 requestIdentifier];
    [(NSMutableDictionary *)v22 removeObjectForKey:v23];
  }
  uint64_t v24 = [(id)v40[5] count];
  v25 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  v26 = v25;
  if (v10)
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v27 = "s";
    *(_DWORD *)buf = 138544130;
    __int16 v47 = 2048;
    id v46 = v18;
    if (v24 == 1) {
      v27 = "";
    }
    uint64_t v48 = v24;
    __int16 v49 = 2080;
    v50 = v27;
    __int16 v51 = 2114;
    id v52 = v10;
    v28 = "Delivering result for %{public}@ to %llu status handler%s: error = %{public}@.";
    v29 = v26;
    os_log_type_t v30 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v31 = "s";
    *(_DWORD *)buf = 138544130;
    __int16 v47 = 2048;
    id v46 = v18;
    if (v24 == 1) {
      v31 = "";
    }
    uint64_t v48 = v24;
    __int16 v49 = 2080;
    v50 = v31;
    __int16 v51 = 2114;
    id v52 = v8;
    v28 = "Delivering result for %{public}@ to %llu status handler%s: response = %{public}@.";
    v29 = v26;
    os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_1A2D01000, v29, v30, v28, buf, 0x2Au);
LABEL_15:

  if (v24)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__ICMusicSubscriptionStatusController__deliverSubscriptionStatusResponse_forRequest_error___block_invoke;
    block[3] = &unk_1E5ACCC88;
    v38 = &v39;
    v36 = v8;
    id v37 = v10;
    dispatch_async(callbackQueue, block);

    v33 = v36;
  }
  else
  {
    v33 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = self->_pendingRequests;
      *(_DWORD *)buf = 138543618;
      id v46 = v9;
      __int16 v47 = 2114;
      uint64_t v48 = (uint64_t)v34;
      _os_log_impl(&dword_1A2D01000, v33, OS_LOG_TYPE_ERROR, "No status handlers found for request %{public}@. pendingRequests = %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v39, 8);
}

- (void)_scheduleInvalidationOfRemoteRequestingClientConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_accessQueue);
  remoteRequestingClientConnectionInvalidationTimer = self->_remoteRequestingClientConnectionInvalidationTimer;
  self->_remoteRequestingClientConnectionInvalidationTimer = v3;

  id v5 = self->_remoteRequestingClientConnectionInvalidationTimer;
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  long long v7 = self->_remoteRequestingClientConnectionInvalidationTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __94__ICMusicSubscriptionStatusController__scheduleInvalidationOfRemoteRequestingClientConnection__block_invoke;
  handler[3] = &unk_1E5ACD750;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_remoteRequestingClientConnectionInvalidationTimer);
}

- (void)_didEndRemoteRequestWithUniqueIdentifier:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  unint64_t v4 = self->_numberOfActiveRemoteRequests - 1;
  self->_numberOfActiveRemoteRequests = v4;
  if (!v4)
  {
    [(ICMusicSubscriptionStatusController *)self _scheduleInvalidationOfRemoteRequestingClientConnection];
  }
}

void __113__ICMusicSubscriptionStatusController_getSubscriptionStatusForUserIdentity_bypassingCache_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 subscriptionStatus];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

+ (ICMusicSubscriptionStatusController)sharedStatusController
{
  if (sharedStatusController_sOnceToken != -1) {
    dispatch_once(&sharedStatusController_sOnceToken, &__block_literal_global_32301);
  }
  uint64_t v2 = (void *)sharedStatusController_sSharedStatusController;

  return (ICMusicSubscriptionStatusController *)v2;
}

- (void)performSubscriptionStatusRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E5ACB4D8;
  id v9 = v6;
  id v7 = v6;
  [(ICMusicSubscriptionStatusController *)self performSubscriptionStatusRequest:a3 withStatusHandler:v8];
}

void *__97__ICMusicSubscriptionStatusController__willBeginRemoteRequestWithUniqueIdentifier_statusHandler___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 24);
  result = *(void **)(a1 + 32);
  if (result[3] == 1) {
    return (void *)[result _cancelRemoteRequestingClientConnectionInvalidationTimer];
  }
  return result;
}

- (ICMusicSubscriptionStatusController)init
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)ICMusicSubscriptionStatusController;
  uint64_t v2 = [(ICMusicSubscriptionStatusController *)&v26 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionStatusController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionStatusController.callbackQueue", MEMORY[0x1E4F14430]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    id v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v7;

    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.iTunesCloud.ICMusicSubscriptionStatusController.operationQueue"];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:25];
    id v9 = v2->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__ICMusicSubscriptionStatusController_init__block_invoke;
    block[3] = &unk_1E5ACD750;
    id v10 = v2;
    v25 = v10;
    dispatch_sync(v9, block);
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v10 selector:sel__handleSubscriptionStatusCacheDidChangeNotification_ name:@"ICMusicSubscriptionStatusCacheDidChangeNotification" object:0];
    [v11 addObserver:v10 selector:sel__handleSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification_ name:@"ICMusicSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification" object:0];
    v12 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v12 addObserver:v10 selector:sel__handleSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementNotification_ name:@"com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementDistributedNotification" object:0];
    id v13 = [MEMORY[0x1E4F28F80] processInfo];
    int v14 = objc_msgSend(v13, "ic_isCloudDaemon");

    if (v14)
    {
      objc_initWeak(&location, v10);
      uint64_t v15 = +[ICPrivacyInfo sharedPrivacyInfo];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __43__ICMusicSubscriptionStatusController_init__block_invoke_2;
      v21[3] = &unk_1E5ACB488;
      objc_copyWeak(&v22, &location);
      uint64_t v16 = [v15 beginObservingPrivacyAcknowledgementForIdentifier:@"Music" handler:v21];
      privacyAcknowledgementObservationToken = v10->_privacyAcknowledgementObservationToken;
      v10->_privacyAcknowledgementObservationToken = (NSCopying *)v16;

      uint64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = v10->_privacyAcknowledgementObservationToken;
        *(_DWORD *)buf = 138543874;
        v28 = v10;
        __int16 v29 = 2114;
        os_log_type_t v30 = @"Music";
        __int16 v31 = 2114;
        v32 = v19;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ began observing privacy acknowledgement for %{public}@ with token %{public}@.", buf, 0x20u);
      }

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      [v12 addObserver:v10 selector:sel__handleSubscriptionStatusDidChangeDistributedNotification_ name:@"_ICMusicSubscriptionStatusDidChangeDistributedNotification" object:0];
    }
  }
  return v2;
}

void __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_3(id *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([a2 isSandboxed])
  {
    dispatch_queue_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [a1[4] identity];
      *(_DWORD *)buf = 138412290;
      objc_super v26 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Disallowing subscription status request for sandboxed user identity %@", buf, 0xCu);
    }
    dispatch_queue_t v5 = *((void *)a1[5] + 2);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_48;
    block[3] = &unk_1E5ACD2F0;
    v23 = (ICMusicSubscriptionStatusRequestOperation *)a1[4];
    id v24 = a1[7];
    dispatch_async(v5, block);

    id v6 = v23;
    goto LABEL_14;
  }
  id v7 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v8 = objc_msgSend(v7, "ic_isCloudDaemon");

  if (v8)
  {
LABEL_13:
    id v6 = [[ICMusicSubscriptionStatusRequestOperation alloc] initWithRequest:a1[6]];
    [(ICMusicSubscriptionStatusRequestOperation *)v6 setAllowsFuseHeaderEnrichment:v8];
    [(ICMusicSubscriptionStatusRequestOperation *)v6 setResponseHandler:a1[7]];
    [*((id *)a1[5] + 4) addOperation:v6];
    goto LABEL_14;
  }
  if (([(id)objc_opt_class() _canConnectToMusicSubscriptionStatusService] & 1) == 0)
  {
    int v14 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = +[ICMusicSubscriptionStatusRemoteRequesting machServiceName];
      *(_DWORD *)buf = 138478083;
      objc_super v26 = @"com.apple.security.exception.mach-lookup.global-name";
      __int16 v27 = 2113;
      v28 = v15;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "warning: it has recently become deprecated to request the music subscription status in process; the new supporte"
        "d code path fetches it in itunescloudd, but you need to add %{private}@ %{private}@ to your sandbox in order to "
        "opt in to this new code path.",
        buf,
        0x16u);
    }
    goto LABEL_13;
  }
  id v9 = [a1[6] requestIdentifier];
  id v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (__CFString *)a1[5];
    *(_DWORD *)buf = 138543618;
    objc_super v26 = v11;
    __int16 v27 = 2114;
    v28 = v9;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending request %{public}@ to subscription status service", buf, 0x16u);
  }

  [a1[5] _willBeginRemoteRequestWithUniqueIdentifier:v9 statusHandler:a1[7]];
  id v6 = [a1[5] _remoteRequestingClientConnection];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_56;
  int v19 = &unk_1E5ACC788;
  id v20 = a1[5];
  id v21 = v9;
  id v12 = v9;
  id v13 = [(ICMusicSubscriptionStatusRequestOperation *)v6 remoteObjectProxyWithErrorHandler:&v16];
  objc_msgSend(v13, "performSubscriptionStatusRequest:forUniqueIdentifier:", a1[6], v12, v16, v17, v18, v19, v20);

LABEL_14:
}

+ (BOOL)_canConnectToMusicSubscriptionStatusService
{
  getpid();
  id v2 = +[ICMusicSubscriptionStatusRemoteRequesting machServiceName];
  [v2 UTF8String];
  int v3 = sandbox_check();

  return v3 == 0;
}

- (void)_willBeginRemoteRequestWithUniqueIdentifier:(id)a3 statusHandler:(id)a4
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__ICMusicSubscriptionStatusController__willBeginRemoteRequestWithUniqueIdentifier_statusHandler___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (id)_remoteRequestingClientConnection
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__32226;
  id v13 = __Block_byref_object_dispose__32227;
  id v14 = 0;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke;
  v6[3] = &unk_1E5ACB5F0;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  v6[5] = &v9;
  dispatch_sync(accessQueue, v6);
  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return v4;
}

void __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_2;
  v11[3] = &unk_1E5ACD640;
  v11[4] = v7;
  id v12 = v5;
  id v13 = *(id *)(a1 + 40);
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

- (void)_cancelRemoteRequestingClientConnectionInvalidationTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  remoteRequestingClientConnectionInvalidationTimer = self->_remoteRequestingClientConnectionInvalidationTimer;
  if (remoteRequestingClientConnectionInvalidationTimer)
  {
    dispatch_source_cancel(remoteRequestingClientConnectionInvalidationTimer);
    id v4 = self->_remoteRequestingClientConnectionInvalidationTimer;
    self->_remoteRequestingClientConnectionInvalidationTimer = 0;
  }
}

- (void)performSubscriptionStatusRequest:(id)a3 withStatusHandler:(id)a4
{
  id v6 = a3;
  if ([(ICMusicSubscriptionStatusController *)self _willPerformSubscriptionStatusRequest:v6 withStatusHandler:a4])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke;
    v19[3] = &unk_1E5ACB500;
    v19[4] = self;
    id v7 = v6;
    id v20 = v7;
    uint64_t v8 = (void *)MEMORY[0x1A6240BF0](v19);
    id v9 = [v7 storeRequestContext];
    id v10 = [v9 identityStore];
    uint64_t v11 = [v9 identity];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_3;
    v14[3] = &unk_1E5ACB528;
    id v15 = v9;
    uint64_t v16 = self;
    id v18 = v8;
    id v17 = v7;
    id v12 = v8;
    id v13 = v9;
    [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
  }
}

- (BOOL)_willPerformSubscriptionStatusRequest:(id)a3 withStatusHandler:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 1;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__32226;
  v40 = __Block_byref_object_dispose__32227;
  id v41 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  accessQueue = self->_accessQueue;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __95__ICMusicSubscriptionStatusController__willPerformSubscriptionStatusRequest_withStatusHandler___block_invoke;
  v25 = &unk_1E5ACB640;
  objc_super v26 = self;
  id v9 = v6;
  id v27 = v9;
  uint64_t v29 = &v36;
  id v10 = v7;
  id v28 = v10;
  os_log_type_t v30 = &v42;
  __int16 v31 = &v32;
  dispatch_sync(accessQueue, &v22);
  LODWORD(accessQueue) = *((unsigned __int8 *)v43 + 24);
  uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (accessQueue)
  {
    if (v12)
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_pendingRequests count];
      *(_DWORD *)buf = 138543618;
      id v47 = v9;
      __int16 v48 = 2048;
      uint64_t v49 = v13;
      id v14 = "Performing %{public}@; total number of pending requests %llu";
      id v15 = v11;
      uint32_t v16 = 22;
LABEL_6:
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
  else if (v12)
  {
    uint64_t v17 = v37[5];
    uint64_t v18 = v33[3];
    uint64_t v19 = [(NSMutableDictionary *)self->_pendingRequests count];
    *(_DWORD *)buf = 138544130;
    id v47 = v9;
    __int16 v48 = 2114;
    uint64_t v49 = v17;
    __int16 v50 = 2048;
    uint64_t v51 = v18;
    __int16 v52 = 2048;
    uint64_t v53 = v19;
    id v14 = "Skipping redundant %{public}@; pending identical request %{public}@; total number of status handlers: %llu. to"
          "tal number of pending requests %llu";
    id v15 = v11;
    uint32_t v16 = 42;
    goto LABEL_6;
  }

  BOOL v20 = *((unsigned char *)v43 + 24) != 0;
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v20;
}

void __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    int v3 = [MEMORY[0x1E4F29128] UUID];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v3);
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Creating connection with identifier %{public}@ to music subscription status service.", buf, 0xCu);
    }

    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    id v6 = +[ICMusicSubscriptionStatusRemoteRequesting machServiceName];
    uint64_t v7 = [v5 initWithMachServiceName:v6 options:0];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = v7;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setExportedObject:");
    id v10 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v11 = +[ICMusicSubscriptionStatusRemoteRequesting clientInterface];
    [v10 setExportedInterface:v11];

    BOOL v12 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v13 = +[ICMusicSubscriptionStatusRemoteRequesting serviceInterface];
    [v12 setRemoteObjectInterface:v13];

    id v14 = *(void **)(*(void *)(a1 + 32) + 48);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_73;
    v24[3] = &unk_1E5ACB5C8;
    id v15 = v3;
    id v25 = v15;
    objc_copyWeak(&v26, (id *)(a1 + 48));
    [v14 setInterruptionHandler:v24];
    uint32_t v16 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    BOOL v20 = __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_2;
    id v21 = &unk_1E5ACB5C8;
    id v17 = v15;
    id v22 = v17;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    [v16 setInvalidationHandler:&v18];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "resume", v18, v19, v20, v21);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v26);
    id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

uint64_t __61__ICMusicSubscriptionStatusController_sharedStatusController__block_invoke()
{
  sharedStatusController_sSharedStatusController = objc_alloc_init(ICMusicSubscriptionStatusController);

  return MEMORY[0x1F41817F8]();
}

- (void)deliverSubscriptionStatusResponse:(id)a3 forRemoteRequestWithUniqueIdentifier:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116__ICMusicSubscriptionStatusController_deliverSubscriptionStatusResponse_forRemoteRequestWithUniqueIdentifier_error___block_invoke;
  v15[3] = &unk_1E5ACD640;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(accessQueue, v15);
}

uint64_t __43__ICMusicSubscriptionStatusController_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  *(void *)(*(void *)(a1 + 32) + 80) = objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_statusHandlersForPendingIdenticalRequests, 0);
  objc_storeStrong((id *)&self->_remoteRequestingClientConnectionInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_remoteRequestingClientConnectionIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteRequestingClientConnection, 0);
  objc_storeStrong((id *)&self->_privacyAcknowledgementObservationToken, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_handleSubscriptionStatusDidChangeDistributedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v9 = 138543874;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = @"ICMusicSubscriptionStatusDidChangeNotification";
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling %{public}@. Posting %{public}@.", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = [v4 userInfo];
  [v7 postNotificationName:@"ICMusicSubscriptionStatusDidChangeNotification" object:self userInfo:v8];
}

- (void)_handleSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v11 = 138543874;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 2114;
    id v16 = @"ICMusicSubscriptionStatusDidChangeNotification";
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling %{public}@. Posting %{public}@.", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = [v4 userInfo];
  [v7 postNotificationName:@"ICMusicSubscriptionStatusDidChangeNotification" object:self userInfo:v8];

  int v9 = [MEMORY[0x1E4F28F80] processInfo];
  LODWORD(v7) = objc_msgSend(v9, "ic_isCloudDaemon");

  if (v7)
  {
    id v10 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v10 postNotificationName:@"_ICMusicSubscriptionStatusDidChangeDistributedNotification" object:0 userInfo:0 deliverImmediately:1];
  }
}

- (void)_handleSubscriptionStatusCacheDidChangeNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v11 = 138543874;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 2114;
    id v16 = @"ICMusicSubscriptionStatusDidChangeNotification";
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling %{public}@. Posting %{public}@.", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = [v4 userInfo];
  [v7 postNotificationName:@"ICMusicSubscriptionStatusDidChangeNotification" object:self userInfo:v8];

  int v9 = [MEMORY[0x1E4F28F80] processInfo];
  LODWORD(v7) = objc_msgSend(v9, "ic_isCloudDaemon");

  if (v7)
  {
    id v10 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v10 postNotificationName:@"_ICMusicSubscriptionStatusDidChangeDistributedNotification" object:0 userInfo:0 deliverImmediately:1];
  }
}

- (void)_handleSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    *(_DWORD *)buf = 138543874;
    __int16 v13 = self;
    __int16 v14 = 2114;
    __int16 v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = @"ICMusicSubscriptionStatusDidChangeNotification";
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling %{public}@. Posting %{public}@.", buf, 0x20u);
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = +[ICUserIdentity activeAccount];
  int v11 = v8;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v7 postNotificationName:@"ICMusicSubscriptionStatusDidChangeNotification" object:self userInfo:v9];
}

- (void)_handlePrivacyAcknowledgementRequirementChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543874;
    id v8 = self;
    __int16 v9 = 1024;
    BOOL v10 = v3;
    __int16 v11 = 2114;
    id v12 = @"com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementDistributedNotification";
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling privacy acknowledgement requirement changed notification: isPrivacyAcknowledgementRequired = %{BOOL}u. Posting distributed notification %{public}@.", (uint8_t *)&v7, 0x1Cu);
  }

  id v6 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v6 postNotificationName:@"com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementDistributedNotification" object:0];
}

- (void)_cancelPendingRequests
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  BOOL v3 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NSMutableDictionary *)self->_pendingRequests allKeys];
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v4;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling requests for identifiers: %{public}@", buf, 0xCu);
  }
  id v5 = [(NSMutableDictionary *)self->_pendingRequests allValues];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        __int16 v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
        [(ICMusicSubscriptionStatusController *)self _deliverSubscriptionStatusResponse:0 forRequest:v10 error:v11];

        id v12 = [v10 requestIdentifier];
        [(ICMusicSubscriptionStatusController *)self _didEndRemoteRequestWithUniqueIdentifier:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void __95__ICMusicSubscriptionStatusController__willPerformSubscriptionStatusRequest_withStatusHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v8 = a3;
  if ([*(id *)(a1 + 32) isEqual:v8])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }
}

uint64_t __94__ICMusicSubscriptionStatusController__scheduleInvalidationOfRemoteRequestingClientConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _remoteRequestingClientConnectionInvalidationTimerDidExpire];
}

- (void)_remoteRequestingClientConnectionInvalidationTimerDidExpire
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  [(ICMusicSubscriptionStatusController *)self _cancelRemoteRequestingClientConnectionInvalidationTimer];

  [(ICMusicSubscriptionStatusController *)self _invalidateRemoteRequestingClientConnection];
}

- (void)_handleSeveredRemoteClientConnectionWithIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (NSUUID *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v5 = self->_remoteRequestingClientConnectionIdentifier;
  if (v5 == v4)
  {

    goto LABEL_7;
  }
  uint64_t v6 = v5;
  int v7 = [(NSUUID *)v5 isEqual:v4];

  if (v7)
  {
LABEL_7:
    [(ICMusicSubscriptionStatusController *)self _cancelPendingRequests];
    goto LABEL_8;
  }
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    remoteRequestingClientConnectionIdentifier = self->_remoteRequestingClientConnectionIdentifier;
    int v10 = 138543618;
    __int16 v11 = v4;
    __int16 v12 = 2114;
    long long v13 = remoteRequestingClientConnectionIdentifier;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "Identifier for severed connection to music subscription status service %{public}@ doesn't match current identifier: %{public}@. Ignoring.", (uint8_t *)&v10, 0x16u);
  }

LABEL_8:
}

void __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_73(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "Connection to music subscription status service with identifier %{public}@ interrupted.", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained[1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_74;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = WeakRetained;
  id v9 = *(id *)(a1 + 32);
  uint64_t v6 = WeakRetained;
  dispatch_async(v5, v7);
}

void __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "Connection to music subscription status service with identifier %{public}@ invalidated.", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained[1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_75;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = WeakRetained;
  id v9 = *(id *)(a1 + 32);
  uint64_t v6 = WeakRetained;
  dispatch_async(v5, v7);
}

uint64_t __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_75(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSeveredRemoteClientConnectionWithIdentifier:*(void *)(a1 + 40)];
}

uint64_t __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSeveredRemoteClientConnectionWithIdentifier:*(void *)(a1 + 40)];
}

- (void)_invalidateRemoteRequestingClientConnection
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  remoteRequestingClientConnection = self->_remoteRequestingClientConnection;
  if (remoteRequestingClientConnection)
  {
    id v4 = remoteRequestingClientConnection;
    id v5 = self->_remoteRequestingClientConnectionIdentifier;
    uint64_t v6 = self->_remoteRequestingClientConnection;
    self->_remoteRequestingClientConnection = 0;

    remoteRequestingClientConnectionIdentifier = self->_remoteRequestingClientConnectionIdentifier;
    self->_remoteRequestingClientConnectionIdentifier = 0;

    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      int v10 = v5;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating connection with identifier %{public}@ to music subscription status service.", (uint8_t *)&v9, 0xCu);
    }

    [(NSXPCConnection *)v4 invalidate];
  }
}

- (void)invalidateCachedSubscriptionStatusForUserIdentity:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACC0B0;
  uint64_t v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [(ICAsyncBlockOperation *)v8 initWithStartHandler:v12];
  [(NSOperationQueue *)self->_operationQueue addOperation:v11];
}

void __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[ICStoreRequestContext alloc] initWithIdentity:*(void *)(a1 + 32)];
  id v5 = +[ICMusicSubscriptionStatusCache sharedCache];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5ACB578;
  id v6 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = v6;
  void v8[4] = *(void *)(a1 + 40);
  id v7 = v3;
  [v5 setCachedSubscriptionStatusResponseNeedsReloadForRequestContext:v4 completion:v8];
}

void __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke_3;
    id v9 = &unk_1E5ACD2F0;
    id v11 = v4;
    id v10 = v3;
    dispatch_async(v5, &v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3, v6, v7, v8, v9);
}

uint64_t __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)invalidateCachedSubscriptionStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [ICAsyncBlockOperation alloc];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke;
  id v11 = &unk_1E5ACB5A0;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  uint64_t v7 = [(ICAsyncBlockOperation *)v5 initWithStartHandler:&v8];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v7, v8, v9, v10, v11, v12);
}

void __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating cached subscription status", buf, 2u);
  }

  id v5 = +[ICMusicSubscriptionStatusCache sharedCache];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke_67;
  v8[3] = &unk_1E5ACB578;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  void v8[4] = *(void *)(a1 + 32);
  id v7 = v3;
  [v5 setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion:v8];
}

void __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke_2;
    id v9 = &unk_1E5ACD2F0;
    id v11 = v4;
    id v10 = v3;
    dispatch_async(v5, &v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3, v6, v7, v8, v9);
}

uint64_t __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)refreshSubscriptionUsingRequestContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__ICMusicSubscriptionStatusController_refreshSubscriptionUsingRequestContext_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACC0B0;
  uint64_t v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  id v11 = [(ICAsyncBlockOperation *)v8 initWithStartHandler:v12];
  [(NSOperationQueue *)self->_operationQueue addOperation:v11];
}

void __100__ICMusicSubscriptionStatusController_refreshSubscriptionUsingRequestContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) identity];
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v16 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Refreshing subscription for user identity %@", buf, 0xCu);
  }

  id v6 = [[ICMusicSubscriptionRequest alloc] initWithStoreRequestContext:*(void *)(a1 + 32) requestType:2 requestingOfflineSlot:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__ICMusicSubscriptionStatusController_refreshSubscriptionUsingRequestContext_withCompletionHandler___block_invoke_65;
  v10[3] = &unk_1E5ACB550;
  id v11 = v4;
  id v7 = *(id *)(a1 + 48);
  id v13 = v3;
  id v14 = v7;
  uint64_t v12 = *(void *)(a1 + 40);
  id v8 = v3;
  id v9 = v4;
  [(ICRequestOperation *)v6 performRequestWithCompletionHandler:v10];
}

void __100__ICMusicSubscriptionStatusController_refreshSubscriptionUsingRequestContext_withCompletionHandler___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Failed to refresh subscription for user identity %@. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
    }
  }
  else
  {
    [*(id *)(a1 + 40) getSubscriptionStatusForUserIdentity:*(void *)(a1 + 32) bypassingCache:1 withCompletionHandler:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 48) finishWithError:v3];
}

- (void)refreshSubscriptionForUserIdentity:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[ICStoreRequestContext alloc] initWithIdentity:v7];

  [(ICMusicSubscriptionStatusController *)self refreshSubscriptionUsingRequestContext:v8 withCompletionHandler:v6];
}

- (void)refreshSubscriptionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ICUserIdentity activeAccount];
  [(ICMusicSubscriptionStatusController *)self refreshSubscriptionForUserIdentity:v5 withCompletionHandler:v4];
}

- (void)disableSubscriptionForUserIdentity:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__ICMusicSubscriptionStatusController_disableSubscriptionForUserIdentity_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACC0B0;
  id v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [(ICAsyncBlockOperation *)v8 initWithStartHandler:v12];
  [(NSOperationQueue *)self->_operationQueue addOperation:v11];
}

void __96__ICMusicSubscriptionStatusController_disableSubscriptionForUserIdentity_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Disabling subscription for user identity %@", buf, 0xCu);
  }

  id v6 = [[ICStoreRequestContext alloc] initWithIdentity:*(void *)(a1 + 32)];
  id v7 = [[ICMusicSubscriptionRequest alloc] initWithStoreRequestContext:v6 requestType:1 requestingOfflineSlot:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__ICMusicSubscriptionStatusController_disableSubscriptionForUserIdentity_withCompletionHandler___block_invoke_64;
  v10[3] = &unk_1E5ACB550;
  id v11 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v13 = v3;
  id v14 = v8;
  uint64_t v12 = *(void *)(a1 + 40);
  id v9 = v3;
  [(ICRequestOperation *)v7 performRequestWithCompletionHandler:v10];
}

void __96__ICMusicSubscriptionStatusController_disableSubscriptionForUserIdentity_withCompletionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Failed to disable subscription for user identity %{public}@. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
    }
  }
  else
  {
    [*(id *)(a1 + 40) getSubscriptionStatusForUserIdentity:*(void *)(a1 + 32) bypassingCache:1 withCompletionHandler:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 48) finishWithError:v3];
}

- (void)disableSubscriptionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ICUserIdentity activeAccount];
  [(ICMusicSubscriptionStatusController *)self disableSubscriptionForUserIdentity:v5 withCompletionHandler:v4];
}

- (void)enableSubscriptionForUserIdentity:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__ICMusicSubscriptionStatusController_enableSubscriptionForUserIdentity_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACC0B0;
  id v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [(ICAsyncBlockOperation *)v8 initWithStartHandler:v12];
  [(NSOperationQueue *)self->_operationQueue addOperation:v11];
}

void __95__ICMusicSubscriptionStatusController_enableSubscriptionForUserIdentity_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Enabling subscription for user identity %@", buf, 0xCu);
  }

  id v6 = [[ICStoreRequestContext alloc] initWithIdentity:*(void *)(a1 + 32)];
  id v7 = [[ICMusicSubscriptionRequest alloc] initWithStoreRequestContext:v6 requestType:0 requestingOfflineSlot:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__ICMusicSubscriptionStatusController_enableSubscriptionForUserIdentity_withCompletionHandler___block_invoke_62;
  v10[3] = &unk_1E5ACB550;
  id v11 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v13 = v3;
  id v14 = v8;
  uint64_t v12 = *(void *)(a1 + 40);
  id v9 = v3;
  [(ICRequestOperation *)v7 performRequestWithCompletionHandler:v10];
}

void __95__ICMusicSubscriptionStatusController_enableSubscriptionForUserIdentity_withCompletionHandler___block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Failed to enable subscription for user identity %{public}@. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
    }
  }
  else
  {
    [*(id *)(a1 + 40) getSubscriptionStatusForUserIdentity:*(void *)(a1 + 32) bypassingCache:1 withCompletionHandler:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 48) finishWithError:v3];
}

- (void)enableSubscriptionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ICUserIdentity activeAccount];
  [(ICMusicSubscriptionStatusController *)self enableSubscriptionForUserIdentity:v5 withCompletionHandler:v4];
}

void __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_48(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  id v2 = NSString;
  id v3 = [*(id *)(a1 + 32) identity];
  id v4 = [v2 stringWithFormat:@"Disallowing subscription status request for sandboxed user identity %@", v3];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v5];
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to obtain remote proxy to perform subscription status request. error = %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) deliverSubscriptionStatusResponse:0 forRemoteRequestWithUniqueIdentifier:*(void *)(a1 + 40) error:v3];
}

- (void)getSubscriptionStatusForUserIdentity:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)getSubscriptionStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ICUserIdentity activeAccount];
  [(ICMusicSubscriptionStatusController *)self getSubscriptionStatusForUserIdentity:v5 withCompletionHandler:v4];
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"ICMusicSubscriptionStatusCacheDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"ICMusicSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification" object:0];
  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self name:@"com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementDistributedNotification" object:0];
  id v5 = [MEMORY[0x1E4F28F80] processInfo];
  char v6 = objc_msgSend(v5, "ic_isCloudDaemon");

  if ((v6 & 1) == 0) {
    [v4 removeObserver:self name:@"_ICMusicSubscriptionStatusDidChangeDistributedNotification" object:0];
  }
  if (self->_privacyAcknowledgementObservationToken)
  {
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      privacyAcknowledgementObservationToken = self->_privacyAcknowledgementObservationToken;
      *(_DWORD *)buf = 138543874;
      id v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = @"Music";
      __int16 v17 = 2114;
      uint64_t v18 = privacyAcknowledgementObservationToken;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ ending observation of privacy acknowledgement for %{public}@ with token %{public}@.", buf, 0x20u);
    }

    id v9 = +[ICPrivacyInfo sharedPrivacyInfo];
    [v9 endObservingPrivacyAcknowledgementForIdentifier:@"Music" withToken:self->_privacyAcknowledgementObservationToken];
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ICMusicSubscriptionStatusController_dealloc__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_sync(accessQueue, block);

  v11.receiver = self;
  v11.super_class = (Class)ICMusicSubscriptionStatusController;
  [(ICMusicSubscriptionStatusController *)&v11 dealloc];
}

uint64_t __46__ICMusicSubscriptionStatusController_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelRemoteRequestingClientConnectionInvalidationTimer];
  id v2 = *(void **)(a1 + 32);

  return [v2 _invalidateRemoteRequestingClientConnection];
}

void __43__ICMusicSubscriptionStatusController_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _handlePrivacyAcknowledgementRequirementChanged:a3];
    id WeakRetained = v5;
  }
}

@end