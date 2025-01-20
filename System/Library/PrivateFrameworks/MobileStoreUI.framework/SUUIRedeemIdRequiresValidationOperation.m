@interface SUUIRedeemIdRequiresValidationOperation
- (BOOL)_performAuthentication;
- (SUUIRedeemViewControllerLegacy)redeemViewController;
- (id)_authenticationContext;
- (id)_subOperationWithBagKey:(id)a3;
- (id)resultBlock;
- (void)_logResultsForSuccess:(BOOL)a3 shouldVerify:(BOOL)a4 failureReason:(id)a5 error:(id)a6;
- (void)main;
- (void)operation:(id)a3 selectedButton:(id)a4;
- (void)setRedeemViewController:(id)a3;
- (void)setResultBlock:(id)a3;
@end

@implementation SUUIRedeemIdRequiresValidationOperation

- (void)main
{
  if ([(SUUIRedeemIdRequiresValidationOperation *)self _performAuthentication])
  {
    v3 = [(SUUIRedeemIdRequiresValidationOperation *)self _subOperationWithBagKey:@"redeemUserHasIdUrl"];
    id v16 = 0;
    int v4 = [(SUUIRedeemIdRequiresValidationOperation *)self runSubOperation:v3 returningError:&v16];
    id v5 = v16;
    if (v4)
    {
      v6 = [v3 dataProvider];
      v7 = [v6 output];

      v8 = [v7 objectForKeyedSubscript:@"status"];
      if ((objc_opt_respondsToSelector() & 1) != 0 && ![v8 integerValue])
      {
        v12 = [v7 objectForKeyedSubscript:@"hasNationalId"];
        objc_opt_class();
        LOBYTE(v4) = objc_opt_isKindOfClass();
        if (v4)
        {
          v10 = 0;
          if (objc_opt_respondsToSelector()) {
            uint64_t v9 = [v12 BOOLValue] ^ 1;
          }
          else {
            uint64_t v9 = 1;
          }
        }
        else
        {
          uint64_t v9 = 0;
          v10 = @"Bad/Non-present hasNationalId.";
        }
      }
      else
      {
        LOBYTE(v4) = 0;
        uint64_t v9 = 0;
        v10 = @"Status code != 0.";
      }
    }
    else
    {
      uint64_t v9 = 0;
      v10 = @"Failed sub-operation";
    }

    [(SUUIRedeemIdRequiresValidationOperation *)self _logResultsForSuccess:v4 & 1 shouldVerify:v9 failureReason:v10 error:v5];
    if (v5 && (v4 & 1) == 0)
    {
      v11 = [MEMORY[0x263F89498] operationWithError:v5];
      [v11 setDelegate:self];
      [(SUUIRedeemIdRequiresValidationOperation *)self runSubOperation:v11 returningError:0];

      goto LABEL_13;
    }
  }
  else
  {
    [(SUUIRedeemIdRequiresValidationOperation *)self _logResultsForSuccess:0 shouldVerify:0 failureReason:0 error:0];
    LOBYTE(v9) = 0;
    id v5 = 0;
    LOBYTE(v4) = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SUUIRedeemIdRequiresValidationOperation_main__block_invoke;
  block[3] = &unk_2654087F0;
  block[4] = self;
  char v14 = v4 & 1;
  char v15 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_13:
}

uint64_t __47__SUUIRedeemIdRequiresValidationOperation_main__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(*(void *)(a1 + 32) + 336) + 16))(*(void *)(*(void *)(a1 + 32) + 336), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)operation:(id)a3 selectedButton:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SUUIRedeemIdRequiresValidationOperation_operation_selectedButton___block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__SUUIRedeemIdRequiresValidationOperation_operation_selectedButton___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 336) + 16))();
}

- (BOOL)_performAuthentication
{
  id v3 = objc_alloc_init(MEMORY[0x263F89460]);
  int v4 = [(SUUIRedeemIdRequiresValidationOperation *)self _authenticationContext];
  id v5 = [v4 requiredUniqueIdentifier];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  if (([v3 canPerformExtendedBiometricActionsForAccountIdentifier:v5] & 1) == 0)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = objc_alloc(MEMORY[0x263F7B118]);
    v8 = [(SUUIRedeemIdRequiresValidationOperation *)self _authenticationContext];
    uint64_t v9 = (void *)[v7 initWithAuthenticationContext:v8];

    v10 = [(SUUIRedeemIdRequiresValidationOperation *)self redeemViewController];
    objc_msgSend(v9, "set_parentViewController:", v10);

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __65__SUUIRedeemIdRequiresValidationOperation__performAuthentication__block_invoke;
    v14[3] = &unk_265408818;
    id v16 = &v17;
    v11 = v6;
    char v15 = v11;
    [v9 startWithAuthenticateResponseBlock:v14];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  char v12 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return v12;
}

intptr_t __65__SUUIRedeemIdRequiresValidationOperation__performAuthentication__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 authenticatedAccount];

  if (!v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  int v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

- (id)_authenticationContext
{
  v2 = [MEMORY[0x263F7B0E8] defaultStore];
  id v3 = [v2 activeAccount];

  if (v3)
  {
    int v4 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccount:v3];
    [v4 setPromptStyle:1];
    [v4 setShouldCreateNewSession:1];
  }
  else
  {
    int v4 = [MEMORY[0x263F7B288] contextForSignIn];
  }

  return v4;
}

- (id)_subOperationWithBagKey:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F89528];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v6 setITunesStoreRequest:1];
  id v7 = SSVDefaultUserAgent();
  [v6 setValue:v7 forHTTPHeaderField:@"User-Agent"];

  [v6 setURLBagKey:v4];
  [v5 setRequestProperties:v6];
  v8 = [MEMORY[0x263F89508] provider];
  [v5 setDataProvider:v8];

  return v5;
}

- (void)_logResultsForSuccess:(BOOL)a3 shouldVerify:(BOOL)a4 failureReason:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  v16[2] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  v15[0] = @"success";
  v11 = [NSNumber numberWithBool:v8];
  v15[1] = @"hasNationalId";
  v16[0] = v11;
  char v12 = [NSNumber numberWithInt:!v7];
  v16[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  char v14 = (void *)[v13 mutableCopy];

  if (v9) {
    [v14 setObject:v9 forKeyedSubscript:@"failure reason"];
  }
  if (v10) {
    [v14 setObject:v10 forKeyedSubscript:@"error"];
  }
  SSDebugLog();
}

- (id)resultBlock
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setResultBlock:(id)a3
{
}

- (SUUIRedeemViewControllerLegacy)redeemViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redeemViewController);
  return (SUUIRedeemViewControllerLegacy *)WeakRetained;
}

- (void)setRedeemViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redeemViewController);
  objc_storeStrong(&self->_resultBlock, 0);
}

@end