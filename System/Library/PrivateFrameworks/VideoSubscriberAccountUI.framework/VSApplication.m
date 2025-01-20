@interface VSApplication
- (BOOL)appContext:(id)a3 validateDOMDocument:(id)a4 inContext:(id)a5 error:(id *)a6;
- (BOOL)appIsTrusted;
- (BOOL)canRequireSystemTrust;
- (BOOL)shouldAllowRemoteInspection;
- (BOOL)shouldIgnoreJSValidation;
- (IKAppContext)appContext;
- (NSError)failureToStart;
- (NSHTTPCookieStorage)cookieStorage;
- (NSString)vendorIdentifier;
- (NSURL)bootURL;
- (VSAppDeviceConfig)appDeviceConfig;
- (VSApplication)init;
- (VSApplication)initWithBootURL:(id)a3;
- (VSApplicationDelegate)delegate;
- (VSAuditToken)auditToken;
- (VSStateMachine)stateMachine;
- (id)activeDocument;
- (id)appIdentifier;
- (id)appLaunchParams;
- (id)localStorage;
- (id)objectForMediaItem:(id)a3;
- (id)objectForPlayer:(id)a3;
- (id)objectForPlaylist:(id)a3;
- (id)sourceApplicationAuditTokenDataForContext:(id)a3;
- (id)sourceApplicationBundleIdentifierForContext:(id)a3;
- (id)userDefaultsStorage;
- (id)vendorStorage;
- (id)viewElementRegistry;
- (id)xhrSessionConfigurationForContext:(id)a3;
- (void)appContext:(id)a3 didFailWithError:(id)a4;
- (void)appContext:(id)a3 didStartWithOptions:(id)a4;
- (void)appContext:(id)a3 didStopWithOptions:(id)a4;
- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)appDocumentForDocument:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)evaluate:(id)a3 completionHandler:(id)a4;
- (void)release;
- (void)sendErrorWithMessage:(id)a3;
- (void)setAppContext:(id)a3;
- (void)setAppDeviceConfig:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setCanRequireSystemTrust:(BOOL)a3;
- (void)setCookieStorage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFailureToStart:(id)a3;
- (void)setShouldAllowRemoteInspection:(BOOL)a3;
- (void)setStateMachine:(id)a3;
- (void)setVendorIdentifier:(id)a3;
- (void)start;
- (void)stop;
- (void)transitionToInvalidState;
- (void)transitionToNotifyingOfFailureToStartState;
- (void)transitionToReadyState;
- (void)transitionToStartingState;
- (void)transitionToStoppingState;
- (void)willPerformXhrRequest:(id)a3;
@end

@implementation VSApplication

- (void)release
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v4.receiver = self;
    v4.super_class = (Class)VSApplication;
    [(VSApplication *)&v4 release];
  }
  else
  {
    v3 = MEMORY[0x263EF83A0];
    dispatch_sync_f(v3, self, VSMainThreadRelease);
  }
}

- (VSApplication)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSApplication)initWithBootURL:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The bootURL parameter must not be nil."];
  }
  v13.receiver = self;
  v13.super_class = (Class)VSApplication;
  v5 = [(VSApplication *)&v13 init];
  if (v5)
  {
    v6 = objc_alloc_init(VSAppDeviceConfig);
    appDeviceConfig = v5->_appDeviceConfig;
    v5->_appDeviceConfig = v6;

    uint64_t v8 = [v4 copy];
    bootURL = v5->_bootURL;
    v5->_bootURL = (NSURL *)v8;

    id v10 = objc_alloc_init(MEMORY[0x263F1E298]);
    [v10 setName:@"VSApplication"];
    [v10 setDestinationState:@"Starting" forEvent:@"Start" inState:@"Initial"];
    [v10 setDestinationState:@"Notifying of failure to start" forEvent:@"Failed to start" inState:@"Starting"];
    [v10 setDestinationState:@"Ready" forEvent:@"Finished starting" inState:@"Starting"];
    [v10 setDestinationState:@"Waiting to stop" forEvent:@"Stop" inState:@"Starting"];
    [v10 ignoreEvent:@"Stop" inState:@"Notifying of failure to start"];
    [v10 setDestinationState:@"Invalid" forEvent:@"Finished notifying of failure to start" inState:@"Notifying of failure to start"];
    [v10 ignoreEvent:@"Stop" inState:@"Waiting to stop"];
    [v10 setDestinationState:@"Stopping" forEvent:@"Finished starting" inState:@"Waiting to stop"];
    [v10 setDestinationState:@"Invalid" forEvent:@"Failed to start" inState:@"Waiting to stop"];
    [v10 setDestinationState:@"Stopping" forEvent:@"Stop" inState:@"Ready"];
    [v10 ignoreEvent:@"Stop" inState:@"Stopping"];
    [v10 setDestinationState:@"Invalid" forEvent:@"Finished stopping" inState:@"Stopping"];
    [v10 ignoreEvent:@"Stop" inState:@"Invalid"];
    [v10 setDelegate:v5];
    [v10 activateWithState:@"Initial"];
    stateMachine = v5->_stateMachine;
    v5->_stateMachine = (VSStateMachine *)v10;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating application: %p", buf, 0xCu);
  }

  VSRequireMainThread();
  v4.receiver = self;
  v4.super_class = (Class)VSApplication;
  [(VSApplication *)&v4 dealloc];
}

- (void)transitionToStartingState
{
}

void __42__VSApplication_transitionToStartingState__block_invoke(uint64_t a1)
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F4B3C8]) initWithApplication:*(void *)(a1 + 32) mode:0 delegate:*(void *)(a1 + 32)];
  objc_msgSend(v3, "setCanRequireSystemTrustForXHRs:", objc_msgSend(*(id *)(a1 + 32), "canRequireSystemTrust"));
  [*(id *)(a1 + 32) setAppContext:v3];
  v2 = [*(id *)(a1 + 32) appContext];
  [v2 start];
}

- (void)transitionToNotifyingOfFailureToStartState
{
}

void __59__VSApplication_transitionToNotifyingOfFailureToStartState__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  id v3 = *(void **)(a1 + 32);
  objc_super v4 = [v3 failureToStart];
  [v2 application:v3 startDidFailWithError:v4];

  [*(id *)(a1 + 32) setFailureToStart:0];
  id v5 = [*(id *)(a1 + 32) stateMachine];
  [v5 enqueueEvent:@"Finished notifying of failure to start"];
}

- (void)transitionToReadyState
{
}

void __39__VSApplication_transitionToReadyState__block_invoke(uint64_t a1)
{
  VSRequireMainThread();
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 applicationDidStart:*(void *)(a1 + 32)];
}

- (void)transitionToStoppingState
{
  id v2 = [(VSApplication *)self appContext];
  [v2 stop];
}

- (void)transitionToInvalidState
{
  [(VSApplication *)self setAppContext:0];
  id v3 = [(VSApplication *)self cookieStorage];
  objc_msgSend(v3, "vs_saveCookies");

  CFRelease(self);
}

- (void)start
{
  id v2 = [(VSApplication *)self stateMachine];
  [v2 enqueueEvent:@"Start"];
}

- (void)stop
{
  id v2 = [(VSApplication *)self stateMachine];
  [v2 enqueueEvent:@"Stop"];
}

- (void)evaluate:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VSApplication *)self appContext];
  [v8 evaluate:v7 completionBlock:v6];
}

- (void)sendErrorWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(VSApplication *)self appContext];
  [v5 setException:0 withErrorMessage:v4];
}

- (void)appDocumentForDocument:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[VSApplication appDocumentForDocument:completionHandler:]";
    _os_log_impl(&dword_23F9AB000, v7, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v8 = [MEMORY[0x263F4B3C8] currentAppContext];
  v9 = [v8 jsContext];
  id v10 = [v9 objectForKeyedSubscript:@"App"];

  id v11 = v10;
  v12 = (void *)[objc_alloc(MEMORY[0x263F4B3D8]) initWithAppContext:v8 document:v6 owner:v11];

  objc_super v13 = VSDefaultLogObject();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[VSApplication appDocumentForDocument:completionHandler:]";
      _os_log_impl(&dword_23F9AB000, v13, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", buf, 0xCu);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__VSApplication_appDocumentForDocument_completionHandler___block_invoke;
    v16[3] = &unk_265077788;
    v18 = v5;
    id v17 = v12;
    __58__VSApplication_appDocumentForDocument_completionHandler___block_invoke((uint64_t)v16);
    v15 = VSDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[VSApplication appDocumentForDocument:completionHandler:]";
      _os_log_impl(&dword_23F9AB000, v15, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", buf, 0xCu);
    }

    objc_super v13 = v18;
  }
  else if (v14)
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[VSApplication appDocumentForDocument:completionHandler:]";
    _os_log_impl(&dword_23F9AB000, v13, OS_LOG_TYPE_DEFAULT, "No completion handler passed to %s", buf, 0xCu);
  }
}

uint64_t __58__VSApplication_appDocumentForDocument_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)appContext:(id)a3 validateDOMDocument:(id)a4 inContext:(id)a5 error:(id *)a6
{
  return 1;
}

- (void)appContext:(id)a3 didStartWithOptions:(id)a4
{
  id v4 = [(VSApplication *)self stateMachine];
  [v4 enqueueEvent:@"Finished starting"];
}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = VSErrorLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[VSApplication appContext:didFailWithError:]((uint64_t)v5, v6);
  }

  [(VSApplication *)self setFailureToStart:v5];
  id v7 = [(VSApplication *)self stateMachine];
  [v7 enqueueEvent:@"Failed to start"];
}

- (void)appContext:(id)a3 didStopWithOptions:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "App context did stop with options: %@.", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(VSApplication *)self stateMachine];
  [v7 enqueueEvent:@"Finished stopping"];
}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v5 = a4;
  id v6 = [(VSApplication *)self delegate];
  [v6 application:self evaluateAppJavascriptInContext:v5];
}

- (id)objectForMediaItem:(id)a3
{
  return 0;
}

- (id)objectForPlaylist:(id)a3
{
  return 0;
}

- (id)objectForPlayer:(id)a3
{
  return 0;
}

- (id)xhrSessionConfigurationForContext:(id)a3
{
  id v4 = [(VSApplication *)self cookieStorage];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F08C00];
    id v6 = [(VSApplication *)self auditToken];
    id v7 = objc_msgSend(v5, "vs_defaultSessionConfigurationForSourceAppWithAuditToken:", v6);

    [v7 setHTTPCookieStorage:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)sourceApplicationBundleIdentifierForContext:(id)a3
{
  id v3 = [(VSApplication *)self auditToken];
  id v4 = [v3 bundleIdentifier];

  return v4;
}

- (id)sourceApplicationAuditTokenDataForContext:(id)a3
{
  id v3 = [(VSApplication *)self auditToken];
  id v4 = [v3 tokenBytes];

  return v4;
}

- (void)willPerformXhrRequest:(id)a3
{
}

- (BOOL)appIsTrusted
{
  return 0;
}

- (BOOL)shouldIgnoreJSValidation
{
  return 1;
}

- (id)appIdentifier
{
  id v2 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)localStorage
{
  return 0;
}

- (id)vendorStorage
{
  return 0;
}

- (id)userDefaultsStorage
{
  return 0;
}

- (id)appLaunchParams
{
  id v3 = [(VSApplication *)self delegate];
  id v4 = [v3 launchParamsForApplication:self];

  return v4;
}

- (id)activeDocument
{
  id v3 = [(VSApplication *)self delegate];
  id v4 = [v3 activeAppDocumentForApplication:self];

  return v4;
}

- (id)viewElementRegistry
{
  if (viewElementRegistry___vs_lazy_init_predicate != -1) {
    dispatch_once(&viewElementRegistry___vs_lazy_init_predicate, &__block_literal_global_11);
  }
  id v2 = (void *)viewElementRegistry___vs_lazy_init_variable;
  return v2;
}

uint64_t __36__VSApplication_viewElementRegistry__block_invoke()
{
  uint64_t v0 = __36__VSApplication_viewElementRegistry__block_invoke_2();
  uint64_t v1 = viewElementRegistry___vs_lazy_init_variable;
  viewElementRegistry___vs_lazy_init_variable = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id __36__VSApplication_viewElementRegistry__block_invoke_2()
{
  [MEMORY[0x263F4B428] registerClass:objc_opt_class() forFeatureName:@"WebMessagePort"];
  id v0 = objc_alloc_init(MEMORY[0x263F4B4E0]);
  [v0 registerClass:objc_opt_class() forElementName:*MEMORY[0x263F1E410] elementType:162];
  [v0 registerClass:objc_opt_class() forElementName:*MEMORY[0x263F1E408] elementType:161];
  [v0 registerClass:objc_opt_class() forElementName:*MEMORY[0x263F1E418] elementType:165];
  [v0 registerClass:objc_opt_class() forElementName:*MEMORY[0x263F1E420] elementType:163];
  [v0 registerClass:objc_opt_class() forElementName:@"accountName" elementType:138];
  [v0 registerClass:objc_opt_class() forElementName:@"buttonLockup" elementType:156];
  [v0 registerClass:objc_opt_class() forElementName:@"description" elementType:138];
  [v0 registerClass:objc_opt_class() forElementName:@"displayLink" elementType:157];
  [v0 registerClass:objc_opt_class() forElementName:0x26F361FB0 elementType:158];
  [v0 registerClass:objc_opt_class() forElementName:@"item" elementType:159];
  [v0 registerClass:objc_opt_class() forElementName:@"img" elementType:49];
  [v0 registerClass:objc_opt_class() forElementName:@"text" elementType:138];
  [v0 registerClass:objc_opt_class() forElementName:@"textField" elementType:140];
  [v0 registerClass:objc_opt_class() forElementName:@"textFieldGroup" elementType:160];
  [v0 registerClass:objc_opt_class() forElementName:@"title" elementType:138];
  [v0 registerClass:objc_opt_class() forElementName:@"twoFactorTextField" elementType:140];
  +[VSIKItemGroup registerFeature];
  return v0;
}

- (NSHTTPCookieStorage)cookieStorage
{
  id v2 = self->_cookieStorage;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x263F08890], "vs_sharedCookieStorage");
    id v2 = (NSHTTPCookieStorage *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The storage parameter must not be nil."];
      id v2 = 0;
    }
  }
  return v2;
}

- (NSURL)bootURL
{
  return self->_bootURL;
}

- (IKAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
}

- (VSApplicationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSApplicationDelegate *)WeakRetained;
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

- (BOOL)canRequireSystemTrust
{
  return self->_canRequireSystemTrust;
}

- (void)setCanRequireSystemTrust:(BOOL)a3
{
  self->_canRequireSystemTrust = a3;
}

- (BOOL)shouldAllowRemoteInspection
{
  return self->_shouldAllowRemoteInspection;
}

- (void)setShouldAllowRemoteInspection:(BOOL)a3
{
  self->_shouldAllowRemoteInspection = a3;
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (VSAppDeviceConfig)appDeviceConfig
{
  return self->_appDeviceConfig;
}

- (void)setAppDeviceConfig:(id)a3
{
}

- (void)setCookieStorage:(id)a3
{
}

- (NSError)failureToStart
{
  return self->_failureToStart;
}

- (void)setFailureToStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureToStart, 0);
  objc_storeStrong((id *)&self->_cookieStorage, 0);
  objc_storeStrong((id *)&self->_appDeviceConfig, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_bootURL, 0);
}

- (void)appContext:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "App context did fail with error: %@", (uint8_t *)&v2, 0xCu);
}

@end