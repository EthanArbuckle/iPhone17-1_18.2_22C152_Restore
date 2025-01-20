@interface WBSLPLinkMetadataFetchOperation
- (WBSLPLinkMetadataFetchOperation)initWithRequest:(id)a3 operationCompletionHandler:(id)a4;
- (id)description;
- (id)operationCompletionHandler;
- (void)cancel;
- (void)start;
@end

@implementation WBSLPLinkMetadataFetchOperation

- (WBSLPLinkMetadataFetchOperation)initWithRequest:(id)a3 operationCompletionHandler:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSLPLinkMetadataFetchOperation;
  v7 = [(WBSSiteMetadataFetchOperation *)&v12 initWithRequest:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id operationCompletionHandler = v7->_operationCompletionHandler;
    v7->_id operationCompletionHandler = (id)v8;

    v10 = v7;
  }

  return v7;
}

- (void)start
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(WBSSiteMetadataFetchOperation *)self _setStatus:1];
  if ([(WBSLPLinkMetadataFetchOperation *)self isCancelled])
  {
    [(WBSSiteMetadataFetchOperation *)self _setStatus:2];
    v3 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = 2048;
      v20 = self;
      _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_INFO, "Aborted fetch operation <%{public}@ %p> due to cancellation", buf, 0x16u);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E4F18DA8];
    id v6 = [(WBSSiteMetadataFetchOperation *)self request];
    v7 = [v6 url];
    uint64_t v8 = objc_msgSend(v5, "safari_nonAppInitiatedRequestWithURL:", v7);

    id v9 = objc_alloc_init(MEMORY[0x1E4F30AB0]);
    [v9 _setShouldDownloadMediaSubresources:0];
    if (objc_opt_respondsToSelector()) {
      [v9 _setFetchIsNotUserInitiated:1];
    }
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [(WBSSiteMetadataFetchOperation *)self request];
      objc_super v12 = [v11 url];
      v13 = [v12 absoluteString];
      *(_DWORD *)buf = 141558275;
      uint64_t v18 = 1752392040;
      __int16 v19 = 2117;
      v20 = v13;
      _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Fetching LP metadata for URL: %{sensitive, mask.hash}@.", buf, 0x16u);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__WBSLPLinkMetadataFetchOperation_start__block_invoke;
    v14[3] = &unk_1E5E46CA0;
    objc_copyWeak(&v15, &location);
    [v9 startFetchingMetadataForRequest:v8 completionHandler:v14];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
}

void __40__WBSLPLinkMetadataFetchOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        v11 = [WeakRetained request];
        objc_super v12 = [v11 url];
        v13 = [v12 absoluteString];
        int v15 = 141558275;
        uint64_t v16 = 1752392040;
        __int16 v17 = 2117;
        uint64_t v18 = v13;
        _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Successfully fetched LP metadata for URL: %{sensitive, mask.hash}@.", (uint8_t *)&v15, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __40__WBSLPLinkMetadataFetchOperation_start__block_invoke_cold_1(v9, WeakRetained, v6);
    }
    if (([WeakRetained isCancelled] & 1) == 0)
    {
      uint64_t v14 = WeakRetained[33];
      if (v14) {
        (*(void (**)(uint64_t, id))(v14 + 16))(v14, v5);
      }
    }
    [WeakRetained _setStatus:2];
  }
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)WBSLPLinkMetadataFetchOperation;
  [(WBSLPLinkMetadataFetchOperation *)&v3 cancel];
  if (([(WBSLPLinkMetadataFetchOperation *)self isCancelled] & 1) == 0)
  {
    if ([(WBSSiteMetadataFetchOperation *)self isExecuting]) {
      [(WBSSiteMetadataFetchOperation *)self _setStatus:2];
    }
  }
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(WBSSiteMetadataFetchOperation *)self request];
  id v6 = [v5 url];
  v7 = [v6 absoluteURL];
  uint64_t v8 = [v3 stringWithFormat:@"<%p %@, Request URL: %@>", self, v4, v7];

  return v8;
}

- (id)operationCompletionHandler
{
  return self->_operationCompletionHandler;
}

- (void).cxx_destruct
{
}

void __40__WBSLPLinkMetadataFetchOperation_start__block_invoke_cold_1(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = [a2 request];
  v7 = [v6 url];
  uint64_t v8 = [v7 absoluteString];
  id v9 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v10 = 141558531;
  uint64_t v11 = 1752392040;
  __int16 v12 = 2117;
  v13 = v8;
  __int16 v14 = 2114;
  int v15 = v9;
  _os_log_error_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch LP metadata for URL: %{sensitive, mask.hash}@ with error: %{public}@.", (uint8_t *)&v10, 0x20u);
}

@end