@interface _SFTouchIconFetchOperation
+ (id)deviceIdealDefaultTouchIconURLsWithURL:(id)a3;
- (id)webViewConfiguration;
- (void)didCreateWebView;
- (void)didFetchTouchIconURLs:(id)a3 andFaviconURLs:(id)a4 forURL:(id)a5;
@end

@implementation _SFTouchIconFetchOperation

+ (id)deviceIdealDefaultTouchIconURLsWithURL:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  [MEMORY[0x1E4F22478] _applicationIconCanvasSize];
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ldx%ld", (uint64_t)v6, (uint64_t)v7);
  v9 = [NSString stringWithFormat:@"/apple-touch-icon-%@-precomposed.png", v8];
  v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9 relativeToURL:v4];
  [v5 addObject:v10];

  v11 = [NSString stringWithFormat:@"/apple-touch-icon-%@.png", v8];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11 relativeToURL:v4];

  [v5 addObject:v12];

  return v5;
}

- (id)webViewConfiguration
{
  v6.receiver = self;
  v6.super_class = (Class)_SFTouchIconFetchOperation;
  v2 = [(WBSTouchIconFetchOperation *)&v6 webViewConfiguration];
  [v2 _setClientNavigationsRunAtForegroundPriority:1];
  v3 = _SFApplicationNameForUserAgent();
  [v2 setApplicationNameForUserAgent:v3];

  id v4 = objc_alloc_init(MEMORY[0x1E4F46688]);
  [v4 setJavaScriptEnabled:0];
  [v2 setPreferences:v4];

  return v2;
}

- (void)didCreateWebView
{
  v5.receiver = self;
  v5.super_class = (Class)_SFTouchIconFetchOperation;
  [(WBSTouchIconFetchOperation *)&v5 didCreateWebView];
  v3 = _SFCustomUserAgentStringIfNeeded();
  if (v3)
  {
    id v4 = [(WBSWebViewMetadataFetchOperation *)self webView];
    [v4 _setCustomUserAgent:v3];
  }
}

- (void)didFetchTouchIconURLs:(id)a3 andFaviconURLs:(id)a4 forURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() deviceIdealDefaultTouchIconURLsWithURL:v8];
  v12 = [v11 arrayByAddingObjectsFromArray:v10];

  v13.receiver = self;
  v13.super_class = (Class)_SFTouchIconFetchOperation;
  [(WBSTouchIconFetchOperation *)&v13 didFetchTouchIconURLs:v12 andFaviconURLs:v9 forURL:v8];
}

@end