@interface VUIRedownloadEndpointManager
+ (id)sharedInstance;
- (BOOL)initialRedownloadInProgress;
- (NSMutableArray)pendingRedownloadInfos;
- (VUIRedownloadEndpointManager)init;
- (void)_performRedownloadWithType:(int64_t)a3 buyParams:(id)a4 completion:(id)a5;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)performRedownloadWithType:(int64_t)a3 buyParams:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)setInitialRedownloadInProgress:(BOOL)a3;
- (void)setPendingRedownloadInfos:(id)a3;
@end

@implementation VUIRedownloadEndpointManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_17 != -1) {
    dispatch_once(&sharedInstance_onceToken_17, &__block_literal_global_75);
  }
  v2 = (void *)sharedInstance_instance_2;
  return v2;
}

void __46__VUIRedownloadEndpointManager_sharedInstance__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIRedownloadEndpointManager");
  v1 = (void *)sLogObject_9;
  sLogObject_9 = (uint64_t)v0;

  v2 = objc_alloc_init(VUIRedownloadEndpointManager);
  v3 = (void *)sharedInstance_instance_2;
  sharedInstance_instance_2 = (uint64_t)v2;
}

- (VUIRedownloadEndpointManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIRedownloadEndpointManager;
  v2 = [(VUIRedownloadEndpointManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingRedownloadInfos = v2->_pendingRedownloadInfos;
    v2->_pendingRedownloadInfos = v3;
  }
  return v2;
}

- (void)performRedownloadWithType:(int64_t)a3 buyParams:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    BOOL v10 = [(VUIRedownloadEndpointManager *)self initialRedownloadInProgress];
    v11 = sLogObject_9;
    BOOL v12 = os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Not starting redownload for download yet since initial one is already in progress.  Will start when initial one is done", (uint8_t *)buf, 2u);
      }
      v13 = objc_alloc_init(VUIRedownloadInfo);
      [(VUIRedownloadInfo *)v13 setBuyParams:v8];
      [(VUIRedownloadInfo *)v13 setRedownloadType:a3];
      [(VUIRedownloadInfo *)v13 setCompletion:v9];
      v14 = [(VUIRedownloadEndpointManager *)self pendingRedownloadInfos];
      [v14 addObject:v13];
    }
    else
    {
      if (v12)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Starting initial redownload for download", (uint8_t *)buf, 2u);
      }
      [(VUIRedownloadEndpointManager *)self setInitialRedownloadInProgress:1];
      objc_initWeak(buf, self);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __79__VUIRedownloadEndpointManager_performRedownloadWithType_buyParams_completion___block_invoke;
      v15[3] = &unk_1E6DF83F0;
      objc_copyWeak(&v17, buf);
      id v16 = v9;
      [(VUIRedownloadEndpointManager *)self _performRedownloadWithType:a3 buyParams:v8 completion:v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    [(VUIRedownloadEndpointManager *)self _performRedownloadWithType:0 buyParams:v8 completion:v9];
  }
}

void __79__VUIRedownloadEndpointManager_performRedownloadWithType_buyParams_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setInitialRedownloadInProgress:0];
  if (v6
    && +[VUIPlaybackUtilities isMPMediaLibraryAssociationError:v6])
  {
    v7 = (void *)sLogObject_9;
    if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      id v9 = [WeakRetained pendingRedownloadInfos];
      uint64_t v10 = [v9 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v56 = v10;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Initial redownload failed because device is not authorized.  Failing %lu pending redownloads", buf, 0xCu);
    }
    v11 = [WeakRetained pendingRedownloadInfos];
    BOOL v12 = (void *)[v11 copy];

    v13 = [WeakRetained pendingRedownloadInfos];
    [v13 removeAllObjects];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v20 = [v19 completion];

          if (v20)
          {
            v21 = [v19 completion];
            ((void (**)(void, void, id))v21)[2](v21, 0, v6);
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v16);
    }
  }
  v22 = [WeakRetained pendingRedownloadInfos];
  uint64_t v23 = [v22 count];

  v24 = sLogObject_9;
  BOOL v25 = os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    uint64_t v41 = a1;
    id v42 = v6;
    if (v25)
    {
      v26 = v24;
      v27 = [WeakRetained pendingRedownloadInfos];
      uint64_t v28 = [v27 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v56 = v28;
      _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Performing %lu pending redownloads now that initial one is done", buf, 0xCu);
    }
    v29 = [WeakRetained pendingRedownloadInfos];
    v30 = (void *)[v29 copy];

    v31 = [WeakRetained pendingRedownloadInfos];
    [v31 removeAllObjects];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v32 = v30;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          uint64_t v38 = [v37 redownloadType];
          v39 = [v37 buyParams];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __79__VUIRedownloadEndpointManager_performRedownloadWithType_buyParams_completion___block_invoke_32;
          v44[3] = &unk_1E6DF83C8;
          v44[4] = v37;
          [WeakRetained _performRedownloadWithType:v38 buyParams:v39 completion:v44];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v34);
    }

    id v6 = v42;
    a1 = v41;
  }
  else if (v25)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "After initial redownload, no further pending redownloads exist", buf, 2u);
  }
  uint64_t v40 = *(void *)(a1 + 32);
  if (v40) {
    (*(void (**)(uint64_t, id, id))(v40 + 16))(v40, v5, v6);
  }
}

void __79__VUIRedownloadEndpointManager_performRedownloadWithType_buyParams_completion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) completion];

  if (v6)
  {
    v7 = [*(id *)(a1 + 32) completion];
    ((void (**)(void, id, id))v7)[2](v7, v8, v5);
  }
}

- (void)_performRedownloadWithType:(int64_t)a3 buyParams:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = sLogObject_9;
  if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = @"Download";
    if (!a3) {
      v11 = @"Streaming";
    }
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Starting redownload of type %@", buf, 0xCu);
  }
  BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F4DDD8]) initWithPurchaseType:0 buyParams:v8];
  if (!a3 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v12 setURLBagKey:@"redownloadProduct"];
  }
  [v12 setIgnoreRequirePasswordRestriction:1];
  v13 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v14 = objc_msgSend(v13, "ams_activeiTunesAccountForMediaType:", *MEMORY[0x1E4F4D9F8]);

  objc_initWeak((id *)buf, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke;
  v20[3] = &unk_1E6DF8418;
  objc_copyWeak(&v22, (id *)buf);
  id v15 = v12;
  id v21 = v15;
  uint64_t v16 = [v14 continueWithBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_47;
  v18[3] = &unk_1E6DF8440;
  id v17 = v9;
  id v19 = v17;
  [v16 resultWithCompletion:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

id __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    id v8 = sLogObject_9;
    if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_ERROR)) {
      __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setAccount:v5];
  }
  id v9 = objc_alloc(MEMORY[0x1E4F4DDF0]);
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = [MEMORY[0x1E4F4DDF0] createBagForSubProfile];
  BOOL v12 = (void *)[v9 initWithPurchase:v10 bag:v11];

  [v12 setDelegate:WeakRetained];
  v13 = [v12 performPurchase];

  return v13;
}

void __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = sLogObject_9;
  if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Redownload complete", buf, 2u);
  }
  id v8 = [v6 userInfo];
  id v9 = objc_msgSend(v8, "vui_dictionaryForKey:", *MEMORY[0x1E4F4DA50]);
  uint64_t v10 = objc_msgSend(v9, "vui_dictionaryForKey:", @"dialog");

  if (v6)
  {
LABEL_4:
    v11 = [v6 userInfo];
    BOOL v12 = objc_msgSend(v11, "vui_numberForKey:", *MEMORY[0x1E4F4DA48]);

    if (v12)
    {
      uint64_t v13 = [v6 domain];
      id v14 = (uint64_t *)MEMORY[0x1E4F28A50];
      if (v13)
      {
        id v15 = (void *)v13;
        uint64_t v16 = [v6 userInfo];
        uint64_t v17 = *v14;
        v18 = [v16 objectForKey:*v14];

        if (!v18)
        {
          id v19 = [v6 userInfo];
          v20 = (void *)[v19 mutableCopy];

          id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v22 = objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x1E4F4DB98], objc_msgSend(v12, "integerValue"), 0);
          [v20 setObject:v22 forKey:v17];

          id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
          v24 = [v6 domain];
          uint64_t v25 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, objc_msgSend(v6, "code"), v20);

          id v6 = (id)v25;
        }
      }
      if ([v12 integerValue] == 5102)
      {
        uint64_t v45 = *v14;
        v46[0] = v6;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
        uint64_t v27 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TVPlaybackErrorDomain" code:812 userInfo:v26];

        id v6 = (id)v27;
      }
    }
    if (v10)
    {
      uint64_t v28 = [v6 userInfo];
      v29 = (void *)[v28 mutableCopy];

      [v29 setObject:MEMORY[0x1E4F1CC38] forKey:@"VUIDownloadManagerSuppressErrorDialogKey"];
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      v31 = [v6 domain];
      uint64_t v32 = objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, objc_msgSend(v6, "code"), v29);

      id v6 = (id)v32;
    }
    uint64_t v33 = sLogObject_9;
    if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_ERROR)) {
      __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_47_cold_1((uint64_t)v6, v33);
    }
    uint64_t v34 = 0;
    goto LABEL_15;
  }
  v37 = [v5 responseDictionary];
  BOOL v12 = v37;
  if (!v37)
  {
    uint64_t v39 = -123007;
    uint64_t v40 = sLogObject_9;
    if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_ERROR)) {
      __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_47_cold_2(v40);
    }
LABEL_24:
    id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v6 = (id)[v42 initWithDomain:VUIStoreMediaItemErrorDomain code:v39 userInfo:0];

    if (!v6)
    {
      uint64_t v34 = 0;
      goto LABEL_16;
    }
    goto LABEL_4;
  }
  uint64_t v38 = [v37 objectForKey:@"songList"];
  uint64_t v34 = [v38 firstObject];

  if (!v34)
  {
    uint64_t v41 = sLogObject_9;
    uint64_t v39 = -123006;
    if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_ERROR)) {
      __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_47_cold_3(v41);
    }
    goto LABEL_24;
  }
  id v6 = 0;
LABEL_15:

LABEL_16:
  id v43 = *(id *)(a1 + 32);
  id v35 = v6;
  id v36 = v34;
  TVPPerformBlockOnMainThreadIfNeeded();
}

uint64_t __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_59(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F4DBC8];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 alloc];
  v11 = [MEMORY[0x1E4F4DBC8] createBagForSubProfile];
  id v13 = (id)[v10 initWithRequest:v9 bag:v11];

  [v13 setDelegate:self];
  BOOL v12 = [v13 performAuthentication];
  [v12 addFinishBlock:v8];
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x1E4F4DE30];
  id v7 = a5;
  id v8 = a4;
  id v10 = (id)[[v6 alloc] initWithRequest:v8];

  id v9 = [v10 present];
  [v9 addFinishBlock:v7];
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x1E4F4DE38];
  id v7 = a5;
  id v8 = a4;
  id v10 = (id)[[v6 alloc] initWithRequest:v8];

  id v9 = [v10 present];
  [v9 addFinishBlock:v7];
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x1E4F4DE30];
  id v7 = a5;
  id v8 = a4;
  id v10 = (id)[[v6 alloc] initWithRequest:v8];

  id v9 = [v10 present];
  [v9 addFinishBlock:v7];
}

- (NSMutableArray)pendingRedownloadInfos
{
  return self->_pendingRedownloadInfos;
}

- (void)setPendingRedownloadInfos:(id)a3
{
}

- (BOOL)initialRedownloadInProgress
{
  return self->_initialRedownloadInProgress;
}

- (void)setInitialRedownloadInProgress:(BOOL)a3
{
  self->_initialRedownloadInProgress = a3;
}

- (void).cxx_destruct
{
}

void __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Error fetching account for redownload: %@", (uint8_t *)&v2, 0xCu);
}

void __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_47_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Error performing redownload: %@", (uint8_t *)&v2, 0xCu);
}

void __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_47_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Empty purchase response", v1, 2u);
}

void __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_47_cold_3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "storeItemDict is nil", v1, 2u);
}

@end