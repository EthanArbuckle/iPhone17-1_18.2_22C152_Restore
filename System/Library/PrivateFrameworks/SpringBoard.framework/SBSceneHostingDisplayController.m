@interface SBSceneHostingDisplayController
- (BOOL)isConnected;
- (NSString)description;
- (SBSceneHostingDisplayController)initWithWorkspaceEventQueue:(id)a3 policy:(id)a4;
- (id)_createBlankingWindowWithConfiguration:(id)a3;
- (id)_createDisplayAssertionPreferences;
- (id)_createPresentationBinderWithConfiguration:(id)a3;
- (id)_createUpdateTransactionWithLabel:(id)a3;
- (id)createTransactionForTransitionRequest:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)layoutPublisher;
- (id)signpostDescription;
- (void)_enqueueEvaluateAndApplyPresentationUpdate;
- (void)_ensureCADisplayUpToDate:(id)a3 completion:(id)a4;
- (void)_runRootTransaction:(id)a3 withLabel:(id)a4 completion:(id)a5;
- (void)_runRootUpdateTransactionWithLabel:(id)a3 completion:(id)a4;
- (void)_sendBlankingWindowToFront:(BOOL)a3;
- (void)_updateBlankingWindowIfNecessary;
- (void)_updateLayoutPublisherIfNecessary;
- (void)_updatePolicyForPresentation:(id)a3;
- (void)_updatePresentationBinderIfNecessary;
- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayManager:(id)a5 sceneManager:(id)a6 caDisplayQueue:(id)a7 assertion:(id)a8;
- (void)dealloc;
- (void)displayAssertion:(id)a3 didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a4;
- (void)displayAssertion:(id)a3 didReceiveNewDeactivationReasons:(unint64_t)a4;
- (void)displayAssertionDidGainControlOfDisplay:(id)a3;
- (void)displayIdentityDidDisconnect:(id)a3;
- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)requestUpdate:(unint64_t)a3;
- (void)transformDisplayConfiguration:(id)a3 withBuilder:(id)a4;
@end

@implementation SBSceneHostingDisplayController

- (SBSceneHostingDisplayController)initWithWorkspaceEventQueue:(id)a3 policy:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBSceneHostingDisplayController.m", 155, @"Invalid parameter not satisfying: %@", @"workspaceEventQueue" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SBSceneHostingDisplayController.m", 156, @"Invalid parameter not satisfying: %@", @"policy" object file lineNumber description];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)SBSceneHostingDisplayController;
  v11 = [(SBSceneHostingDisplayController *)&v25 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workspaceEventQueue, a3);
    objc_storeStrong((id *)&v12->_policy, a4);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingWork = v12->_pendingWork;
    v12->_pendingWork = v13;

    objc_initWeak(&location, v12);
    id v15 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v23, &location);
    uint64_t v16 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureAssertion = v12->_stateCaptureAssertion;
    v12->_stateCaptureAssertion = (BSInvalidatable *)v16;

    v18 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E4F4F690]);
    readyToTransformDisplaysSignal = v12->_readyToTransformDisplaysSignal;
    v12->_readyToTransformDisplaysSignal = v18;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

id __70__SBSceneHostingDisplayController_initWithWorkspaceEventQueue_policy___block_invoke(uint64_t a1)
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
  [(BSInvalidatable *)self->_stateCaptureAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSceneHostingDisplayController;
  [(SBSceneHostingDisplayController *)&v3 dealloc];
}

- (void)transformDisplayConfiguration:(id)a3 withBuilder:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 identity];
  v10 = [v9 rootIdentity];
  v11 = [(FBSDisplayIdentity *)self->_displayIdentity rootIdentity];
  char v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSceneHostingDisplayController.m", 185, @"being asked to transform a display config we know nothing about. _displayIdentity: %@; configuration: %@",
      self->_displayIdentity,
      v7);
  }
  if ([(BSAtomicSignal *)self->_readyToTransformDisplaysSignal hasBeenSignalled])
  {
    v13 = [(SBSceneHostingDisplayControllerPolicy *)self->_policy displayPreferencesForDisplayController:self];
    if ([v13 keepOtherModes])
    {
      v14 = [v7 availableModes];
      id v15 = (void *)[v14 mutableCopy];

      uint64_t v16 = [v7 preferredMode];
      [v15 removeObject:v16];

      v17 = [v7 currentMode];
      [v15 removeObject:v17];
    }
    else
    {
      id v15 = 0;
    }
    v19 = [v7 immutableCADisplay];
    v20 = [v13 CADisplayModeCriteria];
    v21 = [v19 preferredModeWithCriteria:v20];

    double v22 = (double)(unint64_t)[v21 width];
    v58 = v21;
    double v23 = (double)(unint64_t)[v21 height];
    double v24 = 1.0;
    double v25 = 1.0;
    if ([v19 displayType] != 2)
    {
      [v13 logicalScale];
      double v27 = v26;
      double v29 = v28;
      [v19 maximumLogicalScale];
      double v25 = v30;
      [v19 minimumLogicalScale];
      if (v31 < v27) {
        double v31 = v27;
      }
      if (v25 > v31) {
        double v25 = v31;
      }
      [v19 maximumLogicalScale];
      double v33 = v32;
      [v19 minimumLogicalScale];
      if (v34 < v29) {
        double v34 = v29;
      }
      if (v33 <= v34) {
        double v24 = v33;
      }
      else {
        double v24 = v34;
      }
    }
    double v35 = v25 * v22;
    [v13 contentsScale];
    double v37 = v36;
    CGFloat size = v22;
    double v38 = v25 * v22 / v36;
    double v39 = v24 * v23 / v36;
    v40 = [v7 currentMode];
    v41 = objc_msgSend(v40, "_copyWithOverrideSize:scale:", v38, v39, v37);

    [v8 setCurrentMode:v41 preferredMode:v41 otherModes:v15];
    objc_msgSend(v8, "setPixelSize:nativeBounds:bounds:", v35, v24 * v23, 0.0, 0.0, v35, v24 * v23, 0, 0, *(void *)&v38, *(void *)&v39);
    v42 = [v13 displayConfigurationRequest];
    uint64_t v43 = [v42 overscanCompensation];
    v57 = v15;
    BOOL v44 = (unint64_t)(v43 - 1) < 0xFFFFFFFFFFFFFFFELL;
    if ((unint64_t)(v43 - 1) >= 0xFFFFFFFFFFFFFFFELL) {
      uint64_t v45 = 0;
    }
    else {
      uint64_t v45 = v43;
    }
    [v7 safeOverscanRatio];
    objc_msgSend(v8, "setOverscanned:compensation:safeRatio:", v44, v45);
    v46 = SBLogDisplayTransforming();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      size_8 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v53 = [v7 identity];
      v80.width = size;
      v80.height = v23;
      sizea = NSStringFromCGSize(v80);
      v81.width = v38;
      v81.height = v39;
      v52 = NSStringFromCGSize(v81);
      v83.origin.x = 0.0;
      v83.origin.y = 0.0;
      v83.size.width = v35;
      v83.size.height = v24 * v23;
      v51 = NSStringFromCGRect(v83);
      v84.origin.x = 0.0;
      v84.origin.y = 0.0;
      v84.size.width = v38;
      v84.size.height = v39;
      v47 = NSStringFromCGRect(v84);
      v82.width = v25;
      v82.height = v24;
      v50 = NSStringFromCGSize(v82);
      FBSDisplayOverscanCompensationDescription();
      *(_DWORD *)buf = 138545666;
      v60 = size_8;
      __int16 v61 = 2114;
      v62 = v53;
      __int16 v63 = 2114;
      v64 = sizea;
      __int16 v65 = 2114;
      v66 = v52;
      __int16 v67 = 2114;
      v68 = v51;
      __int16 v69 = 2114;
      v70 = v47;
      __int16 v71 = 2048;
      double v72 = v37;
      __int16 v73 = 2114;
      v74 = v50;
      v76 = __int16 v75 = 2114;
      v48 = (void *)v76;
      __int16 v77 = 2114;
      v78 = v41;
      _os_log_debug_impl(&dword_1D85BA000, v46, OS_LOG_TYPE_DEBUG, "%{public}@ requesting %{public}@ be transformed to pixelSize: %{public}@; pointSize: %{public}@; nativeBounds: %"
        "{public}@; bounds: %{public}@; contentsScale: %.2f; logicalScale: %{public}@; overscan: %{public}@; currentMode: %{public}@",
        buf,
        0x66u);
    }
  }
  else
  {
    v13 = SBLogDisplayTransforming();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      *(_DWORD *)buf = 138543362;
      v60 = v18;
      _os_log_debug_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ skipping transform", buf, 0xCu);
    }
  }
}

- (BOOL)isConnected
{
  return [(BSAtomicSignal *)self->_displayDisconnectedSignal hasBeenSignalled] ^ 1;
}

- (id)createTransactionForTransitionRequest:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = (objc_class *)objc_opt_class();
  v6 = _SBDisplayControllerTransactionLabel(v5, @"clientRequested");
  id v7 = [(SBSceneHostingDisplayController *)self _createUpdateTransactionWithLabel:v6];
  id v8 = [v4 setWithObject:v7];

  return v8;
}

- (void)requestUpdate:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v6 = SBLogDisplayControlling();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v8 = [MEMORY[0x1E4F28E78] string];
      SEL v19 = a2;
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      char v21 = 1;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __SBSceneHostingDisplayControllerUpdateFlagsDescription_block_invoke;
      double v24 = &unk_1E6AF77E8;
      double v26 = v20;
      id v9 = v8;
      double v25 = v9;
      v10 = buf;
      char v22 = 0;
      uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
      v11.i16[0] = vaddlv_u8(v11);
      int v12 = v11.i32[0];
      if (v11.i32[0])
      {
        unint64_t v13 = 0;
        do
        {
          if (((1 << v13) & a3) != 0)
          {
            (*(void (**)(unsigned char *))&buf[16])(v10);
            if (v22) {
              break;
            }
            --v12;
          }
          if (v13 > 0x3E) {
            break;
          }
          ++v13;
        }
        while (v12 > 0);
      }

      _Block_object_dispose(v20, 8);
    }
    else
    {
      id v9 = @".None";
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%{public}@ asked to update for %{public}@", buf, 0x16u);
  }
  if (a3)
  {
    v14 = [(SBSceneHostingDisplayController *)self _createDisplayAssertionPreferences];
    if ([(SBDisplayAssertionPreferences *)self->_currentDisplayAssertionPreferences isEqual:v14])
    {
      id v15 = SBLogDisplayControlling();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v16;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "%{public}@ no change in preferences. not updating", buf, 0xCu);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_currentDisplayAssertionPreferences, v14);
      [(SBDisplayAssertion *)self->_displayAssertion updateWithPreferences:self->_currentDisplayAssertionPreferences];
    }
  }
  if (!self->_connectionCompleted)
  {
    if ((a3 & 2) == 0) {
      return;
    }
    goto LABEL_25;
  }
  if ((a3 & 6) == 2)
  {
LABEL_25:
    [(SBSceneHostingDisplayController *)self _enqueueEvaluateAndApplyPresentationUpdate];
    return;
  }
  if ((a3 & 4) != 0)
  {
    v17 = (objc_class *)objc_opt_class();
    v18 = _SBDisplayControllerTransactionLabel(v17, @"policyRequested");
    [(SBSceneHostingDisplayController *)self _runRootUpdateTransactionWithLabel:v18 completion:0];
  }
}

- (id)layoutPublisher
{
  return self->_layoutPublisher;
}

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayManager:(id)a5 sceneManager:(id)a6 caDisplayQueue:(id)a7 assertion:(id)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v37 = a5;
  id v36 = a6;
  id v35 = a7;
  v17 = (SBDisplayAssertion *)a8;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v33 = [MEMORY[0x1E4F28B00] currentHandler];
    double v32 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController connectToDisplayIdentity:configuration:displayManager:sceneManager:caDisplayQueue:assertion:]"];
    [v33 handleFailureInFunction:v32 file:@"SBSceneHostingDisplayController.m" lineNumber:279 description:@"this call must be made on the main thread"];
  }
  if (self->_displayIdentity)
  {
    double v34 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSceneHostingDisplayController.m", 281, @"we're connecting to multiple displays and that seems bad. old display: %@; new display: %@",
      self->_displayIdentity,
      v15);
  }
  objc_storeStrong((id *)&self->_displayIdentity, a3);
  objc_storeStrong((id *)&self->_displayManager, a5);
  objc_storeStrong((id *)&self->_currentConfiguration, a4);
  objc_storeStrong((id *)&self->_presentedConfiguration, self->_currentConfiguration);
  objc_storeStrong((id *)&self->_sceneManager, a6);
  v18 = [v16 CADisplay];
  caDisplay = self->_caDisplay;
  self->_caDisplay = v18;

  objc_storeStrong((id *)&self->_displayMutationQueue, a7);
  v20 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E4F4F690]);
  displayDisconnectedSignal = self->_displayDisconnectedSignal;
  self->_displayDisconnectedSignal = v20;

  char v22 = [v15 rootIdentity];
  double v23 = [v37 layoutPublisherForDisplay:v22];
  layoutPublisher = self->_layoutPublisher;
  self->_layoutPublisher = v23;

  double v25 = SBLogDisplayControlling();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    double v26 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    uint64_t v27 = SBDisplayAssertionLevelDescription([(SBDisplayAssertion *)self->_displayAssertion level]);
    BOOL v28 = [(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay];
    *(_DWORD *)buf = 138543874;
    v41 = v26;
    __int16 v42 = 2114;
    uint64_t v43 = v27;
    __int16 v44 = 1024;
    BOOL v45 = v28;
    _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ connected to display. assertion level: %{public}@; in control: %{BOOL}u",
      buf,
      0x1Cu);
  }
  displayAssertion = self->_displayAssertion;
  self->_displayAssertion = v17;
  double v30 = v17;

  [(SBSceneHostingDisplayControllerPolicy *)self->_policy connectToDisplayController:self displayConfiguration:self->_currentConfiguration];
  [(BSAtomicSignal *)self->_readyToTransformDisplaysSignal signal];
  displayManager = self->_displayManager;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __127__SBSceneHostingDisplayController_connectToDisplayIdentity_configuration_displayManager_sceneManager_caDisplayQueue_assertion___block_invoke;
  v39[3] = &unk_1E6AF4A70;
  v39[4] = self;
  v39[5] = a2;
  [(SBDisplayManager *)displayManager updateTransformsWithCompletion:v39];
}

void __127__SBSceneHostingDisplayController_connectToDisplayIdentity_configuration_displayManager_sceneManager_caDisplayQueue_assertion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 176) hasBeenSignalled];
  objc_super v3 = SBLogDisplayControlling();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 32));
      int v12 = 138543362;
      unint64_t v13 = v5;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ updated transforms but our display disconnected in the meantime. will not proceed", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      v6 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 32));
      int v12 = 138543362;
      unint64_t v13 = v6;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ updated transforms upon display connect. updating assertion", (uint8_t *)&v12, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
    uint64_t v7 = [*(id *)(a1 + 32) _createDisplayAssertionPreferences];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 112);
    *(void *)(v8 + 112) = v7;

    [*(id *)(*(void *)(a1 + 32) + 104) updateWithPreferences:*(void *)(*(void *)(a1 + 32) + 112)];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(*(void *)(a1 + 32) + 152));
    v10 = *(void **)(a1 + 32);
    uint8x8_t v11 = (objc_class *)objc_opt_class();
    objc_super v3 = _SBDisplayControllerTransactionLabel(v11, @"displayConnect");
    [v10 _runRootUpdateTransactionWithLabel:v3 completion:0];
  }
}

- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    double v32 = [MEMORY[0x1E4F28B00] currentHandler];
    double v33 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController displayIdentityDidUpdate:configuration:]"];
    [v32 handleFailureInFunction:v33 file:@"SBSceneHostingDisplayController.m" lineNumber:329 description:@"this call must be made on the main thread"];

    if (v8) {
      goto LABEL_3;
    }
  }
  double v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"SBSceneHostingDisplayController.m", 330, @"Invalid parameter not satisfying: %@", @"displayConfiguration" object file lineNumber description];

LABEL_3:
  char v9 = [(FBSDisplayConfiguration *)self->_currentConfiguration isEqual:v8];
  v10 = SBLogDisplayControlling();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11) {
      -[SBSceneHostingDisplayController displayIdentityDidUpdate:configuration:]((void **)&self->super.isa, (uint64_t)a2, v10);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (v11)
  {
    double v31 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    *(_DWORD *)buf = 138543618;
    id v36 = v31;
    __int16 v37 = 2114;
    id v38 = v7;
    _os_log_debug_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: identity=%{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_currentConfiguration, a4);
  if ([(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
  {
    int v12 = [(_UIRootWindow *)self->_blankingWindow screen];
    v10 = [v12 displayConfiguration];

    [v10 bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [(FBSDisplayConfiguration *)self->_currentConfiguration bounds];
    v41.origin.x = v21;
    v41.origin.y = v22;
    v41.size.width = v23;
    v41.size.height = v24;
    v40.origin.x = v14;
    v40.origin.y = v16;
    v40.size.width = v18;
    v40.size.height = v20;
    if (CGRectEqualToRect(v40, v41) && self->_blankingWindow)
    {
      double v25 = SBLogDisplayControlling();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        double v26 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        *(_DWORD *)buf = 138543362;
        id v36 = v26;
        _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ recreating blanking window", buf, 0xCu);
      }
      [(_UIRootWindow *)self->_blankingWindow windowLevel];
      double v28 = v27;
      double v29 = [(SBSceneHostingDisplayController *)self _createBlankingWindowWithConfiguration:self->_currentConfiguration];
      blankingWindow = self->_blankingWindow;
      self->_blankingWindow = v29;

      [(_UIRootWindow *)self->_blankingWindow setWindowLevel:v28];
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)displayIdentityDidDisconnect:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v14 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController displayIdentityDidDisconnect:]"];
    [v13 handleFailureInFunction:v14 file:@"SBSceneHostingDisplayController.m" lineNumber:352 description:@"this call must be made on the main thread"];
  }
  BOOL v4 = SBLogDisplayControlling();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    int v15 = 138543362;
    CGFloat v16 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ told display did disconnect. beginning teardown transaction", (uint8_t *)&v15, 0xCu);
  }
  [(BSAtomicSignal *)self->_displayDisconnectedSignal signal];
  [(SBSceneHostingDisplayControllerPolicy *)self->_policy displayControllerWillDisconnect:self sceneManager:self->_sceneManager];
  v6 = SBLogDisplayControlling();
  if (os_signpost_enabled(v6))
  {
    id v7 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    int v15 = 138543362;
    CGFloat v16 = v7;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_DISCONNECT", "%{public}@", (uint8_t *)&v15, 0xCu);
  }
  [(SBSceneHostingDisplayControllerPolicy *)self->_policy displayControllerDidDisconnect:self sceneManager:self->_sceneManager];
  id v8 = SBLogDisplayControlling();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    int v15 = 138543362;
    CGFloat v16 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ policy finished disconnect", (uint8_t *)&v15, 0xCu);
  }
  [(SBSceneManager *)self->_sceneManager invalidate];
  [(_UIRootWindow *)self->_blankingWindow setHidden:1];
  blankingWindow = self->_blankingWindow;
  self->_blankingWindow = 0;

  BOOL v11 = SBLogDisplayControlling();
  if (os_signpost_enabled(v11))
  {
    int v12 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    int v15 = 138543362;
    CGFloat v16 = v12;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_DISCONNECT", "%{public}@", (uint8_t *)&v15, 0xCu);
  }
}

- (void)displayAssertionDidGainControlOfDisplay:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController displayAssertionDidGainControlOfDisplay:]"];
    [v6 handleFailureInFunction:v7 file:@"SBSceneHostingDisplayController.m" lineNumber:370 description:@"this call must be made on the main thread"];
  }
  [(CADisplay *)self->_caDisplay addObserver:self forKeyPath:@"preferences" options:0 context:self];
  self->_currentDeactivationReasons = 0;
  BOOL v4 = [(SBSceneHostingDisplayController *)self _createBlankingWindowWithConfiguration:self->_currentConfiguration];
  blankingWindow = self->_blankingWindow;
  self->_blankingWindow = v4;

  [(SBSceneHostingDisplayController *)self _sendBlankingWindowToFront:0];
  [(SBSceneHostingDisplayControllerPolicy *)self->_policy displayController:self didGainControlOfDisplayWithSceneManager:self->_sceneManager];
  [(SBSceneHostingDisplayController *)self _enqueueEvaluateAndApplyPresentationUpdate];
}

- (void)displayAssertion:(id)a3 didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a4
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController displayAssertion:didLoseControlOfDisplayForDeactivationReasons:]"];
    [v7 handleFailureInFunction:v8 file:@"SBSceneHostingDisplayController.m" lineNumber:381 description:@"this call must be made on the main thread"];
  }
  [(CADisplay *)self->_caDisplay removeObserver:self forKeyPath:@"preferences" context:self];
  [(BSAtomicSignal *)self->_presentationUpdateInvalidationSignal signal];
  self->_currentDeactivationReasons = a4;
  blankingWindow = self->_blankingWindow;
  self->_blankingWindow = 0;

  [(SBSceneManager *)self->_sceneManager updatePresentationBinder:0];
  [(SBSceneHostingDisplayControllerPolicy *)self->_policy displayController:self sceneManager:self->_sceneManager didLoseControlOfDisplayWithDeactivationReasons:a4];
  [(SBSceneHostingDisplayController *)self _enqueueEvaluateAndApplyPresentationUpdate];
}

- (void)displayAssertion:(id)a3 didReceiveNewDeactivationReasons:(unint64_t)a4
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController displayAssertion:didReceiveNewDeactivationReasons:]"];
    [v6 handleFailureInFunction:v7 file:@"SBSceneHostingDisplayController.m" lineNumber:395 description:@"this call must be made on the main thread"];
  }
  self->_currentDeactivationReasons = a4;
  [(SBSceneHostingDisplayControllerPolicy *)self->_policy displayController:self sceneManager:self->_sceneManager didReceiveNewDeactivationReasons:a4];
  [(SBSceneHostingDisplayController *)self _enqueueEvaluateAndApplyPresentationUpdate];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__SBSceneHostingDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v6[3] = &unk_1E6AF4A70;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __82__SBSceneHostingDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = SBLogDisplayControlling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 32));
    int v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did detect CADisplay prefs change", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) _enqueueEvaluateAndApplyPresentationUpdate];
}

- (void)_ensureCADisplayUpToDate:(id)a3 completion:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
    CGRect v40 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController _ensureCADisplayUpToDate:completion:]"];
    [v39 handleFailureInFunction:v40 file:@"SBSceneHostingDisplayController.m" lineNumber:417 description:@"this call must be made on the main thread"];
  }
  if (![(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
  {
    CGRect v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"SBSceneHostingDisplayController.m" lineNumber:418 description:@"we should not be updating the CADisplay if we don't have control over it"];
  }
  char v9 = [(SBSceneHostingDisplayControllerPolicy *)self->_policy displayPreferencesForDisplayController:self];
  caDisplay = self->_caDisplay;
  BOOL v11 = [v9 CADisplayModeCriteria];
  int v12 = [(CADisplay *)caDisplay preferredModeWithCriteria:v11];

  double v13 = [v9 displayConfigurationRequest];
  [v13 overscanCompensation];
  CGFloat v14 = FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();

  double v15 = 1.0;
  double v16 = 1.0;
  if ([(CADisplay *)self->_caDisplay displayType] != 2)
  {
    [v9 logicalScale];
    double v18 = v17;
    double v20 = v19;
    [(CADisplay *)self->_caDisplay maximumLogicalScale];
    double v22 = v21;
    [(CADisplay *)self->_caDisplay minimumLogicalScale];
    if (v23 < v18) {
      double v23 = v18;
    }
    if (v22 <= v23) {
      double v16 = v22;
    }
    else {
      double v16 = v23;
    }
    [(CADisplay *)self->_caDisplay maximumLogicalScale];
    double v25 = v24;
    [(CADisplay *)self->_caDisplay minimumLogicalScale];
    if (v26 < v20) {
      double v26 = v20;
    }
    if (v25 <= v26) {
      double v15 = v25;
    }
    else {
      double v15 = v26;
    }
  }
  [v9 contentsScale];
  unint64_t v28 = (unint64_t)v27;
  uint64_t v29 = SBCADifferenceMaskCalculate(self->_caDisplay, v12, v14, (unint64_t)v27);
  char v30 = v29;
  if (SBCADisplayDifferenceMaskHasDifference(v29))
  {
    if ((v30 & 4) != 0)
    {
      double v31 = SBLogDisplayControlling();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        double v32 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        *(_DWORD *)buf = 138543362;
        v55 = v32;
        _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ updating logicalScale. sending the blanking window front-most", buf, 0xCu);
      }
      [(SBSceneHostingDisplayController *)self _sendBlankingWindowToFront:1];
    }
    uint64_t v43 = v8;
    SEL v33 = a2;
    double v34 = SBLogDisplayControlling();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      id v35 = v42 = v7;
      v67.width = v16;
      v67.height = v15;
      id v36 = NSStringFromCGSize(v67);
      [(CADisplay *)self->_caDisplay bounds];
      __int16 v37 = NSStringFromCGRect(v68);
      *(_DWORD *)buf = 138544642;
      v55 = v35;
      __int16 v56 = 2114;
      v57 = v12;
      __int16 v58 = 2114;
      v59 = v14;
      __int16 v60 = 2114;
      __int16 v61 = v36;
      __int16 v62 = 2048;
      unint64_t v63 = v28;
      __int16 v64 = 2114;
      __int16 v65 = v37;
      _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting display change: mode=%{public}@ overscan=%{public}@ logicalScale=%{public}@ pointScale=%lu (from)bounds=%{public}@", buf, 0x3Eu);

      id v7 = v42;
    }

    displayMutationQueue = self->_displayMutationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__SBSceneHostingDisplayController__ensureCADisplayUpToDate_completion___block_invoke;
    block[3] = &unk_1E6AF76D0;
    id v45 = v7;
    uint64_t v46 = self;
    id v47 = v12;
    id v48 = v14;
    double v50 = v16;
    double v51 = v15;
    unint64_t v52 = v28;
    SEL v53 = v33;
    id v8 = v43;
    v49 = v43;
    dispatch_async(displayMutationQueue, block);
  }
  else
  {
    v8[2](v8);
  }
}

uint64_t __71__SBSceneHostingDisplayController__ensureCADisplayUpToDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) hasBeenSignalled] & 1) == 0)
  {
    char v9 = [*(id *)(*(void *)(a1 + 40) + 160) identity];
    uint64_t v10 = [v9 connectionSeed];

    int v2 = objc_alloc_init(MEMORY[0x1E4F39B80]);
    [v2 setCurrentMode:*(void *)(a1 + 48)];
    [v2 setOverscanAdjustment:*(void *)(a1 + 56)];
    [v2 setConnectionSeed:v10];
    -[NSObject setLogicalScale:](v2, "setLogicalScale:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    [v2 setPointScale:*(void *)(a1 + 88)];
    int v11 = [*(id *)(*(void *)(a1 + 40) + 128) setDisplayProperties:v2];
    int v12 = SBLogDisplayControlling();
    objc_super v3 = v12;
    if (v11)
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      double v13 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 40) + 8), *(void **)(a1 + 40));
      [*(id *)(*(void *)(a1 + 40) + 128) bounds];
      CGFloat v14 = NSStringFromCGRect(v39);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 56);
      double v17 = NSStringFromCGSize(*(CGSize *)(a1 + 72));
      uint64_t v18 = *(void *)(a1 + 88);
      int v23 = 138544898;
      double v24 = v13;
      __int16 v25 = 2114;
      double v26 = v14;
      __int16 v27 = 2114;
      uint64_t v28 = v15;
      __int16 v29 = 2114;
      uint64_t v30 = v16;
      __int16 v31 = 2114;
      double v32 = v17;
      __int16 v33 = 2048;
      uint64_t v34 = v18;
      __int16 v35 = 1024;
      int v36 = v10;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ display change successful: bounds=%{public}@ mode=%{public}@ overscan=%{public}@ logicalScale=%{public}@ pointScale=%lu connectionSeed=%u", (uint8_t *)&v23, 0x44u);
    }
    else
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      double v13 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 40) + 8), *(void **)(a1 + 40));
      [*(id *)(*(void *)(a1 + 40) + 128) bounds];
      CGFloat v14 = NSStringFromCGRect(v40);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v21 = *(void *)(a1 + 56);
      double v17 = NSStringFromCGSize(*(CGSize *)(a1 + 72));
      uint64_t v22 = *(void *)(a1 + 88);
      int v23 = 138544898;
      double v24 = v13;
      __int16 v25 = 2114;
      double v26 = v14;
      __int16 v27 = 2114;
      uint64_t v28 = v20;
      __int16 v29 = 2114;
      uint64_t v30 = v21;
      __int16 v31 = 2114;
      double v32 = v17;
      __int16 v33 = 2048;
      uint64_t v34 = v22;
      __int16 v35 = 1024;
      int v36 = v10;
      _os_log_error_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_ERROR, "%{public}@ display change failed: bounds=%{public}@ mode=%{public}@ overscan=%{public}@ logicalScale=%{public}@ pointScale=%lu connectionSeed=%u", (uint8_t *)&v23, 0x44u);
    }

    goto LABEL_9;
  }
  int v2 = SBLogDisplayControlling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 40) + 8), *(void **)(a1 + 40));
    [*(id *)(*(void *)(a1 + 40) + 128) bounds];
    BOOL v4 = NSStringFromCGRect(v38);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = NSStringFromCGSize(*(CGSize *)(a1 + 72));
    uint64_t v8 = *(void *)(a1 + 88);
    int v23 = 138544642;
    double v24 = v3;
    __int16 v25 = 2114;
    double v26 = v4;
    __int16 v27 = 2114;
    uint64_t v28 = v5;
    __int16 v29 = 2114;
    uint64_t v30 = v6;
    __int16 v31 = 2114;
    double v32 = v7;
    __int16 v33 = 2048;
    uint64_t v34 = v8;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (on-queue) skipping display change request as we were invalidated: bounds=%{public}@ mode=%{public}@ overscan=%{public}@ logicalScale=%{public}@ pointScale=%lu", (uint8_t *)&v23, 0x3Eu);

LABEL_9:
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_updatePolicyForPresentation:(id)a3
{
  id v5 = a3;
  if (![(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBSceneHostingDisplayController.m" lineNumber:474 description:@"should only be calling this helper when we're in control of the display"];
  }
  policy = self->_policy;
  sceneManager = self->_sceneManager;
  presentedConfiguration = self->_presentedConfiguration;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__SBSceneHostingDisplayController__updatePolicyForPresentation___block_invoke;
  v11[3] = &unk_1E6AF76F8;
  id v12 = v5;
  SEL v13 = a2;
  v11[4] = self;
  id v9 = v5;
  [(SBSceneHostingDisplayControllerPolicy *)policy displayController:self updatePresentationWithSceneManager:sceneManager displayConfiguration:presentedConfiguration completion:v11];
}

uint64_t __64__SBSceneHostingDisplayController__updatePolicyForPresentation___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = SBLogDisplayControlling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 32));
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ presentation update complete", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updatePresentationBinderIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBSceneHostingDisplayController.m" lineNumber:484 description:@"should only be calling this helper when we're in control of the display"];
  }
  BOOL v4 = SBLogDisplayControlling();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ updating presentation binder's display configuration", (uint8_t *)&v9, 0xCu);
  }
  sceneManager = self->_sceneManager;
  uint64_t v7 = [(SBSceneHostingDisplayController *)self _createPresentationBinderWithConfiguration:self->_presentedConfiguration];
  [(SBSceneManager *)sceneManager updatePresentationBinder:v7];
}

- (void)_updateLayoutPublisherIfNecessary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
  {
    SEL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBSceneHostingDisplayController.m" lineNumber:490 description:@"should only be calling this helper when we're in control of the display"];
  }
  layoutPublisher = self->_layoutPublisher;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = layoutPublisher;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7;

  if (v8)
  {
    int v9 = [(FBSDisplayLayoutPublishing *)v8 displayConfiguration];
    char v10 = [v9 isEqual:self->_presentedConfiguration];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = SBLogDisplayControlling();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        int v14 = 138543362;
        uint64_t v15 = v12;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updating layout publisher configuration", (uint8_t *)&v14, 0xCu);
      }
      [(FBSDisplayLayoutPublishing *)v8 setDisplayConfiguration:self->_presentedConfiguration];
    }
  }
}

- (void)_updateBlankingWindowIfNecessary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
  {
    int v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SBSceneHostingDisplayController.m" lineNumber:499 description:@"should only be calling this helper when we're in control of the display"];
  }
  BOOL v4 = [(_UIRootWindow *)self->_blankingWindow screen];
  uint64_t v5 = [v4 displayConfiguration];

  if (([v5 isEqual:self->_presentedConfiguration] & 1) == 0)
  {
    [v5 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [(FBSDisplayConfiguration *)self->_presentedConfiguration bounds];
    v30.origin.x = v14;
    v30.origin.y = v15;
    v30.size.width = v16;
    v30.size.height = v17;
    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    BOOL v18 = CGRectEqualToRect(v29, v30);
    double v19 = SBLogDisplayControlling();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      uint64_t v21 = (void *)v20;
      uint64_t v22 = @"back";
      if (v18) {
        uint64_t v22 = @"front";
      }
      int v24 = 138543618;
      uint64_t v25 = v20;
      __int16 v26 = 2114;
      __int16 v27 = v22;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ sending blanking window to %{public}@", (uint8_t *)&v24, 0x16u);
    }
    [(SBSceneHostingDisplayController *)self _sendBlankingWindowToFront:v18];
  }
}

- (void)_enqueueEvaluateAndApplyPresentationUpdate
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController _enqueueEvaluateAndApplyPresentationUpdate]"];
    [v4 handleFailureInFunction:v5 file:@"SBSceneHostingDisplayController.m" lineNumber:511 description:@"this call must be made on the main thread"];
  }
  if (!self->_hasEnqueuedPresentationUpdate)
  {
    self->_hasEnqueuedPresentationUpdate = 1;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke;
    v6[3] = &unk_1E6AF4A70;
    v6[4] = self;
    v6[5] = a2;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  [*(id *)(*(void *)(a1 + 32) + 168) signal];
  id v2 = objc_alloc_init(MEMORY[0x1E4F4F690]);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 168);
  *(void *)(v3 + 168) = v2;

  id v5 = v2;
  double v6 = SBLogBacklight();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, v5);

  double v8 = SBLogDisplayControlling();
  CGFloat v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    double v10 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 32));
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SBSceneHostingDisplayController:Presentation", "%{public}@", buf, 0xCu);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 104) hasControlOfDisplay])
  {
    CGFloat v11 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_60;
    v15[3] = &unk_1E6AF7748;
    CGFloat v16 = v5;
    long long v17 = *(_OWORD *)(a1 + 32);
    os_signpost_id_t v18 = v7;
    [v11 _ensureCADisplayUpToDate:v16 completion:v15];
    double v12 = v16;
  }
  else
  {
    CGFloat v13 = SBLogDisplayControlling();
    double v12 = v13;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      CGFloat v14 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 32));
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v14;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v12, OS_SIGNPOST_INTERVAL_END, v7, "SBSceneHostingDisplayController:Presentation", "FAILED; reason: not in control; %{public}@",
        buf,
        0xCu);
    }
  }
}

void __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_60(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) hasBeenSignalled] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 40) + 176) hasBeenSignalled] & 1) != 0)
  {
    id v2 = SBLogDisplayControlling();
    uint64_t v3 = v2;
    os_signpost_id_t v4 = *(void *)(a1 + 56);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      id v5 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 40) + 8), *(void **)(a1 + 40));
      *(_DWORD *)buf = 138543362;
      double v12 = v5;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v3, OS_SIGNPOST_INTERVAL_END, v4, "SBSceneHostingDisplayController:Presentation", "FAILED; reason: stale after updateCA; %{public}@",
        buf,
        0xCu);
    }
  }
  else
  {
    double v6 = *(void **)(*(void *)(a1 + 40) + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_2;
    v7[3] = &unk_1E6AF7748;
    double v8 = *(id *)(a1 + 32);
    long long v9 = *(_OWORD *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    [v6 updateTransformsWithCompletion:v7];
    uint64_t v3 = v8;
  }
}

void __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    CGFloat v14 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v15 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController _enqueueEvaluateAndApplyPresentationUpdate]_block_invoke_2"];
    [v14 handleFailureInFunction:v15 file:@"SBSceneHostingDisplayController.m" lineNumber:528 description:@"this call must be made on the main thread"];
  }
  if (([*(id *)(a1 + 32) hasBeenSignalled] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 40) + 176) hasBeenSignalled] & 1) != 0)
  {
    id v2 = SBLogDisplayControlling();
    uint64_t v3 = v2;
    os_signpost_id_t v4 = *(void *)(a1 + 56);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      id v5 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 40) + 8), *(void **)(a1 + 40));
      *(_DWORD *)buf = 138543362;
      int v23 = v5;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v3, OS_SIGNPOST_INTERVAL_END, v4, "SBSceneHostingDisplayController:Presentation", "FAILED; reason: stale after updateTransforms; %{public}@",
        buf,
        0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 160), *(id *)(*(void *)(a1 + 40) + 152));
    uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 144) transitionAssertionWithReason:0];
    [*(id *)(a1 + 40) _updateBlankingWindowIfNecessary];
    [*(id *)(a1 + 40) _updateLayoutPublisherIfNecessary];
    [*(id *)(a1 + 40) _updatePresentationBinderIfNecessary];
    uint64_t v6 = [*(id *)(a1 + 40) _createDisplayAssertionPreferences];
    uint64_t v7 = *(void *)(a1 + 40);
    double v8 = *(void **)(v7 + 112);
    *(void *)(v7 + 112) = v6;

    [*(id *)(*(void *)(a1 + 40) + 104) updateWithPreferences:*(void *)(*(void *)(a1 + 40) + 112)];
    if ([*(id *)(a1 + 32) hasBeenSignalled])
    {
      [v3 invalidate];
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_3;
      v16[3] = &unk_1E6AF7720;
      long long v9 = *(void **)(a1 + 40);
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      id v17 = v10;
      uint64_t v18 = v11;
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v20 = v12;
      uint64_t v21 = v13;
      uint64_t v3 = v3;
      double v19 = v3;
      [v9 _updatePolicyForPresentation:v16];
    }
  }
}

uint64_t __77__SBSceneHostingDisplayController__enqueueEvaluateAndApplyPresentationUpdate__block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController _enqueueEvaluateAndApplyPresentationUpdate]_block_invoke_3"];
    [v11 handleFailureInFunction:v12 file:@"SBSceneHostingDisplayController.m" lineNumber:547 description:@"this call must be made on the main thread"];
  }
  if (([*(id *)(a1 + 32) hasBeenSignalled] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 40) + 176) hasBeenSignalled] & 1) != 0)
  {
    id v2 = SBLogDisplayControlling();
    uint64_t v3 = v2;
    os_signpost_id_t v4 = *(void *)(a1 + 64);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      id v5 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 40) + 8), *(void **)(a1 + 40));
      int v13 = 138543362;
      CGFloat v14 = v5;
      uint64_t v6 = "FAILED; reason: stale after policy; %{public}@";
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v3, OS_SIGNPOST_INTERVAL_END, v4, "SBSceneHostingDisplayController:Presentation", v6, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = SBLogDisplayControlling();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 40) + 8), *(void **)(a1 + 40));
      int v13 = 138543362;
      CGFloat v14 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ god's in his heaven and all is right with the world. sending blanking window back-most just in case", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 40) _sendBlankingWindowToFront:0];
    long long v9 = SBLogDisplayControlling();
    uint64_t v3 = v9;
    os_signpost_id_t v4 = *(void *)(a1 + 64);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      id v5 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 40) + 8), *(void **)(a1 + 40));
      int v13 = 138543362;
      CGFloat v14 = v5;
      uint64_t v6 = "SUCCESS; %{public}@";
      goto LABEL_13;
    }
  }

  return [*(id *)(a1 + 48) invalidate];
}

- (id)_createUpdateTransactionWithLabel:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  updateTransactionInvalidator = self->_updateTransactionInvalidator;
  id v6 = a3;
  [(BSAtomicSignal *)updateTransactionInvalidator signal];
  uint64_t v7 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E4F4F690]);
  double v8 = self->_updateTransactionInvalidator;
  self->_updateTransactionInvalidator = v7;

  long long v9 = v7;
  id v10 = self->_displayDisconnectedSignal;
  uint64_t v11 = SBLogDisplayControlling();
  if (os_signpost_enabled(v11))
  {
    uint64_t v12 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v12;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_UPDATE_TX", "%{public}@", buf, 0xCu);
  }
  id v13 = objc_alloc(MEMORY[0x1E4F4F6C0]);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __69__SBSceneHostingDisplayController__createUpdateTransactionWithLabel___block_invoke;
  uint64_t v21 = &unk_1E6AF7770;
  uint64_t v22 = v9;
  int v23 = v10;
  uint64_t v24 = self;
  SEL v25 = a2;
  CGFloat v14 = v10;
  uint64_t v15 = v9;
  CGFloat v16 = (void *)[v13 initWithBlock:&v18];
  objc_msgSend(v16, "setDebugName:", v6, v18, v19, v20, v21);

  return v16;
}

void __69__SBSceneHostingDisplayController__createUpdateTransactionWithLabel___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1E4F29060];
  uint64_t v7 = a3;
  if (([v6 isMainThread] & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v16 = [NSString stringWithUTF8String:"-[SBSceneHostingDisplayController _createUpdateTransactionWithLabel:]_block_invoke"];
    [v15 handleFailureInFunction:v16 file:@"SBSceneHostingDisplayController.m" lineNumber:584 description:@"this call must be made on the main thread"];
  }
  if ([a1[4] hasBeenSignalled] & 1) != 0 || (objc_msgSend(a1[5], "hasBeenSignalled"))
  {
    double v8 = SBLogDisplayControlling();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = _SBDisplayControllerLoggingProem(*((void **)a1[6] + 1), a1[6]);
      int v17 = 138543362;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping obselete update transaction", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    [*((id *)a1[6] + 3) displayController:a1[6] didBeginTransaction:v5 sceneManager:*((void *)a1[6] + 9) displayConfiguration:*((void *)a1[6] + 20) deactivationReasons:*((void *)a1[6] + 15)];
    uint64_t v10 = [a1[6] _createDisplayAssertionPreferences];
    uint64_t v11 = a1[6];
    uint64_t v12 = (void *)v11[14];
    v11[14] = v10;

    [*((id *)a1[6] + 13) updateWithPreferences:*((void *)a1[6] + 14)];
    [a1[6] _enqueueEvaluateAndApplyPresentationUpdate];
  }
  v7[2](v7, 1);

  id v13 = SBLogDisplayControlling();
  if (os_signpost_enabled(v13))
  {
    CGFloat v14 = _SBDisplayControllerLoggingProem(*((void **)a1[6] + 1), a1[6]);
    int v17 = 138543362;
    uint64_t v18 = v14;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_UPDATE_TX", "%{public}@", (uint8_t *)&v17, 0xCu);
  }
}

- (id)_createBlankingWindowWithConfiguration:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F432D0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithDisplay:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v4 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = objc_msgSend(v6, "initWithFrame:", v8, v10, v12, v14);
  CGFloat v16 = [MEMORY[0x1E4F428B8] blackColor];
  [v15 setBackgroundColor:v16];

  [v15 setOpaque:1];
  [v15 setAutoresizingMask:18];
  id v17 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
  [v17 setView:v15];
  [v5 setRootViewController:v17];
  uint64_t v18 = [MEMORY[0x1E4F428B8] blackColor];
  [v5 setBackgroundColor:v18];

  [v5 setHidden:0];
  return v5;
}

- (void)_sendBlankingWindowToFront:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogDisplayControlling();
  BOOL v6 = os_signpost_enabled(v5);
  if (v3)
  {
    if (v6)
    {
      double v7 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      int v11 = 138543362;
      double v12 = v7;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_BLANK", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
    unint64_t v8 = 0x7FEFFFFFFFFFFFFFLL;
  }
  else
  {
    if (v6)
    {
      double v9 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      int v11 = 138543362;
      double v12 = v9;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_HOSTING_CONTROLLER_UNBLANK", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
    unint64_t v8 = 0xFFEFFFFFFFFFFFFFLL;
  }
  double v10 = *(double *)&v8;

  [(_UIRootWindow *)self->_blankingWindow setWindowLevel:v10];
}

- (id)_createPresentationBinderWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  BOOL v6 = [(FBSDisplayIdentity *)self->_displayIdentity description];
  double v7 = _SBDisplayControllerTransactionLabel(v5, v6);

  unint64_t v8 = [(UIRootSceneWindow *)[SBSceneHostingDisplayControllerRootSceneWindow alloc] initWithDisplayConfiguration:v4];
  double v9 = [[SBRootWindowScenePresentationBinder alloc] initWithIdentifier:v7 priority:-10 appearanceStyle:0 rootWindow:v8];

  return v9;
}

- (id)_createDisplayAssertionPreferences
{
  if (!self->_displayIdentity)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBSceneHostingDisplayController.m", 641, @"Invalid parameter not satisfying: %@", @"_displayIdentity" object file lineNumber description];
  }
  policy = self->_policy;
  currentConfiguration = self->_currentConfiguration;
  return (id)[(SBSceneHostingDisplayControllerPolicy *)policy assertionPreferencesForDisplay:self displayConfiguration:currentConfiguration];
}

- (void)_runRootTransaction:(id)a3 withLabel:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workspaceEventQueue = self->_workspaceEventQueue;
  double v12 = (void *)MEMORY[0x1E4F624D8];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __76__SBSceneHostingDisplayController__runRootTransaction_withLabel_completion___block_invoke;
  uint64_t v20 = &unk_1E6AF77C0;
  id v21 = v9;
  id v22 = v8;
  int v23 = self;
  id v24 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  CGFloat v16 = [v12 eventWithName:v15 handler:&v17];
  -[FBWorkspaceEventQueue executeOrAppendEvent:](workspaceEventQueue, "executeOrAppendEvent:", v16, v17, v18, v19, v20);
}

void __76__SBSceneHostingDisplayController__runRootTransaction_withLabel_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F624E8]) initWithReason:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 40));
  BOOL v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SBSceneHostingDisplayController__runRootTransaction_withLabel_completion___block_invoke_2;
  v7[3] = &unk_1E6AF7798;
  objc_copyWeak(&v10, &location);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = v4;
  void v7[4] = v5;
  id v6 = v2;
  id v8 = v6;
  [v3 setCompletionBlock:v7];
  [*(id *)(*(void *)(a1 + 48) + 48) addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) begin];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __76__SBSceneHostingDisplayController__runRootTransaction_withLabel_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = WeakRetained;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    id WeakRetained = v6;
  }
  if (WeakRetained) {
    [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v6];
  }
  [*(id *)(a1 + 40) relinquish];
}

- (void)_runRootUpdateTransactionWithLabel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSceneHostingDisplayController *)self _createUpdateTransactionWithLabel:v7];
  [(SBSceneHostingDisplayController *)self _runRootTransaction:v8 withLabel:v7 completion:v6];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBSceneHostingDisplayController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBSceneHostingDisplayController *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v5 = [(FBSDisplayIdentity *)self->_displayIdentity description];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v4;
  id v10 = v6;
  int v11 = self;
  [v6 appendBodySectionWithName:v5 multilinePrefix:0 block:v9];

  id v7 = v6;
  return v7;
}

id __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "hasControlOfDisplay"), @"hasControlOfDisplay");
  BOOL v3 = *(void **)(a1 + 40);
  if (v3[20])
  {
    id v4 = *(void **)(a1 + 32);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v23[3] = &unk_1E6AF5290;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    id v24 = v5;
    uint64_t v25 = v6;
    [v5 appendBodySectionWithName:@"FBSDisplayConfiguration" multilinePrefix:@"\t" block:v23];

    BOOL v3 = *(void **)(a1 + 40);
  }
  if (v3[16])
  {
    id v7 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    void v20[3] = &unk_1E6AF5290;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 40);
    id v21 = v8;
    uint64_t v22 = v9;
    [v8 appendBodySectionWithName:@"CADisplay" multilinePrefix:@"\t" block:v20];

    BOOL v3 = *(void **)(a1 + 40);
  }
  if (v3[12])
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    CGFloat v16 = __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_4;
    uint64_t v17 = &unk_1E6AF5290;
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 40);
    id v18 = v11;
    uint64_t v19 = v12;
    [v11 appendBodySectionWithName:@"Blanking Window" multilinePrefix:@"\t" block:&v14];

    BOOL v3 = *(void **)(a1 + 40);
  }
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v3[3], @"policy", v14, v15, v16, v17);
}

void __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 160) bounds];
  id v3 = (id)objc_msgSend(v2, "appendRect:withName:", @"bounds");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 160) pointScale];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", @"scale", 2);
  uint64_t v6 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 160) pixelSize];
  id v7 = (id)objc_msgSend(v6, "appendSize:withName:", @"pixelSize");
  id v8 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 160) overscanCompensation];
  uint64_t v9 = FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  [v8 appendString:v9 withName:@"overscanCompensation"];

  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(*(void *)(a1 + 40) + 160) currentMode];
  id v12 = (id)[v10 appendObject:v11 withName:@"currentMode"];

  id v13 = *(void **)(a1 + 32);
  id v15 = [*(id *)(*(void *)(a1 + 40) + 160) identity];
  id v14 = (id)objc_msgSend(v13, "appendUInt64:withName:", objc_msgSend(v15, "connectionSeed"), @"connectionSeed");
}

id __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 128) bounds];
  id v3 = (id)objc_msgSend(v2, "appendRect:withName:", @"bounds");
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 128) deviceName];
  [v4 appendString:v5 withName:@"deviceName"];

  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(*(void *)(a1 + 40) + 128) name];
  [v6 appendString:v7 withName:@"name"];

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 128) productName];
  [v8 appendString:v9 withName:@"productName"];

  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(*(void *)(a1 + 40) + 128) overscanAdjustment];
  [v10 appendString:v11 withName:@"overscanAdjustment"];

  id v12 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 128) logicalScale];
  id v13 = (id)objc_msgSend(v12, "appendSize:withName:", @"activeLogicalScale");
  id v14 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 128) minimumLogicalScale];
  id v15 = (id)objc_msgSend(v14, "appendDouble:withName:decimalPrecision:", @"minimumLogicalScale", 2);
  CGFloat v16 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 128) maximumLogicalScale];
  id v17 = (id)objc_msgSend(v16, "appendDouble:withName:decimalPrecision:", @"maximumLogicalScale", 2);
  id v18 = *(void **)(a1 + 32);
  uint64_t v19 = [*(id *)(*(void *)(a1 + 40) + 128) transportType];
  [v18 appendString:v19 withName:@"transportType"];

  uint64_t v20 = [*(id *)(*(void *)(a1 + 40) + 128) displayType];
  id v21 = (id)[*(id *)(a1 + 32) appendBool:v20 == 2 withName:@"isWireless"];
  id v22 = (id)[*(id *)(a1 + 32) appendInteger:v20 withName:@"displayType"];
  int v23 = *(void **)(a1 + 32);
  id v24 = [*(id *)(*(void *)(a1 + 40) + 128) currentMode];
  id v25 = (id)[v23 appendObject:v24 withName:@"currentMode"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 128), "seed"), @"seed");
}

id __73__SBSceneHostingDisplayController_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 96) frame];
  id v3 = (id)objc_msgSend(v2, "appendRect:withName:", @"frame");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 96) windowLevel];
  return (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", @"windowLevel", 0);
}

- (id)signpostDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@:%p %@:%p>", v4, self, objc_opt_class(), self->_policy];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDisconnectedSignal, 0);
  objc_storeStrong((id *)&self->_presentationUpdateInvalidationSignal, 0);
  objc_storeStrong((id *)&self->_presentedConfiguration, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_layoutPublisher, 0);
  objc_storeStrong((id *)&self->_displayMutationQueue, 0);
  objc_storeStrong((id *)&self->_caDisplay, 0);
  objc_storeStrong((id *)&self->_currentDisplayAssertionPreferences, 0);
  objc_storeStrong((id *)&self->_displayAssertion, 0);
  objc_storeStrong((id *)&self->_blankingWindow, 0);
  objc_storeStrong((id *)&self->_readyToTransformDisplaysSignal, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_updateTransactionInvalidator, 0);
  objc_storeStrong((id *)&self->_pendingWork, 0);
  objc_storeStrong((id *)&self->_workspaceEventQueue, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

- (void)displayIdentityDidUpdate:(NSObject *)a3 configuration:.cold.1(void **a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _SBDisplayControllerLoggingProem(a1[1], a1);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ ignoring update", (uint8_t *)&v5, 0xCu);
}

@end