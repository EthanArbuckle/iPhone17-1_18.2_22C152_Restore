@interface SUScriptExecutionContext
- (BOOL)evaluateData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6;
- (OpaqueJSContext)globalExecutionContext;
- (id)_newLoadOperation;
- (id)_webView;
- (id)parentViewControllerForWebView:(id)a3;
- (id)windowScriptObject;
- (void)_cancelLoadOperation;
- (void)callWebScriptMethod:(id)a3 withArguments:(id)a4;
- (void)dealloc;
- (void)evaluateScriptAtURL:(id)a3;
- (void)evaluateScriptWithURLBagKey:(id)a3;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
@end

@implementation SUScriptExecutionContext

- (void)dealloc
{
  [(ISStoreURLOperation *)self->_loadOperation setDelegate:0];

  [(SUWebView *)self->_webView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptExecutionContext;
  [(SUScriptExecutionContext *)&v3 dealloc];
}

- (BOOL)evaluateData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6
{
  if ([a4 rangeOfString:@"javascript" options:1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(-[SUScriptExecutionContext _webView](self, "_webView"), "loadData:MIMEType:textEncodingName:baseURL:", a3, a4, a5, a6);
  }
  else
  {
    if (a5) {
      CFStringEncoding v11 = CFStringConvertIANACharSetNameToEncoding((CFStringRef)a5);
    }
    else {
      CFStringEncoding v11 = 134217984;
    }
    uint64_t v12 = [[NSString alloc] initWithData:a3 encoding:CFStringConvertEncodingToNSStringEncoding(v11)];
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(-[SUScriptExecutionContext _webView](self, "_webView"), "stringByEvaluatingJavaScriptFromString:", v12);
    }
  }
  return 1;
}

- (void)callWebScriptMethod:(id)a3 withArguments:(id)a4
{
}

uint64_t __62__SUScriptExecutionContext_callWebScriptMethod_withArguments___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_webView"), "_browserView"), "webView"), "windowScriptObject");
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 callWebScriptMethod:v3 withArguments:v4];
}

- (void)evaluateScriptAtURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v14 = 138412546;
    uint64_t v15 = objc_opt_class();
    __int16 v16 = 2112;
    id v17 = a3;
    LODWORD(v13) = 22;
    uint64_t v12 = &v14;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v14, v13);
      free(v9);
      uint64_t v12 = (int *)v10;
      SSFileLog();
    }
  }
  [(SUScriptExecutionContext *)self _cancelLoadOperation];
  self->_loadOperation = (ISStoreURLOperation *)[(SUScriptExecutionContext *)self _newLoadOperation];
  CFStringEncoding v11 = (void *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:a3];
  [(ISStoreURLOperation *)self->_loadOperation setRequestProperties:v11];

  objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", self->_loadOperation);
}

- (void)evaluateScriptWithURLBagKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v14 = 138412546;
    uint64_t v15 = objc_opt_class();
    __int16 v16 = 2112;
    id v17 = a3;
    LODWORD(v13) = 22;
    uint64_t v12 = &v14;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v14, v13);
      free(v9);
      uint64_t v12 = (int *)v10;
      SSFileLog();
    }
  }
  [(SUScriptExecutionContext *)self _cancelLoadOperation];
  self->_loadOperation = (ISStoreURLOperation *)[(SUScriptExecutionContext *)self _newLoadOperation];
  id v11 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v11 setURLBagKey:a3];
  [(ISStoreURLOperation *)self->_loadOperation setRequestProperties:v11];

  objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", self->_loadOperation);
}

- (OpaqueJSContext)globalExecutionContext
{
  v2 = objc_msgSend((id)objc_msgSend((id)-[SUWebView _browserView](self->_webView, "_browserView"), "webView"), "mainFrame");

  return (OpaqueJSContext *)[v2 globalContext];
}

- (id)windowScriptObject
{
  return [(SUWebView *)self->_webView windowScriptObject];
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3, a4);
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v13 = 138412290;
    uint64_t v14 = objc_opt_class();
    LODWORD(v12) = 12;
    id v11 = &v13;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v13, v12);
      free(v9);
      id v11 = (int *)v10;
      SSFileLog();
    }
  }
  [(SUScriptExecutionContext *)self _cancelLoadOperation];
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([a4 length])
  {
    int v7 = (void *)[a3 response];
    CFStringRef v8 = (CFStringRef)[v7 textEncodingName];
    if (!v8) {
      CFStringRef v8 = CFStringConvertEncodingToIANACharSetName(0x8000100u);
    }
    -[SUScriptExecutionContext evaluateData:MIMEType:textEncodingName:baseURL:](self, "evaluateData:MIMEType:textEncodingName:baseURL:", a4, [v7 MIMEType], v8, objc_msgSend((id)objc_msgSend(a3, "response"), "URL"));
  }
  else
  {
    v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v17 = 138412290;
      uint64_t v18 = objc_opt_class();
      LODWORD(v16) = 12;
      uint64_t v15 = &v17;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        int v13 = (void *)v12;
        uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v17, v16);
        free(v13);
        uint64_t v15 = (int *)v14;
        SSFileLog();
      }
    }
  }
  [(SUScriptExecutionContext *)self _cancelLoadOperation];
}

- (id)parentViewControllerForWebView:(id)a3
{
  id v3 = +[SUClientDispatch tabBarController];
  uint64_t v4 = (void *)[v3 presentedViewController];
  if (!v4) {
    uint64_t v4 = (void *)[v3 selectedViewController];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = (void *)[v4 topViewController];
  }
  if (v4) {
    return v4;
  }
  else {
    return v3;
  }
}

- (void)_cancelLoadOperation
{
  self->_loadOperation = 0;
}

- (id)_newLoadOperation
{
  id v3 = objc_alloc_init(MEMORY[0x263F89528]);
  [v3 setDelegate:self];
  [v3 setShouldMessageMainThread:1];
  return v3;
}

- (id)_webView
{
  id result = self->_webView;
  if (!result)
  {
    uint64_t v4 = objc_alloc_init(SUWebView);
    self->_webView = v4;
    [(SUWebView *)v4 setDelegate:self];
    return self->_webView;
  }
  return result;
}

@end