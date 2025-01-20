@interface SBLockScreenBiometricAuthenticationCoordinator
- (BOOL)_hasActivePasscodeViews;
- (BOOL)_isMatchingEffectivelyDisabled;
- (BOOL)_isWalletPreArmAllowed;
- (BOOL)_stateWantsMatching:(unint64_t)a3 outMatchMode:(unint64_t *)a4;
- (BOOL)bioAuthenticatedWhileMenuButtonDown;
- (BOOL)biometricUnlockBehavior:(id)a3 requestsFeedback:(id)a4;
- (BOOL)biometricUnlockBehavior:(id)a3 requestsUnlock:(id)a4 withFeedback:(id)a5;
- (BOOL)isAuthenticated;
- (BOOL)isAutoUnlockingDisabled;
- (BOOL)isEnabled;
- (BOOL)isUnlockingDisabled;
- (BOOL)isWalletPreArmDisabled;
- (NFWalletPresentation)_getWalletPresentation;
- (NSString)description;
- (PKPassLibrary)_getPassLibrary;
- (SBBiometricUnlockBehavior)_setAutoUnlockBehavior;
- (SBLockScreenBiometricAuthenticationCoordinator)initWithBiometricResource:(id)a3 walletPreArmController:(id)a4;
- (SBLockScreenBiometricAuthenticationCoordinatorDelegate)delegate;
- (SBWalletPrearmRecognizer)_walletPrearmRecognizer;
- (id)acquireDisableAutoUnlockAssertionForReason:(id)a3;
- (id)acquireDisableCoordinatorAssertionForReason:(id)a3;
- (id)acquireDisableUnlockAssertionForReason:(id)a3;
- (id)acquireDisableWalletPreArmAssertionForReason:(id)a3;
- (id)acquireMatchingAssertionWithMode:(unint64_t)a3 reason:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_state;
- (void)_addPasscodeMatchingAssertion:(id)a3;
- (void)_clearFingerDetectAssertion;
- (void)_clearPendingUnlockRequest;
- (void)_createFingerDetectAssertion;
- (void)_handleIdentityMatchSuccess:(BOOL)a3;
- (void)_handlePassKitDismissalIfNecessaryWithReason:(id)a3;
- (void)_invalidateWalletPreArmRecognizer;
- (void)_noteMenuButtonDoublePress;
- (void)_noteMenuButtonSinglePress;
- (void)_pendUnlockRequest:(id)a3;
- (void)_removePasscodeMatchingAssertion:(id)a3;
- (void)_resetStateForReason:(id)a3;
- (void)_setAutoUnlockBehavior:(id)a3;
- (void)_setPassLibrary:(id)a3;
- (void)_setState:(unint64_t)a3 forReason:(id)a4;
- (void)_setWalletPresentation:(id)a3;
- (void)_setupPreArmRecognizerIfPossibleForReason:(id)a3;
- (void)_stateChangedFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)_toggleAutoUnlockBehaviorEnabled:(BOOL)a3;
- (void)_updateMatchingForState:(unint64_t)a3 forReason:(id)a4;
- (void)_walletPreArmDisabledDidChange:(id)a3;
- (void)biometricResource:(id)a3 matchingAllowedDidChange:(BOOL)a4;
- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4;
- (void)contactlessInterfaceDidDismissFromSource:(int64_t)a3;
- (void)passLibraryReceivedInterruption;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBioAuthenticatedWhileMenuButtonDown:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)walletPrearmRecognizer:(id)a3 didFailToRecognizeForReason:(unint64_t)a4;
- (void)walletPrearmRecognizerDidRecognize:(id)a3;
@end

@implementation SBLockScreenBiometricAuthenticationCoordinator

- (void)_walletPreArmDisabledDidChange:(id)a3
{
  if ([(SBWalletPreArmController *)self->_walletPreArmController isPreArmSuppressed]) {
    v4 = @"All wallet pre-arm assertions have been removed";
  }
  else {
    v4 = @"Wallet pre-arm assertions exist";
  }
  [(SBLockScreenBiometricAuthenticationCoordinator *)self _resetStateForReason:v4];
}

- (void)_resetStateForReason:(id)a3
{
  id v4 = a3;
  v5 = [NSString stringWithFormat:@"Reset because %@", v4];
  BOOL v6 = [(SBLockScreenBiometricAuthenticationCoordinator *)self isUnlockingDisabled];
  if (![(SBLockScreenBiometricAuthenticationCoordinator *)self isEnabled]) {
    goto LABEL_11;
  }
  if (!v6 && [(SBLockScreenBiometricAuthenticationCoordinator *)self _hasActivePasscodeViews])
  {
    uint64_t v7 = 4;
    goto LABEL_12;
  }
  if ([(SBLockScreenBiometricAuthenticationCoordinator *)self _isWalletPreArmAllowed])
  {
    uint64_t v7 = 2;
    goto LABEL_12;
  }
  if ([(SBUIBiometricResource *)self->_biometricResource hasEnrolledIdentities])
  {
    if (v6
      || [(SBLockScreenBiometricAuthenticationCoordinator *)self isAutoUnlockingDisabled])
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = 3;
    }
  }
  else
  {
LABEL_11:
    uint64_t v7 = 0;
  }
LABEL_12:
  [(SBLockScreenBiometricAuthenticationCoordinator *)self _setState:v7 forReason:v5];
  if (self->_state != v7)
  {
    v8 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:]((uint64_t)v4, v8);
    }
  }
}

- (BOOL)isUnlockingDisabled
{
  if ([(NSHashTable *)self->_disabledUnlockAssertions count]) {
    return 1;
  }
  else {
    return [(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled] ^ 1;
  }
}

- (BOOL)isEnabled
{
  return [(NSHashTable *)self->_disabledAssertions count] == 0;
}

- (void)_setState:(unint64_t)a3 forReason:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t state = self->_state;
  if (state != a3)
  {
    self->_unint64_t state = a3;
    v8 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = self->_state - 1;
      if (v9 > 3) {
        v10 = @"Disabled";
      }
      else {
        v10 = off_1E6B02DF0[v9];
      }
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Mesa state changed to [%{public}@] for reason: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    [(SBLockScreenBiometricAuthenticationCoordinator *)self _updateMatchingForState:self->_state forReason:v6];
    [(SBLockScreenBiometricAuthenticationCoordinator *)self _stateChangedFrom:state to:self->_state];
  }
}

- (SBLockScreenBiometricAuthenticationCoordinator)initWithBiometricResource:(id)a3 walletPreArmController:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SBLockScreenBiometricAuthenticationCoordinator.m", 122, @"Invalid parameter not satisfying: %@", @"biometricResource" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)SBLockScreenBiometricAuthenticationCoordinator;
  v10 = [(SBLockScreenBiometricAuthenticationCoordinator *)&v28 init];
  int v11 = v10;
  if (v10)
  {
    v10->_unint64_t state = 0;
    objc_storeStrong((id *)&v10->_walletPreArmController, a4);
    v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    activePasscodeMatchAssertions = v11->_activePasscodeMatchAssertions;
    v11->_activePasscodeMatchAssertions = v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    disabledUnlockAssertions = v11->_disabledUnlockAssertions;
    v11->_disabledUnlockAssertions = (NSHashTable *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    disabledAutoUnlockAssertions = v11->_disabledAutoUnlockAssertions;
    v11->_disabledAutoUnlockAssertions = (NSHashTable *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    disabledAssertions = v11->_disabledAssertions;
    v11->_disabledAssertions = (NSHashTable *)v18;

    id v20 = objc_alloc_init(MEMORY[0x1E4F84898]);
    [(SBLockScreenBiometricAuthenticationCoordinator *)v11 _setPassLibrary:v20];

    id v21 = objc_alloc_init(MEMORY[0x1E4F7A0A8]);
    [(SBLockScreenBiometricAuthenticationCoordinator *)v11 _setWalletPresentation:v21];

    objc_storeStrong((id *)&v11->_biometricResource, a3);
    biometricResource = v11->_biometricResource;
    id v23 = objc_alloc_init(MEMORY[0x1E4FA5ED8]);
    [(SBUIBiometricResource *)biometricResource setUnlockCredentialSet:v23];

    [(SBUIBiometricResource *)v11->_biometricResource addObserver:v11];
    id v24 = +[SBBiometricEventLogger sharedInstance];
    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v11 selector:sel__walletPreArmDisabledDidChange_ name:@"SBWalletPreArmControllerPreArmSuppressionDidChange" object:v9];
  }
  return v11;
}

- (void)setAuthenticated:(BOOL)a3
{
  if (self->_isAuthenticated != a3)
  {
    self->_isAuthenticated = a3;
    -[SBUIBiometricResource _setAuthenticated:](self->_biometricResource, "_setAuthenticated:");
    unint64_t state = self->_state;
    v5 = NSString;
    NSStringFromBOOL();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 stringWithFormat:@"Authentication state changed (authenticated: %@)", v7];
    [(SBLockScreenBiometricAuthenticationCoordinator *)self _updateMatchingForState:state forReason:v6];
  }
}

- (id)acquireDisableCoordinatorAssertionForReason:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v6 = MEMORY[0x1E4F14428];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __94__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableCoordinatorAssertionForReason___block_invoke;
  uint64_t v15 = &unk_1E6AFA6D0;
  objc_copyWeak(&v17, &location);
  id v7 = v4;
  id v16 = v7;
  id v8 = (void *)[v5 initWithIdentifier:@"DisableCoordinator" forReason:v7 queue:MEMORY[0x1E4F14428] invalidationBlock:&v12];

  if (v8)
  {
    id v9 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v7;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Added disable wallet pre-arm assertion for reason: %{public}@", buf, 0xCu);
    }

    [(NSHashTable *)self->_disabledAssertions addObject:v8];
    if (self->_state)
    {
      v10 = [NSString stringWithFormat:@"Disable coordinator assertion added: %@", self->_disabledAssertions, v12, v13, v14, v15];
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _resetStateForReason:v10];
    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

void __94__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableCoordinatorAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  [WeakRetained[18] removeObject:v4];

  id v6 = SBLogLockScreenBiometricCoordinator();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Removed disable coordinator assertion for reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if ([WeakRetained isEnabled]) {
    [WeakRetained _resetStateForReason:@"Last disable coordinator assertion removed."];
  }
}

- (id)acquireDisableWalletPreArmAssertionForReason:(id)a3
{
  return [(SBWalletPreArmController *)self->_walletPreArmController acquireSuppressPreArmAssertionForReason:a3];
}

- (BOOL)isWalletPreArmDisabled
{
  return [(SBWalletPreArmController *)self->_walletPreArmController isPreArmSuppressed];
}

- (id)acquireDisableUnlockAssertionForReason:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v6 = MEMORY[0x1E4F14428];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __89__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableUnlockAssertionForReason___block_invoke;
  uint64_t v15 = &unk_1E6AFA6D0;
  objc_copyWeak(&v17, &location);
  id v7 = v4;
  id v16 = v7;
  int v8 = (void *)[v5 initWithIdentifier:@"DisableUnlockAssertion" forReason:v7 queue:MEMORY[0x1E4F14428] invalidationBlock:&v12];

  if (v8)
  {
    uint64_t v9 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v7;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Added disable Unlock assertion for reason: %{public}@", buf, 0xCu);
    }

    [(NSHashTable *)self->_disabledUnlockAssertions addObject:v8];
    if (self->_state - 3 <= 1)
    {
      uint64_t v10 = [NSString stringWithFormat:@"Unlock was allowed, but now it's disabled for assertions: %@", self->_disabledUnlockAssertions, v12, v13, v14, v15];
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _resetStateForReason:v10];
    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

void __89__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableUnlockAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  [WeakRetained[19] removeObject:v4];

  id v6 = SBLogLockScreenBiometricCoordinator();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Removed disable Unlock assertion for reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (([WeakRetained isUnlockingDisabled] & 1) == 0) {
    [WeakRetained _resetStateForReason:@"Last disable Unlock assertion dropped and current state is unavailable."];
  }
}

- (id)acquireDisableAutoUnlockAssertionForReason:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v6 = MEMORY[0x1E4F14428];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __93__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableAutoUnlockAssertionForReason___block_invoke;
  uint64_t v15 = &unk_1E6AFA6D0;
  objc_copyWeak(&v17, &location);
  id v7 = v4;
  id v16 = v7;
  int v8 = (void *)[v5 initWithIdentifier:@"DisableAutoUnlockAssertion" forReason:v7 queue:MEMORY[0x1E4F14428] invalidationBlock:&v12];

  if (v8)
  {
    uint64_t v9 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v7;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Added disable AutoUnlock assertion for reason: %{public}@", buf, 0xCu);
    }

    [(NSHashTable *)self->_disabledAutoUnlockAssertions addObject:v8];
    if (self->_state == 3)
    {
      uint64_t v10 = [NSString stringWithFormat:@"AutoUnlock was allowed, but now it's disabled for assertions: %@", self->_disabledAutoUnlockAssertions, v12, v13, v14, v15];
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _resetStateForReason:v10];
    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

void __93__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableAutoUnlockAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  [WeakRetained[20] removeObject:v4];

  id v6 = SBLogLockScreenBiometricCoordinator();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Removed disable AutoUnlock assertion for reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (([WeakRetained isAutoUnlockingDisabled] & 1) == 0) {
    [WeakRetained _resetStateForReason:@"Last disable AutoUnlock assertion dropped and current state is unavailable."];
  }
}

- (BOOL)isAutoUnlockingDisabled
{
  return [(SBLockScreenBiometricAuthenticationCoordinator *)self isUnlockingDisabled]
      || [(NSHashTable *)self->_disabledAutoUnlockAssertions count] != 0;
}

- (void)_noteMenuButtonSinglePress
{
  v3 = SBLogLockScreenBiometricCoordinator();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Received menu button single press", v4, 2u);
  }

  [(SBLockScreenBiometricAuthenticationCoordinator *)self _setupPreArmRecognizerIfPossibleForReason:@"MenuButtonSinglePress"];
  [(SBWalletPrearmRecognizer *)self->_walletPrearmRecognizer menuButtonSinglePress];
}

- (void)_noteMenuButtonDoublePress
{
  v3 = SBLogLockScreenBiometricCoordinator();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Received menu button double press", v4, 2u);
  }

  [(SBLockScreenBiometricAuthenticationCoordinator *)self _setupPreArmRecognizerIfPossibleForReason:@"MenuButtonDoublePress"];
  [(SBWalletPrearmRecognizer *)self->_walletPrearmRecognizer menuButtonDoublePress];
}

- (void)_setPassLibrary:(id)a3
{
  id v5 = (PKPassLibrary *)a3;
  passLibrary = self->_passLibrary;
  if (passLibrary != v5)
  {
    uint64_t v7 = v5;
    [(PKPassLibrary *)passLibrary removeDelegate:self];
    objc_storeStrong((id *)&self->_passLibrary, a3);
    [(PKPassLibrary *)self->_passLibrary addDelegate:self];
    id v5 = v7;
  }
}

- (NSString)description
{
  return (NSString *)[(SBLockScreenBiometricAuthenticationCoordinator *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBLockScreenBiometricAuthenticationCoordinator *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBLockScreenBiometricAuthenticationCoordinator *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBLockScreenBiometricAuthenticationCoordinator *)self succinctDescriptionBuilder];
  id v5 = v4;
  unint64_t v6 = self->_state - 1;
  if (v6 > 3) {
    uint64_t v7 = @"Disabled";
  }
  else {
    uint64_t v7 = off_1E6B02DF0[v6];
  }
  [v4 appendString:v7 withName:@"matchingState"];
  id v8 = (id)[v5 appendObject:self->_walletPrearmRecognizer withName:@"walletPrearmRecognizer"];
  id v9 = (id)[v5 appendBool:self->_presentingWalletInterface withName:@"isPresentingWalletInterface"];
  id v10 = (id)[v5 appendObject:self->_pendingUnlockRequest withName:@"pendingUnlockRequest"];
  int v11 = [v5 activeMultilinePrefix];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__SBLockScreenBiometricAuthenticationCoordinator_descriptionBuilderWithMultilinePrefix___block_invoke;
  v15[3] = &unk_1E6AF5290;
  id v12 = v5;
  id v16 = v12;
  id v17 = self;
  [v12 appendBodySectionWithName:@"assertions" multilinePrefix:v11 block:v15];

  id v13 = v12;
  return v13;
}

void __88__SBLockScreenBiometricAuthenticationCoordinator_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(*(void *)(a1 + 40) + 144) allObjects];
  [v2 appendArraySection:v3 withName:@"disableCoordinatorAssertions" skipIfEmpty:1];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 152) allObjects];
  [v4 appendArraySection:v5 withName:@"disableUnlockAssertions" skipIfEmpty:1];

  unint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 160) allObjects];
  [v6 appendArraySection:v7 withName:@"disableAutoUnlockAssertions" skipIfEmpty:1];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(*(void *)(a1 + 40) + 136) array];
  [v8 appendArraySection:v9 withName:@"passcodeMatchAssertions" skipIfEmpty:1];
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      uint64_t v7 = SBLogLockScreenBiometricCoordinator();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Finger off", buf, 2u);
      }
      goto LABEL_19;
    case 1uLL:
      id v8 = SBLogLockScreenBiometricCoordinator();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Finger on", buf, 2u);
      }

      [(SBLockScreenBiometricAuthenticationCoordinator *)self _setupPreArmRecognizerIfPossibleForReason:@"Finger On"];
      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v7 = v9;
      id v10 = &SBBiometricEventTimestampNotificationFingerOn;
      goto LABEL_18;
    case 3uLL:
      unint64_t state = self->_state;
      if (state != 2)
      {
        unint64_t v17 = state - 3;
        uint64_t v18 = SBLogLockScreenBiometricCoordinator();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v17 > 1)
        {
          if (v19)
          {
            *(_WORD *)buf = 0;
            id v20 = "Identity match - likely to be consumed by someone else (ie. wallet) because we aren't looking for it.";
            goto LABEL_25;
          }
        }
        else if (v19)
        {
          *(_WORD *)buf = 0;
          id v20 = "Identity match received while waiting for unlock.";
LABEL_25:
          _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, v20, buf, 2u);
        }

        goto LABEL_27;
      }
      if (self->_walletPrearmRecognizer || self->_presentingWalletInterface)
      {
        uint64_t v14 = SBLogLockScreenBiometricCoordinator();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Identity match - while wallet pre-arm recognizer active", buf, 2u);
        }

        self->_didMatchBeforeWalletPrearmRecognizerTimeout = 1;
      }
      else if (![(SBLockScreenBiometricAuthenticationCoordinator *)self isAutoUnlockingDisabled])
      {
        [(SBLockScreenBiometricAuthenticationCoordinator *)self _setState:3 forReason:@"Identity match - with no wallet pre-arm recognizer active and not presenting wallet UI"];
      }
LABEL_27:
      int v11 = self;
      uint64_t v12 = 1;
LABEL_28:
      [(SBLockScreenBiometricAuthenticationCoordinator *)v11 _handleIdentityMatchSuccess:v12];
LABEL_29:
      [(SBBiometricUnlockBehavior *)self->_autoUnlockBehavior handleBiometricEvent:a4];

      return;
    case 4uLL:
      uint64_t v15 = SBLogLockScreenBiometricCoordinator();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "Bio unlock", buf, 2u);
      }

      self->_bioAuthenticatedWhileMenuButtonDown = 1;
      id v16 = [(id)SBApp homeHardwareButton];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __81__SBLockScreenBiometricAuthenticationCoordinator_biometricResource_observeEvent___block_invoke;
      v21[3] = &unk_1E6AF4AC0;
      v21[4] = self;
      [v16 performWhenMenuButtonIsUpUsingBlock:v21];

      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v7 = v9;
      id v10 = &SBBiometricEventTimestampNotificationKeybagUnlock;
LABEL_18:
      [v9 postNotificationName:*v10 object:0];
LABEL_19:

      goto LABEL_29;
    default:
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0xA) {
        goto LABEL_29;
      }
      int v11 = self;
      uint64_t v12 = 0;
      goto LABEL_28;
  }
}

uint64_t __81__SBLockScreenBiometricAuthenticationCoordinator_biometricResource_observeEvent___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 121) = 0;
  return result;
}

- (void)biometricResource:(id)a3 matchingAllowedDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = SBLogLockScreenBiometricCoordinator();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = @"NotAllowed";
    if (v4) {
      uint64_t v7 = @"Allowed";
    }
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Biometric resource matching allowed did change to %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (v4 && self->_state <= 1)
  {
    [(SBLockScreenBiometricAuthenticationCoordinator *)self _resetStateForReason:@"Biometric event monitor matching is now allowed."];
    [(SBUIBiometricResource *)self->_biometricResource refreshMatchMode];
  }
}

- (void)walletPrearmRecognizerDidRecognize:(id)a3
{
  id v5 = (SBWalletPrearmRecognizer *)a3;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBLockScreenBiometricAuthenticationCoordinator.m", 466, @"Invalid parameter not satisfying: %@", @"recognizer" object file lineNumber description];
  }
  if (self->_walletPrearmRecognizer == v5)
  {
    if (self->_presentingWalletInterface)
    {
      int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"SBLockScreenBiometricAuthenticationCoordinator.m" lineNumber:469 description:@"We should never be presenting the wallet interface when a pre-arm recognizer recognizes."];
    }
    if (self->_state != 2)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SBLockScreenBiometricAuthenticationCoordinator.m" lineNumber:470 description:@"We must be in the pre-arm state to receive this message"];
    }
    id v6 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Presenting wallet UI", buf, 2u);
    }

    self->_presentingWalletInterface = 1;
    [(NFWalletPresentation *)self->_walletPresentation present];
    [(SBLockScreenBiometricAuthenticationCoordinator *)self _invalidateWalletPreArmRecognizer];
  }
}

- (void)walletPrearmRecognizer:(id)a3 didFailToRecognizeForReason:(unint64_t)a4
{
  uint64_t v7 = (SBWalletPrearmRecognizer *)a3;
  if (!v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBLockScreenBiometricAuthenticationCoordinator.m", 483, @"Invalid parameter not satisfying: %@", @"recognizer" object file lineNumber description];

    uint64_t v7 = 0;
  }
  if (self->_walletPrearmRecognizer == v7)
  {
    id v13 = v7;
    if (self->_presentingWalletInterface)
    {
      int v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"SBLockScreenBiometricAuthenticationCoordinator.m" lineNumber:486 description:@"We should never be presenting the wallet interface when a pre-arm recognizer fails."];
    }
    if (self->_state != 2)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SBLockScreenBiometricAuthenticationCoordinator.m" lineNumber:487 description:@"We must be in the pre-arm state to receive this message"];
    }
    int v8 = NSStringFromWalletPrearmFailureRecognitionReason(a4);
    if (![(SBLockScreenBiometricAuthenticationCoordinator *)self isAutoUnlockingDisabled]
      && (self->_didMatchBeforeWalletPrearmRecognizerTimeout
       || [(SBUIBiometricResource *)self->_biometricResource isFingerOn]))
    {
      id v9 = [NSString stringWithFormat:@"Wallet pre-arm failed to recognize for reason %@ but we matched before it failed to recognize or the finger is still on the sensor", v8];
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _setState:3 forReason:v9];
    }
    else
    {
      id v9 = [NSString stringWithFormat:@"Wallet pre-arm failed to recognize for reason %@ - bioAutoUnlockingDisabledReasons: %@", v8, self->_disabledAutoUnlockAssertions];
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _resetStateForReason:v9];
    }

    [(SBLockScreenBiometricAuthenticationCoordinator *)self _invalidateWalletPreArmRecognizer];
    uint64_t v7 = v13;
  }
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsFeedback:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBLockScreenBiometricAuthenticationCoordinator.m", 507, @"Invalid parameter not satisfying: %@", @"behavior" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SBLockScreenBiometricAuthenticationCoordinator.m", 508, @"Invalid parameter not satisfying: %@", @"feedback" object file lineNumber description];

LABEL_3:
  uint64_t v10 = SBLogLockScreenBiometricCoordinator();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = [v7 succinctDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "Unlock behavior (%{public}@) requests feedback: %{public}@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v13 = [WeakRetained biometricAuthenticationCoordinator:self requestsAuthenticationFeedback:v9];

  uint64_t v14 = SBLogLockScreenBiometricCoordinator();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      id v16 = "Feedback request handled successfully.";
LABEL_10:
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, v16, buf, 2u);
    }
  }
  else if (v15)
  {
    *(_WORD *)buf = 0;
    id v16 = "Feedback request was dropped and unhandled.";
    goto LABEL_10;
  }

  return v13;
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsUnlock:(id)a4 withFeedback:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"SBLockScreenBiometricAuthenticationCoordinator.m", 529, @"Invalid parameter not satisfying: %@", @"behavior" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:a2, self, @"SBLockScreenBiometricAuthenticationCoordinator.m", 530, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

LABEL_3:
  if ([(SBLockScreenBiometricAuthenticationCoordinator *)self _isMatchingEffectivelyDisabled])
  {
    if (([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport] & 1) != 0
      || (+[SBPlatformController sharedInstance],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 isInternalInstall],
          v12,
          !v13))
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2 object:self file:@"SBLockScreenBiometricAuthenticationCoordinator.m" lineNumber:558 description:@"We shouldn't be getting unlock requests when matching is effectively disabled."];

LABEL_31:
      BOOL v33 = 0;
      goto LABEL_32;
    }
    uint64_t v14 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v50 = self;
      __int16 v51 = 2114;
      id v52 = v9;
      __int16 v53 = 2114;
      id v54 = v10;
      __int16 v55 = 2114;
      id v56 = v11;
      _os_log_error_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_ERROR, "We saw an unlock request when matching is effectively disabled, requesting diagnostics.\nself: %{public}@, behavior: %{public}@, request: %{public}@, feedback: %{public}@", buf, 0x2Au);
    }

    BOOL v15 = [(SBLockScreenBiometricAuthenticationCoordinator *)self acquireDisableUnlockAssertionForReason:@"Disagnostic reporting"];
    id v16 = objc_alloc_init(SBDiagnosticRequestAlertItem);
    unint64_t v17 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v18 = [v17 localizedStringForKey:@"RADAR_REQUEST_MESSAGE_BODY_HOME_BUTTON" value:&stru_1F3084718 table:@"SpringBoard"];
    [(SBDiagnosticRequestAlertItem *)v16 setMessage:v18];

    BOOL v19 = [MEMORY[0x1E4F28B50] mainBundle];
    id v20 = [v19 localizedStringForKey:@"RADAR_REQUEST_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
    [(SBDiagnosticRequestAlertItem *)v16 setTitle:v20];

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __102__SBLockScreenBiometricAuthenticationCoordinator_biometricUnlockBehavior_requestsUnlock_withFeedback___block_invoke;
    v45[3] = &unk_1E6AF4AC0;
    id v46 = v15;
    uint64_t v21 = v15;
    [(SBDiagnosticRequestAlertItem *)v16 setCompletionBlock:v45];
    __int16 v22 = +[SBLockScreenManager sharedInstance];
    v47 = @"SBUILockOptionsUseScreenOffModeKey";
    uint64_t v48 = MEMORY[0x1E4F1CC28];
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __102__SBLockScreenBiometricAuthenticationCoordinator_biometricUnlockBehavior_requestsUnlock_withFeedback___block_invoke_2;
    v43[3] = &unk_1E6AF5350;
    v44 = v16;
    uint64_t v24 = v16;
    [v22 lockUIFromSource:1 withOptions:v23 completion:v43];

LABEL_30:
    goto LABEL_31;
  }
  uint64_t v25 = [v10 intent];
  if ((v25 & 0xFFFFFFFE) == 2)
  {
    unint64_t state = self->_state;
    if (state == 2)
    {
      v27 = SBLogLockScreenBiometricCoordinator();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_super v28 = [v9 succinctDescription];
        *(_DWORD *)buf = 138543362;
        v50 = v28;
        _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_INFO, "Unlock behavior (%{public}@) requests unlock attempt but we can't handle it right now because we're matching for PreArm.", buf, 0xCu);
      }
      v29 = [[_SBPendingMesaUnlockBehaviorUnlockRequest alloc] initWithBehavior:v9 request:v10 feedback:v11];
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _pendUnlockRequest:v29];
    }
    else
    {
      if (state - 3 >= 2)
      {
        v42 = [MEMORY[0x1E4F28B00] currentHandler];
        [v42 handleFailureInMethod:a2 object:self file:@"SBLockScreenBiometricAuthenticationCoordinator.m" lineNumber:574 description:@"We must be in an state allowing unlocks to request an unlock."];
      }
      v34 = SBLogLockScreenBiometricCoordinator();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = [v9 succinctDescription];
        *(_DWORD *)buf = 138543618;
        v50 = v35;
        __int16 v51 = 2112;
        id v52 = v10;
        _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_INFO, "Unlock behavior (%{public}@) requests unlock attempt: %@", buf, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v37 = [WeakRetained biometricAuthenticationCoordinator:self requestsUnlockWithIntent:v25];

      uint64_t v21 = SBLogLockScreenBiometricCoordinator();
      BOOL v38 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
      if (!v37)
      {
        if (v38)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_INFO, "Unlock request failed.", buf, 2u);
        }
        goto LABEL_30;
      }
      if (v38)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_INFO, "Unlock request succeeded.", buf, 2u);
      }

      if (v11) {
        [(SBLockScreenBiometricAuthenticationCoordinator *)self biometricUnlockBehavior:v9 requestsFeedback:v11];
      }
    }
  }
  else
  {
    v31 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = [v9 succinctDescription];
      *(_DWORD *)buf = 138543618;
      v50 = v32;
      __int16 v51 = 1024;
      LODWORD(v52) = v25;
      _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_INFO, "Denied unlock request from behavior (%{public}@) because it specifies unhandled intent: %d", buf, 0x12u);
    }
  }
  BOOL v33 = 1;
LABEL_32:

  return v33;
}

uint64_t __102__SBLockScreenBiometricAuthenticationCoordinator_biometricUnlockBehavior_requestsUnlock_withFeedback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __102__SBLockScreenBiometricAuthenticationCoordinator_biometricUnlockBehavior_requestsUnlock_withFeedback___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [MEMORY[0x1E4FA7938] activateAlertItem:*(void *)(result + 32)];
  }
  return result;
}

- (id)acquireMatchingAssertionWithMode:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4FA7DD0]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __90__SBLockScreenBiometricAuthenticationCoordinator_acquireMatchingAssertionWithMode_reason___block_invoke;
  int v13 = &unk_1E6AF4FB8;
  objc_copyWeak(&v14, &location);
  id v8 = (void *)[v7 initWithMatchMode:a3 reason:v6 invalidationBlock:&v10];
  if (v8) {
    -[SBLockScreenBiometricAuthenticationCoordinator _addPasscodeMatchingAssertion:](self, "_addPasscodeMatchingAssertion:", v8, v10, v11, v12, v13);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __90__SBLockScreenBiometricAuthenticationCoordinator_acquireMatchingAssertionWithMode_reason___block_invoke(uint64_t a1, void *a2)
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
  [WeakRetained _removePasscodeMatchingAssertion:v6];
}

- (void)passLibraryReceivedInterruption
{
}

uint64_t __81__SBLockScreenBiometricAuthenticationCoordinator_passLibraryReceivedInterruption__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePassKitDismissalIfNecessaryWithReason:@"service-interruption"];
}

- (void)contactlessInterfaceDidDismissFromSource:(int64_t)a3
{
}

void __91__SBLockScreenBiometricAuthenticationCoordinator_contactlessInterfaceDidDismissFromSource___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"source: %d", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _handlePassKitDismissalIfNecessaryWithReason:v2];
}

- (void)_handleIdentityMatchSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  self->_matchedWithResult = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained biometricAuthenticationCoordinator:self handleIdentityMatchSuccess:v3];

  [(NSTimer *)self->_matchingAssertionInvalidationTimer fire];
  matchingAssertionInvalidationTimer = self->_matchingAssertionInvalidationTimer;
  self->_matchingAssertionInvalidationTimer = 0;
}

- (void)_updateMatchingForState:(unint64_t)a3 forReason:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v22 = 0;
  [(SBLockScreenBiometricAuthenticationCoordinator *)self _stateWantsMatching:self->_state outMatchMode:&v22];
  id v6 = SBLogLockScreenBiometricCoordinator();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSBUIBiometricMatchMode();
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v7;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Mesa matching mode changed to [%{public}@] for reason: %{public}@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v9 = [WeakRetained biometricAuthenticationCoordinatorShouldWaitToInvalidateMatchingAssertion:self];

  uint64_t v10 = v22;
  if (v22 != self->_matchingWantedAssertionMode || !self->_matchingWantedAssertion)
  {
    if (v22)
    {
      int v11 = 0;
    }
    else if (v9 && !self->_matchedWithResult)
    {
      uint64_t v10 = 0;
      int v11 = 1;
    }
    else
    {
      [(BSInvalidatable *)self->_matchingWantedAssertion invalidate];
      int v11 = 0;
      uint64_t v10 = v22;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__SBLockScreenBiometricAuthenticationCoordinator__updateMatchingForState_forReason___block_invoke;
    v21[3] = &unk_1E6AF4A70;
    v21[4] = self;
    void v21[5] = v10;
    uint64_t v12 = (void (**)(void))MEMORY[0x1D948C7A0](v21);
    if (self->_matchingAssertionInvalidationTimer)
    {
      int v13 = SBLogLockScreenBiometricCoordinator();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Clearing obsolete assertion invalidation timer", buf, 2u);
      }

      [(NSTimer *)self->_matchingAssertionInvalidationTimer invalidate];
      matchingAssertionInvalidationTimer = self->_matchingAssertionInvalidationTimer;
      self->_matchingAssertionInvalidationTimer = 0;
    }
    if (v11)
    {
      BOOL v15 = SBLogLockScreenBiometricCoordinator();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Creating assertion invalidation timer", buf, 2u);
      }

      id v16 = (void *)MEMORY[0x1E4F1CB00];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __84__SBLockScreenBiometricAuthenticationCoordinator__updateMatchingForState_forReason___block_invoke_214;
      v19[3] = &unk_1E6AF7330;
      v19[4] = self;
      id v20 = v12;
      unint64_t v17 = [v16 scheduledTimerWithTimeInterval:0 repeats:v19 block:1.5];
      uint64_t v18 = self->_matchingAssertionInvalidationTimer;
      self->_matchingAssertionInvalidationTimer = v17;
    }
    else
    {
      v12[2](v12);
    }
  }
}

void __84__SBLockScreenBiometricAuthenticationCoordinator__updateMatchingForState_forReason___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 8);
  id v10 = *(id *)(v2 + 96);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [v4 acquireMatchingAssertionWithMode:v3 reason:v6];
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(v8 + 96);
  *(void *)(v8 + 96) = v7;

  [v10 invalidate];
  *(void *)(*(void *)(a1 + 32) + 104) = *(void *)(a1 + 40);
}

uint64_t __84__SBLockScreenBiometricAuthenticationCoordinator__updateMatchingForState_forReason___block_invoke_214(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 120))
  {
    uint64_t v3 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = NSStringFromBOOL();
      int v7 = 138543362;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Matching assertion invalidation timer fired before matched with result: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained biometricAuthenticationCoordinator:*(void *)(a1 + 32) handleIdentityMatchSuccess:0];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 96) invalidate];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_stateChangedFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 - 3 < 2)
  {
    [(SBLockScreenBiometricAuthenticationCoordinator *)self _clearPendingUnlockRequest];
  }
  else if (a3)
  {
    if (a3 == 2)
    {
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _invalidateWalletPreArmRecognizer];
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _handlePassKitDismissalIfNecessaryWithReason:@"Cleanup making sure the UI is actually dismissed."];
    }
  }
  else
  {
    [(SBLockScreenBiometricAuthenticationCoordinator *)self _createFingerDetectAssertion];
  }
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _clearPendingUnlockRequest];
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _toggleAutoUnlockBehaviorEnabled:0];
      if (!a4)
      {
        [(SBLockScreenBiometricAuthenticationCoordinator *)self _clearFingerDetectAssertion];
      }
      break;
    case 2uLL:
      id v6 = self;
      uint64_t v7 = 1;
      goto LABEL_19;
    case 3uLL:
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _toggleAutoUnlockBehaviorEnabled:1];
      if (self->_pendingUnlockRequest)
      {
        uint64_t v8 = SBLogLockScreenBiometricCoordinator();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          pendingUnlockRequest = self->_pendingUnlockRequest;
          int v14 = 138412290;
          BOOL v15 = pendingUnlockRequest;
          _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Replaying pending unlock request because now we're available for match unlocks: %@", (uint8_t *)&v14, 0xCu);
        }

        id v10 = self->_pendingUnlockRequest;
        [(SBLockScreenBiometricAuthenticationCoordinator *)self _clearPendingUnlockRequest];
        int v11 = [(_SBPendingMesaUnlockBehaviorUnlockRequest *)v10 behavior];
        uint64_t v12 = [(_SBPendingMesaUnlockBehaviorUnlockRequest *)v10 request];
        int v13 = [(_SBPendingMesaUnlockBehaviorUnlockRequest *)v10 feedback];
        [(SBLockScreenBiometricAuthenticationCoordinator *)self biometricUnlockBehavior:v11 requestsUnlock:v12 withFeedback:v13];
      }
      break;
    case 4uLL:
      id v6 = self;
      uint64_t v7 = 0;
LABEL_19:
      [(SBLockScreenBiometricAuthenticationCoordinator *)v6 _toggleAutoUnlockBehaviorEnabled:v7];
      break;
    default:
      return;
  }
}

- (void)_setupPreArmRecognizerIfPossibleForReason:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_state & 0xFFFFFFFFFFFFFFFELL;
  if ([(SBLockScreenBiometricAuthenticationCoordinator *)self _isWalletPreArmAllowed]
    && v5 == 2)
  {
    id v6 = [NSString stringWithFormat:@"%@ - starting recognition for wallet pre-arm", v4];
    [(SBLockScreenBiometricAuthenticationCoordinator *)self _setState:2 forReason:v6];

    if (!self->_walletPrearmRecognizer && !self->_presentingWalletInterface)
    {
      uint64_t v7 = [[SBWalletPrearmRecognizer alloc] initWithDelegate:self];
      walletPrearmRecognizer = self->_walletPrearmRecognizer;
      self->_walletPrearmRecognizer = v7;

      [(SBWalletPrearmRecognizer *)self->_walletPrearmRecognizer startRecognizing];
    }
  }
  else
  {
    uint64_t v9 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _setupPreArmRecognizerIfPossibleForReason:v9];
    }
  }
}

- (void)_pendUnlockRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = (_SBPendingMesaUnlockBehaviorUnlockRequest *)a3;
  if (self->_state != 2)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBLockScreenBiometricAuthenticationCoordinator.m", 786, @"We only support pending while in a pre-arm state at this time (currentState: %d).", self->_state);
  }
  if (self->_pendingUnlockRequest != v6)
  {
    objc_storeStrong((id *)&self->_pendingUnlockRequest, a3);
    uint64_t v7 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int v13 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Pended unlock request: %@", buf, 0xCu);
    }

    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__SBLockScreenBiometricAuthenticationCoordinator__pendUnlockRequest___block_invoke;
    block[3] = &unk_1E6AF5290;
    block[4] = self;
    int v11 = v6;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__SBLockScreenBiometricAuthenticationCoordinator__pendUnlockRequest___block_invoke(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(result + 32) + 128) == *(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(*(void *)(v1 + 32) + 128);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Dropping pended unlock request because it expired: %@", (uint8_t *)&v4, 0xCu);
    }

    return [*(id *)(v1 + 32) _clearPendingUnlockRequest];
  }
  return result;
}

- (void)_toggleAutoUnlockBehaviorEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBBiometricUnlockBehavior *)self->_autoUnlockBehavior biometricUnlockBehaviorDelegate];
  uint64_t v6 = (void *)v5;
  int v7 = !v3;
  if (v3 && !v5)
  {
    dispatch_time_t v8 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Enabling auto unlock behavior based on current state.", buf, 2u);
    }

    autoUnlockBehavior = self->_autoUnlockBehavior;
    id v10 = self;
LABEL_12:
    [(SBBiometricUnlockBehavior *)autoUnlockBehavior setBiometricUnlockBehaviorDelegate:v10];
    goto LABEL_13;
  }
  if (!v5) {
    int v7 = 0;
  }
  if (v7 == 1)
  {
    int v11 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "Disabling auto unlock behavior based on current state.", v12, 2u);
    }

    autoUnlockBehavior = self->_autoUnlockBehavior;
    id v10 = 0;
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_clearPendingUnlockRequest
{
  pendingUnlockRequest = self->_pendingUnlockRequest;
  self->_pendingUnlockRequest = 0;
}

- (void)_invalidateWalletPreArmRecognizer
{
  self->_didMatchBeforeWalletPrearmRecognizerTimeout = 0;
  [(SBWalletPrearmRecognizer *)self->_walletPrearmRecognizer invalidate];
  walletPrearmRecognizer = self->_walletPrearmRecognizer;
  self->_walletPrearmRecognizer = 0;
}

- (BOOL)_stateWantsMatching:(unint64_t)a3 outMatchMode:(unint64_t *)a4
{
  switch(a3)
  {
    case 4uLL:
      if (self->_isAuthenticated)
      {
        unint64_t v7 = 0;
      }
      else
      {
        dispatch_time_t v8 = [(NSMutableOrderedSet *)self->_activePasscodeMatchAssertions lastObject];
        unint64_t v7 = [v8 matchMode];
      }
      goto LABEL_16;
    case 3uLL:
      if (self->_isAuthenticated) {
        unint64_t v7 = 0;
      }
      else {
        unint64_t v7 = 3;
      }
LABEL_16:
      LOBYTE(v6) = 1;
      break;
    case 2uLL:
      int v6 = [(SBUIBiometricResource *)self->_biometricResource hasEnrolledIdentities];
      if (v6)
      {
        LOBYTE(v6) = 1;
        if (self->_isAuthenticated) {
          unint64_t v7 = 2;
        }
        else {
          unint64_t v7 = 1;
        }
      }
      else
      {
        unint64_t v7 = 0;
      }
      break;
    default:
      unint64_t v7 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  if (a4) {
    *a4 = v7;
  }
  return v6;
}

- (BOOL)_isMatchingEffectivelyDisabled
{
  return ![(SBLockScreenBiometricAuthenticationCoordinator *)self _stateWantsMatching:self->_state outMatchMode:0];
}

- (BOOL)_hasActivePasscodeViews
{
  return [(NSMutableOrderedSet *)self->_activePasscodeMatchAssertions count] != 0;
}

- (void)_addPasscodeMatchingAssertion:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBLockScreenBiometricAuthenticationCoordinator.m", 875, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableOrderedSet *)self->_activePasscodeMatchAssertions addObject:v5];
  if (![(SBLockScreenBiometricAuthenticationCoordinator *)self isUnlockingDisabled])
  {
    int v6 = [NSString stringWithFormat:@"Passcode view is active and wants matching: %@", v8];
    [(SBLockScreenBiometricAuthenticationCoordinator *)self _resetStateForReason:v6];
  }
  [(SBLockScreenBiometricAuthenticationCoordinator *)self _updateMatchingForState:self->_state forReason:@"Passcode frontmost added."];
  [(SBUIBiometricResource *)self->_biometricResource resumeMatchingForAssertion:self->_matchingWantedAssertion advisory:0];
}

- (void)_removePasscodeMatchingAssertion:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBLockScreenBiometricAuthenticationCoordinator.m", 888, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableOrderedSet *)self->_activePasscodeMatchAssertions removeObject:v5];
  if (![(SBLockScreenBiometricAuthenticationCoordinator *)self _hasActivePasscodeViews]
    && self->_state == 4)
  {
    int v6 = [NSString stringWithFormat:@"last passcode view matching wanted assertion relinquished: %@", v9];
    [(SBLockScreenBiometricAuthenticationCoordinator *)self _resetStateForReason:v6];

    unint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"SBBiometricEventTimestampNotificationPasscodeCancelled" object:self];
  }
  [(SBLockScreenBiometricAuthenticationCoordinator *)self _updateMatchingForState:self->_state forReason:@"Passcode frontmost removed."];
}

- (BOOL)_isWalletPreArmAllowed
{
  BOOL v3 = [(SBWalletPreArmController *)self->_walletPreArmController isPreArmSuppressed];
  BOOL v4 = [(SBWalletPreArmController *)self->_walletPreArmController isPreArmTriggeredByHomeButtonDoublePress];
  return [(SBWalletPreArmController *)self->_walletPreArmController isPreArmAvailable] && v4 && !v3;
}

- (void)_handlePassKitDismissalIfNecessaryWithReason:(id)a3
{
  id v4 = a3;
  if (self->_presentingWalletInterface)
  {
    self->_presentingWalletInterface = 0;
    id v6 = v4;
    [(SBLockScreenBiometricAuthenticationCoordinator *)self _invalidateWalletPreArmRecognizer];
    id v4 = v6;
    if (self->_state == 2)
    {
      id v5 = [NSString stringWithFormat:@"wallet UI dismissed with reason: %@", v6];
      [(SBLockScreenBiometricAuthenticationCoordinator *)self _resetStateForReason:v5];
      [(SBUIBiometricResource *)self->_biometricResource refreshMatchMode];

      id v4 = v6;
    }
  }
}

- (void)_createFingerDetectAssertion
{
  if (!self->_fingerDetectEnabledAssertion)
  {
    BOOL v3 = [(SBUIBiometricResource *)self->_biometricResource acquireFingerDetectionWantedAssertionForReason:@"MesaCoordinatorEnabled"];
    fingerDetectEnabledAssertion = self->_fingerDetectEnabledAssertion;
    self->_fingerDetectEnabledAssertion = v3;
  }
}

- (void)_clearFingerDetectAssertion
{
  fingerDetectEnabledAssertion = self->_fingerDetectEnabledAssertion;
  if (fingerDetectEnabledAssertion)
  {
    [(BSInvalidatable *)fingerDetectEnabledAssertion invalidate];
    id v4 = self->_fingerDetectEnabledAssertion;
    self->_fingerDetectEnabledAssertion = 0;
  }
}

- (SBLockScreenBiometricAuthenticationCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLockScreenBiometricAuthenticationCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)bioAuthenticatedWhileMenuButtonDown
{
  return self->_bioAuthenticatedWhileMenuButtonDown;
}

- (void)setBioAuthenticatedWhileMenuButtonDown:(BOOL)a3
{
  self->_bioAuthenticatedWhileMenuButtonDown = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (SBBiometricUnlockBehavior)_setAutoUnlockBehavior
{
  return self->_autoUnlockBehavior;
}

- (void)_setAutoUnlockBehavior:(id)a3
{
}

- (SBWalletPrearmRecognizer)_walletPrearmRecognizer
{
  return self->_walletPrearmRecognizer;
}

- (unint64_t)_state
{
  return self->_state;
}

- (NFWalletPresentation)_getWalletPresentation
{
  return self->_walletPresentation;
}

- (void)_setWalletPresentation:(id)a3
{
}

- (PKPassLibrary)_getPassLibrary
{
  return self->_passLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledAutoUnlockAssertions, 0);
  objc_storeStrong((id *)&self->_disabledUnlockAssertions, 0);
  objc_storeStrong((id *)&self->_disabledAssertions, 0);
  objc_storeStrong((id *)&self->_activePasscodeMatchAssertions, 0);
  objc_storeStrong((id *)&self->_pendingUnlockRequest, 0);
  objc_storeStrong((id *)&self->_matchingAssertionInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_matchingWantedAssertion, 0);
  objc_storeStrong((id *)&self->_walletPresentation, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_walletPrearmRecognizer, 0);
  objc_storeStrong((id *)&self->_walletPreArmController, 0);
  objc_storeStrong((id *)&self->_autoUnlockBehavior, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fingerDetectEnabledAssertion, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
}

- (void)_resetStateForReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Ignoring reset request because state wouldn't change for reason: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_setupPreArmRecognizerIfPossibleForReason:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 67109376;
  v5[1] = [a1 _isWalletPreArmAllowed];
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "Not starting pre-arm recognizer because isWalletPreArmAllowed: %d, canTransitionToPreArm: %d", (uint8_t *)v5, 0xEu);
}

@end