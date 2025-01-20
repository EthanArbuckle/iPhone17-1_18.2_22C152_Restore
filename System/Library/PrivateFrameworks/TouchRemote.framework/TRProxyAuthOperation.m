@interface TRProxyAuthOperation
+ (id)_logStringForAppleIDServiceType:(int64_t)a3;
+ (int64_t)_appleIDServiceTypeForTRAccountServices:(id)a3;
- (ACAccount)account;
- (BOOL)canDoTermsAndConditions;
- (BOOL)forceFail;
- (BOOL)isCLIMode;
- (BOOL)isForHomePod;
- (BOOL)shouldUseAIDA;
- (NSSet)targetedServices;
- (NSString)rawPassword;
- (UIViewController)presentingChildViewController;
- (UIViewController)presentingViewController;
- (void)_handleProxyAuthenticationResponse:(id)a3 proxiedDevice:(id)a4;
- (void)_handleProxyDeviceResponse:(id)a3;
- (void)_performProxyAuthenticationWithProxiedDevice:(id)a3;
- (void)_sendProxyDeviceRequest;
- (void)execute;
- (void)setAccount:(id)a3;
- (void)setCanDoTermsAndConditions:(BOOL)a3;
- (void)setForceFail:(BOOL)a3;
- (void)setIsCLIMode:(BOOL)a3;
- (void)setIsForHomePod:(BOOL)a3;
- (void)setPresentingChildViewController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRawPassword:(id)a3;
- (void)setShouldUseAIDA:(BOOL)a3;
- (void)setTargetedServices:(id)a3;
@end

@implementation TRProxyAuthOperation

- (void)execute
{
  if ([(TRProxyAuthOperation *)self isCancelled])
  {
    id v3 = [(id)objc_opt_class() userCancelledError];
    [(TROperation *)self finishWithError:v3];
  }
  else
  {
    [(TRProxyAuthOperation *)self _sendProxyDeviceRequest];
  }
}

- (void)_sendProxyDeviceRequest
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    id v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[TRProxyAuthOperation _sendProxyDeviceRequest]";
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Requesting proxy device", buf, 0xCu);
    }
  }
  v4 = objc_alloc_init(TRSetupProxyDeviceRequest);
  objc_initWeak((id *)buf, self);
  v5 = [(TROperation *)self session];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__TRProxyAuthOperation__sendProxyDeviceRequest__block_invoke;
  v6[3] = &unk_264220930;
  objc_copyWeak(&v7, (id *)buf);
  [v5 sendRequest:v4 withResponseHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __47__TRProxyAuthOperation__sendProxyDeviceRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isCancelled])
  {
    id v7 = [(id)objc_opt_class() userCancelledError];
    [WeakRetained finishWithError:v7];
  }
  else if (v5)
  {
    [WeakRetained _handleProxyDeviceResponse:v5];
  }
  else
  {
    [WeakRetained finishWithError:v8];
  }
}

- (void)_handleProxyDeviceResponse:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    id v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[TRProxyAuthOperation _handleProxyDeviceResponse:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Proxy Device Response: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v4 proxyDevice];
    [(TRProxyAuthOperation *)self _performProxyAuthenticationWithProxiedDevice:v6];
  }
  else
  {
    v6 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-10000 userInfo:0];
    [(TROperation *)self finishWithError:v6];
  }
}

- (void)_performProxyAuthenticationWithProxiedDevice:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TRAnisetteDataProvider alloc];
  v6 = [(TROperation *)self session];
  int v7 = [(TRAnisetteDataProvider *)v5 initWithSession:v6];

  id v8 = objc_alloc_init(getAKAppleIDAuthenticationInAppContextClass());
  __int16 v9 = [(TRProxyAuthOperation *)self presentingViewController];
  [v8 setPresentingViewController:v9];

  id v10 = [(TRProxyAuthOperation *)self account];
  uint64_t v11 = [v10 username];
  [v8 setUsername:v11];

  [v8 setIsUsernameEditable:0];
  [v8 setShouldAllowAppleIDCreation:0];
  v12 = objc_opt_class();
  v13 = [(TRProxyAuthOperation *)self targetedServices];
  objc_msgSend(v8, "setServiceType:", objc_msgSend(v12, "_appleIDServiceTypeForTRAccountServices:", v13));

  [v8 setShouldForceInteractiveAuth:0];
  [v8 setProxiedDevice:v4];
  [v8 setAnisetteDataProvider:v7];
  [v8 _setProxyingForApp:1];
  if (self->_isCLIMode)
  {
    rawPassword = self->_rawPassword;
    if (rawPassword)
    {
      if (_TRLogEnabled == 1)
      {
        v15 = TRLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:]";
          _os_log_impl(&dword_2149BE000, v15, OS_LOG_TYPE_DEFAULT, "%s _performProxyAuthenticationWithProxiedDevice _isCLIMode is enabled, setting raw password", buf, 0xCu);
        }

        rawPassword = self->_rawPassword;
      }
      [v8 _setPassword:rawPassword];
    }
  }
  if (_TRLogEnabled == 1)
  {
    v16 = TRLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v8 username];
      v18 = objc_msgSend((id)objc_opt_class(), "_logStringForAppleIDServiceType:", objc_msgSend(v8, "serviceType"));
      *(_DWORD *)buf = 136315650;
      v27 = "-[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:]";
      __int16 v28 = 2112;
      v29 = v17;
      __int16 v30 = 2114;
      v31 = v18;
      _os_log_impl(&dword_2149BE000, v16, OS_LOG_TYPE_DEFAULT, "%s Attempting authentication of account %@ using service type %{public}@", buf, 0x20u);
    }
  }
  id v19 = objc_alloc_init(MEMORY[0x263F29118]);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __69__TRProxyAuthOperation__performProxyAuthenticationWithProxiedDevice___block_invoke;
  v22[3] = &unk_264220CA0;
  id v23 = v19;
  v24 = self;
  id v25 = v4;
  id v20 = v4;
  id v21 = v19;
  [v21 authenticateWithContext:v8 completion:v22];
}

void __69__TRProxyAuthOperation__performProxyAuthenticationWithProxiedDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (_TRLogEnabled == 1)
  {
    int v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"<auth results>";
      uint64_t v9 = *(void *)(a1 + 32);
      v26 = "-[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:]_block_invoke";
      *(_DWORD *)buf = 136315906;
      if (!v5) {
        id v8 = @"<no auth results>";
      }
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      __int16 v30 = v8;
      __int16 v31 = 2112;
      uint64_t v32 = v9;
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %@ with %@", buf, 0x2Au);
    }
  }
  if (v5)
  {
    id v10 = objc_alloc_init(TRSetupProxyAuthenticationRequest);
    uint64_t v11 = [*(id *)(a1 + 40) account];
    [(TRSetupProxyAuthenticationRequest *)v10 setAccount:v11];

    uint64_t v12 = *(void *)(a1 + 40);
    if (!*(unsigned char *)(v12 + 292))
    {
      v13 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FF8]];
      [(TRSetupProxyAuthenticationRequest *)v10 setRawPassword:v13];

      uint64_t v12 = *(void *)(a1 + 40);
    }
    if (*(unsigned char *)(v12 + 290))
    {
      uint64_t v14 = *(void *)(v12 + 328);
      if (v14)
      {
        if (_TRLogEnabled == 1)
        {
          v15 = TRLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v26 = "-[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:]_block_invoke";
            _os_log_impl(&dword_2149BE000, v15, OS_LOG_TYPE_DEFAULT, "%s AKAppleIDAuthenticationController authenticateWithContext _isCLIMode is enabled, setting raw password", buf, 0xCu);
          }

          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 328);
        }
        [(TRSetupProxyAuthenticationRequest *)v10 setRawPassword:v14];
        uint64_t v12 = *(void *)(a1 + 40);
      }
    }
    v16 = [(id)v12 targetedServices];
    [(TRSetupProxyAuthenticationRequest *)v10 setTargetedAccountServices:v16];

    -[TRSetupProxyAuthenticationRequest setShouldUseAIDA:](v10, "setShouldUseAIDA:", [*(id *)(a1 + 40) shouldUseAIDA]);
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    v17 = [*(id *)(a1 + 40) session];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __69__TRProxyAuthOperation__performProxyAuthenticationWithProxiedDevice___block_invoke_17;
    v22[3] = &unk_264220C78;
    objc_copyWeak(&v24, (id *)buf);
    id v23 = *(id *)(a1 + 48);
    [v17 sendRequest:v10 withResponseHandler:v22];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      v18 = TRLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:]_block_invoke";
        _os_log_impl(&dword_2149BE000, v18, OS_LOG_TYPE_DEFAULT, "%s Failed to receive proxy authentication results", buf, 0xCu);
      }
    }
    id v10 = (TRSetupProxyAuthenticationRequest *)objc_opt_new();
    id v19 = [*(id *)(a1 + 40) targetedServices];
    [(TRSetupProxyAuthenticationRequest *)v10 setObject:v19 forKeyedSubscript:@"TRProxyAuthOperationUnauthenticatedServicesKey"];

    if (v6) {
      [(TRSetupProxyAuthenticationRequest *)v10 setObject:v6 forKeyedSubscript:@"TRProxyAuthOperationErrorKey"];
    }
    id v20 = *(void **)(a1 + 40);
    id v21 = (void *)[(TRSetupProxyAuthenticationRequest *)v10 copy];
    [v20 finishWithResult:v21];
  }
}

void __69__TRProxyAuthOperation__performProxyAuthenticationWithProxiedDevice___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isCancelled])
  {
    int v7 = [(id)objc_opt_class() userCancelledError];
    [WeakRetained finishWithError:v7];
  }
  else if (v5)
  {
    [WeakRetained _handleProxyAuthenticationResponse:v5 proxiedDevice:*(void *)(a1 + 32)];
  }
  else
  {
    [WeakRetained finishWithError:v8];
  }
}

- (void)_handleProxyAuthenticationResponse:(id)a3 proxiedDevice:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_TRLogEnabled == 1)
  {
    id v8 = TRLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[TRProxyAuthOperation _handleProxyAuthenticationResponse:proxiedDevice:]";
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v6;
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "%s Handle Proxy Authentication Response: %@", buf, 0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    id v10 = objc_opt_new();
    uint64_t v11 = [v9 unauthenticatedAccountServices];
    [v10 setObject:v11 forKeyedSubscript:@"TRProxyAuthOperationUnauthenticatedServicesKey"];

    uint64_t v12 = [v9 error];

    if (v12)
    {
      if (_TRLogEnabled == 1)
      {
        v13 = TRLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2149BE000, v13, OS_LOG_TYPE_DEFAULT, "Error in response", buf, 2u);
        }
      }
      uint64_t v14 = [v9 error];
      [v10 setObject:v14 forKeyedSubscript:@"TRProxyAuthOperationErrorKey"];
    }
    else
    {
      v18 = [v9 authenticationResults];
      id v19 = v18;
      if (v18
        && self->_presentingViewController
        && !self->_isCLIMode
        && self->_canDoTermsAndConditions
        && self->_isForHomePod)
      {
        BOOL v20 = [(NSSet *)self->_targetedServices containsObject:&unk_26C58CC50];

        if (v20)
        {
          if (_TRLogEnabled == 1)
          {
            id v21 = TRLogHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2149BE000, v21, OS_LOG_TYPE_DEFAULT, "Showing Terms for Proxy Auth", buf, 2u);
            }
          }
          v22 = [TRAnisetteDataProvider alloc];
          id v23 = [(TROperation *)self session];
          v15 = [(TRAnisetteDataProvider *)v22 initWithSession:v23];

          id v24 = [TRTermsAndConditionsManager alloc];
          id v25 = [v9 authenticationResults];
          v26 = [(TRTermsAndConditionsManager *)v24 initWithAuthResultsBlock:v25 presentingViewController:self->_presentingChildViewController];
          termsManager = self->_termsManager;
          self->_termsManager = v26;

          id v28 = self->_termsManager;
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __73__TRProxyAuthOperation__handleProxyAuthenticationResponse_proxiedDevice___block_invoke;
          v31[3] = &unk_264220CC8;
          v31[4] = self;
          id v32 = v10;
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __73__TRProxyAuthOperation__handleProxyAuthenticationResponse_proxiedDevice___block_invoke_2;
          v30[3] = &unk_264220858;
          v30[4] = self;
          [(TRTermsAndConditionsManager *)v28 loadProxiedTerms:v7 anisetteDataProvider:v15 appProvidedContext:@"HomePodSetup" acceptAction:v31 declineAction:v30];
          if (_TRLogEnabled == 1)
          {
            __int16 v29 = TRLogHandle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v34 = "-[TRProxyAuthOperation _handleProxyAuthenticationResponse:proxiedDevice:]";
              _os_log_impl(&dword_2149BE000, v29, OS_LOG_TYPE_DEFAULT, "%s Terms Done", buf, 0xCu);
            }
          }
          goto LABEL_14;
        }
      }
      else
      {
      }
      if (_TRLogEnabled != 1)
      {
LABEL_13:
        v15 = (TRAnisetteDataProvider *)[v10 copy];
        [(TROperation *)self finishWithResult:v15];
LABEL_14:

        goto LABEL_20;
      }
      uint64_t v14 = TRLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2149BE000, v14, OS_LOG_TYPE_DEFAULT, "Proxy Auth Skipping terms", buf, 2u);
      }
    }

    goto LABEL_13;
  }
  if (_TRLogEnabled == 1)
  {
    v16 = TRLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 136315394;
      v34 = "-[TRProxyAuthOperation _handleProxyAuthenticationResponse:proxiedDevice:]";
      __int16 v35 = 2112;
      uint64_t v36 = v17;
      _os_log_impl(&dword_2149BE000, v16, OS_LOG_TYPE_DEFAULT, "%s response class is not TRSetupAuthenticationResponse: %@", buf, 0x16u);
    }
  }
  id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-10000 userInfo:0];
  [(TROperation *)self finishWithError:v9];
LABEL_20:
}

void __73__TRProxyAuthOperation__handleProxyAuthenticationResponse_proxiedDevice___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 finishWithResult:v2];
}

void __73__TRProxyAuthOperation__handleProxyAuthenticationResponse_proxiedDevice___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"TROperationErrorDomain" code:-12002 userInfo:0];
  [v1 finishWithError:v2];
}

+ (int64_t)_appleIDServiceTypeForTRAccountServices:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:&unk_26C58CC50])
  {
    int64_t v4 = 1;
  }
  else if ([v3 containsObject:&unk_26C58CC68])
  {
    int64_t v4 = 2;
  }
  else if ([v3 containsObject:&unk_26C58CC80])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)_logStringForAppleIDServiceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"UNKNOWN";
  }
  else {
    return off_264220CE8[a3 - 1];
  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSSet)targetedServices
{
  return self->_targetedServices;
}

- (void)setTargetedServices:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (BOOL)shouldUseAIDA
{
  return self->_shouldUseAIDA;
}

- (void)setShouldUseAIDA:(BOOL)a3
{
  self->_shouldUseAIDA = a3;
}

- (BOOL)isForHomePod
{
  return self->_isForHomePod;
}

- (void)setIsForHomePod:(BOOL)a3
{
  self->_isForHomePod = a3;
}

- (UIViewController)presentingChildViewController
{
  return self->_presentingChildViewController;
}

- (void)setPresentingChildViewController:(id)a3
{
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
}

- (BOOL)canDoTermsAndConditions
{
  return self->_canDoTermsAndConditions;
}

- (void)setCanDoTermsAndConditions:(BOOL)a3
{
  self->_canDoTermsAndConditions = a3;
}

- (BOOL)forceFail
{
  return self->_forceFail;
}

- (void)setForceFail:(BOOL)a3
{
  self->_forceFail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_presentingChildViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_targetedServices, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_termsManager, 0);
}

@end