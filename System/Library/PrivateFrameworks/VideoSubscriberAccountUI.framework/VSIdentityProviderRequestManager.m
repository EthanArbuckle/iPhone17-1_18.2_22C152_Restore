@interface VSIdentityProviderRequestManager
- (BOOL)_canShowAuthenticationUI;
- (BOOL)_handleAccountMetadataRequest:(id)a3 didCompleteWithResponse:(id)a4;
- (BOOL)_handleAuthenticationRequest:(id)a3 didCompleteWithResponse:(id)a4;
- (BOOL)_handleLogoutRequestDidComplete:(id)a3;
- (BOOL)_handleSTBOptOutDidComplete:(id)a3;
- (BOOL)_handleSilentAuthenticationRequest:(id)a3 didCompleteWithResponse:(id)a4;
- (BOOL)_requestRequiresApplicationController:(id)a3;
- (BOOL)_requestRequiresApplicationControllerIgnoringAuthentication:(id)a3;
- (BOOL)allowsApplicationControllerTimer;
- (BOOL)applicationController:(id)a3 requestsAlert:(id)a4;
- (BOOL)canIssuePrivacyVouchers;
- (BOOL)didCreateAccount;
- (NSMutableArray)requestContexts;
- (NSOperationQueue)privateQueue;
- (OS_dispatch_source)applicationControllerTimerSource;
- (VSApplicationController)applicationController;
- (VSApplicationControllerRequestFactory)requestFactory;
- (VSAuditToken)auditToken;
- (VSDeveloperSettingsFetchOperation)settingsFetchOperation;
- (VSIdentityProvider)identityProvider;
- (VSIdentityProviderRequestManager)init;
- (VSIdentityProviderRequestManager)initWithIdentityProvider:(id)a3;
- (VSIdentityProviderRequestManagerDelegate)delegate;
- (VSOptional)account;
- (VSOptional)currentApplicationControllerRequest;
- (VSOptional)storage;
- (VSPreferences)preferences;
- (VSViewModel)viewModel;
- (double)_requestCompletionDelay;
- (double)applicationControllerTimerDelay;
- (double)applicationControllerTimerLeeway;
- (double)requestCompletionDelayAfterShowingUserInterface;
- (id)_accountChannelsWithChannelIDs:(id)a3;
- (id)_accountMetadataWithAuthenticationScheme:(id)a3 responseStatusCode:(id)a4 responseString:(id)a5 accountMetadataRequest:(id)a6 verificationData:(id)a7;
- (id)_applicationControllerRequestWithIdentityProviderRequest:(id)a3;
- (id)_currentRequest;
- (id)_currentRequestContext;
- (id)_identityProviderAlertWithApplicationControllerAlert:(id)a3;
- (id)_supportedProviderAuthenticationToken;
- (id)developerSettingsFetchOperation;
- (void)_completeAuthenticationRequestWithApplicationControllerResponse:(id)a3;
- (void)_completeCachedAccountMetadataRequest;
- (void)_completeCurrentRequestWithApplicationControllerResponse:(id)a3;
- (void)_completeCurrentRequestWithApplicationControllerResponse:(id)a3 verificationData:(id)a4;
- (void)_completeCurrentRequestWithError:(id)a3;
- (void)_completeCurrentRequestWithResult:(id)a3;
- (void)_completeDeletingAccountWithError:(id)a3;
- (void)_enqueueSubscriptionOperationIfRequiredForResponse:(id)a3 asDependencyOf:(id)a4;
- (void)_enqueueUserAccountUpdateOperationIfRequiredForResponse:(id)a3 asDependencyOf:(id)a4;
- (void)_handleApplicationControllerError:(id)a3 forRequest:(id)a4;
- (void)_handleApplicationControllerRequest:(id)a3 didCompleteWithResponse:(id)a4;
- (void)_notifyDidAuthenticateAccount:(id)a3;
- (void)_processRequestContext:(id)a3;
- (void)_resetVerificationStateWithCompletionHandler:(id)a3;
- (void)_showAuthenticationUI;
- (void)_startApplicationControllerTimer;
- (void)_startDeletingAccount;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopApplicationController;
- (void)_stopApplicationControllerTimer;
- (void)_stopObservingViewModel:(id)a3;
- (void)_submitApplicationControllerRequest:(id)a3;
- (void)_updateAccountWithAccountAuthentication:(id)a3;
- (void)applicationController:(id)a3 didReceiveViewModel:(id)a4;
- (void)applicationController:(id)a3 didReceiveViewModelError:(id)a4;
- (void)applicationController:(id)a3 didUpdateLogoViewModel:(id)a4;
- (void)applicationController:(id)a3 request:(id)a4 didCompleteWithResponse:(id)a5;
- (void)applicationController:(id)a3 request:(id)a4 didFailWithError:(id)a5;
- (void)applicationController:(id)a3 startDidFailWithError:(id)a4;
- (void)applicationControllerDidStart:(id)a3;
- (void)dealloc;
- (void)enqueueRequest:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendErrorMessage:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAllowsApplicationControllerTimer:(BOOL)a3;
- (void)setApplicationController:(id)a3;
- (void)setApplicationControllerTimerDelay:(double)a3;
- (void)setApplicationControllerTimerLeeway:(double)a3;
- (void)setApplicationControllerTimerSource:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setCanIssuePrivacyVouchers:(BOOL)a3;
- (void)setCurrentApplicationControllerRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidCreateAccount:(BOOL)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRequestCompletionDelayAfterShowingUserInterface:(double)a3;
- (void)setRequestContexts:(id)a3;
- (void)setRequestFactory:(id)a3;
- (void)setSettingsFetchOperation:(id)a3;
- (void)setStorage:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation VSIdentityProviderRequestManager

- (VSIdentityProviderRequestManager)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSIdentityProviderRequestManager)initWithIdentityProvider:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The identityProvider parameter must not be nil."];
  }
  v22.receiver = self;
  v22.super_class = (Class)VSIdentityProviderRequestManager;
  v6 = [(VSIdentityProviderRequestManager *)&v22 init];
  if (v6)
  {
    v7 = objc_alloc_init(VSApplicationControllerRequestFactory);
    v8 = (void *)*((void *)v6 + 12);
    *((void *)v6 + 12) = v7;

    id v9 = objc_alloc_init(MEMORY[0x263F1E260]);
    v10 = (void *)*((void *)v6 + 13);
    *((void *)v6 + 13) = v9;

    objc_storeStrong((id *)v6 + 2, a3);
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    v12 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = v11;

    id v13 = objc_alloc_init(MEMORY[0x263F08A48]);
    v14 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v13;

    [*((id *)v6 + 6) setName:@"VSIdentityProviderRequestManager"];
    v6[10] = 1;
    *((void *)v6 + 17) = 0x404E000000000000;
    *(_OWORD *)(v6 + 120) = xmmword_23FA0F570;
    id v15 = objc_alloc_init(MEMORY[0x263F1E250]);
    v16 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = v15;

    id v17 = objc_alloc_init(MEMORY[0x263F1E250]);
    v18 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v17;

    id v19 = objc_alloc_init(MEMORY[0x263F1E250]);
    v20 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v19;
  }
  return (VSIdentityProviderRequestManager *)v6;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating request manager %p", buf, 0xCu);
  }

  [(NSOperationQueue *)self->_privateQueue cancelAllOperations];
  uint64_t v4 = self->_viewModel;
  if (v4) {
    [(VSIdentityProviderRequestManager *)self _stopObservingViewModel:v4];
  }
  [(VSIdentityProviderRequestManager *)self _stopApplicationController];

  v5.receiver = self;
  v5.super_class = (Class)VSIdentityProviderRequestManager;
  [(VSIdentityProviderRequestManager *)&v5 dealloc];
}

- (void)enqueueRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Will enque identity provider request in identity provider request manager: %@", (uint8_t *)&v14, 0xCu);
  }

  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The request parameter must not be nil."];
  }
  v6 = objc_alloc_init(VSIdentityProviderRequestContext);
  [(VSIdentityProviderRequestContext *)v6 setRequest:v4];
  v7 = (void *)MEMORY[0x263F1E250];
  uint64_t v8 = [v4 account];
  id v9 = [v7 optionalWithObject:v8];
  [(VSIdentityProviderRequestManager *)self setAccount:v9];

  v10 = (void *)MEMORY[0x263F1E250];
  id v11 = [v4 storage];
  v12 = [v10 optionalWithObject:v11];
  [(VSIdentityProviderRequestManager *)self setStorage:v12];

  id v13 = [(VSIdentityProviderRequestManager *)self requestContexts];
  [v13 addObject:v6];
  if ([v13 count] == 1) {
    [(VSIdentityProviderRequestManager *)self _processRequestContext:v6];
  }
}

- (void)sendErrorMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(VSIdentityProviderRequestManager *)self applicationController];
  [v5 sendErrorMessage:v4];
}

- (void)setApplicationControllerTimerDelay:(double)a3
{
  if (self->_applicationControllerTimerDelay != a3)
  {
    self->_applicationControllerTimerDelay = a3;
    self->_applicationControllerTimerLeeway = a3 * 0.100000001;
  }
}

- (id)developerSettingsFetchOperation
{
  v3 = [(VSIdentityProviderRequestManager *)self settingsFetchOperation];

  if (!v3)
  {
    id v4 = (VSDeveloperSettingsFetchOperation *)objc_alloc_init(MEMORY[0x263F1E1E8]);
    settingsFetchOperation = self->_settingsFetchOperation;
    self->_settingsFetchOperation = v4;
  }
  v6 = [(VSIdentityProviderRequestManager *)self settingsFetchOperation];

  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self settingsFetchOperation] parameter must not be nil."];
  }
  return [(VSIdentityProviderRequestManager *)self settingsFetchOperation];
}

- (void)_processRequestContext:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v35 = a3;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  id v4 = objc_alloc_init(MEMORY[0x263F1E290]);
  id v5 = [(VSIdentityProviderRequestManager *)self developerSettingsFetchOperation];
  objc_initWeak(&location, v5);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke;
  v39[3] = &unk_265077F68;
  v33 = &v42;
  objc_copyWeak(&v42, &location);
  v41 = &v44;
  id v6 = v4;
  id v40 = v6;
  [v5 setCompletionBlock:v39];
  v7 = [(VSIdentityProviderRequestManager *)self privateQueue];
  [v7 addOperation:v5];

  [v6 wait];
  uint64_t v8 = [(VSIdentityProviderRequestManager *)self preferences];
  if ([v8 shouldDisableRequestTimeouts])
  {
  }
  else
  {
    BOOL v9 = *((unsigned char *)v45 + 24) == 0;

    if (v9) {
      goto LABEL_7;
    }
  }
  v10 = VSDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v10, OS_LOG_TYPE_DEFAULT, "Application controller timer will not be started as it is disabled via developer settings or vsa-disable-timeouts preference", buf, 2u);
  }

  -[VSIdentityProviderRequestManager setAllowsApplicationControllerTimer:](self, "setAllowsApplicationControllerTimer:", 0, &v42);
LABEL_7:
  id v11 = objc_msgSend(v35, "request", v33);
  BOOL v12 = [(VSIdentityProviderRequestManager *)self _requestRequiresApplicationController:v11];

  if (v12)
  {
    id v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v13, OS_LOG_TYPE_DEFAULT, "Request requires application controller.", buf, 2u);
    }

    id v14 = objc_alloc_init(MEMORY[0x263F1E290]);
    id v15 = objc_alloc(MEMORY[0x263F1E230]);
    uint64_t v16 = [(VSIdentityProviderRequestManager *)self identityProvider];
    id v17 = (void *)[v15 initWithIdentityProvider:v16];

    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_30;
    v37[3] = &unk_265076A18;
    id v6 = v14;
    id v38 = v6;
    [v17 setCompletionBlock:v37];
    v18 = [(VSIdentityProviderRequestManager *)self privateQueue];
    [v18 addOperation:v17];

    [v6 wait];
    id v19 = [v17 error];
    if (v19)
    {
      v20 = VSErrorLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[VSIdentityProviderRequestManager _processRequestContext:]((uint64_t)v19, v20);
      }
    }
    v21 = [(VSIdentityProviderRequestManager *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(VSIdentityProviderRequestManager *)self identityProvider],
          objc_super v22 = objc_claimAutoreleasedReturnValue(),
          [v21 identityProviderRequestManager:self applicationControllerWithIdentityProvider:v22],
          v23 = (VSApplicationController *)objc_claimAutoreleasedReturnValue(),
          v22,
          !v23))
    {
      v24 = [VSApplicationController alloc];
      v25 = [(VSIdentityProviderRequestManager *)self identityProvider];
      v23 = [(VSApplicationController *)v24 initWithIdentityProvider:v25];

      v26 = [v17 results];
      if (v26)
      {
        v27 = VSDefaultLogObject();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v26;
          _os_log_impl(&dword_23F9AB000, v27, OS_LOG_TYPE_DEFAULT, "Providing user accounts to auth context: %@", buf, 0xCu);
        }

        [(VSApplicationController *)v23 setUserAccounts:v26];
      }
      v28 = [(VSIdentityProviderRequestManager *)self auditToken];
      [(VSApplicationController *)v23 setAuditToken:v28];

      v29 = [v35 request];
      v30 = [v29 accountProviderAuthenticationToken];
      [(VSApplicationController *)v23 setAccountProviderAuthenticationToken:v30];

      if (!v23)
      {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The applicationControllerOrNil parameter must not be nil."];
        v23 = 0;
      }
    }
    v31 = v23;
    [(VSIdentityProviderRequestManager *)self setApplicationController:v31];
    [(VSApplicationController *)v31 setDelegate:self];
    [(VSIdentityProviderRequestManager *)self _startApplicationControllerTimer];
    [(VSApplicationController *)v31 start];
  }
  else
  {
    v32 = VSDefaultLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v32, OS_LOG_TYPE_DEFAULT, "Request does not require application controller.", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    objc_copyWeak(&v36, (id *)buf);
    VSPerformBlockOnMainThread();
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v44, 8);
}

void __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained result];
  id v4 = [v3 forceUnwrapObject];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_2;
  v5[3] = &unk_265077398;
  v5[4] = *(void *)(a1 + 40);
  [v4 unwrapObject:v5 error:&__block_literal_global_24];
  [*(id *)(a1 + 32) signal];
}

uint64_t __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 requestTimeoutsDisabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_3_cold_1((uint64_t)v2, v3);
  }
}

uint64_t __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_30(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_37(uint64_t a1)
{
  VSRequireMainThread();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeCachedAccountMetadataRequest];
}

- (id)_currentRequestContext
{
  id v2 = (void *)MEMORY[0x263F1E250];
  v3 = [(VSIdentityProviderRequestManager *)self requestContexts];
  id v4 = [v3 firstObject];
  id v5 = [v2 optionalWithObject:v4];

  return v5;
}

- (id)_currentRequest
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = objc_alloc_init(MEMORY[0x263F1E250]);
  v3 = [(VSIdentityProviderRequestManager *)self _currentRequestContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__VSIdentityProviderRequestManager__currentRequest__block_invoke;
  v6[3] = &unk_265077F90;
  v6[4] = &v7;
  [v3 conditionallyUnwrapObject:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__VSIdentityProviderRequestManager__currentRequest__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F1E250];
  id v7 = [a2 request];
  uint64_t v4 = [v3 optionalWithObject:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_startApplicationControllerTimer
{
  if ([(VSIdentityProviderRequestManager *)self allowsApplicationControllerTimer])
  {
    [(VSIdentityProviderRequestManager *)self _stopApplicationControllerTimer];
    v3 = MEMORY[0x263EF83A0];
    id v4 = MEMORY[0x263EF83A0];
    uint64_t v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);
    [(VSIdentityProviderRequestManager *)self setApplicationControllerTimerSource:v5];
    [(VSIdentityProviderRequestManager *)self applicationControllerTimerDelay];
    int64_t v7 = (unint64_t)(v6 * 1000000000.0);
    [(VSIdentityProviderRequestManager *)self applicationControllerTimerLeeway];
    uint64_t v9 = (unint64_t)(v8 * 1000000000.0);
    dispatch_time_t v10 = dispatch_time(0, v7);
    dispatch_source_set_timer(v5, v10, 0xFFFFFFFFFFFFFFFFLL, v9);
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke;
    handler[3] = &unk_2650774D0;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v5, handler);
    id v11 = VSDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "Will start application timer.", v12, 2u);
    }

    dispatch_resume(v5);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke(uint64_t a1)
{
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v2, OS_LOG_TYPE_DEFAULT, "Application timer fired.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = VSPrivateError();
    uint64_t v5 = VSPublicError();
    double v6 = [WeakRetained currentApplicationControllerRequest];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke_39;
    v10[3] = &unk_265077FB8;
    v10[4] = WeakRetained;
    id v11 = v5;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke_2;
    v8[3] = &unk_265076FD0;
    v8[4] = WeakRetained;
    id v9 = v11;
    id v7 = v11;
    [v6 conditionallyUnwrapObject:v10 otherwise:v8];
  }
}

uint64_t __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke_39(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleApplicationControllerError:*(void *)(a1 + 40) forRequest:a2];
}

uint64_t __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeCurrentRequestWithError:*(void *)(a1 + 40)];
}

- (void)_stopApplicationControllerTimer
{
  v3 = [(VSIdentityProviderRequestManager *)self applicationControllerTimerSource];

  if (v3)
  {
    id v4 = VSDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Stopping application timer.", v6, 2u);
    }

    uint64_t v5 = [(VSIdentityProviderRequestManager *)self applicationControllerTimerSource];
    dispatch_source_cancel(v5);

    [(VSIdentityProviderRequestManager *)self setApplicationControllerTimerSource:0];
  }
}

- (void)_handleApplicationControllerRequest:(id)a3 didCompleteWithResponse:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[VSIdentityProviderRequestManager _handleApplicationControllerRequest:didCompleteWithResponse:]";
    __int16 v12 = 2048;
    uint64_t v13 = [v6 type];
    _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "%s: request type %ld", (uint8_t *)&v10, 0x16u);
  }

  VSRequireMainThread();
  switch([v6 type])
  {
    case 1:
      if (![(VSIdentityProviderRequestManager *)self _handleAuthenticationRequest:v6 didCompleteWithResponse:v7])goto LABEL_9; {
      break;
      }
    case 2:
      if (![(VSIdentityProviderRequestManager *)self _handleSilentAuthenticationRequest:v6 didCompleteWithResponse:v7])goto LABEL_9; {
      break;
      }
    case 3:
      if (![(VSIdentityProviderRequestManager *)self _handleAccountMetadataRequest:v6 didCompleteWithResponse:v7])goto LABEL_9; {
      break;
      }
    case 4:
      if (![(VSIdentityProviderRequestManager *)self _handleLogoutRequestDidComplete:v6])goto LABEL_9; {
      break;
      }
    case 5:
      if (![(VSIdentityProviderRequestManager *)self _handleSTBOptOutDidComplete:v6]) {
        goto LABEL_9;
      }
      break;
    default:
LABEL_9:
      id v9 = VSPublicError();
      [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithError:v9];

      break;
  }
}

- (BOOL)_handleAuthenticationRequest:(id)a3 didCompleteWithResponse:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a4;
  VSRequireMainThread();
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315138;
    v26 = "-[VSIdentityProviderRequestManager _handleAuthenticationRequest:didCompleteWithResponse:]";
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v25, 0xCu);
  }

  id v7 = [v5 responseString];
  if (![v7 length])
  {
    uint64_t v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_23F9AB000, v13, OS_LOG_TYPE_DEFAULT, "No response string.", (uint8_t *)&v25, 2u);
    }
    goto LABEL_17;
  }
  double v8 = [v5 expectedAction];
  uint64_t v9 = [v8 integerValue];

  if (v9 != 1)
  {
    uint64_t v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [NSNumber numberWithInteger:v9];
      int v25 = 138412290;
      v26 = v19;
      _os_log_impl(&dword_23F9AB000, v13, OS_LOG_TYPE_DEFAULT, "Response action was %@.", (uint8_t *)&v25, 0xCu);
    }
LABEL_17:
    BOOL v18 = 0;
    goto LABEL_18;
  }
  int v10 = [(VSIdentityProviderRequestManager *)self account];
  id v11 = [v10 forceUnwrapObject];
  [(VSIdentityProviderRequestManager *)self _notifyDidAuthenticateAccount:v11];

  [(VSIdentityProviderRequestManager *)self setViewModel:0];
  __int16 v12 = [(VSIdentityProviderRequestManager *)self _currentRequest];
  uint64_t v13 = [v12 forceUnwrapObject];

  uint64_t v14 = [v13 type];
  id v15 = VSDefaultLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [NSNumber numberWithInteger:v14];
    int v25 = 138412290;
    v26 = v16;
    _os_log_impl(&dword_23F9AB000, v15, OS_LOG_TYPE_DEFAULT, "Request type: %@", (uint8_t *)&v25, 0xCu);
  }
  if (v14 == 4 || v14 == 1)
  {
    id v17 = VSDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_23F9AB000, v17, OS_LOG_TYPE_DEFAULT, "Make account or edit or silent-make account request type.", (uint8_t *)&v25, 2u);
    }

    [(VSIdentityProviderRequestManager *)self _completeAuthenticationRequestWithApplicationControllerResponse:v5];
  }
  else
  {
    BOOL v21 = [(VSIdentityProviderRequestManager *)self _requestRequiresApplicationControllerIgnoringAuthentication:v13];
    objc_super v22 = VSDefaultLogObject();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_23F9AB000, v22, OS_LOG_TYPE_DEFAULT, "Request requires application controller", (uint8_t *)&v25, 2u);
      }

      v24 = [(VSIdentityProviderRequestManager *)self _applicationControllerRequestWithIdentityProviderRequest:v13];
      [(VSIdentityProviderRequestManager *)self _submitApplicationControllerRequest:v24];
    }
    else
    {
      if (v23)
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_23F9AB000, v22, OS_LOG_TYPE_DEFAULT, "Request does not require application controller", (uint8_t *)&v25, 2u);
      }

      [(VSIdentityProviderRequestManager *)self _completeCachedAccountMetadataRequest];
    }
  }
  BOOL v18 = 1;
LABEL_18:

  return v18;
}

- (BOOL)_handleSilentAuthenticationRequest:(id)a3 didCompleteWithResponse:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a4;
  VSRequireMainThread();
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315138;
    v28 = "-[VSIdentityProviderRequestManager _handleSilentAuthenticationRequest:didCompleteWithResponse:]";
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v27, 0xCu);
  }

  id v7 = [(VSIdentityProviderRequestManager *)self _currentRequest];
  double v8 = [v7 forceUnwrapObject];

  uint64_t v9 = VSDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 type];
    int v27 = 136315650;
    v28 = "-[VSIdentityProviderRequestManager _handleSilentAuthenticationRequest:didCompleteWithResponse:]";
    __int16 v29 = 2112;
    v30 = v8;
    __int16 v31 = 2048;
    uint64_t v32 = v10;
    _os_log_impl(&dword_23F9AB000, v9, OS_LOG_TYPE_DEFAULT, "%s: currentRequest %@, currentRequest type %ld", (uint8_t *)&v27, 0x20u);
  }

  id v11 = [v5 responseString];
  if (v11)
  {
    __int16 v12 = [v5 expectedAction];
    uint64_t v13 = [v12 integerValue];

    uint64_t v14 = VSDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [NSNumber numberWithInteger:v13];
      int v27 = 138412290;
      v28 = v15;
      _os_log_impl(&dword_23F9AB000, v14, OS_LOG_TYPE_DEFAULT, "Response action was %@.", (uint8_t *)&v27, 0xCu);
    }
    if (v13 == 1)
    {
      uint64_t v16 = VSDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_23F9AB000, v16, OS_LOG_TYPE_DEFAULT, "Response action is proceed.", (uint8_t *)&v27, 2u);
      }

      if ([v8 type] == 4)
      {
        id v17 = VSDefaultLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_23F9AB000, v17, OS_LOG_TYPE_DEFAULT, "silent-make account request type.", (uint8_t *)&v27, 2u);
        }

        [(VSIdentityProviderRequestManager *)self _completeAuthenticationRequestWithApplicationControllerResponse:v5];
      }
      else if ([(VSIdentityProviderRequestManager *)self _requestRequiresApplicationControllerIgnoringAuthentication:v8])
      {
        objc_super v22 = [(VSIdentityProviderRequestManager *)self _applicationControllerRequestWithIdentityProviderRequest:v8];
        [(VSIdentityProviderRequestManager *)self _submitApplicationControllerRequest:v22];
      }
      else
      {
        [(VSIdentityProviderRequestManager *)self _completeCachedAccountMetadataRequest];
      }
    }
    else
    {
      BOOL v19 = [(VSIdentityProviderRequestManager *)self _canShowAuthenticationUI];
      v20 = VSDefaultLogObject();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_23F9AB000, v20, OS_LOG_TYPE_DEFAULT, "Can show authentication UI.", (uint8_t *)&v27, 2u);
        }

        [(VSIdentityProviderRequestManager *)self _showAuthenticationUI];
      }
      else
      {
        if (v21)
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_23F9AB000, v20, OS_LOG_TYPE_DEFAULT, "Silent auth failed and we can't show UI.", (uint8_t *)&v27, 2u);
        }

        BOOL v23 = [v5 authenticationScheme];
        v24 = [v5 responseStatusCode];
        int v25 = VSPublicProviderRejectedError();

        [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithError:v25];
      }
    }
  }
  else
  {
    BOOL v18 = VSDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_23F9AB000, v18, OS_LOG_TYPE_DEFAULT, "No response string for silent authentication request.", (uint8_t *)&v27, 2u);
    }
  }
  return v11 != 0;
}

- (BOOL)_handleLogoutRequestDidComplete:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  VSRequireMainThread();
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[VSIdentityProviderRequestManager _handleLogoutRequestDidComplete:]";
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  [(VSIdentityProviderRequestManager *)self _completeDeletingAccountWithError:0];
  return 1;
}

- (BOOL)_handleSTBOptOutDidComplete:(id)a3
{
  return 1;
}

- (BOOL)_handleAccountMetadataRequest:(id)a3 didCompleteWithResponse:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  VSRequireMainThread();
  int v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    BOOL v21 = "-[VSIdentityProviderRequestManager _handleAccountMetadataRequest:didCompleteWithResponse:]";
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v20, 0xCu);
  }

  id v7 = [v5 responseString];
  if (v7)
  {
    uint64_t v8 = [v5 expectedAction];
    uint64_t v9 = [v8 integerValue];

    uint64_t v10 = VSDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [NSNumber numberWithInteger:v9];
      int v20 = 138412290;
      BOOL v21 = v11;
      _os_log_impl(&dword_23F9AB000, v10, OS_LOG_TYPE_DEFAULT, "Expected action is %@", (uint8_t *)&v20, 0xCu);
    }
    if (v9 != 2)
    {
      if (v9 == 1)
      {
        __int16 v12 = VSDefaultLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_23F9AB000, v12, OS_LOG_TYPE_DEFAULT, "Expected to proceed.", (uint8_t *)&v20, 2u);
        }

        [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithApplicationControllerResponse:v5];
        goto LABEL_21;
      }
      goto LABEL_18;
    }
    if (![(VSIdentityProviderRequestManager *)self _canShowAuthenticationUI])
    {
LABEL_18:
      id v15 = [v5 authenticationScheme];
      uint64_t v16 = [v5 responseStatusCode];
      VSPublicProviderRejectedError();
      id v17 = (char *)objc_claimAutoreleasedReturnValue();

      BOOL v18 = VSDefaultLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        BOOL v21 = v17;
        _os_log_impl(&dword_23F9AB000, v18, OS_LOG_TYPE_DEFAULT, "Metadata request rejected: %@", (uint8_t *)&v20, 0xCu);
      }

      [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithError:v17];
      goto LABEL_21;
    }
    uint64_t v14 = VSDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_23F9AB000, v14, OS_LOG_TYPE_DEFAULT, "Expects to request UI and we can show UI.", (uint8_t *)&v20, 2u);
    }

    [(VSIdentityProviderRequestManager *)self _showAuthenticationUI];
  }
  else
  {
    uint64_t v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_23F9AB000, v13, OS_LOG_TYPE_DEFAULT, "No repsonse string.", (uint8_t *)&v20, 2u);
    }
  }
LABEL_21:

  return v7 != 0;
}

- (void)_handleApplicationControllerError:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  VSRequireMainThread();
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke;
  v17[3] = &unk_265077FE0;
  objc_copyWeak(&v20, &location);
  id v8 = v7;
  id v18 = v8;
  BOOL v19 = self;
  uint64_t v9 = (void (**)(void, void))MEMORY[0x2455D84D0](v17);
  uint64_t v10 = [(VSIdentityProviderRequestManager *)self _currentRequestContext];
  id v11 = [v10 forceUnwrapObject];

  if (VSErrorIsPrivateError())
  {
    if ([v11 attemptedVerificationStateReset])
    {
      __int16 v12 = VSPublicServiceTemporarilyUnavailableError();
      ((void (**)(void, void *))v9)[2](v9, v12);
    }
    else
    {
      [v11 setAttemptedVerificationStateReset:1];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_5;
      v13[3] = &unk_265078058;
      objc_copyWeak(&v16, &location);
      id v14 = v8;
      id v15 = v9;
      [(VSIdentityProviderRequestManager *)self _resetVerificationStateWithCompletionHandler:v13];

      objc_destroyWeak(&v16);
    }
  }
  else
  {
    ((void (**)(void, id))v9)[2](v9, v6);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v5 = [a1[4] type];
    switch(v5)
    {
      case 1:
        id v6 = [a1[5] _currentRequest];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_2;
        v18[3] = &unk_2650779E0;
        v18[4] = a1[5];
        id v19 = v3;
        [v6 conditionallyUnwrapObject:v18];

        id v7 = [WeakRetained viewModel];
        uint64_t v13 = MEMORY[0x263EF8330];
        uint64_t v14 = 3221225472;
        id v15 = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_3;
        id v16 = &unk_265076A18;
        id v17 = v7;
        id v8 = v7;
        uint64_t v9 = VSPrivateAccountValidationErrorWithRecoveryHandler();
        [v8 setError:v9];
        [v8 setValidationState:4];

        goto LABEL_9;
      case 3:
        uint64_t v10 = [a1[5] _currentRequest];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_4;
        v11[3] = &unk_2650779E0;
        v11[4] = a1[5];
        id v12 = v3;
        [v10 conditionallyUnwrapObject:v11];

        break;
      case 4:
        [WeakRetained _handleLogoutRequestDidComplete:a1[4]];
        goto LABEL_9;
    }
    [WeakRetained _completeCurrentRequestWithError:v3];
  }
LABEL_9:
}

void __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) identityProvider];
  char v4 = [v3 isDeveloper];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) identityProvider];
    id v6 = [v5 uniqueID];
    id v7 = [v6 forceUnwrapObject];

    id v8 = [*(id *)(a1 + 32) identityProvider];
    uint64_t v9 = [v8 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];

    uint64_t v10 = [v11 requestingAppAdamID];
    [MEMORY[0x263F1E240] recordSignInEventWithProviderIdentifier:v7 supportedProvider:v9 channelAdamID:v10 signInType:*MEMORY[0x263F1E460] error:*(void *)(a1 + 40)];
  }
}

uint64_t __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setError:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 setValidationState:0];
}

void __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_4(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) identityProvider];
  char v4 = [v3 isDeveloper];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) identityProvider];
    id v6 = [v5 uniqueID];
    id v7 = [v6 forceUnwrapObject];

    id v8 = [v11 requestingAppAdamID];

    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [identityProviderRequest requestingAppAdamID] parameter must not be nil."];
    }
    uint64_t v9 = [v11 requestingAppAdamID];
    uint64_t v10 = [*(id *)(a1 + 32) _requestRequiresApplicationController:v11];
    [MEMORY[0x263F1E240] recordMetadataRequestWithProviderIdentifier:v7 channelAdamID:v9 fulfilledByProvider:v10 error:*(void *)(a1 + 40)];
  }
}

void __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_6;
    v8[3] = &unk_265078008;
    v8[4] = WeakRetained;
    id v9 = a1[4];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_7;
    v6[3] = &unk_265078030;
    id v7 = a1[5];
    [v3 unwrapObject:v8 error:v6];
  }
}

uint64_t __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitApplicationControllerRequest:*(void *)(a1 + 40)];
}

void __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_7(uint64_t a1)
{
  VSPublicServiceTemporarilyUnavailableError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_startDeletingAccount
{
  v22[1] = *MEMORY[0x263EF8340];
  VSRequireMainThread();
  id v3 = [(VSIdentityProviderRequestManager *)self account];
  char v4 = [v3 forceUnwrapObject];

  uint64_t v5 = [(VSIdentityProviderRequestManager *)self storage];
  id v6 = [v5 forceUnwrapObject];
  id v7 = [v6 accountStore];

  id v8 = [v4 authenticationToken];
  id v9 = [v8 forceUnwrapObject];

  uint64_t v10 = [(VSIdentityProviderRequestManager *)self requestFactory];
  id v11 = [v10 logoutApplicationControllerRequestWithAuthenticationToken:v9];

  id v12 = [(VSIdentityProviderRequestManager *)self identityProvider];
  char v13 = [v12 isDeveloper];

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = [v4 identityProviderID];
    id v15 = [v14 forceUnwrapObject];

    [MEMORY[0x263F1E240] recordSignOutEventWithProviderIdentifier:v15];
  }
  objc_initWeak(&location, self);
  v22[0] = v4;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__VSIdentityProviderRequestManager__startDeletingAccount__block_invoke;
  v18[3] = &unk_2650780A8;
  objc_copyWeak(&v20, &location);
  id v17 = v11;
  id v19 = v17;
  [v7 removeAccounts:v16 withCompletionHandler:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __57__VSIdentityProviderRequestManager__startDeletingAccount__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  char v9 = a2;
  id v6 = *(id *)(a1 + 32);
  id v7 = v5;
  VSPerformBlockOnMainThread();

  objc_destroyWeak(&v8);
}

void __57__VSIdentityProviderRequestManager__startDeletingAccount__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v3 = objc_alloc_init(MEMORY[0x263F1E250]);
      [WeakRetained setAccount:v3];

      char v4 = [WeakRetained storage];
      id v5 = [v4 forceUnwrapObject];

      id v6 = [v5 channelsCenter];
      [v6 _removeSavedAccountChannelsWithCompletionHandler:0];

      id v7 = [v5 privacyFacade];
      [v7 reset];

      [WeakRetained _submitApplicationControllerRequest:*(void *)(a1 + 32)];
    }
    else
    {
      id v8 = *(void **)(a1 + 40);
      if (!v8)
      {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The underlyingErrorOrNil parameter must not be nil."];
        id v8 = *(void **)(a1 + 40);
      }
      id v9 = v8;
      id v12 = [WeakRetained viewModel];
      id v10 = v12;
      id v11 = VSPrivateAccountDeletionErrorWithRecoveryHandler();
      [WeakRetained _completeDeletingAccountWithError:v11];
    }
  }
}

uint64_t __57__VSIdentityProviderRequestManager__startDeletingAccount__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setError:0];
}

- (void)_completeDeletingAccountWithError:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  if (v4) {
    [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithError:v4];
  }
  else {
    [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithApplicationControllerResponse:0];
  }
}

- (void)_updateAccountWithAccountAuthentication:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  VSRequireMainThread();
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The accountAuthentication parameter must not be nil."];
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__6;
  id v20 = __Block_byref_object_dispose__6;
  id v21 = [(VSIdentityProviderRequestManager *)self account];
  id v5 = (void *)v17[5];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__VSIdentityProviderRequestManager__updateAccountWithAccountAuthentication___block_invoke_2;
  v15[3] = &unk_265077F40;
  v15[4] = self;
  v15[5] = &v16;
  [v5 conditionallyUnwrapObject:&__block_literal_global_62 otherwise:v15];
  id v6 = [(id)v17[5] forceUnwrapObject];
  id v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    BOOL v23 = v6;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_23F9AB000, v7, OS_LOG_TYPE_DEFAULT, "Will update account %@ with authentication %@.", buf, 0x16u);
  }

  id v8 = [(VSIdentityProviderRequestManager *)self identityProvider];
  id v9 = [v8 providerID];
  [v6 setIdentityProviderID:v9];

  id v10 = [(VSIdentityProviderRequestManager *)self identityProvider];
  id v11 = [v10 displayName];
  [v6 setOptionalIdentityProviderDisplayName:v11];

  id v12 = [v4 username];
  if ([v12 length]) {
    [v6 setUsername:v12];
  }
  char v13 = [v4 appBundleIdentifier];
  [v6 setPreferredAppID:v13];

  objc_msgSend(v6, "setSynchronizable:", objc_msgSend(v4, "isSynchronizable"));
  uint64_t v14 = [v4 authenticationToken];
  [v6 setAuthenticationToken:v14];

  _Block_object_dispose(&v16, 8);
}

void __76__VSIdentityProviderRequestManager__updateAccountWithAccountAuthentication___block_invoke_2(uint64_t a1)
{
  id v5 = objc_alloc_init(MEMORY[0x263F1E170]);
  uint64_t v2 = [MEMORY[0x263F1E250] optionalWithObject:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) setAccount:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(a1 + 32) setDidCreateAccount:1];
}

- (void)_completeCachedAccountMetadataRequest
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  VSRequireMainThread();
  uint64_t v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[VSIdentityProviderRequestManager _completeCachedAccountMetadataRequest]";
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v4, 0xCu);
  }

  [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithApplicationControllerResponse:0];
}

- (void)_completeAuthenticationRequestWithApplicationControllerResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  VSRequireMainThread();
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[VSIdentityProviderRequestManager _completeAuthenticationRequestWithApplicationControllerResponse:]";
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  [(VSIdentityProviderRequestManager *)self _requestCompletionDelay];
  if (v6 <= 0.0)
  {
    [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithApplicationControllerResponse:v4];
  }
  else
  {
    double v7 = v6;
    id v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [NSNumber numberWithDouble:v7];
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Delaying completion of request by %@ seconds", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __100__VSIdentityProviderRequestManager__completeAuthenticationRequestWithApplicationControllerResponse___block_invoke;
    v11[3] = &unk_265076DA0;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v4;
    dispatch_after(v10, MEMORY[0x263EF83A0], v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __100__VSIdentityProviderRequestManager__completeAuthenticationRequestWithApplicationControllerResponse___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _completeCurrentRequestWithApplicationControllerResponse:*(void *)(a1 + 32)];
}

- (void)_completeCurrentRequestWithApplicationControllerResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  VSRequireMainThread();
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[VSIdentityProviderRequestManager _completeCurrentRequestWithApplicationControllerResponse:]";
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x263F1E2E0]);
  double v7 = (void *)[objc_alloc(MEMORY[0x263F1E2C0]) initWithOperation:v6 timeout:10.0];
  id v12 = v6;
  id v13 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_time_t v10 = VSMainThreadOperationWithBlock();
  [v10 addDependency:v7];
  VSEnqueueCompletionOperation();
  id v11 = [(VSIdentityProviderRequestManager *)self privateQueue];
  [v11 addOperation:v7];
}

void __93__VSIdentityProviderRequestManager__completeCurrentRequestWithApplicationControllerResponse___block_invoke(uint64_t a1)
{
  VSRequireMainThread();
  uint64_t v2 = [*(id *)(a1 + 32) result];
  uint64_t v3 = [v2 object];
  id v4 = [v3 object];

  [*(id *)(a1 + 40) _completeCurrentRequestWithApplicationControllerResponse:*(void *)(a1 + 48) verificationData:v4];
}

- (void)_completeCurrentRequestWithApplicationControllerResponse:(id)a3 verificationData:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v34 = a4;
  VSRequireMainThread();
  double v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v42 = "-[VSIdentityProviderRequestManager _completeCurrentRequestWithApplicationControllerResponse:verificationData:]";
    _os_log_impl(&dword_23F9AB000, v7, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v8 = [(VSIdentityProviderRequestManager *)self _currentRequest];
  id v9 = [v8 forceUnwrapObject];

  dispatch_time_t v10 = objc_alloc_init(VSIdentityProviderResponse);
  id v11 = [(VSIdentityProviderRequestManager *)self account];
  uint64_t v36 = MEMORY[0x263EF8330];
  uint64_t v37 = 3221225472;
  id v38 = __110__VSIdentityProviderRequestManager__completeCurrentRequestWithApplicationControllerResponse_verificationData___block_invoke;
  v39 = &unk_265076F80;
  id v12 = v10;
  id v40 = v12;
  [v11 conditionallyUnwrapObject:&v36];

  uint64_t v13 = [v9 type];
  if (v13 == 3)
  {
    uint64_t v14 = [v9 accountMetadataRequest];
    id v15 = [v14 forceUnwrapObject];

    uint64_t v16 = [v6 authenticationScheme];
    id v17 = [v6 responseStatusCode];
    uint64_t v18 = [v6 responseString];
    id v19 = [(VSIdentityProviderRequestManager *)self _accountMetadataWithAuthenticationScheme:v16 responseStatusCode:v17 responseString:v18 accountMetadataRequest:v15 verificationData:v34];

    [(VSIdentityProviderResponse *)v12 setAccountMetadata:v19];
  }
  [(VSIdentityProviderResponse *)v12 setDidCreateAccount:[(VSIdentityProviderRequestManager *)self didCreateAccount]];
  id v20 = [(VSIdentityProviderRequestManager *)self identityProvider];
  id v21 = [v20 uniqueID];
  uint64_t v22 = [v21 forceUnwrapObject];

  BOOL v23 = [(VSIdentityProviderRequestManager *)self identityProvider];
  uint64_t v24 = [v23 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];

  id v25 = [v9 requestingAppAdamID];
  if ([(VSIdentityProviderRequestManager *)self didCreateAccount]
    && ([(VSIdentityProviderRequestManager *)self identityProvider],
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        char v27 = [v26 isDeveloper],
        v26,
        (v27 & 1) == 0))
  {
    uint64_t v32 = (void *)MEMORY[0x263F1E460];
    if (v13 != 1) {
      uint64_t v32 = (void *)MEMORY[0x263F1E458];
    }
    [MEMORY[0x263F1E240] recordSignInEventWithProviderIdentifier:v22 supportedProvider:v24 channelAdamID:v25 signInType:*v32 error:0];
  }
  else if ([v9 type] == 3)
  {
    v28 = [(VSIdentityProviderRequestManager *)self identityProvider];
    char v29 = [v28 isDeveloper];

    if ((v29 & 1) == 0)
    {
      BOOL v30 = [(VSIdentityProviderRequestManager *)self _requestRequiresApplicationController:v9];
      __int16 v31 = (void *)MEMORY[0x263F1E240];
      if (!v25) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The channelBundleIdentifier parameter must not be nil."];
      }
      [v31 recordMetadataRequestWithProviderIdentifier:v22 channelAdamID:v25 fulfilledByProvider:v30 error:0];
    }
  }
  uint64_t v33 = [MEMORY[0x263F1E208] failableWithObject:v12];
  [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithResult:v33];
}

uint64_t __110__VSIdentityProviderRequestManager__completeCurrentRequestWithApplicationControllerResponse_verificationData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAccount:a2];
}

- (void)_completeCurrentRequestWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  VSRequireMainThread();
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[VSIdentityProviderRequestManager _completeCurrentRequestWithError:]";
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [MEMORY[0x263F1E208] failableWithError:v4];

  [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithResult:v6];
}

- (void)_completeCurrentRequestWithResult:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Completing request with result: %@", (uint8_t *)&v15, 0xCu);
  }

  VSRequireMainThread();
  [(VSIdentityProviderRequestManager *)self _stopApplicationController];
  [(VSIdentityProviderRequestManager *)self setDidCreateAccount:0];
  [(VSIdentityProviderRequestManager *)self setViewModel:0];
  id v6 = objc_alloc_init(MEMORY[0x263F1E250]);
  [(VSIdentityProviderRequestManager *)self setAccount:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F1E250]);
  [(VSIdentityProviderRequestManager *)self setStorage:v7];

  id v8 = [(VSIdentityProviderRequestManager *)self _currentRequestContext];
  uint64_t v9 = [v8 forceUnwrapObject];

  dispatch_time_t v10 = [(VSIdentityProviderRequestManager *)self requestContexts];
  [v10 removeObject:v9];
  id v11 = [(VSIdentityProviderRequestManager *)self delegate];
  id v12 = [v9 request];
  [v11 identityProviderRequestManager:self finishedRequest:v12 withResult:v4];

  if ([v10 count])
  {
    uint64_t v13 = [(VSIdentityProviderRequestManager *)self _currentRequestContext];
    uint64_t v14 = [v13 forceUnwrapObject];
    [(VSIdentityProviderRequestManager *)self _processRequestContext:v14];
  }
}

- (id)_applicationControllerRequestWithIdentityProviderRequest:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  uint64_t v5 = [v4 type];
  if (v5 == 2)
  {
    uint64_t v14 = [(VSIdentityProviderRequestManager *)self account];
    int v15 = [v14 forceUnwrapObject];
    id v16 = [v15 authenticationToken];
    id v7 = [v16 forceUnwrapObject];

    id v11 = [(VSIdentityProviderRequestManager *)self requestFactory];
    uint64_t v13 = [v11 logoutApplicationControllerRequestWithAuthenticationToken:v7];
  }
  else
  {
    if (v5 != 3)
    {
      uint64_t v18 = (void *)MEMORY[0x263EFF940];
      uint64_t v17 = *MEMORY[0x263EFF4A0];
      id v19 = [NSNumber numberWithInteger:v5];
      [v18 raise:v17, @"Invalid request tyoe: %@", v19 format];

      goto LABEL_8;
    }
    id v6 = [v4 accountMetadataRequest];
    id v7 = [v6 forceUnwrapObject];

    id v8 = [(VSIdentityProviderRequestManager *)self account];
    uint64_t v9 = [v8 forceUnwrapObject];
    dispatch_time_t v10 = [v9 authenticationToken];
    id v11 = [v10 forceUnwrapObject];

    id v12 = [(VSIdentityProviderRequestManager *)self requestFactory];
    uint64_t v13 = [v12 accountMetadataApplicationControllerRequestWithAccountMetadataRequest:v7 authenticationToken:v11];
  }
  if (v13) {
    goto LABEL_9;
  }
  uint64_t v17 = *MEMORY[0x263EFF4A0];
LABEL_8:
  [MEMORY[0x263EFF940] raise:v17 format:@"The request parameter must not be nil."];
  uint64_t v13 = 0;
LABEL_9:

  return v13;
}

- (id)_identityProviderAlertWithApplicationControllerAlert:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(VSIdentityProviderAlert);
  uint64_t v5 = [v3 title];
  [(VSIdentityProviderAlert *)v4 setTitle:v5];

  id v6 = [v3 message];
  uint64_t v18 = v4;
  [(VSIdentityProviderAlert *)v4 setMessage:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [v3 actions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = objc_alloc_init(VSIdentityProviderAlertAction);
        int v15 = [v13 title];
        [(VSIdentityProviderAlertAction *)v14 setTitle:v15];

        -[VSIdentityProviderAlertAction setStyle:](v14, "setStyle:", [v13 style]);
        id v16 = [v13 callback];
        [(VSIdentityProviderAlertAction *)v14 setCallback:v16];

        [v7 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  [(VSIdentityProviderAlert *)v18 setActions:v7];
  return v18;
}

- (void)_stopApplicationController
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[VSIdentityProviderRequestManager _stopApplicationController]";
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  [(VSIdentityProviderRequestManager *)self _stopApplicationControllerTimer];
  id v4 = objc_alloc_init(MEMORY[0x263F1E250]);
  [(VSIdentityProviderRequestManager *)self setCurrentApplicationControllerRequest:v4];

  uint64_t v5 = [(VSIdentityProviderRequestManager *)self applicationController];
  [v5 setDelegate:0];

  id v6 = [(VSIdentityProviderRequestManager *)self applicationController];
  [v6 stop];

  [(VSIdentityProviderRequestManager *)self setApplicationController:0];
}

- (void)_submitApplicationControllerRequest:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The request parameter must not be nil."];
  }
  uint64_t v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[VSIdentityProviderRequestManager _submitApplicationControllerRequest:]";
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v8, 0xCu);
  }

  [(VSIdentityProviderRequestManager *)self _startApplicationControllerTimer];
  id v6 = [MEMORY[0x263F1E250] optionalWithObject:v4];
  [(VSIdentityProviderRequestManager *)self setCurrentApplicationControllerRequest:v6];

  int v7 = [(VSIdentityProviderRequestManager *)self applicationController];
  [v7 submitRequest:v4];
}

- (void)_showAuthenticationUI
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  VSRequireMainThread();
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[VSIdentityProviderRequestManager _showAuthenticationUI]";
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  [(VSIdentityProviderRequestManager *)self _startApplicationControllerTimer];
  id v4 = [(VSIdentityProviderRequestManager *)self _supportedProviderAuthenticationToken];
  uint64_t v5 = [(VSIdentityProviderRequestManager *)self applicationController];
  [v5 showAuthenticationUserInterfaceWithAuthenticationToken:v4];
}

- (void)setViewModel:(id)a3
{
  int v7 = (VSViewModel *)a3;
  VSRequireMainThread();
  uint64_t v5 = self->_viewModel;
  int v6 = v5;
  if (v5 != v7)
  {
    if (v5) {
      [(VSIdentityProviderRequestManager *)self _stopObservingViewModel:v5];
    }
    objc_storeStrong((id *)&self->_viewModel, a3);
    if (v7) {
      [(VSIdentityProviderRequestManager *)self _startObservingViewModel:v7];
    }
  }
}

- (void)_startObservingViewModel:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  [v4 addObserver:self forKeyPath:@"validationState" options:3 context:kVSKeyValueObservingContext_ViewModelValidationState_0];
}

- (void)_stopObservingViewModel:(id)a3
{
}

- (void)_notifyDidAuthenticateAccount:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  VSRequireMainThread();
  uint64_t v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[VSIdentityProviderRequestManager _notifyDidAuthenticateAccount:]";
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v9, 0xCu);
  }

  int v6 = [(VSIdentityProviderRequestManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v7 = [(VSIdentityProviderRequestManager *)self _currentRequest];
    uint64_t v8 = [v7 forceUnwrapObject];
    [v6 identityProviderRequestManager:self didAuthenticateAccount:v4 forRequest:v8];
  }
}

- (BOOL)_requestRequiresApplicationControllerIgnoringAuthentication:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 3)
  {
    uint64_t v5 = [v4 accountMetadataRequest];
    int v6 = [v5 forceUnwrapObject];

    int v7 = [(VSIdentityProviderRequestManager *)self _supportedProviderAuthenticationToken];
    if (v7)
    {
      uint64_t v8 = [v6 attributeNames];
      char v9 = [v8 count] != 0;
    }
    else
    {
      char v9 = [v6 isInterruptionAllowed];
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)_requestRequiresApplicationController:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(VSIdentityProviderRequestManager *)self _requestRequiresApplicationControllerIgnoringAuthentication:v4];
  char v5 = [v4 forceAuthentication];

  return v5 | self;
}

- (double)_requestCompletionDelay
{
  VSRequireMainThread();
  id v3 = [(VSIdentityProviderRequestManager *)self viewModel];

  if (!v3) {
    return 0.0;
  }
  [(VSIdentityProviderRequestManager *)self requestCompletionDelayAfterShowingUserInterface];
  return result;
}

- (BOOL)_canShowAuthenticationUI
{
  id v3 = [(VSIdentityProviderRequestManager *)self _currentRequest];
  id v4 = [v3 forceUnwrapObject];
  if ([v4 allowsUI])
  {
    char v5 = [(VSIdentityProviderRequestManager *)self viewModel];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_accountMetadataWithAuthenticationScheme:(id)a3 responseStatusCode:(id)a4 responseString:(id)a5 accountMetadataRequest:(id)a6 verificationData:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  VSRequireMainThread();
  if (!v15) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The accountMetadataRequest parameter must not be nil."];
  }
  id v17 = objc_alloc_init(MEMORY[0x263F1E190]);
  [v17 setVerificationData:v16];
  if ([v15 includeAccountProviderIdentifier])
  {
    uint64_t v18 = [(VSIdentityProviderRequestManager *)self identityProvider];
    long long v19 = [v18 providerID];
    long long v20 = [v19 forceUnwrapObject];
    [v17 setAccountProviderIdentifier:v20];
  }
  if ([v15 includeAuthenticationExpirationDate])
  {
    uint64_t v26 = 0;
    char v27 = &v26;
    uint64_t v28 = 0x3032000000;
    char v29 = __Block_byref_object_copy__6;
    BOOL v30 = __Block_byref_object_dispose__6;
    id v31 = 0;
    long long v21 = [(VSIdentityProviderRequestManager *)self account];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __151__VSIdentityProviderRequestManager__accountMetadataWithAuthenticationScheme_responseStatusCode_responseString_accountMetadataRequest_verificationData___block_invoke;
    v25[3] = &unk_2650780F0;
    v25[4] = &v26;
    [v21 conditionallyUnwrapObject:v25];

    long long v22 = [(id)v27[5] expirationDate];
    [v17 setAuthenticationExpirationDate:v22];

    _Block_object_dispose(&v26, 8);
  }
  if (v14)
  {
    id v23 = objc_alloc_init(MEMORY[0x263F1E198]);
    [v23 setAuthenticationScheme:v12];
    [v23 setStatus:v13];
    [v23 setBody:v14];
    [v17 setAccountProviderResponse:v23];
  }
  return v17;
}

void __151__VSIdentityProviderRequestManager__accountMetadataWithAuthenticationScheme_responseStatusCode_responseString_accountMetadataRequest_verificationData___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 authenticationToken];
  uint64_t v3 = [v6 forceUnwrapObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_resetVerificationStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  id v5 = objc_alloc_init(MEMORY[0x263F1E2E8]);
  id v6 = [(VSIdentityProviderRequestManager *)self auditToken];
  [v5 setAuditToken:v6];

  int v7 = [(VSIdentityProviderRequestManager *)self delegate];
  if ([v7 conformsToProtocol:&unk_26F3D9D08])
  {
    id v8 = v7;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [v8 verificationStateResetOperationForIdentityProviderRequestManager:self];

      id v5 = (id)v9;
    }
  }
  uint64_t v14 = MEMORY[0x263EF8330];
  id v15 = v5;
  id v16 = v4;
  id v10 = v5;
  id v11 = v4;
  id v12 = VSMainThreadOperationWithBlock();
  objc_msgSend(v12, "addDependency:", v10, v14, 3221225472, __81__VSIdentityProviderRequestManager__resetVerificationStateWithCompletionHandler___block_invoke, &unk_265077788);
  VSEnqueueCompletionOperation();
  id v13 = [(VSIdentityProviderRequestManager *)self privateQueue];
  [v13 addOperation:v10];
}

void __81__VSIdentityProviderRequestManager__resetVerificationStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) result];
    uint64_t v2 = [v3 forceUnwrapObject];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
  }
}

- (id)_accountChannelsWithChannelIDs:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  id v5 = objc_alloc_init(MEMORY[0x263F1E178]);
  id v6 = [(VSIdentityProviderRequestManager *)self identityProvider];
  int v7 = [v6 providerID];
  id v8 = [v7 forceUnwrapObject];
  [v5 setProviderID:v8];

  [v5 setChannelIDs:v4];
  return v5;
}

- (void)_enqueueSubscriptionOperationIfRequiredForResponse:(id)a3 asDependencyOf:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 subscriptionsToAdd];
  if ([v8 count])
  {

LABEL_4:
    id v11 = VSDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v6 subscriptionsToRemoveByBundleID];
      uint64_t v13 = [v12 count];
      uint64_t v14 = [v6 subscriptionsToAdd];
      int v20 = 134218240;
      uint64_t v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = [v14 count];
      _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "Will enqueue identity provider subscription operation for %lu subscription removals and %lu subscription registrations.", (uint8_t *)&v20, 0x16u);
    }
    id v15 = objc_alloc_init(VSIdentityProviderSubscriptionOperation);
    id v16 = [(VSIdentityProviderRequestManager *)self identityProvider];
    [(VSIdentityProviderSubscriptionOperation *)v15 setIdentityProvider:v16];

    id v17 = [v6 subscriptionsToRemoveByBundleID];
    [(VSIdentityProviderSubscriptionOperation *)v15 setSubscriptionsToRemoveByBundleID:v17];

    uint64_t v18 = [v6 subscriptionsToAdd];
    [(VSIdentityProviderSubscriptionOperation *)v15 setSubscriptionsToAdd:v18];

    long long v19 = [(VSIdentityProviderRequestManager *)self privateQueue];
    [v19 addOperation:v15];

    [v7 addDependency:v15];
    goto LABEL_7;
  }
  uint64_t v9 = [v6 subscriptionsToRemoveByBundleID];
  uint64_t v10 = [v9 count];

  if (v10) {
    goto LABEL_4;
  }
  VSDefaultLogObject();
  id v15 = (VSIdentityProviderSubscriptionOperation *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v15->super.super.super, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_23F9AB000, &v15->super.super.super, OS_LOG_TYPE_DEFAULT, "No subscription changes, skipping subscription operation.", (uint8_t *)&v20, 2u);
  }
LABEL_7:
}

- (void)_enqueueUserAccountUpdateOperationIfRequiredForResponse:(id)a3 asDependencyOf:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v45 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  id v8 = [v6 applicationUserAccounts];
  uint64_t v9 = [v8 count];

  uint64_t v46 = v6;
  if (v9)
  {
    char v47 = v7;
    id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v11 = [(VSIdentityProviderRequestManager *)self identityProvider];
    id v12 = [v11 nonChannelAppDescriptions];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v54;
      uint64_t v16 = *MEMORY[0x263EFF4A0];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          long long v19 = [v18 bundleID];

          if (!v19) {
            [MEMORY[0x263EFF940] raise:v16 format:@"The [appDescription bundleID] parameter must not be nil."];
          }
          int v20 = [v18 bundleID];
          [v10 addObject:v20];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v14);
    }

    uint64_t v21 = (void *)MEMORY[0x263F1E1C0];
    id v6 = v46;
    __int16 v22 = [v46 applicationUserAccounts];

    if (!v22) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [response applicationUserAccounts] parameter must not be nil."];
    }
    uint64_t v23 = [v46 applicationUserAccounts];
    uint64_t v24 = [(VSIdentityProviderRequestManager *)self identityProvider];
    id v25 = [v24 providerID];
    uint64_t v26 = [v25 forceUnwrapObject];
    id v7 = [v21 userAccountsFromApplicationUserAccounts:v23 ForProviderID:v26 allowedBundleIDs:v10];
  }
  uint64_t v27 = [v7 count];
  uint64_t v28 = VSDefaultLogObject();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v27)
  {
    if (v29)
    {
      uint64_t v30 = [v7 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v59 = v30;
      _os_log_impl(&dword_23F9AB000, v28, OS_LOG_TYPE_DEFAULT, "Will enqueue identity provider user accounts update operation for %lu user accounts", buf, 0xCu);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v48 = v7;
    id v31 = v7;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v50;
      uint64_t v35 = *MEMORY[0x263F1E448];
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v50 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v37 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          id v38 = [(VSIdentityProviderRequestManager *)self identityProvider];
          v39 = [v38 providerID];
          id v40 = [v39 forceUnwrapObject];
          [v37 setModifierIdentifier:v40];

          [v37 setModifierType:v35];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v33);
    }

    id v41 = objc_alloc(MEMORY[0x263F1E238]);
    id v42 = [(VSIdentityProviderRequestManager *)self identityProvider];
    uint64_t v28 = [v41 initWithIdentityProvider:v42 userAccounts:v31];

    uint64_t v43 = [(VSIdentityProviderRequestManager *)self privateQueue];
    [v43 addOperation:v28];

    uint64_t v44 = v45;
    [v45 addDependency:v28];
    id v6 = v46;
    id v7 = v48;
  }
  else
  {
    uint64_t v44 = v45;
    if (v29)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v28, OS_LOG_TYPE_DEFAULT, "No user account changes, skipping user account update operation.", buf, 2u);
    }
  }
}

- (id)_supportedProviderAuthenticationToken
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  uint64_t v2 = [(VSIdentityProviderRequestManager *)self account];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73__VSIdentityProviderRequestManager__supportedProviderAuthenticationToken__block_invoke;
  v5[3] = &unk_2650780F0;
  v5[4] = &v6;
  [v2 conditionallyUnwrapObject:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __73__VSIdentityProviderRequestManager__supportedProviderAuthenticationToken__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 authenticationToken];
  obuint64_t j = [v3 forceUnwrapObject];

  if (([obj isFromUnsupportedProvider] & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  }
}

- (void)applicationControllerDidStart:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  VSRequireMainThread();
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315138;
    uint64_t v27 = "-[VSIdentityProviderRequestManager applicationControllerDidStart:]";
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v26, 0xCu);
  }

  id v5 = [(VSIdentityProviderRequestManager *)self _currentRequest];
  uint64_t v6 = [v5 forceUnwrapObject];

  [(VSIdentityProviderRequestManager *)self _stopApplicationControllerTimer];
  id v7 = [(VSIdentityProviderRequestManager *)self _supportedProviderAuthenticationToken];
  int v8 = [v6 requiresUI];
  uint64_t v9 = [v6 forceAuthentication];
  if (v8)
  {
    id v10 = VSDefaultLogObject();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      id v12 = VSDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_23F9AB000, v12, OS_LOG_TYPE_DEFAULT, "Will show UI", (uint8_t *)&v26, 2u);
      }

      [(VSIdentityProviderRequestManager *)self _showAuthenticationUI];
      goto LABEL_42;
    }
    LOWORD(v26) = 0;
    id v11 = "Request requires UI.";
LABEL_6:
    _os_log_impl(&dword_23F9AB000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v26, 2u);
    goto LABEL_7;
  }
  uint64_t v13 = v9;
  if ([v6 type] == 2)
  {
    uint64_t v14 = VSDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_23F9AB000, v14, OS_LOG_TYPE_DEFAULT, "Request type is delete account.", (uint8_t *)&v26, 2u);
    }

    [(VSIdentityProviderRequestManager *)self _startDeletingAccount];
    goto LABEL_39;
  }
  if (([v7 isValid] ^ 1 | v13))
  {
    if (v7)
    {
      uint64_t v15 = VSDefaultLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_23F9AB000, v15, OS_LOG_TYPE_DEFAULT, "We have a cached authentication token.", (uint8_t *)&v26, 2u);
      }

      uint64_t v16 = [(VSIdentityProviderRequestManager *)self requestFactory];
      uint64_t v17 = [v16 silentAuthenticationApplicationControllerRequestWithAuthenticationToken:v7 forcedAuthentication:v13];
    }
    else
    {
      if ([(VSIdentityProviderRequestManager *)self _canShowAuthenticationUI])
      {
        id v10 = VSDefaultLogObject();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_7;
        }
        LOWORD(v26) = 0;
        id v11 = "Can show authentication UI.";
        goto LABEL_6;
      }
      if ([v6 type] == 4)
      {
        __int16 v22 = VSDefaultLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_23F9AB000, v22, OS_LOG_TYPE_DEFAULT, "Request type is silent make account.", (uint8_t *)&v26, 2u);
        }

        uint64_t v16 = [(VSIdentityProviderRequestManager *)self requestFactory];
        uint64_t v17 = [v16 silentAuthenticationApplicationControllerRequest];
      }
      else
      {
        if ([v6 type] != 5)
        {
          uint64_t v23 = VSErrorLogObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[VSIdentityProviderRequestManager applicationControllerDidStart:](v23);
          }

          uint64_t v24 = VSPublicError();
          [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithError:v24];

          goto LABEL_39;
        }
        uint64_t v16 = [(VSIdentityProviderRequestManager *)self requestFactory];
        uint64_t v17 = [v16 STBOptOutApplicationControllerRequest];
      }
    }
    uint64_t v18 = (void *)v17;

    if (!v18)
    {
LABEL_39:
      id v25 = VSDefaultLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_23F9AB000, v25, OS_LOG_TYPE_DEFAULT, "Nothing for application to do.", (uint8_t *)&v26, 2u);
      }

      goto LABEL_42;
    }
  }
  else
  {
    long long v19 = VSDefaultLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_23F9AB000, v19, OS_LOG_TYPE_DEFAULT, "Authentication token is valid, but we should not force authentication.", (uint8_t *)&v26, 2u);
    }

    uint64_t v18 = [(VSIdentityProviderRequestManager *)self _applicationControllerRequestWithIdentityProviderRequest:v6];
    if (!v18) {
      goto LABEL_39;
    }
  }
  id v20 = v18;
  uint64_t v21 = VSDefaultLogObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_23F9AB000, v21, OS_LOG_TYPE_DEFAULT, "We have an application controller request.", (uint8_t *)&v26, 2u);
  }

  [(VSIdentityProviderRequestManager *)self _submitApplicationControllerRequest:v20];
LABEL_42:
}

- (void)applicationController:(id)a3 startDidFailWithError:(id)a4
{
  id v20 = a4;
  VSRequireMainThread();
  id v5 = [(VSIdentityProviderRequestManager *)self identityProvider];
  char v6 = [v5 isDeveloper];

  if ((v6 & 1) == 0)
  {
    id v7 = [(VSIdentityProviderRequestManager *)self _currentRequest];
    int v8 = [v7 forceUnwrapObject];
    uint64_t v9 = [v8 type];

    id v10 = [(VSIdentityProviderRequestManager *)self _currentRequest];
    id v11 = [v10 forceUnwrapObject];
    id v12 = [v11 requestingAppAdamID];

    uint64_t v13 = [(VSIdentityProviderRequestManager *)self identityProvider];
    uint64_t v14 = [v13 uniqueID];
    uint64_t v15 = [v14 forceUnwrapObject];

    switch(v9)
    {
      case 1:
      case 4:
        uint64_t v16 = [(VSIdentityProviderRequestManager *)self identityProvider];
        uint64_t v17 = [v16 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];

        uint64_t v18 = (void *)MEMORY[0x263F1E460];
        if (v9 != 1) {
          uint64_t v18 = (void *)MEMORY[0x263F1E458];
        }
        [MEMORY[0x263F1E240] recordSignInEventWithProviderIdentifier:v15 supportedProvider:v17 channelAdamID:v12 signInType:*v18 error:v20];
        break;
      case 3:
        long long v19 = (void *)MEMORY[0x263F1E240];
        if (!v12) {
          [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The appAdamIDOrNil parameter must not be nil."];
        }
        [v19 recordMetadataRequestWithProviderIdentifier:v15 channelAdamID:v12 fulfilledByProvider:1 error:v20];
        break;
      case 5:
        [MEMORY[0x263F1E240] recordSTBOptOutEventWithError:v20];
        break;
      default:
        break;
    }
  }
  [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithError:v20];
}

- (void)applicationController:(id)a3 didReceiveViewModelError:(id)a4
{
  id v5 = a4;
  VSRequireMainThread();
  [(VSIdentityProviderRequestManager *)self _completeCurrentRequestWithError:v5];
}

- (void)applicationController:(id)a3 didReceiveViewModel:(id)a4
{
  id v8 = a4;
  VSRequireMainThread();
  [(VSIdentityProviderRequestManager *)self _stopApplicationControllerTimer];
  id v5 = [(VSIdentityProviderRequestManager *)self identityProvider];
  [v8 setIdentityProvider:v5];

  char v6 = [(VSIdentityProviderRequestManager *)self _currentRequest];
  id v7 = [v6 forceUnwrapObject];
  [v8 configureWithRequest:v7];

  [(VSIdentityProviderRequestManager *)self setViewModel:v8];
}

- (void)applicationController:(id)a3 didUpdateLogoViewModel:(id)a4
{
  id v6 = a4;
  id v5 = [(VSIdentityProviderRequestManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 identityProviderRequestManager:self didUpdateLogoViewModel:v6];
  }
}

- (void)applicationController:(id)a3 request:(id)a4 didFailWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  VSRequireMainThread();
  if (!v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The request parameter must not be nil."];
  }
  uint64_t v9 = [(VSIdentityProviderRequestManager *)self currentApplicationControllerRequest];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke;
  v15[3] = &unk_265078118;
  id v16 = v7;
  uint64_t v17 = self;
  id v18 = v8;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_166;
  v12[3] = &unk_265076FD0;
  id v13 = v16;
  id v14 = v18;
  id v10 = v18;
  id v11 = v16;
  [v9 conditionallyUnwrapObject:v15 otherwise:v12];
}

void __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == a2)
  {
    [*(id *)(a1 + 40) _stopApplicationControllerTimer];
    id v4 = *(void **)(a1 + 40);
    id v5 = objc_alloc_init(MEMORY[0x263F1E250]);
    [v4 setCurrentApplicationControllerRequest:v5];

    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    [v6 _handleApplicationControllerError:v7 forRequest:v8];
  }
  else
  {
    id v3 = VSErrorLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_cold_1();
    }
  }
}

void __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_166()
{
  v0 = VSErrorLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_166_cold_1();
  }
}

- (void)applicationController:(id)a3 request:(id)a4 didCompleteWithResponse:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = (char *)a5;
  VSRequireMainThread();
  if (a3)
  {
    if (v8) {
      goto LABEL_3;
    }
LABEL_10:
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The request parameter must not be nil."];
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The applicationController parameter must not be nil."];
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  if (v9) {
    goto LABEL_4;
  }
LABEL_11:
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The response parameter must not be nil."];
LABEL_4:
  id v10 = VSDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v23 = "-[VSIdentityProviderRequestManager applicationController:request:didCompleteWithResponse:]";
    _os_log_impl(&dword_23F9AB000, v10, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v11 = VSDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v9;
    _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "Handling application controller response %@", buf, 0xCu);
  }

  id v12 = [(VSIdentityProviderRequestManager *)self currentApplicationControllerRequest];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke;
  v18[3] = &unk_265078118;
  id v19 = v8;
  id v20 = self;
  uint64_t v21 = v9;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_187;
  v15[3] = &unk_265076FD0;
  id v16 = v19;
  uint64_t v17 = v21;
  id v13 = v21;
  id v14 = v19;
  [v12 conditionallyUnwrapObject:v18 otherwise:v15];
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke(id *a1, void *a2)
{
  v50[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1[4] == v3)
  {
    [a1[5] _stopApplicationControllerTimer];
    id v5 = a1[5];
    id v6 = objc_alloc_init(MEMORY[0x263F1E250]);
    [v5 setCurrentApplicationControllerRequest:v6];

    id v4 = [a1[6] accountChannelIDs];
    uint64_t v37 = [a1[6] accountAuthentication];
    if ([a1[4] type] == 4
      || ([v37 authenticationToken],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v7 object],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          !v8))
    {
      if (v4)
      {
        id v18 = v4;
        id v19 = [a1[5] _accountChannelsWithChannelIDs:v18];
        id v20 = objc_alloc(MEMORY[0x263F1E188]);
        uint64_t v21 = [a1[5] storage];
        __int16 v22 = [v21 forceUnwrapObject];
        uint64_t v23 = [v22 channelsCenter];
        uint64_t v24 = (void *)[v20 initWithUnsavedAccountChannels:v19 accountChannelsCenter:v23];

        objc_initWeak(&location, a1[5]);
        v39[1] = (id)MEMORY[0x263EF8330];
        v39[2] = (id)3221225472;
        v39[3] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_185;
        void v39[4] = &unk_265076E48;
        objc_copyWeak(v42, &location);
        id v40 = a1[4];
        id v41 = a1[6];
        id v25 = VSMainThreadOperationWithBlock();
        [v25 addDependency:v24];
        [a1[5] _enqueueSubscriptionOperationIfRequiredForResponse:a1[6] asDependencyOf:v25];
        VSEnqueueCompletionOperation();
        int v26 = [a1[5] privateQueue];
        [v26 addOperation:v24];

        objc_destroyWeak(v42);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_initWeak(&location, a1[5]);
        objc_copyWeak(v39, &location);
        int8x16_t v36 = *((int8x16_t *)a1 + 2);
        id v27 = (id)v36.i64[0];
        id v38 = a1[6];
        uint64_t v28 = VSMainThreadOperationWithBlock();
        [a1[5] _enqueueSubscriptionOperationIfRequiredForResponse:a1[6] asDependencyOf:v28];
        VSEnqueueCompletionOperation();

        objc_destroyWeak(v39);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      if (!v37) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The accountAuthenticationOrNil parameter must not be nil."];
      }
      id v33 = v37;
      objc_msgSend(a1[5], "_updateAccountWithAccountAuthentication:");
      uint64_t v34 = [a1[5] _accountChannelsWithChannelIDs:v4];
      uint64_t v35 = [a1[5] privateQueue];
      id v9 = objc_alloc(MEMORY[0x263F1E1A0]);
      id v10 = [a1[5] account];
      id v11 = [v10 forceUnwrapObject];
      v50[0] = v11;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:1];
      id v13 = [a1[5] storage];
      id v14 = [v13 forceUnwrapObject];
      uint64_t v15 = (void *)[v9 initWithUnsavedAccounts:v12 channels:v34 storage:v14];

      [v35 addOperation:v15];
      id v16 = [a1[5] identityProvider];
      if (([v16 isDeveloper] & 1) != 0 || !objc_msgSend(a1[5], "canIssuePrivacyVouchers"))
      {
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v17 = [[VSAppsOperation alloc] initWithIdentityProvider:v16];
        [(VSAppsOperation *)v17 addDependency:v15];
        [v35 addOperation:v17];
      }
      objc_initWeak(&location, a1[5]);
      v42[1] = (id)MEMORY[0x263EF8330];
      v42[2] = (id)3221225472;
      v42[3] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_2;
      v42[4] = &unk_265078168;
      objc_copyWeak(&v48, &location);
      id v29 = v15;
      id v30 = a1[5];
      id v43 = v29;
      id v44 = v30;
      id v31 = v17;
      id v45 = v31;
      id v46 = a1[4];
      id v47 = a1[6];
      uint64_t v32 = VSMainThreadOperationWithBlock();
      [v32 addDependency:v29];
      if (v31) {
        [v32 addDependency:v31];
      }
      [a1[5] _enqueueUserAccountUpdateOperationIfRequiredForResponse:a1[6] asDependencyOf:v32];
      [a1[5] _enqueueSubscriptionOperationIfRequiredForResponse:a1[6] asDependencyOf:v32];
      VSEnqueueCompletionOperation();

      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_cold_1();
    }
  }
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  VSRequireMainThread();
  uint64_t v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[VSIdentityProviderRequestManager applicationController:request:didCompleteWithResponse:]_block_invoke_2";
    _os_log_impl(&dword_23F9AB000, v2, OS_LOG_TYPE_DEFAULT, "%s: save account and fetch app opertions completed", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) result];
    id v5 = [v4 forceUnwrapObject];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_178;
    v8[3] = &unk_265078140;
    id v6 = *(void **)(a1 + 48);
    v8[4] = *(void *)(a1 + 40);
    void v8[5] = WeakRetained;
    id v9 = v6;
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_180;
    v7[3] = &unk_265076EB8;
    v7[4] = WeakRetained;
    [v5 unwrapObject:v8 error:v7];
  }
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_178(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) canIssuePrivacyVouchers])
  {
    id v4 = [*(id *)(a1 + 40) storage];
    id v5 = [v4 forceUnwrapObject];
    id v6 = [v5 voucherLockbox];

    uint64_t v7 = [*(id *)(a1 + 32) identityProvider];
    id v8 = [v7 providerID];
    id v9 = [v8 forceUnwrapObject];

    id v10 = [*(id *)(a1 + 48) result];
    [v6 issueVouchersForApps:v10 providerID:v9];
  }
  id v11 = [*(id *)(a1 + 40) viewModel];
  uint64_t v12 = [v11 validationState];

  if (v12 == 2)
  {
    id v13 = [*(id *)(a1 + 40) viewModel];
    [v13 setValidationState:3];
  }
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v15 = (void *)MEMORY[0x263F1E250];
  id v16 = [v3 objectAtIndex:0];
  uint64_t v17 = [v15 optionalWithObject:v16];
  [v14 setAccount:v17];

  id v18 = VSDefaultLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = *(void *)(a1 + 64);
    int v21 = 136315650;
    __int16 v22 = "-[VSIdentityProviderRequestManager applicationController:request:didCompleteWithResponse:]_block_invoke";
    __int16 v23 = 2112;
    uint64_t v24 = v19;
    __int16 v25 = 2112;
    uint64_t v26 = v20;
    _os_log_impl(&dword_23F9AB000, v18, OS_LOG_TYPE_DEFAULT, "%s: request %@, response %@", (uint8_t *)&v21, 0x20u);
  }

  [*(id *)(a1 + 40) _handleApplicationControllerRequest:*(void *)(a1 + 56) didCompleteWithResponse:*(void *)(a1 + 64)];
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_180(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[VSIdentityProviderRequestManager applicationController:request:didCompleteWithResponse:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "%s: error saving account %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = VSPublicError();

  [*(id *)(a1 + 32) _completeCurrentRequestWithError:v5];
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_185(uint64_t a1)
{
  VSRequireMainThread();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleApplicationControllerRequest:*(void *)(a1 + 32) didCompleteWithResponse:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_2_186(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) _handleApplicationControllerRequest:*(void *)(a1 + 40) didCompleteWithResponse:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_187()
{
  v0 = VSErrorLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_187_cold_1();
  }
}

- (BOOL)applicationController:(id)a3 requestsAlert:(id)a4
{
  id v4 = self;
  id v5 = [(VSIdentityProviderRequestManager *)self _identityProviderAlertWithApplicationControllerAlert:a4];
  int v6 = [(VSIdentityProviderRequestManager *)v4 delegate];
  LOBYTE(v4) = [v6 identityProviderRequestManager:v4 requestsAlert:v5];

  return (char)v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kVSKeyValueObservingContext_ViewModelValidationState_0 == a6)
  {
    uint64_t v7 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x263F081B8], a4);
    uint64_t v8 = [v7 unsignedIntegerValue];

    if (v8 == 2)
    {
      uint64_t v15 = VSDefaultLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F9AB000, v15, OS_LOG_TYPE_DEFAULT, "Validation state changed to validating.", buf, 2u);
      }

      id v16 = [(VSIdentityProviderRequestManager *)self _currentRequest];
      uint64_t v17 = [v16 forceUnwrapObject];

      uint64_t v18 = [v17 forceAuthentication];
      uint64_t v19 = [(VSIdentityProviderRequestManager *)self _supportedProviderAuthenticationToken];
      uint64_t v20 = [(VSIdentityProviderRequestManager *)self requestFactory];
      int v21 = [v20 authenticationApplicationControllerRequestWithAuthenticationToken:v19 forcedAuthentication:v18];

      [(VSIdentityProviderRequestManager *)self _submitApplicationControllerRequest:v21];
    }
    else if (v8 == 1)
    {
      id v9 = [(VSIdentityProviderRequestManager *)self viewModel];
      int v10 = [v9 shouldPreValidate];

      id v11 = VSDefaultLogObject();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "View Model requires pre-validation, will invoke application callback.", buf, 2u);
        }

        id v13 = [(VSIdentityProviderRequestManager *)self _supportedProviderAuthenticationToken];
        uint64_t v14 = [(VSIdentityProviderRequestManager *)self applicationController];
        [v14 applicationStartSelfValidationWithAuthenticationToken:v13];
      }
      else
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "View Model does not require pre-validation, validate.", buf, 2u);
        }

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __83__VSIdentityProviderRequestManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_265076A18;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)VSIdentityProviderRequestManager;
    -[VSIdentityProviderRequestManager observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __83__VSIdentityProviderRequestManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewModel];
  [v1 setValidationState:2];
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (VSIdentityProviderRequestManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSIdentityProviderRequestManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (BOOL)canIssuePrivacyVouchers
{
  return self->_canIssuePrivacyVouchers;
}

- (void)setCanIssuePrivacyVouchers:(BOOL)a3
{
  self->_canIssuePrivacyVouchers = a3;
}

- (VSViewModel)viewModel
{
  return self->_viewModel;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (NSMutableArray)requestContexts
{
  return self->_requestContexts;
}

- (void)setRequestContexts:(id)a3
{
}

- (VSApplicationController)applicationController
{
  return self->_applicationController;
}

- (void)setApplicationController:(id)a3
{
}

- (VSOptional)currentApplicationControllerRequest
{
  return self->_currentApplicationControllerRequest;
}

- (void)setCurrentApplicationControllerRequest:(id)a3
{
}

- (VSOptional)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (VSOptional)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (VSApplicationControllerRequestFactory)requestFactory
{
  return self->_requestFactory;
}

- (void)setRequestFactory:(id)a3
{
}

- (BOOL)didCreateAccount
{
  return self->_didCreateAccount;
}

- (void)setDidCreateAccount:(BOOL)a3
{
  self->_didCreateAccount = a3;
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (OS_dispatch_source)applicationControllerTimerSource
{
  return self->_applicationControllerTimerSource;
}

- (void)setApplicationControllerTimerSource:(id)a3
{
}

- (BOOL)allowsApplicationControllerTimer
{
  return self->_allowsApplicationControllerTimer;
}

- (void)setAllowsApplicationControllerTimer:(BOOL)a3
{
  self->_allowsApplicationControllerTimer = a3;
}

- (double)applicationControllerTimerLeeway
{
  return self->_applicationControllerTimerLeeway;
}

- (void)setApplicationControllerTimerLeeway:(double)a3
{
  self->_applicationControllerTimerLeeway = a3;
}

- (double)requestCompletionDelayAfterShowingUserInterface
{
  return self->_requestCompletionDelayAfterShowingUserInterface;
}

- (void)setRequestCompletionDelayAfterShowingUserInterface:(double)a3
{
  self->_requestCompletionDelayAfterShowingUserInterface = a3;
}

- (double)applicationControllerTimerDelay
{
  return self->_applicationControllerTimerDelay;
}

- (VSDeveloperSettingsFetchOperation)settingsFetchOperation
{
  return self->_settingsFetchOperation;
}

- (void)setSettingsFetchOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsFetchOperation, 0);
  objc_storeStrong((id *)&self->_applicationControllerTimerSource, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_requestFactory, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_currentApplicationControllerRequest, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_requestContexts, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

- (void)_processRequestContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Error fetching user accounts for provider, will not provide user accounts to auth context: %@", (uint8_t *)&v2, 0xCu);
}

void __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Error fetching developer settings in preparation for request: %@", (uint8_t *)&v2, 0xCu);
}

- (void)applicationControllerDidStart:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "We can't show UI and can't make a request to the MSO.", v1, 2u);
}

void __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_23F9AB000, v0, (uint64_t)v0, "Non-current request (%@) failed with error: %@", v1);
}

void __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_166_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_23F9AB000, v0, v1, "Request (%@) failed without current request: %@", v2);
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_23F9AB000, v0, (uint64_t)v0, "Non-current request (%@) finished with response: %@", v1);
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_187_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_23F9AB000, v0, v1, "Old request (%@) finished with response: %@", v2);
}

@end