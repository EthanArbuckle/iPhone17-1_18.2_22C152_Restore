@interface FCBundleEntitlementsProvider
- (FCBundleEntitlementsProvider)initWithConfigurationManager:(id)a3 entitlementService:(id)a4;
- (FCCoreConfigurationManager)configurationManager;
- (FCEntitlementService)entitlementService;
- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider;
- (void)_fetchEntitlementsWithIgnoreCache:(BOOL)a3 configuration:(id)a4 completion:(id)a5;
- (void)fetchEntitlementsWithIgnoreCache:(BOOL)a3 completion:(id)a4;
- (void)setEntitlementsOverrideProvider:(id)a3;
@end

@implementation FCBundleEntitlementsProvider

- (void)_fetchEntitlementsWithIgnoreCache:(BOOL)a3 configuration:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v10 = [(FCBundleEntitlementsProvider *)self entitlementService];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke;
  v13[3] = &unk_1E5B581D8;
  v13[4] = self;
  id v11 = v9;
  id v15 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = v8;
  id v14 = v12;
  [v10 performEntitlementWithIgnoreCache:v6 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)fetchEntitlementsWithIgnoreCache:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v7 = [(FCBundleEntitlementsProvider *)self configurationManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke;
  v9[3] = &unk_1E5B58160;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  BOOL v12 = a3;
  FCCoreConfigurationFetch(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (FCEntitlementService)entitlementService
{
  return self->_entitlementService;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

void __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke_2;
  v6[3] = &unk_1E5B58138;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 48);
  id v5 = v3;
  FCPerformIfNonNil(WeakRetained, v6);
}

void __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke(id *a1, void *a2, int a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  char v9 = (void *)FCPurchaseLog;
  if (v8)
  {
    if (!os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v10 = v9;
    *(_DWORD *)buf = 138412802;
    uint64_t v29 = objc_opt_class();
    __int16 v30 = 2114;
    id v31 = v7;
    __int16 v32 = 2114;
    id v33 = v8;
    _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "%@ failed to fetch entitlements with entitlements:%{public}@, error: %{public}@", buf, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v10 = v9;
    *(_DWORD *)buf = 138412546;
    uint64_t v29 = objc_opt_class();
    __int16 v30 = 2114;
    id v31 = v7;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "%@ Entitlements response received with entitlements: %{public}@", buf, 0x16u);
  }

LABEL_7:
  id v11 = objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", &__block_literal_global_126);
  BOOL v12 = [a1[4] entitlementsOverrideProvider];

  if (v12)
  {
    v13 = [a1[4] entitlementsOverrideProvider];
    id v14 = [v13 entitlementsOverrideWithDefaultEntitlements:v11];

    if (v14)
    {
      uint64_t v15 = [v14 entitlements];

      uint64_t v16 = [v14 error];

      id v11 = (void *)v15;
      id v8 = (id)v16;
    }
  }
  if ([v8 code] == 3001)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 3001;
    goto LABEL_24;
  }
  if (!a3 || (uint64_t v19 = [v11 count], v8) || v19)
  {
    if (!v11 || v8 && ![v11 count]) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v20 = [a1[4] entitlementsOverrideProvider];

  if (v20)
  {
    if (!v11)
    {
LABEL_23:
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = 5001;
      goto LABEL_24;
    }
LABEL_22:
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke_2;
    v24[3] = &unk_1E5B581B0;
    id v25 = v11;
    id v26 = a1[5];
    id v27 = a1[6];
    FCPerformIfNonNil(WeakRetained, v24);

    v22 = v25;
    goto LABEL_26;
  }
  v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v18 = 5003;
LABEL_24:
  v22 = [v17 errorWithDomain:@"BundleEntitlementsProviderErrorDomain" code:v18 userInfo:0];
  v23 = (void (**)(id, void, void *))a1[6];
  if (v23) {
    v23[2](v23, 0, v22);
  }
LABEL_26:
}

- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider
{
  return self->entitlementsOverrideProvider;
}

- (FCBundleEntitlementsProvider)initWithConfigurationManager:(id)a3 entitlementService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCBundleEntitlementsProvider;
  char v9 = [(FCBundleEntitlementsProvider *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurationManager, a3);
    objc_storeStrong((id *)&v10->_entitlementService, a4);
  }

  return v10;
}

void __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (NFInternalBuild())
  {
    v4 = NewsCoreUserDefaults();
    int v5 = [v4 BOOLForKey:@"running_ui_automation"];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) paidBundleConfig];
      id v7 = [v6 offeredBundlePurchaseIDs];
      id v8 = [v7 firstObject];

      char v9 = NewsCoreUserDefaults();
      uint64_t v10 = [v9 integerForKey:@"simulate_bundle_subscription_state"];

      id v11 = NewsCoreUserDefaults();
      int v12 = [v11 BOOLForKey:@"simulate_bundle_subscription_is_family_member"];

      v13 = NewsCoreUserDefaults();
      uint64_t v14 = [v13 BOOLForKey:@"simulate_bundle_subscription_is_amplify_user"];

      uint64_t v15 = NewsCoreUserDefaults();
      LODWORD(v7) = [v15 BOOLForKey:@"simulate_bundle_subscription_is_services_bundle"];

      uint64_t v16 = NewsCoreUserDefaults();
      int v17 = [v16 BOOLForKey:@"simulate_bundle_subscription_paid_bundle_via_offer_activated"];

      uint64_t v18 = @"servicesBundlePurchaseID";
      if (!v7) {
        uint64_t v18 = 0;
      }
      uint64_t v19 = v18;
      v20 = 0;
      if (v17)
      {
        v21 = [*(id *)(a1 + 32) paidBundleViaOfferConfig];
        v22 = [v21 vendorAdHocOfferIds];
        v20 = [v22 firstObject];
      }
      switch(v10)
      {
        case 3:
          v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BundleEntitlementsProviderErrorDomain" code:5002 userInfo:0];
          uint64_t v25 = *(void *)(a1 + 40);
          if (v25)
          {
            id v26 = *(void (**)(void))(v25 + 16);
LABEL_16:
            v26();
          }
LABEL_17:

LABEL_25:
          goto LABEL_29;
        case 2:
          v23 = [[FCBundleEntitlementsProviderResult alloc] initWithBundlePurchaseID:v8 inTrialPeriod:1 isPurchaser:v12 ^ 1u servicesBundlePurchaseID:v19 isAmplifyUser:v14 initialPurchaseTimestamp:0 vendorAdHocOfferID:v20];
LABEL_14:
          v24 = v23;
          uint64_t v27 = *(void *)(a1 + 40);
          if (v27)
          {
            id v26 = *(void (**)(void))(v27 + 16);
            goto LABEL_16;
          }
          goto LABEL_17;
        case 1:
          v23 = [[FCBundleEntitlementsProviderResult alloc] initWithBundlePurchaseID:v8 inTrialPeriod:0 isPurchaser:v12 ^ 1u servicesBundlePurchaseID:v19 isAmplifyUser:v14 initialPurchaseTimestamp:0 vendorAdHocOfferID:v20];
          goto LABEL_14;
      }
    }
  }
  if (NFStoreDemoMode())
  {
    v28 = [*(id *)(a1 + 32) paidBundleConfig];
    uint64_t v29 = [v28 offeredBundlePurchaseIDs];
    id v8 = [v29 firstObject];

    __int16 v30 = FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v8;
      _os_log_impl(&dword_1A460D000, v30, OS_LOG_TYPE_DEFAULT, "Temporary access activated with purchaseID:%@", buf, 0xCu);
    }
    if (v8)
    {
      uint64_t v19 = [[FCBundleEntitlementsProviderResult alloc] initWithBundlePurchaseID:v8 inTrialPeriod:0 isPurchaser:1 servicesBundlePurchaseID:0 isAmplifyUser:0 initialPurchaseTimestamp:0 vendorAdHocOfferID:0];
      uint64_t v31 = *(void *)(a1 + 40);
      if (v31) {
        (*(void (**)(uint64_t, FCBundleEntitlementsProviderResult *, void))(v31 + 16))(v31, v19, 0);
      }
      goto LABEL_25;
    }
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    __int16 v32 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke_6;
    block[3] = &unk_1E5B58110;
    block[4] = v3;
    char v36 = *(unsigned char *)(a1 + 48);
    id v34 = *(id *)(a1 + 32);
    id v35 = *(id *)(a1 + 40);
    dispatch_async(v32, block);
  }
  else
  {
    [v3 _fetchEntitlementsWithIgnoreCache:*(unsigned __int8 *)(a1 + 48) configuration:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
LABEL_29:
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
}

uint64_t __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchEntitlementsWithIgnoreCache:*(unsigned __int8 *)(a1 + 56) configuration:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

FCSubscriptionEntitlement *__91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[FCSubscriptionEntitlement alloc] initWithASDEntitlement:v2];

  return v3;
}

void __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__52;
  v55 = __Block_byref_object_dispose__52;
  id v56 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__52;
  v49 = __Block_byref_object_dispose__52;
  id v50 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = __Block_byref_object_copy__52;
  uint64_t v31 = __Block_byref_object_dispose__52;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__52;
  uint64_t v25 = __Block_byref_object_dispose__52;
  id v26 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke_13;
  int v12 = &unk_1E5B58188;
  v4 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = &v51;
  uint64_t v15 = &v45;
  uint64_t v16 = &v41;
  int v17 = &v37;
  uint64_t v18 = &v33;
  uint64_t v19 = &v27;
  v20 = &v21;
  [v4 enumerateObjectsUsingBlock:&v9];
  if (v52[5])
  {
    int v5 = [FCBundleEntitlementsProviderResult alloc];
    id v6 = -[FCBundleEntitlementsProviderResult initWithBundlePurchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:vendorAdHocOfferID:](v5, "initWithBundlePurchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:vendorAdHocOfferID:", v52[5], *((unsigned __int8 *)v42 + 24), *((unsigned __int8 *)v38 + 24), v46[5], *((unsigned __int8 *)v34 + 24), v22[5], v28[5], v9, v10, v11, v12);
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, FCBundleEntitlementsProviderResult *, void))(v7 + 16))(v7, v6, 0);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BundleEntitlementsProviderErrorDomain" code:5002 userInfo:0];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void, FCBundleEntitlementsProviderResult *))(v8 + 16))(v8, 0, v6);
    }
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
}

void __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke_13(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v26 = a2;
  id v6 = [*(id *)(a1 + 32) paidBundleConfig];
  uint64_t v7 = [v6 restorableBundlePurchaseIDs];
  uint64_t v8 = [v26 inAppAdamID];
  uint64_t v9 = [v8 stringValue];
  int v10 = [v7 containsObject:v9];

  if (v10)
  {
    id v11 = [v26 inAppAdamID];
    int v12 = [v11 stringValue];
    uint64_t v13 = [v12 copy];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = [v26 servicesBundleAdamID];
    uint64_t v17 = [v16 copy];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v26 isTrialPeriod];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v26 isPurchaser];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v26 isAmplifyUser];
    uint64_t v20 = [v26 vendorAdHocOfferID];
    uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    uint64_t v23 = [v26 initialPurchaseTimestamp];
    uint64_t v24 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    *a4 = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementService, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->entitlementsOverrideProvider, 0);
}

@end