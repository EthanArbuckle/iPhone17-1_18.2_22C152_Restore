@interface TPSActiveSubscriptionValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSActiveSubscriptionValidation

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)getASDIAPHistoryClass_softClass;
  uint64_t v15 = getASDIAPHistoryClass_softClass;
  if (!getASDIAPHistoryClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getASDIAPHistoryClass_block_invoke;
    v11[3] = &unk_1E6E6AE20;
    v11[4] = &v12;
    __getASDIAPHistoryClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v12, 8);
  v7 = [v6 sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke;
  v9[3] = &unk_1E6E6C7E8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 getAllIAPsForActiveAccountWithResultHandler:v9];
}

void __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      id v8 = [MEMORY[0x1E4F1C9C8] now];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_2;
      aBlock[3] = &unk_1E6E6C798;
      id v9 = v8;
      id v23 = v9;
      id v10 = _Block_copy(aBlock);
      if ([MEMORY[0x1E4FAF450] debugActiveIAPs])
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3;
        v20[3] = &unk_1E6E6C7C0;
        v11 = &v21;
        v21 = v10;
        id v12 = v10;
        v13 = objc_msgSend(v5, "na_filter:", v20);
        int v14 = [v13 count] != 0;
      }
      else
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3;
        v18[3] = &unk_1E6E6C7C0;
        v11 = &v19;
        v19 = v10;
        id v15 = v10;
        int v14 = objc_msgSend(v5, "na_any:", v18);
      }
    }
    else
    {
      int v14 = 0;
    }
    int v16 = v14 ^ [*(id *)(a1 + 32) BOOLValue] ^ 1;
    v17 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v16, v17);
    }

    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

BOOL __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 3)
  {
    id v4 = [v3 expirationDate];
    if (v4)
    {
      id v5 = [v3 expirationDate];
      BOOL v6 = [v5 compare:*(void *)(a1 + 32)] != -1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v4)
  {
    id v5 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3_cold_1((uint64_t)v3, v5);
    }
  }
  return v4;
}

uint64_t __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "Found subscription: %@", (uint8_t *)&v2, 0xCu);
}

@end