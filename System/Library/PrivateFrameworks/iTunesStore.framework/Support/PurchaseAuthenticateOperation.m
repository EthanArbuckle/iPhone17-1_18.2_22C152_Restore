@interface PurchaseAuthenticateOperation
- (NSString)clientIdentifierHeader;
- (PurchaseAuthenticateOperation)initWithPurchases:(id)a3;
- (id)_clientIdentifierForPurchases:(id)a3;
- (id)_userAgentForPurchases:(id)a3;
- (id)authenticationBlock;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationBlock:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
@end

@implementation PurchaseAuthenticateOperation

- (PurchaseAuthenticateOperation)initWithPurchases:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PurchaseAuthenticateOperation;
  v4 = [(PurchaseAuthenticateOperation *)&v11 init];
  if (v4)
  {
    id v5 = [a3 objectAtIndex:0];
    v6 = (SSMutableAuthenticationContext *)objc_msgSend(objc_alloc((Class)SSMutableAuthenticationContext), "initWithAccountIdentifier:", objc_msgSend(v5, "accountIdentifier"));
    v4->_authenticationContext = v6;
    [(SSMutableAuthenticationContext *)v6 setPromptStyle:1];
    [(SSMutableAuthenticationContext *)v4->_authenticationContext setPreferredITunesStoreClient:[(PurchaseAuthenticateOperation *)v4 _clientIdentifierForPurchases:a3]];
    id v7 = [(SSMutableAuthenticationContext *)v4->_authenticationContext HTTPHeaders];
    uint64_t v8 = SSHTTPHeaderUserAgent;
    if (![v7 objectForKey:SSHTTPHeaderUserAgent]) {
      [(SSMutableAuthenticationContext *)v4->_authenticationContext setValue:[(PurchaseAuthenticateOperation *)v4 _userAgentForPurchases:a3] forHTTPHeaderField:v8];
    }
    if ([a3 count] == (id)1 && objc_msgSend(v5, "buyParameters"))
    {
      id v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", objc_msgSend(v5, "buyParameters"), @"product", 0);
      [(SSMutableAuthenticationContext *)v4->_authenticationContext setSignupRequestParameters:v9];
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PurchaseAuthenticateOperation;
  [(PurchaseAuthenticateOperation *)&v3 dealloc];
}

- (id)authenticationBlock
{
  [(PurchaseAuthenticateOperation *)self lock];
  id v3 = self->_authenticationBlock;
  [(PurchaseAuthenticateOperation *)self unlock];
  return v3;
}

- (NSString)clientIdentifierHeader
{
  [(PurchaseAuthenticateOperation *)self lock];
  id v3 = (NSString *)[(SSMutableAuthenticationContext *)self->_authenticationContext clientIdentifierHeader];
  [(PurchaseAuthenticateOperation *)self unlock];
  return v3;
}

- (void)setAuthenticationBlock:(id)a3
{
  [(PurchaseAuthenticateOperation *)self lock];
  id authenticationBlock = self->_authenticationBlock;
  if (authenticationBlock != a3)
  {

    self->_id authenticationBlock = [a3 copy];
  }

  [(PurchaseAuthenticateOperation *)self unlock];
}

- (void)setClientIdentifierHeader:(id)a3
{
  [(PurchaseAuthenticateOperation *)self lock];
  [(SSMutableAuthenticationContext *)self->_authenticationContext setClientIdentifierHeader:a3];

  [(PurchaseAuthenticateOperation *)self unlock];
}

- (void)run
{
  uint64_t v13 = 0;
  id v14 = 0;
  id v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    int v15 = 138412290;
    uint64_t v16 = objc_opt_class();
    LODWORD(v12) = 12;
    objc_super v11 = &v15;
    uint64_t v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      id v7 = (void *)v6;
      uint64_t v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, &v15, v12);
      free(v7);
      objc_super v11 = (int *)v8;
      SSFileLog();
    }
  }
  id v9 = -[PurchaseAuthenticateOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:](self, "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:", &v14, 0, self->_authenticationContext, &v13, v11);
  v10 = [(PurchaseAuthenticateOperation *)self authenticationBlock];
  if (v10) {
    v10[2](v10, v14, v13);
  }
  [(PurchaseAuthenticateOperation *)self setError:v13];
  [(PurchaseAuthenticateOperation *)self setSuccess:v9];
}

- (id)_clientIdentifierForPurchases:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v13;
  uint64_t v8 = SSDownloadPropertyKind;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      [*(id *)(*((void *)&v12 + 1) + 8 * i) valueForDownloadProperty:v8];
      v10 = (void *)SSClientIdentifierForDownloadKind();
      if (v6)
      {
        if (v10 && ![v10 isEqualToString:v6]) {
          return 0;
        }
      }
      else
      {
        uint64_t v6 = v10;
      }
    }
    id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
  return v6;
}

- (id)_userAgentForPurchases:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v13;
  uint64_t v8 = SSHTTPHeaderUserAgent;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      id v10 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "requestProperties"), "HTTPHeaders"), "objectForKey:", v8);
      if (v6)
      {
        if (v10 && ![v10 isEqualToString:v6]) {
          return 0;
        }
      }
      else
      {
        uint64_t v6 = v10;
      }
    }
    id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
  return v6;
}

@end