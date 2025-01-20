@interface SKUIRedeemIdRequiresValidationOperation
- (BOOL)_performAuthentication;
- (SKUIRedeemViewControllerLegacy)redeemViewController;
- (id)_authenticationContext;
- (id)_subOperationWithBagKey:(id)a3;
- (id)resultBlock;
- (void)_logResultsForSuccess:(BOOL)a3 shouldVerify:(BOOL)a4 failureReason:(id)a5 error:(id)a6;
- (void)main;
- (void)operation:(id)a3 selectedButton:(id)a4;
- (void)setRedeemViewController:(id)a3;
- (void)setResultBlock:(id)a3;
@end

@implementation SKUIRedeemIdRequiresValidationOperation

- (void)main
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemIdRequiresValidationOperation main]";
}

uint64_t __47__SKUIRedeemIdRequiresValidationOperation_main__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(*(void *)(a1 + 32) + 336) + 16))(*(void *)(*(void *)(a1 + 32) + 336), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)operation:(id)a3 selectedButton:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SKUIRedeemIdRequiresValidationOperation_operation_selectedButton___block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __68__SKUIRedeemIdRequiresValidationOperation_operation_selectedButton___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 336) + 16))();
}

- (BOOL)_performAuthentication
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB87E8]);
  v4 = [(SKUIRedeemIdRequiresValidationOperation *)self _authenticationContext];
  v5 = [v4 requiredUniqueIdentifier];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  if (([v3 canPerformExtendedBiometricActionsForAccountIdentifier:v5] & 1) == 0)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = objc_alloc(MEMORY[0x1E4FA8128]);
    v8 = [(SKUIRedeemIdRequiresValidationOperation *)self _authenticationContext];
    v9 = (void *)[v7 initWithAuthenticationContext:v8];

    v10 = [(SKUIRedeemIdRequiresValidationOperation *)self redeemViewController];
    objc_msgSend(v9, "set_parentViewController:", v10);

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__SKUIRedeemIdRequiresValidationOperation__performAuthentication__block_invoke;
    v14[3] = &unk_1E642A410;
    v16 = &v17;
    v11 = v6;
    v15 = v11;
    [v9 startWithAuthenticateResponseBlock:v14];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  char v12 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return v12;
}

intptr_t __65__SKUIRedeemIdRequiresValidationOperation__performAuthentication__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 authenticatedAccount];

  if (!v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

- (id)_authenticationContext
{
  uint64_t v2 = [MEMORY[0x1E4FA8100] defaultStore];
  id v3 = [v2 activeAccount];

  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FA8260]) initWithAccount:v3];
    [v4 setPromptStyle:1];
    [v4 setShouldCreateNewSession:1];
  }
  else
  {
    v4 = [MEMORY[0x1E4FA8260] contextForSignIn];
  }

  return v4;
}

- (id)_subOperationWithBagKey:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FB8858];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4FA8268]);
  [v6 setITunesStoreRequest:1];
  id v7 = SSVDefaultUserAgent();
  [v6 setValue:v7 forHTTPHeaderField:@"User-Agent"];

  [v6 setURLBagKey:v4];
  [v5 setRequestProperties:v6];
  v8 = [MEMORY[0x1E4FB8850] provider];
  [v5 setDataProvider:v8];

  return v5;
}

- (void)_logResultsForSuccess:(BOOL)a3 shouldVerify:(BOOL)a4 failureReason:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  v15[0] = @"success";
  v11 = [NSNumber numberWithBool:v8];
  v15[1] = @"hasNationalId";
  v16[0] = v11;
  char v12 = [NSNumber numberWithInt:!v7];
  v16[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v14 = (void *)[v13 mutableCopy];

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

- (SKUIRedeemViewControllerLegacy)redeemViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redeemViewController);

  return (SKUIRedeemViewControllerLegacy *)WeakRetained;
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