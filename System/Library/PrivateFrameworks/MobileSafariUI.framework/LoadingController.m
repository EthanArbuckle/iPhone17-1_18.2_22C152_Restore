@interface LoadingController
- (BOOL)canGoBack;
- (BOOL)canGoForward;
- (LoadingControllerDelegate)delegate;
- (NSString)title;
- (NSString)titleForStatePersisting;
- (NSURL)URL;
- (NSURL)URLForStatePersisting;
- (WKWebView)webView;
- (float)estimatedProgress;
- (id)loadRequest:(id)a3 userDriven:(BOOL)a4;
- (id)loadRequest:(id)a3 userDriven:(BOOL)a4 shouldOpenExternalURLs:(BOOL)a5;
- (id)loadRequest:(id)a3 userDriven:(BOOL)a4 shouldOpenExternalURLs:(BOOL)a5 eventAttribution:(id)a6;
- (void)goBack;
- (void)goForward;
- (void)reloadFromOrigin:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
- (void)setWebView:(id)a3;
- (void)stopLoading;
@end

@implementation LoadingController

- (NSString)title
{
  webView = self->_webView;
  if (webView)
  {
    title = [(WKWebView *)self->_webView title];
  }
  else
  {
    title = self->_title;
  }
  v4 = objc_msgSend(MEMORY[0x1E4F28B88], "safari_lockRelatedEmojiCharacterSet");
  v5 = objc_msgSend(title, "safari_stringByRemovingCharactersInSet:", v4);

  if (webView) {
  return (NSString *)v5;
  }
}

- (float)estimatedProgress
{
  [(WKWebView *)self->_webView estimatedProgress];
  return v2;
}

- (NSURL)URL
{
  URL = [(WKWebView *)self->_webView URL];
  v4 = URL;
  if (!URL) {
    URL = self->_URL;
  }
  v5 = URL;

  return v5;
}

- (void)setURL:(id)a3
{
  v5 = (NSURL *)a3;
  URL = self->_URL;
  p_URL = &self->_URL;
  if (URL != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_URL, a3);
    v5 = v8;
  }
}

- (void)setTitle:(id)a3
{
  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_title != v4)
  {
    v9 = v4;
    BOOL v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v9 copy];
      title = self->_title;
      self->_title = v7;

      v5 = v9;
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setWebView:(id)a3
{
}

- (BOOL)canGoForward
{
  return [(WKWebView *)self->_webView canGoForward];
}

- (BOOL)canGoBack
{
  return [(WKWebView *)self->_webView canGoBack];
}

- (NSURL)URLForStatePersisting
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(LoadingController *)self URL];
  URL = v3;
  if (!v3) {
    URL = self->_URL;
  }
  v5 = URL;

  if ([(NSURL *)v5 safari_isSafariWebExtensionURL])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v6 = +[Application sharedApplication];
    v7 = [v6 allWebExtensionsControllers];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) _persistentStateURLForExtensionURL:v5];
          if (v12)
          {
            v13 = (NSURL *)v12;

            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  v13 = v5;
LABEL_15:

  return v13;
}

- (NSString)titleForStatePersisting
{
  title = [(LoadingController *)self title];
  v4 = title;
  if (!title) {
    title = self->_title;
  }
  v5 = title;

  return v5;
}

- (id)loadRequest:(id)a3 userDriven:(BOOL)a4
{
  return [(LoadingController *)self loadRequest:a3 userDriven:a4 shouldOpenExternalURLs:0];
}

- (id)loadRequest:(id)a3 userDriven:(BOOL)a4 shouldOpenExternalURLs:(BOOL)a5
{
  return [(LoadingController *)self loadRequest:a3 userDriven:a4 shouldOpenExternalURLs:a5 eventAttribution:0];
}

- (id)loadRequest:(id)a3 userDriven:(BOOL)a4 shouldOpenExternalURLs:(BOOL)a5 eventAttribution:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!self->_webView)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[LoadingController loadRequest:userDriven:shouldOpenExternalURLs:eventAttribution:]((uint64_t)WeakRetained, v13);
    }
  }
  v14 = objc_msgSend(v10, "safari_requestBySettingIsUserInitiated:", 1);

  [WeakRetained loadingController:self willLoadRequest:v14 webView:self->_webView userDriven:v8];
  if (objc_opt_respondsToSelector()) {
    [(WKWebView *)self->_webView _setUIEventAttribution:v11];
  }
  long long v15 = [v14 URL];
  if (objc_msgSend(v15, "sf_isOfflineReadingListURL"))
  {
    webView = self->_webView;
    long long v17 = (void *)MEMORY[0x1E4F1CB10];
    long long v18 = [MEMORY[0x1E4FB60E8] readingListArchivesDirectoryPath];
    v19 = [v17 fileURLWithPath:v18 isDirectory:1];
    uint64_t v20 = [(WKWebView *)webView loadFileURL:v15 allowingReadAccessToURL:v19];

    v21 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v21 setBool:1 forKey:*MEMORY[0x1E4F78988]];
  }
  else
  {
    int v22 = objc_msgSend(v15, "sf_isTestWebArchiveURL");
    v23 = self->_webView;
    if (v22)
    {
      uint64_t v24 = [(WKWebView *)v23 loadFileURL:v15 allowingReadAccessToURL:v15];
    }
    else
    {
      if (v7) {
        [(WKWebView *)v23 _loadRequest:v14 shouldOpenExternalURLs:1];
      }
      else {
      uint64_t v24 = [(WKWebView *)v23 loadRequest:v14];
      }
    }
    uint64_t v20 = (void *)v24;
  }

  return v20;
}

- (void)goBack
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained loadingControllerWillStartUserDrivenLoad:self];

  id v4 = [(WKWebView *)self->_webView goBack];
}

- (void)goForward
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained loadingControllerWillStartUserDrivenLoad:self];

  id v4 = [(WKWebView *)self->_webView goForward];
}

- (void)reloadFromOrigin:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained loadingControllerWillStartUserDrivenLoad:self];

  webView = self->_webView;
  if (v3) {
    id v7 = [(WKWebView *)webView reloadFromOrigin];
  }
  else {
    id v8 = [(WKWebView *)webView reload];
  }
}

- (void)stopLoading
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (LoadingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LoadingControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)loadRequest:(uint64_t)a1 userDriven:(NSObject *)a2 shouldOpenExternalURLs:eventAttribution:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1E102C000, a2, OS_LOG_TYPE_FAULT, "LoadingController with delegate %p is being asked to load a request but does not have a web view", (uint8_t *)&v2, 0xCu);
}

@end