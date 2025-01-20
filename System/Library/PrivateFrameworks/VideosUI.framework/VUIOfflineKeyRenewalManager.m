@interface VUIOfflineKeyRenewalManager
+ (id)_keyInfosForVideo:(id)a3 outKeyIdentifiers:(id)a4;
+ (id)sharedInstance;
- (BOOL)networkErrorOccurredDuringInvalidation;
- (NSMutableArray)downloadsForRepairingKeys;
- (NSMutableDictionary)contentKeySessions;
- (NSMutableDictionary)keyLoaders;
- (NSTimer)expirationTimer;
- (NSTimer)keyRenewalTimer;
- (TVPStateMachine)stateMachine;
- (VUIOfflineKeyRenewalManager)init;
- (unint64_t)backgroundTaskIdentifier;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_expirationTimerDidFire:(id)a3;
- (void)_fetchNewKeysForVideosWithBrokenKeys:(id)a3;
- (void)_isPlaybackUIBeingShownDidChange:(id)a3;
- (void)_networkReachbilityDidChange:(id)a3;
- (void)_registerStateMachineHandlers;
- (void)_renewKeysForVideos:(id)a3 outCompletedKeyRequests:(id)a4 completion:(id)a5;
- (void)_renewKeysForVideosGroupedByCertURL:(id)a3 outCompletedKeyRequests:(id)a4 completion:(id)a5;
- (void)_renewalTimerDidFire:(id)a3;
- (void)download:(id)a3 didChangeStateTo:(int64_t)a4;
- (void)setBackgroundTaskIdentifier:(unint64_t)a3;
- (void)setContentKeySessions:(id)a3;
- (void)setDownloadsForRepairingKeys:(id)a3;
- (void)setExpirationTimer:(id)a3;
- (void)setKeyLoaders:(id)a3;
- (void)setKeyRenewalTimer:(id)a3;
- (void)setNetworkErrorOccurredDuringInvalidation:(BOOL)a3;
- (void)setStateMachine:(id)a3;
- (void)storeFPSKeyLoader:(id)a3 didLoadOfflineKeyData:(id)a4 forKeyRequest:(id)a5;
- (void)updateKeyRenewalAndExpiration;
@end

@implementation VUIOfflineKeyRenewalManager

void __45__VUIOfflineKeyRenewalManager_sharedInstance__block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.AppleTV.playback", "VUIOfflineKeyRenewalManager");
  v3 = (void *)sLogObject_22;
  sLogObject_22 = (uint64_t)v2;

  id v4 = objc_alloc_init(*(Class *)(a1 + 32));
  v5 = (void *)sharedInstance_instance_7;
  sharedInstance_instance_7 = (uint64_t)v4;
}

- (VUIOfflineKeyRenewalManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)VUIOfflineKeyRenewalManager;
  os_log_t v2 = [(VUIOfflineKeyRenewalManager *)&v21 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@", objc_opt_class()];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FA9DA8]) initWithName:v3 initialState:@"Idle" mode:0];
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = (TVPStateMachine *)v4;

    [(TVPStateMachine *)v2->_stateMachine setLogObject:sLogObject_22];
    [(VUIOfflineKeyRenewalManager *)v2 _registerStateMachineHandlers];
    [(TVPStateMachine *)v2->_stateMachine setShouldAcceptEvents:1];
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keyLoaders = v2->_keyLoaders;
    v2->_keyLoaders = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    contentKeySessions = v2->_contentKeySessions;
    v2->_contentKeySessions = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    downloadsForRepairingKeys = v2->_downloadsForRepairingKeys;
    v2->_downloadsForRepairingKeys = v10;

    v2->_backgroundTaskIdentifier = *MEMORY[0x1E4FB2748];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4FB3E08];
    v14 = [MEMORY[0x1E4FB3CF8] sharedInstance];
    [v12 addObserver:v2 selector:sel__networkReachbilityDidChange_ name:v13 object:v14];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v16 = VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0];
    v17 = +[VUIPlaybackManager sharedInstance];
    [v15 addObserver:v2 selector:sel__isPlaybackUIBeingShownDidChange_ name:v16 object:v17];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v2 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v2 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
  }
  return v2;
}

- (void)updateKeyRenewalAndExpiration
{
  id v2 = [(VUIOfflineKeyRenewalManager *)self stateMachine];
  [v2 postEvent:@"Update requested"];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VUIOfflineKeyRenewalManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_33 != -1) {
    dispatch_once(&sharedInstance_onceToken_33, block);
  }
  id v2 = (void *)sharedInstance_instance_7;
  return v2;
}

- (void)_registerStateMachineHandlers
{
  v44[3] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v3 = [(VUIOfflineKeyRenewalManager *)self stateMachine];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_4;
  aBlock[3] = &unk_1E6DFC6E8;
  objc_copyWeak(&v38, &location);
  id v35 = &__block_literal_global_144;
  id v36 = &__block_literal_global_93_0;
  id v37 = &__block_literal_global_90_0;
  uint64_t v4 = _Block_copy(aBlock);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_98;
  v28[3] = &unk_1E6DFC738;
  objc_copyWeak(&v33, &location);
  id v29 = &__block_literal_global_93_0;
  id v5 = v4;
  id v30 = v5;
  id v31 = &__block_literal_global_144;
  id v32 = &__block_literal_global_87;
  v6 = _Block_copy(v28);
  v44[0] = @"Update requested";
  v44[1] = @"Key renewal timer did fire";
  v44[2] = @"Expiration timer did fire";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  v43 = @"Idle";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_105;
  v22[3] = &unk_1E6DF7890;
  objc_copyWeak(&v27, &location);
  id v9 = v5;
  id v23 = v9;
  id v24 = &__block_literal_global_144;
  id v25 = &__block_literal_global_87;
  id v10 = v6;
  id v26 = v10;
  [v3 registerHandlerForEvents:v7 onStates:v8 withBlock:v22];

  [v3 registerHandlerForEvent:@"Update requested" onState:@"Waiting for network reachability to check for renewals" withBlock:&__block_literal_global_115];
  [v3 registerHandlerForEvent:@"Update requested" onState:@"Renewal in progress" withBlock:&__block_literal_global_119];
  [v3 registerHandlerForEvent:@"Update requested" onState:@"Renewal in progress update when done" withBlock:&__block_literal_global_122];
  [v3 registerHandlerForEvent:@"Renewal did finish" onState:@"Renewal in progress" withBlock:&__block_literal_global_124];
  [v3 registerHandlerForEvent:@"Renewal did finish" onState:@"Renewal in progress update when done" withBlock:&__block_literal_global_126];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_8;
  v20[3] = &unk_1E6DF6470;
  id v11 = v9;
  id v21 = v11;
  [v3 registerDefaultHandlerForEvent:@"Expiration timer did fire" withBlock:v20];
  [v3 registerHandlerForEvent:@"Key renewal timer did fire" onState:@"Waiting for network reachability to check for renewals" withBlock:&__block_literal_global_128];
  v42[0] = @"Renewal in progress";
  v42[1] = @"Renewal in progress update when done";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  [v3 registerHandlerForEvent:@"Network error did occur" onStates:v12 withBlock:&__block_literal_global_130];

  [v3 registerHandlerForEvent:@"Network reachability did change" onState:@"Waiting for network reachability to check for renewals" withBlock:&__block_literal_global_132];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_14;
  v18[3] = &unk_1E6DF6470;
  id v13 = v11;
  id v19 = v13;
  [v3 registerDefaultHandlerForEvent:@"Playback UI being shown did change" withBlock:v18];
  v41[0] = @"Idle";
  v41[1] = @"Waiting for network reachability to check for renewals";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_15;
  v16[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v17, &location);
  [v3 registerHandlerForEvent:@"Application did enter background" onStates:v14 withBlock:v16];

  v40[0] = @"Idle";
  v40[1] = @"Waiting for network reachability to check for renewals";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  [v3 registerHandlerForEvent:@"Application will enter foreground" onStates:v15 withBlock:&__block_literal_global_135];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&location);
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = +[VUIMediaLibraryManager defaultManager];
  v8 = [v7 sidebandMediaLibrary];
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3F3E4F8];
  uint64_t v10 = [v8 videosWithDownloadStates:v9 entitlementTypes:0 sortDescriptors:0 useMainThreadContext:1];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v24 = (void *)v10;
  obuint64_t j = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v32)
  {
    id v30 = v5;
    uint64_t v31 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v13 = [v12 fpsKeyInfo];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (!v14)
        {

          v22 = v5;
LABEL_21:
          [v22 addObject:v12];
          continue;
        }
        uint64_t v15 = v14;
        char v16 = 0;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(v13);
            }
            id v19 = [*(id *)(*((void *)&v33 + 1) + 8 * j) expirationDate];
            v20 = v19;
            if (v19)
            {
              id v21 = [v19 earlierDate:v6];

              if (v21 == v20) {
                [v4 addObject:v12];
              }
              char v16 = 1;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v15);

        id v5 = v30;
        v22 = v30;
        if ((v16 & 1) == 0) {
          goto LABEL_21;
        }
        char v23 = [v4 containsObject:v12];
        v22 = v28;
        if ((v23 & 1) == 0) {
          goto LABEL_21;
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v32);
  }

  if (a2) {
    *a2 = v4;
  }
  if (a3) {
    *a3 = v28;
  }
  if (a4) {
    *a4 = v5;
  }
}

__CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = *(void *)(a1 + 40);
  v38[6] = 0;
  (*(void (**)(void))(v5 + 16))();
  id v6 = 0;
  v7 = [WeakRetained keyRenewalTimer];

  if (v7)
  {
    v8 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating key renewal timer", buf, 2u);
    }
    id v9 = [WeakRetained keyRenewalTimer];
    [v9 invalidate];

    [WeakRetained setKeyRenewalTimer:0];
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v11 = objc_msgSend(v10, "ams_activeiTunesAccount");

  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 48);
    v38[5] = 0;
    int v13 = (*(uint64_t (**)(void))(v12 + 16))();
    id v14 = 0;
    uint64_t v15 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)v14;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Earliest unexpired renewal date is %@", buf, 0xCu);
    }
    if (v13)
    {
      char v16 = sLogObject_22;
      if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Renewal date for one or more downloads is in the past", buf, 2u);
      }
      uint64_t v17 = [MEMORY[0x1E4FB3CF8] sharedInstance];
      int v18 = [v17 isNetworkReachable];

      id v19 = sLogObject_22;
      BOOL v20 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Network is reachable, will renew all keys", buf, 2u);
        }
        uint64_t v21 = [WeakRetained backgroundTaskIdentifier];
        if (v21 == *MEMORY[0x1E4FB2748])
        {
          uint64_t v22 = v21;
          char v23 = [MEMORY[0x1E4FB1438] sharedApplication];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_110;
          v38[3] = &unk_1E6DF3D58;
          v38[4] = WeakRetained;
          uint64_t v24 = [v23 beginBackgroundTaskWithName:@"VUIOfflineKeyRenewalManager" expirationHandler:v38];

          id v25 = sLogObject_22;
          if (v24 == v22)
          {
            if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_ERROR)) {
              __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_105_cold_1(v25);
            }
          }
          else if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v40 = v24;
            _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "Beginning background task with identifier %lu", buf, 0xCu);
          }
          [WeakRetained setBackgroundTaskIdentifier:v24];
        }
        else
        {
          long long v33 = sLogObject_22;
          if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v33, OS_LOG_TYPE_DEFAULT, "Not beginning background task since one is already in progress", buf, 2u);
          }
        }
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_111;
        v35[3] = &unk_1E6DF41E8;
        id v37 = *(id *)(a1 + 56);
        id v36 = v6;
        [v3 executeBlockAfterCurrentStateTransition:v35];

        id v27 = @"Renewal in progress";
      }
      else
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Network is not reachable.  Will renew keys when network becomes reachable", buf, 2u);
        }
        id v27 = @"Waiting for network reachability to check for renewals";
      }
    }
    else
    {
      if (v14)
      {
        id v28 = [v14 dateByAddingTimeInterval:5.0];
        id v29 = sLogObject_22;
        if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v40 = (uint64_t)v28;
          _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Renewal date for one or more downloads is in the future.  Scheduling renewal timer for %@", buf, 0xCu);
        }
        id v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v28 interval:WeakRetained target:sel__renewalTimerDidFire_ selector:0 userInfo:0 repeats:0.0];
        [WeakRetained setKeyRenewalTimer:v30];
        uint64_t v31 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        [v31 addTimer:v30 forMode:*MEMORY[0x1E4F1C3A0]];
      }
      else
      {
        uint64_t v32 = sLogObject_22;
        if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v32, OS_LOG_TYPE_DEFAULT, "Earliest unexpired renewal is nil. Not performing or scheduling renewals", buf, 2u);
        }
      }
      id v27 = @"Idle";
    }
  }
  else
  {
    id v26 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "No user is signed in.  Not performing or scheduling renewals", buf, 2u);
    }
    id v27 = @"Idle";
  }

  return v27;
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained expirationTimer];

  if (v2)
  {
    id v3 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating expiration timer", buf, 2u);
    }
    id v4 = [WeakRetained expirationTimer];
    [v4 invalidate];

    [WeakRetained setExpirationTimer:0];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  uint64_t v67 = 0;
  (*(void (**)(void))(v5 + 16))();
  id v6 = 0;
  id v7 = 0;
  id v8 = 0;
  id v9 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    uint64_t v11 = [v6 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v73 = v11;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Found %lu expired download(s)", buf, 0xCu);
  }
  uint64_t v12 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = v12;
    uint64_t v14 = [v7 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v73 = v14;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu unexpired download(s)", buf, 0xCu);
  }
  uint64_t v15 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    char v16 = v15;
    uint64_t v17 = [v8 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v73 = v17;
    _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Found %lu download(s) that will never expire", buf, 0xCu);
  }
  if ([v6 count])
  {
    id v54 = v8;
    id v55 = v7;
    id v57 = WeakRetained;
    int v18 = (void *)[v6 mutableCopy];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v56 = v6;
    id v19 = v6;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v64 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
          {
            id v25 = sLogObject_22;
            if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v73 = (uint64_t)v24;
              _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "Video is expired, but it is being played.  Will delete when playback ends: %@", buf, 0xCu);
            }
            [v18 removeObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v21);
    }

    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v28 = v18;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v60 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          long long v34 = [v33 availabilityEndDate];
          if (![v33 allowsManualRenewal])
          {
            uint64_t v38 = sLogObject_22;
            BOOL v39 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
            id v37 = v26;
            if (!v39) {
              goto LABEL_38;
            }
            *(_WORD *)buf = 0;
            uint64_t v40 = v38;
            uint64_t v41 = "Deleting expired video since it does not allow manual renewal";
LABEL_37:
            _os_log_impl(&dword_1E2BD7000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 2u);
            id v37 = v26;
            goto LABEL_38;
          }
          if (v34 && !objc_msgSend(v34, "vui_isInTheFuture"))
          {
            uint64_t v42 = sLogObject_22;
            BOOL v43 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
            id v37 = v26;
            if (!v43) {
              goto LABEL_38;
            }
            *(_WORD *)buf = 0;
            uint64_t v40 = v42;
            uint64_t v41 = "Deleting expired video even though it allows manual renewal, since it is outside the availability window";
            goto LABEL_37;
          }
          long long v35 = sLogObject_22;
          BOOL v36 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
          id v37 = v27;
          if (v36)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v35, OS_LOG_TYPE_DEFAULT, "Invalidating (but not deleting) expired video since it allows manual key renewal and is still within availability window", buf, 2u);
            id v37 = v27;
          }
LABEL_38:
          [v37 addObject:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v30);
    }

    v44 = +[VUIMediaLibraryManager defaultManager];
    v45 = [v44 sidebandMediaLibrary];
    [v45 removeDownloadedMediaForVideoManagedObjects:v26 markAsDeleted:0 invalidateImmediately:1];

    v46 = +[VUIMediaLibraryManager defaultManager];
    v47 = [v46 sidebandMediaLibrary];
    [v47 invalidateKeysForVideoManagedObjects:v27];

    id v6 = v56;
    id WeakRetained = v57;
    id v8 = v54;
    id v7 = v55;
  }
  v48 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v49 = sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v73 = (uint64_t)v48;
    _os_log_impl(&dword_1E2BD7000, v49, OS_LOG_TYPE_DEFAULT, "Next expiration date is %@", buf, 0xCu);
  }
  if (v48)
  {
    v50 = [v48 dateByAddingTimeInterval:5.0];
    v51 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v73 = (uint64_t)v50;
      _os_log_impl(&dword_1E2BD7000, v51, OS_LOG_TYPE_DEFAULT, "Expiration date for one or more downloads is in the future.  Scheduling expiration timer for %@", buf, 0xCu);
    }
    v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v50 interval:WeakRetained target:sel__expirationTimerDidFire_ selector:0 userInfo:0 repeats:0.0];
    [WeakRetained setExpirationTimer:v52];
    v53 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v53 addTimer:v52 forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

id __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = a2;
  uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v8 = [v7 fpsKeyInfo];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              int v13 = [*(id *)(*((void *)&v18 + 1) + 8 * j) expirationDate];
              uint64_t v14 = v13;
              if (v13)
              {
                if (v4)
                {
                  uint64_t v15 = [v13 earlierDate:v4];

                  id v4 = (id)v15;
                }
                else
                {
                  id v4 = v13;
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v10);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_84(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = a2;
  uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  id v4 = 0;
  id v5 = 0;
  if (v29)
  {
    uint64_t v28 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v8 = [v7 fpsKeyInfo];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v31 != v11) {
                objc_enumerationMutation(v8);
              }
              int v13 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              uint64_t v14 = [v13 renewalDate];
              uint64_t v15 = v14;
              if (v14)
              {
                if (v5)
                {
                  uint64_t v16 = [v14 earlierDate:v5];

                  id v5 = (id)v16;
                }
                else
                {
                  id v5 = v14;
                }
              }
              uint64_t v17 = [v13 renewalInterval];
              long long v18 = v17;
              if (v17)
              {
                if (!v4 || ([v17 doubleValue], double v20 = v19, objc_msgSend(v4, "doubleValue"), v20 < v21))
                {
                  id v22 = v18;

                  id v4 = v22;
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v10);
        }
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v29);
  }
  if (a3) {
    *a3 = v5;
  }
  if (a4) {
    *a4 = v4;
  }
  if (v5) {
    uint64_t v23 = objc_msgSend(v5, "vui_isInThePast");
  }
  else {
    uint64_t v23 = 0;
  }

  return v23;
}

- (NSTimer)keyRenewalTimer
{
  return self->_keyRenewalTimer;
}

- (NSTimer)expirationTimer
{
  return self->_expirationTimer;
}

- (void)storeFPSKeyLoader:(id)a3 didLoadOfflineKeyData:(id)a4 forKeyRequest:(id)a5
{
  id v5 = a5;
  id v6 = [v5 context];
  id v7 = [v5 keyIdentifier];
  if (v7)
  {
    id v8 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v9 = [v8 sidebandMediaLibrary];
    uint64_t v10 = [v9 fpsKeyInfoForVideo:v6 keyURI:v7 createIfNeeded:1 wasCreated:0];

    [v10 populateFromKeyRequest:v5 video:v6];
    uint64_t v11 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v12 = [v11 sidebandMediaLibrary];
    [v12 saveChangesToManagedObjects];

    if (![v6 downloadState])
    {
      int v13 = sLogObject_22;
      if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Offline keys renewed for an item that is no longer downloading or downloaded.  Invalidating keys.", v16, 2u);
      }
      uint64_t v14 = +[VUIMediaLibraryManager defaultManager];
      uint64_t v15 = [v14 sidebandMediaLibrary];
      [v15 removeDownloadedMediaForVideoManagedObject:v6 markAsDeleted:0 invalidateImmediately:1];
    }
  }
}

- (void)download:(id)a3 didChangeStateTo:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if ((unint64_t)(a4 - 3) <= 2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__VUIOfflineKeyRenewalManager_download_didChangeStateTo___block_invoke;
    v8[3] = &unk_1E6DF3F68;
    v8[4] = self;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __57__VUIOfflineKeyRenewalManager_download_didChangeStateTo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) downloadsForRepairingKeys];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)_networkReachbilityDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)MEMORY[0x1E4FB3CF8];
    id v6 = v4;
    id v7 = [v5 sharedInstance];
    int v8 = [v7 isNetworkReachable];
    id v9 = @"NO";
    if (v8) {
      id v9 = @"YES";
    }
    int v11 = 138412290;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Network reachability did change.  Is reachable: %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v10 = [(VUIOfflineKeyRenewalManager *)self stateMachine];
  [v10 postEvent:@"Network reachability did change"];
}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = +[VUIPlaybackManager sharedInstance];
    int v7 = [v6 isPlaybackUIBeingShown];
    int v8 = @"NO";
    if (v7) {
      int v8 = @"YES";
    }
    int v10 = 138412290;
    int v11 = v8;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "isPlaybackUIBeingShown did change to %@", (uint8_t *)&v10, 0xCu);
  }
  id v9 = [(VUIOfflineKeyRenewalManager *)self stateMachine];
  [v9 postEvent:@"Playback UI being shown did change"];
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v3 = [(VUIOfflineKeyRenewalManager *)self stateMachine];
  [v3 postEvent:@"Application did enter background"];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v3 = [(VUIOfflineKeyRenewalManager *)self stateMachine];
  [v3 postEvent:@"Application will enter foreground"];
}

- (void)_renewalTimerDidFire:(id)a3
{
  [(VUIOfflineKeyRenewalManager *)self setKeyRenewalTimer:0];
  id v4 = [(VUIOfflineKeyRenewalManager *)self stateMachine];
  [v4 postEvent:@"Key renewal timer did fire"];
}

- (void)_expirationTimerDidFire:(id)a3
{
  [(VUIOfflineKeyRenewalManager *)self setExpirationTimer:0];
  id v4 = [(VUIOfflineKeyRenewalManager *)self stateMachine];
  [v4 postEvent:@"Expiration timer did fire"];
}

- (void)_renewKeysForVideosGroupedByCertURL:(id)a3 outCompletedKeyRequests:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(void))a5;
  if ([v8 count])
  {
    int v11 = [v8 firstObject];
    uint64_t v12 = [v11 firstObject];
    uint64_t v13 = [v12 fpsCertificateURL];
    uint64_t v14 = [v12 fpsKeyServerURL];
    objc_initWeak(&location, self);
    uint64_t v15 = (id)sLogObject_22;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v11 count];
      *(_DWORD *)buf = 134218498;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      id v27 = v13;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Renewing %lu video(s) for tuple (%@, %@)", buf, 0x20u);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __102__VUIOfflineKeyRenewalManager__renewKeysForVideosGroupedByCertURL_outCompletedKeyRequests_completion___block_invoke;
    v18[3] = &unk_1E6DF4588;
    objc_copyWeak(&v22, &location);
    id v19 = v8;
    id v20 = v9;
    double v21 = v10;
    [(VUIOfflineKeyRenewalManager *)self _renewKeysForVideos:v11 outCompletedKeyRequests:v20 completion:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v17 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Done renewing keys for all videos", buf, 2u);
    }
    if (v10) {
      v10[2](v10);
    }
  }
}

void __102__VUIOfflineKeyRenewalManager__renewKeysForVideosGroupedByCertURL_outCompletedKeyRequests_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 32), "count") - 1);
  [WeakRetained _renewKeysForVideosGroupedByCertURL:v2 outCompletedKeyRequests:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_renewKeysForVideos:(id)a3 outCompletedKeyRequests:(id)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v31 = a4;
  id v9 = (void (**)(void))a5;
  if ([v8 count])
  {
    uint64_t v29 = v9;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    void v42[2] = __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke;
    v42[3] = &unk_1E6DFC618;
    id v30 = v11;
    id v43 = v30;
    id v13 = v10;
    id v44 = v13;
    id v14 = v12;
    id v45 = v14;
    [v8 enumerateObjectsUsingBlock:v42];
    uint64_t v15 = [v8 firstObject];
    uint64_t v16 = [v15 fpsCertificateURL];
    uint64_t v17 = [v15 fpsKeyServerURL];
    long long v18 = [NSString stringWithFormat:@"%@:%@", v16, v17];
    id v19 = [(VUIOfflineKeyRenewalManager *)self contentKeySessions];
    id v20 = [v19 objectForKey:v18];

    if (!v20)
    {
      double v21 = sLogObject_22;
      if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v18;
        _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "Creating content key session for tuple %@", buf, 0xCu);
      }
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4FA9D50]) initWithContentKeyLoader:0 avAsset:0];
      id v22 = [(VUIOfflineKeyRenewalManager *)self contentKeySessions];
      [v22 setObject:v20 forKey:v18];
    }
    objc_initWeak((id *)buf, self);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke_73;
    v32[3] = &unk_1E6DFC640;
    objc_copyWeak(&v41, (id *)buf);
    id v33 = v31;
    id v23 = v14;
    id v34 = v23;
    id v24 = v18;
    id v35 = v24;
    id v25 = v16;
    id v36 = v25;
    id v26 = v17;
    id v37 = v26;
    id v27 = v13;
    id v38 = v27;
    id v39 = v8;
    id v40 = v29;
    [v20 generateOfflineKeyRequestsForIdentifiers:v30 completion:v32];

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);

    id v9 = (void (**)(void))v29;
  }
  else
  {
    __int16 v28 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v28, OS_LOG_TYPE_DEFAULT, "Done renewing keys for tuple", buf, 2u);
    }
    if (v9) {
      v9[2](v9);
    }
  }
}

void __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = +[VUIOfflineKeyRenewalManager _keyInfosForVideo:v7 outKeyIdentifiers:v8];
  if (a3
    && (uint64_t v10 = [a1[4] count],
        unint64_t v11 = [v8 count] + v10,
        v11 >= +[VUIStoreFPSKeyLoader maximumRequestBatchSize]))
  {
    *a4 = 1;
  }
  else
  {
    id v12 = (void *)sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = [v7 canonicalID];
      uint64_t v15 = [v7 title];
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Renewing keys for %@ (%@)", (uint8_t *)&v16, 0x16u);
    }
    [a1[5] addObject:v7];
    [a1[4] addObjectsFromArray:v8];
    [a1[6] unionSet:v9];
  }
}

void __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v51 = a1;
  from = (id *)(a1 + 96);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v4 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    *(_DWORD *)buf = 134217984;
    uint64_t v78 = objc_msgSend(v3, "count", from);
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Generated %lu key requests", buf, 0xCu);
  }
  objc_msgSend(*(id *)(v51 + 32), "addObjectsFromArray:", v3, from);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = v3;
  uint64_t v52 = [obj countByEnumeratingWithState:&v73 objects:v86 count:16];
  if (v52)
  {
    id v49 = *(id *)v74;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(id *)v74 != v49) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v8 = *(id *)(v51 + 40);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v69 objects:v85 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v70;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v70 != v10) {
                objc_enumerationMutation(v8);
              }
              id v12 = *(void **)(*((void *)&v69 + 1) + 8 * j);
              id v13 = [v12 keyURI];
              id v14 = [v7 keyIdentifier];
              int v15 = [v13 isEqual:v14];

              if (v15)
              {
                int v16 = [v12 video];
                [v7 setContext:v16];

                uint64_t v17 = [v12 video];
                __int16 v18 = [v17 additionalFPSRequestParams];
                [v7 setAdditionalRequestParams:v18];

                id v19 = [v12 keyData];
                [v7 setOfflineKeyData:v19];

                uint64_t v20 = [v12 contentID];
                [v7 setContentID:v20];

                goto LABEL_18;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v69 objects:v85 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v73 objects:v86 count:16];
    }
    while (v52);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v50 = *(id *)(v51 + 40);
  uint64_t v21 = [v50 countByEnumeratingWithState:&v65 objects:v84 count:16];
  if (!v21) {
    goto LABEL_43;
  }
  uint64_t v53 = *(void *)v66;
  do
  {
    for (uint64_t k = 0; k != v21; ++k)
    {
      if (*(void *)v66 != v53) {
        objc_enumerationMutation(v50);
      }
      id v23 = *(void **)(*((void *)&v65 + 1) + 8 * k);
      id v24 = [v23 keyURI];
      BOOL v25 = v24 == 0;

      if (v25) {
        goto LABEL_35;
      }
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v26 = obj;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v61 objects:v83 count:16];
      if (!v27)
      {
LABEL_34:

LABEL_35:
        id v33 = [v23 renewalInterval];
        if (v33)
        {
          id v34 = [MEMORY[0x1E4F1C9C8] date];
          [v33 doubleValue];
          objc_msgSend(v34, "dateByAddingTimeInterval:");
          id v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v26 = 0;
        }
        id v35 = sLogObject_22;
        if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v78 = (uint64_t)v23;
          __int16 v79 = 2112;
          id v80 = v26;
          _os_log_error_impl(&dword_1E2BD7000, v35, OS_LOG_TYPE_ERROR, "Unable to generate key request for %@.  Resetting renewal date to %@", buf, 0x16u);
        }
        [v23 setRenewalDate:v26];

        goto LABEL_41;
      }
      uint64_t v28 = *(void *)v62;
LABEL_28:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v62 != v28) {
          objc_enumerationMutation(v26);
        }
        id v30 = *(void **)(*((void *)&v61 + 1) + 8 * v29);
        id v31 = [v23 keyURI];
        long long v32 = [v30 keyIdentifier];
        LOBYTE(v30) = [v31 isEqual:v32];

        if (v30) {
          break;
        }
        if (v27 == ++v29)
        {
          uint64_t v27 = [v26 countByEnumeratingWithState:&v61 objects:v83 count:16];
          if (v27) {
            goto LABEL_28;
          }
          goto LABEL_34;
        }
      }
LABEL_41:
    }
    uint64_t v21 = [v50 countByEnumeratingWithState:&v65 objects:v84 count:16];
  }
  while (v21);
LABEL_43:

  id v36 = [WeakRetained keyLoaders];
  id v37 = [v36 objectForKey:*(void *)(v51 + 48)];

  if (!v37)
  {
    id v38 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *(void *)(v51 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v78 = v39;
      _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "Creating key loader for tuple %@", buf, 0xCu);
    }
    id v37 = [[VUIStoreFPSKeyLoader alloc] initWithCertificateURL:*(void *)(v51 + 56) keyServerURL:*(void *)(v51 + 64)];
    [(VUIStoreFPSKeyLoader *)v37 setUsesKeyIdentifierPenaltyBox:0];
    [(VUIStoreFPSKeyLoader *)v37 setDelegate:WeakRetained];
    id v40 = [WeakRetained keyLoaders];
    [v40 setObject:v37 forKey:*(void *)(v51 + 48)];
  }
  id v41 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = v41;
    uint64_t v43 = [obj count];
    id v44 = *(void **)(v51 + 56);
    uint64_t v45 = *(void *)(v51 + 64);
    *(_DWORD *)buf = 134218498;
    uint64_t v78 = v43;
    __int16 v79 = 2112;
    id v80 = v44;
    __int16 v81 = 2112;
    uint64_t v82 = v45;
    _os_log_impl(&dword_1E2BD7000, v42, OS_LOG_TYPE_DEFAULT, "Sending %lu offline key request(s) to key loader for tuple (%@, %@)", buf, 0x20u);
  }
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke_75;
  v55[3] = &unk_1E6DF4E40;
  objc_copyWeak(&v60, froma);
  id v56 = *(id *)(v51 + 72);
  id v57 = *(id *)(v51 + 80);
  id v58 = *(id *)(v51 + 32);
  id v59 = *(id *)(v51 + 88);
  [(VUIStoreFPSKeyLoader *)v37 loadFairPlayStreamingKeyRequests:obj completion:v55];

  objc_destroyWeak(&v60);
}

void __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke_75(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = (void *)sLogObject_22;
        if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v8 = v6;
          uint64_t v9 = [v7 canonicalID];
          uint64_t v10 = [v7 title];
          *(_DWORD *)buf = 138412546;
          id v19 = v9;
          __int16 v20 = 2112;
          uint64_t v21 = v10;
          _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Done renewing keys for %@ (%@)", buf, 0x16u);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v3);
  }

  unint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", objc_msgSend(*(id *)(a1 + 32), "count"), objc_msgSend(*(id *)(a1 + 40), "count") - objc_msgSend(*(id *)(a1 + 32), "count"));
  [WeakRetained _renewKeysForVideos:v11 outCompletedKeyRequests:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

+ (id)_keyInfosForVideo:(id)a3 outKeyIdentifiers:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = objc_msgSend(v5, "fpsKeyInfo", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v7 addObject:v13];
        long long v14 = [v13 keyURI];
        long long v15 = [v14 absoluteString];

        if (v15) {
          [v6 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)_fetchNewKeysForVideosWithBrokenKeys:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v21;
    *(void *)&long long v5 = 138412290;
    long long v18 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * v8);
        uint64_t v10 = sLogObject_22;
        if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          uint64_t v25 = v9;
          _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Fetching new keys for %@", buf, 0xCu);
        }
        uint64_t v11 = [[VUIStoreAuxMediaItem alloc] initWithVideoManagedObject:v9 isForStartingDownload:0];
        id v12 = +[VUIPlaybackManager sharedInstance];
        id v13 = [v12 currentMediaItem];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 isEqualToMediaItem:v11])
        {
          long long v14 = v13;

          uint64_t v11 = v14;
        }
        long long v15 = objc_msgSend(MEMORY[0x1E4FA9D60], "sharedInstance", v18);
        long long v16 = [v15 downloadForMediaItem:v11];

        long long v17 = [(VUIOfflineKeyRenewalManager *)self downloadsForRepairingKeys];
        [v17 addObject:v16];

        [(VUIStoreAuxMediaItem *)v11 setIgnoreExistingOfflineKeyData:1];
        [v16 setPerformKeyFetchOnly:1];
        [v16 addDelegate:self];
        [v16 start];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 canonicalID];
  if (v2)
  {
    uint64_t v3 = +[VUIPlaybackManager sharedInstance];
    uint64_t v4 = [v3 isPlaybackUIBeingShown];

    if (v4)
    {
      long long v5 = +[VUIPlaybackManager sharedInstance];
      uint64_t v6 = [v5 currentMediaItem];
      uint64_t v7 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];

      if (v7) {
        uint64_t v4 = [v7 isEqual:v2];
      }
      else {
        uint64_t v4 = 0;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_98(id *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v21 = a1;
  from = a1 + 8;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v9 = NSString;
        uint64_t v10 = [v8 fpsCertificateURL];
        uint64_t v11 = [v8 fpsKeyServerURL];
        id v12 = [v9 stringWithFormat:@"%@:%@", v10, v11];

        id v13 = [v4 objectForKey:v12];
        if (!v13) {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v13 addObject:v8];
        [v4 setObject:v13 forKey:v12];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v5);
  }

  long long v14 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = v14;
    uint64_t v16 = [obj count];
    uint64_t v17 = [v4 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v37 = v16;
    __int16 v38 = 2048;
    uint64_t v39 = v17;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Will renew keys for %lu videos with %lu tuple(s) of (certificateURL, keyServerURL)", buf, 0x16u);
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = [v4 allValues];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_99;
  v25[3] = &unk_1E6DFC710;
  objc_copyWeak(&v31, from);
  id v20 = v18;
  id v26 = v20;
  id v27 = v21[4];
  id v28 = v21[5];
  id v29 = v21[6];
  id v30 = v21[7];
  [WeakRetained _renewKeysForVideosGroupedByCertURL:v19 outCompletedKeyRequests:v20 completion:v25];

  objc_destroyWeak(&v31);
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_99(uint64_t a1)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v67 = (void *)a1;
  obuint64_t j = *(id *)(a1 + 32);
  id v3 = &off_1E6DF2000;
  long long v70 = v2;
  uint64_t v77 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
  uint64_t v4 = 0;
  if (v77)
  {
    uint64_t v76 = *(void *)v79;
    uint64_t v74 = *MEMORY[0x1E4FAA418];
    uint64_t v73 = *MEMORY[0x1E4F289A0];
    uint64_t v71 = *MEMORY[0x1E4F15AC0];
    uint64_t v68 = *MEMORY[0x1E4F28A50];
    do
    {
      for (uint64_t i = 0; i != v77; ++i)
      {
        uint64_t v6 = v4;
        if (*(void *)v79 != v76) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        uint64_t v8 = [v7 error];
        uint64_t v9 = [v7 context];
        uint64_t v10 = [v7 keyIdentifier];
        uint64_t v11 = (void *)v10;
        if (v8) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = v10 == 0;
        }
        if (!v12) {
          goto LABEL_42;
        }
        id v13 = [v8 domain];
        if ([v13 isEqualToString:v74])
        {
          uint64_t v14 = [v8 code];

          if (v14 == -345015)
          {
            if (v9 && ([v69 containsObject:v9] & 1) == 0)
            {
              int v15 = (*(uint64_t (**)(void))(v67[5] + 16))();
              uint64_t v16 = sLogObject_22;
              BOOL v17 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
              if (v15)
              {
                if (v17)
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v83 = (uint64_t)v9;
                  _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "User is no longer entitled to video, but it is being played.  Will delete when playback ends: %@", buf, 0xCu);
                }
                id v18 = [v3[272] defaultManager];
                long long v19 = [v18 sidebandMediaLibrary];
                id v20 = [v19 fpsKeyInfoForVideo:v9 keyURI:v11 createIfNeeded:0 wasCreated:0];

                long long v21 = [MEMORY[0x1E4F1C9C8] distantPast];
                [v20 setExpirationDate:v21];
              }
              else
              {
                if (v17)
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v83 = (uint64_t)v9;
                  _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Deleting download that user is no longer entitled to: %@", buf, 0xCu);
                }
                [v69 addObject:v9];
              }
            }
LABEL_42:
            uint64_t v4 = v6;
            goto LABEL_43;
          }
        }
        else
        {
        }
        long long v22 = [v8 domain];
        int v23 = [v22 isEqualToString:v73];

        uint64_t v4 = v23 | v4;
        if ((v23 & 1) == 0 && v11)
        {
          id v24 = [v3[272] defaultManager];
          uint64_t v25 = [v24 sidebandMediaLibrary];
          id v26 = [v25 fpsKeyInfoForVideo:v9 keyURI:v11 createIfNeeded:0 wasCreated:0];

          id v27 = [v26 renewalInterval];
          long long v72 = v27;
          if (v27)
          {
            id v28 = [MEMORY[0x1E4F1C9C8] date];
            [v27 doubleValue];
            id v27 = objc_msgSend(v28, "dateByAddingTimeInterval:");
          }
          id v29 = sLogObject_22;
          if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v83 = (uint64_t)v26;
            __int16 v84 = 2112;
            v85 = v27;
            _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Error occurred for key %@.  Resetting renewal date to %@", buf, 0x16u);
          }
          [v26 setRenewalDate:v27];
          int v30 = [v26 isInvalid];
          id v31 = [v8 domain];
          if ([v31 isEqualToString:v71])
          {
            uint64_t v32 = [v8 code];

            BOOL v12 = v32 == -11800;
            id v2 = v70;
            if (!v12)
            {
LABEL_32:
              if (v30 && v9 && ([v2 containsObject:v9] & 1) == 0)
              {
                long long v34 = sLogObject_22;
                if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v83 = (uint64_t)v9;
                  _os_log_error_impl(&dword_1E2BD7000, v34, OS_LOG_TYPE_ERROR, "Key refresh failed due to key integrity issue.  Will get new keys for %@", buf, 0xCu);
                }
                [v2 addObject:v9];
              }

              uint64_t v4 = v6;
              id v3 = &off_1E6DF2000;
              goto LABEL_43;
            }
            long long v33 = [v8 userInfo];
            id v31 = [v33 objectForKey:v68];

            id v2 = v70;
            if ([v31 code] == -42801) {
              int v30 = 1;
            }
          }

          goto LABEL_32;
        }
LABEL_43:
      }
      uint64_t v77 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
    }
    while (v77);
  }

  long long v35 = [v3[272] defaultManager];
  id v36 = [v35 sidebandMediaLibrary];
  [v36 saveChangesToManagedObjects];

  if ([v69 count])
  {
    uint64_t v37 = [v3[272] defaultManager];
    __int16 v38 = [v37 sidebandMediaLibrary];
    uint64_t v39 = [v69 allObjects];
    [v38 removeDownloadedMediaForVideoManagedObjects:v39 markAsDeleted:0 invalidateImmediately:1];
  }
  if ([v2 count]) {
    [WeakRetained _fetchNewKeysForVideosWithBrokenKeys:v2];
  }
  (*(void (**)(void))(v67[6] + 16))();
  id v40 = [WeakRetained contentKeySessions];
  [v40 removeAllObjects];

  uint64_t v41 = [WeakRetained keyLoaders];
  [v41 removeAllObjects];

  uint64_t v42 = [WeakRetained keyRenewalTimer];

  if (v42)
  {
    uint64_t v43 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v43, OS_LOG_TYPE_DEFAULT, "Invalidating key renewal timer", buf, 2u);
    }
    id v44 = [WeakRetained keyRenewalTimer];
    [v44 invalidate];

    [WeakRetained setKeyRenewalTimer:0];
  }
  (*(void (**)(void))(v67[7] + 16))();
  id v45 = 0;
  int v46 = (*(uint64_t (**)(void))(v67[8] + 16))();
  id v47 = 0;
  id v48 = 0;
  id v49 = sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v83 = (uint64_t)v47;
    _os_log_impl(&dword_1E2BD7000, v49, OS_LOG_TYPE_DEFAULT, "Earliest unexpired renewal date is %@", buf, 0xCu);
  }
  id v50 = sLogObject_22;
  if (v46)
  {
    if (v48)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v50, OS_LOG_TYPE_DEFAULT, "Renewal date for one or more downloads is in the past after attempting renewal.  Will try again after renewal interval", buf, 2u);
      }
      uint64_t v51 = [MEMORY[0x1E4F1C9C8] date];
      [v48 doubleValue];
      uint64_t v52 = objc_msgSend(v51, "dateByAddingTimeInterval:");

      if (!v52) {
        goto LABEL_73;
      }
LABEL_65:
      id v54 = sLogObject_22;
      if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v83 = (uint64_t)v52;
        _os_log_impl(&dword_1E2BD7000, v54, OS_LOG_TYPE_DEFAULT, "Scheduling renewal timer for %@", buf, 0xCu);
      }
      id v55 = (void *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v52 interval:WeakRetained target:sel__renewalTimerDidFire_ selector:0 userInfo:0 repeats:0.0];
      [WeakRetained setKeyRenewalTimer:v55];
      id v56 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v56 addTimer:v55 forMode:*MEMORY[0x1E4F1C3A0]];

      goto LABEL_73;
    }
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_ERROR)) {
      __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_99_cold_1(v50);
    }
LABEL_72:
    uint64_t v52 = 0;
    goto LABEL_73;
  }
  BOOL v53 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
  if (!v47)
  {
    if (v53)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v50, OS_LOG_TYPE_DEFAULT, "Earliest unexpired renewal is nil. Not performing or scheduling renewals", buf, 2u);
    }
    goto LABEL_72;
  }
  if (v53)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v50, OS_LOG_TYPE_DEFAULT, "Renewal date for one or more downloads is in the future", buf, 2u);
  }
  uint64_t v52 = [v47 dateByAddingTimeInterval:5.0];
  if (v52) {
    goto LABEL_65;
  }
LABEL_73:
  uint64_t v57 = [WeakRetained backgroundTaskIdentifier];
  uint64_t v58 = *MEMORY[0x1E4FB2748];
  if (v57 != *MEMORY[0x1E4FB2748])
  {
    id v59 = (void *)sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      id v60 = v59;
      uint64_t v61 = [WeakRetained backgroundTaskIdentifier];
      *(_DWORD *)buf = 134217984;
      uint64_t v83 = v61;
      _os_log_impl(&dword_1E2BD7000, v60, OS_LOG_TYPE_DEFAULT, "Ending background task with identifier %lu", buf, 0xCu);
    }
    long long v62 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v62, "endBackgroundTask:", objc_msgSend(WeakRetained, "backgroundTaskIdentifier"));

    [WeakRetained setBackgroundTaskIdentifier:v58];
  }
  long long v63 = [WeakRetained stateMachine];
  long long v64 = v63;
  if (v4) {
    long long v65 = @"Network error did occur";
  }
  else {
    long long v65 = @"Renewal did finish";
  }
  [v63 postEvent:v65];
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_110(uint64_t a1)
{
  id v1 = (void **)(a1 + 32);
  uint64_t result = [*(id *)(a1 + 32) backgroundTaskIdentifier];
  uint64_t v3 = *MEMORY[0x1E4FB2748];
  if (result != *MEMORY[0x1E4FB2748])
  {
    uint64_t v4 = (void *)sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_ERROR)) {
      __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_110_cold_1(v1, v4);
    }
    uint64_t v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v5, "endBackgroundTask:", objc_msgSend(*v1, "backgroundTaskIdentifier"));

    return [*v1 setBackgroundTaskIdentifier:v3];
  }
  return result;
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

__CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_113(uint64_t a1, void *a2)
{
  id v2 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_2_116;
  v5[3] = &unk_1E6DF3D58;
  id v6 = v2;
  id v3 = v2;
  [v3 executeBlockAfterCurrentStateTransition:v5];

  return @"Idle";
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_2_116(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Update requested"];
}

__CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_3_117()
{
  return @"Renewal in progress update when done";
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_4_120(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

__CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_5()
{
  return @"Idle";
}

__CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_7;
  v5[3] = &unk_1E6DF3D58;
  id v6 = v2;
  id v3 = v2;
  [v3 executeBlockAfterCurrentStateTransition:v5];

  return @"Idle";
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Update requested"];
}

id __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  uint64_t v5 = [v4 currentState];

  return v5;
}

__CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_10;
  v5[3] = &unk_1E6DF3D58;
  id v6 = v2;
  id v3 = v2;
  [v3 executeBlockAfterCurrentStateTransition:v5];

  return @"Idle";
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Update requested"];
}

__CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_11()
{
  return @"Waiting for network reachability to check for renewals";
}

__CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 currentState];
  id v4 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v5 = [v4 isNetworkReachable];

  if (v5)
  {

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_13;
    v7[3] = &unk_1E6DF3D58;
    id v8 = v2;
    [v8 executeBlockAfterCurrentStateTransition:v7];

    id v3 = @"Idle";
  }

  return v3;
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Update requested"];
}

id __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[VUIPlaybackManager sharedInstance];
  char v5 = [v4 isPlaybackUIBeingShown];

  if ((v5 & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  id v6 = [v3 currentState];

  return v6;
}

__CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained keyRenewalTimer];

  if (v2)
  {
    id v3 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating key renewal timer.  Will recreate if necessary when app enters foreground", buf, 2u);
    }
    id v4 = [WeakRetained keyRenewalTimer];
    [v4 invalidate];

    [WeakRetained setKeyRenewalTimer:0];
  }
  char v5 = [WeakRetained expirationTimer];

  if (v5)
  {
    id v6 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating expiration timer.  Will recreate if necessary when app enters foreground", v9, 2u);
    }
    uint64_t v7 = [WeakRetained expirationTimer];
    [v7 invalidate];

    [WeakRetained setExpirationTimer:0];
  }

  return @"Idle";
}

id __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_133(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_2_136;
  v6[3] = &unk_1E6DF3D58;
  id v7 = v2;
  id v3 = v2;
  [v3 executeBlockAfterCurrentStateTransition:v6];
  id v4 = [v3 currentState];

  return v4;
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_2_136(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Update requested"];
}

- (void)setStateMachine:(id)a3
{
}

- (NSMutableDictionary)keyLoaders
{
  return self->_keyLoaders;
}

- (void)setKeyLoaders:(id)a3
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

- (void)setKeyRenewalTimer:(id)a3
{
}

- (void)setExpirationTimer:(id)a3
{
}

- (NSMutableDictionary)contentKeySessions
{
  return self->_contentKeySessions;
}

- (void)setContentKeySessions:(id)a3
{
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (NSMutableArray)downloadsForRepairingKeys
{
  return self->_downloadsForRepairingKeys;
}

- (void)setDownloadsForRepairingKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsForRepairingKeys, 0);
  objc_storeStrong((id *)&self->_contentKeySessions, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_keyRenewalTimer, 0);
  objc_storeStrong((id *)&self->_keyLoaders, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_99_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Renewal date for one or more downloads is in the past after attempting renewal, but no renewal interval exists for any key.  Not setting renewal timer", v1, 2u);
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_105_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Unable to begin background task since identifier is UIBackgroundTaskInvalid", v1, 2u);
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_110_cold_1(void **a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = *a1;
  id v3 = a2;
  int v4 = 134217984;
  uint64_t v5 = [v2 backgroundTaskIdentifier];
  _os_log_error_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_ERROR, "VUIOfflineKeyRenewalManager with task identifier %lu expired.  Ending background task", (uint8_t *)&v4, 0xCu);
}

@end