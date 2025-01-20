@interface ICAgeVerificationManager
+ (ICAgeVerificationManager)defaultManager;
- (BOOL)_bagHasValidKeys:(id)a3;
- (ICAgeVerificationState)ageVerificationState;
- (NSMutableDictionary)ageVerificationStateInternal;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)calloutQueue;
- (id)_init;
- (id)ageVerificationStateForUserIdentity:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_registerForNotifications;
- (void)_runAgeVerificationForUserIdentity:(id)a3 completion:(id)a4;
- (void)_updateAgeVerificationStateAndSendNotification:(BOOL)a3 completion:(id)a4;
- (void)_updateAgeVerificationStateForUserIdentity:(id)a3 sendNotification:(BOOL)a4 completion:(id)a5;
- (void)_userIdentityStoreDidChange:(id)a3;
- (void)getAgeVerificationStateForUserIdentity:(id)a3 completion:(id)a4;
- (void)getAgeVerificationStateWithCompletion:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setAgeVerificationStateInternal:(id)a3;
- (void)setCalloutQueue:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation ICAgeVerificationManager

void __74__ICAgeVerificationManager__runAgeVerificationForUserIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAllowsExpiredBags:1];
  [v3 setIdentity:*(void *)(a1 + 32)];
  v4 = +[ICClientInfo defaultInfo];
  [v3 setClientInfo:v4];

  id v5 = +[ICUserIdentityStore defaultIdentityStore];
  [v3 setIdentityStore:v5];
}

- (void)_runAgeVerificationForUserIdentity:(id)a3 completion:(id)a4
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void *))a4;
  v9 = +[ICUserIdentityStore defaultIdentityStore];
  id v29 = 0;
  v10 = [v9 getPropertiesForUserIdentity:v7 error:&v29];
  id v11 = v29;

  if (v11)
  {
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v36[0] = *MEMORY[0x1E4F28A50];
    v36[1] = v12;
    v37[0] = v11;
    v13 = [NSString stringWithFormat:@"Error retrieving properties for account %@ during age verification - Age Verification not required.", v7];
    v37[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v14];
    v16 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v31 = self;
      __int16 v32 = 2114;
      id v33 = v7;
      __int16 v34 = 2114;
      id v35 = v11;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "ICAgeVerificationManager %p - Error retrieving properties for account %{public}@ during age verification: %{public}@ - Age Verification not required.", buf, 0x20u);
    }

    v17 = +[ICAgeVerificationState ageVerificationStateNotRequiredForUserIdentity:v7 withError:v15];
    v8[2](v8, v17);
  }
  else
  {
    v18 = [ICStoreRequestContext alloc];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __74__ICAgeVerificationManager__runAgeVerificationForUserIdentity_completion___block_invoke;
    v27[3] = &unk_1E5ACC698;
    id v19 = v7;
    id v28 = v19;
    v20 = [(ICStoreRequestContext *)v18 initWithBlock:v27];
    v21 = +[ICURLBagProvider sharedBagProvider];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__ICAgeVerificationManager__runAgeVerificationForUserIdentity_completion___block_invoke_2;
    v22[3] = &unk_1E5AC6EB8;
    v22[4] = self;
    v25 = v8;
    id v23 = v19;
    SEL v26 = a2;
    id v24 = v10;
    [v21 getBagForRequestContext:v20 withCompletionHandler:v22];

    v14 = v28;
  }
}

+ (ICAgeVerificationManager)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_2279);
  }
  v2 = (void *)defaultManager___sharedManager;

  return (ICAgeVerificationManager *)v2;
}

void __74__ICAgeVerificationManager__runAgeVerificationForUserIdentity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = *MEMORY[0x1E4F28228];
    v57[0] = *MEMORY[0x1E4F28A50];
    v57[1] = v8;
    v58[0] = v6;
    v58[1] = @"ICAgeVerificationManager - Error retrieving bag during age verification";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7200 userInfo:v9];
    id v11 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v54 = v12;
      __int16 v55 = 2114;
      uint64_t v56 = (uint64_t)v7;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "ICAgeVerificationManager %p - Error retrieving bag during age verification: %{public}@ - Age Verification not required.", buf, 0x16u);
    }

    uint64_t v13 = *(void *)(a1 + 56);
    v14 = +[ICAgeVerificationState ageVerificationStateNotRequiredForUserIdentity:*(void *)(a1 + 40) withError:v10];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

    goto LABEL_42;
  }
  if ([*(id *)(a1 + 32) _bagHasValidKeys:v5])
  {
    if (!v5)
    {
      v49 = [MEMORY[0x1E4F28B00] currentHandler];
      [v49 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"ICAgeVerificationManager.m" lineNumber:191 description:@"Bag should never be nil when no error was provided"];
    }
    v15 = [v5 stringForBagKey:@"ExplicitContentBadgeTreatment"];
    v9 = v15;
    if (v15 && ![v15 caseInsensitiveCompare:@"korea"])
    {
      id v19 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v54 = v20;
        _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationManager %p - Using 19 treatment for explicit content.", buf, 0xCu);
      }

      uint64_t v16 = 1;
    }
    else
    {
      uint64_t v16 = 0;
    }
    v10 = [v5 urlForBagKey:@"korAgeVerificationUrl"];
    if (*(void *)(a1 + 48))
    {
      if (([v5 BOOLValueForBagKey:@"isExplicitContentAgeVerificationRequired"] & 1) != 0
        || (+[ICDefaults standardDefaults],
            v21 = objc_claimAutoreleasedReturnValue(),
            char v22 = [v21 shouldRunAgeVerification],
            v21,
            (v22 & 1) != 0))
      {
        id v23 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          uint64_t v54 = v24;
          _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationManager %p - Performing age verification", buf, 0xCu);
        }

        v25 = +[ICDefaults standardDefaults];
        if ([v25 shouldRunAgeVerification])
        {
          SEL v26 = [v25 ageVerificationExpirationDate];
          v27 = (void *)[v26 copy];

          id v28 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v29 = *(void *)(a1 + 32);
            [v27 timeIntervalSince1970];
            *(_DWORD *)buf = 138543618;
            uint64_t v54 = v29;
            __int16 v55 = 2048;
            uint64_t v56 = (uint64_t)v30;
            _os_log_impl(&dword_1A2D01000, v28, OS_LOG_TYPE_INFO, "%{public}@ - Expiration date provided from ICDefaults: %{time_t}zd", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v51 = v16;
          v37 = +[ICMonitoredAccountStore sharedAccountStore];
          v38 = [*(id *)(a1 + 48) DSID];
          id v52 = 0;
          v39 = [v37 storeAccountForDSID:v38 error:&v52];
          id v28 = v52;

          if (v39)
          {
            v27 = objc_msgSend(v39, "ic_ageVerificationExpirationDate");
            v40 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              uint64_t v50 = *(void *)(a1 + 32);
              [v27 timeIntervalSince1970];
              *(_DWORD *)buf = 138543618;
              uint64_t v54 = v50;
              __int16 v55 = 2048;
              uint64_t v56 = (uint64_t)v41;
              _os_log_impl(&dword_1A2D01000, v40, OS_LOG_TYPE_INFO, "%{public}@ - Expiration date provided from ACAccount: %{time_t}zd", buf, 0x16u);
            }
          }
          else
          {
            v40 = _ICLogCategoryAgeVerification();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              uint64_t v44 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138543618;
              uint64_t v54 = v44;
              __int16 v55 = 2114;
              uint64_t v56 = (uint64_t)v28;
              _os_log_impl(&dword_1A2D01000, v40, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to fetch ageVerificationExpirationDate from ACAccount. error=%{public}@", buf, 0x16u);
            }
            v27 = 0;
          }

          uint64_t v16 = v51;
        }

        if (!v27)
        {
          v45 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            uint64_t v46 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            uint64_t v54 = v46;
            _os_log_impl(&dword_1A2D01000, v45, OS_LOG_TYPE_ERROR, "%{public}@ - AgeVerificationExpiration is nil. Defaulting to expired date.", buf, 0xCu);
          }

          v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1.0];
        }
        v47 = [[ICAgeVerifier alloc] initWithExpirationDate:v27];
        v48 = [[ICAgeVerificationState alloc] initWithUserIdentity:*(void *)(a1 + 40) ageVerifier:v47 treatment:v16 verificationURL:v10];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

        goto LABEL_41;
      }
      v31 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v42 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v54 = v42;
        __int16 v34 = "ICAgeVerificationManager %p - Age Verification not required.";
        id v35 = v31;
        uint32_t v36 = 12;
        goto LABEL_30;
      }
    }
    else
    {
      v31 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = *(void *)(a1 + 32);
        uint64_t v33 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        uint64_t v54 = v32;
        __int16 v55 = 2114;
        uint64_t v56 = v33;
        __int16 v34 = "ICAgeVerificationManager %p - There are no properties for account %{public}@ - Age Verification not required.";
        id v35 = v31;
        uint32_t v36 = 22;
LABEL_30:
        _os_log_impl(&dword_1A2D01000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
      }
    }

    uint64_t v43 = *(void *)(a1 + 56);
    v27 = +[ICAgeVerificationState ageVerificationStateNotRequiredForUserIdentity:*(void *)(a1 + 40) withTreatment:v16 verificationURL:v10];
    (*(void (**)(uint64_t, void *))(v43 + 16))(v43, v27);
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  uint64_t v17 = *(void *)(a1 + 56);
  v18 = +[ICAgeVerificationState ageVerificationStateNotRequiredForUserIdentity:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

LABEL_43:
}

- (BOOL)_bagHasValidKeys:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [v4 numberForBagKey:@"isExplicitContentAgeVerificationRequired"];

  if (!v6) {
    [v5 addObject:@"isExplicitContentAgeVerificationRequired"];
  }
  id v7 = [v4 stringForBagKey:@"ExplicitContentBadgeTreatment"];

  if (!v7) {
    [v5 addObject:@"ExplicitContentBadgeTreatment"];
  }
  uint64_t v8 = [v4 urlForBagKey:@"korAgeVerificationUrl"];

  if (!v8) {
    [v5 addObject:@"korAgeVerificationUrl"];
  }
  uint64_t v9 = [v5 count];
  if (v9)
  {
    v10 = [v5 componentsJoinedByString:@", "];
    id v11 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationManager %p - Bag key(s) missing for age verification: %{public}@ - Age Verification not required.", (uint8_t *)&v13, 0x16u);
    }
  }
  return v9 == 0;
}

- (ICAgeVerificationState)ageVerificationState
{
  id v3 = +[ICUserIdentity activeAccount];
  id v4 = [(ICAgeVerificationManager *)self ageVerificationStateForUserIdentity:v3];

  return (ICAgeVerificationState *)v4;
}

- (id)ageVerificationStateForUserIdentity:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[ICUserIdentityStore defaultIdentityStore];
  id v6 = [v5 DSIDForUserIdentity:v4 outError:0];
  uint64_t v7 = [v6 stringValue];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = @"NoDSID";
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  v10 = v9;

  os_unfair_lock_lock(&self->_lock);
  id v11 = [(ICAgeVerificationManager *)self ageVerificationStateInternal];
  uint64_t v12 = [v11 objectForKeyedSubscript:v10];

  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    int v13 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 134218242;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_INFO, "ICAgeVerificationManager %p - ageVerificationStateForUserIdentity - Retrieving state [In-memory cache] - State=%@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = +[ICAgeVerificationState cachedStateForDSID:v10];
    v14 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 134218242;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_INFO, "ICAgeVerificationManager %p - ageVerificationStateForUserIdentity - Retrieving state [Disk cache] - Kicking off refresh - State=%@", (uint8_t *)&v16, 0x16u);
    }

    [(ICAgeVerificationManager *)self _updateAgeVerificationStateForUserIdentity:v4 sendNotification:1 completion:0];
  }

  return v12;
}

void __99__ICAgeVerificationManager__updateAgeVerificationStateForUserIdentity_sendNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v25 = v5;
    __int16 v26 = 2114;
    id v27 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_INFO, "ICAgeVerificationManager %p - Obtained new age verification state: %{public}@", buf, 0x16u);
  }

  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = +[ICUserIdentityStore defaultIdentityStore];
  uint64_t v8 = [v7 DSIDForUserIdentity:v6 outError:0];

  uint64_t v9 = [v8 stringValue];
  v10 = (void *)v9;
  id v11 = @"NoDSID";
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  uint64_t v12 = v11;

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  int v13 = [*(id *)(a1 + 32) ageVerificationStateInternal];
  v14 = [v13 objectForKeyedSubscript:v12];
  char v15 = [v3 isEqual:v14] ^ 1;

  int v16 = [*(id *)(a1 + 32) ageVerificationStateInternal];
  [v16 setObject:v3 forKeyedSubscript:v12];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [v3 saveToUserDefaults];
  uint64_t v17 = [*(id *)(a1 + 32) calloutQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__ICAgeVerificationManager__updateAgeVerificationStateForUserIdentity_sendNotification_completion___block_invoke_17;
  v19[3] = &unk_1E5AC6E68;
  char v22 = v15;
  char v23 = *(unsigned char *)(a1 + 56);
  v19[4] = *(void *)(a1 + 32);
  id v21 = *(id *)(a1 + 48);

  id v20 = v3;
  id v18 = v3;
  dispatch_async(v17, v19);
}

- (NSMutableDictionary)ageVerificationStateInternal
{
  return self->_ageVerificationStateInternal;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

uint64_t __99__ICAgeVerificationManager__updateAgeVerificationStateForUserIdentity_sendNotification_completion___block_invoke_17(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(a1 + 57))
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"ICAgeVerificationStateDidChangeNotification" object:*(void *)(a1 + 32)];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __42__ICAgeVerificationManager_defaultManager__block_invoke()
{
  defaultManager___sharedManager = [[ICAgeVerificationManager alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)ICAgeVerificationManager;
  v2 = [(ICAgeVerificationManager *)&v13 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iTunesCloud.ICAgeVerificationManager.concurrentCallout", MEMORY[0x1E4F14430]);
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    ageVerificationStateInternal = v3->_ageVerificationStateInternal;
    v3->_ageVerificationStateInternal = v6;

    [(ICAgeVerificationManager *)v3 _updateAgeVerificationStateAndSendNotification:1 completion:0];
    [(ICAgeVerificationManager *)v3 _registerForNotifications];
    uint64_t v8 = +[ICDeviceInfo currentDeviceInfo];
    int v9 = [v8 isInternalBuild];

    if (v9)
    {
      if (([MEMORY[0x1E4F77990] hasEntitlement:@"apple" inGroup:@"keychain-access-groups"] & 1) == 0)
      {
        v10 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          v12[0] = 0;
          _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_FAULT, "ICAgeVerificationManager - Missing critical entitlement for age verification: \"apple\" - \"keychain-access-groups\"", (uint8_t *)v12, 2u);
        }
      }
    }
  }
  return v3;
}

- (void)_updateAgeVerificationStateAndSendNotification:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[ICUserIdentity activeAccount];
  [(ICAgeVerificationManager *)self _updateAgeVerificationStateForUserIdentity:v7 sendNotification:v4 completion:v6];
}

- (void)_updateAgeVerificationStateForUserIdentity:(id)a3 sendNotification:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__ICAgeVerificationManager__updateAgeVerificationStateForUserIdentity_sendNotification_completion___block_invoke;
  v12[3] = &unk_1E5AC6E90;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ICAgeVerificationManager *)self _runAgeVerificationForUserIdentity:v11 completion:v12];
}

- (void)_registerForNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__userIdentityStoreDidChange_ name:@"ICUserIdentityStoreDidChangeNotification" object:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageVerificationStateInternal, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setAgeVerificationStateInternal:(id)a3
{
}

- (void)setCalloutQueue:(id)a3
{
}

- (void)setAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)_userIdentityStoreDidChange:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v4 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationManager %p - Received ICUserIdentityStoreDidChangeNotification - Refreshing state for active user", (uint8_t *)&v5, 0xCu);
  }

  [(ICAgeVerificationManager *)self _updateAgeVerificationStateAndSendNotification:1 completion:0];
}

- (void)getAgeVerificationStateForUserIdentity:(id)a3 completion:(id)a4
{
}

- (void)getAgeVerificationStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICUserIdentity activeAccount];
  [(ICAgeVerificationManager *)self getAgeVerificationStateForUserIdentity:v5 completion:v4];
}

@end