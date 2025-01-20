@interface SBLiftToWakeManager
- (BOOL)_gestureWokeScreen;
- (BOOL)_isLockScreenMainPageVisible;
- (BOOL)handleEvent:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (NSString)coverSheetIdentifier;
- (NSString)description;
- (SBBacklightController)_backlightController;
- (SBIdleTimerGlobalCoordinator)_idleTimerCoordinator;
- (SBLiftToWakeController)_liftToWakeController;
- (SBLiftToWakeManager)init;
- (SBLockScreenManager)_lockScreenManager;
- (SBMainDisplayPolicyAggregator)_policyAggregator;
- (id)_initWithLiftToWakeController:(id)a3;
- (int64_t)participantState;
- (void)_backlightWillTurnOn:(id)a3;
- (void)_setBacklightController:(id)a3;
- (void)_setGestureWokeScreen:(BOOL)a3;
- (void)_setIdleTimerCoordinator:(id)a3;
- (void)_setLiftToWakeController:(id)a3;
- (void)_setLockScreenManager:(id)a3;
- (void)_setPolicyAggregator:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)liftToWakeController:(id)a3 didObserveTransition:(int64_t)a4 deviceOrientation:(int64_t)a5;
@end

@implementation SBLiftToWakeManager

- (SBLiftToWakeManager)init
{
  v3 = +[SBLiftToWakeController sharedController];
  v4 = [(SBLiftToWakeManager *)self _initWithLiftToWakeController:v3];

  return v4;
}

- (id)_initWithLiftToWakeController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBLiftToWakeManager;
  v6 = [(SBLiftToWakeManager *)&v10 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_liftToWakeController, a3);
    [p_isa[1] addObserver:p_isa];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:p_isa selector:sel__backlightWillTurnOn_ name:*MEMORY[0x1E4FA7A30] object:0];
  }
  return p_isa;
}

- (void)dealloc
{
  [(SBLiftToWakeManager *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBLiftToWakeManager;
  [(SBLiftToWakeManager *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_gestureWokeScreen withName:@"gestureWokeScreen"];
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBLiftToWakeController isEnabled](self->_liftToWakeController, "isEnabled"), @"enabled");
  id v6 = (id)[v3 appendObject:self->_liftToWakeController withName:@"liftToWakeController"];
  v7 = [v3 build];

  return (NSString *)v7;
}

- (void)_backlightWillTurnOn:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4FA7A08]];
  int v6 = [v5 intValue];

  if (v6 != 13)
  {
    [(SBLiftToWakeManager *)self _setGestureWokeScreen:v6 == 20];
  }
}

- (SBMainDisplayPolicyAggregator)_policyAggregator
{
  accessor_policyAggregator = self->_accessor_policyAggregator;
  if (accessor_policyAggregator)
  {
    objc_super v3 = accessor_policyAggregator;
  }
  else
  {
    id v4 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    objc_super v3 = [v4 policyAggregator];
  }
  return v3;
}

- (SBLockScreenManager)_lockScreenManager
{
  accessor_lockScreenManager = self->_accessor_lockScreenManager;
  if (accessor_lockScreenManager)
  {
    objc_super v3 = accessor_lockScreenManager;
  }
  else
  {
    objc_super v3 = +[SBLockScreenManager sharedInstance];
  }
  return v3;
}

- (SBBacklightController)_backlightController
{
  accessor_backlightController = self->_accessor_backlightController;
  if (accessor_backlightController)
  {
    objc_super v3 = accessor_backlightController;
  }
  else
  {
    objc_super v3 = +[SBBacklightController sharedInstance];
  }
  return v3;
}

- (SBIdleTimerGlobalCoordinator)_idleTimerCoordinator
{
  accessor_idleTimerCoordinator = self->_accessor_idleTimerCoordinator;
  if (accessor_idleTimerCoordinator)
  {
    objc_super v3 = accessor_idleTimerCoordinator;
  }
  else
  {
    objc_super v3 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  }
  return v3;
}

- (BOOL)_isLockScreenMainPageVisible
{
  v2 = [(SBLiftToWakeManager *)self _lockScreenManager];
  objc_super v3 = [v2 lockScreenEnvironment];
  id v4 = [v3 contentStateProvider];

  if ([v2 isLockScreenVisible] && objc_msgSend(v4, "isMainPageVisible")) {
    int v5 = [v2 isUIUnlocking] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(SBLiftToWakeController *)self->_liftToWakeController removeObserver:self];
    id v4 = [(SBLiftToWakeManager *)self _lockScreenManager];
    objc_super v3 = [v4 coverSheetViewController];
    [v3 unregisterExternalEventHandler:self];
  }
}

- (void)liftToWakeController:(id)a3 didObserveTransition:(int64_t)a4 deviceOrientation:(int64_t)a5
{
  v56[3] = *MEMORY[0x1E4F143B8];
  v8 = NSStringFromSBLiftToWakeTransition(a4);
  v9 = SBLogLiftToWake();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v50 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Transition received: %{public}@", buf, 0xCu);
  }

  if (!BKSHIDServicesProximityDetectionActive())
  {
    v11 = [(SBLiftToWakeManager *)self _policyAggregator];
    id v48 = 0;
    char v12 = [v11 allowsCapability:24 explanation:&v48];
    id v13 = v48;

    if (v12)
    {
      switch(a4)
      {
        case 0:
          v18 = SBLogLiftToWake();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Unknown transition!", buf, 2u);
          }

          v16 = self;
          int64_t v17 = 0;
          goto LABEL_15;
        case 1:
        case 4:
          if ([(id)SBApp caseIsEnabledAndLatched])
          {
            v14 = SBLogLiftToWake();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)v50 = v8;
              _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring %{public}@ because smart cover is locked", buf, 0xCu);
            }
LABEL_41:

            break;
          }
          v29 = [(SBLiftToWakeManager *)self _lockScreenManager];
          int v30 = [v29 isUILocked];

          if (!v30)
          {
            v41 = SBLogLiftToWake();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)v50 = v8;
              _os_log_impl(&dword_1D85BA000, v41, OS_LOG_TYPE_DEFAULT, "Resetting idle timer for transition %{public}@", buf, 0xCu);
            }

            v14 = [(SBLiftToWakeManager *)self _idleTimerCoordinator];
            v42 = [NSString stringWithFormat:@"LiftToWakeTransition:%@", v8];
            [v14 resetIdleTimerForReason:v42];

            goto LABEL_41;
          }
          v31 = [(SBLiftToWakeManager *)self _lockScreenManager];
          v32 = [v31 coverSheetViewController];
          [v32 registerExternalEventHandler:self];

          v33 = BKLogOrientationDevice();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = BSDeviceOrientationDescription();
            *(_DWORD *)buf = 138412290;
            *(void *)v50 = v34;
            _os_log_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_INFO, "Waking with requested orientation %@", buf, 0xCu);
          }
          v35 = SBLogLiftToWake();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)v50 = v8;
            _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, "Attemping unlock for transition %{public}@", buf, 0xCu);
          }

          v55[0] = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
          v36 = [NSNumber numberWithBool:1];
          v56[0] = v36;
          v55[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
          v37 = [NSNumber numberWithBool:1];
          v56[1] = v37;
          v55[2] = @"SBUIUnlockOptionsRequestedOrientationKey";
          v38 = [NSNumber numberWithUnsignedInteger:a5];
          v56[2] = v38;
          v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3];

          if ((unint64_t)(a4 - 1) > 3) {
            uint64_t v40 = 0;
          }
          else {
            uint64_t v40 = dword_1D8FD30B0[a4 - 1];
          }
          v43 = [(SBLiftToWakeManager *)self _lockScreenManager];
          [v43 unlockUIFromSource:v40 withOptions:v39];

          self->_BOOL significantUserInteractionOccuredSinceWake = 0;
          break;
        case 2:
          v25 = SBLogLiftToWake();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "Resetting idle timer for transition wake -> wake", buf, 2u);
          }

          v26 = [(SBLiftToWakeManager *)self _backlightController];
          int v27 = [v26 screenIsDim];

          if (v27)
          {
            v28 = [(SBLiftToWakeManager *)self _backlightController];
            [v28 _undimFromSource:20];
          }
          v14 = [(SBLiftToWakeManager *)self _idleTimerCoordinator];
          [v14 resetIdleTimerForReason:@"LiftToWakeTransition:wake -> wake"];
          goto LABEL_41;
        case 3:
          BOOL v19 = [(SBLiftToWakeManager *)self _gestureWokeScreen];
          BOOL v20 = [(SBLiftToWakeManager *)self _isLockScreenMainPageVisible];
          v21 = [(SBLiftToWakeManager *)self _idleTimerCoordinator];
          int v22 = [v21 isIdleTimerDisabled];

          if (!v19 || !v20 || (v22 & 1) != 0 || self->_significantUserInteractionOccuredSinceWake)
          {
            v23 = SBLogLiftToWake();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              BOOL significantUserInteractionOccuredSinceWake = self->_significantUserInteractionOccuredSinceWake;
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)v50 = v19;
              *(_WORD *)&v50[4] = 1024;
              *(_DWORD *)&v50[6] = v20;
              __int16 v51 = 1024;
              int v52 = v22 ^ 1;
              __int16 v53 = 1024;
              BOOL v54 = significantUserInteractionOccuredSinceWake;
              _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "Not turning screen off for transition wake -> sleep because gestureWokeScreen: %d isLockScreenMainPageVisible: %d idleTimerRunning: %d significantUserInteractionOccuredSinceWake: %d", buf, 0x1Au);
            }

            v16 = self;
            int64_t v17 = 3;
            goto LABEL_15;
          }
          v44 = SBLogLiftToWake();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v44, OS_LOG_TYPE_DEFAULT, "Turning screen off for transition wake -> sleep", buf, 2u);
          }

          v45 = [(SBLiftToWakeManager *)self _backlightController];
          [v45 _startFadeOutAnimationFromLockSource:5];

          v46 = [(SBLiftToWakeManager *)self _lockScreenManager];
          v47 = [v46 coverSheetViewController];
          [v47 unregisterExternalEventHandler:self];

          break;
        default:
          break;
      }
    }
    else
    {
      v15 = SBLogLiftToWake();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v50 = v13;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring transition - policy aggregator denied with with reason: %@", buf, 0xCu);
      }

      v16 = self;
      int64_t v17 = a4;
LABEL_15:
      [(SBLiftToWakeManager *)v16 _ignoredTransition:v17];
    }

    goto LABEL_43;
  }
  objc_super v10 = SBLogLiftToWake();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring transition -- prox is active", buf, 2u);
  }

  [(SBLiftToWakeManager *)self _ignoredTransition:a4];
LABEL_43:
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if ([(SBLiftToWakeController *)self->_liftToWakeController isEnabled]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  BOOL v6 = v5 == 21 || v5 == 12;
  if (v6 && [(SBLiftToWakeManager *)self _gestureWokeScreen])
  {
    self->_BOOL significantUserInteractionOccuredSinceWake = 1;
    char v7 = [v4 isConsumable];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (void)_setPolicyAggregator:(id)a3
{
}

- (void)_setLockScreenManager:(id)a3
{
}

- (void)_setBacklightController:(id)a3
{
}

- (void)_setIdleTimerCoordinator:(id)a3
{
}

- (BOOL)_gestureWokeScreen
{
  return self->_gestureWokeScreen;
}

- (void)_setGestureWokeScreen:(BOOL)a3
{
  self->_gestureWokeScreen = a3;
}

- (SBLiftToWakeController)_liftToWakeController
{
  return self->_liftToWakeController;
}

- (void)_setLiftToWakeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessor_idleTimerCoordinator, 0);
  objc_storeStrong((id *)&self->_accessor_policyAggregator, 0);
  objc_storeStrong((id *)&self->_accessor_backlightController, 0);
  objc_storeStrong((id *)&self->_accessor_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_liftToWakeController, 0);
}

@end