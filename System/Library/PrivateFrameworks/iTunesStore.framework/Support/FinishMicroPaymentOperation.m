@interface FinishMicroPaymentOperation
- (BOOL)_parseResponse:(id)a3 returningError:(id *)a4;
- (NSNumber)userDSID;
- (NSString)transactionIdentifier;
- (StoreKitClientIdentity)clientIdentity;
- (void)dealloc;
- (void)run;
- (void)setClientIdentity:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setUserDSID:(id)a3;
@end

@implementation FinishMicroPaymentOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FinishMicroPaymentOperation;
  [(FinishMicroPaymentOperation *)&v3 dealloc];
}

- (StoreKitClientIdentity)clientIdentity
{
  [(FinishMicroPaymentOperation *)self lock];
  objc_super v3 = self->_clientIdentity;
  [(FinishMicroPaymentOperation *)self unlock];
  return v3;
}

- (void)setClientIdentity:(id)a3
{
  [(FinishMicroPaymentOperation *)self lock];
  clientIdentity = self->_clientIdentity;
  if (clientIdentity != a3)
  {

    self->_clientIdentity = (StoreKitClientIdentity *)[a3 copy];
  }

  [(FinishMicroPaymentOperation *)self unlock];
}

- (void)setTransactionIdentifier:(id)a3
{
  [(FinishMicroPaymentOperation *)self lock];
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier != a3)
  {

    self->_transactionIdentifier = (NSString *)[a3 copy];
  }

  [(FinishMicroPaymentOperation *)self unlock];
}

- (void)setUserDSID:(id)a3
{
  [(FinishMicroPaymentOperation *)self lock];
  userDSID = self->_userDSID;
  if (userDSID != a3)
  {

    self->_userDSID = (NSNumber *)a3;
  }

  [(FinishMicroPaymentOperation *)self unlock];
}

- (NSString)transactionIdentifier
{
  [(FinishMicroPaymentOperation *)self lock];
  objc_super v3 = self->_transactionIdentifier;
  [(FinishMicroPaymentOperation *)self unlock];
  return v3;
}

- (NSNumber)userDSID
{
  [(FinishMicroPaymentOperation *)self lock];
  objc_super v3 = self->_userDSID;
  [(FinishMicroPaymentOperation *)self unlock];
  return v3;
}

- (void)run
{
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  v4 = objc_alloc_init(DaemonProtocolDataProvider);
  [v3 setDataProvider:v4];
  id v5 = objc_msgSend(objc_alloc((Class)SSMutableAuthenticationContext), "initWithAccountIdentifier:", -[FinishMicroPaymentOperation userDSID](self, "userDSID"));
  objc_msgSend(v5, "setAllowsBootstrapCellularData:", -[StoreKitClientIdentity allowsBootstrapCellularData](self->_clientIdentity, "allowsBootstrapCellularData"));
  [v5 setTokenType:1];
  [v3 setAuthenticationContext:v5];

  id v6 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", -[FinishMicroPaymentOperation transactionIdentifier](self, "transactionIdentifier"), @"transactionId", 0);
  id v7 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  objc_msgSend(v7, "setAllowsBootstrapCellularData:", -[StoreKitClientIdentity allowsBootstrapCellularData](self->_clientIdentity, "allowsBootstrapCellularData"));
  [v7 setCachePolicy:1];
  [v7 setRequestParameters:v6];
  [v7 setURLBagKey:@"p2-in-app-transaction-done"];
  if ([(StoreKitClientIdentity *)[(FinishMicroPaymentOperation *)self clientIdentity] isSandboxed])
  {
    [v7 setURLBagType:1];
  }
  [v3 setRequestProperties:v7];

  uint64_t v17 = 0;
  id v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8) {
    id v8 = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_INFO)) {
    v10 &= 2u;
  }
  if (v10)
  {
    int v18 = 138412546;
    uint64_t v19 = objc_opt_class();
    __int16 v20 = 2112;
    v21 = [(FinishMicroPaymentOperation *)self transactionIdentifier];
    LODWORD(v16) = 22;
    v15 = &v18;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v18, v16);
      free(v12);
      v15 = (int *)v13;
      SSFileLog();
    }
  }
  if (-[FinishMicroPaymentOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v17, v15))
  {
    BOOL v14 = [(FinishMicroPaymentOperation *)self _parseResponse:[(DaemonProtocolDataProvider *)v4 output] returningError:&v17];
    [(FinishMicroPaymentOperation *)self setError:v17];
    [(FinishMicroPaymentOperation *)self setSuccess:v14];
  }
  else
  {
    [(FinishMicroPaymentOperation *)self setError:v17];
  }
}

- (BOOL)_parseResponse:(id)a3 returningError:(id *)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      *(_DWORD *)int v18 = 138412290;
      *(void *)&v18[4] = objc_opt_class();
      LODWORD(v17) = 12;
LABEL_21:
      BOOL v14 = (void *)_os_log_send_and_compose_impl();
      if (v14)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v18, v17, *(_OWORD *)v18);
        free(v14);
        SSFileLog();
      }
    }
LABEL_23:
    v15 = (void *)ISError();
    BOOL result = 0;
    if (!a4) {
      return result;
    }
    goto LABEL_24;
  }
  id v6 = [a3 objectForKey:kISFailureTypeKey];
  if (v6)
  {
    id v7 = v6;
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      *(_DWORD *)int v18 = 138412546;
      *(void *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v7;
      LODWORD(v17) = 22;
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  v15 = 0;
  BOOL result = 1;
  if (!a4) {
    return result;
  }
LABEL_24:
  *a4 = v15;
  return result;
}

@end