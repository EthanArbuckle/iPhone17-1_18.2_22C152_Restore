@interface SVXClientServiceManager
+ (id)sharedManager;
- (SVXClientActivationServicing)activationService;
- (SVXClientAudioPowerServicing)inputAudioPowerService;
- (SVXClientAudioPowerServicing)outputAudioPowerService;
- (SVXClientAudioSystemServicing)audioSystemService;
- (SVXClientDeviceServicing)deviceService;
- (SVXClientKeepAliveServicing)keepAliveService;
- (SVXClientServiceManager)init;
- (SVXClientSessionServicing)sessionService;
- (SVXClientSessionStateServicing)sessionStateService;
- (SVXClientSpeechSynthesisServicing)speechSynthesisService;
- (id)_connection;
- (id)clientServiceConnection:(id)a3 performerForComponent:(int64_t)a4;
- (void)_connect;
- (void)clientServiceConnectionDidInvalidate:(id)a3;
- (void)getClientServiceUsingBlock:(id)a3 errorHandler:(id)a4;
@end

@implementation SVXClientServiceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepAliveService, 0);
  objc_storeStrong((id *)&self->_audioSystemService, 0);
  objc_storeStrong((id *)&self->_deviceService, 0);
  objc_storeStrong((id *)&self->_speechSynthesisService, 0);
  objc_storeStrong((id *)&self->_outputAudioPowerService, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerService, 0);
  objc_storeStrong((id *)&self->_sessionService, 0);
  objc_storeStrong((id *)&self->_sessionStateService, 0);
  objc_storeStrong((id *)&self->_activationService, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_analytics, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (SVXClientKeepAliveServicing)keepAliveService
{
  return self->_keepAliveService;
}

- (SVXClientAudioSystemServicing)audioSystemService
{
  return self->_audioSystemService;
}

- (SVXClientDeviceServicing)deviceService
{
  return self->_deviceService;
}

- (SVXClientSpeechSynthesisServicing)speechSynthesisService
{
  return self->_speechSynthesisService;
}

- (SVXClientAudioPowerServicing)outputAudioPowerService
{
  return self->_outputAudioPowerService;
}

- (SVXClientAudioPowerServicing)inputAudioPowerService
{
  return self->_inputAudioPowerService;
}

- (SVXClientSessionServicing)sessionService
{
  return self->_sessionService;
}

- (SVXClientSessionStateServicing)sessionStateService
{
  return self->_sessionStateService;
}

- (SVXClientActivationServicing)activationService
{
  return self->_activationService;
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = [SVXClientServiceConnection alloc];
    performer = self->_performer;
    v18 = v4;
    activationService = self->_activationService;
    deviceService = self->_deviceService;
    audioSystemService = self->_audioSystemService;
    sessionService = self->_sessionService;
    inputAudioPowerService = self->_inputAudioPowerService;
    outputAudioPowerService = self->_outputAudioPowerService;
    speechSynthesisService = self->_speechSynthesisService;
    keepAliveService = self->_keepAliveService;
    v13 = [MEMORY[0x263F28528] currentContext];
    v14 = [(SVXClientServiceConnection *)v18 initWithQueuePerformer:performer activationService:activationService audioSystemService:audioSystemService deviceService:deviceService inputAudioPowerService:inputAudioPowerService outputAudioPowerService:outputAudioPowerService sessionService:sessionService speechSynthesisService:speechSynthesisService keepAliveService:keepAliveService instanceContext:v13 delegate:self];
    v15 = self->_connection;
    self->_connection = v14;

    connection = self->_connection;
  }

  return connection;
}

- (void)_connect
{
  performer = self->_performer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__SVXClientServiceManager__connect__block_invoke;
  v3[3] = &unk_2645548A0;
  v3[4] = self;
  [(SVXPerforming *)performer performBlock:v3 withOptions:0];
}

id __35__SVXClientServiceManager__connect__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _connection];
}

- (id)clientServiceConnection:(id)a3 performerForComponent:(int64_t)a4
{
  return 0;
}

- (void)clientServiceConnectionDidInvalidate:(id)a3
{
  id v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__SVXClientServiceManager_clientServiceConnectionDidInvalidate___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __64__SVXClientServiceManager_clientServiceConnectionDidInvalidate___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  v2 = *(void **)(v1 + 24);
  if (v2 == *(void **)(result + 40))
  {
    uint64_t v3 = result;
    *(void *)(v1 + 24) = 0;

    id v4 = *(void **)(v3 + 32);
    return [v4 _connect];
  }
  return result;
}

- (void)getClientServiceUsingBlock:(id)a3 errorHandler:(id)a4
{
  id v5 = a3;
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__SVXClientServiceManager_getClientServiceUsingBlock_errorHandler___block_invoke;
  v8[3] = &unk_2645547D8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(SVXPerforming *)performer performBlock:v8];
}

void __67__SVXClientServiceManager_getClientServiceUsingBlock_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) _connection];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (SVXClientServiceManager)init
{
  v26.receiver = self;
  v26.super_class = (Class)SVXClientServiceManager;
  id v2 = [(SVXClientServiceManager *)&v26 init];
  if (v2)
  {
    uint64_t v3 = +[SVXQueuePerformer sharedMainQueuePerformer];
    performer = v2->_performer;
    v2->_performer = (SVXPerforming *)v3;

    uint64_t v5 = [MEMORY[0x263F283F8] sharedAnalytics];
    analytics = v2->_analytics;
    v2->_analytics = (AFAnalytics *)v5;

    id v7 = [[SVXClientActivationService alloc] initWithClientServiceProvider:v2 analytics:v2->_analytics performer:v2->_performer];
    activationService = v2->_activationService;
    v2->_activationService = (SVXClientActivationServicing *)v7;

    id v9 = [[SVXClientAudioSystemService alloc] initWithClientServiceProvider:v2 analytics:v2->_analytics performer:v2->_performer];
    audioSystemService = v2->_audioSystemService;
    v2->_audioSystemService = (SVXClientAudioSystemServicing *)v9;

    v11 = [[SVXClientDeviceService alloc] initWithClientServiceProvider:v2 analytics:v2->_analytics performer:v2->_performer];
    deviceService = v2->_deviceService;
    v2->_deviceService = (SVXClientDeviceServicing *)v11;

    v13 = [[SVXClientAudioPowerService alloc] initWithType:1 clientServiceProvider:v2 analytics:v2->_analytics performer:v2->_performer];
    inputAudioPowerService = v2->_inputAudioPowerService;
    v2->_inputAudioPowerService = (SVXClientAudioPowerServicing *)v13;

    v15 = [[SVXClientAudioPowerService alloc] initWithType:2 clientServiceProvider:v2 analytics:v2->_analytics performer:v2->_performer];
    outputAudioPowerService = v2->_outputAudioPowerService;
    v2->_outputAudioPowerService = (SVXClientAudioPowerServicing *)v15;

    v17 = [[SVXClientSessionService alloc] initWithClientServiceProvider:v2 analytics:v2->_analytics performer:v2->_performer];
    sessionService = v2->_sessionService;
    v2->_sessionService = (SVXClientSessionServicing *)v17;

    v19 = [[SVXClientSpeechSynthesisService alloc] initWithClientServiceProvider:v2 analytics:v2->_analytics performer:v2->_performer];
    speechSynthesisService = v2->_speechSynthesisService;
    v2->_speechSynthesisService = (SVXClientSpeechSynthesisServicing *)v19;

    v21 = [[SVXClientSessionStateService alloc] initWithClientServiceProvider:v2 analytics:v2->_analytics performer:v2->_performer];
    sessionStateService = v2->_sessionStateService;
    v2->_sessionStateService = (SVXClientSessionStateServicing *)v21;

    v23 = [[SVXClientKeepAliveService alloc] initWithClientServiceProvider:v2 analytics:v2->_analytics performer:v2->_performer];
    keepAliveService = v2->_keepAliveService;
    v2->_keepAliveService = (SVXClientKeepAliveServicing *)v23;

    [(SVXClientServiceManager *)v2 _connect];
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3031);
  }
  id v2 = (void *)sharedManager_manager;

  return v2;
}

uint64_t __40__SVXClientServiceManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(SVXClientServiceManager);

  return MEMORY[0x270F9A758]();
}

@end