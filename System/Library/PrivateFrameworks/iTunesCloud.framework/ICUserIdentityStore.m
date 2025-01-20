@interface ICUserIdentityStore
+ (BOOL)canAccessAccountStore;
+ (BOOL)supportsSecureCoding;
+ (ICUserIdentityStore)defaultIdentityStore;
+ (ICUserIdentityStore)nullIdentityStore;
+ (id)testingIdentityStoreWithDatabasePath:(id)a3;
+ (id)testingIdentityStoreWithSingleWriterService:(id)a3;
+ (void)_claimSingleWriterStatus;
- (BOOL)_allowsDelegationForUserIdentity:(id)a3;
- (BOOL)_refreshLocalStoreAccountPropertiesAllowingDidChangeNotification:(BOOL)a3;
- (BOOL)_saveIdentityProperties:(id)a3 andPostAccountChangeNotification:(BOOL)a4 forUserIdentity:(id)a5 error:(id *)a6;
- (BOOL)insertPropertiesForUserIdentity:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (ICLocalStoreAccountProperties)localStoreAccountProperties;
- (ICUserIdentityStore)initWithCoder:(id)a3;
- (ICUserIdentityStoreBackend)_unsafeBackend;
- (id)DSIDForUserIdentity:(id)a3 outError:(id *)a4;
- (id)_dsidForTimestamp:(unint64_t)a3 history:(id)a4;
- (id)_dsidForUserIdentity:(id)a3 error:(id *)a4;
- (id)_existingIdentityPropertiesForUserIdentity:(id)a3 error:(id *)a4;
- (id)_icValidStoreAccountsFromACAccounts:(id)a3;
- (id)_initCommon;
- (id)_initWithStyle:(int64_t)a3 delegateAccountStoreOptions:(id)a4;
- (id)_openDelegateAccountStoreForUserIdentity:(id)a3 error:(id *)a4;
- (id)_openDelegateAccountStoreWithError:(id *)a3;
- (id)getPropertiesForActiveICloudAccountReturningError:(id *)a3;
- (id)getPropertiesForUserIdentity:(id)a3 error:(id *)a4;
- (id)getVerificationContextForUserIdentity:(id)a3 error:(id *)a4;
- (id)userIdentitiesForAllStoreAccountsWithError:(id *)a3;
- (id)userIdentitiesForManageableAccountsWithError:(id *)a3;
- (int64_t)identityStoreStyle;
- (unint64_t)hash;
- (void)_assertNonNullIdentityStoreForSelector:(SEL)a3;
- (void)_delegateAccountStoreDidChangeNotification:(id)a3;
- (void)_dispatchDidChangeNotification:(BOOL)a3 didDelegateAccountStoreChange:(BOOL)a4;
- (void)_importValuesFromCodingHelper:(id)a3;
- (void)_initializeLocalStoreAccountProperties;
- (void)_prepareDelegateAccountStoreWithCompletionHandler:(id)a3;
- (void)_registerForDelegateAccountStoreNotifications:(id)a3;
- (void)_reloadForExternalChange;
- (void)_resetDelegateAccountStoreWithCompletionHandler:(id)a3;
- (void)_unregisterForDelegateAccountStoreNotifications:(id)a3;
- (void)_unsafe_deleteDelegateAccountStore;
- (void)_updateDelegateAccountStoreUsingBlock:(id)a3;
- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)disableLockerAccountWithDSID:(id)a3 completionHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateDelegateTokensUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)enumerateDelegateTokensWithType:(int64_t)a3 usingBlock:(id)a4 completionHandler:(id)a5;
- (void)getDelegationUUIDsForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)getPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)insertPropertiesForUserIdentity:(id)a3 andPostAccountChangeNotification:(BOOL)a4 usingBlock:(id)a5 completionHandler:(id)a6;
- (void)insertPropertiesForUserIdentity:(id)a3 usingBlock:(id)a4;
- (void)insertPropertiesForUserIdentity:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5;
- (void)removeAllDelegateTokensWithCompletionHandler:(id)a3;
- (void)removeDelegateTokenForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)removeDelegateTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4;
- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)removePropertiesForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)setActiveAccountWithDSID:(id)a3 completionHandler:(id)a4;
- (void)setActiveLockerAccountWithDSID:(id)a3 completionHandler:(id)a4;
- (void)synchronize;
- (void)synchronizeWithCompletionHandler:(id)a3;
- (void)updatePropertiesForLocalStoreAccountUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)updatePropertiesForUserIdentity:(id)a3 usingBlock:(id)a4;
- (void)updatePropertiesForUserIdentity:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5;
- (void)userIdentityStoreBackendDidChange:(id)a3;
@end

@implementation ICUserIdentityStore

+ (BOOL)canAccessAccountStore
{
  return objc_msgSend(MEMORY[0x1E4F179C8], "ic_canAccessAccountStore");
}

- (id)getPropertiesForUserIdentity:(id)a3 error:(id *)a4
{
  id v7 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__37878;
  v27 = __Block_byref_object_dispose__37879;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__37878;
  v21 = __Block_byref_object_dispose__37879;
  id v22 = 0;
  accessQueue = self->_accessQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__ICUserIdentityStore_getPropertiesForUserIdentity_error___block_invoke;
  v12[3] = &unk_1E5ACCE78;
  id v9 = v7;
  id v13 = v9;
  v14 = self;
  v15 = &v17;
  v16 = &v23;
  dispatch_sync(accessQueue, v12);
  if (a4) {
    *a4 = (id) v24[5];
  }
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (int64_t)identityStoreStyle
{
  return [(ICUserIdentityStoreCoding *)self->_codingHelper identityStoreStyle];
}

- (id)DSIDForUserIdentity:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__37878;
  v27 = __Block_byref_object_dispose__37879;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__37878;
  v21 = __Block_byref_object_dispose__37879;
  id v22 = 0;
  accessQueue = self->_accessQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__ICUserIdentityStore_DSIDForUserIdentity_outError___block_invoke;
  v12[3] = &unk_1E5ACCE78;
  id v9 = v7;
  id v13 = v9;
  v14 = self;
  v15 = &v23;
  v16 = &v17;
  dispatch_sync(accessQueue, v12);
  if (a4) {
    *a4 = (id) v18[5];
  }
  id v10 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __52__ICUserIdentityStore_DSIDForUserIdentity_outError___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasResolvedDSID];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [v3 DSID];
    MEMORY[0x1F41817F8]();
    return;
  }
  uint64_t v4 = [v3 type];
  if (!*(void *)(*(void *)(a1 + 40) + 64))
  {
    uint64_t v5 = mach_absolute_time();
    if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v11 = *(void **)(*(void *)(a1 + 40) + 24);
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      id v32 = *(id *)(v12 + 40);
      v8 = [v11 activeLockerAccountDSIDWithError:&v32];
      objc_storeStrong((id *)(v12 + 40), v32);
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v9 = 72;
      uint64_t v10 = 16;
    }
    else
    {
      if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
        goto LABEL_14;
      }
      v6 = *(void **)(*(void *)(a1 + 40) + 24);
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v7 + 40);
      v8 = [v6 activeAccountDSIDWithError:&obj];
      objc_storeStrong((id *)(v7 + 40), obj);
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
        goto LABEL_13;
      }
      uint64_t v9 = 64;
      uint64_t v10 = 8;
    }
    [*(id *)(*(void *)(a1 + 40) + v10) addValue:v8 timestamp:v5];
    *(void *)(*(void *)(a1 + 40) + v9) = v5;
    goto LABEL_13;
  }
LABEL_14:
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    switch(v4)
    {
      case 0:
        id v13 = *(void **)(a1 + 40);
        uint64_t v14 = [*(id *)(a1 + 32) creationTime];
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
        goto LABEL_18;
      case 1:
        id v13 = *(void **)(a1 + 40);
        uint64_t v14 = [*(id *)(a1 + 32) creationTime];
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 16);
LABEL_18:
        uint64_t v16 = [v13 _dsidForTimestamp:v14 history:v15];
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
        v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

        goto LABEL_25;
      case 2:
        uint64_t v19 = *(void **)(a1 + 40);
        uint64_t v20 = mach_absolute_time();
        uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
        goto LABEL_21;
      case 3:
        uint64_t v19 = *(void **)(a1 + 40);
        uint64_t v20 = mach_absolute_time();
        uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 16);
LABEL_21:
        uint64_t v22 = [v19 _dsidForTimestamp:v20 history:v21];
        goto LABEL_23;
      case 4:
      case 5:
        return;
      case 6:
        uint64_t v22 = [*(id *)(a1 + 32) DSID];
LABEL_23:
        uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
        v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;

        break;
      case 7:
        uint64_t v25 = *(void **)(*(void *)(a1 + 40) + 24);
        v26 = [*(id *)(a1 + 32) altDSID];
        uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
        id v31 = *(id *)(v27 + 40);
        uint64_t v28 = [v25 accountDSIDForAltDSID:v26 error:&v31];
        objc_storeStrong((id *)(v27 + 40), v31);
        uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
        v30 = *(void **)(v29 + 40);
        *(void *)(v29 + 40) = v28;

LABEL_25:
        [*(id *)(a1 + 32) _setResolvedDSID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        break;
      default:
        JUMPOUT(0);
    }
  }
}

- (id)_dsidForUserIdentity:(id)a3 error:(id *)a4
{
  id v7 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  v8 = [v7 DSID];
  if ([v7 hasResolvedDSID])
  {
    id v9 = 0;
    goto LABEL_21;
  }
  uint64_t v10 = [v7 type];
  p_lastKnownActiveAccountTimestamp = &self->_lastKnownActiveAccountTimestamp;
  if (self->_lastKnownActiveAccountTimestamp) {
    goto LABEL_4;
  }
  uint64_t v14 = mach_absolute_time();
  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    backend = self->_backend;
    id v29 = 0;
    uint64_t v16 = [(ICUserIdentityStoreBackend *)backend activeLockerAccountDSIDWithError:&v29];
    id v17 = v29;
    if (!v17)
    {
      [(ICValueHistory *)self->_activeLockerAccountHistory addValue:v16 timestamp:v14];
      p_lastKnownActiveAccountTimestamp = &self->_lastKnownActiveLockerAccountTimestamp;
      goto LABEL_27;
    }
LABEL_11:
    id v9 = v17;

    goto LABEL_21;
  }
  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    goto LABEL_4;
  }
  uint64_t v15 = self->_backend;
  id v30 = 0;
  uint64_t v16 = [(ICUserIdentityStoreBackend *)v15 activeAccountDSIDWithError:&v30];
  id v17 = v30;
  if (v17) {
    goto LABEL_11;
  }
  [(ICValueHistory *)self->_activeAccountHistory addValue:v16 timestamp:v14];
LABEL_27:
  unint64_t *p_lastKnownActiveAccountTimestamp = v14;

LABEL_4:
  id v9 = 0;
  switch(v10)
  {
    case 0:
      uint64_t v12 = [v7 creationTime];
      activeAccountHistory = self->_activeAccountHistory;
      goto LABEL_13;
    case 1:
      uint64_t v12 = [v7 creationTime];
      activeAccountHistory = self->_activeLockerAccountHistory;
LABEL_13:
      uint64_t v19 = [(ICUserIdentityStore *)self _dsidForTimestamp:v12 history:activeAccountHistory];

      [v7 _setResolvedDSID:v19];
      goto LABEL_18;
    case 2:
      uint64_t v20 = self->_backend;
      uint64_t v28 = 0;
      uint64_t v19 = [(ICUserIdentityStoreBackend *)v20 activeAccountDSIDWithError:&v28];
      uint64_t v21 = v28;
      goto LABEL_16;
    case 3:
      uint64_t v22 = self->_backend;
      uint64_t v27 = 0;
      uint64_t v19 = [(ICUserIdentityStoreBackend *)v22 activeLockerAccountDSIDWithError:&v27];
      uint64_t v21 = v27;
LABEL_16:
      id v9 = v21;

      goto LABEL_20;
    case 6:
      uint64_t v19 = [v7 DSID];

LABEL_18:
      id v9 = 0;
      goto LABEL_20;
    case 7:
      uint64_t v23 = self->_backend;
      v24 = [v7 altDSID];
      id v26 = 0;
      uint64_t v19 = [(ICUserIdentityStoreBackend *)v23 accountDSIDForAltDSID:v24 error:&v26];
      id v9 = v26;

      [v7 _setResolvedDSID:v19];
LABEL_20:
      v8 = (void *)v19;
      break;
    default:
      break;
  }
LABEL_21:
  if (a4) {
    *a4 = v9;
  }

  return v8;
}

- (id)_dsidForTimestamp:(unint64_t)a3 history:(id)a4
{
  id v7 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  v8 = [v7 firstValueBeforeTimestamp:a3];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v7 firstValueAfterOrEqualToTimestamp:a3];
  }
  v11 = v10;

  return v11;
}

- (id)_existingIdentityPropertiesForUserIdentity:(id)a3 error:(id *)a4
{
  id v7 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__37878;
  v37 = __Block_byref_object_dispose__37879;
  id v38 = 0;
  BOOL v8 = [(ICUserIdentityStore *)self _allowsDelegationForUserIdentity:v7];
  unint64_t v9 = [v7 type];
  id v10 = 0;
  if (v9 > 7) {
    goto LABEL_14;
  }
  if (((1 << v9) & 0xCF) != 0)
  {
    id v32 = 0;
    v11 = [(ICUserIdentityStore *)self _dsidForUserIdentity:v7 error:&v32];
    id v10 = v32;
    if (!v10 && v11)
    {
      backend = self->_backend;
      id v31 = 0;
      id v13 = [(ICUserIdentityStoreBackend *)backend activeAccountDSIDWithError:&v31];
      id v10 = v31;
      if (!v10)
      {
        if (v8 && ![v13 isEqual:v11])
        {
          id v10 = 0;
        }
        else
        {
          uint64_t v14 = self->_backend;
          id v30 = 0;
          uint64_t v15 = [(ICUserIdentityStoreBackend *)v14 identityPropertiesForDSID:v11 error:&v30];
          id v10 = v30;
          uint64_t v16 = [v15 mutableCopy];
          id v17 = (void *)v34[5];
          v34[5] = v16;
        }
      }
    }
  }
  else
  {
    if (v9 != 4) {
      goto LABEL_14;
    }
    v18 = objc_alloc_init(ICMutableUserIdentityProperties);
    uint64_t v19 = (void *)v34[5];
    v34[5] = (uint64_t)v18;

    uint64_t v20 = (void *)v34[5];
    v11 = [v7 deviceIdentifier];
    [v20 setCarrierBundleDeviceIdentifier:v11];
    id v10 = 0;
  }

LABEL_14:
  if (v34[5]) {
    BOOL v21 = 0;
  }
  else {
    BOOL v21 = v8;
  }
  if (v21)
  {
    id v29 = v10;
    uint64_t v22 = [(ICUserIdentityStore *)self _openDelegateAccountStoreWithError:&v29];
    id v23 = v29;

    if (v22)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __72__ICUserIdentityStore__existingIdentityPropertiesForUserIdentity_error___block_invoke;
      v26[3] = &unk_1E5ACD030;
      uint64_t v28 = &v33;
      id v27 = v7;
      [v22 readUsingBlock:v26];
    }
    id v10 = v23;
  }
  if (a4) {
    *a4 = v10;
  }
  id v24 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v24;
}

- (BOOL)_allowsDelegationForUserIdentity:(id)a3
{
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  if ([v5 allowsDelegation])
  {
    uint64_t v6 = [v5 type];
    if (v6 == 7)
    {
      backend = self->_backend;
      id v19 = 0;
      id v10 = [(ICUserIdentityStoreBackend *)backend activeAccountDSIDWithError:&v19];
      id v11 = v19;
      id v18 = v11;
      uint64_t v12 = [(ICUserIdentityStore *)self DSIDForUserIdentity:v5 outError:&v18];
      id v13 = v18;

      if (v12 == v10) {
        LOBYTE(v7) = 0;
      }
      else {
        int v7 = [v12 isEqual:v10] ^ 1;
      }
    }
    else if (v6 == 6)
    {
      uint64_t v14 = self->_backend;
      uint64_t v20 = 0;
      uint64_t v15 = [(ICUserIdentityStoreBackend *)v14 activeAccountDSIDWithError:&v20];
      uint64_t v16 = [v5 DSID];
      id v17 = v16;
      if (v16 == v15) {
        LOBYTE(v7) = 0;
      }
      else {
        int v7 = [v16 isEqual:v15] ^ 1;
      }
    }
    else
    {
      LOBYTE(v7) = v6 == 4;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  unint64_t v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v66 = __ROR8__(v14 + v13, 32);
  uint64_t v69 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v63 = (v14 + v13) ^ __ROR8__(v13, 47);

  int64_t v18 = [(ICUserIdentityStoreCoding *)self->_codingHelper identityStoreStyle];
  uint64_t v19 = (v17 + v63) ^ __ROR8__(v63, 51);
  uint64_t v20 = v66 + (v69 ^ v18);
  uint64_t v21 = __ROR8__(v69 ^ v18, 48);
  uint64_t v22 = (v20 ^ v21) + __ROR8__(v17 + v63, 32);
  uint64_t v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  uint64_t v24 = v20 + v19;
  uint64_t v67 = __ROR8__(v24, 32);
  uint64_t v70 = v23;
  int64_t v61 = v22 ^ v18;
  uint64_t v64 = v24 ^ __ROR8__(v19, 47);
  uint64_t v25 = self->_delegateAccountStoreOptions;
  uint64_t data = [(ICDelegateAccountStoreOptions *)v25 hash];
  int64_t v26 = (v61 + v64) ^ __ROR8__(v64, 51);
  uint64_t v27 = v67 + (v70 ^ data);
  uint64_t v28 = __ROR8__(v70 ^ data, 48);
  uint64_t v29 = (v27 ^ v28) + __ROR8__(v61 + v64, 32);
  uint64_t v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  uint64_t v31 = v27 + v26;
  uint64_t v68 = __ROR8__(v31, 32);
  uint64_t v71 = v30;
  uint64_t v62 = v29 ^ data;
  uint64_t v65 = v31 ^ __ROR8__(v26, 47);

  uint64_t v32 = (v62 + v65) ^ __ROR8__(v65, 51);
  uint64_t v33 = v68 + (v71 ^ 0x1800000000000000);
  uint64_t v34 = __ROR8__(v71 ^ 0x1800000000000000, 48);
  uint64_t v35 = (v33 ^ v34) + __ROR8__(v62 + v65, 32);
  uint64_t v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
  uint64_t v37 = v33 + v32;
  uint64_t v38 = v37 ^ __ROR8__(v32, 47);
  uint64_t v39 = (v35 ^ 0x1800000000000000) + v38;
  uint64_t v40 = v39 ^ __ROR8__(v38, 51);
  uint64_t v41 = (__ROR8__(v37, 32) ^ 0xFFLL) + v36;
  uint64_t v42 = __ROR8__(v36, 48);
  uint64_t v43 = __ROR8__(v39, 32) + (v41 ^ v42);
  uint64_t v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
  uint64_t v45 = v40 + v41;
  uint64_t v46 = v45 ^ __ROR8__(v40, 47);
  uint64_t v47 = v46 + v43;
  uint64_t v48 = v47 ^ __ROR8__(v46, 51);
  uint64_t v49 = __ROR8__(v45, 32) + v44;
  uint64_t v50 = __ROR8__(v44, 48);
  uint64_t v51 = __ROR8__(v47, 32) + (v49 ^ v50);
  uint64_t v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
  uint64_t v53 = v48 + v49;
  uint64_t v54 = v53 ^ __ROR8__(v48, 47);
  uint64_t v55 = v54 + v51;
  uint64_t v56 = v55 ^ __ROR8__(v54, 51);
  uint64_t v57 = __ROR8__(v53, 32) + v52;
  uint64_t v58 = __ROR8__(v52, 48);
  uint64_t v59 = __ROR8__(v55, 32) + (v57 ^ v58);
  return (v56 + v57) ^ __ROR8__(v56, 47) ^ v59 ^ __ROR8__(v56 + v57, 32) ^ v59 ^ __ROR8__(v57 ^ v58, 43);
}

- (void)_assertNonNullIdentityStoreForSelector:(SEL)a3
{
  if ([(ICUserIdentityStoreCoding *)self->_codingHelper identityStoreStyle] == 2)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ICUserIdentityStore.m", 1307, @"The following method is not supported on the null identity store: %s.", sel_getName(a2));
  }
}

uint64_t __70__ICUserIdentityStore_getPropertiesForUserIdentity_completionHandler___block_invoke_28(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __53__ICUserIdentityStore__importValuesFromCodingHelper___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  if (v2 != [*(id *)(*(void *)(a1 + 40) + 32) uniqueIdentifier])
  {
    id v4 = [*(id *)(a1 + 32) activeAccountHistory];
    if (v4) {
      [*(id *)(*(void *)(a1 + 40) + 8) addValuesFromHistory:v4];
    }
    uint64_t v3 = [*(id *)(a1 + 32) activeLockerAccountHistory];
    if (v3) {
      [*(id *)(*(void *)(a1 + 40) + 16) addValuesFromHistory:v3];
    }
  }
}

+ (ICUserIdentityStore)nullIdentityStore
{
  if (nullIdentityStore_sNullIdentityStoreOnceToken != -1) {
    dispatch_once(&nullIdentityStore_sNullIdentityStoreOnceToken, &__block_literal_global_55);
  }
  uint64_t v2 = (void *)nullIdentityStore_sNullIdentityStore;

  return (ICUserIdentityStore *)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICUserIdentityStore *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(ICUserIdentityStore *)v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    int64_t v6 = [(ICUserIdentityStoreCoding *)self->_codingHelper identityStoreStyle];
    if (v6 == [(ICUserIdentityStoreCoding *)v5->_codingHelper identityStoreStyle])
    {
      delegateAccountStoreOptions = self->_delegateAccountStoreOptions;
      uint64_t v8 = v5->_delegateAccountStoreOptions;
      unint64_t v9 = delegateAccountStoreOptions;
      id v10 = v9;
      if (v9 == v8) {
        char v11 = 1;
      }
      else {
        char v11 = [(ICDelegateAccountStoreOptions *)v9 isEqual:v8];
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (ICUserIdentityStore)defaultIdentityStore
{
  if (defaultIdentityStore_sOnceToken != -1) {
    dispatch_once(&defaultIdentityStore_sOnceToken, &__block_literal_global_37991);
  }
  uint64_t v2 = (void *)defaultIdentityStore_sDefaultIdentityStore;

  return (ICUserIdentityStore *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __73__ICUserIdentityStore_getPropertiesForActiveICloudAccountReturningError___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[ICSecurityInfo sharedSecurityInfo];
  if ([v2 isContentProtectionEnabled]
    && ([v2 isDeviceClassCUnlocked] & 1) == 0)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Request for properties for active iCloud account before first unlock.", buf, 2u);
    }
  }
  id v4 = *(void **)(a1[4] + 24);
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 identityPropertiesForPrimaryICloudAccountWithError:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    unint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Failed to load active icloud account properties. err=%{public}@", buf, 0xCu);
    }
  }
}

void __70__ICUserIdentityStore_getPropertiesForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[ICSecurityInfo sharedSecurityInfo];
  if ([v2 isContentProtectionEnabled]
    && ([v2 isDeviceClassCUnlocked] & 1) == 0)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Request for properties for user identity %@ before first unlock.", buf, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v17 = 0;
  uint64_t v7 = [v5 _existingIdentityPropertiesForUserIdentity:v6 error:&v17];
  id v8 = v17;
  unint64_t v9 = *(NSObject **)(*(void *)(a1 + 40) + 88);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__ICUserIdentityStore_getPropertiesForUserIdentity_completionHandler___block_invoke_28;
  v13[3] = &unk_1E5ACD250;
  id v10 = *(id *)(a1 + 48);
  id v15 = v8;
  id v16 = v10;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

void __58__ICUserIdentityStore_getPropertiesForUserIdentity_error___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[ICSecurityInfo sharedSecurityInfo];
  if ([v2 isContentProtectionEnabled]
    && ([v2 isDeviceClassCUnlocked] & 1) == 0)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = a1[4];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Request for properties for user identity %@ before first unlock.", buf, 0xCu);
    }
  }
  uint64_t v6 = a1[4];
  uint64_t v5 = (void *)a1[5];
  uint64_t v7 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v5 _existingIdentityPropertiesForUserIdentity:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = [v8 copy];
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = a1[4];
      uint64_t v14 = *(void *)(*(void *)(a1[7] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      uint64_t v19 = v14;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Failed to load properties for identity %{public}@. err=%{public}@", buf, 0x16u);
    }
  }
}

- (id)getPropertiesForActiveICloudAccountReturningError:(id *)a3
{
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy__37878;
  uint64_t v19 = __Block_byref_object_dispose__37879;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__37878;
  uint64_t v13 = __Block_byref_object_dispose__37879;
  id v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ICUserIdentityStore_getPropertiesForActiveICloudAccountReturningError___block_invoke;
  block[3] = &unk_1E5ACD088;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(accessQueue, block);
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

void __66__ICUserIdentityStore__initWithStyle_delegateAccountStoreOptions___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v17 = 0;
  uint64_t v3 = [v2 activeAccountDSIDWithError:&v17];
  id v4 = v17;
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) addValue:v3 timestamp:*(void *)(a1 + 40)];
    *(void *)(*(void *)(a1 + 32) + 64) = *(void *)(a1 + 40);
  }
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v16 = v4;
  id v6 = [v5 activeLockerAccountDSIDWithError:&v16];
  id v7 = v16;

  if (v6)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) addValue:v6 timestamp:*(void *)(a1 + 40)];
    *(void *)(*(void *)(a1 + 32) + 72) = *(void *)(a1 + 40);
  }
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = ICCreateLoggableValueForDSID(v3);
    uint64_t v10 = ICCreateLoggableValueForDSID(v6);
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - initializing account histories with activeAccountDSID = %{public}@, activeLockerAccountDSID = %{public}@, timestamp = %lld", buf, 0x20u);
  }
  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = (void *)v12[4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__ICUserIdentityStore__initWithStyle_delegateAccountStoreOptions___block_invoke_15;
  v14[3] = &unk_1E5ACD750;
  uint64_t v15 = v12;
  [v13 lock:v14];
  [*(id *)(a1 + 32) _initializeLocalStoreAccountProperties];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  codingHelper = self->_codingHelper;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__ICUserIdentityStore_encodeWithCoder___block_invoke;
  v8[3] = &unk_1E5ACD4C8;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  [(ICUserIdentityStoreCoding *)codingHelper lock:v8];
}

uint64_t __39__ICUserIdentityStore_encodeWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 32) forKey:@"helper"];
}

uint64_t __66__ICUserIdentityStore__initWithStyle_delegateAccountStoreOptions___block_invoke_15(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setActiveAccountHistory:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 16);

  return [v3 setActiveLockerAccountHistory:v4];
}

- (void)_initializeLocalStoreAccountProperties
{
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v3 = +[ICDefaults standardDefaults];
  id v6 = [v3 lastKnownLocalStoreAccountProperties];

  if (v6)
  {
    uint64_t v4 = [[ICLocalStoreAccountProperties alloc] initWithPropertyListRepresentation:v6];
    localStoreAccountProperties = self->_localStoreAccountProperties;
    self->_localStoreAccountProperties = v4;
  }
  [(ICUserIdentityStore *)self _refreshLocalStoreAccountPropertiesAllowingDidChangeNotification:1];
}

- (BOOL)_refreshLocalStoreAccountPropertiesAllowingDidChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  backend = self->_backend;
  id v18 = 0;
  id v6 = [(ICUserIdentityStoreBackend *)backend localStoreAccountPropertiesWithError:&v18];
  id v7 = v18;
  if (!v6)
  {
    uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v7;
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Failed to fetch local store account with error: %{public}@.", buf, 0xCu);
    }

    goto LABEL_11;
  }
  id v8 = self->_localStoreAccountProperties;
  if (v8 == v6)
  {

    goto LABEL_11;
  }
  id v9 = v8;
  BOOL v10 = [(ICLocalStoreAccountProperties *)v8 isEqual:v6];

  if (v10)
  {
LABEL_11:
    BOOL v14 = 0;
    goto LABEL_12;
  }
  uint64_t v11 = (ICLocalStoreAccountProperties *)[(ICLocalStoreAccountProperties *)v6 copy];
  localStoreAccountProperties = self->_localStoreAccountProperties;
  self->_localStoreAccountProperties = v11;

  if (v3)
  {
    callbackQueue = self->_callbackQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__ICUserIdentityStore__refreshLocalStoreAccountPropertiesAllowingDidChangeNotification___block_invoke;
    v17[3] = &unk_1E5ACD750;
    v17[4] = self;
    dispatch_async(callbackQueue, v17);
  }
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

void __40__ICUserIdentityStore_nullIdentityStore__block_invoke()
{
  id v2 = +[ICDelegateAccountStoreOptions defaultOptionsWithServiceName:@"com.apple.itunescloud.delegate-account-store"];
  id v0 = [[ICUserIdentityStore alloc] _initWithStyle:2 delegateAccountStoreOptions:v2];
  v1 = (void *)nullIdentityStore_sNullIdentityStore;
  nullIdentityStore_sNullIdentityStore = (uint64_t)v0;
}

void __43__ICUserIdentityStore_defaultIdentityStore__block_invoke()
{
  if (__IsSingleWriter == 1)
  {
    id v0 = +[ICDelegateAccountStoreSchema defaultDatabasePath];
    id v3 = +[ICDelegateAccountStoreOptions singleWriterOptionsWithDatabasePath:v0];
  }
  else
  {
    id v3 = +[ICDelegateAccountStoreOptions defaultOptionsWithServiceName:@"com.apple.itunescloud.delegate-account-store"];
  }
  id v1 = [[ICUserIdentityStore alloc] _initWithStyle:0 delegateAccountStoreOptions:v3];
  id v2 = (void *)defaultIdentityStore_sDefaultIdentityStore;
  defaultIdentityStore_sDefaultIdentityStore = (uint64_t)v1;
}

- (id)_initWithStyle:(int64_t)a3 delegateAccountStoreOptions:(id)a4
{
  id v6 = a4;
  if (a3 != 2)
  {
    id v7 = [(ICUserIdentityStore *)self _initCommon];
    if (!v7) {
      goto LABEL_12;
    }
    BOOL v10 = objc_alloc_init(ICValueHistory);
    activeAccountHistory = v7->_activeAccountHistory;
    v7->_activeAccountHistory = v10;

    id v12 = objc_alloc_init(ICValueHistory);
    activeLockerAccountHistory = v7->_activeLockerAccountHistory;
    v7->_activeLockerAccountHistory = v12;

    uint64_t v14 = [v6 copy];
    delegateAccountStoreOptions = v7->_delegateAccountStoreOptions;
    v7->_delegateAccountStoreOptions = (ICDelegateAccountStoreOptions *)v14;

    if (a3 == 1)
    {
      id v16 = ICUserIdentityStoreTestingBackend;
    }
    else
    {
      if (a3)
      {
LABEL_10:
        uint64_t v19 = [[ICUserIdentityStoreCoding alloc] initWithIdentityStoreStyle:a3];
        codingHelper = v7->_codingHelper;
        v7->_codingHelper = v19;

        [(ICUserIdentityStoreCoding *)v7->_codingHelper setDelegateAccountStoreOptions:v6];
        uint64_t v21 = mach_absolute_time();
        accessQueue = v7->_accessQueue;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __66__ICUserIdentityStore__initWithStyle_delegateAccountStoreOptions___block_invoke;
        v24[3] = &unk_1E5ACCD30;
        id v7 = v7;
        uint64_t v25 = v7;
        uint64_t v26 = v21;
        dispatch_async(accessQueue, v24);
        id v9 = (ICUserIdentityStoreCoding *)v25;
        goto LABEL_11;
      }
      id v16 = ICUserIdentityStoreACAccountBackend;
    }
    id v17 = (ICUserIdentityStoreBackend *)objc_alloc_init(v16);
    backend = v7->_backend;
    v7->_backend = v17;

    [(ICUserIdentityStoreBackend *)v7->_backend setDelegate:v7];
    goto LABEL_10;
  }
  v27.receiver = self;
  v27.super_class = (Class)ICUserIdentityStore;
  id v7 = [(ICUserIdentityStore *)&v27 init];
  if (v7)
  {
    id v8 = [[ICUserIdentityStoreCoding alloc] initWithIdentityStoreStyle:2];
    id v9 = v7->_codingHelper;
    v7->_codingHelper = v8;
LABEL_11:
  }
LABEL_12:

  return v7;
}

- (id)_initCommon
{
  v11.receiver = self;
  v11.super_class = (Class)ICUserIdentityStore;
  id v2 = [(ICUserIdentityStore *)&v11 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICUserIdentityStore.accessQueue", v4);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.iTunesCloud.ICUserIdentityStore.callback", v7);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (ICUserIdentityStore)initWithCoder:(id)a3
{
  uint64_t v4 = (ICUserIdentityStore *)a3;
  dispatch_queue_t v5 = [(ICUserIdentityStore *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"helper"];

  if (v5)
  {
    uint64_t v6 = [v5 identityStoreStyle];
    switch(v6)
    {
      case 2:
        uint64_t v4 = +[ICUserIdentityStore nullIdentityStore];
LABEL_9:

        self = 0;
        break;
      case 1:
        id v8 = [(ICUserIdentityStore *)self _initCommon];
        if (v8)
        {
          uint64_t v9 = [v5 activeAccountHistory];
          BOOL v10 = (void *)*((void *)v8 + 1);
          *((void *)v8 + 1) = v9;

          uint64_t v11 = [v5 activeLockerAccountHistory];
          id v12 = (void *)*((void *)v8 + 2);
          *((void *)v8 + 2) = v11;

          uint64_t v13 = [v5 backend];
          uint64_t v14 = (void *)*((void *)v8 + 3);
          *((void *)v8 + 3) = v13;

          [*((id *)v8 + 3) setDelegate:v8];
          objc_storeStrong((id *)v8 + 4, v5);
          uint64_t v15 = [v5 delegateAccountStoreOptions];
          id v16 = (void *)*((void *)v8 + 6);
          *((void *)v8 + 6) = v15;

          [v8 _initializeLocalStoreAccountProperties];
        }
        self = (ICUserIdentityStore *)v8;
        uint64_t v4 = self;
        break;
      case 0:
        id v7 = +[ICUserIdentityStore defaultIdentityStore];
        uint64_t v4 = v7;
        if (v7) {
          [(ICUserIdentityStore *)v7 _importValuesFromCodingHelper:v5];
        }
        goto LABEL_9;
    }
  }
  else
  {

    self = 0;
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  delegateAccountStore = self->_delegateAccountStore;
  if (delegateAccountStore)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__ICUserIdentityStore_dealloc__block_invoke;
    block[3] = &unk_1E5ACD750;
    block[4] = delegateAccountStore;
    dispatch_queue_t v5 = accessQueue;
    uint64_t v6 = delegateAccountStore;
    dispatch_barrier_async(v5, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)ICUserIdentityStore;
  [(ICUserIdentityStore *)&v7 dealloc];
}

- (void)_importValuesFromCodingHelper:(id)a3
{
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__ICUserIdentityStore__importValuesFromCodingHelper___block_invoke;
  v8[3] = &unk_1E5ACD4C8;
  id v9 = v5;
  BOOL v10 = self;
  id v7 = v5;
  dispatch_sync(accessQueue, v8);
}

uint64_t __34__ICUserIdentityStore_synchronize__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) synchronize];
}

- (ICLocalStoreAccountProperties)localStoreAccountProperties
{
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__37878;
  uint64_t v11 = __Block_byref_object_dispose__37879;
  id v12 = 0;
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__ICUserIdentityStore_localStoreAccountProperties__block_invoke;
  v6[3] = &unk_1E5ACD880;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ICLocalStoreAccountProperties *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_localStoreAccountProperties, 0);
  objc_storeStrong((id *)&self->_delegateAccountStoreOptions, 0);
  objc_storeStrong((id *)&self->_delegateAccountStore, 0);
  objc_storeStrong((id *)&self->_codingHelper, 0);
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_activeLockerAccountHistory, 0);

  objc_storeStrong((id *)&self->_activeAccountHistory, 0);
}

- (id)userIdentitiesForManageableAccountsWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  backend = self->_backend;
  id v21 = 0;
  uint64_t v6 = [(ICUserIdentityStoreBackend *)backend allManageableStoreAccountDSIDsWithError:&v21];
  id v7 = v21;
  if (v7)
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - Error retrieving user identities for manageable accounts - error=%{public}@", buf, 0xCu);
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          [v9 addObject:v14];
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }
  }

  if (a3) {
    *a3 = v7;
  }
  uint64_t v15 = objc_msgSend(v9, "copy", (void)v17);

  return v15;
}

- (void)getPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ICUserIdentityStore_getPropertiesForUserIdentity_completionHandler___block_invoke;
  block[3] = &unk_1E5ACD250;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(accessQueue, block);
}

- (void)synchronize
{
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ICUserIdentityStore_synchronize__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __88__ICUserIdentityStore__refreshLocalStoreAccountPropertiesAllowingDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - Local store account properties change detected [Posting notification]", v4, 2u);
  }

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __50__ICUserIdentityStore_localStoreAccountProperties__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  }
  else
  {
    id v4 = *(void **)(v2 + 24);
    id v16 = 0;
    uint64_t v5 = [v4 localStoreAccountPropertiesWithError:&v16];
    id v6 = v16;
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = v5;

    if (*(void *)(*(void *)(a1 + 32) + 56))
    {

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 56));
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(NSObject **)(v13 + 88);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50__ICUserIdentityStore_localStoreAccountProperties__block_invoke_51;
      v15[3] = &unk_1E5ACD750;
      v15[4] = v13;
      dispatch_async(v14, v15);
    }
    else
    {
      uint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v6;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Failed to fetch local store account synchronously with error: %{public}@.", buf, 0xCu);
      }

      id v10 = objc_alloc_init(ICLocalStoreAccountProperties);
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void **)(v11 + 56);
      *(void *)(v11 + 56) = v10;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 56));
    }
  }
}

- (id)_icValidStoreAccountsFromACAccounts:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "ic_DSID", (void)v21);
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          char v15 = objc_msgSend(v12, "ic_isLocalAccount");

          if ((v15 & 1) == 0)
          {
            id v16 = objc_msgSend(v12, "ic_DSID");
            long long v17 = +[ICUserIdentity specificAccountWithDSID:v16];

            [v6 addObject:v17];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v9);
  }

  id v18 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v6;
    _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - _icValidStoreAccountsFromACAccounts=%{public}@", buf, 0xCu);
  }

  uint64_t v19 = (void *)[v6 copy];

  return v19;
}

- (void)_unregisterForDelegateAccountStoreNotifications:(id)a3
{
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"ICDelegateAccountStoreDidChangeNotification" object:v5];
}

- (BOOL)_saveIdentityProperties:(id)a3 andPostAccountChangeNotification:(BOOL)a4 forUserIdentity:(id)a5 error:(id *)a6
{
  BOOL v29 = a4;
  id v10 = a3;
  id v11 = a5;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 1;
  uint64_t v44 = 0;
  uint64_t v45 = (id *)&v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__37878;
  uint64_t v48 = __Block_byref_object_dispose__37879;
  id v49 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 1;
  if ([v10 isDelegated])
  {
    uint64_t v12 = v45;
    id obj = v45[5];
    uint64_t v13 = [(ICUserIdentityStore *)self _openDelegateAccountStoreWithError:&obj];
    objc_storeStrong(v12 + 5, obj);
    if (v45[5])
    {
      *((unsigned char *)v41 + 24) = 0;
    }
    else
    {
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke;
      v35[3] = &unk_1E5ACCEF0;
      uint64_t v37 = &v44;
      uint64_t v38 = &v40;
      char v15 = v14;
      uint64_t v36 = v15;
      [v13 setIdentityProperties:v10 forUserIdentity:v11 completionHandler:v35];
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  id v34 = 0;
  id v16 = [(ICUserIdentityStore *)self _dsidForUserIdentity:v11 error:&v34];
  id v17 = v34;
  if (v16)
  {
    id v18 = self->_backend;
    if ([v10 isDelegated])
    {
      id v33 = 0;
      [(ICUserIdentityStoreBackend *)v18 replaceIdentityProperties:v10 forDSID:v16 error:&v33];
      id v19 = v33;
      if ([v19 code] == -7401)
      {
        long long v20 = [v19 domain];
        int v21 = [v20 isEqualToString:@"ICError"];

        if (v21)
        {

          id v19 = 0;
        }
      }
    }
    else
    {
      id v32 = 0;
      [(ICUserIdentityStoreBackend *)v18 setIdentityProperties:v10 forDSID:v16 error:&v32];
      id v19 = v32;
    }
    *((unsigned char *)v51 + 24) = v19 == 0;
  }
  else
  {
    id v19 = 0;
  }
  id v22 = v19;
  if (*((unsigned char *)v51 + 24))
  {
    if (*((unsigned char *)v41 + 24))
    {
      id v23 = 0;
      char v24 = 1;
      goto LABEL_19;
    }
    id v22 = v45[5];
  }
  id v23 = v22;
  char v24 = 0;
LABEL_19:
  codingHelper = self->_codingHelper;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke_2;
  v31[3] = &unk_1E5ACD750;
  v31[4] = self;
  [(ICUserIdentityStoreCoding *)codingHelper lock:v31];
  if (v29)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke_3;
    block[3] = &unk_1E5ACD088;
    void block[4] = self;
    void block[5] = &v50;
    block[6] = &v40;
    dispatch_async(callbackQueue, block);
  }
  if (a6) {
    *a6 = v23;
  }
  if (v23) {
    BOOL v27 = v24;
  }
  else {
    BOOL v27 = 0;
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v27;
}

void __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setBackend:*(void *)(*(void *)(a1 + 32) + 24)];
}

uint64_t __102__ICUserIdentityStore__saveIdentityProperties_andPostAccountChangeNotification_forUserIdentity_error___block_invoke_3(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return [*(id *)(a1 + 32) _dispatchDidChangeNotification:(*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) | v1) != 0 didDelegateAccountStoreChange:v1 != 0];
}

- (void)_registerForDelegateAccountStoreNotifications:(id)a3
{
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__delegateAccountStoreDidChangeNotification_ name:@"ICDelegateAccountStoreDidChangeNotification" object:v5];
}

- (id)_openDelegateAccountStoreForUserIdentity:(id)a3 error:(id *)a4
{
  id v7 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v8 = self->_delegateAccountStore;
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (![v7 allowsDelegation])
  {
    id v10 = 0;
    uint64_t v9 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v12 = 0;
  uint64_t v9 = [(ICUserIdentityStore *)self _openDelegateAccountStoreWithError:&v12];
  id v10 = v12;
  if (a4) {
LABEL_8:
  }
    *a4 = v10;
LABEL_9:

  return v9;
}

- (id)_openDelegateAccountStoreWithError:(id *)a3
{
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v29 = 0;
  uint64_t v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__37878;
  id v33 = __Block_byref_object_dispose__37879;
  id v34 = 0;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__37878;
  BOOL v27 = __Block_byref_object_dispose__37879;
  uint64_t v28 = self->_delegateAccountStore;
  if (v28) {
    goto LABEL_15;
  }
  if (![(ICDelegateAccountStoreOptions *)self->_delegateAccountStoreOptions isSingleWriter])
  {
    if (self->_delegateAccountStoreOptions)
    {
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      delegateAccountStoreOptions = self->_delegateAccountStoreOptions;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __58__ICUserIdentityStore__openDelegateAccountStoreWithError___block_invoke;
      v18[3] = &unk_1E5ACD058;
      long long v20 = &v23;
      int v21 = &v29;
      dispatch_semaphore_t v14 = v12;
      id v19 = v14;
      +[ICDelegateAccountStore openWithOptions:delegateAccountStoreOptions completionHandler:v18];
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

LABEL_10:
      id v10 = v24;
      goto LABEL_11;
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
LABEL_9:
    dispatch_semaphore_t v14 = v30[5];
    v30[5] = (id)v11;
    goto LABEL_10;
  }
  id v5 = [ICDelegateAccountStore alloc];
  id v6 = self->_delegateAccountStoreOptions;
  id v7 = v30;
  id obj = v30[5];
  uint64_t v8 = [(ICDelegateAccountStore *)v5 initSingleWriterWithOptions:v6 error:&obj];
  objc_storeStrong(v7 + 5, obj);
  uint64_t v9 = (void *)v24[5];
  v24[5] = v8;

  id v10 = v24;
  if (!v30[5] && !v24[5])
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    goto LABEL_9;
  }
LABEL_11:
  if (v10[5])
  {
    -[ICUserIdentityStore _registerForDelegateAccountStoreNotifications:](self, "_registerForDelegateAccountStoreNotifications:");
    char v15 = (void *)v24[5];
  }
  else
  {
    char v15 = 0;
  }
  objc_storeStrong((id *)&self->_delegateAccountStore, v15);
LABEL_15:
  if (a3) {
    *a3 = v30[5];
  }
  id v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v16;
}

void __58__ICUserIdentityStore__openDelegateAccountStoreWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v6)
  {
    int v7 = 0;
    uint64_t v8 = v6;
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    int v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    int v7 = 1;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
  if (v7) {

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __72__ICUserIdentityStore__existingIdentityPropertiesForUserIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 identityPropertiesForUserIdentity:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

- (void)_dispatchDidChangeNotification:(BOOL)a3 didDelegateAccountStoreChange:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  if (v5)
  {
    int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"ICUserIdentityStoreDidChangeNotification" object:self];
  }
  if (v4)
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"ICUserIdentityStoreDelegateAccountStoreDidChangeNotification" object:self];
  }
}

- (void)_delegateAccountStoreDidChangeNotification:(id)a3
{
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ICUserIdentityStore__delegateAccountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __66__ICUserIdentityStore__delegateAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICUserIdentityStoreDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_updateDelegateAccountStoreUsingBlock:(id)a3
{
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__ICUserIdentityStore__updateDelegateAccountStoreUsingBlock___block_invoke;
  v8[3] = &unk_1E5ACD2F0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

void __61__ICUserIdentityStore__updateDelegateAccountStoreUsingBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = 0;
  id v3 = [v2 _openDelegateAccountStoreWithError:&v5];
  id v4 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_unsafe_deleteDelegateAccountStore
{
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ICUserIdentityStore__unsafe_deleteDelegateAccountStore__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __57__ICUserIdentityStore__unsafe_deleteDelegateAccountStore__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) databasePath];
  id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  id v11 = v2;
  if (v3)
  {
    [v3 close];
    [*(id *)(a1 + 32) _unregisterForDelegateAccountStoreNotifications:*(void *)(*(void *)(a1 + 32) + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    id v2 = v11;
  }
  if ([v2 length])
  {
    id v6 = (objc_class *)MEMORY[0x1E4F28CB8];
    id v7 = v11;
    id v8 = objc_alloc_init(v6);
    [v8 removeItemAtPath:v7 error:0];
    id v9 = ICSQLiteGetRelatedFilePath(v7, 0);
    [v8 removeItemAtPath:v9 error:0];

    id v10 = ICSQLiteGetRelatedFilePath(v7, 1);

    [v8 removeItemAtPath:v10 error:0];
  }
  dispatch_barrier_sync(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 88), &__block_literal_global_59);
}

- (void)_resetDelegateAccountStoreWithCompletionHandler:(id)a3
{
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__ICUserIdentityStore__resetDelegateAccountStoreWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5ACD2F0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

void __71__ICUserIdentityStore__resetDelegateAccountStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 48) isSingleWriter])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 40);
    if (v3)
    {
      [v3 close];
      [*(id *)(a1 + 32) _unregisterForDelegateAccountStoreNotifications:*(void *)(*(void *)(a1 + 32) + 40)];
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = 0;

      uint64_t v2 = *(void *)(a1 + 32);
    }
    id v6 = [*(id *)(v2 + 48) databasePath];
    if ([v6 length]) {
      ICSQLiteTruncateDatabase(v6);
    }
    id v7 = [ICDelegateAccountStore alloc];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 48);
    id v23 = 0;
    uint64_t v9 = [(ICDelegateAccountStore *)v7 initSingleWriterWithOptions:v8 error:&v23];
    id v10 = v23;
    uint64_t v11 = *(void *)(a1 + 32);
    dispatch_semaphore_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v9;

    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = v13[5];
    BOOL v15 = v14 != 0;
    if (v14) {
      objc_msgSend(v13, "_registerForDelegateAccountStoreNotifications:");
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7701 userInfo:0];
    BOOL v15 = 0;
  }
  id v16 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__ICUserIdentityStore__resetDelegateAccountStoreWithCompletionHandler___block_invoke_2;
  v19[3] = &unk_1E5ACD008;
  id v17 = *(id *)(a1 + 40);
  BOOL v22 = v15;
  id v20 = v10;
  id v21 = v17;
  id v18 = v10;
  dispatch_async(v16, v19);
}

uint64_t __71__ICUserIdentityStore__resetDelegateAccountStoreWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_reloadForExternalChange
{
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ICUserIdentityStore__reloadForExternalChange__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __47__ICUserIdentityStore__reloadForExternalChange__block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = mach_absolute_time();
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  id v46 = 0;
  uint64_t v4 = [v3 activeAccountDSIDWithError:&v46];
  id v5 = v46;
  uint64_t v42 = 0;
  char v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = (uint64_t)v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - reloadForExternalChange failed to obtain active account DSID. err=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) firstValueBeforeOrEqualToTimestamp:*(void *)(*(void *)(a1 + 32) + 64)];
    uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      ICCreateLoggableValueForDSID(v4);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = ICCreateLoggableValueForDSID(v7);
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 64);
      *(_DWORD *)buf = 134218754;
      uint64_t v48 = v2;
      __int16 v49 = 2114;
      id v50 = v9;
      __int16 v51 = 2114;
      uint64_t v52 = v10;
      __int16 v53 = 2048;
      uint64_t v54 = v11;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - checking for active account change at timestamp %llu. activeAccountDSID = %{public}@, lastKnownActiveAccountDSID = %{public}@ (timestamp = %llu)", buf, 0x2Au);
    }
    id v6 = v7;
    dispatch_semaphore_t v12 = v4;
    os_log_t v13 = v12;
    if (v6 == v12)
    {
    }
    else
    {
      char v14 = [v6 isEqual:v12];

      if (v14) {
        goto LABEL_12;
      }
      [*(id *)(*(void *)(a1 + 32) + 8) addValue:v13 timestamp:v2];
      *((unsigned char *)v43 + 24) = 1;
      *(void *)(*(void *)(a1 + 32) + 64) = v2;
      os_log_t v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - Active account change detected", buf, 2u);
      }
    }
  }
LABEL_12:

  BOOL v15 = *(void **)(*(void *)(a1 + 32) + 24);
  id v37 = v5;
  id v16 = [v15 activeLockerAccountDSIDWithError:&v37];
  id v17 = v37;

  if (v17)
  {
    id v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = (uint64_t)v17;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - reloadForExternalChange failed to obtain active locker account DSID. err=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v19 = [*(id *)(*(void *)(a1 + 32) + 16) firstValueBeforeOrEqualToTimestamp:*(void *)(*(void *)(a1 + 32) + 72)];
    id v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      ICCreateLoggableValueForDSID(v16);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v22 = ICCreateLoggableValueForDSID(v19);
      uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 72);
      *(_DWORD *)buf = 134218754;
      uint64_t v48 = v2;
      __int16 v49 = 2114;
      id v50 = v21;
      __int16 v51 = 2114;
      uint64_t v52 = v22;
      __int16 v53 = 2048;
      uint64_t v54 = v23;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - checking for active locker account change at timestamp %llu. activeLockerAccountDSID = %{public}@, lastKnownActiveLockerAccountDSID = %{public}@ (timestamp = %lld)", buf, 0x2Au);
    }
    id v18 = v19;
    char v24 = v16;
    os_log_t v25 = v24;
    if (v18 == v24)
    {
    }
    else
    {
      char v26 = [v18 isEqual:v24];

      if (v26) {
        goto LABEL_23;
      }
      [*(id *)(*(void *)(a1 + 32) + 16) addValue:v25 timestamp:v2];
      *((unsigned char *)v39 + 24) = 1;
      *(void *)(*(void *)(a1 + 32) + 72) = v2;
      os_log_t v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - Active locker account change detected", buf, 2u);
      }
    }
  }
LABEL_23:

  int v27 = [*(id *)(a1 + 32) _refreshLocalStoreAccountPropertiesAllowingDidChangeNotification:0];
  char v28 = v27;
  if (v27)
  {
    uint64_t v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v29, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - Local store account properties change detected", buf, 2u);
    }
  }
  uint64_t v30 = *(void *)(a1 + 32);
  uint64_t v31 = *(void **)(v30 + 32);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __47__ICUserIdentityStore__reloadForExternalChange__block_invoke_56;
  v36[3] = &unk_1E5ACD088;
  v36[4] = v30;
  v36[5] = &v42;
  v36[6] = &v38;
  [v31 lock:v36];
  uint64_t v32 = *(void *)(a1 + 32);
  id v33 = *(NSObject **)(v32 + 88);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __47__ICUserIdentityStore__reloadForExternalChange__block_invoke_2;
  v34[3] = &unk_1E5ACCFE0;
  v34[4] = v32;
  v34[5] = &v42;
  char v35 = v28;
  dispatch_async(v33, v34);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
}

uint64_t __47__ICUserIdentityStore__reloadForExternalChange__block_invoke_56(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    result = [*(id *)(*(void *)(result + 32) + 32) setActiveAccountHistory:*(void *)(*(void *)(result + 32) + 8)];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24))
  {
    uint64_t v2 = *(void *)(v1 + 32);
    id v3 = *(void **)(v2 + 32);
    uint64_t v4 = *(void *)(v2 + 16);
    return [v3 setActiveLockerAccountHistory:v4];
  }
  return result;
}

void __47__ICUserIdentityStore__reloadForExternalChange__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICUserIdentityStoreDidChangeNotification" object:*(void *)(a1 + 32)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [v2 postNotificationName:@"ICActiveUserIdentityDidChangeNotification" object:*(void *)(a1 + 32)];
  }
  if (*(unsigned char *)(a1 + 48)) {
    [v2 postNotificationName:@"ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification" object:*(void *)(a1 + 32)];
  }
}

- (void)_prepareDelegateAccountStoreWithCompletionHandler:(id)a3
{
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5ACD2F0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

void __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v16 = 0;
  id v3 = [v2 _openDelegateAccountStoreWithError:&v16];
  id v4 = v16;
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v15 = *(id *)(a1 + 40);
    id v14 = v4;
    dispatch_async(v5, block);

    id v6 = v15;
  }
  else
  {
    id v6 = [v3 databasePath];
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E5ACCFB8;
    id v8 = *(id *)(a1 + 40);
    id v10 = 0;
    id v11 = v8;
    BOOL v12 = v3 != 0;
    v9[4] = v6;
    dispatch_async(v7, v9);
  }
}

uint64_t __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __73__ICUserIdentityStore__prepareDelegateAccountStoreWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (ICUserIdentityStoreBackend)_unsafeBackend
{
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  backend = self->_backend;

  return backend;
}

- (void)userIdentityStoreBackendDidChange:(id)a3
{
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "[ICUserIdentityStore] - Backend changed", v5, 2u);
  }

  [(ICUserIdentityStore *)self _reloadForExternalChange];
}

- (id)userIdentitiesForAllStoreAccountsWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  backend = self->_backend;
  id v21 = 0;
  id v6 = [(ICUserIdentityStoreBackend *)backend allStoreAccountDSIDsWithError:&v21];
  id v7 = v21;
  if (v7)
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - Error retrieving user identities for all accounts - error=%{public}@", buf, 0xCu);
    }
    id v9 = 0;
  }
  else
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          [v9 addObject:v14];
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }
  }

  if (a3) {
    *a3 = v7;
  }
  id v15 = objc_msgSend(v9, "copy", (void)v17);

  return v15;
}

- (void)updatePropertiesForLocalStoreAccountUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke;
  block[3] = &unk_1E5ACCDB0;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(accessQueue, block);
}

void __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1[4] + 24);
  id v21 = 0;
  id v3 = [v2 localStoreAccountPropertiesWithError:&v21];
  id v4 = v21;
  if (v3)
  {
    id v5 = [v3 mutableCopy];
    (*(void (**)(void))(a1[5] + 16))();
    id v6 = *(id *)(a1[4] + 32);
    id v7 = *(id *)(a1[4] + 24);
    id v8 = *(void **)(a1[4] + 24);
    id v20 = v4;
    [v8 setLocalStoreAccountProperties:v5 error:&v20];
    id v9 = v20;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke_53;
    v17[3] = &unk_1E5ACD4C8;
    id v18 = v6;
    id v19 = v7;
    id v10 = v7;
    id v11 = v6;
    [v11 lock:v17];

    id v4 = v9;
  }
  else
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] Failed to fetch local store account with error: %{public}@.", buf, 0xCu);
    }
  }

  uint64_t v12 = (void *)a1[6];
  if (v12)
  {
    id v13 = *(NSObject **)(a1[4] + 88);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke_2;
    v14[3] = &unk_1E5ACD2F0;
    id v16 = v12;
    id v15 = v4;
    dispatch_async(v13, v14);
  }
}

uint64_t __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke_53(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackend:*(void *)(a1 + 40)];
}

uint64_t __88__ICUserIdentityStore_updatePropertiesForLocalStoreAccountUsingBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

void __50__ICUserIdentityStore_localStoreAccountProperties__block_invoke_51(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)updatePropertiesForUserIdentity:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__ICUserIdentityStore_updatePropertiesForUserIdentity_usingBlock_completionHandler___block_invoke;
  v16[3] = &unk_1E5ACCF90;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(accessQueue, v16);
}

void __84__ICUserIdentityStore_updatePropertiesForUserIdentity_usingBlock_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  id v4 = [v2 _existingIdentityPropertiesForUserIdentity:v3 error:&v16];
  id v5 = v16;
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v15 = v5;
    [v6 _saveIdentityProperties:v4 andPostAccountChangeNotification:1 forUserIdentity:v7 error:&v15];
    id v8 = v15;

    id v5 = v8;
  }
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__ICUserIdentityStore_updatePropertiesForUserIdentity_usingBlock_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5ACD2F0;
  id v10 = *(id *)(a1 + 56);
  id v13 = v5;
  id v14 = v10;
  id v11 = v5;
  dispatch_async(v9, v12);
}

uint64_t __84__ICUserIdentityStore_updatePropertiesForUserIdentity_usingBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(a1 + 32) == 0);
  }
  return result;
}

- (void)updatePropertiesForUserIdentity:(id)a3 usingBlock:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  [(ICUserIdentityStore *)self updatePropertiesForUserIdentity:v8 usingBlock:v7 completionHandler:0];
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ICUserIdentityStore_synchronizeWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5ACD2F0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

void __56__ICUserIdentityStore_synchronizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) synchronize];
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    dispatch_async(v3, v2);
  }
}

- (void)disableLockerAccountWithDSID:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ICUserIdentityStore.m", 686, @"Invalid parameter not satisfying: %@", @"dsID != nil" object file lineNumber description];
  }
  uint64_t v9 = mach_absolute_time();
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke;
  block[3] = &unk_1E5ACCF68;
  void block[4] = self;
  id v15 = v7;
  id v16 = v8;
  uint64_t v17 = v9;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(accessQueue, block);
}

void __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v25 = 0;
  uint64_t v3 = [v2 activeLockerAccountDSIDWithError:&v25];
  id v4 = v25;
  if (v4)
  {
    int v5 = 0;
  }
  else if (v3 == *(void **)(a1 + 40))
  {
    int v5 = 1;
  }
  else
  {
    int v5 = objc_msgSend(v3, "isEqual:");
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(*(void *)(a1 + 32) + 24);
  id v24 = v4;
  [v7 disableLockerAccountDSID:v6 error:&v24];
  id v8 = v24;

  uint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
    uint64_t v11 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    int v27 = v10;
    __int16 v28 = 2048;
    uint64_t v29 = v11;
    __int16 v30 = 2114;
    id v31 = v8;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - removed cloud library setting from %{public}@ (timestamp = %lld) error=%{public}@", buf, 0x20u);
  }
  if (v8) {
    int v12 = 0;
  }
  else {
    int v12 = v5;
  }
  if (v12 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) addValue:*(void *)(a1 + 40) timestamp:*(void *)(a1 + 56)];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 32);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke_48;
    v23[3] = &unk_1E5ACD750;
    v23[4] = v13;
    [v14 lock:v23];
  }
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(NSObject **)(v15 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke_2;
  block[3] = &unk_1E5ACCFB8;
  char v22 = v5;
  void block[4] = v15;
  id v17 = *(id *)(a1 + 48);
  id v20 = v8;
  id v21 = v17;
  id v18 = v8;
  dispatch_async(v16, block);
}

uint64_t __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke_48(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setActiveLockerAccountHistory:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v3 = *(void **)(v2 + 32);

  return [v3 setBackend:v4];
}

uint64_t __70__ICUserIdentityStore_disableLockerAccountWithDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) _dispatchDidChangeNotification:1 didDelegateAccountStoreChange:0];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setActiveLockerAccountWithDSID:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v9 = mach_absolute_time();
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke;
  v13[3] = &unk_1E5ACCF68;
  void v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  uint64_t v16 = v9;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(accessQueue, v13);
}

void __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v28 = 0;
  id v3 = [v2 activeLockerAccountDSIDWithError:&v28];
  id v4 = v28;
  if (v4)
  {
    int v5 = v4;
    char v6 = 0;
    goto LABEL_13;
  }
  id v7 = *(id *)(a1 + 40);
  if (v3 == v7)
  {

    goto LABEL_8;
  }
  id v8 = v7;
  char v9 = [v3 isEqual:v7];

  if (v9)
  {
LABEL_8:
    char v6 = 0;
    int v5 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(*(void *)(a1 + 32) + 24);
  id v27 = 0;
  [v11 updateActiveLockerAccountDSID:v10 error:&v27];
  id v12 = v27;
  if (v12)
  {
    int v5 = v12;
  }
  else
  {
    uint64_t v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
      uint64_t v15 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      __int16 v30 = v14;
      __int16 v31 = 2048;
      uint64_t v32 = v15;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - updating active locker account to %{public}@ (timestamp = %lld)", buf, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) addValue:*(void *)(a1 + 40) timestamp:*(void *)(a1 + 56)];
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 32);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke_37;
    v26[3] = &unk_1E5ACD750;
    void v26[4] = v16;
    [v17 lock:v26];
    int v5 = 0;
  }
  char v6 = 1;
LABEL_13:
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(NSObject **)(v18 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke_2;
  block[3] = &unk_1E5ACCFB8;
  char v25 = v6;
  void block[4] = v18;
  id v20 = *(id *)(a1 + 48);
  id v23 = v5;
  id v24 = v20;
  id v21 = v5;
  dispatch_async(v19, block);
}

uint64_t __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke_37(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setActiveLockerAccountHistory:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v2 + 24);
  id v3 = *(void **)(v2 + 32);

  return [v3 setBackend:v4];
}

uint64_t __72__ICUserIdentityStore_setActiveLockerAccountWithDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) _dispatchDidChangeNotification:1 didDelegateAccountStoreChange:0];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setActiveAccountWithDSID:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v9 = mach_absolute_time();
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke;
  v13[3] = &unk_1E5ACCF68;
  void v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  uint64_t v16 = v9;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(accessQueue, v13);
}

void __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v28 = 0;
  id v3 = [v2 activeAccountDSIDWithError:&v28];
  id v4 = v28;
  if (v4)
  {
    int v5 = v4;
    char v6 = 0;
    goto LABEL_13;
  }
  id v7 = *(id *)(a1 + 40);
  if (v3 == v7)
  {

    goto LABEL_8;
  }
  id v8 = v7;
  char v9 = [v3 isEqual:v7];

  if (v9)
  {
LABEL_8:
    char v6 = 0;
    int v5 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(*(void *)(a1 + 32) + 24);
  id v27 = 0;
  [v11 updateActiveAccountDSID:v10 error:&v27];
  id v12 = v27;
  if (v12)
  {
    int v5 = v12;
  }
  else
  {
    uint64_t v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
      uint64_t v15 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      __int16 v30 = v14;
      __int16 v31 = 2048;
      uint64_t v32 = v15;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "[ICUserIdentityStore] - updating active account to %{public}@ (timestamp = %lld)", buf, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 8) addValue:*(void *)(a1 + 40) timestamp:*(void *)(a1 + 56)];
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 32);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke_36;
    v26[3] = &unk_1E5ACD750;
    void v26[4] = v16;
    [v17 lock:v26];
    int v5 = 0;
  }
  char v6 = 1;
LABEL_13:
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(NSObject **)(v18 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke_2;
  block[3] = &unk_1E5ACCFB8;
  char v25 = v6;
  void block[4] = v18;
  id v20 = *(id *)(a1 + 48);
  id v23 = v5;
  id v24 = v20;
  id v21 = v5;
  dispatch_async(v19, block);
}

uint64_t __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke_36(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setActiveAccountHistory:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v2 + 24);
  id v3 = *(void **)(v2 + 32);

  return [v3 setBackend:v4];
}

uint64_t __66__ICUserIdentityStore_setActiveAccountWithDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) _dispatchDidChangeNotification:1 didDelegateAccountStoreChange:0];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removePropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(accessQueue, block);
}

void __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = dispatch_group_create();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__37878;
  v38[4] = __Block_byref_object_dispose__37879;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 1;
  uint64_t v30 = 0;
  __int16 v31 = (id *)&v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__37878;
  id v34 = __Block_byref_object_dispose__37879;
  id v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  if ([*(id *)(a1 + 32) _allowsDelegationForUserIdentity:*(void *)(a1 + 40)])
  {
    id v3 = *(void **)(a1 + 32);
    id v25 = 0;
    uint64_t v4 = [v3 _openDelegateAccountStoreWithError:&v25];
    id v5 = v25;
    id v6 = v25;
    if (v6)
    {
      objc_storeStrong(v31 + 5, v5);
      *((unsigned char *)v27 + 24) = 0;
    }
    else
    {
      dispatch_group_enter(v2);
      uint64_t v7 = *(void *)(a1 + 40);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_2;
      v24[3] = &unk_1E5ACCEF0;
      v24[5] = &v30;
      v24[6] = &v26;
      void v24[4] = v2;
      [v4 removeIdentityPropertiesForUserIdentity:v7 completionHandler:v24];
    }
  }
  else
  {
    id v6 = 0;
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v23 = v6;
  id v10 = [v8 _dsidForUserIdentity:v9 error:&v23];
  id v11 = v23;
  id v12 = v23;

  if (v12)
  {
    objc_storeStrong(v31 + 5, v11);
    *((unsigned char *)v27 + 24) = 0;
  }
  else if (v10)
  {
    dispatch_group_enter(v2);
    id v13 = *(void **)(*(void *)(a1 + 32) + 24);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_3;
    v22[3] = &unk_1E5ACCEF0;
    v22[5] = v38;
    v22[6] = v36;
    v22[4] = v2;
    [v13 removeIdentityForDSID:v10 completion:v22];
  }
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(NSObject **)(v14 + 88);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_4;
  v16[3] = &unk_1E5ACCF40;
  id v19 = v38;
  id v20 = &v26;
  id v21 = &v30;
  uint64_t v18 = v36;
  v16[4] = v14;
  id v17 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v15, v16);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
}

void __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5 == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_3(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5 == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v4 = a1 + 56;
LABEL_6:
    id v2 = *(id *)(*(void *)(*(void *)v4 + 8) + 40);
    char v3 = 0;
    goto LABEL_7;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v4 = a1 + 72;
    goto LABEL_6;
  }
  id v2 = 0;
  char v3 = 1;
LABEL_7:
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_5;
  v18[3] = &unk_1E5ACD750;
  void v18[4] = v5;
  [v6 lock:v18];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_6;
  block[3] = &unk_1E5ACCF18;
  uint64_t v9 = *(void *)(a1 + 64);
  void block[4] = v7;
  uint64_t v16 = v9;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v12;
  long long v15 = v12;
  char v17 = v3;
  id v14 = v2;
  id v11 = v2;
  dispatch_async(v8, block);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
}

uint64_t __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setBackend:*(void *)(*(void *)(a1 + 32) + 24)];
}

uint64_t __73__ICUserIdentityStore_removePropertiesForUserIdentity_completionHandler___block_invoke_6(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  [*(id *)(a1 + 32) _dispatchDidChangeNotification:(*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) | v2) != 0 didDelegateAccountStoreChange:v2 != 0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v16[3] = &unk_1E5ACD2A0;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(accessQueue, v16);
}

void __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v15 = 0;
  char v3 = [v2 _openDelegateAccountStoreWithError:&v15];
  id v4 = v15;
  if (!v4)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3;
    v10[3] = &unk_1E5ACCD60;
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 56);
    [v3 removeDelegationUUIDs:v8 forUserIdentity:v9 completionHandler:v10];
    uint64_t v7 = v11;
    goto LABEL_5;
  }
  uint64_t v5 = *(void **)(a1 + 56);
  if (v5)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v14 = v5;
    id v13 = v4;
    dispatch_async(v6, block);

    uint64_t v7 = v14;
LABEL_5:
  }
}

uint64_t __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 88);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_4;
  v10[3] = &unk_1E5ACCFB8;
  v10[4] = v6;
  char v13 = a2;
  id v8 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(v7, v10);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
}

uint64_t __79__ICUserIdentityStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _dispatchDidChangeNotification:*(unsigned __int8 *)(a1 + 56) didDelegateAccountStoreChange:*(unsigned __int8 *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    char v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeDelegateTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke;
  block[3] = &unk_1E5ACD250;
  id v13 = v7;
  id v14 = v8;
  void block[4] = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(accessQueue, block);
}

void __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v14 = 0;
  char v3 = [v2 _openDelegateAccountStoreWithError:&v14];
  id v4 = v14;
  if (!v4)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5ACCD60;
    uint64_t v8 = *(void *)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    [v3 removeTokensExpiringBeforeDate:v8 completionHandler:v9];
    id v7 = v10;
    goto LABEL_5;
  }
  id v5 = *(void **)(a1 + 48);
  if (v5)
  {
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v13 = v5;
    id v12 = v4;
    dispatch_async(v6, block);

    id v7 = v13;
LABEL_5:
  }
}

uint64_t __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 88);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_4;
  v10[3] = &unk_1E5ACCFB8;
  v10[4] = v6;
  char v13 = a2;
  id v8 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(v7, v10);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
}

uint64_t __80__ICUserIdentityStore_removeDelegateTokensExpiringBeforeDate_completionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _dispatchDidChangeNotification:*(unsigned __int8 *)(a1 + 56) didDelegateAccountStoreChange:*(unsigned __int8 *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    char v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeDelegateTokenForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke;
  block[3] = &unk_1E5ACD250;
  id v13 = v7;
  id v14 = v8;
  void block[4] = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(accessQueue, block);
}

void __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v14 = 0;
  char v3 = [v2 _openDelegateAccountStoreWithError:&v14];
  id v4 = v14;
  if (!v4)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5ACCD60;
    uint64_t v8 = *(void *)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    [v3 removeTokenForUserIdentity:v8 completionHandler:v9];
    id v7 = v10;
    goto LABEL_5;
  }
  id v5 = *(void **)(a1 + 48);
  if (v5)
  {
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v13 = v5;
    id v12 = v4;
    dispatch_async(v6, block);

    id v7 = v13;
LABEL_5:
  }
}

uint64_t __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 88);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_4;
  v10[3] = &unk_1E5ACCFB8;
  v10[4] = v6;
  char v13 = a2;
  id v8 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(v7, v10);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
}

uint64_t __76__ICUserIdentityStore_removeDelegateTokenForUserIdentity_completionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _dispatchDidChangeNotification:*(unsigned __int8 *)(a1 + 56) didDelegateAccountStoreChange:*(unsigned __int8 *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    char v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeAllDelegateTokensWithCompletionHandler:(id)a3
{
  id v5 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5ACD2F0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

void __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v14 = 0;
  char v3 = [v2 _openDelegateAccountStoreWithError:&v14];
  id v4 = v14;
  if (!v4)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E5ACCD60;
    id v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v3 removeAllTokensWithCompletionHandler:v9];
    id v7 = v10;
    goto LABEL_5;
  }
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v13 = v5;
    id v12 = v4;
    dispatch_async(v6, block);

    id v7 = v13;
LABEL_5:
  }
}

uint64_t __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 88);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_4;
  v10[3] = &unk_1E5ACCFB8;
  v10[4] = v6;
  char v13 = a2;
  id v8 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(v7, v10);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
}

uint64_t __68__ICUserIdentityStore_removeAllDelegateTokensWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _dispatchDidChangeNotification:*(unsigned __int8 *)(a1 + 56) didDelegateAccountStoreChange:*(unsigned __int8 *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    char v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)insertPropertiesForUserIdentity:(id)a3 andPostAccountChangeNotification:(BOOL)a4 usingBlock:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__ICUserIdentityStore_insertPropertiesForUserIdentity_andPostAccountChangeNotification_usingBlock_completionHandler___block_invoke;
  block[3] = &unk_1E5ACCEC8;
  void block[4] = self;
  id v19 = v11;
  BOOL v22 = a4;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(accessQueue, block);
}

void __117__ICUserIdentityStore_insertPropertiesForUserIdentity_andPostAccountChangeNotification_usingBlock_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v18 = 0;
  id v4 = [v2 _existingIdentityPropertiesForUserIdentity:v3 error:&v18];
  id v5 = v18;
  if (!v5)
  {
    uint64_t v6 = v4;
    if (!v6)
    {
      uint64_t v6 = objc_alloc_init(ICMutableUserIdentityProperties);
      id v7 = [*(id *)(a1 + 40) deviceIdentifier];
      [(ICMutableUserIdentityProperties *)v6 setCarrierBundleDeviceIdentifier:v7];

      id v8 = [*(id *)(a1 + 40) DSID];
      [(ICMutableUserIdentityProperties *)v6 setDSID:v8];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v9 = *(unsigned __int8 *)(a1 + 64);
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v17 = 0;
    [v10 _saveIdentityProperties:v6 andPostAccountChangeNotification:v9 forUserIdentity:v11 error:&v17];
    id v5 = v17;
  }
  id v12 = *(void **)(a1 + 56);
  if (v12)
  {
    id v13 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __117__ICUserIdentityStore_insertPropertiesForUserIdentity_andPostAccountChangeNotification_usingBlock_completionHandler___block_invoke_2;
    v14[3] = &unk_1E5ACD2F0;
    id v16 = v12;
    id v15 = v5;
    dispatch_async(v13, v14);
  }
}

uint64_t __117__ICUserIdentityStore_insertPropertiesForUserIdentity_andPostAccountChangeNotification_usingBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

- (void)insertPropertiesForUserIdentity:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  [(ICUserIdentityStore *)self insertPropertiesForUserIdentity:v11 andPostAccountChangeNotification:1 usingBlock:v10 completionHandler:v9];
}

- (BOOL)insertPropertiesForUserIdentity:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__37878;
  id v25 = __Block_byref_object_dispose__37879;
  id v26 = 0;
  accessQueue = self->_accessQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__ICUserIdentityStore_insertPropertiesForUserIdentity_usingBlock_error___block_invoke;
  v17[3] = &unk_1E5ACCEA0;
  void v17[4] = self;
  id v12 = v9;
  id v18 = v12;
  id v20 = &v21;
  id v13 = v10;
  id v19 = v13;
  dispatch_sync(accessQueue, v17);
  id v14 = (void *)v22[5];
  if (a5 && v14)
  {
    *a5 = v14;
    id v14 = (void *)v22[5];
  }
  BOOL v15 = v14 == 0;

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __72__ICUserIdentityStore_insertPropertiesForUserIdentity_usingBlock_error___block_invoke(void *a1)
{
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 _existingIdentityPropertiesForUserIdentity:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v6 = v5;
    if (!v6)
    {
      uint64_t v6 = objc_alloc_init(ICMutableUserIdentityProperties);
      id v7 = [(id)a1[5] deviceIdentifier];
      [(ICMutableUserIdentityProperties *)v6 setCarrierBundleDeviceIdentifier:v7];

      id v8 = [(id)a1[5] DSID];
      [(ICMutableUserIdentityProperties *)v6 setDSID:v8];
    }
    (*(void (**)(void))(a1[6] + 16))();
    id v9 = (void *)a1[4];
    uint64_t v10 = a1[5];
    uint64_t v11 = *(void *)(a1[7] + 8);
    id v12 = *(id *)(v11 + 40);
    [v9 _saveIdentityProperties:v6 andPostAccountChangeNotification:1 forUserIdentity:v10 error:&v12];
    objc_storeStrong((id *)(v11 + 40), v12);
  }
}

- (void)insertPropertiesForUserIdentity:(id)a3 usingBlock:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  [(ICUserIdentityStore *)self insertPropertiesForUserIdentity:v8 usingBlock:v7 completionHandler:0];
}

- (id)getVerificationContextForUserIdentity:(id)a3 error:(id *)a4
{
  id v7 = a3;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__37878;
  id v26 = __Block_byref_object_dispose__37879;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__37878;
  id v20 = __Block_byref_object_dispose__37879;
  id v21 = 0;
  accessQueue = self->_accessQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__ICUserIdentityStore_getVerificationContextForUserIdentity_error___block_invoke;
  v12[3] = &unk_1E5ACCE78;
  void v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  id v14 = &v16;
  BOOL v15 = &v22;
  dispatch_sync(accessQueue, v12);
  if (a4) {
    *a4 = (id) v17[5];
  }
  id v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __67__ICUserIdentityStore_getVerificationContextForUserIdentity_error___block_invoke(void *a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 _dsidForUserIdentity:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void *)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  if (!v8)
  {
    id v9 = *(void **)(a1[4] + 24);
    if (v5)
    {
      id v26 = 0;
      uint64_t v10 = [v9 verificationContextForDSID:v5 error:&v26];
      objc_storeStrong(v7, v26);
      uint64_t v11 = *(void *)(a1[7] + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      [*(id *)(*(void *)(a1[7] + 8) + 40) setIdentityStore:a1[4]];
    }
    else
    {
      id v25 = 0;
      id v13 = [v9 activeAccountDSIDWithError:&v25];
      objc_storeStrong(v7, v25);
      if (!*(void *)(*(void *)(a1[6] + 8) + 40))
      {
        if (v13 || ![(id)a1[5] allowsAccountEstablishment])
        {
          uint64_t v28 = *MEMORY[0x1E4F28228];
          id v19 = [NSString stringWithFormat:@"Unable to get verification context for user identity - activeAccountDSID=%@ - allowsAccountEstablishment=%u", v13, objc_msgSend((id)a1[5], "allowsAccountEstablishment")];
          v29[0] = v19;
          id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];

          uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v20];
          uint64_t v22 = *(void *)(a1[6] + 8);
          uint64_t v23 = *(void **)(v22 + 40);
          *(void *)(v22 + 40) = v21;
        }
        else
        {
          id v14 = *(void **)(a1[4] + 24);
          uint64_t v15 = *(void *)(a1[6] + 8);
          id v24 = *(id *)(v15 + 40);
          uint64_t v16 = [v14 verificationContextForAccountEstablishmentWithError:&v24];
          objc_storeStrong((id *)(v15 + 40), v24);
          uint64_t v17 = *(void *)(a1[7] + 8);
          uint64_t v18 = *(void **)(v17 + 40);
          *(void *)(v17 + 40) = v16;

          [*(id *)(*(void *)(a1[7] + 8) + 40) setIdentityStore:a1[4]];
        }
      }
    }
  }
}

- (void)getDelegationUUIDsForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(accessQueue, block);
}

void __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v18 = 0;
  uint64_t v3 = [v2 _openDelegateAccountStoreWithError:&v18];
  id v4 = v18;
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5ACCE50;
    id v16 = *(id *)(a1 + 40);
    id v6 = v5;
    id v17 = v6;
    [v3 readUsingBlock:v15];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_4;
  v11[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 48);
  id v13 = v4;
  id v14 = v8;
  id v12 = v6;
  id v9 = v4;
  id v10 = v6;
  dispatch_async(v7, v11);
}

void __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_3;
  v4[3] = &unk_1E5ACCE28;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 enumerateDelegationUUIDsForUserIdentity:v3 usingBlock:v4];
}

uint64_t __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __75__ICUserIdentityStore_getDelegationUUIDsForUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateDelegateTokensWithType:(int64_t)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke;
  v14[3] = &unk_1E5ACCE00;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  int64_t v17 = a3;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(accessQueue, v14);
}

void __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v12 = 0;
  uint64_t v3 = [v2 _openDelegateAccountStoreWithError:&v12];
  id v4 = v12;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5ACCDD8;
  uint64_t v11 = *(void *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  [v3 readUsingBlock:v9];
  id v5 = *(void **)(a1 + 48);
  if (v5)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke_3;
    v7[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, v7);
  }
}

uint64_t __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 enumerateTokensWithType:*(void *)(a1 + 40) usingBlock:*(void *)(a1 + 32)];
}

uint64_t __84__ICUserIdentityStore_enumerateDelegateTokensWithType_usingBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateDelegateTokensUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke;
  block[3] = &unk_1E5ACCDB0;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(accessQueue, block);
}

void __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v11 = 0;
  uint64_t v3 = [v2 _openDelegateAccountStoreWithError:&v11];
  id v4 = v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5ACCD88;
  id v10 = *(id *)(a1 + 40);
  [v3 readUsingBlock:v9];
  id v5 = *(void **)(a1 + 48);
  if (v5)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke_3;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 enumerateTokensUsingBlock:*(void *)(a1 + 32)];
}

uint64_t __75__ICUserIdentityStore_enumerateDelegateTokensUsingBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(ICUserIdentityStore *)self _assertNonNullIdentityStoreForSelector:a2];
  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v16[3] = &unk_1E5ACD2A0;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(accessQueue, v16);
}

void __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v15 = 0;
  uint64_t v3 = [v2 _openDelegateAccountStoreWithError:&v15];
  id v4 = v15;
  if (!v4)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3;
    v10[3] = &unk_1E5ACCD60;
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 56);
    [v3 addDelegationUUIDs:v8 forUserIdentity:v9 completionHandler:v10];
    id v7 = v11;
    goto LABEL_5;
  }
  id v5 = *(void **)(a1 + 56);
  if (v5)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v14 = v5;
    id v13 = v4;
    dispatch_async(v6, block);

    id v7 = v14;
LABEL_5:
  }
}

uint64_t __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 88);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_4;
  v10[3] = &unk_1E5ACCFB8;
  v10[4] = v6;
  char v13 = a2;
  id v8 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(v7, v10);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
}

uint64_t __76__ICUserIdentityStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _dispatchDidChangeNotification:*(unsigned __int8 *)(a1 + 56) didDelegateAccountStoreChange:*(unsigned __int8 *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __30__ICUserIdentityStore_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

+ (id)testingIdentityStoreWithSingleWriterService:(id)a3
{
  id v4 = +[ICDelegateAccountStoreOptions defaultOptionsWithServiceEndpoint:a3];
  id v5 = (void *)[objc_alloc((Class)a1) _initWithStyle:1 delegateAccountStoreOptions:v4];

  return v5;
}

+ (id)testingIdentityStoreWithDatabasePath:(id)a3
{
  id v4 = +[ICDelegateAccountStoreOptions singleWriterOptionsWithDatabasePath:a3];
  id v5 = (void *)[objc_alloc((Class)a1) _initWithStyle:1 delegateAccountStoreOptions:v4];

  return v5;
}

+ (void)_claimSingleWriterStatus
{
  __IsSingleWriter = 1;
}

@end