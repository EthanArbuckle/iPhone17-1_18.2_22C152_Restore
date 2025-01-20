@interface SSKMirroredDisplayController
- (void)_ensureCADisplayModeForMirroring;
- (void)_updateDisplayAssertion;
- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayTransformUpdater:(id)a5 caDisplayQueue:(id)a6 assertion:(id)a7;
- (void)displayAssertionDidGainControlOfDisplay:(id)a3;
- (void)displayAssertionDidLoseControlOfDisplay:(id)a3;
- (void)displayIdentityDidDisconnect:(id)a3;
- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SSKMirroredDisplayController

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayTransformUpdater:(id)a5 caDisplayQueue:(id)a6 assertion:(id)a7
{
  v11 = (FBSDisplayIdentity *)a3;
  v12 = (FBSDisplayConfiguration *)a4;
  v13 = (OS_dispatch_queue *)a6;
  v14 = (SSKDisplayAssertion *)a7;
  displayIdentity = self->_displayIdentity;
  self->_displayIdentity = v11;
  v23 = v11;

  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v12;
  v17 = v12;

  v18 = [(FBSDisplayConfiguration *)self->_currentConfiguration CADisplay];
  caDisplay = self->_caDisplay;
  self->_caDisplay = v18;

  displayAssertion = self->_displayAssertion;
  self->_displayAssertion = v14;
  v21 = v14;

  displayMutationQueue = self->_displayMutationQueue;
  self->_displayMutationQueue = v13;
}

- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  currentConfiguration = self->_currentConfiguration;
  p_currentConfiguration = &self->_currentConfiguration;
  id v9 = v6;
  if ((-[FBSDisplayConfiguration isEqual:](currentConfiguration, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_currentConfiguration, a4);
  }
}

- (void)displayIdentityDidDisconnect:(id)a3
{
}

- (void)displayAssertionDidGainControlOfDisplay:(id)a3
{
  if ((objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3) & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[SSKMirroredDisplayController displayAssertionDidGainControlOfDisplay:]"];
    [v5 handleFailureInFunction:v6 file:@"SSKMirroredDisplayController.m" lineNumber:68 description:@"this call must be made on the main thread"];
  }
  [(CADisplay *)self->_caDisplay addObserver:self forKeyPath:@"preferences" options:0 context:self];
  [(SSKMirroredDisplayController *)self _ensureCADisplayModeForMirroring];
  v4 = (void *)MEMORY[0x263F158F8];
  [v4 generateSeed];
}

- (void)displayAssertionDidLoseControlOfDisplay:(id)a3
{
  if ((objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3) & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[SSKMirroredDisplayController displayAssertionDidLoseControlOfDisplay:]"];
    [v5 handleFailureInFunction:v6 file:@"SSKMirroredDisplayController.m" lineNumber:79 description:@"this call must be made on the main thread"];
  }
  [(CADisplay *)self->_caDisplay removeObserver:self forKeyPath:@"preferences" context:self];
  lostControlOfDisplaySignal = self->_lostControlOfDisplaySignal;
  [(BSAtomicSignal *)lostControlOfDisplaySignal signal];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__SSKMirroredDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v6[3] = &unk_2654B1848;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __79__SSKMirroredDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = SSKLogDisplayControlling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = _SSKDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 32));
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_25C444000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did detect CADisplay prefs change", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) hasControlOfDisplay];
  if (result) {
    return [*(id *)(a1 + 32) _ensureCADisplayModeForMirroring];
  }
  return result;
}

- (void)_ensureCADisplayModeForMirroring
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    v30 = [NSString stringWithUTF8String:"-[SSKMirroredDisplayController _ensureCADisplayModeForMirroring]"];
    [v29 handleFailureInFunction:v30 file:@"SSKMirroredDisplayController.m" lineNumber:100 description:@"this call must be made on the main thread"];
  }
  caDisplay = self->_caDisplay;
  id v5 = objc_alloc_init(MEMORY[0x263F15790]);
  id v6 = [(CADisplay *)caDisplay preferredModeWithCriteria:v5];

  uint64_t v7 = FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  if (!self->_requestedMode)
  {
    v8 = [(CADisplay *)self->_caDisplay currentMode];
    requestedMode = self->_requestedMode;
    self->_requestedMode = v8;
  }
  if (!self->_requestedOverscanAdjustment)
  {
    v10 = [(CADisplay *)self->_caDisplay overscanAdjustment];
    requestedOverscanAdjustment = self->_requestedOverscanAdjustment;
    self->_requestedOverscanAdjustment = v10;
  }
  if (BSSizeEqualToSize())
  {
    [(CADisplay *)self->_caDisplay logicalScale];
    self->_requestedLogicalScale.width = v12;
    self->_requestedLogicalScale.height = v13;
  }
  uint64_t v14 = SSKCADifferenceMaskCalculate(self->_caDisplay, v6, v7, 1);
  if (SSKCADisplayDifferenceMaskHasDifference(v14))
  {
    v15 = SSKLogDisplayControlling();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = _SSKDisplayControllerLoggingProem(self->_displayIdentity, self);
      v17 = SSKCADisplayDifferenceMaskDescription(v14);
      *(_DWORD *)buf = 138543618;
      v41 = v16;
      __int16 v42 = 2114;
      v43 = v17;
      _os_log_impl(&dword_25C444000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ we're in control of the display but our CADisplay needs updating: %{public}@", buf, 0x16u);
    }
    objc_storeStrong((id *)&self->_requestedMode, v6);
    v18 = (NSString *)[v7 copy];
    v19 = self->_requestedOverscanAdjustment;
    self->_requestedOverscanAdjustment = v18;

    __asm { FMOV            V0.2D, #1.0 }
    CGSize v31 = _Q0;
    self->_requestedLogicalScale = _Q0;
    v25 = self->_lostControlOfDisplaySignal;
    displayMutationQueue = self->_displayMutationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke;
    block[3] = &unk_2654B1898;
    v33 = v25;
    id v34 = v6;
    id v35 = v7;
    v36 = self;
    CGSize v37 = v31;
    uint64_t v38 = 1;
    SEL v39 = a2;
    v27 = v25;
    dispatch_async(displayMutationQueue, block);

LABEL_16:
    goto LABEL_17;
  }
  if (v14 == -1)
  {
    v27 = SSKLogDisplayControlling();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = _SSKDisplayControllerLoggingProem(self->_displayIdentity, self);
      *(_DWORD *)buf = 138543874;
      v41 = v28;
      __int16 v42 = 2114;
      v43 = v6;
      __int16 v44 = 2114;
      v45 = v7;
      _os_log_error_impl(&dword_25C444000, v27, OS_LOG_TYPE_ERROR, "%{public}@ we're in control of the display but we can't tell if our CADisplay is up to date. is one of these nil? preferredMode:%{public}@; preferredOverscan:%{public}@",
        buf,
        0x20u);
    }
    goto LABEL_16;
  }
LABEL_17:
}

void __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasBeenSignalled] & 1) == 0)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F15798]);
    [v2 setCurrentMode:*(void *)(a1 + 40)];
    [v2 setOverscanAdjustment:*(void *)(a1 + 48)];
    v3 = [*(id *)(*(void *)(a1 + 56) + 16) identity];
    objc_msgSend(v2, "setConnectionSeed:", objc_msgSend(v3, "connectionSeed"));

    objc_msgSend(v2, "setLogicalScale:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    [v2 setPointScale:*(void *)(a1 + 80)];
    char v4 = [*(id *)(*(void *)(a1 + 56) + 48) setDisplayProperties:v2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2;
    block[3] = &unk_2654B1870;
    char v10 = v4;
    uint64_t v5 = *(void *)(a1 + 88);
    void block[4] = *(void *)(a1 + 56);
    uint64_t v9 = v5;
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = SSKLogDisplayControlling();
  char v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = _SSKDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 32));
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v9 = 138543874;
      char v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_25C444000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ display change successful : mode=%{public}@ overscan=%{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2_cold_1(a1, v4);
  }

  return [*(id *)(a1 + 32) _updateDisplayAssertion];
}

- (void)_updateDisplayAssertion
{
  v3 = objc_alloc_init(SSKDisplayAssertionPreferences);
  [(SSKDisplayAssertionPreferences *)v3 setWantsControlOfDisplay:1];
  [(SSKDisplayAssertionPreferences *)v3 setCloneMirroringMode:1];
  [(SSKDisplayAssertion *)self->_displayAssertion updateWithPreferences:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedOverscanAdjustment, 0);
  objc_storeStrong((id *)&self->_requestedMode, 0);
  objc_storeStrong((id *)&self->_caDisplay, 0);
  objc_storeStrong((id *)&self->_displayMutationQueue, 0);
  objc_storeStrong((id *)&self->_lostControlOfDisplaySignal, 0);
  objc_storeStrong((id *)&self->_displayAssertion, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

void __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = _SSKDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 32));
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_25C444000, a2, OS_LOG_TYPE_ERROR, "%{public}@ display change failed: is the connection seed out of date?", (uint8_t *)&v4, 0xCu);
}

@end