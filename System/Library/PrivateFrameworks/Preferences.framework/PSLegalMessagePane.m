@interface PSLegalMessagePane
- (BOOL)handlesDoneButton;
- (BOOL)shouldInsetContent;
- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5;
- (PSLegalMessagePane)initWithFrame:(CGRect)a3;
- (id)htmlFileLocation;
- (id)markupString;
- (id)scrollViewToBeInsetted;
- (void)dealloc;
- (void)layoutInsetContent:(CGRect)a3;
- (void)viewDidBecomeVisible;
- (void)webViewDidFinishLoad:(id)a3;
@end

@implementation PSLegalMessagePane

- (PSLegalMessagePane)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PSLegalMessagePane;
  v7 = -[PSEditingPane initWithFrame:](&v23, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(PSLegalMessagePane *)v7 markupString];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = &stru_1EFB51FD0;
    }
    else
    {
      v11 = [(PSLegalMessagePane *)v8 htmlFileLocation];
      id v22 = 0;
      v10 = (void *)[[NSString alloc] initWithContentsOfFile:v11 encoding:4 error:&v22];
      id v21 = v22;
      if (v21)
      {
        v15 = v21;
        v16 = _PSLoggingFacility();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          int v25 = 36;
          __int16 v26 = 2080;
          v27 = "-[PSLegalMessagePane initWithFrame:]";
          __int16 v28 = 2112;
          v29 = v15;
          _os_log_impl(&dword_1A6597000, v16, OS_LOG_TYPE_DEFAULT, "%d %s %@", buf, 0x1Cu);
        }
        goto LABEL_5;
      }
    }
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F43050]), "initWithFrame:", x, y, width, height);
    webView = v8->_webView;
    v8->_webView = (UIWebView *)v12;

    [(UIWebView *)v8->_webView setAutoresizingMask:18];
    [(UIWebView *)v8->_webView setDelegate:v8];
    [(UIWebView *)v8->_webView setDataDetectorTypes:0];
    [(UIWebView *)v8->_webView _setDrawsCheckeredPattern:0];
    v14 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIWebView *)v8->_webView setBackgroundColor:v14];

    [(PSLegalMessagePane *)v8 addSubview:v8->_webView];
    v15 = [(UIWebView *)v8->_webView _browserView];
    [v15 setTilesOpaque:0];
    [v15 setLoadsSynchronously:1];
    [v15 setDetectsPhoneNumbers:0];
    v16 = [(UIWebView *)v8->_webView _scrollView];
    v17 = [MEMORY[0x1E4F428B8] whiteColor];
    [v16 setBackgroundColor:v17];

    [v16 _setShowsBackgroundShadow:0];
    [v16 setDecelerationRate:0.998];
    v18 = v8->_webView;
    v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
    [(UIWebView *)v18 loadHTMLString:v10 baseURL:v19];

LABEL_5:
  }
  return v8;
}

- (BOOL)shouldInsetContent
{
  return 0;
}

- (BOOL)handlesDoneButton
{
  return 0;
}

- (id)markupString
{
  return 0;
}

- (id)htmlFileLocation
{
  return 0;
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  if (!a5)
  {
    v6 = (void *)MEMORY[0x1E4F42738];
    id v7 = a4;
    v8 = [v6 sharedApplication];
    uint64_t v9 = [v7 URL];

    [v8 openURL:v9 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
  return a5 != 0;
}

- (void)webViewDidFinishLoad:(id)a3
{
  id v19 = a3;
  v3 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v3 pointSize];
  double v5 = v4;

  [MEMORY[0x1E4F42A30] systemFontSize];
  if (v5 != v6)
  {
    float v7 = v5 / v6 * 100.0;
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='%f%%'", floorf(v7));
    id v9 = (id)[v19 stringByEvaluatingJavaScriptFromString:v8];
    v10 = [v19 stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"];
    [v10 floatValue];
    float v12 = v11;
    int v13 = LODWORD(v11);

    v14 = [v19 scrollView];
    v15 = v14;
    if (v13 >= 0 && ((v13 & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E || (v13 - 1) <= 0x7FFFFE)
    {
      [v14 contentSize];
      if (v18 != v12)
      {
        [v15 contentSize];
        objc_msgSend(v15, "setContentSize:");
      }
    }
  }
}

- (void)viewDidBecomeVisible
{
  v3 = [(UIWebView *)self->_webView scrollView];
  [v3 frame];
  double v5 = v4;

  id v8 = [(UIWebView *)self->_webView _browserView];
  [v8 frame];
  if (v6 != v5) {
    objc_msgSend(v8, "setFrame:");
  }
  float v7 = [(UIWebView *)self->_webView _scrollView];
  [v7 flashScrollIndicators];
}

- (void)dealloc
{
  [(UIWebView *)self->_webView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PSLegalMessagePane;
  [(PSLegalMessagePane *)&v3 dealloc];
}

- (id)scrollViewToBeInsetted
{
  return [(UIWebView *)self->_webView scrollView];
}

- (void)layoutInsetContent:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  webView = self->_webView;
  double v8 = PSTableViewSideInset();
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRect v11 = CGRectInset(v10, v8, 0.0);
  -[UIWebView setFrame:](webView, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
}

- (void).cxx_destruct
{
}

@end