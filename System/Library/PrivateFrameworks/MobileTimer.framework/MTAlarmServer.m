@interface MTAlarmServer
+ (BOOL)_notifyClientsForTriggerType:(unint64_t)a3;
- (BOOL)_isSystemReady;
- (BOOL)isSystemReady;
- (MTAlarmServer)initWithStorage:(id)a3;
- (MTAlarmServer)initWithStorage:(id)a3 connectionListenerProvider:(id)a4;
- (MTAlarmStorage)storage;
- (MTXPCConnectionListenerProvider)connectionListenerProvider;
- (NAScheduler)serializer;
- (id)_systemNotReadyError;
- (id)gatherDiagnostics;
- (void)addAlarm:(id)a3 withCompletion:(id)a4;
- (void)dismissAlarmWithIdentifier:(id)a3 dismissAction:(unint64_t)a4 withCompletion:(id)a5;
- (void)getAlarmsWithCompletion:(id)a3;
- (void)handleSystemReady;
- (void)nextSleepAlarmWithCompletion:(id)a3;
- (void)printDiagnostics;
- (void)removeAlarm:(id)a3 withCompletion:(id)a4;
- (void)resetSleepAlarmSnoozeStateWithCompletion:(id)a3;
- (void)setSerializer:(id)a3;
- (void)snoozeAlarmWithIdentifier:(id)a3 snoozeAction:(unint64_t)a4 withCompletion:(id)a5;
- (void)source:(id)a3 didAddAlarms:(id)a4;
- (void)source:(id)a3 didChangeNextAlarm:(id)a4;
- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5;
- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5;
- (void)source:(id)a3 didRemoveAlarms:(id)a4;
- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5;
- (void)source:(id)a3 didUpdateAlarms:(id)a4;
- (void)startListening;
- (void)stopListening;
- (void)updateAlarm:(id)a3 withCompletion:(id)a4;
- (void)updateSleepAlarmsWithCompletion:(id)a3;
@end

@implementation MTAlarmServer

- (void)getAlarmsWithCompletion:(id)a3
{
  id v8 = a3;
  if ([(MTAlarmServer *)self _isSystemReady])
  {
    id v4 = [(MTAlarmServer *)self storage];
    [v4 getAlarmsWithCompletion:v8];
  }
  else
  {
    v5 = v8;
    if (!v8) {
      goto LABEL_6;
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v7 = [(MTAlarmServer *)self _systemNotReadyError];
    (*((void (**)(id, id, id, void, void *))v8 + 2))(v8, v4, v6, 0, v7);
  }
  v5 = v8;
LABEL_6:
}

- (MTAlarmStorage)storage
{
  return self->_storage;
}

- (BOOL)_isSystemReady
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(MTAlarmServer *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__MTAlarmServer__isSystemReady__block_invoke;
  v7[3] = &unk_1E59150F8;
  v9 = &v10;
  v7[4] = self;
  v5 = v3;
  id v8 = v5;
  [v4 performBlock:v7];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

intptr_t __31__MTAlarmServer__isSystemReady__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (MTAlarmServer)initWithStorage:(id)a3
{
  id v4 = a3;
  v5 = MTAlarmClientInterface();
  id v6 = MTAlarmServerInterface();
  v7 = +[MTXPCConnectionInfo infoForMachServiceName:@"com.apple.MobileTimer.alarmserver" remoteObjectInterface:v5 exportedObject:self exportedObjectInterface:v6 lifecycleNotification:@"com.apple.MTAlarmServer.wakeup" requiredEntitlement:@"com.apple.private.mobiletimerd" options:0];

  id v8 = +[MTXPCConnectionListenerProvider providerWithConnectionInfo:v7 errorHandler:0];
  v9 = [(MTAlarmServer *)self initWithStorage:v4 connectionListenerProvider:v8];

  return v9;
}

- (MTAlarmServer)initWithStorage:(id)a3 connectionListenerProvider:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTAlarmServer;
  v9 = [(MTAlarmServer *)&v14 init];
  if (v9)
  {
    uint64_t v10 = MTLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_storage, a3);
    [v7 registerObserver:v9];
    objc_storeStrong((id *)&v9->_connectionListenerProvider, a4);
    uint64_t v11 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTAlarmServer.ready-queue", +[MTScheduler defaultPriority]);
    serializer = v9->_serializer;
    v9->_serializer = (NAScheduler *)v11;
  }
  return v9;
}

- (void)startListening
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Starting %{public}@", (uint8_t *)&v4, 0xCu);
  }

  [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider startListening];
}

- (void)stopListening
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Stopping %{public}@", (uint8_t *)&v4, 0xCu);
  }

  [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider stopListening];
}

- (void)handleSystemReady
{
  dispatch_semaphore_t v3 = [(MTAlarmServer *)self serializer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__MTAlarmServer_handleSystemReady__block_invoke;
  v4[3] = &unk_1E59150A8;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __34__MTAlarmServer_handleSystemReady__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "System is ready: %{public}@.  Will post MTAlarmServerReadyNotification.", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  int v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 postNotificationName:@"com.apple.MTAlarmServer.ready" object:0 userInfo:0 deliverImmediately:1];
}

- (id)_systemNotReadyError
{
  v2 = MTLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[MTSessionServer _systemNotReadyError](v2);
  }

  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.mobiletimerd.MTAlarmServer" code:1 userInfo:0];
  return v3;
}

- (void)addAlarm:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if ([(MTAlarmServer *)self _isSystemReady])
  {
    id v8 = MTLogForCategory(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "MTAlarmServer - Adding Alarm", v12, 2u);
    }

    v9 = [(MTAlarmServer *)self storage];
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 addAlarm:v6 withCompletion:v7 source:v10];
  }
  else if (v7)
  {
    uint64_t v11 = [(MTAlarmServer *)self _systemNotReadyError];
    v7[2](v7, v11);
  }
}

- (void)updateAlarm:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if ([(MTAlarmServer *)self _isSystemReady])
  {
    id v8 = MTLogForCategory(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "MTAlarmServer - Updating Alarm", v12, 2u);
    }

    v9 = [(MTAlarmServer *)self storage];
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 updateAlarm:v6 withCompletion:v7 source:v10];
  }
  else if (v7)
  {
    uint64_t v11 = [(MTAlarmServer *)self _systemNotReadyError];
    v7[2](v7, v11);
  }
}

- (void)removeAlarm:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if ([(MTAlarmServer *)self _isSystemReady])
  {
    id v8 = MTLogForCategory(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "MTAlarmServer - Removing Alarm", v12, 2u);
    }

    v9 = [(MTAlarmServer *)self storage];
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 removeAlarm:v6 withCompletion:v7 source:v10];
  }
  else if (v7)
  {
    uint64_t v11 = [(MTAlarmServer *)self _systemNotReadyError];
    v7[2](v7, v11);
  }
}

- (void)snoozeAlarmWithIdentifier:(id)a3 snoozeAction:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(MTAlarmServer *)self _isSystemReady])
  {
    kdebug_trace();
    uint64_t v10 = MTLogForCategory(9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_INFO, "MTAlarmServer - Snoozing Alarm", buf, 2u);
    }

    uint64_t v11 = [(MTAlarmServer *)self storage];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__MTAlarmServer_snoozeAlarmWithIdentifier_snoozeAction_withCompletion___block_invoke;
    v14[3] = &unk_1E5914D18;
    id v15 = v9;
    uint64_t v12 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v11 snoozeAlarmWithIdentifier:v8 snoozeAction:a4 withCompletion:v14 source:v12];
  }
  else if (v9)
  {
    char v13 = [(MTAlarmServer *)self _systemNotReadyError];
    (*((void (**)(id, void *))v9 + 2))(v9, v13);
  }
}

void __71__MTAlarmServer_snoozeAlarmWithIdentifier_snoozeAction_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  kdebug_trace();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)dismissAlarmWithIdentifier:(id)a3 dismissAction:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(MTAlarmServer *)self _isSystemReady])
  {
    kdebug_trace();
    uint64_t v10 = MTLogForCategory(9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_INFO, "MTAlarmServer - Dismissing Alarm", buf, 2u);
    }

    uint64_t v11 = [(MTAlarmServer *)self storage];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__MTAlarmServer_dismissAlarmWithIdentifier_dismissAction_withCompletion___block_invoke;
    v14[3] = &unk_1E5914D18;
    id v15 = v9;
    uint64_t v12 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v11 dismissAlarmWithIdentifier:v8 dismissAction:a4 withCompletion:v14 source:v12];
  }
  else if (v9)
  {
    char v13 = [(MTAlarmServer *)self _systemNotReadyError];
    (*((void (**)(id, void *))v9 + 2))(v9, v13);
  }
}

void __73__MTAlarmServer_dismissAlarmWithIdentifier_dismissAction_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  kdebug_trace();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)nextSleepAlarmWithCompletion:(id)a3
{
  id v7 = a3;
  if ([(MTAlarmServer *)self _isSystemReady])
  {
    id v4 = +[MTSleepManager nextSleepAlarm];
    int v5 = (void (*)(void))*((void *)v7 + 2);
  }
  else
  {
    id v6 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    id v4 = [(MTAlarmServer *)self _systemNotReadyError];
    int v5 = (void (*)(void))*((void *)v7 + 2);
  }
  v5();

  id v6 = v7;
LABEL_6:
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTAlarmServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__MTAlarmServer_source_didAddAlarms___block_invoke;
  v10[3] = &unk_1E5918188;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __37__MTAlarmServer_source_didAddAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarmsAdded:*(void *)(a1 + 32)];
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTAlarmServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__MTAlarmServer_source_didUpdateAlarms___block_invoke;
  v10[3] = &unk_1E5918188;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __40__MTAlarmServer_source_didUpdateAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarmsUpdated:*(void *)(a1 + 32)];
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTAlarmServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__MTAlarmServer_source_didRemoveAlarms___block_invoke;
  v10[3] = &unk_1E5918188;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __40__MTAlarmServer_source_didRemoveAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarmsRemoved:*(void *)(a1 + 32)];
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  id v6 = a4;
  id v7 = [(MTAlarmServer *)self connectionListenerProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__MTAlarmServer_source_didSnoozeAlarm_snoozeAction___block_invoke;
  v9[3] = &unk_1E5918188;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlockOnAllClients:v9];
}

uint64_t __52__MTAlarmServer_source_didSnoozeAlarm_snoozeAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarmSnoozed:*(void *)(a1 + 32)];
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v6 = a4;
  id v7 = [(MTAlarmServer *)self connectionListenerProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__MTAlarmServer_source_didDismissAlarm_dismissAction___block_invoke;
  v9[3] = &unk_1E5918188;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlockOnAllClients:v9];
}

uint64_t __54__MTAlarmServer_source_didDismissAlarm_dismissAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarmDismissed:*(void *)(a1 + 32)];
}

- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5
{
  id v7 = a4;
  if ([(id)objc_opt_class() _notifyClientsForTriggerType:a5])
  {
    id v8 = [(MTAlarmServer *)self connectionListenerProvider];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__MTAlarmServer_source_didFireAlarm_triggerType___block_invoke;
    v9[3] = &unk_1E5918188;
    id v10 = v7;
    [v8 performBlockOnAllClients:v9];
  }
}

uint64_t __49__MTAlarmServer_source_didFireAlarm_triggerType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarmFired:*(void *)(a1 + 32)];
}

+ (BOOL)_notifyClientsForTriggerType:(unint64_t)a3
{
  return a3 < 6;
}

- (void)source:(id)a3 didChangeNextAlarm:(id)a4
{
  id v5 = a4;
  id v6 = [(MTAlarmServer *)self connectionListenerProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__MTAlarmServer_source_didChangeNextAlarm___block_invoke;
  v8[3] = &unk_1E5918188;
  id v9 = v5;
  id v7 = v5;
  [v6 performBlockOnAllClients:v8];
}

uint64_t __43__MTAlarmServer_source_didChangeNextAlarm___block_invoke(uint64_t a1, void *a2)
{
  return [a2 nextAlarmChanged:*(void *)(a1 + 32)];
}

- (void)updateSleepAlarmsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ calling to refresh sleep alarms", (uint8_t *)&v10, 0xCu);
  }

  if ([(MTAlarmServer *)self _isSystemReady])
  {
    id v6 = +[MTAgent agent];
    id v7 = [v6 sleepManager];
    [v7 updateSleepAlarms];

    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    id v8 = MTLogForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MTAlarmServer updateSleepAlarmsWithCompletion:](self);
    }

    if (v4)
    {
      id v9 = [(MTAlarmServer *)self _systemNotReadyError];
      ((void (**)(id, void *))v4)[2](v4, v9);
    }
  }
}

- (void)resetSleepAlarmSnoozeStateWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ calling to reset sleep alarms snooze state", (uint8_t *)&v10, 0xCu);
  }

  if ([(MTAlarmServer *)self _isSystemReady])
  {
    id v6 = +[MTAgent agent];
    id v7 = [v6 sleepManager];
    [v7 resetSleepAlarmSnoozeState];

    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    id v8 = MTLogForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MTAlarmServer resetSleepAlarmSnoozeStateWithCompletion:](self);
    }

    if (v4)
    {
      id v9 = [(MTAlarmServer *)self _systemNotReadyError];
      ((void (**)(id, void *))v4)[2](v4, v9);
    }
  }
}

- (void)printDiagnostics
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----MTAlarmServer-----", (uint8_t *)&v9, 2u);
  }

  id v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MTAlarmServer _isSystemReady](self, "_isSystemReady"));
    int v9 = 138412290;
    int v10 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "System Ready: %@", (uint8_t *)&v9, 0xCu);
  }
  id v6 = MTLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MTAlarmServer *)self connectionListenerProvider];
    id v8 = [v7 connectedClients];
    int v9 = 138543362;
    int v10 = v8;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "Clients: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (id)gatherDiagnostics
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"Alarm system ready";
  if ([(MTAlarmServer *)self _isSystemReady]) {
    uint64_t v3 = @"YES";
  }
  else {
    uint64_t v3 = @"NO";
  }
  v10[1] = @"Alarm clients";
  v11[0] = v3;
  id v4 = [(MTAlarmServer *)self connectionListenerProvider];
  id v5 = [v4 connectedClients];
  id v6 = [v5 valueForKey:@"processName"];
  id v7 = [v6 componentsJoinedByString:@", "];
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (MTXPCConnectionListenerProvider)connectionListenerProvider
{
  return self->_connectionListenerProvider;
}

- (BOOL)isSystemReady
{
  return self->_systemReady;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_connectionListenerProvider, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)updateSleepAlarmsWithCompletion:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 _systemNotReadyError];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19CC95000, v2, v3, "%{public}@ could not refresh sleep alarms:%{public}@", v4, v5, v6, v7, v8);
}

- (void)resetSleepAlarmSnoozeStateWithCompletion:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 _systemNotReadyError];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19CC95000, v2, v3, "%{public}@ could not reset sleep alarms snooze state:%{public}@", v4, v5, v6, v7, v8);
}

@end