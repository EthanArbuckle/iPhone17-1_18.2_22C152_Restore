@interface SBHIDUISensorModeController
- (BOOL)_hasModeAssertions;
- (BOOL)isProximityDetectionEnabled;
- (BOOL)pocketTouchesExpected;
- (BOOL)shouldUseLowPowerActiveProxDetectionMode;
- (SBHIDUISensorModeController)init;
- (SBHIDUISensorModeController)initWithSensorService:(id)a3;
- (id)_requestSensorModeAssertionForReason:(id)a3 source:(int64_t)a4 builder:(id)a5;
- (id)addStartupHIDLockAssertion;
- (id)assertBaselineDisabledDigitizerMode:(int64_t)a3 source:(int64_t)a4 reason:(id)a5;
- (id)assertDisplayState:(int64_t)a3 source:(int64_t)a4 reason:(id)a5;
- (id)requestProximityMode:(int)a3 forReason:(id)a4;
- (id)sensorModeTransactionForBacklightChangeSource:(int64_t)a3;
- (id)suspendProximityDetection:(BOOL)a3 disableDigitizer:(int64_t)a4 source:(int64_t)a5 reason:(id)a6;
- (id)suspendProximityDetectionAndDisableDigitizer:(int64_t)a3 source:(int64_t)a4 reason:(id)a5;
- (id)suspendProximityDetectionForSource:(int64_t)a3 reason:(id)a4;
- (void)_reevaluateLockStateForSource:(int64_t)a3;
- (void)_removeHIDUISensorModeAssertion:(id)a3;
- (void)cache:(id)a3 didUpdateActiveAudioRoute:(id)a4;
- (void)invalidate;
- (void)resetProximityCalibration;
- (void)setPocketTouchesExpected:(BOOL)a3;
- (void)setProximityDetectionEnabled:(BOOL)a3;
- (void)setProximityDetectionEnabled:(BOOL)a3 changeSource:(unint64_t)a4;
@end

@implementation SBHIDUISensorModeController

- (SBHIDUISensorModeController)init
{
  v3 = [MEMORY[0x1E4F4F330] sharedInstance];
  v4 = [(SBHIDUISensorModeController *)self initWithSensorService:v3];

  return v4;
}

- (SBHIDUISensorModeController)initWithSensorService:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SBHIDUISensorModeController;
  v6 = [(SBHIDUISensorModeController *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sensorService, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assertions = v7->_assertions;
    v7->_assertions = v8;

    uint64_t v10 = +[SBAVSystemControllerCache sharedInstance];
    avCache = v7->_avCache;
    v7->_avCache = (SBAVSystemControllerCache *)v10;

    [(SBAVSystemControllerCache *)v7->_avCache addObserver:v7];
    objc_initWeak(&location, v7);
    v12 = (void *)MEMORY[0x1E4F4F6E8];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __53__SBHIDUISensorModeController_initWithSensorService___block_invoke;
    v21[3] = &unk_1E6AF92D8;
    objc_copyWeak(&v22, &location);
    uint64_t v13 = [v12 assertionWithIdentifier:@"digitizerModeBaseline" stateDidChangeHandler:v21];
    digitizerModeBaselineAssertion = v7->_digitizerModeBaselineAssertion;
    v7->_digitizerModeBaselineAssertion = (BSCompoundAssertion *)v13;

    v15 = (void *)MEMORY[0x1E4F4F6E8];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__SBHIDUISensorModeController_initWithSensorService___block_invoke_2;
    v19[3] = &unk_1E6AF92D8;
    objc_copyWeak(&v20, &location);
    uint64_t v16 = [v15 assertionWithIdentifier:@"proximityMode" stateDidChangeHandler:v19];
    proximityModeAssertion = v7->_proximityModeAssertion;
    v7->_proximityModeAssertion = (BSCompoundAssertion *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __53__SBHIDUISensorModeController_initWithSensorService___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reevaluateLockStateForSource:0];
}

void __53__SBHIDUISensorModeController_initWithSensorService___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reevaluateLockStateForSource:0];
}

- (void)invalidate
{
  [(BSCompoundAssertion *)self->_digitizerModeBaselineAssertion invalidate];
  digitizerModeBaselineAssertion = self->_digitizerModeBaselineAssertion;
  self->_digitizerModeBaselineAssertion = 0;

  [(BSCompoundAssertion *)self->_proximityModeAssertion invalidate];
  proximityModeAssertion = self->_proximityModeAssertion;
  self->_proximityModeAssertion = 0;

  [(BSInvalidatable *)self->_proximityDetectionModeAssertion invalidate];
  proximityDetectionModeAssertion = self->_proximityDetectionModeAssertion;
  self->_proximityDetectionModeAssertion = 0;
}

- (void)_reevaluateLockStateForSource:(int64_t)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (self->_sensorModeTransactionCount) {
    return;
  }
  v4 = self;
  v45 = [MEMORY[0x1E4F1CA70] orderedSetWithObject:@"SB"];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v5 = v4->_assertions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (!v6)
  {

    LOBYTE(v9) = 0;
    uint64_t v8 = 0;
    BOOL v21 = a3 == 3;
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  v43 = v4;
  uint64_t v8 = 0;
  int v9 = 0;
  int v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v54;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v54 != v12) {
        objc_enumerationMutation(v5);
      }
      v14 = *(void **)(*((void *)&v53 + 1) + 8 * i);
      uint64_t v15 = [v14 digitizerMode];
      if (v15 > v11) {
        uint64_t v11 = v15;
      }
      uint64_t v16 = [v14 displayState];
      if (qword_1D8FD3670[v16] > qword_1D8FD3670[v8]) {
        uint64_t v8 = v16;
      }
      v10 |= [v14 suspendProximitySensor];
      v9 |= [v14 pocketTouchesExpected];
      v17 = [v14 reason];
      [v45 addObject:v17];
    }
    uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v53 objects:v60 count:16];
  }
  while (v7);

  v4 = v43;
  if ((unint64_t)(v11 - 1) <= 2
    && [(BSCompoundAssertion *)v43->_digitizerModeBaselineAssertion isActive])
  {
    v18 = [(BSCompoundAssertion *)v43->_digitizerModeBaselineAssertion context];
    v19 = objc_msgSend(v18, "bs_reduce:block:", &unk_1F334B840, &__block_literal_global_419);
    uint64_t v11 = [v19 integerValue];
    if (v11 == 4) {
      uint64_t v8 = 1;
    }
    id v20 = [(BSCompoundAssertion *)v43->_digitizerModeBaselineAssertion reasons];
    [v45 unionSet:v20];
  }
  BOOL v21 = a3 == 3;
  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      int v22 = 20;
      goto LABEL_37;
    }
LABEL_23:
    if ([(BSCompoundAssertion *)v4->_proximityModeAssertion isActive])
    {
      BOOL v44 = v21;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v23 = v4;
      objc_super v24 = [(BSCompoundAssertion *)v4->_proximityModeAssertion orderedContext];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        int v22 = 0;
        uint64_t v27 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v50 != v27) {
              objc_enumerationMutation(v24);
            }
            int v29 = [*(id *)(*((void *)&v49 + 1) + 8 * j) intValue];
            uint64_t v30 = BKSHIDServicesProximityDetectionModePriority();
            if (v30 > BKSHIDServicesProximityDetectionModePriority()) {
              int v22 = v29;
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v49 objects:v59 count:16];
        }
        while (v26);
      }
      else
      {
        int v22 = 0;
      }

      v4 = v23;
      v31 = [(BSCompoundAssertion *)v23->_proximityModeAssertion reasons];
      [v45 unionSet:v31];

      uint64_t v11 = 0;
      BOOL v21 = v44;
    }
    else
    {
      uint64_t v11 = 0;
      int v22 = 0;
    }
    goto LABEL_37;
  }
  int v22 = 5;
LABEL_37:
  v32 = [v45 array];
  v33 = [v32 componentsJoinedByString:@" + "];

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __61__SBHIDUISensorModeController__reevaluateLockStateForSource___block_invoke_2;
  v46[3] = &__block_descriptor_61_e35_v16__0__BKSMutableHIDUISensorMode_8l;
  int v47 = v22;
  v46[4] = v8;
  v46[5] = v11;
  char v48 = v9 & 1;
  v46[6] = v21;
  v34 = [MEMORY[0x1E4F4F328] buildModeForReason:v33 builder:v46];
  char v35 = [(BKSHIDUISensorMode *)v4->_sensorMode isEqual:v34];
  v36 = SBLogProximitySensor();
  BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  if (v35)
  {
    if (v37)
    {
      sensorMode = v4->_sensorMode;
      *(_DWORD *)buf = 138543362;
      v58 = sensorMode;
      _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "reevalute: no change -- %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v37)
    {
      *(_DWORD *)buf = 138543362;
      v58 = v34;
      _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "reevalute: -> %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v4->_sensorMode, v34);
    v36 = [(BKSHIDUISensorService *)v4->_sensorService suppressUISensorChangesForReason:@"SB transaction"];
    sensorService = v4->_sensorService;
    v40 = v4->_sensorModeAssertion;
    uint64_t v41 = [(BKSHIDUISensorService *)sensorService requestUISensorMode:v34];
    sensorModeAssertion = v4->_sensorModeAssertion;
    v4->_sensorModeAssertion = (BSInvalidatable *)v41;

    [(BSInvalidatable *)v40 invalidate];
    [v36 invalidate];
  }
}

id __61__SBHIDUISensorModeController__reevaluateLockStateForSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 integerValue];
  if (v6 <= [v4 integerValue]) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = v5;
  }
  id v8 = v7;

  return v8;
}

void __61__SBHIDUISensorModeController__reevaluateLockStateForSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 setProximityDetectionMode:*(unsigned int *)(a1 + 56)];
    id v3 = v4;
    if (*(_DWORD *)(a1 + 56) == 13)
    {
      [v4 setPostEventWithCurrentDetectionMask:1];
      id v3 = v4;
    }
  }
  [v3 setDisplayState:*(void *)(a1 + 32)];
  switch(*(void *)(a1 + 40))
  {
    case 0:
      [v4 setDigitizerEnabled:1];
      if (*(unsigned char *)(a1 + 60)) {
        [v4 setPocketTouchesExpected:1];
      }
      break;
    case 1:
      [v4 setTapToWakeEnabled:1];
      break;
    case 2:
      [v4 setTapToWakeEnabled:1];
      goto LABEL_10;
    case 3:
      [v4 setWakeOnTapThroughEnabled:1];
LABEL_10:
      [v4 setWakeOnSwipeEnabled:1];
      [v4 setCoverGestureEnabled:1];
      break;
    default:
      break;
  }
  [v4 setChangeSource:*(void *)(a1 + 48)];
}

- (id)_requestSensorModeAssertionForReason:(id)a3 source:(int64_t)a4 builder:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, SBHIDUISensorModeAssertion *))a5;
  id v9 = a3;
  int v10 = objc_alloc_init(SBHIDUISensorModeAssertion);
  [(SBHIDUISensorModeAssertion *)v10 setSensorModeController:self];
  [(SBHIDUISensorModeAssertion *)v10 setReason:v9];

  [(SBHIDUISensorModeAssertion *)v10 setSource:a4];
  v8[2](v8, v10);

  [(NSMutableArray *)self->_assertions addObject:v10];
  uint64_t v11 = SBLogProximitySensor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    v14 = v10;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "add: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  [(SBHIDUISensorModeController *)self _reevaluateLockStateForSource:a4];
  return v10;
}

- (BOOL)pocketTouchesExpected
{
  return self->_pocketTouchesAssertion != 0;
}

- (void)setPocketTouchesExpected:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  pocketTouchesAssertion = self->_pocketTouchesAssertion;
  if ((((pocketTouchesAssertion == 0) ^ v3) & 1) == 0)
  {
    if (v3)
    {
      uint64_t v6 = objc_alloc_init(SBHIDUISensorModeAssertion);
      [(SBHIDUISensorModeAssertion *)v6 setSensorModeController:self];
      [(SBHIDUISensorModeAssertion *)v6 setReason:@"pocketTouches"];
      [(SBHIDUISensorModeAssertion *)v6 setSource:0];
      [(SBHIDUISensorModeAssertion *)v6 setPocketTouchesExpected:1];
      uint64_t v7 = self->_pocketTouchesAssertion;
      self->_pocketTouchesAssertion = v6;
      id v8 = v6;

      [(NSMutableArray *)self->_assertions addObject:self->_pocketTouchesAssertion];
    }
    else
    {
      [(SBHIDUISensorModeAssertion *)pocketTouchesAssertion invalidate];
      id v8 = self->_pocketTouchesAssertion;
      self->_pocketTouchesAssertion = 0;
    }

    [(SBHIDUISensorModeController *)self _reevaluateLockStateForSource:29];
  }
}

- (id)addStartupHIDLockAssertion
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_alloc_init(SBHIDUISensorModeAssertion);
  [(SBHIDUISensorModeAssertion *)v3 setSensorModeController:self];
  [(SBHIDUISensorModeAssertion *)v3 setDigitizerMode:1];
  [(SBHIDUISensorModeAssertion *)v3 setSuspendProximitySensor:1];
  [(SBHIDUISensorModeAssertion *)v3 setReason:@"boot"];
  [(NSMutableArray *)self->_assertions addObject:v3];
  id v4 = SBLogProximitySensor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "add: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(SBHIDUISensorModeController *)self _reevaluateLockStateForSource:15];
  return v3;
}

- (void)_removeHIDUISensorModeAssertion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogProximitySensor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "remove: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(NSMutableArray *)self->_assertions removeObject:v4];
  [(SBHIDUISensorModeController *)self _reevaluateLockStateForSource:0];
}

- (id)suspendProximityDetectionForSource:(int64_t)a3 reason:(id)a4
{
  return [(SBHIDUISensorModeController *)self _requestSensorModeAssertionForReason:a4 source:a3 builder:&__block_literal_global_31_6];
}

uint64_t __73__SBHIDUISensorModeController_suspendProximityDetectionForSource_reason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSuspendProximitySensor:1];
}

- (id)suspendProximityDetection:(BOOL)a3 disableDigitizer:(int64_t)a4 source:(int64_t)a5 reason:(id)a6
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__SBHIDUISensorModeController_suspendProximityDetection_disableDigitizer_source_reason___block_invoke;
  v8[3] = &__block_descriptor_41_e36_v16__0__SBHIDUISensorModeAssertion_8l;
  v8[4] = a4;
  BOOL v9 = a3;
  int v6 = [(SBHIDUISensorModeController *)self _requestSensorModeAssertionForReason:a6 source:a5 builder:v8];
  return v6;
}

void __88__SBHIDUISensorModeController_suspendProximityDetection_disableDigitizer_source_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDigitizerMode:v3];
  [v4 setSuspendProximitySensor:*(unsigned __int8 *)(a1 + 40)];
}

- (id)suspendProximityDetectionAndDisableDigitizer:(int64_t)a3 source:(int64_t)a4 reason:(id)a5
{
  return [(SBHIDUISensorModeController *)self suspendProximityDetection:1 disableDigitizer:a3 source:a4 reason:a5];
}

- (id)assertDisplayState:(int64_t)a3 source:(int64_t)a4 reason:(id)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SBHIDUISensorModeController_assertDisplayState_source_reason___block_invoke;
  v7[3] = &__block_descriptor_40_e36_v16__0__SBHIDUISensorModeAssertion_8l;
  v7[4] = a3;
  id v5 = [(SBHIDUISensorModeController *)self _requestSensorModeAssertionForReason:a5 source:a4 builder:v7];
  return v5;
}

uint64_t __64__SBHIDUISensorModeController_assertDisplayState_source_reason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisplayState:*(void *)(a1 + 32)];
}

- (id)assertBaselineDisabledDigitizerMode:(int64_t)a3 source:(int64_t)a4 reason:(id)a5
{
  digitizerModeBaselineAssertion = self->_digitizerModeBaselineAssertion;
  id v7 = NSNumber;
  id v8 = a5;
  BOOL v9 = [v7 numberWithInteger:a3];
  int v10 = [(BSCompoundAssertion *)digitizerModeBaselineAssertion acquireForReason:v8 withContext:v9];

  return v10;
}

- (id)sensorModeTransactionForBacklightChangeSource:(int64_t)a3
{
  objc_initWeak(&location, self);
  ++self->_sensorModeTransactionCount;
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__SBHIDUISensorModeController_sensorModeTransactionForBacklightChangeSource___block_invoke;
  v8[3] = &unk_1E6AF5008;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  int v6 = (void *)[v5 initWithIdentifier:@"sensorModeTransaction" forReason:@"hello" invalidationBlock:v8];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return v6;
}

void __77__SBHIDUISensorModeController_sensorModeTransactionForBacklightChangeSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    --WeakRetained[9];
    uint64_t v3 = WeakRetained;
    [WeakRetained _reevaluateLockStateForSource:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (id)requestProximityMode:(int)a3 forReason:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  proximityModeAssertion = self->_proximityModeAssertion;
  int v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithUnsignedInt:v4];
  BOOL v9 = [(BSCompoundAssertion *)proximityModeAssertion acquireForReason:v7 withContext:v8];

  return v9;
}

- (BOOL)_hasModeAssertions
{
  return [(NSMutableArray *)self->_assertions count] != 0;
}

- (void)cache:(id)a3 didUpdateActiveAudioRoute:(id)a4
{
  id v7 = a4;
  id v5 = +[SBTelephonyManager sharedTelephonyManager];
  if [v5 inCall] && (objc_msgSend(v7, "isEqualToString:", @"Receiver")) {
    char v6 = 0;
  }
  else {
    char v6 = _os_feature_enabled_impl();
  }
  self->_shouldUseLowPowerActiveProxDetectionMode = v6;
}

- (void)setProximityDetectionEnabled:(BOOL)a3
{
}

- (void)setProximityDetectionEnabled:(BOOL)a3 changeSource:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_proximityDetectionEnabled != a3)
  {
    self->_proximityDetectionEnabled = a3;
    if ([(SBHIDUISensorModeController *)self isProximityDetectionEnabled])
    {
      if (self->_shouldUseLowPowerActiveProxDetectionMode) {
        int v6 = 6;
      }
      else {
        int v6 = 3;
      }
      id v7 = @"low power mode active";
      if (!self->_shouldUseLowPowerActiveProxDetectionMode) {
        id v7 = @"active";
      }
      id v8 = v7;
    }
    else
    {
      int v6 = 0;
      id v8 = @"inactive";
    }
    BOOL v9 = NSString;
    int v10 = NSStringFromBKSHIDUISensorChangeSource();
    uint64_t v11 = [v9 stringWithFormat:@"%s Setting prox sensor to: %@ changeSource: %@", "-[SBHIDUISensorModeController setProximityDetectionEnabled:changeSource:]", v8, v10];

    uint64_t v12 = SBLogProximitySensor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v22 = v11;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (v6)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __73__SBHIDUISensorModeController_setProximityDetectionEnabled_changeSource___block_invoke;
      v19[3] = &__block_descriptor_44_e35_v16__0__BKSMutableHIDUISensorMode_8l;
      int v20 = v6;
      void v19[4] = a4;
      int v13 = [MEMORY[0x1E4F4F328] buildModeForReason:v11 builder:v19];
      v14 = (void *)MEMORY[0x1E4F4F330];
      uint64_t v15 = self->_proximityDetectionModeAssertion;
      uint64_t v16 = [v14 sharedInstance];
      v17 = [v16 requestUISensorMode:v13];
      proximityDetectionModeAssertion = self->_proximityDetectionModeAssertion;
      self->_proximityDetectionModeAssertion = v17;

      [(BSInvalidatable *)v15 invalidate];
    }
    else
    {
      [(BSInvalidatable *)self->_proximityDetectionModeAssertion invalidate];
      int v13 = self->_proximityDetectionModeAssertion;
      self->_proximityDetectionModeAssertion = 0;
    }
  }
}

void __73__SBHIDUISensorModeController_setProximityDetectionEnabled_changeSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDigitizerEnabled:1];
  [v3 setProximityDetectionMode:*(unsigned int *)(a1 + 40)];
  [v3 setChangeSource:*(void *)(a1 + 32)];
}

- (BOOL)isProximityDetectionEnabled
{
  return self->_proximityDetectionEnabled;
}

- (void)resetProximityCalibration
{
}

- (BOOL)shouldUseLowPowerActiveProxDetectionMode
{
  return self->_shouldUseLowPowerActiveProxDetectionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avCache, 0);
  objc_storeStrong((id *)&self->_pocketTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_proximityModeAssertion, 0);
  objc_storeStrong((id *)&self->_digitizerModeBaselineAssertion, 0);
  objc_storeStrong((id *)&self->_proximityDetectionModeAssertion, 0);
  objc_storeStrong((id *)&self->_sensorModeAssertion, 0);
  objc_storeStrong((id *)&self->_sensorMode, 0);
  objc_storeStrong((id *)&self->_sensorService, 0);
}

@end