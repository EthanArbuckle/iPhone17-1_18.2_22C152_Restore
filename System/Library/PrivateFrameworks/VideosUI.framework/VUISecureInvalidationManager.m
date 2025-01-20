@interface VUISecureInvalidationManager
+ (id)sharedInstance;
- (BOOL)_getParamsForDeletionInfo:(id)a3 keyServerURL:(id *)a4 nonceURL:(id *)a5 keyIdentifier:(id *)a6 offlineKeyData:(id *)a7 dsid:(id *)a8 additionalRequestParams:(id *)a9 contentID:(id *)a10;
- (BOOL)_validateParamsForDeletionInfo:(id)a3;
- (BOOL)networkErrorOccurredDuringInvalidation;
- (BOOL)storeFPSKeyLoader:(id)a3 shouldKeyRequestContinueInvalidationAfterLoadingNonce:(id)a4;
- (NSMutableArray)keyLoaders;
- (NSMutableSet)penaltyBox;
- (TVPStateMachine)stateMachine;
- (VUISecureInvalidationManager)init;
- (id)_invalidateKeysForDeletedVideos;
- (unint64_t)backgroundTaskIdentifier;
- (void)_invalidateKeysForDeletedVideos;
- (void)_networkReachbilityDidChange:(id)a3;
- (void)_registerStateMachineHandlers;
- (void)_sendInvalidationRequestsForDeletionInfoArrays:(id)a3 completion:(id)a4;
- (void)_sendInvalidationRequestsForFirstArray:(id)a3 completion:(id)a4;
- (void)addDeletionInfoToPenaltyBox:(id)a3;
- (void)dealloc;
- (void)invalidateKeysForDeletedVideos;
- (void)removeDeletionInfoFromPenaltyBox:(id)a3;
- (void)setBackgroundTaskIdentifier:(unint64_t)a3;
- (void)setKeyLoaders:(id)a3;
- (void)setNetworkErrorOccurredDuringInvalidation:(BOOL)a3;
- (void)setPenaltyBox:(id)a3;
- (void)setStateMachine:(id)a3;
@end

@implementation VUISecureInvalidationManager

- (void)invalidateKeysForDeletedVideos
{
  id v2 = [(VUISecureInvalidationManager *)self stateMachine];
  [v2 postEvent:@"Invalidation requested"];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1) {
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_61);
  }
  id v2 = (void *)sharedInstance_instance_0;
  return v2;
}

void __46__VUISecureInvalidationManager_sharedInstance__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUISecureInvalidationManager");
  v1 = (void *)sLogObject_6;
  sLogObject_6 = (uint64_t)v0;

  id v2 = objc_alloc_init(VUISecureInvalidationManager);
  v3 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v2;
}

- (VUISecureInvalidationManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)VUISecureInvalidationManager;
  id v2 = [(VUISecureInvalidationManager *)&v14 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@", objc_opt_class()];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FA9DA8]) initWithName:v3 initialState:@"Idle" mode:0];
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = (TVPStateMachine *)v4;

    [(TVPStateMachine *)v2->_stateMachine setLogObject:sLogObject_6];
    [(VUISecureInvalidationManager *)v2 _registerStateMachineHandlers];
    [(TVPStateMachine *)v2->_stateMachine setShouldAcceptEvents:1];
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    keyLoaders = v2->_keyLoaders;
    v2->_keyLoaders = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    penaltyBox = v2->_penaltyBox;
    v2->_penaltyBox = v8;

    v2->_backgroundTaskIdentifier = *MEMORY[0x1E4FB2748];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = *MEMORY[0x1E4FB3E08];
    v12 = [MEMORY[0x1E4FB3CF8] sharedInstance];
    [v10 addObserver:v2 selector:sel__networkReachbilityDidChange_ name:v11 object:v12];
  }
  return v2;
}

- (void)_registerStateMachineHandlers
{
  v20[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v3 = [(VUISecureInvalidationManager *)self stateMachine];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke;
  v16[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v17, &location);
  [v3 registerHandlerForEvent:@"Invalidation requested" onState:@"Idle" withBlock:v16];
  [v3 registerHandlerForEvent:@"Invalidation requested" onState:@"Invalidation in progress" withBlock:&__block_literal_global_63];
  [v3 registerHandlerForEvent:@"Invalidation requested" onState:@"Invalidation in progress refresh when done" withBlock:&__block_literal_global_65];
  [v3 registerHandlerForEvent:@"Invalidation requested" onState:@"Waiting for network reachability to invalidate keys" withBlock:&__block_literal_global_67];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_4;
  v14[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v15, &location);
  [v3 registerHandlerForEvent:@"Network reachability did change" onState:@"Waiting for network reachability to invalidate keys" withBlock:v14];
  v20[0] = @"Invalidation in progress";
  v20[1] = @"Invalidation in progress refresh when done";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_5;
  v12[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v13, &location);
  [v3 registerHandlerForEvent:@"Network reachability did change" onStates:v4 withBlock:v12];

  v19[0] = @"Invalidation in progress";
  v19[1] = @"Invalidation in progress refresh when done";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_6;
  v10[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v11, &location);
  [v3 registerHandlerForEvent:@"Network error did occur" onStates:v5 withBlock:v10];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_7;
  v8[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v9, &location);
  [v3 registerHandlerForEvent:@"Invalidation did finish" onState:@"Invalidation in progress" withBlock:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_69;
  v6[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v7, &location);
  [v3 registerHandlerForEvent:@"Invalidation did finish" onState:@"Invalidation in progress refresh when done" withBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

__CFString *__61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v3 = [v2 isNetworkReachable];

  if (v3)
  {
    uint64_t v4 = [WeakRetained _invalidateKeysForDeletedVideos];
  }
  else
  {
    v5 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because network is not reachable", v8, 2u);
    }
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification" object:0];

    uint64_t v4 = @"Waiting for network reachability to invalidate keys";
  }

  return v4;
}

- (id)_invalidateKeysForDeletedVideos
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v2 = +[VUIMediaLibraryManager defaultManager];
  int v3 = [v2 sidebandMediaLibrary];
  uint64_t v4 = [v3 allFpsKeyDeletionInfos];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    *(_DWORD *)buf = 134217984;
    uint64_t v82 = [v4 count];
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Found %lu key(s) to consider for invalidation", buf, 0xCu);
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v76;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v76 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v75 + 1) + 8 * v10);
        v12 = [v11 expirationDate];
        id v13 = v12;
        if (v12
          && (objc_msgSend(v12, "vui_isInTheFuture") & 1) == 0
          && ([v11 playbackExpirationStartDate],
              objc_super v14 = objc_claimAutoreleasedReturnValue(),
              BOOL v15 = v14 == 0,
              v14,
              v15))
        {
          v22 = sLogObject_6;
          if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v82 = (uint64_t)v11;
            _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "Not performing invalidation for expired key: %@", buf, 0xCu);
          }
          [v62 addObject:v11];
        }
        else
        {
          v16 = [v11 objectID];
          id v17 = v5;
          if (v16)
          {
            v18 = [(VUISecureInvalidationManager *)self penaltyBox];
            int v19 = [v18 containsObject:v16];

            id v17 = v5;
            if (v19)
            {
              v20 = sLogObject_6;
              BOOL v21 = os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT);
              id v17 = v63;
              if (v21)
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v82 = (uint64_t)v11;
                _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Not invalidating key because it's in the penalty box: %@", buf, 0xCu);
                id v17 = v63;
              }
            }
          }
          [v17 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v23 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
      uint64_t v8 = v23;
    }
    while (v23);
  }

  v24 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    uint64_t v26 = [v62 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v82 = v26;
    _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "      %lu key(s) are expired and will not be invalidated", buf, 0xCu);
  }
  v27 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    uint64_t v29 = [v63 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v82 = v29;
    _os_log_impl(&dword_1E2BD7000, v28, OS_LOG_TYPE_DEFAULT, "      %lu key(s) are in the penalty box and will not be invalidated", buf, 0xCu);
  }
  v30 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    uint64_t v32 = [v5 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v82 = v32;
    _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, "      %lu key(s) are not expired and/or have a playback expiration start date, and are not in the penalty box", buf, 0xCu);
  }
  if ([v62 count])
  {
    v33 = +[VUIMediaLibraryManager defaultManager];
    v34 = [v33 sidebandMediaLibrary];
    [v34 deleteFPSKeyDeletionInfos:v62];
  }
  if ([v5 count])
  {
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v74 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v71 = 0u;
    id v35 = v5;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v71 objects:v79 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v72 != v37) {
            objc_enumerationMutation(v35);
          }
          v39 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          v40 = sLogObject_6;
          if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v82 = (uint64_t)v39;
            _os_log_impl(&dword_1E2BD7000, v40, OS_LOG_TYPE_DEFAULT, "Will attempt to invalidate %@", buf, 0xCu);
          }
          if ([(VUISecureInvalidationManager *)self _validateParamsForDeletionInfo:v39])
          {
            v41 = NSString;
            v42 = [v39 fpsNonceURL];
            v43 = [v39 fpsKeyServerURL];
            v44 = [v39 dsid];
            v45 = [v41 stringWithFormat:@"%@:%@:%@", v42, v43, v44];

            id v46 = [v65 objectForKey:v45];
            if (!v46) {
              id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v46 addObject:v39];
            [v65 setObject:v46 forKey:v45];
          }
          else
          {
            v47 = sLogObject_6;
            if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v82 = (uint64_t)v39;
              _os_log_impl(&dword_1E2BD7000, v47, OS_LOG_TYPE_DEFAULT, "Unable to invalidate key due to param error: %@", buf, 0xCu);
            }
            v45 = +[VUIMediaLibraryManager defaultManager];
            id v46 = [v45 sidebandMediaLibrary];
            [v46 deleteFPSKeyDeletionInfo:v39];
          }
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v71 objects:v79 count:16];
      }
      while (v36);
    }

    objc_initWeak(&location, self);
    v48 = [v65 allValues];
    BOOL v49 = [v48 count] == 0;

    if (v49)
    {
      v57 = sLogObject_6;
      if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v57, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because there are no tuples to invalidate", buf, 2u);
      }
      v58 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v58 postNotificationName:@"VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification" object:0];

      v56 = @"Idle";
    }
    else
    {
      unint64_t v50 = [(VUISecureInvalidationManager *)self backgroundTaskIdentifier];
      if (v50 == *MEMORY[0x1E4FB2748])
      {
        v51 = [MEMORY[0x1E4FB1438] sharedApplication];
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke;
        v69[3] = &unk_1E6DF3D58;
        v69[4] = self;
        uint64_t v52 = [v51 beginBackgroundTaskWithName:@"VUISecureInvalidationManager" expirationHandler:v69];

        v53 = sLogObject_6;
        if (v52 == v50)
        {
          if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
            -[VUISecureInvalidationManager _invalidateKeysForDeletedVideos]();
          }
        }
        else if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v82 = v52;
          _os_log_impl(&dword_1E2BD7000, v53, OS_LOG_TYPE_DEFAULT, "Beginning background task with identifier %lu", buf, 0xCu);
        }
        [(VUISecureInvalidationManager *)self setBackgroundTaskIdentifier:v52];
      }
      else
      {
        v59 = sLogObject_6;
        if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v59, OS_LOG_TYPE_DEFAULT, "Not beginning background task since one is already in progress", buf, 2u);
        }
      }
      v60 = [v65 allValues];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke_48;
      v67[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v68, &location);
      [(VUISecureInvalidationManager *)self _sendInvalidationRequestsForDeletionInfoArrays:v60 completion:v67];

      objc_destroyWeak(&v68);
      v56 = @"Invalidation in progress";
    }
    objc_destroyWeak(&location);
  }
  else
  {
    v54 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v54, OS_LOG_TYPE_DEFAULT, "No keys need invalidating.", buf, 2u);
    }
    v55 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v55, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because no keys need invalidating", buf, 2u);
    }
    id v65 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v65 postNotificationName:@"VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification" object:0];
    v56 = @"Idle";
  }

  return v56;
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUISecureInvalidationManager;
  [(VUISecureInvalidationManager *)&v4 dealloc];
}

- (void)addDeletionInfoToPenaltyBox:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  if (v5)
  {
    v6 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
      -[VUISecureInvalidationManager addDeletionInfoToPenaltyBox:]((uint64_t)v4, v6);
    }
    id v7 = [(VUISecureInvalidationManager *)self penaltyBox];
    [v7 addObject:v5];
  }
}

- (void)removeDeletionInfoFromPenaltyBox:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectID];
  if (v5)
  {
    v6 = [(VUISecureInvalidationManager *)self penaltyBox];
    int v7 = [v6 containsObject:v5];

    if (v7)
    {
      uint64_t v8 = sLogObject_6;
      if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Removing deletion info from penalty box: %@", (uint8_t *)&v10, 0xCu);
      }
      uint64_t v9 = [(VUISecureInvalidationManager *)self penaltyBox];
      [v9 removeObject:v5];
    }
  }
}

- (BOOL)storeFPSKeyLoader:(id)a3 shouldKeyRequestContinueInvalidationAfterLoadingNonce:(id)a4
{
  id v4 = objc_msgSend(a4, "keyIdentifier", a3);
  if (v4)
  {
    id v5 = +[VUIMediaLibraryManager defaultManager];
    v6 = [v5 sidebandMediaLibrary];
    int v7 = [v6 existingFpsKeyInfoForKeyURI:v4];

    BOOL v8 = v7 == 0;
    if (v7)
    {
      uint64_t v9 = sLogObject_6;
      if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Found new key while trying to delete old one.  Not continuing invalidation.", v11, 2u);
      }
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

uint64_t __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke(uint64_t a1)
{
  v1 = (void **)(a1 + 32);
  uint64_t result = [*(id *)(a1 + 32) backgroundTaskIdentifier];
  uint64_t v3 = *MEMORY[0x1E4FB2748];
  if (result != *MEMORY[0x1E4FB2748])
  {
    id v4 = (void *)sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
      __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke_cold_1(v1, v4);
    }
    id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v5, "endBackgroundTask:", objc_msgSend(*v1, "backgroundTaskIdentifier"));

    return [*v1 setBackgroundTaskIdentifier:v3];
  }
  return result;
}

void __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke_48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because invalidation has finished", v5, 2u);
  }
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification" object:0];

  id v4 = [WeakRetained stateMachine];
  [v4 postEvent:@"Invalidation did finish"];
}

- (void)_sendInvalidationRequestsForDeletionInfoArrays:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    int v10 = 134217984;
    uint64_t v11 = [v6 count];
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Will invalidate %lu tuple(s) of (keyServerURL, nonceURL, dsid)", (uint8_t *)&v10, 0xCu);
  }
  [(VUISecureInvalidationManager *)self _sendInvalidationRequestsForFirstArray:v6 completion:v7];
}

- (void)_sendInvalidationRequestsForFirstArray:(id)a3 completion:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  v30 = v5;
  if ([v5 count])
  {
    uint64_t v29 = v6;
    id v7 = [v5 firstObject];
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v7;
    uint64_t v35 = [obj countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v35)
    {
      id v8 = 0;
      id v9 = 0;
      id v10 = 0;
      uint64_t v32 = *(void *)v50;
      do
      {
        uint64_t v11 = 0;
        uint64_t v12 = v8;
        id v13 = v9;
        objc_super v14 = v10;
        do
        {
          if (*(void *)v50 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v49 + 1) + 8 * v11);
          id v47 = v13;
          id v48 = v14;
          id v45 = 0;
          id v46 = 0;
          id v43 = 0;
          id v44 = v12;
          id v42 = 0;
          [(VUISecureInvalidationManager *)self _getParamsForDeletionInfo:v15 keyServerURL:&v48 nonceURL:&v47 keyIdentifier:&v46 offlineKeyData:&v45 dsid:&v44 additionalRequestParams:&v43 contentID:&v42];
          id v10 = v48;

          id v9 = v47;
          id v16 = v46;
          id v17 = v45;
          id v8 = v44;

          id v18 = v43;
          id v19 = v42;
          v20 = [MEMORY[0x1E4FA9D48] secureInvalidationRequestForIdentifier:v16 offlineKeyData:v17 additionalRequestParams:v18 contentID:v19];
          [v20 setContext:v15];
          [v33 addObject:v20];

          ++v11;
          uint64_t v12 = v8;
          id v13 = v9;
          objc_super v14 = v10;
        }
        while (v35 != v11);
        uint64_t v35 = [obj countByEnumeratingWithState:&v49 objects:v61 count:16];
      }
      while (v35);
    }
    else
    {
      id v8 = 0;
      id v9 = 0;
      id v10 = 0;
    }

    v22 = (void *)sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = v22;
      uint64_t v24 = [v33 count];
      *(_DWORD *)buf = 134218754;
      uint64_t v54 = v24;
      __int16 v55 = 2112;
      id v56 = v10;
      __int16 v57 = 2112;
      id v58 = v9;
      __int16 v59 = 2112;
      id v60 = v8;
      _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "Sending %lu invalidation request(s) to key loader for tuple (%@, %@, %@)", buf, 0x2Au);
    }
    v25 = [[VUIStoreFPSKeyLoader alloc] initWithCertificateURL:0 keyServerURL:v10];
    [(VUIStoreFPSKeyLoader *)v25 setUsesKeyIdentifierPenaltyBox:0];
    [(VUIStoreFPSKeyLoader *)v25 setDelegate:self];
    [(VUIStoreFPSKeyLoader *)v25 setSecureInvalidationNonceURL:v9];
    [(VUIStoreFPSKeyLoader *)v25 setSecureInvalidationDSID:v8];
    uint64_t v26 = [(VUISecureInvalidationManager *)self keyLoaders];
    [v26 addObject:v25];

    objc_initWeak((id *)buf, self);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke;
    v36[3] = &unk_1E6DF4E40;
    objc_copyWeak(&v41, (id *)buf);
    v27 = v25;
    uint64_t v37 = v27;
    id v28 = v33;
    id v38 = v28;
    id v39 = v30;
    id v40 = v29;
    [(VUIStoreFPSKeyLoader *)v27 invalidateKeysWithRequests:v28 completion:v36];

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);

    id v6 = (void (**)(void))v29;
  }
  else
  {
    BOOL v21 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "Done making invalidation requests", buf, 2u);
    }
    if (v6) {
      v6[2](v6);
    }
  }
}

void __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v2 = [WeakRetained keyLoaders];
  [v2 removeObject:*(void *)(a1 + 32)];

  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v25 = a1;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    uint64_t v7 = *MEMORY[0x1E4F289A0];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v10 = [v9 context];
        uint64_t v11 = [v9 error];

        uint64_t v12 = sLogObject_6;
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
          {
            v20 = v12;
            BOOL v21 = [v9 error];
            *(_DWORD *)buf = 138412546;
            uint64_t v37 = v10;
            __int16 v38 = 2112;
            id v39 = v21;
            _os_log_error_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_ERROR, "Error invalidating key: %@, %@", buf, 0x16u);
          }
          id v13 = [v9 error];
          objc_super v14 = [v13 domain];
          int v15 = [v14 isEqualToString:v7];

          if (v15)
          {
            id v16 = sLogObject_6;
            if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
              __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke_cold_1(&v30, v31, v16);
            }
            id v17 = [WeakRetained stateMachine];
            [v17 postEvent:@"Network error did occur"];
          }
          else
          {
            id v17 = [v10 objectID];
            if (v17)
            {
              id v18 = sLogObject_6;
              if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
                __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke_cold_2(&v28, v29, v18);
              }
              id v19 = [WeakRetained penaltyBox];
              [v19 addObject:v17];
            }
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v37 = v10;
            _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Successfully invalidated %@", buf, 0xCu);
          }
          if (v10) {
            [v26 addObject:v10];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v5);
  }

  if ([v26 count])
  {
    v22 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v23 = [v22 sidebandMediaLibrary];
    [v23 deleteFPSKeyDeletionInfos:v26];
  }
  uint64_t v24 = objc_msgSend(*(id *)(v25 + 48), "subarrayWithRange:", 1, objc_msgSend(*(id *)(v25 + 48), "count") - 1);
  [WeakRetained _sendInvalidationRequestsForFirstArray:v24 completion:*(void *)(v25 + 56)];
}

- (BOOL)_validateParamsForDeletionInfo:(id)a3
{
  return [(VUISecureInvalidationManager *)self _getParamsForDeletionInfo:a3 keyServerURL:0 nonceURL:0 keyIdentifier:0 offlineKeyData:0 dsid:0 additionalRequestParams:0 contentID:0];
}

- (BOOL)_getParamsForDeletionInfo:(id)a3 keyServerURL:(id *)a4 nonceURL:(id *)a5 keyIdentifier:(id *)a6 offlineKeyData:(id *)a7 dsid:(id *)a8 additionalRequestParams:(id *)a9 contentID:(id *)a10
{
  id v15 = a3;
  id v16 = [v15 keyData];
  uint64_t v17 = [v16 length];
  BOOL v18 = v17 != 0;
  if (v17 || !os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
  {
    if (!a7) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.9();
  if (a7) {
LABEL_4:
  }
    *a7 = v16;
LABEL_5:
  id v19 = [v15 fpsKeyServerURL];
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.8();
    }
    BOOL v18 = 0;
  }
  if (a4) {
    *a4 = v19;
  }
  v20 = [v15 fpsNonceURL];
  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.7();
    }
    BOOL v18 = 0;
  }
  if (a5) {
    *a5 = v20;
  }
  BOOL v21 = [v15 keyURI];
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.6();
    }
    BOOL v18 = 0;
  }
  if (a6) {
    *a6 = v21;
  }
  v22 = [v15 dsid];
  uint64_t v23 = v22;
  if (!v22 || [v22 isEqualToNumber:&unk_1F3F3CAB8])
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.5();
    }
    BOOL v18 = 0;
  }
  if (a8) {
    *a8 = v23;
  }
  uint64_t v24 = objc_msgSend(v15, "additionalFPSRequestParamsJSONData", v19);
  long long v32 = v16;
  if (![v24 length])
  {
    id v27 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_41;
  }
  id v33 = 0;
  uint64_t v25 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v24 options:0 error:&v33];
  id v26 = v33;
  if (!v25)
  {
    uint8_t v28 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:]((uint64_t)v26, v28);
    }
    goto LABEL_39;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.4();
    }
LABEL_39:
    id v27 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_40;
  }
  id v27 = v25;
LABEL_40:

LABEL_41:
  if (![v27 count])
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:]();
    }
    BOOL v18 = 0;
  }
  if (a9) {
    *a9 = v27;
  }
  uint64_t v29 = [v15 contentID];
  if (![v29 length])
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR)) {
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:]();
    }
    BOOL v18 = 0;
  }
  if (a10) {
    *a10 = v29;
  }

  return v18;
}

- (void)_networkReachbilityDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB3CF8];
    uint64_t v6 = v4;
    uint64_t v7 = [v5 sharedInstance];
    int v8 = [v7 isNetworkReachable];
    id v9 = @"NO";
    if (v8) {
      id v9 = @"YES";
    }
    int v11 = 138412290;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Network reachability did change.  Is reachable: %@", (uint8_t *)&v11, 0xCu);
  }
  id v10 = [(VUISecureInvalidationManager *)self stateMachine];
  [v10 postEvent:@"Network reachability did change"];
}

__CFString *__61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_61()
{
  return @"Invalidation in progress refresh when done";
}

uint64_t __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

uint64_t __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

id __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [v3 currentState];

  uint64_t v6 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v7 = [v6 isNetworkReachable];

  if (v7)
  {
    uint64_t v8 = [WeakRetained _invalidateKeysForDeletedVideos];

    uint64_t v5 = (void *)v8;
  }

  return v5;
}

id __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  char v6 = [v5 isNetworkReachable];

  if ((v6 & 1) == 0) {
    [WeakRetained setNetworkErrorOccurredDuringInvalidation:1];
  }
  int v7 = [v3 currentState];

  return v7;
}

id __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setNetworkErrorOccurredDuringInvalidation:1];
  uint64_t v5 = [v3 currentState];

  return v5;
}

__CFString *__61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_7(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained networkErrorOccurredDuringInvalidation])
  {
    id v2 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Network error occurred during invalidation.  Waiting for reachability to change and try again.", (uint8_t *)&v11, 2u);
    }
    [WeakRetained setNetworkErrorOccurredDuringInvalidation:0];
    id v3 = @"Waiting for network reachability to invalidate keys";
  }
  else
  {
    id v3 = @"Idle";
  }
  uint64_t v4 = [WeakRetained backgroundTaskIdentifier];
  uint64_t v5 = *MEMORY[0x1E4FB2748];
  if (v4 != *MEMORY[0x1E4FB2748])
  {
    char v6 = (void *)sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v6;
      uint64_t v8 = [WeakRetained backgroundTaskIdentifier];
      int v11 = 134217984;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Ending background task with identifier %lu", (uint8_t *)&v11, 0xCu);
    }
    id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v9, "endBackgroundTask:", objc_msgSend(WeakRetained, "backgroundTaskIdentifier"));

    [WeakRetained setBackgroundTaskIdentifier:v5];
  }

  return v3;
}

__CFString *__61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_69(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNetworkErrorOccurredDuringInvalidation:0];
  uint64_t v2 = [WeakRetained backgroundTaskIdentifier];
  uint64_t v3 = *MEMORY[0x1E4FB2748];
  if (v2 != *MEMORY[0x1E4FB2748])
  {
    uint64_t v4 = (void *)sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      int v11 = 134217984;
      uint64_t v12 = [WeakRetained backgroundTaskIdentifier];
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Ending background task with identifier %lu", (uint8_t *)&v11, 0xCu);
    }
    char v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v6, "endBackgroundTask:", objc_msgSend(WeakRetained, "backgroundTaskIdentifier"));

    [WeakRetained setBackgroundTaskIdentifier:v3];
  }
  int v7 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v8 = [v7 isNetworkReachable];

  if (v8)
  {
    id v9 = [WeakRetained _invalidateKeysForDeletedVideos];
  }
  else
  {
    id v9 = @"Waiting for network reachability to invalidate keys";
  }

  return v9;
}

- (void)setStateMachine:(id)a3
{
}

- (NSMutableArray)keyLoaders
{
  return self->_keyLoaders;
}

- (void)setKeyLoaders:(id)a3
{
}

- (NSMutableSet)penaltyBox
{
  return self->_penaltyBox;
}

- (void)setPenaltyBox:(id)a3
{
}

- (BOOL)networkErrorOccurredDuringInvalidation
{
  return self->_networkErrorOccurredDuringInvalidation;
}

- (void)setNetworkErrorOccurredDuringInvalidation:(BOOL)a3
{
  self->_networkErrorOccurredDuringInvalidation = a3;
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_penaltyBox, 0);
  objc_storeStrong((id *)&self->_keyLoaders, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

- (void)addDeletionInfoToPenaltyBox:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Adding deletion info to penalty box: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_invalidateKeysForDeletedVideos
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to begin background task since identifier is UIBackgroundTaskInvalid", v2, v3, v4, v5, v6);
}

void __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  int v4 = 134217984;
  uint64_t v5 = [v2 backgroundTaskIdentifier];
  _os_log_error_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_ERROR, "VUISecureInvalidationManager with task identifier %lu expired.  Ending background task", (uint8_t *)&v4, 0xCu);
}

void __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Not adding to penalty box because this is a network error", buf, 2u);
}

void __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Adding to penalty box", buf, 2u);
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to invalidate key since contentID is not present", v2, v3, v4, v5, v6);
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to invalidate key since key additional request params are empty", v2, v3, v4, v5, v6);
}

- (void)_getParamsForDeletionInfo:(uint64_t)a1 keyServerURL:(NSObject *)a2 nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Unable to deserialize fpsAdditionalServerParams: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.4()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Ignoring fpsAdditionalServerParams because it is not a dictionary", v2, v3, v4, v5, v6);
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.5()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to invalidate key since key dsid is nil or zero", v2, v3, v4, v5, v6);
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.6()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to invalidate key since key identifier is nil", v2, v3, v4, v5, v6);
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.7()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to invalidate key since nonce URL is nil", v2, v3, v4, v5, v6);
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.8()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to invalidate key since key server URL is nil", v2, v3, v4, v5, v6);
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.9()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to invalidate key since key data has zero length", v2, v3, v4, v5, v6);
}

@end