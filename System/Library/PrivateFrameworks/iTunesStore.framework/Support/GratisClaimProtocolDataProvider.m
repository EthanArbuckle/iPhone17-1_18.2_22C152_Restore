@interface GratisClaimProtocolDataProvider
- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4;
- (NSURL)redirectedClaimURL;
- (void)dealloc;
- (void)setRedirectedClaimURL:(id)a3;
@end

@implementation GratisClaimProtocolDataProvider

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GratisClaimProtocolDataProvider;
  [(DaemonProtocolDataProvider *)&v3 dealloc];
}

- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4
{
  v22 = 0;
  [a3 setPerformsButtonAction:0];
  unsigned int v7 = [(GratisClaimProtocolDataProvider *)self runSubOperation:a3 error:&v22];
  id v8 = [a3 redirectURL];
  id v9 = [a3 selectedButton];
  if (v8
    || (v18 = v9, [v9 actionType] == 1)
    && ([v18 urlType] != (id)1
     || objc_msgSend(objc_msgSend(v18, "subtarget"), "isEqualToString:", @"account.upToDateClaim"))
    && (id v8 = [v18 parameter]) != 0)
  {
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10) {
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
      uint64_t v13 = objc_opt_class();
      int v23 = 138412546;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      id v26 = v8;
      LODWORD(v21) = 22;
      v20 = &v23;
      uint64_t v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        v15 = (void *)v14;
        v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v23, v21);
        free(v15);
        v20 = (int *)v16;
        SSFileLog();
      }
    }
    -[GratisClaimProtocolDataProvider setAuthenticatedAccountDSID:](self, "setAuthenticatedAccountDSID:", objc_msgSend(a3, "authenticatedAccountDSID", v20));
    [(GratisClaimProtocolDataProvider *)self setRedirectedClaimURL:v8];
  }
  else
  {
    if (v7)
    {
      -[GratisClaimProtocolDataProvider setAuthenticatedAccountDSID:](self, "setAuthenticatedAccountDSID:", [a3 authenticatedAccountDSID]);
      return v7;
    }
    objc_msgSend(v18, "performDefaultActionForDialog:", objc_msgSend(a3, "dialog"));
  }
  if (a4) {
    char v17 = v7;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0) {
    *a4 = v22;
  }
  return v7;
}

- (NSURL)redirectedClaimURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRedirectedClaimURL:(id)a3
{
}

@end