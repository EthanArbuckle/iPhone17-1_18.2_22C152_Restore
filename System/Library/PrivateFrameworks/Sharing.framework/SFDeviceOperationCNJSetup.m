@interface SFDeviceOperationCNJSetup
- (BOOL)isSetup;
- (NSError)reachabilityError;
- (OS_dispatch_queue)dispatchQueue;
- (SFSession)sfSession;
- (UIViewController)presentingViewController;
- (double)metricTotalSeconds;
- (id)completionHandler;
- (id)promptForConfirmationHandler;
- (void)_complete:(id)a3;
- (void)_handleCaptiveNetworkPresentEvent:(id)a3;
- (void)_handleCompletedEventWithError:(id)a3;
- (void)_showCaptiveSheet:(id)a3;
- (void)_startClient;
- (void)activate;
- (void)handleCompleteNotificationWithRedirectURLtype:(int64_t)a3 result:(int64_t)a4;
- (void)handleDismissal;
- (void)handleWebNavigationWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)scrapeCredentialsUsingPOSTMessage:(id)a3 loginURL:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIsSetup:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setPromptForConfirmationHandler:(id)a3;
- (void)setSfSession:(id)a3;
- (void)showWebSheet;
@end

@implementation SFDeviceOperationCNJSetup

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFDeviceOperationCNJSetup_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceOperationCNJSetup_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(void *)(*(void *)(a1 + 32) + 48) = mach_absolute_time();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SFDeviceOperationCNJSetup_activate__block_invoke_2;
  v5[3] = &unk_1E5BBCBF8;
  v5[4] = v2;
  return [v3 sendRequestID:@"_cnj" options:0 request:MEMORY[0x1E4F1CC08] responseHandler:v5];
}

void __37__SFDeviceOperationCNJSetup_activate__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = *(unsigned char **)(a1 + 32);
  if (!v9[56])
  {
    if (v16)
    {
      id v10 = v16;
LABEL_6:
      [v9 _complete:v10];
      goto LABEL_7;
    }
    v11 = [v8 objectForKeyedSubscript:@"done"];

    if (v11)
    {
      v9 = *(unsigned char **)(a1 + 32);
      id v10 = 0;
      goto LABEL_6;
    }
    v12 = [v8 objectForKeyedSubscript:@"re"];
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:0];
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void **)(v14 + 104);
      *(void *)(v14 + 104) = v13;
    }
    [*(id *)(a1 + 32) _startClient];
  }
LABEL_7:
}

- (void)_startClient
{
  id v3 = objc_alloc_init((Class)getSKDeviceClass[0]());
  v4 = [(SFSession *)self->_sfSession peerDevice];
  v5 = [v4 identifier];
  v6 = [v5 UUIDString];
  [v3 setIdentifier:v6];

  id v7 = (SKSetupCaptiveNetworkJoinClient *)objc_alloc_init((Class)getSKSetupCaptiveNetworkJoinClientClass[0]());
  cnjClient = self->_cnjClient;
  self->_cnjClient = v7;

  [(SKSetupCaptiveNetworkJoinClient *)self->_cnjClient setPeerDevice:v3];
  id location = 0;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__SFDeviceOperationCNJSetup__startClient__block_invoke;
  v13[3] = &unk_1E5BC0B80;
  objc_copyWeak(&v14, &location);
  [(SKSetupCaptiveNetworkJoinClient *)self->_cnjClient setSendDataHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__SFDeviceOperationCNJSetup__startClient__block_invoke_2;
  v11[3] = &unk_1E5BC0BA8;
  objc_copyWeak(&v12, &location);
  [(SKSetupCaptiveNetworkJoinClient *)self->_cnjClient setEventHandler:v11];
  v9 = [(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"A2A772B2-84C1-447A-B978-5793FF08E513" keyLength:32];
  if (v9)
  {
    [(SKSetupCaptiveNetworkJoinClient *)self->_cnjClient setPskData:v9];
    [(SFSession *)self->_sfSession registerForExternalIO:self->_cnjClient];
    [(SKSetupCaptiveNetworkJoinClient *)self->_cnjClient activate];
  }
  else
  {
    id v10 = NSErrorWithOSStatusF();
    [(SFDeviceOperationCNJSetup *)self _complete:v10];
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __41__SFDeviceOperationCNJSetup__startClient__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [WeakRetained sfSession];
  [v4 sendExternalIO:v3];
}

void __41__SFDeviceOperationCNJSetup__startClient__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    id v6 = v7;
    LogPrintF();
  }
  int v3 = objc_msgSend(v7, "eventType", v6);
  if (v3 == 20)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [v7 error];
    [WeakRetained _handleCompletedEventWithError:v4];
  }
  else
  {
    if (v3 != 200) {
      goto LABEL_10;
    }
    id v4 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handleCaptiveNetworkPresentEvent:v4];
  }

LABEL_10:
}

- (void)showWebSheet
{
  if (self->_cnjEvent)
  {
    -[SFDeviceOperationCNJSetup _showCaptiveSheet:](self, "_showCaptiveSheet:");
  }
  else if (gLogCategory_SFDeviceOperationCNJ <= 90 {
         && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  }
  {
    int v3 = _Block_copy(self->_promptForConfirmationHandler);
    LogPrintF();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFDeviceOperationCNJSetup_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFDeviceOperationCNJSetup_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  [*(id *)(a1 + 32) handleDismissal];
  [*(id *)(*(void *)(a1 + 32) + 64) deregisterRequestID:@"_cnjExtIO"];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v2 invalidate];
}

- (void)_handleCaptiveNetworkPresentEvent:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (self->_promptForConfirmationHandler)
  {
    objc_storeStrong((id *)&self->_cnjEvent, a3);
    (*((void (**)(void))self->_promptForConfirmationHandler + 2))();
  }
  else
  {
    [(SFDeviceOperationCNJSetup *)self _showCaptiveSheet:v5];
  }
}

- (void)_complete:(id)a3
{
  id v4 = a3;
  if (!self->_invalidateCalled && self->_completionHandler)
  {
    id v7 = v4;
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricTotalSeconds = v5;
    if (v7)
    {
      if (gLogCategory_SFDeviceOperationCNJ > 60
        || gLogCategory_SFDeviceOperationCNJ == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_13;
      }
    }
    else if (gLogCategory_SFDeviceOperationCNJ > 30 {
           || gLogCategory_SFDeviceOperationCNJ == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_13;
    }
    LogPrintF();
LABEL_13:
    (*((void (**)(id, id))self->_completionHandler + 2))(self->_completionHandler, v7);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    id v4 = v7;
  }
}

- (void)_showCaptiveSheet:(id)a3
{
  id v16 = a3;
  if (gLogCategory_SFDeviceOperationCNJ <= 50
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    v15 = "-[SFDeviceOperationCNJSetup _showCaptiveSheet:]";
    LogPrintF();
  }
  id v4 = [(UIViewController *)self->_presentingViewController view];
  double v5 = [v4 window];

  if (v5)
  {
    id v6 = (WSWebSheetViewController *)objc_alloc_init((Class)getWSWebSheetViewControllerClass[0]());
    webSheetViewController = self->_webSheetViewController;
    self->_webSheetViewController = v6;

    id v8 = self->_webSheetViewController;
    v9 = [v16 captiveURL];
    id v10 = [v16 captiveSSID];
    v11 = [v16 captiveInterfaceIdentifier];
    [(WSWebSheetViewController *)v8 startWithURL:v9 ssid:v10 interface:v11 proxyConfiguration:0 showCancelMenu:0 delegate:self];

    [(WSWebSheetViewController *)self->_webSheetViewController setModalPresentationStyle:5];
    presentingViewController = self->_presentingViewController;
    uint64_t v13 = self->_webSheetViewController;
    if (self->_isSetup) {
      [(UIViewController *)presentingViewController showViewController:v13 sender:0];
    }
    else {
      [(UIViewController *)presentingViewController presentViewController:v13 animated:1 completion:0];
    }
    self->_isShowingWebSheet = 1;
  }
  else
  {
    id v14 = NSErrorWithOSStatusF();
    [(SFDeviceOperationCNJSetup *)self _complete:v14];
  }
}

- (void)_handleCompletedEventWithError:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_isShowingWebSheet)
  {
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      id v7 = "-[SFDeviceOperationCNJSetup _handleCompletedEventWithError:]";
      LogPrintF();
    }
    -[WSWebSheetViewController dismissViewController:](self->_webSheetViewController, "dismissViewController:", 0, v7);
  }
  else
  {
    id v5 = v4;
    if (gLogCategory_SFDeviceOperationCNJ <= 50
      && (gLogCategory_SFDeviceOperationCNJ != -1 || (int v6 = _LogCategory_Initialize(), v5 = v9, v6)))
    {
      id v8 = v5;
      LogPrintF();
      -[SFDeviceOperationCNJSetup _complete:](self, "_complete:", v9, v8);
    }
    else
    {
      -[SFDeviceOperationCNJSetup _complete:](self, "_complete:", v5, v7);
    }
  }
}

- (void)handleWebNavigationWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (self->_isShowingWebSheet)
  {
    int v6 = v4;
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      id v5 = "-[SFDeviceOperationCNJSetup handleWebNavigationWithCompletionHandler:]";
      LogPrintF();
    }
    -[SKSetupCaptiveNetworkJoinClient postEventType:](self->_cnjClient, "postEventType:", 201, v5);
    v6[2](v6, 4);
    id v4 = v6;
  }
}

- (void)handleDismissal
{
  if (self->_isShowingWebSheet)
  {
    self->_isShowingWebSheet = 0;
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v3 = [(UIViewController *)self->_presentingViewController presentedViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];

    if (self->_webSheetResult)
    {
      if (gLogCategory_SFDeviceOperationCNJ <= 30
        && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_promptForConfirmationHandler)
      {
        NSErrorWithOSStatusF();
        id v4 = (id)objc_claimAutoreleasedReturnValue();
        [(SFDeviceOperationCNJSetup *)self _complete:v4];
      }
    }
    else
    {
      [(SFDeviceOperationCNJSetup *)self _complete:0];
    }
  }
}

- (void)handleCompleteNotificationWithRedirectURLtype:(int64_t)a3 result:(int64_t)a4
{
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_webSheetResult = a4;
}

- (void)scrapeCredentialsUsingPOSTMessage:(id)a3 loginURL:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (BOOL)isSetup
{
  return self->_isSetup;
}

- (void)setIsSetup:(BOOL)a3
{
  self->_isSetup = a3;
}

- (id)promptForConfirmationHandler
{
  return self->_promptForConfirmationHandler;
}

- (void)setPromptForConfirmationHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSError)reachabilityError
{
  return self->_reachabilityError;
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityError, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_promptForConfirmationHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_webSheetViewController, 0);
  objc_storeStrong((id *)&self->_cnjEvent, 0);

  objc_storeStrong((id *)&self->_cnjClient, 0);
}

@end