@interface TRCompanionAuthOperation
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
- (void)_handleProxyDeviceResponse:(id)a3;
- (void)_handleResponse:(id)a3 proxiedDevice:(id)a4;
- (void)_performCompanionAuthenticationWithProxiedDevice:(id)a3;
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

@implementation TRCompanionAuthOperation

- (void)execute
{
  if ([(TRCompanionAuthOperation *)self isCancelled])
  {
    id v3 = [(id)objc_opt_class() userCancelledError];
    [(TROperation *)self finishWithError:v3];
  }
  else
  {
    [(TRCompanionAuthOperation *)self _sendProxyDeviceRequest];
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
      v9 = "-[TRCompanionAuthOperation _sendProxyDeviceRequest]";
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Requesting proxy device", buf, 0xCu);
    }
  }
  v4 = objc_alloc_init(TRSetupProxyDeviceRequest);
  objc_initWeak((id *)buf, self);
  v5 = [(TROperation *)self session];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__TRCompanionAuthOperation__sendProxyDeviceRequest__block_invoke;
  v6[3] = &unk_264220930;
  objc_copyWeak(&v7, (id *)buf);
  [v5 sendRequest:v4 withResponseHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __51__TRCompanionAuthOperation__sendProxyDeviceRequest__block_invoke(uint64_t a1, void *a2, void *a3)
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
      id v8 = "-[TRCompanionAuthOperation _handleProxyDeviceResponse:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Proxy Device Response: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v4 proxyDevice];
    if (v6) {
      [(TRCompanionAuthOperation *)self _performCompanionAuthenticationWithProxiedDevice:v6];
    }
  }
  else
  {
    v6 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-10000 userInfo:0];
    [(TROperation *)self finishWithError:v6];
  }
}

- (void)_performCompanionAuthenticationWithProxiedDevice:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFB210] defaultStore];
  v6 = [(TRCompanionAuthOperation *)self account];
  id v25 = 0;
  int v7 = [v5 credentialForAccount:v6 error:&v25];
  id v8 = v25;

  if (v7)
  {
    __int16 v9 = [(TRCompanionAuthOperation *)self account];
    [v9 setCredential:v7];

    if (_TRLogEnabled == 1)
    {
      id v10 = TRLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [(TRCompanionAuthOperation *)self account];
        *(_DWORD *)buf = 136315394;
        v29 = "-[TRCompanionAuthOperation _performCompanionAuthenticationWithProxiedDevice:]";
        __int16 v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, "%s Loaded credentials for account %@.", buf, 0x16u);
      }
    }
    v12 = [MEMORY[0x263F291C0] currentDevice];
    [v12 setLinkType:3];
    v13 = objc_alloc_init(TRSetupCompanionAuthenticationRequest);
    [(TRSetupCompanionAuthenticationRequest *)v13 setCompanionDevice:v12];
    v14 = [(TRCompanionAuthOperation *)self account];
    [(TRSetupCompanionAuthenticationRequest *)v13 setAccount:v14];

    v15 = [(TRCompanionAuthOperation *)self targetedServices];
    [(TRSetupCompanionAuthenticationRequest *)v13 setTargetedAccountServices:v15];

    [(TRSetupCompanionAuthenticationRequest *)v13 setShouldUseAIDA:[(TRCompanionAuthOperation *)self shouldUseAIDA]];
    if (!self->_forceFail)
    {
      v16 = [(TRCompanionAuthOperation *)self account];
      [(TRSetupCompanionAuthenticationRequest *)v13 setAccount:v16];
    }
    objc_initWeak((id *)buf, self);
    v17 = [(TROperation *)self session];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __77__TRCompanionAuthOperation__performCompanionAuthenticationWithProxiedDevice___block_invoke;
    v22[3] = &unk_264220C78;
    objc_copyWeak(&v24, (id *)buf);
    id v23 = v4;
    [v17 sendRequest:v13 withResponseHandler:v22];

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
        v19 = [(TRCompanionAuthOperation *)self account];
        *(_DWORD *)buf = 136315650;
        v29 = "-[TRCompanionAuthOperation _performCompanionAuthenticationWithProxiedDevice:]";
        __int16 v30 = 2112;
        v31 = v19;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_impl(&dword_2149BE000, v18, OS_LOG_TYPE_DEFAULT, "%s Failed to load credentials for account %@.  Error: %@", buf, 0x20u);
      }
    }
    v26 = @"TRCompanionAuthOperationUnauthenticatedServicesKey";
    v20 = [(TRCompanionAuthOperation *)self targetedServices];
    v27 = v20;
    v21 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v12 = (void *)[v21 mutableCopy];

    if (v8) {
      [v12 setObject:v8 forKeyedSubscript:@"TRCompanionAuthOperationErrorKey"];
    }
    v13 = (TRSetupCompanionAuthenticationRequest *)[v12 copy];
    [(TROperation *)self finishWithResult:v13];
  }
}

void __77__TRCompanionAuthOperation__performCompanionAuthenticationWithProxiedDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isCancelled])
  {
    if (_TRLogEnabled == 1)
    {
      id v8 = TRLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "TRCompanionAuthOperation userCancelledError", buf, 2u);
      }
    }
    __int16 v9 = [(id)objc_opt_class() userCancelledError];
    [WeakRetained finishWithError:v9];
  }
  else if (v6)
  {
    if (_TRLogEnabled == 1)
    {
      id v10 = TRLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, "TRCompanionAuthOperation response received", v12, 2u);
      }
    }
    [WeakRetained _handleResponse:v6 proxiedDevice:*(void *)(a1 + 32)];
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      uint64_t v11 = TRLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_2149BE000, v11, OS_LOG_TYPE_DEFAULT, "TRCompanionAuthOperation no response from send request", v13, 2u);
      }
    }
    [WeakRetained finishWithError:v5];
  }
}

- (void)_handleResponse:(id)a3 proxiedDevice:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if (_TRLogEnabled == 1)
  {
    id v8 = TRLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[TRCompanionAuthOperation _handleResponse:proxiedDevice:]";
      __int16 v53 = 2112;
      v54 = v6;
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "%s Handle Companion Authentication Response: %@", buf, 0x16u);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-10000 userInfo:0];
    [(TROperation *)self finishWithError:v9];
    goto LABEL_37;
  }
  __int16 v9 = v6;
  v49 = @"TRCompanionAuthOperationUnauthenticatedServicesKey";
  id v10 = [(__CFString *)v9 unauthenticatedAccountServices];
  v50 = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  v12 = (void *)[v11 mutableCopy];

  v13 = [(__CFString *)v9 error];

  if (v13)
  {
    if (_TRLogEnabled == 1)
    {
      v14 = TRLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2149BE000, v14, OS_LOG_TYPE_DEFAULT, "Error in response", buf, 2u);
      }

      if (_TRLogEnabled == 1)
      {
        v15 = TRLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if (self->_isForHomePod) {
            v16 = @"YES";
          }
          else {
            v16 = @"NO";
          }
          *(_DWORD *)buf = 138412290;
          v52 = (const char *)v16;
          _os_log_impl(&dword_2149BE000, v15, OS_LOG_TYPE_DEFAULT, "_isForHomePod %@", buf, 0xCu);
        }
      }
    }
    v17 = [(__CFString *)v9 error];
    [v12 setObject:v17 forKeyedSubscript:@"TRCompanionAuthOperationErrorKey"];

    if (self->_isForHomePod)
    {
      uint64_t v18 = [(__CFString *)v9 error];
      if (v18)
      {
        v19 = (void *)v18;
        v20 = [(__CFString *)v9 error];
        char v21 = objc_msgSend(v20, "ak_isEligibleForProxiedAuthFallback");

        if ((v21 & 1) == 0)
        {
          if (_TRLogEnabled == 1)
          {
            v41 = TRLogHandle();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              v42 = [(__CFString *)v9 error];
              v43 = [(__CFString *)v9 error];
              int v44 = objc_msgSend(v43, "ak_isEligibleForProxiedAuthFallback");
              v45 = @"NO";
              if (v44) {
                v45 = @"YES";
              }
              *(_DWORD *)buf = 138412546;
              v52 = v42;
              __int16 v53 = 2112;
              v54 = v45;
              _os_log_impl(&dword_2149BE000, v41, OS_LOG_TYPE_DEFAULT, "Error cannot fall back, finishing with error %@ | canFallBack %@", buf, 0x16u);
            }
          }
          __int16 v30 = [(__CFString *)v9 error];
          [(TROperation *)self finishWithError:v30];
          goto LABEL_35;
        }
      }
    }
    if (_TRLogEnabled == 1)
    {
      v22 = TRLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [(__CFString *)v9 error];
        id v24 = [(__CFString *)v9 error];
        int v25 = objc_msgSend(v24, "ak_isEligibleForProxiedAuthFallback");
        v26 = @"NO";
        if (v25) {
          v26 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v52 = v23;
        __int16 v53 = 2112;
        v54 = v26;
        _os_log_impl(&dword_2149BE000, v22, OS_LOG_TYPE_DEFAULT, "Error fall back to proxy, error %@ | canFallBack %@", buf, 0x16u);
      }
    }
  }
  v27 = [(__CFString *)v9 authenticationResults];
  v28 = v27;
  if (!v27
    || !self->_presentingViewController
    || self->_isCLIMode
    || !self->_canDoTermsAndConditions
    || !self->_isForHomePod)
  {

LABEL_30:
    if (_TRLogEnabled == 1)
    {
      v29 = TRLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2149BE000, v29, OS_LOG_TYPE_DEFAULT, "Companion Auth Skipping terms", buf, 2u);
      }
    }
    __int16 v30 = (TRAnisetteDataProvider *)[v12 copy];
    [(TROperation *)self finishWithResult:v30];
    goto LABEL_35;
  }
  BOOL v31 = [(NSSet *)self->_targetedServices containsObject:&unk_26C58CD70];

  if (!v31) {
    goto LABEL_30;
  }
  if (_TRLogEnabled == 1)
  {
    __int16 v32 = TRLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v32, OS_LOG_TYPE_DEFAULT, "Showing Terms for Companion Auth", buf, 2u);
    }
  }
  id v33 = [TRAnisetteDataProvider alloc];
  uint64_t v34 = [(TROperation *)self session];
  __int16 v30 = [(TRAnisetteDataProvider *)v33 initWithSession:v34];

  v35 = [TRTermsAndConditionsManager alloc];
  v36 = [(__CFString *)v9 authenticationResults];
  v37 = [(TRTermsAndConditionsManager *)v35 initWithAuthResultsBlock:v36 presentingViewController:self->_presentingChildViewController];
  termsManager = self->_termsManager;
  self->_termsManager = v37;

  v39 = self->_termsManager;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke;
  v47[3] = &unk_264220CC8;
  v47[4] = self;
  id v48 = v12;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_3;
  v46[3] = &unk_264220858;
  v46[4] = self;
  [(TRTermsAndConditionsManager *)v39 loadProxiedTerms:v7 anisetteDataProvider:v30 appProvidedContext:@"HomePodSetup" acceptAction:v47 declineAction:v46];
  if (_TRLogEnabled == 1)
  {
    v40 = TRLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v52 = "-[TRCompanionAuthOperation _handleResponse:proxiedDevice:]";
      _os_log_impl(&dword_2149BE000, v40, OS_LOG_TYPE_DEFAULT, "%s Terms Done Presenting", buf, 0xCu);
    }
  }
LABEL_35:

LABEL_37:
}

void __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_2;
  v2[3] = &unk_264220880;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 finishWithResult:v2];
}

void __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_4;
  block[3] = &unk_264220858;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"TROperationErrorDomain" code:-12002 userInfo:0];
  [v1 finishWithError:v2];
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

- (BOOL)shouldUseAIDA
{
  return self->_shouldUseAIDA;
}

- (void)setShouldUseAIDA:(BOOL)a3
{
  self->_shouldUseAIDA = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
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