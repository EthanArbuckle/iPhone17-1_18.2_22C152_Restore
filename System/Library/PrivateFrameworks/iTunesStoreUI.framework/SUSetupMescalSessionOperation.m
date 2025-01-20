@interface SUSetupMescalSessionOperation
- (BOOL)_isMescalEnabled;
- (SUMescalSession)mescalSession;
- (SUSetupMescalSessionOperation)initWithURLRequestProperties:(id)a3;
- (id)_setupSAPCertificate:(id *)a3;
- (id)_setupSAPWithData:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)run;
@end

@implementation SUSetupMescalSessionOperation

- (SUSetupMescalSessionOperation)initWithURLRequestProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUSetupMescalSessionOperation;
  v4 = [(SUSetupMescalSessionOperation *)&v6 init];
  if (v4) {
    v4->_requestProperties = (SSURLRequestProperties *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUSetupMescalSessionOperation;
  [(SUSetupMescalSessionOperation *)&v3 dealloc];
}

- (SUMescalSession)mescalSession
{
  [(SUSetupMescalSessionOperation *)self lock];
  objc_super v3 = self->_session;
  [(SUSetupMescalSessionOperation *)self unlock];
  return v3;
}

- (void)run
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  if ([(SUSetupMescalSessionOperation *)self _isMescalEnabled])
  {
    objc_super v3 = objc_alloc_init(SUMescalSession);
    id v4 = [(SUSetupMescalSessionOperation *)self _setupSAPCertificate:&v24];
    if (!v4) {
      goto LABEL_8;
    }
    uint64_t v5 = [(SUMescalSession *)v3 exchangeData:v4 error:&v24];
    if (v5)
    {
      [(SUMescalSession *)v3 exchangeData:[(SUSetupMescalSessionOperation *)self _setupSAPWithData:v5 error:&v24] error:&v24];
    }
    else
    {
      v15 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v16 = [v15 shouldLog];
      if ([v15 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v17 &= 2u;
      }
      if (v17)
      {
        uint64_t v18 = objc_opt_class();
        int v25 = 138412546;
        uint64_t v26 = v18;
        __int16 v27 = 2112;
        uint64_t v28 = v24;
        LODWORD(v23) = 22;
        v22 = &v25;
        uint64_t v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          v20 = (void *)v19;
          uint64_t v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v25, v23);
          free(v20);
          v22 = (int *)v21;
          SSFileLog();
        }
      }
    }
    if ([(SUMescalSession *)v3 isComplete])
    {
      [(SUSetupMescalSessionOperation *)self lock];

      self->_session = v3;
      [(SUSetupMescalSessionOperation *)self unlock];
      uint64_t v6 = 1;
    }
    else
    {
LABEL_8:
      v8 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v9 = [v8 shouldLog];
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
        uint64_t v11 = objc_opt_class();
        int v25 = 138412546;
        uint64_t v26 = v11;
        __int16 v27 = 2112;
        uint64_t v28 = v24;
        LODWORD(v23) = 22;
        v22 = &v25;
        uint64_t v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          v13 = (void *)v12;
          uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v25, v23);
          free(v13);
          v22 = (int *)v14;
          SSFileLog();
        }
      }
      uint64_t v6 = 0;
    }

    uint64_t v7 = v24;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  -[SUSetupMescalSessionOperation setError:](self, "setError:", v7, v22);
  [(SUSetupMescalSessionOperation *)self setSuccess:v6];
}

- (BOOL)_isMescalEnabled
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", -[SSURLRequestProperties URLBagType](self->_requestProperties, "URLBagType"));
  if (self->_requestProperties)
  {
    uint64_t v4 = v3;
    int v5 = [(SUSetupMescalSessionOperation *)self loadURLBagWithContext:v3 returningError:0];
    if (v5)
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache"), "URLBagForContext:", v4);
      uint64_t v7 = (void *)[(SSURLRequestProperties *)self->_requestProperties URL];
      if (!v7)
      {
        uint64_t v8 = [(SSURLRequestProperties *)self->_requestProperties URLBagURLBlock];
        if (v8)
        {
          uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v8, v4);
        }
        else
        {
          uint64_t v10 = [(SSURLRequestProperties *)self->_requestProperties URLBagKey];
          if (!v10) {
            goto LABEL_21;
          }
          uint64_t v9 = [v6 urlForKey:v10];
        }
        uint64_t v7 = (void *)v9;
        if (!v9) {
          goto LABEL_21;
        }
      }
      uint64_t v11 = [v6 valueForKey:@"account-flow-url-patterns"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v11 options:1 error:0];
        if (v12)
        {
          v13 = (void *)v12;
          uint64_t v14 = (void *)[v7 absoluteString];
          uint64_t v15 = objc_msgSend(v13, "rangeOfFirstMatchInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length"));

          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v22 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
            int v23 = [v22 shouldLog];
            if ([v22 shouldLogToDisk]) {
              int v24 = v23 | 2;
            }
            else {
              int v24 = v23;
            }
            if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_DEBUG)) {
              v24 &= 2u;
            }
            if (!v24)
            {
              int v20 = 1;
              goto LABEL_22;
            }
            int v27 = 138412546;
            uint64_t v28 = objc_opt_class();
            __int16 v29 = 2112;
            v30 = v7;
            LODWORD(v26) = 22;
            uint64_t v19 = _os_log_send_and_compose_impl();
            int v20 = 1;
            if (!v19) {
              goto LABEL_22;
            }
            goto LABEL_20;
          }
        }
      }
      int v16 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v17 = [v16 shouldLog];
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
        int v27 = 138412546;
        uint64_t v28 = objc_opt_class();
        __int16 v29 = 2112;
        v30 = v7;
        LODWORD(v26) = 22;
        uint64_t v19 = _os_log_send_and_compose_impl();
        int v20 = 0;
        if (!v19)
        {
LABEL_22:
          LOBYTE(v5) = v20 != 0;
          return v5;
        }
LABEL_20:
        uint64_t v21 = (void *)v19;
        objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v27, v26);
        free(v21);
        SSFileLog();
        goto LABEL_22;
      }
LABEL_21:
      int v20 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)_setupSAPCertificate:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v23 = 0;
  id v5 = objc_alloc_init(MEMORY[0x263F89528]);
  objc_msgSend(v5, "setDataProvider:", objc_msgSend(MEMORY[0x263F89500], "provider"));
  id v6 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v6 setAllowedRetryCount:0];
  [v6 setURLBagKey:@"sign-sap-setup-cert"];
  [v5 setRequestProperties:v6];

  uint64_t v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v24 = 138412290;
    uint64_t v25 = objc_opt_class();
    LODWORD(v22) = 12;
    uint64_t v21 = &v24;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v24, v22);
      free(v11);
      uint64_t v21 = (int *)v12;
      SSFileLog();
    }
  }
  if (-[SUSetupMescalSessionOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v5, &v23, v21))
  {
    id v13 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "dataProvider"), "output"), "objectForKey:", @"sign-sap-setup-cert");
    if (!v13)
    {
      uint64_t v14 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v16 &= 2u;
      }
      if (v16)
      {
        uint64_t v17 = objc_opt_class();
        int v24 = 138412290;
        uint64_t v25 = v17;
        LODWORD(v22) = 12;
        uint64_t v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v24, v22);
          free(v19);
          SSFileLog();
        }
      }
      id v13 = 0;
      int v23 = (void *)SSError();
    }
  }
  else
  {
    id v13 = 0;
  }

  if (a3 && !v13) {
    *a3 = v23;
  }
  return v13;
}

- (id)_setupSAPWithData:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  id v7 = objc_alloc_init(MEMORY[0x263F89528]);
  objc_msgSend(v7, "setDataProvider:", objc_msgSend(MEMORY[0x263F89500], "provider"));
  id v8 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v8 setAllowedRetryCount:0];
  [v8 setHTTPMethod:@"POST"];
  [v8 setURLBagKey:@"sign-sap-setup"];
  [v8 setValue:a3 forRequestParameter:@"sign-sap-setup-buffer"];
  [v7 setRequestProperties:v8];

  int v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v11 &= 2u;
  }
  if (v11)
  {
    int v26 = 138412290;
    uint64_t v27 = objc_opt_class();
    LODWORD(v24) = 12;
    int v23 = &v26;
    uint64_t v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      id v13 = (void *)v12;
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v26, v24);
      free(v13);
      int v23 = (int *)v14;
      SSFileLog();
    }
  }
  if (-[SUSetupMescalSessionOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, &v25, v23))
  {
    id v15 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "dataProvider"), "output"), "objectForKey:", @"sign-sap-setup-buffer");
    if (!v15)
    {
      int v16 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v17 = [v16 shouldLog];
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
        int v26 = 138412290;
        uint64_t v27 = v19;
        LODWORD(v24) = 12;
        uint64_t v20 = _os_log_send_and_compose_impl();
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v26, v24);
          free(v21);
          SSFileLog();
        }
      }
      id v15 = 0;
      uint64_t v25 = (void *)SSError();
    }
  }
  else
  {
    id v15 = 0;
  }

  if (a4 && !v15) {
    *a4 = v25;
  }
  return v15;
}

@end