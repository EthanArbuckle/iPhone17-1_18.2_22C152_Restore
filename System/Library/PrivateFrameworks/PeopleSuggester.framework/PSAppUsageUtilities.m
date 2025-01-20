@interface PSAppUsageUtilities
@end

@implementation PSAppUsageUtilities

uint64_t __74___PSAppUsageUtilities_mostUsedAppBundleIdsUsingPredicate_knowledgeStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __74___PSAppUsageUtilities_mostUsedAppBundleIdsUsingPredicate_knowledgeStore___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __123___PSAppUsageUtilities_shareExtensionsUsedAndInstalledDaysAgo_appBundleIdsToShareExtensionBundleIdsMapping_knowledgeStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __123___PSAppUsageUtilities_shareExtensionsUsedAndInstalledDaysAgo_appBundleIdsToShareExtensionBundleIdsMapping_knowledgeStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __123___PSAppUsageUtilities_shareExtensionsUsedAndInstalledDaysAgo_appBundleIdsToShareExtensionBundleIdsMapping_knowledgeStore___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __163___PSAppUsageUtilities_mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping_sourceBundleId_sharesFromSourceToTargetBundle_appUsageDurations___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __163___PSAppUsageUtilities_mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping_sourceBundleId_sharesFromSourceToTargetBundle_appUsageDurations___block_invoke_51(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __98___PSAppUsageUtilities_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_knowledgeStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __47___PSAppUsageUtilities_cacheAppUsageDurations___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state])
  {
    v3 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_cold_1(v2);
    }
  }
}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_78(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3 && ([v3 eventBody], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = [*(id *)(a1 + 40) addBiomeDataToCache:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) event:v4];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    v9 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_78_cold_1(v4);
    }
  }
}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_85()
{
  v0 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A314B000, v0, OS_LOG_TYPE_INFO, "Event donation from Sharesheet.Feedback biome stream was cancelled", v1, 2u);
  }
}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_88(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F5B6A8] userContext];
  v5 = [MEMORY[0x1E4F5B6E0] keyPathWithKey:@"/appShares/value"];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    if (v3 && ([v3 eventBody], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      uint64_t v9 = [*(id *)(a1 + 32) addBiomeDataToCache:v7 event:v3];

      [v4 setObject:v9 forKeyedSubscript:v5];
      uint64_t v7 = (void *)v9;
    }
    else
    {
      v10 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_78_cold_1(v3);
      }
    }
  }
}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_1A314B000, v2, v3, "Error: Feedback Biome stream read did not complete successfully: %@", v4, v5, v6, v7, v8);
}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_78_cold_1(void *a1)
{
  v1 = [a1 eventBody];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_1A314B000, v2, v3, "Event donation from Sharesheet.Feedback biome stream was empty for event: %{private}@", v4, v5, v6, v7, v8);
}

@end