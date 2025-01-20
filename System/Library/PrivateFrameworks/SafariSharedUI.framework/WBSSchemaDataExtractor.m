@interface WBSSchemaDataExtractor
+ (void)fetchDataFromWebView:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSSchemaDataExtractor

+ (void)fetchDataFromWebView:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = fetchDataFromWebView_completionHandler__schemaDataFetcherScriptSource;
  if (!fetchDataFromWebView_completionHandler__schemaDataFetcherScriptSource)
  {
    id v8 = [NSString alloc];
    uint64_t v9 = [v8 initWithBytesNoCopy:schemaDataExtractorSource length:schemaDataExtractorSourceLength encoding:4 freeWhenDone:0];
    v10 = (void *)fetchDataFromWebView_completionHandler__schemaDataFetcherScriptSource;
    fetchDataFromWebView_completionHandler__schemaDataFetcherScriptSource = v9;

    uint64_t v7 = fetchDataFromWebView_completionHandler__schemaDataFetcherScriptSource;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke;
  v12[3] = &unk_1E5E42DB8;
  id v13 = v6;
  id v11 = v6;
  [v5 _evaluateJavaScriptWithoutUserGesture:v7 completionHandler:v12];
}

void __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXSchemaDataLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_3(v7, v6);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  }
  else
  {
    if ([v5 count] == 2)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            if (v13)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v17 = WBS_LOG_CHANNEL_PREFIXSchemaDataLoading();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                  __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_1(v13, v17);
                }
                (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));

                goto LABEL_20;
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void (**)(uint64_t))(v14 + 16);
    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXSchemaDataLoading();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_2(v16);
      }
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void (**)(uint64_t))(v14 + 16);
    }
    v15(v14);
  }
LABEL_20:
}

void __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Fetching schema data returned unexpected result: %{private}@", (uint8_t *)&v2, 0xCu);
}

void __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Fetching schema data returned nil result", v1, 2u);
}

void __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_3(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Fetching schema data failed with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end