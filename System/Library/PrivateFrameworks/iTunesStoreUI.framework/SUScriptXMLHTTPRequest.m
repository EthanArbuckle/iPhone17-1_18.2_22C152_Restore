@interface SUScriptXMLHTTPRequest
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)responseText;
- (NSString)statusText;
- (SUScriptXMLHTTPRequest)initWithDelegate:(id)a3;
- (SUScriptXMLHTTPRequestDelegate)delegate;
- (WebScriptObject)onabort;
- (WebScriptObject)onerror;
- (WebScriptObject)onload;
- (WebScriptObject)onloadend;
- (WebScriptObject)onreadystatechange;
- (WebScriptObject)ontimeout;
- (id)_className;
- (id)_scriptObjectForFunctionName:(id)a3;
- (id)getAllResponseHeaders;
- (id)getResponseHeader:(id)a3;
- (id)scriptAttributeKeys;
- (unint64_t)readyState;
- (unint64_t)status;
- (unint64_t)timeout;
- (void)_callFunctionWithName:(id)a3 arguments:(id)a4;
- (void)_setScriptObject:(id)a3 forFunctionName:(id)a4;
- (void)abort;
- (void)dealloc;
- (void)openWithHTTPMethod:(id)a3 URL:(id)a4 isAsync:(id)a5 username:(id)a6 password:(id)a7;
- (void)sendWithBodyData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOnabort:(id)a3;
- (void)setOnerror:(id)a3;
- (void)setOnload:(id)a3;
- (void)setOnloadend:(id)a3;
- (void)setOnreadystatechange:(id)a3;
- (void)setOntimeout:(id)a3;
- (void)setTimeout:(unint64_t)a3;
@end

@implementation SUScriptXMLHTTPRequest

- (SUScriptXMLHTTPRequest)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(SUScriptObject *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_functions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_8];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptXMLHTTPRequest;
  [(SUScriptObject *)&v3 dealloc];
}

uint64_t __33__SUScriptXMLHTTPRequest_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setThisObject:");
}

- (void)abort
{
  [(SUScriptObject *)self lock];
  v7 = self->_operation;
  operation = self->_operation;
  self->_operation = 0;

  self->_readyState = 4;
  responseText = self->_responseText;
  self->_responseText = 0;

  self->_status = 0;
  statusText = self->_statusText;
  self->_statusText = 0;

  [(SUScriptObject *)self unlock];
  v6 = v7;
  if (v7)
  {
    [(SUXMLHTTPRequestOperation *)v7 cancel];
    [(SUScriptXMLHTTPRequest *)self _callFunctionWithName:@"onreadystatechange" arguments:0];
    [(SUScriptXMLHTTPRequest *)self _callFunctionWithName:@"onabort" arguments:0];
    [(SUScriptXMLHTTPRequest *)self _callFunctionWithName:@"onloadend" arguments:0];
    v6 = v7;
  }
}

- (id)getAllResponseHeaders
{
  objc_super v3 = [MEMORY[0x263F089D8] string];
  [(SUScriptObject *)self lock];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  responseHeaders = self->_responseHeaders;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __47__SUScriptXMLHTTPRequest_getAllResponseHeaders__block_invoke;
  v10 = &unk_264812DA8;
  v12 = v13;
  id v5 = v3;
  id v11 = v5;
  [(NSDictionary *)responseHeaders enumerateKeysAndObjectsUsingBlock:&v7];
  [(SUScriptObject *)self unlock];

  _Block_object_dispose(v13, 8);

  return v5;
}

void __47__SUScriptXMLHTTPRequest_getAllResponseHeaders__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 1) {
    [*(id *)(a1 + 32) appendString:@"\r\n"];
  }
  [*(id *)(a1 + 32) appendString:v6];
  [*(id *)(a1 + 32) appendString:@": "];
  [*(id *)(a1 + 32) appendString:v5];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)getResponseHeader:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptObject *)self lock];
    id v5 = [(NSDictionary *)self->_responseHeaders objectForKey:v4];
    id v6 = (void *)[v5 copy];

    [(SUScriptObject *)self unlock];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    id v6 = 0;
  }

  return v6;
}

- (void)openWithHTTPMethod:(id)a3 URL:(id)a4 isAsync:(id)a5 username:(id)a6 password:(id)a7
{
  id v9 = a3;
  id v10 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v9 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    id v18 = [v9 uppercaseString];

    if (!v18
      || ([v18 isEqualToString:@"GET"] & 1) != 0
      || ([v18 isEqualToString:@"POST"] & 1) != 0)
    {
      id v11 = (void *)[objc_alloc(NSURL) initWithString:v10];
      v12 = (SSMutableURLRequestProperties *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:v11];
      requestProperties = self->_requestProperties;
      self->_requestProperties = v12;

      [(SSMutableURLRequestProperties *)self->_requestProperties setITunesStoreRequest:0];
      if (v18) {
        -[SSMutableURLRequestProperties setHTTPMethod:](self->_requestProperties, "setHTTPMethod:");
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v17 = [v16 scriptXMLHTTPRequest:self requiresCellularForURL:v11];

        [(SSMutableURLRequestProperties *)self->_requestProperties setRequiresCellularDataNetwork:v17];
      }
    }
    else
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    id v18 = v9;
  }
}

- (void)sendWithBodyData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v4 = 0;
  }
  [(SUScriptObject *)self lock];
  if (!self->_operation)
  {
    requestProperties = self->_requestProperties;
    if (requestProperties)
    {
      unint64_t timeout = self->_timeout;
      if (timeout) {
        [(SSMutableURLRequestProperties *)requestProperties setTimeoutInterval:(double)timeout / 1000.0];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v4 dataUsingEncoding:4];
        [(SSMutableURLRequestProperties *)self->_requestProperties setHTTPBody:v7];
      }
      uint64_t v8 = [[SUXMLHTTPRequestOperation alloc] initWithRequestProperties:self->_requestProperties];
      operation = self->_operation;
      self->_operation = v8;

      objc_initWeak(&location, self);
      id v10 = self->_operation;
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      v14 = __43__SUScriptXMLHTTPRequest_sendWithBodyData___block_invoke;
      char v15 = &unk_264813750;
      objc_copyWeak(&v16, &location);
      [(SUXMLHTTPRequestOperation *)v10 setOutputBlock:&v12];
      id v11 = objc_msgSend(MEMORY[0x263F894E0], "mainQueue", v12, v13, v14, v15);
      [v11 addOperation:self->_operation];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  [(SUScriptObject *)self unlock];
}

void __43__SUScriptXMLHTTPRequest_sendWithBodyData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v11 = [v8 statusCode];
    if (ISErrorIsEqual()) {
      uint64_t v11 = 408;
    }
    [WeakRetained lock];
    if (v9)
    {
      uint64_t v12 = [[NSString alloc] initWithData:v9 encoding:4];
      uint64_t v13 = (void *)WeakRetained[15];
      WeakRetained[15] = v12;
    }
    v14 = (void *)WeakRetained[11];
    WeakRetained[11] = 0;

    WeakRetained[12] = 4;
    WeakRetained[16] = v11;
    uint64_t v15 = [MEMORY[0x263EFC5E0] localizedStringForStatusCode:v11];
    id v16 = (void *)WeakRetained[17];
    WeakRetained[17] = v15;

    [WeakRetained unlock];
    [WeakRetained _callFunctionWithName:@"onreadystatechange" arguments:0];
    if ((unint64_t)(v11 - 200) >= 0x64) {
      uint64_t v17 = @"onerror";
    }
    else {
      uint64_t v17 = @"onload";
    }
    if (v11 == 408) {
      id v18 = @"ontimeout";
    }
    else {
      id v18 = v17;
    }
    [WeakRetained _callFunctionWithName:v18 arguments:0];
    [WeakRetained _callFunctionWithName:@"onloadend" arguments:0];
  }
}

- (id)_className
{
  return @"iTunesXMLHTTPRequest";
}

- (WebScriptObject)onabort
{
  return (WebScriptObject *)[(SUScriptXMLHTTPRequest *)self _scriptObjectForFunctionName:@"onabort"];
}

- (WebScriptObject)onerror
{
  return (WebScriptObject *)[(SUScriptXMLHTTPRequest *)self _scriptObjectForFunctionName:@"onerror"];
}

- (WebScriptObject)onload
{
  return (WebScriptObject *)[(SUScriptXMLHTTPRequest *)self _scriptObjectForFunctionName:@"onload"];
}

- (WebScriptObject)onloadend
{
  return (WebScriptObject *)[(SUScriptXMLHTTPRequest *)self _scriptObjectForFunctionName:@"onloadend"];
}

- (WebScriptObject)onreadystatechange
{
  return (WebScriptObject *)[(SUScriptXMLHTTPRequest *)self _scriptObjectForFunctionName:@"onreadystatechange"];
}

- (WebScriptObject)ontimeout
{
  return (WebScriptObject *)[(SUScriptXMLHTTPRequest *)self _scriptObjectForFunctionName:@"ontimeout"];
}

- (unint64_t)readyState
{
  [(SUScriptObject *)self lock];
  unint64_t readyState = self->_readyState;
  [(SUScriptObject *)self unlock];
  return readyState;
}

- (NSString)responseText
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (void *)[(NSString *)self->_responseText copy];
  [(SUScriptObject *)self unlock];

  return (NSString *)v3;
}

- (void)setOnabort:(id)a3
{
}

- (void)setOnerror:(id)a3
{
}

- (void)setOnload:(id)a3
{
}

- (void)setOnloadend:(id)a3
{
}

- (void)setOnreadystatechange:(id)a3
{
}

- (void)setOntimeout:(id)a3
{
}

- (void)setTimeout:(unint64_t)a3
{
  [(SUScriptObject *)self lock];
  self->_unint64_t timeout = a3;

  [(SUScriptObject *)self unlock];
}

- (unint64_t)status
{
  [(SUScriptObject *)self lock];
  unint64_t status = self->_status;
  [(SUScriptObject *)self unlock];
  return status;
}

- (NSString)statusText
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (void *)[(NSString *)self->_statusText copy];
  [(SUScriptObject *)self unlock];

  return (NSString *)v3;
}

- (unint64_t)timeout
{
  [(SUScriptObject *)self lock];
  unint64_t timeout = self->_timeout;
  [(SUScriptObject *)self unlock];
  return timeout;
}

- (void)_callFunctionWithName:(id)a3 arguments:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SUScriptObject *)self lock];
  id v8 = [(NSMutableDictionary *)self->_functions objectForKey:v7];

  [(SUScriptObject *)self unlock];
  [v8 callWithArguments:v6];
}

- (id)_scriptObjectForFunctionName:(id)a3
{
  id v4 = a3;
  [(SUScriptObject *)self lock];
  id v5 = [(NSMutableDictionary *)self->_functions objectForKey:v4];

  id v6 = [v5 scriptObject];
  [(SUScriptObject *)self unlock];

  return v6;
}

- (void)_setScriptObject:(id)a3 forFunctionName:(id)a4
{
  id v6 = a3;
  id v11 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    [(SUScriptObject *)self lock];
LABEL_4:
    id v6 = [(NSMutableDictionary *)self->_functions objectForKey:v11];
    [v6 setThisObject:0];
    [(NSMutableDictionary *)self->_functions removeObjectForKey:v11];
    goto LABEL_5;
  }
  [(SUScriptObject *)self lock];
  if (!v6) {
    goto LABEL_4;
  }
  id v7 = [[SUScriptFunction alloc] initWithScriptObject:v6];
  [(SUScriptFunction *)v7 setThisObject:self];
  functions = self->_functions;
  if (!functions)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v10 = self->_functions;
    self->_functions = v9;

    functions = self->_functions;
  }
  [(NSMutableDictionary *)functions setObject:v7 forKey:v11];

LABEL_5:
  [(SUScriptObject *)self unlock];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  id v5 = [(id)__KeyMapping_26 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptXMLHTTPRequest;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_21, 6);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptXMLHTTPRequest;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptXMLHTTPRequest;
  v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  objc_super v3 = [(id)__KeyMapping_26 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_21 = (uint64_t)sel_abort;
    unk_2681B4C20 = @"abort";
    qword_2681B4C28 = (uint64_t)sel_getAllResponseHeaders;
    unk_2681B4C30 = @"getAllResponseHeaders";
    qword_2681B4C38 = (uint64_t)sel_getResponseHeader_;
    unk_2681B4C40 = @"getResponseHeader";
    qword_2681B4C48 = (uint64_t)sel_openWithHTTPMethod_URL_isAsync_username_password_;
    unk_2681B4C50 = @"open";
    qword_2681B4C58 = (uint64_t)sel_sendWithBodyData_;
    unk_2681B4C60 = @"send";
    qword_2681B4C68 = (uint64_t)sel_setValue_forHTTPHeaderField_;
    unk_2681B4C70 = @"setRequestHeader";
    __KeyMapping_26 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"onabort", @"onerror", @"onerror", @"onload", @"onload", @"onloadend", @"onloadend", @"onreadystatechange", @"onreadystatechange", @"ontimeout", @"ontimeout", @"readyState", @"readyState", @"responseText", @"responseText", @"status", @"status",
                        @"statusText",
                        @"statusText",
                        @"timeout",
                        @"timeout",
                        0);
    MEMORY[0x270F9A758]();
  }
}

- (SUScriptXMLHTTPRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUScriptXMLHTTPRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_responseText, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_functions, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end