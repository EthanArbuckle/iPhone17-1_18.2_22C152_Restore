@interface WBSPageContextDataFetcher
- (NSDictionary)filteredSchemaData;
- (WBSPageContextDataFetcherDelegate)delegate;
- (void)clearExtractedSchemaData;
- (void)fetchSchemaDataForWebView:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WBSPageContextDataFetcher

- (void)clearExtractedSchemaData
{
  filteredSchemaData = self->_filteredSchemaData;
  if (filteredSchemaData)
  {
    self->_filteredSchemaData = 0;
  }
}

- (void)fetchSchemaDataForWebView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__WBSPageContextDataFetcher_fetchSchemaDataForWebView___block_invoke;
  v6[3] = &unk_1E5E43A80;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  +[WBSSchemaDataExtractor fetchDataFromWebView:v5 completionHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __55__WBSPageContextDataFetcher_fetchSchemaDataForWebView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)WeakRetained + 1);
    if (v5)
    {
      uint64_t v10 = [v5 objectAtIndexedSubscript:0];
      v11 = (void *)v8[2];
      v8[2] = v10;

      v12 = [*(id *)(a1 + 32) URL];
      [v9 pageContextDataFetcherDidFinishFetching:v8 forURL:v12 withError:v6];
    }
    else
    {
      v13 = [*(id *)(a1 + 32) URL];
      [v9 pageContextDataFetcherDidFinishFetching:v8 forURL:v13 withError:v6];

      v14 = WBS_LOG_CHANNEL_PREFIXSchemaDataLoading();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __55__WBSPageContextDataFetcher_fetchSchemaDataForWebView___block_invoke_cold_1(v14, v6);
      }
    }
  }
}

- (WBSPageContextDataFetcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSPageContextDataFetcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)filteredSchemaData
{
  return self->_filteredSchemaData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredSchemaData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__WBSPageContextDataFetcher_fetchSchemaDataForWebView___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Failed to extract Microdata from webpage: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end