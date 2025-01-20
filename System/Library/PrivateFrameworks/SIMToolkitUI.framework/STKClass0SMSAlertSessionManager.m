@interface STKClass0SMSAlertSessionManager
- (STKCarrierSubscriptionMonitor)subscriptionMonitor;
- (STKClass0SMSAlertSession)currentSession;
- (STKClass0SMSAlertSessionManager)initWithSubscriptionMonitor:(id)a3;
- (id)remoteAlertDescriptorForSession:(id)a3;
- (void)_queue_enqueueSession:(id)a3;
- (void)_queue_handleClass0SMSBody:(id)a3 address:(id)a4 responder:(id)a5 forSlot:(int64_t)a6;
- (void)_queue_setCurrentSession:(id)a3;
- (void)handleClass0SMSBody:(id)a3 address:(id)a4 responder:(id)a5 forSlot:(int64_t)a6;
- (void)incomingCallUIStateDidChange:(BOOL)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)smsMessageClass0Received:(id)a3 body:(id)a4 address:(id)a5;
@end

@implementation STKClass0SMSAlertSessionManager

- (STKClass0SMSAlertSessionManager)initWithSubscriptionMonitor:(id)a3
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = STKClass0SMSLog();
  v16.receiver = self;
  v16.super_class = (Class)STKClass0SMSAlertSessionManager;
  v8 = [(STKAlertSessionManager *)&v16 initWithEventQueue:v6 logger:v7];

  if (v8)
  {
    uint64_t v9 = BSDispatchQueueCreateWithQualityOfService();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v8->_subscriptionMonitor, a3);
    uint64_t v11 = +[STKIncomingCallUIStateMonitor sharedInstance];
    queue_incomingCallStateMonitor = v8->_queue_incomingCallStateMonitor;
    v8->_queue_incomingCallStateMonitor = (STKIncomingCallUIStateMonitor *)v11;

    [(STKIncomingCallUIStateMonitor *)v8->_queue_incomingCallStateMonitor addObserver:v8];
    uint64_t v13 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v8->_queue];
    telephonyClient = v8->_telephonyClient;
    v8->_telephonyClient = (CoreTelephonyClient *)v13;

    [(CoreTelephonyClient *)v8->_telephonyClient setDelegate:v8];
  }

  return v8;
}

- (id)remoteAlertDescriptorForSession:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 options];
    id v5 = [STKClass0SMSSessionData alloc];
    v6 = [v4 objectForKeyedSubscript:@"Class0SMSBody"];
    v7 = [v4 objectForKeyedSubscript:@"Class0SMSAddress"];
    v8 = [v4 objectForKeyedSubscript:@"Class0SMSShowFromField"];
    uint64_t v9 = -[STKClass0SMSSessionData initWithBody:address:showsFromAddress:](v5, "initWithBody:address:showsFromAddress:", v6, v7, [v8 BOOLValue]);

    v10 = [STKClass0SMSSessionAction alloc];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __67__STKClass0SMSAlertSessionManager_remoteAlertDescriptorForSession___block_invoke;
    v14[3] = &unk_2645F4628;
    id v15 = v3;
    uint64_t v11 = [(STKClass0SMSSessionAction *)v10 initWithInputData:v9 response:v14];
    v12 = [[_STKRemoteAlertDescriptor alloc] initWithAction:v11 viewControllerName:@"STKClass0SMSViewController"];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __67__STKClass0SMSAlertSessionManager_remoteAlertDescriptorForSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendResponse:a2];
}

- (void)handleClass0SMSBody:(id)a3 address:(id)a4 responder:(id)a5 forSlot:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__STKClass0SMSAlertSessionManager_handleClass0SMSBody_address_responder_forSlot___block_invoke;
  block[3] = &unk_2645F4480;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  int64_t v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

uint64_t __81__STKClass0SMSAlertSessionManager_handleClass0SMSBody_address_responder_forSlot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleClass0SMSBody:address:responder:forSlot:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

- (void)smsMessageClass0Received:(id)a3 body:(id)a4 address:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BSDispatchQueueAssert();
  id v11 = [_STKClass0SMSResponseProvider alloc];
  id v14 = [(STKAlertSessionManager *)self log];
  id v12 = [(_STKClass0SMSResponseProvider *)v11 initWithLogger:v14];
  uint64_t v13 = [v10 slotID];

  [(STKClass0SMSAlertSessionManager *)self _queue_handleClass0SMSBody:v9 address:v8 responder:v12 forSlot:v13];
}

- (void)incomingCallUIStateDidChange:(BOOL)a3
{
  if (!a3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__STKClass0SMSAlertSessionManager_incomingCallUIStateDidChange___block_invoke;
    block[3] = &unk_2645F4458;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __64__STKClass0SMSAlertSessionManager_incomingCallUIStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = 0;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v15;
    *(void *)&long long v7 = 134217984;
    long long v13 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = objc_msgSend(*(id *)(a1 + 32), "log", v13, (void)v14);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          uint64_t v19 = v11;
          _os_log_impl(&dword_221DC0000, v12, OS_LOG_TYPE_DEFAULT, "Enqueing session (%p) because incoming call UI was dismissed.", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueSession:", v11);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__STKClass0SMSAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_2645F44F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__STKClass0SMSAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 72) alertHandle];
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_queue_setCurrentSession:", 0);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a3;
  [v5 removeObserver:self];
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__STKClass0SMSAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke;
  v8[3] = &unk_2645F44F8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __76__STKClass0SMSAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 72) alertHandle];
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_queue_setCurrentSession:", 0);
  }
}

- (void)_queue_setCurrentSession:(id)a3
{
  id v4 = (STKClass0SMSAlertSession *)a3;
  BSDispatchQueueAssert();
  currentSession = self->_currentSession;
  if (currentSession != v4)
  {
    id v6 = [(STKAlertSession *)currentSession alertHandle];
    [v6 removeObserver:self];

    [(STKAlertSession *)self->_currentSession invalidate];
  }
  id v7 = self->_currentSession;
  self->_currentSession = v4;
  id v8 = v4;

  id v9 = [(STKAlertSession *)self->_currentSession alertHandle];

  [v9 addObserver:self];
}

- (void)_queue_handleClass0SMSBody:(id)a3 address:(id)a4 responder:(id)a5 forSlot:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BSDispatchQueueAssert();
  id v19 = [(STKCarrierSubscriptionMonitor *)self->_subscriptionMonitor subscriptionInfoForSlot:a6];
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v13 setObject:v12 forKeyedSubscript:@"Class0SMSBody"];

  [v13 setObject:v11 forKeyedSubscript:@"Class0SMSAddress"];
  long long v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v19, "showClass0SMSFromField"));
  [v13 setObject:v14 forKeyedSubscript:@"Class0SMSShowFromField"];

  long long v15 = [STKClass0SMSAlertSession alloc];
  long long v16 = [(STKAlertSessionManager *)self log];
  long long v17 = +[STKSoundFactory class0SMSSound];
  id v18 = [(STKClass0SMSAlertSession *)v15 initWithLogger:v16 responseProvider:v10 options:v13 sound:v17 slot:a6];

  [(STKClass0SMSAlertSessionManager *)self _queue_enqueueSession:v18];
}

- (void)_queue_enqueueSession:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = -[STKCarrierSubscriptionMonitor subscriptionInfoForSlot:](self->_subscriptionMonitor, "subscriptionInfoForSlot:", [v4 slot]);
  if ([(STKIncomingCallUIStateMonitor *)self->_queue_incomingCallStateMonitor isShowingIncomingCallUI])
  {
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  if (v6 || ([v5 canShowClass0SMSOverInCallAlerts] & 1) != 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__STKClass0SMSAlertSessionManager__queue_enqueueSession___block_invoke;
    v10[3] = &unk_2645F4650;
    v10[4] = self;
    id v11 = v4;
    [(STKAlertSessionManager *)self enqueuePresentationForSession:v11 completion:v10];
  }
  else
  {
    if (!self->_queue_pendingAlertSessionsDueToInCallUI)
    {
      id v7 = [MEMORY[0x263EFF980] array];
      queue_pendingAlertSessionsDueToInCallUI = self->_queue_pendingAlertSessionsDueToInCallUI;
      self->_queue_pendingAlertSessionsDueToInCallUI = v7;
    }
    id v9 = [(STKAlertSessionManager *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v13 = v4;
      _os_log_impl(&dword_221DC0000, v9, OS_LOG_TYPE_DEFAULT, "Pending session (%p) due to incoming call UI up and carrier wanting alerts suppressed over incoming call alerts.", buf, 0xCu);
    }

    [(NSMutableArray *)self->_queue_pendingAlertSessionsDueToInCallUI addObject:v4];
  }
}

void __57__STKClass0SMSAlertSessionManager__queue_enqueueSession___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(NSObject **)(v2 + 40);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __57__STKClass0SMSAlertSessionManager__queue_enqueueSession___block_invoke_2;
    v4[3] = &unk_2645F44F8;
    v4[4] = v2;
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);
  }
}

uint64_t __57__STKClass0SMSAlertSessionManager__queue_enqueueSession___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentSession:", *(void *)(a1 + 40));
}

- (STKCarrierSubscriptionMonitor)subscriptionMonitor
{
  return self->_subscriptionMonitor;
}

- (STKClass0SMSAlertSession)currentSession
{
  return self->_currentSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_subscriptionMonitor, 0);
  objc_storeStrong((id *)&self->_queue_incomingCallStateMonitor, 0);
  objc_storeStrong((id *)&self->_queue_pendingAlertSessionsDueToInCallUI, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end