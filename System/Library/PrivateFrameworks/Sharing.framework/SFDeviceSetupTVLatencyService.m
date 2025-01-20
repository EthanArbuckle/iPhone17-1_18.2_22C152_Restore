@interface SFDeviceSetupTVLatencyService
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceSetupTVLatencyService)init;
- (id)progressHandler;
- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleSessionEnded:(id)a3;
- (void)_handleSessionStarted:(id)a3;
- (void)_handleTVLatencyProgressEvent:(unint64_t)a3 info:(id)a4;
- (void)_handleTVLatencyRequest:(id)a3 responseHandler:(id)a4;
- (void)_invalidate;
- (void)_reportProgress:(unsigned int)a3 info:(id)a4;
- (void)_sfServiceStart;
- (void)activate;
- (void)invalidate;
- (void)sendSetupAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation SFDeviceSetupTVLatencyService

- (SFDeviceSetupTVLatencyService)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFDeviceSetupTVLatencyService;
  v2 = [(SFDeviceSetupTVLatencyService *)&v8 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SFDeviceSetupTVLatencyService_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFDeviceSetupTVLatencyService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _sfServiceStart];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SFDeviceSetupTVLatencyService_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__SFDeviceSetupTVLatencyService_invalidate__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 10))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 10) = 1;
    v2 = *(void **)(v1 + 32);
    return [v2 _invalidate];
  }
  return result;
}

- (void)_invalidate
{
  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    [(SFDeviceSetupTVLatencyService *)self _handleSessionEnded:self->_sfSession];
    [(SFService *)self->_sfService invalidate];
    sfService = self->_sfService;
    self->_sfService = 0;

    [(SFDeviceSetupTVLatencyService *)self _reportProgress:20 info:0];
    id progressHandler = self->_progressHandler;
    self->_id progressHandler = 0;

    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_reportProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = _Block_copy(self->_progressHandler);
  v7 = v6;
  if (v6) {
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, v4, v8);
  }
}

- (void)sendSetupAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v18 = a4;
  id v8 = a5;
  v9 = (void (**)(void, void, void, void))v8;
  if (self->_sfSession)
  {
    v10 = _Block_copy(v8);
    if (v10) {
      v11 = v10;
    }
    else {
      v11 = &__block_literal_global_55;
    }
    if (v18) {
      id v12 = (id)[v18 mutableCopy];
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v13 = v12;
    v14 = [NSNumber numberWithUnsignedInt:v6];
    [v13 setObject:v14 forKeyedSubscript:@"sa"];

    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      if (v6 > 0xA) {
        v15 = "?";
      }
      else {
        v15 = off_1E5BC0EB8[(int)v6];
      }
      v16 = v15;
      v17 = v13;
      LogPrintF();
    }
    [(SFSession *)self->_sfSession sendRequestID:@"_sa", 0, v13, v11, v16, v17 options request responseHandler];
  }
  else
  {
    if (!v8) {
      goto LABEL_20;
    }
    v11 = NSErrorWithOSStatusF();
    ((void (**)(void, void *, void, void))v9)[2](v9, v11, 0, 0);
  }

LABEL_20:
}

- (void)_sfServiceStart
{
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFService *)self->_sfService invalidate];
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  [(SFService *)self->_sfService setAdvertiseRate:50];
  [(SFService *)self->_sfService setDeviceActionType:25];
  [(SFService *)self->_sfService setDispatchQueue:self->_dispatchQueue];
  [(SFService *)self->_sfService setIdentifier:@"com.apple.sharing.AppleTVSetup"];
  [(SFService *)self->_sfService setLabel:@"TVLatency"];
  [(SFService *)self->_sfService setNeedsSetup:1];
  [(SFService *)self->_sfService setPinType:1];
  [(SFService *)self->_sfService setSessionFlags:33];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke;
  v8[3] = &unk_1E5BBE028;
  v8[4] = self;
  [(SFService *)self->_sfService setSessionStartedHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke_2;
  v7[3] = &unk_1E5BBE050;
  v7[4] = self;
  [(SFService *)self->_sfService setSessionEndedHandler:v7];
  v5 = self->_sfService;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke_3;
  v6[3] = &unk_1E5BBC8E8;
  v6[4] = self;
  [(SFService *)v5 activateWithCompletion:v6];
}

uint64_t __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionStarted:a2];
}

uint64_t __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionEnded:a2];
}

void __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 90
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      id v6 = v3;
      LogPrintF();
    }
    uint64_t v4 = *(void **)(a1 + 32);
    v7 = @"eo";
    v8[0] = v3;
    v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1, v6);
    [v4 _reportProgress:30 info:v5];
  }
}

- (void)_handleSessionStarted:(id)a3
{
  id v5 = a3;
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 60)
    {
      if (gLogCategory_SFDeviceSetupTVLatencyService == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_7;
        }
        sfSession = self->_sfSession;
      }
      v9 = [(SFSession *)sfSession peer];
      v11 = [v5 peer];
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      v10 = [v5 peer];
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_sfSession, a3);
    [(SFService *)self->_sfService setDeviceActionType:0];
    [(SFService *)self->_sfService setNeedsSetup:0];
    v7 = self->_sfSession;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__SFDeviceSetupTVLatencyService__handleSessionStarted___block_invoke;
    v13[3] = &unk_1E5BBCBA8;
    v13[4] = self;
    [(SFSession *)v7 registerRequestID:@"_tvlS" options:&unk_1EFA09DA0 handler:v13];
    id v8 = self->_sfSession;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__SFDeviceSetupTVLatencyService__handleSessionStarted___block_invoke_2;
    v12[3] = &unk_1E5BBCBA8;
    v12[4] = self;
    [(SFSession *)v8 registerRequestID:@"_finish" options:&unk_1EFA09DC8 handler:v12];
    [(SFDeviceSetupTVLatencyService *)self _reportProgress:31 info:0];
  }
LABEL_7:
}

uint64_t __55__SFDeviceSetupTVLatencyService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTVLatencyRequest:responseHandler:");
}

uint64_t __55__SFDeviceSetupTVLatencyService__handleSessionStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishRequest:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3
{
  sfSession = (SFSession *)a3;
  if (self->_sfSession != sfSession) {
    goto LABEL_2;
  }
  id v8 = sfSession;
  if (sfSession && gLogCategory_SFDeviceSetupTVLatencyService <= 30)
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_10;
      }
      sfSession = self->_sfSession;
    }
    v7 = [(SFSession *)sfSession peer];
    LogPrintF();
  }
LABEL_10:
  -[SFDeviceSetupTVLatencyService _reportProgress:info:](self, "_reportProgress:info:", 32, 0, v7);
  [(TVLAudioLatencyEstimator *)self->_tvLatencyEstimator invalidate];
  tvLatencyEstimator = self->_tvLatencyEstimator;
  self->_tvLatencyEstimator = 0;

  id v6 = self->_sfSession;
  self->_sfSession = 0;

  if (!self->_finished)
  {
    [(SFService *)self->_sfService setDeviceActionType:25];
    [(SFService *)self->_sfService setNeedsSetup:1];
  }
  sfSession = v8;
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFDeviceSetupTVLatencyService *)self _invalidate];
    sfSession = v8;
  }
LABEL_2:
}

- (void)_handleTVLatencyRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_tvLatencyEstimator) {
    goto LABEL_15;
  }
  uint64_t v8 = [(SFSession *)self->_sfSession messageSessionTemplate];
  if (v8)
  {
    v9 = (void *)v8;
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = (void *)[objc_alloc((Class)getTVLAudioLatencyEstimatorClass_1[0]()) initWithMessageSession:v9];
    objc_storeStrong((id *)&self->_tvLatencyEstimator, v11);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__SFDeviceSetupTVLatencyService__handleTVLatencyRequest_responseHandler___block_invoke;
    v13[3] = &unk_1E5BBCC48;
    v13[4] = self;
    id v14 = v11;
    id v12 = v11;
    [v12 setProgressEventHandler:v13];
    [v12 activate];
    [(SFDeviceSetupTVLatencyService *)self _reportProgress:260 info:v6];

LABEL_15:
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, MEMORY[0x1E4F1CC08]);
    goto LABEL_20;
  }
  v10 = NSErrorWithOSStatusF();
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 90
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v10, 0, 0);

LABEL_20:
}

void __73__SFDeviceSetupTVLatencyService__handleTVLatencyRequest_responseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SFDeviceSetupTVLatencyService__handleTVLatencyRequest_responseHandler___block_invoke_2;
  v10[3] = &unk_1E5BBCC20;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v5;
  uint64_t v14 = a2;
  id v9 = v5;
  dispatch_async(v6, v10);
}

uint64_t __73__SFDeviceSetupTVLatencyService__handleTVLatencyRequest_responseHandler___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 32)) {
    return [*(id *)(result + 40) _handleTVLatencyProgressEvent:*(void *)(result + 56) info:*(void *)(result + 48)];
  }
  return result;
}

- (void)_handleTVLatencyProgressEvent:(unint64_t)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v12 = v6;
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30)
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService != -1 || (id v6 = (id)_LogCategory_Initialize(), v7 = v12, v6))
    {
      unint64_t v10 = a3;
      id v11 = v7;
      id v6 = (id)LogPrintF();
    }
  }
  switch(a3)
  {
    case 0uLL:
      uint64_t v8 = self;
      uint64_t v9 = 270;
      goto LABEL_12;
    case 1uLL:
      uint64_t v8 = self;
      uint64_t v9 = 277;
      goto LABEL_12;
    case 2uLL:
      uint64_t v8 = self;
      uint64_t v9 = 274;
      goto LABEL_12;
    case 3uLL:
      if (!self->_eventFinalDelivered)
      {
        id v6 = (id)[(SFDeviceSetupTVLatencyService *)self _reportProgress:272 info:v12];
        self->_eventFinalDelivered = 1;
      }
      break;
    case 4uLL:
      uint64_t v8 = self;
      uint64_t v9 = 276;
LABEL_12:
      id v6 = (id)-[SFDeviceSetupTVLatencyService _reportProgress:info:](v8, "_reportProgress:info:", v9, v12, v10, v11);
      break;
    default:
      break;
  }

  MEMORY[0x1F4181870](v6);
}

- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_eventFinalDelivered)
  {
    [(SFDeviceSetupTVLatencyService *)self _reportProgress:272 info:MEMORY[0x1E4F1CC08]];
    self->_eventFinalDelivered = 1;
  }
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, MEMORY[0x1E4F1CC08]);
  self->_finished = 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_tvLatencyEstimator, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);

  objc_storeStrong((id *)&self->_sfService, 0);
}

@end