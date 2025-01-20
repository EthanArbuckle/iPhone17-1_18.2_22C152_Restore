@interface WBSBrowsingAssistantContentProvider
+ (BOOL)assistantEnabledForCurrentDevice;
+ (BOOL)assistantEnabledForLocale:(id)a3;
+ (PARSession)sharedPARSession;
+ (id)_assetManagerForCurrentSystemLocale;
+ (id)_sharedSessionConfiguration;
+ (id)filteredStringForURL:(id)a3 needsVariants:(BOOL *)a4;
+ (void)clearAssistantAssetCache;
+ (void)subscribeToAssistantAssetAndDownloadNow:(BOOL)a3;
+ (void)unsubscribeFromAssistantAsset;
- (void)checkContentAvailabilityForURL:(id)a3 locale:(id)a4 webpageIdentifier:(id)a5 completion:(id)a6;
- (void)fetchContentForURL:(id)a3 completion:(id)a4;
@end

@implementation WBSBrowsingAssistantContentProvider

+ (id)_sharedSessionConfiguration
{
  if (_sharedSessionConfiguration_onceToken != -1) {
    dispatch_once(&_sharedSessionConfiguration_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_sharedSessionConfiguration_configuration;
  return v2;
}

void __66__WBSBrowsingAssistantContentProvider__sharedSessionConfiguration__block_invoke()
{
  objc_msgSend(NSString, "stringWithFormat:", @"Safari/%s", "8620.1.16.10.11");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F5CBE0]) initWithId:@"Safari" userAgent:v2];
  v1 = (void *)_sharedSessionConfiguration_configuration;
  _sharedSessionConfiguration_configuration = v0;
}

+ (PARSession)sharedPARSession
{
  id v2 = [a1 _sharedSessionConfiguration];
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    id v3 = [MEMORY[0x1E4F5CBD8] sharedPARSessionWithConfiguration:v2];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__WBSBrowsingAssistantContentProvider_sharedPARSession__block_invoke;
    block[3] = &unk_1E5C8C880;
    id v6 = v2;
    if (sharedPARSession_onceToken != -1) {
      dispatch_once(&sharedPARSession_onceToken, block);
    }
    id v3 = (id)sharedPARSession_sharedSession;
  }
  return (PARSession *)v3;
}

void __55__WBSBrowsingAssistantContentProvider_sharedPARSession__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F5CBD8] sessionWithConfiguration:*(void *)(a1 + 32)];
  id v2 = (void *)sharedPARSession_sharedSession;
  sharedPARSession_sharedSession = v1;
}

+ (BOOL)assistantEnabledForCurrentDevice
{
  id v2 = [(id)objc_opt_class() sharedPARSession];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v2 safariAssistantEnabledStatus] != 1)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    BOOL v3 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Assitant is not support for this device.", v6, 2u);
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

+ (BOOL)assistantEnabledForLocale:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [(id)objc_opt_class() sharedPARSession];
  uint64_t v5 = [v4 safariAssistantEnabledStatusForPageLanguage:v3];
  if (v5 != 1)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138739971;
      id v9 = v3;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Assitant is not eligible for page language: %{sensitive}@", (uint8_t *)&v8, 0xCu);
    }
  }

  return v5 == 1;
}

+ (id)filteredStringForURL:(id)a3 needsVariants:(BOOL *)a4
{
  id v6 = [a3 absoluteString];
  v7 = [a1 _assetManagerForCurrentSystemLocale];
  if (v7)
  {
    int v8 = [a1 sharedPARSession];
    id v9 = [v8 bag];

    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = [v9 safariAssistantHashPrefixLength];
    }
    else {
      uint64_t v10 = 21;
    }
    if (objc_opt_respondsToSelector())
    {
      v12 = [v7 prefilterSafariSummarizationPrefetchRequestModelWithUrlString:v6 prefetchHashPrefixLength:v10];
      if (([v12 hasMatchedPattern] & 1) == 0) {
        *a4 = 1;
      }
      id v11 = [v12 prefilterUrl];
    }
    else
    {
      id v11 = v6;
    }
  }
  else
  {
    id v11 = v6;
  }

  return v11;
}

+ (id)_assetManagerForCurrentSystemLocale
{
  getSAAssetManagerFactoryClass();
  if (objc_opt_respondsToSelector())
  {
    if (!_assetManagerForCurrentSystemLocale__localeToAssetManagerMap)
    {
      uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
      id v3 = (void *)_assetManagerForCurrentSystemLocale__localeToAssetManagerMap;
      _assetManagerForCurrentSystemLocale__localeToAssetManagerMap = v2;
    }
    v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v5 = [v4 localeIdentifier];

    id v6 = [(id)_assetManagerForCurrentSystemLocale__localeToAssetManagerMap objectForKeyedSubscript:v5];
    if (!v6)
    {
      id v6 = [getSAAssetManagerFactoryClass() safariAssistantAssetManagerWithLocale:v5];
      [(id)_assetManagerForCurrentSystemLocale__localeToAssetManagerMap setObject:v6 forKeyedSubscript:v5];
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (void)subscribeToAssistantAssetAndDownloadNow:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = [a1 _assetManagerForCurrentSystemLocale];
  uint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v6 = [v5 localeIdentifier];

  if (v4)
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __79__WBSBrowsingAssistantContentProvider_subscribeToAssistantAssetAndDownloadNow___block_invoke;
      v8[3] = &unk_1E5C8CB60;
      id v9 = v6;
      BOOL v11 = a3;
      id v10 = v4;
      [v10 subscribeToAndPreloadSafariSummarizationAssetsForLocale:v9 completionHandler:v8];
    }
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      v13 = v6;
      _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_DEFAULT, "Safari failed to subscribe to UAF asset download for locale: %{sensitive}@", buf, 0xCu);
    }
  }
}

void __79__WBSBrowsingAssistantContentProvider_subscribeToAssistantAssetAndDownloadNow___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138739971;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, "Safari finishes subscribing to assistant assets: %{sensitive}@", buf, 0xCu);
  }
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79__WBSBrowsingAssistantContentProvider_subscribeToAssistantAssetAndDownloadNow___block_invoke_22;
    v6[3] = &unk_1E5C8C880;
    id v7 = v4;
    [v5 ensureSafariSummarizationAssetsDownloadedForLocale:v7 completionHandler:v6];
  }
}

void __79__WBSBrowsingAssistantContentProvider_subscribeToAssistantAssetAndDownloadNow___block_invoke_22(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138739971;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, "Safari finishes downloading assistant assets: %{sensitive}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (void)clearAssistantAssetCache
{
  uint64_t v2 = [a1 _assetManagerForCurrentSystemLocale];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v5 = (void *)v2;
    char v4 = objc_opt_respondsToSelector();
    uint64_t v3 = v5;
    if (v4)
    {
      [v5 resetSafariSummarizationAssets];
      uint64_t v3 = v5;
    }
  }
}

+ (void)unsubscribeFromAssistantAsset
{
  id v2 = [a1 _assetManagerForCurrentSystemLocale];
  [v2 unsubscribeFromSafariSummarizationAssetsWithCompletionHandler:&__block_literal_global_26];
}

void __68__WBSBrowsingAssistantContentProvider_unsubscribeFromAssistantAsset__block_invoke()
{
  uint64_t v0 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEFAULT, "Safari finishes unsubscribing assistant assets", v1, 2u);
  }
}

- (void)checkContentAvailabilityForURL:(id)a3 locale:(id)a4 webpageIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  char v32 = 0;
  BOOL v11 = [(id)objc_opt_class() filteredStringForURL:v8 needsVariants:&v32];
  if (v11)
  {
    v12 = +[WBSBiomeDonationManager sharedManager];
    [v12 donateBrowsingAssistantBloomFilterPassedEventWithWebPageID:v9];

    v13 = (void *)MEMORY[0x1E4F5CBB0];
    uint64_t v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    v15 = [v14 localeIdentifier];
    v16 = [v13 prefetchRequestForUrl:v11 locale:v15];

    if (!v32) {
      goto LABEL_7;
    }
    if (objc_opt_respondsToSelector())
    {
      v17 = +[WBSBrowsingAssistantURLVariants variantsForURL:v8];
      v18 = [v17 variants];
      [v16 setUrlVariants:v18];
    }
    if (v32)
    {
      id v19 = [v8 absoluteString];
    }
    else
    {
LABEL_7:
      id v19 = v11;
    }
    v20 = v19;
    v21 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 134217984;
      id v34 = v16;
      _os_signpost_emit_with_name_impl(&dword_1A6B5F000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HashPrefixFetching", "Request [%p]", buf, 0xCu);
    }
    v22 = [(id)objc_opt_class() sharedPARSession];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __106__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_webpageIdentifier_completion___block_invoke;
    v27[3] = &unk_1E5C8CB88;
    id v28 = v16;
    id v29 = v8;
    id v30 = v20;
    id v31 = v10;
    id v23 = v20;
    id v24 = v16;
    v25 = [v22 taskWithRequest:v24 completion:v27];

    [v25 resume];
  }
  else
  {
    v26 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138739971;
      id v34 = v8;
      _os_log_impl(&dword_1A6B5F000, v26, OS_LOG_TYPE_INFO, "Safari didn't find a match for the URL in bloom filter or pattern list. URL: %{sensitive}@", buf, 0xCu);
    }
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __106__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_webpageIdentifier_completion___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
  if (os_signpost_enabled(v7))
  {
    id v8 = @"YES";
    uint64_t v9 = a1[4];
    if (!v5) {
      id v8 = @"NO";
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v60 = v9;
    __int16 v61 = 2112;
    v62 = v8;
    _os_signpost_emit_with_name_impl(&dword_1A6B5F000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HashPrefixFetching", "Request [%p] Success=%@ enableTelemetry=YES ", buf, 0x16u);
  }
  if (v6)
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __106__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_webpageIdentifier_completion___block_invoke_cold_2((uint64_t)a1, v10, v6);
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v11 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v36 = v5;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v35 = v11;
      id obj = [v11 hashBucketDetails];
      uint64_t v39 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      uint64_t v12 = 0;
      int v13 = 0;
      if (v39)
      {
        uint64_t v38 = *(void *)v53;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v53 != v38) {
              objc_enumerationMutation(obj);
            }
            uint64_t v40 = v14;
            v15 = *(void **)(*((void *)&v52 + 1) + 8 * v14);
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            objc_msgSend(v15, "hash_details");
            id v43 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = [v43 countByEnumeratingWithState:&v48 objects:v57 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v49;
              do
              {
                uint64_t v19 = 0;
                v20 = sel_matched_url_variant;
                v21 = sel_sba_entity_types;
                uint64_t v41 = v17;
                do
                {
                  if (*(void *)v49 != v18) {
                    objc_enumerationMutation(v43);
                  }
                  v22 = *(void **)(*((void *)&v48 + 1) + 8 * v19);
                  if ((objc_opt_respondsToSelector() & 1) == 0
                    || (objc_msgSend(v22, "matched_url_variant"),
                        id v23 = objc_claimAutoreleasedReturnValue(),
                        int v24 = [v23 isEqualToString:a1[6]],
                        v23,
                        v24))
                  {
                    v12 |= objc_msgSend(v22, "has_summary");
                    v13 |= objc_msgSend(v22, "has_table_of_contents");
                    if (objc_opt_respondsToSelector())
                    {
                      v25 = v20;
                      int v26 = v13;
                      uint64_t v27 = v18;
                      id v28 = v21;
                      long long v46 = 0u;
                      long long v47 = 0u;
                      long long v44 = 0u;
                      long long v45 = 0u;
                      id v29 = objc_msgSend(v22, "sba_entity_types");
                      uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v56 count:16];
                      if (v30)
                      {
                        uint64_t v31 = v30;
                        uint64_t v32 = *(void *)v45;
                        do
                        {
                          for (uint64_t i = 0; i != v31; ++i)
                          {
                            if (*(void *)v45 != v32) {
                              objc_enumerationMutation(v29);
                            }
                            switch([*(id *)(*((void *)&v44 + 1) + 8 * i) integerValue])
                            {
                              case 1u:
                                v12 |= 2uLL;
                                break;
                              case 2u:
                                v12 |= 4uLL;
                                break;
                              case 3u:
                                v12 |= 8uLL;
                                break;
                              case 4u:
                                v12 |= 0x10uLL;
                                break;
                              default:
                                continue;
                            }
                          }
                          uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v56 count:16];
                        }
                        while (v31);
                      }

                      v21 = v28;
                      uint64_t v18 = v27;
                      int v13 = v26;
                      v20 = v25;
                      uint64_t v17 = v41;
                    }
                  }
                  ++v19;
                }
                while (v19 != v17);
                uint64_t v17 = [v43 countByEnumeratingWithState:&v48 objects:v57 count:16];
              }
              while (v17);
            }

            uint64_t v14 = v40 + 1;
          }
          while (v40 + 1 != v39);
          uint64_t v39 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
        }
        while (v39);
      }

      (*(void (**)(void))(a1[7] + 16))();
      id v6 = 0;
      id v5 = v36;
      id v11 = v35;
    }
    else
    {
      if (v11)
      {
        id v34 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          __106__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_webpageIdentifier_completion___block_invoke_cold_1(v34);
        }
      }
      (*(void (**)(void))(a1[7] + 16))();
    }
  }
}

- (void)fetchContentForURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    char v21 = 0;
    id v7 = [(id)objc_opt_class() filteredStringForURL:v5 needsVariants:&v21];
    id v8 = v7;
    if (v7)
    {
      if (v21)
      {
        id v9 = [v5 absoluteString];
      }
      else
      {
        id v9 = v7;
      }
      id v11 = v9;
      uint64_t v12 = (void *)MEMORY[0x1E4F5CBB0];
      int v13 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v14 = [v13 localeIdentifier];
      v15 = [v12 summarizeRequestForUrl:v11 locale:v14];

      uint64_t v16 = [(id)objc_opt_class() sharedPARSession];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke;
      v18[3] = &unk_1E5C8CBB0;
      id v19 = v5;
      id v20 = v6;
      uint64_t v17 = [v16 taskWithRequest:v15 completion:v18];

      [v17 resume];
    }
    else
    {
      id v10 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WBSBrowsingAssistantContentProvider fetchContentForURL:completion:]((uint64_t)v5, v10);
      }
      (*((void (**)(id, void))v6 + 2))(v6, MEMORY[0x1E4F1CBF0]);
    }
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, MEMORY[0x1E4F1CBF0]);
  }
}

void __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke_cold_2(a1, v8, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v9 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 summaryCandidates];
      id v11 = [v10 firstObject];
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = [v11 results];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    }
    else
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke_cold_1(v14);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __106__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_webpageIdentifier_completion___block_invoke_cold_1(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  char v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A6B5F000, v6, v7, "Checking content availability failed. Received unexpected response type. Expected %{public}@ but received %{public}@", v8, v9, v10, v11, v12);
}

void __106__WBSBrowsingAssistantContentProvider_checkContentAvailabilityForURL_locale_webpageIdentifier_completion___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  char v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 absoluteString];
  uint64_t v7 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A6B5F000, v8, v9, "Failed to check content availability for URL %{sensitive}@ with error %{public}@", v10, v11, v12, v13, v14);
}

- (void)fetchContentForURL:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Trying to fetch assistant content for an URL that failed broom filter and pattern check, this should never happen. Please file a bug with URL: %{private}@", (uint8_t *)&v2, 0xCu);
}

void __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke_cold_1(void *a1)
{
  id v1 = a1;
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A6B5F000, v6, v7, "Fetching content failed. Received unexpected response type. Expected %{public}@ but received %{public}@", v8, v9, v10, v11, v12);
}

void __69__WBSBrowsingAssistantContentProvider_fetchContentForURL_completion___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 absoluteString];
  uint64_t v7 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A6B5F000, v8, v9, "Failed to fetch content for URL %{sensitive}@ with error %{public}@", v10, v11, v12, v13, v14);
}

@end