@interface ISStoreAuthenticateOperation
+ (BOOL)_copyErrorForAuthenticateResponse:(id)a3 error:(id *)a4;
- (ISStoreAuthenticateOperation)initWithAuthenticationContext:(id)a3;
- (SSAuthenticateResponse)authenticateResponse;
- (SSAuthenticationContext)authenticationContext;
- (id)authenticatedAccountDSID;
- (id)parentViewController;
- (id)uniqueKey;
- (void)_handleAuthenticateResponse:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setParentViewController:(id)a3;
@end

@implementation ISStoreAuthenticateOperation

- (ISStoreAuthenticateOperation)initWithAuthenticationContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F7B148] deviceIsInternalBuild])
  {
    v5 = (void *)[MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
    if (!v5) {
      v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v6 = [v5 shouldLog];
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
      int v16 = 138543874;
      uint64_t v17 = objc_opt_class();
      __int16 v18 = 2114;
      uint64_t v19 = AMSLogKey();
      __int16 v20 = 2114;
      uint64_t v21 = [MEMORY[0x263F7B340] generateSymbolicatedStackShot];
      LODWORD(v15) = 32;
      v14 = &v16;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v16, v15);
        free(v9);
        v14 = (int *)v10;
        SSFileLog();
      }
    }
  }
  v11 = [(ISOperation *)self init];
  if (v11)
  {
    v12 = (SSMutableAuthenticationContext *)[a3 mutableCopy];
    v11->_authenticationContext = v12;
    [(SSMutableAuthenticationContext *)v12 setShouldSuppressDialogs:1];
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISStoreAuthenticateOperation;
  [(ISStoreAuthenticateOperation *)&v3 dealloc];
}

- (SSAuthenticateResponse)authenticateResponse
{
  [(ISOperation *)self lock];
  objc_super v3 = self->_authenticateResponse;
  [(ISOperation *)self unlock];

  return v3;
}

- (SSAuthenticationContext)authenticationContext
{
  [(ISOperation *)self lock];
  objc_super v3 = (void *)[(SSMutableAuthenticationContext *)self->_authenticationContext copy];
  [(ISOperation *)self unlock];

  return (SSAuthenticationContext *)v3;
}

- (id)authenticatedAccountDSID
{
  id result = (id)objc_msgSend((id)-[SSAuthenticateResponse authenticatedAccount](-[ISStoreAuthenticateOperation authenticateResponse](self, "authenticateResponse"), "authenticatedAccount"), "uniqueIdentifier");
  if (!result)
  {
    v4 = [(ISStoreAuthenticateOperation *)self authenticationContext];
    return (id)[(SSAuthenticationContext *)v4 requiredUniqueIdentifier];
  }
  return result;
}

- (void)run
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  objc_super v3 = +[ISNetworkObserver sharedInstance];
  [(ISNetworkObserver *)v3 beginUsingNetwork];
  v4 = (void *)[MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
  if (!v4) {
    v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v5 = [v4 shouldLog];
  int v6 = [v4 shouldLogToDisk];
  int v7 = [v4 OSLogObject];
  if (v6) {
    v5 |= 2u;
  }
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = AMSLogKey();
    authenticationContext = self->_authenticationContext;
    [(SSMutableAuthenticationContext *)authenticationContext accountName];
    int v17 = 138544130;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = authenticationContext;
    __int16 v23 = 2114;
    uint64_t v24 = SSHashIfNeeded();
    LODWORD(v15) = 42;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v17, v15);
      free(v12);
      SSFileLog();
    }
  }
  v13 = (void *)[objc_alloc(MEMORY[0x263F7B118]) initWithAuthenticationContext:self->_authenticationContext];
  if ([(ISStoreAuthenticateOperation *)self parentViewController]) {
    objc_msgSend(v13, "set_parentViewController:", -[ISStoreAuthenticateOperation parentViewController](self, "parentViewController"));
  }
  v14 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __35__ISStoreAuthenticateOperation_run__block_invoke;
  v16[3] = &unk_264261208;
  v16[4] = self;
  v16[5] = v14;
  [v13 startWithAuthenticateResponseBlock:v16];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v14);

  [(ISNetworkObserver *)v3 endUsingNetwork];
}

intptr_t __35__ISStoreAuthenticateOperation_run__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v6 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
  int v7 = (void *)v6;
  if (a2)
  {
    if (!v6) {
      int v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      objc_msgSend((id)objc_msgSend(a2, "authenticatedAccount"), "accountName");
      int v22 = 138544386;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      uint64_t v25 = SSHashIfNeeded();
      __int16 v26 = 2048;
      uint64_t v27 = [a2 authenticateResponseType];
      __int16 v28 = 2112;
      uint64_t v29 = [a2 error];
      __int16 v30 = 2112;
      uint64_t v31 = [a2 responseDictionary];
      LODWORD(v21) = 52;
      uint64_t v20 = &v22;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v22, v21);
        free(v12);
        uint64_t v20 = (int *)v13;
        SSFileLog();
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_handleAuthenticateResponse:", a2, v20);
  }
  else
  {
    if (!v6) {
      int v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v14 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v22 = 138543618;
      uint64_t v23 = objc_opt_class();
      __int16 v24 = 2112;
      uint64_t v25 = a3;
      LODWORD(v21) = 22;
      uint64_t v20 = &v22;
      uint64_t v16 = _os_log_send_and_compose_impl();
      if (v16)
      {
        int v17 = (void *)v16;
        uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v22, v21);
        free(v17);
        uint64_t v20 = (int *)v18;
        SSFileLog();
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setError:", a3, v20);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)uniqueKey
{
  v2 = (void *)[(SSAuthenticationContext *)[(ISStoreAuthenticateOperation *)self authenticationContext] requiredUniqueIdentifier];
  objc_super v3 = NSString;
  if (v2) {
    v4 = (__CFString *)[v2 stringValue];
  }
  else {
    v4 = @"0";
  }
  return (id)[v3 stringWithFormat:@"com.apple.iTunesStore.auth.%@", v4];
}

- (void)_handleAuthenticateResponse:(id)a3
{
  uint64_t v5 = [a3 responseDictionary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [[ISProcessPropertyListOperation alloc] initWithPropertyList:v5];
    int v7 = objc_alloc_init(ISPropertyListProvider);
    [(ISProtocolDataProvider *)v7 setShouldProcessAccount:0];
    [(ISProcessPropertyListOperation *)v6 setDataProvider:v7];

    [(ISOperation *)self runSubOperation:v6 returningError:0];
  }
  uint64_t v8 = 0;
  if ([(id)objc_opt_class() _copyErrorForAuthenticateResponse:a3 error:&v8]) {
    [(ISOperation *)self setSuccess:1];
  }
  else {
    [(ISOperation *)self setError:v8];
  }
  [(ISOperation *)self lock];

  self->_authenticateResponse = (SSAuthenticateResponse *)a3;
  [(ISOperation *)self unlock];
}

+ (BOOL)_copyErrorForAuthenticateResponse:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  switch([a3 authenticateResponseType])
  {
    case 0:
    case 1:
      uint64_t v11 = (void *)[MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
      if (!v11) {
        uint64_t v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v13 &= 2u;
      }
      if (!v13) {
        goto LABEL_53;
      }
      goto LABEL_51;
    case 2:
      int v15 = (void *)[MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
      if (!v15) {
        int v15 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
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
        *(_DWORD *)uint64_t v29 = 138412290;
        *(void *)&v29[4] = objc_opt_class();
        LODWORD(v28) = 12;
        int v9 = (void *)_os_log_send_and_compose_impl();
        int v10 = 16;
        if (v9) {
          goto LABEL_52;
        }
      }
      else
      {
        int v10 = 16;
      }
      break;
    case 3:
    case 6:
    case 7:
    case 8:
      uint64_t v6 = (void *)[MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
      if (!v6) {
        uint64_t v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v7 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v8 &= 2u;
      }
      if (v8)
      {
        *(_DWORD *)uint64_t v29 = 138412546;
        *(void *)&v29[4] = objc_opt_class();
        *(_WORD *)&v29[12] = 2048;
        *(void *)&v29[14] = [a3 authenticateResponseType];
        LODWORD(v28) = 22;
        int v9 = (void *)_os_log_send_and_compose_impl();
        int v10 = 0;
        if (v9) {
          goto LABEL_52;
        }
      }
      else
      {
        int v10 = 0;
      }
      break;
    case 4:
      uint64_t v18 = (void *)[MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
      if (!v18) {
        uint64_t v18 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v19 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        int v20 = v19 | 2;
      }
      else {
        int v20 = v19;
      }
      BOOL v21 = 1;
      if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_INFO)) {
        v20 &= 2u;
      }
      if (v20)
      {
        *(_DWORD *)uint64_t v29 = 138412290;
        *(void *)&v29[4] = objc_opt_class();
        LODWORD(v28) = 12;
        uint64_t v22 = _os_log_send_and_compose_impl();
        if (v22)
        {
          uint64_t v23 = (void *)v22;
          objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, v29, v28);
          free(v23);
          SSFileLog();
          return 1;
        }
      }
      return v21;
    case 5:
      __int16 v24 = (void *)[MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
      if (!v24) {
        __int16 v24 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v25 = [v24 shouldLog];
      if ([v24 shouldLogToDisk]) {
        int v26 = v25 | 2;
      }
      else {
        int v26 = v25;
      }
      if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v26 &= 2u;
      }
      if (v26)
      {
LABEL_51:
        *(_DWORD *)uint64_t v29 = 138412290;
        *(void *)&v29[4] = objc_opt_class();
        LODWORD(v28) = 12;
        int v9 = (void *)_os_log_send_and_compose_impl();
        int v10 = 4;
        if (v9)
        {
LABEL_52:
          objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v29, v28, *(_OWORD *)v29);
          free(v9);
          SSFileLog();
        }
      }
      else
      {
LABEL_53:
        int v10 = 4;
      }
      break;
    default:
      int v14 = 0;
      goto LABEL_56;
  }
  int v14 = (void *)ISError(v10, 0, 0);
LABEL_56:
  BOOL v21 = 0;
  if (a4) {
    *a4 = v14;
  }
  return v21;
}

- (id)parentViewController
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setParentViewController:(id)a3
{
}

@end