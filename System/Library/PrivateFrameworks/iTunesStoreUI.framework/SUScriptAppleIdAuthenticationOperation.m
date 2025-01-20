@interface SUScriptAppleIdAuthenticationOperation
- (NSString)status;
- (SUScriptAppleIdAuthenticationOperation)initWithUsername:(id)a3 password:(id)a4 viewController:(id)a5;
- (void)run;
- (void)sendCompletionCallback:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation SUScriptAppleIdAuthenticationOperation

- (SUScriptAppleIdAuthenticationOperation)initWithUsername:(id)a3 password:(id)a4 viewController:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v24 = 138543362;
      id v25 = (id)objc_opt_class();
      id v19 = v25;
      LODWORD(v22) = 12;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_14:

        v14 = 0;
        goto LABEL_15;
      }
      v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v24, v22);
      free(v20);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v23.receiver = self;
  v23.super_class = (Class)SUScriptAppleIdAuthenticationOperation;
  v11 = [(SUScriptAppleIdAuthenticationOperation *)&v23 init];
  if (v11)
  {
    v12 = (AKAppleIDAuthenticationInAppContext *)objc_alloc_init(getAKAppleIDAuthenticationInAppContextClass());
    authenticationContext = v11->_authenticationContext;
    v11->_authenticationContext = v12;

    [(AKAppleIDAuthenticationInAppContext *)v11->_authenticationContext setUsername:v8];
    [(AKAppleIDAuthenticationInAppContext *)v11->_authenticationContext _setPassword:v9];
    [(AKAppleIDAuthenticationInAppContext *)v11->_authenticationContext setShouldForceInteractiveAuth:0];
    [(AKAppleIDAuthenticationInAppContext *)v11->_authenticationContext setIsUsernameEditable:1];
    [(AKAppleIDAuthenticationInAppContext *)v11->_authenticationContext setShouldUpdatePersistentServiceTokens:1];
    [(AKAppleIDAuthenticationInAppContext *)v11->_authenticationContext setPresentingViewController:v10];
    [(AKAppleIDAuthenticationInAppContext *)v11->_authenticationContext setFirstTimeLogin:1];
    [(AKAppleIDAuthenticationInAppContext *)v11->_authenticationContext setIsUsernameEditable:0];
    objc_storeStrong((id *)&v11->_viewController, a5);
  }
  self = v11;
  v14 = self;
LABEL_15:

  return v14;
}

- (void)run
{
  id v3 = objc_alloc_init(getAKAppleIDAuthenticationControllerClass());
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  authenticationContext = self->_authenticationContext;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SUScriptAppleIdAuthenticationOperation_run__block_invoke;
  v8[3] = &unk_264812308;
  v8[4] = self;
  dispatch_semaphore_t v9 = v4;
  v6 = v4;
  [v3 authenticateWithContext:authenticationContext completion:v8];
  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v6, v7);
}

void __45__SUScriptAppleIdAuthenticationOperation_run__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFB210]);
    v14 = (void *)[objc_alloc(MEMORY[0x263F26D88]) initWithAccountStore:v13];
    id v15 = objc_alloc_init(MEMORY[0x263F26D78]);
    [v15 setAuthenticationResults:v5];
    [v15 setViewController:*(void *)(*(void *)(a1 + 32) + 344)];
    uint64_t v16 = *MEMORY[0x263F26D28];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __45__SUScriptAppleIdAuthenticationOperation_run__block_invoke_32;
    v21[3] = &unk_264812F70;
    int v17 = *(void **)(a1 + 40);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v17;
    [v14 signInService:v16 withContext:v15 completion:v21];
    v18 = *(NSObject **)(a1 + 40);
    dispatch_time_t v19 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v18, v19);

    goto LABEL_13;
  }
  dispatch_time_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_10;
  }
  int v23 = 138412546;
  id v24 = (id)objc_opt_class();
  __int16 v25 = 2112;
  id v26 = v6;
  id v11 = v24;
  LODWORD(v20) = 22;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v23, v20);
    free(v12);
    SSFileLog();
LABEL_10:
  }
  [*(id *)(a1 + 32) setError:v6];
  [*(id *)(a1 + 32) setSuccess:0];
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __45__SUScriptAppleIdAuthenticationOperation_run__block_invoke_32(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      *(_DWORD *)v14 = 138412546;
      *(void *)&v14[4] = objc_opt_class();
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = v5;
      id v10 = *(id *)&v14[4];
      LODWORD(v13) = 22;
      v12 = v14;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_11:

        [*(id *)(a1 + 32) setError:v5];
        goto LABEL_12;
      }
      int v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v14, v13, *(_OWORD *)v14, *(void *)&v14[16], v15);
      free(v11);
      v12 = v9;
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "setSuccess:", a2, v12);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)sendCompletionCallback:(id)a3
{
  id v4 = a3;
  id v5 = [(SUScriptAppleIdAuthenticationOperation *)self error];
  uint64_t v6 = [v5 code];

  if (v6 == -7064)
  {
    status = self->_status;
    int v8 = @"cancel";
  }
  else
  {
    char v9 = [(SUScriptAppleIdAuthenticationOperation *)self success];
    status = self->_status;
    if (v9) {
      int v8 = @"success";
    }
    else {
      int v8 = @"fail";
    }
  }
  self->_status = &v8->isa;

  id v10 = v4;
  WebThreadRun();
}

void __65__SUScriptAppleIdAuthenticationOperation_sendCompletionCallback___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  id v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_9;
  }
  uint64_t v6 = objc_opt_class();
  int v7 = *(void **)(a1 + 32);
  id v8 = v6;
  [v7 status];
  int v15 = 138412546;
  uint64_t v16 = v6;
  __int16 v17 = 2112;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 22;
  char v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v15, v13);
    free(v9);
    SSFileLog();
LABEL_9:
  }
  id v10 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 40)];
  [(SUScriptFunction *)v10 setThisObject:*(void *)(a1 + 32)];
  id v11 = [*(id *)(a1 + 32) status];
  v14 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  [(SUScriptFunction *)v10 callWithArguments:v12];

  [(SUScriptFunction *)v10 setThisObject:0];
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end