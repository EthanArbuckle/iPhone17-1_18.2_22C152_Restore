@interface ICContentKeySession
+ (NSString)enhancedAudioSharedContentKeyPath;
+ (NSString)pendingInvalidationKeyStorePath;
+ (id)copyKeysToPendingInvalidationStoreFromPath:(id)a3;
- (BOOL)_isPrefetchKey:(id)a3;
- (BOOL)allowFallbackToStreamingKeys;
- (BOOL)bypassCache;
- (BOOL)isStoreKeyServer;
- (BOOL)requestOfflineKeys;
- (ICContentKeySession)init;
- (ICContentKeySession)initWithRequestContext:(id)a3;
- (ICContentKeySession)initWithRequestContext:(id)a3 keyStore:(id)a4;
- (ICContentKeySession)initWithRequestContext:(id)a3 keyStore:(id)a4 delegate:(id)a5;
- (ICContentKeyStoreProtocol)keyStore;
- (ICStoreRequestContext)requestContext;
- (NSNumber)adamID;
- (NSString)description;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (NSURL)offlineLeaseStartURL;
- (NSURL)offlineLeaseStopNonceURL;
- (NSURL)offlineLeaseStopURL;
- (NSURL)streamingleaseStopURL;
- (int64_t)keyServerProtocolType;
- (void)_finishProcessingKeyWithIdentifier:(id)a3;
- (void)_invalidateKeyWithIdentifier:(id)a3 forAdamID:(id)a4 offline:(BOOL)a5 usingAccountDSID:(id)a6 keyData:(id)a7 withCompletion:(id)a8;
- (void)_performKeyDeliveryRequestForContentKeyRequest:(id)a3 persistResponse:(BOOL)a4 isRenewal:(BOOL)a5;
- (void)_processKeyWithIdentifier:(id)a3;
- (void)_renewExpiredKeys;
- (void)_scheduleKeyRefreshTimer;
- (void)addAsset:(id)a3;
- (void)addAsset:(id)a3 shouldPreloadKeys:(BOOL)a4 waitForKeyIdentifiers:(BOOL)a5;
- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5;
- (void)contentKeySession:(id)a3 contentKeyRequestDidSucceed:(id)a4;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4;
- (void)dealloc;
- (void)invalidateKeyWithIdentifier:(id)a3 withCompletion:(id)a4;
- (void)pauseAutomaticKeyRenewal;
- (void)processKeyWithIdentifier:(id)a3;
- (void)removeAsset:(id)a3;
- (void)renewAllKeys;
- (void)resumeAutomaticKeyRenewal;
- (void)setAdamID:(id)a3;
- (void)setAllowFallbackToStreamingKeys:(BOOL)a3;
- (void)setBypassCache:(BOOL)a3;
- (void)setIsStoreKeyServer:(BOOL)a3;
- (void)setKeyCertificateURL:(id)a3;
- (void)setKeyServerProtocolType:(int64_t)a3;
- (void)setKeyServerURL:(id)a3;
- (void)setOfflineLeaseStartURL:(id)a3;
- (void)setOfflineLeaseStopNonceURL:(id)a3;
- (void)setOfflineLeaseStopURL:(id)a3;
- (void)setRequestOfflineKeys:(BOOL)a3;
- (void)setStreamingleaseStopURL:(id)a3;
- (void)stopSessionInvalidatingKeys:(BOOL)a3 withCompletion:(id)a4;
- (void)waitForAllKeysToProcess;
- (void)waitForAllKeysToProcessWithTimeout:(double)a3;
- (void)waitForKeyRenewalsWithCompletionHandler:(id)a3;
@end

@implementation ICContentKeySession

- (void)setOfflineLeaseStopURL:(id)a3
{
}

- (void)setOfflineLeaseStopNonceURL:(id)a3
{
}

- (void)setKeyServerProtocolType:(int64_t)a3
{
  self->_keyServerProtocolType = a3;
}

- (ICContentKeySession)initWithRequestContext:(id)a3 keyStore:(id)a4
{
  return [(ICContentKeySession *)self initWithRequestContext:a3 keyStore:a4 delegate:0];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p (%@, requestOfflineKeys:%d)>", objc_opt_class(), self, self->_contentKeySession, self->_requestOfflineKeys];
}

- (ICContentKeySession)initWithRequestContext:(id)a3 keyStore:(id)a4 delegate:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)ICContentKeySession;
  v11 = [(ICContentKeySession *)&v37 init];
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iTunesCloud.ICContentKeySession.accessQueue", 0);
    accessQueue = v11->_accessQueue;
    v11->_accessQueue = (OS_dispatch_queue *)v12;

    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    waitForKeysSemaphore = v11->_waitForKeysSemaphore;
    v11->_waitForKeysSemaphore = (OS_dispatch_semaphore *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    pendingKeyIdentifiers = v11->_pendingKeyIdentifiers;
    v11->_pendingKeyIdentifiers = (NSMutableSet *)v16;

    uint64_t v18 = [v8 copy];
    requestContext = v11->_requestContext;
    v11->_requestContext = (ICStoreRequestContext *)v18;

    objc_storeStrong((id *)&v11->_keyStore, a4);
    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    keyRenewalDates = v11->_keyRenewalDates;
    v11->_keyRenewalDates = (NSMutableDictionary *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    completedKeyRequests = v11->_completedKeyRequests;
    v11->_completedKeyRequests = (NSMutableDictionary *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    keyResponses = v11->_keyResponses;
    v11->_keyResponses = (NSMutableDictionary *)v24;

    objc_storeWeak((id *)&v11->_delegate, v10);
    v11->_active = 1;
    v11->_isStoreKeyServer = 1;
    v26 = +[ICContentKeySession enhancedAudioSharedContentKeyPath];
    v27 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v27 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:0];

    v28 = [[ICFileContentKeyStore alloc] initWithPath:v26];
    prefetchedContentKeyStore = v11->_prefetchedContentKeyStore;
    v11->_prefetchedContentKeyStore = v28;

    v30 = [[ICContentKeySessionPrefetchKeyConfiguration alloc] initWithRequestContext:v8];
    prefetchKeyConfiguration = v11->_prefetchKeyConfiguration;
    v11->_prefetchKeyConfiguration = v30;

    uint64_t v32 = [MEMORY[0x1E4F164F0] contentKeySessionWithKeySystem:*MEMORY[0x1E4F159F0]];
    contentKeySession = v11->_contentKeySession;
    v11->_contentKeySession = (AVContentKeySession *)v32;

    [(AVContentKeySession *)v11->_contentKeySession setDelegate:v11 queue:v11->_accessQueue];
    v34 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v11->_contentKeySession;
      *(_DWORD *)buf = 138543618;
      v39 = v11;
      __int16 v40 = 2114;
      v41 = v35;
      _os_log_impl(&dword_1A2D01000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Created AVContentKeySession %{public}@", buf, 0x16u);
    }
  }
  return v11;
}

+ (NSString)enhancedAudioSharedContentKeyPath
{
  if (enhancedAudioSharedContentKeyPath_onceToken != -1) {
    dispatch_once(&enhancedAudioSharedContentKeyPath_onceToken, &__block_literal_global_31252);
  }
  v2 = (void *)enhancedAudioSharedContentKeyPath_path;

  return (NSString *)v2;
}

void __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v58 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Stopping...", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 145) = 0;
  group = dispatch_group_create();
  v4 = [*(id *)(*(void *)(a1 + 32) + 32) identityStore];
  v5 = [*(id *)(*(void *)(a1 + 32) + 32) identity];
  id v55 = 0;
  objc_super v37 = [v4 DSIDForUserIdentity:v5 outError:&v55];
  id v6 = v55;

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v58 = v8;
      __int16 v59 = 2114;
      id v60 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to resolve DSID to invalidate keys with. err=%{public}@", buf, 0x16u);
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 48);
    if (v11)
    {
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_78;
      v49[3] = &unk_1E5ACB0C0;
      v50 = group;
      id v51 = v9;
      id v12 = v37;
      uint64_t v13 = *(void *)(a1 + 32);
      id v52 = v12;
      uint64_t v53 = v13;
      uint64_t v54 = *(void *)(a1 + 48);
      [v11 enumerateKeyEntriesUsingBlock:v49];

      uint64_t v10 = *(void *)(a1 + 32);
    }
    dispatch_semaphore_t v14 = [*(id *)(v10 + 112) allKeys];
    v15 = (void *)[v14 mutableCopy];

    [v15 removeObjectsInArray:v9];
    if ([v15 count])
    {
      v35 = v9;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v46 = 0u;
      long long v45 = 0u;
      v34 = v15;
      id obj = v15;
      uint64_t v16 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v46 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            v21 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:v20];
            if (v21)
            {
              [*(id *)(*(void *)(a1 + 32) + 128) removeObjectForKey:v20];
              dispatch_group_enter(group);
              uint64_t v22 = *(void **)(a1 + 32);
              uint64_t v23 = v22[5];
              uint64_t v24 = [v21 serverPlaybackContextData];
              v42[0] = MEMORY[0x1E4F143A8];
              v42[1] = 3221225472;
              v42[2] = __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_81;
              v42[3] = &unk_1E5ACB098;
              v42[4] = *(void *)(a1 + 32);
              v42[5] = v20;
              uint64_t v44 = *(void *)(a1 + 48);
              v43 = group;
              [v22 _invalidateKeyWithIdentifier:v20 forAdamID:v23 offline:0 usingAccountDSID:v37 keyData:v24 withCompletion:v42];
            }
            else
            {
              v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                uint64_t v26 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138543618;
                uint64_t v58 = v26;
                __int16 v59 = 2114;
                id v60 = v20;
                _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Skipping invalidation for key '%{public}@' because the previous response couldn't be found", buf, 0x16u);
              }
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
        }
        while (v17);
      }

      id v9 = v35;
      v15 = v34;
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 112) removeAllObjects];
  uint64_t v27 = *(void *)(a1 + 32);
  v28 = *(NSObject **)(v27 + 136);
  if (v28)
  {
    dispatch_source_cancel(v28);
    uint64_t v29 = *(void *)(a1 + 32);
    v30 = *(void **)(v29 + 136);
    *(void *)(v29 + 136) = 0;

    uint64_t v27 = *(void *)(a1 + 32);
  }
  v31 = *(NSObject **)(v27 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_82;
  block[3] = &unk_1E5ACB0E8;
  block[4] = v27;
  id v32 = *(id *)(a1 + 40);
  uint64_t v33 = *(void *)(a1 + 48);
  id v40 = v32;
  uint64_t v41 = v33;
  dispatch_group_notify(group, v31, block);
}

+ (NSString)pendingInvalidationKeyStorePath
{
  v2 = MSVMobileHomeDirectory();
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"Media/ContentKeys/PendingInvalidation"];

  return (NSString *)v3;
}

uint64_t __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_82(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Session stopped", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopSessionInvalidatingKeys:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__30924;
  v13[4] = __Block_byref_object_dispose__30925;
  id v14 = 0;
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke;
  v9[3] = &unk_1E5ACB110;
  BOOL v12 = a3;
  id v10 = v6;
  v11 = v13;
  v9[4] = self;
  id v8 = v6;
  dispatch_sync(accessQueue, v9);

  _Block_object_dispose(v13, 8);
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  keyRenewalTimer = self->_keyRenewalTimer;
  if (keyRenewalTimer) {
    dispatch_source_cancel(keyRenewalTimer);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = self->_renewalCompletionBlocks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)ICContentKeySession;
  [(ICContentKeySession *)&v9 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineLeaseStopURL, 0);
  objc_storeStrong((id *)&self->_offlineLeaseStopNonceURL, 0);
  objc_storeStrong((id *)&self->_offlineLeaseStartURL, 0);
  objc_storeStrong((id *)&self->_streamingleaseStopURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyRenewalTimer, 0);
  objc_storeStrong((id *)&self->_keyResponses, 0);
  objc_storeStrong((id *)&self->_completedKeyRequests, 0);
  objc_storeStrong((id *)&self->_keyRenewalDates, 0);
  objc_storeStrong((id *)&self->_prefetchedContentKeyStore, 0);
  objc_storeStrong((id *)&self->_prefetchKeyConfiguration, 0);
  objc_storeStrong((id *)&self->_waitForKeysSemaphore, 0);
  objc_storeStrong((id *)&self->_renewalCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingRenewalKeyIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingKeyIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);

  objc_storeStrong((id *)&self->_keyServerURL, 0);
}

- (NSURL)offlineLeaseStopURL
{
  return self->_offlineLeaseStopURL;
}

- (NSURL)offlineLeaseStopNonceURL
{
  return self->_offlineLeaseStopNonceURL;
}

- (void)setOfflineLeaseStartURL:(id)a3
{
}

- (NSURL)offlineLeaseStartURL
{
  return self->_offlineLeaseStartURL;
}

- (void)setStreamingleaseStopURL:(id)a3
{
}

- (NSURL)streamingleaseStopURL
{
  return self->_streamingleaseStopURL;
}

- (ICContentKeyStoreProtocol)keyStore
{
  return self->_keyStore;
}

- (int64_t)keyServerProtocolType
{
  return self->_keyServerProtocolType;
}

- (void)setIsStoreKeyServer:(BOOL)a3
{
  self->_isStoreKeyServer = a3;
}

- (BOOL)isStoreKeyServer
{
  return self->_isStoreKeyServer;
}

- (void)setAllowFallbackToStreamingKeys:(BOOL)a3
{
  self->_allowFallbackToStreamingKeys = a3;
}

- (BOOL)allowFallbackToStreamingKeys
{
  return self->_allowFallbackToStreamingKeys;
}

- (void)setRequestOfflineKeys:(BOOL)a3
{
  self->_requestOfflineKeys = a3;
}

- (BOOL)requestOfflineKeys
{
  return self->_requestOfflineKeys;
}

- (void)setBypassCache:(BOOL)a3
{
  self->_bypassCache = a3;
}

- (BOOL)bypassCache
{
  return self->_bypassCache;
}

- (void)setAdamID:(id)a3
{
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setKeyCertificateURL:(id)a3
{
}

- (NSURL)keyCertificateURL
{
  return self->_keyCertificateURL;
}

- (void)setKeyServerURL:(id)a3
{
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)_invalidateKeyWithIdentifier:(id)a3 forAdamID:(id)a4 offline:(BOOL)a5 usingAccountDSID:(id)a6 keyData:(id)a7 withCompletion:(id)a8
{
  BOOL v11 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  uint64_t v15 = (NSNumber *)a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  uint64_t v20 = v19;
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v21 = ICCreateLoggableValueForDSID(v16);
      *(_DWORD *)buf = 138544130;
      uint64_t v42 = self;
      __int16 v43 = 2114;
      id v44 = v14;
      __int16 v45 = 1024;
      BOOL v46 = v11;
      __int16 v47 = 2114;
      long long v48 = v21;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - invalidating key with identifier '%{public}@'. offline=%{BOOL}u, accountDSID=%{public}@", buf, 0x26u);
    }
    [(NSMutableDictionary *)self->_keyRenewalDates removeObjectForKey:v14];
    adamID = v15;
    if (!v15) {
      adamID = self->_adamID;
    }
    uint64_t v23 = adamID;
    if (v11)
    {
      uint64_t v24 = [[ICContentKeyNonceRequest alloc] initWithStoreRequestContext:self->_requestContext adamID:v23 accountDSID:v16 keyServerURL:self->_offlineLeaseStopNonceURL];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_109;
      v32[3] = &unk_1E5ACB270;
      v32[4] = self;
      id v33 = v14;
      id v37 = v18;
      id v34 = v17;
      id v35 = v16;
      v36 = v23;
      [(ICContentKeyNonceRequest *)v24 performWithResponseHandler:v32];
    }
    else
    {
      streamingleaseStopURL = self->_streamingleaseStopURL;
      if (streamingleaseStopURL || (streamingleaseStopURL = self->_keyServerURL) != 0)
      {
        uint64_t v27 = streamingleaseStopURL;
      }
      else
      {
        uint64_t v27 = [(ICContentKeySessionPrefetchKeyConfiguration *)self->_prefetchKeyConfiguration keyServerURL];
      }
      uint64_t v24 = (ICContentKeyNonceRequest *)v27;
      keyCertificateURL = self->_keyCertificateURL;
      if (keyCertificateURL)
      {
        uint64_t v29 = keyCertificateURL;
      }
      else
      {
        uint64_t v29 = [(ICContentKeySessionPrefetchKeyConfiguration *)self->_prefetchKeyConfiguration keyCertificateURL];
      }
      v30 = v29;
      v31 = [[ICSecureKeyDeliveryRequest alloc] initWithRequestContext:self->_requestContext serverPlaybackContextData:v17];
      [(ICSecureKeyDeliveryRequest *)v31 setContentURI:v14];
      [(ICSecureKeyDeliveryRequest *)v31 setShouldIncludeDeviceGUID:1];
      [(ICSecureKeyDeliveryRequest *)v31 setCertificateURL:v30];
      [(ICSecureKeyDeliveryRequest *)v31 setKeyServerURL:v24];
      [(ICSecureKeyDeliveryRequest *)v31 setITunesStoreRequest:[(ICContentKeySession *)self isStoreKeyServer]];
      [(ICSecureKeyDeliveryRequest *)v31 setIsOfflineDownload:0];
      [(ICSecureKeyDeliveryRequest *)v31 setAdamID:v23];
      [(ICSecureKeyDeliveryRequest *)v31 setRequestProtocolType:self->_keyServerProtocolType];
      [(ICSecureKeyDeliveryRequest *)v31 setLeaseActionType:3];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke;
      v38[3] = &unk_1E5ACB220;
      v38[4] = self;
      id v39 = v14;
      id v40 = v18;
      [(ICSecureKeyDeliveryRequest *)v31 performWithResponseHandler:v38];
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v25 = ICCreateLoggableValueForDSID(v16);
    *(_DWORD *)buf = 138544130;
    uint64_t v42 = self;
    __int16 v43 = 2114;
    id v44 = v14;
    __int16 v45 = 1024;
    BOOL v46 = v11;
    __int16 v47 = 2114;
    long long v48 = v25;
    _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - not invalidating key with identifier '%{public}@'. offline=%{BOOL}u, accountDSID=%{public}@ as keyData is nil", buf, 0x26u);
  }
  if (v18)
  {
    uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
    (*((void (**)(id, NSNumber *))v18 + 2))(v18, v23);
LABEL_20:
  }
}

void __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      objc_super v9 = objc_msgSend(v4, "msv_description");
      int v12 = 138543874;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Completed stop request for key identifier '%{public}@' error=%{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed stop request for key identifier '%{public}@'", (uint8_t *)&v12, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_109(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = objc_msgSend(v6, "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v9;
      __int16 v29 = 2114;
      uint64_t v30 = v10;
      __int16 v31 = 2114;
      id v32 = v11;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Completed stop nonce request for key identifier '%{public}@' error=%{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v12;
      __int16 v29 = 2114;
      uint64_t v30 = v13;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed stop nonce request for key identifier '%{public}@'", buf, 0x16u);
    }

    __int16 v14 = [v5 nonceData];
    uint64_t v25 = *MEMORY[0x1E4F159E8];
    uint64_t v26 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 24);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_111;
    v19[3] = &unk_1E5ACB248;
    v19[4] = v16;
    uint64_t v18 = *(void *)(a1 + 48);
    id v20 = *(id *)(a1 + 40);
    id v24 = *(id *)(a1 + 72);
    id v21 = 0;
    id v22 = *(id *)(a1 + 56);
    id v23 = *(id *)(a1 + 64);
    [v17 invalidatePersistableContentKey:v18 options:v15 completionHandler:v19];
  }
}

void __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v8;
      __int16 v27 = 2114;
      uint64_t v28 = v9;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to invalidate persisted key for identifier '%{public}@'. err=%{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 200);
    if (v11 || (uint64_t v11 = *(void **)(v10 + 8)) != 0)
    {
      id v12 = v11;
    }
    else
    {
      id v12 = [*(id *)(v10 + 96) keyServerURL];
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 16);
    if (v15)
    {
      id v16 = v15;
    }
    else
    {
      id v16 = [*(id *)(v14 + 96) keyCertificateURL];
    }
    id v17 = v16;
    uint64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v19;
      __int16 v27 = 2114;
      uint64_t v28 = v17;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "%{public}@ certificateURL=%{public}@", buf, 0x16u);
    }

    id v20 = [[ICSecureKeyDeliveryRequest alloc] initWithRequestContext:*(void *)(*(void *)(a1 + 32) + 32) serverPlaybackContextData:v5];
    [(ICSecureKeyDeliveryRequest *)v20 setContentURI:*(void *)(a1 + 40)];
    [(ICSecureKeyDeliveryRequest *)v20 setAccountDSID:*(void *)(a1 + 56)];
    [(ICSecureKeyDeliveryRequest *)v20 setShouldIncludeDeviceGUID:1];
    [(ICSecureKeyDeliveryRequest *)v20 setCertificateURL:v17];
    [(ICSecureKeyDeliveryRequest *)v20 setKeyServerURL:v13];
    -[ICSecureKeyDeliveryRequest setITunesStoreRequest:](v20, "setITunesStoreRequest:", [*(id *)(a1 + 32) isStoreKeyServer]);
    [(ICSecureKeyDeliveryRequest *)v20 setIsOfflineDownload:0];
    [(ICSecureKeyDeliveryRequest *)v20 setAdamID:*(void *)(a1 + 64)];
    [(ICSecureKeyDeliveryRequest *)v20 setRequestProtocolType:*(void *)(*(void *)(a1 + 32) + 168)];
    [(ICSecureKeyDeliveryRequest *)v20 setLeaseActionType:3];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_112;
    v22[3] = &unk_1E5ACB220;
    id v21 = *(void **)(a1 + 40);
    v22[4] = *(void *)(a1 + 32);
    id v23 = v21;
    id v24 = *(id *)(a1 + 72);
    [(ICSecureKeyDeliveryRequest *)v20 performWithResponseHandler:v22];
  }
}

void __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_112(void *a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  id v6 = v5;
  if (v4)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    uint64_t v9 = objc_msgSend(v4, "msv_description");
    int v18 = 138543874;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    uint64_t v10 = "%{public}@ [SKD] - Completed stop request for key identifier '%{public}@' error=%{public}@";
    uint64_t v11 = v6;
    uint32_t v12 = 32;
    goto LABEL_4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = a1[4];
    uint64_t v14 = a1[5];
    int v18 = 138543618;
    uint64_t v19 = v13;
    __int16 v20 = 2114;
    uint64_t v21 = v14;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed stop request for key identifier '%{public}@'", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v15 = *(void **)(a1[4] + 48);
  if (v15)
  {
    id v6 = [v15 removeKeyForIdentifier:a1[5]];
    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    uint64_t v16 = a1[4];
    uint64_t v17 = a1[5];
    int v18 = 138543618;
    uint64_t v19 = v16;
    __int16 v20 = 2114;
    uint64_t v21 = v17;
    uint64_t v10 = "%{public}@ [SKD] - Failed to purge persisted key with identifier '%{public}@'";
    uint64_t v11 = v9;
    uint32_t v12 = 22;
LABEL_4:
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v18, v12);
LABEL_5:

    goto LABEL_6;
  }
LABEL_7:
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_finishProcessingKeyWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  pendingKeyIdentifiers = self->_pendingKeyIdentifiers;
  id v5 = a3;
  [(NSMutableSet *)pendingKeyIdentifiers removeObject:v5];
  [(NSMutableSet *)self->_pendingRenewalKeyIdentifiers removeObject:v5];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitForKeysSemaphore);
  if (![(NSMutableSet *)self->_pendingRenewalKeyIdentifiers count]
    && [(NSMutableArray *)self->_renewalCompletionBlocks count])
  {
    id v6 = (void *)[(NSMutableArray *)self->_renewalCompletionBlocks copy];
    renewalCompletionBlocks = self->_renewalCompletionBlocks;
    self->_renewalCompletionBlocks = 0;

    uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = self;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Finished waiting for key renewals to complete", (uint8_t *)&v9, 0xCu);
    }

    [v6 enumerateObjectsUsingBlock:&__block_literal_global_107];
  }
}

uint64_t __58__ICContentKeySession__finishProcessingKeyWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)_processKeyWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    uint64_t v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Requesting key with identifier %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(NSMutableSet *)self->_pendingKeyIdentifiers addObject:v4];
  [(AVContentKeySession *)self->_contentKeySession processContentKeyRequestWithIdentifier:v4 initializationData:0 options:0];
}

- (void)_renewExpiredKeys
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = [v3 dateByAddingTimeInterval:60.0];

  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v18 = self;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Renewing key requests due to expire before %{public}@", buf, 0x16u);
  }

  int v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableDictionary count](self->_keyRenewalDates, "count"));
  keyRenewalDates = self->_keyRenewalDates;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__ICContentKeySession__renewExpiredKeys__block_invoke;
  v14[3] = &unk_1E5ACB1D8;
  id v8 = v4;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  [(NSMutableDictionary *)keyRenewalDates enumerateKeysAndObjectsUsingBlock:v14];
  if ([v9 count])
  {
    pendingRenewalKeyIdentifiers = self->_pendingRenewalKeyIdentifiers;
    if (pendingRenewalKeyIdentifiers)
    {
      [(NSMutableSet *)pendingRenewalKeyIdentifiers unionSet:v9];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithSet:v9];
      uint32_t v12 = self->_pendingRenewalKeyIdentifiers;
      self->_pendingRenewalKeyIdentifiers = v11;
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__ICContentKeySession__renewExpiredKeys__block_invoke_2;
  v13[3] = &unk_1E5ACCE28;
  v13[4] = self;
  [v9 enumerateObjectsUsingBlock:v13];
}

void __40__ICContentKeySession__renewExpiredKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 compare:*(void *)(a1 + 32)] == -1) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __40__ICContentKeySession__renewExpiredKeys__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 112) removeObjectForKey:v3];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKey:v3];
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = objc_msgSend(v4, "ic_description");
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v8;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Renewing key request %{public}@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 120) removeObjectForKey:v3];
    [*(id *)(*(void *)(a1 + 32) + 24) renewExpiringResponseDataForContentKeyRequest:v4];
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - No existing key request to renew for identifier %{public}@ - requesting a new one", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) processContentKeyRequestWithIdentifier:v3 initializationData:0 options:0];
  }
}

- (void)_scheduleKeyRefreshTimer
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_automaticKeyRenewalPaused)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Automatic key renewal is currently paused", buf, 0xCu);
    }
  }
  else
  {
    if (!self->_keyRenewalTimer)
    {
      id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_accessQueue);
      keyRenewalTimer = self->_keyRenewalTimer;
      self->_keyRenewalTimer = v4;
      BOOL v6 = v4;

      objc_initWeak((id *)buf, self);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __47__ICContentKeySession__scheduleKeyRefreshTimer__block_invoke;
      handler[3] = &unk_1E5ACD778;
      objc_copyWeak(&v18, (id *)buf);
      dispatch_source_set_event_handler(v6, handler);
      dispatch_resume(v6);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    if ([(NSMutableDictionary *)self->_keyRenewalDates count])
    {
      uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        keyRenewalDates = self->_keyRenewalDates;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = keyRenewalDates;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Scheduling next key renewal using renewal times %{public}@", buf, 0x16u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v24 = __Block_byref_object_copy__30924;
      uint64_t v25 = __Block_byref_object_dispose__30925;
      id v26 = 0;
      uint64_t v9 = self->_keyRenewalDates;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __47__ICContentKeySession__scheduleKeyRefreshTimer__block_invoke_102;
      v16[3] = &unk_1E5ACB1B0;
      v16[4] = buf;
      [(NSMutableDictionary *)v9 enumerateKeysAndObjectsUsingBlock:v16];
      [*(id *)(*(void *)&buf[8] + 40) timeIntervalSinceNow];
      if (v10 >= 1.0)
      {
        uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)__int16 v19 = 138543618;
          __int16 v20 = self;
          __int16 v21 = 2114;
          uint64_t v22 = v12;
          _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Scheduling next key refresh at %{public}@", v19, 0x16u);
        }

        id v13 = self->_keyRenewalTimer;
        [*(id *)(*(void *)&buf[8] + 40) timeIntervalSinceNow];
        dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
        dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      }
      else
      {
        [(ICContentKeySession *)self _renewExpiredKeys];
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      dispatch_source_set_timer((dispatch_source_t)self->_keyRenewalTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
  }
}

void __47__ICContentKeySession__scheduleKeyRefreshTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _renewExpiredKeys];
}

void __47__ICContentKeySession__scheduleKeyRefreshTimer__block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  BOOL v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v7 + 40))
  {
    if (objc_msgSend(v5, "compare:") != -1) {
      goto LABEL_5;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v7 + 40), a3);
LABEL_5:
}

- (void)_performKeyDeliveryRequestForContentKeyRequest:(id)a3 persistResponse:(BOOL)a4 isRenewal:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 identifier];
  BOOL v10 = [(ICContentKeySession *)self _isPrefetchKey:v9];
  BOOL v11 = v10;
  uint64_t v12 = 48;
  if (v10) {
    uint64_t v12 = 104;
  }
  id v13 = *(id *)((char *)&self->super.isa + v12);
  if (v6 && (offlineLeaseStartURL = self->_offlineLeaseStartURL) != 0
    || (offlineLeaseStartURL = self->_keyServerURL) != 0)
  {
    dispatch_time_t v15 = offlineLeaseStartURL;
  }
  else
  {
    dispatch_time_t v15 = [(ICContentKeySessionPrefetchKeyConfiguration *)self->_prefetchKeyConfiguration keyServerURL];
  }
  id v16 = v15;
  keyCertificateURL = self->_keyCertificateURL;
  if (keyCertificateURL)
  {
    id v18 = keyCertificateURL;
  }
  else
  {
    id v18 = [(ICContentKeySessionPrefetchKeyConfiguration *)self->_prefetchKeyConfiguration keyCertificateURL];
  }
  __int16 v19 = v18;
  __int16 v20 = [[ICSecureKeyDeliveryRequest alloc] initWithRequestContext:self->_requestContext contentKeyRequest:v8];
  [(ICSecureKeyDeliveryRequest *)v20 setShouldIncludeDeviceGUID:1];
  [(ICSecureKeyDeliveryRequest *)v20 setCertificateURL:v19];
  [(ICSecureKeyDeliveryRequest *)v20 setKeyServerURL:v16];
  [(ICSecureKeyDeliveryRequest *)v20 setITunesStoreRequest:[(ICContentKeySession *)self isStoreKeyServer]];
  [(ICSecureKeyDeliveryRequest *)v20 setIsOfflineDownload:v6];
  if (v11) {
    adamID = (NSNumber *)&unk_1EF640A68;
  }
  else {
    adamID = self->_adamID;
  }
  [(ICSecureKeyDeliveryRequest *)v20 setAdamID:adamID];
  [(ICSecureKeyDeliveryRequest *)v20 setRequestProtocolType:self->_keyServerProtocolType];
  [(ICSecureKeyDeliveryRequest *)v20 setLeaseActionType:2];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __96__ICContentKeySession__performKeyDeliveryRequestForContentKeyRequest_persistResponse_isRenewal___block_invoke;
  v25[3] = &unk_1E5ACB188;
  v25[4] = self;
  id v26 = v8;
  BOOL v29 = v6;
  id v27 = v9;
  id v28 = v13;
  BOOL v30 = a5;
  id v22 = v13;
  id v23 = v9;
  id v24 = v8;
  [(ICSecureKeyDeliveryRequest *)v20 performWithResponseHandler:v25];
}

void __96__ICContentKeySession__performKeyDeliveryRequestForContentKeyRequest_persistResponse_isRenewal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__ICContentKeySession__performKeyDeliveryRequestForContentKeyRequest_persistResponse_isRenewal___block_invoke_2;
  block[3] = &unk_1E5ACB160;
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  char v19 = *(unsigned char *)(a1 + 64);
  id v16 = v9;
  id v17 = v5;
  id v18 = *(id *)(a1 + 56);
  char v20 = *(unsigned char *)(a1 + 65);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, block);
}

void __96__ICContentKeySession__performKeyDeliveryRequestForContentKeyRequest_persistResponse_isRenewal___block_invoke_2(uint64_t a1)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v93 = v5;
      __int16 v94 = 2114;
      v95 = v6;
      __int16 v96 = 2114;
      id v97 = v2;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Secure key request failed for request %{public}@. err=%{public}@", buf, 0x20u);
    }
    [*(id *)(*(void *)(a1 + 40) + 128) removeObjectForKey:*(void *)(a1 + 56)];
    if (!*(unsigned char *)(a1 + 80) || ![*(id *)(a1 + 40) allowFallbackToStreamingKeys]) {
      goto LABEL_11;
    }
    id v7 = [v2 domain];
    if ([v7 isEqualToString:@"ICKeyServerError"])
    {
      uint64_t v8 = [v2 code];

      if (v8 == -1004)
      {
        id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          uint64_t v93 = v10;
          _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Key server returned a slot error - disabling requesting of offline keys for future retries", buf, 0xCu);
        }

        *(unsigned char *)(*(void *)(a1 + 40) + 161) = 0;
        id v7 = +[ICDefaults standardDefaults];
        [v7 setShouldForceStreamingOnlyKeysForPlayback:1];
        goto LABEL_33;
      }
LABEL_11:
      id v11 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
      uint64_t v14 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v93 = v12;
      __int16 v94 = 2114;
      v95 = v13;
      __int16 v96 = 2114;
      id v97 = v14;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Secure key request completed for request %{public}@. response=%{public}@", buf, 0x20u);
    }
    [*(id *)(*(void *)(a1 + 40) + 128) setObject:*(void *)(a1 + 64) forKey:*(void *)(a1 + 56)];
    if (!*(unsigned char *)(a1 + 80))
    {
      id v34 = [*(id *)(a1 + 64) contentKeyContextData];
      if (v34)
      {
        id v7 = v34;
        id v2 = 0;
        id v11 = v7;
      }
      else
      {
        id v11 = [MEMORY[0x1E4F1C9B8] data];
        id v7 = 0;
        id v2 = 0;
      }
      goto LABEL_34;
    }
    id v7 = *(id *)(a1 + 48);
    id v15 = [*(id *)(a1 + 64) contentKeyContextData];
    id v91 = 0;
    id v11 = [v7 persistableContentKeyFromKeyVendorResponse:v15 options:0 error:&v91];
    id v2 = v91;

    if (v11)
    {
      id v16 = [*(id *)(*(void *)(a1 + 40) + 32) identityStore];
      id v17 = [*(id *)(*(void *)(a1 + 40) + 32) identity];
      id v90 = 0;
      id v18 = [v16 DSIDForUserIdentity:v17 outError:&v90];
      id v19 = v90;

      if (v19)
      {
        char v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = *(void *)(a1 + 40);
          id v22 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
          *(_DWORD *)buf = 138543874;
          uint64_t v93 = v21;
          __int16 v94 = 2114;
          v95 = v22;
          __int16 v96 = 2114;
          id v97 = v19;
          _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to resolve DSID for saving key request %{public}@. err=%{public}@", buf, 0x20u);
        }
      }
      id v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = *(void *)(a1 + 40);
        uint64_t v25 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        uint64_t v93 = v24;
        __int16 v94 = 2114;
        v95 = v25;
        __int16 v96 = 2114;
        id v97 = v18;
        _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - saving key with identifier %{public}@. accountDSID=%{public}@", buf, 0x20u);
      }

      id v26 = *(void **)(a1 + 72);
      uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 40);
      uint64_t v28 = *(void *)(a1 + 56);
      BOOL v29 = [*(id *)(a1 + 64) renewalDate];
      BOOL v30 = [v26 saveKey:v11 forIdentifier:v28 adamID:v27 withRenewalDate:v29 accountDSID:v18 keyServerProtocolType:*(void *)(*(void *)(a1 + 40) + 168)];

      if (v30)
      {
        uint64_t v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = *(void *)(a1 + 40);
          uint64_t v33 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
          *(_DWORD *)buf = 138543874;
          uint64_t v93 = v32;
          __int16 v94 = 2114;
          v95 = v33;
          __int16 v96 = 2114;
          id v97 = v30;
          _os_log_impl(&dword_1A2D01000, v31, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to save key for persistable key request %{public}@. err=%{public}@", buf, 0x20u);
        }
      }

      goto LABEL_34;
    }
    id v35 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = *(void *)(a1 + 40);
      id v37 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v93 = v36;
      __int16 v94 = 2114;
      v95 = v37;
      __int16 v96 = 2114;
      id v97 = v2;
      _os_log_impl(&dword_1A2D01000, v35, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to create persistable data for key request %{public}@. err=%{public}@", buf, 0x20u);
    }
    if (!v2)
    {
      id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    }
  }
LABEL_33:
  id v11 = 0;
LABEL_34:

LABEL_35:
  v38 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  os_signpost_id_t v39 = os_signpost_id_make_with_pointer(v38, *(const void **)(a1 + 48));

  if (v2)
  {
    id v40 = NSString;
    uint64_t v41 = [v2 domain];
    uint64_t v42 = [v40 stringWithFormat:@"Error-%@-%lld", v41, objc_msgSend(v2, "code")];

    __int16 v43 = *(void **)(a1 + 72);
    uint64_t v44 = *(void *)(a1 + 56);
    id v89 = 0;
    LODWORD(v41) = [v43 containsKeyForIdentifier:v44 error:&v89];
    id v45 = v89;
    if (v41)
    {
      BOOL v46 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = *(void *)(a1 + 40);
        long long v48 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
        *(_DWORD *)buf = 138543618;
        uint64_t v93 = v47;
        __int16 v94 = 2114;
        v95 = v48;
        _os_log_impl(&dword_1A2D01000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Failed to renew key for request %{public}@ - falling back to existing cached key", buf, 0x16u);
      }
      uint64_t v49 = *(void **)(a1 + 72);
      v50 = [*(id *)(a1 + 48) identifier];
      id v88 = v45;
      id v51 = [v49 loadKeyForIdentifier:v50 error:&v88];
      id v52 = v88;

      if (v52
        || ([v51 keyData],
            v70 = objc_claimAutoreleasedReturnValue(),
            v70,
            !v70))
      {
        uint64_t v53 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          uint64_t v54 = *(void *)(a1 + 40);
          id v55 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
          *(_DWORD *)buf = 138543874;
          uint64_t v93 = v54;
          __int16 v94 = 2114;
          v95 = v55;
          __int16 v96 = 2114;
          id v97 = v52;
          _os_log_impl(&dword_1A2D01000, v53, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Can't fall back to cached prefetch key for request %{public}@. err=%{public}@", buf, 0x20u);
        }
        [*(id *)(a1 + 48) processContentKeyResponseError:v2];
        v56 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v57 = *(void *)(a1 + 40);
          uint64_t v58 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
          *(_DWORD *)buf = 138543874;
          uint64_t v93 = v57;
          __int16 v94 = 2114;
          v95 = v58;
          __int16 v96 = 2114;
          id v97 = v2;
          _os_log_impl(&dword_1A2D01000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed content key request %{public}@ with response error %{public}@", buf, 0x20u);
        }
      }
      else
      {
        v71 = (void *)MEMORY[0x1E4F164E8];
        v72 = [v51 keyData];
        v56 = [v71 contentKeyResponseWithFairPlayStreamingKeyResponseData:v72];

        [*(id *)(a1 + 48) processContentKeyResponse:v56];
        uint64_t v42 = @"Fallback";
      }
    }
    else
    {
      [*(id *)(a1 + 48) processContentKeyResponseError:v2];
      id v51 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v65 = *(void *)(a1 + 40);
        v66 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
        *(_DWORD *)buf = 138543874;
        uint64_t v93 = v65;
        __int16 v94 = 2114;
        v95 = v66;
        __int16 v96 = 2114;
        id v97 = v2;
        _os_log_impl(&dword_1A2D01000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed content key request %{public}@ with response error %{public}@", buf, 0x20u);
      }
      id v52 = v45;
    }

    v73 = [v2 domain];
    if ([v73 isEqualToString:@"ICError"])
    {
      if ([v2 code] == -7100)
      {

LABEL_64:
        if (*(unsigned char *)(a1 + 81) && !*(unsigned char *)(a1 + 80))
        {
          v76 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v77 = *(void *)(a1 + 40);
            v78 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
            *(_DWORD *)buf = 138543618;
            uint64_t v93 = v77;
            __int16 v94 = 2114;
            v95 = v78;
            _os_log_impl(&dword_1A2D01000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Scheduling a retry in 2 minutes for key %{public}@", buf, 0x16u);
          }
          v79 = *(void **)(*(void *)(a1 + 40) + 112);
          v80 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:120.0];
          [v79 setObject:v80 forKey:*(void *)(a1 + 56)];
        }
        else
        {
          [*(id *)(*(void *)(a1 + 40) + 112) removeObjectForKey:*(void *)(a1 + 56)];
        }
        goto LABEL_75;
      }
      uint64_t v75 = [v2 code];

      if (v75 == -7003) {
        goto LABEL_64;
      }
    }
    else
    {
    }
    [*(id *)(*(void *)(a1 + 40) + 112) removeObjectForKey:*(void *)(a1 + 56)];
    id v74 = (id)[*(id *)(a1 + 72) incrementFailureCountForKeyWithIdentifier:*(void *)(a1 + 56)];
    goto LABEL_75;
  }
  id v52 = [MEMORY[0x1E4F164E8] contentKeyResponseWithFairPlayStreamingKeyResponseData:v11];
  [*(id *)(a1 + 48) processContentKeyResponse:v52];
  __int16 v59 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v60 = *(void *)(a1 + 40);
    uint64_t v61 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
    *(_DWORD *)buf = 138543874;
    uint64_t v93 = v60;
    __int16 v94 = 2114;
    v95 = v61;
    __int16 v96 = 2114;
    id v97 = v52;
    _os_log_impl(&dword_1A2D01000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed content key request %{public}@ with response %{public}@", buf, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 40) + 120) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 80))
  {
    v62 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v63 = *(void *)(a1 + 40);
      v64 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v93 = v63;
      __int16 v94 = 2114;
      v95 = v64;
      _os_log_impl(&dword_1A2D01000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - skipping automatic renewal for offline key request %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v67 = [*(id *)(a1 + 64) renewalDate];

    if (v67)
    {
      v68 = *(void **)(*(void *)(a1 + 40) + 112);
      v69 = [*(id *)(a1 + 64) renewalDate];
      [v68 setObject:v69 forKey:*(void *)(a1 + 56)];
    }
    else
    {
      v81 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v82 = *(void *)(a1 + 40);
        v83 = objc_msgSend(*(id *)(a1 + 48), "ic_description");
        *(_DWORD *)buf = 138543618;
        uint64_t v93 = v82;
        __int16 v94 = 2114;
        v95 = v83;
        _os_log_impl(&dword_1A2D01000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - No renewal date provided in response to key request %{public}@ - skipping automatic renewal", buf, 0x16u);
      }
      [*(id *)(*(void *)(a1 + 40) + 112) removeObjectForKey:*(void *)(a1 + 56)];
    }
  }
  uint64_t v42 = @"Success";
LABEL_75:

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 152));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained contentKeySession:*(void *)(a1 + 40) didFinishProcessingKey:*(void *)(a1 + 56) withResponse:*(void *)(a1 + 64) error:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 40) _finishProcessingKeyWithIdentifier:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) _scheduleKeyRefreshTimer];
  v85 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v86 = v85;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
  {
    uint64_t v87 = [(__CFString *)v42 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v93 = v87;
    _os_signpost_emit_with_name_impl(&dword_1A2D01000, v86, OS_SIGNPOST_INTERVAL_END, v39, "ContentKeyRequest", " enableTelemetry=YES result=%{public, signpost.telemetry:string1, name=result}s", buf, 0xCu);
  }
}

- (BOOL)_isPrefetchKey:(id)a3
{
  prefetchKeyConfiguration = self->_prefetchKeyConfiguration;
  id v4 = a3;
  uint64_t v5 = [(ICContentKeySessionPrefetchKeyConfiguration *)prefetchKeyConfiguration keyIdentifiers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    contentKeySession = self->_contentKeySession;
    id v11 = objc_msgSend(v7, "ic_description");
    int v12 = 138544130;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = contentKeySession;
    __int16 v16 = 2114;
    id v17 = v11;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - contentKeySession:%{public}@ contentKeyRequest:%{public}@ didFailWithError:%{public}@", (uint8_t *)&v12, 0x2Au);
  }
}

- (void)contentKeySession:(id)a3 contentKeyRequestDidSucceed:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    contentKeySession = self->_contentKeySession;
    id v8 = objc_msgSend(v5, "ic_description");
    int v9 = 138543874;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    int v12 = contentKeySession;
    __int16 v13 = 2114;
    __int16 v14 = v8;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - contentKeySession:%{public}@ contentKeyRequestDidSucceed:%{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, v5);

  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  int v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v14 = 67240192;
    LODWORD(v15) = 3;
    _os_signpost_emit_with_name_impl(&dword_1A2D01000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ContentKeyRequest", " enableTelemetry=YES type=%{public, signpost.telemetry:number1, name=type}d", (uint8_t *)&v14, 8u);
  }

  uint64_t v10 = [v5 identifier];
  BOOL v11 = [(ICContentKeySession *)self _isPrefetchKey:v10];
  int v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = objc_msgSend(v5, "ic_description");
    int v14 = 138543874;
    uint64_t v15 = self;
    __int16 v16 = 2114;
    id v17 = v13;
    __int16 v18 = 1024;
    BOOL v19 = v11;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - handling renewing key request %{public}@. isPrefetchKey=%{BOOL}u", (uint8_t *)&v14, 0x1Cu);
  }
  [(ICContentKeySession *)self _performKeyDeliveryRequestForContentKeyRequest:v5 persistResponse:0 isRenewal:1];
}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, v5);

  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  int v9 = v8;
  unint64_t v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v47) = 2;
    _os_signpost_emit_with_name_impl(&dword_1A2D01000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ContentKeyRequest", " enableTelemetry=YES type=%{public, signpost.telemetry:number1, name=type}d", buf, 8u);
  }

  BOOL v11 = [v5 identifier];
  BOOL v12 = [(ICContentKeySession *)self _isPrefetchKey:v11];
  __int16 v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = objc_msgSend(v5, "ic_description");
    *(_DWORD *)buf = 138543874;
    uint64_t v47 = self;
    __int16 v48 = 2114;
    uint64_t v49 = v14;
    __int16 v50 = 1024;
    LODWORD(v51) = v12;
    _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - handling persistable content key request %{public}@. isPrefetchKey=%{BOOL}u", buf, 0x1Cu);
  }
  uint64_t v15 = +[ICEnvironmentMonitor sharedMonitor];
  if ([v15 isRemoteServerLikelyReachable]) {
    int v16 = [v15 isCurrentNetworkLinkHighQuality] ^ 1;
  }
  else {
    int v16 = 1;
  }
  uint64_t v17 = 48;
  if (v12) {
    uint64_t v17 = 104;
  }
  id v18 = *(id *)((char *)&self->super.isa + v17);
  if (self->_bypassCache) {
    goto LABEL_16;
  }
  int v42 = v16;
  os_signpost_id_t spid = v7;
  BOOL v19 = [v5 identifier];
  id v45 = 0;
  uint64_t v20 = [v18 loadKeyForIdentifier:v19 error:&v45];
  id v21 = v45;

  if (v21)
  {
    id v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = objc_msgSend(v5, "ic_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v47 = self;
      __int16 v48 = 2114;
      uint64_t v49 = v23;
      __int16 v50 = 2114;
      id v51 = v21;
      _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to load key from store for key request %{public}@. err=%{public}@", buf, 0x20u);
    }
LABEL_16:
    uint64_t v24 = 0;
LABEL_17:
    [(ICContentKeySession *)self _performKeyDeliveryRequestForContentKeyRequest:v5 persistResponse:1 isRenewal:0];
    goto LABEL_18;
  }
  uint64_t v24 = [v20 renewalDate];
  uint64_t v25 = [v20 keyData];

  if (!v25) {
    goto LABEL_17;
  }
  id v26 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "ic_description");
    uint64_t v27 = v39 = v25;
    *(_DWORD *)buf = 138543874;
    uint64_t v47 = self;
    __int16 v48 = 2114;
    uint64_t v49 = v27;
    __int16 v50 = 2114;
    id v51 = v24;
    _os_log_impl(&dword_1A2D01000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Returning cached key for key request %{public}@. renewalDate=%{public}@", buf, 0x20u);

    uint64_t v25 = v39;
  }

  id v40 = [MEMORY[0x1E4F164E8] contentKeyResponseWithFairPlayStreamingKeyResponseData:v25];
  objc_msgSend(v5, "processContentKeyResponse:");
  uint64_t v28 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  BOOL v29 = v28;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v47 = (ICContentKeySession *)"FromCache";
    _os_signpost_emit_with_name_impl(&dword_1A2D01000, v29, OS_SIGNPOST_INTERVAL_END, spid, "ContentKeyRequest", " enableTelemetry=YES result=%{public, signpost.telemetry:string1, name=result}s", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained contentKeySession:self didFinishProcessingKey:v11 withResponse:0 error:0];
  }
  if (((!v12 | v42) & 1) == 0)
  {
    uint64_t v31 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v32 = v25;
    uint64_t v33 = [v24 compare:v31];

    BOOL v34 = v33 == -1;
    uint64_t v25 = v32;
    if (v34)
    {
      id v35 = _ICLogCategoryDefault();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = objc_msgSend(v5, "ic_description");
        *(_DWORD *)buf = 138543874;
        uint64_t v47 = self;
        __int16 v48 = 2114;
        uint64_t v49 = v36;
        __int16 v50 = 2114;
        id v51 = v24;
        _os_log_impl(&dword_1A2D01000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - attempting to renew stale shared key for key request %{public}@. renewalDate=%{public}@", buf, 0x20u);
      }
      dispatch_time_t v37 = dispatch_time(0, 2000000000);
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__ICContentKeySession_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke;
      block[3] = &unk_1E5ACD4C8;
      void block[4] = self;
      id v44 = v5;
      dispatch_after(v37, accessQueue, block);

      uint64_t v25 = v32;
    }
  }
  [(ICContentKeySession *)self _finishProcessingKeyWithIdentifier:v11];

LABEL_18:
}

uint64_t __80__ICContentKeySession_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) renewExpiringResponseDataForContentKeyRequest:*(void *)(a1 + 40)];
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = [v5 identifier];
  BOOL v7 = [(ICContentKeySession *)self _isPrefetchKey:v6];
  if ([(ICContentKeySession *)self allowFallbackToStreamingKeys])
  {
    id v8 = +[ICDefaults standardDefaults];
    int v9 = [v8 shouldForceStreamingOnlyKeysForPlayback];
  }
  else
  {
    int v9 = 0;
  }
  unint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = objc_msgSend(v5, "ic_description");
    *(_DWORD *)buf = 138544130;
    uint64_t v31 = self;
    __int16 v32 = 2114;
    uint64_t v33 = v11;
    __int16 v34 = 1024;
    LODWORD(v35[0]) = v7;
    WORD2(v35[0]) = 1024;
    *(_DWORD *)((char *)v35 + 6) = v9;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - handling key request %{public}@. isPrefetchKey=%{BOOL}u, shouldForceStreamingOnlyKeysForPlayback=%{BOOL}u", buf, 0x22u);
  }
  BOOL requestOfflineKeys = self->_requestOfflineKeys;
  uint64_t v13 = 48;
  if (v7) {
    uint64_t v13 = 104;
  }
  id v14 = *(id *)((char *)&self->super.isa + v13);
  uint64_t v15 = v14;
  if (!requestOfflineKeys || v14 == 0) {
    char v17 = 1;
  }
  else {
    char v17 = v9;
  }
  if ((v17 & 1) == 0)
  {
    id v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v19 = objc_msgSend(v5, "ic_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = self;
      __int16 v32 = 2114;
      uint64_t v33 = v19;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Requesting persistable content key for %{public}@", buf, 0x16u);
    }
    id v29 = 0;
    int v20 = [v5 respondByRequestingPersistableContentKeyRequestAndReturnError:&v29];
    id v21 = v29;
    id v22 = v21;
    if (v20)
    {

      goto LABEL_26;
    }
    id v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend(v5, "ic_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = self;
      __int16 v32 = 2114;
      uint64_t v33 = v24;
      __int16 v34 = 2114;
      v35[0] = v22;
      _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to request persistable content key for '%{public}@' - requesting streaming key instead. err=%{public}@", buf, 0x20u);
    }
  }
  uint64_t v25 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v25, v5);

  uint64_t v27 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  uint64_t v28 = v27;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v31) = 1;
    _os_signpost_emit_with_name_impl(&dword_1A2D01000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "ContentKeyRequest", " enableTelemetry=YES type=%{public, signpost.telemetry:number1, name=type}d", buf, 8u);
  }

  [(ICContentKeySession *)self _performKeyDeliveryRequestForContentKeyRequest:v5 persistResponse:0 isRenewal:0];
LABEL_26:
}

- (void)waitForAllKeysToProcessWithTimeout:(double)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = (unint64_t)a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Waiting for key requests to complete with timeout %lus", buf, 0x16u);
  }

  uint64_t v6 = MEMORY[0x1E4F143A8];
  while (1)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v28 = 0;
    accessQueue = self->_accessQueue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __58__ICContentKeySession_waitForAllKeysToProcessWithTimeout___block_invoke;
    block[3] = &unk_1E5ACD880;
    void block[4] = self;
    void block[5] = buf;
    dispatch_sync(accessQueue, block);
    uint64_t v8 = *(void *)(*(void *)&buf[8] + 24);
    int v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (!v8)
    {
      if (!v10) {
        goto LABEL_17;
      }
      *(_DWORD *)id v21 = 138543362;
      id v22 = self;
      id v14 = "%{public}@ [SKD] - Finished waiting for key requests to complete";
      uint64_t v15 = v9;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 12;
      goto LABEL_16;
    }
    if (v10)
    {
      uint64_t v11 = [(NSMutableSet *)self->_pendingKeyIdentifiers count];
      pendingKeyIdentifiers = self->_pendingKeyIdentifiers;
      *(_DWORD *)id v21 = 138543874;
      id v22 = self;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      __int16 v25 = 2114;
      os_signpost_id_t v26 = pendingKeyIdentifiers;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Waiting for %lu keys: %{public}@", v21, 0x20u);
    }

    dispatch_time_t v13 = a3 == 0.0 ? -1 : dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_waitForKeysSemaphore, v13)) {
      break;
    }
    _Block_object_dispose(buf, 8);
  }
  int v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    goto LABEL_17;
  }
  uint64_t v18 = [(NSMutableSet *)self->_pendingKeyIdentifiers count];
  BOOL v19 = self->_pendingKeyIdentifiers;
  *(_DWORD *)id v21 = 138543874;
  id v22 = self;
  __int16 v23 = 2048;
  uint64_t v24 = v18;
  __int16 v25 = 2114;
  os_signpost_id_t v26 = v19;
  id v14 = "%{public}@ [SKD] - Timed out waiting for %lu keys: %{public}@";
  uint64_t v15 = v9;
  os_log_type_t v16 = OS_LOG_TYPE_ERROR;
  uint32_t v17 = 32;
LABEL_16:
  _os_log_impl(&dword_1A2D01000, v15, v16, v14, v21, v17);
LABEL_17:

  _Block_object_dispose(buf, 8);
}

uint64_t __58__ICContentKeySession_waitForAllKeysToProcessWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)waitForAllKeysToProcess
{
}

- (void)waitForKeyRenewalsWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(NSMutableSet *)self->_pendingRenewalKeyIdentifiers count];
  uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = [(NSMutableSet *)self->_pendingRenewalKeyIdentifiers count];
      pendingRenewalKeyIdentifiers = self->_pendingRenewalKeyIdentifiers;
      *(_DWORD *)buf = 138543874;
      id v14 = self;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = pendingRenewalKeyIdentifiers;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Waiting for key renewals to complete for %lu identifiers %{public}@", buf, 0x20u);
    }

    accessQueue = self->_accessQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__ICContentKeySession_waitForKeyRenewalsWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E5ACD2F0;
    v11[4] = self;
    BOOL v12 = v4;
    dispatch_async(accessQueue, v11);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      id v14 = self;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - No pending key renewals to wait for", buf, 0xCu);
    }

    v4[2](v4);
  }
}

void __63__ICContentKeySession_waitForKeyRenewalsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 72) count])
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 80);
    if (v2)
    {
      id v9 = (id)MEMORY[0x1A6240BF0](*(void *)(a1 + 40));
      objc_msgSend(v2, "addObject:");
    }
    else
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
      id v9 = (id)MEMORY[0x1A6240BF0](*(void *)(a1 + 40));
      uint64_t v6 = objc_msgSend(v5, "arrayWithObject:");
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v6;
    }
  }
  else
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Finished waiting for key renewals to complete", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)invalidateKeyWithIdentifier:(id)a3 withCompletion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  keyStore = self->_keyStore;
  if (keyStore)
  {
    id v20 = 0;
    id v9 = [(ICContentKeyStoreProtocol *)keyStore loadKeyForIdentifier:v6 error:&v20];
    id v10 = v20;
    if (v10)
    {
      uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v22 = self;
        __int16 v23 = 2114;
        id v24 = v6;
        __int16 v25 = 2114;
        id v26 = v10;
        _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to load key to stop with identifier %{public}@. err=%{public}@", buf, 0x20u);
      }

      v7[2](v7, v10);
    }
    uint64_t v12 = [v9 identifier];
    dispatch_time_t v13 = [v9 adamID];
    id v14 = [v9 accountDSID];
    __int16 v15 = [v9 keyData];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__ICContentKeySession_invalidateKeyWithIdentifier_withCompletion___block_invoke;
    v17[3] = &unk_1E5ACB578;
    v17[4] = self;
    id v18 = v9;
    uint64_t v19 = v7;
    id v16 = v9;
    [(ICContentKeySession *)self _invalidateKeyWithIdentifier:v12 forAdamID:v13 offline:1 usingAccountDSID:v14 keyData:v15 withCompletion:v17];
  }
}

void __66__ICContentKeySession_invalidateKeyWithIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = [*(id *)(a1 + 40) identifier];
      int v7 = 138543874;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to stop session for key %{public}@. err=%{public}@", (uint8_t *)&v7, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_78(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v3 identifier];
  [v4 addObject:v5];

  id v6 = [v3 accountDSID];
  if (![v6 longLongValue])
  {
    id v7 = *(id *)(a1 + 48);

    id v6 = v7;
  }
  uint64_t v8 = *(void **)(a1 + 56);
  __int16 v9 = [v3 identifier];
  id v10 = [v3 adamID];
  __int16 v11 = [v3 keyData];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_2;
  v14[3] = &unk_1E5ACB098;
  uint64_t v12 = *(void *)(a1 + 64);
  void v14[4] = *(void *)(a1 + 56);
  id v15 = v3;
  uint64_t v17 = v12;
  id v16 = *(id *)(a1 + 32);
  id v13 = v3;
  [v8 _invalidateKeyWithIdentifier:v9 forAdamID:v10 offline:1 usingAccountDSID:v6 keyData:v11 withCompletion:v14];
}

void __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543874;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to stop session for key %{public}@. err=%{public}@", (uint8_t *)&v8, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = [*(id *)(a1 + 40) identifier];
      int v8 = 138543874;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to stop session for key %{public}@. err=%{public}@", (uint8_t *)&v8, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)renewAllKeys
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ICContentKeySession_renewAllKeys__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __35__ICContentKeySession_renewAllKeys__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(v3 + 120) allKeys];
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v3;
    __int16 v28 = 2114;
    uint64_t v29 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Issuing renewal for key requests. identifiers = %{public}@", buf, 0x16u);
  }
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 120) allValues];
  [*(id *)(*(void *)(a1 + 32) + 120) removeAllObjects];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        __int16 v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          id v13 = objc_msgSend(v10, "ic_description");
          *(_DWORD *)buf = 138543618;
          uint64_t v27 = v12;
          __int16 v28 = 2114;
          uint64_t v29 = v13;
          _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Renewing key request %{public}@", buf, 0x16u);
        }
        uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 72);
        if (v14)
        {
          id v15 = [v10 identifier];
          [v14 addObject:v15];
        }
        else
        {
          id v16 = (void *)MEMORY[0x1E4F1CA80];
          id v15 = [v10 identifier];
          uint64_t v17 = [v16 setWithObject:v15];
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(void **)(v18 + 72);
          *(void *)(v18 + 72) = v17;
        }
        [*(id *)(*(void *)(a1 + 32) + 24) renewExpiringResponseDataForContentKeyRequest:v10];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

- (void)resumeAutomaticKeyRenewal
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_automaticKeyRenewalPaused)
  {
    self->_automaticKeyRenewalPaused = 0;
    uint64_t v3 = [(NSMutableDictionary *)self->_keyRenewalDates count];
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v9 = self;
        _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Resuming automatic key renewal", buf, 0xCu);
      }

      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__ICContentKeySession_resumeAutomaticKeyRenewal__block_invoke;
      block[3] = &unk_1E5ACD750;
      void block[4] = self;
      dispatch_sync(accessQueue, block);
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v9 = self;
        _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Automatic key renewal will resume when the first key has been requested.", buf, 0xCu);
      }
    }
  }
}

uint64_t __48__ICContentKeySession_resumeAutomaticKeyRenewal__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleKeyRefreshTimer];
}

- (void)pauseAutomaticKeyRenewal
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!self->_automaticKeyRenewalPaused)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v7 = self;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Pausing automatic key renewal", buf, 0xCu);
    }

    self->_automaticKeyRenewalPaused = 1;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__ICContentKeySession_pauseAutomaticKeyRenewal__block_invoke;
    block[3] = &unk_1E5ACD750;
    void block[4] = self;
    dispatch_sync(accessQueue, block);
  }
}

void __47__ICContentKeySession_pauseAutomaticKeyRenewal__block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 136);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 136);
    *(void *)(v3 + 136) = 0;
  }
}

- (void)processKeyWithIdentifier:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ICContentKeySession_processKeyWithIdentifier___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __48__ICContentKeySession_processKeyWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processKeyWithIdentifier:*(void *)(a1 + 40)];
}

- (void)removeAsset:(id)a3
{
}

- (void)addAsset:(id)a3 shouldPreloadKeys:(BOOL)a4 waitForKeyIdentifiers:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v15 = self;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 1024;
    BOOL v19 = v6;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Adding asset %{public}@. shouldPreloadKeys=%{BOOL}u", buf, 0x1Cu);
  }

  [(AVContentKeySession *)self->_contentKeySession addContentKeyRecipient:v8];
  if (v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke;
    block[3] = &unk_1E5ACB070;
    BOOL v13 = a5;
    void block[4] = self;
    id v12 = v8;
    dispatch_async(accessQueue, block);
  }
}

void __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48)) {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  }
  else {
    dispatch_semaphore_t v2 = 0;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke_2;
  v8[3] = &unk_1E5ACB048;
  objc_copyWeak(&v11, &location);
  id v9 = *(id *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 48);
  id v4 = v2;
  uint64_t v10 = v4;
  [v3 loadValuesAsynchronouslyForKeys:&unk_1EF640B88 completionHandler:v8];
  if (*(unsigned char *)(a1 + 48))
  {
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v4, v5))
    {
      BOOL v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v7;
        _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Timed out waiting for the list of content keys on the asset to load. this may delay key fetch", buf, 0xCu);
      }
    }
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke_3;
    v6[3] = &unk_1E5ACD4C8;
    id v7 = *(id *)(a1 + 32);
    uint64_t v3 = (dispatch_queue_t *)WeakRetained;
    id v8 = v3;
    id v4 = (void (**)(void))MEMORY[0x1A6240BF0](v6);
    dispatch_time_t v5 = v4;
    if (*(unsigned char *)(a1 + 56))
    {
      v4[2](v4);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
    else
    {
      dispatch_async(v3[7], v4);
    }
  }
}

void __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke_3(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
  uint64_t v3 = [*(id *)(a1 + 32) contentKeySpecifiersEligibleForPreloading];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v67 objects:v81 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v68 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v67 + 1) + 8 * i) identifier];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v67 objects:v81 count:16];
    }
    while (v5);
  }
  id v9 = [*(id *)(a1 + 32) metadata];
  uint64_t v10 = objc_msgSend(v9, "msv_firstWhere:", &__block_literal_global_68_31208);
  id v11 = v10;
  if (v10)
  {
    char v12 = [v10 value];
    if (v12)
    {
      if (_NSIsNSString())
      {
        BOOL v13 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
        if (v13)
        {
          id v66 = 0;
          uint64_t v14 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v13 options:0 error:&v66];
          uint64_t v15 = v66;
          if (v14)
          {
            if (_NSIsNSArray())
            {
              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              uint64_t v54 = v14;
              id obj = v14;
              uint64_t v16 = [obj countByEnumeratingWithState:&v62 objects:v80 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v49 = v15;
                __int16 v50 = v13;
                id v51 = v12;
                uint64_t v52 = v11;
                uint64_t v53 = v9;
                uint64_t v18 = *(void *)v63;
                BOOL v19 = obj;
                do
                {
                  for (uint64_t j = 0; j != v17; ++j)
                  {
                    if (*(void *)v63 != v18) {
                      objc_enumerationMutation(v19);
                    }
                    long long v21 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                    if (_NSIsNSDictionary())
                    {
                      uint64_t v22 = objc_msgSend(v21, "ic_stringValueForKey:", @"uri");
                      if (v22)
                      {
                        long long v23 = v22;
                        [v2 addObject:v22];
                      }
                      else
                      {
                        uint64_t v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                        {
                          __int16 v28 = *(void **)(a1 + 40);
                          *(_DWORD *)buf = 138543618;
                          id v73 = v28;
                          __int16 v74 = 2114;
                          uint64_t v75 = (uint64_t)v21;
                          _os_log_impl(&dword_1A2D01000, v27, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to find key URI in key info dictionary %{public}@", buf, 0x16u);
                        }

                        long long v23 = 0;
                      }
                    }
                    else
                    {
                      long long v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                      {
                        long long v24 = *(void **)(a1 + 40);
                        __int16 v25 = objc_opt_class();
                        *(_DWORD *)buf = 138543874;
                        id v73 = v24;
                        BOOL v19 = obj;
                        __int16 v74 = 2114;
                        uint64_t v75 = (uint64_t)v25;
                        __int16 v76 = 2114;
                        uint64_t v77 = v21;
                        id v26 = v25;
                        _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Got unexpected key info object type %{public}@. info=%{public}@", buf, 0x20u);
                      }
                    }
                  }
                  uint64_t v17 = [v19 countByEnumeratingWithState:&v62 objects:v80 count:16];
                }
                while (v17);
                uint64_t v29 = v19;
                id v11 = v52;
                id v9 = v53;
                BOOL v13 = v50;
                char v12 = v51;
                uint64_t v15 = v49;
                uint64_t v14 = v54;
              }
              else
              {
                uint64_t v29 = obj;
              }
            }
            else
            {
              uint64_t v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                id obja = *(id *)(a1 + 40);
                dispatch_time_t v37 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                id v73 = obja;
                __int16 v74 = 2114;
                uint64_t v75 = (uint64_t)v37;
                __int16 v76 = 2114;
                uint64_t v77 = v14;
                id objb = v37;
                _os_log_impl(&dword_1A2D01000, v29, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Key list is not an array! class=%{public}@. keyList=%{public}@", buf, 0x20u);
              }
            }
          }
          else
          {
            uint64_t v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              id v73 = v36;
              __int16 v74 = 2114;
              uint64_t v75 = (uint64_t)v15;
              _os_log_impl(&dword_1A2D01000, v29, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to create keyInfo list from data. err=%{public}@", buf, 0x16u);
            }
          }
        }
        else
        {
          uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            id v35 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            id v73 = v35;
            __int16 v74 = 2114;
            uint64_t v75 = (uint64_t)v12;
            _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to create key data from metadata string '%{public}@'", buf, 0x16u);
          }
        }

        goto LABEL_44;
      }
      BOOL v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        id v73 = v34;
        __int16 v74 = 2114;
        uint64_t v75 = (uint64_t)v12;
        uint64_t v31 = "%{public}@ [SKD] - Got unexpected value type for key metadata item - ignoring. value=%{public}@";
        __int16 v32 = v13;
        uint32_t v33 = 22;
        goto LABEL_34;
      }
    }
    else
    {
      BOOL v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        id v73 = v30;
        uint64_t v31 = "%{public}@ [SKD] - Got nil value for key metadata item - ignoring";
        __int16 v32 = v13;
        uint32_t v33 = 12;
LABEL_34:
        _os_log_impl(&dword_1A2D01000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
      }
    }
LABEL_44:
  }
  v38 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v39 = *(void **)(a1 + 40);
    uint64_t v40 = [v2 count];
    uint64_t v41 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138544130;
    id v73 = v39;
    __int16 v74 = 2048;
    uint64_t v75 = v40;
    __int16 v76 = 2114;
    uint64_t v77 = v41;
    __int16 v78 = 2114;
    v79 = v2;
    _os_log_impl(&dword_1A2D01000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Found %lu keys to preload for asset %{public}@: %{public}@", buf, 0x2Au);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v42 = v2;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v59 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void *)(*((void *)&v58 + 1) + 8 * k);
        int v48 = objc_msgSend(*(id *)(a1 + 40), "_isPrefetchKey:", v47, v49, v50, v51, v52, v53);
        if (MSVDeviceIsAudioAccessory())
        {
          if (!v48) {
            continue;
          }
        }
        else if (v48)
        {
          continue;
        }
        if (([*(id *)(*(void *)(a1 + 40) + 64) containsObject:v47] & 1) == 0) {
          [*(id *)(a1 + 40) _processKeyWithIdentifier:v47];
        }
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (v44);
  }
}

uint64_t __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke_4(uint64_t a1, void *a2)
{
  dispatch_semaphore_t v2 = [a2 key];
  uint64_t v3 = v2;
  if (v2 == @"com.apple.hls.keys") {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [(__CFString *)v2 isEqual:@"com.apple.hls.keys"];
  }

  return v4;
}

- (void)addAsset:(id)a3
{
}

- (ICContentKeySession)initWithRequestContext:(id)a3
{
  return [(ICContentKeySession *)self initWithRequestContext:a3 keyStore:0];
}

- (ICContentKeySession)init
{
  uint64_t v3 = [ICStoreRequestContext alloc];
  uint64_t v4 = +[ICUserIdentity activeAccount];
  uint64_t v5 = [(ICStoreRequestContext *)v3 initWithIdentity:v4];

  uint64_t v6 = [(ICContentKeySession *)self initWithRequestContext:v5];
  return v6;
}

+ (id)copyKeysToPendingInvalidationStoreFromPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__30924;
  uint64_t v22 = __Block_byref_object_dispose__30925;
  id v23 = 0;
  uint64_t v4 = +[ICContentKeySession pendingInvalidationKeyStorePath];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v5 fileExistsAtPath:v4] & 1) == 0)
  {
    id v17 = 0;
    [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v6 = v17;
    if (v6)
    {
      id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = objc_msgSend(v6, "msv_description");
        *(_DWORD *)buf = 138543362;
        __int16 v25 = v8;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ICContentKeySession Failed to create key purgatory directory error=%{public}@", buf, 0xCu);
      }
    }
  }
  id v9 = [[ICFileContentKeyStore alloc] initWithPath:v4];
  uint64_t v10 = [[ICFileContentKeyStore alloc] initWithPath:v3];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__ICContentKeySession_copyKeysToPendingInvalidationStoreFromPath___block_invoke;
  v14[3] = &unk_1E5ACB138;
  id v11 = v9;
  uint64_t v15 = v11;
  uint64_t v16 = &v18;
  [(ICFileContentKeyStore *)v10 enumerateKeyEntriesUsingBlock:v14];
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __66__ICContentKeySession_copyKeysToPendingInvalidationStoreFromPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) saveKeyEntry:v3];
  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [v3 identifier];
      id v7 = objc_msgSend(v4, "msv_description");
      int v8 = 138543618;
      id v9 = v6;
      __int16 v10 = 2114;
      id v11 = v7;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "ICContentKeySession Moving key '%{public}@' to invalidation directory error=%{public}@", (uint8_t *)&v8, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  }
}

void __56__ICContentKeySession_enhancedAudioSharedContentKeyPath__block_invoke()
{
  MSVMobileHomeDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"Media/EnhancedAudioSharedKeys/"];
  v1 = (void *)enhancedAudioSharedContentKeyPath_path;
  enhancedAudioSharedContentKeyPath_path = v0;
}

@end