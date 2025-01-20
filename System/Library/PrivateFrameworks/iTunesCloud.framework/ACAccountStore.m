@interface ACAccountStore
@end

@implementation ACAccountStore

void __68__ACAccountStore_ICAccountStoreAdditions__ic_canAccessAppleAccounts__block_invoke()
{
  ic_canAccessAppleAccounts___hasAppleAccountAccess = [MEMORY[0x1E4F77990] hasBoolEntitlement:@"com.apple.accounts.appleaccount.fullaccess" shouldLogForMissingEntitlement:0];
  if ((ic_canAccessAppleAccounts___hasAppleAccountAccess & 1) == 0)
  {
    v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1A2D01000, v0, OS_LOG_TYPE_DEFAULT, "[ACAccountStore] Current process does not have apple account access.", v1, 2u);
    }
  }
}

void __67__ACAccountStore_ICAccountStoreAdditions__ic_canAccessAccountStore__block_invoke()
{
  if ([MEMORY[0x1E4F77990] hasBoolEntitlement:@"com.apple.private.accounts.allaccounts" shouldLogForMissingEntitlement:0] & 1) != 0|| (objc_msgSend(MEMORY[0x1E4F77990], "hasBoolEntitlement:shouldLogForMissingEntitlement:", @"com.apple.itunesstored.private", 0))
  {
    ic_canAccessAccountStore___hasAccountAccess = 1;
  }
  else
  {
    ic_canAccessAccountStore___hasAccountAccess = [MEMORY[0x1E4F77990] hasBoolEntitlement:@"com.apple.private.applemediaservices" shouldLogForMissingEntitlement:0];
    if ((ic_canAccessAccountStore___hasAccountAccess & 1) == 0)
    {
      v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v1 = 0;
        _os_log_impl(&dword_1A2D01000, v0, OS_LOG_TYPE_DEFAULT, "[ACAccountStore] Current process does not have account store access.", v1, 2u);
      }
    }
  }
}

void __76__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __69__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __68__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccount__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__ACAccountStore_ICAccountStoreAdditions__ic_activeLockerAccount__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccount__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccounts__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __73__ACAccountStore_ICAccountStoreAdditions__ic_localStoreAccountWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(v7, "ic_isLocalAccount"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __78__ACAccountStore_ICAccountStoreAdditions__ic_localStoreAccountWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    id v8 = (id)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v11, "ic_isLocalAccount", (void)v12))
          {
            id v8 = v11;
            goto LABEL_13;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __86__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForHomeUserIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = objc_msgSend(v9, "ic_homeUserIdentifiers");
  id v8 = v7;
  if (v7 && [v7 containsObject:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __91__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForHomeUserIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v26;
      obuint64_t j = v5;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v13 = objc_msgSend(v12, "ic_homeUserIdentifiers");
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v22;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v22 != v17) {
                  objc_enumerationMutation(v14);
                }
                if ([*(id *)(*((void *)&v21 + 1) + 8 * j) isEqual:*(void *)(a1 + 32)])
                {
                  id v19 = v12;

                  id v9 = v19;
                  goto LABEL_18;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
LABEL_18:
        }
        id v5 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id v6 = 0;
  }
}

uint64_t __77__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountTypeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = objc_msgSend(v9, "ic_DSID");
  int v8 = [v7 isEqualToNumber:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __87__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v12 = objc_msgSend(v11, "ic_DSID", (void)v14);
          int v13 = [v12 isEqualToNumber:*(void *)(a1 + 32)];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_13;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __75__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccountWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(v7, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __80__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccountWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    id v5 = 0;
    if ((a2 & 1) == 0)
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:1 userInfo:0];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_msgSend(v3, "ic_isActiveLockerAccount"))
  {
    objc_msgSend(v3, "ic_setActiveLockerAccount:", 0);
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Removing %{public}@ as the active locker account", buf, 0xCu);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke_27;
    v6[3] = &unk_1E5ACB920;
    id v5 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v5 saveAccount:v3 withDataclassActions:0 doVerify:0 completion:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke_27(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    id v5 = 0;
    if ((a2 & 1) == 0)
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:1 userInfo:0];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__ACAccountStore_ICAccountStoreAdditions__ic_activeLockerAccountWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_5:
    v7();
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "ic_isActiveLockerAccount"))
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "active store account does not have the locker bit set - returning nil", v11, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:1 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

LABEL_6:
}

void __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v18 = v5;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = dispatch_group_create();
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__15233;
    v34[4] = __Block_byref_object_dispose__15234;
    id v35 = 0;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 1;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          dispatch_group_enter(v7);
          long long v12 = [*(id *)(a1 + 32) identifier];
          int v13 = [v11 identifier];
          uint64_t v14 = [v12 isEqualToString:v13];
          if (v14 != [v11 isActive])
          {
            [v11 setActive:v14];
            long long v15 = *(void **)(a1 + 40);
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke_2;
            v24[3] = &unk_1E5ACCEF0;
            long long v26 = v32;
            long long v27 = v34;
            long long v16 = v7;
            long long v25 = v16;
            [v15 saveAccount:v11 withDataclassActions:0 doVerify:0 completion:v24];
            long long v17 = dispatch_get_global_queue(0, 0);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke_3;
            block[3] = &unk_1E5ACC388;
            long long v22 = v32;
            long long v23 = v34;
            id v21 = *(id *)(a1 + 48);
            dispatch_group_notify(v16, v17, block);
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v8);
    }

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v34, 8);

    id v6 = 0;
  }
}

void __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v10 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    *(unsigned char *)(v6 + 24) = a2;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  if (!v9) {
    objc_storeStrong(v8, a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke_3(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24) && !*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:1 userInfo:0];
    uint64_t v3 = *(void *)(a1[6] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  id v5 = *(uint64_t (**)(void))(a1[4] + 16);

  return v5();
}

void __74__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccountWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isActive])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __79__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccountWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    id v8 = (id)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v11, "isActive", (void)v12))
          {
            id v8 = v11;
            goto LABEL_13;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __72__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_isITunesAccount");
}

void __77__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithCompletion___block_invoke_2;
    v6[3] = &unk_1E5AC8F38;
    id v5 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v5 accountsWithAccountType:a2 options:1 completion:v6];
  }
}

void __77__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(a2, "msv_filter:", &__block_literal_global_18);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = (void *)[v8 copy];
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
}

uint64_t __77__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_isITunesAccount");
}

uint64_t __64__ACAccountStore_ICAccountStoreAdditions__ic_sharedAccountStore__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v1 = ic_sharedAccountStore_sSharedAccountStore;
  ic_sharedAccountStore_sSharedAccountStore = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end