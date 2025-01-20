@interface SUScriptXMLHTTPStoreRequest
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (ISDataProvider)dataProvider;
- (NSString)responseText;
- (NSString)statusText;
- (SSAuthenticationContext)authenticationContext;
- (SUScriptXMLHTTPStoreRequest)initWithDelegate:(id)a3;
- (SUScriptXMLHTTPStoreRequestDelegate)delegate;
- (WebScriptObject)onabort;
- (WebScriptObject)onerror;
- (WebScriptObject)onload;
- (WebScriptObject)onloadend;
- (WebScriptObject)onreadystatechange;
- (WebScriptObject)ontimeout;
- (id)_className;
- (id)_clientInfoHeader;
- (id)_gsTokenForAIDAAccount:(id)a3 accountStore:(id)a4;
- (id)_scriptObjectForFunctionName:(id)a3;
- (id)_uniqueDeviceID;
- (id)getAllResponseHeaders;
- (id)getResponseHeader:(id)a3;
- (id)isJSONEncoded;
- (id)scriptAttributeKeys;
- (id)shouldSendGUIDHeader;
- (unint64_t)readyState;
- (unint64_t)status;
- (unint64_t)timeout;
- (void)_callFunctionWithName:(id)a3 arguments:(id)a4;
- (void)_setScriptObject:(id)a3 forFunctionName:(id)a4;
- (void)abort;
- (void)dealloc;
- (void)openWithHTTPMethod:(id)a3 URL:(id)a4 isAsync:(id)a5 username:(id)a6 password:(id)a7;
- (void)sendWithBodyData:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setJSONEncoded:(id)a3;
- (void)setOnabort:(id)a3;
- (void)setOnerror:(id)a3;
- (void)setOnload:(id)a3;
- (void)setOnloadend:(id)a3;
- (void)setOnreadystatechange:(id)a3;
- (void)setOntimeout:(id)a3;
- (void)setShouldSendGUIDHeader:(id)a3;
- (void)setTimeout:(unint64_t)a3;
@end

@implementation SUScriptXMLHTTPStoreRequest

- (SUScriptXMLHTTPStoreRequest)initWithDelegate:(id)a3
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
  [(NSMutableDictionary *)self->_functions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_6];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptXMLHTTPStoreRequest;
  [(SUScriptObject *)&v3 dealloc];
}

uint64_t __38__SUScriptXMLHTTPStoreRequest_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setThisObject:0];
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

  self->_shouldSendGUIDHeader = 0;
  self->_status = 0;
  statusText = self->_statusText;
  self->_statusText = 0;

  [(SUScriptObject *)self unlock];
  v6 = v7;
  if (v7)
  {
    [(SUXMLHTTPStoreRequestOperation *)v7 cancel];
    [(SUScriptXMLHTTPStoreRequest *)self _callFunctionWithName:@"onreadystatechange" arguments:0];
    [(SUScriptXMLHTTPStoreRequest *)self _callFunctionWithName:@"onabort" arguments:0];
    [(SUScriptXMLHTTPStoreRequest *)self _callFunctionWithName:@"onloadend" arguments:0];
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
  v9 = __52__SUScriptXMLHTTPStoreRequest_getAllResponseHeaders__block_invoke;
  v10 = &unk_264812DA8;
  v12 = v13;
  id v5 = v3;
  id v11 = v5;
  [(NSDictionary *)responseHeaders enumerateKeysAndObjectsUsingBlock:&v7];
  [(SUScriptObject *)self unlock];

  _Block_object_dispose(v13, 8);

  return v5;
}

void __52__SUScriptXMLHTTPStoreRequest_getAllResponseHeaders__block_invoke(uint64_t a1, void *a2, void *a3)
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

      [(SSMutableURLRequestProperties *)self->_requestProperties setITunesStoreRequest:1];
      if (v18) {
        -[SSMutableURLRequestProperties setHTTPMethod:](self->_requestProperties, "setHTTPMethod:");
      }
      if (self->_useJSONEncoding) {
        [(SSMutableURLRequestProperties *)self->_requestProperties setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v17 = [v16 scriptXMLHTTPStoreRequest:self requiresCellularForURL:v11];

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
  location[3] = *(id *)MEMORY[0x263EF8340];
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
      if (self->_shouldSendGUIDHeader)
      {
        uint64_t v8 = self->_requestProperties;
        id v9 = [MEMORY[0x263F89480] sharedInstance];
        id v10 = [v9 guid];
        [(SSMutableURLRequestProperties *)v8 setValue:v10 forHTTPHeaderField:*MEMORY[0x263F7B778]];
      }
      id v11 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
      v12 = objc_msgSend(v11, "ams_activeiCloudAccount");
      v42 = objc_msgSend(v11, "aida_accountForiCloudAccount:", v12);
      if (v12)
      {
        if (v42)
        {
          v13 = [(SUScriptXMLHTTPStoreRequest *)self _gsTokenForAIDAAccount:v42 accountStore:v11];
          if (v13) {
            [(SSMutableURLRequestProperties *)self->_requestProperties setValue:v13 forHTTPHeaderField:*MEMORY[0x263F7B7C8]];
          }
        }
        else
        {
          v22 = [MEMORY[0x263F7B1F8] sharedConfig];
          int v23 = [v22 shouldLog];
          if ([v22 shouldLogToDisk]) {
            int v24 = v23 | 2;
          }
          else {
            int v24 = v23;
          }
          v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            int v26 = v24;
          }
          else {
            int v26 = v24 & 2;
          }
          if (v26)
          {
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = (id)objc_opt_class();
            id v27 = *(id *)((char *)location + 4);
            LODWORD(v41) = 12;
            v40 = location;
            v28 = (void *)_os_log_send_and_compose_impl();

            if (v28)
            {
              objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, location, v41);
              v29 = (id *)objc_claimAutoreleasedReturnValue();
              free(v28);
              v40 = v29;
              SSFileLog();
            }
          }
          else
          {
          }
        }
        v14 = objc_msgSend(v12, "ams_altDSID", v40);
        if (v14) {
          [(SSMutableURLRequestProperties *)self->_requestProperties setValue:v14 forHTTPHeaderField:*MEMORY[0x263F7B790]];
        }
      }
      else
      {
        v14 = [MEMORY[0x263F7B1F8] sharedConfig];
        int v15 = [v14 shouldLog];
        if ([v14 shouldLogToDisk]) {
          int v16 = v15 | 2;
        }
        else {
          int v16 = v15;
        }
        uint64_t v17 = [v14 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          int v18 = v16;
        }
        else {
          int v18 = v16 & 2;
        }
        if (v18)
        {
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = (id)objc_opt_class();
          id v19 = *(id *)((char *)location + 4);
          LODWORD(v41) = 12;
          v40 = location;
          v20 = (void *)_os_log_send_and_compose_impl();

          if (v20)
          {
            objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, location, v41);
            v21 = (id *)objc_claimAutoreleasedReturnValue();
            free(v20);
            v40 = v21;
            SSFileLog();
          }
        }
        else
        {
        }
      }

      v30 = [(SUScriptXMLHTTPStoreRequest *)self _clientInfoHeader];
      if (v30) {
        [(SSMutableURLRequestProperties *)self->_requestProperties setValue:v30 forHTTPHeaderField:*MEMORY[0x263F7B7E8]];
      }
      v31 = [(SUScriptXMLHTTPStoreRequest *)self _uniqueDeviceID];
      if (v31) {
        [(SSMutableURLRequestProperties *)self->_requestProperties setValue:v31 forHTTPHeaderField:*MEMORY[0x263F7B7F0]];
      }
      v32 = [[SUXMLHTTPStoreRequestOperation alloc] initWithRequestProperties:self->_requestProperties];
      operation = self->_operation;
      self->_operation = v32;

      v34 = self->_operation;
      v35 = [(SUScriptXMLHTTPStoreRequest *)self authenticationContext];
      [(SUXMLHTTPStoreRequestOperation *)v34 setAuthenticationContext:v35];

      v36 = self->_operation;
      v37 = [(SUScriptXMLHTTPStoreRequest *)self dataProvider];
      [(SUXMLHTTPStoreRequestOperation *)v36 setDataProvider:v37];

      objc_initWeak(location, self);
      v38 = self->_operation;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __48__SUScriptXMLHTTPStoreRequest_sendWithBodyData___block_invoke;
      v43[3] = &unk_264812DD0;
      objc_copyWeak(&v44, location);
      [(SUXMLHTTPStoreRequestOperation *)v38 setOutputBlock:v43];
      v39 = [MEMORY[0x263F894E0] mainQueue];
      [v39 addOperation:self->_operation];

      objc_destroyWeak(&v44);
      objc_destroyWeak(location);
    }
  }
  [(SUScriptObject *)self unlock];
}

void __48__SUScriptXMLHTTPStoreRequest_sendWithBodyData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v22 = a3;
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
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [[NSString alloc] initWithData:v9 encoding:4];
        v13 = (void *)WeakRetained[15];
        WeakRetained[15] = v12;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          v13 = [MEMORY[0x263F08900] dataWithJSONObject:v9 options:0 error:0];
          uint64_t v14 = [[NSString alloc] initWithData:v13 encoding:4];
          int v15 = (void *)WeakRetained[15];
          WeakRetained[15] = v14;
        }
        else
        {
          id v16 = v9;
          v13 = (void *)WeakRetained[15];
          WeakRetained[15] = v16;
        }
      }
    }
    uint64_t v17 = (void *)WeakRetained[11];
    WeakRetained[11] = 0;

    WeakRetained[12] = 4;
    WeakRetained[17] = v11;
    uint64_t v18 = [MEMORY[0x263EFC5E0] localizedStringForStatusCode:v11];
    id v19 = (void *)WeakRetained[18];
    WeakRetained[18] = v18;

    [WeakRetained unlock];
    [WeakRetained _callFunctionWithName:@"onreadystatechange" arguments:0];
    if ((unint64_t)(v11 - 200) >= 0x64) {
      v20 = @"onerror";
    }
    else {
      v20 = @"onload";
    }
    if (v11 == 408) {
      v21 = @"ontimeout";
    }
    else {
      v21 = v20;
    }
    [WeakRetained _callFunctionWithName:v21 arguments:0];
    [WeakRetained _callFunctionWithName:@"onloadend" arguments:0];
  }
}

- (id)_className
{
  return @"iTunesXMLHTTPStoreRequest";
}

- (id)isJSONEncoded
{
  [(SUScriptObject *)self lock];
  if (self->_useJSONEncoding) {
    objc_super v3 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    objc_super v3 = (id *)MEMORY[0x263EFFB38];
  }
  id v4 = *v3;
  [(SUScriptObject *)self unlock];

  return v4;
}

- (WebScriptObject)onabort
{
  return (WebScriptObject *)[(SUScriptXMLHTTPStoreRequest *)self _scriptObjectForFunctionName:@"onabort"];
}

- (WebScriptObject)onerror
{
  return (WebScriptObject *)[(SUScriptXMLHTTPStoreRequest *)self _scriptObjectForFunctionName:@"onerror"];
}

- (WebScriptObject)onload
{
  return (WebScriptObject *)[(SUScriptXMLHTTPStoreRequest *)self _scriptObjectForFunctionName:@"onload"];
}

- (WebScriptObject)onloadend
{
  return (WebScriptObject *)[(SUScriptXMLHTTPStoreRequest *)self _scriptObjectForFunctionName:@"onloadend"];
}

- (WebScriptObject)onreadystatechange
{
  return (WebScriptObject *)[(SUScriptXMLHTTPStoreRequest *)self _scriptObjectForFunctionName:@"onreadystatechange"];
}

- (WebScriptObject)ontimeout
{
  return (WebScriptObject *)[(SUScriptXMLHTTPStoreRequest *)self _scriptObjectForFunctionName:@"ontimeout"];
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

- (void)setJSONEncoded:(id)a3
{
  id v4 = a3;
  [(SUScriptObject *)self lock];
  char v5 = [v4 BOOLValue];

  self->_useJSONEncoding = v5;

  [(SUScriptObject *)self unlock];
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

- (void)setShouldSendGUIDHeader:(id)a3
{
  id v4 = a3;
  [(SUScriptObject *)self lock];
  char v5 = [v4 BOOLValue];

  self->_shouldSendGUIDHeader = v5;

  [(SUScriptObject *)self unlock];
}

- (void)setTimeout:(unint64_t)a3
{
  [(SUScriptObject *)self lock];
  self->_unint64_t timeout = a3;

  [(SUScriptObject *)self unlock];
}

- (id)shouldSendGUIDHeader
{
  if (self->_shouldSendGUIDHeader) {
    v2 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    v2 = (id *)MEMORY[0x263EFFB38];
  }
  return *v2;
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

- (id)_clientInfoHeader
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F25820] clientInfoHeader];
  if (!v2)
  {
    objc_super v3 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    id v6 = [v3 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      v5 &= 2u;
    }
    if (v5)
    {
      LODWORD(v11) = 138543362;
      *(void *)((char *)&v11 + 4) = objc_opt_class();
      id v7 = *(id *)((char *)&v11 + 4);
      LODWORD(v10) = 12;
      id v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_11:

        goto LABEL_12;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v11, v10, v11);
      free(v8);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:

  return v2;
}

- (id)_gsTokenForAIDAAccount:(id)a3 accountStore:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F26D50];
  id v18 = 0;
  id v6 = [a4 credentialForAccount:a3 serviceID:v5 error:&v18];
  id v7 = v18;
  if (v7)
  {
    id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    long long v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      uint64_t v12 = objc_opt_class();
      int v19 = 138543618;
      v20 = v12;
      __int16 v21 = 2114;
      id v22 = v7;
      id v13 = v12;
      LODWORD(v17) = 22;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_11:

        int v15 = 0;
        goto LABEL_13;
      }
      long long v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v19, v17);
      free(v14);
      SSFileLog();
    }

    goto LABEL_11;
  }
  int v15 = [v6 token];
LABEL_13:

  return v15;
}

- (id)_scriptObjectForFunctionName:(id)a3
{
  id v4 = a3;
  [(SUScriptObject *)self lock];
  uint64_t v5 = [(NSMutableDictionary *)self->_functions objectForKey:v4];

  id v6 = [v5 scriptObject];
  [(SUScriptObject *)self unlock];

  return v6;
}

- (void)_setScriptObject:(id)a3 forFunctionName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v11 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptObject *)self lock];
    if (v11)
    {
      id v7 = [[SUScriptFunction alloc] initWithScriptObject:v11];
      [(SUScriptFunction *)v7 setThisObject:self];
      functions = self->_functions;
      if (!functions)
      {
        int v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        int v10 = self->_functions;
        self->_functions = v9;

        functions = self->_functions;
      }
      [(NSMutableDictionary *)functions setObject:v7 forKey:v6];
    }
    else
    {
      id v7 = [(NSMutableDictionary *)self->_functions objectForKey:v6];
      [(SUScriptFunction *)v7 setThisObject:0];
      [(NSMutableDictionary *)self->_functions removeObjectForKey:v6];
    }

    [(SUScriptObject *)self unlock];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

- (id)_uniqueDeviceID
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F27BF8] uniqueDeviceId];
  if (!v2)
  {
    objc_super v3 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    id v6 = [v3 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      v5 &= 2u;
    }
    if (v5)
    {
      LODWORD(v11) = 138543362;
      *(void *)((char *)&v11 + 4) = objc_opt_class();
      id v7 = *(id *)((char *)&v11 + 4);
      LODWORD(v10) = 12;
      id v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_11:

        goto LABEL_12;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v11, v10, v11);
      free(v8);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:

  return v2;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  int v5 = [(id)__KeyMapping_4 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptXMLHTTPStoreRequest;
    int v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  int v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_2, 6);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptXMLHTTPStoreRequest;
    int v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptXMLHTTPStoreRequest;
  v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  objc_super v3 = [(id)__KeyMapping_4 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_2 = (uint64_t)sel_abort;
    *(void *)algn_2681B46D8 = @"abort";
    qword_2681B46E0 = (uint64_t)sel_getAllResponseHeaders;
    unk_2681B46E8 = @"getAllResponseHeaders";
    qword_2681B46F0 = (uint64_t)sel_getResponseHeader_;
    unk_2681B46F8 = @"getResponseHeader";
    qword_2681B4700 = (uint64_t)sel_openWithHTTPMethod_URL_isAsync_username_password_;
    unk_2681B4708 = @"open";
    qword_2681B4710 = (uint64_t)sel_sendWithBodyData_;
    unk_2681B4718 = @"send";
    qword_2681B4720 = (uint64_t)sel_setValue_forHTTPHeaderField_;
    unk_2681B4728 = @"setRequestHeader";
    __KeyMapping_4 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"isJSONEncoded", @"JSONEncoded", @"onabort", @"onabort", @"onerror", @"onerror", @"onload", @"onload", @"onloadend", @"onloadend", @"onreadystatechange", @"onreadystatechange", @"ontimeout", @"ontimeout", @"readyState", @"readyState", @"responseText",
                       @"responseText",
                       @"shouldSendGUIDHeader",
                       @"shouldSendGUIDHeader",
                       @"status",
                       @"status",
                       @"statusText",
                       @"statusText",
                       @"timeout",
                       @"timeout",
                       0);
    MEMORY[0x270F9A758]();
  }
}

- (SUScriptXMLHTTPStoreRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUScriptXMLHTTPStoreRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (ISDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_responseText, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_functions, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end