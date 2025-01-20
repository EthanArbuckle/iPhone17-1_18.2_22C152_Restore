@interface CheckPreorderQueueOperation
- (CheckPreorderQueueOperation)initWithAccountIdentifier:(id)a3;
- (NSNumber)accountIdentifier;
- (id)_newURLOperation;
- (int64_t)numberOfPreordersInQueue;
- (void)dealloc;
- (void)run;
@end

@implementation CheckPreorderQueueOperation

- (CheckPreorderQueueOperation)initWithAccountIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CheckPreorderQueueOperation;
  v4 = [(CheckPreorderQueueOperation *)&v6 init];
  if (v4) {
    v4->_accountID = (NSNumber *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CheckPreorderQueueOperation;
  [(CheckPreorderQueueOperation *)&v3 dealloc];
}

- (NSNumber)accountIdentifier
{
  v2 = self->_accountID;

  return v2;
}

- (int64_t)numberOfPreordersInQueue
{
  [(CheckPreorderQueueOperation *)self lock];
  int64_t numberOfPreorders = self->_numberOfPreorders;
  [(CheckPreorderQueueOperation *)self unlock];
  return numberOfPreorders;
}

- (void)run
{
  id v3 = [(CheckPreorderQueueOperation *)self _newURLOperation];
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
    int v31 = 138412290;
    uint64_t v32 = objc_opt_class();
    LODWORD(v29) = 12;
    v27 = &v31;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v31, v29);
      free(v8);
      v27 = (int *)v9;
      SSFileLog();
    }
  }
  v30 = 0;
  id v10 = -[CheckPreorderQueueOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v30, v27);
  if (v10)
  {
    id v11 = objc_msgSend(objc_msgSend(v3, "dataProvider"), "output");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v11 objectForKey:@"pre-order-queue-count"];
      if (objc_opt_respondsToSelector())
      {
        id v13 = +[SSLogConfig sharedDaemonConfig];
        if (!v13) {
          id v13 = +[SSLogConfig sharedConfig];
        }
        unsigned int v14 = [v13 shouldLog];
        if ([v13 shouldLogToDisk]) {
          int v15 = v14 | 2;
        }
        else {
          int v15 = v14;
        }
        if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_INFO)) {
          v15 &= 2u;
        }
        if (v15)
        {
          uint64_t v16 = objc_opt_class();
          int v31 = 138412546;
          uint64_t v32 = v16;
          __int16 v33 = 2112;
          id v34 = v12;
          LODWORD(v29) = 22;
          v28 = &v31;
          uint64_t v17 = _os_log_send_and_compose_impl();
          if (v17)
          {
            v18 = (void *)v17;
            v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v31, v29);
            free(v18);
            v28 = (int *)v19;
            SSFileLog();
          }
        }
        [(CheckPreorderQueueOperation *)self lock];
        self->_int64_t numberOfPreorders = (int)[v12 intValue];
        [(CheckPreorderQueueOperation *)self unlock];
      }
    }
  }
  else
  {
    id v20 = +[SSLogConfig sharedDaemonConfig];
    if (!v20) {
      id v20 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v22 &= 2u;
    }
    if (v22)
    {
      uint64_t v23 = objc_opt_class();
      int v31 = 138412546;
      uint64_t v32 = v23;
      __int16 v33 = 2112;
      id v34 = v30;
      LODWORD(v29) = 22;
      v28 = &v31;
      uint64_t v24 = _os_log_send_and_compose_impl();
      if (v24)
      {
        v25 = (void *)v24;
        v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v31, v29);
        free(v25);
        v28 = (int *)v26;
        SSFileLog();
      }
    }
  }
  -[CheckPreorderQueueOperation setError:](self, "setError:", v30, v28);
  [(CheckPreorderQueueOperation *)self setSuccess:v10];
}

- (id)_newURLOperation
{
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  id v4 = objc_alloc_init(DaemonProtocolDataProvider);
  [v3 setDataProvider:v4];

  id v5 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:self->_accountID];
  [v3 setAuthenticationContext:v5];

  id v6 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v6 setCachePolicy:1];
  [v6 setURLBagKey:@"p2-check-pre-order-queue"];
  [v3 setRequestProperties:v6];

  return v3;
}

@end