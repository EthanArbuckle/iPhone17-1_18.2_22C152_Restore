@interface PurchaseHistoryOperation
- (NSArray)purchaseHistoryItems;
- (NSArray)purchasedItems;
- (PurchaseHistoryOperation)init;
- (PurchaseHistoryOperation)initWithPurchaseHistoryItems:(id)a3 authenticationContext:(id)a4;
- (SSAuthenticationContext)authenticationContext;
- (id)_newURLOperation;
- (void)_setOutputItemsWithMapping:(id)a3;
- (void)dealloc;
- (void)run;
@end

@implementation PurchaseHistoryOperation

- (PurchaseHistoryOperation)init
{
  return [(PurchaseHistoryOperation *)self initWithPurchaseHistoryItems:0 authenticationContext:0];
}

- (PurchaseHistoryOperation)initWithPurchaseHistoryItems:(id)a3 authenticationContext:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PurchaseHistoryOperation;
  v6 = [(PurchaseHistoryOperation *)&v8 init];
  if (v6)
  {
    v6->_authenticationContext = (SSAuthenticationContext *)[a4 copy];
    v6->_inputItems = (NSArray *)[a3 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PurchaseHistoryOperation;
  [(PurchaseHistoryOperation *)&v3 dealloc];
}

- (SSAuthenticationContext)authenticationContext
{
  v2 = self->_authenticationContext;

  return v2;
}

- (NSArray)purchasedItems
{
  [(PurchaseHistoryOperation *)self lock];
  objc_super v3 = self->_outputItems;
  [(PurchaseHistoryOperation *)self unlock];
  return v3;
}

- (NSArray)purchaseHistoryItems
{
  v2 = self->_inputItems;

  return v2;
}

- (void)run
{
  id v3 = [(PurchaseHistoryOperation *)self _newURLOperation];
  id v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    NSUInteger v8 = [(NSArray *)self->_inputItems count];
    *(_DWORD *)v17 = 138412546;
    *(void *)&v17[4] = v7;
    __int16 v18 = 2048;
    NSUInteger v19 = v8;
    LODWORD(v16) = 22;
    v15 = (NSString *)v17;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, v17, v16);
      free(v10);
      v15 = v11;
      SSFileLog();
    }
  }
  *(void *)v17 = 0;
  id v12 = -[PurchaseHistoryOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, v17, v15);
  if (v12)
  {
    id v13 = objc_msgSend(objc_msgSend(v3, "dataProvider"), "output");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v13 objectForKey:@"ownsCheck"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(PurchaseHistoryOperation *)self _setOutputItemsWithMapping:v14];
      }
    }
  }
  [(PurchaseHistoryOperation *)self setError:*(void *)v17];
  [(PurchaseHistoryOperation *)self setSuccess:v12];
}

- (id)_newURLOperation
{
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  objc_msgSend(v3, "setDataProvider:", +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v3 setAuthenticationContext:self->_authenticationContext];
  [v3 setNeedsAuthentication:1];
  id v4 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  objc_msgSend(v4, "setClientIdentifier:", -[SSAuthenticationContext clientIdentifierHeader](self->_authenticationContext, "clientIdentifierHeader"));
  [v4 setURLBagKey:@"bundle-owns-check"];
  id v5 = [(SSAuthenticationContext *)self->_authenticationContext HTTPHeaders];
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", objc_msgSend(v5, "objectForKey:", SSHTTPHeaderUserAgent), SSHTTPHeaderUserAgent);
  objc_msgSend(v4, "setValue:forRequestParameter:", -[ISDevice guid](+[ISDevice sharedInstance](ISDevice, "sharedInstance"), "guid"), @"guid");
  id v6 = objc_alloc_init((Class)NSMutableString);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  inputItems = self->_inputItems;
  id v8 = [(NSArray *)inputItems countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    uint64_t v11 = SSPurchaseHistoryPropertyBundleIdentifier;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(inputItems);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) valueForProperty:v11];
        if ([v13 length])
        {
          if ([v6 length]) {
            [v6 appendString:@","];
          }
          [v6 appendString:v13];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v9 = [(NSArray *)inputItems countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  [v4 setValue:v6 forRequestParameter:@"bids"];

  [v3 setRequestProperties:v4];
  return v3;
}

- (void)_setOutputItemsWithMapping:(id)a3
{
  id v24 = objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v26;
    uint64_t v7 = SSPurchaseHistoryPropertyBundleIdentifier;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v10 = [a3 objectForKey:v9];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && [v10 BOOLValue])
        {
          id v11 = objc_alloc_init((Class)SSPurchaseHistoryItem);
          [v11 setValue:v9 forProperty:v7];
          [v24 addObject:v11];
        }
      }
      id v5 = [a3 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v5);
  }
  id v12 = +[SSLogConfig sharedDaemonConfig];
  if (!v12) {
    id v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  if (os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_INFO)) {
    int v15 = v14;
  }
  else {
    int v15 = v14 & 2;
  }
  if (v15)
  {
    uint64_t v16 = objc_opt_class();
    id v17 = [v24 count];
    int v29 = 138412546;
    uint64_t v30 = v16;
    __int16 v31 = 2048;
    id v32 = v17;
    LODWORD(v22) = 22;
    v21 = &v29;
    uint64_t v18 = _os_log_send_and_compose_impl();
    if (v18)
    {
      NSUInteger v19 = (void *)v18;
      v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v29, v22);
      free(v19);
      v21 = (int *)v20;
      SSFileLog();
    }
  }
  [(PurchaseHistoryOperation *)self lock];

  self->_outputItems = (NSArray *)[v24 copy];
  [(PurchaseHistoryOperation *)self unlock];
}

@end