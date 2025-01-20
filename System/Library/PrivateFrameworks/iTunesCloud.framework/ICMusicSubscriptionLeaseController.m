@interface ICMusicSubscriptionLeaseController
+ (ICMusicSubscriptionLeaseController)sharedController;
- (NSString)lastKnownHouseholdID;
- (id)_init;
- (void)_handlePlaybackLeaseDidEndPushNotification;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)getLastKnownHouseholdIDWithCompletion:(id)a3;
- (void)getLeaseSessionWithRequestContext:(id)a3 completionHandler:(id)a4;
- (void)musicLeaseSession:(id)a3 didFinishPlaybackRequest:(id)a4 withPlaybackResponse:(id)a5 responseError:(id)a6 updatedFairPlayKeyStatusList:(id)a7 completionHandler:(id)a8;
- (void)musicLeaseSession:(id)a3 requestsFairPlayKeyStatusUpdateWithCompletion:(id)a4;
- (void)receivedUserInteractionEvent;
@end

@implementation ICMusicSubscriptionLeaseController

uint64_t __54__ICMusicSubscriptionLeaseController_sharedController__block_invoke()
{
  sharedController_sSharedController_35553 = [[ICMusicSubscriptionLeaseController alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v20.receiver = self;
  v20.super_class = (Class)ICMusicSubscriptionLeaseController;
  v2 = [(ICMusicSubscriptionLeaseController *)&v20 init];
  if (v2)
  {
    v3 = MEMORY[0x1E4F14430];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionLeaseController.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionLeaseController.accessQueue", v3);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v6;

    v8 = +[ICEnvironmentMonitor sharedMonitor];
    v2->_isRemoteServerLikelyReachable = [v8 isRemoteServerLikelyReachable];
    [v8 registerObserver:v2];
    v2->_isServerReachable = v2->_isRemoteServerLikelyReachable;
    v9 = +[ICDefaults standardDefaults];
    uint64_t v10 = [v9 lastKnownHouseholdID];
    lastKnownHouseholdID = v2->_lastKnownHouseholdID;
    v2->_lastKnownHouseholdID = (NSString *)v10;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    leaseSessionPreparationOperationQueue = v2->_leaseSessionPreparationOperationQueue;
    v2->_leaseSessionPreparationOperationQueue = v12;

    [(NSOperationQueue *)v2->_leaseSessionPreparationOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_leaseSessionPreparationOperationQueue setName:@"com.apple.iTunesCloud.ICMusicSubscriptionLeaseController.leaseSessionPreparationOperationQueue"];
    [(NSOperationQueue *)v2->_leaseSessionPreparationOperationQueue setQualityOfService:25];
    objc_initWeak(&location, v2);
    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v15 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionLeaseController.notificationSerialQueue", v14);

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __43__ICMusicSubscriptionLeaseController__init__block_invoke;
    v17[3] = &unk_1E5ACC2F0;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch("com.apple.itunesstored.PlaybackLeaseDidEnd", &v2->_leaseDidEndNotificationToken, v15, v17);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
  return v2;
}

uint64_t __58__ICMusicSubscriptionLeaseController_lastKnownHouseholdID__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x1F41817F8]();
}

+ (ICMusicSubscriptionLeaseController)sharedController
{
  if (sharedController_sOnceToken_35551 != -1) {
    dispatch_once(&sharedController_sOnceToken_35551, &__block_literal_global_35552);
  }
  v2 = (void *)sharedController_sSharedController_35553;

  return (ICMusicSubscriptionLeaseController *)v2;
}

- (NSString)lastKnownHouseholdID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__35471;
  uint64_t v10 = __Block_byref_object_dispose__35472;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__ICMusicSubscriptionLeaseController_lastKnownHouseholdID__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaseSessionPreparationOperationQueue, 0);
  objc_storeStrong((id *)&self->_lastKnownHouseholdID, 0);
  objc_storeStrong((id *)&self->_cacheKeyToLeaseSession, 0);
  objc_storeStrong((id *)&self->_accountDSIDToFairPlayKeyStatus, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_handlePlaybackLeaseDidEndPushNotification
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_cacheKeyToLeaseSession allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _handlePlaybackLeaseDidEndPushNotification];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)receivedUserInteractionEvent
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__35471;
  v16 = __Block_byref_object_dispose__35472;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ICMusicSubscriptionLeaseController_receivedUserInteractionEvent__block_invoke;
  block[3] = &unk_1E5ACD880;
  block[4] = self;
  block[5] = &v12;
  dispatch_barrier_sync(accessQueue, block);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = (id)v13[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_receivedUserInteractionEvent", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

void __66__ICMusicSubscriptionLeaseController_receivedUserInteractionEvent__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 32) allValues];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)getLeaseSessionWithRequestContext:(id)a3 completionHandler:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [v6 identity];
  uint64_t v9 = [v6 identityStore];
  long long v10 = (void *)v9;
  if (v8 && v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke;
    v14[3] = &unk_1E5ACC518;
    v14[4] = self;
    id v18 = v7;
    id v15 = v6;
    id v16 = v10;
    id v17 = v8;
    [v16 getPropertiesForUserIdentity:v17 completionHandler:v14];
  }
  else if (v7)
  {
    uint64_t v19 = *MEMORY[0x1E4F28228];
    id v11 = [NSString stringWithFormat:@"Failed to get lease session [missing user identity or user identity store] - userIdentity=%@ - userIdentityStore=%@", v8, v9];
    v20[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_2;
    v20[3] = &unk_1E5ACC4C8;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v21 = v7;
    uint64_t v22 = v8;
    id v24 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 40);
    uint64_t v9 = (void (**)(void, void))MEMORY[0x1A6240BF0](v20);
    long long v10 = [*(id *)(a1 + 40) delegatedIdentity];
    if (v10)
    {
      id v11 = *(void **)(a1 + 48);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_11;
      v16[3] = &unk_1E5ACC4F0;
      id v18 = v9;
      id v19 = *(id *)(a1 + 64);
      id v17 = v10;
      [v11 getPropertiesForUserIdentity:v17 completionHandler:v16];
    }
    else
    {
      v9[2](v9, 0);
    }
  }
  else if (*(void *)(a1 + 64))
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    [v12 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    v13 = [NSString stringWithFormat:@"Failed to get lease session [no properties for user identity] - userIdentity=%@", *(void *)(a1 + 56)];
    [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28228]];

    uint64_t v14 = *(void *)(a1 + 64);
    if (v6)
    {
      (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v6);
    }
    else
    {
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v12];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
    }
  }
}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) DSID];
  id v5 = [v3 DSID];
  id v6 = [_ICMusicSubscriptionLeaseIdentityCacheKey alloc];
  id v7 = [*(id *)(a1 + 32) carrierBundleDeviceIdentifier];
  uint64_t v8 = [(_ICMusicSubscriptionLeaseIdentityCacheKey *)v6 initWithDSID:v4 carrierBundleDeviceIdentifier:v7 delegatedDSID:v5];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__35471;
  v33 = __Block_byref_object_dispose__35472;
  id v34 = 0;
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(NSObject **)(v9 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_3;
  block[3] = &unk_1E5ACCC88;
  v28 = &v29;
  block[4] = v9;
  id v11 = v8;
  v27 = v11;
  dispatch_sync(v10, block);
  if (v30[5])
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
  else
  {
    v13 = [ICAsyncBlockOperation alloc];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_4;
    id v18 = &unk_1E5ACC4A0;
    uint64_t v19 = *(void *)(a1 + 40);
    v25 = &v29;
    objc_super v20 = v11;
    id v24 = *(id *)(a1 + 56);
    id v21 = v4;
    id v22 = *(id *)(a1 + 48);
    id v23 = v3;
    uint64_t v14 = [(ICAsyncBlockOperation *)v13 initWithStartHandler:&v15];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "addOperation:", v14, v15, v16, v17, v18, v19);
  }
  _Block_object_dispose(&v29, 8);
}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_11(void *a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = v14;
  id v7 = v5;
  if (v14)
  {
    char v8 = [v14 isDelegated];
    id v6 = v14;
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = *(void (**)(void))(a1[5] + 16);
      goto LABEL_8;
    }
  }
  if ([v6 isDelegated])
  {
    uint64_t v9 = *(void (**)(void))(a1[5] + 16);
LABEL_8:
    v9();
    goto LABEL_9;
  }
  if (a1[6])
  {
    long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v11 = [NSString stringWithFormat:@"Failed to get lease session [invalid delegated identity] - delegatedIdentity=%@", a1[4]];
    [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28228]];

    uint64_t v12 = a1[6];
    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v10];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
LABEL_9:
}

uint64_t __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_3(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_5;
  block[3] = &unk_1E5ACCC88;
  uint64_t v28 = *(void *)(a1 + 80);
  block[4] = v4;
  id v27 = *(id *)(a1 + 40);
  dispatch_sync(v5, block);
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_6;
    v23[3] = &unk_1E5ACC428;
    id v7 = *(id *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    id v24 = v7;
    uint64_t v25 = v8;
    dispatch_async(v6, v23);
    [v3 finish];
    uint64_t v9 = v24;
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_7;
    v16[3] = &unk_1E5ACC450;
    void v16[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    id v20 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 72);
    id v21 = v3;
    long long v10 = (void *)MEMORY[0x1A6240BF0](v16);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(NSObject **)(v11 + 8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_9;
    v14[3] = &unk_1E5ACD2F0;
    v14[4] = v11;
    id v15 = v10;
    id v13 = v10;
    dispatch_barrier_async(v12, v14);

    uint64_t v9 = v17;
  }
}

uint64_t __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_5(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
  }
  return result;
}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = &unk_1EF640B28;
  }
  id v5 = [v3 objectForKey:v4];
  id v6 = objc_alloc_init(ICMusicSubscriptionLeaseStatus);
  [(ICMusicSubscriptionLeaseStatus *)v6 setShouldPlaybackRequireOnlineKeys:*(unsigned __int8 *)(*(void *)(a1 + 32) + 42)];
  if ([v5 hasOnlinePlaybackKeys])
  {
    [(ICMusicSubscriptionLeaseStatus *)v6 setHasOnlinePlaybackKeys:1];
    [(ICMusicSubscriptionLeaseStatus *)v6 setLeaseState:1];
  }
  -[ICMusicSubscriptionLeaseStatus setHasOfflinePlaybackKeys:](v6, "setHasOfflinePlaybackKeys:", [v5 hasOfflinePlaybackKeys]);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 40)) {
    [(ICMusicSubscriptionLeaseStatus *)v6 setHasPendingLeaseAcquisition:1];
  }
  id v7 = -[ICMusicSubscriptionLeaseSession _initWithRequestContext:isDelegatedLeaseSession:delegate:leaseStatus:]([ICMusicSubscriptionLeaseSession alloc], "_initWithRequestContext:isDelegatedLeaseSession:delegate:leaseStatus:", *(void *)(a1 + 48), [*(id *)(a1 + 56) isDelegated], *(void *)(a1 + 32), v6);
  if (v7)
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 32);
    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v10 + 32);
      *(void *)(v10 + 32) = v9;

      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    [v8 setObject:v7 forKey:*(void *)(a1 + 64)];
  }
  uint64_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_8;
  id v18 = &unk_1E5ACD2F0;
  id v13 = *(id *)(a1 + 80);
  id v19 = v7;
  id v20 = v13;
  id v14 = v7;
  dispatch_async(v12, &v15);
  objc_msgSend(*(id *)(a1 + 72), "finish", v15, v16, v17, v18);
}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_9(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = +[ICMusicSubscriptionFairPlayController sharedController];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_10;
    v5[3] = &unk_1E5ACC478;
    uint64_t v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    [v3 getKeyStatusListWithCompletionHandler:v5];
  }
}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        if (!*(void *)(*(void *)(a1 + 32) + 24))
        {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t v12 = *(void **)(v11 + 24);
          *(void *)(v11 + 24) = v10;
        }
        uint64_t v13 = objc_msgSend(v9, "accountUniqueIdentifier", (void)v16);
        id v14 = *(void **)(*(void *)(a1 + 32) + 24);
        uint64_t v15 = [NSNumber numberWithUnsignedLongLong:v13];
        [v14 setObject:v9 forKey:v15];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), 0);
  }
  return result;
}

- (void)getLastKnownHouseholdIDWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__ICMusicSubscriptionLeaseController_getLastKnownHouseholdIDWithCompletion___block_invoke;
    v7[3] = &unk_1E5ACD2F0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(accessQueue, v7);
  }
}

void __76__ICMusicSubscriptionLeaseController_getLastKnownHouseholdIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__ICMusicSubscriptionLeaseController_getLastKnownHouseholdIDWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5ACD2F0;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __76__ICMusicSubscriptionLeaseController_getLastKnownHouseholdIDWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)musicLeaseSession:(id)a3 requestsFairPlayKeyStatusUpdateWithCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v16 = self;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - musicLeaseSession:requestsFairPlayKeyStatusUpdateWithCompletion:", buf, 0xCu);
  }

  id v9 = +[ICMusicSubscriptionFairPlayController sharedController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke;
  v12[3] = &unk_1E5ACC400;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 getKeyStatusListWithCompletionHandler:v12];
}

void __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v24 = a3;
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v39;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
        if (!*(void *)(*(void *)(a1 + 32) + 24))
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v12 = *(void *)(a1 + 32);
          id v13 = *(void **)(v12 + 24);
          *(void *)(v12 + 24) = v11;
        }
        uint64_t v14 = [v10 accountUniqueIdentifier];
        uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 24);
        long long v16 = [NSNumber numberWithUnsignedLongLong:v14];
        [v15 setObject:v10 forKey:v16];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v7);
  }

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__35471;
  v36 = __Block_byref_object_dispose__35472;
  id v37 = 0;
  uint64_t v17 = *(void *)(a1 + 32);
  long long v18 = *(void **)(v17 + 32);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke_2;
  v29[3] = &unk_1E5ACC3D8;
  v29[4] = v17;
  id v30 = *(id *)(a1 + 40);
  uint64_t v31 = &v32;
  [v18 enumerateKeysAndObjectsUsingBlock:v29];
  if (!v33[5])
  {
    uint64_t v19 = [*(id *)(a1 + 40) leaseStatus];
    id v20 = (void *)v33[5];
    v33[5] = v19;
  }
  uint64_t v21 = *(void **)(a1 + 48);
  if (v21)
  {
    uint64_t v22 = *(void *)(a1 + 32);
    id v23 = *(NSObject **)(v22 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke_3;
    block[3] = &unk_1E5ACCEA0;
    block[4] = v22;
    uint64_t v28 = &v32;
    id v27 = v21;
    id v26 = v24;
    dispatch_async(v23, block);
  }
  _Block_object_dispose(&v32, 8);
}

void __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v14 = a3;
  id v5 = a2;
  id v6 = [v14 leaseStatus];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 leaseState];
  uint64_t v9 = [v5 DSID];

  id v10 = &unk_1EF640B28;
  if (v9) {
    id v10 = v9;
  }
  id v11 = v10;

  uint64_t v12 = [v7 stateReasonDialog];
  id v13 = [*(id *)(a1[4] + 24) objectForKey:v11];

  if ([v13 hasOnlinePlaybackKeys])
  {

    uint64_t v12 = 0;
    uint64_t v8 = 1;
  }
  else if (v8 == 1)
  {
    uint64_t v8 = 0;
  }
  [v7 setStateReasonDialog:v12];
  [v7 setLeaseState:v8];
  objc_msgSend(v7, "setHasOnlinePlaybackKeys:", objc_msgSend(v13, "hasOnlinePlaybackKeys"));
  objc_msgSend(v7, "setHasOfflinePlaybackKeys:", objc_msgSend(v13, "hasOfflinePlaybackKeys"));
  if ((id)a1[5] == v14) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
  }
  else {
    [v14 _setLeaseStatus:v7 updatedLeaseExpirationDate:0];
  }
}

uint64_t __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke_3(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void *)(*(void *)(a1[7] + 8) + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - musicLeaseSession:requestsFairPlayKeyStatusUpdateWithCompletion: - Completing with lease status: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)musicLeaseSession:(id)a3 didFinishPlaybackRequest:(id)a4 withPlaybackResponse:(id)a5 responseError:(id)a6 updatedFairPlayKeyStatusList:(id)a7 completionHandler:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v37 = self;
    __int16 v38 = 2048;
    id v39 = v16;
    __int16 v40 = 1024;
    int v41 = [v18 count];
    __int16 v42 = 2114;
    id v43 = v17;
    _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - musicLeaseSession:didFinishPlaybackRequest:withPlaybackResponse: finshed with response=%p, updatedFairPlayKeyStatusList(count)=%d, error=%{public}@...", buf, 0x26u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  if (v16) {
    BOOL v22 = v17 == 0;
  }
  else {
    BOOL v22 = 0;
  }
  block[1] = 3221225472;
  block[2] = __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke;
  block[3] = &unk_1E5ACC3B0;
  char v23 = v22;
  char v35 = v23;
  block[4] = self;
  id v30 = v16;
  id v31 = v18;
  id v32 = v14;
  id v33 = v15;
  id v34 = v19;
  id v24 = v19;
  id v25 = v15;
  id v26 = v14;
  id v27 = v18;
  id v28 = v16;
  dispatch_barrier_sync(accessQueue, block);
}

void __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 42) = *(unsigned char *)(a1 + 80);
  uint64_t v2 = [*(id *)(a1 + 40) householdID];
  id v25 = v2;
  if (v2)
  {
    uint64_t v3 = [v2 copy];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    int v6 = +[ICDefaults standardDefaults];
    [v6 setLastKnownHouseholdID:v25];
  }
  if (*(void *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v53;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v52 + 1) + 8 * v10);
          if (!*(void *)(*(void *)(a1 + 32) + 24))
          {
            id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            uint64_t v13 = *(void *)(a1 + 32);
            id v14 = *(void **)(v13 + 24);
            *(void *)(v13 + 24) = v12;
          }
          uint64_t v15 = [v11 accountUniqueIdentifier];
          id v16 = *(void **)(*(void *)(a1 + 32) + 24);
          id v17 = [NSNumber numberWithUnsignedLongLong:v15];
          [v16 setObject:v11 forKey:v17];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v8);
    }
  }
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__35471;
  v50 = __Block_byref_object_dispose__35472;
  id v51 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__35471;
  v44[4] = __Block_byref_object_dispose__35472;
  id v45 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  int v41 = __Block_byref_object_copy__35471;
  __int16 v42 = __Block_byref_object_dispose__35472;
  id v43 = 0;
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_2;
  v30[3] = &unk_1E5ACC360;
  char v37 = *(unsigned char *)(a1 + 80);
  v30[4] = v18;
  id v31 = *(id *)(a1 + 56);
  id v32 = *(id *)(a1 + 40);
  id v34 = &v38;
  id v33 = *(id *)(a1 + 64);
  char v35 = &v46;
  v36 = v44;
  [v19 enumerateKeysAndObjectsUsingBlock:v30];
  if (!v47[5])
  {
    uint64_t v20 = [*(id *)(a1 + 56) leaseStatus];
    uint64_t v21 = (void *)v47[5];
    v47[5] = v20;
  }
  BOOL v22 = v39[5];
  char v23 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (v22)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_3;
    block[3] = &unk_1E5ACC388;
    id v24 = (id *)v27;
    v27[0] = *(id *)(a1 + 72);
    v27[1] = &v46;
    v27[2] = v44;
    dispatch_group_notify(v22, v23, block);
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_2_25;
    v28[3] = &unk_1E5ACC388;
    id v24 = (id *)v29;
    v29[0] = *(id *)(a1 + 72);
    v29[1] = &v46;
    v29[2] = v44;
    dispatch_async(v23, v28);
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(&v46, 8);
}

void __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v5 leaseStatus];
  uint64_t v8 = (void *)[v7 copy];

  [v8 setShouldPlaybackRequireOnlineKeys:*(unsigned __int8 *)(a1 + 88)];
  uint64_t v9 = [v6 DSID];

  uint64_t v10 = &unk_1EF640B28;
  if (v9) {
    uint64_t v10 = v9;
  }
  id v11 = v10;

  id v12 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v11];
  uint64_t v13 = [v8 leaseState];
  id v14 = [v8 stateReasonDialog];
  uint64_t v15 = [v8 stateReasonDialogMetricsDictionary];
  if (*(id *)(a1 + 40) == v5)
  {
    id v16 = [*(id *)(a1 + 48) serverError];
    id v17 = v16;
    if (v16)
    {
      id v38 = v11;
      [v16 domain];
      v19 = uint64_t v18 = v17;
      int v20 = [v19 isEqualToString:@"ICStoreServerError"];

      if (v20)
      {
        uint64_t v21 = [v18 code];
        id v17 = v18;
        if ((unint64_t)(v21 - 3059) > 0x19)
        {
LABEL_18:
          id v11 = v38;
          goto LABEL_21;
        }
        id v11 = v38;
        if (((1 << (v21 + 13)) & 0x2000003) == 0)
        {
LABEL_21:

          goto LABEL_22;
        }
        uint64_t v37 = [*(id *)(a1 + 48) dialog];

        uint64_t v22 = [*(id *)(a1 + 48) metricsDictionary];

        char v23 = *(NSObject **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (!v23)
        {
          dispatch_group_t v24 = dispatch_group_create();
          uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
          id v26 = *(void **)(v25 + 40);
          *(void *)(v25 + 40) = v24;

          char v23 = *(NSObject **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        }
        dispatch_group_enter(v23);
        id v27 = +[ICMusicSubscriptionFairPlayController sharedController];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_23;
        v39[3] = &unk_1E5ACC338;
        v39[4] = *(void *)(a1 + 64);
        [v27 stopSubscriptionLeaseWithCompletion:v39];

        if (!v12)
        {
          uint64_t v13 = 2;
          id v14 = (void *)v37;
          uint64_t v15 = (void *)v22;
          goto LABEL_21;
        }
        uint64_t v18 = v17;
        id v28 = (void *)[v12 copy];

        [v28 setHasOnlinePlaybackKeys:0];
        [*(id *)(*(void *)(a1 + 32) + 24) setObject:v28 forKey:v38];
        uint64_t v13 = 2;
        id v14 = (void *)v37;
        uint64_t v15 = (void *)v22;
        id v12 = v28;
      }
    }
    else
    {
      uint64_t v29 = +[ICDefaults standardDefaults];
      if (![v29 shouldForceStreamingOnlyKeysForPlayback])
      {

        goto LABEL_21;
      }
      id v38 = v11;
      uint64_t v18 = 0;
      int v30 = [v12 hasOfflinePlaybackKeys];

      if (v30)
      {
        id v31 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v41 = v32;
          _os_log_impl(&dword_1A2D01000, v31, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - Resetting default to force streaming-only playback keys now that we have offline FairPlay keys", buf, 0xCu);
        }

        id v33 = +[ICDefaults standardDefaults];
        [v33 setShouldForceStreamingOnlyKeysForPlayback:0];
      }
    }
    id v17 = v18;
    goto LABEL_18;
  }
LABEL_22:
  if ([v12 hasOnlinePlaybackKeys])
  {
    if (*(id *)(a1 + 40) == v5 && (char v35 = *(void **)(a1 + 48)) != 0)
    {
      id v34 = [v35 leaseExpirationDate];
    }
    else
    {
      id v34 = 0;
    }

    id v14 = 0;
    uint64_t v13 = 1;
  }
  else
  {
    id v34 = 0;
    if (v13 == 1) {
      uint64_t v13 = 0;
    }
  }
  [v8 setStateReasonDialog:v14];
  [v8 setStateReasonDialogMetricsDictionary:v15];
  [v8 setLeaseState:v13];
  if (v13 == 2) {
    uint64_t v36 = [*(id *)(a1 + 56) isTriggeredByLeasePrevention];
  }
  else {
    uint64_t v36 = 0;
  }
  [v8 setTakenDueToLeasePrevention:v36];
  objc_msgSend(v8, "setHasOnlinePlaybackKeys:", objc_msgSend(v12, "hasOnlinePlaybackKeys"));
  objc_msgSend(v8, "setHasOfflinePlaybackKeys:", objc_msgSend(v12, "hasOfflinePlaybackKeys"));
  if (*(id *)(a1 + 40) == v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v8);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v34);
  }
  else
  {
    [v5 _setLeaseStatus:v8 updatedLeaseExpirationDate:v34];
  }
}

uint64_t __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_2_25(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

uint64_t __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_3(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

void __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_23(uint64_t a1)
{
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__ICMusicSubscriptionLeaseController_environmentMonitorDidChangeNetworkReachability___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __85__ICMusicSubscriptionLeaseController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isRemoteServerLikelyReachable];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 41) != v2)
  {
    *(unsigned char *)(v3 + 41) = v2;
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v4 + 41))
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v5 = objc_msgSend(*(id *)(v4 + 32), "allValues", 0);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * i) _handleRemoteServerDidBecomeLikelyReachable];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
    }
    else
    {
      uint64_t v10 = *(void **)(v4 + 32);
      [v10 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_18_35529];
    }
  }
}

void __85__ICMusicSubscriptionLeaseController_environmentMonitorDidChangeNetworkReachability___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = [v3 leaseStatus];
  id v5 = (id)[v4 copy];

  [v5 setShouldPlaybackRequireOnlineKeys:0];
  [v3 _setLeaseStatus:v5 updatedLeaseExpirationDate:0];
}

- (void)dealloc
{
  id v3 = +[ICEnvironmentMonitor sharedMonitor];
  [v3 unregisterObserver:self];

  notify_cancel(self->_leaseDidEndNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)ICMusicSubscriptionLeaseController;
  [(ICMusicSubscriptionLeaseController *)&v4 dealloc];
}

void __43__ICMusicSubscriptionLeaseController__init__block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v2 BOOLForKey:@"ICMusicSubscriptionLeaseIgnorePushNotifications"])
  {
    id v3 = +[ICDeviceInfo currentDeviceInfo];
    char v4 = [v3 isInternalBuild];

    if (v4) {
      return;
    }
  }
  else
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePlaybackLeaseDidEndPushNotification];
}

@end