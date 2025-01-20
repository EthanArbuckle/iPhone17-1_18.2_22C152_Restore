@interface THWWebBridgeController
+ (id)pParameterStringFromParameterArray:(id)a3 addQuoting:(BOOL)a4;
+ (id)parseQuery:(id)a3;
- (BOOL)handleURL:(id)a3;
- (BOOL)injectedWidgetObject;
- (BOOL)p_injectFileContents:(id)a3;
- (THWPlatformWebViewProtocol)webView;
- (THWWebBridgeController)initWithView:(id)a3;
- (THWWebJSControllerDelegate)javascriptHandler;
- (TSWNativeCommandDispatcher)optionalDispatcher;
- (id)callBrowserObject:(id)a3 methodName:(id)a4 parameterString:(id)a5 addQuoting:(BOOL)a6;
- (id)callBrowserObject:(id)a3 methodName:(id)a4 parameters:(id)a5 addQuoting:(BOOL)a6;
- (id)stringByEvaluatingJavaScriptFromFile:(id)a3;
- (void)callBrowserWithURLEncoding:(id)a3;
- (void)dealloc;
- (void)ensureWidgetObjectInjected;
- (void)pServeWidgetControllerRequest:(id)a3;
- (void)setInjectedWidgetObject:(BOOL)a3;
- (void)setJavascriptHandler:(id)a3;
- (void)setOptionalDispatcher:(id)a3;
- (void)setWebView:(id)a3;
- (void)tellBrowserDidEnterWidgetMode:(int)a3;
- (void)tellBrowserToPauseAudioVisual;
- (void)tellBrowserWillEnterWidgetMode:(int)a3;
@end

@implementation THWWebBridgeController

- (THWWebBridgeController)initWithView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THWWebBridgeController;
  v4 = [(THWWebBridgeController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(THWWebBridgeController *)v4 setWebView:a3];
    [(THWWebBridgeController *)v5 setInjectedWidgetObject:0];
  }
  return v5;
}

- (void)dealloc
{
  [(THWWebBridgeController *)self setWebView:0];
  v3.receiver = self;
  v3.super_class = (Class)THWWebBridgeController;
  [(THWWebBridgeController *)&v3 dealloc];
}

- (BOOL)handleURL:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", @"apb"))
  {
    id v5 = [a3 relativePath];
    if (v5)
    {
      v6 = v5;
      if ([v5 length])
      {
        if ([a3 query])
        {
          id v7 = [v6 substringFromIndex:1];
          if ([v7 isEqualToString:@"js"])
          {
            [(THWWebBridgeController *)self callBrowserWithURLEncoding:a3];
          }
          else if (([v7 isEqualToString:@"getpref"] & 1) == 0 {
                 && ([v7 isEqualToString:@"setpref"] & 1) == 0
          }
                 && [v7 isEqualToString:@"do"])
          {
            [(THWWebBridgeController *)self pServeWidgetControllerRequest:a3];
          }
        }
      }
    }
    LOBYTE(v8) = 1;
  }
  else
  {
    unsigned int v8 = objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", @"ibooks");
    if (v8)
    {
      [(THWPlatformWebViewProtocol *)[(THWWebBridgeController *)self webView] webViewDelegate];
      if (objc_opt_respondsToSelector())
      {
        id v9 = [(THWPlatformWebViewProtocol *)[(THWWebBridgeController *)self webView] webViewDelegate];
        v10 = [(THWWebBridgeController *)self webView];
        LOBYTE(v8) = [v9 webView:v10 handleURL:a3];
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
  }
  return v8;
}

+ (id)parseQuery:(id)a3
{
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  id v5 = [a3 componentsSeparatedByString:@"&"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) componentsSeparatedByString:@"="];
        id v11 = objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 0), "stringByRemovingPercentEncoding");
        if ((unint64_t)[v10 count] < 2) {
          v12 = +[NSNull null];
        }
        else {
          v12 = (NSNull *)objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 1), "stringByRemovingPercentEncoding");
        }
        [v4 setObject:v12 forKey:v11];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  return v4;
}

- (void)callBrowserWithURLEncoding:(id)a3
{
  id v5 = [a3 query];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() parseQuery:v5];
    if (objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", @"apb"))
    {
      id v7 = [v6 objectForKey:@"o"];
      id v8 = [v6 objectForKey:@"m"];
      id v9 = (NSNull *)[v6 objectForKey:@"p"];
      if (v9 == +[NSNull null]) {
        id v10 = 0;
      }
      else {
        id v10 = v9;
      }
      [(THWWebBridgeController *)self callBrowserObject:v7 methodName:v8 parameterString:v10 addQuoting:0];
    }
  }
}

- (id)callBrowserObject:(id)a3 methodName:(id)a4 parameterString:(id)a5 addQuoting:(BOOL)a6
{
  if (!a3 || !a4) {
    return 0;
  }
  if (a5) {
    id v9 = (__CFString *)a5;
  }
  else {
    id v9 = &stru_46D7E8;
  }
  if (a6 && [(__CFString *)v9 length]) {
    id v9 = +[NSString stringWithFormat:@"\"%@\"", v9];
  }
  id v10 = +[NSString stringWithFormat:@"%@.%@(%@);", a3, a4, v9];
  id v11 = [(THWWebBridgeController *)self webView];

  return [(THWPlatformWebViewProtocol *)v11 stringByEvaluatingJavaScriptFromString:v10];
}

- (id)callBrowserObject:(id)a3 methodName:(id)a4 parameters:(id)a5 addQuoting:(BOOL)a6
{
  id v9 = [(id)objc_opt_class() pParameterStringFromParameterArray:a5 addQuoting:a6];

  return [(THWWebBridgeController *)self callBrowserObject:a3 methodName:a4 parameterString:v9 addQuoting:0];
}

- (id)stringByEvaluatingJavaScriptFromFile:(id)a3
{
  uint64_t v4 = 0;
  return [(THWPlatformWebViewProtocol *)[(THWWebBridgeController *)self webView] stringByEvaluatingJavaScriptFromString:+[NSString stringWithContentsOfFile:a3 usedEncoding:&v4 error:0]];
}

- (BOOL)p_injectFileContents:(id)a3
{
  return [[self stringByEvaluatingJavaScriptFromFile:a3] isEqualToString:@"0"] ^ 1;
}

- (void)ensureWidgetObjectInjected
{
  if (![(THWWebBridgeController *)self injectedWidgetObject]
    && -[THWWebBridgeController p_injectFileContents:](self, "p_injectFileContents:", [(id)THBundle() pathForResource:@"AppleWidgetController" ofType:@"js"]))
  {
    [(THWWebBridgeController *)self setInjectedWidgetObject:1];
  }
}

- (void)tellBrowserWillEnterWidgetMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(THWWebBridgeController *)self ensureWidgetObjectInjected];
  id v5 = +[THWConstants modeStringForMode:v3];

  [(THWWebBridgeController *)self callBrowserObject:@"widget" methodName:@"willEnterWidgetMode" parameterString:v5 addQuoting:1];
}

- (void)tellBrowserDidEnterWidgetMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(THWWebBridgeController *)self ensureWidgetObjectInjected];
  id v5 = +[THWConstants modeStringForMode:v3];

  [(THWWebBridgeController *)self callBrowserObject:@"widget" methodName:@"didEnterWidgetMode" parameterString:v5 addQuoting:1];
}

- (void)tellBrowserToPauseAudioVisual
{
  [(THWWebBridgeController *)self ensureWidgetObjectInjected];

  [(THWWebBridgeController *)self callBrowserObject:@"widget" methodName:@"pauseAudioVisual" parameterString:0 addQuoting:1];
}

+ (id)pParameterStringFromParameterArray:(id)a3 addQuoting:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  id result = [a3 count];
  if (result)
  {
    if (v4) {
      CFStringRef v7 = @"\",\"";
    }
    else {
      CFStringRef v7 = @",";
    }
    id result = [a3 componentsJoinedByString:v7];
    if (v4) {
      return +[NSString stringWithFormat:@"\"%@\"", result];
    }
  }
  return result;
}

- (void)pServeWidgetControllerRequest:(id)a3
{
  id v5 = [a3 query];
  if (!v5) {
    return;
  }
  id v6 = [(id)objc_opt_class() parseQuery:v5];
  if (!objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", @"apb")) {
    return;
  }
  id v7 = [v6 objectForKey:@"c"];
  if (!v7) {
    goto LABEL_32;
  }
  id v8 = v7;
  if (![v7 length] || !-[THWWebBridgeController javascriptHandler](self, "javascriptHandler")) {
    goto LABEL_32;
  }
  if ([v8 isEqualToString:kTHApplePubBridgeWidgetControllerCommandValueLoadedKey])
  {
    [(THWWebBridgeController *)self javascriptHandler];
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(THWWebBridgeController *)self javascriptHandler];
      [(THWWebJSControllerDelegate *)v9 contentDidLoad];
    }
    return;
  }
  if ([v8 isEqualToString:kTHApplePubBridgeWidgetControllerCommandValueReadyKey])
  {
    [(THWWebBridgeController *)self javascriptHandler];
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(THWWebBridgeController *)self javascriptHandler];
      [(THWWebJSControllerDelegate *)v10 contentIsReady];
    }
    return;
  }
  if ([v8 isEqualToString:kTHApplePubBridgeWidgetControllerCommandValueExitedKey])
  {
    [(THWWebBridgeController *)self javascriptHandler];
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(THWWebBridgeController *)self javascriptHandler];
      [(THWWebJSControllerDelegate *)v11 contentDidExit];
    }
    return;
  }
  if ([v8 isEqualToString:kTHApplePubBridgeWidgetControllerCommandValuePropertyChangedKey])
  {
    [v6 objectForKey:kTHApplePubBridgeWidgetControllerCommandArg1Key];
    [v6 objectForKey:kTHApplePubBridgeWidgetControllerCommandArg2Key];
    [(THWWebBridgeController *)self javascriptHandler];
    if (objc_opt_respondsToSelector())
    {
      v12 = [(THWWebBridgeController *)self javascriptHandler];
      -[THWWebJSControllerDelegate contentProperty:didChangeTo:](v12, "contentProperty:didChangeTo:");
    }
  }
  else
  {
LABEL_32:
    if ([(THWWebBridgeController *)self optionalDispatcher])
    {
      v13 = [(THWWebBridgeController *)self optionalDispatcher];
      -[TSWNativeCommandDispatcher shouldDispatchRequestToNativeCode:](v13, "shouldDispatchRequestToNativeCode:");
    }
  }
}

- (THWPlatformWebViewProtocol)webView
{
  return self->mWebView;
}

- (void)setWebView:(id)a3
{
}

- (THWWebJSControllerDelegate)javascriptHandler
{
  return self->mJavascriptHandler;
}

- (void)setJavascriptHandler:(id)a3
{
  self->mJavascriptHandler = (THWWebJSControllerDelegate *)a3;
}

- (TSWNativeCommandDispatcher)optionalDispatcher
{
  return self->mOptionalDispatcher;
}

- (void)setOptionalDispatcher:(id)a3
{
  self->mOptionalDispatcher = (TSWNativeCommandDispatcher *)a3;
}

- (BOOL)injectedWidgetObject
{
  return self->mInjectedWidgetObject;
}

- (void)setInjectedWidgetObject:(BOOL)a3
{
  self->mInjectedWidgetObject = a3;
}

@end