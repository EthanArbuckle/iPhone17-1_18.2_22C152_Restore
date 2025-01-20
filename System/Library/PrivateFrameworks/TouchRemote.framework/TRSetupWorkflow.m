@interface TRSetupWorkflow
+ (void)initialize;
- (NSSet)unauthenticatedAccountServices;
- (TRNearbyDevice)nearbyDevice;
- (TROperationQueue)operationQueue;
- (TRSession)session;
- (TRSetupWorkflow)initWithNearbyDevice:(id)a3 presentingViewController:(id)a4;
- (UIViewController)presentingViewController;
- (id)activationStageStartedHandler;
- (id)completionHandler;
- (id)configurationStageStartedHandler;
- (id)failureHandler;
- (id)networkStageStartedHandler;
- (id)startedHandler;
- (unint64_t)state;
- (void)_abortSetupWithErrorCode:(int64_t)a3 userInfo:(id)a4;
- (void)_performActivationOperation;
- (void)_performAuthenticationOperation;
- (void)_performCompletionOperation;
- (void)_performConfigurationOperation;
- (void)_performHandshakeOperation;
- (void)_performNetworkOperation;
- (void)_releaseHandlers;
- (void)cancel;
- (void)setActivationStageStartedHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConfigurationStageStartedHandler:(id)a3;
- (void)setFailureHandler:(id)a3;
- (void)setNearbyDevice:(id)a3;
- (void)setNetworkStageStartedHandler:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSession:(id)a3;
- (void)setStartedHandler:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUnauthenticatedAccountServices:(id)a3;
- (void)start;
@end

@implementation TRSetupWorkflow

+ (void)initialize
{
  _TRLogEnabled = 1;
  _TRLogVerboseEnabled = 1;
}

- (TRSetupWorkflow)initWithNearbyDevice:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TRSetupWorkflow;
  v9 = [(TRSetupWorkflow *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nearbyDevice, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
    v10->_state = 1;
    v11 = objc_alloc_init(TROperationQueue);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v11;
  }
  return v10;
}

- (void)start
{
  if ([(TRSetupWorkflow *)self state] != 1)
  {
    id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"TRSetupWorkflow is already started." userInfo:0];
    objc_exception_throw(v7);
  }
  [(TRSetupWorkflow *)self setState:2];
  v3 = [[TRSession alloc] initWithNearbyDevice:self->_nearbyDevice];
  [(TRSetupWorkflow *)self setSession:v3];

  objc_initWeak(&location, self);
  v4 = [(TRSetupWorkflow *)self session];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __24__TRSetupWorkflow_start__block_invoke;
  v10[3] = &unk_264220BC8;
  objc_copyWeak(&v11, &location);
  [v4 setDisconnectHandler:v10];

  v5 = objc_alloc_init(TRNearbyDeviceScanner);
  v6 = [(TRSetupWorkflow *)self session];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __24__TRSetupWorkflow_start__block_invoke_2;
  v8[3] = &unk_264220BF0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [(TRNearbyDeviceScanner *)v5 openSession:v6 withCompletion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __24__TRSetupWorkflow_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _abortSetupWithErrorCode:-9104 userInfo:0];
}

void __24__TRSetupWorkflow_start__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained state] != 2)
  {
    if (_TRLogEnabled != 1) {
      goto LABEL_16;
    }
    id v9 = TRLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[TRSetupWorkflow start]_block_invoke_2";
      _os_log_impl(&dword_2149BE000, v9, OS_LOG_TYPE_DEFAULT, "%s Workflow stopped", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!a2)
  {
    [*(id *)(a1 + 32) setSession:0];
    v10 = [v5 domain];
    if ([v10 isEqualToString:@"TRNearbyDeviceErrorDomain"])
    {
      uint64_t v11 = [v5 code];

      if (v11 == -9100)
      {
        uint64_t v16 = *MEMORY[0x263F08608];
        id v17 = v5;
        id v9 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        v12 = WeakRetained;
        uint64_t v13 = -9100;
LABEL_14:
        [v12 _abortSetupWithErrorCode:v13 userInfo:v9];
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v14 = *MEMORY[0x263F08608];
    id v15 = v5;
    id v9 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v12 = WeakRetained;
    uint64_t v13 = -9104;
    goto LABEL_14;
  }
  id v7 = [WeakRetained startedHandler];

  if (v7)
  {
    id v8 = [WeakRetained startedHandler];
    v8[2]();
  }
  [WeakRetained _performHandshakeOperation];
LABEL_16:
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[TRSetupWorkflow cancel]";
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Cancelling setup workflow", (uint8_t *)&v5, 0xCu);
    }
  }
  v4 = [(TRSetupWorkflow *)self operationQueue];
  [v4 invalidate];
}

- (void)_performHandshakeOperation
{
  v3 = [TRHandshakeOperation alloc];
  v4 = [(TRSetupWorkflow *)self session];
  int v5 = [(TROperation *)v3 initWithSession:v4];

  [(TRHandshakeOperation *)v5 setProtocolVersion:0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__TRSetupWorkflow__performHandshakeOperation__block_invoke;
  v7[3] = &unk_264220858;
  v7[4] = self;
  [(TRHandshakeOperation *)v5 setCompletionBlock:v7];
  v6 = [(TRSetupWorkflow *)self operationQueue];
  [v6 addOperation:v5];
}

uint64_t __45__TRSetupWorkflow__performHandshakeOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performConfigurationOperation];
}

- (void)_performConfigurationOperation
{
  v3 = [(TRSetupWorkflow *)self configurationStageStartedHandler];

  if (v3)
  {
    v4 = [(TRSetupWorkflow *)self configurationStageStartedHandler];
    v4[2]();
  }
  int v5 = [TRSetupConfigurationOperation alloc];
  v6 = [(TRSetupWorkflow *)self session];
  uint64_t v7 = [(TROperation *)v5 initWithSession:v6];

  objc_initWeak(&location, v7);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__TRSetupWorkflow__performConfigurationOperation__block_invoke;
  v9[3] = &unk_264220C18;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [(TRSetupConfigurationOperation *)v7 setCompletionBlock:v9];
  id v8 = [(TRSetupWorkflow *)self operationQueue];
  [v8 addOperation:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49__TRSetupWorkflow__performConfigurationOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained result];
  if (v2)
  {
    v3 = [WeakRetained result];
    v4 = [v3 objectForKey:@"TRSetupConfigurationOperationNeedsNetworkKey"];
    int v5 = [v4 BOOLValue];

    v6 = [WeakRetained result];
    uint64_t v7 = [v6 objectForKey:@"TRSetupConfigurationOperationUnauthenticatedServicesKey"];

    [*(id *)(a1 + 32) setUnauthenticatedAccountServices:v7];
    id v8 = *(void **)(a1 + 32);
    if (v5) {
      [v8 _performNetworkOperation];
    }
    else {
      [v8 _performActivationOperation];
    }
  }
  else
  {
    uint64_t v7 = [WeakRetained error];
    objc_msgSend(*(id *)(a1 + 32), "_abortSetupWithErrorCode:userInfo:", objc_msgSend(v7, "code"), 0);
  }
}

- (void)_performNetworkOperation
{
  v3 = [TRNetworkOperation alloc];
  v4 = [(TRSetupWorkflow *)self session];
  int v5 = [(TROperation *)v3 initWithSession:v4];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__TRSetupWorkflow__performNetworkOperation__block_invoke;
  v14[3] = &unk_264220C40;
  v14[4] = self;
  [(TRNetworkOperation *)v5 setSendingWiFiInfoHandler:v14];
  objc_initWeak(&location, v5);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __43__TRSetupWorkflow__performNetworkOperation__block_invoke_2;
  id v10 = &unk_264220C18;
  objc_copyWeak(&v12, &location);
  uint64_t v11 = self;
  [(TRNetworkOperation *)v5 setCompletionBlock:&v7];
  v6 = [(TRSetupWorkflow *)self operationQueue];
  [v6 addOperation:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __43__TRSetupWorkflow__performNetworkOperation__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) networkStageStartedHandler];
  v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __43__TRSetupWorkflow__performNetworkOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained result];
  uint64_t v3 = [v2 objectForKey:@"TRNetworkOperationHasNetworkKey"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    [*(id *)(a1 + 32) _performActivationOperation];
  }
  else
  {
    id v5 = [WeakRetained error];
    objc_msgSend(*(id *)(a1 + 32), "_abortSetupWithErrorCode:userInfo:", objc_msgSend(v5, "code"), 0);
  }
}

- (void)_performActivationOperation
{
  uint64_t v3 = [(TRSetupWorkflow *)self activationStageStartedHandler];

  if (v3)
  {
    int v4 = [(TRSetupWorkflow *)self activationStageStartedHandler];
    v4[2]();
  }
  id v5 = [TRActivationOperation alloc];
  v6 = [(TRSetupWorkflow *)self session];
  uint64_t v7 = [(TROperation *)v5 initWithSession:v6];

  objc_initWeak(&location, v7);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__TRSetupWorkflow__performActivationOperation__block_invoke;
  v9[3] = &unk_264220C18;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [(TRActivationOperation *)v7 setCompletionBlock:v9];
  uint64_t v8 = [(TRSetupWorkflow *)self operationQueue];
  [v8 addOperation:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __46__TRSetupWorkflow__performActivationOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained result];
  uint64_t v3 = [v2 objectForKey:@"TRActivationOperationIsActivatedKey"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    [*(id *)(a1 + 32) _performAuthenticationOperation];
  }
  else
  {
    id v5 = [WeakRetained error];
    objc_msgSend(*(id *)(a1 + 32), "_abortSetupWithErrorCode:userInfo:", objc_msgSend(v5, "code"), 0);
  }
}

- (void)_performAuthenticationOperation
{
  uint64_t v3 = [TRAuthenticationOperation alloc];
  int v4 = [(TRSetupWorkflow *)self session];
  id v5 = [(TROperation *)v3 initWithSession:v4];

  v6 = [(TRSetupWorkflow *)self unauthenticatedAccountServices];
  [(TRAuthenticationOperation *)v5 setTargetedServices:v6];

  uint64_t v7 = [(TRSetupWorkflow *)self presentingViewController];
  [(TRAuthenticationOperation *)v5 setPresentingViewController:v7];

  objc_initWeak(&location, v5);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__TRSetupWorkflow__performAuthenticationOperation__block_invoke;
  v9[3] = &unk_264220C18;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [(TRAuthenticationOperation *)v5 setCompletionBlock:v9];
  uint64_t v8 = [(TRSetupWorkflow *)self operationQueue];
  [v8 addOperation:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__TRSetupWorkflow__performAuthenticationOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained result];
  if (v2)
  {
    [*(id *)(a1 + 32) _performCompletionOperation];
  }
  else
  {
    uint64_t v3 = [WeakRetained error];
    objc_msgSend(*(id *)(a1 + 32), "_abortSetupWithErrorCode:userInfo:", objc_msgSend(v3, "code"), 0);
  }
}

- (void)_performCompletionOperation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    uint64_t v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "-[TRSetupWorkflow _performCompletionOperation]";
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Completion Request", buf, 0xCu);
    }
  }
  int v4 = [TRCompletionOperation alloc];
  id v5 = [(TRSetupWorkflow *)self session];
  v6 = [(TROperation *)v4 initWithSession:v5];

  [(TRCompletionOperation *)v6 setSuccess:1];
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__TRSetupWorkflow__performCompletionOperation__block_invoke;
  v8[3] = &unk_264220BC8;
  objc_copyWeak(&v9, (id *)buf);
  [(TRCompletionOperation *)v6 setCompletionBlock:v8];
  uint64_t v7 = [(TRSetupWorkflow *)self operationQueue];
  [v7 addOperation:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __46__TRSetupWorkflow__performCompletionOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained completionHandler];

  if (v1)
  {
    v2 = [WeakRetained completionHandler];
    v2[2]();
  }
  [WeakRetained _releaseHandlers];
  uint64_t v3 = [WeakRetained session];
  [v3 setDisconnectHandler:0];

  int v4 = [WeakRetained session];
  [v4 disconnect];

  [WeakRetained setSession:0];
}

- (void)_abortSetupWithErrorCode:(int64_t)a3 userInfo:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(TRSetupWorkflow *)self state] == 2)
  {
    [(TRSetupWorkflow *)self setState:3];
    if (_TRLogEnabled == 1)
    {
      uint64_t v7 = TRLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = "-[TRSetupWorkflow _abortSetupWithErrorCode:userInfo:]";
        __int16 v21 = 2048;
        int64_t v22 = a3;
        _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s Aborting setup with error code: %ld", buf, 0x16u);
      }
    }
    if (a3 == -10001)
    {
      [(TRSetupWorkflow *)self _releaseHandlers];
      a3 = -10001;
LABEL_14:
      uint64_t v11 = [TRCompletionOperation alloc];
      uint64_t v12 = [(TRSetupWorkflow *)self session];
      uint64_t v13 = [(TROperation *)v11 initWithSession:v12];

      [(TRCompletionOperation *)v13 setSuccess:0];
      [(TRCompletionOperation *)v13 setErrorCode:a3];
      uint64_t v14 = [(TRSetupWorkflow *)self session];
      [v14 setDisconnectHandler:0];
      [(TRSetupWorkflow *)self setSession:0];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __53__TRSetupWorkflow__abortSetupWithErrorCode_userInfo___block_invoke;
      v17[3] = &unk_264220858;
      id v18 = v14;
      id v15 = v14;
      [(TRCompletionOperation *)v13 setCompletionBlock:v17];
      uint64_t v16 = [(TRSetupWorkflow *)self operationQueue];
      [v16 addOperation:v13];

      goto LABEL_15;
    }
    if (a3 == -11000) {
      a3 = -8003;
    }
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:a3 userInfo:v6];
    id v9 = [(TRSetupWorkflow *)self failureHandler];

    if (v9)
    {
      id v10 = [(TRSetupWorkflow *)self failureHandler];
      ((void (**)(void, void *))v10)[2](v10, v8);
    }
    [(TRSetupWorkflow *)self _releaseHandlers];
    if ((a3 | 4) != 0xFFFFFFFFFFFFDC74) {
      goto LABEL_14;
    }
    [(TRSetupWorkflow *)self setSession:0];
  }
LABEL_15:
}

uint64_t __53__TRSetupWorkflow__abortSetupWithErrorCode_userInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnect];
}

- (void)_releaseHandlers
{
  [(TRSetupWorkflow *)self setStartedHandler:0];
  [(TRSetupWorkflow *)self setConfigurationStageStartedHandler:0];
  [(TRSetupWorkflow *)self setNetworkStageStartedHandler:0];
  [(TRSetupWorkflow *)self setActivationStageStartedHandler:0];
  [(TRSetupWorkflow *)self setCompletionHandler:0];
  [(TRSetupWorkflow *)self setFailureHandler:0];
}

- (id)startedHandler
{
  return self->_startedHandler;
}

- (void)setStartedHandler:(id)a3
{
}

- (id)configurationStageStartedHandler
{
  return self->_configurationStageStartedHandler;
}

- (void)setConfigurationStageStartedHandler:(id)a3
{
}

- (id)networkStageStartedHandler
{
  return self->_networkStageStartedHandler;
}

- (void)setNetworkStageStartedHandler:(id)a3
{
}

- (id)activationStageStartedHandler
{
  return self->_activationStageStartedHandler;
}

- (void)setActivationStageStartedHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)failureHandler
{
  return self->_failureHandler;
}

- (void)setFailureHandler:(id)a3
{
}

- (TRNearbyDevice)nearbyDevice
{
  return self->_nearbyDevice;
}

- (void)setNearbyDevice:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (TRSession)session
{
  return (TRSession *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSession:(id)a3
{
}

- (NSSet)unauthenticatedAccountServices
{
  return self->_unauthenticatedAccountServices;
}

- (void)setUnauthenticatedAccountServices:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (TROperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_unauthenticatedAccountServices, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_nearbyDevice, 0);
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_activationStageStartedHandler, 0);
  objc_storeStrong(&self->_networkStageStartedHandler, 0);
  objc_storeStrong(&self->_configurationStageStartedHandler, 0);
  objc_storeStrong(&self->_startedHandler, 0);
}

@end