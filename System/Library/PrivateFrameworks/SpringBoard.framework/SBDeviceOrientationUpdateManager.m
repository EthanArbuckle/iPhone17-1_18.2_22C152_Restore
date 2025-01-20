@interface SBDeviceOrientationUpdateManager
- (BOOL)_deviceOrientationUpdateNeededForOrientation:(int64_t)a3;
- (BOOL)isCurrentlyDeferringOrientationUpdates;
- (SBDeviceOrientationUpdateManager)init;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)deviceOrientationUpdateDeferralAssertionWithReason:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)lastUpdatedDeviceOrientation;
- (void)_endDeferringOrientationUpdatesForAssertion:(id)a3;
- (void)_enqueueOrientationUpdateToDeviceOrientation:(int64_t)a3;
- (void)_legacy_enqueueOrientationUpdateToDeviceOrientation:(int64_t)a3 source:(id)a4;
- (void)dealloc;
- (void)setLastUpdatedDeviceOrientation:(int64_t)a3;
@end

@implementation SBDeviceOrientationUpdateManager

- (BOOL)isCurrentlyDeferringOrientationUpdates
{
  return [(NSHashTable *)self->_deferralAssertions count] != 0;
}

- (id)deviceOrientationUpdateDeferralAssertionWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = BKLogOrientationGlobal();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Deferring device orientation updates for reason: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  v6 = [[SBDeviceOrientationUpdateDeferralAssertion alloc] initWithReason:v4];
  [(SBDeviceOrientationUpdateDeferralAssertion *)v6 _setHackyBackReference:self];
  [(NSHashTable *)self->_deferralAssertions addObject:v6];
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRolePipelineManager"))
  {
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"SBDeviceOrientationUpdateManager-DeferralAssertionAcquired" object:0];
  }
  return v6;
}

- (void)_endDeferringOrientationUpdatesForAssertion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 reason];
  v6 = BKLogOrientationGlobal();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Resuming device orientation updates for reason: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  int64_t lastUpdatedDeviceOrientation = self->_lastUpdatedDeviceOrientation;
  BOOL v8 = [(NSHashTable *)self->_deferralAssertions containsObject:v4];
  [(NSHashTable *)self->_deferralAssertions removeObject:v4];

  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRolePipelineManager"))
  {
    if (v8 && ![(NSHashTable *)self->_deferralAssertions count])
    {
      int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"SBDeviceOrientationUpdateManager-HasNoActiveDeferralAssertions" object:0];
    }
  }
  else if (v8 {
         && [(SBDeviceOrientationUpdateManager *)self _deviceOrientationUpdateNeededForOrientation:lastUpdatedDeviceOrientation])
  }
  {
    id v10 = BKLogOrientationDevice();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = BSDeviceOrientationDescription();
      int v12 = 138543618;
      v13 = v5;
      __int16 v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "%{public}@ was the last reason, schdeuling update to: %{public}@.", (uint8_t *)&v12, 0x16u);
    }
    [(SBDeviceOrientationUpdateManager *)self _enqueueOrientationUpdateToDeviceOrientation:lastUpdatedDeviceOrientation];
  }
}

- (SBDeviceOrientationUpdateManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)SBDeviceOrientationUpdateManager;
  v2 = [(SBDeviceOrientationUpdateManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    deferralAssertions = v2->_deferralAssertions;
    v2->_deferralAssertions = (NSHashTable *)v3;

    objc_initWeak(&location, v2);
    id v5 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v9, &location);
    uint64_t v6 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (BSInvalidatable *)v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __40__SBDeviceOrientationUpdateManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureHandle invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceOrientationUpdateManager;
  [(SBDeviceOrientationUpdateManager *)&v3 dealloc];
}

- (void)setLastUpdatedDeviceOrientation:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_lastUpdatedDeviceOrientation != a3)
  {
    self->_int64_t lastUpdatedDeviceOrientation = a3;
    self->_deviceOrientationIsDirty = 1;
    if (-[SBDeviceOrientationUpdateManager _deviceOrientationUpdateNeededForOrientation:](self, "_deviceOrientationUpdateNeededForOrientation:"))
    {
      [(SBDeviceOrientationUpdateManager *)self _enqueueOrientationUpdateToDeviceOrientation:a3];
    }
    else
    {
      id v5 = BKLogOrientationDevice();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = BSDeviceOrientationDescription();
        deferralAssertions = self->_deferralAssertions;
        int v11 = 138543618;
        int v12 = v6;
        __int16 v13 = 2114;
        __int16 v14 = deferralAssertions;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Deferring device orientation update to %{public}@ because: %{public}@.", (uint8_t *)&v11, 0x16u);
      }
      BOOL v8 = BKLogOrientationDevice();
      if (os_signpost_enabled(v8))
      {
        id v9 = BSDeviceOrientationDescription();
        id v10 = self->_deferralAssertions;
        int v11 = 138543618;
        int v12 = v9;
        __int16 v13 = 2114;
        __int16 v14 = v10;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ROTATION_DEVICE_ORIENTATION_UPDATE_DEFERRED", "Deferring device orientation update to %{public}@ because: %{public}@.", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (BOOL)_deviceOrientationUpdateNeededForOrientation:(int64_t)a3
{
  id v5 = +[SBOrientationLockManager sharedInstance];
  if ([v5 isUserLocked])
  {
    uint64_t v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v7 = [v6 orientation];

    uint64_t v8 = [v5 userLockOrientation];
    BOOL v9 = v7 != v8 && v8 == a3;
  }
  else
  {
    if (!self->_deviceOrientationIsDirty)
    {
      BOOL v10 = 0;
      goto LABEL_11;
    }
    BOOL v9 = [(NSHashTable *)self->_deferralAssertions count] == 0;
  }
  BOOL v10 = v9;
LABEL_11:

  return v10;
}

- (void)_enqueueOrientationUpdateToDeviceOrientation:(int64_t)a3
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRolePipelineManager") & 1) == 0)
  {
    id v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(SBDeviceOrientationUpdateManager *)self _legacy_enqueueOrientationUpdateToDeviceOrientation:a3 source:v6];
  }
}

- (void)_legacy_enqueueOrientationUpdateToDeviceOrientation:(int64_t)a3 source:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = ++_legacy_enqueueOrientationUpdateToDeviceOrientation_source____deviceOrientationChangeCount;
  id v7 = a4;
  uint64_t v8 = BKLogOrientationDevice();
  if (os_signpost_enabled(v8))
  {
    BOOL v9 = BSDeviceOrientationDescription();
    *(_DWORD *)buf = 134218242;
    uint64_t v18 = v6;
    __int16 v19 = 2114;
    v20 = v9;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ROTATION_DEVICE_ORIENTATION_UPDATE_ENQUEUE", "change #%ld, deviceOrientation: %{public}@", buf, 0x16u);
  }
  BOOL v10 = [MEMORY[0x1E4F624E0] sharedInstance];
  int v11 = (void *)MEMORY[0x1E4F624D8];
  int v12 = NSString;
  __int16 v13 = BSDeviceOrientationDescription();
  __int16 v14 = [v12 stringWithFormat:@"Device Orientation Changed via %@ to %@", v7, v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__SBDeviceOrientationUpdateManager__legacy_enqueueOrientationUpdateToDeviceOrientation_source___block_invoke;
  v16[3] = &unk_1E6AF4AE8;
  v16[5] = a3;
  v16[6] = v6;
  v16[4] = self;
  uint64_t v15 = [v11 eventWithName:v14 handler:v16];
  [v10 executeOrAppendEvent:v15];
}

void __95__SBDeviceOrientationUpdateManager__legacy_enqueueOrientationUpdateToDeviceOrientation_source___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRolePipelineManager"))
  {
LABEL_5:
    uint64_t v3 = a1[6];
    uint64_t v4 = _legacy_enqueueOrientationUpdateToDeviceOrientation_source____deviceOrientationChangeCount;
    id v5 = BKLogOrientationDevice();
    uint64_t v6 = v5;
    if (v3 == v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v7 = [MEMORY[0x1E4F42948] currentDevice];
        [v7 orientation];
        uint64_t v8 = BSDeviceOrientationDescription();
        BOOL v9 = BSDeviceOrientationDescription();
        int v20 = 138543618;
        uint64_t v21 = v8;
        __int16 v22 = 2114;
        v23 = v9;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Setting device orientation for backboardd from: %{public}@ to: %{public}@", (uint8_t *)&v20, 0x16u);
      }
      BOOL v10 = [MEMORY[0x1E4F42948] currentDevice];
      objc_msgSend(v10, "setOrientation:animated:", a1[5], objc_msgSend((id)SBApp, "isSuspended") ^ 1);

      *(unsigned char *)(a1[4] + 16) = 0;
      v2 = BKLogOrientationDevice();
      if (os_signpost_enabled(v2))
      {
        int v11 = (void *)a1[6];
        int v12 = BSDeviceOrientationDescription();
        int v20 = 134218242;
        uint64_t v21 = v11;
        __int16 v22 = 2114;
        v23 = v12;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ROTATION_DEVICE_ORIENTATION_UPDATE_EXECUTE", "change #%ld, deviceOrientation: %{public}@", (uint8_t *)&v20, 0x16u);
      }
    }
    else
    {
      if (os_signpost_enabled(v5))
      {
        __int16 v13 = (void *)a1[6];
        int v20 = 134217984;
        uint64_t v21 = v13;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ROTATION_DEVICE_ORIENTATION_UPDATE_VETO", "changeCount #%ld", (uint8_t *)&v20, 0xCu);
      }

      v2 = BKLogOrientationDevice();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Vetoing device change because another orientation event came in later and hasn't run yet.", (uint8_t *)&v20, 2u);
      }
    }
    goto LABEL_19;
  }
  v2 = +[SBOrientationLockManager sharedInstance];
  if (![v2 isEffectivelyLocked]
    || [v2 effectiveLockedOrientation] == a1[5])
  {

    goto LABEL_5;
  }
  __int16 v14 = BKLogOrientationDevice();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = BSDeviceOrientationDescription();
    [v2 effectiveLockedOrientation];
    uint64_t v16 = BSDeviceOrientationDescription();
    int v20 = 138543618;
    uint64_t v21 = v15;
    __int16 v22 = 2114;
    v23 = v16;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Ignoring device orientation to: %{public}@ because we're device orientation locked to: %{public}@.", (uint8_t *)&v20, 0x16u);
  }
  v17 = BKLogOrientationDevice();
  if (os_signpost_enabled(v17))
  {
    uint64_t v18 = (void *)a1[6];
    __int16 v19 = BSDeviceOrientationDescription();
    int v20 = 134218242;
    uint64_t v21 = v18;
    __int16 v22 = 2114;
    v23 = v19;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ROTATION_DEVICE_ORIENTATION_UPDATE_IGNORE", "change #%ld, deviceOrientation: %{public}@", (uint8_t *)&v20, 0x16u);
  }
LABEL_19:
}

- (id)description
{
  return [(SBDeviceOrientationUpdateManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBDeviceOrientationUpdateManager *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBDeviceOrientationUpdateManager isCurrentlyDeferringOrientationUpdates](self, "isCurrentlyDeferringOrientationUpdates"), @"isDeferring", 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBDeviceOrientationUpdateManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBDeviceOrientationUpdateManager *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__SBDeviceOrientationUpdateManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  int v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __74__SBDeviceOrientationUpdateManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"deviceOrientationIsDirty" ifEqualTo:1];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = BSDeviceOrientationDescription();
  id v5 = (id)[v3 appendObject:v4 withName:@"lastUpdatedDeviceOrientation"];

  id v6 = *(void **)(a1 + 32);
  id v8 = [*(id *)(*(void *)(a1 + 40) + 8) allObjects];
  id v7 = [*(id *)(a1 + 32) activeMultilinePrefix];
  [v6 appendArraySection:v8 withName:@"active deferral assertions" multilinePrefix:v7 skipIfEmpty:1];
}

- (int64_t)lastUpdatedDeviceOrientation
{
  return self->_lastUpdatedDeviceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_deferralAssertions, 0);
}

@end