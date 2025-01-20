@interface ICUserIdentityStoreACAccountBackend
+ (BOOL)supportsSecureCoding;
- (BOOL)disableLockerAccountDSID:(id)a3 error:(id *)a4;
- (BOOL)replaceIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5;
- (BOOL)setIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5;
- (BOOL)setLocalStoreAccountProperties:(id)a3 error:(id *)a4;
- (BOOL)updateActiveAccountDSID:(id)a3 error:(id *)a4;
- (BOOL)updateActiveLockerAccountDSID:(id)a3 error:(id *)a4;
- (ICUserIdentityStoreACAccountBackend)init;
- (ICUserIdentityStoreBackendDelegate)delegate;
- (id)_newLocalStoreAccountPropertiesFromAccount:(id)a3;
- (id)_newUserIdentityPropertiesForAccount:(id)a3;
- (id)_userIdentityPropertiesForAccount:(id)a3;
- (id)accountDSIDForAltDSID:(id)a3 error:(id *)a4;
- (id)activeAccountDSIDWithError:(id *)a3;
- (id)activeLockerAccountDSIDWithError:(id *)a3;
- (id)allManageableStoreAccountDSIDsWithError:(id *)a3;
- (id)allStoreAccountDSIDsWithError:(id *)a3;
- (id)allStoreAccountsWithError:(id *)a3;
- (id)identityPropertiesForDSID:(id)a3 error:(id *)a4;
- (id)identityPropertiesForPrimaryICloudAccountWithError:(id *)a3;
- (id)localStoreAccountPropertiesWithError:(id *)a3;
- (id)localStoreAccountWithError:(id *)a3;
- (id)storeAccountForDSID:(id)a3 error:(id *)a4;
- (id)verificationContextForAccountEstablishmentWithError:(id *)a3;
- (id)verificationContextForDSID:(id)a3 error:(id *)a4;
- (void)_applyIdentityProperties:(id)a3 toAccount:(id)a4;
- (void)_applyLocalStoreAccountProperties:(id)a3 toAccount:(id)a4;
- (void)_notifyDelegateOfBackendChange;
- (void)_synchronize;
- (void)monitoredAccountStore:(id)a3 didAddAccount:(id)a4;
- (void)monitoredAccountStore:(id)a3 didChangeCredentialsForAccount:(id)a4;
- (void)monitoredAccountStore:(id)a3 didRemoveAccount:(id)a4;
- (void)monitoredAccountStore:(id)a3 didUpdateAccount:(id)a4;
- (void)removeIdentityForDSID:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)synchronize;
@end

@implementation ICUserIdentityStoreACAccountBackend

void __43__ICUserIdentityStoreACAccountBackend_init__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v21 = 0;
  v3 = [v2 activeStoreAccountWithError:&v21];
  id v4 = v21;
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v6;
      __int16 v24 = 2114;
      id v25 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to initialize active account, error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend(v3, "ic_DSID");
    uint64_t v8 = *(void *)(a1 + 32);
    v5 = *(NSObject **)(v8 + 32);
    *(void *)(v8 + 32) = v7;
  }

  v9 = *(void **)(*(void *)(a1 + 32) + 8);
  id v20 = v4;
  uint64_t v10 = [v9 primaryAppleAccountWithError:&v20];
  id v11 = v20;

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v10;

  if (v11)
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v15;
      __int16 v24 = 2114;
      id v25 = v11;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to initialize primary apple account, error=%{public}@", buf, 0x16u);
    }
  }
  v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(v17 + 24);
    v18 = *(void **)(v17 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v17;
    __int16 v24 = 2114;
    id v25 = v18;
    __int16 v26 = 2114;
    uint64_t v27 = v19;
    _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Initialized with active account DSID %{public}@, primaryAppleAccount %{public}@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "registerObserver:");
}

- (id)identityPropertiesForPrimaryICloudAccountWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v12 = 0;
  uint64_t v7 = [(ICMonitoredAccountStore *)monitoredAccountStore primaryAppleAccountWithError:&v12];
  unint64_t v8 = (unint64_t)v12;
  if (v8 | v7)
  {
    v9 = (void *)v8;
    if (v7)
    {
      uint64_t v10 = [(ICUserIdentityStoreACAccountBackend *)self _userIdentityPropertiesForAccount:v7];
      goto LABEL_6;
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
  }
  uint64_t v10 = 0;
LABEL_6:
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v9;
  }

  return v10;
}

- (id)activeLockerAccountDSIDWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v11 = 0;
  uint64_t v7 = [(ICMonitoredAccountStore *)monitoredAccountStore activeStoreAccountWithError:&v11];
  id v8 = v11;
  v9 = 0;
  if (objc_msgSend(v7, "ic_isActiveLockerAccount"))
  {
    v9 = objc_msgSend(v7, "ic_DSID");
  }
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v8;
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
}

- (ICUserIdentityStoreACAccountBackend)init
{
  v15.receiver = self;
  v15.super_class = (Class)ICUserIdentityStoreACAccountBackend;
  v2 = [(ICUserIdentityStoreACAccountBackend *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iTunesCloud.ICUserIdentityStoreACAccountBackend.callbackQueue", v3);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesCloud.ICUserIdentityStoreACAccountBackend.accountStoreDelegateQueue", v6);
    accountStoreDelegateQueue = v2->_accountStoreDelegateQueue;
    v2->_accountStoreDelegateQueue = (OS_dispatch_queue *)v7;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = +[ICMonitoredAccountStore sharedAccountStore];
    monitoredAccountStore = v2->_monitoredAccountStore;
    v2->_monitoredAccountStore = (ICMonitoredAccountStore *)v9;

    id v11 = v2->_accountStoreDelegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__ICUserIdentityStoreACAccountBackend_init__block_invoke;
    block[3] = &unk_1E5ACD750;
    v14 = v2;
    dispatch_async(v11, block);
  }
  return v2;
}

- (void)synchronize
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(ICUserIdentityStoreACAccountBackend *)self _synchronize];

  os_unfair_lock_unlock(p_lock);
}

- (void)_synchronize
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Synchronizing with account store", buf, 0xCu);
  }

  identityPropertiesCache = self->_identityPropertiesCache;
  self->_identityPropertiesCache = 0;

  activeAccountDSID = self->_activeAccountDSID;
  self->_activeAccountDSID = 0;

  primaryICloudAccount = self->_primaryICloudAccount;
  self->_primaryICloudAccount = 0;

  monitoredAccountStore = self->_monitoredAccountStore;
  id v18 = 0;
  id v8 = [(ICMonitoredAccountStore *)monitoredAccountStore activeStoreAccountWithError:&v18];
  id v9 = v18;
  if (v9)
  {
    uint64_t v10 = (NSNumber *)os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = self;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_impl(&dword_1A2D01000, &v10->super.super, OS_LOG_TYPE_ERROR, "%{public}@ Failed to initialize active account, error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v8, "ic_DSID");
    id v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = self->_activeAccountDSID;
    self->_activeAccountDSID = v11;
  }

  id v12 = self->_monitoredAccountStore;
  id v17 = v9;
  v13 = [(ICMonitoredAccountStore *)v12 primaryAppleAccountWithError:&v17];
  id v14 = v17;

  objc_super v15 = self->_primaryICloudAccount;
  self->_primaryICloudAccount = v13;

  if (v14)
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = self;
      __int16 v21 = 2114;
      id v22 = v14;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to initialize primary apple account, error=%{public}@", buf, 0x16u);
    }
  }
}

- (id)allManageableStoreAccountDSIDsWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v23 = 0;
  dispatch_queue_t v7 = [(ICMonitoredAccountStore *)monitoredAccountStore allStoreAccountsWithError:&v23];
  id v8 = v23;
  id v9 = 0;
  if (!v8)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_super v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v15, "ic_isManageable", (void)v19))
          {
            v16 = objc_msgSend(v15, "ic_DSID");
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }
  }
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v8;
  }
  id v17 = objc_msgSend(v9, "copy", (void)v19);

  return v17;
}

- (id)identityPropertiesForDSID:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v14 = 0;
  uint64_t v9 = [(ICMonitoredAccountStore *)monitoredAccountStore storeAccountForDSID:v7 error:&v14];

  unint64_t v10 = (unint64_t)v14;
  if (v10 | v9)
  {
    uint64_t v11 = (void *)v10;
    if (v9)
    {
      uint64_t v12 = [(ICUserIdentityStoreACAccountBackend *)self _userIdentityPropertiesForAccount:v9];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
  }
  uint64_t v12 = 0;
LABEL_6:
  os_unfair_lock_unlock(p_lock);
  if (a4) {
    *a4 = v11;
  }

  return v12;
}

- (id)_userIdentityPropertiesForAccount:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  id v6 = [(NSMutableDictionary *)self->_identityPropertiesCache objectForKey:v5];
  if (!v6)
  {
    id v6 = [(ICUserIdentityStoreACAccountBackend *)self _newUserIdentityPropertiesForAccount:v4];
    identityPropertiesCache = self->_identityPropertiesCache;
    if (!identityPropertiesCache)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
      uint64_t v9 = self->_identityPropertiesCache;
      self->_identityPropertiesCache = v8;

      identityPropertiesCache = self->_identityPropertiesCache;
    }
    [(NSMutableDictionary *)identityPropertiesCache setObject:v6 forKey:v5];
  }

  return v6;
}

- (id)localStoreAccountPropertiesWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v11 = 0;
  id v7 = [(ICMonitoredAccountStore *)monitoredAccountStore localStoreAccountWithError:&v11];
  id v8 = v11;
  if (v7) {
    id v9 = [(ICUserIdentityStoreACAccountBackend *)self _newLocalStoreAccountPropertiesFromAccount:v7];
  }
  else {
    id v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v8;
  }

  return v9;
}

- (id)activeAccountDSIDWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v11 = 0;
  id v7 = [(ICMonitoredAccountStore *)monitoredAccountStore activeStoreAccountWithError:&v11];
  id v8 = v11;
  id v9 = objc_msgSend(v7, "ic_DSID");
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v8;
  }

  return v9;
}

- (id)_newLocalStoreAccountPropertiesFromAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(ICMutableLocalStoreAccountProperties);
  objc_msgSend(v3, "ic_storefront");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = &stru_1EF5F5C40;
  }
  [(ICMutableLocalStoreAccountProperties *)v4 setStorefrontIdentifier:v6];

  id v7 = (void *)[(ICMutableLocalStoreAccountProperties *)v4 copy];
  return v7;
}

- (id)_newUserIdentityPropertiesForAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(ICMutableUserIdentityProperties);
  v5 = objc_msgSend(v3, "ic_altDSID");
  [(ICMutableUserIdentityProperties *)v4 setAlternateDSID:v5];

  id v6 = objc_msgSend(v3, "ic_DSID");
  [(ICMutableUserIdentityProperties *)v4 setDSID:v6];

  id v7 = objc_msgSend(v3, "ic_firstName");
  [(ICMutableUserIdentityProperties *)v4 setFirstName:v7];

  id v8 = objc_msgSend(v3, "ic_lastName");
  [(ICMutableUserIdentityProperties *)v4 setLastName:v8];

  -[ICMutableUserIdentityProperties setManagedAppleID:](v4, "setManagedAppleID:", objc_msgSend(v3, "ic_isManagedAppleID"));
  -[ICMutableUserIdentityProperties setSandboxed:](v4, "setSandboxed:", objc_msgSend(v3, "ic_isSandboxed"));
  id v9 = objc_msgSend(v3, "ic_storefront");
  [(ICMutableUserIdentityProperties *)v4 setStorefrontIdentifier:v9];

  -[ICMutableUserIdentityProperties setSubscriptionStatusEnabled:](v4, "setSubscriptionStatusEnabled:", objc_msgSend(v3, "ic_isSubscriptionStatusEnabled"));
  unint64_t v10 = [v3 username];
  [(ICMutableUserIdentityProperties *)v4 setUsername:v10];

  id v11 = objc_msgSend(v3, "ic_ageVerificationExpirationDate");
  [(ICMutableUserIdentityProperties *)v4 setAgeVerificationExpirationDate:v11];

  uint64_t v12 = objc_msgSend(v3, "ic_mergeWithCloudLibraryPreference");
  [(ICMutableUserIdentityProperties *)v4 setMergeToCloudLibraryPreference:v12];

  uint64_t v13 = objc_msgSend(v3, "ic_homeUserIdentifiers");
  [(ICMutableUserIdentityProperties *)v4 setHomeUserIdentifiers:v13];

  id v14 = objc_msgSend(v3, "ic_cloudLibraryStateReason");
  [(ICMutableUserIdentityProperties *)v4 setCloudLibraryStateReason:v14];

  objc_super v15 = objc_msgSend(v3, "ic_privateListeningEnabled");
  [(ICMutableUserIdentityProperties *)v4 setPrivateListeningEnabled:v15];

  -[ICMutableUserIdentityProperties setActiveLocker:](v4, "setActiveLocker:", objc_msgSend(v3, "ic_isActiveLockerAccount"));
  -[ICMutableUserIdentityProperties setActive:](v4, "setActive:", [v3 isActive]);
  v16 = objc_msgSend(v3, "ic_privateListeningEnabledForHomeUsers");
  [(ICMutableUserIdentityProperties *)v4 setPrivateListeningEnabledForHomeUsers:v16];

  id v17 = objc_msgSend(v3, "ic_privacyAcknowledgementVersions");
  [(ICMutableUserIdentityProperties *)v4 setPrivacyAcknowledgementVersions:v17];

  -[ICMutableUserIdentityProperties setU18MinorAccount:](v4, "setU18MinorAccount:", objc_msgSend(v3, "ic_isU18MinorAccount"));
  id v18 = [v3 accountType];
  long long v19 = [v18 identifier];
  int v20 = [v19 isEqualToString:*MEMORY[0x1E4F17750]];

  if (v20)
  {
    -[ICMutableUserIdentityProperties setCloudBackupEnabled:](v4, "setCloudBackupEnabled:", objc_msgSend(v3, "ic_isCloudBackupEnabled"));
    long long v21 = objc_msgSend(v3, "aa_personID");
    [(ICMutableUserIdentityProperties *)v4 setICloudPersonID:v21];
  }
  long long v22 = (void *)[(ICMutableUserIdentityProperties *)v4 copy];

  return v22;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountStoreDelegateQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_activeAccountDSID, 0);
  objc_storeStrong((id *)&self->_primaryICloudAccount, 0);
  objc_storeStrong((id *)&self->_identityPropertiesCache, 0);

  objc_storeStrong((id *)&self->_monitoredAccountStore, 0);
}

- (ICUserIdentityStoreBackendDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICUserIdentityStoreBackendDelegate *)WeakRetained;
}

- (void)_applyLocalStoreAccountProperties:(id)a3 toAccount:(id)a4
{
  id v5 = a4;
  id v6 = [a3 storefrontIdentifier];
  objc_msgSend(v5, "ic_setStorefront:", v6);
}

- (void)_applyIdentityProperties:(id)a3 toAccount:(id)a4
{
  id v16 = a4;
  id v5 = a3;
  id v6 = [v5 alternateDSID];
  objc_msgSend(v16, "ic_setAltDSID:", v6);

  id v7 = [v5 DSID];
  objc_msgSend(v16, "ic_setDSID:", v7);

  id v8 = [v5 firstName];
  objc_msgSend(v16, "ic_setFirstName:", v8);

  id v9 = [v5 lastName];
  objc_msgSend(v16, "ic_setLastName:", v9);

  objc_msgSend(v16, "ic_setManagedAppleID:", objc_msgSend(v5, "isManagedAppleID"));
  objc_msgSend(v16, "ic_setSandboxed:", objc_msgSend(v5, "isSandboxed"));
  unint64_t v10 = [v5 storefrontIdentifier];
  objc_msgSend(v16, "ic_setStorefront:", v10);

  objc_msgSend(v16, "ic_setSubscriptionStatusEnabled:", objc_msgSend(v5, "isSubscriptionStatusEnabled"));
  id v11 = [v5 username];
  [v16 setUsername:v11];

  uint64_t v12 = [v5 mergeToCloudLibraryPreference];
  objc_msgSend(v16, "ic_setMergeWithCloudLibraryPreference:", v12);

  uint64_t v13 = [v5 cloudLibraryStateReason];
  objc_msgSend(v16, "ic_setCloudLibraryStateReason:", v13);

  id v14 = [v5 privateListeningEnabled];
  objc_msgSend(v16, "ic_setPrivateListeningEnabled:", v14);

  uint64_t v15 = [v5 isActiveLocker];
  objc_msgSend(v16, "ic_setActiveLockerAccount:", v15);
}

- (void)_notifyDelegateOfBackendChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__ICUserIdentityStoreACAccountBackend__notifyDelegateOfBackendChange__block_invoke;
  v6[3] = &unk_1E5ACD4C8;
  id v7 = WeakRetained;
  id v8 = self;
  id v5 = WeakRetained;
  dispatch_async(callbackQueue, v6);
}

uint64_t __69__ICUserIdentityStoreACAccountBackend__notifyDelegateOfBackendChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) userIdentityStoreBackendDidChange:*(void *)(a1 + 40)];
}

- (void)monitoredAccountStore:(id)a3 didChangeCredentialsForAccount:(id)a4
{
  id v5 = a4;
  accountStoreDelegateQueue = self->_accountStoreDelegateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didChangeCredentialsForAccount___block_invoke;
  v8[3] = &unk_1E5ACD4C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(accountStoreDelegateQueue, v8);
}

void __92__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didChangeCredentialsForAccount___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  if (objc_msgSend(*(id *)(a1 + 40), "ic_isITunesAccount"))
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      id v5 = ICCreateLoggableValueForDSID(*(void **)(*(void *)(a1 + 32) + 32));
      int v16 = 138543874;
      uint64_t v17 = v3;
      __int16 v18 = 2114;
      id v19 = v4;
      __int16 v20 = 2112;
      long long v21 = v5;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling credentials-changed notification for iTunes account %{public}@. _activeAccountDSID=%@", (uint8_t *)&v16, 0x20u);
    }
    if (([*(id *)(a1 + 40) isActive] & 1) != 0
      || (+[ICDeviceInfo currentDeviceInfo],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 supportsMultipleITunesAccounts],
          v6,
          (v7 & 1) != 0))
    {
      [*(id *)(a1 + 32) _notifyDelegateOfBackendChange];
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) accountType];
    id v9 = [v8 identifier];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F17750]];

    if (v10)
    {
      id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "ic_description");
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "ic_description");
        int v16 = 138543874;
        uint64_t v17 = v12;
        __int16 v18 = 2114;
        id v19 = v13;
        __int16 v20 = 2112;
        long long v21 = v14;
        _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling credentials-changed notification for Apple account %{public}@. _primaryICloudAccount=%@", (uint8_t *)&v16, 0x20u);
      }
      if (objc_msgSend(*(id *)(a1 + 40), "aa_isAccountClass:", *MEMORY[0x1E4F4BF38])
        && !*(void *)(*(void *)(a1 + 32) + 24))
      {
        uint64_t v15 = [0 identifier];
        if (v15) {
          [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v15];
        }
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
}

- (void)monitoredAccountStore:(id)a3 didRemoveAccount:(id)a4
{
  id v5 = a4;
  accountStoreDelegateQueue = self->_accountStoreDelegateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didRemoveAccount___block_invoke;
  v8[3] = &unk_1E5ACD4C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(accountStoreDelegateQueue, v8);
}

void __78__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didRemoveAccount___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  if (!objc_msgSend(*(id *)(a1 + 40), "ic_isITunesAccount"))
  {
    uint64_t v17 = [*(id *)(a1 + 40) accountType];
    __int16 v18 = [v17 identifier];
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4F17750]];

    if (v19)
    {
      __int16 v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "ic_description");
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        id v23 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "ic_description");
        int v37 = 138543874;
        uint64_t v38 = v21;
        __int16 v39 = 2114;
        id v40 = v22;
        __int16 v41 = 2112;
        v42 = v23;
        _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-removed notification for Apple account %{public}@. _primaryICloudAccount=%@", (uint8_t *)&v37, 0x20u);
      }
      if ((objc_msgSend(*(id *)(a1 + 40), "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]) & 1) == 0)
      {
        __int16 v24 = *(void **)(*(void *)(a1 + 32) + 24);
        id v25 = *(id *)(a1 + 40);
        id v26 = v24;
        if (v25 == v26)
        {
        }
        else
        {
          uint64_t v27 = v26;
          int v28 = [v25 isEqual:v26];

          if (!v28) {
            goto LABEL_16;
          }
        }
      }
      int v29 = 0;
      uint64_t v33 = *(void *)(a1 + 32);
      id v6 = *(void **)(v33 + 24);
      *(void *)(v33 + 24) = 0;
      goto LABEL_25;
    }
LABEL_16:
    int v29 = 0;
    goto LABEL_26;
  }
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "ic_description");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = ICCreateLoggableValueForDSID(*(void **)(*(void *)(a1 + 32) + 32));
    int v37 = 138543874;
    uint64_t v38 = v3;
    __int16 v39 = 2114;
    id v40 = v4;
    __int16 v41 = 2112;
    v42 = v5;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-removed notification for iTunes account %{public}@. _activeAccountDSID=%@", (uint8_t *)&v37, 0x20u);
  }
  id v6 = objc_msgSend(*(id *)(a1 + 40), "ic_DSID");
  if ([*(id *)(a1 + 40) isActive]) {
    goto LABEL_18;
  }
  id v7 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_18;
  }
  int v10 = v9;
  int v11 = [v8 isEqual:v9];

  if (v11)
  {
LABEL_18:
    v30 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(a1 + 32);
      int v37 = 138543362;
      uint64_t v38 = v31;
      _os_log_impl(&dword_1A2D01000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ The active account was removed", (uint8_t *)&v37, 0xCu);
    }

    uint64_t v32 = *(void *)(a1 + 32);
    id v14 = *(NSObject **)(v32 + 32);
    *(void *)(v32 + 32) = 0;
    goto LABEL_21;
  }
  uint64_t v12 = +[ICDeviceInfo currentDeviceInfo];
  int v13 = [v12 supportsMultipleITunesAccounts];

  id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (v15)
    {
      uint64_t v36 = *(void *)(a1 + 32);
      int v37 = 138543618;
      uint64_t v38 = v36;
      __int16 v39 = 2112;
      id v40 = v8;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring removal of account %@", (uint8_t *)&v37, 0x16u);
    }
    int v29 = 0;
    goto LABEL_22;
  }
  if (v15)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    int v37 = 138543618;
    uint64_t v38 = v16;
    __int16 v39 = 2112;
    id v40 = v8;
    _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ A non-active account was removed of account %@", (uint8_t *)&v37, 0x16u);
  }
LABEL_21:
  int v29 = 1;
LABEL_22:

LABEL_25:
LABEL_26:
  v34 = *(void **)(*(void *)(a1 + 32) + 16);
  v35 = [*(id *)(a1 + 40) identifier];
  [v34 removeObjectForKey:v35];

  if (v29) {
    [*(id *)(a1 + 32) _notifyDelegateOfBackendChange];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
}

- (void)monitoredAccountStore:(id)a3 didUpdateAccount:(id)a4
{
  id v5 = a4;
  accountStoreDelegateQueue = self->_accountStoreDelegateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didUpdateAccount___block_invoke;
  v8[3] = &unk_1E5ACD4C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(accountStoreDelegateQueue, v8);
}

void __78__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didUpdateAccount___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  v2 = objc_msgSend(*(id *)(a1 + 40), "ic_DSID");
  if (objc_msgSend(*(id *)(a1 + 40), "ic_isITunesAccount"))
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = ICCreateLoggableValueForDSID(*(void **)(*(void *)(a1 + 32) + 32));
      *(_DWORD *)buf = 138543874;
      uint64_t v76 = v4;
      __int16 v77 = 2114;
      id v78 = v5;
      __int16 v79 = 2112;
      v80 = v6;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-updated notification for iTunes account %{public}@. _activeAccountDSID=%@", buf, 0x20u);
    }
    if (![v2 unsignedLongLongValue]
      && !objc_msgSend(*(id *)(a1 + 40), "ic_isLocalAccount"))
    {
      id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v48 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v76 = v48;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring change to account with no DSID", buf, 0xCu);
      }
LABEL_58:
      id v26 = 0;
LABEL_59:

      goto LABEL_66;
    }
    id v7 = [*(id *)(a1 + 40) identifier];
    if ([*(id *)(a1 + 40) isActive])
    {
LABEL_9:
      if ([*(id *)(a1 + 40) isActive])
      {
        int v13 = *(void **)(*(void *)(a1 + 32) + 32);
        id v14 = v2;
        id v15 = v13;
        if (v14 == v15)
        {
        }
        else
        {
          uint64_t v16 = v15;
          char v17 = [v14 isEqual:v15];

          if ((v17 & 1) == 0)
          {
            __int16 v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v19 = *(void *)(a1 + 32);
              ICCreateLoggableValueForDSID(*(void **)(v19 + 32));
              id v20 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v21 = ICCreateLoggableValueForDSID(v14);
              *(_DWORD *)buf = 138543874;
              uint64_t v76 = v19;
              __int16 v77 = 2112;
              id v78 = v20;
              __int16 v79 = 2112;
              v80 = v21;
              _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected active iTunes account changing from %@ --> %@", buf, 0x20u);
            }
            uint64_t v22 = *(void *)(a1 + 32);
            uint64_t v23 = *(void *)(v22 + 32);
            if (v23)
            {
              __int16 v24 = *(void **)(v22 + 8);
              id v74 = 0;
              id v25 = [v24 storeAccountForDSID:v23 error:&v74];
              id v26 = v74;
              if (v25)
              {
                uint64_t v27 = *(void **)(*(void *)(a1 + 32) + 16);
                int v28 = [v25 identifier];
                [v27 removeObjectForKey:v28];
              }
              uint64_t v22 = *(void *)(a1 + 32);
            }
            else
            {
              id v26 = 0;
            }
            [*(id *)(v22 + 16) removeObjectForKey:v7];
            uint64_t v71 = *(void *)(a1 + 32);
            id v72 = v14;
            id v56 = *(id *)(v71 + 32);
            *(void *)(v71 + 32) = v72;
            goto LABEL_65;
          }
        }
      }
      if (([*(id *)(a1 + 40) isActive] & 1) != 0
        || (objc_msgSend(*(id *)(a1 + 40), "ic_isLocalAccount") & 1) != 0
        || (+[ICDeviceInfo currentDeviceInfo],
            v57 = objc_claimAutoreleasedReturnValue(),
            int v58 = [v57 supportsMultipleITunesAccounts],
            v57,
            v58))
      {
        v59 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v7];
        [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v7];
        v60 = [*(id *)(a1 + 32) _userIdentityPropertiesForAccount:*(void *)(a1 + 40)];
        id v56 = v59;
        id v61 = v60;
        if (v56 == v61)
        {
        }
        else
        {
          char v62 = [v56 isEqual:v61];

          if ((v62 & 1) == 0)
          {
            v63 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v64 = *(void *)(a1 + 32);
              v65 = ICCreateLoggableValueForDSID(v2);
              *(_DWORD *)buf = 138543618;
              uint64_t v76 = v64;
              __int16 v77 = 2112;
              id v78 = v65;
              _os_log_impl(&dword_1A2D01000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected properties change for account %@", buf, 0x16u);
            }
            id v26 = 0;
            goto LABEL_65;
          }
        }
        v66 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v67 = *(void *)(a1 + 32);
          v68 = ICCreateLoggableValueForDSID(v2);
          *(_DWORD *)buf = 138543618;
          uint64_t v76 = v67;
          __int16 v77 = 2112;
          id v78 = v68;
          _os_log_impl(&dword_1A2D01000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %@ changed but properties remain the same - ignoring", buf, 0x16u);
        }
      }
      else
      {
        v69 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v70 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v76 = v70;
          _os_log_impl(&dword_1A2D01000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring change to account", buf, 0xCu);
        }
      }
      goto LABEL_58;
    }
    id v8 = *(void **)(*(void *)(a1 + 32) + 32);
    id v9 = v2;
    id v10 = v8;
    if (v9 == v10)
    {
    }
    else
    {
      int v11 = v10;
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_9;
      }
    }
    v52 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v53 = *(void *)(a1 + 32);
      v54 = ICCreateLoggableValueForDSID(*(void **)(v53 + 32));
      *(_DWORD *)buf = 138543618;
      uint64_t v76 = v53;
      __int16 v77 = 2112;
      id v78 = v54;
      _os_log_impl(&dword_1A2D01000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected active iTunes account changing from %@ --> nil", buf, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v7];
    id v26 = 0;
LABEL_44:
    uint64_t v55 = *(void *)(a1 + 32);
    id v56 = *(id *)(v55 + 32);
    *(void *)(v55 + 32) = 0;
LABEL_65:

    [*(id *)(a1 + 32) _notifyDelegateOfBackendChange];
    goto LABEL_66;
  }
  if (!v2) {
    goto LABEL_21;
  }
  int v29 = *(void **)(*(void *)(a1 + 32) + 32);
  id v30 = v2;
  id v31 = v29;
  if (v30 == v31)
  {
  }
  else
  {
    uint64_t v32 = v31;
    int v33 = [v30 isEqual:v31];

    if (!v33)
    {
LABEL_21:
      id v26 = 0;
      goto LABEL_24;
    }
  }
  v34 = *(void **)(*(void *)(a1 + 32) + 8);
  id v73 = 0;
  v35 = [v34 storeAccountForDSID:v30 error:&v73];
  id v26 = v73;

  if (!v35)
  {
    v49 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = *(void *)(a1 + 32);
      v51 = ICCreateLoggableValueForDSID(*(void **)(v50 + 32));
      *(_DWORD *)buf = 138543618;
      uint64_t v76 = v50;
      __int16 v77 = 2112;
      id v78 = v51;
      _os_log_impl(&dword_1A2D01000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected active iTunes account is no longer an iTunes account at all. Active iTunes account changing from %@ --> nil", buf, 0x16u);
    }
    id v7 = [*(id *)(a1 + 40) identifier];
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v7];
    goto LABEL_44;
  }
LABEL_24:
  uint64_t v36 = [*(id *)(a1 + 40) accountType];
  int v37 = [v36 identifier];
  int v38 = [v37 isEqualToString:*MEMORY[0x1E4F17750]];

  if (v38)
  {
    __int16 v39 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = *(void *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "ic_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v76 = v40;
      __int16 v77 = 2114;
      id v78 = v41;
      __int16 v79 = 2112;
      v80 = v42;
      _os_log_impl(&dword_1A2D01000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-updated notification for Apple account %{public}@. _primaryICloudAccount=%@", buf, 0x20u);
    }
    int v43 = objc_msgSend(*(id *)(a1 + 40), "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]);
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    BOOL v44 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v43)
    {
      if (v44)
      {
        uint64_t v45 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v76 = v45;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected change to primary apple account", buf, 0xCu);
      }

      id v7 = [*(id *)(*(void *)(a1 + 32) + 24) identifier];
      if (v7) {
        [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v7];
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    }
    else if (v44)
    {
      uint64_t v46 = *(void *)(a1 + 32);
      v47 = objc_msgSend(*(id *)(a1 + 40), "ic_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v76 = v46;
      __int16 v77 = 2114;
      id v78 = v47;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring change to non-primary apple account %{public}@", buf, 0x16u);
    }
    goto LABEL_59;
  }
LABEL_66:

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
}

- (void)monitoredAccountStore:(id)a3 didAddAccount:(id)a4
{
  id v5 = a4;
  accountStoreDelegateQueue = self->_accountStoreDelegateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didAddAccount___block_invoke;
  v8[3] = &unk_1E5ACD4C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(accountStoreDelegateQueue, v8);
}

void __75__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didAddAccount___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  if (objc_msgSend(*(id *)(a1 + 40), "ic_isITunesAccount"))
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      id v5 = ICCreateLoggableValueForDSID(*(void **)(*(void *)(a1 + 32) + 32));
      int v20 = 138543874;
      uint64_t v21 = v3;
      __int16 v22 = 2114;
      id v23 = v4;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-added notification for iTunes account %{public}@. _activeAccountDSID=%@", (uint8_t *)&v20, 0x20u);
    }
    id v6 = objc_msgSend(*(id *)(a1 + 40), "ic_DSID");
    if (![v6 unsignedLongLongValue]
      || ([*(id *)(a1 + 40) isActive] & 1) == 0
      && (+[ICDeviceInfo currentDeviceInfo],
          id v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 supportsMultipleITunesAccounts],
          v7,
          !v8))
    {

      goto LABEL_19;
    }
    if ([*(id *)(a1 + 40) isActive]) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v6);
    }
    id v9 = *(void **)(*(void *)(a1 + 32) + 16);
    id v10 = [*(id *)(a1 + 40) identifier];
    [v9 removeObjectForKey:v10];
    goto LABEL_17;
  }
  int v11 = [*(id *)(a1 + 40) accountType];
  int v12 = [v11 identifier];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F17750]];

  if (v13)
  {
    id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      char v17 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "ic_description");
      int v20 = 138543874;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v17;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-added notification for Apple account %{public}@. _primaryICloudAccount=%@", (uint8_t *)&v20, 0x20u);
    }
    if (objc_msgSend(*(id *)(a1 + 40), "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]))
    {
      id v6 = [*(id *)(*(void *)(a1 + 32) + 24) identifier];
      if (v6) {
        [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v6];
      }
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = *(id *)(a1 + 40);
      id v10 = *(void **)(v18 + 24);
      *(void *)(v18 + 24) = v19;
LABEL_17:

      [*(id *)(a1 + 32) _notifyDelegateOfBackendChange];
    }
  }
LABEL_19:
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
}

- (id)storeAccountForDSID:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v28 = 0;
  id v9 = [(ICMonitoredAccountStore *)monitoredAccountStore allStoreAccountsWithError:&v28];
  id v10 = v28;
  id v11 = 0;
  if (!v10)
  {
    id v23 = a4;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      __int16 v22 = v9;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          char v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_msgSend(v17, "ic_DSID", v22);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          if (v18 == v6)
          {

LABEL_14:
            id v11 = v17;
            id v9 = v22;
            goto LABEL_15;
          }
          id v19 = v18;
          int v20 = [v18 isEqual:v6];

          if (v20) {
            goto LABEL_14;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
        id v11 = 0;
        id v9 = v22;
        if (v14) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v11 = 0;
    }
LABEL_15:

    a4 = v23;
  }
  os_unfair_lock_unlock(p_lock);
  if (a4) {
    *a4 = v10;
  }

  return v11;
}

- (id)localStoreAccountWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v19 = 0;
  id v7 = [(ICMonitoredAccountStore *)monitoredAccountStore allStoreAccountsWithError:&v19];
  id v8 = v19;
  id v9 = 0;
  if (!v8)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v7;
    id v9 = (id)[v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v10);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "ic_isLocalAccount", (void)v15))
          {
            id v9 = v13;
            goto LABEL_12;
          }
        }
        id v9 = (id)[v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v8;
  }

  return v9;
}

- (id)allStoreAccountsWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v11 = 0;
  id v7 = [(ICMonitoredAccountStore *)monitoredAccountStore allStoreAccountsWithError:&v11];
  id v8 = v11;
  id v9 = (void *)[v7 copy];

  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v8;
  }

  return v9;
}

- (id)allStoreAccountDSIDsWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v27 = 0;
  id v7 = [(ICMonitoredAccountStore *)monitoredAccountStore allStoreAccountsWithError:&v27];
  id v8 = v27;
  id v9 = 0;
  if (!v8)
  {
    __int16 v22 = a3;
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v21 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v16 = objc_msgSend(v15, "ic_DSID", v21);
          uint64_t v17 = [v16 unsignedLongLongValue];

          if (v17)
          {
            long long v18 = objc_msgSend(v15, "ic_DSID");
            [v9 addObject:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v12);
    }

    id v7 = v21;
    a3 = v22;
  }
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v8;
  }
  id v19 = objc_msgSend(v9, "copy", v21);

  return v19;
}

- (BOOL)setLocalStoreAccountProperties:(id)a3 error:(id *)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v15 = 0;
  id v9 = [(ICMonitoredAccountStore *)monitoredAccountStore localStoreAccountWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    [(ICUserIdentityStoreACAccountBackend *)self _applyLocalStoreAccountProperties:v6 toAccount:v9];
    uint64_t v11 = self->_monitoredAccountStore;
    id v14 = v10;
    [(ICMonitoredAccountStore *)v11 saveAccount:v9 error:&v14];
    id v12 = v14;

    id v10 = v12;
  }
  os_unfair_lock_unlock(p_lock);
  if (a4) {
    *a4 = v10;
  }

  return v10 == 0;
}

- (id)verificationContextForAccountEstablishmentWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v13 = 0;
  id v7 = [(ICMonitoredAccountStore *)monitoredAccountStore storeAccountTypeWithError:&v13];
  id v8 = v13;
  id v9 = 0;
  if (!v8)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v7];
    uint64_t v11 = [(ICMonitoredAccountStore *)self->_monitoredAccountStore acAccountStore];
    id v9 = +[ICUserVerificationContext contextWithACAccount:v10 accountStore:v11];
  }
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v8;
  }

  return v9;
}

- (id)verificationContextForDSID:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v15 = 0;
  uint64_t v9 = [(ICMonitoredAccountStore *)monitoredAccountStore storeAccountForDSID:v7 error:&v15];

  uint64_t v10 = (uint64_t)v15;
  if (!(v10 | v9))
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
  }
  if (v10)
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v12 = [(ICMonitoredAccountStore *)self->_monitoredAccountStore acAccountStore];
    uint64_t v11 = +[ICUserVerificationContext contextWithACAccount:v9 accountStore:v12];

    id v13 = [(ICUserIdentityStoreACAccountBackend *)self _userIdentityPropertiesForAccount:v9];
    [v11 setIdentityProperties:v13];
  }
  os_unfair_lock_unlock(p_lock);
  if (a4) {
    *a4 = (id) v10;
  }

  return v11;
}

- (BOOL)setIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  p_lock = &self->_lock;
  id v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v20 = 0;
  uint64_t v12 = [(ICMonitoredAccountStore *)monitoredAccountStore storeAccountForDSID:v10 error:&v20];

  uint64_t v13 = (uint64_t)v20;
  if (!(v13 | v12))
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
  }
  if (!v13)
  {
    [(ICUserIdentityStoreACAccountBackend *)self _applyIdentityProperties:v8 toAccount:v12];
    id v14 = self->_monitoredAccountStore;
    id v19 = 0;
    [(ICMonitoredAccountStore *)v14 saveAccount:v12 error:&v19];
    uint64_t v13 = (uint64_t)v19;
    if (!v13)
    {
      identityPropertiesCache = self->_identityPropertiesCache;
      long long v16 = (void *)[v8 copy];
      uint64_t v17 = [(id)v12 identifier];
      [(NSMutableDictionary *)identityPropertiesCache setObject:v16 forKey:v17];

      uint64_t v13 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  if (a5) {
    *a5 = (id) v13;
  }

  return v13 == 0;
}

- (BOOL)replaceIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  p_lock = &self->_lock;
  id v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v20 = 0;
  uint64_t v12 = [(ICMonitoredAccountStore *)monitoredAccountStore storeAccountForDSID:v10 error:&v20];

  uint64_t v13 = (uint64_t)v20;
  if (!(v13 | v12))
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
  }
  if (!v13)
  {
    [(ICUserIdentityStoreACAccountBackend *)self _applyIdentityProperties:v8 toAccount:v12];
    id v14 = self->_monitoredAccountStore;
    id v19 = 0;
    [(ICMonitoredAccountStore *)v14 saveAccount:v12 error:&v19];
    uint64_t v13 = (uint64_t)v19;
    if (!v13)
    {
      identityPropertiesCache = self->_identityPropertiesCache;
      long long v16 = (void *)[v8 copy];
      uint64_t v17 = [(id)v12 identifier];
      [(NSMutableDictionary *)identityPropertiesCache setObject:v16 forKey:v17];

      uint64_t v13 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  if (a5) {
    *a5 = (id) v13;
  }

  return v13 == 0;
}

- (void)removeIdentityForDSID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  p_lock = &self->_lock;
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v23 = 0;
  id v10 = [(ICMonitoredAccountStore *)monitoredAccountStore storeAccountForDSID:v8 error:&v23];

  id v11 = v23;
  if (v11)
  {
    if (v6)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke;
      block[3] = &unk_1E5ACD2F0;
      id v22 = v6;
      id v21 = v11;
      dispatch_async(callbackQueue, block);

      uint64_t v13 = v22;
LABEL_8:
    }
  }
  else
  {
    if (v10)
    {
      id v14 = [(ICMonitoredAccountStore *)self->_monitoredAccountStore acAccountStore];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_3;
      v16[3] = &unk_1E5ACCD60;
      v16[4] = self;
      id v17 = v6;
      [v14 removeAccount:v10 withCompletionHandler:v16];

      uint64_t v13 = v17;
      goto LABEL_8;
    }
    if (v6)
    {
      id v15 = self->_callbackQueue;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_2;
      v18[3] = &unk_1E5ACD170;
      id v19 = v6;
      dispatch_async(v15, v18);
      uint64_t v13 = v19;
      goto LABEL_8;
    }
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  [*(id *)(a1 + 32) _synchronize];
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_4;
    block[3] = &unk_1E5ACD008;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
}

uint64_t __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (BOOL)disableLockerAccountDSID:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"ICUserIdentityStoreACAccountBackend.m", 162, @"Invalid parameter not satisfying: %@", @"accountDSID != nil" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v19 = 0;
  id v9 = [(ICMonitoredAccountStore *)monitoredAccountStore storeAccountForDSID:v7 error:&v19];
  id v10 = v19;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v10)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
  }
  uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = ICCreateLoggableValueForDSID(v7);
    *(_DWORD *)buf = 138543874;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2114;
    id v25 = v11;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Could not load store account for accountDSID=%@, error=%{public}@", buf, 0x20u);
  }
  if (!v11)
  {
LABEL_11:
    id v14 = [(ICMonitoredAccountStore *)self->_monitoredAccountStore acAccountStore];
    id v18 = 0;
    int v15 = objc_msgSend(v14, "ic_disableActiveLockerAccount:error:", v9, &v18);
    id v11 = v18;

    if (v15) {
      [(ICUserIdentityStoreACAccountBackend *)self _synchronize];
    }
  }
LABEL_13:
  os_unfair_lock_unlock(&self->_lock);
  if (a4) {
    *a4 = v11;
  }

  return v11 == 0;
}

- (BOOL)updateActiveLockerAccountDSID:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v16 = 0;
  id v9 = [(ICMonitoredAccountStore *)monitoredAccountStore storeAccountForDSID:v7 error:&v16];

  id v10 = v16;
  id v11 = v10;
  if (v7 && !v10 && !v9)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
  }
  if (!v11)
  {
    uint64_t v12 = [(ICMonitoredAccountStore *)self->_monitoredAccountStore acAccountStore];
    id v15 = 0;
    int v13 = objc_msgSend(v12, "ic_setActiveLockerAccount:error:", v9, &v15);
    id v11 = v15;

    if (v13) {
      [(ICUserIdentityStoreACAccountBackend *)self _synchronize];
    }
  }
  os_unfair_lock_unlock(p_lock);
  if (a4) {
    *a4 = v11;
  }

  return v11 == 0;
}

- (id)accountDSIDForAltDSID:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v13 = 0;
  id v9 = [(ICMonitoredAccountStore *)monitoredAccountStore storeAccountForAltDSID:v7 error:&v13];

  id v10 = v13;
  id v11 = objc_msgSend(v9, "ic_DSID");
  os_unfair_lock_unlock(p_lock);
  if (a4) {
    *a4 = v10;
  }

  return v11;
}

- (BOOL)updateActiveAccountDSID:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  id v15 = 0;
  uint64_t v9 = [(ICMonitoredAccountStore *)monitoredAccountStore storeAccountForDSID:v7 error:&v15];

  uint64_t v10 = (uint64_t)v15;
  if (!(v10 | v9))
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
  }
  if (!v10)
  {
    id v11 = [(ICMonitoredAccountStore *)self->_monitoredAccountStore acAccountStore];
    id v14 = 0;
    int v12 = objc_msgSend(v11, "ic_setActiveStoreAccount:error:", v9, &v14);
    uint64_t v10 = (uint64_t)v14;

    if (v12) {
      [(ICUserIdentityStoreACAccountBackend *)self _synchronize];
    }
  }
  os_unfair_lock_unlock(p_lock);
  if (a4) {
    *a4 = (id) v10;
  }

  return v10 == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end