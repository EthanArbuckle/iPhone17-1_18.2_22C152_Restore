@interface WBSWebViewMetadataFetchOperation
- (CGSize)webViewSize;
- (NSString)description;
- (WBSWebViewMetadataFetchOperationDelegate)delegate;
- (WKWebView)webView;
- (WKWebViewConfiguration)webViewConfiguration;
- (void)_setUpWebViewAndStartOffscreenFetching;
- (void)_webViewWebProcessDidCrash:(id)a3;
- (void)cancel;
- (void)clearWebView;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
@end

@implementation WBSWebViewMetadataFetchOperation

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WBSWebViewMetadataFetchOperation;
  [(WBSWebViewMetadataFetchOperation *)&v2 dealloc];
}

- (WKWebViewConfiguration)webViewConfiguration
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  v3 = [v2 preferences];
  [v3 _setOfflineApplicationCacheIsEnabled:0];

  [v2 _setAllowsJavaScriptMarkup:0];
  [v2 _setNeedsStorageAccessFromFileURLsQuirk:0];
  return (WKWebViewConfiguration *)v2;
}

- (CGSize)webViewSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setUpWebViewAndStartOffscreenFetching
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_initWeak(&location, self);
  [(WBSWebViewMetadataFetchOperation *)self webViewSize];
  double v5 = v4;
  double v7 = v6;
  v8 = [(WBSWebViewMetadataFetchOperation *)self webViewConfiguration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__WBSWebViewMetadataFetchOperation__setUpWebViewAndStartOffscreenFetching__block_invoke;
  v10[3] = &unk_1E5E46CF8;
  objc_copyWeak(&v12, &location);
  id v9 = WeakRetained;
  id v11 = v9;
  objc_msgSend(v9, "webViewMetadataFetchOperation:getWebViewOfSize:withConfiguration:completionHandler:", self, v8, v10, v5, v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __74__WBSWebViewMetadataFetchOperation__setUpWebViewAndStartOffscreenFetching__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained isCancelled])
    {
      [*(id *)(a1 + 32) webViewMetadataFetchOperation:v5 didFinishUsingWebView:v6];
      [v5 _setStatus:2];
    }
    else
    {
      objc_storeStrong(v5 + 34, a2);
      [v5[34] setNavigationDelegate:v5];
      [v5 didCreateWebView];
      [v5 startOffscreenFetching];
    }
  }
}

- (void)clearWebView
{
  if (self->_webView)
  {
    [(WBSWebViewMetadataFetchOperation *)self willClearWebView];
    [(WKWebView *)self->_webView setNavigationDelegate:0];
    [(WKWebView *)self->_webView stopLoading];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained webViewMetadataFetchOperation:self didFinishUsingWebView:self->_webView];

    webView = self->_webView;
    self->_webView = 0;
  }
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(WBSSiteMetadataFetchOperation *)self _setStatus:1];
  if ([(WBSWebViewMetadataFetchOperation *)self isCancelled])
  {
    [(WBSSiteMetadataFetchOperation *)self _setStatus:2];
    double v3 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      double v4 = v3;
      *(_DWORD *)buf = 138543618;
      uint64_t v7 = objc_opt_class();
      __int16 v8 = 2048;
      id v9 = self;
      _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_INFO, "Aborted fetch operation <%{public}@ %p> due to cancellation", buf, 0x16u);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__WBSWebViewMetadataFetchOperation_start__block_invoke;
    block[3] = &unk_1E5E40968;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __41__WBSWebViewMetadataFetchOperation_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUpWebViewAndStartOffscreenFetching];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)WBSWebViewMetadataFetchOperation;
  [(WBSWebViewMetadataFetchOperation *)&v4 cancel];
  if (([(WBSWebViewMetadataFetchOperation *)self isCancelled] & 1) == 0)
  {
    if ([(WBSSiteMetadataFetchOperation *)self isExecuting])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__WBSWebViewMetadataFetchOperation_cancel__block_invoke;
      block[3] = &unk_1E5E40968;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __42__WBSWebViewMetadataFetchOperation_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearWebView];
  double v2 = *(void **)(a1 + 32);
  return [v2 _setStatus:2];
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(WBSSiteMetadataFetchOperation *)self request];
  id v6 = [v5 url];
  uint64_t v7 = [v6 absoluteURL];
  __int16 v8 = [v3 stringWithFormat:@"<%p %@, Request URL: %@>", self, v4, v7];

  return (NSString *)v8;
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SafariSharedUI.WBSWebViewMetadataFetchOperation" code:0 userInfo:0];
  [(WBSWebViewMetadataFetchOperation *)self didFailFetchWithError:v4];
}

- (WBSWebViewMetadataFetchOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSWebViewMetadataFetchOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end