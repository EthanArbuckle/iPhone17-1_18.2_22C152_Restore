@interface SBProximitySensorManager
- (BOOL)_clientsWantDetectionEnabled;
- (BOOL)isGracePeriodDisabled;
- (BOOL)isObjectInProximity;
- (BOOL)isProximityDetectionEnabled;
- (BOOL)isProximityDetectionPermitted;
- (NSString)description;
- (SBProximitySensorManager)init;
- (SBProximitySensorManager)initWithHIDInterface:(id)a3 hardwareDefaults:(id)a4 interfaceOrientationProvider:(id)a5;
- (SpringBoard)_interfaceOrientationProvider;
- (id)suppressBacklightChangesForReason:(id)a3;
- (void)_destroy;
- (void)_disableProx;
- (void)_enableProx;
- (void)_reloadDefaults;
- (void)_setInterfaceOrientationProvider:(id)a3;
- (void)_setObjectInCrudeProximity:(BOOL)a3;
- (void)_setObjectInProximity:(BOOL)a3 detectionMode:(int)a4;
- (void)_setObjectInProximity:(BOOL)a3 detectionMode:(int)a4 postToApps:(BOOL)a5;
- (void)_setProximityDetectionEnabled:(BOOL)a3;
- (void)_setProximityDetectionPermitted:(BOOL)a3;
- (void)_updateProxState;
- (void)addObserver:(id)a3;
- (void)client:(id)a3 wantsProximityDetectionEnabled:(BOOL)a4;
- (void)client:(id)a3 wantsProximityDetectionEnabled:(BOOL)a4 disableGracePeriod:(BOOL)a5;
- (void)dealloc;
- (void)processHIDEvent:(__IOHIDEvent *)a3;
- (void)removeObserver:(id)a3;
- (void)resetProximityCalibration;
@end

@implementation SBProximitySensorManager

- (void)_setObjectInProximity:(BOOL)a3 detectionMode:(int)a4
{
}

- (void)processHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IOHIDEventGetType() != 14)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBProximitySensorManager.m", 155, @"Invalid parameter not satisfying: %@", @"IOHIDEventGetType(event) == kIOHIDEventTypeProximity" object file lineNumber description];
  }
  unsigned int IntegerValue = IOHIDEventGetIntegerValue();
  v6 = SBLogProximitySensor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = BKSHIDEventGetConciseDescription();
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "prox! %{public}@", buf, 0xCu);
  }
  v8 = BKSHIDEventGetProximityAttributes();
  uint64_t v9 = [v8 proximityDetectionMode];
  [(SBProximitySensorManager *)self _setObjectInCrudeProximity:(IntegerValue >> 10) & 1];
  [(SBProximitySensorManager *)self _setObjectInProximity:(IntegerValue >> 6) & 1 detectionMode:v9];
}

- (void)_setObjectInCrudeProximity:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_objectInCrudeProximity != a3 || !a3)
  {
    self->_objectInCrudeProximity = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 proximitySensorManager:self crudeProximityDidChange:v3];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_setObjectInProximity:(BOOL)a3 detectionMode:(int)a4 postToApps:(BOOL)a5
{
  v55[1] = *MEMORY[0x1E4F143B8];
  if (self->_objectInProximity != a3)
  {
    uint64_t v5 = *(void *)&a4;
    BOOL v6 = a3;
    BOOL cf = a5;
    self->_objectInProximity = a3;
    self->_proximityDetectionMode = a4;
    uint64_t v8 = SBLogProximitySensor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = NSStringFromBKSHIDServicesProximityDetectionMode();
      *(_DWORD *)buf = 67109378;
      BOOL v47 = v6;
      __int16 v48 = 2114;
      v49 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "objectInProximity is now:%{BOOL}u mode:(%{public}@)", buf, 0x12u);
    }
    [(SBProximitySensorManager *)self _updateProxState];
    uint64_t v54 = *MEMORY[0x1E4FA7B20];
    v10 = [NSNumber numberWithBool:self->_objectInProximity];
    v55[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];

    long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v35 = (void *)v11;
    [v12 postNotificationName:*MEMORY[0x1E4FA7A90] object:0 userInfo:v11];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v13 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            [v18 proximitySensorManager:self objectWithinProximityDidChange:v6 detectionMode:v5];
          }
          else if (objc_opt_respondsToSelector())
          {
            [v18 proximitySensorManager:self objectWithinProximityDidChange:v6];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v42 objects:v53 count:16];
      }
      while (v15);
    }

    if (cf)
    {
      mach_absolute_time();
      CFTypeRef cfa = (CFTypeRef)IOHIDEventCreateProximtyEvent();
      v19 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
      v20 = [v19 externalForegroundApplicationSceneHandles];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = [*(id *)(*((void *)&v38 + 1) + 8 * j) scene];
            v27 = [v26 uiClientSettings];
            char v28 = [v27 proximityDetectionModes];

            if ((v28 & 2) != 0)
            {
              v29 = [v26 clientProcess];
              v30 = [v29 bundleIdentifier];

              v31 = [v26 clientProcess];
              v32 = [v31 state];
              int v33 = [v32 pid];

              v34 = SBLogProximitySensor();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109634;
                BOOL v47 = v6;
                __int16 v48 = 2114;
                v49 = v30;
                __int16 v50 = 1024;
                int v51 = v33;
                _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "sending prox notification (object in proximity:%{BOOL}u) to %{public}@ (pid %d)", buf, 0x18u);
              }

              BKSHIDEventSendToProcess();
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v52 count:16];
        }
        while (v23);
      }

      CFRelease(cfa);
    }
  }
}

- (SBProximitySensorManager)init
{
  v4 = [NSString stringWithFormat:@"init not available"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    BOOL v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    long long v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"SBProximitySensorManager.m";
    __int16 v17 = 1024;
    int v18 = 55;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (SBProximitySensorManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (SBProximitySensorManager)initWithHIDInterface:(id)a3 hardwareDefaults:(id)a4 interfaceOrientationProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SBProximitySensorManager;
  long long v12 = [(SBProximitySensorManager *)&v24 init];
  if (v12)
  {
    __int16 v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    clientsWantingDetectionEnabled = v12->_clientsWantingDetectionEnabled;
    v12->_clientsWantingDetectionEnabled = v13;

    __int16 v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    clientsWantingGracePeriodDisabled = v12->_clientsWantingGracePeriodDisabled;
    v12->_clientsWantingGracePeriodDisabled = v15;

    objc_storeStrong((id *)&v12->_hidInterface, a3);
    objc_storeStrong((id *)&v12->_hardwareDefaults, a4);
    objc_storeStrong((id *)&v12->_interfaceOrientationProvider, a5);
    hardwareDefaults = v12->_hardwareDefaults;
    int v18 = [NSString stringWithUTF8String:"disableProximitySensor"];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95__SBProximitySensorManager_initWithHIDInterface_hardwareDefaults_interfaceOrientationProvider___block_invoke;
    v22[3] = &unk_1E6AF4AC0;
    __int16 v19 = v12;
    uint64_t v23 = v19;
    id v20 = (id)[(SBHardwareDefaults *)hardwareDefaults observeDefault:v18 onQueue:MEMORY[0x1E4F14428] withBlock:v22];

    [(SBProximitySensorManager *)v19 _reloadDefaults];
    [(SpringBoard *)v12->_interfaceOrientationProvider addActiveOrientationObserver:v19];
  }
  return v12;
}

uint64_t __95__SBProximitySensorManager_initWithHIDInterface_hardwareDefaults_interfaceOrientationProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadDefaults];
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_suppressBacklightChangesAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBProximitySensorManager;
  [(SBProximitySensorManager *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_proximityDetectionEnabled withName:@"_proximityDetectionEnabled"];
  id v5 = (id)[v3 appendBool:self->_proximityDetectionPermitted withName:@"_proximityDetectionPermitted"];
  id v6 = (id)[v3 appendBool:self->_objectInProximity withName:@"_objectInProximity"];
  id v7 = (id)[v3 appendObject:self->_clientsWantingDetectionEnabled withName:@"_clientsWantingDetectionEnabled"];
  id v8 = (id)[v3 appendObject:self->_clientsWantingGracePeriodDisabled withName:@"_clientsWantingGracePeriodDisabled"];
  id v9 = [v3 build];

  return (NSString *)v9;
}

- (BOOL)isGracePeriodDisabled
{
  return [(NSMutableSet *)self->_clientsWantingGracePeriodDisabled count] != 0;
}

- (void)client:(id)a3 wantsProximityDetectionEnabled:(BOOL)a4
{
}

- (void)client:(id)a3 wantsProximityDetectionEnabled:(BOOL)a4 disableGracePeriod:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBProximitySensorManager.m", 111, @"Invalid parameter not satisfying: %@", @"clientID" object file lineNumber description];
  }
  id v10 = SBLogProximitySensor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Client:%{public}@ wants active proximity sensor:%{BOOL}u disable grace period:%{BOOL}u", buf, 0x18u);
  }

  clientsWantingDetectionEnabled = self->_clientsWantingDetectionEnabled;
  if (v6)
  {
    [(NSMutableSet *)clientsWantingDetectionEnabled addObject:v9];
    if (v5) {
      [(NSMutableSet *)self->_clientsWantingGracePeriodDisabled addObject:v9];
    }
  }
  else
  {
    [(NSMutableSet *)clientsWantingDetectionEnabled removeObject:v9];
    [(NSMutableSet *)self->_clientsWantingGracePeriodDisabled removeObject:v9];
  }
  [(SBProximitySensorManager *)self _updateProxState];
}

- (void)resetProximityCalibration
{
  ADClientAddValueForScalarKey();
  if (![(SBProximitySensorManager *)self isProximityDetectionEnabled]) {
    ADClientAddValueForScalarKey();
  }
  hidInterface = self->_hidInterface;
  [(SBProximitySensorControlling *)hidInterface resetProximityCalibration];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      BOOL v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (id)suppressBacklightChangesForReason:(id)a3
{
  id v4 = a3;
  suppressBacklightChangesAssertion = self->_suppressBacklightChangesAssertion;
  if (!suppressBacklightChangesAssertion)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__SBProximitySensorManager_suppressBacklightChangesForReason___block_invoke;
    v12[3] = &unk_1E6B05A08;
    v12[4] = self;
    BOOL v6 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"SuppressProxBacklightChanges" stateDidChangeHandler:v12];
    id v7 = self->_suppressBacklightChangesAssertion;
    self->_suppressBacklightChangesAssertion = v6;

    id v8 = self->_suppressBacklightChangesAssertion;
    id v9 = SBLogProximitySensor();
    [(BSCompoundAssertion *)v8 setLog:v9];

    suppressBacklightChangesAssertion = self->_suppressBacklightChangesAssertion;
  }
  id v10 = [(BSCompoundAssertion *)suppressBacklightChangesAssertion acquireForReason:v4];

  return v10;
}

void __62__SBProximitySensorManager_suppressBacklightChangesForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 isActive];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "allObjects", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 proximitySensorManager:*(void *)(a1 + 32) shouldSuppressBacklightChanges:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_setProximityDetectionEnabled:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_proximityDetectionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_proximityDetectionEnabled = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 proximitySensorManager:self proximityDetectionEnabledDidChange:v3];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_setProximityDetectionPermitted:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_proximityDetectionPermitted != a3)
  {
    BOOL v3 = a3;
    self->_proximityDetectionPermitted = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 proximitySensorManager:self proximityDetectionPermittedDidChange:v3];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_destroy
{
}

- (void)_reloadDefaults
{
  uint64_t v3 = [(SBHardwareDefaults *)self->_hardwareDefaults disableProximitySensor] ^ 1;
  [(SBProximitySensorManager *)self _setProximityDetectionPermitted:v3];
}

- (void)_enableProx
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(SBProximitySensorManager *)self isProximityDetectionPermitted])
  {
    [(SBProximitySensorManager *)self _setProximityDetectionEnabled:1];
    uint64_t v3 = +[SBMainWorkspace sharedInstanceIfExists];
    id v4 = [v3 currentTransaction];
    uint64_t v5 = [v4 transitionRequest];
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v13 = v8;

    BOOL v14 = [v13 source] == 61;
    [(SBProximitySensorControlling *)self->_hidInterface setProximityDetectionEnabled:1 changeSource:4 * v14];
    uint64_t v9 = SBLogProximitySensor();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      clientsWantingDetectionEnabled = self->_clientsWantingDetectionEnabled;
      int v16 = 138543362;
      __int16 v17 = clientsWantingDetectionEnabled;
      long long v10 = "Enabling proximity sensor detection for clients:%{public}@";
      long long v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = SBLogProximitySensor();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      long long v10 = "Not enabling prox detection because prox isn't permitted on this device";
      long long v11 = v9;
      uint32_t v12 = 2;
LABEL_11:
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
    }
  }
}

- (void)_disableProx
{
  [(SBProximitySensorManager *)self _setProximityDetectionEnabled:0];
  hidInterface = self->_hidInterface;
  [(SBProximitySensorControlling *)hidInterface setProximityDetectionEnabled:0];
}

- (BOOL)_clientsWantDetectionEnabled
{
  return [(NSMutableSet *)self->_clientsWantingDetectionEnabled count] != 0;
}

- (void)_updateProxState
{
  if ([(SBProximitySensorManager *)self _clientsWantDetectionEnabled]
    && ![(SBProximitySensorManager *)self isProximityDetectionEnabled])
  {
    if ((unint64_t)([(SpringBoard *)self->_interfaceOrientationProvider activeInterfaceOrientation]- 3) >= 2)
    {
      [(SBProximitySensorManager *)self _enableProx];
    }
  }
  else if ([(SBProximitySensorManager *)self isProximityDetectionEnabled] {
         && (![(SBProximitySensorManager *)self _clientsWantDetectionEnabled]
  }
          || (unint64_t)([(SpringBoard *)self->_interfaceOrientationProvider activeInterfaceOrientation]- 3) <= 1)&& !self->_objectInProximity)
  {
    [(SBProximitySensorManager *)self _disableProx];
  }
}

- (BOOL)isObjectInProximity
{
  return self->_objectInProximity;
}

- (BOOL)isProximityDetectionEnabled
{
  return self->_proximityDetectionEnabled;
}

- (BOOL)isProximityDetectionPermitted
{
  return self->_proximityDetectionPermitted;
}

- (SpringBoard)_interfaceOrientationProvider
{
  return self->_interfaceOrientationProvider;
}

- (void)_setInterfaceOrientationProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceOrientationProvider, 0);
  objc_storeStrong((id *)&self->_suppressBacklightChangesAssertion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_hardwareDefaults, 0);
  objc_storeStrong((id *)&self->_hidInterface, 0);
  objc_storeStrong((id *)&self->_clientsWantingGracePeriodDisabled, 0);
  objc_storeStrong((id *)&self->_clientsWantingDetectionEnabled, 0);
}

@end