@interface GetAutomaticDownloadKindsOperation
- (NSArray)enabledDownloadKinds;
- (SSAuthenticationContext)authenticationContext;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
@end

@implementation GetAutomaticDownloadKindsOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GetAutomaticDownloadKindsOperation;
  [(GetAutomaticDownloadKindsOperation *)&v3 dealloc];
}

- (SSAuthenticationContext)authenticationContext
{
  [(GetAutomaticDownloadKindsOperation *)self lock];
  objc_super v3 = self->_authContext;
  [(GetAutomaticDownloadKindsOperation *)self unlock];
  return v3;
}

- (NSArray)enabledDownloadKinds
{
  [(GetAutomaticDownloadKindsOperation *)self lock];
  objc_super v3 = self->_enabledDownloadKinds;
  [(GetAutomaticDownloadKindsOperation *)self unlock];
  return v3;
}

- (void)setAuthenticationContext:(id)a3
{
  [(GetAutomaticDownloadKindsOperation *)self lock];
  authContext = self->_authContext;
  if (authContext != a3)
  {

    self->_authContext = (SSAuthenticationContext *)[a3 copy];
  }

  [(GetAutomaticDownloadKindsOperation *)self unlock];
}

- (void)run
{
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  objc_msgSend(v3, "setAuthenticationContext:", -[GetAutomaticDownloadKindsOperation authenticationContext](self, "authenticationContext"));
  objc_msgSend(v3, "setDataProvider:", +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v3 setUseUserSpecificURLBag:1];
  id v4 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v4 setURLBagKey:@"enabled-media-types"];
  [v3 setRequestProperties:v4];

  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v32 = 138412290;
    uint64_t v33 = objc_opt_class();
    LODWORD(v30) = 12;
    v28 = &v32;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v32, v30);
      free(v9);
      v28 = (int *)v10;
      SSFileLog();
    }
  }
  v31 = 0;
  id v11 = -[GetAutomaticDownloadKindsOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v31, v28);
  if (v11)
  {
    id v12 = objc_msgSend(objc_msgSend(v3, "dataProvider"), "output");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [v12 objectForKey:@"enabled-media-kinds"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = +[SSLogConfig sharedDaemonConfig];
        if (!v14) {
          id v14 = +[SSLogConfig sharedConfig];
        }
        unsigned int v15 = [v14 shouldLog];
        if ([v14 shouldLogToDisk]) {
          int v16 = v15 | 2;
        }
        else {
          int v16 = v15;
        }
        if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_INFO)) {
          v16 &= 2u;
        }
        if (v16)
        {
          uint64_t v17 = objc_opt_class();
          int v32 = 138412546;
          uint64_t v33 = v17;
          __int16 v34 = 2112;
          id v35 = v13;
          LODWORD(v30) = 22;
          v29 = &v32;
          uint64_t v18 = _os_log_send_and_compose_impl();
          if (v18)
          {
            v19 = (void *)v18;
            v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v32, v30);
            free(v19);
            v29 = (int *)v20;
            SSFileLog();
          }
        }
        [(GetAutomaticDownloadKindsOperation *)self lock];

        self->_enabledDownloadKinds = (NSArray *)v13;
        [(GetAutomaticDownloadKindsOperation *)self unlock];
      }
    }
  }
  else
  {
    id v21 = +[SSLogConfig sharedDaemonConfig];
    if (!v21) {
      id v21 = +[SSLogConfig sharedConfig];
    }
    unsigned int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v23 &= 2u;
    }
    if (v23)
    {
      uint64_t v24 = objc_opt_class();
      int v32 = 138412546;
      uint64_t v33 = v24;
      __int16 v34 = 2112;
      id v35 = v31;
      LODWORD(v30) = 22;
      v29 = &v32;
      uint64_t v25 = _os_log_send_and_compose_impl();
      if (v25)
      {
        v26 = (void *)v25;
        v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v32, v30);
        free(v26);
        v29 = (int *)v27;
        SSFileLog();
      }
    }
  }
  -[GetAutomaticDownloadKindsOperation setError:](self, "setError:", v31, v29);
  [(GetAutomaticDownloadKindsOperation *)self setSuccess:v11];
}

@end