@interface WLKOnboarding
+ (BOOL)isOptedIn;
+ (void)optInUserIfNeeded:(id)a3;
+ (void)optInUserIfNeededAndRefreshConfig:(id)a3;
@end

@implementation WLKOnboarding

+ (BOOL)isOptedIn
{
  v2 = +[WLKSettingsStore sharedSettings];
  char v3 = [v2 optedIn];

  return v3;
}

+ (void)optInUserIfNeeded:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__WLKOnboarding_optInUserIfNeeded___block_invoke;
  v5[3] = &unk_1E620A368;
  id v6 = v3;
  id v4 = v3;
  +[WLKSettingsCloudUtilities synchronizeSettingsFromCloudIfNeededWithCompletion:v5];
}

void __35__WLKOnboarding_optInUserIfNeeded___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = +[WLKSettingsStore sharedSettings];
  v7 = v6;
  if ((a2 & 1) == 0)
  {
    v9 = WLKSystemLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKOnboarding - failed to sync settings from cloud", buf, 2u);
    }
    goto LABEL_8;
  }
  char v8 = [v6 optedIn];
  v9 = WLKSystemLogObject();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKOnboarding - Account already opted in.", buf, 2u);
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_12;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKOnboarding - Opting user in.", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__WLKOnboarding_optInUserIfNeeded___block_invoke_2;
  v11[3] = &unk_1E620B648;
  id v13 = *(id *)(a1 + 32);
  id v12 = v7;
  +[WLKSettingsCloudUtilities updateCloudStoreAccountLevelSetting:@"isOptedIn" value:MEMORY[0x1E4F1CC38] completion:v11];

LABEL_12:
}

void __35__WLKOnboarding_optInUserIfNeeded___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = WLKSystemLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"NO";
    if (a2) {
      v7 = @"YES";
    }
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKOnboarding - Finance update success: %@", (uint8_t *)&v8, 0xCu);
  }

  if (a2) {
    [*(id *)(a1 + 32) setOptedIn:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)optInUserIfNeededAndRefreshConfig:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__WLKOnboarding_optInUserIfNeededAndRefreshConfig___block_invoke;
  v6[3] = &unk_1E620A368;
  id v7 = v4;
  id v5 = v4;
  [a1 optInUserIfNeeded:v6];
}

void __51__WLKOnboarding_optInUserIfNeededAndRefreshConfig___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = +[WLKConfigurationManager sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__WLKOnboarding_optInUserIfNeededAndRefreshConfig___block_invoke_2;
    v8[3] = &unk_1E620A218;
    id v9 = *(id *)(a1 + 32);
    [v6 fetchConfigurationWithOptions:0 cachePolicy:3 queryParameters:0 completion:v8];
  }
  else
  {
    id v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKOnboarding - Failed to opt in: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __51__WLKOnboarding_optInUserIfNeededAndRefreshConfig___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = WLKSystemLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      int v8 = "WLKOnboarding - Successfully refreshed config";
      id v9 = v6;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    int v11 = 138412290;
    id v12 = v5;
    int v8 = "WLKOnboarding - Error refreshing config; continuing %@";
    id v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1);
}

@end