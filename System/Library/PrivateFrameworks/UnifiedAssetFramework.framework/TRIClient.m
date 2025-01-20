@interface TRIClient
@end

@implementation TRIClient

void __90__TRIClient_UAFTrialClient___cachedLevelForFactorAnyLanguage_withNamespaceName_withCache___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if ([v7 hasPrefix:*(void *)(a1 + 32)])
  {
    v9 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 136315650;
      v12 = "+[TRIClient(UAFTrialClient) _cachedLevelForFactorAnyLanguage:withNamespaceName:withCache:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_debug_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEBUG, "%s No level found for %@(nil), but found %@", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

@end