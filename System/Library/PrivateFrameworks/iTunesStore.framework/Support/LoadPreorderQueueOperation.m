@interface LoadPreorderQueueOperation
- (LoadPreorderQueueOperation)initWithAccountIdentifier:(id)a3;
- (NSArray)preorderItems;
- (NSNumber)accountIdentifier;
- (id)_newURLOperation;
- (void)dealloc;
- (void)run;
@end

@implementation LoadPreorderQueueOperation

- (LoadPreorderQueueOperation)initWithAccountIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LoadPreorderQueueOperation;
  v4 = [(LoadPreorderQueueOperation *)&v6 init];
  if (v4) {
    v4->_accountID = (NSNumber *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LoadPreorderQueueOperation;
  [(LoadPreorderQueueOperation *)&v3 dealloc];
}

- (NSNumber)accountIdentifier
{
  v2 = self->_accountID;

  return v2;
}

- (NSArray)preorderItems
{
  [(LoadPreorderQueueOperation *)self lock];
  objc_super v3 = self->_items;
  [(LoadPreorderQueueOperation *)self unlock];
  return v3;
}

- (void)run
{
  id v3 = [(LoadPreorderQueueOperation *)self _newURLOperation];
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
  if (os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_INFO)) {
    int v7 = v6;
  }
  else {
    int v7 = v6 & 2;
  }
  if (v7)
  {
    int v49 = 138412290;
    uint64_t v50 = objc_opt_class();
    LODWORD(v41) = 12;
    v39 = &v49;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v49, v41);
      free(v9);
      v39 = (int *)v10;
      SSFileLog();
    }
  }
  v47 = 0;
  id v11 = -[LoadPreorderQueueOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v47, v39);
  if (v11)
  {
    id v12 = objc_msgSend(objc_msgSend(v3, "dataProvider"), "output");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [v12 objectForKey:@"items"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v42 = v3;
        id v14 = objc_alloc_init((Class)NSMutableArray);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v15 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v44;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v44 != v17) {
                objc_enumerationMutation(v13);
              }
              uint64_t v19 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v20 = [objc_alloc((Class)SSItem) initWithItemDictionary:v19];
                if (v20)
                {
                  v21 = v20;
                  [v14 addObject:v20];
                }
              }
            }
            id v16 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v16);
        }
        id v22 = +[SSLogConfig sharedDaemonConfig];
        if (!v22) {
          id v22 = +[SSLogConfig sharedConfig];
        }
        unsigned int v23 = [v22 shouldLog];
        if ([v22 shouldLogToDisk]) {
          int v24 = v23 | 2;
        }
        else {
          int v24 = v23;
        }
        if (os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_INFO)) {
          int v25 = v24;
        }
        else {
          int v25 = v24 & 2;
        }
        if (v25)
        {
          uint64_t v26 = objc_opt_class();
          id v27 = [v14 count];
          int v49 = 138412546;
          uint64_t v50 = v26;
          __int16 v51 = 2048;
          id v52 = v27;
          LODWORD(v41) = 22;
          v40 = &v49;
          uint64_t v28 = _os_log_send_and_compose_impl();
          if (v28)
          {
            v29 = (void *)v28;
            v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v49, v41);
            free(v29);
            v40 = (int *)v30;
            SSFileLog();
          }
        }
        [(LoadPreorderQueueOperation *)self lock];

        self->_items = (NSArray *)[v14 copy];
        [(LoadPreorderQueueOperation *)self unlock];

        id v3 = v42;
      }
    }
  }
  else
  {
    id v31 = +[SSLogConfig sharedDaemonConfig];
    if (!v31) {
      id v31 = +[SSLogConfig sharedConfig];
    }
    unsigned int v32 = [v31 shouldLog];
    if ([v31 shouldLogToDisk]) {
      int v33 = v32 | 2;
    }
    else {
      int v33 = v32;
    }
    if (os_log_type_enabled((os_log_t)[v31 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v34 = v33;
    }
    else {
      int v34 = v33 & 2;
    }
    if (v34)
    {
      uint64_t v35 = objc_opt_class();
      int v49 = 138412546;
      uint64_t v50 = v35;
      __int16 v51 = 2112;
      id v52 = v47;
      LODWORD(v41) = 22;
      v40 = &v49;
      uint64_t v36 = _os_log_send_and_compose_impl();
      if (v36)
      {
        v37 = (void *)v36;
        v38 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v49, v41);
        free(v37);
        v40 = (int *)v38;
        SSFileLog();
      }
    }
  }
  -[LoadPreorderQueueOperation setError:](self, "setError:", v47, v40);
  [(LoadPreorderQueueOperation *)self setSuccess:v11];
}

- (id)_newURLOperation
{
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  [v3 setNeedsAuthentication:1];
  id v4 = objc_alloc_init(DaemonProtocolDataProvider);
  [v3 setDataProvider:v4];

  id v5 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:self->_accountID];
  [v3 setAuthenticationContext:v5];

  id v6 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v6 setCachePolicy:1];
  [v6 setURLBagKey:@"p2-pre-order-queue"];
  [v3 setRequestProperties:v6];

  return v3;
}

@end