@interface GQUWebView
+ (id)_createWebPreferencesForRendering;
+ (void)disableFrameScrollingRecursively:(id)a3;
- (BOOL)_validateURL:(id)a3;
- (GQUWebView)initWithFrame:(CGRect)a3;
- (id)_urlToDownloadFromURL:(id)a3;
- (id)webView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7;
- (void)dealloc;
- (void)loadDataSynchronously:(id)a3 textEncodingName:(id)a4 resources:(id)a5;
- (void)setHasAttachments:(BOOL)a3;
- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5;
@end

@implementation GQUWebView

+ (id)_createWebPreferencesForRendering
{
  id v2 = [objc_alloc((Class)WebPreferences) initWithIdentifier:@"com.apple.quicklook.utility"];
  [v2 setPlugInsEnabled:0];
  [v2 setJavaEnabled:0];
  [v2 setJavaScriptEnabled:0];
  [v2 setJavaScriptCanOpenWindowsAutomatically:0];
  [v2 setAllowsAnimatedImages:0];
  [v2 setAllowsAnimatedImageLooping:0];
  [v2 setLoadsImagesAutomatically:1];
  return v2;
}

- (GQUWebView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GQUWebView;
  v3 = -[GQUWebView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [(id)objc_opt_class() _createWebPreferencesForRendering];
    [(GQUWebView *)v3 setPreferences:v4];

    [(GQUWebView *)v3 setFrameLoadDelegate:v3];
    [(GQUWebView *)v3 setResourceLoadDelegate:v3];
    [(GQUWebView *)v3 setPolicyDelegate:v3];
  }
  return v3;
}

- (void)dealloc
{
  [(GQUWebView *)self setFrameLoadDelegate:0];
  [(GQUWebView *)self setResourceLoadDelegate:0];
  [(GQUWebView *)self setPolicyDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)GQUWebView;
  [(GQUWebView *)&v3 dealloc];
}

- (void)setHasAttachments:(BOOL)a3
{
  self->mHasAttachments = a3;
}

- (void)loadDataSynchronously:(id)a3 textEncodingName:(id)a4 resources:(id)a5
{
  if ((byte_A42A8 & 1) == 0)
  {
    +[NSURLProtocol registerClass:objc_opt_class()];
    byte_A42A8 = 1;
  }
  +[GQUSimpleURLProtocol setResourcesDictionary:a5];
  [(GQUWebView *)self setHasAttachments:1];
  [(GQUWebView *)self stopLoading:0];
  objc_msgSend(-[GQUWebView mainFrame](self, "mainFrame"), "loadData:MIMEType:textEncodingName:baseURL:", a3, @"text/html", a4, 0);
  objc_msgSend(+[GQUWebViewWaiter waiter](GQUWebViewWaiter, "waiter"), "waitForWebViewToFinishLoading:", self);
  [(GQUWebView *)self stopLoading:0];
  [(GQUWebView *)self setHasAttachments:0];
  +[GQUSimpleURLProtocol setResourcesDictionary:0];
}

- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5
{
  if ([(GQUWebView *)self mainFrame] == a5)
  {
    [(GQUWebView *)self stopLoading:0];
  }
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  if ([(GQUWebView *)self mainFrame] == a5)
  {
    [(GQUWebView *)self stopLoading:0];
  }
}

- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  if ([(id)objc_opt_class() canShowMIMEType:a4]
    || (id v9 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "URL"), "path"), "pathExtension")) != 0
    && ![v9 caseInsensitiveCompare:@"html"])
  {
    [a7 use];
  }
  else
  {
    [a7 ignore];
  }
}

- (BOOL)_validateURL:(id)a3
{
  id v5 = [a3 scheme];
  objc_super v6 = v5;
  if (self->mHasAttachments && ([v5 isEqual:off_9CBA0] & 1) != 0
    || ([a3 isFileURL] & 1) != 0
    || ([v6 isEqual:@"about"] & 1) != 0
    || ([v6 isEqual:@"applewebdata"] & 1) != 0)
  {
    return 1;
  }
  return [v6 isEqual:@"data"];
}

- (id)_urlToDownloadFromURL:(id)a3
{
  id v4 = [a3 scheme];
  if (([a3 isFileURL] & 1) != 0
    || ([v4 isEqual:@"about"] & 1) != 0
    || ([v4 isEqual:@"applewebdata"] & 1) != 0
    || ([v4 isEqual:@"data"] & 1) != 0
    || ([v4 isEqual:off_9CBA0] & 1) != 0)
  {
    return a3;
  }
  return +[NSURL URLWithString:@"about:"];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  if (-[GQUWebView _validateURL:](self, "_validateURL:", objc_msgSend(a5, "URL", a3, a4)))
  {
    [a7 use];
  }
  else
  {
    [a7 ignore];
  }
}

- (id)webView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  id v9 = objc_msgSend(a5, "URL", a3, a4);
  id v10 = [(GQUWebView *)self _urlToDownloadFromURL:v9];
  if (v10 == v9) {
    return a5;
  }
  return +[NSURLRequest requestWithURL:v10];
}

+ (void)disableFrameScrollingRecursively:(id)a3
{
  objc_msgSend(objc_msgSend(a3, "frameView"), "setAllowsScrolling:", 0);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = objc_msgSend(a3, "childFrames", 0);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [a1 disableFrameScrollingRecursively:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end