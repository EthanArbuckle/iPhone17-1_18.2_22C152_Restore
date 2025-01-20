@interface FCPurchaseIntegrityChecker
- (void)isUserEntitledToSubscriptionForPurchaseID:(id)a3 completion:(id)a4;
@end

@implementation FCPurchaseIntegrityChecker

- (void)isUserEntitledToSubscriptionForPurchaseID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F4BCF0] sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__FCPurchaseIntegrityChecker_isUserEntitledToSubscriptionForPurchaseID_completion___block_invoke;
  v10[3] = &unk_1E5B5A388;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 getSubscriptionEntitlementsForSegment:0 ignoreCaches:1 withResultHandler:v10];
}

void __83__FCPurchaseIntegrityChecker_isUserEntitledToSubscriptionForPurchaseID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = FCPurchaseLog;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_error_impl(&dword_1A460D000, v8, OS_LOG_TYPE_ERROR, "isUserEntitledToSubscriptionForPurchaseID: error:%{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "isUserEntitledToSubscriptionForPurchaseID: subscriptions: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__70;
    v17 = __Block_byref_object_dispose__70;
    id v18 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__FCPurchaseIntegrityChecker_isUserEntitledToSubscriptionForPurchaseID_completion___block_invoke_1;
    v11[3] = &unk_1E5B5A360;
    id v12 = *(id *)(a1 + 32);
    p_long long buf = &buf;
    [v6 enumerateObjectsUsingBlock:v11];
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, *(void *)(*((void *)&buf + 1) + 40));
    }

    _Block_object_dispose(&buf, 8);
  }
}

void __83__FCPurchaseIntegrityChecker_isUserEntitledToSubscriptionForPurchaseID_completion___block_invoke_1(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 inAppAdamID];
  id v8 = [v7 stringValue];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    uint64_t v10 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      id v12 = [v6 inAppAdamID];
      v13 = [v12 stringValue];
      uint64_t v14 = *(void *)(a1 + 32);
      int v18 = 138543618;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "isUserEntitledToSubscriptionForPurchaseID: subscriptionEntitlement: %{public}@ matched with purchaseID: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v15 = [[FCSubscriptionEntitlement alloc] initWithASDEntitlement:v6];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    *a4 = 1;
  }
}

@end