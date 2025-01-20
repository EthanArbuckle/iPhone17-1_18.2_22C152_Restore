@interface SUScriptAuthenticationOperation
- (NSNumber)authenticatedDSID;
- (SUScriptAuthenticationOperation)init;
- (SUScriptAuthenticationOperation)initWithAccountIdentifier:(id)a3;
- (UIViewController)presentingViewController;
- (void)run;
- (void)sendCompletionCallback:(id)a3;
- (void)setAuthenticatedDSID:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setScriptOptions:(id)a3;
@end

@implementation SUScriptAuthenticationOperation

- (SUScriptAuthenticationOperation)init
{
  return [(SUScriptAuthenticationOperation *)self initWithAccountIdentifier:0];
}

- (SUScriptAuthenticationOperation)initWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptAuthenticationOperation;
  v5 = [(SUScriptAuthenticationOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F7B288]) initWithAccountIdentifier:v4];
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (SSMutableAuthenticationContext *)v6;
  }
  return v5;
}

- (void)run
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  uint64_t v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    v7 = objc_opt_class();
    authenticationContext = self->_authenticationContext;
    id v9 = v7;
    v10 = [(SSMutableAuthenticationContext *)authenticationContext requiredUniqueIdentifier];
    int v28 = 138412546;
    v29 = v7;
    __int16 v30 = 2112;
    id v31 = v10;
    LODWORD(v26) = 22;
    v25 = &v28;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v28, v26);
    free(v11);
    v25 = (int *)v6;
    SSFileLog();
  }

LABEL_10:
  [(SSMutableAuthenticationContext *)self->_authenticationContext setForceDaemonAuthentication:1];
  v12 = (void *)[objc_alloc(MEMORY[0x263F89520]) initWithAuthenticationContext:self->_authenticationContext];
  v13 = [(SUScriptAuthenticationOperation *)self presentingViewController];

  if (v13)
  {
    v14 = [(SUScriptAuthenticationOperation *)self presentingViewController];
    [v12 setParentViewController:v14];
  }
  id v27 = 0;
  int v15 = -[SUScriptAuthenticationOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v12, &v27, v25);
  id v16 = v27;
  if (!v15)
  {
    v18 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    v21 = [v18 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (v20)
    {
      v22 = objc_opt_class();
      int v28 = 138412546;
      v29 = v22;
      __int16 v30 = 2112;
      id v31 = v16;
      id v23 = v22;
      LODWORD(v26) = 22;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_23:

        [(SUScriptAuthenticationOperation *)self setError:v16];
        goto LABEL_24;
      }
      v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v28, v26);
      free(v24);
      SSFileLog();
    }

    goto LABEL_23;
  }
  v17 = [v12 authenticatedAccountDSID];
  [(SUScriptAuthenticationOperation *)self setAuthenticatedDSID:v17];

  [(SUScriptAuthenticationOperation *)self setSuccess:1];
LABEL_24:
}

- (void)sendCompletionCallback:(id)a3
{
  id v4 = a3;
  int v5 = [(SUScriptAuthenticationOperation *)self error];
  char IsEqual = ISErrorIsEqual();

  if (IsEqual)
  {
    v7 = 0;
    v8 = @"cancel";
  }
  else if ([(SUScriptAuthenticationOperation *)self success])
  {
    id v9 = +[SUScriptAccountManager beginAccountManagerSessionForObject:self];
    v10 = [(SUScriptAuthenticationOperation *)self authenticatedAccountDSID];
    v7 = [v9 accountForDSID:v10];

    +[SUScriptAccountManager endAccountManagerSessionForObject:self];
    v8 = @"success";
  }
  else
  {
    v7 = 0;
    v8 = @"fail";
  }
  v13 = v4;
  v14 = v8;
  id v11 = v7;
  id v12 = v4;
  WebThreadRun();
}

void __58__SUScriptAuthenticationOperation_sendCompletionCallback___block_invoke(uint64_t *a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF8C0]);
  v3 = v2;
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  if (a1[6])
  {
    uint64_t v6 = objc_msgSend(v2, "initWithObjects:", v4, v5, a1[6], 0);
  }
  else
  {
    v7 = [MEMORY[0x263EFF9D0] null];
    id v9 = (id)objc_msgSend(v3, "initWithObjects:", v4, v5, v7, 0);

    uint64_t v6 = (uint64_t)v9;
  }
  id v10 = (id)v6;
  id v8 = (id)[(id)a1[4] callWebScriptMethod:@"call" withArguments:v6];
}

- (void)setScriptOptions:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v11 safeValueForKey:@"additionalQueryParameters"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [v11 safeValueForKey:@"additionalQueryParamters"];

      uint64_t v4 = (void *)v5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void *)[NSURL copyDictionaryForQueryString:v4 unescapedValues:1];
      [(SSMutableAuthenticationContext *)self->_authenticationContext setRequestParameters:v6];
    }
    v7 = [v11 safeValueForKey:@"forced"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v7 BOOLValue]) {
      [(SSMutableAuthenticationContext *)self->_authenticationContext setPromptStyle:1];
    }
    id v8 = [v11 safeValueForKey:@"reason"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SSMutableAuthenticationContext *)self->_authenticationContext setReasonDescription:v8];
    }
    id v9 = [v11 safeValueForKey:@"username"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SSMutableAuthenticationContext *)self->_authenticationContext setAccountName:v9];
    }
    id v10 = [v11 safeValueForKey:@"password"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SSMutableAuthenticationContext *)self->_authenticationContext setPassword:v10];
      [(SSMutableAuthenticationContext *)self->_authenticationContext setPromptStyle:1001];
      [(SSMutableAuthenticationContext *)self->_authenticationContext setAllowsSilentAuthentication:1];
    }
  }

  MEMORY[0x270F9A758]();
}

- (NSNumber)authenticatedDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setAuthenticatedDSID:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 352, 1);
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);

  objc_storeStrong((id *)&self->_authenticatedDSID, 0);
}

@end