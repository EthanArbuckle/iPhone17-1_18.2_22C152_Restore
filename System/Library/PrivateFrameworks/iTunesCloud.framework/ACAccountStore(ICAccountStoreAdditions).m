@interface ACAccountStore(ICAccountStoreAdditions)
+ (id)ic_sharedAccountStore;
+ (uint64_t)ic_canAccessAccountStore;
+ (uint64_t)ic_canAccessAppleAccounts;
- (BOOL)ic_disableActiveLockerAccount:()ICAccountStoreAdditions error:;
- (BOOL)ic_setActiveStoreAccount:()ICAccountStoreAdditions error:;
- (id)ic_activeLockerAccount;
- (id)ic_activeLockerAccountWithError:()ICAccountStoreAdditions;
- (id)ic_activeStoreAccount;
- (id)ic_activeStoreAccountWithError:()ICAccountStoreAdditions;
- (id)ic_allStoreAccounts;
- (id)ic_allStoreAccountsWithError:()ICAccountStoreAdditions;
- (id)ic_localStoreAccountWithError:()ICAccountStoreAdditions;
- (id)ic_primaryAppleAccount;
- (id)ic_primaryAppleAccountWithError:()ICAccountStoreAdditions;
- (id)ic_storeAccountForHomeUserIdentifier:()ICAccountStoreAdditions error:;
- (id)ic_storeAccountForStoreAccountID:()ICAccountStoreAdditions;
- (id)ic_storeAccountForStoreAccountID:()ICAccountStoreAdditions error:;
- (id)ic_storeAccountTypeWithError:()ICAccountStoreAdditions;
- (uint64_t)_ic_storeAccountType;
- (uint64_t)ic_setActiveLockerAccount:()ICAccountStoreAdditions error:;
- (void)ic_activeLockerAccountWithCompletion:()ICAccountStoreAdditions;
- (void)ic_activeStoreAccountWithCompletion:()ICAccountStoreAdditions;
- (void)ic_allStoreAccountsWithCompletion:()ICAccountStoreAdditions;
- (void)ic_localStoreAccountWithCompletion:()ICAccountStoreAdditions;
- (void)ic_primaryAppleAccountWithCompletion:()ICAccountStoreAdditions;
- (void)ic_setActiveLockerAccount:()ICAccountStoreAdditions;
- (void)ic_setActiveLockerAccount:()ICAccountStoreAdditions completion:;
- (void)ic_setActiveStoreAccount:()ICAccountStoreAdditions;
- (void)ic_setActiveStoreAccount:()ICAccountStoreAdditions completion:;
- (void)ic_storeAccountForHomeUserIdentifier:()ICAccountStoreAdditions completion:;
- (void)ic_storeAccountForStoreAccountID:()ICAccountStoreAdditions completion:;
- (void)ic_storeAccountTypeWithCompletion:()ICAccountStoreAdditions;
@end

@implementation ACAccountStore(ICAccountStoreAdditions)

+ (uint64_t)ic_canAccessAccountStore
{
  if (ic_canAccessAccountStore_onceToken != -1) {
    dispatch_once(&ic_canAccessAccountStore_onceToken, &__block_literal_global_2);
  }
  return ic_canAccessAccountStore___hasAccountAccess;
}

+ (uint64_t)ic_canAccessAppleAccounts
{
  if (ic_canAccessAppleAccounts_onceToken != -1) {
    dispatch_once(&ic_canAccessAppleAccounts_onceToken, &__block_literal_global_12_15270);
  }
  return ic_canAccessAppleAccounts___hasAppleAccountAccess;
}

- (uint64_t)_ic_storeAccountType
{
  return [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17890] error:0];
}

- (id)ic_storeAccountForStoreAccountID:()ICAccountStoreAdditions
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15233;
  v16 = __Block_byref_object_dispose__15234;
  id v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID___block_invoke;
  v9[3] = &unk_1E5AC9078;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  objc_msgSend(a1, "ic_storeAccountForStoreAccountID:completion:", v4, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)ic_setActiveLockerAccount:()ICAccountStoreAdditions
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount___block_invoke;
  v7[3] = &unk_1E5ACC7B0;
  dispatch_semaphore_t v8 = v5;
  v6 = v5;
  objc_msgSend(a1, "ic_setActiveLockerAccount:completion:", v4, v7);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)ic_setActiveStoreAccount:()ICAccountStoreAdditions
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount___block_invoke;
  v7[3] = &unk_1E5ACC7B0;
  dispatch_semaphore_t v8 = v5;
  v6 = v5;
  objc_msgSend(a1, "ic_setActiveStoreAccount:completion:", v4, v7);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)ic_primaryAppleAccount
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__15233;
  v13 = __Block_byref_object_dispose__15234;
  id v14 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccount__block_invoke;
  v6[3] = &unk_1E5AC9078;
  dispatch_semaphore_t v8 = &v9;
  v3 = v2;
  id v7 = v3;
  objc_msgSend(a1, "ic_primaryAppleAccountWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)ic_activeLockerAccount
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__15233;
  v13 = __Block_byref_object_dispose__15234;
  id v14 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__ACAccountStore_ICAccountStoreAdditions__ic_activeLockerAccount__block_invoke;
  v6[3] = &unk_1E5AC9078;
  dispatch_semaphore_t v8 = &v9;
  v3 = v2;
  id v7 = v3;
  objc_msgSend(a1, "ic_activeLockerAccountWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)ic_activeStoreAccount
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__15233;
  v13 = __Block_byref_object_dispose__15234;
  id v14 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccount__block_invoke;
  v6[3] = &unk_1E5AC9078;
  dispatch_semaphore_t v8 = &v9;
  v3 = v2;
  id v7 = v3;
  objc_msgSend(a1, "ic_activeStoreAccountWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)ic_allStoreAccounts
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__15233;
  v13 = __Block_byref_object_dispose__15234;
  id v14 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccounts__block_invoke;
  v6[3] = &unk_1E5AC9050;
  dispatch_semaphore_t v8 = &v9;
  v3 = v2;
  id v7 = v3;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)ic_localStoreAccountWithError:()ICAccountStoreAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15233;
  v16 = __Block_byref_object_dispose__15234;
  id v17 = 0;
  id v11 = 0;
  dispatch_semaphore_t v5 = objc_msgSend(a1, "ic_allStoreAccountsWithError:", &v11);
  id v6 = v11;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v19 = a1;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving local store account. err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__ACAccountStore_ICAccountStoreAdditions__ic_localStoreAccountWithError___block_invoke;
    v10[3] = &unk_1E5AC8F88;
    v10[4] = &v12;
    [v5 enumerateObjectsUsingBlock:v10];
  }
  if (a3) {
    *a3 = v6;
  }
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)ic_localStoreAccountWithCompletion:()ICAccountStoreAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__ACAccountStore_ICAccountStoreAdditions__ic_localStoreAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E5AC8F38;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v6);
}

- (id)ic_storeAccountForHomeUserIdentifier:()ICAccountStoreAdditions error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"ACAccountStore+ICAccountStoreAdditions.m", 408, @"Invalid parameter not satisfying: %@", @"homeUserID" object file lineNumber description];
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__15233;
  uint64_t v22 = __Block_byref_object_dispose__15234;
  id v23 = 0;
  id v17 = 0;
  id v8 = objc_msgSend(a1, "ic_allStoreAccountsWithError:", &v17);
  id v9 = v17;
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = a1;
      __int16 v26 = 2114;
      id v27 = v7;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving store account for home ID %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForHomeUserIdentifier_error___block_invoke;
    v14[3] = &unk_1E5AC9000;
    v15 = v7;
    v16 = &v18;
    [v8 enumerateObjectsUsingBlock:v14];
    v10 = v15;
  }

  if (a4) {
    *a4 = v9;
  }
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)ic_storeAccountForHomeUserIdentifier:()ICAccountStoreAdditions completion:
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"ACAccountStore+ICAccountStoreAdditions.m", 387, @"Invalid parameter not satisfying: %@", @"homeUserID" object file lineNumber description];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForHomeUserIdentifier_completion___block_invoke;
  v12[3] = &unk_1E5ACC478;
  id v13 = v7;
  id v14 = v8;
  id v9 = v7;
  id v10 = v8;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v12);
}

- (id)ic_storeAccountTypeWithError:()ICAccountStoreAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F17890];
  id v10 = 0;
  id v6 = [a1 accountTypeWithAccountTypeIdentifier:v5 error:&v10];
  id v7 = v10;
  if (v7)
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v12 = a1;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving store account type. err=%{public}@", buf, 0x16u);
    }
  }
  if (a3) {
    *a3 = v7;
  }

  return v6;
}

- (void)ic_storeAccountTypeWithCompletion:()ICAccountStoreAdditions
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F17890];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountTypeWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC9028;
  id v8 = v4;
  id v6 = v4;
  [a1 accountTypeWithIdentifier:v5 completion:v7];
}

- (id)ic_storeAccountForStoreAccountID:()ICAccountStoreAdditions error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"ACAccountStore+ICAccountStoreAdditions.m", 344, @"Invalid parameter not satisfying: %@", @"storeAccountID != nil" object file lineNumber description];
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__15233;
  uint64_t v22 = __Block_byref_object_dispose__15234;
  id v23 = 0;
  id v17 = 0;
  id v8 = objc_msgSend(a1, "ic_allStoreAccountsWithError:", &v17);
  id v9 = v17;
  if (v9)
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = a1;
      __int16 v26 = 2114;
      id v27 = v7;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving store account for DSID %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID_error___block_invoke;
    v14[3] = &unk_1E5AC9000;
    uint64_t v15 = v7;
    v16 = &v18;
    [v8 enumerateObjectsUsingBlock:v14];
    id v10 = v15;
  }

  if (a4) {
    *a4 = v9;
  }
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)ic_storeAccountForStoreAccountID:()ICAccountStoreAdditions completion:
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"ACAccountStore+ICAccountStoreAdditions.m", 326, @"Invalid parameter not satisfying: %@", @"storeAccountID != nil" object file lineNumber description];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID_completion___block_invoke;
  v12[3] = &unk_1E5ACC478;
  id v13 = v7;
  id v14 = v8;
  id v9 = v7;
  id v10 = v8;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v12);
}

- (id)ic_primaryAppleAccountWithError:()ICAccountStoreAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__15233;
  v16 = __Block_byref_object_dispose__15234;
  id v17 = 0;
  id v11 = 0;
  uint64_t v5 = objc_msgSend(a1, "aa_appleAccountsWithError:", &v11);
  id v6 = v11;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccountWithError___block_invoke;
  v10[3] = &unk_1E5AC8F88;
  v10[4] = &v12;
  [v5 enumerateObjectsUsingBlock:v10];
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v19 = a1;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error fetching primary apple account. err=%{public}@", buf, 0x16u);
    }
  }
  if (a3) {
    *a3 = v6;
  }
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)ic_primaryAppleAccountWithCompletion:()ICAccountStoreAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E5AC8FB0;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a1, "aa_primaryAppleAccountWithCompletion:", v6);
}

- (BOOL)ic_disableActiveLockerAccount:()ICAccountStoreAdditions error:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"ACAccountStore+ICAccountStoreAdditions.m", 276, @"Invalid parameter not satisfying: %@", @"account != nil" object file lineNumber description];

LABEL_5:
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:1 userInfo:0];
    goto LABEL_6;
  }
  if (!objc_msgSend(v7, "ic_isActiveLockerAccount")) {
    goto LABEL_5;
  }
  objc_msgSend(v8, "ic_setActiveLockerAccount:", 0);
  id v15 = 0;
  char v9 = [a1 saveVerifiedAccount:v8 error:&v15];
  id v10 = v15;
  id v11 = v10;
  if ((v9 & 1) == 0 && !v10) {
    goto LABEL_5;
  }
LABEL_6:
  if (v11)
  {
    uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v17 = a1;
      __int16 v18 = 2114;
      v19 = v8;
      __int16 v20 = 2114;
      id v21 = v11;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error removing active locker account %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  if (a4) {
    *a4 = v11;
  }

  return v11 == 0;
}

- (uint64_t)ic_setActiveLockerAccount:()ICAccountStoreAdditions error:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "ic_isActiveLockerAccount"))
    {
      id v8 = 0;
      goto LABEL_24;
    }
    id v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v7;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ as the active locker account", buf, 0xCu);
    }

    objc_msgSend(v7, "ic_setActiveLockerAccount:", 1);
    id v21 = 0;
    char v14 = [a1 saveVerifiedAccount:v7 error:&v21];
    id v15 = v21;
    id v8 = v15;
    if ((v14 & 1) == 0 && !v15)
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:1 userInfo:0];
    }
    if (v8)
    {
LABEL_18:
      v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        id v23 = a1;
        __int16 v24 = 2114;
        v25 = v7;
        __int16 v26 = 2114;
        id v27 = v8;
        _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error setting active locker account %{public}@. err=%{public}@", buf, 0x20u);
      }

      uint64_t v17 = 0;
      if (a4) {
        goto LABEL_25;
      }
      goto LABEL_26;
    }
  }
  else
  {
    id v20 = 0;
    char v9 = objc_msgSend(a1, "ic_activeStoreAccountWithError:", &v20);
    id v8 = v20;
    if (v8) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v9 == 0;
    }
    if (!v10)
    {
      if (objc_msgSend(v9, "ic_isActiveLockerAccount"))
      {
        objc_msgSend(v9, "ic_setActiveLockerAccount:", 0);
        id v19 = 0;
        char v11 = [a1 saveVerifiedAccount:v9 error:&v19];
        id v12 = v19;
        id v8 = v12;
        if ((v11 & 1) == 0 && !v12)
        {
          id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:1 userInfo:0];
        }
      }
      else
      {
        id v8 = 0;
      }
    }

    if (v8) {
      goto LABEL_18;
    }
  }
LABEL_24:
  uint64_t v17 = 1;
  if (a4) {
LABEL_25:
  }
    *a4 = v8;
LABEL_26:

  return v17;
}

- (void)ic_setActiveLockerAccount:()ICAccountStoreAdditions completion:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (!v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke_2;
    v11[3] = &unk_1E5AC8FD8;
    v11[4] = a1;
    id v12 = v7;
    objc_msgSend(a1, "ic_activeStoreAccountWithCompletion:", v11);
    char v9 = v12;
LABEL_8:

    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "ic_isActiveLockerAccount") & 1) == 0)
  {
    objc_msgSend(v6, "ic_setActiveLockerAccount:", 1);
    BOOL v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ as the active locker account", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke;
    v13[3] = &unk_1E5ACB920;
    char v14 = v8;
    [a1 saveAccount:v6 withDataclassActions:0 doVerify:0 completion:v13];
    char v9 = v14;
    goto LABEL_8;
  }
  v8[2](v8, 0);
LABEL_9:
}

- (id)ic_activeLockerAccountWithError:()ICAccountStoreAdditions
{
  id v10 = 0;
  id v4 = objc_msgSend(a1, "ic_activeStoreAccountWithError:", &v10);
  id v5 = v10;
  id v6 = v5;
  if (a3) {
    *a3 = v5;
  }
  if (v6)
  {
    id v7 = 0;
  }
  else if (objc_msgSend(v4, "ic_isActiveLockerAccount"))
  {
    id v7 = v4;
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)ic_activeLockerAccountWithCompletion:()ICAccountStoreAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__ACAccountStore_ICAccountStoreAdditions__ic_activeLockerAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E5AC8FB0;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a1, "ic_activeStoreAccountWithCompletion:", v6);
}

- (BOOL)ic_setActiveStoreAccount:()ICAccountStoreAdditions error:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = 0;
  id v23 = a1;
  id v6 = objc_msgSend(a1, "ic_allStoreAccountsWithError:", &v29);
  id v7 = v29;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    uint64_t v21 = *MEMORY[0x1E4F178F0];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v13 = [v5 identifier];
        char v14 = [v12 identifier];
        uint64_t v15 = [v13 isEqualToString:v14];
        if (v15 != [v12 isActive])
        {
          [v12 setActive:v15];
          id v24 = v7;
          char v16 = [v23 saveVerifiedAccount:v12 error:&v24];
          id v17 = v24;

          if ((v16 & 1) == 0 && !v17)
          {
            id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:v21 code:1 userInfo:0];
          }
          if (v17)
          {
            __int16 v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218498;
              v31 = v23;
              __int16 v32 = 2114;
              v33 = v12;
              __int16 v34 = 2114;
              id v35 = v17;
              _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error updating active bit for account %{public}@. err=%{public}@", buf, 0x20u);
            }

            id v7 = v17;
          }
          else
          {
            id v7 = 0;
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v9);
  }

  if (a4) {
    *a4 = v7;
  }

  return v7 == 0;
}

- (void)ic_setActiveStoreAccount:()ICAccountStoreAdditions completion:
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke;
  v10[3] = &unk_1E5ACC400;
  id v12 = a1;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v10);
}

- (id)ic_activeStoreAccountWithError:()ICAccountStoreAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v17 = 0;
  id v5 = objc_msgSend(a1, "ic_allStoreAccountsWithError:", &v17);
  id v6 = v17;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__15233;
  uint64_t v15 = __Block_byref_object_dispose__15234;
  id v16 = 0;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v19 = a1;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving all store accounts, err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccountWithError___block_invoke;
    v10[3] = &unk_1E5AC8F88;
    void v10[4] = &v11;
    [v5 enumerateObjectsUsingBlock:v10];
  }
  if (a3) {
    *a3 = v6;
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)ic_activeStoreAccountWithCompletion:()ICAccountStoreAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E5AC8F38;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v6);
}

- (id)ic_allStoreAccountsWithError:()ICAccountStoreAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F17890];
  id v15 = 0;
  id v6 = [a1 accountTypeWithAccountTypeIdentifier:v5 error:&v15];
  id v7 = v15;
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
  }
  else
  {
    id v14 = 0;
    uint64_t v10 = [a1 accountsWithAccountType:v6 options:1 error:&v14];
    id v8 = v14;
    uint64_t v11 = objc_msgSend(v10, "msv_filter:", &__block_literal_global_22);
    id v9 = (void *)[v11 copy];

    if (!v8) {
      goto LABEL_7;
    }
  }
  id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    id v17 = a1;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving iTunesStore accounts. err=%{public}@", buf, 0x16u);
  }

LABEL_7:
  if (a3) {
    *a3 = v8;
  }

  return v9;
}

- (void)ic_allStoreAccountsWithCompletion:()ICAccountStoreAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithCompletion___block_invoke;
  v6[3] = &unk_1E5AC8F60;
  void v6[4] = a1;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a1, "ic_storeAccountTypeWithCompletion:", v6);
}

+ (id)ic_sharedAccountStore
{
  if (ic_sharedAccountStore_onceToken != -1) {
    dispatch_once(&ic_sharedAccountStore_onceToken, &__block_literal_global_15286);
  }
  v0 = (void *)ic_sharedAccountStore_sSharedAccountStore;

  return v0;
}

@end