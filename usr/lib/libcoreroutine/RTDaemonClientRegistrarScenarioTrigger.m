@interface RTDaemonClientRegistrarScenarioTrigger
+ (BOOL)supportsSecureCoding;
- (BOOL)invocationsPending;
- (BOOL)registered;
- (NSMutableDictionary)pendingScenarioInvocations;
- (OS_dispatch_queue)queue;
- (RTDaemonClientRegistrarScenarioTrigger)init;
- (RTDaemonClientRegistrarScenarioTrigger)initWithCoder:(id)a3;
- (RTDaemonClientRegistrarScenarioTrigger)initWithScenarioTriggerManager:(id)a3 queue:(id)a4;
- (RTDaemonClientRegistrarScenarioTriggerProtocol)delegate;
- (RTInvocationDispatcher)dispatcher;
- (RTScenarioTriggerManager)scenarioTriggerManager;
- (int64_t)countOfPendingInvocations;
- (unint64_t)monitoredScenarioTriggerTypes;
- (void)_logMonitoredScenarioTriggers:(unint64_t)a3;
- (void)_onScenarioTriggerManagerNotification:(id)a3;
- (void)addPendingScenarioTriggerBlock:(id)a3 failBlock:(id)a4 description:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)onScenarioTriggerManagerNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setPendingScenarioInvocations:(id)a3;
- (void)setScenarioTriggerManager:(id)a3;
- (void)startMonitoringForScenarioTriggerType:(unint64_t)a3;
- (void)stopMonitoringForScenarioTriggerType:(unint64_t)a3;
@end

@implementation RTDaemonClientRegistrarScenarioTrigger

- (void)setDelegate:(id)a3
{
}

- (RTDaemonClientRegistrarScenarioTrigger)initWithScenarioTriggerManager:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RTDaemonClientRegistrarScenarioTrigger;
  v9 = [(RTDaemonClientRegistrarScenarioTrigger *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_scenarioTriggerManager, a3);
    uint64_t v11 = objc_opt_new();
    pendingScenarioInvocations = v10->_pendingScenarioInvocations;
    v10->_pendingScenarioInvocations = (NSMutableDictionary *)v11;

    v10->_monitoredScenarioTriggerTypes = 0;
    v13 = [[RTInvocationDispatcher alloc] initWithQueue:v10->_queue];
    dispatcher = v10->_dispatcher;
    v10->_dispatcher = v13;
  }
  return v10;
}

- (RTDaemonClientRegistrarScenarioTrigger)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithScenarioTriggerManager_queue_);
}

- (RTDaemonClientRegistrarScenarioTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RTDaemonClientRegistrarScenarioTrigger;
  v5 = [(RTDaemonClientRegistrar *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_monitoredScenarioTriggerTypes = [v4 decodeIntegerForKey:@"monitoredScenarioTriggerTypes"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTDaemonClientRegistrarScenarioTrigger;
  id v4 = a3;
  [(RTDaemonClientRegistrar *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_monitoredScenarioTriggerTypes forKey:@"monitoredScenarioTriggerTypes" v5.receiver, v5.super_class];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)startMonitoringForScenarioTriggerType:(unint64_t)a3
{
  if ([(RTDaemonClientRegistrarScenarioTrigger *)self invocationsPending]) {
    [(RTInvocationDispatcher *)self->_dispatcher dispatchPendingInvocations];
  }
  for (; a3; a3 &= a3 - 1)
  {
    unint64_t v5 = a3 & -(uint64_t)a3;
    if ((self->_monitoredScenarioTriggerTypes & v5) != 0)
    {
      v6 = [NSNumber numberWithUnsignedInteger:a3 & -(uint64_t)a3];
      objc_super v7 = [(NSMutableDictionary *)self->_pendingScenarioInvocations objectForKey:v6];

      if (v7)
      {
        id v8 = [(NSMutableDictionary *)self->_pendingScenarioInvocations objectForKey:v6];
        v9 = (void *)[v8 copy];

        v10 = [(NSMutableDictionary *)self->_pendingScenarioInvocations objectForKey:v6];
        [v10 removeAllObjects];

        [v9 enumerateObjectsUsingBlock:&__block_literal_global_96];
      }
    }
    else
    {
      v6 = +[RTScenarioTriggerManager scenarioTriggerTypeToNotificationName:a3 & -(uint64_t)a3];
      if (v6)
      {
        self->_monitoredScenarioTriggerTypes |= v5;
        [(RTNotifier *)self->_scenarioTriggerManager addObserver:self selector:sel_onScenarioTriggerManagerNotification_ name:v6];
      }
    }
  }
  unint64_t monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;

  [(RTDaemonClientRegistrarScenarioTrigger *)self _logMonitoredScenarioTriggers:monitoredScenarioTriggerTypes];
}

uint64_t __80__RTDaemonClientRegistrarScenarioTrigger_startMonitoringForScenarioTriggerType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invoke];
}

- (void)onScenarioTriggerManagerNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__RTDaemonClientRegistrarScenarioTrigger_onScenarioTriggerManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __79__RTDaemonClientRegistrarScenarioTrigger_onScenarioTriggerManagerNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
    [v2 _onScenarioTriggerManagerNotification:v3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unint64_t v5 = [*(id *)(a1 + 32) name];
      int v6 = 138412802;
      objc_super v7 = v5;
      __int16 v8 = 2080;
      v9 = "-[RTDaemonClientRegistrarScenarioTrigger onScenarioTriggerManagerNotification:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 113;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "unknown notification with name received, %@ (in %s:%d)", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)_onScenarioTriggerManagerNotification:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v4 scenarioTrigger];
    objc_super v7 = v6;
    if (v6)
    {
      unint64_t monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;
      if (([v6 type] & monitoredScenarioTriggerTypes) != 0)
      {
        v12[0] = v7;
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        [WeakRetained scenarioTriggerRegistrar:self didReceiveScenarioTriggers:v9 error:0];
LABEL_12:

        goto LABEL_13;
      }
      v9 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_WORD *)int v11 = 0;
      __int16 v10 = "trigger type is not monitored for, returning.";
    }
    else
    {
      v9 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_WORD *)int v11 = 0;
      __int16 v10 = "received nil scenario trigger in notification, returning.";
    }
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
    goto LABEL_12;
  }
  objc_super v7 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "no delegate or does not respond to selector, returning", v11, 2u);
  }
LABEL_13:
}

- (void)stopMonitoringForScenarioTriggerType:(unint64_t)a3
{
  [(RTInvocationDispatcher *)self->_dispatcher removeAllPendingInvocations];
  if (a3)
  {
    unint64_t v5 = ~a3;
    do
    {
      unint64_t monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;
      if ((monitoredScenarioTriggerTypes & a3 & -(uint64_t)a3) != 0)
      {
        self->_unint64_t monitoredScenarioTriggerTypes = monitoredScenarioTriggerTypes & v5;
        objc_super v7 = +[RTScenarioTriggerManager scenarioTriggerTypeToNotificationName:](RTScenarioTriggerManager, "scenarioTriggerTypeToNotificationName:");
        if (v7) {
          [(RTNotifier *)self->_scenarioTriggerManager removeObserver:self fromNotification:v7];
        }
      }
      a3 &= a3 - 1;
    }
    while (a3);
  }
  unint64_t v8 = self->_monitoredScenarioTriggerTypes;

  [(RTDaemonClientRegistrarScenarioTrigger *)self _logMonitoredScenarioTriggers:v8];
}

- (void)_logMonitoredScenarioTriggers:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    unint64_t monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;
    unint64_t v5 = objc_opt_new();
    while (monitoredScenarioTriggerTypes)
    {
      int v6 = [MEMORY[0x1E4F5CEC0] scenarioTriggerTypeToString:monitoredScenarioTriggerTypes & -(uint64_t)monitoredScenarioTriggerTypes];
      if (v6) {
        [v5 addObject:v6];
      }
      monitoredScenarioTriggerTypes &= monitoredScenarioTriggerTypes - 1;
    }
    objc_super v7 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if ([v5 count]) {
        [v5 componentsJoinedByString:@", "];
      }
      else {
      unint64_t v8 = [MEMORY[0x1E4F5CEC0] scenarioTriggerTypeToString:0];
      }
      unint64_t v9 = self->_monitoredScenarioTriggerTypes;
      int v10 = 138412802;
      int v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = [v5 count];
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "monitored scenario triggers, %@, bitmask, %lu, count, %lu", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)addPendingScenarioTriggerBlock:(id)a3 failBlock:(id)a4 description:(id)a5
{
}

- (int64_t)countOfPendingInvocations
{
  return [(RTInvocationDispatcher *)self->_dispatcher countOfPendingInvocations];
}

- (BOOL)invocationsPending
{
  return [(RTInvocationDispatcher *)self->_dispatcher countOfPendingInvocations] != 0;
}

- (BOOL)registered
{
  return self->_monitoredScenarioTriggerTypes != 0;
}

- (unint64_t)monitoredScenarioTriggerTypes
{
  return self->_monitoredScenarioTriggerTypes;
}

- (RTDaemonClientRegistrarScenarioTriggerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTDaemonClientRegistrarScenarioTriggerProtocol *)WeakRetained;
}

- (NSMutableDictionary)pendingScenarioInvocations
{
  return self->_pendingScenarioInvocations;
}

- (void)setPendingScenarioInvocations:(id)a3
{
}

- (RTScenarioTriggerManager)scenarioTriggerManager
{
  return self->_scenarioTriggerManager;
}

- (void)setScenarioTriggerManager:(id)a3
{
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_pendingScenarioInvocations, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end