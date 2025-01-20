@interface ICPrivacyInfo
+ (ICPrivacyInfo)sharedPrivacyInfo;
+ (id)_onboardingKitPrivacyIdentifierForPrivacyIdentifier:(id)a3;
+ (id)sharedPrivacyInfoForUserIdentity:(id)a3;
- (BOOL)_privacyAcknowledgementRequiredForIdentifier:(id)a3;
- (BOOL)_queryPrivacyAcknowledgementRequiredForIdentifier:(id)a3;
- (BOOL)preflightDisclosureRequiredForBundleIdentifier:(id)a3;
- (BOOL)preflightDisclosureRequiredForMusic;
- (BOOL)privacyAcknowledgementRequiredForBundleIdentifier:(id)a3;
- (BOOL)privacyAcknowledgementRequiredForIdentifier:(id)a3;
- (BOOL)privacyAcknowledgementRequiredForMedia;
- (BOOL)privacyAcknowledgementRequiredForMusic;
- (ICPrivacyInfo)init;
- (ICPrivacyInfo)initWithIdentity:(id)a3;
- (id)_accountForPrivacyInfo;
- (id)beginObservingPrivacyAcknowledgementForIdentifier:(id)a3 handler:(id)a4;
- (id)description;
- (void)_updateForPrivacyAcknowledgementChanged;
- (void)acknowledgePrivacyPolicyForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)endObservingPrivacyAcknowledgementForIdentifier:(id)a3 withToken:(id)a4;
@end

@implementation ICPrivacyInfo

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: [%@]>", objc_opt_class(), self, self->_userIdentity];
}

- (id)_accountForPrivacyInfo
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = +[ICUserIdentityStore defaultIdentityStore];
  userIdentity = self->_userIdentity;
  id v13 = 0;
  v5 = [v3 DSIDForUserIdentity:userIdentity outError:&v13];
  id v6 = v13;

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = +[ICMonitoredAccountStore sharedAccountStore];
    id v12 = 0;
    v7 = [v8 storeAccountForDSID:v5 error:&v12];
    id v6 = v12;

    if (!v6) {
      goto LABEL_7;
    }
  }
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = self->_userIdentity;
    *(_DWORD *)buf = 138543874;
    v15 = self;
    __int16 v16 = 2114;
    v17 = v10;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load account for identity %{public}@. err = %{public}@.", buf, 0x20u);
  }

LABEL_7:

  return v7;
}

void __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _privacyAcknowledgementRequiredForIdentifier:v14];
  id v6 = [*(id *)(a1 + 40) objectForKey:v14];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v14];
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    char v9 = [v6 isEqual:v7];

    if (v9) {
      goto LABEL_8;
    }
    v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    id v6 = (id)[v5 copy];
    [v10 setObject:v6 forKey:v14];
  }

LABEL_8:
}

- (BOOL)privacyAcknowledgementRequiredForIdentifier:(id)a3
{
  v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = [(ICPrivacyInfo *)v3 _privacyAcknowledgementRequiredForIdentifier:v5];

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (BOOL)_privacyAcknowledgementRequiredForIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_cache objectForKey:v4];
    id v6 = v5;
    if (v5)
    {
      LOBYTE(v7) = [v5 BOOLValue];
    }
    else
    {
      uint64_t v7 = [(ICPrivacyInfo *)self _queryPrivacyAcknowledgementRequiredForIdentifier:v4];
      cache = self->_cache;
      char v9 = [NSNumber numberWithBool:v7];
      [(NSMutableDictionary *)cache setObject:v9 forKey:v4];
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_queryPrivacyAcknowledgementRequiredForIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"Music"]
    && (+[ICDefaults standardDefaults],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isPrivacyAcknowledgementDisabledForMusic],
        v5,
        v6))
  {
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring privacy acknowledgement for %{public}@ because -[ICDefaults isPrivacyAcknowledgementDisabledForMusic] returned YES.", (uint8_t *)&v16, 0x16u);
    }
    LOBYTE(v8) = 0;
  }
  else if ([v4 isEqualToString:@"Music"] {
         && (+[ICDefaults standardDefaults],
  }
             char v9 = objc_claimAutoreleasedReturnValue(),
             int v10 = [v9 shouldForcePrivacyAcknowledgementRequiredForMusic],
             v9,
             v10))
  {
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Forcing privacy acknowledgement needed for %{public}@ because -[ICDefaults shouldForcePrivacyAcknowledgementRequiredForMusic] returned YES.", (uint8_t *)&v16, 0x16u);
    }
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v7 = [(id)objc_opt_class() _onboardingKitPrivacyIdentifierForPrivacyIdentifier:v4];
    if (v7)
    {
      id v11 = [(ICPrivacyInfo *)self _accountForPrivacyInfo];
      uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543874;
        v17 = self;
        __int16 v18 = 2114;
        id v19 = v4;
        __int16 v20 = 2114;
        v21 = v11;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking if privacy acknowledgement required for %{public}@ using account %{public}@.", (uint8_t *)&v16, 0x20u);
      }

      if (v11) {
        int v13 = [MEMORY[0x1E4F4DBA8] acknowledgementNeededForPrivacyIdentifier:v7 account:v11];
      }
      else {
        int v13 = [MEMORY[0x1E4F4DBA8] acknowledgementNeededForPrivacyIdentifier:v7];
      }
      BOOL v8 = v13;
    }
    else
    {
      BOOL v8 = 0;
    }
    id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138544130;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = v4;
      __int16 v20 = 2114;
      v21 = v7;
      __int16 v22 = 1024;
      BOOL v23 = v8;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Privacy acknowledgement required for %{public}@ (%{public}@)? %{BOOL}u.", (uint8_t *)&v16, 0x26u);
    }
  }
  return v8;
}

- (BOOL)privacyAcknowledgementRequiredForMedia
{
  if (![(ICPrivacyInfo *)self privacyAcknowledgementRequiredForMusic]
    || ![(ICPrivacyInfo *)self privacyAcknowledgementRequiredForIdentifier:@"TV"])
  {
    return 0;
  }

  return [(ICPrivacyInfo *)self privacyAcknowledgementRequiredForIdentifier:@"Books"];
}

void __50__ICPrivacyInfo_sharedPrivacyInfoForUserIdentity___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v1 = (void *)sharedPrivacyInfoForUserIdentity__sPrivacyInfoPerAccount;
  sharedPrivacyInfoForUserIdentity__sPrivacyInfoPerAccount = v0;

  sharedPrivacyInfoForUserIdentity__sSharedPrivacyInfoLock = 0;
}

+ (ICPrivacyInfo)sharedPrivacyInfo
{
  v2 = +[ICUserIdentity autoupdatingActiveAccount];
  v3 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:v2];

  return (ICPrivacyInfo *)v3;
}

+ (id)sharedPrivacyInfoForUserIdentity:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "ICPrivacyInfo: nil identity passed into sharedPrivacyInfoForUserIdentity!", buf, 2u);
    }

    [MEMORY[0x1E4F77950] snapshotWithDomain:*MEMORY[0x1E4F778D8] type:@"Bug" subType:@"ICPRivacyInfo" context:@"nil identity passed into sharedPrivacyInfoForUserIdentity" triggerThresholdValues:&stru_1EF5F5C40 events:0 completion:0];
    id v4 = +[ICUserIdentity autoupdatingActiveAccount];
  }
  if (sharedPrivacyInfoForUserIdentity__sOnceToken != -1) {
    dispatch_once(&sharedPrivacyInfoForUserIdentity__sOnceToken, &__block_literal_global_25730);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sharedPrivacyInfoForUserIdentity__sSharedPrivacyInfoLock);
  int v6 = [(id)sharedPrivacyInfoForUserIdentity__sPrivacyInfoPerAccount objectForKey:v4];
  if (!v6)
  {
    int v6 = [[ICPrivacyInfo alloc] initWithIdentity:v4];
    [(id)sharedPrivacyInfoForUserIdentity__sPrivacyInfoPerAccount setObject:v6 forKey:v4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedPrivacyInfoForUserIdentity__sSharedPrivacyInfoLock);

  return v6;
}

- (ICPrivacyInfo)initWithIdentity:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICPrivacyInfo;
  int v6 = [(ICPrivacyInfo *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userIdentity, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
    cache = v7->_cache;
    v7->_cache = (NSMutableDictionary *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__handleUserIdentityStoreDidChangeNotification_ name:@"ICUserIdentityStoreDidChangeNotification" object:0];
  }
  return v7;
}

- (BOOL)privacyAcknowledgementRequiredForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    switch(ICSystemApplicationTypeForBundleIdentifier(v4))
    {
      case -1:
      case 0:
        break;
      case 1:
        uint64_t v8 = @"TV";
        goto LABEL_9;
      case 2:
        uint64_t v8 = @"Books";
        goto LABEL_9;
      case 3:
        uint64_t v8 = @"Podcasts";
        goto LABEL_9;
      case 4:
        uint64_t v8 = @"AppStore";
LABEL_9:
        BOOL v6 = [(ICPrivacyInfo *)self privacyAcknowledgementRequiredForIdentifier:v8];
        goto LABEL_10;
      default:
        BOOL v7 = 0;
        goto LABEL_11;
    }
  }
  BOOL v6 = [(ICPrivacyInfo *)self privacyAcknowledgementRequiredForMusic];
LABEL_10:
  BOOL v7 = v6;
LABEL_11:

  return v7;
}

- (BOOL)privacyAcknowledgementRequiredForMusic
{
  return [(ICPrivacyInfo *)self privacyAcknowledgementRequiredForIdentifier:@"Music"];
}

- (void)acknowledgePrivacyPolicyForIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v8 = [(id)objc_opt_class() _onboardingKitPrivacyIdentifierForPrivacyIdentifier:v6];
  if (!v8)
  {
    if (!v7) {
      goto LABEL_15;
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7002 userInfo:0];
LABEL_14:
    __int16 v18 = (void *)v17;
    v7[2](v7, 0, v17);

    goto LABEL_15;
  }
  char v9 = +[ICSecurityInfo sharedSecurityInfo];
  char v10 = [v9 isDeviceUnlocked];

  id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  objc_super v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = self;
      __int16 v25 = 2114;
      id v26 = v6;
      __int16 v27 = 2114;
      v28 = v8;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Acknowledging privacy policy for %{public}@ (%{public}@)...", buf, 0x20u);
    }

    if ([v6 isEqualToString:@"Music"])
    {
      int v13 = +[ICDefaults standardDefaults];
      [v13 setShouldForcePrivacyAcknowledgementRequiredForMusic:0];
    }
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F4DBA8]) initWithPrivacyIdentifier:v8];
    v15 = [(ICPrivacyInfo *)self _accountForPrivacyInfo];
    [v14 setAccount:v15];

    int v16 = [v14 acknowledgePrivacy];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__ICPrivacyInfo_acknowledgePrivacyPolicyForIdentifier_completionHandler___block_invoke;
    v19[3] = &unk_1E5ACAB00;
    v19[4] = self;
    id v20 = v6;
    id v21 = v8;
    __int16 v22 = v7;
    [v16 addFinishBlock:v19];

    goto LABEL_15;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v24 = self;
    __int16 v25 = 2114;
    id v26 = v6;
    __int16 v27 = 2114;
    v28 = v8;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to acknowledge privacy policy for %{public}@ (%{public}@) because device is locked", buf, 0x20u);
  }

  if (v7)
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7006, @"Acknowledging privacy policy requires the device to be unlocked");
    goto LABEL_14;
  }
LABEL_15:
}

+ (id)_onboardingKitPrivacyIdentifierForPrivacyIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Music"])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    id v4 = (id *)getOBPrivacyAppleMusicIdentifierSymbolLoc_ptr;
    uint64_t v22 = getOBPrivacyAppleMusicIdentifierSymbolLoc_ptr;
    if (!getOBPrivacyAppleMusicIdentifierSymbolLoc_ptr)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __getOBPrivacyAppleMusicIdentifierSymbolLoc_block_invoke;
      __int16 v18 = &unk_1E5ACD4F0;
      id v5 = OnBoardingKitLibrary();
      v20[3] = (uint64_t)dlsym(v5, "OBPrivacyAppleMusicIdentifier");
      getOBPrivacyAppleMusicIdentifierSymbolLoc_ptr = v20[3];
      id v4 = (id *)v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v7 = [NSString stringWithUTF8String:"NSString *getOBPrivacyAppleMusicIdentifier(void)"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"ICPrivacyInfo.m", 46, @"%s", dlerror(), v15, v16, v17, v18);
LABEL_36:

      __break(1u);
      return result;
    }
    goto LABEL_25;
  }
  if ([v3 isEqualToString:@"TV"])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    id v4 = (id *)getOBPrivacyTVAppIdentifierSymbolLoc_ptr;
    uint64_t v22 = getOBPrivacyTVAppIdentifierSymbolLoc_ptr;
    if (!getOBPrivacyTVAppIdentifierSymbolLoc_ptr)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __getOBPrivacyTVAppIdentifierSymbolLoc_block_invoke;
      __int16 v18 = &unk_1E5ACD4F0;
      uint64_t v8 = OnBoardingKitLibrary();
      v20[3] = (uint64_t)dlsym(v8, "OBPrivacyTVAppIdentifier");
      getOBPrivacyTVAppIdentifierSymbolLoc_ptr = v20[3];
      id v4 = (id *)v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v7 = [NSString stringWithUTF8String:"NSString *getOBPrivacyTVAppIdentifier(void)"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"ICPrivacyInfo.m", 47, @"%s", dlerror(), v15, v16, v17, v18);
      goto LABEL_36;
    }
    goto LABEL_25;
  }
  if ([v3 isEqualToString:@"Books"])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    id v4 = (id *)getOBPrivacyiBooksIdentifierSymbolLoc_ptr;
    uint64_t v22 = getOBPrivacyiBooksIdentifierSymbolLoc_ptr;
    if (!getOBPrivacyiBooksIdentifierSymbolLoc_ptr)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __getOBPrivacyiBooksIdentifierSymbolLoc_block_invoke;
      __int16 v18 = &unk_1E5ACD4F0;
      char v9 = OnBoardingKitLibrary();
      v20[3] = (uint64_t)dlsym(v9, "OBPrivacyiBooksIdentifier");
      getOBPrivacyiBooksIdentifierSymbolLoc_ptr = v20[3];
      id v4 = (id *)v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v7 = [NSString stringWithUTF8String:"NSString *getOBPrivacyiBooksIdentifier(void)"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"ICPrivacyInfo.m", 48, @"%s", dlerror(), v15, v16, v17, v18);
      goto LABEL_36;
    }
    goto LABEL_25;
  }
  if ([v3 isEqualToString:@"Podcasts"])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    id v4 = (id *)getOBPrivacyPodcastsIdentifierSymbolLoc_ptr;
    uint64_t v22 = getOBPrivacyPodcastsIdentifierSymbolLoc_ptr;
    if (!getOBPrivacyPodcastsIdentifierSymbolLoc_ptr)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __getOBPrivacyPodcastsIdentifierSymbolLoc_block_invoke;
      __int16 v18 = &unk_1E5ACD4F0;
      char v10 = OnBoardingKitLibrary();
      v20[3] = (uint64_t)dlsym(v10, "OBPrivacyPodcastsIdentifier");
      getOBPrivacyPodcastsIdentifierSymbolLoc_ptr = v20[3];
      id v4 = (id *)v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v7 = [NSString stringWithUTF8String:"NSString *getOBPrivacyPodcastsIdentifier(void)"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"ICPrivacyInfo.m", 49, @"%s", dlerror(), v15, v16, v17, v18);
      goto LABEL_36;
    }
    goto LABEL_25;
  }
  if ([v3 isEqualToString:@"AppStore"])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    id v4 = (id *)getOBPrivacyAppStoreIdentifierSymbolLoc_ptr;
    uint64_t v22 = getOBPrivacyAppStoreIdentifierSymbolLoc_ptr;
    if (!getOBPrivacyAppStoreIdentifierSymbolLoc_ptr)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __getOBPrivacyAppStoreIdentifierSymbolLoc_block_invoke;
      __int16 v18 = &unk_1E5ACD4F0;
      id v11 = OnBoardingKitLibrary();
      v20[3] = (uint64_t)dlsym(v11, "OBPrivacyAppStoreIdentifier");
      getOBPrivacyAppStoreIdentifierSymbolLoc_ptr = v20[3];
      id v4 = (id *)v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v7 = [NSString stringWithUTF8String:"NSString *getOBPrivacyAppStoreIdentifier(void)"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"ICPrivacyInfo.m", 50, @"%s", dlerror(), v15, v16, v17, v18);
      goto LABEL_36;
    }
LABEL_25:
    id v12 = *v4;
    goto LABEL_26;
  }
  if ([v3 isEqualToString:@"FitnessPlus"])
  {
    getOBPrivacyFitnessPlusIdentifier();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (![v3 isEqualToString:@"ImproveFitnessPlus"])
    {
      int v13 = 0;
      goto LABEL_27;
    }
    getOBPrivacyImproveFitnessPlusIdentifier();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_26:
  int v13 = v12;
LABEL_27:

  return v13;
}

void __73__ICPrivacyInfo_acknowledgePrivacyPolicyForIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    int v18 = 138544386;
    uint64_t v19 = v14;
    __int16 v20 = 2114;
    uint64_t v21 = v15;
    __int16 v22 = 2114;
    uint64_t v23 = v16;
    __int16 v24 = 1024;
    int v25 = a2;
    __int16 v26 = 2114;
    id v27 = v5;
    char v10 = "%{public}@: Failed to acknowledge privacy policy for %{public}@ (%{public}@). didSucceed = %{BOOL}u, error = %{public}@.";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 48;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v18 = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v9;
    char v10 = "%{public}@: Successfully completed privacy policy acknowledgement for %{public}@.";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 22;
  }
  _os_log_impl(&dword_1A2D01000, v11, v12, v10, (uint8_t *)&v18, v13);
LABEL_8:

  [*(id *)(a1 + 32) _updateForPrivacyAcknowledgementChanged];
  uint64_t v17 = *(void *)(a1 + 56);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, a2, v5);
  }
}

- (void)_updateForPrivacyAcknowledgementChanged
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__25661;
  uint64_t v19 = __Block_byref_object_dispose__25662;
  id v20 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableDictionary *)self->_cache copy];
  [(NSMutableDictionary *)self->_cache removeAllObjects];
  observers = self->_observers;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke;
  v12[3] = &unk_1E5ACA370;
  v12[4] = self;
  id v6 = v4;
  id v13 = v6;
  uint64_t v14 = &v15;
  [(NSMutableDictionary *)observers enumerateKeysAndObjectsUsingBlock:v12];
  if ([(id)v16[5] count]) {
    BOOL v7 = (void *)[(NSMutableDictionary *)self->_cache copy];
  }
  else {
    BOOL v7 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  if ([(id)v16[5] count])
  {
    uint64_t v8 = (void *)v16[5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke_2;
    v9[3] = &unk_1E5ACA3C0;
    id v10 = v7;
    id v11 = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v9];
  }
  _Block_object_dispose(&v15, 8);
}

- (id)beginObservingPrivacyAcknowledgementForIdentifier:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(NSMutableDictionary *)self->_observers objectForKey:v6];
  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v10 = (void *)[v7 copy];
  id v11 = (void *)MEMORY[0x1A6240BF0]();
  [v9 setObject:v11 forKey:v8];

  observers = self->_observers;
  if (!observers)
  {
    id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v14 = self->_observers;
    self->_observers = v13;

    observers = self->_observers;
  }
  [(NSMutableDictionary *)observers setObject:v9 forKey:v6];
  if ([v9 count] == 1)
  {
    [(ICPrivacyInfo *)self _privacyAcknowledgementRequiredForIdentifier:v6];
    uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543618;
      uint64_t v19 = self;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning to observe privacy acknowledgement for %{public}@.", (uint8_t *)&v18, 0x16u);
    }
  }
  uint64_t v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543874;
    uint64_t v19 = self;
    __int16 v20 = 2114;
    id v21 = v6;
    __int16 v22 = 2114;
    uint64_t v23 = v8;
    _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered new observer of privacy acknowledgement for %{public}@ with token: %{public}@.", (uint8_t *)&v18, 0x20u);
  }

  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

void __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = [v6 objectForKey:v5];
  char v9 = [v8 BOOLValue];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke_3;
  v11[3] = &unk_1E5ACA398;
  v11[4] = *(void *)(a1 + 40);
  id v12 = v5;
  char v13 = v9;
  id v10 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
}

void __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(unsigned __int8 *)(a1 + 48);
    int v11 = 138544130;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 1024;
    int v18 = v10;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking observation handler for %{public}@ with token %{public}@. isPrivacyAcknowledgementRequired = %{BOOL}u.", (uint8_t *)&v11, 0x26u);
  }

  (*((void (**)(id, void, void))v6 + 2))(v6, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)endObservingPrivacyAcknowledgementForIdentifier:(id)a3 withToken:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = [(NSMutableDictionary *)self->_observers objectForKey:v6];
  [v8 removeObjectForKey:v7];
  uint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543874;
    __int16 v13 = self;
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed observer of privacy acknowledgement for %{public}@ with token: %{public}@.", (uint8_t *)&v12, 0x20u);
  }

  if (![v8 count])
  {
    [(NSMutableDictionary *)self->_observers removeObjectForKey:v6];
    int v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      __int16 v13 = self;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped observing privacy acknowledgement for %{public}@.", (uint8_t *)&v12, 0x16u);
    }

    if (![(NSMutableDictionary *)self->_observers count])
    {
      observers = self->_observers;
      self->_observers = 0;
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)preflightDisclosureRequiredForBundleIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];
  id v6 = [v5 applicationState];
  char v7 = [v6 isValid];

  if (v7)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    preflightManager = self->_preflightManager;
    if (!preflightManager)
    {
      uint64_t v19 = 0;
      __int16 v20 = &v19;
      uint64_t v21 = 0x2050000000;
      int v10 = (void *)getPDCPreflightManagerClass_softClass;
      uint64_t v22 = getPDCPreflightManagerClass_softClass;
      if (!getPDCPreflightManagerClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __getPDCPreflightManagerClass_block_invoke;
        uint64_t v24 = &unk_1E5ACD4F0;
        int v25 = &v19;
        __getPDCPreflightManagerClass_block_invoke((uint64_t)buf);
        int v10 = (void *)v20[3];
      }
      int v11 = v10;
      _Block_object_dispose(&v19, 8);
      id v12 = [v11 alloc];
      uint64_t v13 = objc_msgSend(v12, "initWithTargetQueue:", 0, v19);
      id v15 = self->_preflightManager;
      p_preflightManager = &self->_preflightManager;
      *p_preflightManager = (PDCPreflightManager *)v13;

      preflightManager = *p_preflightManager;
    }
    char v16 = [(PDCPreflightManager *)preflightManager requiresPreflightForApplicationRecord:v5];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Invalid [LSApplicationRecord applicationState] for bundleID: %{public}@", buf, 0x16u);
    }

    char v16 = 0;
  }

  return v16;
}

- (BOOL)preflightDisclosureRequiredForMusic
{
  id v3 = ICBundleIdentifierForSystemApplicationType(0);
  LOBYTE(self) = [(ICPrivacyInfo *)self preflightDisclosureRequiredForBundleIdentifier:v3];

  return (char)self;
}

- (ICPrivacyInfo)init
{
  id v3 = +[ICUserIdentity autoupdatingActiveAccount];
  id v4 = [(ICPrivacyInfo *)self initWithIdentity:v3];

  return v4;
}

@end