@interface ShowServerPromptOperation
- (BOOL)_automaticDownloadsPromptNeedsDisplay;
- (BOOL)_promptNeedsDisplay;
- (NSString)promptIdentifier;
- (ShowServerPromptOperation)init;
- (ShowServerPromptOperation)initWithPromptIdentifier:(id)a3;
- (id)_newStoreURLOperation:(id *)a3;
- (void)dealloc;
- (void)run;
@end

@implementation ShowServerPromptOperation

- (ShowServerPromptOperation)init
{
  return [(ShowServerPromptOperation *)self initWithPromptIdentifier:0];
}

- (ShowServerPromptOperation)initWithPromptIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ShowServerPromptOperation;
  v4 = [(ShowServerPromptOperation *)&v6 init];
  if (v4) {
    v4->_promptIdentifier = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ShowServerPromptOperation;
  [(ShowServerPromptOperation *)&v3 dealloc];
}

- (NSString)promptIdentifier
{
  v2 = self->_promptIdentifier;

  return v2;
}

- (void)run
{
  if ([(ShowServerPromptOperation *)self _promptNeedsDisplay])
  {
    uint64_t v31 = 0;
    id v3 = [(ShowServerPromptOperation *)self _newStoreURLOperation:&v31];
    id v4 = +[SSLogConfig sharedDaemonConfig];
    id v5 = v4;
    if (v3)
    {
      if (!v4) {
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
        uint64_t v8 = objc_opt_class();
        promptIdentifier = self->_promptIdentifier;
        int v32 = 138412546;
        uint64_t v33 = v8;
        __int16 v34 = 2112;
        v35 = promptIdentifier;
        LODWORD(v30) = 22;
        v29 = &v32;
        uint64_t v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v32, v30);
          free(v11);
          v29 = (int *)v12;
          SSFileLog();
        }
      }
      id v13 = -[ShowServerPromptOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v31, v29);
      if (v13) {
        +[SSDevice setPromptWithIdentifier:self->_promptIdentifier needsDisplay:0];
      }
      else {
        +[SSDevice setLastPromptAttemptDate:forPromptWithIdentifier:](SSDevice, "setLastPromptAttemptDate:forPromptWithIdentifier:", +[NSDate date], self->_promptIdentifier);
      }
      CFPreferencesAppSynchronize(kSSUserDefaultsIdentifier);
    }
    else
    {
      if (!v4) {
        id v5 = +[SSLogConfig sharedConfig];
      }
      unsigned int v22 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v23 = v22 | 2;
      }
      else {
        int v23 = v22;
      }
      if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v23 &= 2u;
      }
      if (v23)
      {
        uint64_t v24 = objc_opt_class();
        v25 = self->_promptIdentifier;
        int v32 = 138412546;
        uint64_t v33 = v24;
        __int16 v34 = 2112;
        v35 = v25;
        LODWORD(v30) = 22;
        v29 = &v32;
        uint64_t v26 = _os_log_send_and_compose_impl();
        if (v26)
        {
          v27 = (void *)v26;
          v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v32, v30);
          free(v27);
          v29 = (int *)v28;
          SSFileLog();
        }
      }
      id v13 = 0;
    }
    -[ShowServerPromptOperation setError:](self, "setError:", v31, v29);
    [(ShowServerPromptOperation *)self setSuccess:v13];
  }
  else
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
      v18 = self->_promptIdentifier;
      int v32 = 138412546;
      uint64_t v33 = v17;
      __int16 v34 = 2112;
      v35 = v18;
      LODWORD(v30) = 22;
      v29 = &v32;
      uint64_t v19 = _os_log_send_and_compose_impl();
      if (v19)
      {
        v20 = (void *)v19;
        v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v32, v30);
        free(v20);
        v29 = (int *)v21;
        SSFileLog();
      }
    }
    -[ShowServerPromptOperation setSuccess:](self, "setSuccess:", 1, v29);
    +[SSDevice setLastPromptAttemptDate:forPromptWithIdentifier:](SSDevice, "setLastPromptAttemptDate:forPromptWithIdentifier:", +[NSDate date], self->_promptIdentifier);
    CFPreferencesAppSynchronize(kSSUserDefaultsIdentifier);
  }
}

- (BOOL)_automaticDownloadsPromptNeedsDisplay
{
  id v2 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  unsigned int v3 = [v2 isManagedAppleID] ^ 1;
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

- (id)_newStoreURLOperation:(id *)a3
{
  if (![(NSString *)self->_promptIdentifier isEqualToString:SSDevicePromptIdentifierAutomaticDownloadsAvailable])return 0; {
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  }
  objc_msgSend(v3, "setDataProvider:", +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v3 setUseUserSpecificURLBag:1];
  id v4 = objc_msgSend(objc_alloc((Class)SSAuthenticationContext), "initWithAccount:", objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"));
  [v3 setAuthenticationContext:v4];

  id v5 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v5 setURLBagURLBlock:&stru_1003A5170];
  objc_msgSend(v5, "setValue:forRequestParameter:", -[ISDevice guid](+[ISDevice sharedInstance](ISDevice, "sharedInstance"), "guid"), @"guid");
  [v3 setRequestProperties:v5];

  return v3;
}

- (BOOL)_promptNeedsDisplay
{
  CFPreferencesAppSynchronize(kSSUserDefaultsIdentifier);
  if (!+[SSDevice promptNeedsDisplay:self->_promptIdentifier]|| ![(NSString *)self->_promptIdentifier isEqualToString:SSDevicePromptIdentifierAutomaticDownloadsAvailable])
  {
    return 0;
  }

  return [(ShowServerPromptOperation *)self _automaticDownloadsPromptNeedsDisplay];
}

@end