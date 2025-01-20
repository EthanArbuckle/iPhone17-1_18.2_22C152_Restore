@interface VSMultiAppInstallUtility
+ (id)getDecidedNonChannelAppsForProvider:(id)a3 account:(id)a4 device:(id)a5;
+ (void)determineMultiAppEnabledForProvider:(id)a3 completion:(id)a4;
+ (void)determineMultiAppEnabledForProvider:(id)a3 withAccount:(id)a4 completion:(id)a5;
+ (void)determineMultiAppEnabledForProvider:(id)a3 withAccount:(id)a4 withBagLoadOperation:(id)a5 completion:(id)a6;
+ (void)filterBundleIDsByPendingConsent:(id)a3 completionHandler:(id)a4;
+ (void)getPendingConsentBundleIDsFromSelectedAppDescriptions:(id)a3 completionHandler:(id)a4;
+ (void)isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabledWithBagLoadOperation:(id)a3 completion:(id)a4;
@end

@implementation VSMultiAppInstallUtility

+ (void)determineMultiAppEnabledForProvider:(id)a3 completion:(id)a4
{
  v5 = (void *)MEMORY[0x263F1E150];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedInstance];
  +[VSMultiAppInstallUtility determineMultiAppEnabledForProvider:v7 withAccount:v8 completion:v6];
}

+ (void)determineMultiAppEnabledForProvider:(id)a3 withAccount:(id)a4 completion:(id)a5
{
}

+ (void)determineMultiAppEnabledForProvider:(id)a3 withAccount:(id)a4 withBagLoadOperation:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void))a6;
  char v13 = [v9 shouldShowChannelApps];
  char v14 = [v9 shouldShowSubscriptionApps];
  if ((v13 & 1) == 0 && (v14 & 1) == 0)
  {
    v15 = VSDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Provider is not configured to show Channel or Subscription apps. MAI disabled.";
LABEL_16:
      _os_log_impl(&dword_23F9AB000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v17 = [v9 allPersonalizedAppDescriptions];
  uint64_t v18 = [v17 count];

  if (!v18)
  {
    v15 = VSDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Provider does not actually have any Personalized apps. MAI disabled.";
      goto LABEL_16;
    }
LABEL_17:

    v12[2](v12, 0);
    goto LABEL_18;
  }
  char v19 = [v10 hasAccount];
  uint64_t v20 = [v10 freeAppPasswordPromptSetting];
  if ((v19 & 1) == 0)
  {
    v15 = VSDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "User does not have an active iTunes Account. MAI disabled.";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if ((v20 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v21 = VSDefaultLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v21, OS_LOG_TYPE_DEFAULT, "User has selected Never or Require After 15Min. No need to Check for Skip Bag Key. MAI is enabled.", buf, 2u);
    }

    v12[2](v12, 1);
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __108__VSMultiAppInstallUtility_determineMultiAppEnabledForProvider_withAccount_withBagLoadOperation_completion___block_invoke;
    v22[3] = &unk_2650772E8;
    BOOL v24 = (v20 & 0xFFFFFFFFFFFFFFFELL) == 2;
    v23 = v12;
    +[VSMultiAppInstallUtility isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabledWithBagLoadOperation:v11 completion:v22];
  }
LABEL_18:
}

void __108__VSMultiAppInstallUtility_determineMultiAppEnabledForProvider_withAccount_withBagLoadOperation_completion___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  VSPerformBlockOnMainThread();
}

uint64_t __108__VSMultiAppInstallUtility_determineMultiAppEnabledForProvider_withAccount_withBagLoadOperation_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41))
  {
    v2 = VSDefaultLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23F9AB000, v2, OS_LOG_TYPE_DEFAULT, "MAI is enabled.", v6, 2u);
    }

    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Skipping MAI on AlwaysRequirePassword Option is Enabled and User has selected AlwaysRequirePassword. MAI disabled.", buf, 2u);
    }

    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  return v3();
}

+ (void)isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabledWithBagLoadOperation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F1E158]);
  [v7 setBagKey:*MEMORY[0x263F1E328]];
  objc_initWeak(&location, v7);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __116__VSMultiAppInstallUtility_isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabledWithBagLoadOperation_completion___block_invoke;
  v9[3] = &unk_265077310;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v7 setCompletionBlock:v9];
  VSEnqueueCompletionOperation();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __116__VSMultiAppInstallUtility_isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabledWithBagLoadOperation_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained value];
  if (objc_opt_respondsToSelector())
  {
    int v4 = [v3 BOOLValue];
    id v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabled: %d", (uint8_t *)v6, 8u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)getPendingConsentBundleIDsFromSelectedAppDescriptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "bundleID", (void)v15);
        if (v14) {
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [a1 filterBundleIDsByPendingConsent:v8 completionHandler:v7];
}

+ (id)getDecidedNonChannelAppsForProvider:(id)a3 account:(id)a4 device:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v7 nonChannelAppDescriptions];

  if (!v10) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [provider nonChannelAppDescriptions] parameter must not be nil."];
  }
  uint64_t v11 = [v7 nonChannelAppDescriptions];
  uint64_t v12 = [v9 preferredAppID];

  uint64_t v13 = objc_alloc_init(VSNonChannelAppDecider);
  [(VSNonChannelAppDecider *)v13 setAppDescriptions:v11];
  [(VSNonChannelAppDecider *)v13 setPreferredAppBundleOrAdamID:v12];
  char v14 = [v8 stringForAMSDeviceFamilies];

  [(VSNonChannelAppDecider *)v13 setPreferredDeviceFamily:v14];
  long long v15 = [(VSNonChannelAppDecider *)v13 decidedNonChannelApps];

  return v15;
}

+ (void)filterBundleIDsByPendingConsent:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = (void *)MEMORY[0x263F84770];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__VSMultiAppInstallUtility_filterBundleIDsByPendingConsent_completionHandler___block_invoke;
  v12[3] = &unk_265077338;
  id v13 = v5;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v5;
  [v8 resolveBundleIDs:v11 completionHandler:v12];
}

void __78__VSMultiAppInstallUtility_filterBundleIDsByPendingConsent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__VSMultiAppInstallUtility_filterBundleIDsByPendingConsent_completionHandler___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  if (v5)
  {
    id v8 = v5;
    id v9 = VSDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_23F9AB000, v9, OS_LOG_TYPE_DEFAULT, "Received final bundle IDs: %@", (uint8_t *)&v12, 0xCu);
    }

    id v10 = (void *)[*(id *)(a1 + 32) mutableCopy];
    [v10 removeObjectsInArray:v8];
    id v11 = VSDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v10;
      _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "Omitted bundle IDs: %@", (uint8_t *)&v12, 0xCu);
    }

    [*(id *)(a1 + 40) addObjectsFromArray:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __78__VSMultiAppInstallUtility_filterBundleIDsByPendingConsent_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "Error filtering out consented candidateBundleIDs %@: %@", (uint8_t *)&v4, 0x16u);
}

@end