@interface PSWebContainerView
- (BOOL)uiWebView:(id)a3 previewIsAllowedForPosition:(CGPoint)a4;
- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5;
- (NSData)content;
- (PSWebContainerView)init;
- (UIWebView)webView;
- (double)heightForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setContent:(id)a3;
- (void)setUserStyleSheet:(id)a3;
@end

@implementation PSWebContainerView

- (PSWebContainerView)init
{
  v19.receiver = self;
  v19.super_class = (Class)PSWebContainerView;
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v6 = -[PSWebContainerView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v3, v4, v5);
  if (v6)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F43050]), "initWithFrame:", v2, v3, v4, v5);
    webView = v6->_webView;
    v6->_webView = (UIWebView *)v7;

    [(UIWebView *)v6->_webView setDelegate:v6];
    v9 = v6->_webView;
    v10 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIWebView *)v9 setBackgroundColor:v10];

    [(UIWebView *)v6->_webView setOpaque:0];
    v11 = [(UIWebView *)v6->_webView _browserView];
    [v11 setAutoresizes:0];
    LODWORD(v12) = 1.0;
    [v11 setInitialScale:0xFFFFFFLL forDocumentTypes:v12];
    LODWORD(v13) = 1.0;
    [v11 setMinimumScale:0xFFFFFFLL forDocumentTypes:v13];
    LODWORD(v14) = 1.0;
    [v11 setMaximumScale:0xFFFFFFLL forDocumentTypes:v14];
    [v11 setLoadsSynchronously:1];
    [v11 setDoubleTapEnabled:0];
    [v11 resetSelectionAssistant];
    [(PSWebContainerView *)v6 setUserStyleSheet:&stru_1EFB51FD0];
    [(UIWebView *)v6->_webView setDataDetectorTypes:0];
    v15 = [(UIWebView *)v6->_webView _scrollView];
    [v15 _setShowsBackgroundShadow:0];

    v16 = [(UIWebView *)v6->_webView _scrollView];
    [v16 setBounces:0];

    v17 = [(UIWebView *)v6->_webView _scrollView];
    [v17 setScrollEnabled:0];

    [(PSWebContainerView *)v6 setAutoresizingMask:18];
    [(PSWebContainerView *)v6 setClipsToBounds:1];
    [(PSWebContainerView *)v6 addSubview:v6->_webView];
  }
  return v6;
}

- (void)setUserStyleSheet:(id)a3
{
  webView = self->_webView;
  id v4 = a3;
  id v11 = [(UIWebView *)webView _browserView];
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
  uint64_t v7 = [v6 markupDescription];
  v8 = [MEMORY[0x1E4F428B8] tableCellBlueTextColor];
  v9 = [v8 styleString];
  v10 = (void *)[v5 initWithFormat:@"body { %@; } a { text-decoration:none; color:%@; }", v7, v9];

  [v10 appendString:v4];
  [v11 setUserStyleSheet:v10];
}

- (void)setContent:(id)a3
{
  p_content = &self->_content;
  v10 = (NSData *)a3;
  if (*p_content != v10)
  {
    objc_storeStrong((id *)&self->_content, a3);
    if (*p_content)
    {
      v6 = (void *)[[NSString alloc] initWithData:*p_content encoding:4];
      uint64_t v7 = [(PSWebContainerView *)self semanticContentAttribute];
      webView = self->_webView;
      if (v7 == 4)
      {
        v9 = [NSString stringWithFormat:@"<div dir='rtl'>%@<div>", v6];
        [(UIWebView *)webView loadHTMLString:v9 baseURL:0];
      }
      else
      {
        [(UIWebView *)webView loadHTMLString:v6 baseURL:0];
      }
    }
  }
}

- (void)layoutSubviews
{
  [(PSWebContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIWebView setFrame:](self->_webView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  id v20 = [(UIWebView *)self->_webView _browserView];
  objc_msgSend(v20, "setViewportSize:forDocumentTypes:", 0xFFFFFFLL, v4, v6);
  [v20 frame];
  double v8 = v7;
  double v10 = v9;
  objc_msgSend(v20, "setFrame:");
  id v11 = [(UIWebView *)self->_webView _browserView];
  double v12 = [v11 webView];
  double v13 = [v12 mainFrame];
  [v13 forceLayoutAdjustingViewSize:1];

  double v14 = [v20 webView];
  v15 = [v14 mainFrame];
  v16 = [v15 frameView];
  v17 = [v16 documentView];
  [v17 frame];
  double v19 = v18;

  objc_msgSend(v20, "setFrame:", v8, v10, v4, v19);
}

- (double)heightForWidth:(double)a3
{
  double v4 = [(UIWebView *)self->_webView _browserView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, a3, 0.0);
  double v13 = [v4 webView];
  double v14 = [v13 mainFrame];
  [v14 forceLayoutAdjustingViewSize:1];

  v15 = [v4 webView];
  v16 = [v15 mainFrame];
  v17 = [v16 frameView];
  double v18 = [v17 documentView];
  [v18 frame];
  double v20 = v19;

  objc_msgSend(v4, "setFrame:", v6, v8, v10, v12);
  return v20;
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  if (!a5)
  {
    double v6 = (void *)MEMORY[0x1E4F42738];
    id v7 = a4;
    double v8 = [v6 sharedApplication];
    double v9 = [v7 URL];

    [v8 openURL:v9 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
  return a5 != 0;
}

- (BOOL)uiWebView:(id)a3 previewIsAllowedForPosition:(CGPoint)a4
{
  return 0;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (NSData)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end