@interface SBUIPhoneUnlockWithWatchController
+ (id)sharedInstance;
- (BOOL)didDetectFaceRequirementsForPAU;
- (BOOL)liftToWakeGestureDetectedSinceScreenOn;
- (BOOL)phoneUnlockWithWatchEnabled;
- (BOOL)phoneUnlockWithWatchSupported;
- (BOOL)shouldPhoneCompleteAutoUnlockWithNotification;
- (BOOL)showRawErrorCodes;
- (BOOL)significantUserInteractionOccuredSinceScreenOn;
- (BOOL)wakeSourceIsUserAction;
- (SBUIBiometricResource)biometricResource;
- (SBUIPhoneUnlockWithWatchController)init;
- (SBUIPhoneUnlockWithWatchControllerDelegate)delegate;
- (id)_autoUnlockManager;
- (id)_testAutoUnlockManager;
- (int64_t)errorCode;
- (void)_handleUnlockAttemptFailedWithError:(id)a3;
- (void)_handleUnlockAttemptSucceeded;
- (void)_sendCoreAnalyticsEventWithPayload:(id)a3;
- (void)addObserver:(id)a3;
- (void)attemptPhoneUnlockWithWatch;
- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4;
- (void)completePhoneAutoUnlockWithNotification:(BOOL)a3;
- (void)handleScreenOff;
- (void)manager:(id)a3 beganAttemptWithDevice:(id)a4;
- (void)manager:(id)a3 completedUnlockWithDevice:(id)a4;
- (void)manager:(id)a3 failedAttemptWithError:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setBiometricResource:(id)a3;
- (void)setBottomFaceOccludedSinceScreenOn:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setFaceOccludedSinceScreenOn:(BOOL)a3;
- (void)setFaceWUPoseEligibleSinceScreenOn:(BOOL)a3;
- (void)setLiftToWakeGestureDetectedSinceScreenOn:(BOOL)a3;
- (void)setSignificantUserInteractionOccuredSinceScreenOn:(BOOL)a3;
- (void)setTestAutoUnlockManager:(id)a3;
- (void)setWakeSourceIsUserAction:(BOOL)a3;
@end

@implementation SBUIPhoneUnlockWithWatchController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;
  return v2;
}

uint64_t __52__SBUIPhoneUnlockWithWatchController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBUIPhoneUnlockWithWatchController);
  uint64_t v1 = sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SBUIPhoneUnlockWithWatchController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIPhoneUnlockWithWatchController;
  v2 = [(SBUIPhoneUnlockWithWatchController *)&v7 init];
  v3 = v2;
  if (v2 && [(SBUIPhoneUnlockWithWatchController *)v2 phoneUnlockWithWatchSupported])
  {
    v4 = (SFAutoUnlockManager *)objc_alloc_init(MEMORY[0x1E4F9F678]);
    autoUnlockManager = v3->_autoUnlockManager;
    v3->_autoUnlockManager = v4;

    [(SFAutoUnlockManager *)v3->_autoUnlockManager setDelegate:v3];
  }
  return v3;
}

- (void)setBiometricResource:(id)a3
{
  v5 = (SBUIBiometricResource *)a3;
  biometricResource = self->_biometricResource;
  v8 = v5;
  if (biometricResource != v5)
  {
    [(SBUIBiometricResource *)biometricResource removeObserver:self];
    objc_storeStrong((id *)&self->_biometricResource, a3);
    objc_super v7 = self->_biometricResource;
    if (v7) {
      [(SBUIBiometricResource *)v7 addObserver:self];
    }
  }
}

- (BOOL)phoneUnlockWithWatchSupported
{
  return [MEMORY[0x1E4F9F678] autoUnlockSupported];
}

- (BOOL)phoneUnlockWithWatchEnabled
{
  return [MEMORY[0x1E4F9F678] autoUnlockEnabled];
}

- (BOOL)showRawErrorCodes
{
  v2 = self;
  v3 = [(SBUIPhoneUnlockWithWatchController *)self delegate];
  LOBYTE(v2) = [v3 phoneUnlockWithWatchControllerShowRawErrorCodes:v2];

  return (char)v2;
}

- (void)addObserver:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v9 = v4;
    uint64_t v4 = [(NSHashTable *)self->_observers containsObject:v4];
    uint64_t v5 = v9;
    if ((v4 & 1) == 0)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_super v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      uint64_t v4 = [(NSHashTable *)observers addObject:v9];
      uint64_t v5 = v9;
    }
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)handleScreenOff
{
  *(_WORD *)&self->_significantUserInteractionOccuredSinceScreenOn = 0;
  *(_DWORD *)&self->_bottomFaceOccludedSinceScreenOn = 0;
}

- (void)setWakeSourceIsUserAction:(BOOL)a3
{
  if (self->_wakeSourceIsUserAction != a3)
  {
    self->_wakeSourceIsUserAction = a3;
    if (a3)
    {
      if ([(SBUIPhoneUnlockWithWatchController *)self phoneUnlockWithWatchEnabled])
      {
        uint64_t v4 = [(SBUIPhoneUnlockWithWatchController *)self _autoUnlockManager];
        [v4 prewarmAutoUnlock];

        uint64_t v5 = SBLogPhoneUnlockWithWatch();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Prewarm phone unlock with watch for user action wake source", v6, 2u);
        }
      }
    }
  }
}

- (void)attemptPhoneUnlockWithWatch
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if ([(SBUIPhoneUnlockWithWatchController *)self phoneUnlockWithWatchEnabled])
  {
    if ([(SBUIBiometricResource *)self->_biometricResource biometricLockoutState])
    {
      v3 = SBLogPhoneUnlockWithWatch();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        uint64_t v4 = "Not attempting phone unlock with watch because of biolockout";
LABEL_7:
        _os_log_impl(&dword_1A7607000, v3, OS_LOG_TYPE_DEFAULT, v4, v12, 2u);
      }
    }
    else
    {
      if (![(SBUIPhoneUnlockWithWatchController *)self didDetectFaceRequirementsForPAU])
      {
        v3 = SBLogPhoneUnlockWithWatch();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        *(_WORD *)v12 = 0;
        uint64_t v4 = "Not attempting phone unlock with watch because face requirements not met";
        goto LABEL_7;
      }
      if (!self->_wakeSourceIsUserAction
        && !self->_significantUserInteractionOccuredSinceScreenOn
        && !self->_liftToWakeGestureDetectedSinceScreenOn)
      {
        v3 = SBLogPhoneUnlockWithWatch();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        *(_WORD *)v12 = 0;
        uint64_t v4 = "Not attempting phone unlock with watch because not enough user interaction";
        goto LABEL_7;
      }
      uint64_t v5 = +[SBUIPeriocularController sharedInstance];
      int v6 = [v5 periocularEnabled];

      objc_super v7 = SBLogPhoneUnlockWithWatch();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "Attempt phone unlock with watch without notification", v12, 2u);
        }

        uint64_t v9 = [(SBUIPhoneUnlockWithWatchController *)self _autoUnlockManager];
        [v9 attemptAutoUnlockWithoutNotifyingWatch];
      }
      else
      {
        if (v8)
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "Attempt phone unlock with watch", v12, 2u);
        }

        uint64_t v9 = [(SBUIPhoneUnlockWithWatchController *)self _autoUnlockManager];
        [v9 attemptAutoUnlock];
      }

      v13[0] = @"bottomFaceOcclusion";
      v3 = [NSNumber numberWithBool:self->_bottomFaceOccludedSinceScreenOn];
      v13[1] = @"anyFaceOcclusion";
      v14[0] = v3;
      v10 = [NSNumber numberWithBool:self->_faceOccludedSinceScreenOn];
      v14[1] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
      [(SBUIPhoneUnlockWithWatchController *)self _sendCoreAnalyticsEventWithPayload:v11];
    }
  }
  else
  {
    v3 = SBLogPhoneUnlockWithWatch();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      uint64_t v4 = "Not attempting phone unlock with watch because feature not enabled";
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (BOOL)didDetectFaceRequirementsForPAU
{
  return (self->_bottomFaceOccludedSinceScreenOn
       || self->_faceOccludedSinceScreenOn && _os_feature_enabled_impl())
      && self->_faceWUPoseEligibleSinceScreenOn;
}

- (BOOL)shouldPhoneCompleteAutoUnlockWithNotification
{
  BOOL result = 0;
  if ([(SBUIPhoneUnlockWithWatchController *)self phoneUnlockWithWatchEnabled])
  {
    v3 = +[SBUIPeriocularController sharedInstance];
    int v4 = [v3 periocularEnabled];

    if (v4)
    {
      if ([(SBUIPhoneUnlockWithWatchController *)self didDetectFaceRequirementsForPAU])
      {
        return 1;
      }
    }
  }
  return result;
}

- (void)completePhoneAutoUnlockWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(SBUIPhoneUnlockWithWatchController *)self shouldPhoneCompleteAutoUnlockWithNotification])
  {
    uint64_t v5 = SBLogPhoneUnlockWithWatch();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = NSStringFromBOOL();
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Complete phone unlock with watch notification: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    objc_super v7 = [(SBUIPhoneUnlockWithWatchController *)self _autoUnlockManager];
    [v7 completeAutoUnlockWithNotification:v3];
  }
}

- (void)_handleUnlockAttemptSucceeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 phoneUnlockWithWatchControllerAttemptSucceeded:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_handleUnlockAttemptFailedWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = (void *)[(NSHashTable *)self->_observers copy];
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
          [v10 phoneUnlockWithWatchControllerAttemptFailed:self withError:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_sendCoreAnalyticsEventWithPayload:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __73__SBUIPhoneUnlockWithWatchController__sendCoreAnalyticsEventWithPayload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_autoUnlockManager
{
  testAutoUnlockManager = self->_testAutoUnlockManager;
  if (!testAutoUnlockManager) {
    testAutoUnlockManager = self->_autoUnlockManager;
  }
  return testAutoUnlockManager;
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  id v6 = a3;
  if ((uint64_t)a4 > 27)
  {
    if (a4 == 28)
    {
      self->_bottomFaceOccludedSinceScreenOn = 1;
      uint64_t v8 = SBLogPhoneUnlockWithWatch();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        goto LABEL_17;
      }
      LOWORD(v12) = 0;
      uint64_t v9 = "Bottom face occluded since screen on";
      long long v10 = (uint8_t *)&v12;
    }
    else
    {
      if (a4 != 29) {
        goto LABEL_18;
      }
      self->_faceWUPoseEligibleSinceScreenOn = 1;
      uint64_t v8 = SBLogPhoneUnlockWithWatch();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      __int16 v14 = 0;
      uint64_t v9 = "Face WU pose eligibile since screen on";
      long long v10 = (uint8_t *)&v14;
    }
    _os_log_impl(&dword_1A7607000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    goto LABEL_16;
  }
  if (a4 == 4)
  {
    long long v11 = [(SBUIPhoneUnlockWithWatchController *)self _autoUnlockManager];
    [v11 donateDeviceUnlockedWithMask:1];

    goto LABEL_18;
  }
  if (a4 == 21)
  {
    self->_faceOccludedSinceScreenOn = 1;
    uint64_t v7 = SBLogPhoneUnlockWithWatch();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "Face occluded since screen on", buf, 2u);
    }

    if (_os_feature_enabled_impl()) {
LABEL_17:
    }
      [(SBUIPhoneUnlockWithWatchController *)self attemptPhoneUnlockWithWatch];
  }
LABEL_18:
}

- (void)manager:(id)a3 beganAttemptWithDevice:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  uint64_t v5 = SBLogPhoneUnlockWithWatch();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Attempt phone unlock with watch began with device: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)manager:(id)a3 completedUnlockWithDevice:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SBUIPhoneUnlockWithWatchController_manager_completedUnlockWithDevice___block_invoke;
  v7[3] = &unk_1E5CCC878;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __72__SBUIPhoneUnlockWithWatchController_manager_completedUnlockWithDevice___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogPhoneUnlockWithWatch();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A7607000, v2, OS_LOG_TYPE_DEFAULT, "Attempt phone unlock with watch completed with device: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _handleUnlockAttemptSucceeded];
}

- (void)manager:(id)a3 failedAttemptWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SBUIPhoneUnlockWithWatchController_manager_failedAttemptWithError___block_invoke;
  v7[3] = &unk_1E5CCC878;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __69__SBUIPhoneUnlockWithWatchController_manager_failedAttemptWithError___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogPhoneUnlockWithWatch();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A7607000, v2, OS_LOG_TYPE_DEFAULT, "Attempt phone unlock with watch failed with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _handleUnlockAttemptFailedWithError:*(void *)(a1 + 32)];
}

- (id)_testAutoUnlockManager
{
  return self->_testAutoUnlockManager;
}

- (void)setTestAutoUnlockManager:(id)a3
{
  int v5 = (SFAutoUnlockManager *)a3;
  testAutoUnlockManager = self->_testAutoUnlockManager;
  p_testAutoUnlockManager = &self->_testAutoUnlockManager;
  if (testAutoUnlockManager != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_testAutoUnlockManager, a3);
    int v5 = v8;
  }
}

- (void)setBottomFaceOccludedSinceScreenOn:(BOOL)a3
{
  if (self->_bottomFaceOccludedSinceScreenOn != a3) {
    self->_bottomFaceOccludedSinceScreenOn = a3;
  }
}

- (void)setFaceWUPoseEligibleSinceScreenOn:(BOOL)a3
{
  if (self->_faceWUPoseEligibleSinceScreenOn != a3) {
    self->_faceWUPoseEligibleSinceScreenOn = a3;
  }
}

- (void)setFaceOccludedSinceScreenOn:(BOOL)a3
{
  if (self->_faceOccludedSinceScreenOn != a3) {
    self->_faceOccludedSinceScreenOn = a3;
  }
}

- (SBUIPhoneUnlockWithWatchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIPhoneUnlockWithWatchControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (BOOL)wakeSourceIsUserAction
{
  return self->_wakeSourceIsUserAction;
}

- (BOOL)significantUserInteractionOccuredSinceScreenOn
{
  return self->_significantUserInteractionOccuredSinceScreenOn;
}

- (void)setSignificantUserInteractionOccuredSinceScreenOn:(BOOL)a3
{
  self->_significantUserInteractionOccuredSinceScreenOn = a3;
}

- (BOOL)liftToWakeGestureDetectedSinceScreenOn
{
  return self->_liftToWakeGestureDetectedSinceScreenOn;
}

- (void)setLiftToWakeGestureDetectedSinceScreenOn:(BOOL)a3
{
  self->_liftToWakeGestureDetectedSinceScreenOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_testAutoUnlockManager, 0);
  objc_storeStrong((id *)&self->_autoUnlockManager, 0);
}

@end