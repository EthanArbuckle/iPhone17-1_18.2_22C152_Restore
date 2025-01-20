@interface TSProximityTargetTransferFlow
- (NSString)pin;
- (SSProximityDevice)btServer;
- (TSProximityTargetTransferFlow)initWithTransferBackPlan:(id)a3;
- (UIBarButtonItem)cancelButton;
- (id)_firstViewController;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (id)transferBackPlan;
- (unint64_t)backgroundTask;
- (void)_beginAdvertising:(id)a3;
- (void)_endAdvertising;
- (void)_handleSKEvent:(id)a3;
- (void)_startBackgroundTask;
- (void)_stopBackgroundTask;
- (void)appBackgrounded;
- (void)appForegrounded;
- (void)attemptFailed;
- (void)dealloc;
- (void)firstViewController;
- (void)firstViewController:(id)a3;
- (void)setBackgroundTask:(unint64_t)a3;
- (void)setBtServer:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDefaultNavigationItems:(id)a3;
- (void)setPin:(id)a3;
- (void)setTransferBackPlan:(id)a3;
- (void)userDidTapCancel;
@end

@implementation TSProximityTargetTransferFlow

- (TSProximityTargetTransferFlow)initWithTransferBackPlan:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSProximityTargetTransferFlow;
  v6 = [(TSSIMSetupFlow *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v6 action:sel_userDidTapCancel];
    cancelButton = v6->_cancelButton;
    v6->_cancelButton = (UIBarButtonItem *)v7;

    v6->_backgroundTask = *MEMORY[0x263F833E0];
    objc_storeStrong(&v6->_transferBackPlan, a3);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[TSProximityTargetTransferFlow dealloc]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "end target proximity flow @%s", buf, 0xCu);
  }

  [(TSProximityTargetTransferFlow *)self _stopBackgroundTask];
  [(TSProximityTargetTransferFlow *)self _endAdvertising];
  v4.receiver = self;
  v4.super_class = (Class)TSProximityTargetTransferFlow;
  [(TSProximityTargetTransferFlow *)&v4 dealloc];
}

- (id)firstViewController
{
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[TSProximityTargetTransferFlow firstViewController](v2);
  }

  return 0;
}

- (void)firstViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__TSProximityTargetTransferFlow_firstViewController___block_invoke;
  v6[3] = &unk_264828A90;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [(TSProximityTargetTransferFlow *)self _beginAdvertising:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __53__TSProximityTargetTransferFlow_firstViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2080;
      v11 = "-[TSProximityTargetTransferFlow firstViewController:]_block_invoke";
      _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "activate bt server failed : %@ @%s", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [WeakRetained _firstViewController];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  v14[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_16:
      [(TSProximityTargetTransferFlow *)self _endAdvertising];
      [(TSProximityTargetTransferFlow *)self _stopBackgroundTask];
      uint64_t v5 = 0;
      goto LABEL_17;
    }
    v6 = [(SSProximityDevice *)self->_btServer templateSession];
    if (v6)
    {
      id v7 = [TSSubFlowViewController alloc];
      v13[0] = @"FlowTypeKey";
      v13[1] = @"MessageSessionKey";
      v14[0] = &unk_26DC14578;
      v14[1] = v6;
      v13[2] = @"HasTransferablePlan";
      v13[3] = @"IsStandaloneProximityTransfer";
      v14[2] = MEMORY[0x263EFFA88];
      v14[3] = MEMORY[0x263EFFA88];
      v13[4] = @"TransferBackPlan";
      transferBackPlan = self->_transferBackPlan;
      id v9 = transferBackPlan;
      if (!transferBackPlan)
      {
        id v9 = [MEMORY[0x263EFF9D0] null];
      }
      v14[4] = v9;
      __int16 v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];
      v11 = [(TSSIMSetupFlow *)self navigationController];
      uint64_t v5 = [(TSSubFlowViewController *)v7 initWithOptions:v10 navigationController:v11];

      if (transferBackPlan)
      {
LABEL_15:

        if (v5) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
    else
    {
      id v9 = _TSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[TSProximityTargetTransferFlow nextViewControllerFrom:](v9);
      }
      uint64_t v5 = 0;
    }

    goto LABEL_15;
  }
  if (![(NSString *)self->_pin length]) {
    goto LABEL_16;
  }
  uint64_t v5 = [[TSProximityPINCodeViewController alloc] initWithPIN:self->_pin];
  if (!v5) {
    goto LABEL_16;
  }
LABEL_17:

  return v5;
}

- (void)userDidTapCancel
{
  [(TSProximityTargetTransferFlow *)self _endAdvertising];
  v3.receiver = self;
  v3.super_class = (Class)TSProximityTargetTransferFlow;
  [(TSSIMSetupFlow *)&v3 userDidTapCancel];
}

- (void)attemptFailed
{
  [(TSProximityTargetTransferFlow *)self _endAdvertising];
  v3.receiver = self;
  v3.super_class = (Class)TSProximityTargetTransferFlow;
  [(TSSIMSetupFlow *)&v3 attemptFailed];
}

- (void)appForegrounded
{
  v6.receiver = self;
  v6.super_class = (Class)TSProximityTargetTransferFlow;
  [(TSSIMSetupFlow *)&v6 appForegrounded];
  if (![(TSSIMSetupFlow *)self isFlowFinished] && !self->_btServer)
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __48__TSProximityTargetTransferFlow_appForegrounded__block_invoke;
    v3[3] = &unk_264828110;
    objc_copyWeak(&v4, &location);
    [(TSProximityTargetTransferFlow *)self _beginAdvertising:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __48__TSProximityTargetTransferFlow_appForegrounded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__TSProximityTargetTransferFlow_appForegrounded__block_invoke_cold_1();
    }

    uint64_t v5 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v5);
    [WeakRetained _endAdvertising];

    id v7 = objc_loadWeakRetained(v5);
    [v7 attemptFailed];
  }
}

- (void)appBackgrounded
{
  v5.receiver = self;
  v5.super_class = (Class)TSProximityTargetTransferFlow;
  [(TSSIMSetupFlow *)&v5 appBackgrounded];
  id v3 = [(TSSIMSetupFlow *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(TSProximityTargetTransferFlow *)self _endAdvertising];
  }
}

- (void)_beginAdvertising:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [SSProximityDevice alloc];
  objc_super v6 = [(SSProximityDevice *)v5 initWithQueue:MEMORY[0x263EF83A0] endpoint:2 remoteInfo:0];
  btServer = self->_btServer;
  self->_btServer = v6;

  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __51__TSProximityTargetTransferFlow__beginAdvertising___block_invoke;
  uint64_t v12 = &unk_264828A40;
  objc_copyWeak(&v13, &location);
  [(SSProximityDevice *)self->_btServer setEventHandler:&v9];
  int v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[TSProximityTargetTransferFlow _beginAdvertising:]";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "activate server @%s", buf, 0xCu);
  }

  -[SSProximityDevice activate:](self->_btServer, "activate:", v4, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __51__TSProximityTargetTransferFlow__beginAdvertising___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleSKEvent:v3];
}

- (void)_endAdvertising
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[TSProximityTargetTransferFlow _endAdvertising]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "invalidate server @%s", (uint8_t *)&v5, 0xCu);
  }

  [(SSProximityDevice *)self->_btServer invalidate:0];
  btServer = self->_btServer;
  self->_btServer = 0;
}

- (void)_handleSKEvent:(id)a3
{
  *(void *)&v22[13] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v4;
    __int16 v21 = 2080;
    *(void *)v22 = "-[TSProximityTargetTransferFlow _handleSKEvent:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "receive SKEvent:%@ @%s", (uint8_t *)&v19, 0x16u);
  }

  int v6 = [v4 eventType];
  if (v6 == 140)
  {
    uint64_t v17 = [v4 error];

    if (!v17)
    {
      uint64_t v7 = [(TSSIMSetupFlow *)self topViewController];
      [(TSSIMSetupFlow *)self viewControllerDidComplete:v7];
LABEL_19:
    }
  }
  else if (v6 == 110)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = v4;
      int v8 = _TSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v7 password];
        int v10 = [v7 passwordType];
        int v19 = 138412802;
        id v20 = v9;
        __int16 v21 = 1024;
        *(_DWORD *)v22 = v10;
        v22[2] = 2080;
        *(void *)&v22[3] = "-[TSProximityTargetTransferFlow _handleSKEvent:]";
        _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "pairing code:%@, type:%d @%s", (uint8_t *)&v19, 0x1Cu);
      }
      v11 = [v7 password];
      pin = self->_pin;
      self->_pin = v11;

      id v13 = [(TSSIMSetupFlow *)self topViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      v15 = [(TSSIMSetupFlow *)self topViewController];
      v16 = v15;
      if (isKindOfClass)
      {
        [v15 updatePIN:self->_pin];
      }
      else
      {
        objc_opt_class();
        char v18 = objc_opt_isKindOfClass();

        if (v18)
        {
          v16 = [(TSSIMSetupFlow *)self topViewController];
          [(TSSIMSetupFlow *)self viewControllerDidComplete:v16];
        }
        else
        {
          v16 = _TSLogDomain();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[TSProximityTargetTransferFlow _handleSKEvent:](self, v16);
          }
        }
      }
    }
    else
    {
      uint64_t v7 = _TSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[TSProximityTargetTransferFlow _handleSKEvent:](v4, v7);
      }
    }
    goto LABEL_19;
  }
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v12 = a3;
  BOOL v4 = +[TSUtilities isPad];
  int v5 = [v12 navigationItem];
  int v6 = v5;
  cancelButton = self->_cancelButton;
  if (v4) {
    [v5 setRightBarButtonItem:cancelButton];
  }
  else {
    [v5 setLeftBarButtonItem:cancelButton];
  }

  int v8 = [v12 navigationItem];
  [v8 setHidesBackButton:1 animated:0];

  if (!+[TSUtilities inBuddy])
  {
    uint64_t v9 = [v12 navigationController];
    int v10 = [v9 navigationBar];
    v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v10 setBackgroundColor:v11];
  }
}

- (id)_firstViewController
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(TSProximityTargetTransferFlow *)self _startBackgroundTask];
  id v3 = [TSProximityWaitingViewController alloc];
  btServer = self->_btServer;
  int v5 = [self->_transferBackPlan phoneNumber];
  int v6 = [(TSProximityWaitingViewController *)v3 initWithBTServer:btServer transferBackPhoneNumber:v5];

  [(TSProximityWaitingViewController *)v6 setDelegate:self];
  [(TSSIMSetupFlow *)self setTopViewController:v6];
  uint64_t v7 = _TSLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    int v10 = v6;
    __int16 v11 = 2080;
    id v12 = "-[TSProximityTargetTransferFlow _firstViewController]";
    _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "first view controller : %@ @%s", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (void)_startBackgroundTask
{
  if (*MEMORY[0x263F833E0] == self->_backgroundTask)
  {
    objc_initWeak(&location, self);
    id v3 = [MEMORY[0x263F82438] sharedApplication];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__TSProximityTargetTransferFlow__startBackgroundTask__block_invoke;
    v4[3] = &unk_264827A20;
    objc_copyWeak(&v5, &location);
    self->_backgroundTask = [v3 beginBackgroundTaskWithExpirationHandler:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __53__TSProximityTargetTransferFlow__startBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[TSProximityTargetTransferFlow _startBackgroundTask]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "background task expired @%s", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopBackgroundTask];
}

- (void)_stopBackgroundTask
{
  unint64_t v2 = *MEMORY[0x263F833E0];
  if (*MEMORY[0x263F833E0] != self->_backgroundTask)
  {
    int v4 = [MEMORY[0x263F82438] sharedApplication];
    [v4 endBackgroundTask:self->_backgroundTask];

    self->_backgroundTask = v2;
  }
}

- (SSProximityDevice)btServer
{
  return (SSProximityDevice *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBtServer:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCancelButton:(id)a3
{
}

- (NSString)pin
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPin:(id)a3
{
}

- (unint64_t)backgroundTask
{
  return self->_backgroundTask;
}

- (void)setBackgroundTask:(unint64_t)a3
{
  self->_backgroundTask = a3;
}

- (id)transferBackPlan
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setTransferBackPlan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transferBackPlan, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_btServer, 0);
}

- (void)firstViewController
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  unint64_t v2 = "-[TSProximityTargetTransferFlow firstViewController]";
}

- (void)nextViewControllerFrom:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  unint64_t v2 = "-[TSProximityTargetTransferFlow nextViewControllerFrom:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]invalid template session @%s", (uint8_t *)&v1, 0xCu);
}

void __48__TSProximityTargetTransferFlow_appForegrounded__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  unint64_t v2 = "-[TSProximityTargetTransferFlow appForegrounded]_block_invoke";
  _os_log_error_impl(&dword_227A17000, v0, OS_LOG_TYPE_ERROR, "[E]bt advertising failed : %@ @%s", v1, 0x16u);
}

- (void)_handleSKEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 topViewController];
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  id v5 = "-[TSProximityTargetTransferFlow _handleSKEvent:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]unexpect top view controller : %@ @%s", v4, 0x16u);
}

- (void)_handleSKEvent:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4[0] = 67109634;
  v4[1] = [a1 eventType];
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  int v8 = "-[TSProximityTargetTransferFlow _handleSKEvent:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]invalid SKEvent class for event : %d : %@ @%s", (uint8_t *)v4, 0x1Cu);
}

@end