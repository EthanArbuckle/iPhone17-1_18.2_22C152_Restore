@interface VSApplicationController
- (BOOL)allowUI;
- (BOOL)applicationMustSelfValidate;
- (JSValue)applicationReadyCallback;
- (NSArray)userAccounts;
- (NSError)delegateError;
- (NSError)onLaunchError;
- (NSOperationQueue)privateQueue;
- (NSString)accountProviderAuthenticationToken;
- (NSURL)fetchedURL;
- (VSAppDocumentController)appDocumentController;
- (VSApplication)application;
- (VSApplicationController)init;
- (VSApplicationController)initWithIdentityProvider:(id)a3;
- (VSApplicationControllerDelegate)delegate;
- (VSApplicationControllerResponseHandler)responseHandler;
- (VSAuditToken)auditToken;
- (VSIdentityProvider)identityProvider;
- (VSPreferences)preferences;
- (VSStateMachine)stateMachine;
- (id)_applicationControllerAlertForJavascriptAlert:(id)a3;
- (id)_applicationLaunchParams;
- (id)_bootURL;
- (id)_errorForJavascriptErrorValueValue:(id)a3 withRequest:(id)a4;
- (id)_javascriptRequestForRequest:(id)a3 withVerificationData:(id)a4;
- (id)_makeJavaScriptRequest;
- (id)activeAppDocumentForApplication:(id)a3;
- (void)_applicationReadyWithSuccess:(BOOL)a3 javascriptErrorValue:(id)a4;
- (void)_beginAuthentication;
- (void)_cancelValidation;
- (void)_completeRequest:(id)a3 withJavascriptResponse:(id)a4 javascriptErrorValue:(id)a5;
- (void)_completeRequest:(id)a3 withResult:(id)a4;
- (void)_makeJavascriptRequestForRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)_notifyDelegateWithBlock:(id)a3;
- (void)_notifyDidReceiveViewModel:(id)a3;
- (void)_notifyDidReceiveViewModelError:(id)a3;
- (void)_notifyDidStart;
- (void)_notifyDidUpdateLogoViewModel:(id)a3;
- (void)_notifyRequest:(id)a3 didCompleteWithResponse:(id)a4;
- (void)_notifyRequest:(id)a3 didFailWithError:(id)a4;
- (void)_notifyStartDidFailWithError:(id)a3;
- (void)_presentAlert:(id)a3;
- (void)_presentDocument:(id)a3;
- (void)_submitJavascriptRequest:(id)a3 forApplicationControllerRequest:(id)a4;
- (void)appDocumentController:(id)a3 didFailToUpdateViewModelWithError:(id)a4;
- (void)appDocumentController:(id)a3 didUpdateLogoViewModel:(id)a4;
- (void)appDocumentController:(id)a3 didUpdateViewModel:(id)a4;
- (void)application:(id)a3 evaluateAppJavascriptInContext:(id)a4;
- (void)application:(id)a3 startDidFailWithError:(id)a4;
- (void)applicationDidStart:(id)a3;
- (void)applicationStartSelfValidationWithAuthenticationToken:(id)a3;
- (void)dealloc;
- (void)release;
- (void)sendErrorMessage:(id)a3;
- (void)setAccountProviderAuthenticationToken:(id)a3;
- (void)setAllowUI:(BOOL)a3;
- (void)setAppDocumentController:(id)a3;
- (void)setApplication:(id)a3;
- (void)setApplicationMustSelfValidate:(BOOL)a3;
- (void)setApplicationReadyCallback:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateError:(id)a3;
- (void)setFetchedURL:(id)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setOnLaunchError:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setUserAccounts:(id)a3;
- (void)showAuthenticationUserInterfaceWithAuthenticationToken:(id)a3;
- (void)start;
- (void)stop;
- (void)submitRequest:(id)a3;
- (void)transitionToInvalidState;
- (void)transitionToNotifyingOfLaunchFailureState;
- (void)transitionToReadyState;
- (void)transitionToWaitingForBootUrlState;
- (void)transitionToWaitingForBothLaunchCallbacksState;
@end

@implementation VSApplicationController

- (void)release
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v4.receiver = self;
    v4.super_class = (Class)VSApplicationController;
    [(VSApplicationController *)&v4 release];
  }
  else
  {
    v3 = MEMORY[0x263EF83A0];
    dispatch_sync_f(v3, self, VSMainThreadRelease);
  }
}

- (VSApplicationController)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSApplicationController)initWithIdentityProvider:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The identityProvider parameter must not be nil."];
  }
  v17.receiver = self;
  v17.super_class = (Class)VSApplicationController;
  v6 = [(VSApplicationController *)&v17 init];
  if (v6)
  {
    v7 = (VSPreferences *)objc_alloc_init(MEMORY[0x263F1E260]);
    preferences = v6->_preferences;
    v6->_preferences = v7;

    objc_storeStrong((id *)&v6->_identityProvider, a3);
    v9 = objc_alloc_init(VSApplicationControllerResponseHandler);
    responseHandler = v6->_responseHandler;
    v6->_responseHandler = v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    privateQueue = v6->_privateQueue;
    v6->_privateQueue = v11;

    [(NSOperationQueue *)v6->_privateQueue setName:@"VSApplicationController.Queue"];
    id v16 = v5;
    id v13 = objc_alloc_init(MEMORY[0x263F1E298]);
    [v13 setName:@"VSApplicationController"];
    [v13 setDestinationState:@"Waiting for boot URL" forEvent:@"Start app controller" inState:@"Initial"];
    [v13 setDestinationState:@"Notifying of launch failure" forEvent:@"Boot URL fetch failed" inState:@"Waiting for boot URL"];
    [v13 setDestinationState:@"Waiting for both launch callbacks" forEvent:@"Boot URL received" inState:@"Waiting for boot URL"];
    [v13 setDestinationState:@"Invalid" forEvent:@"Stop app controller" inState:@"Waiting for boot URL"];
    [v13 setDestinationState:@"Waiting for delegate callback" forEvent:@"onLaunch callback succeeded" inState:@"Waiting for both launch callbacks"];
    [v13 setDestinationState:@"Waiting for on launch callback" forEvent:@"Application did start" inState:@"Waiting for both launch callbacks"];
    [v13 setDestinationState:@"Notifying of launch failure" forEvent:@"onLaunch callback failed" inState:@"Waiting for both launch callbacks"];
    [v13 setDestinationState:@"Notifying of launch failure" forEvent:@"Application failed to start" inState:@"Waiting for both launch callbacks"];
    [v13 setDestinationState:@"Invalid" forEvent:@"Stop app controller" inState:@"Waiting for both launch callbacks"];
    [v13 setDestinationState:@"Ready" forEvent:@"onLaunch callback succeeded" inState:@"Waiting for on launch callback"];
    [v13 setDestinationState:@"Notifying of launch failure" forEvent:@"onLaunch callback failed" inState:@"Waiting for on launch callback"];
    [v13 setDestinationState:@"Invalid" forEvent:@"Stop app controller" inState:@"Waiting for on launch callback"];
    [v13 setDestinationState:@"Ready" forEvent:@"Application did start" inState:@"Waiting for delegate callback"];
    [v13 setDestinationState:@"Notifying of launch failure" forEvent:@"onLaunch callback failed" inState:@"Waiting for delegate callback"];
    [v13 setDestinationState:@"Invalid" forEvent:@"Stop app controller" inState:@"Waiting for delegate callback"];
    [v13 ignoreEvent:@"onLaunch callback failed" inState:@"Notifying of launch failure"];
    [v13 ignoreEvent:@"Application failed to start" inState:@"Notifying of launch failure"];
    [v13 ignoreEvent:@"onLaunch callback succeeded" inState:@"Notifying of launch failure"];
    [v13 ignoreEvent:@"Application did start" inState:@"Notifying of launch failure"];
    [v13 ignoreEvent:@"Stop app controller" inState:@"Notifying of launch failure"];
    [v13 setDestinationState:@"Invalid" forEvent:@"Finished notifying of launch failure" inState:@"Notifying of launch failure"];
    [v13 setDestinationState:@"Invalid" forEvent:@"Stop app controller" inState:@"Ready"];
    [v13 ignoreEvent:@"onLaunch callback succeeded" inState:@"Invalid"];
    [v13 ignoreEvent:@"onLaunch callback failed" inState:@"Invalid"];
    [v13 ignoreEvent:@"Application did start" inState:@"Invalid"];
    [v13 ignoreEvent:@"Application failed to start" inState:@"Invalid"];
    [v13 ignoreEvent:@"Stop app controller" inState:@"Invalid"];
    [v13 ignoreEvent:@"Boot URL received" inState:@"Invalid"];
    [v13 ignoreEvent:@"Boot URL fetch failed" inState:@"Invalid"];
    [v13 setDelegate:v6];
    [v13 activateWithState:@"Initial"];
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = (VSStateMachine *)v13;
    id v5 = v16;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating application controller: %p", buf, 0xCu);
  }

  VSRequireMainThread();
  v4.receiver = self;
  v4.super_class = (Class)VSApplicationController;
  [(VSApplicationController *)&v4 dealloc];
}

- (void)transitionToWaitingForBootUrlState
{
  CFRetain(self);
  v3 = [(VSApplicationController *)self identityProvider];
  int v4 = [v3 requireAuthenticationURLSystemTrust];

  id v5 = [(VSApplicationController *)self identityProvider];
  v6 = [v5 authenticationURL];

  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [[self identityProvider] authenticationURL] parameter must not be nil."];
  }
  uint64_t v7 = [(VSApplicationController *)self identityProvider];
  v8 = [v7 authenticationURL];

  v9 = (void *)[objc_alloc(MEMORY[0x263F1E1B8]) initWithBootURL:v8 isDeveloper:v4 ^ 1u];
  objc_initWeak(&location, self);
  objc_copyWeak(&v13, &location);
  id v12 = v9;
  v10 = VSMainThreadOperationWithBlock();
  [v10 addDependency:v12];
  VSEnqueueCompletionOperation();
  v11 = [(VSApplicationController *)self privateQueue];
  [v11 addOperation:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [*(id *)(a1 + 32) urlOrError];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_2;
    v5[3] = &unk_265077370;
    v5[4] = WeakRetained;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_147;
    v4[3] = &unk_265076EB8;
    v4[4] = WeakRetained;
    [v3 unwrapObject:v5 error:v4];
  }
}

void __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Fetched boot URL %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) setFetchedURL:v3];
  id v5 = [*(id *)(a1 + 32) stateMachine];
  [v5 enqueueEvent:@"Boot URL received"];
}

void __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_147(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_147_cold_1();
  }

  id v5 = VSPublicServiceTemporarilyUnavailableError();
  [*(id *)(a1 + 32) setOnLaunchError:v5];
  int v6 = [*(id *)(a1 + 32) stateMachine];
  [v6 enqueueEvent:@"Boot URL fetch failed"];
}

- (void)transitionToWaitingForBothLaunchCallbacksState
{
  id v3 = objc_alloc_init(MEMORY[0x263F1E1E8]);
  int v4 = [(VSApplicationController *)self privateQueue];
  [v4 addOperation:v3];

  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = v3;
  id v5 = v3;
  int v6 = VSMainThreadOperationWithBlock();
  objc_msgSend(v6, "addDependency:", v5, v7, 3221225472, __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke, &unk_265076FD0);
  VSEnqueueCompletionOperation();
}

void __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  v2 = [*(id *)(a1 + 32) result];
  id v3 = [v2 forceUnwrapObject];

  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_2;
  v40[3] = &unk_265077398;
  v40[4] = &v41;
  [v3 unwrapObject:v40 error:&__block_literal_global_9];
  int v4 = [*(id *)(a1 + 40) _bootURL];
  id v5 = [v4 forceUnwrapObject];

  if (*((unsigned char *)v42 + 24)
    && ([*(id *)(a1 + 40) identityProvider],
        int v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isDeveloper],
        v6,
        v7))
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v5 resolvingAgainstBaseURL:0];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 queryItems];

      if (v10)
      {
        id v11 = objc_alloc(MEMORY[0x263EFF980]);
        id v12 = [v9 queryItems];
        BOOL v13 = v12 == 0;

        if (v13) {
          [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [components queryItems] parameter must not be nil."];
        }
        v14 = [v9 queryItems];
        id v15 = (id)[v11 initWithArray:v14];
      }
      else
      {
        id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      objc_super v17 = NSString;
      v18 = [MEMORY[0x263EFF910] date];
      [v18 timeIntervalSince1970];
      v20 = objc_msgSend(v17, "stringWithFormat:", @"%.0f", v19);

      v21 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"cachebuster" value:v20];
      [v15 addObject:v21];

      [v9 setQueryItems:v15];
      v22 = [v9 URL];
      v23 = v22;
      if (v22)
      {
        id v16 = v22;

        v24 = VSDefaultLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = [v16 absoluteString];
          *(_DWORD *)buf = 138412290;
          v46 = v25;
          _os_log_impl(&dword_23F9AB000, v24, OS_LOG_TYPE_DEFAULT, "New URL with cachebuster is %@", buf, 0xCu);
        }
      }
      else
      {
        id v16 = v5;
      }
    }
    else
    {
      id v16 = v5;
    }
  }
  else
  {
    id v16 = v5;
  }
  v26 = [[VSApplication alloc] initWithBootURL:v16];
  [(VSApplication *)v26 setDelegate:*(void *)(a1 + 40)];
  v27 = [*(id *)(a1 + 40) auditToken];
  [(VSApplication *)v26 setAuditToken:v27];

  v28 = [*(id *)(a1 + 40) preferences];
  if ([v28 allowNonSystemTrust])
  {
    uint64_t v29 = 0;
  }
  else
  {
    v30 = [*(id *)(a1 + 40) identityProvider];
    uint64_t v29 = [v30 requireXHRRequestSystemTrust];
  }
  [(VSApplication *)v26 setCanRequireSystemTrust:v29];
  v31 = [*(id *)(a1 + 40) identityProvider];
  v32 = [v31 uniqueID];

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_170;
  v38[3] = &unk_265076D20;
  v38[4] = *(void *)(a1 + 40);
  v33 = v26;
  v39 = v33;
  [v32 conditionallyUnwrapObject:v38];
  v34 = [*(id *)(a1 + 40) identityProvider];
  char v35 = [v34 isDeveloper];

  if (v35)
  {
    uint64_t v36 = 1;
  }
  else
  {
    v37 = [*(id *)(a1 + 40) preferences];
    uint64_t v36 = [v37 shouldAlwaysAllowRemoteInspection];
  }
  [(VSApplication *)v33 setShouldAllowRemoteInspection:v36];
  [(VSApplication *)v33 start];
  [*(id *)(a1 + 40) setApplication:v33];

  _Block_object_dispose(&v41, 8);
}

uint64_t __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 cacheBusterEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_3_cold_1();
  }
}

void __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_170(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = [*(id *)(a1 + 32) preferences];
  if ([v3 useLegacyVendorIdentifier])
  {
    int v4 = [&unk_26F37E608 containsObject:v17];

    if (v4)
    {
      id v5 = *(void **)(a1 + 40);
      int v6 = [MEMORY[0x263F1C5C0] currentDevice];
      int v7 = [v6 identifierForVendor];
      uint64_t v8 = [v7 UUIDString];
      v9 = v5;
LABEL_7:
      [v9 setVendorIdentifier:v8];
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v6 = [*(id *)(a1 + 32) preferences];
  int v7 = [v6 vendorIdentifierDictionary];
  uint64_t v8 = [v7 objectForKey:v17];
  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    goto LABEL_7;
  }
  uint64_t v10 = *MEMORY[0x263EFF4A0];
  do
  {
    id v11 = v8;
    id v12 = objc_alloc_init(MEMORY[0x263F08C38]);
    uint64_t v8 = [v12 UUIDString];

    BOOL v13 = [v7 allValues];
    if (!v8) {
      [MEMORY[0x263EFF940] raise:v10 format:@"The vendorID parameter must not be nil."];
    }
    char v14 = [v13 containsObject:v8];
  }
  while ((v14 & 1) != 0);
  id v15 = (void *)[v7 mutableCopy];
  if (!v8) {
    [MEMORY[0x263EFF940] raise:v10 format:@"The vendorID parameter must not be nil."];
  }
  [v15 setValue:v8 forKey:v17];
  id v16 = [*(id *)(a1 + 32) preferences];
  [v16 setVendorIdentifierDictionary:v15];

  [*(id *)(a1 + 40) setVendorIdentifier:v8];
LABEL_15:
}

- (void)transitionToReadyState
{
}

uint64_t __49__VSApplicationController_transitionToReadyState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDidStart];
}

- (void)transitionToNotifyingOfLaunchFailureState
{
}

uint64_t __68__VSApplicationController_transitionToNotifyingOfLaunchFailureState__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__VSApplicationController_transitionToNotifyingOfLaunchFailureState__block_invoke_2;
  v3[3] = &unk_265076A18;
  v3[4] = v1;
  return [v1 _notifyDelegateWithBlock:v3];
}

void __68__VSApplicationController_transitionToNotifyingOfLaunchFailureState__block_invoke_2(uint64_t a1)
{
  v15[2] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegateError];
  uint64_t v3 = [*(id *)(a1 + 32) onLaunchError];
  int v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    v9 = v2;
LABEL_17:
    [v8 _notifyStartDidFailWithError:v9];
    goto LABEL_18;
  }
  if (v3) {
    BOOL v6 = v2 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    v9 = v4;
    goto LABEL_17;
  }
  if (v2) {
    BOOL v7 = v3 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"No errors to notify about."];
  }
  else
  {
    v15[0] = v2;
    v15[1] = v3;
    id v11 = (void *)MEMORY[0x263EFF8C0];
    id v12 = v2;
    BOOL v13 = [v11 arrayWithObjects:v15 count:2];
    char v14 = VSPublicErrorWithDetailedErrors();

    [*(id *)(a1 + 32) _notifyStartDidFailWithError:v14];
  }
LABEL_18:
  [*(id *)(a1 + 32) setDelegateError:0];
  [*(id *)(a1 + 32) setOnLaunchError:0];
  uint64_t v10 = [*(id *)(a1 + 32) stateMachine];
  [v10 enqueueEvent:@"Finished notifying of launch failure"];
}

- (void)transitionToInvalidState
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    BOOL v6 = "-[VSApplicationController transitionToInvalidState]";
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v5, 0xCu);
  }

  int v4 = [(VSApplicationController *)self application];
  [v4 setDelegate:0];
  [v4 stop];
  [(VSApplicationController *)self setApplication:0];
  CFRelease(self);
}

- (void)start
{
  id v2 = [(VSApplicationController *)self stateMachine];
  [v2 enqueueEvent:@"Start app controller"];
}

- (void)stop
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    BOOL v6 = "-[VSApplicationController stop]";
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v5, 0xCu);
  }

  int v4 = [(VSApplicationController *)self stateMachine];
  [v4 enqueueEvent:@"Stop app controller"];
}

- (void)sendErrorMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(VSApplicationController *)self application];
  [v5 sendErrorWithMessage:v4];
}

- (void)showAuthenticationUserInterfaceWithAuthenticationToken:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[VSApplicationController showAuthenticationUserInterfaceWithAuthenticationToken:]";
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  VSRequireMainThread();
  BOOL v6 = (void *)MEMORY[0x263F1E250];
  uint64_t v7 = [v4 body];
  uint64_t v8 = [v6 optionalWithObject:v7];
  v9 = [v8 unwrapWithFallback:&stru_26F361E90];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  objc_initWeak(&location, self);
  uint64_t v10 = [(VSApplicationController *)self application];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__VSApplicationController_showAuthenticationUserInterfaceWithAuthenticationToken___block_invoke;
  v13[3] = &unk_2650773C0;
  p_long long buf = &buf;
  objc_copyWeak(&v16, &location);
  id v11 = v9;
  id v14 = v11;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__VSApplicationController_showAuthenticationUserInterfaceWithAuthenticationToken___block_invoke_196;
  v12[3] = &unk_2650773E8;
  v12[4] = self;
  v12[5] = &buf;
  [v10 evaluate:v13 completionHandler:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __82__VSApplicationController_showAuthenticationUserInterfaceWithAuthenticationToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v12 = "-[VSApplicationController showAuthenticationUserInterfaceWithAuthenticationToken:]_block_invoke";
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Beginning evaluation of JavaScript in %s", buf, 0xCu);
  }

  id v5 = [v3 objectForKeyedSubscript:@"App"];

  if ([v5 hasProperty:@"onShowUserInterface"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setAllowUI:1];

    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v7 setObject:@"authenticate" forKey:@"purpose"];
    if ([*(id *)(a1 + 32) length]) {
      [v7 setObject:*(void *)(a1 + 32) forKey:@"currentAuthentication"];
    }
    id v10 = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
    id v9 = (id)[v5 invokeMethod:@"onShowUserInterface" withArguments:v8];
  }
}

void __82__VSApplicationController_showAuthenticationUserInterfaceWithAuthenticationToken___block_invoke_196(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[VSApplicationController showAuthenticationUserInterfaceWithAuthenticationToken:]_block_invoke";
    _os_log_impl(&dword_23F9AB000, v2, OS_LOG_TYPE_DEFAULT, "Finished evaluation of JavaScript in %s", (uint8_t *)&v6, 0xCu);
  }

  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  if (v3 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = [v3 application];
    [v5 sendErrorWithMessage:@"The App.onShowUserInterface function must be defined."];
  }
}

- (void)submitRequest:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__VSApplicationController_submitRequest___block_invoke;
  v6[3] = &unk_265077410;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(VSApplicationController *)self _makeJavascriptRequestForRequest:v5 withCompletionHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __41__VSApplicationController_submitRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  VSRequireMainThread();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v10)
    {
      [WeakRetained _submitJavascriptRequest:v10 forApplicationControllerRequest:v8];
    }
    else
    {
      id v9 = [MEMORY[0x263F1E208] failableWithError:v5];
      [v7 _completeRequest:v8 withResult:v9];
    }
  }
}

- (void)applicationStartSelfValidationWithAuthenticationToken:(id)a3
{
  id v4 = a3;
  id v5 = [(VSApplicationController *)self application];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__VSApplicationController_applicationStartSelfValidationWithAuthenticationToken___block_invoke;
  v7[3] = &unk_265077438;
  id v8 = v4;
  id v6 = v4;
  [v5 evaluate:v7 completionHandler:&__block_literal_global_211];
}

void __81__VSApplicationController_applicationStartSelfValidationWithAuthenticationToken___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = [a2 objectForKeyedSubscript:@"App"];
  id v4 = v3;
  if (v3 && [v3 hasProperty:@"onValidate"])
  {
    id v5 = objc_alloc_init(VSApplicationControllerRequestFactory);
    id v6 = [(VSApplicationControllerRequestFactory *)v5 authenticationApplicationControllerRequestWithAuthenticationToken:0 forcedAuthentication:0];
    id v7 = [v6 SAMLRequest];

    if (v7)
    {
      id v8 = [v6 SAMLRequest];

      if (!v8) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [request SAMLRequest] parameter must not be nil."];
      }
      id v9 = [v6 SAMLRequest];
    }
    else
    {
      id v9 = &stru_26F361E90;
    }
    id v10 = (void *)MEMORY[0x263F1E250];
    id v11 = [*(id *)(a1 + 32) body];
    id v12 = [v10 optionalWithObject:v11];
    uint64_t v13 = [v12 unwrapWithFallback:&stru_26F361E90];

    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v14 setObject:v9 forKey:@"requestBody"];
    if ([v13 length]) {
      [v14 setObject:v13 forKey:@"currentAuthentication"];
    }
    v17[0] = v14;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    id v16 = (id)[v4 invokeMethod:@"onValidate" withArguments:v15];
  }
}

void __81__VSApplicationController_applicationStartSelfValidationWithAuthenticationToken___block_invoke_2()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "Finished invoking onSubmit callback.", v1, 2u);
  }
}

- (void)application:(id)a3 evaluateAppJavascriptInContext:(id)a4
{
  v82[4] = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v42 = a4;
  uint64_t v43 = [v42 objectForKeyedSubscript:@"App"];
  objc_initWeak(&location, self);
  v80[0] = *MEMORY[0x263F10368];
  uint64_t v6 = v80[0];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke;
  v56[3] = &unk_265077480;
  v37 = &v57;
  objc_copyWeak(&v57, &location);
  id v7 = (void *)MEMORY[0x2455D84D0](v56);
  uint64_t v8 = *MEMORY[0x263F10370];
  uint64_t v9 = MEMORY[0x263EFFA80];
  v82[0] = v7;
  v82[1] = MEMORY[0x263EFFA80];
  uint64_t v10 = *MEMORY[0x263F10350];
  v80[1] = v8;
  v80[2] = v10;
  uint64_t v81 = *MEMORY[0x263F10348];
  uint64_t v11 = v81;
  v82[2] = MEMORY[0x263EFFA80];
  v82[3] = MEMORY[0x263EFFA80];
  id v12 = [NSDictionary dictionaryWithObjects:v82 forKeys:v80 count:4];
  [v43 defineProperty:@"presentDocument" descriptor:v12];

  v78[0] = v6;
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_2;
  v54[3] = &unk_2650774A8;
  v38 = &v55;
  objc_copyWeak(&v55, &location);
  uint64_t v13 = (void *)MEMORY[0x2455D84D0](v54);
  v79[0] = v13;
  v79[1] = v9;
  v78[1] = v8;
  v78[2] = v10;
  v78[3] = v11;
  v79[2] = v9;
  v79[3] = v9;
  id v14 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:4];
  [v43 defineProperty:@"presentAlert" descriptor:v14];

  v76[0] = v6;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_3;
  v52[3] = &unk_265077480;
  v39 = &v53;
  objc_copyWeak(&v53, &location);
  id v15 = (void *)MEMORY[0x2455D84D0](v52);
  v77[0] = v15;
  v77[1] = v9;
  v76[1] = v8;
  v76[2] = v10;
  v76[3] = v11;
  v77[2] = v9;
  v77[3] = v9;
  id v16 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:4];
  [v43 defineProperty:@"beginAuthentication" descriptor:v16];

  v74[0] = v6;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_4;
  v50[3] = &unk_2650774D0;
  v40 = &v51;
  objc_copyWeak(&v51, &location);
  id v17 = (void *)MEMORY[0x2455D84D0](v50);
  v75[0] = v17;
  v75[1] = v9;
  v74[1] = v8;
  v74[2] = v10;
  v74[3] = v11;
  v75[2] = v9;
  v75[3] = v9;
  v18 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:4];
  [v43 defineProperty:@"cancelValidation" descriptor:v18];

  v72[0] = v6;
  v73[0] = objc_opt_class();
  v73[1] = v9;
  v72[1] = v8;
  v72[2] = v10;
  v72[3] = v11;
  v73[2] = v9;
  v73[3] = v9;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:4];
  [v43 defineProperty:@"ResponsePayload" descriptor:v19];

  v70[0] = v6;
  v71[0] = objc_opt_class();
  v71[1] = v9;
  v70[1] = v8;
  v70[2] = v10;
  v70[3] = v11;
  v71[2] = v9;
  v71[3] = v9;
  char v20 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:4];
  [v43 defineProperty:@"Subscription" descriptor:v20];

  v68[0] = v6;
  v69[0] = objc_opt_class();
  v69[1] = v9;
  v68[1] = v8;
  v68[2] = v10;
  v68[3] = v11;
  v69[2] = v9;
  v69[3] = v9;
  uint64_t v21 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];
  [v43 defineProperty:@"UserAccount" descriptor:v21];

  v66[0] = v6;
  v67[0] = objc_opt_class();
  v67[1] = v9;
  v66[1] = v8;
  v66[2] = v10;
  v66[3] = v11;
  v67[2] = v9;
  v67[3] = v9;
  v22 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:4];
  [v43 defineProperty:@"AppleSubscription" descriptor:v22];

  v64[0] = v6;
  v65[0] = objc_opt_class();
  v65[1] = v9;
  v64[1] = v8;
  v64[2] = v10;
  v64[3] = v11;
  v65[2] = v9;
  v65[3] = v9;
  v23 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:4];
  [v43 defineProperty:@"Alert" descriptor:v23];

  v62[0] = v6;
  v63[0] = objc_opt_class();
  v63[1] = v9;
  v62[1] = v8;
  v62[2] = v10;
  v62[3] = v11;
  v63[2] = v9;
  v63[3] = v9;
  v24 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:4];
  [v43 defineProperty:@"AlertAction" descriptor:v24];

  VSExportCompressionToContext(v42);
  v25 = VSScriptMessageSupportInjection(1);
  id v26 = (id)[v42 evaluateScript:v25];

  v27 = (void *)MEMORY[0x263F10390];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_5;
  v48[3] = &unk_2650774F8;
  uint64_t v41 = &v49;
  objc_copyWeak(&v49, &location);
  v28 = (void *)MEMORY[0x2455D84D0](v48);
  uint64_t v29 = [v27 valueWithObject:v28 inContext:v42];

  [(VSApplicationController *)self setApplicationReadyCallback:v29];
  v30 = [v42 globalObject];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v31 = [&unk_26F37E620 countByEnumeratingWithState:&v44 objects:v61 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(&unk_26F37E620);
        }
        uint64_t v34 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v30, "deleteProperty:", v34, v36, v37, v38, v39, v40, v41))
        {
          char v35 = VSErrorLogObject();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v60 = v34;
            _os_log_error_impl(&dword_23F9AB000, v35, OS_LOG_TYPE_ERROR, "Unable to delete %@ property.", buf, 0xCu);
          }
        }
      }
      uint64_t v31 = [&unk_26F37E620 countByEnumeratingWithState:&v44 objects:v61 count:16];
    }
    while (v31);
  }

  objc_destroyWeak(v41);
  objc_destroyWeak(v40);
  objc_destroyWeak(v39);
  objc_destroyWeak(v38);
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
}

void __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _presentDocument:v3];
}

void __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _presentAlert:v3];
}

void __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _beginAuthentication];
}

void __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelValidation];
}

void __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "App.onLaunch() callback called.", v11, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained applicationReadyCallback];

    if (v9)
    {
      [v8 _applicationReadyWithSuccess:a2 javascriptErrorValue:v5];
      [v8 setApplicationReadyCallback:0];
    }
    else
    {
      uint64_t v10 = [v8 application];
      [v10 sendErrorWithMessage:@"The onLaunch callback can only be called once."];
    }
  }
}

- (void)applicationDidStart:(id)a3
{
  id v3 = [(VSApplicationController *)self stateMachine];
  [v3 enqueueEvent:@"Application did start"];
}

- (void)application:(id)a3 startDidFailWithError:(id)a4
{
  VSPublicError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(VSApplicationController *)self setDelegateError:v6];
  id v5 = [(VSApplicationController *)self stateMachine];
  [v5 enqueueEvent:@"Application failed to start"];
}

- (id)activeAppDocumentForApplication:(id)a3
{
  id v3 = [(VSApplicationController *)self appDocumentController];
  id v4 = [v3 appDocument];

  return v4;
}

- (void)appDocumentController:(id)a3 didUpdateViewModel:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Document controller did update view model: %@", (uint8_t *)&v7, 0xCu);
  }

  [(VSApplicationController *)self _notifyDidReceiveViewModel:v5];
}

- (void)appDocumentController:(id)a3 didFailToUpdateViewModelWithError:(id)a4
{
  id v5 = a4;
  id v6 = VSErrorLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[VSApplicationController appDocumentController:didFailToUpdateViewModelWithError:]();
  }

  [(VSApplicationController *)self _notifyDidReceiveViewModelError:v5];
}

- (void)appDocumentController:(id)a3 didUpdateLogoViewModel:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Document controller did update logo view model: %@", (uint8_t *)&v7, 0xCu);
  }

  [(VSApplicationController *)self _notifyDidUpdateLogoViewModel:v5];
}

- (void)_presentDocument:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(VSApplicationController *)self allowUI])
  {
    id v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Will create app document in -[%@ %@]", buf, 0x16u);
    }
    uint64_t v10 = [(VSApplicationController *)self application];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__VSApplicationController__presentDocument___block_invoke;
    v13[3] = &unk_265077520;
    void v13[4] = self;
    v13[5] = a2;
    [v10 appDocumentForDocument:v5 completionHandler:v13];
  }
  else
  {
    uint64_t v11 = VSErrorLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[VSApplicationController _presentDocument:]();
    }

    id v12 = [(VSApplicationController *)self application];
    [v12 sendErrorWithMessage:@"The App.presentDocument function cannot be called in the current context."];
  }
}

void __44__VSApplicationController__presentDocument___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)long long buf = 138412802;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Did create app document [%@] in -[%@ %@]", buf, 0x20u);
  }
  id v8 = v3;
  VSPerformBlockOnMainThread();
}

void __44__VSApplicationController__presentDocument___block_invoke_235(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v10 = 0;
  id v3 = +[VSAppDocumentControllerFactory appDocumentControllerForAppDocument:v2 error:&v10];
  id v4 = v10;
  [v3 setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setAppDocumentController:v3];
  if (v3)
  {
    id v5 = [v3 viewModel];
    if (v5)
    {
      if ([*(id *)(a1 + 40) applicationMustSelfValidate]) {
        [v5 setPreValidate:1];
      }
      [*(id *)(a1 + 40) _notifyDidReceiveViewModel:v5];
    }
    else
    {
      uint64_t v7 = [v3 viewModelError];

      id v8 = VSErrorLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __44__VSApplicationController__presentDocument___block_invoke_235_cold_2();
      }

      uint64_t v9 = VSPublicError();
      [*(id *)(a1 + 40) _notifyDidReceiveViewModelError:v9];

      id v4 = (id)v7;
    }
  }
  else
  {
    id v6 = VSErrorLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__VSApplicationController__presentDocument___block_invoke_235_cold_1();
    }

    id v5 = VSPublicError();
    [*(id *)(a1 + 40) _notifyDidReceiveViewModelError:v5];
  }
}

- (void)_presentAlert:(id)a3
{
  id v4 = a3;
  if ([(VSApplicationController *)self allowUI])
  {
    id v5 = [(VSApplicationController *)self _applicationControllerAlertForJavascriptAlert:v4];
    id v6 = [(VSApplicationController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v8 = v6;
      id v9 = v5;
      VSPerformBlockOnMainThread();
    }
  }
  else
  {
    uint64_t v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[VSApplicationController _presentAlert:]();
    }

    id v5 = [(VSApplicationController *)self application];
    [v5 sendErrorWithMessage:@"The App.presentAlert function cannot be called in the current context."];
  }
}

uint64_t __41__VSApplicationController__presentAlert___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applicationController:*(void *)(a1 + 40) requestsAlert:*(void *)(a1 + 48)];
}

- (void)_beginAuthentication
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Application called App.beginAuthentication when it is not allowed to show UI", v2, v3, v4, v5, v6);
}

void __47__VSApplicationController__beginAuthentication__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appDocumentController];
  uint64_t v1 = [v2 viewModel];
  if (![v1 validationState] || objc_msgSend(v1, "validationState") == 1) {
    [v1 setValidationState:2];
  }
}

- (void)_cancelValidation
{
  if ([(VSApplicationController *)self allowUI]) {
    VSPerformBlockOnMainThread();
  }
}

void __44__VSApplicationController__cancelValidation__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appDocumentController];
  uint64_t v1 = [v2 viewModel];
  if ([v1 validationState] == 1) {
    [v1 setValidationState:0];
  }
}

- (void)_submitJavascriptRequest:(id)a3 forApplicationControllerRequest:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[VSApplicationController _submitJavascriptRequest:forApplicationControllerRequest:]";
    _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  id v9 = (void *)[v6 copy];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  objc_initWeak(&location, self);
  id v10 = [(VSApplicationController *)self application];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke;
  v18[3] = &unk_265077598;
  objc_copyWeak(&v22, &location);
  id v11 = v7;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  p_long long buf = &buf;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke_2;
  v14[3] = &unk_2650775C0;
  objc_copyWeak(&v17, &location);
  __int16 v16 = &buf;
  id v13 = v11;
  id v15 = v13;
  [v10 evaluate:v18 completionHandler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v20 = "-[VSApplicationController _submitJavascriptRequest:forApplicationControllerRequest:]_block_invoke";
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Beginning evaluation of JavaScript in %s", buf, 0xCu);
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"App"];
  if ([v5 hasProperty:@"onRequest"])
  {
    id v6 = (void *)MEMORY[0x263F10390];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke_252;
    v13[3] = &unk_265077570;
    objc_copyWeak(&v15, (id *)(a1 + 56));
    id v14 = *(id *)(a1 + 32);
    id v7 = (void *)MEMORY[0x2455D84D0](v13);
    id v8 = [v6 valueWithObject:v7 inContext:v3];

    uint64_t v9 = *(void *)(a1 + 40);
    v17[0] = @"request";
    v17[1] = @"callback";
    v18[0] = v9;
    v18[1] = v8;
    id v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    __int16 v16 = v10;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    id v12 = (id)[v5 invokeMethod:@"onRequest" withArguments:v11];

    objc_destroyWeak(&v15);
  }
}

void __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _completeRequest:*(void *)(a1 + 32) withJavascriptResponse:v7 javascriptErrorValue:v6];
}

void __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[VSApplicationController _submitJavascriptRequest:forApplicationControllerRequest:]_block_invoke_2";
    _os_log_impl(&dword_23F9AB000, v2, OS_LOG_TYPE_DEFAULT, "Finished evaluation of JavaScript in %s", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = [WeakRetained application];
    [v5 sendErrorWithMessage:@"The App.onRequest function must be defined."];

    id v6 = VSPrivateError();
    id v7 = VSPublicError();
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [MEMORY[0x263F1E208] failableWithError:v7];
    [v4 _completeRequest:v8 withResult:v9];
  }
}

- (void)_applicationReadyWithSuccess:(BOOL)a3 javascriptErrorValue:(id)a4
{
  if (a3)
  {
    uint64_t v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Application is ready.", buf, 2u);
    }

    id v6 = [(VSApplicationController *)self application];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __77__VSApplicationController__applicationReadyWithSuccess_javascriptErrorValue___block_invoke;
    v10[3] = &unk_265077438;
    v10[4] = self;
    [v6 evaluate:v10 completionHandler:&__block_literal_global_259];

    id v7 = [(VSApplicationController *)self stateMachine];
    [v7 enqueueEvent:@"onLaunch callback succeeded"];
  }
  else
  {
    uint64_t v8 = [(VSApplicationController *)self _errorForJavascriptErrorValueValue:a4 withRequest:0];
    uint64_t v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[VSApplicationController _applicationReadyWithSuccess:javascriptErrorValue:]();
    }

    id v7 = v8;
    VSPerformBlockOnMainThread();
  }
}

void __77__VSApplicationController__applicationReadyWithSuccess_javascriptErrorValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"App"];
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 hasProperty:@"onValidate"];
    id v6 = VSDefaultLogObject();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Application has onSubmit callback.", buf, 2u);
      }

      [*(id *)(a1 + 32) setApplicationMustSelfValidate:1];
    }
    else
    {
      if (v7)
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Application does not have onSubmit callback.", v8, 2u);
      }
    }
  }
}

void __77__VSApplicationController__applicationReadyWithSuccess_javascriptErrorValue___block_invoke_260(uint64_t a1)
{
  [*(id *)(a1 + 32) setOnLaunchError:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 enqueueEvent:@"onLaunch callback failed"];
}

- (void)_completeRequest:(id)a3 withJavascriptResponse:(id)a4 javascriptErrorValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [(VSApplicationController *)self responseHandler];
    uint64_t v12 = [v8 type];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __88__VSApplicationController__completeRequest_withJavascriptResponse_javascriptErrorValue___block_invoke;
    v16[3] = &unk_265077608;
    v16[4] = self;
    id v17 = v8;
    [v11 handleJavascriptResponse:v9 requestType:v12 completionHandler:v16];
  }
  else
  {
    id v13 = [(VSApplicationController *)self _errorForJavascriptErrorValueValue:v10 withRequest:v8];
    id v14 = VSErrorLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[VSApplicationController _completeRequest:withJavascriptResponse:javascriptErrorValue:]();
    }

    id v15 = [MEMORY[0x263F1E208] failableWithError:v13];
    [(VSApplicationController *)self _completeRequest:v8 withResult:v15];
  }
}

void __88__VSApplicationController__completeRequest_withJavascriptResponse_javascriptErrorValue___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__VSApplicationController__completeRequest_withJavascriptResponse_javascriptErrorValue___block_invoke_3;
  v4[3] = &unk_265076EB8;
  v4[4] = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 unwrapObject:&__block_literal_global_263 error:v4];
  [*(id *)(a1 + 32) _completeRequest:*(void *)(a1 + 40) withResult:v3];
}

void __88__VSApplicationController__completeRequest_withJavascriptResponse_javascriptErrorValue___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = [a2 debugDescription];
  id v3 = [*(id *)(a1 + 32) application];
  [v3 sendErrorWithMessage:v4];
}

- (void)_completeRequest:(id)a3 withResult:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  VSPerformBlockOnMainThread();
}

void __55__VSApplicationController__completeRequest_withResult___block_invoke(void *a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__VSApplicationController__completeRequest_withResult___block_invoke_2;
  v7[3] = &unk_265077630;
  id v2 = (void *)a1[4];
  id v3 = (void *)a1[6];
  void v7[4] = a1[5];
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__VSApplicationController__completeRequest_withResult___block_invoke_265;
  v5[3] = &unk_265077658;
  id v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [v2 unwrapObject:v7 error:v5];
}

void __55__VSApplicationController__completeRequest_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Will notify request did complete.", buf, 2u);
  }

  [*(id *)(a1 + 32) _notifyRequest:*(void *)(a1 + 40) didCompleteWithResponse:v3];
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Did notify request did complete.", v6, 2u);
  }
}

void __55__VSApplicationController__completeRequest_withResult___block_invoke_265(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Will notify request did fail: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) _notifyRequest:*(void *)(a1 + 40) didFailWithError:v3];
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Did notify request did fail: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_notifyRequest:(id)a3 didCompleteWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  VSRequireMainThread();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__VSApplicationController__notifyRequest_didCompleteWithResponse___block_invoke;
  v10[3] = &unk_265077548;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(VSApplicationController *)self _notifyDelegateWithBlock:v10];
}

void __66__VSApplicationController__notifyRequest_didCompleteWithResponse___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 applicationController:*(void *)(a1 + 32) request:*(void *)(a1 + 40) didCompleteWithResponse:*(void *)(a1 + 48)];
}

- (void)_notifyDidReceiveViewModel:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__VSApplicationController__notifyDidReceiveViewModel___block_invoke;
  v6[3] = &unk_265076FD0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VSApplicationController *)self _notifyDelegateWithBlock:v6];
}

void __54__VSApplicationController__notifyDidReceiveViewModel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 applicationController:*(void *)(a1 + 32) didReceiveViewModel:*(void *)(a1 + 40)];
}

- (void)_notifyDidReceiveViewModelError:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__VSApplicationController__notifyDidReceiveViewModelError___block_invoke;
  v6[3] = &unk_265076FD0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VSApplicationController *)self _notifyDelegateWithBlock:v6];
}

void __59__VSApplicationController__notifyDidReceiveViewModelError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 applicationController:*(void *)(a1 + 32) didReceiveViewModelError:*(void *)(a1 + 40)];
}

- (void)_notifyRequest:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  VSRequireMainThread();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__VSApplicationController__notifyRequest_didFailWithError___block_invoke;
  v10[3] = &unk_265077548;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(VSApplicationController *)self _notifyDelegateWithBlock:v10];
}

void __59__VSApplicationController__notifyRequest_didFailWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 applicationController:*(void *)(a1 + 32) request:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 48)];
}

- (void)_notifyDidStart
{
  VSRequireMainThread();
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__VSApplicationController__notifyDidStart__block_invoke;
  v3[3] = &unk_265076A18;
  v3[4] = self;
  [(VSApplicationController *)self _notifyDelegateWithBlock:v3];
}

void __42__VSApplicationController__notifyDidStart__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 applicationControllerDidStart:*(void *)(a1 + 32)];
}

- (void)_notifyStartDidFailWithError:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__VSApplicationController__notifyStartDidFailWithError___block_invoke;
  v6[3] = &unk_265076FD0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VSApplicationController *)self _notifyDelegateWithBlock:v6];
}

void __56__VSApplicationController__notifyStartDidFailWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 applicationController:*(void *)(a1 + 32) startDidFailWithError:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateWithBlock:(id)a3
{
  id v3 = (void (**)(void))a3;
  VSRequireMainThread();
  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The block parameter must not be nil."];
  }
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Application controller will notify delegate.", v5, 2u);
  }

  v3[2](v3);
}

- (void)_notifyDidUpdateLogoViewModel:(id)a3
{
  id v5 = a3;
  id v4 = [(VSApplicationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 applicationController:self didUpdateLogoViewModel:v5];
  }
}

- (id)_bootURL
{
  id v3 = [(VSApplicationController *)self preferences];
  id v4 = [v3 overridingAppBootURL];

  if (!v4)
  {
    id v4 = [(VSApplicationController *)self fetchedURL];
  }
  id v5 = [MEMORY[0x263F1E250] optionalWithObject:v4];

  return v5;
}

- (id)_applicationLaunchParams
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(VSApplicationController *)self identityProvider];
  id v5 = [v4 authenticationURL];
  id v6 = [v5 absoluteString];

  if (v6) {
    [v3 setObject:v6 forKey:@"location"];
  }
  id v7 = [(VSApplicationController *)self userAccounts];

  if (v7)
  {
    id v8 = [(VSApplicationController *)self userAccounts];

    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self userAccounts] parameter must not be nil."];
    }
    id v9 = [(VSApplicationController *)self userAccounts];
    id v10 = [MEMORY[0x263F1E1C0] applicationUserAccountsFromUserAccounts:v9];
    [v3 setObject:v10 forKey:@"userAccounts"];
  }
  id v11 = [(VSApplicationController *)self applicationReadyCallback];
  if (v11) {
    [v3 setObject:v11 forKey:@"callback"];
  }
  id v12 = [(VSApplicationController *)self identityProvider];
  id v13 = [v12 userToken];

  if (v13)
  {
    id v14 = [(VSApplicationController *)self identityProvider];
    id v15 = [v14 userToken];

    if (!v15) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [[self identityProvider] userToken] parameter must not be nil."];
    }
    __int16 v16 = [(VSApplicationController *)self identityProvider];
    id v17 = [v16 userToken];

    uint64_t v18 = VSDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(VSApplicationController *)self identityProvider];
      id v20 = [v19 providerID];
      int v24 = 138412546;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      _os_log_impl(&dword_23F9AB000, v18, OS_LOG_TYPE_DEFAULT, "Add userToken %@ in %@'s js launch params", (uint8_t *)&v24, 0x16u);
    }
    [v3 setObject:v17 forKey:@"userToken"];
  }
  uint64_t v21 = [(VSApplicationController *)self accountProviderAuthenticationToken];
  if (v21) {
    [v3 setObject:v21 forKey:@"accountProviderAuthenticationToken"];
  }
  id v22 = (void *)[v3 copy];

  return v22;
}

- (id)_applicationControllerAlertForJavascriptAlert:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v15 = a3;
  __int16 v16 = objc_alloc_init(VSApplicationControllerAlert);
  id v4 = [v15 title];
  [(VSApplicationControllerAlert *)v16 setTitle:v4];

  id v5 = [v15 message];
  [(VSApplicationControllerAlert *)v16 setMessage:v5];

  objc_initWeak(&location, self);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [v15 actions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v18 = *(void *)v22;
    id obj = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = objc_alloc_init(VSApplicationControllerAlertAction);
        id v12 = [v10 title];
        [(VSApplicationControllerAlertAction *)v11 setTitle:v12];

        id v13 = [v10 style];
        [(VSApplicationControllerAlertAction *)v11 setStyle:+[VSApplicationControllerAlertAction styleFromString:v13]];

        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __73__VSApplicationController__applicationControllerAlertForJavascriptAlert___block_invoke;
        v19[3] = &unk_265076DA0;
        objc_copyWeak(&v20, &location);
        v19[4] = v10;
        [(VSApplicationControllerAlertAction *)v11 setCallback:v19];
        [v6 addObject:v11];
        objc_destroyWeak(&v20);
      }
      id v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  [(VSApplicationControllerAlert *)v16 setActions:v6];
  objc_destroyWeak(&location);

  return v16;
}

void __73__VSApplicationController__applicationControllerAlertForJavascriptAlert___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained application];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __73__VSApplicationController__applicationControllerAlertForJavascriptAlert___block_invoke_2;
    v5[3] = &unk_265077438;
    v5[4] = *(void *)(a1 + 32);
    [v4 evaluate:v5 completionHandler:&__block_literal_global_289];
  }
}

void __73__VSApplicationController__applicationControllerAlertForJavascriptAlert___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callback];
  id v1 = (id)[v2 callWithArguments:MEMORY[0x263EFFA68]];
}

void __73__VSApplicationController__applicationControllerAlertForJavascriptAlert___block_invoke_3()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "Did execute callback for alert action.", v1, 2u);
  }
}

- (void)_makeJavascriptRequestForRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The request parameter must not be nil."];
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The completionHandler parameter must not be nil."];
    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  id v9 = objc_alloc_init(MEMORY[0x263F1E2E0]);
  id v10 = (void *)[objc_alloc(MEMORY[0x263F1E2C0]) initWithOperation:v9 timeout:10.0];
  uint64_t v16 = MEMORY[0x263EF8330];
  id v17 = v9;
  uint64_t v18 = v6;
  id v19 = v8;
  id v11 = v8;
  id v12 = v6;
  id v13 = v9;
  id v14 = VSMainThreadOperationWithBlock();
  objc_msgSend(v14, "addDependency:", v10, v16, 3221225472, __82__VSApplicationController__makeJavascriptRequestForRequest_withCompletionHandler___block_invoke, &unk_265077680);
  VSEnqueueCompletionOperation();
  id v15 = [(VSApplicationController *)self privateQueue];
  [v15 addOperation:v10];
}

void __82__VSApplicationController__makeJavascriptRequestForRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) result];
  id v3 = [v2 object];
  id v5 = [v3 object];

  id v4 = [*(id *)(a1 + 40) _javascriptRequestForRequest:*(void *)(a1 + 48) withVerificationData:v5];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_javascriptRequestForRequest:(id)a3 withVerificationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([v6 type])
  {
    case 1:
      uint64_t v8 = VSJSRequestTypeUIAuthN;
      goto LABEL_8;
    case 2:
      uint64_t v8 = VSJSRequestTypeAuthN;
      goto LABEL_8;
    case 3:
      uint64_t v8 = VSJSRequestTypeUserMetadata;
      goto LABEL_8;
    case 4:
      uint64_t v8 = VSJSRequestTypeLogout;
      goto LABEL_8;
    case 5:
      uint64_t v8 = &VSJSRequestTypeSTBOptOut;
LABEL_8:
      id v12 = *v8;
      break;
    default:
      id v9 = (void *)MEMORY[0x263EFF940];
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "type"));
      [v9 raise:v10, @"Unexpected request type: %@", v11 format];

      id v12 = 0;
      break;
  }
  id v13 = [v6 authenticationToken];
  id v14 = [v6 SAMLRequest];
  id v15 = [v6 requestorVerificationToken];
  uint64_t v16 = [v6 attributeNames];
  id v17 = [v7 base64EncodedStringWithOptions:0];

  if (![v17 length])
  {

    id v17 = 0;
  }
  uint64_t v18 = [(VSApplicationController *)self _makeJavaScriptRequest];
  [v18 setRequestType:v12];
  [v18 setRequestBody:v14];
  [v18 setCurrentAuthentication:v13];
  [v18 setRequestorVerificationToken:v15];
  [v18 setAttributeNames:v16];
  [v18 setAppleVerificationToken:v17];

  return v18;
}

- (id)_errorForJavascriptErrorValueValue:(id)a3 withRequest:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    BOOL v8 = [v6 type] == 1;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = [v5 toObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = VSDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412290;
      id v39 = v5;
      _os_log_impl(&dword_23F9AB000, v10, OS_LOG_TYPE_DEFAULT, "Application passed an error object: %@", (uint8_t *)&v38, 0xCu);
    }

    id v11 = objc_alloc_init(VSJSError);
    id v12 = [v5 valueForProperty:@"code"];
    -[VSJSError setCode:](v11, "setCode:", [v12 toUInt32]);
    id v13 = [v5 valueForProperty:@"message"];
    id v14 = [v13 toString];
    [(VSJSError *)v11 setMessage:v14];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    id v15 = VSErrorLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[VSApplicationController _errorForJavascriptErrorValueValue:withRequest:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    if (!v9) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The errorObject parameter must not be nil."];
    }
    if (v8) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = 4;
    }
    id v12 = v9;
    id v11 = objc_alloc_init(VSJSError);
    [(VSJSError *)v11 setCode:v23];
    [(VSJSError *)v11 setMessage:v12];
  }

  if (v11)
  {
    long long v24 = v11;
    uint64_t v25 = [(VSJSError *)v24 error];
    switch([(VSJSError *)v24 code])
    {
      case 1uLL:
        if (v8) {
          goto LABEL_28;
        }
        v30 = VSErrorLogObject();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[VSApplicationController _errorForJavascriptErrorValueValue:withRequest:]();
        }
        goto LABEL_34;
      case 2uLL:
LABEL_28:
        uint64_t v29 = VSPrivateError();
        goto LABEL_36;
      case 3uLL:
        uint64_t v29 = VSInvalidVerificationTokenError();
        goto LABEL_36;
      case 4uLL:
        goto LABEL_35;
      default:
        v30 = VSErrorLogObject();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[VSApplicationController _errorForJavascriptErrorValueValue:withRequest:](v30, v31, v32, v33, v34, v35, v36, v37);
        }
LABEL_34:

LABEL_35:
        uint64_t v29 = VSPublicServiceTemporarilyUnavailableError();
LABEL_36:
        uint64_t v27 = (void *)v29;

        if (!v27) {
          goto LABEL_24;
        }
        goto LABEL_25;
    }
  }
LABEL_21:
  __int16 v26 = VSErrorLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[VSApplicationController _errorForJavascriptErrorValueValue:withRequest:]();
  }

  uint64_t v27 = VSPublicServiceTemporarilyUnavailableError();
  if (!v27) {
LABEL_24:
  }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The errorOrNil parameter must not be nil."];
LABEL_25:

  return v27;
}

- (id)_makeJavaScriptRequest
{
  id v3 = [VSJSRequest alloc];
  id v4 = [(VSApplicationController *)self application];
  id v5 = [v4 appContext];
  id v6 = [(IKJSObject *)v3 initWithAppContext:v5];

  return v6;
}

- (VSApplicationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSApplicationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (NSArray)userAccounts
{
  return self->_userAccounts;
}

- (void)setUserAccounts:(id)a3
{
}

- (NSString)accountProviderAuthenticationToken
{
  return self->_accountProviderAuthenticationToken;
}

- (void)setAccountProviderAuthenticationToken:(id)a3
{
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSError)delegateError
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDelegateError:(id)a3
{
}

- (NSError)onLaunchError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOnLaunchError:(id)a3
{
}

- (NSURL)fetchedURL
{
  return self->_fetchedURL;
}

- (void)setFetchedURL:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSApplication)application
{
  return (VSApplication *)objc_getProperty(self, a2, 96, 1);
}

- (void)setApplication:(id)a3
{
}

- (VSApplicationControllerResponseHandler)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (VSAppDocumentController)appDocumentController
{
  return self->_appDocumentController;
}

- (void)setAppDocumentController:(id)a3
{
}

- (JSValue)applicationReadyCallback
{
  return self->_applicationReadyCallback;
}

- (void)setApplicationReadyCallback:(id)a3
{
}

- (BOOL)applicationMustSelfValidate
{
  return self->_applicationMustSelfValidate;
}

- (void)setApplicationMustSelfValidate:(BOOL)a3
{
  self->_applicationMustSelfValidate = a3;
}

- (BOOL)allowUI
{
  return self->_allowUI;
}

- (void)setAllowUI:(BOOL)a3
{
  self->_allowUI = a3;
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_applicationReadyCallback, 0);
  objc_storeStrong((id *)&self->_appDocumentController, 0);
  objc_storeStrong((id *)&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_fetchedURL, 0);
  objc_storeStrong((id *)&self->_onLaunchError, 0);
  objc_storeStrong((id *)&self->_delegateError, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_accountProviderAuthenticationToken, 0);
  objc_storeStrong((id *)&self->_userAccounts, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_147_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Error fetching boot URL: %@", v2, v3, v4, v5, v6);
}

void __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Error fetching developer settings for cachebuster setting: %@", v2, v3, v4, v5, v6);
}

- (void)appDocumentController:didFailToUpdateViewModelWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Document controller failed to update view model: %@", v2, v3, v4, v5, v6);
}

- (void)_presentDocument:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Application called App.presentDocument when it is not allowed to show UI", v2, v3, v4, v5, v6);
}

void __44__VSApplicationController__presentDocument___block_invoke_235_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Unable to create application document controller for app document: %@", v2, v3, v4, v5, v6);
}

void __44__VSApplicationController__presentDocument___block_invoke_235_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Unable to create view model: %@", v2, v3, v4, v5, v6);
}

- (void)_presentAlert:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Application called App.presentAlert when it is not allowed to show UI.", v2, v3, v4, v5, v6);
}

- (void)_applicationReadyWithSuccess:javascriptErrorValue:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Application failed to become ready: %@", v2, v3, v4, v5, v6);
}

- (void)_completeRequest:withJavascriptResponse:javascriptErrorValue:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Application responded to request with error: %@", v2, v3, v4, v5, v6);
}

- (void)_errorForJavascriptErrorValueValue:withRequest:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Application did not return an error object or string. Returning VSErrorCodeServiceTemporarilyUnavailable", v2, v3, v4, v5, v6);
}

- (void)_errorForJavascriptErrorValueValue:(uint64_t)a3 withRequest:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23F9AB000, a1, a3, "Application returned an error with an unknown error code: %@", a5, a6, a7, a8, 2u);
}

- (void)_errorForJavascriptErrorValueValue:withRequest:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Application returned an authentication error (VSJSErrorCodeUIAuthenticationFailure) when we are not processing a UI authentication request. Returning VSErrorCodeServiceTemporarilyUnavailable", v2, v3, v4, v5, v6);
}

- (void)_errorForJavascriptErrorValueValue:(uint64_t)a3 withRequest:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end