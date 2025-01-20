@interface NPFamilyEligibilityProvider
- (ACAccountStore)store;
- (AIDAAccountManager)accountManager;
- (FAFamilyEligibilityRequester)eligibilityRequester;
- (NPFamilyEligibilityProvider)init;
- (id)accountsForAccountManager:(id)a3;
- (id)requestFamilyEligibility;
@end

@implementation NPFamilyEligibilityProvider

- (NPFamilyEligibilityProvider)init
{
  v14.receiver = self;
  v14.super_class = (Class)NPFamilyEligibilityProvider;
  v2 = [(NPFamilyEligibilityProvider *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F179C8] defaultStore];
    store = v2->_store;
    v2->_store = (ACAccountStore *)v3;

    id v5 = objc_alloc(MEMORY[0x1E4F4D920]);
    v6 = [(NPFamilyEligibilityProvider *)v2 store];
    uint64_t v7 = [v5 initWithAccountStore:v6];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AIDAAccountManager *)v7;

    [(AIDAAccountManager *)v2->_accountManager setDelegate:v2];
    id v9 = objc_alloc(MEMORY[0x1E4F61888]);
    v10 = [(NPFamilyEligibilityProvider *)v2 accountManager];
    uint64_t v11 = [v9 initWithAccountManager:v10];
    eligibilityRequester = v2->_eligibilityRequester;
    v2->_eligibilityRequester = (FAFamilyEligibilityRequester *)v11;
  }
  return v2;
}

- (id)requestFamilyEligibility
{
  id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke;
  v6[3] = &unk_1E64159B0;
  v6[4] = self;
  v4 = (void *)[v3 initWithResolver:v6];
  return v4;
}

void __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F7E0A0];
  v8 = *MEMORY[0x1E4F7E0A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7E0A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BFC31000, v8, OS_LOG_TYPE_DEFAULT, "Requesting aa_primaryAppleAccount", buf, 2u);
  }
  id v9 = [*(id *)(a1 + 32) accountManager];
  v10 = [v9 accountStore];
  uint64_t v11 = objc_msgSend(v10, "aa_primaryAppleAccount");

  if (v11)
  {
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BFC31000, v12, OS_LOG_TYPE_DEFAULT, "Requesting Family Eligibility", buf, 2u);
    }
    v13 = [*(id *)(a1 + 32) eligibilityRequester];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke_31;
    v17[3] = &unk_1E6415988;
    v17[4] = *(void *)(a1 + 32);
    id v18 = v5;
    id v14 = v5;
    [v13 requestFamilyEligibilityWithCompletion:v17];

    v15 = v18;
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke_28;
    v19[3] = &unk_1E6415960;
    id v20 = v5;
    id v16 = v5;
    __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke_28((uint64_t)v19);
    v15 = v20;
  }
}

void __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke_28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [NSNumber numberWithBool:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)*MEMORY[0x1E4F7E0A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7E0A0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    uint64_t v9 = objc_opt_class();
    int v10 = [v5 eligible];
    uint64_t v11 = @"NO";
    *(_DWORD *)id v16 = 138413058;
    *(void *)&v16[4] = v9;
    *(_WORD *)&v16[12] = 2114;
    if (v10) {
      uint64_t v11 = @"YES";
    }
    *(void *)&v16[14] = v5;
    __int16 v17 = 2114;
    id v18 = v11;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_1BFC31000, v8, OS_LOG_TYPE_DEFAULT, "%@ requestFamilyEligibility completed with resonse:%{public}@  eligible: %{public}@ error:%{public}@", v16, 0x2Au);
  }
  if (v5 && [v5 eligible])
  {
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = NSNumber;
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = NSNumber;
    uint64_t v14 = 0;
  }
  v15 = objc_msgSend(v13, "numberWithBool:", v14, *(_OWORD *)v16);
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);
}

- (id)accountsForAccountManager:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 accountStore];

  uint64_t v7 = objc_msgSend(v6, "aa_primaryAppleAccount");

  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F4D8E8]];
  }
  v8 = (void *)[v5 copy];

  return v8;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (FAFamilyEligibilityRequester)eligibilityRequester
{
  return self->_eligibilityRequester;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibilityRequester, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end