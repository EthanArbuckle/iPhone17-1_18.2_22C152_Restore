@interface SFAuthenticationManager
- (BOOL)checkDynamicStoreForType:(unint64_t)a3;
- (BOOL)declinedToEnableForType:(unint64_t)a3;
- (BOOL)isEnabledForType:(unint64_t)a3;
- (BOOL)isSupportedForType:(unint64_t)a3;
- (BOOL)osFeatureEnabledForType:(unint64_t)a3;
- (NSUUID)latestAuthenticationStateChangeObserverIdentifier;
- (OS_dispatch_queue)queue;
- (SFAuthenticationManager)initWithQueue:(id)a3;
- (SFAuthenticationManagerDelegate)delegate;
- (SFAutoUnlockManager)autoUnlockManager;
- (id)authenticateForType:(unint64_t)a3;
- (id)authenticateForType:(unint64_t)a3 withOptions:(id)a4;
- (id)canAuthenticateForType:(unint64_t)a3 withDevice:(id)a4;
- (id)canAuthenticateForType:(unint64_t)a3 withIDSDeviceID:(id)a4;
- (id)disableForType:(unint64_t)a3 device:(id)a4;
- (id)disableForType:(unint64_t)a3 withIDSDeviceID:(id)a4;
- (id)dynamicStorePathForType:(unint64_t)a3;
- (id)enableForType:(unint64_t)a3 device:(id)a4 passcode:(id)a5;
- (id)enableForType:(unint64_t)a3 withIDSDeviceID:(id)a4 passcode:(id)a5;
- (id)requestEnablementForType:(unint64_t)a3 withDevice:(id)a4;
- (id)requestEnablementForType:(unint64_t)a3 withIDSDeviceID:(id)a4;
- (void)cancelAuthenticationSessionWithID:(id)a3;
- (void)completedAuthenticationSessionWithID:(id)a3;
- (void)disabledAuthenticationSessionWithID:(id)a3;
- (void)enabledAuthenticationSessionWithID:(id)a3;
- (void)failedAuthenticationSessionWithID:(id)a3 error:(id)a4;
- (void)failedToDisableDeviceForSessionID:(id)a3 error:(id)a4;
- (void)failedToEnableDeviceForSessionID:(id)a3 error:(id)a4;
- (void)listCandidateDevicesForType:(unint64_t)a3 completionHandler:(id)a4;
- (void)listEligibleDevicesForType:(unint64_t)a3 completionHandler:(id)a4;
- (void)manager:(id)a3 beganAttemptWithDevice:(id)a4;
- (void)manager:(id)a3 completedUnlockWithDevice:(id)a4;
- (void)manager:(id)a3 failedAttemptWithError:(id)a4;
- (void)receivedApproveRequestForSessionID:(id)a3 info:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLatestAuthenticationStateChangeObserverIdentifier:(id)a3;
- (void)startObservingForAuthenticationStateChanges:(id)a3 queue:(id)a4;
- (void)startedAuthenticationSessionWithID:(id)a3;
- (void)stopObservingForAuthenticationStateChanges;
- (void)waitForApprovalRequestsForType:(unint64_t)a3;
@end

@implementation SFAuthenticationManager

- (SFAuthenticationManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAuthenticationManager;
  v6 = [(SFAuthenticationManager *)&v10 init];
  objc_storeStrong((id *)&v6->_queue, a3);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v7 = objc_alloc_init(SFAutoUnlockManager);
    autoUnlockManager = v6->_autoUnlockManager;
    v6->_autoUnlockManager = v7;

    [(SFAutoUnlockManager *)v6->_autoUnlockManager setDelegate:v6];
  }

  return v6;
}

- (BOOL)isEnabledForType:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  dispatch_semaphore_t v21 = 0;
  BOOL v5 = 0;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  switch(a3)
  {
    case 1uLL:
      if (!SFDeviceSupportsSiriWatchAuth()) {
        goto LABEL_20;
      }
      BOOL v10 = +[SFAutoUnlockManager autoUnlockEnabled];
      goto LABEL_16;
    case 2uLL:
      BOOL v10 = [(SFAuthenticationManager *)self isSupportedForType:2];
      goto LABEL_16;
    case 3uLL:
    case 4uLL:
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        v11 = authentications_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "feature flag is disabled", buf, 2u);
        }
        goto LABEL_19;
      }
      BOOL v10 = [(SFAuthenticationManager *)self checkDynamicStoreForType:a3];
LABEL_16:
      BOOL v5 = v10;
      goto LABEL_21;
    case 5uLL:
    case 6uLL:
    case 7uLL:
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        v11 = authentications_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "feature flag is disabled", buf, 2u);
        }
LABEL_19:

        goto LABEL_20;
      }
      v6 = +[SFCompanionXPCManager sharedManager];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __44__SFAuthenticationManager_isEnabledForType___block_invoke;
      v15[3] = &unk_1E5BBE700;
      v15[4] = &v22;
      v15[5] = &v16;
      v15[6] = a3;
      [v6 unlockManagerWithCompletionHandler:v15];

      v7 = v17[5];
      dispatch_time_t v8 = dispatch_time(0, 3000000000);
      if (dispatch_semaphore_wait(v7, v8))
      {
        v9 = authentications_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[SFAuthenticationManager isEnabledForType:]();
        }

LABEL_20:
        BOOL v5 = 0;
        goto LABEL_21;
      }
      v13 = authentications_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (*((unsigned char *)v23 + 24)) {
          v14 = "yes";
        }
        else {
          v14 = "no";
        }
        *(_DWORD *)buf = 136315138;
        v27 = v14;
        _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "Returning Oneness enabled: %s", buf, 0xCu);
      }

      BOOL v5 = *((unsigned char *)v23 + 24) != 0;
LABEL_21:
      _Block_object_dispose(&v16, 8);

      _Block_object_dispose(&v22, 8);
      return v5;
    case 9uLL:
    case 0xBuLL:
      BOOL v10 = [(SFAuthenticationManager *)self isSupportedForType:a3];
      goto LABEL_16;
    default:
      goto LABEL_21;
  }
}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_23];
    v4 = authentications_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_2();
    }

    uint64_t v5 = *(void *)(a1 + 48);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__SFAuthenticationManager_isEnabledForType___block_invoke_384;
    v7[3] = &unk_1E5BBE6D8;
    long long v8 = *(_OWORD *)(a1 + 32);
    [v3 listEligibleDevicesForAuthenticationType:v5 completionHandler:v7];
  }
  else
  {
    v6 = authentications_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke_384(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = authentications_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "Got Devices, Checking to see if any are enabled", buf, 2u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (SFDeviceClassCodeGet() == 5 && (objc_msgSend(v10, "canUnlockDevice", (void)v12) & 1) != 0
          || SFDeviceClassCodeGet() == 1 && [v10 unlockEnabled])
        {
          v11 = authentications_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v10;
            _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "Found device that is eligible for Oneness, returning true, device: %@", buf, 0xCu);
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

          goto LABEL_18;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
LABEL_18:
}

- (id)dynamicStorePathForType:(unint64_t)a3
{
  if (a3 - 3 > 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = @"com.apple.sharing:/Authentications/BioArm/Enabled";
  }
  return v4;
}

- (BOOL)checkDynamicStoreForType:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SFAuthenticationManager *)self dynamicStorePathForType:a3];
  if (!v3)
  {
LABEL_12:
    LOBYTE(v12) = 0;
    goto LABEL_13;
  }
  v4 = (__CFString *)SCDynamicStoreCopyValue(0, v3);
  id v5 = v4;
  if (!v4 || (CFTypeID v6 = CFGetTypeID(v4), v6 != CFDictionaryGetTypeID()))
  {
    long long v13 = authentications_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "No value at path: %@", buf, 0xCu);
    }

    if (v5) {
      CFRelease(v5);
    }
    goto LABEL_12;
  }
  uint64_t v7 = authentications_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic store enabled state %@", buf, 0xCu);
  }

  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", getuid());
  uint64_t v9 = [(__CFString *)v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v11 = [(__CFString *)v5 objectForKeyedSubscript:v8];
    int v12 = [v11 BOOLValue];
  }
  else
  {
    int v12 = 0;
  }
  long long v15 = authentications_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 1024;
    int v21 = v12;
    _os_log_debug_impl(&dword_1A5389000, v15, OS_LOG_TYPE_DEBUG, "Dynamic store path: %@, uid: %@, enabled: %d", buf, 0x1Cu);
  }

LABEL_13:
  return v12;
}

- (BOOL)isSupportedForType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      BOOL result = SFDeviceSupportsSiriWatchAuth();
      break;
    case 2uLL:
      BOOL result = SFDeviceSupportsNanoWallet();
      break;
    case 3uLL:
    case 4uLL:
      BOOL result = SFDeviceSupportsUnlockClassC();
      break;
    case 5uLL:
    case 6uLL:
    case 7uLL:
      BOOL result = SFDeviceSupportsMacUnlockPhonePairing();
      break;
    case 9uLL:
    case 0xBuLL:
      BOOL result = SFDeviceSupportsGuestModeUnlockPairing();
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)listEligibleDevicesForType:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = authentications_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = SFAuthenticationTypeToString(a3);
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "List eligible devices for %@", buf, 0xCu);
  }
  if (v6)
  {
    if ([(SFAuthenticationManager *)self isSupportedForType:a3])
    {
      uint64_t v9 = +[SFCompanionXPCManager sharedManager];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __72__SFAuthenticationManager_listEligibleDevicesForType_completionHandler___block_invoke;
      v13[3] = &unk_1E5BBE750;
      unint64_t v15 = a3;
      long long v14 = v6;
      [v9 unlockManagerWithCompletionHandler:v13];

      BOOL v10 = v14;
    }
    else
    {
      v11 = authentications_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SFAuthenticationManager listEligibleDevicesForType:completionHandler:](a3);
      }

      BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:SFKAuthenticationErrorDomain code:19 userInfo:0];
      int v12 = [MEMORY[0x1E4F1CAD0] set];
      (*((void (**)(id, void *, NSObject *))v6 + 2))(v6, v12, v10);
    }
  }
  else
  {
    BOOL v10 = authentications_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SFAuthenticationManager listEligibleDevicesForType:completionHandler:]();
    }
  }
}

void __72__SFAuthenticationManager_listEligibleDevicesForType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_396];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __72__SFAuthenticationManager_listEligibleDevicesForType_completionHandler___block_invoke_397;
    v5[3] = &unk_1E5BBE728;
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    [v3 listEligibleDevicesForAuthenticationType:v4 completionHandler:v5];
  }
  else
  {
    uint64_t v3 = authentications_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }
  }
}

void __72__SFAuthenticationManager_listEligibleDevicesForType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

uint64_t __72__SFAuthenticationManager_listEligibleDevicesForType_completionHandler___block_invoke_397(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)listCandidateDevicesForType:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = authentications_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = SFAuthenticationTypeToString(a3);
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "List candidate devices for %@", buf, 0xCu);
  }
  if (v6)
  {
    if ([(SFAuthenticationManager *)self isSupportedForType:a3])
    {
      uint64_t v9 = +[SFCompanionXPCManager sharedManager];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __73__SFAuthenticationManager_listCandidateDevicesForType_completionHandler___block_invoke;
      v13[3] = &unk_1E5BBE750;
      unint64_t v15 = a3;
      long long v14 = v6;
      [v9 unlockManagerWithCompletionHandler:v13];

      BOOL v10 = v14;
    }
    else
    {
      v11 = authentications_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SFAuthenticationManager listEligibleDevicesForType:completionHandler:](a3);
      }

      BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:SFKAuthenticationErrorDomain code:19 userInfo:0];
      int v12 = [MEMORY[0x1E4F1CAD0] set];
      (*((void (**)(id, void *, NSObject *))v6 + 2))(v6, v12, v10);
    }
  }
  else
  {
    BOOL v10 = authentications_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SFAuthenticationManager listEligibleDevicesForType:completionHandler:]();
    }
  }
}

void __73__SFAuthenticationManager_listCandidateDevicesForType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_399];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__SFAuthenticationManager_listCandidateDevicesForType_completionHandler___block_invoke_400;
    v5[3] = &unk_1E5BBE728;
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    [v3 listEligibleDevicesForAuthenticationType:v4 completionHandler:v5];
  }
  else
  {
    uint64_t v3 = authentications_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }
  }
}

void __73__SFAuthenticationManager_listCandidateDevicesForType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

void __73__SFAuthenticationManager_listCandidateDevicesForType_completionHandler___block_invoke_400(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        long long v14 = [SFAuthenticationDevice alloc];
        unint64_t v15 = -[SFAuthenticationDevice initWith:](v14, "initWith:", v13, (void)v16);
        [v7 addObject:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)osFeatureEnabledForType:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL result = 1;
  switch(a3)
  {
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      BOOL result = _os_feature_enabled_impl();
      break;
    case 9uLL:
    case 0xBuLL:
      if (_os_feature_enabled_impl())
      {
        BOOL result = 1;
      }
      else
      {
        uint64_t v4 = authentications_log();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v5 = 138412290;
          id v6 = @"DeviceSharing/GuestUserHandover";
          _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "FeatureFlag %@ is not enabled", (uint8_t *)&v5, 0xCu);
        }

        BOOL result = 0;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (id)enableForType:(unint64_t)a3 device:(id)a4 passcode:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a4 uniqueID];
  uint64_t v10 = [(SFAuthenticationManager *)self enableForType:a3 withIDSDeviceID:v9 passcode:v8];

  return v10;
}

- (id)enableForType:(unint64_t)a3 withIDSDeviceID:(id)a4 passcode:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = authentications_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = SFAuthenticationTypeToString(a3);
    *(_DWORD *)buf = 138412546;
    v26 = v11;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "Begin enabling authentication for %@ on %@", buf, 0x16u);
  }
  uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
  if ([(SFAuthenticationManager *)self osFeatureEnabledForType:a3])
  {
    uint64_t v13 = +[SFCompanionXPCManager sharedManager];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__SFAuthenticationManager_enableForType_withIDSDeviceID_passcode___block_invoke;
    v20[3] = &unk_1E5BBE778;
    v20[4] = self;
    unint64_t v24 = a3;
    id v21 = v8;
    id v22 = v9;
    id v14 = v12;
    id v23 = v14;
    [v13 unlockManagerWithCompletionHandler:v20];

    id v15 = v14;
  }
  else
  {
    long long v16 = authentications_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SFAuthenticationManager enableForType:withIDSDeviceID:passcode:]();
    }

    long long v17 = [MEMORY[0x1E4F28C58] errorWithDomain:SFKAuthenticationErrorDomain code:19 userInfo:0];
    [(SFAuthenticationManager *)self failedToEnableDeviceForSessionID:v12 error:v17];
    id v18 = v12;
  }

  return v12;
}

void __66__SFAuthenticationManager_enableForType_withIDSDeviceID_passcode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_411];
    [v6 enableUsingClientProxy:*(void *)(a1 + 32) authenticationType:*(void *)(a1 + 64) device:*(void *)(a1 + 40) passcode:*(void *)(a1 + 48) sessionID:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v7 = authentications_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) failedToEnableDeviceForSessionID:*(void *)(a1 + 56) error:v5];
  }
}

void __66__SFAuthenticationManager_enableForType_withIDSDeviceID_passcode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

- (id)requestEnablementForType:(unint64_t)a3 withDevice:(id)a4
{
  id v6 = [a4 uniqueID];
  uint64_t v7 = [(SFAuthenticationManager *)self requestEnablementForType:a3 withIDSDeviceID:v6];

  return v7;
}

- (id)requestEnablementForType:(unint64_t)a3 withIDSDeviceID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = authentications_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = SFAuthenticationTypeToString(a3);
    *(_DWORD *)buf = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "Begin requesting enablement for %@ on %@", buf, 0x16u);
  }
  id v9 = [MEMORY[0x1E4F29128] UUID];
  if ([(SFAuthenticationManager *)self osFeatureEnabledForType:a3])
  {
    uint64_t v10 = +[SFCompanionXPCManager sharedManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__SFAuthenticationManager_requestEnablementForType_withIDSDeviceID___block_invoke;
    v17[3] = &unk_1E5BBE7A0;
    v17[4] = self;
    unint64_t v20 = a3;
    id v18 = v6;
    id v11 = v9;
    id v19 = v11;
    [v10 unlockManagerWithCompletionHandler:v17];

    id v12 = v11;
  }
  else
  {
    uint64_t v13 = authentications_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SFAuthenticationManager requestEnablementForType:withIDSDeviceID:]();
    }

    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:SFKAuthenticationErrorDomain code:19 userInfo:0];
    [(SFAuthenticationManager *)self failedToEnableDeviceForSessionID:v9 error:v14];
    id v15 = v9;
  }

  return v9;
}

void __68__SFAuthenticationManager_requestEnablementForType_withIDSDeviceID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_413];
    [v6 requestEnablementUsingClientProxy:*(void *)(a1 + 32) authenticationType:*(void *)(a1 + 56) device:*(void *)(a1 + 40) sessionID:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = authentications_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) failedToEnableDeviceForSessionID:*(void *)(a1 + 48) error:v5];
  }
}

void __68__SFAuthenticationManager_requestEnablementForType_withIDSDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

- (id)disableForType:(unint64_t)a3 device:(id)a4
{
  id v6 = [a4 uniqueID];
  uint64_t v7 = [(SFAuthenticationManager *)self disableForType:a3 withIDSDeviceID:v6];

  return v7;
}

- (id)disableForType:(unint64_t)a3 withIDSDeviceID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = authentications_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = SFAuthenticationTypeToString(a3);
    *(_DWORD *)buf = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "Disabling authentication for %@ on %@", buf, 0x16u);
  }
  id v9 = [MEMORY[0x1E4F29128] UUID];
  if ([(SFAuthenticationManager *)self osFeatureEnabledForType:a3])
  {
    uint64_t v10 = +[SFCompanionXPCManager sharedManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__SFAuthenticationManager_disableForType_withIDSDeviceID___block_invoke;
    v17[3] = &unk_1E5BBE7A0;
    v17[4] = self;
    unint64_t v20 = a3;
    id v18 = v6;
    id v11 = v9;
    id v19 = v11;
    [v10 unlockManagerWithCompletionHandler:v17];

    id v12 = v11;
  }
  else
  {
    uint64_t v13 = authentications_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SFAuthenticationManager requestEnablementForType:withIDSDeviceID:]();
    }

    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:SFKAuthenticationErrorDomain code:19 userInfo:0];
    [(SFAuthenticationManager *)self failedAuthenticationSessionWithID:v9 error:v14];
    id v15 = v9;
  }

  return v9;
}

void __58__SFAuthenticationManager_disableForType_withIDSDeviceID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_415];
    [v6 disableUsingClientProxy:*(void *)(a1 + 32) authenticationType:*(void *)(a1 + 56) device:*(void *)(a1 + 40) sessionID:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = authentications_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) failedAuthenticationSessionWithID:*(void *)(a1 + 48) error:v5];
  }
}

void __58__SFAuthenticationManager_disableForType_withIDSDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

- (id)authenticateForType:(unint64_t)a3
{
  id v5 = objc_alloc_init(SFAuthenticationOptions);
  id v6 = [(SFAuthenticationManager *)self authenticateForType:a3 withOptions:v5];

  return v6;
}

- (id)authenticateForType:(unint64_t)a3 withOptions:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = authentications_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = SFAuthenticationTypeToString(a3);
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Begin authentication for %@", buf, 0xCu);
  }
  if ([(SFAuthenticationManager *)self osFeatureEnabledForType:a3])
  {
    char v10 = _os_feature_enabled_impl();
    if (a3 != 1 || (v10 & 1) != 0)
    {
      id v14 = +[SFCompanionXPCManager sharedManager];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __59__SFAuthenticationManager_authenticateForType_withOptions___block_invoke;
      v16[3] = &unk_1E5BBE7A0;
      v16[4] = self;
      unint64_t v19 = a3;
      id v17 = v7;
      id v18 = v6;
      [v14 unlockManagerWithCompletionHandler:v16];
    }
    else
    {
      id v11 = [(SFAuthenticationManager *)self autoUnlockManager];
      [v11 attemptAutoUnlockForSiri];
    }
  }
  else
  {
    id v12 = authentications_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v12, OS_LOG_TYPE_DEFAULT, "Feature Flag disabled", buf, 2u);
    }

    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:SFKAuthenticationErrorDomain code:19 userInfo:0];
    [(SFAuthenticationManager *)self failedAuthenticationSessionWithID:v7 error:v13];
  }

  return v7;
}

void __59__SFAuthenticationManager_authenticateForType_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_418];
    [v6 authenticateUsingClientProxy:*(void *)(a1 + 32) type:*(void *)(a1 + 56) sessionID:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = authentications_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) failedAuthenticationSessionWithID:*(void *)(a1 + 40) error:v5];
  }
}

void __59__SFAuthenticationManager_authenticateForType_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

- (id)canAuthenticateForType:(unint64_t)a3 withDevice:(id)a4
{
  id v6 = [a4 uniqueID];
  uint64_t v7 = [(SFAuthenticationManager *)self canAuthenticateForType:a3 withIDSDeviceID:v6];

  return v7;
}

- (id)canAuthenticateForType:(unint64_t)a3 withIDSDeviceID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = authentications_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = SFAuthenticationTypeToString(a3);
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "Begin requesting readiness check for %@ on %@", buf, 0x16u);
  }
  id v9 = [MEMORY[0x1E4F29128] UUID];
  if ([(SFAuthenticationManager *)self osFeatureEnabledForType:a3])
  {
    char v10 = +[SFCompanionXPCManager sharedManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__SFAuthenticationManager_canAuthenticateForType_withIDSDeviceID___block_invoke;
    v17[3] = &unk_1E5BBE7A0;
    v17[4] = self;
    unint64_t v20 = a3;
    id v18 = v6;
    id v11 = v9;
    id v19 = v11;
    [v10 unlockManagerWithCompletionHandler:v17];

    id v12 = v11;
  }
  else
  {
    uint64_t v13 = authentications_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SFAuthenticationManager requestEnablementForType:withIDSDeviceID:]();
    }

    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:SFKAuthenticationErrorDomain code:19 userInfo:0];
    [(SFAuthenticationManager *)self failedAuthenticationSessionWithID:v9 error:v14];
    id v15 = v9;
  }

  return v9;
}

void __66__SFAuthenticationManager_canAuthenticateForType_withIDSDeviceID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_420];
    [v6 canAuthenticateUsingClientProxy:*(void *)(a1 + 32) authenticationType:*(void *)(a1 + 56) device:*(void *)(a1 + 40) sessionID:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = authentications_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) failedAuthenticationSessionWithID:*(void *)(a1 + 48) error:v5];
  }
}

void __66__SFAuthenticationManager_canAuthenticateForType_withIDSDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

- (void)cancelAuthenticationSessionWithID:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = +[SFCompanionXPCManager sharedManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__SFAuthenticationManager_cancelAuthenticationSessionWithID___block_invoke;
    v7[3] = &unk_1E5BBD4E0;
    id v8 = v4;
    [v5 unlockManagerWithCompletionHandler:v7];
  }
  else
  {
    id v6 = [(SFAuthenticationManager *)self autoUnlockManager];
    [v6 cancelAutoUnlock];
  }
}

void __61__SFAuthenticationManager_cancelAuthenticationSessionWithID___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_422];
    [v4 cancelAuthenticationSessionWithID:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v3 = authentications_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }
  }
}

void __61__SFAuthenticationManager_cancelAuthenticationSessionWithID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

- (void)waitForApprovalRequestsForType:(unint64_t)a3
{
  BOOL v5 = -[SFAuthenticationManager osFeatureEnabledForType:](self, "osFeatureEnabledForType:");
  id v6 = authentications_log();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "Client registered for approval requests", buf, 2u);
    }

    uint64_t v7 = +[SFCompanionXPCManager sharedManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__SFAuthenticationManager_waitForApprovalRequestsForType___block_invoke;
    v8[3] = &unk_1E5BBE7C8;
    v8[4] = self;
    v8[5] = a3;
    [v7 unlockManagerWithCompletionHandler:v8];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[SFAuthenticationManager waitForApprovalRequestsForType:]();
  }
}

void __58__SFAuthenticationManager_waitForApprovalRequestsForType___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_424];
    [v4 registerForApprovalRequestsUsingClientProxy:*(void *)(a1 + 32) forType:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = authentications_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }
  }
}

void __58__SFAuthenticationManager_waitForApprovalRequestsForType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

- (void)startObservingForAuthenticationStateChanges:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SFAuthenticationManager *)self stopObservingForAuthenticationStateChanges];
  id v8 = [[SFAuthenticationStateChangesObserver alloc] initWithObserver:v7 queue:v6];

  id v9 = [(SFAuthenticationStateChangesObserver *)v8 identifier];
  [(SFAuthenticationManager *)self setLatestAuthenticationStateChangeObserverIdentifier:v9];

  char v10 = +[SFCompanionXPCManager sharedManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__SFAuthenticationManager_startObservingForAuthenticationStateChanges_queue___block_invoke;
  v12[3] = &unk_1E5BBD4E0;
  uint64_t v13 = v8;
  id v11 = v8;
  [v10 unlockManagerWithCompletionHandler:v12];
}

void __77__SFAuthenticationManager_startObservingForAuthenticationStateChanges_queue___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v6 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_427];
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 identifier];
    [v6 startObservingAuthentationStateChangesWithObserver:v3 forIdentifier:v4];
  }
  else
  {
    BOOL v5 = authentications_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }
  }
}

void __77__SFAuthenticationManager_startObservingForAuthenticationStateChanges_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

- (void)stopObservingForAuthenticationStateChanges
{
  uint64_t v3 = [(SFAuthenticationManager *)self latestAuthenticationStateChangeObserverIdentifier];

  if (v3)
  {
    id v4 = [(SFAuthenticationManager *)self latestAuthenticationStateChangeObserverIdentifier];
    [(SFAuthenticationManager *)self setLatestAuthenticationStateChangeObserverIdentifier:0];
    BOOL v5 = +[SFCompanionXPCManager sharedManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__SFAuthenticationManager_stopObservingForAuthenticationStateChanges__block_invoke;
    v7[3] = &unk_1E5BBD4E0;
    id v8 = v4;
    id v6 = v4;
    [v5 unlockManagerWithCompletionHandler:v7];
  }
}

void __69__SFAuthenticationManager_stopObservingForAuthenticationStateChanges__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_429];
    [v4 stopObservingAuthentationStateChangesForIdentifier:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v3 = authentications_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }
  }
}

void __69__SFAuthenticationManager_stopObservingForAuthenticationStateChanges__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

- (BOOL)declinedToEnableForType:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = authentications_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = SFAuthenticationTypeToString(a3);
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "Stub for declinedToEnableForType:%@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)manager:(id)a3 beganAttemptWithDevice:(id)a4
{
  BOOL v5 = [(SFAuthenticationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SFAuthenticationManager_manager_beganAttemptWithDevice___block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(v5, block);
}

void __58__SFAuthenticationManager_manager_beganAttemptWithDevice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = [MEMORY[0x1E4F29128] UUID];
    [v6 manager:v4 didStartAuthenticationForSessionWithID:v5];
  }
}

- (void)manager:(id)a3 completedUnlockWithDevice:(id)a4
{
  BOOL v5 = [(SFAuthenticationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SFAuthenticationManager_manager_completedUnlockWithDevice___block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(v5, block);
}

void __61__SFAuthenticationManager_manager_completedUnlockWithDevice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = [MEMORY[0x1E4F29128] UUID];
    [v6 manager:v4 didCompleteAuthenticationForSessionWithID:v5];
  }
}

- (void)manager:(id)a3 failedAttemptWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(SFAuthenticationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SFAuthenticationManager_manager_failedAttemptWithError___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  id v9 = v5;
  char v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __58__SFAuthenticationManager_manager_failedAttemptWithError___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) code] == 218
    && ([*(id *)(a1 + 40) delegate],
        id v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = objc_opt_respondsToSelector(),
        v2,
        (v3 & 1) != 0))
  {
    id v9 = [*(id *)(a1 + 40) delegate];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x1E4F29128] UUID];
    [v9 manager:v4 didCompleteAuthenticationForSessionWithID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) delegate];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      return;
    }
    id v9 = [*(id *)(a1 + 40) delegate];
    uint64_t v8 = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x1E4F29128] UUID];
    [v9 manager:v8 didFailAuthenticationForSessionWithID:v5 error:*(void *)(a1 + 32)];
  }
}

- (void)enabledAuthenticationSessionWithID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = authentications_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Notifying client authentication enablement completed for %@", buf, 0xCu);
  }

  id v6 = [(SFAuthenticationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SFAuthenticationManager_enabledAuthenticationSessionWithID___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __62__SFAuthenticationManager_enabledAuthenticationSessionWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) didEnableAuthenticationForSessionWithID:*(void *)(a1 + 40)];
  }
}

- (void)failedToEnableDeviceForSessionID:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = authentications_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Notifying client enablement for authentication failed for %@ error: %@", buf, 0x16u);
  }

  id v9 = [(SFAuthenticationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SFAuthenticationManager_failedToEnableDeviceForSessionID_error___block_invoke;
  block[3] = &unk_1E5BBD418;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __66__SFAuthenticationManager_failedToEnableDeviceForSessionID_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) didFailToEnableDeviceForSessionWithID:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
}

- (void)disabledAuthenticationSessionWithID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = authentications_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Notifying client authentication disablement completed for %@", buf, 0xCu);
  }

  id v6 = [(SFAuthenticationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SFAuthenticationManager_disabledAuthenticationSessionWithID___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __63__SFAuthenticationManager_disabledAuthenticationSessionWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) didDisableAuthenticationForSessionWithID:*(void *)(a1 + 40)];
  }
}

- (void)failedToDisableDeviceForSessionID:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = authentications_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Notifying client disablement for authentication failed for %@ error: %@", buf, 0x16u);
  }

  id v9 = [(SFAuthenticationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SFAuthenticationManager_failedToDisableDeviceForSessionID_error___block_invoke;
  block[3] = &unk_1E5BBD418;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __67__SFAuthenticationManager_failedToDisableDeviceForSessionID_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) didFailToDisableDeviceForSessionWithID:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
}

- (void)startedAuthenticationSessionWithID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = authentications_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Notifying client authentication started for %@", buf, 0xCu);
  }

  id v6 = [(SFAuthenticationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SFAuthenticationManager_startedAuthenticationSessionWithID___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __62__SFAuthenticationManager_startedAuthenticationSessionWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) didStartAuthenticationForSessionWithID:*(void *)(a1 + 40)];
  }
}

- (void)completedAuthenticationSessionWithID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = authentications_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Notifying client authentication completed for %@", buf, 0xCu);
  }

  id v6 = [(SFAuthenticationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__SFAuthenticationManager_completedAuthenticationSessionWithID___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __64__SFAuthenticationManager_completedAuthenticationSessionWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) didCompleteAuthenticationForSessionWithID:*(void *)(a1 + 40)];
  }
}

- (void)failedAuthenticationSessionWithID:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = authentications_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Notifying client authentication failed for %@ error: %@", buf, 0x16u);
  }

  id v9 = [(SFAuthenticationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SFAuthenticationManager_failedAuthenticationSessionWithID_error___block_invoke;
  block[3] = &unk_1E5BBD418;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __67__SFAuthenticationManager_failedAuthenticationSessionWithID_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) didFailAuthenticationForSessionWithID:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
}

- (void)receivedApproveRequestForSessionID:(id)a3 info:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = authentications_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 bundleID];
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Notifying client of incoming approve request for sessionID %@ for %@", buf, 0x16u);
  }
  id v10 = [(SFAuthenticationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke;
  block[3] = &unk_1E5BBD418;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [*(id *)(a1 + 32) delegate];
  if (v3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_2;
    v15[3] = &unk_1E5BBE818;
    uint64_t v8 = &v16;
    id v16 = v5;
    [v4 manager:v6 didReceiveRequestToApproveForSessionID:v16 info:v7 completionHandler:v15];
  }
  else
  {
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      return;
    }
    id v4 = [*(id *)(a1 + 32) delegate];
    uint64_t v11 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_452;
    v13[3] = &unk_1E5BBD7E8;
    uint64_t v8 = &v14;
    id v14 = v10;
    [v4 manager:v11 didReceiveRequestToApproveForSessionWithID:v14 info:v12 completionHandler:v13];
  }
}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[SFCompanionXPCManager sharedManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_3;
  v10[3] = &unk_1E5BBE7F0;
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  [v7 unlockManagerWithCompletionHandler:v10];
}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_3(void *a1, void *a2)
{
  if (a2)
  {
    id v4 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_448];
    [v4 reportUserApprovalWithACMToken:a1[4] error:a1[5] sessionID:a1[6]];
  }
  else
  {
    char v3 = authentications_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }
  }
}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_452(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = +[SFCompanionXPCManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_2_453;
  v8[3] = &unk_1E5BBE840;
  char v11 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v7 = v5;
  [v6 unlockManagerWithCompletionHandler:v8];
}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_2_453(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v5 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_456];
    if (*(unsigned char *)(a1 + 48))
    {
      char v3 = [MEMORY[0x1E4F1CA58] dataWithLength:1];
    }
    else
    {
      char v3 = 0;
    }
    [v5 reportUserApprovalWithACMToken:v3 error:*(void *)(a1 + 32) sessionID:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = authentications_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
    }
  }
}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_3_454(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = authentications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SFAuthenticationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAuthenticationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFAutoUnlockManager)autoUnlockManager
{
  return self->_autoUnlockManager;
}

- (NSUUID)latestAuthenticationStateChangeObserverIdentifier
{
  return self->_latestAuthenticationStateChangeObserverIdentifier;
}

- (void)setLatestAuthenticationStateChangeObserverIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAuthenticationStateChangeObserverIdentifier, 0);
  objc_storeStrong((id *)&self->_autoUnlockManager, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)isEnabledForType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Timed out waiting for completion, returning that oneness is not enabled", v2, v3, v4, v5, v6);
}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Missing proxy object", v2, v3, v4, v5, v6);
}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A5389000, v0, OS_LOG_TYPE_DEBUG, "Calling in to get eligible devices", v1, 2u);
}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Failed to retrieve remote object: %@", v2, v3, v4, v5, v6);
}

- (void)listEligibleDevicesForType:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Missing completion handler, returning", v2, v3, v4, v5, v6);
}

- (void)listEligibleDevicesForType:(unint64_t)a1 completionHandler:.cold.2(unint64_t a1)
{
  uint64_t v1 = SFAuthenticationTypeToString(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v2, v3, "%@ is unsupported, not calling into sharing", v4, v5, v6, v7, v8);
}

- (void)enableForType:withIDSDeviceID:passcode:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Not enabled", v2, v3, v4, v5, v6);
}

- (void)requestEnablementForType:withIDSDeviceID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Feature Flag Not enabled", v2, v3, v4, v5, v6);
}

- (void)waitForApprovalRequestsForType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Feature flag not enabled", v2, v3, v4, v5, v6);
}

@end