@interface PushNotificationRequestOperation
- (BOOL)_loadResponseWithAccountIdentifier:(id)a3 URL:(id)a4 error:(id *)a5;
- (NSString)userAgent;
- (PushNotificationRequestOperation)initWithPushNotificationParameters:(id)a3;
- (SSURLConnectionResponse)URLResponse;
- (void)dealloc;
- (void)run;
- (void)setUserAgent:(id)a3;
@end

@implementation PushNotificationRequestOperation

- (PushNotificationRequestOperation)initWithPushNotificationParameters:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PushNotificationRequestOperation;
  v4 = [(PushNotificationRequestOperation *)&v6 init];
  if (v4) {
    v4->_parameters = (SSVPushNotificationParameters *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PushNotificationRequestOperation;
  [(PushNotificationRequestOperation *)&v3 dealloc];
}

- (void)setUserAgent:(id)a3
{
  [(PushNotificationRequestOperation *)self lock];
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  [(PushNotificationRequestOperation *)self unlock];
}

- (SSURLConnectionResponse)URLResponse
{
  [(PushNotificationRequestOperation *)self lock];
  objc_super v3 = self->_response;
  [(PushNotificationRequestOperation *)self unlock];

  return v3;
}

- (NSString)userAgent
{
  [(PushNotificationRequestOperation *)self lock];
  objc_super v3 = self->_userAgent;
  [(PushNotificationRequestOperation *)self unlock];

  return v3;
}

- (void)run
{
  uint64_t v46 = 0;
  id v3 = [(SSVPushNotificationParameters *)self->_parameters accountIdentifier];
  if (!v3)
  {
    id v3 = objc_msgSend(objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier");
    if (!v3)
    {
      id v26 = +[SSLogConfig sharedDaemonConfig];
      if (!v26) {
        id v26 = +[SSLogConfig sharedConfig];
      }
      unsigned int v27 = [v26 shouldLog];
      if ([v26 shouldLogToDisk]) {
        int v28 = v27 | 2;
      }
      else {
        int v28 = v27;
      }
      if (!os_log_type_enabled((os_log_t)[v26 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v28 &= 2u;
      }
      if (v28)
      {
        int v47 = 138412290;
        uint64_t v48 = objc_opt_class();
        LODWORD(v44) = 12;
        v43 = &v47;
        uint64_t v29 = _os_log_send_and_compose_impl();
        if (v29)
        {
          v30 = (void *)v29;
          v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v47, v44);
          free(v30);
          v43 = (int *)v31;
          SSFileLog();
        }
      }
      goto LABEL_46;
    }
  }
  v4 = +[SSURLBagContext contextWithBagType:0];
  [(SSURLBagContext *)v4 setUserIdentifier:v3];
  v5 = [(PushNotificationRequestOperation *)self userAgent];
  [(SSURLBagContext *)v4 setValue:v5 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  id v6 = [(PushNotificationRequestOperation *)self loadedURLBagWithContext:v4 returningError:0];
  id v7 = [v6 valueForKey:@"push-notification-types"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_18;
  }
  id v8 = [(SSVPushNotificationParameters *)self->_parameters requestType];
  if (!v8)
  {
    id v9 = [v7 objectForKey:@"add-push-notification-type-url"];
    LODWORD(v10) = 1;
    goto LABEL_20;
  }
  if (v8 == (id)1)
  {
    id v9 = [v7 objectForKey:@"remove-push-notification-type-url"];
LABEL_19:
    LODWORD(v10) = 0;
    goto LABEL_20;
  }
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
  if (!v13)
  {
LABEL_18:
    id v9 = 0;
    goto LABEL_19;
  }
  uint64_t v14 = objc_opt_class();
  id v15 = [(SSVPushNotificationParameters *)self->_parameters requestType];
  int v47 = 138412546;
  uint64_t v48 = v14;
  __int16 v49 = 2048;
  id v50 = v15;
  LODWORD(v44) = 22;
  v43 = &v47;
  v10 = (void *)_os_log_send_and_compose_impl();
  if (v10)
  {
    v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v47, v44);
    free(v10);
    v43 = (int *)v16;
    SSFileLog();
    goto LABEL_18;
  }
  id v9 = 0;
LABEL_20:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19) {
      id v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = objc_msgSend(v19, "shouldLog", v43);
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    if (!os_log_type_enabled((os_log_t)[v19 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v21 &= 2u;
    }
    if (v21)
    {
      uint64_t v22 = objc_opt_class();
      int v47 = 138412290;
      uint64_t v48 = v22;
      LODWORD(v44) = 12;
      v43 = &v47;
      uint64_t v23 = _os_log_send_and_compose_impl();
      if (v23)
      {
        v24 = (void *)v23;
        v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v47, v44);
        free(v24);
        v43 = (int *)v25;
        SSFileLog();
      }
    }
LABEL_46:
    uint64_t v32 = SSError();
    BOOL v33 = 0;
    uint64_t v46 = v32;
    goto LABEL_61;
  }
  if (v10)
  {
    id v17 = [(SSVPushNotificationParameters *)self->_parameters environmentName];
    if (!v17)
    {
      id v18 = [v6 valueForKey:@"push-notifications"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v17 = [v18 objectForKey:@"environment"];
      }
      else {
        id v17 = 0;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v34 = +[SSLogConfig sharedDaemonConfig];
      if (!v34) {
        id v34 = +[SSLogConfig sharedConfig];
      }
      unsigned int v35 = objc_msgSend(v34, "shouldLog", v43);
      if ([v34 shouldLogToDisk]) {
        int v36 = v35 | 2;
      }
      else {
        int v36 = v35;
      }
      if (!os_log_type_enabled((os_log_t)[v34 OSLogObject], OS_LOG_TYPE_INFO)) {
        v36 &= 2u;
      }
      if (v36)
      {
        uint64_t v37 = objc_opt_class();
        int v47 = 138412802;
        uint64_t v48 = v37;
        __int16 v49 = 2112;
        id v50 = v17;
        __int16 v51 = 2112;
        id v52 = v9;
        LODWORD(v44) = 32;
        v43 = &v47;
        uint64_t v38 = _os_log_send_and_compose_impl();
        if (v38)
        {
          v39 = (void *)v38;
          v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v47, v44);
          free(v39);
          v43 = (int *)v40;
          SSFileLog();
        }
      }
      v41 = dispatch_semaphore_create(0);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000806C0;
      v45[3] = &unk_1003A33A8;
      v45[4] = v41;
      [+[PushNotificationController sharedInstance] registerTokenForEnvironmentName:v17 accountIdentifier:v3 completionBlock:v45];
      dispatch_time_t v42 = dispatch_time(0, 60000000000);
      dispatch_semaphore_wait(v41, v42);
      dispatch_release(v41);
    }
  }
  BOOL v33 = [(PushNotificationRequestOperation *)self _loadResponseWithAccountIdentifier:v3 URL:+[NSURL URLWithString:](NSURL, "URLWithString:", v9, v43) error:&v46];
  uint64_t v32 = v46;
LABEL_61:
  -[PushNotificationRequestOperation setError:](self, "setError:", v32, v43);
  [(PushNotificationRequestOperation *)self setSuccess:v33];
}

- (BOOL)_loadResponseWithAccountIdentifier:(id)a3 URL:(id)a4 error:(id *)a5
{
  int v28 = 0;
  id v9 = objc_alloc_init((Class)ISStoreURLOperation);
  objc_msgSend(v9, "setDataProvider:", +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  id v10 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccountIdentifier:a3];
  [v10 setPromptStyle:1000];
  id v11 = [(PushNotificationRequestOperation *)self userAgent];
  uint64_t v12 = SSHTTPHeaderUserAgent;
  [v10 setValue:v11 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  [v9 setAuthenticationContext:v10];

  id v13 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v13 setHTTPMethod:@"POST"];
  [v13 setURL:a4];
  [v13 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", -[PushNotificationRequestOperation userAgent](self, "userAgent"), v12);
  id v14 = [(SSVPushNotificationParameters *)self->_parameters _copyParametersDictionary];
  id v15 = [+[ISDevice sharedInstance] guid];
  if (v15) {
    [v14 setObject:v15 forKey:@"guid"];
  }
  [v13 setRequestParameters:v14];

  [v9 setRequestProperties:v13];
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
  if (!os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_INFO)) {
    v18 &= 2u;
  }
  if (v18)
  {
    int v29 = 138412546;
    uint64_t v30 = objc_opt_class();
    __int16 v31 = 2112;
    id v32 = a4;
    LODWORD(v27) = 22;
    id v26 = &v29;
    uint64_t v19 = _os_log_send_and_compose_impl();
    if (v19)
    {
      unsigned int v20 = (void *)v19;
      int v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v29, v27);
      free(v20);
      id v26 = (int *)v21;
      SSFileLog();
    }
  }
  unsigned int v22 = -[PushNotificationRequestOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v9, &v28, v26);
  if (v22)
  {
    id v23 = objc_msgSend(objc_msgSend(v9, "dataProvider"), "output");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v24 = +[NSPropertyListSerialization dataWithPropertyList:v23 format:100 options:0 error:0];
    }
    else {
      v24 = 0;
    }
    [(PushNotificationRequestOperation *)self lock];

    self->_response = (SSURLConnectionResponse *)objc_msgSend(objc_alloc((Class)SSURLConnectionResponse), "initWithURLResponse:bodyData:", objc_msgSend(v9, "response"), v24);
    [(PushNotificationRequestOperation *)self unlock];
  }
  else
  {

    if (a5) {
      *a5 = v28;
    }
  }
  return v22;
}

@end