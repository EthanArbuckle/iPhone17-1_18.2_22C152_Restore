@interface WBSTouchIconFetchOperation
- (BOOL)_shouldFetchOverPrivateRelay;
- (BOOL)_shouldFetchWithHTTPSOnly;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (WBSTouchIconFetchOperation)initWithRequest:(id)a3;
- (WBSTouchIconFetchOperation)initWithRequest:(id)a3 allowFetchingOverCellularNetwork:(BOOL)a4 completionHandler:(id)a5;
- (WBSTouchIconFetchOperation)initWithRequest:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (id)webViewConfiguration;
- (unint64_t)hash;
- (void)_downloadFirstValidImageWithURLs:(id)a3 failureHandler:(id)a4;
- (void)_downloadPendingTouchIconURLs;
- (void)_scheduleTimeoutWithTimeInterval:(double)a3;
- (void)_setUpRemoteObjectProxies;
- (void)_tearDownRemoteObjectProxies;
- (void)clearWebView;
- (void)didCompleteWithResult:(id)a3;
- (void)didCreateWebView;
- (void)didFailFetchWithError:(id)a3;
- (void)didFetchTouchIconURLs:(id)a3 andFaviconURLs:(id)a4 forURL:(id)a5;
- (void)loadRequest;
- (void)resetState;
- (void)startOffscreenFetching;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)willClearWebView;
@end

@implementation WBSTouchIconFetchOperation

- (WBSTouchIconFetchOperation)initWithRequest:(id)a3
{
  return 0;
}

- (WBSTouchIconFetchOperation)initWithRequest:(id)a3 completionHandler:(id)a4
{
  return [(WBSTouchIconFetchOperation *)self initWithRequest:a3 allowFetchingOverCellularNetwork:1 completionHandler:a4];
}

- (WBSTouchIconFetchOperation)initWithRequest:(id)a3 allowFetchingOverCellularNetwork:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (!v9) {
    goto LABEL_5;
  }
  v22.receiver = self;
  v22.super_class = (Class)WBSTouchIconFetchOperation;
  v10 = [(WBSSiteMetadataFetchOperation *)&v22 initWithRequest:v8];
  if (!v10)
  {
    v18 = [v8 url];
    v19 = [v18 host];
    v20 = +[WBSTouchIconFetchOperationResult resultForFetchFailureWithHost:v19 pageRequestDidSucceed:0 response:0 error:0];
    v9[2](v9, v20);

    self = 0;
LABEL_5:
    v17 = 0;
    goto LABEL_6;
  }
  v11 = v10;
  uint64_t v12 = MEMORY[0x1AD115160](v9);
  id completionHandler = v11->_completionHandler;
  v11->_id completionHandler = (id)v12;

  v11->_allowFetchingOverCellularNetwork = a4;
  v14 = [v8 activity];
  os_activity_t v15 = _os_activity_create(&dword_1ABB70000, "Touch Icon Fetch Operation", v14, OS_ACTIVITY_FLAG_DEFAULT);

  activity = v11->_activity;
  v11->_activity = (OS_os_activity *)v15;

  self = v11;
  v17 = self;
LABEL_6:

  return v17;
}

- (BOOL)_shouldFetchWithHTTPSOnly
{
  v2 = [(WBSSiteMetadataFetchOperation *)self request];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = ((unint64_t)[v2 options] >> 2) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)_shouldFetchOverPrivateRelay
{
  v2 = [(WBSSiteMetadataFetchOperation *)self request];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = ((unint64_t)[v2 options] >> 3) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(WBSSiteMetadataFetchOperation *)self request];
  v6 = [v5 url];
  v7 = [v6 absoluteURL];
  id v8 = [v3 stringWithFormat:@"<%p %@, Request URL: %@>", self, v4, v7];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  v2 = [(WBSSiteMetadataFetchOperation *)self request];
  unint64_t v3 = [v2 url];
  uint64_t v4 = [v3 host];
  unint64_t v5 = [v4 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WBSTouchIconFetchOperation *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      v6 = [(WBSSiteMetadataFetchOperation *)self request];
      v7 = [v6 url];
      id v8 = [v7 host];
      v9 = [(WBSSiteMetadataFetchOperation *)v5 request];

      v10 = [v9 url];
      v11 = [v10 host];
      char v12 = [v8 isEqualToString:v11];
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)webViewConfiguration
{
  v9.receiver = self;
  v9.super_class = (Class)WBSTouchIconFetchOperation;
  unint64_t v3 = [(WBSWebViewMetadataFetchOperation *)&v9 webViewConfiguration];
  [v3 _setGroupIdentifier:@"TouchIconExtractor"];
  if (self->_allowFetchingOverCellularNetwork)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F46710], "safari_defaultDataStore");
    [v3 setWebsiteDataStore:v4];
  }
  else
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F467D8]) initNonPersistentConfiguration];
    if (objc_opt_respondsToSelector()) {
      [v4 setAllowsCellularAccess:0];
    }
    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F46710], "safari_dataStoreWithConfiguration:", v4);
    [v3 setWebsiteDataStore:v5];
  }
  if ([(WBSTouchIconFetchOperation *)self _shouldFetchWithHTTPSOnly])
  {
    v6 = [v3 defaultWebpagePreferences];
    objc_msgSend(v6, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v6, "_networkConnectionIntegrityPolicy") | 4);
  }
  if ([(WBSTouchIconFetchOperation *)self _shouldFetchOverPrivateRelay])
  {
    v7 = [v3 defaultWebpagePreferences];
    objc_msgSend(v7, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v7, "_networkConnectionIntegrityPolicy") | 0x10);
  }
  return v3;
}

- (void)resetState
{
  [(NSTimer *)self->_loadingTimeoutTimer invalidate];
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  self->_loadingTimeoutTimer = 0;

  pendingTouchIconURLs = self->_pendingTouchIconURLs;
  self->_pendingTouchIconURLs = 0;

  self->_state = 0;
}

- (void)loadRequest
{
  unint64_t v3 = [(WBSWebViewMetadataFetchOperation *)self webView];
  uint64_t v4 = (void *)MEMORY[0x1E4F18DA8];
  unint64_t v5 = [(WBSSiteMetadataFetchOperation *)self request];
  v6 = [v5 url];
  v7 = objc_msgSend(v4, "safari_nonAppInitiatedRequestWithURL:", v6);
  id v8 = (id)[v3 loadRequest:v7];

  [(WBSTouchIconFetchOperation *)self _scheduleTimeoutWithTimeInterval:30.0];
}

- (void)didCompleteWithResult:(id)a3
{
  (*((void (**)(void))self->_completionHandler + 2))();
  [(WBSTouchIconFetchOperation *)self clearWebView];
  [(WBSSiteMetadataFetchOperation *)self _setStatus:2];
}

- (void)_setUpRemoteObjectProxies
{
  unint64_t v3 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F03673D0];
  touchIconObserverInterface = self->_touchIconObserverInterface;
  self->_touchIconObserverInterface = v3;

  unint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(_WKRemoteObjectInterface *)self->_touchIconObserverInterface setClasses:v9 forSelector:sel_didFetchTouchIconURLs_andFaviconURLs_forURL_ argumentIndex:0 ofReply:0];
  [(_WKRemoteObjectInterface *)self->_touchIconObserverInterface setClasses:v9 forSelector:sel_didFetchTouchIconURLs_andFaviconURLs_forURL_ argumentIndex:1 ofReply:0];
  v7 = [(WBSWebViewMetadataFetchOperation *)self webView];
  id v8 = [v7 _remoteObjectRegistry];
  [v8 registerExportedObject:self interface:self->_touchIconObserverInterface];
}

- (void)_tearDownRemoteObjectProxies
{
  id v4 = [(WBSWebViewMetadataFetchOperation *)self webView];
  unint64_t v3 = [v4 _remoteObjectRegistry];
  [v3 unregisterExportedObject:self interface:self->_touchIconObserverInterface];
}

- (void)startOffscreenFetching
{
  if ([(WBSTouchIconFetchOperation *)self isCancelled])
  {
    [(WBSSiteMetadataFetchOperation *)self _setStatus:2];
  }
  else
  {
    activity = self->_activity;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__WBSTouchIconFetchOperation_startOffscreenFetching__block_invoke;
    block[3] = &unk_1E5E40968;
    block[4] = self;
    os_activity_apply(activity, block);
  }
}

void __52__WBSTouchIconFetchOperation_startOffscreenFetching__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    unint64_t v5 = [v3 request];
    uint64_t v6 = [v5 url];
    int v9 = 141558275;
    uint64_t v10 = 1752392040;
    __int16 v11 = 2117;
    char v12 = v6;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_DEFAULT, "Touch Icon fetch operation started for URL %{sensitive, mask.hash}@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) loadRequest];
  v7 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138739971;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_INFO, "Started offscreen touch icon fetch request for %{sensitive}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)clearWebView
{
  v3.receiver = self;
  v3.super_class = (Class)WBSTouchIconFetchOperation;
  [(WBSWebViewMetadataFetchOperation *)&v3 clearWebView];
  [(NSTimer *)self->_loadingTimeoutTimer invalidate];
}

- (void)_scheduleTimeoutWithTimeInterval:(double)a3
{
  objc_initWeak(&location, self);
  unint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__WBSTouchIconFetchOperation__scheduleTimeoutWithTimeInterval___block_invoke;
  v8[3] = &unk_1E5E41668;
  objc_copyWeak(&v9, &location);
  uint64_t v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:a3];
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  self->_loadingTimeoutTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__WBSTouchIconFetchOperation__scheduleTimeoutWithTimeInterval___block_invoke(uint64_t a1, void *a2)
{
  os_activity_t v9 = a2;
  WeakRetained = (os_activity_t *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && WeakRetained[36] == v9)
  {
    os_activity_apply(WeakRetained[41], &__block_literal_global_48);
    unint64_t v5 = [(os_activity_t *)v4 request];
    uint64_t v6 = [v5 url];
    v7 = [v6 host];
    uint64_t v8 = +[WBSTouchIconFetchOperationResult resultForFetchFailureWithHost:v7 pageRequestDidSucceed:0 response:0 error:0];
    [(os_activity_t *)v4 didCompleteWithResult:v8];
  }
}

void __63__WBSTouchIconFetchOperation__scheduleTimeoutWithTimeInterval___block_invoke_2()
{
  v0 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_INFO, "Touch Icon fetch operation timed out.", v1, 2u);
  }
}

- (void)_downloadFirstValidImageWithURLs:(id)a3 failureHandler:(id)a4
{
  id v6 = a4;
  uint64_t allowFetchingOverCellularNetwork = self->_allowFetchingOverCellularNetwork;
  id v8 = a3;
  if ([(WBSTouchIconFetchOperation *)self _shouldFetchOverPrivateRelay]) {
    allowFetchingOverCellularNetwork |= 4uLL;
  }
  os_activity_t v9 = +[WBSImageFetchingURLSessionTaskManager sharedManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke;
  v11[3] = &unk_1E5E45430;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 downloadFirstValidImageWithURLs:v8 options:allowFetchingOverCellularNetwork completionHandler:v11];
}

void __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(NSObject **)(v16 + 328);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke_2;
  block[3] = &unk_1E5E412F0;
  block[4] = v16;
  id v18 = v13;
  id v35 = v18;
  id v19 = v11;
  id v36 = v19;
  id v20 = v15;
  id v37 = v20;
  os_activity_apply(v17, block);
  if (v19)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke_66;
    v29[3] = &unk_1E5E45408;
    v29[4] = &v30;
    [v20 enumerateKeysAndObjectsUsingBlock:v29];
    v21 = [*(id *)(a1 + 32) request];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v23 = [*(id *)(a1 + 32) request];
    [v23 url];
    if (isKindOfClass) {
      v24 = {;
    }
      v25 = [v24 host];
      LOBYTE(v28) = *((unsigned char *)v31 + 24);
      +[WBSTouchIconFetchOperationResult resultWithFavicon:v19 iconData:v12 iconURL:v18 host:v25 pageRequestDidSucceed:1 response:v14 higherPriorityIconDownloadFailedDueToNetworkError:v28];
    }
    else {
      v24 = {;
    }
      v25 = [v24 host];
      int v26 = [*(id *)(*(void *)(a1 + 32) + 304) containsObject:v18];
      +[WBSTouchIconFetchOperationResult resultWithTouchIcon:v19 host:v25 isFavicon:v26 ^ 1u pageRequestDidSucceed:1 response:v14 higherPriorityIconDownloadFailedDueToNetworkError:*((unsigned __int8 *)v31 + 24)];
    v27 = };

    [*(id *)(a1 + 32) didCompleteWithResult:v27];
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke_2(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = (void *)a1[4];
    id v4 = v2;
    unint64_t v5 = [v3 request];
    id v6 = [v5 url];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[7];
    int v10 = 141559811;
    uint64_t v11 = 1752392040;
    __int16 v12 = 2117;
    id v13 = v6;
    __int16 v14 = 2160;
    uint64_t v15 = 1752392040;
    __int16 v16 = 2117;
    uint64_t v17 = v7;
    __int16 v18 = 2160;
    uint64_t v19 = 1752392040;
    __int16 v20 = 2117;
    uint64_t v21 = v8;
    __int16 v22 = 2160;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2117;
    uint64_t v25 = v9;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_DEFAULT, "Downloaded image from first valid URL for URL %{sensitive, mask.hash}@. First valid URL %{sensitive, mask.hash}@, image %{sensitive, mask.hash}@, errors %{sensitive, mask.hash}@", (uint8_t *)&v10, 0x52u);
  }
}

uint64_t __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke_66(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(a3, "safari_isOrContainsClientSideNetworkError");
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_downloadPendingTouchIconURLs
{
  activity = self->_activity;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WBSTouchIconFetchOperation__downloadPendingTouchIconURLs__block_invoke;
  block[3] = &unk_1E5E40968;
  block[4] = self;
  os_activity_apply(activity, block);
  self->_state = 3;
  pendingTouchIconURLs = self->_pendingTouchIconURLs;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__WBSTouchIconFetchOperation__downloadPendingTouchIconURLs__block_invoke_70;
  v5[3] = &unk_1E5E45458;
  v5[4] = self;
  [(WBSTouchIconFetchOperation *)self _downloadFirstValidImageWithURLs:pendingTouchIconURLs failureHandler:v5];
}

void __59__WBSTouchIconFetchOperation__downloadPendingTouchIconURLs__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = *(void **)(a1 + 32);
    id v4 = v2;
    unint64_t v5 = [v3 request];
    id v6 = [v5 url];
    int v7 = 141558275;
    uint64_t v8 = 1752392040;
    __int16 v9 = 2117;
    int v10 = v6;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_DEFAULT, "Downloading pending icon URLs for URL %{sensitive, mask.hash}@", (uint8_t *)&v7, 0x16u);
  }
}

void __59__WBSTouchIconFetchOperation__downloadPendingTouchIconURLs__block_invoke_70(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v7 = [v2 request];
  id v4 = [v7 url];
  unint64_t v5 = [v4 host];
  id v6 = +[WBSTouchIconFetchOperationResult resultForFetchFailureWithHost:v5 pageRequestDidSucceed:1 response:v3 error:0];

  [v2 didCompleteWithResult:v6];
}

- (void)didFailFetchWithError:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSTouchIconFetchOperation;
  [(WBSWebViewMetadataFetchOperation *)&v17 didFailFetchWithError:v4];
  activity = self->_activity;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __52__WBSTouchIconFetchOperation_didFailFetchWithError___block_invoke;
  __int16 v14 = &unk_1E5E40D38;
  uint64_t v15 = self;
  id v16 = v4;
  id v6 = v4;
  os_activity_apply(activity, &v11);
  id v7 = [(WBSSiteMetadataFetchOperation *)self request];
  uint64_t v8 = [v7 url];
  __int16 v9 = [v8 host];
  int v10 = +[WBSTouchIconFetchOperationResult resultForFetchFailureWithHost:v9 pageRequestDidSucceed:0 response:0 error:v6];
  [(WBSTouchIconFetchOperation *)self didCompleteWithResult:v10];
}

void __52__WBSTouchIconFetchOperation_didFailFetchWithError___block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __52__WBSTouchIconFetchOperation_didFailFetchWithError___block_invoke_cold_1(a1, v2);
  }
}

- (void)didCreateWebView
{
  v3.receiver = self;
  v3.super_class = (Class)WBSTouchIconFetchOperation;
  [(WBSWebViewMetadataFetchOperation *)&v3 didCreateWebView];
  [(WBSTouchIconFetchOperation *)self _setUpRemoteObjectProxies];
}

- (void)willClearWebView
{
  v3.receiver = self;
  v3.super_class = (Class)WBSTouchIconFetchOperation;
  [(WBSWebViewMetadataFetchOperation *)&v3 willClearWebView];
  [(WBSTouchIconFetchOperation *)self _tearDownRemoteObjectProxies];
}

- (void)didFetchTouchIconURLs:(id)a3 andFaviconURLs:(id)a4 forURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  activity = self->_activity;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WBSTouchIconFetchOperation_didFetchTouchIconURLs_andFaviconURLs_forURL___block_invoke;
  block[3] = &unk_1E5E40D60;
  id v12 = v8;
  id v30 = v12;
  id v13 = v9;
  id v31 = v13;
  id v14 = v10;
  id v32 = v14;
  os_activity_apply(activity, block);
  [(NSTimer *)self->_loadingTimeoutTimer invalidate];
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  self->_loadingTimeoutTimer = 0;

  id v16 = [(WBSSiteMetadataFetchOperation *)self request];
  objc_opt_class();
  LOBYTE(activity) = objc_opt_isKindOfClass();

  if (activity)
  {
    id v17 = v13;
  }
  else
  {
    id v17 = [v12 arrayByAddingObjectsFromArray:v13];
  }
  __int16 v18 = v17;
  uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
  touchIconURLs = self->_touchIconURLs;
  self->_touchIconURLs = v19;

  int64_t state = self->_state;
  switch(state)
  {
    case 2:
      uint64_t v22 = [v18 copy];
      uint64_t v23 = (void *)v22;
      if (v22) {
        __int16 v24 = (void *)v22;
      }
      else {
        __int16 v24 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)&self->_pendingTouchIconURLs, v24);

      [(WBSTouchIconFetchOperation *)self _downloadPendingTouchIconURLs];
      break;
    case 1:
      uint64_t v25 = [v18 copy];
      uint64_t v26 = (void *)v25;
      if (v25) {
        v27 = (void *)v25;
      }
      else {
        v27 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)&self->_pendingTouchIconURLs, v27);

      break;
    case 0:
      self->_int64_t state = 1;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __74__WBSTouchIconFetchOperation_didFetchTouchIconURLs_andFaviconURLs_forURL___block_invoke_78;
      v28[3] = &unk_1E5E45458;
      v28[4] = self;
      [(WBSTouchIconFetchOperation *)self _downloadFirstValidImageWithURLs:v18 failureHandler:v28];
      break;
  }
}

void __74__WBSTouchIconFetchOperation_didFetchTouchIconURLs_andFaviconURLs_forURL___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    int v6 = 141559299;
    uint64_t v7 = 1752392040;
    __int16 v8 = 2117;
    uint64_t v9 = v3;
    __int16 v10 = 2160;
    uint64_t v11 = 1752392040;
    __int16 v12 = 2117;
    uint64_t v13 = v4;
    __int16 v14 = 2160;
    uint64_t v15 = 1752392040;
    __int16 v16 = 2117;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_INFO, "Extracted touch icon URLs %{sensitive, mask.hash}@, favicon URLs %{sensitive, mask.hash}@ for URL %{sensitive, mask.hash}@", (uint8_t *)&v6, 0x3Eu);
  }
}

uint64_t __74__WBSTouchIconFetchOperation_didFetchTouchIconURLs_andFaviconURLs_forURL___block_invoke_78(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 296)) {
    return [*(id *)(a1 + 32) _downloadPendingTouchIconURLs];
  }
  *(void *)(v1 + 312) = 2;
  return [*(id *)(a1 + 32) _scheduleTimeoutWithTimeInterval:10.0];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v9 = (void (**)(id, void))a5;
  int v6 = [a4 request];
  uint64_t v7 = [v6 URL];
  unsigned int v8 = objc_msgSend(v7, "safari_isHTTPFamilyURL");

  v9[2](v9, v8);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_touchIconURLs, 0);
  objc_storeStrong((id *)&self->_pendingTouchIconURLs, 0);
  objc_storeStrong((id *)&self->_loadingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_touchIconObserverInterface, 0);
}

void __52__WBSTouchIconFetchOperation_didFailFetchWithError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 request];
  int v6 = [v5 url];
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
  int v8 = 141558531;
  uint64_t v9 = 1752392040;
  __int16 v10 = 2117;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_ERROR, "Failed to extract icon URLs for URL %{sensitive, mask.hash}@. %{public}@", (uint8_t *)&v8, 0x20u);
}

@end