@interface RUIWebContainerView
- (BOOL)_handleJavascriptBridgeRequest:(id)a3;
- (BOOL)isHighlighted;
- (BOOL)uiWebView:(id)a3 previewIsAllowedForPosition:(CGPoint)a4;
- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5;
- (CGSize)intrinsicContentSize;
- (RUIWebContainerView)initWithContent:(id)a3 baseURL:(id)a4;
- (RUIWebContainerViewDelegate)delegate;
- (UIWebView)webView;
- (double)heightForWidth:(double)a3;
- (id)_jsBridgeURLWithPath:(id)a3;
- (void)_addContentChangeObservingScript;
- (void)_setHighlightedNow;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setUserStyleSheet:(id)a3;
- (void)updateContent:(id)a3;
- (void)updateContent:(id)a3 baseURL:(id)a4;
- (void)webViewDidFinishLoad:(id)a3;
@end

@implementation RUIWebContainerView

- (RUIWebContainerView)initWithContent:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)RUIWebContainerView;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12 = -[RUIWebContainerView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x263F001A8], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseURL, a4);
    +[RUIPlatform assertWebkitAllowed];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F82E78]), "initWithFrame:", v8, v9, v10, v11);
    webView = v13->_webView;
    v13->_webView = (UIWebView *)v14;

    v16 = v13->_webView;
    v17 = [MEMORY[0x263F825C8] clearColor];
    [(UIWebView *)v16 setBackgroundColor:v17];

    [(UIWebView *)v13->_webView setOpaque:0];
    [(UIWebView *)v13->_webView setDelegate:v13];
    WebThreadLock();
    v18 = [(UIWebView *)v13->_webView _browserView];
    [v18 setAutoresizes:0];
    LODWORD(v19) = 1.0;
    [v18 setInitialScale:0xFFFFFFLL forDocumentTypes:v19];
    LODWORD(v20) = 1.0;
    [v18 setMinimumScale:0xFFFFFFLL forDocumentTypes:v20];
    LODWORD(v21) = 1.0;
    [v18 setMaximumScale:0xFFFFFFLL forDocumentTypes:v21];
    [v18 setLoadsSynchronously:1];
    [v18 setDoubleTapEnabled:0];
    [v18 resetSelectionAssistant];
    [v18 setAllowsImageSheet:0];
    [v18 setAllowsLinkSheet:0];
    v22 = [v18 webView];
    [v22 _setUseSystemAppearance:1];

    [(RUIWebContainerView *)v13 setUserStyleSheet:&stru_26C545B50];
    [(UIWebView *)v13->_webView loadData:v6 MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:v7];
    [v18 resetSelectionAssistant];
    [(UIWebView *)v13->_webView setDataDetectorTypes:0];
    v23 = [(UIWebView *)v13->_webView _scrollView];
    [v23 _setShowsBackgroundShadow:0];

    v24 = [(UIWebView *)v13->_webView _scrollView];
    [v24 setBounces:0];

    v25 = [(UIWebView *)v13->_webView _scrollView];
    [v25 setScrollEnabled:0];

    [(RUIWebContainerView *)v13 setAutoresizingMask:18];
    [(RUIWebContainerView *)v13 addSubview:v13->_webView];
  }
  return v13;
}

- (void)updateContent:(id)a3
{
}

- (void)updateContent:(id)a3 baseURL:(id)a4
{
  objc_storeStrong((id *)&self->_baseURL, a4);
  id v7 = a4;
  id v8 = a3;
  [(UIWebView *)self->_webView loadData:v8 MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:v7];

  [(RUIWebContainerView *)self invalidateIntrinsicContentSize];
  [(RUIWebContainerView *)self setNeedsLayout];
}

- (void)setUserStyleSheet:(id)a3
{
  id v4 = a3;
  WebThreadLock();
  id v11 = [(UIWebView *)self->_webView _browserView];
  id v5 = objc_alloc(MEMORY[0x263F089D8]);
  id v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
  id v7 = [v6 markupDescription];
  id v8 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
  double v9 = [v8 styleString];
  double v10 = objc_msgSend(v5, "initWithFormat:", @"body { margin:0; padding:0; %@; word-break: break-word; } a { text-decoration:none; color: %@; }",
                  v7,
                  v9);

  [v10 appendString:v4];
  [v11 setUserStyleSheet:v10];
}

- (void)layoutSubviews
{
  [(RUIWebContainerView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v8 = v3;
  if (v6 != self->_size.width || v3 != self->_size.height) {
    [(RUIWebContainerView *)self invalidateIntrinsicContentSize];
  }
  self->_size.width = v7;
  self->_size.height = v8;
  -[UIWebView setFrame:](self->_webView, "setFrame:", v5, 0.0, v7, v8);
  WebThreadLock();
  id v23 = [(UIWebView *)self->_webView _browserView];
  objc_msgSend(v23, "setViewportSize:forDocumentTypes:", 0xFFFFFFLL, v7, v8);
  [v23 frame];
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(v23, "setFrame:");
  uint64_t v14 = [(UIWebView *)self->_webView _browserView];
  v15 = [v14 webView];
  v16 = [v15 mainFrame];
  [v16 forceLayoutAdjustingViewSize:1];

  v17 = [v23 webView];
  v18 = [v17 mainFrame];
  double v19 = [v18 frameView];
  double v20 = [v19 documentView];
  [v20 frame];
  double v22 = v21;

  objc_msgSend(v23, "setFrame:", v11, v13, v7, v22);
}

- (void)_setHighlightedNow
{
  BOOL highlighted = self->_highlighted;
  if (self->_reallyHighlighted != highlighted)
  {
    self->_reallyHighlighted = highlighted;
    WebThreadLock();
    double v4 = [(UIWebView *)self->_webView _browserView];
    id v10 = [v4 webView];

    double v5 = [v10 windowScriptObject];
    double v6 = (void *)MEMORY[0x263EFF8C0];
    double v7 = [NSNumber numberWithBool:self->_reallyHighlighted];
    double v8 = [v6 arrayWithObject:v7];
    id v9 = (id)[v5 callWebScriptMethod:@"setHighlighted" withArguments:v8];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_BOOL highlighted = a3;
    if (a3)
    {
      [(RUIWebContainerView *)self _setHighlightedNow];
      double v4 = (void *)MEMORY[0x263F8C6D0];
      [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel_unhighlight object:0];
    }
    else
    {
      [(RUIWebContainerView *)self performSelector:sel__setHighlightedNow withObject:0 afterDelay:0.0];
    }
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (double)heightForWidth:(double)a3
{
  double v3 = 0.0;
  if (a3 != 0.0)
  {
    WebThreadLock();
    double v6 = [(UIWebView *)self->_webView _browserView];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    objc_msgSend(v6, "setFrame:", 0.0, 0.0, a3, 0.0);
    v15 = [v6 webView];
    v16 = [v15 mainFrame];
    [v16 forceLayoutAdjustingViewSize:1];

    v17 = [v6 webView];
    v18 = [v17 mainFrame];
    double v19 = [v18 frameView];
    double v20 = [v19 documentView];
    [v20 frame];
    double v3 = v21;

    objc_msgSend(v6, "setFrame:", v8, v10, v12, v14);
    double v22 = [v6 webView];
    id v23 = [v22 mainFrame];
    [v23 forceLayoutAdjustingViewSize:1];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v3 = *MEMORY[0x263F83C20];
  [(RUIWebContainerView *)self bounds];
  [(RUIWebContainerView *)self heightForWidth:v4];
  double v6 = v5;
  double v7 = v3;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)_jsBridgeURLWithPath:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x263F08BA0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScheme:@"remoteui"];
  [v5 setPath:v4];

  double v6 = [v5 URL];

  return v6;
}

- (void)_addContentChangeObservingScript
{
  id v7 = [(RUIWebContainerView *)self _jsBridgeURLWithPath:@"/contentDidChange"];
  double v3 = NSString;
  id v4 = [v7 absoluteString];
  objc_msgSend(v3, "stringWithFormat:", @"         (function(){             function loadURLInFrame(src){                 var rootElement = document.documentElement;                 var frame = document.createElement('IFRAME');                 frame.style.width = 0;                 frame.style.height = 0;                 frame.setAttribute('src', src);                 rootElement.appendChild(frame);                 frame.parentNode.removeChild(frame);             }                         var mutationObserver = new MutationObserver(function() {                 loadURLInFrame('%@');             });                         var elementToObserve = document.body;             mutationObserver.observe(elementToObserve, {subtree: true, childList: true});         })();     ",
  id v5 = v4);

  id v6 = [(UIWebView *)self->_webView stringByEvaluatingJavaScriptFromString:v5];
}

- (void)webViewDidFinishLoad:(id)a3
{
  id v6 = a3;
  id v4 = [v6 stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('html')[0].getAttribute('dir')"];
  if (![v4 length]) {
    id v5 = (id)[v6 stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('html')[0].setAttribute('dir', 'auto')"];
  }
  [(RUIWebContainerView *)self _addContentChangeObservingScript];
}

- (BOOL)_handleJavascriptBridgeRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 URL];
  id v6 = [v5 scheme];
  int v7 = [v6 isEqualToString:@"remoteui"];

  if (!v7) {
    goto LABEL_14;
  }
  if (_isInternalInstall())
  {
    double v8 = _RUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = [v4 URL];
      int v19 = 138412290;
      double v20 = v9;
      _os_log_impl(&dword_2144F2000, v8, OS_LOG_TYPE_DEFAULT, "handling webview javascript bridge request with url: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  double v10 = [v4 URL];
  double v11 = [v10 path];
  int v12 = [v11 isEqualToString:@"/contentDidChange"];

  if (v12)
  {
    if (_isInternalInstall())
    {
      double v13 = _RUILoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_2144F2000, v13, OS_LOG_TYPE_DEFAULT, "webview content did change, notifying delegate", (uint8_t *)&v19, 2u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 webContainerViewContentDidChange:self];
    }
    BOOL v17 = 1;
  }
  else
  {
LABEL_14:
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  id v7 = a4;
  if (![(RUIWebContainerView *)self _handleJavascriptBridgeRequest:v7])
  {
    if (a5 == 5)
    {
      BOOL v10 = 1;
      goto LABEL_6;
    }
    if (!a5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      double v9 = [v7 URL];
      [WeakRetained webContainerView:self didClickLinkWithURL:v9];
    }
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (BOOL)uiWebView:(id)a3 previewIsAllowedForPosition:(CGPoint)a4
{
  return 0;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (RUIWebContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIWebContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end