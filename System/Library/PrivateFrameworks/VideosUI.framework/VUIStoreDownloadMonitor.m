@interface VUIStoreDownloadMonitor
+ (void)initialize;
- (NSMutableArray)completionHandlers;
- (SSDownload)download;
- (SSDownloadManager)downloadManager;
- (TVPStateMachine)stateMachine;
- (VUIStoreDownloadMonitor)initWithDownload:(id)a3 downloadManager:(id)a4;
- (void)_registerStateMachineHandlers;
- (void)dealloc;
- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4;
- (void)downloadManagerDownloadsDidChange:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setDownload:(id)a3;
- (void)setDownloadManager:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)waitForDownloadToBecomePlayableWithCompletion:(id)a3;
@end

@implementation VUIStoreDownloadMonitor

+ (void)initialize
{
  if (initialize_onceToken_2 != -1) {
    dispatch_once(&initialize_onceToken_2, &__block_literal_global_32);
  }
}

void __37__VUIStoreDownloadMonitor_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIStoreDownloadMonitor");
  v1 = (void *)sLogObject_4;
  sLogObject_4 = (uint64_t)v0;
}

- (VUIStoreDownloadMonitor)initWithDownload:(id)a3 downloadManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VUIStoreDownloadMonitor;
  v9 = [(VUIStoreDownloadMonitor *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_download, a3);
    objc_storeStrong((id *)&v10->_downloadManager, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v10->_completionHandlers;
    v10->_completionHandlers = v11;

    id v13 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = initWithDownload_downloadManager__instanceNumber++;
    v16 = (void *)[v13 initWithFormat:@"%@ %ld", v14, v15];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FA9DA8]) initWithName:v16 initialState:@"Idle" mode:0];
    stateMachine = v10->_stateMachine;
    v10->_stateMachine = (TVPStateMachine *)v17;

    [(TVPStateMachine *)v10->_stateMachine setLogObject:sLogObject_4];
    [(VUIStoreDownloadMonitor *)v10 _registerStateMachineHandlers];
    [(TVPStateMachine *)v10->_stateMachine setShouldAcceptEvents:1];
  }
  return v10;
}

- (void)dealloc
{
  [(SSDownloadManager *)self->_downloadManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)VUIStoreDownloadMonitor;
  [(VUIStoreDownloadMonitor *)&v3 dealloc];
}

- (void)waitForDownloadToBecomePlayableWithCompletion:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = @"CompletionHandlerKey";
    v4 = (void *)[a3 copy];
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }
  v6 = [(VUIStoreDownloadMonitor *)self stateMachine];
  [v6 postEvent:@"Wait for download to become playable" withContext:0 userInfo:v5];
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  TVPPerformBlockOnMainThreadIfNeeded();
}

void __67__VUIStoreDownloadMonitor_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v16 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
      id v8 = objc_msgSend(*(id *)(a1 + 40), "download", (void)v15);
      char v9 = objc_msgSend(v7, "vui_isEqualToDownload:", v8);

      if (v9) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v7;

    if (!v10) {
      return;
    }
    uint64_t v11 = [v10 downloadPhaseIdentifier];
    v12 = (void *)v11;
    if (v11)
    {
      v19 = @"DownloadPhaseKey";
      uint64_t v20 = v11;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v14 = [*(id *)(a1 + 40) stateMachine];
    [v14 postEvent:@"Download phase did change" withContext:0 userInfo:v13];
  }
  else
  {
LABEL_9:
    id v10 = v2;
  }
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
}

void __61__VUIStoreDownloadMonitor_downloadManagerDownloadsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "downloadManager", 0);
  uint64_t v3 = [v2 downloads];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v21 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v20 + 1) + 8 * v7);
      char v9 = [*(id *)(a1 + 32) download];
      char v10 = objc_msgSend(v8, "vui_isEqualToDownload:", v9);

      if (v10) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v8;

    if (v11) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_9:
  }
  v12 = [*(id *)(a1 + 32) download];
  id v13 = [v12 downloadPhaseIdentifier];

  uint64_t v14 = sLogObject_4;
  if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v13;
    _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Download has been removed.  Download's terminal phase is %@.", buf, 0xCu);
  }
  long long v15 = (void *)*MEMORY[0x1E4FA8510];
  if (([v13 isEqualToString:*MEMORY[0x1E4FA8510]] & 1) == 0
    && ([v13 isEqualToString:*MEMORY[0x1E4FA84F8]] & 1) == 0
    && ([v13 isEqualToString:*MEMORY[0x1E4FA84E8]] & 1) == 0)
  {
    long long v16 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Since terminal state isn't failed or cancelled, swizzling terminal state to SSDownloadPhaseFinished", buf, 2u);
    }
    id v17 = v15;

    id v13 = v17;
  }
  long long v18 = [*(id *)(a1 + 32) stateMachine];
  v24 = @"DownloadPhaseKey";
  v25 = v13;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [v18 postEvent:@"Download phase did change" withContext:0 userInfo:v19];

  id v11 = 0;
LABEL_20:
}

- (void)_registerStateMachineHandlers
{
  v29[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke;
  aBlock[3] = &unk_1E6DF5E00;
  objc_copyWeak(&v27, &location);
  id v2 = _Block_copy(aBlock);
  id v3 = objc_loadWeakRetained(&location);
  uint64_t v4 = [v3 stateMachine];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_3;
  v23[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v25, &location);
  id v5 = v2;
  id v24 = v5;
  [v4 registerHandlerForEvent:@"Wait for download to become playable" onState:@"Idle" withBlock:v23];

  id v6 = objc_loadWeakRetained(&location);
  uint64_t v7 = [v6 stateMachine];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_38;
  v21[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v22, &location);
  [v7 registerHandlerForEvent:@"Wait for download to become playable" onState:@"Waiting for download to become playable" withBlock:v21];

  id v8 = objc_loadWeakRetained(&location);
  char v9 = [v8 stateMachine];
  v29[0] = @"Waiting for download to become playable";
  v29[1] = @"Waiting for download token";
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_2_39;
  v18[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v20, &location);
  id v11 = v5;
  id v19 = v11;
  [v9 registerHandlerForEvent:@"Download phase did change" onStates:v10 withBlock:v18];

  id v12 = objc_loadWeakRetained(&location);
  id v13 = [v12 stateMachine];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_42;
  v15[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v17, &location);
  id v14 = v11;
  id v16 = v14;
  [v13 registerHandlerForEvent:@"Asset download token timer did fire" onState:@"Waiting for download token" withBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained stateMachine];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_2;
  v10[3] = &unk_1E6DF5DD8;
  objc_copyWeak(v12, v6);
  v12[1] = a2;
  id v9 = v5;
  id v11 = v9;
  [v8 executeBlockAfterCurrentStateTransition:v10];

  objc_destroyWeak(v12);
}

void __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained downloadManager];
  id v4 = objc_loadWeakRetained(v1);
  [v3 removeObserver:v4];

  id v5 = objc_loadWeakRetained(v1);
  id v6 = [v5 completionHandlers];
  uint64_t v7 = (void *)[v6 copy];

  id v8 = objc_loadWeakRetained(v1);
  id v9 = [v8 completionHandlers];
  [v9 removeAllObjects];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

__CFString *__56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 objectForKey:@"CompletionHandlerKey"];
  if (v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    long long v15 = [WeakRetained completionHandlers];
    long long v16 = _Block_copy(v13);
    [v15 addObject:v16];
  }
  long long v17 = (id *)(a1 + 40);
  id v18 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v19 = [v18 download];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    id v21 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v39 = a1;
    id v22 = v13;
    id v23 = v12;
    id v24 = v11;
    id v25 = v10;
    id v26 = v9;
    id v27 = v21;
    v28 = [v21 downloadManager];

    id v9 = v26;
    id v10 = v25;
    id v11 = v24;
    id v12 = v23;
    uint64_t v13 = v22;
    a1 = v39;

    if (v28)
    {
      id v29 = objc_loadWeakRetained(v17);
      v30 = [v29 downloadManager];
      id v31 = objc_loadWeakRetained(v17);
      [v30 addObserver:v31];

      id v32 = objc_loadWeakRetained(v17);
      v33 = [v32 stateMachine];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_35;
      v40[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v41, v17);
      [v33 executeBlockAfterCurrentStateTransition:v40];

      objc_destroyWeak(&v41);
      v34 = @"Waiting for download to become playable";
      goto LABEL_10;
    }
  }
  else
  {
  }
  v35 = sLogObject_4;
  if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_ERROR)) {
    __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_3_cold_1(v35);
  }
  id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
  v37 = (void *)[v36 initWithDomain:VUIStoreMediaItemErrorDomain code:-123003 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  v34 = @"Idle";
LABEL_10:

  return v34;
}

void __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_35(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained download];
  id v4 = [v3 downloadPhaseIdentifier];

  if (v4)
  {
    uint64_t v20 = @"DownloadPhaseKey";
    v21[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_loadWeakRetained(v1);
  uint64_t v7 = [v6 stateMachine];
  [v7 postEvent:@"Download phase did change" withContext:0 userInfo:v5];

  if ([v4 isEqualToString:*MEMORY[0x1E4FA8520]])
  {
    id v8 = (void *)sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      id v10 = objc_loadWeakRetained(v1);
      id v11 = [v10 download];
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v11;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Resuming download %@", buf, 0xCu);
    }
    id v12 = objc_loadWeakRetained(v1);
    uint64_t v13 = [v12 downloadManager];
    id v14 = objc_loadWeakRetained(v1);
    long long v15 = [v14 download];
    long long v17 = v15;
    long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v13 resumeDownloads:v16 completionBlock:0];
  }
}

id __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_38(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"CompletionHandlerKey"];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v10 = [WeakRetained completionHandlers];
    id v11 = _Block_copy(v8);
    [v10 addObject:v11];
  }
  id v12 = [v7 currentState];

  return v12;
}

__CFString *__56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_2_39(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [a5 objectForKey:@"DownloadPhaseKey"];
  id v9 = sLogObject_4;
  if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v8;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Download phase did change to %@", buf, 0xCu);
  }
  if (([v8 isEqualToString:*MEMORY[0x1E4FA84E8]] & 1) != 0
    || [v8 isEqualToString:*MEMORY[0x1E4FA84F8]])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v11 = [WeakRetained download];
    id v12 = [v11 failureError];

    if (v12)
    {
      uint64_t v35 = *MEMORY[0x1E4F28A50];
      id v36 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    long long v15 = (void *)[v14 initWithDomain:VUIStoreMediaItemErrorDomain code:-123002 userInfo:v13];
    long long v16 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v15;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Download failed or cancelled: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_11:
    long long v17 = @"Idle";
    goto LABEL_12;
  }
  if ([v8 isEqualToString:*MEMORY[0x1E4FA8510]])
  {
    uint64_t v19 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Download is finished and ready to play from local URL", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_11;
  }
  if ([v8 isEqualToString:*MEMORY[0x1E4FA84F0]])
  {
    uint64_t v20 = (id *)(a1 + 40);
    id v21 = objc_loadWeakRetained((id *)(a1 + 40));
    id v22 = [v21 download];
    id v23 = [v22 assetsForType:*MEMORY[0x1E4FA8438]];
    id v24 = [v23 firstObject];

    id v25 = [v24 valueForProperty:*MEMORY[0x1E4FA8410]];
    id v26 = v25;
    if (v25 && ![v25 isEqual:&unk_1F3F3C800])
    {
      id v32 = sLogObject_4;
      if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v32, OS_LOG_TYPE_DEFAULT, "Download token exists - download is ready to play", buf, 2u);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      long long v17 = @"Idle";
    }
    else
    {
      id v27 = sLogObject_4;
      if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v27, OS_LOG_TYPE_DEFAULT, "Download token does not yet exist even though phase is SSDownloadPhaseDownloading", buf, 2u);
      }
      v28 = [v7 currentState];
      long long v17 = @"Waiting for download token";
      char v29 = [v28 isEqualToString:@"Waiting for download token"];

      if ((v29 & 1) == 0)
      {
        v30 = sLogObject_4;
        if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "Waiting for download token", buf, 2u);
        }
        dispatch_time_t v31 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_41;
        block[3] = &unk_1E6DF4A30;
        objc_copyWeak(&v34, v20);
        dispatch_after(v31, MEMORY[0x1E4F14428], block);
        objc_destroyWeak(&v34);
        long long v17 = @"Waiting for download token";
      }
    }
  }
  else
  {
    long long v17 = @"Waiting for download to become playable";
  }
LABEL_12:

  return v17;
}

void __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_41(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained stateMachine];
    [v2 postEvent:@"Asset download token timer did fire"];

    id WeakRetained = v3;
  }
}

__CFString *__56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_42(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained download];
  id v4 = [v3 assetsForType:*MEMORY[0x1E4FA8438]];
  id v5 = [v4 firstObject];

  id v6 = [v5 valueForProperty:*MEMORY[0x1E4FA8410]];
  id v7 = v6;
  if (v6 && ![v6 isEqual:&unk_1F3F3C800])
  {
    id v11 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Download token exists after recheck - download is ready to play", (uint8_t *)&v13, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v9 = (void *)[v8 initWithDomain:VUIStoreMediaItemErrorDomain code:-123002 userInfo:0];
    id v10 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Download token is still missing after recheck - failing with error %@", (uint8_t *)&v13, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return @"Idle";
}

- (SSDownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
}

- (SSDownload)download
{
  return self->_download;
}

- (void)setDownload:(id)a3
{
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
}

void __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Missing download or download manager", v1, 2u);
}

@end