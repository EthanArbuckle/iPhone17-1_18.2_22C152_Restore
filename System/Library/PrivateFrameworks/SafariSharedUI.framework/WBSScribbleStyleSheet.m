@interface WBSScribbleStyleSheet
- (WBSScribbleStyleSheet)initWithSource:(id)a3 webView:(id)a4 host:(id)a5;
- (WKWebView)webView;
- (void)setWebView:(id)a3;
@end

@implementation WBSScribbleStyleSheet

- (WBSScribbleStyleSheet)initWithSource:(id)a3 webView:(id)a4 host:(id)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = NSString;
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 stringWithFormat:@"http://%@/*", v10];
  v22[0] = v12;
  v13 = [NSString stringWithFormat:@"https://%@/*", v10];
  v22[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

  v15 = (void *)MEMORY[0x1E4F46678];
  v16 = [NSString stringWithFormat:@"safari-scribble-%@", v10];

  v17 = [v15 worldWithName:v16];

  v21.receiver = self;
  v21.super_class = (Class)WBSScribbleStyleSheet;
  v18 = [(_WKUserStyleSheet *)&v21 initWithSource:v11 forWKWebView:v8 forMainFrameOnly:1 includeMatchPatternStrings:v14 excludeMatchPatternStrings:0 baseURL:0 level:0 contentWorld:v17];

  if (v18)
  {
    objc_storeWeak((id *)&v18->_webView, v8);
    v19 = v18;
  }

  return v18;
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  return (WKWebView *)WeakRetained;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end