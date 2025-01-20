@interface SBFUserAuthenticationController
- (BOOL)_BOOLForAuthenticationResult:(int64_t)a3;
- (BOOL)_authenticateIfInGracePeriod;
- (BOOL)_isAssertionValid:(id)a3;
- (BOOL)_isInBioUnlockState;
- (BOOL)_isInGracePeriodState;
- (BOOL)_isPermanentlyBlocked;
- (BOOL)_isTemporarilyBlocked;
- (BOOL)_isUserAuthenticated;
- (BOOL)_isUserRequestedEraseEnabled;
- (BOOL)_performNilPasscodeCheck;
- (BOOL)_processAuthenticationRequest:(id)a3 responder:(id)a4;
- (BOOL)_shouldRevokeAuthenticationNow;
- (BOOL)hasAuthenticatedAtLeastOnceSinceBoot;
- (BOOL)hasPasscodeSet;
- (BOOL)isAuthenticatedCached;
- (BOOL)isInSecureDisplayMode;
- (BOOL)supportsSecureDisplayMode;
- (NSDate)lastRevokedAuthenticationDate;
- (NSString)description;
- (SBFAuthenticationPolicy)_policy;
- (SBFUserAuthenticationController)initWithAssertionManager:(id)a3 policy:(id)a4;
- (SBFUserAuthenticationController)initWithAssertionManager:(id)a3 policy:(id)a4 keybag:(id)a5 model:(id)a6;
- (double)_timeUntilUnblockedSinceReferenceDate;
- (id)_cachedLockStateExtended;
- (id)authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:(BOOL)a3;
- (id)createGracePeriodAssertionWithReason:(id)a3;
- (id)createKeybagUnlockAssertionWithReason:(id)a3;
- (id)createSecureDisplayDeferralAssertionWithReason:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)publicDescription;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_evaluateAuthenticationAttempt:(id)a3 outError:(id *)a4;
- (int64_t)_evaluateBiometricAttempt:(id)a3;
- (int64_t)_evaluatePasscodeAttempt:(id)a3 outError:(id *)a4;
- (void)_addAsFirstResponder:(id)a3;
- (void)_addAuthenticationAssertion:(id)a3;
- (void)_addPrivateAuthenticationObserver:(id)a3;
- (void)_clearBlockedState;
- (void)_clearUnblockTimer;
- (void)_handleFailedAuthentication:(id)a3 error:(id)a4 responder:(id)a5;
- (void)_handleInvalidAuthentication:(id)a3 responder:(id)a4;
- (void)_handleSuccessfulAuthentication:(id)a3 responder:(id)a4;
- (void)_invalidateCachedPasscodeLockState;
- (void)_isUserAuthenticated;
- (void)_noteDeviceLockStateMayHaveChangedForExternalReasons;
- (void)_notifyAboutTemporaryBlockStatusChanged;
- (void)_notifyClientsOfAuthenticationResult:(int64_t)a3 forRequest:(id)a4 error:(id)a5 withResponder:(id)a6;
- (void)_refreshModelCacheIfNeeded;
- (void)_removeAuthResponder:(id)a3;
- (void)_removeAuthenticationAssertion:(id)a3;
- (void)_removePrivateAuthenticationObserver:(id)a3;
- (void)_revokeAuthenticationImmediately:(BOOL)a3 forPublicReason:(id)a4;
- (void)_scheduleUnblockTimer;
- (void)_setAuthState:(int64_t)a3;
- (void)_setModel:(id)a3;
- (void)_setPolicy:(id)a3;
- (void)_setupPolicy:(id)a3;
- (void)_setup_runLoopObserverIfNecessary;
- (void)_unblockTimerFired;
- (void)_uncachePasscodeIfNecessary;
- (void)_updateAuthenticationStateAndDateForLockState:(id)a3;
- (void)_updateAuthenticationStateForPublicReason:(id)a3;
- (void)_updateAuthenticationStateImmediately:(BOOL)a3 forPublicReason:(id)a4;
- (void)_updateSecureModeIfNecessaryForNewAuthState;
- (void)dealloc;
- (void)deviceLockModelRequestsDeviceWipe:(id)a3;
- (void)deviceLockStateMayHaveChangedForModel:(id)a3;
- (void)keybag:(id)a3 extendedStateDidChange:(id)a4;
- (void)keybagDidUnlockForTheFirstTime:(id)a3;
- (void)notePasscodeEntryBegan;
- (void)notePasscodeEntryCancelled;
- (void)processAuthenticationRequest:(id)a3;
- (void)revokeAuthenticationIfNecessaryForPublicReason:(id)a3;
- (void)revokeAuthenticationImmediatelyForPublicReason:(id)a3;
- (void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)a3;
@end

@implementation SBFUserAuthenticationController

- (BOOL)_isUserAuthenticated
{
  BSDispatchQueueAssertMain();
  if (_isUserAuthenticated___reentryGuard == 1)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBFUserAuthenticationController.m" lineNumber:453 description:@"auth state is being configured re-entrantly"];
  }
  _isUserAuthenticated___reentryGuard = 1;
  if (self->_cachedAuthFlag == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_authenticationState == 2)
    {
      if (self->_transientAuthCheckingAssertion)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2 object:self file:@"SBFUserAuthenticationController.m" lineNumber:469 description:@"transient auth assertion must be nil"];
      }
      v4 = [(SBFUserAuthenticationController *)self createGracePeriodAssertionWithReason:@"Checking if passcode locked"];
      transientAuthCheckingAssertion = self->_transientAuthCheckingAssertion;
      self->_transientAuthCheckingAssertion = v4;

      [(SBFAuthenticationAssertion *)self->_transientAuthCheckingAssertion activate];
      [(SBFAuthenticationAssertion *)self->_transientAuthCheckingAssertion isValid];
      self->_cachedAuthFlag = BSSettingFlagForBool();
    }
    else
    {
      v6 = [(SBFUserAuthenticationController *)self _cachedLockStateExtended];
      [v6 isEffectivelyLocked];
      self->_cachedAuthFlag = BSSettingFlagForBool();
    }
    int IsYes = BSSettingFlagIsYes();
    v8 = SBLogAuthenticationController();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (IsYes)
    {
      if (v9) {
        -[SBFUserAuthenticationController _isUserAuthenticated]();
      }
    }
    else if (v9)
    {
      -[SBFUserAuthenticationController _isUserAuthenticated]();
    }

    [(SBFUserAuthenticationController *)self _setup_runLoopObserverIfNecessary];
  }
  _isUserAuthenticated___reentryGuard = 0;
  return BSSettingFlagIsYes();
}

- (id)_cachedLockStateExtended
{
  if (!self->_cachedExtendedState)
  {
    v3 = [(SBFMobileKeyBag *)self->_keybag extendedState];
    cachedExtendedState = self->_cachedExtendedState;
    self->_cachedExtendedState = v3;
  }
  [(SBFUserAuthenticationController *)self _setup_runLoopObserverIfNecessary];
  v5 = self->_cachedExtendedState;
  return v5;
}

- (void)_setup_runLoopObserverIfNecessary
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "Starting runloop cache period.", v2, v3, v4, v5, v6);
}

- (BOOL)_isTemporarilyBlocked
{
  [(SBFUserAuthenticationController *)self _refreshModelCacheIfNeeded];
  model = self->_model;
  return [(SBFUserAuthenticationModel *)model isTemporarilyBlocked];
}

- (void)_refreshModelCacheIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_unblockTimer
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([(SBFUserAuthenticationModel *)self->_model isTemporarilyBlocked] & 1) == 0)
  {
    [(SBFUserAuthenticationModel *)self->_model refreshBlockedState];
    [(SBFUserAuthenticationController *)self _scheduleUnblockTimer];
    uint64_t v3 = SBLogAuthenticationController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = MEMORY[0x18C131F20]([(SBFUserAuthenticationModel *)self->_model isTemporarilyBlocked]);
      [(SBFUserAuthenticationModel *)self->_model timeUntilUnblockedSinceReferenceDate];
      uint64_t v6 = v5;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 138543874;
      v10 = v4;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_INFO, "Refreshed model cache due to unfired unblock timer while nominally unblocked. isTemporarilyBlocked = %{public}@ timeUntilUnblockedSinceReferenceDate = %f timeIntervalSinceReferenceDate = %f", buf, 0x20u);
    }
    if (!self->_unblockTimer)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__SBFUserAuthenticationController__refreshModelCacheIfNeeded__block_invoke;
      block[3] = &unk_1E548CA88;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (BOOL)_isPermanentlyBlocked
{
  return [(SBFUserAuthenticationModel *)self->_model isPermanentlyBlocked];
}

- (BOOL)supportsSecureDisplayMode
{
  return 1;
}

- (BOOL)isInSecureDisplayMode
{
  return [(SBFSecureDisplayCoordinator *)self->_secureDisplayCoordinator inSecureMode];
}

- (BOOL)isAuthenticatedCached
{
  return self->_authenticationState != 0;
}

void __68__SBFUserAuthenticationController__setup_runLoopObserverIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = SBLogAuthenticationController();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __68__SBFUserAuthenticationController__setup_runLoopObserverIfNecessary__block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) _invalidateCachedPasscodeLockState];
  Main = CFRunLoopGetMain();
  CFRunLoopRemoveObserver(Main, *(CFRunLoopObserverRef *)(*(void *)(a1 + 32) + 88), (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 88));
  *(void *)(*(void *)(a1 + 32) + 88) = 0;
}

- (void)_invalidateCachedPasscodeLockState
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "Invalidating runloop cached authentication state.", v2, v3, v4, v5, v6);
}

- (SBFUserAuthenticationController)initWithAssertionManager:(id)a3 policy:(id)a4
{
  return [(SBFUserAuthenticationController *)self initWithAssertionManager:a3 policy:a4 keybag:0 model:0];
}

- (SBFUserAuthenticationController)initWithAssertionManager:(id)a3 policy:(id)a4 keybag:(id)a5 model:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (SBFUserAuthenticationModelSEP *)a6;
  v38.receiver = self;
  v38.super_class = (Class)SBFUserAuthenticationController;
  uint64_t v15 = [(SBFUserAuthenticationController *)&v38 init];
  if (!v15) {
    goto LABEL_22;
  }
  if (v13)
  {
    v16 = (SBFMobileKeyBag *)v13;
  }
  else
  {
    v16 = +[SBFMobileKeyBag sharedInstance];
  }
  keybag = v15->_keybag;
  v15->_keybag = v16;

  [(SBFMobileKeyBag *)v15->_keybag addObserver:v15];
  if (!v14)
  {
    if (MGGetBoolAnswer()) {
      v18 = [[SBFUserAuthenticationModelSEP alloc] initWithKeyBag:v15->_keybag];
    }
    else {
      v18 = objc_alloc_init(SBFUserAuthenticationModelJournaledDefaults);
    }
    uint64_t v14 = v18;
  }
  [(SBFUserAuthenticationController *)v15 _setModel:v14];
  objc_storeStrong((id *)&v15->_assertionManager, a3);
  objc_storeStrong((id *)&v15->_policy, a4);
  if ([(SBFAuthenticationPolicy *)v15->_policy usesSecureMode])
  {
    v19 = objc_alloc_init(SBFSecureDisplayCoordinator);
    secureDisplayCoordinator = v15->_secureDisplayCoordinator;
    v15->_secureDisplayCoordinator = v19;
  }
  v21 = [(SBFMobileKeyBag *)v15->_keybag state];
  uint64_t v22 = [v21 lockState];
  v15->_cachedAuthFlag = 0x7FFFFFFFFFFFFFFFLL;
  v15->_authenticationState = 1;
  if ([(SBFMobileKeyBag *)v15->_keybag hasPasscodeSet])
  {
    if (v22 == 2)
    {
      uint64_t v23 = 0;
    }
    else
    {
      if (v22 != 1)
      {
LABEL_18:
        uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
        lastRevokedAuthenticationDate = v15->_lastRevokedAuthenticationDate;
        v15->_lastRevokedAuthenticationDate = (NSDate *)v24;

        goto LABEL_19;
      }
      uint64_t v23 = 2;
    }
    v15->_authenticationState = v23;
    goto LABEL_18;
  }
LABEL_19:
  [(SBFUserAuthenticationController *)v15 _setupPolicy:v12];
  [(SBFUserAuthenticationController *)v15 _scheduleUnblockTimer];
  objc_initWeak(&location, v15);
  v26 = (void *)MEMORY[0x1E4F4F6E8];
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  v34 = __80__SBFUserAuthenticationController_initWithAssertionManager_policy_keybag_model___block_invoke;
  v35 = &unk_1E548D0C8;
  objc_copyWeak(&v36, &location);
  uint64_t v27 = [v26 assertionWithIdentifier:@"secureDisplayDeferral" stateDidChangeHandler:&v32];
  secureDisplayDeferralAssertions = v15->_secureDisplayDeferralAssertions;
  v15->_secureDisplayDeferralAssertions = (BSCompoundAssertion *)v27;

  v29 = SBLogAuthenticationController();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = [(SBFUserAuthenticationController *)v15 publicDescription];
    *(_DWORD *)buf = 138543362;
    v40 = v30;
    _os_log_impl(&dword_18B52E000, v29, OS_LOG_TYPE_DEFAULT, "UserAuthenticationController initialized: %{public}@", buf, 0xCu);
  }
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

LABEL_22:
  return v15;
}

void __80__SBFUserAuthenticationController_initWithAssertionManager_policy_keybag_model___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSecureModeIfNecessaryForNewAuthState];
}

- (void)dealloc
{
  [(SBFMobileKeyBag *)self->_keybag removeObserver:self];
  [(SBFUserAuthenticationModel *)self->_model synchronize];
  [(SBFUserAuthenticationController *)self _clearUnblockTimer];
  v3.receiver = self;
  v3.super_class = (Class)SBFUserAuthenticationController;
  [(SBFUserAuthenticationController *)&v3 dealloc];
}

- (void)processAuthenticationRequest:(id)a3
{
  responders = self->_responders;
  id v5 = a3;
  id v6 = [(NSMutableArray *)responders firstObject];
  [(SBFUserAuthenticationController *)self _processAuthenticationRequest:v5 responder:v6];
}

- (id)createKeybagUnlockAssertionWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [[SBFAuthenticationAssertion alloc] initWithIdentifier:v4 type:1 withController:self];

  return v5;
}

- (id)createGracePeriodAssertionWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [[SBFAuthenticationAssertion alloc] initWithIdentifier:v4 type:2 withController:self];

  return v5;
}

- (id)createSecureDisplayDeferralAssertionWithReason:(id)a3
{
  return (id)[(BSCompoundAssertion *)self->_secureDisplayDeferralAssertions acquireForReason:a3];
}

- (id)authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:(BOOL)a3
{
  if (a3) {
    objc_super v3 = [[_SBFContinuityUnlockAuthenticationStatusProvider alloc] initWithMobileKeyBag:self->_keybag underlyingProvider:self];
  }
  else {
    objc_super v3 = self;
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)[(SBFUserAuthenticationController *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)hasPasscodeSet
{
  return [(SBFMobileKeyBag *)self->_keybag hasPasscodeSet];
}

- (BOOL)hasAuthenticatedAtLeastOnceSinceBoot
{
  return [(SBFMobileKeyBag *)self->_keybag hasBeenUnlockedSinceBoot];
}

- (void)revokeAuthenticationImmediatelyForPublicReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogAuthenticationController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_INFO, "Revoke authentication immediately requested for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(SBFUserAuthenticationController *)self _revokeAuthenticationImmediately:1 forPublicReason:v4];
}

- (void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogAuthenticationController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_INFO, "Revoke authentication immediately if necessary requested for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(SBFUserAuthenticationController *)self _updateAuthenticationStateImmediately:1 forPublicReason:v4];
}

- (void)revokeAuthenticationIfNecessaryForPublicReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogAuthenticationController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_INFO, "Revoke authentication requested for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(SBFUserAuthenticationController *)self _updateAuthenticationStateImmediately:0 forPublicReason:v4];
}

- (void)notePasscodeEntryBegan
{
}

- (void)notePasscodeEntryCancelled
{
}

- (void)deviceLockStateMayHaveChangedForModel:(id)a3
{
  [(SBFUserAuthenticationController *)self _notifyAboutTemporaryBlockStatusChanged];
  [(SBFUserAuthenticationController *)self _scheduleUnblockTimer];
}

- (void)deviceLockModelRequestsDeviceWipe:(id)a3
{
}

- (id)publicDescription
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = v3;
  unint64_t authenticationState = self->_authenticationState;
  if (authenticationState > 2) {
    int v6 = 0;
  }
  else {
    int v6 = off_1E548D150[authenticationState];
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"authState"];
  id v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFUserAuthenticationController hasPasscodeSet](self, "hasPasscodeSet"), @"hasPasscodeSet");
  if ([(SBFUserAuthenticationController *)self _isTemporarilyBlocked]) {
    id v9 = (id)[v4 appendBool:1 withName:@"temporarilyBlocked"];
  }
  if ([(SBFUserAuthenticationController *)self _isPermanentlyBlocked]) {
    id v10 = (id)[v4 appendBool:1 withName:@"permanentlyBlocked"];
  }
  if ([(SBFUserAuthenticationController *)self _isUserRequestedEraseEnabled]) {
    id v11 = (id)[v4 appendBool:1 withName:@"userRequestedEraseEnabled"];
  }
  if (self->_lastRevokedAuthenticationDate)
  {
    id v12 = [MEMORY[0x1E4F4F708] sharedInstance];
    id v13 = [v12 formatDateAsLongYMDHMSZWithDate:self->_lastRevokedAuthenticationDate];
    id v14 = (id)[v4 appendObject:v13 withName:@"revokedAuthDate"];
  }
  uint64_t v15 = [MEMORY[0x1E4F4F718] builderWithObject:self->_model];
  v16 = [v15 build];
  id v17 = (id)[v4 appendObject:v16 withName:@"model"];

  v18 = [v4 build];

  return v18;
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBFUserAuthenticationController *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = v3;
  unint64_t authenticationState = self->_authenticationState;
  if (authenticationState > 2) {
    int v6 = 0;
  }
  else {
    int v6 = off_1E548D150[authenticationState];
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"authState"];
  id v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFUserAuthenticationController hasPasscodeSet](self, "hasPasscodeSet"), @"passcodeSet");
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBFUserAuthenticationController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFUserAuthenticationController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBFUserAuthenticationController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E548CBA0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __73__SBFUserAuthenticationController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 16) withName:@"responders" skipIfEmpty:0];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v2 + 48))
  {
    objc_super v3 = *(void **)(a1 + 32);
    id v4 = [MEMORY[0x1E4F4F708] sharedInstance];
    id v5 = [v4 formatDateAsLongYMDHMSZWithDate:*(void *)(*(void *)(a1 + 40) + 48)];
    id v6 = (id)[v3 appendObject:v5 withName:@"revokedAuthDate"];

    uint64_t v2 = *(void *)(a1 + 40);
  }
  id v7 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v2 + 56) withName:@"assertManager"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 128) withName:@"secureDisplayDeferralAssertions"];
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
}

void __66__SBFUserAuthenticationController_keybagDidUnlockForTheFirstTime___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SBFUserAuthenticatedForFirstTimeNotification" object:0 userInfo:0];
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  BSDispatchMain();
}

void __65__SBFUserAuthenticationController_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) extendedState];
  [v1 _updateAuthenticationStateAndDateForLockState:v2];
}

- (void)_setModel:(id)a3
{
  id v5 = (SBFUserAuthenticationModel *)a3;
  p_model = &self->_model;
  if (self->_model != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_model, a3);
    p_model = (SBFUserAuthenticationModel **)[(SBFUserAuthenticationModel *)self->_model setDelegate:self];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_model, v5);
}

- (void)_setupPolicy:(id)a3
{
  id v4 = a3;
  id v5 = self->_policy;
  if ([(SBFAuthenticationPolicy *)v5 shouldClearBlockStateOnSync])
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_initWeak(&location, self);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __48__SBFUserAuthenticationController__setupPolicy___block_invoke;
    id v11 = &unk_1E548CE50;
    objc_copyWeak(&v12, &location);
    id v7 = (id)[v6 addObserverForName:@"kSBSyncSessionBegan" object:0 queue:0 usingBlock:&v8];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__uncachePasscodeIfNecessary, @"SBSetupBuddyCompletedNotification", 0, v8, v9, v10, v11);
    }
    if (objc_msgSend(v4, "usesSecureMode", v8, v9, v10, v11)
      && ![(SBFUserAuthenticationController *)self isAuthenticatedCached])
    {
      [(SBFSecureDisplayCoordinator *)self->_secureDisplayCoordinator setSecureMode:1 postNotification:0];
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __48__SBFUserAuthenticationController__setupPolicy___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearBlockedState];
}

- (void)_uncachePasscodeIfNecessary
{
  id v2 = self->_policy;
  if (objc_opt_respondsToSelector()) {
    [(SBFAuthenticationPolicy *)v2 clearPasscodeCache];
  }
}

- (void)_addAuthenticationAssertion:(id)a3
{
  assertionManager = self->_assertionManager;
  id v5 = a3;
  [(SBFAuthenticationAssertionManager *)assertionManager addAssertion:v5];
  uint64_t v6 = [v5 type];

  if (v6 == 1 && self->_authenticationState != 1)
  {
    [(SBFUserAuthenticationController *)self _authenticateIfInGracePeriod];
    [(SBFUserAuthenticationController *)self _updateAuthenticationStateForPublicReason:@"add authentication assertion for preventLock while locked"];
  }
}

- (void)_removeAuthenticationAssertion:(id)a3
{
  id v6 = a3;
  -[SBFAuthenticationAssertionManager removeAssertion:](self->_assertionManager, "removeAssertion:");
  if (![(SBFAuthenticationAssertionManager *)self->_assertionManager hasActiveAssertions])
  {
    id v4 = SBLogAuthenticationController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [NSString stringWithFormat:@"remove authentication assertion: %@", v6];
      [(SBFUserAuthenticationController *)self _updateAuthenticationStateForPublicReason:v5];
    }
    else
    {
      [(SBFUserAuthenticationController *)self _updateAuthenticationStateForPublicReason:@"remove authentication assertion"];
    }
  }
}

- (BOOL)_isAssertionValid:(id)a3
{
  return [(SBFAuthenticationAssertionManager *)self->_assertionManager isAssertionValid:a3];
}

- (void)_addPrivateAuthenticationObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    observers = self->_observers;
    id v9 = v5;
    if (!observers)
    {
      id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    id v4 = (id)[(NSHashTable *)observers addObject:v9];
    id v5 = v9;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_removePrivateAuthenticationObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (BOOL)_isInBioUnlockState
{
  id v2 = [(SBFUserAuthenticationController *)self _cachedLockStateExtended];
  BOOL v3 = [v2 lockState] == 7;

  return v3;
}

- (BOOL)_isInGracePeriodState
{
  id v2 = [(SBFUserAuthenticationController *)self _cachedLockStateExtended];
  BOOL v3 = [v2 lockState] == 5;

  return v3;
}

- (void)_setAuthState:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  int64_t authenticationState = self->_authenticationState;
  if (authenticationState != a3)
  {
    id v6 = SBLogAuthenticationController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 2) {
        id v7 = 0;
      }
      else {
        id v7 = off_1E548D150[a3];
      }
      *(_DWORD *)buf = 138543362;
      v18 = v7;
      _os_log_impl(&dword_18B52E000, v6, OS_LOG_TYPE_DEFAULT, "State changed to %{public}@", buf, 0xCu);
    }

    self->_int64_t authenticationState = a3;
    [(SBFUserAuthenticationController *)self _invalidateCachedPasscodeLockState];
    [(SBFUserAuthenticationController *)self _notifyAboutTemporaryBlockStatusChanged];
    [(SBFUserAuthenticationController *)self _updateSecureModeIfNecessaryForNewAuthState];
    if ((unint64_t)a3 >= 2)
    {
      if (a3 == 2)
      {
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        lastRevokedAuthenticationDate = self->_lastRevokedAuthenticationDate;
        self->_lastRevokedAuthenticationDate = v13;
      }
    }
    else
    {
      uint64_t v8 = SBLogAuthenticationController();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[SBFUserAuthenticationController _setAuthState:]();
      }

      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v10 = objc_msgSend(NSNumber, "numberWithInt:", authenticationState != 0, @"SBFUserAuthenticationStateWasAuthenticatedKey");
      v16 = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      [v9 postNotificationName:@"SBFUserAuthenticationStateDidChangeNotification" object:0 userInfo:v11];

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.DeviceLockStatusChanged", 0, 0, 0);
    }
  }
}

- (void)_updateAuthenticationStateAndDateForLockState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 lockState];
  uint64_t v6 = [v4 isEffectivelyLocked];
  if (v6)
  {
    uint64_t v7 = 0;
LABEL_6:
    [(SBFUserAuthenticationController *)self _setAuthState:v7];
    goto LABEL_7;
  }
  if (v5 <= 7 && ((1 << v5) & 0x89) != 0)
  {
    uint64_t v7 = 1;
    goto LABEL_6;
  }
LABEL_7:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = self->_observers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "extendedKeybagLockStateChanged:", v6, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  if (objc_opt_respondsToSelector()) {
    [(SBFUserAuthenticationModel *)self->_model noteNewMkbDeviceLockState:v4];
  }
}

- (void)_updateAuthenticationStateForPublicReason:(id)a3
{
}

- (void)_updateAuthenticationStateImmediately:(BOOL)a3 forPublicReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![(SBFUserAuthenticationController *)self hasPasscodeSet])
  {
    uint64_t v7 = [MEMORY[0x1E4F74230] sharedConnection];
    [v7 recomputeUserComplianceWarning];
  }
  if ([(SBFUserAuthenticationController *)self hasPasscodeSet]
    && ![(SBFAuthenticationAssertionManager *)self->_assertionManager hasActiveAssertions]
    && [(SBFUserAuthenticationController *)self _shouldRevokeAuthenticationNow]
    && (-[SBFUserAuthenticationController authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:](self, "authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:", v4), v8 = objc_claimAutoreleasedReturnValue(), int v9 = [v8 isAuthenticated], v8, v9))
  {
    uint64_t v10 = SBLogAuthenticationController();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = &stru_1ED879EF8;
      if (v4) {
        uint64_t v11 = @"immediately";
      }
      int v13 = 138412546;
      long long v14 = v11;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_18B52E000, v10, OS_LOG_TYPE_DEFAULT, "Update authentication state - needs authentication revoked; revoking %@ for reason: %{public}@",
        (uint8_t *)&v13,
        0x16u);
    }

    [(SBFUserAuthenticationController *)self _revokeAuthenticationImmediately:v4 forPublicReason:v6];
  }
  else
  {
    uint64_t v12 = SBLogAuthenticationController();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SBFUserAuthenticationController _updateAuthenticationStateImmediately:forPublicReason:]();
    }
  }
}

- (BOOL)_shouldRevokeAuthenticationNow
{
  int v2 = [(SBFAuthenticationPolicy *)self->_policy allowAuthenticationRevocation];
  if (v2)
  {
    BOOL v3 = SBLogAuthenticationController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_INFO, "Authentication policy wants authentication revoked.", v5, 2u);
    }
  }
  return v2;
}

- (void)_revokeAuthenticationImmediately:(BOOL)a3 forPublicReason:(id)a4
{
  BOOL v5 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([(SBFUserAuthenticationController *)self hasPasscodeSet])
  {
    uint64_t v8 = [(SBFUserAuthenticationController *)self authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:v5];
    int v9 = [v8 isAuthenticated];

    if (v9)
    {
      uint64_t v10 = SBLogAuthenticationController();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = &stru_1ED879EF8;
        if (v5) {
          uint64_t v12 = @"immediately";
        }
        else {
          uint64_t v12 = &stru_1ED879EF8;
        }
        int v13 = SBLogAuthenticationController();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v14)
        {
          __int16 v15 = NSString;
          BOOL v4 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v11 = [v15 stringWithFormat:@", caller: %@", v4];
        }
        *(_DWORD *)buf = 138543874;
        v21 = v12;
        __int16 v22 = 2114;
        id v23 = v7;
        __int16 v24 = 2114;
        v25 = v11;
        _os_log_impl(&dword_18B52E000, v10, OS_LOG_TYPE_DEFAULT, "Revoking authentication%{public}@ - reason: %{public}@ %{public}@", buf, 0x20u);
        if (v14)
        {
        }
      }

      int64_t authenticationState = self->_authenticationState;
      [(SBFMobileKeyBag *)self->_keybag lockSkippingGracePeriod:v5];
      [(SBFUserAuthenticationController *)self _invalidateCachedPasscodeLockState];
      if (authenticationState)
      {
        [(SBFUserAuthenticationController *)self _setAuthState:2];
      }
      else
      {
        uint64_t v17 = SBLogAuthenticationController();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[SBFUserAuthenticationController _revokeAuthenticationImmediately:forPublicReason:]();
        }
      }
      v18 = [MEMORY[0x1E4F1C9C8] date];
      lastRevokedAuthenticationDate = self->_lastRevokedAuthenticationDate;
      self->_lastRevokedAuthenticationDate = v18;
    }
  }
}

- (void)_addAsFirstResponder:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_responders)
    {
      [(SBFUserAuthenticationController *)self _removeAuthResponder:v4];
      [(NSMutableArray *)self->_responders insertObject:v4 atIndex:0];
    }
    else
    {
      BOOL v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
      responders = self->_responders;
      self->_responders = v5;
    }
    id v7 = SBLogAuthenticationRequests();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SBFUserAuthenticationController _addAsFirstResponder:]((uint64_t)self);
    }
  }
}

- (void)_removeAuthResponder:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = SBLogAuthenticationRequests();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBFUserAuthenticationController _removeAuthResponder:]((uint64_t)self);
    }

    [(NSMutableArray *)self->_responders removeObject:v4];
  }
}

- (BOOL)_processAuthenticationRequest:(id)a3 responder:(id)a4
{
  id v11 = 0;
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(SBFUserAuthenticationController *)self _evaluateAuthenticationAttempt:v7 outError:&v11];
  id v9 = v11;
  [(SBFUserAuthenticationController *)self _notifyClientsOfAuthenticationResult:v8 forRequest:v7 error:v9 withResponder:v6];

  LOBYTE(v7) = [(SBFUserAuthenticationController *)self _BOOLForAuthenticationResult:v8];
  return (char)v7;
}

- (void)_notifyClientsOfAuthenticationResult:(int64_t)a3 forRequest:(id)a4 error:(id)a5 withResponder:(id)a6
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((unint64_t)(a3 - 1) > 2) {
    int v13 = 0;
  }
  else {
    int v13 = off_1E548D168[a3 - 1];
  }
  BOOL v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v20[0] = @"SBFUserAuthenticationRequestCompletedAuthenticationTypeKey";
  __int16 v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "type"));
  v20[1] = @"SBFUserAuthenticationRequestCompletedResultKey";
  v21[0] = v15;
  v21[1] = v13;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v14 postNotificationName:@"SBFUserAuthenticationRequestCompletedNotification" object:self userInfo:v16];

  if (v12 || ([v10 handler], uint64_t v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    switch(a3)
    {
      case 1:
        [(SBFUserAuthenticationController *)self _handleFailedAuthentication:v10 error:v11 responder:v12];
        break;
      case 3:
        [(SBFUserAuthenticationController *)self _handleInvalidAuthentication:v10 responder:v12];
        break;
      case 2:
        [(SBFUserAuthenticationController *)self _handleSuccessfulAuthentication:v10 responder:v12];
        break;
    }
    v18 = [v10 handler];

    if (v18)
    {
      uint64_t v19 = [v10 handler];
      ((void (**)(void, BOOL))v19)[2](v19, [(SBFUserAuthenticationController *)self _BOOLForAuthenticationResult:a3]);
    }
  }
}

- (void)_handleSuccessfulAuthentication:(id)a3 responder:(id)a4
{
  id v6 = a3;
  model = self->_model;
  id v8 = a4;
  [(SBFUserAuthenticationModel *)model notePasscodeUnlockSucceeded];
  [(SBFUserAuthenticationController *)self _scheduleUnblockTimer];
  if ([v6 type] == 1 && !objc_msgSend(v6, "source"))
  {
    id v9 = self->_policy;
    if (objc_opt_respondsToSelector())
    {
      id v10 = [v6 passcode];
      [(SBFAuthenticationPolicy *)v9 cachePasscode:v10];
    }
  }
  [(SBFUserAuthenticationController *)self _setAuthState:1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SBFUserAuthenticationController__handleSuccessfulAuthentication_responder___block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  [v8 handleSuccessfulAuthenticationRequest:v6];
}

uint64_t __77__SBFUserAuthenticationController__handleSuccessfulAuthentication_responder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAuthenticationStateImmediately:0 forPublicReason:@"authentication successful from authentication request"];
}

- (void)_handleFailedAuthentication:(id)a3 error:(id)a4 responder:(id)a5
{
  id v11 = a4;
  model = self->_model;
  id v9 = a5;
  id v10 = a3;
  [(SBFUserAuthenticationModel *)model notePasscodeUnlockFailedWithError:v11];
  if (objc_opt_respondsToSelector()) {
    [(SBFAuthenticationPolicy *)self->_policy passcodeAuthenticationFailedWithError:v11];
  }
  [(SBFUserAuthenticationController *)self _scheduleUnblockTimer];
  [v9 handleFailedAuthenticationRequest:v10 error:v11];
}

- (void)_handleInvalidAuthentication:(id)a3 responder:(id)a4
{
}

- (BOOL)_BOOLForAuthenticationResult:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)_performNilPasscodeCheck
{
  BOOL v3 = [[SBFMobileKeyBagUnlockOptions alloc] initWithPasscode:0];
  LOBYTE(self) = [(SBFMobileKeyBag *)self->_keybag unlockWithOptions:v3 error:0];

  return (char)self;
}

- (BOOL)_authenticateIfInGracePeriod
{
  int64_t authenticationState = self->_authenticationState;
  if (authenticationState != 2) {
    return authenticationState == 1;
  }
  if ([(SBFUserAuthenticationController *)self _isInGracePeriodState]
    && [(SBFUserAuthenticationController *)self _performNilPasscodeCheck])
  {
    BOOL v6 = 1;
    [(SBFUserAuthenticationController *)self _setAuthState:1];
    BOOL result = 1;
    if (self->_authenticationState == 1) {
      return result;
    }
    goto LABEL_6;
  }
  BOOL v6 = 0;
  BOOL result = 0;
  if (self->_authenticationState == 1)
  {
LABEL_6:
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBFUserAuthenticationController.m" lineNumber:793 description:@"-[SBFUserAuthenticationController _authenticateIfInGracePeriod]'s return value is different from its internal authentication state."];

    return v6;
  }
  return result;
}

- (int64_t)_evaluateAuthenticationAttempt:(id)a3 outError:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 type];
  if (v7 == 2)
  {
    int64_t v8 = [(SBFUserAuthenticationController *)self _evaluateBiometricAttempt:v6];
    goto LABEL_5;
  }
  if (v7 == 1)
  {
    int64_t v8 = [(SBFUserAuthenticationController *)self _evaluatePasscodeAttempt:v6 outError:a4];
LABEL_5:
    int64_t v9 = v8;
    goto LABEL_7;
  }
  int64_t v9 = 3;
LABEL_7:
  id v10 = SBLogAuthenticationRequests();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = MEMORY[0x18C131F20](v9 != 0);
    id v12 = [v6 publicDescription];
    int v14 = 138543618;
    __int16 v15 = v11;
    __int16 v16 = 2114;
    uint64_t v17 = v12;
    _os_log_impl(&dword_18B52E000, v10, OS_LOG_TYPE_DEFAULT, "Processed authentication request (success=%{public}@): %{public}@", (uint8_t *)&v14, 0x16u);
  }
  return v9;
}

- (int64_t)_evaluatePasscodeAttempt:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 source];
  BOOL v8 = v7 == 0;
  int64_t v9 = [v6 passcode];
  id v10 = v9;
  if (v9 && [v9 length])
  {
    BOOL v11 = [(SBFUserAuthenticationController *)self hasPasscodeSet];
    BOOL v12 = v11;
    if (v7) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v11;
    }
    if (v13) {
      ADClientAddValueForScalarKey();
    }
    BOOL v22 = v13;
    BOOL v14 = [(SBFUserAuthenticationController *)self _isPermanentlyBlocked]
       || [(SBFUserAuthenticationController *)self _isTemporarilyBlocked];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__1;
    id v36 = __Block_byref_object_dispose__1;
    id v37 = 0;
    model = self->_model;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__SBFUserAuthenticationController__evaluatePasscodeAttempt_outError___block_invoke;
    v23[3] = &unk_1E548D118;
    BOOL v29 = v8;
    v23[4] = self;
    id v17 = v10;
    id v24 = v17;
    uint64_t v26 = &v38;
    BOOL v30 = v14;
    id v25 = v6;
    uint64_t v27 = &v42;
    v28 = &v32;
    BOOL v31 = v12;
    [(SBFUserAuthenticationModel *)model performPasswordTest:v23];
    if (*((unsigned char *)v39 + 24))
    {
      int64_t v15 = 3;
LABEL_27:

      _Block_object_dispose(&v32, 8);
      _Block_object_dispose(&v38, 8);
      _Block_object_dispose(&v42, 8);
      goto LABEL_28;
    }
    if (*((unsigned char *)v43 + 24))
    {
      lastIncorrectPasscodeAttempt = self->_lastIncorrectPasscodeAttempt;
      self->_lastIncorrectPasscodeAttempt = 0;
    }
    else
    {
      if (v22) {
        ADClientAddValueForScalarKey();
      }
      uint64_t v19 = (void *)v33[5];
      if (v19 && [v19 code] == -14) {
        goto LABEL_22;
      }
      v20 = (NSString *)[v17 copy];
      lastIncorrectPasscodeAttempt = self->_lastIncorrectPasscodeAttempt;
      self->_lastIncorrectPasscodeAttempt = v20;
    }

LABEL_22:
    if (a4) {
      *a4 = (id) v33[5];
    }
    if (*((unsigned char *)v43 + 24)) {
      int64_t v15 = 2;
    }
    else {
      int64_t v15 = 1;
    }
    goto LABEL_27;
  }
  int64_t v15 = 1;
LABEL_28:

  return v15;
}

void __69__SBFUserAuthenticationController__evaluatePasscodeAttempt_outError___block_invoke(uint64_t a1, unsigned char *a2)
{
  if ((!*(unsigned char *)(a1 + 80)
     || !*(void *)(*(void *)(a1 + 32) + 72)
     || !objc_msgSend(*(id *)(a1 + 40), "isEqualToString:"))
    && !*(unsigned char *)(a1 + 81))
  {
    id v4 = [SBFMobileKeyBagUnlockOptions alloc];
    BOOL v5 = [*(id *)(a1 + 40) dataUsingEncoding:4];
    id v6 = -[SBFMobileKeyBagUnlockOptions initWithPasscode:skipSEKeepUserDataOperation:](v4, "initWithPasscode:skipSEKeepUserDataOperation:", v5, [*(id *)(a1 + 48) skipSEKeepUserDataOperation]);

    if ([*(id *)(a1 + 48) verifyOnly])
    {
      if (*(unsigned char *)(a1 + 82))
      {
        uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
        uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
        id v10 = *(void **)(v8 + 40);
        int64_t v9 = (void **)(v8 + 40);
        uint64_t v19 = v10;
        char v11 = [v7 verifyWithOptions:v6 error:&v19];
        BOOL v12 = v19;
LABEL_11:
        id v16 = v12;
        id v17 = *v9;
        *int64_t v9 = v16;

LABEL_13:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;

        goto LABEL_14;
      }
    }
    else if (*(unsigned char *)(a1 + 82))
    {
      BOOL v13 = *(void **)(*(void *)(a1 + 32) + 8);
      uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
      int64_t v15 = *(void **)(v14 + 40);
      int64_t v9 = (void **)(v14 + 40);
      uint64_t v18 = v15;
      char v11 = [v13 unlockWithOptions:v6 error:&v18];
      BOOL v12 = v18;
      goto LABEL_11;
    }
    char v11 = 1;
    goto LABEL_13;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_14:
  *a2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

- (int64_t)_evaluateBiometricAttempt:(id)a3
{
  if ([(SBFUserAuthenticationController *)self _isInBioUnlockState])
  {
    if ([(SBFUserAuthenticationController *)self _performNilPasscodeCheck])
    {
      lastIncorrectPasscodeAttempt = self->_lastIncorrectPasscodeAttempt;
      self->_lastIncorrectPasscodeAttempt = 0;

      [(SBFUserAuthenticationController *)self _invalidateCachedPasscodeLockState];
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else if ([(SBFUserAuthenticationController *)self isAuthenticated])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

uint64_t __61__SBFUserAuthenticationController__refreshModelCacheIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyAboutTemporaryBlockStatusChanged];
}

- (void)_notifyAboutTemporaryBlockStatusChanged
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v2 = self->_observers;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "temporaryBlockStatusChanged", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)_isUserRequestedEraseEnabled
{
  [(SBFUserAuthenticationController *)self _refreshModelCacheIfNeeded];
  if (![(SBFUserAuthenticationModel *)self->_model isUserRequestedEraseEnabled])return 0; {
  uint64_t v9 = 0;
  }
  long long v10 = &v9;
  uint64_t v11 = 0x2050000000;
  uint64_t v3 = (void *)getAAUIDeviceLocatorServiceClass_softClass;
  uint64_t v12 = getAAUIDeviceLocatorServiceClass_softClass;
  if (!getAAUIDeviceLocatorServiceClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getAAUIDeviceLocatorServiceClass_block_invoke;
    v8[3] = &unk_1E548C938;
    v8[4] = &v9;
    __getAAUIDeviceLocatorServiceClass_block_invoke((uint64_t)v8);
    uint64_t v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  uint64_t v5 = [v4 sharedInstance];
  char v6 = [v5 isEnabled];

  return v6;
}

- (double)_timeUntilUnblockedSinceReferenceDate
{
  [(SBFUserAuthenticationController *)self _refreshModelCacheIfNeeded];
  model = self->_model;
  [(SBFUserAuthenticationModel *)model timeUntilUnblockedSinceReferenceDate];
  return result;
}

- (void)_scheduleUnblockTimer
{
  [(SBFUserAuthenticationController *)self _clearUnblockTimer];
  if ([(SBFUserAuthenticationModel *)self->_model isTemporarilyBlocked])
  {
    uint64_t v3 = SBLogAuthenticationController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v10 = 0;
      _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_DEFAULT, "Starting temporary blocked timer", v10, 2u);
    }

    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [(SBFUserAuthenticationModel *)self->_model timeUntilUnblockedSinceReferenceDate];
    uint64_t v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    char v6 = (PCPersistentTimer *)[objc_alloc(MEMORY[0x1E4F89D38]) initWithFireDate:v5 serviceIdentifier:@"SBUnblockTimer" target:self selector:sel__unblockTimerFired userInfo:0];
    unblockTimer = self->_unblockTimer;
    self->_unblockTimer = v6;

    [(PCPersistentTimer *)self->_unblockTimer setMinimumEarlyFireProportion:1.0];
    long long v8 = self->_unblockTimer;
    uint64_t v9 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(PCPersistentTimer *)v8 scheduleInRunLoop:v9];
  }
}

- (void)_clearUnblockTimer
{
  if (self->_unblockTimer)
  {
    uint64_t v3 = SBLogAuthenticationController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_DEFAULT, "Cleared temporary blocked timer", v5, 2u);
    }

    [(PCPersistentTimer *)self->_unblockTimer invalidate];
    unblockTimer = self->_unblockTimer;
    self->_unblockTimer = 0;
  }
}

- (void)_unblockTimerFired
{
  uint64_t v3 = SBLogAuthenticationController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_DEFAULT, "Temporary blocked timer fired", v4, 2u);
  }

  if (objc_opt_respondsToSelector()) {
    [(SBFUserAuthenticationModel *)self->_model refreshBlockedState];
  }
  if ([(SBFUserAuthenticationModel *)self->_model isTemporarilyBlocked]) {
    [(SBFUserAuthenticationController *)self _scheduleUnblockTimer];
  }
  else {
    [(SBFUserAuthenticationController *)self _notifyAboutTemporaryBlockStatusChanged];
  }
}

- (void)_clearBlockedState
{
  if (objc_opt_respondsToSelector())
  {
    [(SBFUserAuthenticationModel *)self->_model clearBlockedState];
    [(SBFUserAuthenticationController *)self _scheduleUnblockTimer];
  }
}

- (void)_noteDeviceLockStateMayHaveChangedForExternalReasons
{
  [(SBFUserAuthenticationModel *)self->_model refreshBlockedState];
  [(SBFUserAuthenticationController *)self _notifyAboutTemporaryBlockStatusChanged];
  [(SBFUserAuthenticationController *)self _scheduleUnblockTimer];
}

- (void)_updateSecureModeIfNecessaryForNewAuthState
{
  if ([(SBFAuthenticationPolicy *)self->_policy usesSecureMode])
  {
    int64_t authenticationState = self->_authenticationState;
    if (authenticationState != 2)
    {
      unsigned int v4 = [(BSCompoundAssertion *)self->_secureDisplayDeferralAssertions isActive] ^ 1;
      if (authenticationState) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = v4;
      }
      secureDisplayCoordinator = self->_secureDisplayCoordinator;
      [(SBFSecureDisplayCoordinator *)secureDisplayCoordinator setSecureMode:v5 postNotification:1];
    }
  }
}

- (NSDate)lastRevokedAuthenticationDate
{
  return self->_lastRevokedAuthenticationDate;
}

- (SBFAuthenticationPolicy)_policy
{
  return self->_policy;
}

- (void)_setPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureDisplayDeferralAssertions, 0);
  objc_storeStrong((id *)&self->_cachedExtendedState, 0);
  objc_storeStrong((id *)&self->_secureDisplayCoordinator, 0);
  objc_storeStrong((id *)&self->_unblockTimer, 0);
  objc_storeStrong((id *)&self->_transientAuthCheckingAssertion, 0);
  objc_storeStrong((id *)&self->_lastIncorrectPasscodeAttempt, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_lastRevokedAuthenticationDate, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_responders, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
}

- (void)_isUserAuthenticated
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "Runloop cached passcode state determined - not authenticated / revoked", v2, v3, v4, v5, v6);
}

void __68__SBFUserAuthenticationController__setup_runLoopObserverIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "Ending runloop cache period.", v2, v3, v4, v5, v6);
}

- (void)_setAuthState:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "Posting com.apple.springboard.DeviceLockStatusChanged", v2, v3, v4, v5, v6);
}

- (void)_updateAuthenticationStateImmediately:forPublicReason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "Update authentication state - no change necessary.", v2, v3, v4, v5, v6);
}

- (void)_revokeAuthenticationImmediately:forPublicReason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18B52E000, v0, OS_LOG_TYPE_ERROR, "Revoking authentication but not updating our state because we are already revoked", v1, 2u);
}

- (void)_addAsFirstResponder:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
  uint64_t v2 = [v1 build];
  OUTLINED_FUNCTION_2_0(&dword_18B52E000, v3, v4, "Authentication responder added: %@", v5, v6, v7, v8, 2u);
}

- (void)_removeAuthResponder:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
  uint64_t v2 = [v1 build];
  OUTLINED_FUNCTION_2_0(&dword_18B52E000, v3, v4, "Authentication responder removed: %@", v5, v6, v7, v8, 2u);
}

@end