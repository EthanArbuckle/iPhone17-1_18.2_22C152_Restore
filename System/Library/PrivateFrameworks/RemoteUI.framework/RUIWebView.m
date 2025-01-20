@interface RUIWebView
- (BOOL)_isScrollEnabled;
- (NSString)html;
- (NSURL)baseURL;
- (id)delegate;
- (id)scriptForDisableMagnification;
- (id)sourceURL;
- (id)userStyleSheet;
- (id)webView;
- (void)dealloc;
- (void)setBaseURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHtml:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation RUIWebView

- (void)setDelegate:(id)a3
{
}

- (id)webView
{
  webView = self->_webView;
  if (!webView)
  {
    v4 = objc_opt_new();
    v5 = [(RUIWebView *)self scriptForDisableMagnification];
    [v4 addUserScript:v5];

    id v6 = objc_alloc(MEMORY[0x263F1FAC0]);
    v7 = [(RUIWebView *)self userStyleSheet];
    v8 = (void *)[v6 initWithSource:v7 forMainFrameOnly:0];

    [v4 _addUserStyleSheet:v8];
    v9 = objc_opt_new();
    [v9 setUserContentController:v4];
    [v9 setDataDetectorTypes:0];
    [v9 setAllowsInlineMediaPlayback:1];
    [v9 setMediaTypesRequiringUserActionForPlayback:1];
    v10 = objc_opt_new();
    [v10 _setTextAutosizingEnabled:0];
    [v9 setPreferences:v10];
    +[RUIPlatform assertWebkitAllowed];
    id v11 = objc_alloc(MEMORY[0x263F1FA58]);
    v12 = (WKWebView *)objc_msgSend(v11, "initWithFrame:configuration:", v9, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v13 = self->_webView;
    self->_webView = v12;

    [(WKWebView *)self->_webView setOpaque:0];
    [(WKWebView *)self->_webView setNavigationDelegate:self];
    v14 = [(WKWebView *)self->_webView scrollView];
    [v14 _setShowsBackgroundShadow:0];

    html = self->_html;
    if (html) {
      id v16 = [(WKWebView *)self->_webView loadHTMLString:html baseURL:self->_baseURL];
    }

    webView = self->_webView;
  }
  return webView;
}

- (BOOL)_isScrollEnabled
{
  v2 = [(RUIElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"scrollEnabled"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setHtml:(id)a3
{
  id v10 = a3;
  if (([v10 isEqualToString:self->_html] & 1) == 0)
  {
    char v4 = (NSString *)[v10 copy];
    html = self->_html;
    self->_html = v4;

    baseURL = self->_baseURL;
    if (!baseURL)
    {
      v7 = +[RUIHTTPRequest safeBaseURL];
      v8 = self->_baseURL;
      self->_baseURL = v7;

      baseURL = self->_baseURL;
    }
    id v9 = [(WKWebView *)self->_webView loadHTMLString:v10 baseURL:baseURL];
  }
}

- (id)sourceURL
{
  return self->_baseURL;
}

- (id)scriptForDisableMagnification
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1FA40]), "initWithSource:injectionTime:forMainFrameOnly:", @"var meta = document.createElement('meta');     meta.name = 'viewport';     meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';     var head = document.getElementsByTagName('head')[0];    head.appendChild(meta);",
                 1,
                 0);
  return v2;
}

- (id)userStyleSheet
{
  return @":root {color-scheme: light dark;} body {word-break: break-word; font-family: -apple-system-font;} .label, .description { color: -apple-system-label; font-family: -apple-system-font; } .label-bold { color: -apple-system-label; font-family: -apple-system-font; font-weight: 600; }";
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  p_delegate = &self->_delegate;
  v12 = (void (**)(id, void))a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(p_delegate);
  id v10 = [v8 request];
  uint64_t v11 = [v8 navigationType];

  LODWORD(v8) = [WeakRetained webViewOM:self shouldStartLoadWithRequest:v10 navigationType:v11];
  v12[2](v12, v8);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:RUIWebViewDidFinishLoadNotification object:0];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4, a5);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:RUIWebViewDidFinishLoadNotification object:0];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4, a5);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:RUIWebViewDidFinishLoadNotification object:0];
}

- (void)dealloc
{
  [(WKWebView *)self->_webView setNavigationDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)RUIWebView;
  [(RUIElement *)&v3 dealloc];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (NSString)html
{
  return self->_html;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_html, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end