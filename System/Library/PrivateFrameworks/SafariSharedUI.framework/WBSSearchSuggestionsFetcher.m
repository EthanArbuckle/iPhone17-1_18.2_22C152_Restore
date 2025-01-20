@interface WBSSearchSuggestionsFetcher
- (BOOL)isFetching;
- (WBSOpenSearchURLTemplate)suggestionsURLTemplate;
- (WBSSearchSuggestionsFetcher)initWithSuggestionsURLTemplate:(id)a3;
- (id)_searchHelperConnection;
- (void)_fetchDidFinishWithResponse:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)cancelExistingSuggestionsRequest;
- (void)disconnectFromSearchHelperIfNecessary;
- (void)updateSuggestionsRequestWithSearchTerms:(id)a3 userAgentString:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSSearchSuggestionsFetcher

- (WBSSearchSuggestionsFetcher)initWithSuggestionsURLTemplate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSearchSuggestionsFetcher;
  v6 = [(WBSSearchSuggestionsFetcher *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestionsURLTemplate, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isFetching
{
  return self->_numberOfPendingFetches != 0;
}

- (void)updateSuggestionsRequestWithSearchTerms:(id)a3 userAgentString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  ++self->_numberOfPendingFetches;
  v11 = [(WBSSearchSuggestionsFetcher *)self _searchHelperConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke;
  v18[3] = &unk_1E5E44280;
  v18[4] = self;
  id v12 = v10;
  id v19 = v12;
  v13 = [v11 remoteObjectProxyWithErrorHandler:v18];

  suggestionsURLTemplate = self->_suggestionsURLTemplate;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke_1;
  v16[3] = &unk_1E5E442A8;
  v16[4] = self;
  id v15 = v12;
  id v17 = v15;
  [v13 updateSuggestionsRequestWithSearchTerms:v8 suggestionsURLTemplate:suggestionsURLTemplate userAgentString:v9 completionHandler:v16];
}

void __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (id)WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend(v3, "safari_privacyPreservingDescription");
    __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke_cold_1(v5, v6, v4);
  }

  [*(id *)(a1 + 32) _fetchDidFinishWithResponse:0 error:v3 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _fetchDidFinishWithResponse:a2 error:a3 completionHandler:*(void *)(a1 + 40)];
}

- (void)cancelExistingSuggestionsRequest
{
  if (self->_numberOfPendingFetches)
  {
    id v3 = [(WBSSearchSuggestionsFetcher *)self _searchHelperConnection];
    v4 = [v3 remoteObjectProxy];
    [v4 cancelExistingSuggestionsRequestOfFetcherWithSuggestionsURLTemplate:self->_suggestionsURLTemplate];

    self->_numberOfPendingFetches = 0;
  }
}

- (void)disconnectFromSearchHelperIfNecessary
{
  if (self->_hasConnectionToSearchHelper)
  {
    id v3 = [MEMORY[0x1E4F983E0] sharedManager];
    [v3 removeClient:self];

    self->_hasConnectionToSearchHelper = 0;
  }
}

- (id)_searchHelperConnection
{
  id v3 = [MEMORY[0x1E4F983E0] sharedManager];
  v4 = [v3 searchHelperConnectionRequestedByClient:self];

  self->_hasConnectionToSearchHelper = 1;
  return v4;
}

- (void)_fetchDidFinishWithResponse:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__WBSSearchSuggestionsFetcher__fetchDidFinishWithResponse_error_completionHandler___block_invoke;
  v14[3] = &unk_1E5E442D0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

uint64_t __83__WBSSearchSuggestionsFetcher__fetchDidFinishWithResponse_error_completionHandler___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2) {
    *(void *)(v1 + 8) = v2 - 1;
  }
  return (*(uint64_t (**)(void, void, void))(a1[7] + 16))(a1[7], a1[5], a1[6]);
}

- (WBSOpenSearchURLTemplate)suggestionsURLTemplate
{
  return self->_suggestionsURLTemplate;
}

- (void).cxx_destruct
{
}

void __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "WBSSearchSuggestionsFetcher received an error: %{public}@", buf, 0xCu);
}

@end