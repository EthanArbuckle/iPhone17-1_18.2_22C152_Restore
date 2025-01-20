@interface MFWebViewLoadingController
- (BOOL)webProcessPluginNeedsUpdate;
- (EMContentRepresentation)contentRepresentation;
- (MFMailWebProcessDelegate)webProcessDelegate;
- (MFWebViewDictionary)webViewConstants;
- (MFWebViewLoadingController)init;
- (NSError)error;
- (NSURL)loadingURL;
- (WKWebView)webView;
- (_WKRemoteObjectInterface)remoteObjectInterface;
- (void)_doIssueLoadRequest;
- (void)_reconveneWebProcessBundle;
- (void)_registerWebProcessDelegate:(id)a3;
- (void)_unregisterWebProcessDelegate:(id)a3;
- (void)dealloc;
- (void)reload;
- (void)remoteContentURLSession:(id)a3 failedToProxyURL:(id)a4 failureReason:(int64_t)a5;
- (void)requestWebViewLoadWithContentRepresentation:(id)a3;
- (void)requestWebViewLoadWithError:(id)a3;
- (void)requestWebViewLoadWithoutShowingMessageWithRepresentation:(id)a3;
- (void)setContentRepresentation:(id)a3;
- (void)setError:(id)a3;
- (void)setLoadingURL:(id)a3;
- (void)setRemoteObjectInterface:(id)a3;
- (void)setWebProcessDelegate:(id)a3;
- (void)setWebProcessPluginNeedsUpdate:(BOOL)a3;
- (void)setWebView:(id)a3;
- (void)slapWebView;
- (void)stopLoading;
@end

@implementation MFWebViewLoadingController

- (MFWebViewLoadingController)init
{
  v18.receiver = self;
  v18.super_class = (Class)MFWebViewLoadingController;
  v2 = [(MFWebViewLoadingController *)&v18 init];
  v3 = v2;
  if (v2)
  {
    v2->_webProcessPluginNeedsUpdate = 1;
    v4 = +[MFWKWebViewFactory sharedWebViewFactory];
    uint64_t v5 = [v4 webView];
    webView = v3->_webView;
    v3->_webView = (WKWebView *)v5;

    v7 = objc_alloc_init(MFWebViewDictionary);
    webViewConstants = v3->_webViewConstants;
    v3->_webViewConstants = v7;

    v9 = objc_msgSend(MEMORY[0x1E4F28FD8], "ec_attributionExpression");
    v10 = [v9 pattern];
    [(MFWebViewDictionary *)v3->_webViewConstants setObject:v10 forKeyedSubscript:@"outdentedAttributionsPattern"];

    uint64_t v11 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F3A10698];
    remoteObjectInterface = v3->_remoteObjectInterface;
    v3->_remoteObjectInterface = (_WKRemoteObjectInterface *)v11;

    v13 = v3->_remoteObjectInterface;
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    [(_WKRemoteObjectInterface *)v13 setClasses:v16 forSelector:sel_webProcessDidFinishDocumentLoadForURL_andRequestedRemoteURLs_ argumentIndex:1 ofReply:0];

    [(MFWebViewLoadingController *)v3 _reconveneWebProcessBundle];
  }
  return v3;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webProcessDelegate);
  [(MFWebViewLoadingController *)self _unregisterWebProcessDelegate:WeakRetained];

  v4.receiver = self;
  v4.super_class = (Class)MFWebViewLoadingController;
  [(MFWebViewLoadingController *)&v4 dealloc];
}

- (void)_unregisterWebProcessDelegate:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    objc_super v4 = [(MFWebViewLoadingController *)self webView];
    uint64_t v5 = [v4 _remoteObjectRegistry];
    v6 = [MEMORY[0x1E4F77C60] weakProxyForObject:v10];
    v7 = [(MFWebViewLoadingController *)self remoteObjectInterface];
    [v5 unregisterExportedObject:v6 interface:v7];

    v8 = +[MFWKWebViewFactory sharedWebViewFactory];
    v9 = [v8 urlSession];

    [v9 unregisterObserver:self];
  }
}

- (void)_registerWebProcessDelegate:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    objc_super v4 = [(MFWebViewLoadingController *)self webView];
    uint64_t v5 = [v4 _remoteObjectRegistry];
    v6 = [MEMORY[0x1E4F77C60] weakProxyForObject:v10];
    v7 = [(MFWebViewLoadingController *)self remoteObjectInterface];
    [v5 registerExportedObject:v6 interface:v7];

    v8 = +[MFWKWebViewFactory sharedWebViewFactory];
    v9 = [v8 urlSession];

    [v9 registerObserver:self];
  }
}

- (void)setWebProcessDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webProcessDelegate);
  if (WeakRetained != obj)
  {
    [(MFWebViewLoadingController *)self _unregisterWebProcessDelegate:WeakRetained];
    objc_storeWeak((id *)&self->_webProcessDelegate, obj);
    [(MFWebViewLoadingController *)self _registerWebProcessDelegate:obj];
  }
}

- (void)setLoadingURL:(id)a3
{
  objc_super v4 = (NSURL *)a3;
  contentRepresentation = self->_contentRepresentation;
  self->_contentRepresentation = 0;

  error = self->_error;
  self->_error = 0;

  loadingURL = self->_loadingURL;
  self->_loadingURL = v4;
}

- (void)setContentRepresentation:(id)a3
{
  objc_super v4 = (EMContentRepresentation *)a3;
  loadingURL = self->_loadingURL;
  self->_loadingURL = 0;

  error = self->_error;
  self->_error = 0;

  contentRepresentation = self->_contentRepresentation;
  self->_contentRepresentation = v4;
}

- (void)slapWebView
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = [(MFWebViewLoadingController *)self webView];
    int v11 = 138543874;
    v12 = v9;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_error_impl(&dword_1DDF5A000, v3, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: Killing and resetting webview: %@", (uint8_t *)&v11, 0x20u);
  }
  objc_super v4 = [(MFWebViewLoadingController *)self webView];
  [v4 _killWebContentProcessAndResetState];

  uint64_t v5 = [(MFWebViewLoadingController *)self contentRepresentation];
  if (v5)
  {

LABEL_6:
    [(MFWebViewLoadingController *)self _doIssueLoadRequest];
    return;
  }
  v6 = [(MFWebViewLoadingController *)self loadingURL];
  BOOL v7 = v6 == 0;

  if (!v7) {
    goto LABEL_6;
  }
  [(MFWebViewLoadingController *)self reload];
}

- (void)reload
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    v8 = [(MFWebViewLoadingController *)self webView];
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2048;
    v12 = self;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_1DDF5A000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@: %p>: Sending request to reload webview: %@", (uint8_t *)&v9, 0x20u);
  }
  objc_super v4 = [(MFWebViewLoadingController *)self webView];
  id v5 = (id)[v4 reload];
}

- (void)stopLoading
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    BOOL v7 = [(MFWebViewLoadingController *)self webView];
    int v8 = 138543874;
    int v9 = v6;
    __int16 v10 = 2048;
    __int16 v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    _os_log_debug_impl(&dword_1DDF5A000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@: %p>: Sending request to stop loading webview: %@", (uint8_t *)&v8, 0x20u);
  }
  objc_super v4 = [(MFWebViewLoadingController *)self webView];
  [v4 stopLoading];
}

- (void)_doIssueLoadRequest
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(MFWebViewLoadingController *)self contentRepresentation];
  uint64_t v4 = [(MFWebViewLoadingController *)self error];
  id v5 = (void *)v4;
  if (v3)
  {
    v6 = [v3 contentURL];
    BOOL v7 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = (objc_class *)objc_opt_class();
      int v9 = NSStringFromClass(v8);
      __int16 v10 = objc_msgSend(v3, "ef_publicDescription");
      int v24 = 138543874;
      v25 = v9;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_1DDF5A000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Sending request to load webview with content representation: %{public}@", (uint8_t *)&v24, 0x20u);
    }
    __int16 v11 = [(MFWebViewLoadingController *)self webView];
    id v12 = (id)[v11 loadFileURL:v6 allowingReadAccessToURL:v6];
LABEL_5:

    goto LABEL_10;
  }
  if (!v4)
  {
    uint64_t v14 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      uint64_t v17 = [(MFWebViewLoadingController *)self loadingURL];
      int v24 = 138543874;
      v25 = v16;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_1DDF5A000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Sending request to load webview with loading URL: %@", (uint8_t *)&v24, 0x20u);
    }
    v6 = [(MFWebViewLoadingController *)self webView];
    objc_super v18 = (void *)MEMORY[0x1E4F290D0];
    __int16 v11 = [(MFWebViewLoadingController *)self loadingURL];
    v19 = [v18 requestWithURL:v11 cachePolicy:0 timeoutInterval:60.0];
    id v20 = (id)[v6 loadRequest:v19];

    goto LABEL_5;
  }
  __int16 v13 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v23 = objc_msgSend(v5, "ef_publicDescription");
    int v24 = 138543874;
    v25 = v22;
    __int16 v26 = 2048;
    v27 = self;
    __int16 v28 = 2114;
    v29 = v23;
    _os_log_error_impl(&dword_1DDF5A000, v13, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: Sending request to load webview with error: %{public}@", (uint8_t *)&v24, 0x20u);
  }
  [(MFWebViewLoadingController *)self requestWebViewLoadWithError:v5];
LABEL_10:
}

- (void)requestWebViewLoadWithoutShowingMessageWithRepresentation:(id)a3
{
  id v6 = [a3 contentURL];
  -[MFWebViewLoadingController setLoadingURL:](self, "setLoadingURL:");
  uint64_t v4 = [(MFWebViewLoadingController *)self webView];
  id v5 = (id)[v4 loadHTMLString:&stru_1F39E2A88 baseURL:v6];
}

- (void)requestWebViewLoadWithError:(id)a3
{
  id v7 = a3;
  -[MFWebViewLoadingController setError:](self, "setError:");
  uint64_t v4 = [(MFWebViewLoadingController *)self webView];
  id v5 = objc_msgSend(v7, "mf_markupString");
  id v6 = (id)[v4 loadHTMLString:v5 baseURL:0];
}

- (void)requestWebViewLoadWithContentRepresentation:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [MEMORY[0x1E4F60D58] currentDevice];
  int v5 = [v4 isInternal];

  if (v5)
  {
    id v6 = NSString;
    [(WKWebView *)self->_webView _webProcessIdentifier];
    id v7 = EFStringWithInt64();
    int v8 = [v12 contentItem];
    int v9 = [v8 displayName];
    __int16 v10 = [v6 stringWithFormat:@"(%@) %@", v7, v9];
    __int16 v11 = [(MFWebViewLoadingController *)self webView];
    [v11 _setRemoteInspectionNameOverride:v10];
  }
  [(MFWebViewLoadingController *)self setContentRepresentation:v12];
  [MEMORY[0x1E4F35108] registerContentRepresentation:v12];
  [(MFWebViewLoadingController *)self _doIssueLoadRequest];
}

- (void)_reconveneWebProcessBundle
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1DDF5A000, log, OS_LOG_TYPE_DEBUG, "<%{public}@: %p>: updatingWebProcessPlugin", buf, 0x16u);
}

- (void)remoteContentURLSession:(id)a3 failedToProxyURL:(id)a4 failureReason:(int64_t)a5
{
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__MFWebViewLoadingController_remoteContentURLSession_failedToProxyURL_failureReason___block_invoke;
  v10[3] = &unk_1E6D1B7C0;
  v10[4] = self;
  id v8 = v7;
  id v11 = v8;
  int64_t v12 = a5;
  int v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v9 performSyncBlock:v10];
}

void __85__MFWebViewLoadingController_remoteContentURLSession_failedToProxyURL_failureReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) webProcessDelegate];
  [v2 webProcessFailedToLoadResourceWithProxyForURL:*(void *)(a1 + 40) failureReason:*(void *)(a1 + 48)];
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (MFWebViewDictionary)webViewConstants
{
  return self->_webViewConstants;
}

- (MFMailWebProcessDelegate)webProcessDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webProcessDelegate);
  return (MFMailWebProcessDelegate *)WeakRetained;
}

- (_WKRemoteObjectInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (void)setRemoteObjectInterface:(id)a3
{
}

- (EMContentRepresentation)contentRepresentation
{
  return self->_contentRepresentation;
}

- (NSURL)loadingURL
{
  return self->_loadingURL;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)webProcessPluginNeedsUpdate
{
  return self->_webProcessPluginNeedsUpdate;
}

- (void)setWebProcessPluginNeedsUpdate:(BOOL)a3
{
  self->_webProcessPluginNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_loadingURL, 0);
  objc_storeStrong((id *)&self->_contentRepresentation, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_destroyWeak((id *)&self->_webProcessDelegate);
  objc_storeStrong((id *)&self->_webViewConstants, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end