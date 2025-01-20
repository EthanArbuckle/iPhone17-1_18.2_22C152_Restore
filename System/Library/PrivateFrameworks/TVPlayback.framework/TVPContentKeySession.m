@interface TVPContentKeySession
+ (void)initialize;
- (AVContentKeySession)contentKeySession;
- (BOOL)offlineKeyGenerationIsForRenewal;
- (NSArray)offlineKeyIdentifiersInProgress;
- (NSMutableArray)keyRequestsInProgress;
- (OS_dispatch_queue)contentKeyProcessingQueue;
- (TVPContentKeyLoading)contentKeyLoader;
- (TVPContentKeySession)init;
- (TVPContentKeySession)initWithContentKeyLoader:(id)a3 avAsset:(id)a4;
- (id)offlineKeyGenerationCompletionHandler;
- (void)_finishOfflineKeyGeneration;
- (void)_generateOfflineKeyRequestsForIdentifiers:(id)a3 isRenewal:(BOOL)a4 completion:(id)a5;
- (void)_loadAVContentKeyRequests:(id)a3 type:(int64_t)a4 isRenewal:(BOOL)a5;
- (void)_timeoutOfflineKeyRequestGeneration;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didUpdatePersistableContentKey:(id)a4 forContentKeyIdentifier:(id)a5;
- (void)fetchOfflineKeysForParams:(id)a3 completion:(id)a4;
- (void)finishKeyRequest:(id)a3;
- (void)generateOfflineKeyRequestsForIdentifiers:(id)a3 completion:(id)a4;
- (void)makeSecureInvalidationDataForOfflineKeyData:(id)a3 nonceData:(id)a4 completion:(id)a5;
- (void)setContentKeyLoader:(id)a3;
- (void)setContentKeyProcessingQueue:(id)a3;
- (void)setContentKeySession:(id)a3;
- (void)setKeyRequestsInProgress:(id)a3;
- (void)setOfflineKeyGenerationCompletionHandler:(id)a3;
- (void)setOfflineKeyGenerationIsForRenewal:(BOOL)a3;
- (void)setOfflineKeyIdentifiersInProgress:(id)a3;
@end

@implementation TVPContentKeySession

+ (void)initialize
{
  if (initialize_onceToken_10 != -1) {
    dispatch_once(&initialize_onceToken_10, &__block_literal_global_19);
  }
}

uint64_t __34__TVPContentKeySession_initialize__block_invoke()
{
  sLogObject_7 = (uint64_t)os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  return MEMORY[0x270F9A758]();
}

- (TVPContentKeySession)init
{
  return [(TVPContentKeySession *)self initWithContentKeyLoader:0 avAsset:0];
}

- (TVPContentKeySession)initWithContentKeyLoader:(id)a3 avAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TVPContentKeySession;
  v9 = [(TVPContentKeySession *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentKeyLoader, a3);
    uint64_t v11 = [MEMORY[0x263EFA6E0] contentKeySessionWithKeySystem:*MEMORY[0x263EF97F8]];
    contentKeySession = v10->_contentKeySession;
    v10->_contentKeySession = (AVContentKeySession *)v11;

    [(AVContentKeySession *)v10->_contentKeySession setDelegate:v10 queue:MEMORY[0x263EF83A0]];
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    keyRequestsInProgress = v10->_keyRequestsInProgress;
    v10->_keyRequestsInProgress = v13;

    if (v8) {
      [(AVContentKeySession *)v10->_contentKeySession addContentKeyRecipient:v8];
    }
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.TVPContentKeyProcessing", 0);
    contentKeyProcessingQueue = v10->_contentKeyProcessingQueue;
    v10->_contentKeyProcessingQueue = (OS_dispatch_queue *)v15;
  }
  return v10;
}

- (void)makeSecureInvalidationDataForOfflineKeyData:(id)a3 nonceData:(id)a4 completion:(id)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    uint64_t v16 = *MEMORY[0x263EF97F0];
    v17[0] = v9;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = [(TVPContentKeySession *)self contentKeySession];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__TVPContentKeySession_makeSecureInvalidationDataForOfflineKeyData_nonceData_completion___block_invoke;
  v14[3] = &unk_264CC69A0;
  id v15 = v10;
  id v13 = v10;
  [v12 invalidatePersistableContentKey:v8 options:v11 completionHandler:v14];
}

void __89__TVPContentKeySession_makeSecureInvalidationDataForOfflineKeyData_nonceData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__TVPContentKeySession_makeSecureInvalidationDataForOfflineKeyData_nonceData_completion___block_invoke_2;
  block[3] = &unk_264CC6978;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __89__TVPContentKeySession_makeSecureInvalidationDataForOfflineKeyData_nonceData_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)generateOfflineKeyRequestsForIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)fetchOfflineKeysForParams:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v15 = [v14 keyIdentifier];

        if (v15)
        {
          uint64_t v16 = [v14 keyIdentifier];
          [v8 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke;
  v19[3] = &unk_264CC7308;
  id v20 = v9;
  v21 = self;
  id v22 = v7;
  id v17 = v7;
  id v18 = v9;
  [(TVPContentKeySession *)self _generateOfflineKeyRequestsForIdentifiers:v8 isRenewal:0 completion:v19];
}

void __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (![v3 count])
  {
    if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_ERROR)) {
      __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke_cold_1();
    }
    uint64_t v24 = *(void *)(a1 + 48);
    if (!v24) {
      goto LABEL_30;
    }
LABEL_29:
    (*(void (**)(void))(v24 + 16))();
    goto LABEL_30;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v25 = v3;
  id v4 = v3;
  uint64_t v30 = [v4 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v36;
    obuint64_t j = v4;
    uint64_t v27 = a1;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v7 = sLogObject_7;
        if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v6;
          _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "Loading key request %@", buf, 0xCu);
        }
        id v8 = [v6 keyIdentifier];
        id v9 = [v8 absoluteString];

        if (v9)
        {
          uint64_t v28 = v6;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v10 = *(id *)(a1 + 32);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v32;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v32 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = *(void **)(*((void *)&v31 + 1) + 8 * j);
                uint64_t v16 = [v15 keyIdentifier];
                if (v16)
                {
                  id v17 = (void *)v16;
                  id v18 = [v15 keyIdentifier];
                  int v19 = [v18 isEqualToString:v9];

                  if (v19)
                  {
                    id v20 = [v15 keyFormatVersions];
                    [v28 setKeyFormatVersions:v20];

                    goto LABEL_21;
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_21:

          a1 = v27;
        }
      }
      id v4 = obj;
      uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v30);
  }

  v21 = [*(id *)(a1 + 40) contentKeyLoader];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    long long v23 = [*(id *)(a1 + 40) contentKeyLoader];
    [v23 loadFairPlayStreamingKeyRequests:v4 completion:*(void *)(a1 + 48)];

    id v3 = v25;
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_ERROR)) {
    __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke_cold_2();
  }
  uint64_t v24 = *(void *)(a1 + 48);
  id v3 = v25;
  if (v24) {
    goto LABEL_29;
  }
LABEL_30:
}

- (void)finishKeyRequest:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isCancelled])
  {
    id v5 = sLogObject_7;
    if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Key request cancelled or failed, not processing response";
LABEL_4:
      _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
  }
  else if ([v4 type] || !objc_msgSend(v4, "wantsOfflineKeysIfPossible"))
  {
    if ([v4 type] != 3)
    {
      id v10 = [v4 keyResponseData];
      if ([v10 length])
      {
        uint64_t v11 = [(TVPContentKeySession *)self contentKeySession];
        uint64_t v12 = [v11 contentKeyRecipients];
        uint64_t v13 = [v12 count];

        v14 = sLogObject_7;
        BOOL v15 = os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            uint64_t v16 = v14;
            id v17 = [v4 renewalDate];
            *(_DWORD *)buf = 138412546;
            id v34 = v4;
            __int16 v35 = 2112;
            long long v36 = v17;
            _os_log_impl(&dword_236FC5000, v16, OS_LOG_TYPE_DEFAULT, "Received key response data.  Will call processContentKeyResponse on separate queue for key request %@, renewal date: %@", buf, 0x16u);
          }
          objc_initWeak((id *)buf, self);
          id v18 = [(TVPContentKeySession *)self contentKeyProcessingQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __41__TVPContentKeySession_finishKeyRequest___block_invoke_11;
          block[3] = &unk_264CC5B18;
          objc_copyWeak(&v29, (id *)buf);
          id v27 = v4;
          id v28 = v10;
          dispatch_async(v18, block);

          objc_destroyWeak(&v29);
          objc_destroyWeak((id *)buf);
        }
        else if (v15)
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v4;
          _os_log_impl(&dword_236FC5000, v14, OS_LOG_TYPE_DEFAULT, "Key request was successful, but not processing because no content key recipient exists.  %@", buf, 0xCu);
        }
      }
      else
      {
        int v19 = [v4 error];
        if (!v19) {
          int v19 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.ATV.secureKeyDelivery" code:-345007 userInfo:0];
        }
        id v20 = [(TVPContentKeySession *)self contentKeySession];
        v21 = [v20 contentKeyRecipients];
        uint64_t v22 = [v21 count];

        long long v23 = (void *)sLogObject_7;
        BOOL v24 = os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_ERROR);
        if (v22)
        {
          if (v24) {
            -[TVPContentKeySession finishKeyRequest:](v23, v4);
          }
          id v25 = [v4 avContentKeyRequest];
          [v25 processContentKeyResponseError:v19];
        }
        else if (v24)
        {
          -[TVPContentKeySession finishKeyRequest:](v23, v4);
        }
      }
    }
  }
  else
  {
    id v7 = [v4 avContentKeyRequest];
    int v8 = [v7 respondByRequestingPersistableContentKeyRequestAndReturnError:0];

    id v5 = sLogObject_7;
    BOOL v9 = os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (!v9) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      id v6 = "Request can use offline keys.  Waiting for new offline key request.";
      goto LABEL_4;
    }
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Request cannot use offline keys.  Re-sending request with type set to streaming.", buf, 2u);
    }
    [v4 setType:1];
    objc_initWeak((id *)buf, self);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __41__TVPContentKeySession_finishKeyRequest___block_invoke;
    v30[3] = &unk_264CC5100;
    objc_copyWeak(&v32, (id *)buf);
    id v31 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v30);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
LABEL_31:
}

void __41__TVPContentKeySession_finishKeyRequest___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained contentKeyLoader];
  v5[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [v3 loadFairPlayStreamingKeyRequests:v4];
}

void __41__TVPContentKeySession_finishKeyRequest___block_invoke_11(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x237E14270]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = sLogObject_7;
  BOOL v5 = os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v6;
      _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Calling processContentKeyResponse for %@", (uint8_t *)&v15, 0xCu);
    }
    id v7 = [*(id *)(a1 + 32) avContentKeyRequest];
    int v8 = (void *)MEMORY[0x263EFA6D8];
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [*(id *)(a1 + 32) renewalDate];
    uint64_t v11 = [v8 contentKeyResponseWithFairPlayStreamingKeyResponseData:v9 renewalDate:v10];
    [v7 processContentKeyResponse:v11];

    id v4 = sLogObject_7;
    if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v12;
      uint64_t v13 = "processContentKeyResponse complete for %@";
LABEL_8:
      _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v5)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = 138412290;
    uint64_t v16 = v14;
    uint64_t v13 = "Not calling processContentKeyResponse since content key session no longer exists for %@";
    goto LABEL_8;
  }
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(TVPContentKeySession *)self offlineKeyIdentifiersInProgress];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = sLogObject_7;
      if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v10, OS_LOG_TYPE_DEFAULT, "Offline key generation: received initial key request, now waiting for new offline key request.", buf, 2u);
      }
      id v14 = 0;
      char v11 = [v7 respondByRequestingPersistableContentKeyRequestAndReturnError:&v14];
      id v12 = v14;
      if ((v11 & 1) == 0)
      {
        uint64_t v13 = sLogObject_7;
        if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_ERROR)) {
          -[TVPContentKeySession contentKeySession:didProvideContentKeyRequest:]((uint64_t)v12, v13);
        }
      }
    }
    else
    {
      v16[0] = v7;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
      [(TVPContentKeySession *)self _loadAVContentKeyRequests:v12 type:0 isRenewal:0];
    }
  }
}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v8 = a4;
    BOOL v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = a4;
    id v7 = [v5 arrayWithObjects:&v8 count:1];

    -[TVPContentKeySession _loadAVContentKeyRequests:type:isRenewal:](self, "_loadAVContentKeyRequests:type:isRenewal:", v7, 0, 1, v8, v9);
  }
}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(TVPContentKeySession *)self offlineKeyIdentifiersInProgress];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = [[TVPContentKeyRequest alloc] initWithAVContentKeyRequest:v7];
      [(TVPContentKeyRequest *)v10 setContentKeySession:self];
      [(TVPContentKeyRequest *)v10 setIsRenewal:[(TVPContentKeySession *)self offlineKeyGenerationIsForRenewal]];
      [(TVPContentKeyRequest *)v10 setType:2];
      char v11 = sLogObject_7;
      if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v26 = v10;
        _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Offline key generation: received offline content key request: %@", buf, 0xCu);
      }
      id v12 = [(TVPContentKeySession *)self keyRequestsInProgress];
      [v12 addObject:v10];

      uint64_t v13 = [(TVPContentKeySession *)self keyRequestsInProgress];
      uint64_t v14 = [v13 count];
      int v15 = [(TVPContentKeySession *)self offlineKeyIdentifiersInProgress];
      uint64_t v16 = [v15 count];

      uint64_t v17 = sLogObject_7;
      BOOL v18 = os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT);
      if (v14 == v16)
      {
        if (v18)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "Offline key generation: all offline content key requests received", buf, 2u);
        }
        [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__timeoutOfflineKeyRequestGeneration object:0];
        [(TVPContentKeySession *)self _finishOfflineKeyGeneration];
      }
      else if (v18)
      {
        int v19 = v17;
        id v20 = [(TVPContentKeySession *)self offlineKeyIdentifiersInProgress];
        uint64_t v21 = [v20 count];
        uint64_t v22 = [(TVPContentKeySession *)self keyRequestsInProgress];
        uint64_t v23 = [v22 count];
        *(_DWORD *)buf = 134217984;
        long long v26 = (TVPContentKeyRequest *)(v21 - v23);
        _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Offline key generation: still waiting for %lu offline content key requests", buf, 0xCu);
      }
    }
    else
    {
      id v24 = v7;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      [(TVPContentKeySession *)self _loadAVContentKeyRequests:v10 type:2 isRenewal:0];
    }
  }
}

- (void)contentKeySession:(id)a3 didUpdatePersistableContentKey:(id)a4 forContentKeyIdentifier:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = sLogObject_7;
  if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v10;
    _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Received updated persistable content key for identifier %@", (uint8_t *)&v16, 0xCu);
  }
  if (!v10) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v10;
      if (![v15 length])
      {
        id v12 = 0;
        goto LABEL_14;
      }
      id v12 = [NSURL URLWithString:v15];

      if (!v12) {
        goto LABEL_15;
      }
      goto LABEL_6;
    }
LABEL_12:
    id v12 = 0;
    goto LABEL_15;
  }
  id v12 = v10;
LABEL_6:
  uint64_t v13 = [(TVPContentKeySession *)self contentKeyLoader];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = [(TVPContentKeySession *)self contentKeyLoader];
    [v15 updateOfflineKeyWithIdentifier:v12 updatedOfflineKeyData:v9];
LABEL_14:
  }
LABEL_15:
}

- (void)_timeoutOfflineKeyRequestGeneration
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Offline key generation: key request generation timed out before all key requests were generated", v2, v3, v4, v5, v6);
}

- (void)_finishOfflineKeyGeneration
{
  uint64_t v3 = [(TVPContentKeySession *)self keyRequestsInProgress];
  id v6 = (id)[v3 copy];

  uint64_t v4 = [(TVPContentKeySession *)self offlineKeyGenerationCompletionHandler];
  [(TVPContentKeySession *)self setOfflineKeyGenerationCompletionHandler:0];
  [(TVPContentKeySession *)self setOfflineKeyIdentifiersInProgress:0];
  [(TVPContentKeySession *)self setOfflineKeyGenerationIsForRenewal:0];
  uint64_t v5 = [(TVPContentKeySession *)self keyRequestsInProgress];
  [v5 removeAllObjects];

  if (v4) {
    ((void (**)(void, id))v4)[2](v4, v6);
  }
}

- (void)_generateOfflineKeyRequestsForIdentifiers:(id)a3 isRenewal:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  id v10 = [(TVPContentKeySession *)self offlineKeyGenerationCompletionHandler];

  if (v10)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_ERROR)) {
      -[TVPContentKeySession _generateOfflineKeyRequestsForIdentifiers:isRenewal:completion:]();
    }
    goto LABEL_4;
  }
  if (![v8 count])
  {
LABEL_4:
    if (v9) {
      v9[2](v9, 0);
    }
    goto LABEL_17;
  }
  [(TVPContentKeySession *)self setOfflineKeyGenerationCompletionHandler:v9];
  [(TVPContentKeySession *)self setOfflineKeyIdentifiersInProgress:v8];
  [(TVPContentKeySession *)self setOfflineKeyGenerationIsForRenewal:v6];
  [(TVPContentKeySession *)self performSelector:sel__timeoutOfflineKeyRequestGeneration withObject:0 afterDelay:10.0];
  char v11 = (void *)sLogObject_7;
  if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = [v8 count];
    _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Offline key generation: manually generating %lu key request(s)", buf, 0xCu);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * v17);
        int v19 = [(TVPContentKeySession *)self contentKeySession];
        [v19 processContentKeyRequestWithIdentifier:v18 initializationData:0 options:0];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

LABEL_17:
}

- (void)_loadAVContentKeyRequests:(id)a3 type:(int64_t)a4 isRenewal:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = [[TVPContentKeyRequest alloc] initWithAVContentKeyRequest:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        [(TVPContentKeyRequest *)v14 setContentKeySession:self];
        [(TVPContentKeyRequest *)v14 setIsRenewal:v5];
        [(TVPContentKeyRequest *)v14 setType:a4];
        [v9 addObject:v14];
        uint64_t v15 = sLogObject_7;
        if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v23 = v14;
          _os_log_impl(&dword_236FC5000, v15, OS_LOG_TYPE_DEFAULT, "Loading key request %@", buf, 0xCu);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v11);
  }

  uint64_t v16 = [(TVPContentKeySession *)self contentKeyLoader];
  [v16 loadFairPlayStreamingKeyRequests:v9];
}

- (AVContentKeySession)contentKeySession
{
  return self->_contentKeySession;
}

- (void)setContentKeySession:(id)a3
{
}

- (TVPContentKeyLoading)contentKeyLoader
{
  return self->_contentKeyLoader;
}

- (void)setContentKeyLoader:(id)a3
{
}

- (id)offlineKeyGenerationCompletionHandler
{
  return self->_offlineKeyGenerationCompletionHandler;
}

- (void)setOfflineKeyGenerationCompletionHandler:(id)a3
{
}

- (NSArray)offlineKeyIdentifiersInProgress
{
  return self->_offlineKeyIdentifiersInProgress;
}

- (void)setOfflineKeyIdentifiersInProgress:(id)a3
{
}

- (NSMutableArray)keyRequestsInProgress
{
  return self->_keyRequestsInProgress;
}

- (void)setKeyRequestsInProgress:(id)a3
{
}

- (BOOL)offlineKeyGenerationIsForRenewal
{
  return self->_offlineKeyGenerationIsForRenewal;
}

- (void)setOfflineKeyGenerationIsForRenewal:(BOOL)a3
{
  self->_offlineKeyGenerationIsForRenewal = a3;
}

- (OS_dispatch_queue)contentKeyProcessingQueue
{
  return self->_contentKeyProcessingQueue;
}

- (void)setContentKeyProcessingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentKeyProcessingQueue, 0);
  objc_storeStrong((id *)&self->_keyRequestsInProgress, 0);
  objc_storeStrong((id *)&self->_offlineKeyIdentifiersInProgress, 0);
  objc_storeStrong(&self->_offlineKeyGenerationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_contentKeyLoader, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
}

void __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Unable to fetch keys because no key requests could be generated", v2, v3, v4, v5, v6);
}

void __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Unable to fetch keys because object does not respond to loadFairPlayStreamingKeyRequests:completion:", v2, v3, v4, v5, v6);
}

- (void)finishKeyRequest:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 requestID];
  uint64_t v4 = [a2 keyIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_236FC5000, v5, v6, "Received error for key request, but not processing because no content key recipient exists.  [%lu: %{public}@] : %{public}@", v7, v8, v9, v10, v11);
}

- (void)finishKeyRequest:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  [a2 requestID];
  uint64_t v4 = [a2 keyIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_236FC5000, v5, v6, "Processing error for key request [%lu: %{public}@] : %{public}@", v7, v8, v9, v10, v11);
}

- (void)contentKeySession:(uint64_t)a1 didProvideContentKeyRequest:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236FC5000, a2, OS_LOG_TYPE_ERROR, "Offline key generation: Request for persistable key request failed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_generateOfflineKeyRequestsForIdentifiers:isRenewal:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Offline key generation: got offline key request generation while one is already in progress.  Ignoring new request.", v2, v3, v4, v5, v6);
}

@end