id NSSNTPBAnalyticsOsVersionValue()
{
  void *v0;
  void *v1;
  uint64_t vars8;

  v0 = [MEMORY[0x1E4F42948] currentDevice];
  v1 = [v0 systemVersion];

  return v1;
}

void NSSDestroyUserDefaultsDataWithItems(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    NSSDestroyUserDefaultsDataWithItems_cold_1();
  }
  [v1 enumerateObjectsUsingBlock:&__block_literal_global];
}

void __NSSDestroyUserDefaultsDataWithItems_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [v2 stickyKeys];
  v4 = [v2 userDefaults];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v4 objectForKey:v11];
        objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v12, v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v13 = [v2 domainName];
  [v4 removePersistentDomainForName:v13];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __NSSDestroyUserDefaultsDataWithItems_block_invoke_2;
  v15[3] = &unk_1E6D3F698;
  id v16 = v4;
  id v14 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];
  [v14 synchronize];
}

uint64_t __NSSDestroyUserDefaultsDataWithItems_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

id NSSDestroyDataContainersWithItems(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    NSSDestroyDataContainersWithItems_cold_1();
  }
  id v2 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [v8 identifier];
        [v8 containerClass];
        container_create_or_lookup_for_current_user();
        v10 = [NSNumber numberWithBool:container_delete_all_container_content() == 1];
        uint64_t v11 = [NSString stringWithUTF8String:v9];
        [v2 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void sub_1E010784C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

id NSSNewsWidgetMessageForStaticNewsSection()
{
  v0 = NSSBundleInternal();
  id v1 = [v0 localizedStringForKey:@"Editors’ Picks" value:&stru_1F3B518D0 table:0];

  return v1;
}

id NSSNewsWidgetMessageForStaticNewsHeadlineTitle()
{
  v0 = NSSBundleInternal();
  id v1 = [v0 localizedStringForKey:@"New Planets Found" value:&stru_1F3B518D0 table:0];

  return v1;
}

id NSSNewsTagWidgetPlaceholderName()
{
  v0 = NSSBundleInternal();
  id v1 = [v0 localizedStringForKey:@"Topic" value:&stru_1F3B518D0 table:0];

  return v1;
}

id NSSNewsWidgetIntentsTopHitHeaderName()
{
  v0 = NSSBundleInternal();
  id v1 = [v0 localizedStringForKey:@"Top Hit" value:&stru_1F3B518D0 table:0];

  return v1;
}

id NSSNewsWidgetIntentsTopicsHeaderName()
{
  v0 = NSSBundleInternal();
  id v1 = [v0 localizedStringForKey:@"Topics" value:&stru_1F3B518D0 table:0];

  return v1;
}

id NSSNewsWidgetIntentsFollowingHeaderName()
{
  v0 = NSSBundleInternal();
  id v1 = [v0 localizedStringForKey:@"Following" value:&stru_1F3B518D0 table:0];

  return v1;
}

id NSSNewsWidgetIntentsSuggestedByNewsHeaderName()
{
  v0 = NSSBundleInternal();
  id v1 = [v0 localizedStringForKey:@"Suggested" value:&stru_1F3B518D0 table:0];

  return v1;
}

id NSSNewsWidgetIntentsSuggestedBySiriHeaderName()
{
  v0 = NSSBundleInternal();
  id v1 = [v0 localizedStringForKey:@"Suggested by Siri" value:&stru_1F3B518D0 table:0];

  return v1;
}

id NSSNewsAnalyticsPBEventAccumulatorLog()
{
  if (NSSNewsAnalyticsPBEventAccumulatorLog_once != -1) {
    dispatch_once(&NSSNewsAnalyticsPBEventAccumulatorLog_once, &__block_literal_global_0);
  }
  v0 = NSSNewsAnalyticsPBEventAccumulatorLog_result;
  return v0;
}

uint64_t __NSSNewsAnalyticsPBEventAccumulatorLog_block_invoke()
{
  NSSNewsAnalyticsPBEventAccumulatorLog_result = (uint64_t)os_log_create("com.apple.news", "Analytics");
  return MEMORY[0x1F41817F8]();
}

id NSSNTPBAnalyticsUUIDData()
{
  v0 = [MEMORY[0x1E4F29128] UUID];
  id v1 = [v0 UUIDString];
  id v2 = FCUUIDStringToUUIDBytes();

  return v2;
}

id NSSNTPBAnalyticsAppBuildNumberValue()
{
  v0 = NewsCoreUserDefaults();
  id v1 = [v0 objectForKey:*MEMORY[0x1E4F7DDE0]];

  if ([v1 length])
  {
    id v2 = [@"999" stringByAppendingString:v1];
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v3 objectForInfoDictionaryKey:@"CFBundleVersion"];
    id v2 = [v4 stringValue];
  }
  return v2;
}

id NSSNTPBAnalyticsAppVersionValue()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  return v1;
}

uint64_t NSSNTPBAnalyticsContentEnvironmentValue()
{
  unint64_t EndpointEnvironment = FCDefaultsReadEndpointEnvironment();
  if (EndpointEnvironment > 9) {
    return 1;
  }
  else {
    return dword_1E0110710[EndpointEnvironment];
  }
}

uint64_t NSSNTPBAnalyticsCellularRadioAccessTechnologyValue()
{
  v0 = [MEMORY[0x1E4F7E5A8] sharedNetworkReachability];
  uint64_t v1 = [v0 cellularRadioAccessTechnology];

  return v1;
}

id NSSNTPBAnalyticsCountryCodeValue()
{
  v0 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v1 = [v0 objectForKey:*MEMORY[0x1E4F1C400]];

  return v1;
}

id NSSNTPBAnalyticsDevicePlatformValue()
{
  v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = [v0 systemName];

  return v1;
}

id NSSNTPBAnalyticsLanguageCodeValue()
{
  v0 = [MEMORY[0x1E4F7E218] sharedAccount];
  uint64_t v1 = [v0 primaryLanguageCode];

  return v1;
}

uint64_t NSSNTPBAnalyticsOsInstallVariantValue()
{
  if (NFInternalBuild()) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t NSSNTPBAnalyticsReachabilityStatusValue()
{
  v0 = [MEMORY[0x1E4F7E5A8] sharedNetworkReachability];
  uint64_t v1 = [v0 reachabilityStatus];

  return v1;
}

uint64_t NSSNTPBAnalyticsUtcOffsetValue()
{
  v0 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v1 = [v0 secondsFromGMT];

  return v1;
}

uint64_t NSSNTPBAnalyticsPrivateDataSyncOnValue()
{
  v0 = [MEMORY[0x1E4F7E218] sharedAccount];
  uint64_t v1 = [v0 isPrivateDataSyncingEnabled];

  return v1;
}

uint64_t NSSNTPBAnalyticsSignedIntoIcloudValue()
{
  v0 = [MEMORY[0x1E4F7E218] sharedAccount];
  uint64_t v1 = [v0 isUserSignedInToiCloud];

  return v1;
}

id NSSNTPBAnalyticsUserStorefrontIdValue()
{
  v0 = [MEMORY[0x1E4F7E218] sharedAccount];
  uint64_t v1 = [v0 contentStoreFrontID];

  return v1;
}

id NSSBundleInternal()
{
  if (NSSBundleInternal_onceToken != -1) {
    dispatch_once(&NSSBundleInternal_onceToken, &__block_literal_global_1);
  }
  v0 = NSSBundleInternal_sNSSBundle;
  return v0;
}

uint64_t __NSSBundleInternal_block_invoke()
{
  NSSBundleInternal_sNSSBundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

void NSSTerminateNewsWithCompletion(void *a1)
{
  id v2 = a1;
  SFKillProcessNamed();
  SFKillProcessNamed();
  uint64_t v1 = v2;
  if (v2)
  {
    (*((void (**)(id, uint64_t, void *))v2 + 2))(v2, 1, &__block_literal_global_2);
    uint64_t v1 = v2;
  }
}

uint64_t __NSSTerminateNewsWithCompletion_block_invoke()
{
  SFKillProcessNamed();
  return SFKillProcessNamed();
}

void NSSTerminateAppsAndAllPluginsWithBundleIDs(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    NSSTerminateAppsAndAllPluginsWithBundleIDs_cold_1();
  }
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke;
  v14[3] = &unk_1E6D3FA00;
  id v7 = v5;
  id v15 = v7;
  id v8 = v6;
  id v16 = v8;
  [v3 enumerateObjectsUsingBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke_3;
  v12[3] = &unk_1E6D3FA28;
  id v13 = v8;
  id v9 = v8;
  uint64_t v10 = MEMORY[0x1E01F0A60](v12);
  uint64_t v11 = (void *)v10;
  if (v4) {
    v4[2](v4, v7, v10);
  }
  else {
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
}

void __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F4E290]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke_2;
  uint64_t v10 = &unk_1E6D3F9D8;
  id v11 = *(id *)(a1 + 32);
  id v12 = v3;
  id v5 = v3;
  uint64_t v6 = (void *)[v4 initWithBundleIdentifier:v5 efficacy:3 name:@"com.apple.newsservices.termination" withHandler:&v7];
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6, v7, v8, v9, v10);
}

void __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
}

uint64_t __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeObjectsPerformSelector:sel_invalidate];
}

void NSSTerminateNewsd(void *a1)
{
  uint64_t v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    NSSTerminateNewsd_cold_1();
  }
  SFKillProcessNamed();
  v1[2](v1, 1, &__block_literal_global_48);
}

uint64_t __NSSTerminateNewsd_block_invoke()
{
  return SFKillProcessNamed();
}

void NSSTerminateNewsProcessesWithItems(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    NSSTerminateNewsProcessesWithItems_cold_1();
  }
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  id v5 = objc_msgSend(v3, "fc_dictionaryOfSortedObjectsWithKeyBlock:", &__block_literal_global_52);
  uint64_t v6 = [v5 objectForKeyedSubscript:&unk_1F3B54438];
  uint64_t v7 = objc_msgSend(v6, "fc_setByTransformingWithBlock:", &__block_literal_global_56);

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = &__block_literal_global_59;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __NSSTerminateNewsProcessesWithItems_block_invoke_2;
  v11[3] = &unk_1E6D3FA70;
  v11[4] = &v12;
  v11[5] = &v18;
  NSSTerminateAppsAndAllPluginsWithBundleIDs(v7, v11);
  uint64_t v8 = [v5 objectForKeyedSubscript:&unk_1F3B54450];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __NSSTerminateNewsProcessesWithItems_block_invoke_63;
    v10[3] = &unk_1E6D3FA98;
    v10[4] = &v12;
    v10[5] = &v18;
    NSSTerminateNewsd(v10);
  }
  if (v4) {
    v4[2](v4, *((unsigned __int8 *)v19 + 24), v13[5]);
  }
  else {
    (*(void (**)(void))(v13[5] + 16))();
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

void sub_1E010C400(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __NSSTerminateNewsProcessesWithItems_block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 processType];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __NSSTerminateNewsProcessesWithItems_block_invoke_54(uint64_t a1, void *a2)
{
  return [a2 bundleID];
}

uint64_t __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1E01F0A60](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __NSSTerminateNewsProcessesWithItems_block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = FCBlockConjunction();
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    uint64_t v7 = [v8 allValues];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 containsObject:MEMORY[0x1E4F1CC28]] ^ 1;
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 0;
  }
}

void __NSSTerminateNewsProcessesWithItems_block_invoke_63(uint64_t a1, char a2)
{
  uint64_t v4 = FCBlockConjunction();
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = a2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
}

void sub_1E010CAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E010CC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NTPBExternalAnalyticsEventTypeFromExternalEventURLQueryParameter(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"articleView"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"streamView"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"widgetView"])
  {
    uint64_t v2 = 6;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void NSSDestroyUserDefaultsDataWithItems_cold_1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);
}

void NSSDestroyDataContainersWithItems_cold_1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);
}

void NSSTerminateAppsAndAllPluginsWithBundleIDs_cold_1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleIDs", v6, 2u);
}

void NSSTerminateNewsd_cold_1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

void NSSTerminateNewsProcessesWithItems_cold_1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);
}

CFDictionaryRef CFNetworkCopySystemProxySettings(void)
{
  return (CFDictionaryRef)MEMORY[0x1F40D5368]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t FCBlockConjunction()
{
  return MEMORY[0x1F4133B68]();
}

uint64_t FCDefaultsReadEndpointEnvironment()
{
  return MEMORY[0x1F4133BA8]();
}

uint64_t FCUUIDStringToUUIDBytes()
{
  return MEMORY[0x1F4133CB8]();
}

uint64_t NFDevicePlatform()
{
  return MEMORY[0x1F41389B0]();
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x1F41389C0]();
}

uint64_t NewsCoreUserDefaults()
{
  return MEMORY[0x1F4133CD8]();
}

uint64_t SFKillProcessNamed()
{
  return MEMORY[0x1F414B020]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t container_create_or_lookup_for_current_user()
{
  return MEMORY[0x1F40CB578]();
}

uint64_t container_delete_all_container_content()
{
  return MEMORY[0x1F40CB5B0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}