@interface WBSOpenSearchSchemaFetcher
+ (id)sharedFetcher;
- (void)_didFinishFetchingOpenSearchDescriptionDocumentWithURL:(id)a3;
- (void)fetchOpenSearchDescriptionWithURL:(id)a3;
@end

@implementation WBSOpenSearchSchemaFetcher

+ (id)sharedFetcher
{
  {
    v2 = (WBSOpenSearchSchemaFetcher *)+[WBSOpenSearchSchemaFetcher sharedFetcher]::fetcher;
  }
  else
  {
    v2 = objc_alloc_init(WBSOpenSearchSchemaFetcher);
    +[WBSOpenSearchSchemaFetcher sharedFetcher]::fetcher = (uint64_t)v2;
  }
  return v2;
}

- (void)fetchOpenSearchDescriptionWithURL:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_openSearchDescriptionURLs containsObject:v4] & 1) == 0)
  {
    openSearchDescriptionURLs = self->_openSearchDescriptionURLs;
    if (openSearchDescriptionURLs)
    {
      [(NSMutableSet *)openSearchDescriptionURLs addObject:v4];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA80] setWithObject:v4];
      v7 = self->_openSearchDescriptionURLs;
      self->_openSearchDescriptionURLs = v6;
    }
    v8 = +[WBSSearchHelperConnectionManager sharedManager];
    v9 = [v8 searchHelperConnectionRequestedByClient:self];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke;
    v15[3] = &unk_1E5C9D1B0;
    id v10 = v4;
    id v16 = v10;
    v17 = self;
    v11 = [v9 remoteObjectProxyWithErrorHandler:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_8;
    v12[3] = &unk_1E5C9CFB0;
    id v13 = v10;
    v14 = self;
    [v11 fetchOpenSearchDescriptionWithURL:v13 completionHandler:v12];
  }
}

void __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2;
  block[3] = &unk_1E5C8D840;
  id v8 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2_cold_1();
    }
  }
  return [*(id *)(a1 + 48) _didFinishFetchingOpenSearchDescriptionDocumentWithURL:*(void *)(a1 + 40)];
}

void __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2_9;
  v11[3] = &unk_1E5C9B5C8;
  id v12 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2_9(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2_cold_1();
    }
    [*(id *)(a1 + 48) _didFinishFetchingOpenSearchDescriptionDocumentWithURL:*(void *)(a1 + 40)];
  }
  else
  {
    id v11 = [*(id *)(a1 + 56) objectForKey:@"OpenSearchDescriptionDocumentURL"];
    id v3 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"OpenSearchDescriptionSearchURLTemplate"];
    id v4 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"OpenSearchDescriptionURLTemplateForSuggestionsInJSON"];
    id v5 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"OpenSearchDescriptionURLTemplateForSuggestionsInXML"];
    id v6 = [WBSOpenSearchDescription alloc];
    id v7 = [v11 absoluteString];
    uint64_t v8 = [(WBSOpenSearchDescription *)v6 initWithDescriptionDocumentURLString:v7 searchURLTemplate:v3 urlTemplateForSuggestionsInJSON:v4 urlTemplateForSuggestionsInXML:v5];

    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setObject:v8 forKeyedSubscript:@"WBSOpenSearchDescription"];
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"WBSOpenSearchSchemaFetcherDidCollectDescriptionNotification" object:*(void *)(a1 + 48) userInfo:v9];

    [*(id *)(a1 + 48) _didFinishFetchingOpenSearchDescriptionDocumentWithURL:v11];
  }
}

- (void)_didFinishFetchingOpenSearchDescriptionDocumentWithURL:(id)a3
{
  id v5 = a3;
  -[NSMutableSet removeObject:](self->_openSearchDescriptionURLs, "removeObject:");
  if (![(NSMutableSet *)self->_openSearchDescriptionURLs count])
  {
    id v4 = +[WBSSearchHelperConnectionManager sharedManager];
    [v4 removeClient:self];
  }
}

- (void).cxx_destruct
{
}

void __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_10();
  _os_log_error_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_ERROR, "Fetch OpenSource description from %{sensitive, mask.hash}@ failed.", v1, 0x16u);
}

@end