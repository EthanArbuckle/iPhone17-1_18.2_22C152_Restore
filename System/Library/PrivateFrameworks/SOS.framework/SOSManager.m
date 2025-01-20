@interface SOSManager
+ (BOOL)deviceSupportsSOS;
+ (BOOL)shouldTriggerSOS;
+ (id)sharedInstance;
+ (void)notifySOSTriggerMechanismChanged;
+ (void)shouldTriggerSOS;
+ (void)triggerSOS;
+ (void)triggerSOSWithCompletion:(id)a3;
+ (void)triggerSOSWithUUID:(id)a3 completion:(id)a4;
+ (void)triggerSOSWithUUID:(id)a3 triggerMechanism:(int64_t)a4 completion:(id)a5;
- (BOOL)isAllowedToMessageSOSContacts;
- (BOOL)isAutomaticCallCountdownEnabled;
- (BOOL)isSendingLocationUpdate;
- (BOOL)longPressTriggersEmergencySOS;
- (NSMapTable)observerToQueue;
- (NSXPCConnection)connection;
- (SOSButtonPressState)currentSOSButtonPressState;
- (SOSManager)init;
- (int)connectionRequestNotificationToken;
- (int64_t)currentSOSInitiationState;
- (int64_t)currentSOSInteractiveState;
- (void)_resetStateWithCompletion:(id)a3;
- (void)_waitForInitialState;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)didDismissClientSOSBeforeSOSCall:(int64_t)a3;
- (void)didDismissSOSBeforeSOSCall:(int64_t)a3;
- (void)didUpdateSOSStatus:(id)a3;
- (void)dismissClientSOSWithCompletion:(id)a3;
- (void)dismissSOSWithCompletion:(id)a3;
- (void)mostRecentLocationSentWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAllowedToMessageSOSContacts:(BOOL)a3;
- (void)setAutomaticCallCountdownEnabled:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionRequestNotificationToken:(int)a3;
- (void)setCurrentSOSButtonPressState:(id)a3;
- (void)setCurrentSOSInitiationState:(int64_t)a3;
- (void)setCurrentSOSInteractiveState:(int64_t)a3;
- (void)setLongPressTriggersEmergencySOS:(BOOL)a3;
- (void)setSendingLocationUpdate:(BOOL)a3;
- (void)startSendingLocationUpdateForReason:(int64_t)a3 withCompletion:(id)a4;
- (void)startSendingLocationUpdateWithCompletion:(id)a3;
- (void)stopSendingLocationUpdate;
- (void)updateClientCurrentSOSButtonPressState:(id)a3;
- (void)updateClientCurrentSOSInitiationState:(int64_t)a3;
- (void)updateClientCurrentSOSInteractiveState:(int64_t)a3;
- (void)willStartSendingLocationUpdate;
@end

@implementation SOSManager

- (int64_t)currentSOSInitiationState
{
  return self->_sosInitiationState;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SOSManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, block);
  }
  v2 = (void *)sharedInstance_sSOSManager;

  return v2;
}

+ (BOOL)deviceSupportsSOS
{
  char v2 = MGGetBoolAnswer();
  v3 = +[SOSUtilities _userSOSDefaults];
  v4 = [v3 objectForKey:@"SOSDeviceSupportedKey"];

  if (v4) {
    char v2 = [v4 BOOLValue];
  }

  return v2;
}

+ (void)triggerSOS
{
  v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B3ADA803, v4, 2u);
  }

  [a1 triggerSOSWithCompletion:0];
}

+ (void)triggerSOSWithCompletion:(id)a3
{
}

+ (void)triggerSOSWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(a1, "triggerSOSWithUUID:triggerMechanism:completion:", v7, +[SOSUtilities currentSOSTriggerMechanism](SOSUtilities, "currentSOSTriggerMechanism"), v6);
}

+ (void)triggerSOSWithUUID:(id)a3 triggerMechanism:(int64_t)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = sos_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v9;
    _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, "SOSManager, triggerSOSWithUUID uuid: %@", buf, 0xCu);
  }

  if ([a1 shouldTriggerSOS])
  {
    if (v10)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke;
      v19[3] = &unk_1E6064DE0;
      id v20 = v10;
      v12 = (void *)MEMORY[0x1B3EC08A0](v19);
    }
    else
    {
      v12 = &__block_literal_global_12;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_4;
    block[3] = &unk_1E6064FA0;
    id v16 = v12;
    SEL v17 = a2;
    id v15 = v9;
    int64_t v18 = a4;
    id v13 = v12;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_2;
  v2[3] = &unk_1E6064420;
  uint64_t v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40) == 0);
}

void __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_4(uint64_t a1)
{
  char v2 = +[SOSManager sharedInstance];
  id v3 = [v2 connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5;
  v7[3] = &unk_1E6064F78;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v8 = v6;
  v5 = [v3 remoteObjectProxyWithErrorHandler:v7];
  [v5 triggerSOSWithUUID:*(void *)(a1 + 32) triggerMechanism:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

void __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

+ (BOOL)shouldTriggerSOS
{
  if (+[SOSEntitlement currentProcessHasEntitlement:@"com.apple.sos.trigger"])
  {
    if ([a1 deviceSupportsSOS]) {
      return 1;
    }
    id v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[SOSManager shouldTriggerSOS](v4);
    }
  }
  else
  {
    id v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[SOSManager shouldTriggerSOS](v4);
    }
  }

  return 0;
}

+ (void)notifySOSTriggerMechanismChanged
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SOSTriggerMechanismChangedNotification", 0, 0, 1u);
}

- (SOSManager)init
{
  if (+[SOSEntitlement currentProcessHasEntitlement:@"com.apple.sos.trigger"])
  {
    v23.receiver = self;
    v23.super_class = (Class)SOSManager;
    id v3 = [(SOSManager *)&v23 init];
    if (v3)
    {
      id v4 = sos_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "initializing SOSManager", (uint8_t *)buf, 2u);
      }

      dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
      initialStateSemaphore = v3->_initialStateSemaphore;
      v3->_initialStateSemaphore = (OS_dispatch_semaphore *)v5;

      objc_initWeak(buf, v3);
      id v7 = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
      long long v8 = MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __18__SOSManager_init__block_invoke;
      handler[3] = &unk_1E6064D40;
      objc_copyWeak(&v21, buf);
      notify_register_dispatch(v7, &v3->_connectionRequestNotificationToken, v8, handler);

      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      SEL v17 = __18__SOSManager_init__block_invoke_354;
      int64_t v18 = &unk_1E6064200;
      id v10 = v3;
      v19 = v10;
      [(SOSManager *)v10 _resetStateWithCompletion:&v15];
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28E10], "weakToStrongObjectsMapTable", v15, v16, v17, v18);
      observerToQueue = v10->_observerToQueue;
      v10->_observerToQueue = (NSMapTable *)v11;

      objc_destroyWeak(&v21);
      objc_destroyWeak(buf);
    }
    self = v3;
    id v13 = self;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __18__SOSManager_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    dispatch_semaphore_t v5 = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by requesting current state", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetStateWithCompletion:&__block_literal_global_352];
}

void __18__SOSManager_init__block_invoke_350()
{
  v0 = sos_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B3A94000, v0, OS_LOG_TYPE_DEFAULT, "Received current SOS state", v1, 2u);
  }
}

intptr_t __18__SOSManager_init__block_invoke_354(uint64_t a1)
{
  char v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "Received initial SOS state", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
}

- (void)dealloc
{
  notify_cancel(self->_connectionRequestNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)SOSManager;
  [(SOSManager *)&v3 dealloc];
}

uint64_t __28__SOSManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sSOSManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (BOOL)longPressTriggersEmergencySOS
{
  return +[SOSUtilities longPressTriggersEmergencySOS];
}

- (void)setLongPressTriggersEmergencySOS:(BOOL)a3
{
}

- (BOOL)isAutomaticCallCountdownEnabled
{
  return +[SOSUtilities isAutomaticCallCountdownEnabled];
}

- (void)setAutomaticCallCountdownEnabled:(BOOL)a3
{
}

- (BOOL)isAllowedToMessageSOSContacts
{
  return +[SOSUtilities isAllowedToMessageSOSContacts];
}

- (void)setAllowedToMessageSOSContacts:(BOOL)a3
{
}

- (void)setConnection:(id)a3
{
  long long v8 = (NSXPCConnection *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  connection = self->_connection;
  p_connection = &self->_connection;
  dispatch_semaphore_t v5 = connection;
  if (connection != v8)
  {
    if (v5)
    {
      [(NSXPCConnection *)v5 invalidate];
      [(NSXPCConnection *)*p_connection setInvalidationHandler:0];
      [(NSXPCConnection *)*p_connection setInterruptionHandler:0];
    }
    objc_storeStrong((id *)p_connection, a3);
  }
}

- (NSXPCConnection)connection
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  connection = self->_connection;
  if (!connection)
  {
    int v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.sos" options:4096];
    dispatch_semaphore_t v5 = self->_connection;
    self->_connection = v4;

    uint64_t v6 = self->_connection;
    id v7 = SOSServerInterface();
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    long long v8 = self->_connection;
    id v9 = SOSClientInterface();
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __24__SOSManager_connection__block_invoke;
    v13[3] = &unk_1E6064830;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __24__SOSManager_connection__block_invoke_360;
    v11[3] = &unk_1E6064830;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v11];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __24__SOSManager_connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "SOS server connection interrupted", v3, 2u);
  }

  [WeakRetained updateClientCurrentSOSInteractiveState:0];
}

void __24__SOSManager_connection__block_invoke_360(uint64_t a1)
{
  char v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "SOS server connection invalidated", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__SOSManager_connection__block_invoke_361;
  block[3] = &unk_1E6064830;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __24__SOSManager_connection__block_invoke_361(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnection:0];
}

- (void)willStartSendingLocationUpdate
{
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B3ADA803, buf, 2u);
  }

  dispatch_semaphore_t v5 = [(SOSManager *)self connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SOSManager_willStartSendingLocationUpdate__block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v7[4] = a2;
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v7];
  [v6 willStartSendingLocationUpdate];
}

void __44__SOSManager_willStartSendingLocationUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();
  }
}

- (void)startSendingLocationUpdateWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B3ADA803, buf, 2u);
  }

  id v7 = [(SOSManager *)self connection];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __55__SOSManager_startSendingLocationUpdateWithCompletion___block_invoke;
  id v13 = &unk_1E6064F78;
  id v14 = v5;
  SEL v15 = a2;
  id v8 = v5;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:&v10];
  objc_msgSend(v9, "startSendingLocationUpdateWithCompletion:", v8, v10, v11, v12, v13);
}

void __55__SOSManager_startSendingLocationUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

- (void)startSendingLocationUpdateForReason:(int64_t)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v8 = sos_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B3ADA803, buf, 2u);
  }

  id v9 = [(SOSManager *)self connection];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __65__SOSManager_startSendingLocationUpdateForReason_withCompletion___block_invoke;
  SEL v15 = &unk_1E6064F78;
  id v16 = v7;
  SEL v17 = a2;
  id v10 = v7;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:&v12];
  objc_msgSend(v11, "startSendingLocationUpdateForReason:WithCompletion:", a3, v10, v12, v13, v14, v15);
}

void __65__SOSManager_startSendingLocationUpdateForReason_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

- (void)stopSendingLocationUpdate
{
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B3ADA803, buf, 2u);
  }

  uint64_t v5 = [(SOSManager *)self connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SOSManager_stopSendingLocationUpdate__block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v7[4] = a2;
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v7];
  [v6 stopSendingLocationUpdate];
}

void __39__SOSManager_stopSendingLocationUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();
  }
}

- (void)mostRecentLocationSentWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B3ADA803, buf, 2u);
  }

  id v7 = [(SOSManager *)self connection];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __51__SOSManager_mostRecentLocationSentWithCompletion___block_invoke;
  uint64_t v13 = &unk_1E6064F78;
  id v14 = v5;
  SEL v15 = a2;
  id v8 = v5;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:&v10];
  objc_msgSend(v9, "mostRecentLocationSentWithCompletion:", v8, v10, v11, v12, v13);
}

void __51__SOSManager_mostRecentLocationSentWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (BOOL)isSendingLocationUpdate
{
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B3ADA803, v5, 2u);
  }

  [(SOSManager *)self _waitForInitialState];
  return self->_sendingLocationUpdate;
}

- (void)setCurrentSOSInitiationState:(int64_t)a3
{
  self->_sosInitiationState = a3;
  uint64_t v5 = [(SOSManager *)self connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SOSManager_setCurrentSOSInitiationState___block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v7[4] = a2;
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v7];
  [v6 updateCurrentSOSInitiationState:a3];
}

void __43__SOSManager_setCurrentSOSInitiationState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();
  }
}

- (void)setCurrentSOSInteractiveState:(int64_t)a3
{
  self->_sosInteractiveState = a3;
  uint64_t v5 = [(SOSManager *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SOSManager_setCurrentSOSInteractiveState___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a2;
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v6 updateCurrentSOSInteractiveState:a3];

  if (a3 == 1)
  {
    id v7 = [MEMORY[0x1E4F49458] sharedInstance];
    [v7 setDidTriggerSOSToday:1];
  }
}

void __44__SOSManager_setCurrentSOSInteractiveState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();
  }
}

- (int64_t)currentSOSInteractiveState
{
  return self->_sosInteractiveState;
}

- (void)setCurrentSOSButtonPressState:(id)a3
{
  objc_storeStrong((id *)&self->_sosButtonPressState, a3);
  id v6 = a3;
  id v7 = [(SOSManager *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SOSManager_setCurrentSOSButtonPressState___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a2;
  id v8 = [v7 remoteObjectProxyWithErrorHandler:v9];
  [v8 updateCurrentSOSButtonPressState:v6];
}

void __44__SOSManager_setCurrentSOSButtonPressState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();
  }
}

- (SOSButtonPressState)currentSOSButtonPressState
{
  return self->_sosButtonPressState;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SOSManager_addObserver_queue___block_invoke;
  block[3] = &unk_1E6064FE8;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __32__SOSManager_addObserver_queue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observerToQueue];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__SOSManager_removeObserver___block_invoke;
  v6[3] = &unk_1E6064AA0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_sync(MEMORY[0x1E4F14428], v6);
}

void __29__SOSManager_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observerToQueue];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)dismissSOSWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSManager attempting to dismiss SOS", buf, 2u);
  }

  id v7 = [(SOSManager *)self connection];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __39__SOSManager_dismissSOSWithCompletion___block_invoke;
  uint64_t v13 = &unk_1E6064F78;
  id v14 = v5;
  SEL v15 = a2;
  id v8 = v5;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:&v10];
  objc_msgSend(v9, "dismissSOSWithCompletion:", v8, v10, v11, v12, v13);
}

void __39__SOSManager_dismissSOSWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)didDismissSOSBeforeSOSCall:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOS was dismissed before SOS call ended with sosDismissalType: %ld", buf, 0xCu);
  }

  id v7 = [(SOSManager *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__SOSManager_didDismissSOSBeforeSOSCall___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a2;
  id v8 = [v7 remoteObjectProxyWithErrorHandler:v9];
  [v8 didDismissSOSBeforeSOSCall:a3];
}

void __41__SOSManager_didDismissSOSBeforeSOSCall___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();
  }
}

- (void)setSendingLocationUpdate:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self->_sendingLocationUpdate != a3)
  {
    BOOL v3 = a3;
    self->_sendingLocationUpdate = a3;
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v8 = @"SOSSendingLocationUpdateValueKey";
    id v6 = [NSNumber numberWithBool:v3];
    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v5 postNotificationName:@"SOSSendingLocationUpdateChangedNotification" object:self userInfo:v7];
  }
}

- (void)updateClientCurrentSOSInitiationState:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t sosInitiationState = self->_sosInitiationState;
    *(_DWORD *)buf = 134218240;
    int64_t v22 = sosInitiationState;
    __int16 v23 = 2048;
    int64_t v24 = a3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSManager updating initiation state from %lu to %lu", buf, 0x16u);
  }

  if (self->_sosInitiationState != a3)
  {
    self->_int64_t sosInitiationState = a3;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [(SOSManager *)self observerToQueue];
    uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
          uint64_t v12 = [(SOSManager *)self observerToQueue];
          uint64_t v13 = [v12 objectForKey:v11];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __52__SOSManager_updateClientCurrentSOSInitiationState___block_invoke;
          block[3] = &unk_1E6064D18;
          void block[4] = v11;
          void block[5] = a3;
          dispatch_async(v13, block);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __52__SOSManager_updateClientCurrentSOSInitiationState___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 didUpdateCurrentSOSInitiationState:v4];
  }
  return result;
}

- (void)updateClientCurrentSOSInteractiveState:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t sosInteractiveState = self->_sosInteractiveState;
    int v8 = 134218240;
    int64_t v9 = sosInteractiveState;
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSManager updating interactive state from %lu to %lu", (uint8_t *)&v8, 0x16u);
  }

  if (self->_sosInteractiveState != a3)
  {
    self->_int64_t sosInteractiveState = a3;
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"SOSInteractiveStateChangedNotification" object:self userInfo:0];
  }
}

- (void)updateClientCurrentSOSButtonPressState:(id)a3
{
  uint64_t v4 = (SOSButtonPressState *)a3;
  uint64_t v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v9 = 0;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSManager updating button press state", v9, 2u);
  }

  sosButtonPressState = self->_sosButtonPressState;
  self->_sosButtonPressState = v4;
  uint64_t v7 = v4;

  int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v8 postNotificationName:@"SOSButtonPressStateChangedNotification" object:self userInfo:0];
}

- (void)dismissClientSOSWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__SOSManager_dismissClientSOSWithCompletion___block_invoke;
  v6[3] = &unk_1E6064470;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __45__SOSManager_dismissClientSOSWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SOSDismissSOSNotification" object:*(void *)(a1 + 32) userInfo:0];

  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 32) currentSOSInitiationState] == 0;
  id v5 = *(uint64_t (**)(uint64_t, BOOL))(v3 + 16);

  return v5(v3, v4);
}

- (void)didDismissClientSOSBeforeSOSCall:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(SOSManager *)self observerToQueue];
  uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        __int16 v10 = [(SOSManager *)self observerToQueue];
        int64_t v11 = [v10 objectForKey:v9];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __47__SOSManager_didDismissClientSOSBeforeSOSCall___block_invoke;
        block[3] = &unk_1E6064D18;
        void block[4] = v9;
        void block[5] = a3;
        dispatch_async(v11, block);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

uint64_t __47__SOSManager_didDismissClientSOSBeforeSOSCall___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 didDismissSOSBeforeSOSCall:v4];
  }
  return result;
}

- (void)didUpdateSOSStatus:(id)a3
{
  uint64_t v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSManager,callback from SOSEngine that sos status did update", v4, 2u);
  }
}

- (void)_waitForInitialState
{
  initialStateSemaphore = self->_initialStateSemaphore;
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(initialStateSemaphore, v4);
  uint64_t v5 = self->_initialStateSemaphore;

  dispatch_semaphore_signal(v5);
}

- (void)_resetStateWithCompletion:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  uint64_t state64 = 0;
  notify_get_state(self->_connectionRequestNotificationToken, &state64);
  if (state64)
  {
    uint64_t v6 = [(SOSManager *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__SOSManager__resetStateWithCompletion___block_invoke;
    v11[3] = &unk_1E6064F78;
    SEL v13 = a2;
    uint64_t v7 = v5;
    id v12 = v7;
    uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __40__SOSManager__resetStateWithCompletion___block_invoke_371;
    v9[3] = &unk_1E6065010;
    v9[4] = self;
    __int16 v10 = v7;
    [v8 syncState:v9];
  }
  else
  {
    v5[2](v5);
  }
}

void __40__SOSManager__resetStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __40__SOSManager__resetStateWithCompletion___block_invoke_371(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = a5;
  [v9 setSendingLocationUpdate:a2];
  [*(id *)(a1 + 32) updateClientCurrentSOSInitiationState:a3];
  [*(id *)(a1 + 32) updateClientCurrentSOSInteractiveState:a4];
  [*(id *)(a1 + 32) updateClientCurrentSOSButtonPressState:v10];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  return result;
}

- (int)connectionRequestNotificationToken
{
  return self->_connectionRequestNotificationToken;
}

- (void)setConnectionRequestNotificationToken:(int)a3
{
  self->_connectionRequestNotificationToken = a3;
}

- (NSMapTable)observerToQueue
{
  return self->_observerToQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_initialStateSemaphore, 0);

  objc_storeStrong((id *)&self->_sosButtonPressState, 0);
}

void __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  v1 = (const char *)OUTLINED_FUNCTION_4(v0);
  id v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_1B3A94000, v3, v4, "%@ failed due to connection error %@", v5, v6, v7, v8, v9);
}

+ (void)shouldTriggerSOS
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "Current process doesn't have SOS entitlement", v1, 2u);
}

void __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  v1 = (const char *)OUTLINED_FUNCTION_3(v0);
  id v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_1B3A94000, v3, v4, "%@ failed due to connection error %@", v5, v6, v7, v8, v9);
}

@end