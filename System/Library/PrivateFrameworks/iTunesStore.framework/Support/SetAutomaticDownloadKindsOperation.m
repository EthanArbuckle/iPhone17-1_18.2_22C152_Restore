@interface SetAutomaticDownloadKindsOperation
- (BOOL)_isFatalError:(id)a3;
- (BOOL)_postDownloadKinds:(id)a3 error:(id *)a4;
- (BOOL)runsOnlyIfKindsAreDirty;
- (BOOL)shouldSuppressServerDialogs;
- (NSSet)downloadKinds;
- (NSSet)previousDownloadKinds;
- (NSString)clientIdentifierHeader;
- (SSAuthenticationContext)authenticationContext;
- (SetAutomaticDownloadKindsOperation)initWithDownloadKinds:(id)a3;
- (id)_copyFilteredDownloadKinds;
- (id)uniqueKey;
- (void)_run;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setPreviousDownloadKinds:(id)a3;
- (void)setRunsOnlyIfKindsAreDirty:(BOOL)a3;
- (void)setShouldSuppressServerDialogs:(BOOL)a3;
@end

@implementation SetAutomaticDownloadKindsOperation

- (SetAutomaticDownloadKindsOperation)initWithDownloadKinds:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SetAutomaticDownloadKindsOperation;
  v4 = [(SetAutomaticDownloadKindsOperation *)&v6 init];
  if (v4) {
    v4->_downloadKinds = (NSSet *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SetAutomaticDownloadKindsOperation;
  [(SetAutomaticDownloadKindsOperation *)&v3 dealloc];
}

- (SSAuthenticationContext)authenticationContext
{
  [(SetAutomaticDownloadKindsOperation *)self lock];
  objc_super v3 = (SSAuthenticationContext *)[(SSAuthenticationContext *)self->_authenticationContext copy];
  [(SetAutomaticDownloadKindsOperation *)self unlock];
  return v3;
}

- (NSString)clientIdentifierHeader
{
  [(SetAutomaticDownloadKindsOperation *)self lock];
  objc_super v3 = self->_clientIdentifierHeader;
  [(SetAutomaticDownloadKindsOperation *)self unlock];
  return v3;
}

- (NSSet)downloadKinds
{
  v2 = self->_downloadKinds;

  return v2;
}

- (NSSet)previousDownloadKinds
{
  [(SetAutomaticDownloadKindsOperation *)self lock];
  objc_super v3 = (NSSet *)[(NSSet *)self->_previousDownloadKinds copy];
  [(SetAutomaticDownloadKindsOperation *)self unlock];
  return v3;
}

- (BOOL)runsOnlyIfKindsAreDirty
{
  [(SetAutomaticDownloadKindsOperation *)self lock];
  BOOL runsOnlyIfKindsAreDirty = self->_runsOnlyIfKindsAreDirty;
  [(SetAutomaticDownloadKindsOperation *)self unlock];
  return runsOnlyIfKindsAreDirty;
}

- (void)setAuthenticationContext:(id)a3
{
  [(SetAutomaticDownloadKindsOperation *)self lock];
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSAuthenticationContext *)[a3 copy];
  }

  [(SetAutomaticDownloadKindsOperation *)self unlock];
}

- (void)setClientIdentifierHeader:(id)a3
{
  [(SetAutomaticDownloadKindsOperation *)self lock];
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)a3;
  }

  [(SetAutomaticDownloadKindsOperation *)self unlock];
}

- (void)setPreviousDownloadKinds:(id)a3
{
  [(SetAutomaticDownloadKindsOperation *)self lock];
  previousDownloadKinds = self->_previousDownloadKinds;
  if (previousDownloadKinds != a3)
  {

    self->_previousDownloadKinds = (NSSet *)[a3 copy];
  }

  [(SetAutomaticDownloadKindsOperation *)self unlock];
}

- (void)setRunsOnlyIfKindsAreDirty:(BOOL)a3
{
  [(SetAutomaticDownloadKindsOperation *)self lock];
  self->_BOOL runsOnlyIfKindsAreDirty = a3;

  [(SetAutomaticDownloadKindsOperation *)self unlock];
}

- (void)setShouldSuppressServerDialogs:(BOOL)a3
{
  [(SetAutomaticDownloadKindsOperation *)self lock];
  self->_shouldSuppressServerDialogs = a3;

  [(SetAutomaticDownloadKindsOperation *)self unlock];
}

- (BOOL)shouldSuppressServerDialogs
{
  [(SetAutomaticDownloadKindsOperation *)self lock];
  BOOL shouldSuppressServerDialogs = self->_shouldSuppressServerDialogs;
  [(SetAutomaticDownloadKindsOperation *)self unlock];
  return shouldSuppressServerDialogs;
}

- (void)run
{
  if ([(SetAutomaticDownloadKindsOperation *)self runsOnlyIfKindsAreDirty]
    && !CFPreferencesGetAppBooleanValue(@"DirtyAutoDownloadKinds", kITunesStoreDaemonDefaultsID, 0))
  {
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
      int v11 = 138412290;
      uint64_t v12 = objc_opt_class();
      LODWORD(v10) = 12;
      v9 = &v11;
      uint64_t v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, &v11, v10);
        free(v7);
        v9 = (int *)v8;
        SSFileLog();
      }
    }
    -[SetAutomaticDownloadKindsOperation setSuccess:](self, "setSuccess:", 1, v9);
  }
  else
  {
    [(SetAutomaticDownloadKindsOperation *)self _run];
  }
}

- (id)uniqueKey
{
  return @"SetAutomaticDownloadKindsOperation";
}

- (id)_copyFilteredDownloadKinds
{
  id v3 = [(NSSet *)self->_downloadKinds mutableCopy];
  unsigned int v4 = +[SSURLBagContext contextWithBagType:0];
  [(SetAutomaticDownloadKindsOperation *)self lock];
  [(SSURLBagContext *)v4 setUserIdentifier:[(SSAuthenticationContext *)self->_authenticationContext requiredUniqueIdentifier]];
  [(SetAutomaticDownloadKindsOperation *)self unlock];
  if ([(SetAutomaticDownloadKindsOperation *)self loadURLBagWithContext:v4 returningError:0])
  {
    id v5 = +[ISURLBag copyAllowedAutomaticDownloadKindsInBagContext:v4];
    [v3 intersectSet:v5];
  }
  id v6 = [(NSSet *)self->_downloadKinds count];
  if (v6 != [v3 count])
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      downloadKinds = self->_downloadKinds;
      int v18 = 138412802;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      v21 = downloadKinds;
      __int16 v22 = 2112;
      id v23 = v3;
      LODWORD(v17) = 32;
      v16 = &v18;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v18, v17);
        free(v13);
        v16 = (int *)v14;
        SSFileLog();
      }
    }
    objc_msgSend(+[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue", v16), "commitAutomaticDownloadKinds:markAsDirty:", v3, 1);
  }
  return v3;
}

- (BOOL)_isFatalError:(id)a3
{
  return SSErrorIsNetworkError() ^ 1;
}

- (BOOL)_postDownloadKinds:(id)a3 error:(id *)a4
{
  id v7 = objc_alloc_init((Class)ISStoreURLOperation);
  [v7 setUseUserSpecificURLBag:1];
  unsigned int v8 = [(SetAutomaticDownloadKindsOperation *)self shouldSuppressServerDialogs];
  int v9 = objc_alloc_init(DaemonProtocolDataProvider);
  uint64_t v10 = v8 ^ 1;
  [(DaemonProtocolDataProvider *)v9 setShouldProcessAuthenticationDialogs:v10];
  [(DaemonProtocolDataProvider *)v9 setShouldProcessDialogs:v10];
  [v7 setDataProvider:v9];
  [(SetAutomaticDownloadKindsOperation *)self lock];
  [v7 setAuthenticationContext:self->_authenticationContext];
  [(SetAutomaticDownloadKindsOperation *)self unlock];
  id v11 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  objc_msgSend(v11, "setClientIdentifier:", -[SetAutomaticDownloadKindsOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  if (objc_msgSend(+[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"), "isMultiUser"))objc_msgSend(v11, "setValue:forHTTPHeaderField:", @"true", SSHTTPHeaderXAppleMMeMultiUser); {
  [v11 setHTTPMethod:@"POST"];
  }
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = [+[ISDevice sharedInstance] guid];
  if (v13) {
    [v12 setObject:v13 forKey:@"guid"];
  }
  if (a3) {
    objc_msgSend(v12, "setObject:forKey:", objc_msgSend(a3, "allObjects"), @"media-types");
  }
  [v11 setRequestParameters:v12];

  [v11 setURLBagURLBlock:&stru_1003A5150];
  [v7 setRequestProperties:v11];
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
    int v32 = 138412546;
    uint64_t v33 = objc_opt_class();
    __int16 v34 = 2112;
    id v35 = a3;
    LODWORD(v30) = 22;
    v29 = &v32;
    uint64_t v17 = _os_log_send_and_compose_impl();
    if (v17)
    {
      int v18 = (void *)v17;
      uint64_t v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v32, v30);
      free(v18);
      v29 = (int *)v19;
      SSFileLog();
    }
  }
  v31 = 0;
  if (-[SetAutomaticDownloadKindsOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, &v31, v29))
  {
    id v20 = objc_msgSend(-[DaemonProtocolDataProvider output](v9, "output"), "objectForKey:", @"status");
    if ((objc_opt_respondsToSelector() & 1) != 0 && ![v20 intValue])
    {
      BOOL v27 = 1;
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
        id v35 = v20;
        LODWORD(v30) = 22;
        uint64_t v25 = _os_log_send_and_compose_impl();
        if (v25)
        {
          v26 = (void *)v25;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v32, v30);
          free(v26);
          SSFileLog();
        }
      }
      BOOL v27 = 0;
      v31 = (void *)ISError();
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  if (a4) {
    *a4 = v31;
  }
  return v27;
}

- (void)_run
{
  uint64_t v17 = 0;
  id v3 = [(SetAutomaticDownloadKindsOperation *)self _copyFilteredDownloadKinds];
  BOOL v4 = [(SetAutomaticDownloadKindsOperation *)self _postDownloadKinds:v3 error:&v17];
  if (v4)
  {
    CFStringRef v5 = (const __CFString *)kITunesStoreDaemonDefaultsID;
    CFPreferencesSetAppValue(@"DirtyAutoDownloadKinds", kCFBooleanFalse, kITunesStoreDaemonDefaultsID);
    CFPreferencesAppSynchronize(v5);
  }
  else if ([(SetAutomaticDownloadKindsOperation *)self _isFatalError:v17])
  {
    id v6 = [(SetAutomaticDownloadKindsOperation *)self previousDownloadKinds];
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
        uint64_t v11 = objc_opt_class();
        int v18 = 138412546;
        uint64_t v19 = v11;
        __int16 v20 = 2112;
        uint64_t v21 = v17;
        LODWORD(v16) = 22;
        unsigned int v15 = &v18;
        uint64_t v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          id v13 = (void *)v12;
          id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v18, v16);
          free(v13);
          unsigned int v15 = (int *)v14;
          SSFileLog();
        }
      }
      objc_msgSend(+[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue", v15), "commitAutomaticDownloadKinds:markAsDirty:", v7, 0);
    }
  }
  [(SetAutomaticDownloadKindsOperation *)self setSuccess:v4];
  [(SetAutomaticDownloadKindsOperation *)self setError:v17];
}

@end