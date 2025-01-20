@interface UNCBlueListMonitor
- (BOOL)shouldBoostOpportunisticTopicsToEnabled;
- (UNCBlueListMonitor)init;
- (UNCBlueListMonitorDelegate)delegate;
- (void)_startMonitoring;
- (void)init;
- (void)setDelegate:(id)a3;
@end

@implementation UNCBlueListMonitor

- (UNCBlueListMonitor)init
{
  v19.receiver = self;
  v19.super_class = (Class)UNCBlueListMonitor;
  v2 = [(UNCBlueListMonitor *)&v19 init];
  if (!v2)
  {
LABEL_12:
    v15 = v2;
    goto LABEL_13;
  }
  uint64_t v3 = [MEMORY[0x263F351B8] userContext];
  context = v2->_context;
  v2->_context = (_CDContext *)v3;

  if (v2->_context)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.usernotificationsserver.BlueListMonitor", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x263F351F0] keyPathWithKey:@"/push/bluelist"];
    blueListKeyPath = v2->_blueListKeyPath;
    v2->_blueListKeyPath = (_CDContextualKeyPath *)v8;

    v10 = [(_CDContext *)v2->_context objectForKeyedSubscript:v2->_blueListKeyPath];
    uint64_t v11 = objc_opt_class();
    id v12 = v10;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    id v16 = v13;

    char v17 = [v16 BOOLValue];
    v2->_budgetExhausted = v17;
    [(UNCBlueListMonitor *)v2 _startMonitoring];
    goto LABEL_12;
  }
  v14 = *MEMORY[0x263F1E060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
    -[UNCBlueListMonitor init](v14);
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)shouldBoostOpportunisticTopicsToEnabled
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__UNCBlueListMonitor_shouldBoostOpportunisticTopicsToEnabled__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24) == 0;
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __61__UNCBlueListMonitor_shouldBoostOpportunisticTopicsToEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__UNCBlueListMonitor_setDelegate___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

id __34__UNCBlueListMonitor_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (void)_startMonitoring
{
  uint64_t v3 = (void *)MEMORY[0x263F351E8];
  id v4 = [MEMORY[0x263F351F8] predicateForChangeAtKeyPath:self->_blueListKeyPath];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__UNCBlueListMonitor__startMonitoring__block_invoke;
  v6[3] = &unk_265567678;
  v6[4] = self;
  v5 = [v3 localWakingRegistrationWithIdentifier:@"com.apple.usernotifications.bluelist" contextualPredicate:v4 clientIdentifier:@"com.apple.UserNotificationsServer" callback:v6];

  [(_CDContext *)self->_context registerCallback:v5];
}

void __38__UNCBlueListMonitor__startMonitoring__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  char v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__UNCBlueListMonitor__startMonitoring__block_invoke_13;
  block[3] = &unk_265567650;
  block[4] = v7;
  block[5] = &v19;
  block[6] = &v13;
  dispatch_sync(v8, block);
  char v9 = *MEMORY[0x263F1E060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *((unsigned __int8 *)v20 + 24);
    uint64_t v11 = v14[5];
    *(_DWORD *)buf = 67109376;
    int v24 = v10;
    __int16 v25 = 2048;
    uint64_t v26 = v11;
    _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "bluelist status changed; budgetExhausted: %d, notifying delegate: %p",
      buf,
      0x12u);
  }
  [(id)v14[5] bluelistStatusChanged];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

uint64_t __38__UNCBlueListMonitor__startMonitoring__block_invoke_13(void *a1)
{
  v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:*(void *)(a1[4] + 24)];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  char v7 = [v6 BOOLValue];
  *(unsigned char *)(a1[4] + 8) = v7;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 8);
  *(void *)(*(void *)(a1[6] + 8) + 40) = objc_loadWeakRetained((id *)(a1[4] + 40));

  return MEMORY[0x270F9A758]();
}

- (UNCBlueListMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UNCBlueListMonitorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_blueListKeyPath, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "Unable to initialize bluelist coreduet context. Opportunistic topics will not be boosted.", v1, 2u);
}

@end