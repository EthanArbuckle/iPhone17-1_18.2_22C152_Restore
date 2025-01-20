@interface SBUIBiometricResource
+ (SBUIBiometricResource)sharedInstance;
- (BOOL)hasBiometricAuthenticationCapabilityEnabled;
- (BOOL)hasEnrolledIdentities;
- (BOOL)hasMesaSupport;
- (BOOL)hasPearlSupport;
- (BOOL)hasPoseidonSupport;
- (BOOL)isFingerDetectEnabled;
- (BOOL)isFingerOn;
- (BOOL)isMatchingAllowed;
- (BOOL)isMatchingEnabled;
- (BOOL)isPearlDetectEnabled;
- (BOOL)isPeriocularMatchingEnabled;
- (MCProfileConnection)_profileConnection;
- (NSString)description;
- (SBFCredentialSet)unlockCredentialSet;
- (SBFMobileKeyBag)_keybagInterface;
- (SBUIBiometricAuthenticationPolicy)authenticationPolicy;
- (SBUIBiometricResource)init;
- (SBUIBiometricResource)initWithBiometricKitInterface:(id)a3;
- (_SBUIBiometricKitInterface)_biometricKitInterface;
- (id)acquireFaceDetectionWantedAssertionForReason:(id)a3;
- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3;
- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3 HIDEventsOnly:(BOOL)a4;
- (id)acquireMatchingAssertionWithMode:(unint64_t)a3 reason:(id)a4;
- (id)acquireSimulatedLockoutAssertionWithLockoutState:(unint64_t)a3 forReason:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)biometricLockoutState;
- (unint64_t)wakeSourceForBiometricKitInterface:(id)a3;
- (void)_activateFaceDetectAssertion:(id)a3;
- (void)_activateFingerDetectAssertion:(id)a3;
- (void)_activateMatchAssertion:(id)a3;
- (void)_addFaceDetectionWantedAssertion:(id)a3;
- (void)_addFingerDetectionWantedAssertion:(id)a3 HIDEventsOnly:(BOOL)a4;
- (void)_addMatchingAssertion:(id)a3;
- (void)_addSimulatedLockoutAssertion:(id)a3;
- (void)_clearFinishedOperationsIfNeededForAssertion:(id)a3;
- (void)_deactivateAllPearlAssertions;
- (void)_deactivateAssertion:(id)a3;
- (void)_deviceWillWake;
- (void)_forceBioLockout;
- (void)_matchingAllowedStateMayHaveChangedForReason:(id)a3;
- (void)_notifyObserversOfEvent:(unint64_t)a3;
- (void)_presenceDetectAllowedStateMayHaveChangedForReason:(id)a3;
- (void)_profileSettingsChanged:(id)a3;
- (void)_reallyResumeMatchingForAssertion:(id)a3 advisory:(BOOL)a4;
- (void)_reallySetAuthenticated:(BOOL)a3 keybagState:(id)a4;
- (void)_reevaluateFaceDetection;
- (void)_reevaluateFingerDetection;
- (void)_reevaluateMatching;
- (void)_removeFaceDetectionWantedAssertion:(id)a3;
- (void)_removeFingerDetectionWantedAssertion:(id)a3 HIDEventsOnly:(BOOL)a4;
- (void)_removeMatchingAssertion:(id)a3;
- (void)_removeSimulatedLockoutAssertion:(id)a3;
- (void)_setAuthenticated:(BOOL)a3;
- (void)_setBiometricKitInterface:(id)a3;
- (void)_setKeybagInterface:(id)a3;
- (void)_setProfileConnection:(id)a3;
- (void)_updateHandlersForEvent:(unint64_t)a3;
- (void)addObserver:(id)a3;
- (void)biometricKitInterface:(id)a3 enrolledIdentitiesDidChange:(BOOL)a4;
- (void)biometricKitInterface:(id)a3 handleEvent:(unint64_t)a4;
- (void)dealloc;
- (void)keybag:(id)a3 extendedStateDidChange:(id)a4;
- (void)noteScreenDidTurnOff;
- (void)noteScreenWillTurnOff;
- (void)noteScreenWillTurnOn;
- (void)removeObserver:(id)a3;
- (void)resumeMatchingAdvisory:(BOOL)a3;
- (void)resumeMatchingForAssertion:(id)a3 advisory:(BOOL)a4;
- (void)setAuthenticationPolicy:(id)a3;
- (void)setLastBacklightChangeSource:(int64_t)a3;
- (void)setUnlockCredentialSet:(id)a3;
@end

@implementation SBUIBiometricResource

- (BOOL)hasBiometricAuthenticationCapabilityEnabled
{
  if (![(SBFMobileKeyBag *)self->_keybag hasPasscodeSet]
    || ![(SBUIBiometricResource *)self hasEnrolledIdentities])
  {
    return 0;
  }
  profileConnection = self->_profileConnection;
  return [(MCProfileConnection *)profileConnection isFingerprintUnlockAllowed];
}

+ (SBUIBiometricResource)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_32);
  }
  v2 = (void *)sharedInstance___sharedInstance_2;
  return (SBUIBiometricResource *)v2;
}

uint64_t __39__SBUIBiometricResource_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBUIBiometricResource);
  uint64_t v1 = sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SBUIBiometricResource)init
{
  v3 = objc_alloc_init(_SBUIBiometricKitInterface);
  v4 = [(SBUIBiometricResource *)self initWithBiometricKitInterface:v3];

  return v4;
}

- (SBUIBiometricResource)initWithBiometricKitInterface:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBUIBiometricResource;
  v6 = [(SBUIBiometricResource *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4FA5F80] sharedInstance];
    keybag = v6->_keybag;
    v6->_keybag = (SBFMobileKeyBag *)v7;

    [(SBFMobileKeyBag *)v6->_keybag addObserver:v6];
    v9 = [(SBFMobileKeyBag *)v6->_keybag extendedState];
    v6->_isAuthenticated = [v9 isEffectivelyLocked] ^ 1;

    v6->_bkMatchPearlOperationClass = _SBUIEffectiveBiometricClassFromString(@"BKMatchPearlOperation");
    __SBUIBiometricEMRootDomainConnect = IORegisterForSystemPower(0, (IONotificationPortRef *)&__ioPortRef, (IOServiceInterestCallback)_PowerChanged, __ioPMNotifier);
    if (__SBUIBiometricEMRootDomainConnect) {
      IONotificationPortSetDispatchQueue((IONotificationPortRef)__ioPortRef, MEMORY[0x1E4F14428]);
    }
    uint64_t v10 = [MEMORY[0x1E4F74230] sharedConnection];
    profileConnection = v6->_profileConnection;
    v6->_profileConnection = (MCProfileConnection *)v10;

    objc_storeStrong((id *)&v6->_biometricInterface, a3);
    [(_SBUIBiometricKitInterface *)v6->_biometricInterface setDelegate:v6];
    v6->_hasMesaHardware = [(_SBUIBiometricKitInterface *)v6->_biometricInterface isTouchIDCapable];
    v6->_hasPearlHardware = [(_SBUIBiometricKitInterface *)v6->_biometricInterface isPearlIDCapable];
    if (!v6->_hasMesaHardware) {
      [(_SBUIBiometricKitInterface *)v6->_biometricInterface enableBackgroundFingerDetection:0 error:0];
    }
    if (MGGetSInt32Answer() == 2) {
      v6->_hasPoseidonMesaTypeHardware = 1;
    }
    v6->_lastEvent = 0;
    v6->_shouldSendFingerOffNotification = 0;
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v6 selector:sel__profileSettingsChanged_ name:*MEMORY[0x1E4F73EC0] object:0];
  }
  return v6;
}

- (void)dealloc
{
  if (__SBUIBiometricEMRootDomainConnect)
  {
    IONotificationPortSetDispatchQueue((IONotificationPortRef)__ioPortRef, 0);
    IODeregisterForSystemPower(__ioPMNotifier);
    IOServiceClose(__SBUIBiometricEMRootDomainConnect);
    IONotificationPortDestroy((IONotificationPortRef)__ioPortRef);
    __SBUIBiometricEMRootDomainConnect = 0;
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(_SBUIBiometricKitInterface *)self->_biometricInterface setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)SBUIBiometricResource;
  [(SBUIBiometricResource *)&v4 dealloc];
}

- (BOOL)isFingerOn
{
  return [(_SBUIBiometricKitInterface *)self->_biometricInterface isFingerOn];
}

- (BOOL)hasEnrolledIdentities
{
  return [(_SBUIBiometricKitInterface *)self->_biometricInterface hasEnrolledIdentities];
}

- (BOOL)isFingerDetectEnabled
{
  return (self->_isForegroundFingerDetectionEnabled || self->_isMatchingEnabled) && self->_hasMesaHardware;
}

- (BOOL)hasMesaSupport
{
  return self->_hasMesaHardware;
}

- (BOOL)hasPoseidonSupport
{
  return self->_hasPoseidonMesaTypeHardware;
}

- (BOOL)hasPearlSupport
{
  return self->_hasPearlHardware;
}

- (BOOL)isPearlDetectEnabled
{
  return (self->_isPresenceDetectionAllowed || self->_isMatchingAllowed) && self->_hasPearlHardware;
}

- (unint64_t)biometricLockoutState
{
  unint64_t result = [(_SBUIBiometricKitInterface *)self->_biometricInterface lockoutState];
  if (!result)
  {
    unint64_t result = [(NSMutableOrderedSet *)self->_simulatedLockoutAssertions count];
    if (result)
    {
      objc_super v4 = [(NSMutableOrderedSet *)self->_simulatedLockoutAssertions firstObject];
      unint64_t v5 = [v4 lockoutState];

      return v5;
    }
  }
  return result;
}

- (BOOL)isPeriocularMatchingEnabled
{
  return [(_SBUIBiometricKitInterface *)self->_biometricInterface isPeriocularMatchingEnabled];
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBUIBiometricResource.m", 223, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  observers = self->_observers;
  if (!observers)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v8 = self->_observers;
    self->_observers = v7;

    id v5 = v10;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v5];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBUIBiometricResource.m", 232, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  [(NSHashTable *)self->_observers removeObject:v5];
}

- (id)acquireMatchingAssertionWithMode:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [_SBUIBiometricMatchingAssertion alloc];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __65__SBUIBiometricResource_acquireMatchingAssertionWithMode_reason___block_invoke;
  v13 = &unk_1E5CCE4B0;
  objc_copyWeak(&v14, &location);
  v8 = [(_SBUIBiometricMatchingAssertion *)v7 initWithMatchMode:a3 reason:v6 invalidationBlock:&v10];
  if (v8) {
    -[SBUIBiometricResource _addMatchingAssertion:](self, "_addMatchingAssertion:", v8, v10, v11, v12, v13);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __65__SBUIBiometricResource_acquireMatchingAssertionWithMode_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v8 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v8;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeMatchingAssertion:v6];
}

- (void)resumeMatchingForAssertion:(id)a3 advisory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v10 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v10;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  [(SBUIBiometricResource *)self _reevaluateMatching];
  [(SBUIBiometricResource *)self _reallyResumeMatchingForAssertion:v9 advisory:v4];
}

- (void)resumeMatchingAdvisory:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(SBUIBiometricResource *)self _reevaluateMatching];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_matchAssertions;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SBUIBiometricResource _reallyResumeMatchingForAssertion:advisory:](self, "_reallyResumeMatchingForAssertion:advisory:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), v3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3
{
  return [(SBUIBiometricResource *)self acquireFingerDetectionWantedAssertionForReason:a3 HIDEventsOnly:0];
}

- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3 HIDEventsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_initWeak(&location, self);
  uint64_t v7 = [_SBUIBiometricOperationAssertion alloc];
  uint64_t v8 = MEMORY[0x1E4F14428];
  id v9 = MEMORY[0x1E4F14428];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__SBUIBiometricResource_acquireFingerDetectionWantedAssertionForReason_HIDEventsOnly___block_invoke;
  v12[3] = &unk_1E5CCE4D8;
  objc_copyWeak(&v13, &location);
  BOOL v14 = v4;
  long long v10 = [(_SBUIBiometricOperationAssertion *)v7 initWithIdentifier:@"FingerDetectionWanted" forReason:v6 queue:v8 invalidationBlock:v12];

  if (v10) {
    [(SBUIBiometricResource *)self _addFingerDetectionWantedAssertion:v10 HIDEventsOnly:v4];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

void __86__SBUIBiometricResource_acquireFingerDetectionWantedAssertionForReason_HIDEventsOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v8 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v8;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeFingerDetectionWantedAssertion:v6 HIDEventsOnly:*(unsigned __int8 *)(a1 + 40)];
}

- (id)acquireFaceDetectionWantedAssertionForReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [_SBUIBiometricOperationAssertion alloc];
  uint64_t v6 = MEMORY[0x1E4F14428];
  id v7 = MEMORY[0x1E4F14428];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __70__SBUIBiometricResource_acquireFaceDetectionWantedAssertionForReason___block_invoke;
  id v13 = &unk_1E5CCE4B0;
  objc_copyWeak(&v14, &location);
  id v8 = [(_SBUIBiometricOperationAssertion *)v5 initWithIdentifier:@"FaceDetectionWanted" forReason:v4 queue:v6 invalidationBlock:&v10];

  if (v8) {
    -[SBUIBiometricResource _addFaceDetectionWantedAssertion:](self, "_addFaceDetectionWantedAssertion:", v8, v10, v11, v12, v13);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __70__SBUIBiometricResource_acquireFaceDetectionWantedAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v8 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v8;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeFaceDetectionWantedAssertion:v6];
}

- (id)acquireSimulatedLockoutAssertionWithLockoutState:(unint64_t)a3 forReason:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [_SBUISimulatedLockoutAssertion alloc];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __84__SBUIBiometricResource_acquireSimulatedLockoutAssertionWithLockoutState_forReason___block_invoke;
  id v13 = &unk_1E5CCE4B0;
  objc_copyWeak(&v14, &location);
  id v8 = [(_SBUISimulatedLockoutAssertion *)v7 initWithLockoutState:a3 reason:v6 invalidationBlock:&v10];
  if (v8) {
    -[SBUIBiometricResource _addSimulatedLockoutAssertion:](self, "_addSimulatedLockoutAssertion:", v8, v10, v11, v12, v13);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __84__SBUIBiometricResource_acquireSimulatedLockoutAssertionWithLockoutState_forReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v8 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v8;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeSimulatedLockoutAssertion:v6];
}

- (void)_setAuthenticated:(BOOL)a3
{
}

- (void)_forceBioLockout
{
  [(_SBUIBiometricKitInterface *)self->_biometricInterface forceBioLockout];
  MEMORY[0x1F410A5B8](4294967293);
}

- (void)noteScreenWillTurnOff
{
  if (self->_screenIsOn)
  {
    self->_screenIsOn = 0;
    [(SBUIBiometricResource *)self _matchingAllowedStateMayHaveChangedForReason:@"Screen Off"];
    [(SBUIBiometricResource *)self _presenceDetectAllowedStateMayHaveChangedForReason:@"Screen Off"];
  }
}

- (void)noteScreenDidTurnOff
{
  if (self->_screenIsOn)
  {
    self->_screenIsOn = 0;
    [(SBUIBiometricResource *)self _matchingAllowedStateMayHaveChangedForReason:@"Screen Off"];
    [(SBUIBiometricResource *)self _presenceDetectAllowedStateMayHaveChangedForReason:@"Screen Off"];
  }
}

- (void)noteScreenWillTurnOn
{
  if (!self->_screenIsOn)
  {
    self->_screenIsOn = 1;
    [(SBUIBiometricResource *)self _matchingAllowedStateMayHaveChangedForReason:@"Screen On"];
    [(SBUIBiometricResource *)self _presenceDetectAllowedStateMayHaveChangedForReason:@"Screen On"];
  }
}

- (void)setLastBacklightChangeSource:(int64_t)a3
{
  self->_lastBacklightChangeSource = a3;
}

- (void)_profileSettingsChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SBUIBiometricResource__profileSettingsChanged___block_invoke;
  block[3] = &unk_1E5CCC580;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__SBUIBiometricResource__profileSettingsChanged___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogBiometricResource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    [*(id *)(*(void *)(a1 + 32) + 16) isFingerprintUnlockAllowed];
    id v3 = NSStringFromBOOL();
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A7607000, v2, OS_LOG_TYPE_INFO, "Profile settings did change - authentication allowed via mesa? %@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) _matchingAllowedStateMayHaveChangedForReason:@"Profile settings changed"];
}

- (void)_deviceWillWake
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7607000, log, OS_LOG_TYPE_ERROR, "uh-oh, the device went to sleep without disabling matching... forcibly re-enabling.", v1, 2u);
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

uint64_t __55__SBUIBiometricResource_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogBiometricResource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    [*(id *)(*(void *)(a1 + 32) + 32) hasPasscodeSet];
    id v3 = NSStringFromBOOL();
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1A7607000, v2, OS_LOG_TYPE_INFO, "Keybag state change (passcodeSet? %{public}@)", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_reallySetAuthenticated:keybagState:", objc_msgSend(*(id *)(a1 + 40), "isEffectivelyLocked") ^ 1, *(void *)(a1 + 40));
  return [*(id *)(a1 + 32) _matchingAllowedStateMayHaveChangedForReason:@"Keybag state did change"];
}

- (NSString)description
{
  return (NSString *)[(SBUIBiometricResource *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBUIBiometricResource *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBUIBiometricResource *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBUIBiometricResource *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__SBUIBiometricResource_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E5CCC878;
  id v5 = v4;
  id v10 = v5;
  uint64_t v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

id __63__SBUIBiometricResource_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFingerOn"), @"isFingerOn");
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 53) withName:@"isPresenceDetectionAllowed"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 54) withName:@"isForegroundFingerDetectionEnabled"];
  id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 55) withName:@"isBackgroundFingerDetectionEnabled"];
  id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 56) withName:@"isFingerDetectionEnabledThroughHIDChannel"];
  id v7 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 51) withName:@"isMatchingAllowed"];
  id v8 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 52) withName:@"isMatchingEnabled"];
  id v9 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 88) withName:@"MatchingAssertions"];
  id v10 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 96) withName:@"NormalFingerDetectWantedAssertions"];
  id v11 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 104) withName:@"HIDEventsOnlyFingerDetectWantedAssertions"];
  id v12 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 112) withName:@"FaceDetectWantedAssertions"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 120) withName:@"PasscodeRequiredAssertions"];
}

- (void)biometricKitInterface:(id)a3 enrolledIdentitiesDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = SBLogBiometricResource();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromBOOL();
    *(_DWORD *)buf = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_INFO, "Enrolled identities did change - now enrolled: %{public}@", buf, 0xCu);
  }
  id v8 = @"Not Enrolled";
  if (v4) {
    id v8 = @"Enrolled";
  }
  id v9 = [NSString stringWithFormat:@"Enrolled identities may have changed to %@", v8];
  [(SBUIBiometricResource *)self _matchingAllowedStateMayHaveChangedForReason:v9];
}

- (void)biometricKitInterface:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      kdebug_trace();
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Finger OFF sensor";
      goto LABEL_90;
    case 1uLL:
      kdebug_trace();
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Finger ON sensor";
      goto LABEL_90;
    case 2uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: request to remove the finger";
      goto LABEL_90;
    case 3uLL:
      kdebug_trace();
      if (self->_isAuthenticated) {
        goto LABEL_92;
      }
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
      {
        id v9 = NSStringFromBOOL();
        matchAssertions = self->_matchAssertions;
        *(_DWORD *)buf = 138412546;
        v35 = v9;
        __int16 v36 = 2112;
        v37 = matchAssertions;
        _os_log_impl(&dword_1A7607000, &v7->super.super, OS_LOG_TYPE_INFO, "Identity match - authenticated: %@, matchingAssertions: %@", buf, 0x16u);
      }
      goto LABEL_91;
    case 4uLL:
      goto LABEL_93;
    case 5uLL:
      kdebug_trace();
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: match attempt but passcode locked out";
      goto LABEL_90;
    case 6uLL:
      kdebug_trace();
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: match attempt but bio locked out";
      goto LABEL_90;
    case 7uLL:
      kdebug_trace();
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: match attempt but bio unlock is expired";
      goto LABEL_90;
    case 8uLL:
      kdebug_trace();
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: match attempt before first unlock";
      goto LABEL_90;
    case 9uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: match failed with dirt on sensor";
      goto LABEL_90;
    case 0xAuLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: match attempt failed";
      goto LABEL_90;
    case 0xBuLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: match attempt failed and reached bio lockout";
      goto LABEL_90;
    case 0xCuLL:
      unint64_t v11 = [(SBUIBiometricResource *)self biometricLockoutState];
      uint64_t v12 = SBLogBiometricResource();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7607000, v12, OS_LOG_TYPE_INFO, "Status: match operation started", buf, 2u);
      }

      if (!v11) {
        goto LABEL_92;
      }
      goto LABEL_93;
    case 0xDuLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Face in view";
      goto LABEL_90;
    case 0xEuLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Face not in view";
      goto LABEL_90;
    case 0xFuLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: match ended without result";
      goto LABEL_90;
    case 0x10uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: No Feedback";
      goto LABEL_90;
    case 0x11uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Face too far";
      goto LABEL_90;
    case 0x12uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Face too close";
      goto LABEL_90;
    case 0x13uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Camera Obstructed";
      goto LABEL_90;
    case 0x14uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: No attention";
      goto LABEL_90;
    case 0x15uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Face occluded";
      goto LABEL_90;
    case 0x16uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Face out of view";
      goto LABEL_90;
    case 0x17uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Marginal Pose";
      goto LABEL_90;
    case 0x18uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: pearl interlocked";
      goto LABEL_90;
    case 0x19uLL:
      id v13 = SBLogBiometricResource();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7607000, v13, OS_LOG_TYPE_INFO, "Status: device too hot", buf, 2u);
      }

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v7 = self->_matchAssertions;
      uint64_t v14 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v7);
            }
            [(SBUIBiometricResource *)self _deactivateAssertion:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          }
          uint64_t v15 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v15);
      }
      goto LABEL_91;
    case 0x1AuLL:
      v18 = SBLogBiometricResource();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7607000, v18, OS_LOG_TYPE_INFO, "Status: device too cold", buf, 2u);
      }

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v7 = self->_matchAssertions;
      uint64_t v19 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v25 != v21) {
              objc_enumerationMutation(v7);
            }
            -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", *(void *)(*((void *)&v24 + 1) + 8 * j), (void)v24);
          }
          uint64_t v20 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v20);
      }
      goto LABEL_91;
    case 0x1BuLL:
      v23 = SBLogBiometricResource();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7607000, v23, OS_LOG_TYPE_INFO, "Status: operation failed", buf, 2u);
      }

      [(SBUIBiometricResource *)self _deactivateAllPearlAssertions];
      goto LABEL_92;
    case 0x1CuLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Bottom of face occluded";
      goto LABEL_90;
    case 0x1DuLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Face wu pose eligible";
      goto LABEL_90;
    case 0x1EuLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Unsupported glasses";
      goto LABEL_90;
    case 0x1FuLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Pose out of negative pitch range";
      goto LABEL_90;
    case 0x20uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Periocular timed out";
      goto LABEL_90;
    case 0x21uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: unlock token dropped";
      goto LABEL_90;
    case 0x22uLL:
      SBLogBiometricResource();
      id v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      id v8 = "Status: Fallback indicator required";
LABEL_90:
      _os_log_impl(&dword_1A7607000, &v7->super.super, OS_LOG_TYPE_INFO, v8, buf, 2u);
LABEL_91:

LABEL_92:
      -[SBUIBiometricResource _updateHandlersForEvent:](self, "_updateHandlersForEvent:", a4, (void)v24);
LABEL_93:

      return;
    default:
      goto LABEL_92;
  }
}

- (unint64_t)wakeSourceForBiometricKitInterface:(id)a3
{
  if (self->_biometricInterface != a3) {
    return 0;
  }
  unint64_t lastBacklightChangeSource = self->_lastBacklightChangeSource;
  if (lastBacklightChangeSource > 0x2F) {
    return 6;
  }
  else {
    return qword_1A76A58D0[lastBacklightChangeSource];
  }
}

- (void)_reallySetAuthenticated:(BOOL)a3 keybagState:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_isAuthenticated != v4)
  {
    self->_isAuthenticated = v4;
    id v7 = SBLogBiometricResource();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = NSStringFromBOOL();
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_INFO, "Authentication state changed - authenticated: %@", (uint8_t *)&v13, 0xCu);
    }
    if (v4)
    {
      id v9 = v6;
      id v10 = v9;
      if (!v9)
      {
        id v10 = [(SBFMobileKeyBag *)self->_keybag extendedState];
      }
      unint64_t v11 = SBLogBiometricResource();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543618;
        id v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = v10;
        _os_log_impl(&dword_1A7607000, v11, OS_LOG_TYPE_DEFAULT, "Became authenticated with keybag state: %{public}@, local keybag state: %{public}@", (uint8_t *)&v13, 0x16u);
      }

      if ([v10 lockState] == 7)
      {
        uint64_t v12 = SBLogBiometricResource();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1A7607000, v12, OS_LOG_TYPE_INFO, "Identity match reported by the keybag - BioUnlocked", (uint8_t *)&v13, 2u);
        }

        [(SBUIBiometricResource *)self _updateHandlersForEvent:4];
      }
    }
  }
}

- (void)_reallyResumeMatchingForAssertion:(id)a3 advisory:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  BOOL v8 = v4 && [v6 restartCount] == 0;
  id v9 = SBLogBiometricResource();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    BOOL v37 = v4;
    __int16 v38 = 1024;
    BOOL v39 = v8;
    __int16 v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_INFO, "evaluating resumption (advisory: %{BOOL}u advisoryRestart: %{BOOL}u) for assertion %@", buf, 0x18u);
  }

  if (v4 && !v8 || !self->_bkMatchPearlOperationClass) {
    goto LABEL_35;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = [v7 operations];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v11)
  {

    uint64_t v26 = 0;
    goto LABEL_34;
  }
  uint64_t v12 = v11;
  char v13 = 0;
  uint64_t v14 = *(void *)v30;
  long long v27 = v7;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v30 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if (objc_opt_isKindOfClass()) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = 0;
      }
      id v18 = v17;
      if ([v18 shouldAutoRetry])
      {
        id v28 = 0;
        [v18 enableAutoRetry:0 error:&v28];
        id v19 = v28;
        if (v19)
        {
          uint64_t v20 = SBLogBiometricResource();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            [(SBUIBiometricResource *)buf _reallyResumeMatchingForAssertion:&v37 advisory:v20];
          }
        }
      }
      int v21 = objc_msgSend(v18, "startNewMatchAttemptWithError:", 0, v27);
      v22 = SBLogBiometricResource();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (v21)
      {
        if (!v23) {
          goto LABEL_28;
        }
        *(_DWORD *)v33 = 138412290;
        id v34 = v18;
        long long v24 = v22;
        long long v25 = "operation %@ resumed";
      }
      else
      {
        if (!v23) {
          goto LABEL_28;
        }
        *(_DWORD *)v33 = 138412290;
        id v34 = v18;
        long long v24 = v22;
        long long v25 = "operation %@ not resumed";
      }
      _os_log_impl(&dword_1A7607000, v24, OS_LOG_TYPE_INFO, v25, v33, 0xCu);
LABEL_28:
      v13 |= v21;
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
  }
  while (v12);

  if (v13)
  {
    id v7 = v27;
    uint64_t v26 = [v27 restartCount] + 1;
  }
  else
  {
    uint64_t v26 = 0;
    id v7 = v27;
  }
LABEL_34:
  [v7 setRestartCount:v26];
LABEL_35:
}

- (void)_activateMatchAssertion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBUIBiometricResource *)self _clearFinishedOperationsIfNeededForAssertion:v4];
  uint64_t v5 = [v4 matchMode];
  if (v5 == 3) {
    unlockCredentialSet = self->_unlockCredentialSet;
  }
  else {
    unlockCredentialSet = 0;
  }
  id v7 = unlockCredentialSet;
  BOOL v8 = [v4 operations];

  if (!v8)
  {
    if (v5)
    {
      biometricInterface = self->_biometricInterface;
      id v28 = 0;
      id v10 = [(_SBUIBiometricKitInterface *)biometricInterface createMatchOperationsWithMode:v5 andCredentialSet:v7 error:&v28];
      id v11 = v28;
      if (v10)
      {
        uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
        [v4 setOperations:v12];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        char v13 = [v4 operations];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v20 = v7;
          uint64_t v16 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              v21[0] = MEMORY[0x1E4F143A8];
              v21[1] = 3221225472;
              v21[2] = __49__SBUIBiometricResource__activateMatchAssertion___block_invoke;
              v21[3] = &unk_1E5CCE500;
              id v22 = v4;
              BOOL v23 = self;
              [v18 startWithReply:v21];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
          }
          while (v15);
          id v7 = v20;
        }
      }
      else
      {
        char v13 = SBLogBiometricResource();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[SBUIBiometricResource _activateMatchAssertion:]();
        }
      }
    }
    else
    {
      id v19 = [MEMORY[0x1E4F1CAD0] set];
      [v4 setOperations:v19];
    }
  }
}

void __49__SBUIBiometricResource__activateMatchAssertion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__SBUIBiometricResource__activateMatchAssertion___block_invoke_2;
    block[3] = &unk_1E5CCC828;
    id v9 = *(id *)(a1 + 32);
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = v6;
    uint64_t v11 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __49__SBUIBiometricResource__activateMatchAssertion___block_invoke_2(uint64_t a1)
{
  id v2 = SBLogBiometricResource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __49__SBUIBiometricResource__activateMatchAssertion___block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 48) _deactivateAssertion:*(void *)(a1 + 32)];
}

- (void)_clearFinishedOperationsIfNeededForAssertion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogBiometricResource();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v4;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_INFO, "_clearFinishedOperationsIfNeededForAssertion: %{public}@", buf, 0xCu);
  }

  if (self->_isAuthenticated && [v4 matchMode] == 3)
  {
    id v6 = SBLogBiometricResource();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_INFO, "Not clearing operations because we're already authenticated.", buf, 2u);
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = objc_msgSend(v4, "operations", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v12 + 1) + 8 * i) state] == 4)
          {

            uint64_t v11 = SBLogBiometricResource();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A7607000, v11, OS_LOG_TYPE_INFO, "Clearing operations because we found a finished one.", buf, 2u);
            }

            [v4 setOperations:0];
            goto LABEL_19;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }

LABEL_19:
}

- (void)_activateFingerDetectAssertion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 operations];

  if (!v5)
  {
    biometricInterface = self->_biometricInterface;
    id v24 = 0;
    uint64_t v7 = [(_SBUIBiometricKitInterface *)biometricInterface createFingerDetectOperationsWithError:&v24];
    id v8 = v24;
    if (v7)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      [v4 setOperations:v9];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = [v4 operations];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v16 = v7;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke;
            v17[3] = &unk_1E5CCE500;
            id v18 = v4;
            uint64_t v19 = self;
            [v15 startWithReply:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
        uint64_t v7 = v16;
      }
    }
    else
    {
      id v10 = SBLogBiometricResource();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SBUIBiometricResource _activateFingerDetectAssertion:]();
      }
    }
  }
}

void __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke_2;
    block[3] = &unk_1E5CCC828;
    id v9 = *(id *)(a1 + 32);
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = v6;
    uint64_t v11 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke_2(uint64_t a1)
{
  id v2 = SBLogBiometricResource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 48) _deactivateAssertion:*(void *)(a1 + 32)];
}

- (void)_activateFaceDetectAssertion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 operations];

  if (!v5)
  {
    biometricInterface = self->_biometricInterface;
    id v24 = 0;
    uint64_t v7 = [(_SBUIBiometricKitInterface *)biometricInterface createFaceDetectOperationsWithError:&v24];
    id v8 = v24;
    if (v7)
    {
      id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      [v4 setOperations:v9];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = [v4 operations];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v16 = v7;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke;
            v17[3] = &unk_1E5CCE500;
            id v18 = v4;
            uint64_t v19 = self;
            [v15 startWithReply:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
        uint64_t v7 = v16;
      }
    }
    else
    {
      id v10 = SBLogBiometricResource();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SBUIBiometricResource _activateFaceDetectAssertion:]();
      }
    }
  }
}

void __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke_2;
    block[3] = &unk_1E5CCC828;
    id v9 = *(id *)(a1 + 32);
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = v6;
    uint64_t v11 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke_2(uint64_t a1)
{
  id v2 = SBLogBiometricResource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 48) _deactivateAssertion:*(void *)(a1 + 32)];
}

- (void)_deactivateAssertion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(v3, "operations", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) cancel];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [v3 setOperations:0];
}

- (void)_deactivateAllPearlAssertions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_bkMatchPearlOperationClass)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v3 = self->_matchAssertions;
    uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v9 = objc_msgSend(v8, "operations", 0, 0);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v15;
            while (2)
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v15 != v12) {
                  objc_enumerationMutation(v9);
                }
                if (objc_opt_isKindOfClass())
                {

                  [(SBUIBiometricResource *)self _deactivateAssertion:v8];
                  goto LABEL_17;
                }
                ++v13;
              }
              while (v11 != v13);
              uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }

LABEL_17:
          ++v7;
        }
        while (v7 != v5);
        uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }
  }
}

- (void)_addMatchingAssertion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBUIBiometricResource.m", 845, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];
  }
  matchAssertions = self->_matchAssertions;
  if (!matchAssertions)
  {
    uint64_t v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v8 = self->_matchAssertions;
    self->_matchAssertions = v7;

    matchAssertions = self->_matchAssertions;
  }
  [(NSMutableOrderedSet *)matchAssertions addObject:v5];
  long long v9 = SBLogBiometricResource();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = self->_matchAssertions;
    *(_DWORD *)buf = 134218242;
    id v13 = v5;
    __int16 v14 = 2112;
    long long v15 = v10;
    _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_INFO, "Biometric matching assertion added (%p) - all assertions: %@", buf, 0x16u);
  }

  [(SBUIBiometricResource *)self _reevaluateMatching];
}

- (void)_removeMatchingAssertion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBUIBiometricResource.m", 859, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];
  }
  [(SBUIBiometricResource *)self _deactivateAssertion:v5];
  [(NSMutableOrderedSet *)self->_matchAssertions removeObject:v5];
  uint64_t v6 = SBLogBiometricResource();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    matchAssertions = self->_matchAssertions;
    *(_DWORD *)buf = 134218242;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = matchAssertions;
    _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_INFO, "Biometric matching wanted assertion removed (%p) - remaining reasons: %@", buf, 0x16u);
  }

  if (![(NSMutableOrderedSet *)self->_matchAssertions count])
  {
    uint64_t v8 = self->_matchAssertions;
    self->_matchAssertions = 0;
  }
  [(SBUIBiometricResource *)self _reevaluateMatching];
}

- (void)_addFingerDetectionWantedAssertion:(id)a3 HIDEventsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBUIBiometricResource.m", 873, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];
  }
  if (v4)
  {
    p_HIDEventsOnlyFingerDetectAssertions = &self->_HIDEventsOnlyFingerDetectAssertions;
    HIDEventsOnlyFingerDetectAssertions = self->_HIDEventsOnlyFingerDetectAssertions;
    if (HIDEventsOnlyFingerDetectAssertions) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  p_HIDEventsOnlyFingerDetectAssertions = &self->_normalFingerDetectAssertions;
  HIDEventsOnlyFingerDetectAssertions = self->_normalFingerDetectAssertions;
  if (!HIDEventsOnlyFingerDetectAssertions)
  {
LABEL_5:
    uint64_t v10 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v11 = *p_HIDEventsOnlyFingerDetectAssertions;
    *p_HIDEventsOnlyFingerDetectAssertions = v10;

    HIDEventsOnlyFingerDetectAssertions = *p_HIDEventsOnlyFingerDetectAssertions;
  }
LABEL_6:
  [(NSMutableOrderedSet *)HIDEventsOnlyFingerDetectAssertions addObject:v7];
  __int16 v12 = SBLogBiometricResource();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    normalFingerDetectAssertions = self->_normalFingerDetectAssertions;
    uint64_t v14 = self->_HIDEventsOnlyFingerDetectAssertions;
    *(_DWORD *)buf = 134218754;
    id v17 = v7;
    __int16 v18 = 1024;
    BOOL v19 = v4;
    __int16 v20 = 2112;
    long long v21 = normalFingerDetectAssertions;
    __int16 v22 = 2112;
    long long v23 = v14;
    _os_log_impl(&dword_1A7607000, v12, OS_LOG_TYPE_INFO, "Finger detect wanted assertion added (%p) (HIDEventsOnly: %{BOOL}u) - all assertions: %@ %@", buf, 0x26u);
  }

  [(SBUIBiometricResource *)self _reevaluateFingerDetection];
}

- (void)_removeFingerDetectionWantedAssertion:(id)a3 HIDEventsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBUIBiometricResource.m", 894, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];
  }
  [(SBUIBiometricResource *)self _deactivateAssertion:v7];
  uint64_t v8 = 96;
  if (v4) {
    uint64_t v8 = 104;
  }
  [*(id *)((char *)&self->super.isa + v8) removeObject:v7];
  long long v9 = SBLogBiometricResource();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    normalFingerDetectAssertions = self->_normalFingerDetectAssertions;
    HIDEventsOnlyFingerDetectAssertions = self->_HIDEventsOnlyFingerDetectAssertions;
    *(_DWORD *)buf = 134218754;
    id v14 = v7;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    __int16 v17 = 2112;
    __int16 v18 = normalFingerDetectAssertions;
    __int16 v19 = 2112;
    __int16 v20 = HIDEventsOnlyFingerDetectAssertions;
    _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_INFO, "Finger detect wanted assertion removed (%p) (HIDEventsOnly: %{BOOL}u) - remaining assertions: %@ %@", buf, 0x26u);
  }

  [(SBUIBiometricResource *)self _reevaluateFingerDetection];
}

- (void)_addFaceDetectionWantedAssertion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBUIBiometricResource.m", 909, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];
  }
  faceDetectAssertions = self->_faceDetectAssertions;
  if (!faceDetectAssertions)
  {
    id v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v8 = self->_faceDetectAssertions;
    self->_faceDetectAssertions = v7;

    faceDetectAssertions = self->_faceDetectAssertions;
  }
  [(NSMutableOrderedSet *)faceDetectAssertions addObject:v5];
  long long v9 = SBLogBiometricResource();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = self->_faceDetectAssertions;
    *(_DWORD *)buf = 134218242;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v10;
    _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_INFO, "Face detect wanted assertion added (%p) - all assertions: %@", buf, 0x16u);
  }

  [(SBUIBiometricResource *)self _reevaluateFaceDetection];
}

- (void)_removeFaceDetectionWantedAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBUIBiometricResource.m", 922, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];
  }
  [(SBUIBiometricResource *)self _deactivateAssertion:v5];
  [(NSMutableOrderedSet *)self->_faceDetectAssertions removeObject:v5];
  uint64_t v6 = SBLogBiometricResource();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    faceDetectAssertions = self->_faceDetectAssertions;
    *(_DWORD *)buf = 134218242;
    id v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = faceDetectAssertions;
    _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_INFO, "Face detect wanted assertion removed (%p) - remaining assertions: %@", buf, 0x16u);
  }

  [(SBUIBiometricResource *)self _reevaluateFaceDetection];
}

- (void)_addSimulatedLockoutAssertion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBUIBiometricResource.m", 933, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];
  }
  simulatedLockoutAssertions = self->_simulatedLockoutAssertions;
  if (!simulatedLockoutAssertions)
  {
    id v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v8 = self->_simulatedLockoutAssertions;
    self->_simulatedLockoutAssertions = v7;

    simulatedLockoutAssertions = self->_simulatedLockoutAssertions;
  }
  [(NSMutableOrderedSet *)simulatedLockoutAssertions addObject:v5];
  long long v9 = SBLogBiometricResource();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = self->_simulatedLockoutAssertions;
    *(_DWORD *)buf = 134218242;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v10;
    _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_INFO, "Passcode required assertion added (%p) - all assertions: %@", buf, 0x16u);
  }

  [(SBUIBiometricResource *)self _reevaluateMatching];
}

- (void)_removeSimulatedLockoutAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBUIBiometricResource.m", 946, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];
  }
  [(NSMutableOrderedSet *)self->_simulatedLockoutAssertions removeObject:v5];
  uint64_t v6 = SBLogBiometricResource();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    simulatedLockoutAssertions = self->_simulatedLockoutAssertions;
    *(_DWORD *)buf = 134218242;
    id v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = simulatedLockoutAssertions;
    _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_INFO, "Passcode required assertion removed (%p) - remaining assertions: %@", buf, 0x16u);
  }

  [(SBUIBiometricResource *)self _reevaluateMatching];
}

- (void)_presenceDetectAllowedStateMayHaveChangedForReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL screenIsOn = self->_screenIsOn;
  if (self->_isPresenceDetectionAllowed != screenIsOn)
  {
    self->_isPresenceDetectionAllowed = screenIsOn;
    uint64_t v6 = SBLogBiometricResource();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = NSStringFromBOOL();
      int v8 = 138543618;
      long long v9 = v7;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_INFO, "PresenceDetection allowed changed to %{public}@ for reason: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  [(SBUIBiometricResource *)self _reevaluateFingerDetection];
  [(SBUIBiometricResource *)self _reevaluateFaceDetection];
}

- (void)_matchingAllowedStateMayHaveChangedForReason:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBUIBiometricResource *)self hasBiometricAuthenticationCapabilityEnabled])
  {
    BOOL screenIsOn = self->_screenIsOn;
  }
  else
  {
    BOOL screenIsOn = 0;
  }
  if (self->_isMatchingAllowed != screenIsOn)
  {
    self->_isMatchingAllowed = screenIsOn;
    uint64_t v6 = SBLogBiometricResource();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v7;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_INFO, "Matching allowed changed to %{public}@ for reason: %@", buf, 0x16u);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v8 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v13 biometricResource:self matchingAllowedDidChange:self->_isMatchingAllowed];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  [(SBUIBiometricResource *)self _reevaluateMatching];
}

- (void)_reevaluateMatching
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int isMatchingEnabled = self->_isMatchingEnabled;
  if (self->_isMatchingAllowed && [(NSMutableOrderedSet *)self->_matchAssertions count])
  {
    BOOL v4 = [(NSMutableOrderedSet *)self->_simulatedLockoutAssertions count] == 0;
    int v5 = 1;
  }
  else
  {
    int v5 = 0;
    BOOL v4 = 0;
  }
  uint64_t v6 = SBLogBiometricResource();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromBOOL();
    NSStringFromBOOL();
    int v8 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = NSStringFromBOOL();
    matchAssertions = self->_matchAssertions;
    *(_DWORD *)buf = 138544130;
    __int16 v40 = v7;
    __int16 v41 = 2114;
    uint64_t v42 = v8;
    __int16 v43 = 2114;
    v44 = v9;
    __int16 v45 = 2112;
    v46 = matchAssertions;
    _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_INFO, "Reevaluating matching. _int isMatchingEnabled = %{public}@ shouldBeEnabled = %{public}@ _isMatchingAllowed = %{public}@ _matchAssertions = %@", buf, 0x2Au);
  }
  if (self->_isMatchingEnabled != v5)
  {
    uint64_t v11 = SBLogBiometricResource();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = NSStringFromBOOL();
      uint64_t v13 = self->_matchAssertions;
      *(_DWORD *)buf = 138412546;
      __int16 v40 = v12;
      __int16 v41 = 2112;
      uint64_t v42 = v13;
      _os_log_impl(&dword_1A7607000, v11, OS_LOG_TYPE_INFO, "Changing matching to %@. _matchAssertions = %@", buf, 0x16u);
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v14 = self->_matchAssertions;
  uint64_t v15 = [(NSMutableOrderedSet *)v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if (v4) {
          [(SBUIBiometricResource *)self _activateMatchAssertion:v19];
        }
        else {
          [(SBUIBiometricResource *)self _deactivateAssertion:v19];
        }
      }
      uint64_t v16 = [(NSMutableOrderedSet *)v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v16);
  }

  if (isMatchingEnabled != v5)
  {
    self->_int isMatchingEnabled = v5;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    __int16 v20 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v25 biometricResource:self matchingEnabledDidChange:self->_isMatchingEnabled];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v22);
    }

    uint64_t v26 = SBLogBiometricResource();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      long long v27 = NSStringFromBOOL();
      id v28 = self->_matchAssertions;
      *(_DWORD *)buf = 138412546;
      __int16 v40 = v27;
      __int16 v41 = 2112;
      uint64_t v42 = v28;
      _os_log_impl(&dword_1A7607000, v26, OS_LOG_TYPE_INFO, "Changed matching to %@. _matchAssertions = %@", buf, 0x16u);
    }
  }
}

- (void)_reevaluateFingerDetection
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (self->_isPresenceDetectionAllowed)
  {
    BOOL v3 = ([(NSMutableOrderedSet *)self->_HIDEventsOnlyFingerDetectAssertions count]
       || [(NSMutableOrderedSet *)self->_normalFingerDetectAssertions count])
      && self->_hasMesaHardware;
    if (self->_isPresenceDetectionAllowed && [(NSMutableOrderedSet *)self->_normalFingerDetectAssertions count])
    {
      BOOL hasMesaHardware = self->_hasMesaHardware;
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  BOOL hasMesaHardware = 0;
LABEL_10:
  if (self->_isBackgroundFingerDetectionEnabled == v3) {
    goto LABEL_29;
  }
  self->_isBackgroundFingerDetectionEnabled = v3;
  int v5 = SBLogBiometricResource();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self->_isBackgroundFingerDetectionEnabled) {
      uint64_t v6 = @"ENABLED";
    }
    else {
      uint64_t v6 = @"DISABLED";
    }
    *(_DWORD *)buf = 138412290;
    __int16 v40 = v6;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_INFO, "Background FingerDetection %@", buf, 0xCu);
  }

  if (self->_isBackgroundFingerDetectionEnabled)
  {
    biometricInterface = self->_biometricInterface;
    id v36 = 0;
    BOOL v8 = [(_SBUIBiometricKitInterface *)biometricInterface enableBackgroundFingerDetection:1 error:&v36];
    uint64_t v9 = (__CFString *)v36;
    self->_isFingerDetectionEnabledThroughHIDChannel = v8;
    uint64_t v10 = SBLogBiometricResource();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (v8) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = v9;
      }
      *(_DWORD *)buf = 138412290;
      __int16 v40 = v11;
      uint64_t v12 = "FingerDetection ENABLED through HID channel (error %@)";
LABEL_27:
      _os_log_impl(&dword_1A7607000, v10, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
    }
  }
  else
  {
    self->_isFingerDetectionEnabledThroughHIDChannel = 0;
    uint64_t v13 = self->_biometricInterface;
    id v35 = 0;
    BOOL v14 = [(_SBUIBiometricKitInterface *)v13 enableBackgroundFingerDetection:0 error:&v35];
    uint64_t v9 = (__CFString *)v35;
    uint64_t v10 = SBLogBiometricResource();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (v14) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v9;
      }
      *(_DWORD *)buf = 138412290;
      __int16 v40 = v15;
      uint64_t v12 = "FingerDetection DISABLED through HID channel (error %@)";
      goto LABEL_27;
    }
  }

LABEL_29:
  if (self->_isForegroundFingerDetectionEnabled != hasMesaHardware)
  {
    self->_isForegroundFingerDetectionEnabled = hasMesaHardware;
    uint64_t v16 = SBLogBiometricResource();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (hasMesaHardware)
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7607000, v16, OS_LOG_TYPE_INFO, "FingerDetection ENABLED through biometricKit channel.", buf, 2u);
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      __int16 v18 = self->_normalFingerDetectAssertions;
      uint64_t v19 = [(NSMutableOrderedSet *)v18 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            [(SBUIBiometricResource *)self _activateFingerDetectAssertion:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          }
          uint64_t v20 = [(NSMutableOrderedSet *)v18 countByEnumeratingWithState:&v31 objects:v38 count:16];
        }
        while (v20);
      }
    }
    else
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7607000, v16, OS_LOG_TYPE_INFO, "FingerDetection DISABLED through biometricKit channel", buf, 2u);
      }

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      __int16 v18 = self->_normalFingerDetectAssertions;
      uint64_t v23 = [(NSMutableOrderedSet *)v18 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v28 != v25) {
              objc_enumerationMutation(v18);
            }
            -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", *(void *)(*((void *)&v27 + 1) + 8 * j), (void)v27);
          }
          uint64_t v24 = [(NSMutableOrderedSet *)v18 countByEnumeratingWithState:&v27 objects:v37 count:16];
        }
        while (v24);
      }
    }
  }
}

- (void)_reevaluateFaceDetection
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int isPresenceDetectionAllowed = self->_isPresenceDetectionAllowed;
  if (self->_isPresenceDetectionAllowed)
  {
    if ([(NSMutableOrderedSet *)self->_faceDetectAssertions count]) {
      int isPresenceDetectionAllowed = self->_hasPearlHardware;
    }
    else {
      int isPresenceDetectionAllowed = 0;
    }
  }
  int isFaceDetectionEnabled = self->_isFaceDetectionEnabled;
  if (isFaceDetectionEnabled != isPresenceDetectionAllowed)
  {
    self->_int isFaceDetectionEnabled = isPresenceDetectionAllowed;
    int v5 = SBLogBiometricResource();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_isFaceDetectionEnabled) {
        uint64_t v6 = @"ENABLED";
      }
      else {
        uint64_t v6 = @"DISABLED";
      }
      *(_DWORD *)buf = 138412290;
      long long v27 = v6;
      _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_INFO, "FaceDetection %@", buf, 0xCu);
    }

    int isFaceDetectionEnabled = self->_isFaceDetectionEnabled;
  }
  if (isFaceDetectionEnabled)
  {
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    long long v20 = 0uLL;
    long long v21 = 0uLL;
    id v7 = self->_faceDetectAssertions;
    uint64_t v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          [(SBUIBiometricResource *)self _activateFaceDetectAssertion:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        }
        uint64_t v9 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v9);
    }
  }
  else
  {
    long long v18 = 0uLL;
    long long v19 = 0uLL;
    long long v16 = 0uLL;
    long long v17 = 0uLL;
    id v7 = self->_faceDetectAssertions;
    uint64_t v12 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v7);
          }
          -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
        }
        uint64_t v13 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (void)_updateHandlersForEvent:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  unint64_t lastEvent = self->_lastEvent;
  self->_unint64_t lastEvent = a3;
  if (a3 != 4) {
    goto LABEL_37;
  }
  char v6 = self->_isMatchingEnabled
     ? [(SBUIBiometricAuthenticationPolicy *)self->_authenticationPolicy shouldRelockAfterBioUnlock] ^ 1: 0;
  if (lastEvent == 4) {
    goto LABEL_37;
  }
  id v7 = SBLogBiometricResource();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = NSStringFromBOOL();
    [(SBUIBiometricAuthenticationPolicy *)self->_authenticationPolicy shouldRelockAfterBioUnlock];
    uint64_t v9 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412546;
    long long v18 = v8;
    __int16 v19 = 2112;
    long long v20 = v9;
    _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_INFO, "_isMatchingEnabled: %@, [_authenticationPolicy shouldRelockAfterBioUnlock]: %@", buf, 0x16u);
  }
  if (v6)
  {
LABEL_37:
    if (self->_isMatchingEnabled)
    {
      if (a3 == 1)
      {
        BOOL v10 = 1;
        goto LABEL_22;
      }
      if (!a3)
      {
        BOOL v10 = 0;
        goto LABEL_22;
      }
      [(SBUIBiometricResource *)self _notifyObserversOfEvent:a3];
      if (a3 == 4)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__SBUIBiometricResource__updateHandlersForEvent___block_invoke;
        block[3] = &unk_1E5CCC580;
        void block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    else
    {
      if (!a3 && self->_shouldSendFingerOffNotification)
      {
        self->_shouldSendFingerOffNotification = 0;
        uint64_t v11 = self;
        unint64_t v12 = 0;
LABEL_24:
        [(SBUIBiometricResource *)v11 _notifyObserversOfEvent:v12];
        return;
      }
      if (self->_isForegroundFingerDetectionEnabled)
      {
        if (a3 > 1)
        {
LABEL_23:
          uint64_t v11 = self;
          unint64_t v12 = a3;
          goto LABEL_24;
        }
        BOOL v10 = a3 == 1;
LABEL_22:
        self->_shouldSendFingerOffNotification = v10;
        goto LABEL_23;
      }
      if (self->_isFaceDetectionEnabled)
      {
        if (a3 == 13)
        {
          BOOL v15 = 1;
        }
        else
        {
          if (a3 != 22) {
            goto LABEL_23;
          }
          BOOL v15 = 0;
        }
        self->_shouldSendFaceOutOfViewNotification = v15;
        goto LABEL_23;
      }
    }
  }
  else
  {
    uint64_t v13 = SBLogBiometricResource();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBUIBiometricResource _updateHandlersForEvent:](v13);
    }

    uint64_t v14 = [MEMORY[0x1E4F74230] sharedConnection];
    [v14 lockDeviceImmediately:1];
  }
}

void __49__SBUIBiometricResource__updateHandlersForEvent___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SBBiometricEventMonitorHasAuthenticated" object:*(void *)(a1 + 32)];
}

- (void)_notifyObserversOfEvent:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = (void *)[(NSHashTable *)self->_observers copy];
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
        BOOL v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 biometricResource:self observeEvent:a3];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (SBUIBiometricAuthenticationPolicy)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (void)setAuthenticationPolicy:(id)a3
{
}

- (SBFCredentialSet)unlockCredentialSet
{
  return self->_unlockCredentialSet;
}

- (void)setUnlockCredentialSet:(id)a3
{
}

- (BOOL)isMatchingEnabled
{
  return self->_isMatchingEnabled;
}

- (BOOL)isMatchingAllowed
{
  return self->_isMatchingAllowed;
}

- (SBFMobileKeyBag)_keybagInterface
{
  return self->_keybag;
}

- (void)_setKeybagInterface:(id)a3
{
}

- (_SBUIBiometricKitInterface)_biometricKitInterface
{
  return self->_biometricInterface;
}

- (void)_setBiometricKitInterface:(id)a3
{
}

- (MCProfileConnection)_profileConnection
{
  return self->_profileConnection;
}

- (void)_setProfileConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationPolicy, 0);
  objc_storeStrong((id *)&self->_simulatedLockoutAssertions, 0);
  objc_storeStrong((id *)&self->_faceDetectAssertions, 0);
  objc_storeStrong((id *)&self->_HIDEventsOnlyFingerDetectAssertions, 0);
  objc_storeStrong((id *)&self->_normalFingerDetectAssertions, 0);
  objc_storeStrong((id *)&self->_matchAssertions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_unlockCredentialSet, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_authPolicy, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_biometricInterface, 0);
}

- (void)_reallyResumeMatchingForAssertion:(void *)a3 advisory:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 localizedDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1A7607000, a4, OS_LOG_TYPE_ERROR, "Could not disable auto-retry: %@", a1, 0xCu);
}

- (void)_activateMatchAssertion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1A7607000, v0, v1, "Failed to create operations for match assertion %{public}@ with error %{public}@");
}

void __49__SBUIBiometricResource__activateMatchAssertion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_1A7607000, v0, v1, "Failed to activate match assertion %{public}@ with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)_activateFingerDetectAssertion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1A7607000, v0, v1, "Failed to create operations for finger detection assertion %{public}@ with error %{public}@");
}

void __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_1A7607000, v0, v1, "Failed to activate finger detection assertion %{public}@ with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)_activateFaceDetectAssertion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1A7607000, v0, v1, "Failed to create operations for face detection assertion %{public}@ with error %{public}@");
}

void __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_1A7607000, v0, v1, "Failed to activate face detection assertion %{public}@ with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)_updateHandlersForEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7607000, log, OS_LOG_TYPE_ERROR, "Relocking keybag because we think we should do so (matching disabled but received a bioUnlock event).", v1, 2u);
}

@end