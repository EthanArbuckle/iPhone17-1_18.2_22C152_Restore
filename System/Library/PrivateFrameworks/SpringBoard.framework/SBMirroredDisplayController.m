@interface SBMirroredDisplayController
- (NSString)description;
- (SBMirroredDisplayController)initWithExternalDisplayDefaults:(id)a3;
- (void)_ensureCADisplayModeForMirroring;
- (void)_updateDisplayAssertion;
- (void)_updateIdleSleepReason:(id)a3;
- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayManager:(id)a5 sceneManager:(id)a6 caDisplayQueue:(id)a7 assertion:(id)a8;
- (void)dealloc;
- (void)displayAssertion:(id)a3 didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a4;
- (void)displayAssertionDidGainControlOfDisplay:(id)a3;
- (void)displayIdentityDidDisconnect:(id)a3;
- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SBMirroredDisplayController

- (SBMirroredDisplayController)initWithExternalDisplayDefaults:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBMirroredDisplayController;
  v6 = [(SBMirroredDisplayController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_externalDisplayDefaults, a3);
    objc_initWeak(&location, v7);
    id v8 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v12, &location);
    uint64_t v9 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureToken = v7->_stateCaptureToken;
    v7->_stateCaptureToken = (BSInvalidatable *)v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

id __63__SBMirroredDisplayController_initWithExternalDisplayDefaults___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained description];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBMirroredDisplayController;
  [(SBMirroredDisplayController *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(FBSDisplayIdentity *)self->_displayIdentity description];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __42__SBMirroredDisplayController_description__block_invoke;
  v11 = &unk_1E6AF5290;
  id v12 = v3;
  v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:v4 multilinePrefix:0 block:&v8];

  v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return (NSString *)v6;
}

void __42__SBMirroredDisplayController_description__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "hasControlOfDisplay"), @"hasControlOfDisplay");
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 24))
  {
    v4 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__SBMirroredDisplayController_description__block_invoke_2;
    v13[3] = &unk_1E6AF5290;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    id v14 = v5;
    uint64_t v15 = v6;
    [v5 appendBodySectionWithName:@"FBSDisplayConfiguration" multilinePrefix:@"\t" block:v13];

    uint64_t v3 = *(void *)(a1 + 40);
  }
  if (*(void *)(v3 + 72))
  {
    v7 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__SBMirroredDisplayController_description__block_invoke_3;
    v10[3] = &unk_1E6AF5290;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = v8;
    uint64_t v12 = v9;
    [v8 appendBodySectionWithName:@"CADisplay" multilinePrefix:@"\t" block:v10];
  }
}

void __42__SBMirroredDisplayController_description__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 24) bounds];
  id v3 = (id)objc_msgSend(v2, "appendRect:withName:", @"bounds");
  v4 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 24) pointScale];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", @"scale", 2);
  uint64_t v6 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 24) pixelSize];
  id v7 = (id)objc_msgSend(v6, "appendSize:withName:", @"pixelSize");
  id v8 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 24) overscanCompensation];
  uint64_t v9 = FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  [v8 appendString:v9 withName:@"overscanCompensation"];

  v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(*(void *)(a1 + 40) + 24) currentMode];
  id v12 = (id)[v10 appendObject:v11 withName:@"currentMode"];

  v13 = *(void **)(a1 + 32);
  id v15 = [*(id *)(*(void *)(a1 + 40) + 24) identity];
  id v14 = (id)objc_msgSend(v13, "appendUInt64:withName:", objc_msgSend(v15, "connectionSeed"), @"connectionSeed");
}

id __42__SBMirroredDisplayController_description__block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 72) bounds];
  id v3 = (id)objc_msgSend(v2, "appendRect:withName:", @"bounds");
  v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 72) overscanAdjustment];
  [v4 appendString:v5 withName:@"overscanAdjustment"];

  uint64_t v6 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 72) logicalScale];
  id v7 = (id)objc_msgSend(v6, "appendSize:withName:", @"activeLogicalScale");
  id v8 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 72) minimumLogicalScale];
  id v9 = (id)objc_msgSend(v8, "appendDouble:withName:decimalPrecision:", @"minimumLogicalScale", 2);
  v10 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 72) maximumLogicalScale];
  id v11 = (id)objc_msgSend(v10, "appendDouble:withName:decimalPrecision:", @"maximumLogicalScale", 2);
  id v12 = *(void **)(a1 + 32);
  v13 = [*(id *)(*(void *)(a1 + 40) + 72) transportType];
  [v12 appendString:v13 withName:@"transportType"];

  id v14 = *(void **)(a1 + 32);
  id v15 = [*(id *)(*(void *)(a1 + 40) + 72) currentMode];
  id v16 = (id)[v14 appendObject:v15 withName:@"currentMode"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "seed"), @"seed");
}

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayManager:(id)a5 sceneManager:(id)a6 caDisplayQueue:(id)a7 assertion:(id)a8
{
  v13 = (FBSDisplayIdentity *)a3;
  id v14 = (FBSDisplayConfiguration *)a4;
  id v15 = (OS_dispatch_queue *)a7;
  id v16 = (SBDisplayAssertion *)a8;
  displayIdentity = self->_displayIdentity;
  self->_displayIdentity = v13;
  v18 = v13;
  id v19 = a5;

  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v14;
  v21 = v14;

  v22 = [(FBSDisplayConfiguration *)self->_currentConfiguration CADisplay];
  caDisplay = self->_caDisplay;
  self->_caDisplay = v22;

  displayAssertion = self->_displayAssertion;
  self->_displayAssertion = v16;
  v25 = v16;

  v26 = [(FBSDisplayIdentity *)v18 rootIdentity];
  v27 = [v19 layoutPublisherForDisplay:v26];

  layoutPublisher = self->_layoutPublisher;
  self->_layoutPublisher = v27;

  displayMutationQueue = self->_displayMutationQueue;
  self->_displayMutationQueue = v15;

  [(SBMirroredDisplayController *)self _updateIdleSleepReason:@"SBMirroredDisplayDisableIdleSleep"];
}

- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4
{
  p_currentConfiguration = &self->_currentConfiguration;
  id v12 = a4;
  if ((-[FBSDisplayConfiguration isEqual:](*p_currentConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentConfiguration, a4);
    if ([(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
    {
      layoutPublisher = self->_layoutPublisher;
      uint64_t v8 = objc_opt_class();
      id v9 = layoutPublisher;
      if (v8)
      {
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
      id v11 = v10;

      [(FBSDisplayLayoutPublishing *)v11 setDisplayConfiguration:*p_currentConfiguration];
    }
  }
}

- (void)displayIdentityDidDisconnect:(id)a3
{
}

- (void)displayAssertionDidGainControlOfDisplay:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"-[SBMirroredDisplayController displayAssertionDidGainControlOfDisplay:]"];
    [v12 handleFailureInFunction:v13 file:@"SBMirroredDisplayController.m" lineNumber:138 description:@"this call must be made on the main thread"];
  }
  [(CADisplay *)self->_caDisplay addObserver:self forKeyPath:@"preferences" options:0 context:self];
  id v5 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E4F4F690]);
  lostControlOfDisplaySignal = self->_lostControlOfDisplaySignal;
  self->_lostControlOfDisplaySignal = v5;

  id v7 = v5;
  uint64_t v8 = self->_displayIdentity;
  [(SBMirroredDisplayController *)self _updateIdleSleepReason:@"SBMirroredDisplayDisableIdleSleep"];
  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __71__SBMirroredDisplayController_displayAssertionDidGainControlOfDisplay___block_invoke;
  v17 = &unk_1E6AF6F98;
  v18 = v7;
  id v19 = v8;
  v20 = self;
  SEL v21 = a2;
  v10 = v8;
  id v11 = v7;
  dispatch_after(v9, MEMORY[0x1E4F14428], &v14);
  [(SBMirroredDisplayController *)self _ensureCADisplayModeForMirroring];
  [MEMORY[0x1E4F39CF8] generateSeed];
}

uint64_t __71__SBMirroredDisplayController_displayAssertionDidGainControlOfDisplay___block_invoke(id *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a1[4] hasBeenSignalled];
  if ((result & 1) == 0)
  {
    id v3 = SBLogDisplayControlling();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = _SBDisplayControllerLoggingProem(a1[5], a1[6]);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ removing disable idle sleep reason after timeout", (uint8_t *)&v5, 0xCu);
    }
    return [a1[6] _updateIdleSleepReason:0];
  }
  return result;
}

- (void)displayAssertion:(id)a3 didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a4
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a4) & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[SBMirroredDisplayController displayAssertion:didLoseControlOfDisplayForDeactivationReasons:]"];
    [v6 handleFailureInFunction:v7 file:@"SBMirroredDisplayController.m" lineNumber:159 description:@"this call must be made on the main thread"];
  }
  [(CADisplay *)self->_caDisplay removeObserver:self forKeyPath:@"preferences" context:self];
  lostControlOfDisplaySignal = self->_lostControlOfDisplaySignal;
  [(BSAtomicSignal *)lostControlOfDisplaySignal signal];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__SBMirroredDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v6[3] = &unk_1E6AF4A70;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __78__SBMirroredDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDisplayControlling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 32));
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did detect CADisplay prefs change", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) hasControlOfDisplay];
  if (result) {
    return [*(id *)(a1 + 32) _ensureCADisplayModeForMirroring];
  }
  return result;
}

- (void)_ensureCADisplayModeForMirroring
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [NSString stringWithUTF8String:"-[SBMirroredDisplayController _ensureCADisplayModeForMirroring]"];
    [v28 handleFailureInFunction:v29 file:@"SBMirroredDisplayController.m" lineNumber:180 description:@"this call must be made on the main thread"];
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F39B78]);
  if ([(SBExternalDisplayDefaults *)self->_externalDisplayDefaults chamois])
  {
    [(CADisplay *)self->_caDisplay nativeSize];
    objc_msgSend(v4, "setResolution:");
  }
  int v5 = [(CADisplay *)self->_caDisplay preferredModeWithCriteria:v4];
  uint64_t v6 = FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  if (!self->_requestedMode)
  {
    uint64_t v7 = [(CADisplay *)self->_caDisplay currentMode];
    requestedMode = self->_requestedMode;
    self->_requestedMode = v7;
  }
  if (!self->_requestedOverscanAdjustment)
  {
    dispatch_time_t v9 = [(CADisplay *)self->_caDisplay overscanAdjustment];
    requestedOverscanAdjustment = self->_requestedOverscanAdjustment;
    self->_requestedOverscanAdjustment = v9;
  }
  if (BSSizeEqualToSize())
  {
    [(CADisplay *)self->_caDisplay logicalScale];
    self->_requestedLogicalScale.width = v11;
    self->_requestedLogicalScale.height = v12;
  }
  uint64_t v13 = SBCADifferenceMaskCalculate(self->_caDisplay, v5, v6, 1);
  if (SBCADisplayDifferenceMaskHasDifference(v13))
  {
    uint64_t v14 = SBLogDisplayControlling();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      id v16 = SBCADisplayDifferenceMaskDescription(v13);
      *(_DWORD *)buf = 138543618;
      v40 = v15;
      __int16 v41 = 2114;
      v42 = v16;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ we're in control of the display but our CADisplay needs updating: %{public}@", buf, 0x16u);
    }
    objc_storeStrong((id *)&self->_requestedMode, v5);
    v17 = (NSString *)[v6 copy];
    v18 = self->_requestedOverscanAdjustment;
    self->_requestedOverscanAdjustment = v17;

    __asm { FMOV            V0.2D, #1.0 }
    CGSize v30 = _Q0;
    self->_requestedLogicalScale = _Q0;
    v24 = self->_lostControlOfDisplaySignal;
    displayMutationQueue = self->_displayMutationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke;
    block[3] = &unk_1E6AFACD0;
    v32 = v24;
    id v33 = v5;
    id v34 = v6;
    v35 = self;
    CGSize v36 = v30;
    uint64_t v37 = 1;
    SEL v38 = a2;
    v26 = v24;
    dispatch_async(displayMutationQueue, block);

LABEL_18:
    goto LABEL_19;
  }
  if (v13 == -1)
  {
    v26 = SBLogDisplayControlling();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      *(_DWORD *)buf = 138543874;
      v40 = v27;
      __int16 v41 = 2114;
      v42 = v5;
      __int16 v43 = 2114;
      v44 = v6;
      _os_log_error_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_ERROR, "%{public}@ we're in control of the display but we can't tell if our CADisplay is up to date. is one of these nil? preferredMode:%{public}@; preferredOverscan:%{public}@",
        buf,
        0x20u);
    }
    goto LABEL_18;
  }
LABEL_19:
}

void __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasBeenSignalled] & 1) == 0)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F39B80]);
    [v2 setCurrentMode:*(void *)(a1 + 40)];
    [v2 setOverscanAdjustment:*(void *)(a1 + 48)];
    id v3 = [*(id *)(*(void *)(a1 + 56) + 24) identity];
    objc_msgSend(v2, "setConnectionSeed:", objc_msgSend(v3, "connectionSeed"));

    objc_msgSend(v2, "setLogicalScale:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    [v2 setPointScale:*(void *)(a1 + 80)];
    char v4 = [*(id *)(*(void *)(a1 + 56) + 72) setDisplayProperties:v2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2;
    block[3] = &unk_1E6AF7150;
    char v10 = v4;
    uint64_t v5 = *(void *)(a1 + 88);
    void block[4] = *(void *)(a1 + 56);
    uint64_t v9 = v5;
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  id v3 = SBLogDisplayControlling();
  char v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 32));
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v9 = 138543874;
      char v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ display change successful : mode=%{public}@ overscan=%{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2_cold_1(a1, v4);
  }

  return [*(id *)(a1 + 32) _updateDisplayAssertion];
}

- (void)_updateIdleSleepReason:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_idleSleepReason, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_idleSleepReason, a3);
    [(SBMirroredDisplayController *)self _updateDisplayAssertion];
  }
}

- (void)_updateDisplayAssertion
{
  char v4 = objc_alloc_init(SBDisplayAssertionPreferences);
  [(SBDisplayAssertionPreferences *)v4 setWantsControlOfDisplay:1];
  [(SBDisplayAssertionPreferences *)v4 setDisableSystemIdleSleepReason:self->_idleSleepReason];
  id v3 = +[SBDisplayPowerLogEntry forDisplay:self->_currentConfiguration mode:1 zoom:0];
  [(SBDisplayAssertionPreferences *)v4 setPowerLogEntry:v3];
  [(SBDisplayAssertionPreferences *)v4 setCloneMirroringMode:1];
  [(SBDisplayAssertion *)self->_displayAssertion updateWithPreferences:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_requestedOverscanAdjustment, 0);
  objc_storeStrong((id *)&self->_requestedMode, 0);
  objc_storeStrong((id *)&self->_caDisplay, 0);
  objc_storeStrong((id *)&self->_displayMutationQueue, 0);
  objc_storeStrong((id *)&self->_idleSleepReason, 0);
  objc_storeStrong((id *)&self->_lostControlOfDisplaySignal, 0);
  objc_storeStrong((id *)&self->_displayAssertion, 0);
  objc_storeStrong((id *)&self->_layoutPublisher, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_externalDisplayDefaults, 0);
}

void __63__SBMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 32));
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "%{public}@ display change failed: is the connection seed out of date?", (uint8_t *)&v4, 0xCu);
}

@end