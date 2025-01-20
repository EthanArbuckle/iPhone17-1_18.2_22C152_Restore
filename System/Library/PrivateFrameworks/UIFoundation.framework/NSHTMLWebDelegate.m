@interface NSHTMLWebDelegate
- (BOOL)loadDidFinish;
- (BOOL)loadDidSucceed;
- (NSHTMLWebDelegate)init;
- (NSHTMLWebDelegate)initWithBaseURL:(id)a3;
- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5;
- (id)webView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7;
- (void)dealloc;
- (void)decidePolicyForRequest:(id)a3 decisionListener:(id)a4;
- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4;
- (void)webView:(id)a3 resource:(id)a4 didReceiveAuthenticationChallenge:(id)a5 fromDataSource:(id)a6;
@end

@implementation NSHTMLWebDelegate

- (NSHTMLWebDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTMLWebDelegate;
  result = [(NSHTMLWebDelegate *)&v3 init];
  *(_WORD *)&result->_loadDidFinish = 0;
  return result;
}

- (NSHTMLWebDelegate)initWithBaseURL:(id)a3
{
  v4 = [(NSHTMLWebDelegate *)self init];
  v4->_baseURL = (NSURL *)a3;
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTMLWebDelegate;
  [(NSHTMLWebDelegate *)&v3 dealloc];
}

- (BOOL)loadDidFinish
{
  return self->_loadDidFinish;
}

- (BOOL)loadDidSucceed
{
  return self->_loadDidSucceed;
}

- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5
{
  if ((id)[a3 mainFrame] == a5) {
    self->_loadDidFinish = 1;
  }
  Current = CFRunLoopGetCurrent();

  CFRunLoopStop(Current);
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  if ((id)[a3 mainFrame] == a4) {
    *(_WORD *)&self->_loadDidFinish = 257;
  }
  Current = CFRunLoopGetCurrent();

  CFRunLoopStop(Current);
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  if ((id)[a3 mainFrame] == a5) {
    self->_loadDidFinish = 1;
  }
  Current = CFRunLoopGetCurrent();

  CFRunLoopStop(Current);
}

- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5
{
  return a4;
}

- (id)webView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  return a5;
}

- (void)webView:(id)a3 resource:(id)a4 didReceiveAuthenticationChallenge:(id)a5 fromDataSource:(id)a6
{
  v7 = objc_msgSend(a5, "sender", a3, a4);

  [v7 continueWithoutCredentialForAuthenticationChallenge:a5];
}

- (void)decidePolicyForRequest:(id)a3 decisionListener:(id)a4
{
  v6 = (NSURL *)[a3 URL];
  v7 = [(NSURL *)v6 scheme];
  if (v6
    && ((v8 = v7, v6 != self->_baseURL) ? (BOOL v9 = v7 == 0) : (BOOL v9 = 1),
        !v9
     && ([(NSString *)v7 isEqualToString:@"mailto"]
      || [(NSString *)v8 isEqualToString:@"rdar"]
      || [(NSString *)v8 isEqualToString:@"radar"])
     && ([(NSURL *)v6 isEqual:self->_baseURL] & 1) == 0
     && ![[(NSURL *)v6 absoluteURL] isEqual:[(NSURL *)self->_baseURL absoluteURL]]))
  {
    [a4 ignore];
  }
  else
  {
    [a4 use];
  }
}

- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7
{
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  if (!objc_msgSend(a6, "frameElement", a3, a4)) {
    goto LABEL_10;
  }
  if (webView_decidePolicyForNavigationAction_request_frame_decisionListener__onceToken != -1) {
    dispatch_once(&webView_decidePolicyForNavigationAction_request_frame_decisionListener__onceToken, &__block_literal_global_33);
  }
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10 = (void *)[a5 URL]) != 0
    && [v10 isFileURL])
  {
    [a7 ignore];
  }
  else
  {
LABEL_10:
    [(NSHTMLWebDelegate *)self decidePolicyForRequest:a5 decisionListener:a7];
  }
}

Class __92__NSHTMLWebDelegate_webView_decidePolicyForNavigationAction_request_frame_decisionListener___block_invoke()
{
  Class result = NSClassFromString((NSString *)@"DOMHTMLIFrameElement");
  webView_decidePolicyForNavigationAction_request_frame_decisionListener__iframeElementClass = (uint64_t)result;
  return result;
}

- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
}

@end