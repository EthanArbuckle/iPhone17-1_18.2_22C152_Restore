@interface SOSKappaManager
+ (BOOL)isKappaEnabled;
+ (SOSStatus)currentSOSStatus;
+ (id)sharedInstance;
+ (int64_t)mapSOSFlowStateToKappaState:(int64_t)a3;
+ (unint64_t)mapServerResponseToKappaResponse:(int64_t)a3;
- (NSHashTable)observers;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)serialQueue;
- (SOSKappaManager)init;
- (SOSKappaManager)initWithQueue:(id)a3;
- (int)connectionRequestNotificationToken;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)detectedAnomalyWithElectedDevice:(unint64_t)a3 completion:(id)a4;
- (void)didDismissClientSOSBeforeSOSCall:(int64_t)a3;
- (void)didUpdateSOSStatus:(id)a3;
- (void)dismissClientSOSWithCompletion:(id)a3;
- (void)forceStartConnection;
- (void)removeObserver:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionRequestNotificationToken:(int)a3;
- (void)setObservers:(id)a3;
- (void)setSendingLocationUpdate:(BOOL)a3;
- (void)triggerKappaWithCompletion:(id)a3;
- (void)updateClientCurrentSOSButtonPressState:(id)a3;
- (void)updateClientCurrentSOSInitiationState:(int64_t)a3;
- (void)updateClientCurrentSOSInteractiveState:(int64_t)a3;
- (void)updateObserversWithKappaStatus:(id)a3;
@end

@implementation SOSKappaManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SOSKappaManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance_inst_0;

  return v2;
}

void __33__SOSKappaManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v2 = [NSString stringWithFormat:@"com.apple.SOS.queue.%@.%p", objc_opt_class(), *(void *)(a1 + 32)];
  v3 = (const char *)[v2 UTF8String];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create(v3, v4);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SOSKappaManager_sharedInstance__block_invoke_2;
  block[3] = &unk_1E6064D18;
  uint64_t v6 = *(void *)(a1 + 32);
  dispatch_queue_t v9 = v5;
  uint64_t v10 = v6;
  v7 = v5;
  dispatch_sync(v7, block);
}

uint64_t __33__SOSKappaManager_sharedInstance__block_invoke_2(uint64_t a1)
{
  sharedInstance_inst_0 = [objc_alloc(*(Class *)(a1 + 40)) initWithQueue:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

- (SOSKappaManager)init
{
  return 0;
}

- (SOSKappaManager)initWithQueue:(id)a3
{
  dispatch_queue_t v5 = a3;
  dispatch_assert_queue_V2(v5);
  if (+[SOSEntitlement currentProcessHasEntitlement:@"com.apple.sos.trigger"])
  {
    v19.receiver = self;
    v19.super_class = (Class)SOSKappaManager;
    uint64_t v6 = [(SOSKappaManager *)&v19 init];
    if (v6)
    {
      v7 = sos_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,init", (uint8_t *)buf, 2u);
      }

      objc_storeStrong((id *)&v6->_serialQueue, a3);
      uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      observers = v6->_observers;
      v6->_observers = (NSHashTable *)v8;

      objc_initWeak(buf, v6);
      uint64_t v10 = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
      v11 = MEMORY[0x1E4F14428];
      id v12 = MEMORY[0x1E4F14428];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __33__SOSKappaManager_initWithQueue___block_invoke;
      handler[3] = &unk_1E6064D40;
      objc_copyWeak(&v17, buf);
      notify_register_dispatch(v10, &v6->_connectionRequestNotificationToken, v11, handler);

      [(SOSKappaManager *)v6 forceStartConnection];
      objc_destroyWeak(&v17);
      objc_destroyWeak(buf);
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v14 = sos_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B3A94000, v14, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,missing SOSTriggerEntitlement", (uint8_t *)buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

void __33__SOSKappaManager_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__SOSKappaManager_initWithQueue___block_invoke_2;
    block[3] = &unk_1E6064200;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void __33__SOSKappaManager_initWithQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  notify_get_state([*(id *)(a1 + 32) connectionRequestNotificationToken], &state64);
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v5 = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
    __int16 v6 = 2048;
    uint64_t v7 = state64;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,handling %s,state,%lld", buf, 0x16u);
  }

  if (state64) {
    [*(id *)(a1 + 32) forceStartConnection];
  }
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
    [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
    v4 = self->_connection;
    self->_connection = 0;
  }
  notify_cancel(self->_connectionRequestNotificationToken);
  v5.receiver = self;
  v5.super_class = (Class)SOSKappaManager;
  [(SOSKappaManager *)&v5 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SOSKappaManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__SOSKappaManager_addObserver___block_invoke;
  v7[3] = &unk_1E6064AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __31__SOSKappaManager_addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SOSKappaManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__SOSKappaManager_removeObserver___block_invoke;
  v7[3] = &unk_1E6064AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __34__SOSKappaManager_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)triggerKappaWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  id v17 = [MEMORY[0x1E4F29128] UUID];
  objc_super v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,Kappa triggered,%@", buf, 0xCu);
  }

  uint64_t v7 = [(SOSKappaManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke;
  block[3] = &unk_1E6064DB8;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v8 = v4;
  dispatch_async(v7, block);

  _Block_object_dispose(&v12, 8);
}

void __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_2;
  v11[3] = &unk_1E6064D68;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v7;
  long long v12 = v7;
  id v4 = [v2 remoteObjectProxyWithErrorHandler:v11];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(v5 + 8) + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_36;
  v8[3] = &unk_1E6064D90;
  uint64_t v10 = v5;
  id v9 = *(id *)(a1 + 40);
  [v4 triggerSOSWithUUID:v6 triggerMechanism:7 completion:v8];
}

void __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 3, 0);
  }
}

uint64_t __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_36(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 0:
      long long v7 = sos_default_log();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v18 = 138412290;
      *(void *)uint64_t v19 = v9;
      uint64_t v10 = "SOSKappaManager,successful response to Kappa trigger,%@";
      goto LABEL_16;
    case 1:
    case 3:
    case 4:
    case 6:
      id v4 = sos_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        int v18 = 67109378;
        *(_DWORD *)uint64_t v19 = a2;
        *(_WORD *)&v19[4] = 2112;
        *(void *)&v19[6] = v5;
        _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,failure response (%d) to Kappa trigger,%@", (uint8_t *)&v18, 0x12u);
      }

      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v7 = *(NSObject **)(v6 + 40);
      *(void *)(v6 + 40) = 0;
      goto LABEL_5;
    case 2:
      long long v7 = +[SOSKappaManager currentSOSStatus];
      v11 = sos_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v13 = [v7 uuid];
        int v18 = 138412546;
        *(void *)uint64_t v19 = v12;
        *(_WORD *)&v19[8] = 2112;
        *(void *)&v19[10] = v13;
        _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,already active response to Kappa trigger,%@,active flow,%@", (uint8_t *)&v18, 0x16u);
      }
      uint64_t v14 = [v7 uuid];
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      goto LABEL_5;
    case 5:
      long long v7 = sos_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        int v18 = 138412290;
        *(void *)uint64_t v19 = v17;
        uint64_t v10 = "SOSKappaManager,successful response to Kappa trigger,%@,pushed to paired device";
LABEL_16:
        _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v18, 0xCu);
      }
LABEL_5:

      break;
    default:
      break;
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (void)detectedAnomalyWithElectedDevice:(unint64_t)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v7 = sos_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = a3;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,anomaly detected,device,%d", buf, 8u);
  }

  if (a3 == 1)
  {
    id v8 = [(SOSKappaManager *)self serialQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke;
    v9[3] = &unk_1E6064470;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

void __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_2;
  v7[3] = &unk_1E6064880;
  id v8 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  id v4 = [MEMORY[0x1E4F29128] UUID];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_39;
  v5[3] = &unk_1E6064DE0;
  id v6 = *(id *)(a1 + 40);
  [v3 triggerSOSWithUUID:v4 triggerMechanism:7 completion:v5];
}

void __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 3);
  }
}

void __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_39(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2 == 5)
  {
    id v4 = sos_default_log();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v9[0]) = 0;
    uint64_t v5 = "SOSKappaManager,successful response to anomaly detected on paired device";
    goto LABEL_7;
  }
  if (!a2)
  {
    id v4 = sos_default_log();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v9[0]) = 0;
    uint64_t v5 = "SOSKappaManager,successful response to anomaly detected";
LABEL_7:
    id v6 = v4;
    uint32_t v7 = 2;
    goto LABEL_10;
  }
  id v4 = sos_default_log();
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_11;
  }
  v9[0] = 67109120;
  v9[1] = a2;
  uint64_t v5 = "SOSKappaManager,failure response to anomaly detected,%d";
  id v6 = v4;
  uint32_t v7 = 8;
LABEL_10:
  _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)v9, v7);
LABEL_11:

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, unint64_t))(v8 + 16))(v8, +[SOSKappaManager mapServerResponseToKappaResponse:a2]);
  }
}

+ (BOOL)isKappaEnabled
{
  return +[SOSUtilities kappaTriggersEmergencySOS];
}

+ (SOSStatus)currentSOSStatus
{
  return +[SOSUtilities mostRecentSOSStatus];
}

- (void)setSendingLocationUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,sending location updates %d", (uint8_t *)v5, 8u);
  }
}

- (void)updateClientCurrentSOSInitiationState:(int64_t)a3
{
  int v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,initiation state updated to %d", (uint8_t *)v5, 8u);
  }
}

- (void)updateClientCurrentSOSInteractiveState:(int64_t)a3
{
  int v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,interactive state updated to %d", (uint8_t *)v5, 8u);
  }
}

- (void)updateClientCurrentSOSButtonPressState:(id)a3
{
  int v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,button press state updated", v4, 2u);
  }
}

- (void)dismissClientSOSWithCompletion:(id)a3
{
  int v3 = (void (**)(id, uint64_t))a3;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,sos dismiss received", v5, 2u);
  }

  v3[2](v3, 1);
}

- (void)didDismissClientSOSBeforeSOSCall:(int64_t)a3
{
  int v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,sos dismissal type is %d", (uint8_t *)v5, 8u);
  }
}

- (void)didUpdateSOSStatus:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SOSKappaManager *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,receiving update to SOSStatus: %@", (uint8_t *)&v8, 0xCu);
  }

  uint32_t v7 = [[SOSKappaStatus alloc] initWithSOSStatus:v4];
  -[SOSKappaStatus setSosKappaState:](v7, "setSosKappaState:", +[SOSKappaManager mapSOSFlowStateToKappaState:](SOSKappaManager, "mapSOSFlowStateToKappaState:", [v4 flowState]));
  [(SOSKappaManager *)self updateObserversWithKappaStatus:v7];
}

- (void)updateObserversWithKappaStatus:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 isKappaFlow];
  uint64_t v6 = sos_default_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,updating observers with status: %@", buf, 0xCu);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v8 = [(SOSKappaManager *)self observers];
    uint64_t v6 = [v8 copy];

    uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) updatedSOSKappaStatus:v4];
        }
        uint64_t v10 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
  else if (v7)
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,not a Kappa flow so not updating observers with status: %@", buf, 0xCu);
  }
}

- (void)setConnection:(id)a3
{
  uint64_t v9 = (NSXPCConnection *)a3;
  char v5 = [(SOSKappaManager *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  connection = self->_connection;
  p_connection = &self->_connection;
  uint64_t v6 = connection;
  if (connection != v9)
  {
    if (v6)
    {
      [(NSXPCConnection *)v6 invalidate];
      [(NSXPCConnection *)*p_connection setInvalidationHandler:0];
      [(NSXPCConnection *)*p_connection setInterruptionHandler:0];
    }
    objc_storeStrong((id *)p_connection, a3);
  }
}

- (NSXPCConnection)connection
{
  int v3 = [(SOSKappaManager *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  connection = self->_connection;
  if (!connection)
  {
    char v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.sos" options:4096];
    uint64_t v6 = self->_connection;
    self->_connection = v5;

    BOOL v7 = self->_connection;
    int v8 = [(SOSKappaManager *)self serialQueue];
    [(NSXPCConnection *)v7 _setQueue:v8];

    uint64_t v9 = self->_connection;
    uint64_t v10 = SOSServerInterface();
    [(NSXPCConnection *)v9 setRemoteObjectInterface:v10];

    uint64_t v11 = self->_connection;
    int v12 = SOSClientInterface();
    [(NSXPCConnection *)v11 setExportedInterface:v12];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_7];
    objc_initWeak(&location, self);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = __29__SOSKappaManager_connection__block_invoke_43;
    uint64_t v17 = &unk_1E6064830;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:&v14];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __29__SOSKappaManager_connection__block_invoke()
{
  v0 = sos_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B3A94000, v0, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,SOS server connection interrupted", v1, 2u);
  }
}

void __29__SOSKappaManager_connection__block_invoke_43(uint64_t a1)
{
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,SOS server connection invalidated", buf, 2u);
  }

  int v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  char v5 = [WeakRetained serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SOSKappaManager_connection__block_invoke_44;
  block[3] = &unk_1E6064830;
  objc_copyWeak(&v7, v3);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
}

void __29__SOSKappaManager_connection__block_invoke_44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnection:0];
}

- (void)forceStartConnection
{
  objc_initWeak(&location, self);
  int v3 = [(SOSKappaManager *)self connection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_46];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __39__SOSKappaManager_forceStartConnection__block_invoke_47;
  v5[3] = &unk_1E6064E08;
  objc_copyWeak(&v6, &location);
  [v4 syncState:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__SOSKappaManager_forceStartConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "[WARN] SOSKappaManager,failed to send message on sosd launch due to error %@", (uint8_t *)&v4, 0xCu);
  }
}

void __39__SOSKappaManager_forceStartConnection__block_invoke_47(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [SOSKappaStatus alloc];
  int v3 = +[SOSKappaManager currentSOSStatus];
  int v4 = [(SOSKappaStatus *)v2 initWithSOSStatus:v3];

  id v5 = [(SOSKappaStatus *)v4 sosStatus];
  -[SOSKappaStatus setSosKappaState:](v4, "setSosKappaState:", +[SOSKappaManager mapSOSFlowStateToKappaState:](SOSKappaManager, "mapSOSFlowStateToKappaState:", [v5 flowState]));

  uint64_t v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,successfully connected to sosd with current SOSStatus: %@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateObserversWithKappaStatus:v4];
}

+ (unint64_t)mapServerResponseToKappaResponse:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 6) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)mapSOSFlowStateToKappaState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xB) {
    return 0;
  }
  else {
    return a3;
  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (int)connectionRequestNotificationToken
{
  return self->_connectionRequestNotificationToken;
}

- (void)setConnectionRequestNotificationToken:(int)a3
{
  self->_connectionRequestNotificationToken = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "SOSKappaManager,connection failure during Kappa trigger,%@,error,%@", (uint8_t *)&v4, 0x16u);
}

void __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "SOSKappaManager,error from remoteObjectProxyWithErrorHandler: %@", (uint8_t *)&v2, 0xCu);
}

@end