@interface PostPushNotificationTokenOperation
- (BOOL)_postTokenToURL:(id)a3 error:(id *)a4;
- (NSData)tokenData;
- (NSString)environmentName;
- (PostPushNotificationTokenOperation)init;
- (PostPushNotificationTokenOperation)initWithEnvironmentName:(id)a3 tokenData:(id)a4;
- (SSAuthenticationContext)authenticationContext;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
@end

@implementation PostPushNotificationTokenOperation

- (PostPushNotificationTokenOperation)init
{
  return [(PostPushNotificationTokenOperation *)self initWithEnvironmentName:0 tokenData:0];
}

- (PostPushNotificationTokenOperation)initWithEnvironmentName:(id)a3 tokenData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PostPushNotificationTokenOperation;
  v6 = [(PostPushNotificationTokenOperation *)&v8 init];
  if (v6)
  {
    v6->_environmentName = (NSString *)[a3 copy];
    v6->_tokenData = (NSData *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PostPushNotificationTokenOperation;
  [(PostPushNotificationTokenOperation *)&v3 dealloc];
}

- (SSAuthenticationContext)authenticationContext
{
  [(PostPushNotificationTokenOperation *)self lock];
  objc_super v3 = self->_authenticationContext;
  [(PostPushNotificationTokenOperation *)self unlock];
  return v3;
}

- (NSString)environmentName
{
  v2 = self->_environmentName;

  return v2;
}

- (void)setAuthenticationContext:(id)a3
{
  [(PostPushNotificationTokenOperation *)self lock];
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSAuthenticationContext *)[a3 copy];
  }

  [(PostPushNotificationTokenOperation *)self unlock];
}

- (NSData)tokenData
{
  v2 = self->_tokenData;

  return v2;
}

- (void)run
{
  uint64_t v31 = 0;
  if (self->_tokenData)
  {
    id v3 = [(PostPushNotificationTokenOperation *)self loadedURLBagWithContext:+[SSURLBagContext contextWithBagType:0] returningError:&v31];
    if (!v3)
    {
      LODWORD(v12) = 0;
LABEL_46:
      BOOL v21 = v12 != 0;
      uint64_t v20 = v31;
      goto LABEL_47;
    }
    id v4 = [v3 valueForKey:@"push-notifications"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 objectForKey:@"environment"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ![(NSString *)self->_environmentName isEqualToString:v5])
      {
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
        if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_INFO)) {
          v24 &= 2u;
        }
        if (v24)
        {
          uint64_t v25 = objc_opt_class();
          int v32 = 138412290;
          uint64_t v33 = v25;
          LODWORD(v30) = 12;
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
        id v7 = 0;
      }
      else
      {
        id v6 = [v4 objectForKey:@"register-success"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_9;
        }
        id v7 = [objc_alloc((Class)NSURL) initWithString:v6];
        if (!v7) {
          goto LABEL_9;
        }
      }
      LODWORD(v12) = -[PostPushNotificationTokenOperation _postTokenToURL:error:](self, "_postTokenToURL:error:", v7, &v31, v29);
      goto LABEL_45;
    }
LABEL_9:
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
      int v32 = 138412546;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      CFStringRef v35 = @"register-success";
      LODWORD(v30) = 22;
      v29 = &v32;
      v12 = (void *)_os_log_send_and_compose_impl();
      if (!v12)
      {
        id v7 = 0;
        goto LABEL_45;
      }
      v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v32, v30);
      free(v12);
      v29 = (int *)v13;
      SSFileLog();
    }
    id v7 = 0;
    LODWORD(v12) = 0;
LABEL_45:

    goto LABEL_46;
  }
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
    int v32 = 138412290;
    uint64_t v33 = objc_opt_class();
    LODWORD(v30) = 12;
    v29 = &v32;
    uint64_t v17 = _os_log_send_and_compose_impl();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v32, v30);
      free(v18);
      v29 = (int *)v19;
      SSFileLog();
    }
  }
  uint64_t v20 = 0;
  BOOL v21 = 0;
LABEL_47:
  -[PostPushNotificationTokenOperation setError:](self, "setError:", v20, v29);
  [(PostPushNotificationTokenOperation *)self setSuccess:v21];
}

- (BOOL)_postTokenToURL:(id)a3 error:(id *)a4
{
  uint64_t v30 = 0;
  id v7 = objc_alloc_init((Class)ISStoreURLOperation);
  objc_msgSend(v7, "setAuthenticationContext:", -[PostPushNotificationTokenOperation authenticationContext](self, "authenticationContext"));
  objc_msgSend(v7, "setDataProvider:", +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v7 setDelegate:self];
  [v7 setUseUserSpecificURLBag:1];
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
    environmentName = self->_environmentName;
    tokenData = self->_tokenData;
    int v31 = 138543874;
    uint64_t v32 = v11;
    __int16 v33 = 2114;
    __int16 v34 = environmentName;
    __int16 v35 = 2112;
    v36 = tokenData;
    LODWORD(v29) = 32;
    v28 = &v31;
    uint64_t v14 = _os_log_send_and_compose_impl();
    if (v14)
    {
      unsigned int v15 = (void *)v14;
      int v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v31, v29);
      free(v15);
      v28 = (int *)v16;
      SSFileLog();
    }
  }
  id v17 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:a3];
  [v17 setHTTPMethod:@"POST"];
  [v17 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  v19 = +[ISDevice sharedInstance];
  uint64_t v20 = self->_environmentName;
  if (v20) {
    [v18 setObject:v20 forKey:@"environment"];
  }
  BOOL v21 = self->_tokenData;
  if (v21) {
    [v18 setObject:v21 forKey:@"token"];
  }
  id v22 = [(ISDevice *)v19 deviceName];
  if (v22)
  {
    id v23 = [v22 dataUsingEncoding:4 allowLossyConversion:1];
    if (v23) {
      [v18 setObject:v23 forKey:@"device-name-data"];
    }
  }
  id v24 = [(ISDevice *)v19 serialNumber];
  if (v24) {
    [v18 setObject:v24 forKey:@"serial-number"];
  }
  id v25 = [(ISDevice *)v19 guid];
  if (v25) {
    [v18 setObject:v25 forKey:@"guid"];
  }
  [v17 setRequestParameters:v18];

  [v7 setRequestProperties:v17];
  unsigned __int8 v26 = [(PostPushNotificationTokenOperation *)self runSubOperation:v7 returningError:&v30];
  [v7 setDelegate:0];

  if (a4) {
    *a4 = v30;
  }
  return v26;
}

@end