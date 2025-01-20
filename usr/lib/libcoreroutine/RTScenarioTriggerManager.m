@interface RTScenarioTriggerManager
+ (id)scenarioTriggerTypeToNotificationName:(unint64_t)a3;
+ (id)settledStateName:(unint64_t)a3;
+ (int64_t)periodicPurgePolicy;
+ (int64_t)settledStateTypeForScenarioTriggerSettledState:(unint64_t)a3;
- (RTLocationStore)locationStore;
- (RTMotionActivityManager)motionActivityManager;
- (RTPlatform)platform;
- (RTScenarioTriggerManager)init;
- (RTScenarioTriggerManager)initWithLocationStore:(id)a3 motionActivityManager:(id)a4 platform:(id)a5 settledState:(unint64_t)a6 settledStateTransitionStore:(id)a7 wifiFootprintMonitor:(id)a8;
- (RTScenarioTriggerManager)initWithLocationStore:(id)a3 motionActivityManager:(id)a4 settledStateTransitionStore:(id)a5 wifiFootprintMonitor:(id)a6 platform:(id)a7;
- (RTSettledStateTransitionStore)settledStateTransitionStore;
- (RTWiFiFootprintMonitor)wifiFootprintMonitor;
- (int64_t)wiFiFootprintState;
- (unint64_t)_notificationNameToScenarioTriggerType:(id)a3;
- (unint64_t)interestedInConstantFootprint;
- (unint64_t)interestedInSettledState;
- (unint64_t)monitoredScenarioTriggerTypes;
- (unint64_t)motionSettledState;
- (unint64_t)settledState;
- (void)_evaluateSettledState;
- (void)_onMotionActivityManagerNotification:(id)a3;
- (void)_onWiFiFootprintStateNotification:(id)a3;
- (void)_postScenarioTriggerNotification:(id)a3;
- (void)_startMonitoringScenarioTriggerOfType:(unint64_t)a3;
- (void)_stopMonitoringScenarioTriggerOfType:(unint64_t)a3;
- (void)dealloc;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onMotionActivityManagerNotification:(id)a3;
- (void)onWiFiFootprintStateNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)postScenarioTriggerNotification:(id)a3;
- (void)setInterestedInConstantFootprint:(unint64_t)a3;
- (void)setInterestedInSettledState:(unint64_t)a3;
- (void)setMonitoredScenarioTriggerTypes:(unint64_t)a3;
- (void)setMotionSettledState:(unint64_t)a3;
- (void)setSettledState:(unint64_t)a3;
- (void)setSettledStateAndSubmitMetricsForSettledState:(unint64_t)a3;
- (void)setWiFiFootprintState:(int64_t)a3;
- (void)simulateScenarioTrigger:(id)a3 handler:(id)a4;
@end

@implementation RTScenarioTriggerManager

+ (id)settledStateName:(unint64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 2) {
    v3 = @"Settled";
  }
  if (a3 == 1) {
    return @"Unsettled";
  }
  else {
    return v3;
  }
}

+ (id)scenarioTriggerTypeToNotificationName:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a3 == 2)
    {
      v4 = RTScenarioTriggerManagerNotificationUnsettled;
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      v4 = RTScenarioTriggerManagerNotificationSettled;
LABEL_6:
      v5 = [(__objc2_class *)v4 notificationName];
      goto LABEL_11;
    }
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 134218498;
      unint64_t v9 = a3;
      __int16 v10 = 2080;
      v11 = "+[RTScenarioTriggerManager scenarioTriggerTypeToNotificationName:]";
      __int16 v12 = 1024;
      int v13 = 91;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unhandled scenario trigger type, %lu (in %s:%d)", (uint8_t *)&v8, 0x1Cu);
    }
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (RTScenarioTriggerManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocationStore_motionActivityManager_settledStateTransitionStore_wifiFootprintMonitor_platform_);
}

- (RTScenarioTriggerManager)initWithLocationStore:(id)a3 motionActivityManager:(id)a4 platform:(id)a5 settledState:(unint64_t)a6 settledStateTransitionStore:(id)a7 wifiFootprintMonitor:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v28 = a7;
  id v18 = a8;
  if (!v15)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: locationStore";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_18;
  }
  if (!v16)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_17;
  }
  if (!v17)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: platform";
    goto LABEL_17;
  }
  if (!v28)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: settledStateTransitionStore";
      goto LABEL_17;
    }
LABEL_18:

    v21 = 0;
    goto LABEL_19;
  }
  id v27 = v18;
  if (v18)
  {
    v29.receiver = self;
    v29.super_class = (Class)RTScenarioTriggerManager;
    v19 = [(RTNotifier *)&v29 init];
    v20 = v19;
    if (v19)
    {
      v19->_monitoredScenarioTriggerTypes = 0;
      objc_storeStrong((id *)&v19->_motionActivityManager, a4);
      v20->_motionSettledState = 0;
      objc_storeStrong((id *)&v20->_platform, a5);
      v20->_settledState = a6;
      objc_storeStrong((id *)&v20->_settledStateTransitionStore, a7);
      objc_storeStrong((id *)&v20->_locationStore, a3);
      objc_storeStrong((id *)&v20->_wifiFootprintMonitor, a8);
    }
    self = v20;
    v21 = self;
  }
  else
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiFootprintMonitor", buf, 2u);
    }

    v21 = 0;
  }
  v22 = v27;
LABEL_19:

  return v21;
}

- (RTScenarioTriggerManager)initWithLocationStore:(id)a3 motionActivityManager:(id)a4 settledStateTransitionStore:(id)a5 wifiFootprintMonitor:(id)a6 platform:(id)a7
{
  return [(RTScenarioTriggerManager *)self initWithLocationStore:a3 motionActivityManager:a4 platform:a7 settledState:0 settledStateTransitionStore:a5 wifiFootprintMonitor:a6];
}

- (void)dealloc
{
  self->_wiFiFootprintState = -1;
  [(RTNotifier *)self->_motionActivityManager removeObserver:self];
  [(RTNotifier *)self->_wifiFootprintMonitor removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)RTScenarioTriggerManager;
  [(RTScenarioTriggerManager *)&v3 dealloc];
}

- (void)setInterestedInSettledState:(unint64_t)a3
{
  unint64_t interestedInSettledState = self->_interestedInSettledState;
  if (interestedInSettledState != a3)
  {
    self->_unint64_t interestedInSettledState = a3;
    if (!a3 || interestedInSettledState)
    {
      if (!a3 && interestedInSettledState)
      {
        motionActivityManager = self->_motionActivityManager;
        v7 = +[RTNotification notificationName];
        [(RTNotifier *)motionActivityManager removeObserver:self fromNotification:v7];

        [(RTScenarioTriggerManager *)self setSettledStateAndSubmitMetricsForSettledState:0];
      }
    }
    else
    {
      v5 = self->_motionActivityManager;
      id v8 = +[RTNotification notificationName];
      [(RTNotifier *)v5 addObserver:self selector:sel_onMotionActivityManagerNotification_ name:v8];
    }
  }
}

- (void)setMotionSettledState:(unint64_t)a3
{
  if (self->_motionSettledState != a3)
  {
    self->_motionSettledState = a3;
    [(RTScenarioTriggerManager *)self _evaluateSettledState];
  }
}

- (void)_evaluateSettledState
{
  if (self->_motionSettledState - 1 <= 1) {
    -[RTScenarioTriggerManager setSettledStateAndSubmitMetricsForSettledState:](self, "setSettledStateAndSubmitMetricsForSettledState:");
  }
}

+ (int64_t)settledStateTypeForScenarioTriggerSettledState:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (void)setSettledStateAndSubmitMetricsForSettledState:(unint64_t)a3
{
  if (self->_settledState != a3)
  {
    uint64_t v6 = [(id)objc_opt_class() settledStateTypeForScenarioTriggerSettledState:self->_settledState];
    uint64_t v7 = [(id)objc_opt_class() settledStateTypeForScenarioTriggerSettledState:a3];
    [(RTScenarioTriggerManager *)self setSettledState:a3];
    id v8 = [RTSettledStateTransition alloc];
    unint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    __int16 v10 = [(RTSettledStateTransition *)v8 initWithDate:v9 transitionFromType:v6 transitionToType:v7];

    v11 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__RTScenarioTriggerManager_setSettledStateAndSubmitMetricsForSettledState___block_invoke;
    block[3] = &unk_1E6B91220;
    uint64_t v14 = v10;
    id v15 = self;
    SEL v16 = a2;
    __int16 v12 = v10;
    dispatch_async(v11, block);
  }
}

void __75__RTScenarioTriggerManager_setSettledStateAndSubmitMetricsForSettledState___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  +[RTSettledStateMetrics submitSettledStateMetricsForSettledStateTransition:*(void *)(a1 + 32) settledStateTransitionStore:*(void *)(*(void *)(a1 + 40) + 88) locationStore:*(void *)(*(void *)(a1 + 40) + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 88);
  v7[0] = *(void *)(a1 + 32);
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__RTScenarioTriggerManager_setSettledStateAndSubmitMetricsForSettledState___block_invoke_2;
  v4[3] = &unk_1E6B90CB8;
  uint64_t v6 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  [v2 storeSettledStateTransitions:v3 handler:v4];
}

void __75__RTScenarioTriggerManager_setSettledStateAndSubmitMetricsForSettledState___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, settledStateTransition, %@, error, %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)setSettledState:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_settledState != a3)
  {
    self->_unint64_t settledState = a3;
    v4 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = +[RTScenarioTriggerManager settledStateName:self->_settledState];
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "set settled state to %@", (uint8_t *)&v11, 0xCu);
    }
    unint64_t settledState = self->_settledState;
    if (settledState == 2)
    {
      if ((self->_monitoredScenarioTriggerTypes & 1) == 0) {
        return;
      }
      int v7 = (void *)[objc_alloc(MEMORY[0x1E4F5CEC8]) initWithType:1];
      id v8 = [(RTScenarioTriggerNotification *)[RTScenarioTriggerManagerNotificationSettled alloc] initWithScenarioTrigger:v7];
      [(RTNotifier *)self postNotification:v8];

      unint64_t settledState = self->_settledState;
    }
    if (settledState == 1 && (self->_monitoredScenarioTriggerTypes & 2) != 0)
    {
      __int16 v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CED0]) initWithType:2];
      uint64_t v10 = [(RTScenarioTriggerNotification *)[RTScenarioTriggerManagerNotificationUnsettled alloc] initWithScenarioTrigger:v9];
      [(RTNotifier *)self postNotification:v10];
    }
  }
}

- (void)setInterestedInConstantFootprint:(unint64_t)a3
{
  unint64_t interestedInConstantFootprint = self->_interestedInConstantFootprint;
  if (interestedInConstantFootprint != a3)
  {
    self->_unint64_t interestedInConstantFootprint = a3;
    if (!a3 || interestedInConstantFootprint)
    {
      if (!a3 && interestedInConstantFootprint)
      {
        wifiFootprintMonitor = self->_wifiFootprintMonitor;
        int v7 = +[RTNotification notificationName];
        [(RTNotifier *)wifiFootprintMonitor removeObserver:self fromNotification:v7];

        [(RTScenarioTriggerManager *)self setWiFiFootprintState:-1];
      }
    }
    else
    {
      id v5 = self->_wifiFootprintMonitor;
      id v8 = +[RTNotification notificationName];
      [(RTNotifier *)v5 addObserver:self selector:sel_onWiFiFootprintStateNotification_ name:v8];
    }
  }
}

- (void)setWiFiFootprintState:(int64_t)a3
{
  if (self->_wiFiFootprintState != a3)
  {
    self->_wiFiFootprintState = a3;
    if ((self->_monitoredScenarioTriggerTypes & 3) != 0) {
      [(RTScenarioTriggerManager *)self _evaluateSettledState];
    }
  }
}

- (void)_startMonitoringScenarioTriggerOfType:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [MEMORY[0x1E4F5CEC0] scenarioTriggerTypeToString:a3];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "start monitoring scenario trigger, %@", (uint8_t *)&v7, 0xCu);
  }
  if (a3 - 1 <= 1) {
    [(RTScenarioTriggerManager *)self setInterestedInSettledState:[(RTScenarioTriggerManager *)self interestedInSettledState] + 1];
  }
}

- (void)_stopMonitoringScenarioTriggerOfType:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [MEMORY[0x1E4F5CEC0] scenarioTriggerTypeToString:a3];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "stop monitoring scenario trigger, %@", (uint8_t *)&v7, 0xCu);
  }
  if (a3 - 1 <= 1) {
    [(RTScenarioTriggerManager *)self setInterestedInSettledState:[(RTScenarioTriggerManager *)self interestedInSettledState] - 1];
  }
}

- (void)setMonitoredScenarioTriggerTypes:(unint64_t)a3
{
  unint64_t monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;
  if (monitoredScenarioTriggerTypes != a3)
  {
    self->_unint64_t monitoredScenarioTriggerTypes = a3;
    unint64_t v5 = monitoredScenarioTriggerTypes ^ a3;
    if (monitoredScenarioTriggerTypes != a3)
    {
      unint64_t v6 = 1;
      do
      {
        if ((v6 & v5) != 0)
        {
          if ((self->_monitoredScenarioTriggerTypes & v6) != 0) {
            [(RTScenarioTriggerManager *)self _startMonitoringScenarioTriggerOfType:v6];
          }
          else {
            [(RTScenarioTriggerManager *)self _stopMonitoringScenarioTriggerOfType:v6];
          }
        }
        v6 *= 2;
      }
      while (v6 <= v5);
    }
  }
}

- (unint64_t)_notificationNameToScenarioTriggerType:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[RTNotification notificationName];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    unint64_t v6 = 1;
  }
  else
  {
    int v7 = +[RTNotification notificationName];
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      unint64_t v6 = 2;
    }
    else
    {
      uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "notification, %@, does not map to scenario trigger type", (uint8_t *)&v11, 0xCu);
      }

      unint64_t v6 = 0;
    }
  }

  return v6;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(RTPlatform *)self->_platform lowEndHardware]
    || ![(RTPlatform *)self->_platform supportsScenarioTriggers])
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v7;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, not supported on this platform", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    if ([(RTNotifier *)self getNumberOfObservers:v7] == 1) {
      [(RTScenarioTriggerManager *)self setMonitoredScenarioTriggerTypes:[(RTScenarioTriggerManager *)self monitoredScenarioTriggerTypes] | [(RTScenarioTriggerManager *)self _notificationNameToScenarioTriggerType:v7]];
    }
    unint64_t settledState = self->_settledState;
    if (settledState == 2)
    {
      uint64_t v9 = +[RTNotification notificationName];
      int v10 = [v7 isEqualToString:v9];

      if (v10)
      {
        int v11 = (void *)[objc_alloc(MEMORY[0x1E4F5CEC8]) initWithType:1];
        id v12 = [(RTScenarioTriggerNotification *)[RTScenarioTriggerManagerNotificationSettled alloc] initWithScenarioTrigger:v11];
      }
      else
      {
        id v12 = 0;
      }
      unint64_t settledState = self->_settledState;
    }
    else
    {
      id v12 = 0;
    }
    if (settledState == 1)
    {
      uint64_t v14 = +[RTNotification notificationName];
      int v15 = [v7 isEqualToString:v14];

      if (v15)
      {
        SEL v16 = (void *)[objc_alloc(MEMORY[0x1E4F5CED0]) initWithType:2];
        id v17 = [(RTScenarioTriggerNotification *)[RTScenarioTriggerManagerNotificationUnsettled alloc] initWithScenarioTrigger:v16];

        id v12 = (RTScenarioTriggerManagerNotificationSettled *)v17;
      }
    }
    if (v12) {
      [(RTNotifier *)self postNotification:v12 toObserver:v6];
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(RTPlatform *)self->_platform lowEndHardware]
    || ![(RTPlatform *)self->_platform supportsScenarioTriggers])
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(RTPlatform *)self->_platform productType];
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      int v11 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@ is not supported on %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (![(RTNotifier *)self getNumberOfObservers:v5])
  {
    [(RTScenarioTriggerManager *)self setMonitoredScenarioTriggerTypes:[(RTScenarioTriggerManager *)self monitoredScenarioTriggerTypes] & ~[(RTScenarioTriggerManager *)self _notificationNameToScenarioTriggerType:v5]];
  }
}

- (void)_onMotionActivityManagerNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    -[RTScenarioTriggerManager setMotionSettledState:](self, "setMotionSettledState:", [v4 settledState]);
  }
  else
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v4 name];
      int v10 = 138412290;
      int v11 = v9;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)onMotionActivityManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __64__RTScenarioTriggerManager_onMotionActivityManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__RTScenarioTriggerManager_onMotionActivityManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onMotionActivityManagerNotification:*(void *)(a1 + 40)];
}

- (void)_onWiFiFootprintStateNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    -[RTScenarioTriggerManager setWiFiFootprintState:](self, "setWiFiFootprintState:", [v4 state]);
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v4 name];
      int v10 = 138412290;
      int v11 = v9;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)onWiFiFootprintStateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __61__RTScenarioTriggerManager_onWiFiFootprintStateNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __61__RTScenarioTriggerManager_onWiFiFootprintStateNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWiFiFootprintStateNotification:*(void *)(a1 + 40)];
}

- (void)postScenarioTriggerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __60__RTScenarioTriggerManager_postScenarioTriggerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __60__RTScenarioTriggerManager_postScenarioTriggerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postScenarioTriggerNotification:*(void *)(a1 + 40)];
}

- (void)_postScenarioTriggerNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "post %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4) {
    [(RTNotifier *)self postNotification:v4];
  }
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if ((unint64_t)(v2 - 1) < 2)
  {
    id v3 = [*(id *)(a1 + 32) settledStateTransitionStore];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke_45;
    v8[3] = &unk_1E6B90C18;
    id v9 = *(id *)(a1 + 48);
    [v3 clearWithHandler:v8];

    id v4 = v9;
LABEL_5:

    return;
  }
  if (!v2)
  {
    id v5 = [*(id *)(a1 + 32) settledStateTransitionStore];
    int v6 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v10[3] = &unk_1E6B92690;
    id v11 = v6;
    id v12 = *(id *)(a1 + 48);
    [v5 purgeSettledStateTransitionsPredating:v11 handler:v10];

    id v4 = v11;
    goto LABEL_5;
  }
  id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);

  v7();
}

void __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) stringFromDate];
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "purge entries from the settled state transition store predating, %@, error, %@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "cleared the settled state transition store with error, %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)interestedInConstantFootprint
{
  return self->_interestedInConstantFootprint;
}

- (unint64_t)interestedInSettledState
{
  return self->_interestedInSettledState;
}

- (RTLocationStore)locationStore
{
  return self->_locationStore;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (unint64_t)motionSettledState
{
  return self->_motionSettledState;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (unint64_t)monitoredScenarioTriggerTypes
{
  return self->_monitoredScenarioTriggerTypes;
}

- (RTSettledStateTransitionStore)settledStateTransitionStore
{
  return self->_settledStateTransitionStore;
}

- (RTWiFiFootprintMonitor)wifiFootprintMonitor
{
  return self->_wifiFootprintMonitor;
}

- (int64_t)wiFiFootprintState
{
  return self->_wiFiFootprintState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiFootprintMonitor, 0);
  objc_storeStrong((id *)&self->_settledStateTransitionStore, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);

  objc_storeStrong((id *)&self->_locationStore, 0);
}

- (void)simulateScenarioTrigger:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTScenarioTriggerManager_Internal__simulateScenarioTrigger_handler___block_invoke;
  block[3] = &unk_1E6B92118;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __70__RTScenarioTriggerManager_Internal__simulateScenarioTrigger_handler___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    if (v2)
    {
      +[RTScenarioTriggerManager scenarioTriggerTypeToNotificationName:](RTScenarioTriggerManager, "scenarioTriggerTypeToNotificationName:", [v2 type]);
      id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v4 = NSClassFromString(v3);
      if (v4)
      {
        int v5 = (void *)[[v4 alloc] initWithScenarioTrigger:*(void *)(a1 + 32)];
        if (v5) {
          [*(id *)(a1 + 40) _postScenarioTriggerNotification:v5];
        }

        id v6 = 0;
      }
      else
      {
        uint64_t v9 = *MEMORY[0x1E4F28568];
        v10[0] = @"Unknown scenario trigger type.";
        id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
        id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v7];
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

@end