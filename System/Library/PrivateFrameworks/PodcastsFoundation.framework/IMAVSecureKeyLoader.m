@interface IMAVSecureKeyLoader
- (ACAccount)account;
- (AVContentKeySession)contentKeySession;
- (AVURLAsset)recipient;
- (BOOL)_isOfflineAsset;
- (BOOL)isRenewal;
- (IMAVSecureKeyLoader)initWithRecipient:(id)a3 useCase:(unint64_t)a4 account:(id)a5 urlProtocolDelegate:(id)a6;
- (IMAVSecureKeyLoaderDelegate)delegate;
- (MTContentKeyRequest)savedRequestToUseForStopping;
- (MTSecureKeyRequestHandler)secureKeyRequestHandler;
- (MTSecureKeyRequestStorage)secureKeyRequestStorage;
- (NSData)savedRequestDataToUseForStopping;
- (NSString)contentAdamId;
- (NSURLSessionDelegate)urlProtocolDelegate;
- (OS_dispatch_queue)keyLoaderQueue;
- (id)pendingCompletion;
- (unint64_t)useCase;
- (void)cleanupAfterContentKeyRequestForOfflineRenewal:(BOOL)a3 withError:(id)a4;
- (void)cleanupAfterContentKeyRequestWithError:(id)a3;
- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5;
- (void)contentKeySession:(id)a3 contentKeyRequestDidSucceed:(id)a4;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4;
- (void)finishContentKeyRequest:(id)a3 forOfflineRenewal:(BOOL)a4 withResponse:(id)a5;
- (void)finishContentKeyRequest:(id)a3 withResponse:(id)a4;
- (void)invalidateAndCancel;
- (void)requestKeyResponseFromContentKeyRequest:(id)a3 requestType:(int64_t)a4 completion:(id)a5;
- (void)securelyInvalidateOfflineDataForRequests:(id)a3 completion:(id)a4;
- (void)sendStopRequestForStreamingLicenseIfNecessary;
- (void)setAccount:(id)a3;
- (void)setContentAdamId:(id)a3;
- (void)setContentKeySession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsRenewal:(BOOL)a3;
- (void)setKeyLoaderQueue:(id)a3;
- (void)setPendingCompletion:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setSavedRequestDataToUseForStopping:(id)a3;
- (void)setSavedRequestToUseForStopping:(id)a3;
- (void)setSecureKeyRequestHandler:(id)a3;
- (void)setSecureKeyRequestStorage:(id)a3;
- (void)setUrlProtocolDelegate:(id)a3;
- (void)setUseCase:(unint64_t)a3;
- (void)startKeyLoadingProcessWithKeyIdentifier:(id)a3 contentAdamId:(id)a4 isRenewal:(BOOL)a5 completion:(id)a6;
- (void)startKeyLoadingProcessWithKeyRequestData:(id)a3 isRenewal:(BOOL)a4 completion:(id)a5;
- (void)timeoutKeyRequest;
@end

@implementation IMAVSecureKeyLoader

- (IMAVSecureKeyLoader)initWithRecipient:(id)a3 useCase:(unint64_t)a4 account:(id)a5 urlProtocolDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)IMAVSecureKeyLoader;
  v13 = [(IMAVSecureKeyLoader *)&v23 init];
  if (v13)
  {
    if (initWithRecipient_useCase_account_urlProtocolDelegate__onceToken != -1) {
      dispatch_once(&initWithRecipient_useCase_account_urlProtocolDelegate__onceToken, &__block_literal_global_22);
    }
    if (a4 == 1)
    {
      v14 = dispatch_queue_create("IMAVSecureKeyLoader.Download", 0);
      [(IMAVSecureKeyLoader *)v13 setKeyLoaderQueue:v14];
    }
    else
    {
      v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      dispatch_queue_t v15 = dispatch_queue_create("IMAVSecureKeyLoader", v14);
      [(IMAVSecureKeyLoader *)v13 setKeyLoaderQueue:v15];
    }
    [(IMAVSecureKeyLoader *)v13 setRecipient:v10];
    [(IMAVSecureKeyLoader *)v13 setAccount:v11];
    v16 = objc_alloc_init(MTStandardKeyRequestHandler);
    if (v12)
    {
      [(IMAVSecureKeyLoader *)v13 setUrlProtocolDelegate:v12];
      v17 = [(IMAVSecureKeyLoader *)v13 urlProtocolDelegate];
      [(IMBaseStoreService *)v16 setURLProtocolDelegate:v17];
    }
    [(IMAVSecureKeyLoader *)v13 setSecureKeyRequestHandler:v16];
    v18 = objc_alloc_init(MTCoreDataKeyRequestStorage);
    [(IMAVSecureKeyLoader *)v13 setSecureKeyRequestStorage:v18];

    [(IMAVSecureKeyLoader *)v13 setUseCase:a4];
    v19 = [MEMORY[0x1E4F164F0] contentKeySessionWithKeySystem:*MEMORY[0x1E4F159F0]];
    [(IMAVSecureKeyLoader *)v13 setContentKeySession:v19];

    v20 = [(IMAVSecureKeyLoader *)v13 contentKeySession];
    v21 = [(IMAVSecureKeyLoader *)v13 keyLoaderQueue];
    [v20 setDelegate:v13 queue:v21];
  }
  return v13;
}

uint64_t __77__IMAVSecureKeyLoader_initWithRecipient_useCase_account_urlProtocolDelegate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v1 = __pendingStopNonceRequestAdamIds;
  __pendingStopNonceRequestAdamIds = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)startKeyLoadingProcessWithKeyRequestData:(id)a3 isRenewal:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v11 = [v9 keyIdentifier];
  id v10 = [v9 contentAdamId];

  [(IMAVSecureKeyLoader *)self startKeyLoadingProcessWithKeyIdentifier:v11 contentAdamId:v10 isRenewal:v5 completion:v8];
}

- (void)startKeyLoadingProcessWithKeyIdentifier:(id)a3 contentAdamId:(id)a4 isRenewal:(BOOL)a5 completion:(id)a6
{
  BOOL v8 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v13 = (void (**)(id, void *))a6;
  v14 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v11;
    __int16 v34 = 2112;
    id v35 = v12;
    _os_log_impl(&dword_1AC9D5000, v14, OS_LOG_TYPE_DEFAULT, "[Key Loading Process] for key: %@, content adam id: %@.", buf, 0x16u);
  }

  dispatch_queue_t v15 = [(IMAVSecureKeyLoader *)self contentAdamId];
  if (v15)
  {
    v6 = [(IMAVSecureKeyLoader *)self contentAdamId];
    if (([v6 isEqualToString:v12] & 1) == 0)
    {

LABEL_9:
      v17 = _MTLogCategoryDRM();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [(IMAVSecureKeyLoader *)self contentAdamId];
        *(_DWORD *)buf = 138412802;
        id v33 = v11;
        __int16 v34 = 2112;
        id v35 = v12;
        __int16 v36 = 2112;
        v37 = v18;
        _os_log_impl(&dword_1AC9D5000, v17, OS_LOG_TYPE_ERROR, "[Key Loading Process] Fail to start key: %@, content adam id: %@. Another request is in progress for content adam id: %@.", buf, 0x20u);
      }
      v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMAVSecureKeyLoaderErrorDomain" code:-383006 userInfo:0];
      if (v13) {
        v13[2](v13, v19);
      }
      v20 = _MTLogCategoryDRM();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[IMAVSecureKeyLoader startKeyLoadingProcessWithKeyIdentifier:contentAdamId:isRenewal:completion:](v20);
      }

      goto LABEL_21;
    }
  }
  v16 = [(IMAVSecureKeyLoader *)self pendingCompletion];

  if (v15)
  {
  }
  if (v16) {
    goto LABEL_9;
  }
  [(IMAVSecureKeyLoader *)self setContentAdamId:v12];
  [(IMAVSecureKeyLoader *)self setIsRenewal:v8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke;
  block[3] = &unk_1E5E611F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v21 = [(IMAVSecureKeyLoader *)self recipient];

  if (v21)
  {
    v22 = _MTLogCategoryDRM();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v23 = [(IMAVSecureKeyLoader *)self recipient];
      v24 = [(IMAVSecureKeyLoader *)self contentAdamId];
      *(_DWORD *)buf = 138412802;
      id v33 = v23;
      __int16 v34 = 2112;
      id v35 = v11;
      __int16 v36 = 2112;
      v37 = v24;
      _os_log_impl(&dword_1AC9D5000, v22, OS_LOG_TYPE_DEFAULT, "[Key Loading Process] Add recipient %@ key: %@, content adam id: %@.", buf, 0x20u);
    }
    v25 = [(IMAVSecureKeyLoader *)self contentKeySession];
    v26 = [(IMAVSecureKeyLoader *)self recipient];
    [v25 addContentKeyRecipient:v26];
  }
  v27 = [(IMAVSecureKeyLoader *)self keyLoaderQueue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke_53;
  v28[3] = &unk_1E5E63660;
  v28[4] = self;
  v30 = v13;
  id v29 = v11;
  dispatch_async(v27, v28);

LABEL_21:
}

uint64_t __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_timeoutKeyRequest object:0];
}

void __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke_53(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setPendingCompletion:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 40) length])
  {
    v2 = _MTLogCategoryDRM();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      v4 = [*(id *)(a1 + 32) contentAdamId];
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "[Key Loading Process] Pre-loading key: %@, content adam id: %@.", buf, 0x16u);
    }
    BOOL v5 = [*(id *)(a1 + 32) contentKeySession];
    [v5 processContentKeyRequestWithIdentifier:*(void *)(a1 + 40) initializationData:0 options:0];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke_54;
  block[3] = &unk_1E5E611F0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke_54(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:sel_timeoutKeyRequest withObject:0 afterDelay:10.0];
}

- (void)sendStopRequestForStreamingLicenseIfNecessary
{
  if (![(IMAVSecureKeyLoader *)self _isOfflineAsset])
  {
    uint64_t v3 = [(IMAVSecureKeyLoader *)self keyLoaderQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__IMAVSecureKeyLoader_sendStopRequestForStreamingLicenseIfNecessary__block_invoke;
    block[3] = &unk_1E5E611F0;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

void __68__IMAVSecureKeyLoader_sendStopRequestForStreamingLicenseIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) contentKeySession];
  uint64_t v3 = [*(id *)(a1 + 32) recipient];
  [v2 removeContentKeyRecipient:v3];

  v4 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = [*(id *)(a1 + 32) recipient];
    v6 = [v5 URL];
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1AC9D5000, v4, OS_LOG_TYPE_ERROR, "Removing content key recipient for URL: %@", buf, 0xCu);
  }
  uint64_t v7 = [*(id *)(a1 + 32) savedRequestToUseForStopping];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    __int16 v9 = [*(id *)(a1 + 32) savedRequestDataToUseForStopping];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) savedRequestToUseForStopping];
      uint64_t v11 = [v10 copyWith:2];

      id v12 = [*(id *)(a1 + 32) secureKeyRequestHandler];
      v17 = v11;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      v14 = [*(id *)(a1 + 32) account];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __68__IMAVSecureKeyLoader_sendStopRequestForStreamingLicenseIfNecessary__block_invoke_56;
      v16[3] = &unk_1E5E63970;
      v16[4] = *(void *)(a1 + 32);
      [v12 loadKeyDataFor:v13 account:v14 completion:v16];

LABEL_8:
      goto LABEL_9;
    }
  }
  uint64_t v11 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = [*(id *)(a1 + 32) recipient];
    v13 = [v12 URL];
    dispatch_queue_t v15 = [*(id *)(a1 + 32) contentAdamId];
    *(_DWORD *)buf = 138412546;
    v19 = v13;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1AC9D5000, v11, OS_LOG_TYPE_ERROR, "Failed to send stop request because a start request was never made. URL: %@ Content ID %@", buf, 0x16u);

    goto LABEL_8;
  }
LABEL_9:
}

void __68__IMAVSecureKeyLoader_sendStopRequestForStreamingLicenseIfNecessary__block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 firstObject];
  v4 = [v3 error];

  if (v4)
  {
    BOOL v5 = _MTLogCategoryDRM();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [*(id *)(a1 + 32) recipient];
      uint64_t v7 = [v6 URL];
      uint64_t v8 = [*(id *)(a1 + 32) contentAdamId];
      int v9 = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      id v12 = v8;
      _os_log_impl(&dword_1AC9D5000, v5, OS_LOG_TYPE_ERROR, "Stop request failed with error %@ for Content ID %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)securelyInvalidateOfflineDataForRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IMAVSecureKeyLoader *)self useCase] != 1) {
    -[IMAVSecureKeyLoader securelyInvalidateOfflineDataForRequests:completion:]();
  }
  uint64_t v8 = [(IMAVSecureKeyLoader *)self keyLoaderQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke;
  block[3] = &unk_1E5E630E0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v3 = dispatch_group_create();
  uint64_t v4 = [*(id *)(v1 + 32) count];
  if (v4)
  {
    unint64_t v6 = v4;
    uint64_t v7 = 0;
    *(void *)&long long v5 = 138412290;
    long long v36 = v5;
    uint64_t v38 = v2;
    uint64_t v39 = v1;
    v37 = v3;
    do
    {
      unint64_t v42 = v6;
      if (v6 >= 0xA) {
        uint64_t v8 = 10;
      }
      else {
        uint64_t v8 = v6;
      }
      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(v1 + 32), "count"));
      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v40 = v8;
      uint64_t v41 = v7;
      id v9 = objc_msgSend(*(id *)(v1 + 32), "subarrayWithRange:", v7, v8);
      dispatch_group_enter(v3);
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id obj = v9;
      uint64_t v10 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v52;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v52 != v12) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(void **)(*((void *)&v51 + 1) + 8 * v13);
            dispatch_queue_t v15 = [MTContentKeyRequest alloc];
            v16 = [v14 keyIdentifier];
            v17 = [v14 contentAdamId];
            v18 = [v14 secureInvalidationDsid];
            v19 = [(MTContentKeyRequest *)v15 initWithKeyIdentifier:v16 adamId:v17 requestType:3 offlineRequest:1 secureInvalidationDsid:v18];

            uint64_t v20 = [v14 contentAdamId];
            if (v20)
            {
              v21 = (void *)v20;
              uint64_t v22 = [v14 keyData];

              if (v22)
              {
                objc_super v23 = [v14 keyData];
                v24 = [v14 contentAdamId];
                [v43 setObject:v23 forKeyedSubscript:v24];
              }
            }
            uint64_t v25 = __pendingStopNonceRequestAdamIds;
            v26 = [(MTContentKeyRequest *)v19 adamId];
            LOBYTE(v25) = [(id)v25 containsObject:v26];

            if ((v25 & 1) == 0)
            {
              [v44 addObject:v19];
              v27 = (void *)__pendingStopNonceRequestAdamIds;
              v28 = [(MTContentKeyRequest *)v19 adamId];
              [v27 addObject:v28];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
        }
        while (v11);
      }

      id v29 = _MTLogCategoryDRM();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v36;
        uint64_t v56 = __pendingStopNonceRequestAdamIds;
        _os_log_impl(&dword_1AC9D5000, v29, OS_LOG_TYPE_DEFAULT, "Pending stop nonce requests: %@", buf, 0xCu);
      }

      uint64_t v1 = v39;
      v30 = [*(id *)(v39 + 40) secureKeyRequestHandler];
      v31 = [*(id *)(v39 + 40) account];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_63;
      v46[3] = &unk_1E5E63A10;
      v46[4] = *(void *)(v39 + 40);
      id v47 = v44;
      v2 = v38;
      id v48 = v38;
      id v49 = v43;
      uint64_t v3 = v37;
      v50 = v37;
      id v32 = v43;
      id v33 = v44;
      [v30 loadKeyDataFor:v33 account:v31 completion:v46];

      unint64_t v6 = v42 - v40;
      uint64_t v7 = v40 + v41;
    }
    while (v42 != v40);
  }
  dispatch_time_t v34 = dispatch_time(0, 60000000000);
  dispatch_group_wait(v3, v34);
  uint64_t v35 = *(void *)(v1 + 48);
  if (v35) {
    (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v2);
  }
}

void __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_63(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] keyLoaderQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_2;
  v8[3] = &unk_1E5E639E8;
  id v9 = a1[5];
  id v10 = v3;
  id v11 = a1[6];
  id v5 = a1[7];
  id v6 = a1[4];
  id v12 = v5;
  id v13 = v6;
  id v14 = a1[8];
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v66 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = (void *)__pendingStopNonceRequestAdamIds;
        id v7 = [*(id *)(*((void *)&v65 + 1) + 8 * i) adamId];
        [v6 removeObject:v7];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v65 objects:v76 count:16];
    }
    while (v3);
  }

  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  group = dispatch_group_create();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v8 = a1;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v62;
    uint64_t v49 = *MEMORY[0x1E4F159E8];
    *(void *)&long long v11 = 138412546;
    long long v47 = v11;
    uint64_t v50 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v62 != v13) {
          objc_enumerationMutation(v9);
        }
        dispatch_queue_t v15 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        v16 = objc_msgSend(v15, "error", v47);

        if (v16)
        {
          v17 = [v15 request];
          v18 = [v17 adamId];

          if (!v18) {
            continue;
          }
          v19 = *(void **)(v8 + 48);
          uint64_t v20 = [v15 error];
          v21 = [v15 request];
          uint64_t v22 = [v21 adamId];
          [v19 setObject:v20 forKey:v22];
        }
        else
        {
          objc_super v23 = *(void **)(v8 + 56);
          v24 = [v15 request];
          uint64_t v25 = [v24 adamId];
          uint64_t v20 = [v23 objectForKey:v25];

          if (v20)
          {
            id v26 = v9;
            v27 = _MTLogCategoryDRM();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = [v15 keyData];
              id v29 = [v28 base64EncodedStringWithOptions:0];
              v30 = [v15 request];
              v31 = [v30 adamId];
              *(_DWORD *)buf = v47;
              v72 = v29;
              __int16 v73 = 2112;
              v74 = v31;
              _os_log_impl(&dword_1AC9D5000, v27, OS_LOG_TYPE_DEFAULT, "Stop request sending nonce data %@ for adam id %@", buf, 0x16u);

              uint64_t v8 = a1;
            }

            id v32 = [v15 keyData];
            if (v32)
            {
              uint64_t v69 = v49;
              id v33 = [v15 keyData];
              v70 = v33;
              v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
            }
            else
            {
              v21 = 0;
            }

            dispatch_group_enter(group);
            uint64_t v39 = [*(id *)(v8 + 64) contentKeySession];
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_65;
            v57[3] = &unk_1E5E63998;
            v57[4] = v15;
            id v58 = *(id *)(v8 + 48);
            v59 = group;
            id v60 = v52;
            [v39 invalidatePersistableContentKey:v20 options:v21 completionHandler:v57];

            id v9 = v26;
            uint64_t v13 = v50;
          }
          else
          {
            v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMAVSecureKeyLoaderErrorDomain" code:-383005 userInfo:0];
            dispatch_time_t v34 = [v15 request];
            uint64_t v35 = [v34 adamId];

            if (v35)
            {
              long long v36 = *(void **)(v8 + 48);
              v37 = [v15 request];
              uint64_t v38 = [v37 adamId];
              [v36 setObject:v21 forKey:v38];
            }
          }
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v12);
  }

  dispatch_time_t v40 = dispatch_time(0, 30000000000);
  dispatch_group_wait(group, v40);
  uint64_t v41 = [*(id *)(v8 + 64) secureKeyRequestHandler];
  [*(id *)(v8 + 64) account];
  v43 = uint64_t v42 = v8;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_2_67;
  v53[3] = &unk_1E5E639C0;
  id v44 = *(id *)(v42 + 48);
  uint64_t v45 = *(void *)(v42 + 64);
  v46 = *(void **)(v42 + 72);
  id v54 = v44;
  uint64_t v55 = v45;
  id v56 = v46;
  [v41 loadKeyDataFor:v52 account:v43 completion:v53];
}

void __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) request];
    id v7 = [v6 adamId];

    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 40);
      id v9 = [*(id *)(a1 + 32) request];
      uint64_t v10 = [v9 adamId];
      [v8 setObject:v5 forKey:v10];
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    long long v11 = [MTContentKeyRequest alloc];
    uint64_t v12 = [*(id *)(a1 + 32) request];
    uint64_t v13 = [v12 keyIdentifier];
    id v14 = [*(id *)(a1 + 32) request];
    dispatch_queue_t v15 = [v14 adamId];
    v16 = [*(id *)(a1 + 32) request];
    v17 = [v16 secureInvalidationDsid];
    v18 = [(MTContentKeyRequest *)v11 initWithKeyIdentifier:v13 adamId:v15 requestType:2 offlineRequest:1 secureInvalidationDsid:v17];

    [(MTContentKeyRequest *)v18 setRequestData:v19];
    [*(id *)(a1 + 56) addObject:v18];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_2_67(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v26;
    *(void *)&long long v5 = 138412546;
    long long v24 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "error", v24);
        if (!v10) {
          goto LABEL_12;
        }
        long long v11 = (void *)v10;
        uint64_t v12 = [v9 error];
        if ([v12 code] == -1002)
        {

LABEL_12:
          id v19 = [*(id *)(a1 + 40) secureKeyRequestStorage];
          [v19 removeKeyDataFor:v9];
          goto LABEL_13;
        }
        uint64_t v13 = [v9 request];
        id v14 = [v13 adamId];

        if (!v14) {
          goto LABEL_12;
        }
        dispatch_queue_t v15 = *(void **)(a1 + 32);
        v16 = [v9 error];
        v17 = [v9 request];
        v18 = [v17 adamId];
        [v15 setObject:v16 forKey:v18];

        id v19 = _MTLogCategoryDRM();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = [v9 error];
          v21 = [v20 localizedDescription];
          uint64_t v22 = [v9 request];
          objc_super v23 = [v22 adamId];
          *(_DWORD *)buf = v24;
          v30 = v21;
          __int16 v31 = 2112;
          id v32 = v23;
          _os_log_impl(&dword_1AC9D5000, v19, OS_LOG_TYPE_ERROR, "Stop request failed with error %@ for adam id %@", buf, 0x16u);
        }
LABEL_13:
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v6);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)invalidateAndCancel
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(IMAVSecureKeyLoader *)self recipient];
    long long v5 = [v4 URL];
    uint64_t v6 = [v5 absoluteString];
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1AC9D5000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate and cancel for %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [(IMAVSecureKeyLoader *)self contentKeySession];
  uint64_t v8 = [(IMAVSecureKeyLoader *)self recipient];
  [v7 removeContentKeyRecipient:v8];

  [(IMAVSecureKeyLoader *)self setContentKeySession:0];
}

- (void)requestKeyResponseFromContentKeyRequest:(id)a3 requestType:(int64_t)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 identifier];
  uint64_t v11 = [(IMAVSecureKeyLoader *)self contentKeySession];

  uint64_t v12 = _MTLogCategoryDRM();
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v8 identifier];
      *(_DWORD *)buf = 138412546;
      long long v25 = v14;
      __int16 v26 = 2048;
      int64_t v27 = a4;
      _os_log_impl(&dword_1AC9D5000, v13, OS_LOG_TYPE_DEFAULT, "[Request Key Response] for %@. Request type %ld", buf, 0x16u);
    }
    if (!v9) {
      -[IMAVSecureKeyLoader requestKeyResponseFromContentKeyRequest:requestType:completion:]();
    }
    dispatch_queue_t v15 = [(IMAVSecureKeyLoader *)self keyLoaderQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke;
    block[3] = &unk_1E5E63B28;
    id v19 = v8;
    uint64_t v20 = self;
    int64_t v23 = a4;
    id v22 = v9;
    id v21 = v10;
    dispatch_async(v15, block);

    v16 = v19;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = [v8 identifier];
      *(_DWORD *)buf = 138412546;
      long long v25 = v17;
      __int16 v26 = 2048;
      int64_t v27 = a4;
      _os_log_impl(&dword_1AC9D5000, v13, OS_LOG_TYPE_ERROR, "[Request Key Response] Failed for %@. Request type %ld. ContentKeySession is nil.", buf, 0x16u);
    }
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMAVSecureKeyLoaderErrorDomain" code:-383006 userInfo:0];
    [(IMAVSecureKeyLoader *)self cleanupAfterContentKeyRequestWithError:v16];
  }
}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  id v3 = [v2 dataUsingEncoding:4];

  BOOL v4 = ([*(id *)(a1 + 40) _isOfflineAsset] & 1) != 0 || objc_msgSend(*(id *)(a1 + 40), "useCase") == 1;
  long long v5 = [MTContentKeyRequest alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) contentAdamId];
  id v8 = [(MTContentKeyRequest *)v5 initFrom:v6 adamId:v7 requestType:*(void *)(a1 + 64) offlineRequest:v4];

  if ([*(id *)(a1 + 40) _isOfflineAsset] && !objc_msgSend(*(id *)(a1 + 40), "useCase"))
  {
    v17 = _MTLogCategoryDRM();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [*(id *)(a1 + 32) identifier];
      id v19 = [*(id *)(a1 + 40) contentAdamId];
      *(_DWORD *)buf = 138412546;
      id v32 = v18;
      __int16 v33 = 2112;
      uint64_t v34 = v19;
      _os_log_impl(&dword_1AC9D5000, v17, OS_LOG_TYPE_DEFAULT, "[Request Key Response] offline key %@ content adam id %@", buf, 0x16u);
    }
    uint64_t v20 = [*(id *)(a1 + 40) secureKeyRequestStorage];
    id v21 = [v20 retrieveKeyDataFor:v8];

    if (v21)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      goto LABEL_11;
    }
    id v22 = _MTLogCategoryDRM();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC9D5000, v22, OS_LOG_TYPE_DEFAULT, "[Request Key Response] offline key should be local, but is missing. This will be reported, but we will attempt to recover.", buf, 2u);
    }

    +[PFBugReporterBridge reportMissingFairPlayOfflineKey];
  }
  if ([*(id *)(a1 + 40) _isOfflineAsset])
  {
    if ([*(id *)(a1 + 40) useCase] == 1)
    {
      id v9 = [*(id *)(a1 + 40) secureKeyRequestStorage];
      uint64_t v10 = [v8 adamId];
      int v11 = objc_msgSend(v9, "keyExistsInStorageFor:", objc_msgSend(v10, "longLongValue"));

      if (v11)
      {
        uint64_t v12 = [*(id *)(a1 + 40) secureKeyRequestStorage];
        uint64_t v13 = [v8 adamId];
        objc_msgSend(v12, "markOfflineKeyFor:pendingDeletion:", objc_msgSend(v13, "longLongValue"), 0);
      }
    }
  }
  id v14 = [*(id *)(a1 + 40) secureKeyRequestHandler];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_70;
  v23[3] = &unk_1E5E63B00;
  v23[4] = *(void *)(a1 + 40);
  id v24 = v3;
  id v25 = *(id *)(a1 + 32);
  id v26 = v8;
  id v28 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 64);
  id v27 = v15;
  uint64_t v29 = v16;
  BOOL v30 = v4;
  [v14 loadCertificateDataWithCompletion:v23];

LABEL_11:
}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) keyLoaderQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_2;
  block[3] = &unk_1E5E63AD8;
  id v11 = v3;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 32);
  id v17 = v5;
  uint64_t v15 = v6;
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  id v16 = v7;
  uint64_t v18 = v8;
  char v19 = *(unsigned char *)(a1 + 88);
  id v9 = v3;
  dispatch_async(v4, block);
}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_2(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) keyData];
  id v3 = [*(id *)(a1 + 32) error];
  if (v2 && *(void *)(a1 + 40))
  {
    if ([*(id *)(a1 + 48) status] != 5 && objc_msgSend(*(id *)(a1 + 48), "status") != 4)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      id v11 = *(void **)(a1 + 48);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_3;
      v17[3] = &unk_1E5E63AB0;
      int8x16_t v16 = *(int8x16_t *)(a1 + 56);
      id v13 = (id)v16.i64[0];
      int8x16_t v18 = vextq_s8(v16, v16, 8uLL);
      id v21 = *(id *)(a1 + 80);
      id v14 = *(id *)(a1 + 72);
      uint64_t v15 = *(void *)(a1 + 88);
      id v19 = v14;
      uint64_t v22 = v15;
      id v20 = *(id *)(a1 + 48);
      char v23 = *(unsigned char *)(a1 + 96);
      [v11 makeStreamingContentKeyRequestDataForApp:v2 contentIdentifier:v12 options:0 completionHandler:v17];

      goto LABEL_12;
    }
    BOOL v4 = [*(id *)(a1 + 48) error];

    if (v4)
    {
      uint64_t v24 = *MEMORY[0x1E4F28A50];
      id v5 = [*(id *)(a1 + 48) error];
      v25[0] = v5;
      BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = -383003;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    BOOL v4 = v8;
    if (v3) {
      [v8 setObject:v3 forKey:*MEMORY[0x1E4F28A50]];
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = -383001;
  }
  id v9 = [v6 errorWithDomain:@"IMAVSecureKeyLoaderErrorDomain" code:v7 userInfo:v4];
  uint64_t v10 = [[MTContentKeyResponse alloc] initWithRequest:*(void *)(a1 + 56) error:v9];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();

LABEL_12:
}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) keyLoaderQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_4;
  block[3] = &unk_1E5E63A88;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v19 = *(id *)(a1 + 64);
  id v15 = v5;
  id v8 = *(id *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 32);
  id v16 = v8;
  uint64_t v17 = v9;
  id v18 = *(id *)(a1 + 56);
  char v21 = *(unsigned char *)(a1 + 80);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v9 = [[MTContentKeyResponse alloc] initWithRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) setRequestData:*(void *)(a1 + 48)];
    uint64_t v2 = _MTLogCategoryDRM();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 56);
      BOOL v4 = [*(id *)(a1 + 40) adamId];
      uint64_t v5 = *(void *)(a1 + 88);
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v3;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2048;
      uint64_t v21 = v5;
      _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "[Request Key Response] Loading key request data from network for %@ adam id %@. Request type %ld", buf, 0x20u);
    }
    if (*(void *)(a1 + 88) != 2)
    {
      [*(id *)(a1 + 64) setSavedRequestToUseForStopping:*(void *)(a1 + 40)];
      [*(id *)(a1 + 64) setSavedRequestDataToUseForStopping:*(void *)(a1 + 48)];
    }
    id v6 = [*(id *)(a1 + 64) secureKeyRequestHandler];
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    id v8 = [*(id *)(a1 + 64) account];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_72;
    v10[3] = &unk_1E5E63A60;
    v10[4] = *(void *)(a1 + 64);
    id v13 = *(id *)(a1 + 80);
    id v11 = *(id *)(a1 + 72);
    char v14 = *(unsigned char *)(a1 + 96);
    id v12 = *(id *)(a1 + 56);
    [v6 loadKeyDataFor:v7 account:v8 completion:v10];
  }
}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) keyLoaderQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_2_73;
  v8[3] = &unk_1E5E63A38;
  id v9 = v3;
  id v13 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  char v14 = *(unsigned char *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_2_73(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) firstObject];
  id v3 = [v2 error];

  if (!v3)
  {
    BOOL v4 = [v2 keyData];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = *(void **)(a1 + 40);
      uint64_t v6 = [v2 keyData];
      id v13 = 0;
      id v7 = [v5 persistableContentKeyFromKeyVendorResponse:v6 options:0 error:&v13];
      id v8 = v13;

      if (v8)
      {
        [v2 setError:v8];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      id v7 = v4;
    }
    [v2 setKeyData:v7];
    if (*(unsigned char *)(a1 + 72))
    {
      id v9 = [*(id *)(a1 + 48) secureKeyRequestStorage];
      char v10 = [v9 saveKeyDataFor:v2];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = _MTLogCategoryDRM();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v12;
          _os_log_impl(&dword_1AC9D5000, v11, OS_LOG_TYPE_ERROR, "[Request Key Response] Failed to save offline keyData for %@", buf, 0xCu);
        }
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_13;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_14:
}

- (void)timeoutKeyRequest
{
  id v3 = [(IMAVSecureKeyLoader *)self keyLoaderQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__IMAVSecureKeyLoader_timeoutKeyRequest__block_invoke;
  block[3] = &unk_1E5E611F0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __40__IMAVSecureKeyLoader_timeoutKeyRequest__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = [*(id *)(a1 + 32) contentAdamId];
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_ERROR, "Content key request timeout for content id %@", (uint8_t *)&v5, 0xCu);
  }
  BOOL v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMAVSecureKeyLoaderErrorDomain" code:-383002 userInfo:0];
  objc_msgSend(*(id *)(a1 + 32), "cleanupAfterContentKeyRequestForOfflineRenewal:withError:", objc_msgSend(*(id *)(a1 + 32), "isRenewal"), v4);
}

- (void)finishContentKeyRequest:(id)a3 withResponse:(id)a4
{
}

- (void)finishContentKeyRequest:(id)a3 forOfflineRenewal:(BOOL)a4 withResponse:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  char v10 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 identifier];
    uint64_t v12 = [(IMAVSecureKeyLoader *)self contentAdamId];
    id v13 = [v9 error];
    *(_DWORD *)buf = 138412802;
    char v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl(&dword_1AC9D5000, v10, OS_LOG_TYPE_DEFAULT, "Finished content key request for identifier %@ for content id %@ with error %@", buf, 0x20u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__IMAVSecureKeyLoader_finishContentKeyRequest_forOfflineRenewal_withResponse___block_invoke;
  block[3] = &unk_1E5E611F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  char v14 = [v9 error];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F164E8];
    __int16 v18 = [v9 keyData];
    id v19 = [v9 renewalDate];
    uint64_t v16 = [v17 contentKeyResponseWithFairPlayStreamingKeyResponseData:v18 renewalDate:v19];

    [v8 processContentKeyResponse:v16];
  }
  else
  {
    uint64_t v16 = [v9 error];
    [v8 processContentKeyResponseError:v16];
  }

  __int16 v20 = [v9 error];
  [(IMAVSecureKeyLoader *)self cleanupAfterContentKeyRequestForOfflineRenewal:v6 withError:v20];
}

uint64_t __78__IMAVSecureKeyLoader_finishContentKeyRequest_forOfflineRenewal_withResponse___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_timeoutKeyRequest object:0];
}

- (void)cleanupAfterContentKeyRequestWithError:(id)a3
{
}

- (void)cleanupAfterContentKeyRequestForOfflineRenewal:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4) {
    [(IMAVSecureKeyLoader *)self setContentAdamId:0];
  }
  uint64_t v7 = [(IMAVSecureKeyLoader *)self pendingCompletion];

  if (v7)
  {
    id v8 = [(IMAVSecureKeyLoader *)self pendingCompletion];
    [(IMAVSecureKeyLoader *)self setPendingCompletion:0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__IMAVSecureKeyLoader_cleanupAfterContentKeyRequestForOfflineRenewal_withError___block_invoke;
    v10[3] = &unk_1E5E61518;
    id v12 = v8;
    id v11 = v6;
    id v9 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __80__IMAVSecureKeyLoader_cleanupAfterContentKeyRequestForOfflineRenewal_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_isOfflineAsset
{
  uint64_t v2 = [(IMAVSecureKeyLoader *)self recipient];
  id v3 = [v2 URL];
  char v4 = [v3 isFileURL];

  return v4;
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC9D5000, v6, OS_LOG_TYPE_DEFAULT, "Received content key request", buf, 2u);
  }

  if ([(IMAVSecureKeyLoader *)self useCase] == 1
    || [(IMAVSecureKeyLoader *)self _isOfflineAsset])
  {
    uint64_t v7 = _MTLogCategoryDRM();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 identifier];
      *(_DWORD *)buf = 138412290;
      __int16 v18 = v8;
      _os_log_impl(&dword_1AC9D5000, v7, OS_LOG_TYPE_DEFAULT, "Offline key: received initial request, now waiting for offline request for %@", buf, 0xCu);
    }
    id v16 = 0;
    char v9 = [v5 respondByRequestingPersistableContentKeyRequestAndReturnError:&v16];
    id v10 = v16;
    if ((v9 & 1) == 0)
    {
      id v11 = _MTLogCategoryDRM();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v5 identifier];
        id v13 = [(IMAVSecureKeyLoader *)self contentAdamId];
        *(_DWORD *)buf = 138412802;
        __int16 v18 = v12;
        __int16 v19 = 2112;
        __int16 v20 = v13;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl(&dword_1AC9D5000, v11, OS_LOG_TYPE_DEFAULT, "Offline key: offline request failed for %@ episode %@ with error %@", buf, 0x20u);
      }
      [(IMAVSecureKeyLoader *)self cleanupAfterContentKeyRequestWithError:v10];
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__IMAVSecureKeyLoader_contentKeySession_didProvideContentKeyRequest___block_invoke;
    v14[3] = &unk_1E5E63B50;
    v14[4] = self;
    id v15 = v5;
    [(IMAVSecureKeyLoader *)self requestKeyResponseFromContentKeyRequest:v15 requestType:0 completion:v14];
  }
}

uint64_t __69__IMAVSecureKeyLoader_contentKeySession_didProvideContentKeyRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishContentKeyRequest:*(void *)(a1 + 40) withResponse:a2];
}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 identifier];
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1AC9D5000, v6, OS_LOG_TYPE_DEFAULT, "Received content key request for renewal for %@.", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__IMAVSecureKeyLoader_contentKeySession_didProvideRenewingContentKeyRequest___block_invoke;
  v9[3] = &unk_1E5E63B50;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(IMAVSecureKeyLoader *)self requestKeyResponseFromContentKeyRequest:v8 requestType:1 completion:v9];
}

uint64_t __77__IMAVSecureKeyLoader_contentKeySession_didProvideRenewingContentKeyRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishContentKeyRequest:*(void *)(a1 + 40) withResponse:a2];
}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 identifier];
    *(_DWORD *)buf = 138412546;
    char v14 = v7;
    __int16 v15 = 1024;
    BOOL v16 = [(IMAVSecureKeyLoader *)self isRenewal];
    _os_log_impl(&dword_1AC9D5000, v6, OS_LOG_TYPE_DEFAULT, "Received content key request for persistable key for %@. renewal? %d", buf, 0x12u);
  }
  BOOL v8 = [(IMAVSecureKeyLoader *)self isRenewal];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__IMAVSecureKeyLoader_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke;
  v11[3] = &unk_1E5E63B50;
  BOOL v9 = v8;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  [(IMAVSecureKeyLoader *)self requestKeyResponseFromContentKeyRequest:v10 requestType:v9 completion:v11];
}

void __80__IMAVSecureKeyLoader_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "finishContentKeyRequest:forOfflineRenewal:withResponse:", v3, objc_msgSend(v2, "isRenewal"), v4);
}

- (void)contentKeySession:(id)a3 contentKeyRequestDidSucceed:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v7 = 138412290;
    BOOL v8 = v6;
    _os_log_impl(&dword_1AC9D5000, v5, OS_LOG_TYPE_DEFAULT, "🔑 Content key request succeeded for %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = [v7 identifier];
    int v14 = 138412546;
    __int16 v15 = v10;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_1AC9D5000, v9, OS_LOG_TYPE_ERROR, "🔑🚨 Content key request failed for %@ with error: %@", (uint8_t *)&v14, 0x16u);
  }
  id v11 = [(IMAVSecureKeyLoader *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(IMAVSecureKeyLoader *)self delegate];
    [v13 contentKeyRequestDidFailWithError:v8];
  }
}

- (IMAVSecureKeyLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IMAVSecureKeyLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVContentKeySession)contentKeySession
{
  return self->_contentKeySession;
}

- (void)setContentKeySession:(id)a3
{
}

- (AVURLAsset)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)contentAdamId
{
  return self->_contentAdamId;
}

- (void)setContentAdamId:(id)a3
{
}

- (id)pendingCompletion
{
  return self->_pendingCompletion;
}

- (void)setPendingCompletion:(id)a3
{
}

- (BOOL)isRenewal
{
  return self->_isRenewal;
}

- (void)setIsRenewal:(BOOL)a3
{
  self->_isRenewal = a3;
}

- (MTSecureKeyRequestHandler)secureKeyRequestHandler
{
  return self->_secureKeyRequestHandler;
}

- (void)setSecureKeyRequestHandler:(id)a3
{
}

- (NSURLSessionDelegate)urlProtocolDelegate
{
  return self->_urlProtocolDelegate;
}

- (void)setUrlProtocolDelegate:(id)a3
{
}

- (MTSecureKeyRequestStorage)secureKeyRequestStorage
{
  return self->_secureKeyRequestStorage;
}

- (void)setSecureKeyRequestStorage:(id)a3
{
}

- (unint64_t)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unint64_t)a3
{
  self->_useCase = a3;
}

- (MTContentKeyRequest)savedRequestToUseForStopping
{
  return self->_savedRequestToUseForStopping;
}

- (void)setSavedRequestToUseForStopping:(id)a3
{
}

- (NSData)savedRequestDataToUseForStopping
{
  return self->_savedRequestDataToUseForStopping;
}

- (void)setSavedRequestDataToUseForStopping:(id)a3
{
}

- (OS_dispatch_queue)keyLoaderQueue
{
  return self->_keyLoaderQueue;
}

- (void)setKeyLoaderQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLoaderQueue, 0);
  objc_storeStrong((id *)&self->_savedRequestDataToUseForStopping, 0);
  objc_storeStrong((id *)&self->_savedRequestToUseForStopping, 0);
  objc_storeStrong((id *)&self->_secureKeyRequestStorage, 0);
  objc_storeStrong((id *)&self->_urlProtocolDelegate, 0);
  objc_storeStrong((id *)&self->_secureKeyRequestHandler, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_contentAdamId, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startKeyLoadingProcessWithKeyIdentifier:(os_log_t)log contentAdamId:isRenewal:completion:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1AC9D5000, log, OS_LOG_TYPE_FAULT, "[Key Loading Process] Fail to start loading key.", v1, 2u);
}

- (void)securelyInvalidateOfflineDataForRequests:completion:.cold.1()
{
  __assert_rtn("-[IMAVSecureKeyLoader securelyInvalidateOfflineDataForRequests:completion:]", "IMAVSecureKeyLoader.m", 189, "self.useCase == IMAVSecureKeyLoaderUseCaseDownload");
}

- (void)requestKeyResponseFromContentKeyRequest:requestType:completion:.cold.1()
{
}

@end