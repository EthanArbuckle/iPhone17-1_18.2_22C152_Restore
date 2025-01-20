@interface SVXMyriadHostDevice
- (SVXMyriadHostDevice)initWithDelegate:(id)a3 queue:(id)a4;
- (void)_acquireWiFiAssertion;
- (void)_armEmergencyDispatchTimerFor:(double)a3 toExecute:(id)a4;
- (void)_disarmMyriadEmergencyTimer;
- (void)_initializeMyriadEmergencyTimer;
- (void)_releaseWiFiAssertion;
- (void)_signalEmergencyCallHandledStatus:(BOOL)a3;
- (void)_startAdvertisingEmergency:(id)a3;
- (void)preheatMyriad;
- (void)resetMyriad;
- (void)scdaCoordinatorDidHandleEmergency:(id)a3;
- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3;
- (void)scdaShouldContinue:(id)a3;
- (void)scdaShouldUnduck:(id)a3;
- (void)setupEnabled:(BOOL)a3;
- (void)startAdvertising:(unint64_t)a3 withSCDAGoodnessScoreContext:(id)a4 withSCDAAudioContext:(id)a5 completion:(id)a6;
@end

@implementation SVXMyriadHostDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiAssertion, 0);

  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_scdaCoordinator, 0);
}

- (void)scdaCoordinatorDidHandleEmergency:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "-[SVXMyriadHostDevice scdaCoordinatorDidHandleEmergency:]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v5, 0xCu);
  }
  [(SVXMyriadHostDevice *)self _signalEmergencyCallHandledStatus:1];
}

- (void)scdaShouldUnduck:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SVXMyriadHostDevice_scdaShouldUnduck___block_invoke;
  block[3] = &unk_2645548A0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __40__SVXMyriadHostDevice_scdaShouldUnduck___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained unduckDevice];
}

- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SVXMyriadHostDevice_scdaShouldAbortAnotherDeviceBetter___block_invoke;
  block[3] = &unk_2645548A0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __58__SVXMyriadHostDevice_scdaShouldAbortAnotherDeviceBetter___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _releaseWiFiAssertion];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained deviceLostMyriadElection];
}

- (void)scdaShouldContinue:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SVXMyriadHostDevice_scdaShouldContinue___block_invoke;
  block[3] = &unk_2645548A0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__SVXMyriadHostDevice_scdaShouldContinue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _releaseWiFiAssertion];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained deviceWonMyriadElection];
}

- (void)_releaseWiFiAssertion
{
}

- (void)_acquireWiFiAssertion
{
}

- (void)_signalEmergencyCallHandledStatus:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__SVXMyriadHostDevice__signalEmergencyCallHandledStatus___block_invoke;
  v4[3] = &unk_264553AD8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void __57__SVXMyriadHostDevice__signalEmergencyCallHandledStatus___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _disarmMyriadEmergencyTimer];
  v2 = (void (**)(void, void))MEMORY[0x223C65C40](*(void *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;

  BOOL v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = *(unsigned __int8 *)(a1 + 40);
    int v8 = 136315394;
    v9 = "-[SVXMyriadHostDevice _signalEmergencyCallHandledStatus:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s #myriad Emergency call handled status: %d", (uint8_t *)&v8, 0x12u);
  }
  if (v2)
  {
    if (*(unsigned char *)(a1 + 40)) {
      +[SVXServiceCommandResult resultSuccess];
    }
    else {
    uint64_t v7 = +[SVXServiceCommandResult resultFailureWithErrorCode:-1 reason:@"Myriad failed to handle emergency"];
    }
    ((void (**)(void, void *))v2)[2](v2, v7);
  }
}

- (void)_startAdvertisingEmergency:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v10 = "-[SVXMyriadHostDevice _startAdvertisingEmergency:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s #myriad Begin Emergency Call", buf, 0xCu);
  }
  [(SCDACoordinator *)self->_scdaCoordinator startAdvertisingEmergency];
  int v6 = (void *)[v4 copy];
  id completion = self->_emergencyContext.completion;
  self->_emergencyContext.id completion = v6;

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__SVXMyriadHostDevice__startAdvertisingEmergency___block_invoke;
  v8[3] = &unk_2645548A0;
  v8[4] = self;
  [(SVXMyriadHostDevice *)self _armEmergencyDispatchTimerFor:v8 toExecute:2.75];
}

uint64_t __50__SVXMyriadHostDevice__startAdvertisingEmergency___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _signalEmergencyCallHandledStatus:0];
}

- (void)_disarmMyriadEmergencyTimer
{
  timer = self->_emergencyContext.timer;
  dispatch_time_t v4 = dispatch_time(0, 0);
  dispatch_source_set_timer(timer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  BOOL v5 = self->_emergencyContext.timer;

  dispatch_source_set_event_handler(v5, &__block_literal_global_3);
}

void __50__SVXMyriadHostDevice__disarmMyriadEmergencyTimer__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    v2 = "-[SVXMyriadHostDevice _disarmMyriadEmergencyTimer]_block_invoke";
    _os_log_impl(&dword_220062000, v0, OS_LOG_TYPE_INFO, "%s #myriad Myriad emergency timer disarmed", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_armEmergencyDispatchTimerFor:(double)a3 toExecute:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  timer = self->_emergencyContext.timer;
  int64_t v6 = (uint64_t)(a3 * 1000000000.0);
  id v7 = a4;
  dispatch_time_t v8 = dispatch_time(0, v6);
  dispatch_source_set_timer(timer, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  dispatch_source_set_event_handler((dispatch_source_t)self->_emergencyContext.timer, v7);

  v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SVXMyriadHostDevice _armEmergencyDispatchTimerFor:toExecute:]";
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s #myriad Myriad emergency timer armed", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_initializeMyriadEmergencyTimer
{
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  timer = self->_emergencyContext.timer;
  self->_emergencyContext.timer = v3;

  dispatch_source_set_event_handler((dispatch_source_t)self->_emergencyContext.timer, &__block_literal_global_10976);
  BOOL v5 = self->_emergencyContext.timer;

  dispatch_resume(v5);
}

- (void)startAdvertising:(unint64_t)a3 withSCDAGoodnessScoreContext:(id)a4 withSCDAAudioContext:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__SVXMyriadHostDevice_startAdvertising_withSCDAGoodnessScoreContext_withSCDAAudioContext_completion___block_invoke;
  block[3] = &unk_264553878;
  id v21 = v12;
  unint64_t v22 = a3;
  id v18 = v11;
  id v19 = v10;
  v20 = self;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(queue, block);
}

void __101__SVXMyriadHostDevice_startAdvertising_withSCDAGoodnessScoreContext_withSCDAAudioContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136315906;
    dispatch_time_t v8 = "-[SVXMyriadHostDevice startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = v2;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s #myriad queueAdvertisementType:%lu, context=%@, goodnessScoreContext=%@", (uint8_t *)&v7, 0x2Au);
  }
  switch(v2)
  {
    case 0:
    case 3:
      [*(id *)(a1 + 48) _acquireWiFiAssertion];
      switch(v2)
      {
        case 0:
          [*(id *)(*(void *)(a1 + 48) + 8) startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:*(void *)(a1 + 40) withContext:*(void *)(a1 + 32)];
          goto LABEL_10;
        case 1:
          goto LABEL_6;
        case 2:
          goto LABEL_7;
        case 3:
          [*(id *)(*(void *)(a1 + 48) + 8) startAdvertisingFromInTaskVoiceTriggerWithContext:0];
          goto LABEL_10;
        default:
          return;
      }
    case 1:
LABEL_6:
      [*(id *)(*(void *)(a1 + 48) + 8) startAdvertisingFromDirectTriggerWithContext:*(void *)(a1 + 32)];
      goto LABEL_10;
    case 2:
LABEL_7:
      [*(id *)(*(void *)(a1 + 48) + 8) startAdvertisingFromAlertFiringVoiceTriggerWithContext:*(void *)(a1 + 32)];
LABEL_10:
      uint64_t v6 = *(void *)(a1 + 56);
      if (v6) {
        (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
      }
      break;
    case 4:
      [*(id *)(a1 + 48) _startAdvertisingEmergency:*(void *)(a1 + 56)];
      break;
    default:
      return;
  }
}

- (void)setupEnabled:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__SVXMyriadHostDevice_setupEnabled___block_invoke;
  v4[3] = &unk_264553AD8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __36__SVXMyriadHostDevice_setupEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setupEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)resetMyriad
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SVXMyriadHostDevice_resetMyriad__block_invoke;
  block[3] = &unk_2645548A0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__SVXMyriadHostDevice_resetMyriad__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) endTask];
}

- (void)preheatMyriad
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SVXMyriadHostDevice_preheatMyriad__block_invoke;
  block[3] = &unk_2645548A0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__SVXMyriadHostDevice_preheatMyriad__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) preheatWiProx];
}

- (SVXMyriadHostDevice)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVXMyriadHostDevice;
  dispatch_time_t v8 = [(SVXMyriadHostDevice *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F6CF70]) initWithDelegate:v8];
    scdaCoordinator = v8->_scdaCoordinator;
    v8->_scdaCoordinator = (SCDACoordinator *)v9;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_queue, a4);
    [(SVXMyriadHostDevice *)v8 _initializeMyriadEmergencyTimer];
    __int16 v11 = [[SVXMyriadWiFiAssertion alloc] initWithQueue:v8->_queue delegate:0];
    wifiAssertion = v8->_wifiAssertion;
    v8->_wifiAssertion = v11;
  }
  return v8;
}

@end