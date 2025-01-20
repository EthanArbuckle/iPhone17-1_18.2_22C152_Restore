@interface SUApplication
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 sourceApplication:(id)a5 annotation:(id)a6;
- (BOOL)applicationSuspendWithSettings:(id)a3;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (SUApplication)init;
- (UIColor)interactionTintColor;
- (double)defaultImageSnapshotExpiration;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)_applicationDidFinishLaunching:(id)a3;
- (void)_exitForStoreNotAvailable;
- (void)_exitIfStoreNotAvailable;
- (void)_runScriptTestWithOptions:(id)a3;
- (void)_setupUI;
- (void)_teardownUI;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)dealloc;
- (void)runTestInvocation:(id)a3;
- (void)setInteractionTintColor:(id)a3;
@end

@implementation SUApplication

- (SUApplication)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUApplication;
  v2 = [(SUApplication *)&v4 init];
  if (v2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__storeEnabledChangeNotification_, @"SUStoreEnabledChangedNotification", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"SUStoreEnabledChangedNotification", 0);
  [(SUApplication *)self _teardownUI];

  v3.receiver = self;
  v3.super_class = (Class)SUApplication;
  [(SUApplication *)&v3 dealloc];
}

- (void)setInteractionTintColor:(id)a3
{
  if (self->_interactionTintColor != a3)
  {
    objc_super v4 = (UIColor *)[a3 copy];
    self->_interactionTintColor = v4;
    window = self->_window;
    [(UIWindow *)window setInteractionTintColor:v4];
  }
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 sourceApplication:(id)a5 annotation:(id)a6
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v9 = (void *)[a6 objectForKey:*MEMORY[0x263F01828]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = (void *)[v9 absoluteString];
  }
  else {
LABEL_5:
  }
    v9 = 0;
LABEL_6:
  id v10 = +[SUClientApplicationController sharedController];

  return [v10 openClientURL:a4 withSourceApplication:a5 sourceURLString:v9];
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3, a4), "userInterfaceIdiom")) {
    return 30;
  }
  else {
    return 26;
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController", a3), "resignActive");
  if (self->_terminateOnNextSuspend)
  {
    self->_terminateOnNextSuspend = 0;
    [(SUApplication *)self terminateWithSuccess];
  }
}

- (BOOL)applicationSuspendWithSettings:(id)a3
{
  objc_super v4 = objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "copySuspendSettings");
  [a3 addEntriesFromDictionary:v4];

  return 1;
}

- (void)applicationWillEnterForeground:(id)a3
{
  [(SUApplication *)self _setupUI];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "launchedToTest") & 1) == 0) {
    objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "becomeActive");
  }

  [(SUApplication *)self _exitIfStoreNotAvailable];
}

- (double)defaultImageSnapshotExpiration
{
  id v2 = +[SUClientApplicationController sharedController];

  [v2 defaultImageSnapshotExpiration];
  return result;
}

- (void)_applicationDidFinishLaunching:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
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
    int v13 = 138412546;
    uint64_t v14 = objc_opt_class();
    __int16 v15 = 2048;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    LODWORD(v12) = 22;
    v11 = &v13;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v13, v12);
      free(v9);
      v11 = (int *)v10;
      SSFileLog();
    }
  }
  [(SUApplication *)self _setupUI];
  if (([a3 launchedToTest] & 1) == 0) {
    objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "becomeActive");
  }
}

- (void)_exitForStoreNotAvailable
{
  id v3 = +[SUClientApplicationController sharedController];
  [v3 cancelAllOperations];
  objc_super v4 = objc_alloc_init(SULockoutViewController);
  -[SUViewController setClientInterface:](v4, "setClientInterface:", [v3 clientInterface]);
  v5 = [[SUNavigationController alloc] initWithRootViewController:v4];
  -[SUNavigationController setClientInterface:](v5, "setClientInterface:", [v3 clientInterface]);
  objc_msgSend((id)objc_msgSend(v3, "tabBarController"), "setTransientViewController:animated:", v5, 0);

  self->_terminateOnNextSuspend = 1;
  int v6 = +[SUDialogManager sharedInstance];
  -[SUDialogManager presentDialog:](v6, "presentDialog:", [MEMORY[0x263F89488] ITunesStoreNotAvailableDialog]);

  [v3 exitStoreAfterDialogsDismiss];
}

- (void)_exitIfStoreNotAvailable
{
  id v3 = (void *)[MEMORY[0x263F89540] sharedCache];
  if (objc_msgSend(v3, "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0))
    && (objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "isStoreEnabled") & 1) == 0)
  {
    [(SUApplication *)self _exitForStoreNotAvailable];
  }
}

- (void)_setupUI
{
  window = self->_window;
  if (!window)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CBC8]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    v5 = (UIWindow *)objc_msgSend(v4, "initWithFrame:");
    self->_window = v5;
    [(UIWindow *)v5 setAutoresizingMask:18];
    [(UIWindow *)self->_window setInteractionTintColor:self->_interactionTintColor];
    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "tabBarController"));
    window = self->_window;
  }

  [(UIWindow *)window makeKeyAndVisible];
}

- (void)_teardownUI
{
  self->_window = 0;
}

- (UIColor)interactionTintColor
{
  return self->_interactionTintColor;
}

- (void)runTestInvocation:(id)a3
{
  [(SUApplication *)self startedTest:__CurrentTestName];
  char v5 = 0;
  [a3 invoke];
  [a3 getReturnValue:&v5];
  if (v5) {
    [(UIApplication *)self endCurrentPPT];
  }
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v13 = a4;
  uint64_t v7 = [a4 setupSelector];
  uint64_t v8 = [a4 testSelector];
  if (v7 | v8)
  {
    uint64_t v9 = v8;
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0 || v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(UIApplication *)self beginPPTWithName:a3];
      uint64_t v10 = objc_msgSend(MEMORY[0x263EFF958], "invocationWithMethodSignature:", -[SUApplication methodSignatureForSelector:](self, "methodSignatureForSelector:", v9));
      [v10 setSelector:v9];
      [v10 setTarget:self];
      [v10 setArgument:&v13 atIndex:2];
      [v10 retainArguments];
      if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [(SUApplication *)self performSelector:v7 withObject:v13];
        [(SUApplication *)self performSelector:sel_runTestInvocation_ withObject:v10 afterDelay:1.0];
      }
      else
      {
        [(SUApplication *)self runTestInvocation:v10];
      }
      return 1;
    }
LABEL_12:
    v12.receiver = self;
    v12.super_class = (Class)SUApplication;
    return [(SUApplication *)&v12 runTest:a3 options:a4];
  }
  if (![a4 scriptPath] || !objc_msgSend(a4, "scriptEntry")) {
    goto LABEL_12;
  }
  [(SUApplication *)self _runScriptTestWithOptions:a4];
  return 1;
}

- (void)_runScriptTestWithOptions:(id)a3
{
  id v4 = +[SUClientDispatch scriptExecutionContext];
  id v5 = (id)_runScriptTestWithOptions__scriptsLoaded;
  if (!_runScriptTestWithOptions__scriptsLoaded)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    _runScriptTestWithOptions__scriptsLoaded = (uint64_t)v5;
  }
  if (!objc_msgSend(v5, "member:", objc_msgSend(a3, "scriptPath")))
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundlePath"), "stringByAppendingPathComponent:", objc_msgSend(a3, "scriptPath"));
    objc_msgSend(v4, "evaluateData:MIMEType:textEncodingName:baseURL:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfFile:options:error:", v6, 1, 0), @"text/javascript", 0, 0);
    objc_msgSend((id)_runScriptTestWithOptions__scriptsLoaded, "addObject:", objc_msgSend(a3, "scriptPath"));
  }
  WebThreadRun();
}

void __50__SUApplication_SUPPT___runScriptTestWithOptions___block_invoke(uint64_t a1)
{
  id v4 = [[SUScriptDictionary alloc] initWithDictionary:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) scriptEntry];
  objc_msgSend(v2, "callWebScriptMethod:withArguments:", v3, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v4));
}

@end