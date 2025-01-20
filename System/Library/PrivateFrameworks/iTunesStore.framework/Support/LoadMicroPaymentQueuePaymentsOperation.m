@interface LoadMicroPaymentQueuePaymentsOperation
- (BOOL)_appendRangeRequestsToResponse:(id)a3 error:(id *)a4;
- (BOOL)_loadResponseReturningError:(id *)a3;
- (BOOL)_parsePropertyList:(id)a3 error:(id *)a4;
- (MicroPaymentQueueRequest)request;
- (MicroPaymentQueueResponse)response;
- (NSString)URLBagKey;
- (void)dealloc;
- (void)run;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setURLBagKey:(id)a3;
@end

@implementation LoadMicroPaymentQueuePaymentsOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LoadMicroPaymentQueuePaymentsOperation;
  [(LoadMicroPaymentQueuePaymentsOperation *)&v3 dealloc];
}

- (void)run
{
  uint64_t v4 = 0;
  BOOL v3 = [(LoadMicroPaymentQueuePaymentsOperation *)self _loadResponseReturningError:&v4];
  [(LoadMicroPaymentQueuePaymentsOperation *)self setError:v4];
  [(LoadMicroPaymentQueuePaymentsOperation *)self setSuccess:v3];
}

- (BOOL)_appendRangeRequestsToResponse:(id)a3 error:(id *)a4
{
  id v22 = 0;
  v7 = [(LoadMicroPaymentQueuePaymentsOperation *)self request];
  v8 = [(LoadMicroPaymentQueuePaymentsOperation *)self URLBagKey];
  id v21 = a3;
  id v9 = [a3 rangesToLoad];
  uint64_t v10 = (uint64_t)[v9 count];
  if (v10 < 1)
  {
    LOBYTE(v16) = 1;
    if (!a4) {
      return v16;
    }
    goto LABEL_11;
  }
  uint64_t v11 = v10;
  v20 = a4;
  uint64_t v12 = 2;
  do
  {
    id v13 = objc_alloc_init((Class)NSAutoreleasePool);
    v14 = objc_alloc_init(LoadMicroPaymentQueuePaymentsOperation);
    [(LoadMicroPaymentQueuePaymentsOperation *)v14 setURLBagKey:v8];
    id v15 = [(MicroPaymentQueueRequest *)v7 copy];
    objc_msgSend(v15, "setRangeEndIdentifier:", objc_msgSend(v9, "objectAtIndex:", v12 - 1));
    objc_msgSend(v15, "setRangeStartIdentifier:", objc_msgSend(v9, "objectAtIndex:", v12 - 2));
    [(LoadMicroPaymentQueuePaymentsOperation *)v14 setRequest:v15];
    unsigned int v16 = [(LoadMicroPaymentQueuePaymentsOperation *)self runSubOperation:v14 returningError:&v22];
    if (v16) {
      objc_msgSend(v21, "appendResponse:", -[LoadMicroPaymentQueuePaymentsOperation response](v14, "response"));
    }
    else {
      id v17 = v22;
    }

    [v13 drain];
    if (v12 < v11) {
      char v18 = v16;
    }
    else {
      char v18 = 0;
    }
    v12 += 2;
  }
  while ((v18 & 1) != 0);
  a4 = v20;
  if (v20) {
LABEL_11:
  }
    *a4 = v22;
  return v16;
}

- (BOOL)_loadResponseReturningError:(id *)a3
{
  id v21 = 0;
  v5 = [(LoadMicroPaymentQueuePaymentsOperation *)self request];
  id v6 = [(MicroPaymentQueueRequest *)v5 newStoreURLOperation:&v21];
  [v6 setDelegate:self];
  if (!v6)
  {
    BOOL v17 = 0;
    if (!a3) {
      return v17;
    }
    goto LABEL_18;
  }
  v7 = objc_alloc_init(DaemonProtocolDataProvider);
  [v6 setDataProvider:v7];
  id v8 = objc_msgSend(objc_msgSend(v6, "requestProperties"), "mutableCopy");
  objc_msgSend(v8, "setURLBagKey:", -[LoadMicroPaymentQueuePaymentsOperation URLBagKey](self, "URLBagKey"));
  [v6 setRequestProperties:v8];

  id v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9) {
    id v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_INFO)) {
    v11 &= 2u;
  }
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    id v13 = [(LoadMicroPaymentQueuePaymentsOperation *)self URLBagKey];
    int v22 = 138412802;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    v25 = v13;
    __int16 v26 = 2112;
    v27 = v5;
    LODWORD(v20) = 32;
    v19 = &v22;
    uint64_t v14 = _os_log_send_and_compose_impl();
    if (v14)
    {
      id v15 = (void *)v14;
      unsigned int v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v22, v20);
      free(v15);
      v19 = (int *)v16;
      SSFileLog();
    }
  }
  if (-[LoadMicroPaymentQueuePaymentsOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v6, &v21, v19))BOOL v17 = [(LoadMicroPaymentQueuePaymentsOperation *)self _parsePropertyList:[(DaemonProtocolDataProvider *)v7 output] error:&v21]; {
  else
  }
    BOOL v17 = 0;

  [v6 setDelegate:0];
  if (a3) {
LABEL_18:
  }
    *a3 = v21;
  return v17;
}

- (BOOL)_parsePropertyList:(id)a3 error:(id *)a4
{
  v34 = 0;
  v7 = objc_alloc_init(MicroPaymentQueueResponse);
  [(MicroPaymentQueueResponse *)v7 setUserIdentifier:[(MicroPaymentQueueRequest *)[(LoadMicroPaymentQueuePaymentsOperation *)self request] userIdentifier]];
  unsigned __int8 v8 = [(MicroPaymentQueueResponse *)v7 loadFromPropertyList:a3];
  id v9 = +[SSLogConfig sharedDaemonConfig];
  id v10 = v9;
  if (v8)
  {
    if (!v9) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v35 = 138412802;
      uint64_t v36 = objc_opt_class();
      __int16 v37 = 2048;
      *(void *)v38 = [(NSArray *)[(MicroPaymentQueueResponse *)v7 payments] count];
      *(_WORD *)&v38[8] = 2112;
      *(void *)&v38[10] = [(LoadMicroPaymentQueuePaymentsOperation *)self request];
      LODWORD(v33) = 32;
      v31 = &v35;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        id v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v35, v33);
        free(v14);
        v31 = (int *)v15;
        SSFileLog();
      }
    }
    if (-[LoadMicroPaymentQueuePaymentsOperation _appendRangeRequestsToResponse:error:](self, "_appendRangeRequestsToResponse:error:", v7, &v34, v31))
    {
      id v16 = +[SSLogConfig sharedDaemonConfig];
      if (!v16) {
        id v16 = +[SSLogConfig sharedConfig];
      }
      unsigned int v17 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      if (!os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v18 &= 2u;
      }
      if (v18)
      {
        uint64_t v19 = objc_opt_class();
        unsigned int v20 = [(NSData *)[(MicroPaymentQueueResponse *)v7 appReceipt] length];
        id v21 = [(StoreKitClientIdentity *)[(MicroPaymentQueueRequest *)[(LoadMicroPaymentQueuePaymentsOperation *)self request] clientIdentity] bundleIdentifier];
        int v35 = 138412802;
        uint64_t v36 = v19;
        __int16 v37 = 1024;
        *(_DWORD *)v38 = v20;
        *(_WORD *)&v38[4] = 2112;
        *(void *)&v38[6] = v21;
        LODWORD(v33) = 28;
        v32 = &v35;
        uint64_t v22 = _os_log_send_and_compose_impl();
        if (v22)
        {
          uint64_t v23 = (void *)v22;
          __int16 v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v35, v33);
          free(v23);
          v32 = (int *)v24;
          SSFileLog();
        }
      }
      if ([(NSData *)[(MicroPaymentQueueResponse *)v7 appReceipt] length]) {
        +[AppReceipt writeReceipt:[(MicroPaymentQueueResponse *)v7 appReceipt] forStoreKitClient:[(MicroPaymentQueueRequest *)[(LoadMicroPaymentQueuePaymentsOperation *)self request] clientIdentity]];
      }
      [(LoadMicroPaymentQueuePaymentsOperation *)self setResponse:v7];
      BOOL v25 = 1;
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    if (!v9) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v26 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v27 &= 2u;
    }
    if (v27)
    {
      int v35 = 138412290;
      uint64_t v36 = objc_opt_class();
      LODWORD(v33) = 12;
      uint64_t v28 = _os_log_send_and_compose_impl();
      if (v28)
      {
        v29 = (void *)v28;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v35, v33);
        free(v29);
        SSFileLog();
      }
    }
    BOOL v25 = 0;
    v34 = (void *)ISError();
  }

  if (a4) {
    *a4 = v34;
  }
  return v25;
}

- (MicroPaymentQueueRequest)request
{
  return (MicroPaymentQueueRequest *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRequest:(id)a3
{
}

- (MicroPaymentQueueResponse)response
{
  return (MicroPaymentQueueResponse *)objc_getProperty(self, a2, 104, 1);
}

- (void)setResponse:(id)a3
{
}

- (NSString)URLBagKey
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setURLBagKey:(id)a3
{
}

@end