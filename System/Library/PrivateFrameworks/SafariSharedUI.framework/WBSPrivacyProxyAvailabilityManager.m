@interface WBSPrivacyProxyAvailabilityManager
+ (WBSPrivacyProxyAvailabilityManager)sharedManager;
+ (void)openPrivateRelayICloudSettings;
- (BOOL)_isPrivacyProxyActiveForInterface:(id)a3 networkStatuses:(id)a4;
- (BOOL)initialized;
- (BOOL)isPrivacyProxyActive;
- (BOOL)isPrivacyProxyFreeTierAvailable;
- (BOOL)isPrivacyProxyOnForEitherTier;
- (BOOL)isPrivacyProxyOnInICloudSettings;
- (BOOL)isPrivacyProxyPaidTierUnavailableInUserCountry;
- (BOOL)isPrivacyProxyRestrictedToTrackersByUser;
- (BOOL)isPrivacyProxyRoutingUnencryptedTrafficInEnhancedPrivacyMode;
- (BOOL)isPrivacyProxySetToTrackersAndWebsites;
- (BOOL)isUserAccountInSubscriberTierForPrivacyProxy;
- (BOOL)shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy;
- (BOOL)shouldPromptUsersToTurnOnPrivateRelayForSafari;
- (WBSPrivacyProxyAvailabilityManager)init;
- (unint64_t)state;
- (void)_registerForDefaultNetworkInterfaceChangeNotifications;
- (void)_registerForPrivacyProxyChangeNotifications;
- (void)_updatePrivacyProxyStateWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setInitialized:(BOOL)a3;
- (void)setPrivacyProxyEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setPrivacyProxyState:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation WBSPrivacyProxyAvailabilityManager

- (BOOL)isPrivacyProxyActive
{
  if (![(WBSPrivacyProxyAvailabilityManager *)self isPrivacyProxyFreeTierAvailable]) {
    return 0;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_isPrivacyProxyActiveOnDefaultNetwork && self->_privacyProxyServiceStatus == 1;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isPrivacyProxyFreeTierAvailable
{
  return 1;
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t privacyProxyTrafficBitfield = self->_privacyProxyTrafficBitfield;
  BOOL isPrivacyProxyOnInICloudSettings = self->_isPrivacyProxyOnInICloudSettings;
  os_unfair_lock_unlock(p_lock);
  if ((privacyProxyTrafficBitfield & 8) == 0 || !isPrivacyProxyOnInICloudSettings) {
    return (privacyProxyTrafficBitfield >> 2) & 1;
  }
  else {
    return 2;
  }
}

+ (WBSPrivacyProxyAvailabilityManager)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WBSPrivacyProxyAvailabilityManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  v2 = (void *)sharedManager_manager_0;
  return (WBSPrivacyProxyAvailabilityManager *)v2;
}

void __51__WBSPrivacyProxyAvailabilityManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = (uint64_t)v1;
}

uint64_t __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_35(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"WBSPrivacyProxyChangeNotification" object:*(void *)(a1 + 32)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_33(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
  v3 = [v2 path];
  BOOL v4 = [v3 interface];

  v5 = (void *)MEMORY[0x1E4F98750];
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _isPrivacyProxyActiveForInterface:v4 networkStatuses:*(void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 40)];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(v6, "safari_BOOLForKey:defaultValue:", *v5, 1);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  int v7 = [*(id *)(a1 + 32) initialized];
  int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  BOOL v10 = !v7
     || v8 != *(unsigned __int8 *)(v9 + 33)
     || *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != *(unsigned __int8 *)(v9 + 32)
     || *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) != *(void *)(v9 + 40)
     || *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) != *(void *)(v9 + 48)
     || *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) != *(void *)(v9 + 56)
     || *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != *(unsigned __int8 *)(v9 + 64);
  *(unsigned char *)(v9 + 33) = v8;
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  *(void *)(*(void *)(a1 + 32) + 48) = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  *(void *)(*(void *)(a1 + 32) + 56) = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v11 setBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) forKey:*MEMORY[0x1E4F98768]];

  v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v12 setBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) forKey:*MEMORY[0x1E4F98760]];

  v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v13 setInteger:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) forKey:*MEMORY[0x1E4F98770]];

  v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v14 setInteger:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) forKey:*MEMORY[0x1E4F98748]];

  v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v15 setInteger:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) forKey:*MEMORY[0x1E4F98758]];

  v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v16 setBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) forKey:*v5];

  [*(id *)(a1 + 32) setInitialized:1];
  v17 = *(id *)(a1 + 40);
  v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 112);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1ABB70000, v18, OS_SIGNPOST_INTERVAL_END, v19, "Update iCloud Private Relay State", "", buf, 2u);
  }

  v20 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(v21 + 40);
    LODWORD(v21) = *(unsigned __int8 *)(v21 + 32);
    *(_DWORD *)buf = 134218240;
    uint64_t v27 = v22;
    __int16 v28 = 1024;
    int v29 = v21;
    _os_log_impl(&dword_1ABB70000, v20, OS_LOG_TYPE_INFO, "Traffic state has changed: 0x%llx, Subscriber tier has changed: %i", buf, 0x12u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_35;
  block[3] = &unk_1E5E411D8;
  BOOL v25 = v10;
  block[4] = *(void *)(a1 + 32);
  id v24 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (WBSPrivacyProxyAvailabilityManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)WBSPrivacyProxyAvailabilityManager;
  v2 = [(WBSPrivacyProxyAvailabilityManager *)&v25 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSPrivacyProxyAvailabilityManager.%@.%p.internalQueue", objc_opt_class(), v2];
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v5;

    id v7 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSPrivacyProxyAvailabilityManager.%@.%p.notificationQueue", objc_opt_class(), v3];
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], 0);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v8;

    BOOL v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v3->_BOOL isPrivacyProxyOnInICloudSettings = [v10 BOOLForKey:*MEMORY[0x1E4F98760]];

    v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v3->_isPrivacyProxyPaidTierUnavailableInUserCountry = [v11 BOOLForKey:*MEMORY[0x1E4F98768]];

    v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v13 = objc_msgSend(v12, "safari_numberForKey:", *MEMORY[0x1E4F98770]);
    v3->_unint64_t privacyProxyTrafficBitfield = [v13 unsignedLongLongValue];

    v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v15 = objc_msgSend(v14, "safari_numberForKey:", *MEMORY[0x1E4F98748]);
    v3->_privacyProxyAccountType = [v15 unsignedLongLongValue];

    v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v17 = objc_msgSend(v16, "safari_numberForKey:", *MEMORY[0x1E4F98758]);
    v3->_privacyProxyServiceStatus = [v17 unsignedLongLongValue];

    v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v3->_isPrivacyProxyActiveOnDefaultNetwork = [v18 BOOLForKey:*MEMORY[0x1E4F98750]];

    os_signpost_id_t v19 = v3->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke;
    block[3] = &unk_1E5E40968;
    v20 = v3;
    id v24 = v20;
    dispatch_async(v19, block);
    uint64_t v21 = v20;
  }
  return v3;
}

- (BOOL)_isPrivacyProxyActiveForInterface:(id)a3 networkStatuses:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 type] == 4 || !objc_msgSend(v5, "type"))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          int v12 = objc_msgSend(v11, "networkType", (void)v17);
          if (v12 == 3)
          {
            if ([v5 type] == 3)
            {
              v13 = [v5 interfaceName];
              v14 = [v11 networkName];
              char v15 = [v13 isEqualToString:v14];

              if (v15)
              {
LABEL_21:
                LOBYTE(v8) = [v11 networkStatus] == 1;
                goto LABEL_22;
              }
            }
          }
          else if (v12 == 2)
          {
            if ([v5 type] == 2) {
              goto LABEL_21;
            }
          }
          else if (v12 == 1 && [v5 type] == 1)
          {
            goto LABEL_21;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  return v8;
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_31_cold_1(v7);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 serviceStatus];
    uint64_t v8 = [v5 networkStatuses];
    uint64_t v9 = [v8 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke_2;
  v2[3] = &unk_1E5E40968;
  id v3 = v1;
  [v3 _updatePrivacyProxyStateWithCompletionHandler:v2];
}

- (void)_updatePrivacyProxyStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  id v6 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1ABB70000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Update iCloud Private Relay State", "", buf, 2u);
  }

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke;
  activity_block[3] = &unk_1E5E43D70;
  v14 = v9;
  dispatch_group_t v15 = v5;
  id v17 = v4;
  os_signpost_id_t v18 = v7;
  v16 = self;
  id v10 = v4;
  v11 = v5;
  int v12 = v9;
  _os_activity_initiate(&dword_1ABB70000, "Update iCloud Private Relay State", OS_ACTIVITY_FLAG_DETACHED, activity_block);
}

uint64_t __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke_2_cold_1(v2);
  }
  [*(id *)(a1 + 32) _registerForPrivacyProxyChangeNotifications];
  return [*(id *)(a1 + 32) _registerForDefaultNetworkInterfaceChangeNotifications];
}

- (void)_registerForPrivacyProxyChangeNotifications
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Failed to listen to privacy proxy configuration change notification: %i", (uint8_t *)v2, 8u);
}

- (void)_registerForDefaultNetworkInterfaceChangeNotifications
{
  id v3 = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
  [v3 addObserver:self forKeyPath:@"path" options:7 context:0];
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1ABB70000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Query iCloud Feature Availability", "", buf, 2u);
  }

  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  char v63 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  char v61 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v58[3] = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  v57[3] = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  char v56 = 0;
  *(void *)buf = 0;
  v50 = buf;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__18;
  v53 = __Block_byref_object_dispose__18;
  id v54 = 0;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  dispatch_group_t v5 = [MEMORY[0x1E4F982C8] porcupineAvailabilityObserver];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_23;
  v44[3] = &unk_1E5E43CD0;
  v47 = v62;
  id v45 = *(id *)(a1 + 40);
  id v46 = *(id *)(a1 + 32);
  os_signpost_id_t v48 = v2;
  [v5 getFeatureEligibilityWithCompletionHandler:v44];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  id PrivacyProxyClientClass = getPrivacyProxyClientClass();
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 24);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_25;
  v41[3] = &unk_1E5E43CF8;
  id v42 = *(id *)(a1 + 40);
  v43 = v60;
  [PrivacyProxyClientClass getUserTier:v7 completionHandler:v41];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  id v8 = getPrivacyProxyClientClass();
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 24);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_27;
  v38[3] = &unk_1E5E43CF8;
  id v39 = *(id *)(a1 + 40);
  v40 = v59;
  [v8 getTrafficState:v9 completionandler:v38];
  getPrivacyProxyClientClass();
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    id v10 = getPrivacyProxyClientClass();
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 24);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_30;
    v35[3] = &unk_1E5E43CF8;
    id v36 = *(id *)(a1 + 40);
    v37 = v58;
    [v10 getPrivacyProxyAccountType:v11 completionHandler:v35];
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  id v12 = getPrivacyProxyClientClass();
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 24);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_31;
  v31[3] = &unk_1E5E43D20;
  id v32 = *(id *)(a1 + 40);
  v33 = v57;
  v34 = buf;
  [v12 getServiceStatus:v13 completionHandler:v31];
  dispatch_group_t v15 = *(NSObject **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  v16 = *(NSObject **)(v14 + 16);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_33;
  v20[3] = &unk_1E5E43D48;
  v23 = v55;
  id v24 = buf;
  v20[4] = v14;
  objc_super v25 = v62;
  v26 = v60;
  uint64_t v27 = v59;
  __int16 v28 = v58;
  int v29 = v57;
  id v17 = *(id *)(a1 + 32);
  long long v19 = *(void **)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 64);
  id v21 = v17;
  uint64_t v30 = v18;
  id v22 = v19;
  dispatch_group_notify(v15, v16, v20);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_30_cold_1(v6);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_27_cold_1(v6);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_25_cold_1(v6);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_23(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 ^ 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v3 = *(id *)(a1 + 40);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1ABB70000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Query iCloud Feature Availability", "", v6, 2u);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7 = *MEMORY[0x1E4F284C8];
  id v8 = a5;
  id v10 = [v8 objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v10 isEqualToPath:v9] & 1) == 0) {
      [(WBSPrivacyProxyAvailabilityManager *)self _updatePrivacyProxyStateWithCompletionHandler:0];
    }
  }
}

- (void)dealloc
{
  notify_cancel(self->_privacyProxyConfigurationChangeNotificationToken);
  notify_cancel(self->_privacyProxyServiceStatusChangeNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)WBSPrivacyProxyAvailabilityManager;
  [(WBSPrivacyProxyAvailabilityManager *)&v3 dealloc];
}

- (BOOL)isPrivacyProxyOnForEitherTier
{
  return [(WBSPrivacyProxyAvailabilityManager *)self state] != 0;
}

- (BOOL)isPrivacyProxyOnInICloudSettings
{
  os_signpost_id_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isPrivacyProxyOnInICloudSettings;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUserAccountInSubscriberTierForPrivacyProxy
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t privacyProxyAccountType = self->_privacyProxyAccountType;
  os_unfair_lock_unlock(p_lock);
  return privacyProxyAccountType == 2;
}

- (BOOL)isPrivacyProxyRestrictedToTrackersByUser
{
  BOOL v3 = [(WBSPrivacyProxyAvailabilityManager *)self isPrivacyProxyOnInICloudSettings];
  if (v3) {
    LOBYTE(v3) = [(WBSPrivacyProxyAvailabilityManager *)self state] == 1;
  }
  return v3;
}

- (BOOL)isPrivacyProxySetToTrackersAndWebsites
{
  BOOL v3 = [(WBSPrivacyProxyAvailabilityManager *)self isPrivacyProxyOnInICloudSettings];
  if (v3) {
    LOBYTE(v3) = [(WBSPrivacyProxyAvailabilityManager *)self state] == 2;
  }
  return v3;
}

- (BOOL)isPrivacyProxyPaidTierUnavailableInUserCountry
{
  os_signpost_id_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isPrivacyProxyPaidTierUnavailableInUserCountry;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)shouldPromptUsersToTurnOnPrivateRelayForSafari
{
  if ([(WBSPrivacyProxyAvailabilityManager *)self isPrivacyProxyPaidTierUnavailableInUserCountry])
  {
    return 0;
  }
  if ([(WBSPrivacyProxyAvailabilityManager *)self isPrivacyProxyOnInICloudSettings]) {
    return [(WBSPrivacyProxyAvailabilityManager *)self state] != 2;
  }
  return [(WBSPrivacyProxyAvailabilityManager *)self isUserAccountInSubscriberTierForPrivacyProxy];
}

- (BOOL)shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy
{
  return ![(WBSPrivacyProxyAvailabilityManager *)self isPrivacyProxyPaidTierUnavailableInUserCountry];
}

- (BOOL)isPrivacyProxyRoutingUnencryptedTrafficInEnhancedPrivacyMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t privacyProxyTrafficBitfield = self->_privacyProxyTrafficBitfield;
  os_unfair_lock_unlock(p_lock);
  return (privacyProxyTrafficBitfield >> 18) & 1;
}

- (void)setPrivacyProxyEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  BOOL v6 = [(WBSPrivacyProxyAvailabilityManager *)self isUserAccountInSubscriberTierForPrivacyProxy];
  uint64_t v7 = 2;
  if (!v4) {
    uint64_t v7 = 0;
  }
  if (v6) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v4;
  }
  [(WBSPrivacyProxyAvailabilityManager *)self setPrivacyProxyState:v8 completionHandler:v9];
}

- (void)setPrivacyProxyState:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke;
  block[3] = &unk_1E5E43CA8;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 40);
  uint64_t v4 = *(void *)(v2 + 48);
  int v5 = *(unsigned __int8 *)(v2 + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  uint64_t v6 = *(void *)(a1 + 48);
  unint64_t v7 = v3 & 0xFFFFFFFFFFFFFFF3;
  if (v6) {
    unint64_t v7 = v3;
  }
  if (v6 == 1) {
    unint64_t v7 = v3 & 0xFFFFFFFFFFFFFFF3 | 4;
  }
  if (v6 == 2) {
    uint64_t v8 = v3 | 0xC;
  }
  else {
    uint64_t v8 = v7;
  }
  if (v5) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v4 == 2;
  }
  int v11 = v9 && v6 == 2;
  if (v3 != v8 || (v11 & 1) != 0)
  {
    uint64_t v13 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v8;
      _os_log_impl(&dword_1ABB70000, v13, OS_LOG_TYPE_DEFAULT, "Changing state to 0x%llx", buf, 0xCu);
    }
    uint64_t v14 = dispatch_group_create();
    dispatch_group_t v15 = v14;
    if (v11)
    {
      dispatch_group_enter(v14);
      id PrivacyProxyClientClass = getPrivacyProxyClientClass();
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 24);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_17;
      v29[3] = &unk_1E5E43C58;
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v30 = v18;
      uint64_t v31 = v19;
      [PrivacyProxyClientClass setUserTier:2 queue:v17 completionHandler:v29];
    }
    dispatch_group_enter(v15);
    id v20 = getPrivacyProxyClientClass();
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 24);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_19;
    v24[3] = &unk_1E5E43C80;
    objc_super v25 = v15;
    id v22 = *(id *)(a1 + 40);
    uint64_t v26 = *(void *)(a1 + 32);
    id v27 = v22;
    uint64_t v28 = v8;
    v23 = v15;
    [v20 setTrafficState:3932191 proxyTraffic:v8 queue:v21 completionHandler:v24];
    dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    if (*(void *)(a1 + 40))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_2;
      block[3] = &unk_1E5E41548;
      id v33 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    id v12 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_cold_1(v12);
    }
  }
}

uint64_t __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_17_cold_1(v4);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    *(unsigned char *)(*(void *)(a1 + 40) + 32) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_19_cold_1(v4);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    *(void *)(*(void *)(a1 + 40) + 40) = *(void *)(a1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_20;
    v7[3] = &unk_1E5E420C8;
    uint64_t v6 = *(void **)(a1 + 48);
    v7[4] = *(void *)(a1 + 40);
    id v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"WBSPrivacyProxyChangeNotification" object:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __81__WBSPrivacyProxyAvailabilityManager__registerForPrivacyProxyChangeNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_INFO, "Received configuration changed notification", v4, 2u);
  }
  return [*(id *)(a1 + 32) _updatePrivacyProxyStateWithCompletionHandler:0];
}

uint64_t __81__WBSPrivacyProxyAvailabilityManager__registerForPrivacyProxyChangeNotifications__block_invoke_43(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_INFO, "Received service status changed notification", v4, 2u);
  }
  return [*(id *)(a1 + 32) _updatePrivacyProxyStateWithCompletionHandler:0];
}

+ (void)openPrivateRelayICloudSettings
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/INTERNET_PRIVACY&learnMore=true"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "Initial update state has completed", v1, 2u);
}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "State hasn't changed", v1, 2u);
}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_17_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Failed to set user privacy proxy tier to Subscriber: %{public}@", v6, v7, v8, v9, v10);
}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_19_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Failed to change privacy proxy state: %{public}@", v6, v7, v8, v9, v10);
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_25_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Failed to query privacy proxy tier: %{public}@", v6, v7, v8, v9, v10);
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_27_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Failed to query privacy proxy state: %{public}@", v6, v7, v8, v9, v10);
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_30_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Failed to query privacy proxy account type: %{public}@", v6, v7, v8, v9, v10);
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_31_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Failed to query privacy proxy service status: %{public}@", v6, v7, v8, v9, v10);
}

@end