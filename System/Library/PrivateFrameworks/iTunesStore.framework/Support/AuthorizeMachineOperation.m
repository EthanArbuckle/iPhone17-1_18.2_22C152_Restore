@interface AuthorizeMachineOperation
- (AuthorizeMachineOperation)initWithAuthorizationRequest:(id)a3;
- (BOOL)_handleResponse:(id)a3 error:(id *)a4;
- (BOOL)_runAuthentication:(id *)a3;
- (BOOL)_runAuthorizationWithAuthentication:(BOOL)a3 error:(id *)a4;
- (BOOL)allowSilentAuthentication;
- (BOOL)shouldAddKeysToKeyBag;
- (BOOL)shouldPromptForCredentials;
- (NSNumber)accountIdentifier;
- (NSNumber)familyMemberAccountIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)keybagPath;
- (NSString)reason;
- (NSString)userAgent;
- (SSURLConnectionResponse)response;
- (id)_accountIdentifier;
- (id)_newAuthenticationContext;
- (id)_newBodyDictionary;
- (id)_newMachineDataOperationWithResponse:(id)a3;
- (id)_newURLOperation;
- (id)authorizationToken;
- (void)_run;
- (void)_setResponse:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setAccountIdentifier:(id)a3;
- (void)setAllowSilentAuthentication:(BOOL)a3;
- (void)setAuthorizationToken:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setFamilyMemberAccountIdentifier:(id)a3;
- (void)setKeybagPath:(id)a3;
- (void)setReason:(id)a3;
- (void)setShouldAddKeysToKeyBag:(BOOL)a3;
- (void)setShouldPromptForCredentials:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation AuthorizeMachineOperation

- (AuthorizeMachineOperation)initWithAuthorizationRequest:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AuthorizeMachineOperation;
  v4 = [(AuthorizeMachineOperation *)&v6 init];
  if (v4)
  {
    v4->_accountIdentifier = (NSNumber *)[a3 accountIdentifier];
    v4->_allowSilentAuthentication = [a3 allowSilentAuthentication];
    if ([a3 familyAccountIdentifier]) {
      v4->_familyMemberAccountIdentifier = (NSNumber *)[a3 familyAccountIdentifier];
    }
    v4->_keybagPath = (NSString *)[a3 keybagPath];
    v4->_token = [a3 authorizationToken];
    v4->_reason = (NSString *)[a3 reason];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AuthorizeMachineOperation;
  [(AuthorizeMachineOperation *)&v3 dealloc];
}

- (NSNumber)accountIdentifier
{
  [(AuthorizeMachineOperation *)self lock];
  objc_super v3 = self->_accountIdentifier;
  [(AuthorizeMachineOperation *)self unlock];
  return v3;
}

- (BOOL)allowSilentAuthentication
{
  [(AuthorizeMachineOperation *)self lock];
  BOOL allowSilentAuthentication = self->_allowSilentAuthentication;
  [(AuthorizeMachineOperation *)self unlock];
  return allowSilentAuthentication;
}

- (id)authorizationToken
{
  [(AuthorizeMachineOperation *)self lock];
  id v3 = self->_token;
  [(AuthorizeMachineOperation *)self unlock];
  return v3;
}

- (NSString)clientIdentifierHeader
{
  [(AuthorizeMachineOperation *)self lock];
  id v3 = self->_clientIdentifierHeader;
  [(AuthorizeMachineOperation *)self unlock];
  return v3;
}

- (NSNumber)familyMemberAccountIdentifier
{
  [(AuthorizeMachineOperation *)self lock];
  id v3 = self->_familyMemberAccountIdentifier;
  [(AuthorizeMachineOperation *)self unlock];
  return v3;
}

- (NSString)keybagPath
{
  [(AuthorizeMachineOperation *)self lock];
  id v3 = (NSString *)[(NSString *)self->_keybagPath copy];
  [(AuthorizeMachineOperation *)self unlock];
  return v3;
}

- (NSString)reason
{
  [(AuthorizeMachineOperation *)self lock];
  id v3 = self->_reason;
  [(AuthorizeMachineOperation *)self unlock];
  return v3;
}

- (SSURLConnectionResponse)response
{
  [(AuthorizeMachineOperation *)self lock];
  id v3 = self->_response;
  [(AuthorizeMachineOperation *)self unlock];
  return v3;
}

- (void)setAccountIdentifier:(id)a3
{
  [(AuthorizeMachineOperation *)self lock];
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier != a3)
  {

    self->_accountIdentifier = (NSNumber *)[a3 copy];
  }

  [(AuthorizeMachineOperation *)self unlock];
}

- (void)setAllowSilentAuthentication:(BOOL)a3
{
  BOOL v3 = a3;
  [(AuthorizeMachineOperation *)self lock];
  if (self->_allowSilentAuthentication != v3) {
    self->_BOOL allowSilentAuthentication = v3;
  }

  [(AuthorizeMachineOperation *)self unlock];
}

- (void)setAuthorizationToken:(id)a3
{
  [(AuthorizeMachineOperation *)self lock];
  id token = self->_token;
  if (token != a3)
  {

    self->_id token = a3;
  }

  [(AuthorizeMachineOperation *)self unlock];
}

- (void)setClientIdentifierHeader:(id)a3
{
  [(AuthorizeMachineOperation *)self lock];
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)[a3 copy];
  }

  [(AuthorizeMachineOperation *)self unlock];
}

- (void)setFamilyMemberAccountIdentifier:(id)a3
{
  [(AuthorizeMachineOperation *)self lock];
  familyMemberAccountIdentifier = self->_familyMemberAccountIdentifier;
  if (familyMemberAccountIdentifier != a3)
  {

    self->_familyMemberAccountIdentifier = (NSNumber *)[a3 copy];
  }

  [(AuthorizeMachineOperation *)self unlock];
}

- (void)setKeybagPath:(id)a3
{
  [(AuthorizeMachineOperation *)self lock];
  keybagPath = self->_keybagPath;
  if (keybagPath != a3)
  {

    self->_keybagPath = (NSString *)[a3 copy];
  }

  [(AuthorizeMachineOperation *)self unlock];
}

- (void)setReason:(id)a3
{
  [(AuthorizeMachineOperation *)self lock];
  reason = self->_reason;
  if (reason != a3)
  {

    self->_reason = (NSString *)[a3 copy];
  }

  [(AuthorizeMachineOperation *)self unlock];
}

- (void)setShouldAddKeysToKeyBag:(BOOL)a3
{
  [(AuthorizeMachineOperation *)self lock];
  self->_shouldAddKeysToKeyBag = a3;

  [(AuthorizeMachineOperation *)self unlock];
}

- (void)setShouldPromptForCredentials:(BOOL)a3
{
  [(AuthorizeMachineOperation *)self lock];
  self->_shouldPromptForCredentials = a3;

  [(AuthorizeMachineOperation *)self unlock];
}

- (void)setUserAgent:(id)a3
{
  [(AuthorizeMachineOperation *)self lock];
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  [(AuthorizeMachineOperation *)self unlock];
}

- (BOOL)shouldAddKeysToKeyBag
{
  [(AuthorizeMachineOperation *)self lock];
  BOOL shouldAddKeysToKeyBag = self->_shouldAddKeysToKeyBag;
  [(AuthorizeMachineOperation *)self unlock];
  return shouldAddKeysToKeyBag;
}

- (BOOL)shouldPromptForCredentials
{
  [(AuthorizeMachineOperation *)self lock];
  BOOL shouldPromptForCredentials = self->_shouldPromptForCredentials;
  [(AuthorizeMachineOperation *)self unlock];
  return shouldPromptForCredentials;
}

- (NSString)userAgent
{
  [(AuthorizeMachineOperation *)self lock];
  BOOL v3 = self->_userAgent;
  [(AuthorizeMachineOperation *)self unlock];

  return v3;
}

- (void)run
{
}

- (id)_accountIdentifier
{
  [(AuthorizeMachineOperation *)self lock];
  BOOL v3 = self->_accountIdentifier;
  [(AuthorizeMachineOperation *)self unlock];
  return v3;
}

- (BOOL)_handleResponse:(id)a3 error:(id *)a4
{
  id v7 = [a3 objectForKey:@"failureType"];
  if (!v7)
  {
    if ([(AuthorizeMachineOperation *)self shouldAddKeysToKeyBag])
    {
      id v8 = [a3 objectForKey:@"keybag"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [v8 length];
        if (!v9) {
          goto LABEL_19;
        }
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
          int v17 = 138412546;
          uint64_t v18 = objc_opt_class();
          __int16 v19 = 2048;
          id v20 = [v8 length];
          LODWORD(v16) = 22;
          uint64_t v13 = _os_log_send_and_compose_impl();
          if (v13)
          {
            v14 = (void *)v13;
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v17, v16);
            free(v14);
            SSFileLog();
          }
        }
        sub_10002E31C(v8);
      }
    }
    id v9 = 0;
LABEL_19:
    if (!a4) {
      return v7 == 0;
    }
LABEL_20:
    *a4 = v9;
    return v7 == 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v7 integerValue];
  }
  id v9 = (id)SSError();
  if (a4) {
    goto LABEL_20;
  }
  return v7 == 0;
}

- (id)_newAuthenticationContext
{
  BOOL v3 = [(AuthorizeMachineOperation *)self accountIdentifier];
  id v4 = objc_alloc((Class)SSMutableAuthenticationContext);
  if (v3) {
    id v5 = [v4 initWithAccountIdentifier:v3];
  }
  else {
    id v5 = objc_msgSend(v4, "initWithAccount:", objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"));
  }
  objc_super v6 = v5;
  objc_msgSend(v5, "setAllowsSilentAuthentication:", -[AuthorizeMachineOperation allowSilentAuthentication](self, "allowSilentAuthentication"));
  objc_msgSend(v6, "setClientIdentifierHeader:", -[AuthorizeMachineOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  id v7 = [(AuthorizeMachineOperation *)self userAgent];
  [v6 setValue:v7 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  if ([+[SpringBoardUtility sharedInstance] isScreenLocked])
  {
    [v6 setPromptStyle:1000];
  }
  return v6;
}

- (id)_newBodyDictionary
{
  BOOL v3 = [(AuthorizeMachineOperation *)self reason];
  id v4 = [(AuthorizeMachineOperation *)self _accountIdentifier];
  if (!v4) {
    goto LABEL_38;
  }
  id v5 = v4;
  uint64_t v6 = [(NSString *)v3 isEqualToString:@"refetch"] ? 8 : 1;
  id v7 = [(AuthorizeMachineOperation *)self keybagPath];
  id v8 = +[SSLogConfig sharedDaemonConfig];
  id v9 = v8;
  if (v7)
  {
    if (!v8) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v37 = 138412802;
      uint64_t v38 = objc_opt_class();
      __int16 v39 = 2112;
      v40 = v5;
      __int16 v41 = 2112;
      v42 = v7;
      LODWORD(v36) = 32;
      v35 = &v37;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v37, v36);
        free(v13);
        v35 = (int *)v14;
        SSFileLog();
      }
    }
    CFDataRef v15 = sub_10002D480((uint64_t)objc_msgSend(v5, "unsignedLongLongValue", v35), v6, v7);
  }
  else
  {
    if (!v8) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v37 = 138412546;
      uint64_t v38 = objc_opt_class();
      __int16 v39 = 2112;
      v40 = v5;
      LODWORD(v36) = 22;
      v35 = &v37;
      uint64_t v18 = _os_log_send_and_compose_impl();
      if (v18)
      {
        __int16 v19 = (void *)v18;
        id v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v37, v36);
        free(v19);
        v35 = (int *)v20;
        SSFileLog();
      }
    }
    CFDataRef v15 = sub_10002D24C((uint64_t)objc_msgSend(v5, "unsignedLongLongValue", v35), v6);
  }
  CFDataRef v21 = v15;
  if (v15)
  {
    id v22 = objc_alloc_init((Class)NSMutableDictionary);
    v23 = v22;
    id token = self->_token;
    if (token) {
      [v22 setObject:token forKey:@"token"];
    }
    [v23 setObject:v21 forKey:@"kbsync"];
    v25 = +[ISDevice sharedInstance];
    id v26 = objc_msgSend(-[ISDevice guid](v25, "guid"), "uppercaseString");
    if (v26) {
      [v23 setObject:v26 forKey:@"guid"];
    }
    id v27 = [(ISDevice *)v25 deviceName];
    if (v27) {
      [v23 setObject:v27 forKey:@"machineName"];
    }
    if (v3) {
      [v23 setObject:v3 forKey:@"reason"];
    }
    [v23 setObject:v5 forKey:@"ownerDsid"];
  }
  else
  {
LABEL_38:
    id v28 = +[SSLogConfig sharedDaemonConfig];
    if (!v28) {
      id v28 = +[SSLogConfig sharedConfig];
    }
    unsigned int v29 = [v28 shouldLog];
    if ([v28 shouldLogToDisk]) {
      int v30 = v29 | 2;
    }
    else {
      int v30 = v29;
    }
    if (!os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v30 &= 2u;
    }
    if (v30)
    {
      uint64_t v31 = objc_opt_class();
      int v37 = 138412290;
      uint64_t v38 = v31;
      LODWORD(v36) = 12;
      uint64_t v32 = _os_log_send_and_compose_impl();
      if (v32)
      {
        v33 = (void *)v32;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v37, v36);
        free(v33);
        SSFileLog();
      }
    }
    CFDataRef v21 = 0;
    v23 = 0;
  }

  return v23;
}

- (id)_newMachineDataOperationWithResponse:(id)a3
{
  id v4 = [objc_alloc((Class)SSMachineDataRequest) initWithURLResponse:a3];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  objc_msgSend(v4, "setAccountIdentifier:", -[AuthorizeMachineOperation accountIdentifier](self, "accountIdentifier"));
  id v6 = [objc_alloc((Class)ISMachineDataActionOperation) initWithMachineDataRequest:v5];
  objc_msgSend(v6, "setUserAgent:", -[AuthorizeMachineOperation userAgent](self, "userAgent"));

  return v6;
}

- (id)_newURLOperation
{
  id v3 = [(AuthorizeMachineOperation *)self _newBodyDictionary];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  id v5 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:100 options:0 error:0];
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_alloc_init((Class)ISStoreURLOperation);
    objc_msgSend(v7, "setDataProvider:", +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
    [v7 setMachineDataStyle:0];
    [v7 setUseUserSpecificURLBag:1];
    id v8 = [(AuthorizeMachineOperation *)self _newAuthenticationContext];
    [v7 setAuthenticationContext:v8];

    id v9 = objc_alloc_init((Class)SSMutableURLRequestProperties);
    [v9 setAllowedRetryCount:0];
    objc_msgSend(v9, "setClientIdentifier:", -[AuthorizeMachineOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
    [v9 setHTTPBody:v6];
    [v9 setHTTPMethod:@"POST"];
    [v9 setURLBagKey:@"authorizeMachine"];
    [v9 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
    unsigned int v10 = [(AuthorizeMachineOperation *)self userAgent];
    [v9 setValue:v10 forHTTPHeaderField:SSHTTPHeaderUserAgent];
    [(AuthorizeMachineOperation *)self lock];
    familyMemberAccountIdentifier = self->_familyMemberAccountIdentifier;
    if (familyMemberAccountIdentifier) {
      objc_msgSend(v9, "setValue:forHTTPHeaderField:", -[NSNumber stringValue](familyMemberAccountIdentifier, "stringValue"), @"X-FM-Dsid");
    }
    mdSyncState = self->_mdSyncState;
    if (mdSyncState) {
      [v9 setValue:mdSyncState forHTTPHeaderField:SSHTTPHeaderXAppleMDS];
    }
    [(AuthorizeMachineOperation *)self unlock];
    if ([(NSString *)[(AuthorizeMachineOperation *)self reason] isEqualToString:@"refetch"])
    {
      [v9 setTimeoutInterval:15.0];
    }
    [(AuthorizeMachineOperation *)self accountIdentifier];
    MachineDataAddHeadersToRequestProperties();
    [v7 setRequestProperties:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_run
{
  uint64_t v32 = 0;
  id v3 = [(AuthorizeMachineOperation *)self accountIdentifier];
  if (v3)
  {
    id v4 = v3;
    char v31 = 0;
    CFDataRef v5 = (const __CFData *)[(AuthorizeMachineOperation *)self authorizationToken];
    if (v5)
    {
      CFDataRef v6 = v5;
LABEL_4:
      BOOL v7 = 0;
      goto LABEL_5;
    }
    int v30 = 0;
    CFDataRef v6 = sub_10002DE00([(NSNumber *)v4 longLongValue], &v31, &v30);
    if (v6)
    {
      [(AuthorizeMachineOperation *)self setAuthorizationToken:v6];
      if (!v31) {
        goto LABEL_4;
      }
    }
    else
    {
      char v31 = 1;
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
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      uint64_t v17 = objc_opt_class();
      int v33 = 138412802;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      uint64_t v36 = v4;
      __int16 v37 = 2112;
      uint64_t v38 = v30;
      LODWORD(v29) = 32;
      id v28 = &v33;
      uint64_t v18 = _os_log_send_and_compose_impl();
      if (v18)
      {
        __int16 v19 = (void *)v18;
        id v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v33, v29);
        free(v19);
        id v28 = (int *)v20;
        SSFileLog();
      }
    }
    if (![(AuthorizeMachineOperation *)self shouldPromptForCredentials])
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
        int v33 = 138412546;
        uint64_t v34 = v24;
        __int16 v35 = 2112;
        uint64_t v36 = v4;
        LODWORD(v29) = 22;
        id v28 = &v33;
        uint64_t v25 = _os_log_send_and_compose_impl();
        if (v25)
        {
          id v26 = (void *)v25;
          id v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v33, v29);
          free(v26);
          id v28 = (int *)v27;
          SSFileLog();
        }
      }
      uint64_t v8 = 0;
      uint64_t v32 = v30;
      goto LABEL_6;
    }
    if (![(AuthorizeMachineOperation *)self _runAuthentication:&v32])
    {
      uint64_t v8 = 0;
      goto LABEL_6;
    }
    BOOL v7 = v31 != 0;
LABEL_5:
    uint64_t v8 = [(AuthorizeMachineOperation *)self _runAuthorizationWithAuthentication:v7 error:&v32];
LABEL_6:

    id v9 = v32;
    goto LABEL_22;
  }
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
  if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v12 &= 2u;
  }
  if (v12)
  {
    int v33 = 138412290;
    uint64_t v34 = objc_opt_class();
    LODWORD(v29) = 12;
    id v28 = &v33;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (!v8)
    {
      id v9 = 0;
      goto LABEL_22;
    }
    uint64_t v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v33, v29);
    free((void *)v8);
    id v28 = (int *)v13;
    SSFileLog();
  }
  id v9 = 0;
  uint64_t v8 = 0;
LABEL_22:
  -[AuthorizeMachineOperation setError:](self, "setError:", v9, v28);
  [(AuthorizeMachineOperation *)self setSuccess:v8];
}

- (BOOL)_runAuthentication:(id *)a3
{
  id v5 = +[SSLogConfig sharedAccountsAuthenticationConfig];
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
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v18 = 138543362;
    uint64_t v19 = objc_opt_class();
    LODWORD(v17) = 12;
    int v16 = &v18;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v18, v17);
      free(v9);
      int v16 = (int *)v10;
      SSFileLog();
    }
  }
  id v11 = [(AuthorizeMachineOperation *)self _newAuthenticationContext];
  id v12 = [objc_alloc((Class)SSAuthenticateRequest) initWithAuthenticationContext:v11];
  id v13 = [v12 run];
  id v14 = [v13 error];
  if (!v14) {
    -[AuthorizeMachineOperation setAccountIdentifier:](self, "setAccountIdentifier:", objc_msgSend(objc_msgSend(v13, "authenticatedAccount"), "uniqueIdentifier"));
  }

  if (a3 && v14) {
    *a3 = 0;
  }
  return v14 == 0;
}

- (BOOL)_runAuthorizationWithAuthentication:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v34 = 0;
  while (1)
  {
    id v6 = [(AuthorizeMachineOperation *)self _newURLOperation];
    if (!v6)
    {
      LOBYTE(self) = 0;
      uint64_t v34 = SSError();
      goto LABEL_26;
    }
    int v7 = v6;
    [v6 setNeedsAuthentication:v4];
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      v9 |= 2u;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      id token = self->_token;
      int v35 = 138412802;
      uint64_t v36 = v10;
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)token;
      __int16 v39 = 1024;
      BOOL v40 = v4;
      LODWORD(v32) = 28;
      char v31 = &v35;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        id v13 = (void *)v12;
        id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v35, v32);
        free(v13);
        char v31 = (int *)v14;
        SSFileLog();
      }
    }
    if (!-[AuthorizeMachineOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, &v34, v31))goto LABEL_39; {
    id v15 = objc_msgSend(objc_msgSend(v7, "dataProvider"), "output");
    }
    if ([(AuthorizeMachineOperation *)self _handleResponse:v15 error:&v34]) {
      break;
    }
    id v16 = -[AuthorizeMachineOperation _newMachineDataOperationWithResponse:](self, "_newMachineDataOperationWithResponse:", [v7 response]);
    if (!v16) {
      goto LABEL_39;
    }
    uint64_t v17 = v16;
    unsigned __int8 v18 = [(AuthorizeMachineOperation *)self runSubOperation:v16 returningError:0];
    id v19 = [v17 syncState];
    [(AuthorizeMachineOperation *)self lock];
    int64_t mdRetryCount = self->_mdRetryCount;
    self->_int64_t mdRetryCount = mdRetryCount + 1;

    self->_mdSyncState = (NSString *)[v19 copy];
    [(AuthorizeMachineOperation *)self unlock];
    if (mdRetryCount > 0)
    {

LABEL_25:
      LOBYTE(self) = 0;
LABEL_26:
      uint64_t v24 = a4;
      if (!a4) {
        return (char)self;
      }
      goto LABEL_42;
    }
    if (v19) {
      char v21 = 1;
    }
    else {
      char v21 = v18;
    }

    if ((v21 & 1) == 0) {
      goto LABEL_25;
    }
  }
  unsigned int v22 = +[NSPropertyListSerialization dataWithPropertyList:v15 format:100 options:0 error:&v34];
  if (v22)
  {
    id v23 = objc_msgSend(objc_alloc((Class)SSURLConnectionResponse), "initWithURLResponse:bodyData:", objc_msgSend(v7, "response"), v22);
    [(AuthorizeMachineOperation *)self _setResponse:v23];

    LOBYTE(self) = 1;
    goto LABEL_40;
  }
  id v25 = +[SSLogConfig sharedDaemonConfig];
  if (!v25) {
    id v25 = +[SSLogConfig sharedConfig];
  }
  unsigned int v26 = [v25 shouldLog];
  if ([v25 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  if (os_log_type_enabled((os_log_t)[v25 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    int v28 = v27;
  }
  else {
    int v28 = v27 & 2;
  }
  if (v28)
  {
    uint64_t v29 = objc_opt_class();
    int v35 = 138412546;
    uint64_t v36 = v29;
    __int16 v37 = 2112;
    uint64_t v38 = v34;
    LODWORD(v32) = 22;
    self = (AuthorizeMachineOperation *)_os_log_send_and_compose_impl();
    uint64_t v24 = a4;
    if (self)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", self, 4, &v35, v32);
      free(self);
      SSFileLog();
      LOBYTE(self) = 0;
    }
  }
  else
  {
LABEL_39:
    LOBYTE(self) = 0;
LABEL_40:
    uint64_t v24 = a4;
  }

  if (!v24) {
    return (char)self;
  }
LABEL_42:
  if ((self & 1) == 0) {
    *uint64_t v24 = (id)v34;
  }
  return (char)self;
}

- (void)_setResponse:(id)a3
{
  [(AuthorizeMachineOperation *)self lock];
  response = self->_response;
  if (response != a3)
  {

    self->_response = (SSURLConnectionResponse *)a3;
  }

  [(AuthorizeMachineOperation *)self unlock];
}

@end