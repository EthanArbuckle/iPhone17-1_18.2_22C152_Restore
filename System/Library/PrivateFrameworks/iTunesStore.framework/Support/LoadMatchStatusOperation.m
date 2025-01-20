@interface LoadMatchStatusOperation
- (LoadMatchStatusOperation)initWithAccountIdentifier:(id)a3;
- (NSString)userAgent;
- (id)_newMatchStatusOperationWithURLBag:(id)a3;
- (unint64_t)matchStatus;
- (void)dealloc;
- (void)run;
- (void)setUserAgent:(id)a3;
@end

@implementation LoadMatchStatusOperation

- (LoadMatchStatusOperation)initWithAccountIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LoadMatchStatusOperation;
  v4 = [(LoadMatchStatusOperation *)&v6 init];
  if (v4) {
    v4->_accountID = (NSNumber *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LoadMatchStatusOperation;
  [(LoadMatchStatusOperation *)&v3 dealloc];
}

- (unint64_t)matchStatus
{
  [(LoadMatchStatusOperation *)self lock];
  unint64_t matchStatus = self->_matchStatus;
  [(LoadMatchStatusOperation *)self unlock];
  return matchStatus;
}

- (void)setUserAgent:(id)a3
{
  [(LoadMatchStatusOperation *)self lock];
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  [(LoadMatchStatusOperation *)self unlock];
}

- (NSString)userAgent
{
  [(LoadMatchStatusOperation *)self lock];
  objc_super v3 = self->_userAgent;
  [(LoadMatchStatusOperation *)self unlock];

  return v3;
}

- (void)run
{
  unint64_t v35 = 0;
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
    uint64_t v6 = objc_opt_class();
    accountID = self->_accountID;
    int v36 = 138412546;
    uint64_t v37 = v6;
    __int16 v38 = 2112;
    unint64_t v39 = (unint64_t)accountID;
    LODWORD(v34) = 22;
    v32 = &v36;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v36, v34);
      free(v9);
      v32 = (int *)v10;
      SSFileLog();
    }
  }
  v11 = +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0, v32);
  [(SSURLBagContext *)v11 setIgnoresCaches:1];
  [(SSURLBagContext *)v11 setUserIdentifier:self->_accountID];
  v12 = [(LoadMatchStatusOperation *)self userAgent];
  [(SSURLBagContext *)v11 setValue:v12 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  id v13 = [(LoadMatchStatusOperation *)self loadedURLBagWithContext:v11 returningError:&v35];
  if (v13)
  {
    v14 = v13;
    id v15 = [v13 valueForKey:@"isMatchServiceEnabled"];
    if (objc_opt_respondsToSelector()) {
      unint64_t v16 = [v15 BOOLValue];
    }
    else {
      unint64_t v16 = 0;
    }
    [v14 valueForKey:@"cloud-welcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 |= 2uLL;
    }
    id v17 = [(LoadMatchStatusOperation *)self _newMatchStatusOperationWithURLBag:v14];
    if (v17)
    {
      v18 = v17;
      if ([(LoadMatchStatusOperation *)self runSubOperation:v17 returningError:&v35])
      {
        id v19 = objc_msgSend(objc_msgSend(objc_msgSend(v18, "dataProvider"), "output"), "objectForKey:", @"isMatchSubscriber");
        if ((objc_opt_respondsToSelector() & 1) != 0 && [v19 BOOLValue]) {
          v16 |= 4uLL;
        }

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
        uint64_t v23 = 1;
        if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_INFO)) {
          v22 &= 2u;
        }
        if (!v22) {
          goto LABEL_45;
        }
        uint64_t v24 = objc_opt_class();
        v25 = self->_accountID;
        int v36 = 138412802;
        uint64_t v37 = v24;
        __int16 v38 = 2048;
        unint64_t v39 = v16;
        __int16 v40 = 2112;
        v41 = v25;
        LODWORD(v34) = 32;
        v33 = &v36;
        uint64_t v26 = 1;
        v27 = (void *)_os_log_send_and_compose_impl();
        if (!v27) {
          goto LABEL_45;
        }
LABEL_44:
        v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v36, v34);
        free(v27);
        v33 = (int *)v31;
        SSFileLog();
        uint64_t v23 = v26;
        goto LABEL_45;
      }
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  id v28 = +[SSLogConfig sharedDaemonConfig];
  if (!v28) {
    id v28 = +[SSLogConfig sharedConfig];
  }
  unsigned int v29 = [v28 shouldLog];
  if ([v28 shouldLogToDisk]) {
    LODWORD(v23) = v29 | 2;
  }
  else {
    LODWORD(v23) = v29;
  }
  if (os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    uint64_t v23 = v23;
  }
  else {
    v23 &= 2u;
  }
  if (v23)
  {
    uint64_t v30 = objc_opt_class();
    int v36 = 138412546;
    uint64_t v37 = v30;
    __int16 v38 = 2112;
    unint64_t v39 = v35;
    LODWORD(v34) = 22;
    v33 = &v36;
    v27 = (void *)_os_log_send_and_compose_impl();
    uint64_t v26 = 0;
    uint64_t v23 = 0;
    if (v27) {
      goto LABEL_44;
    }
  }
LABEL_45:
  [(LoadMatchStatusOperation *)self lock];
  self->_unint64_t matchStatus = v16;
  [(LoadMatchStatusOperation *)self unlock];
  [(LoadMatchStatusOperation *)self setError:v35];
  [(LoadMatchStatusOperation *)self setSuccess:v23];
}

- (id)_newMatchStatusOperationWithURLBag:(id)a3
{
  id v4 = [a3 valueForKey:@"getMatchStatusSrv"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = objc_alloc_init((Class)ISStoreURLOperation);
  objc_msgSend(v5, "setDataProvider:", +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v5 setUseUserSpecificURLBag:1];
  id v6 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccountIdentifier:self->_accountID];
  v7 = [(LoadMatchStatusOperation *)self userAgent];
  uint64_t v8 = SSHTTPHeaderUserAgent;
  [v6 setValue:v7 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  [v5 setAuthenticationContext:v6];

  id v9 = objc_msgSend(objc_alloc((Class)SSMutableURLRequestProperties), "initWithURL:", +[NSURL URLWithString:](NSURL, "URLWithString:", v4));
  [v9 setITunesStoreRequest:1];
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", -[LoadMatchStatusOperation userAgent](self, "userAgent"), v8);
  [v5 setRequestProperties:v9];

  return v5;
}

@end