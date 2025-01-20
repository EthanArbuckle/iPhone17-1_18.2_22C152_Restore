@interface SOSFlow
+ (BOOL)isInterruptibleState:(int64_t)a3;
+ (BOOL)isInterruptingEvent:(unint64_t)a3;
+ (BOOL)isPreCallState:(int64_t)a3;
+ (BOOL)isTerminalState:(int64_t)a3;
+ (BOOL)isTriggerMechanismUserInitiated:(int64_t)a3;
+ (BOOL)needsHeartbeatForState:(int64_t)a3;
+ (id)validEventsforState:(int64_t)a3;
+ (int64_t)sosFlowStateForString:(id)a3;
+ (unint64_t)sosFlowTypeForTriggerMechanism:(int64_t)a3;
- (BOOL)canDeviceTriggerAutoDialForSOSFlowType:(unint64_t)a3;
- (BOOL)didSeeUnresponsiveResting;
- (BOOL)isUserResponsive;
- (BOOL)shouldIgnoreMotionCancel;
- (BOOL)shouldShowMedicalID;
- (HKHealthStore)healthStore;
- (NSHashTable)observers;
- (NSTimer)flowStateHeartbeatTimer;
- (NSUserDefaults)healthUserDefaults;
- (SOSCoreAnalyticsReporting)coreAnalyticsReporter;
- (SOSFlow)initWithTriggerMechanism:(int64_t)a3 healthStore:(id)a4;
- (_HKMedicalIDData)medicalIDData;
- (double)checkInTimeoutForSOSFlowType:(unint64_t)a3;
- (int64_t)currentState;
- (int64_t)restingState;
- (int64_t)sosFlowTrigger;
- (unint64_t)sosFlowType;
- (void)_invalidateTimer;
- (void)_prefetchMedicalID;
- (void)addObserver:(id)a3;
- (void)callFinished;
- (void)clearFlowStateHeartbeatTimer;
- (void)contactsCountdownDismissed;
- (void)countdownRequestedDial;
- (void)eventTriggered;
- (void)handleEmergencyCallInititated;
- (void)handleEmergencyFallback;
- (void)handleSOSFlowEvent:(unint64_t)a3 withMetaData:(id)a4;
- (void)handleUserExited;
- (void)motionDidCancel;
- (void)removeObserver:(id)a3;
- (void)setCoreAnalyticsReporter:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setDidSeeUnresponsiveResting:(BOOL)a3;
- (void)setFlowStateHeartbeatTimer:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setHealthUserDefaults:(id)a3;
- (void)setIsUserResponsive:(BOOL)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setObservers:(id)a3;
- (void)setShouldIgnoreMotionCancel:(BOOL)a3;
- (void)setSosFlowType:(unint64_t)a3;
- (void)startAnomalyFlow;
- (void)startFlowStateHeartbeatTimer;
- (void)startTimerToAutoDial;
- (void)timerFired:(id)a3;
- (void)timerRequestsCountdownToAutoCall;
- (void)updateState:(int64_t)a3;
- (void)userDismissedCallCountdown;
- (void)userRespondedToConfirmationWith:(unint64_t)a3;
- (void)userRespondedToRestingStateWith:(int64_t)a3;
- (void)willHandleEvent:(unint64_t)a3 withMetaData:(id)a4;
@end

@implementation SOSFlow

- (SOSFlow)initWithTriggerMechanism:(int64_t)a3 healthStore:(id)a4
{
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SOSFlow;
  v8 = [(SOSFlow *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_sosFlowTrigger = a3;
    v8->_sosFlowType = +[SOSFlow sosFlowTypeForTriggerMechanism:a3];
    v9->_currentState = 14;
    id v10 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v11 = [v10 initWithSuiteName:*MEMORY[0x1E4F2BE48]];
    healthUserDefaults = v9->_healthUserDefaults;
    v9->_healthUserDefaults = (NSUserDefaults *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v13;

    v9->_isUserResponsive = +[SOSFlow isTriggerMechanismUserInitiated:a3];
    v9->_shouldIgnoreMotionCancel = 0;
    objc_storeStrong((id *)&v9->_healthStore, a4);
    medicalIDData = v9->_medicalIDData;
    v9->_medicalIDData = 0;

    v9->_didSeeUnresponsiveResting = 0;
    [(SOSFlow *)v9 _prefetchMedicalID];
    uint64_t v16 = +[SOSCoreAnalyticsReporter sharedInstance];
    coreAnalyticsReporter = v9->_coreAnalyticsReporter;
    v9->_coreAnalyticsReporter = (SOSCoreAnalyticsReporting *)v16;
  }
  return v9;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSFlow *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSFlow *)self observers];
  [v5 removeObject:v4];
}

- (void)handleSOSFlowEvent:(unint64_t)a3 withMetaData:(id)a4
{
  id v6 = a4;
  [(SOSFlow *)self willHandleEvent:a3 withMetaData:v6];
  id v7 = +[SOSFlow validEventsforState:[(SOSFlow *)self currentState]];
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  if ([v7 containsObject:v8])
  {

    goto LABEL_4;
  }
  BOOL v9 = +[SOSFlow isInterruptingEvent:a3];

  if (v9)
  {
LABEL_4:
    switch(a3)
    {
      case 0uLL:
        [(SOSFlow *)self eventTriggered];
        break;
      case 2uLL:
        [(SOSFlow *)self _invalidateTimer];
        uint64_t v11 = [v6 objectForKeyedSubscript:&unk_1F0C4A9C0];
        uint64_t v12 = [v11 integerValue];

        [(SOSFlow *)self userRespondedToConfirmationWith:v12];
        break;
      case 3uLL:
        [(SOSFlow *)self userDismissedCallCountdown];
        break;
      case 4uLL:
      case 5uLL:
        [(SOSFlow *)self callFinished];
        break;
      case 6uLL:
        [(SOSFlow *)self countdownRequestedDial];
        break;
      case 7uLL:
        [(SOSFlow *)self contactsCountdownDismissed];
        break;
      case 8uLL:
        uint64_t v13 = [v6 objectForKeyedSubscript:&unk_1F0C4A9D8];
        uint64_t v14 = [v13 integerValue];

        [(SOSFlow *)self userRespondedToRestingStateWith:v14];
        break;
      case 9uLL:
        [(SOSFlow *)self timerRequestsCountdownToAutoCall];
        break;
      case 0xAuLL:
        [(SOSFlow *)self motionDidCancel];
        break;
      case 0xBuLL:
        [(SOSFlow *)self handleEmergencyFallback];
        break;
      case 0xCuLL:
        [(SOSFlow *)self setShouldIgnoreMotionCancel:1];
        break;
      case 0xDuLL:
        [(SOSFlow *)self handleEmergencyCallInititated];
        break;
      case 0xEuLL:
        [(SOSFlow *)self handleUserExited];
        break;
      default:
        goto LABEL_9;
    }
    goto LABEL_9;
  }
  id v10 = sos_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SOSFlow handleSOSFlowEvent:withMetaData:](a3, self, v10);
  }

LABEL_9:
}

+ (BOOL)isInterruptingEvent:(unint64_t)a3
{
  return a3 - 13 < 2;
}

+ (BOOL)isTerminalState:(int64_t)a3
{
  return ((a3 - 6) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

+ (BOOL)isInterruptibleState:(int64_t)a3
{
  return ((unint64_t)a3 < 0xE) & (0x3B80u >> a3);
}

+ (BOOL)isPreCallState:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

+ (unint64_t)sosFlowTypeForTriggerMechanism:(int64_t)a3
{
  if (a3 == 7) {
    return 2;
  }
  else {
    return a3 != 5;
  }
}

- (void)eventTriggered
{
  unint64_t v3 = [(SOSFlow *)self sosFlowTrigger];
  if (v3 > 8) {
    return;
  }
  if (((1 << v3) & 0x158) != 0)
  {
    id v5 = self;
    uint64_t v6 = 3;
    goto LABEL_6;
  }
  uint64_t v4 = 1 << v3;
  id v5 = self;
  if ((v4 & 7) != 0)
  {
    uint64_t v6 = 2;
LABEL_6:
    [(SOSFlow *)v5 updateState:v6];
    return;
  }

  [(SOSFlow *)self startAnomalyFlow];
}

- (void)startAnomalyFlow
{
  [(SOSFlow *)self startTimerToAutoDial];

  [(SOSFlow *)self updateState:1];
}

- (void)userRespondedToConfirmationWith:(unint64_t)a3
{
  if (a3 == 2) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 6;
  }
  [(SOSFlow *)self updateState:v3];
}

- (void)callFinished
{
  if ([(SOSFlow *)self didSeeUnresponsiveResting])
  {
    int64_t v3 = 10;
  }
  else
  {
    uint64_t v4 = objc_alloc_init(SOSContactsManager);
    BOOL v5 = [(SOSContactsManager *)v4 hasValidContactsToMessage];

    if (v5) {
      int64_t v3 = 5;
    }
    else {
      int64_t v3 = [(SOSFlow *)self restingState];
    }
  }

  [(SOSFlow *)self updateState:v3];
}

- (void)userDismissedCallCountdown
{
}

- (void)countdownRequestedDial
{
  if (+[SOSUtilities shouldSkipNewtonCall])
  {
    uint64_t v3 = 7;
  }
  else if (+[SOSFlow isTriggerMechanismUserInitiated:[(SOSFlow *)self sosFlowTrigger]])
  {
    uint64_t v3 = 3;
  }
  else
  {
    uint64_t v3 = 4;
  }

  [(SOSFlow *)self updateState:v3];
}

- (void)contactsCountdownDismissed
{
  int64_t v3 = [(SOSFlow *)self restingState];

  [(SOSFlow *)self updateState:v3];
}

- (void)timerRequestsCountdownToAutoCall
{
}

- (void)motionDidCancel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(SOSFlow *)self shouldIgnoreMotionCancel])
  {
    int64_t v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      BOOL v5 = "-[SOSFlow motionDidCancel]";
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s: Ignoring SOSFlowEventMotionDidCancel", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    [(SOSFlow *)self updateState:12];
    [(SOSFlow *)self _invalidateTimer];
  }
}

- (void)userRespondedToRestingStateWith:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2:
      uint64_t v5 = 10;
      goto LABEL_7;
    case 1:
      uint64_t v5 = 8;
      goto LABEL_7;
    case 0:
      uint64_t v5 = 3;
LABEL_7:
      [(SOSFlow *)self updateState:v5];
      goto LABEL_11;
  }
  uint64_t v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    BOOL v9 = "-[SOSFlow userRespondedToRestingStateWith:]";
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "%s: Unexpected SOSResponse from resting state", (uint8_t *)&v8, 0xCu);
  }

LABEL_11:
  id v7 = [(SOSFlow *)self coreAnalyticsReporter];
  objc_msgSend(v7, "reportSOSRestingResponse:restingResponse:hasMedicalID:", -[SOSFlow sosFlowTrigger](self, "sosFlowTrigger"), a3, -[SOSFlow shouldShowMedicalID](self, "shouldShowMedicalID"));
}

- (void)handleEmergencyFallback
{
}

- (void)handleEmergencyCallInititated
{
  if (+[SOSFlow isPreCallState:[(SOSFlow *)self currentState]])
  {
    [(SOSFlow *)self updateState:10];
  }
}

- (void)handleUserExited
{
}

- (void)_prefetchMedicalID
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "SOSFlow, prefetchMedicalID", v1, 2u);
}

void __29__SOSFlow__prefetchMedicalID__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 7, a2);
  }
}

- (BOOL)shouldShowMedicalID
{
  if (!self->_medicalIDData) {
    return 0;
  }
  v2 = [(SOSFlow *)self healthUserDefaults];
  int64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F2BE28]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int64_t)restingState
{
  if ([(SOSFlow *)self sosFlowTrigger] == 7 && ![(SOSFlow *)self isUserResponsive]) {
    return 9;
  }
  if ([(SOSFlow *)self shouldShowMedicalID]) {
    return 8;
  }
  return 10;
}

- (void)updateState:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = SOSStringForSOSFlowState(a3);
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSFlow: Updating state to %@", buf, 0xCu);
  }
  [(SOSFlow *)self setCurrentState:a3];
  if ([(SOSFlow *)self currentState] == 9) {
    [(SOSFlow *)self setDidSeeUnresponsiveResting:1];
  }
  id v7 = +[SOSStatusReporter sharedInstance];
  [v7 updateSOSFlowState:a3];

  [(SOSFlow *)self startFlowStateHeartbeatTimer];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v8 = [(SOSFlow *)self observers];
  BOOL v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13++), "sosFlow:didChangeToState:", self, -[SOSFlow currentState](self, "currentState"));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if ((unint64_t)(a3 - 3) <= 1)
  {
    BOOL v14 = [(SOSFlow *)self isUserResponsive];
    uint64_t v15 = a3 == 3 || v14;
    [(SOSFlow *)self setIsUserResponsive:v15];
  }
}

- (void)willHandleEvent:(unint64_t)a3 withMetaData:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = sos_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = sosFlowEventDescription(a3);
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "SOSFlow: Will handle event %@", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v9 = [(SOSFlow *)self observers];
  uint64_t v10 = (void *)[v9 copy];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) sosFlow:self willHandleEvent:a3 withMetaData:v6];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (double)checkInTimeoutForSOSFlowType:(unint64_t)a3
{
  double result = 32.0;
  if (a3 == 2) {
    return 10.0;
  }
  return result;
}

- (void)startTimerToAutoDial
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(SOSFlow *)self checkInTimeoutForSOSFlowType:[(SOSFlow *)self sosFlowType]];
  double v4 = v3;
  uint64_t v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    double v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = @"com.apple.sos.sosFlow";
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Starting countdown: %f for service identifier: %@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = (PCPersistentTimer *)[objc_alloc(MEMORY[0x1E4F89D38]) initWithTimeInterval:@"com.apple.sos.sosFlow" serviceIdentifier:self target:sel_timerFired_ selector:0 userInfo:v4];
  timer = self->_timer;
  self->_timer = v6;

  [(PCPersistentTimer *)self->_timer setMinimumEarlyFireProportion:1.0];
  int v8 = self->_timer;
  BOOL v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(PCPersistentTimer *)v8 scheduleInRunLoop:v9];
}

- (void)timerFired:(id)a3
{
  double v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "Timer fired for autodial", buf, 2u);
  }

  if ([(SOSFlow *)self canDeviceTriggerAutoDialForSOSFlowType:[(SOSFlow *)self sosFlowType]])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__SOSFlow_timerFired___block_invoke;
    block[3] = &unk_1E6064200;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Skipping autodial countdown", buf, 2u);
    }
  }
}

uint64_t __22__SOSFlow_timerFired___block_invoke(uint64_t a1)
{
  v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "Calling SOSFlow countdownRequestedDial", v4, 2u);
  }

  return [*(id *)(a1 + 32) timerRequestsCountdownToAutoCall];
}

- (void)_invalidateTimer
{
  if (self->_timer)
  {
    double v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating SOSFlow timer", v5, 2u);
    }

    [(PCPersistentTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (BOOL)canDeviceTriggerAutoDialForSOSFlowType:(unint64_t)a3
{
  return 1;
}

- (void)startFlowStateHeartbeatTimer
{
  [(SOSFlow *)self clearFlowStateHeartbeatTimer];
  BOOL v3 = +[SOSFlow needsHeartbeatForState:[(SOSFlow *)self currentState]];
  double v4 = sos_default_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSFlow,starting flow state heartbeat timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v6 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__SOSFlow_startFlowStateHeartbeatTimer__block_invoke;
    v8[3] = &unk_1E6064698;
    objc_copyWeak(&v9, buf);
    id v7 = [v6 scheduledTimerWithTimeInterval:1 repeats:v8 block:35.0];
    [(SOSFlow *)self setFlowStateHeartbeatTimer:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSFlow,not starting flow state heartbeat timer", (uint8_t *)buf, 2u);
    }
  }
}

void __39__SOSFlow_startFlowStateHeartbeatTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = +[SOSFlow needsHeartbeatForState:](SOSFlow, "needsHeartbeatForState:", [WeakRetained currentState]);
  BOOL v3 = sos_default_log();
  double v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSFlow,sos flow state heartbeat timer fired", v6, 2u);
    }

    BOOL v5 = +[SOSStatusReporter sharedInstance];
    objc_msgSend(v5, "updateSOSFlowState:", objc_msgSend(WeakRetained, "currentState"));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __39__SOSFlow_startFlowStateHeartbeatTimer__block_invoke_cold_1(v4);
    }

    [WeakRetained clearFlowStateHeartbeatTimer];
  }
}

- (void)clearFlowStateHeartbeatTimer
{
  BOOL v3 = [(SOSFlow *)self flowStateHeartbeatTimer];

  if (v3)
  {
    double v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSFlow,clearing sos flow state heartbeat timer", v6, 2u);
    }

    BOOL v5 = [(SOSFlow *)self flowStateHeartbeatTimer];
    [v5 invalidate];

    [(SOSFlow *)self setFlowStateHeartbeatTimer:0];
  }
}

+ (BOOL)needsHeartbeatForState:(int64_t)a3
{
  return ((unint64_t)a3 < 0xD) & (0x1A06u >> a3);
}

+ (id)validEventsforState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xD) {
    return &unk_1F0C4AC18;
  }
  else {
    return (id)qword_1E6064728[a3 - 1];
  }
}

+ (BOOL)isTriggerMechanismUserInitiated:(int64_t)a3
{
  return ((unint64_t)a3 < 9) & (0x15Eu >> a3);
}

+ (int64_t)sosFlowStateForString:(id)a3
{
  return +[SOSUtilities SOSFlowStateForString:a3];
}

- (unint64_t)sosFlowType
{
  return self->_sosFlowType;
}

- (void)setSosFlowType:(unint64_t)a3
{
  self->_sosFlowType = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (NSUserDefaults)healthUserDefaults
{
  return self->_healthUserDefaults;
}

- (void)setHealthUserDefaults:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (int64_t)sosFlowTrigger
{
  return self->_sosFlowTrigger;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)isUserResponsive
{
  return self->_isUserResponsive;
}

- (void)setIsUserResponsive:(BOOL)a3
{
  self->_isUserResponsive = a3;
}

- (BOOL)shouldIgnoreMotionCancel
{
  return self->_shouldIgnoreMotionCancel;
}

- (void)setShouldIgnoreMotionCancel:(BOOL)a3
{
  self->_shouldIgnoreMotionCancel = a3;
}

- (BOOL)didSeeUnresponsiveResting
{
  return self->_didSeeUnresponsiveResting;
}

- (void)setDidSeeUnresponsiveResting:(BOOL)a3
{
  self->_didSeeUnresponsiveResting = a3;
}

- (NSTimer)flowStateHeartbeatTimer
{
  return self->_flowStateHeartbeatTimer;
}

- (void)setFlowStateHeartbeatTimer:(id)a3
{
}

- (SOSCoreAnalyticsReporting)coreAnalyticsReporter
{
  return self->_coreAnalyticsReporter;
}

- (void)setCoreAnalyticsReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_flowStateHeartbeatTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_healthUserDefaults, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)handleSOSFlowEvent:(NSObject *)a3 withMetaData:.cold.1(unint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = sosFlowEventDescription(a1);
  id v6 = SOSStringForSOSFlowState([a2 currentState]);
  int v7 = 138412546;
  int v8 = v5;
  __int16 v9 = 2112;
  int v10 = v6;
  _os_log_error_impl(&dword_1B3A94000, a3, OS_LOG_TYPE_ERROR, "Invalid event %@ for current state %@!", (uint8_t *)&v7, 0x16u);
}

void __39__SOSFlow_startFlowStateHeartbeatTimer__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "SOSFlow,heartbeat timer fired unexpectedly", v1, 2u);
}

@end