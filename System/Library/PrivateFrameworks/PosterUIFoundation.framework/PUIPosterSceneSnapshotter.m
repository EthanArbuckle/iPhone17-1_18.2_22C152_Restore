@interface PUIPosterSceneSnapshotter
+ (id)fileIOQueue;
+ (void)teardownScene:(id)a3 sceneWasDeactivated:(BOOL)a4;
- (FBScene)scene;
- (NSString)logIdentifier;
- (PFPosterExtensionInstance)extensionInstance;
- (PUIPosterSceneSnapshotter)initWithExtensionInstance:(id)a3 snapshotInfo:(id)a4;
- (PUIPosterSceneSnapshotterDelegate)delegate;
- (PUIPosterSceneSnapshotterInfo)snapshotInfo;
- (id)scene:(id)a3 handleActions:(id)a4;
- (void)_activateTimeoutTimer;
- (void)_mainQueue_captureSnapshotWithScene:(id)a3;
- (void)_mainQueue_finishWithError:(id)a3 result:(id)a4;
- (void)_mainQueue_setupScene;
- (void)_teardownScene:(BOOL)a3;
- (void)dealloc;
- (void)fireSceneDeactivationErrorForTesting:(id)a3;
- (void)invalidate;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setScene:(id)a3;
- (void)setSnapshotInfo:(id)a3;
- (void)start;
@end

@implementation PUIPosterSceneSnapshotter

+ (id)fileIOQueue
{
  if (fileIOQueue_onceToken != -1) {
    dispatch_once(&fileIOQueue_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)fileIOQueue_fileIOQueue;
  return v2;
}

void __40__PUIPosterSceneSnapshotter_fileIOQueue__block_invoke()
{
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = BSDispatchQueueCreateWithAttributes();
  v1 = (void *)fileIOQueue_fileIOQueue;
  fileIOQueue_fileIOQueue = v0;
}

- (void)dealloc
{
  [(BSContinuousMachTimer *)self->_timeoutTimer invalidate];
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

  [(PUIPosterSceneSnapshotter *)self _teardownScene:0];
  v4.receiver = self;
  v4.super_class = (Class)PUIPosterSceneSnapshotter;
  [(PUIPosterSceneSnapshotter *)&v4 dealloc];
}

- (PUIPosterSceneSnapshotter)initWithExtensionInstance:(id)a3 snapshotInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  NSClassFromString(&cfstr_Pfposterextens.isa);
  if (!v9)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSceneSnapshotter initWithExtensionInstance:snapshotInfo:]();
    }
LABEL_15:
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0F7464);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFPosterExtensionInstanceClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSceneSnapshotter initWithExtensionInstance:snapshotInfo:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0F74C8);
  }

  v10 = [MEMORY[0x263F29BE0] tokenForCurrentProcess];
  v11 = [v10 valueForEntitlement:@"com.apple.runningboard.posterkit.host"];
  char v12 = [v11 BOOLValue];

  if ((v12 & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Remote snapshotting requires runningboard posterkit host entitlement"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSceneSnapshotter initWithExtensionInstance:snapshotInfo:]((uint64_t)v22);
    }
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)PUIPosterSceneSnapshotter;
  v13 = [(PUIPosterSceneSnapshotter *)&v24 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extensionInstance, a3);
    objc_storeStrong((id *)&v14->_snapshotInfo, a4);
    uint64_t v15 = [objc_alloc(MEMORY[0x263F29BD0]) initWithFlag:0];
    invalidationFlag = v14->_invalidationFlag;
    v14->_invalidationFlag = (BSAtomicFlag *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263F29BD0]) initWithFlag:0];
    isSnapshottingFlag = v14->_isSnapshottingFlag;
    v14->_isSnapshottingFlag = (BSAtomicFlag *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x263F29BD0]) initWithFlag:0];
    isCompleteFlag = v14->_isCompleteFlag;
    v14->_isCompleteFlag = (BSAtomicFlag *)v19;
  }
  return v14;
}

- (NSString)logIdentifier
{
  return (NSString *)[(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo logIdentifier];
}

- (void)start
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__PUIPosterSceneSnapshotter_start__block_invoke;
  block[3] = &unk_265470EC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __34__PUIPosterSceneSnapshotter_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_setupScene");
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = PUILogSnapshotter();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo logIdentifier];
      int v11 = 138543874;
      char v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_error_impl(&dword_25A0AF000, v9, OS_LOG_TYPE_ERROR, "(%{public}@) sceneWillDeactivate:'%@' withError:'%@'", (uint8_t *)&v11, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo logIdentifier];
    int v11 = 138543874;
    char v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = 0;
    _os_log_impl(&dword_25A0AF000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) sceneWillDeactivate:'%@' withError:'%@'", (uint8_t *)&v11, 0x20u);
    goto LABEL_6;
  }

  [(PUIPosterSceneSnapshotter *)self _mainQueue_finishWithError:v7 result:0];
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PUILogSnapshotter();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo logIdentifier];
    int v7 = 138543618;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_25A0AF000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) sceneContentStateDidChange:'%@'", (uint8_t *)&v7, 0x16u);
  }
  [(PUIPosterSceneSnapshotter *)self _mainQueue_captureSnapshotWithScene:v4];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8 = a3;
  if (objc_msgSend(a4, "pui_extendedRenderSessionDidChange")) {
    [(PUIPosterSceneSnapshotter *)self _mainQueue_captureSnapshotWithScene:v8];
  }
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v6 = a4;
  int v7 = PUILogSnapshotter();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo logIdentifier];
    *(_DWORD *)buf = 138543618;
    v30 = v8;
    __int16 v31 = 2114;
    id v32 = v6;
    _os_log_impl(&dword_25A0AF000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Received actions: %{public}@", buf, 0x16u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    __int16 v13 = 0;
    uint64_t v14 = *(void *)v25;
    *(void *)&long long v11 = 138543362;
    long long v22 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v9);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v17 = self;
        if (objc_opt_isKindOfClass())
        {
          int v18 = [v16 isValid];

          if (v18)
          {
            uint64_t v19 = PUILogSnapshotter();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo logIdentifier];
              *(_DWORD *)buf = v22;
              v30 = v20;
              _os_log_impl(&dword_25A0AF000, v19, OS_LOG_TYPE_DEFAULT, "(%{public}@) Complication rendering complete", buf, 0xCu);
            }
            self->_mainQueue_complicationRenderingCompleted = 1;
            [(PUIPosterSceneSnapshotter *)self _mainQueue_captureSnapshotWithScene:v23];
            if (!v13) {
              __int16 v13 = objc_opt_new();
            }
            objc_msgSend(v13, "addObject:", v16, v22);
          }
        }
        else
        {
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }
  else
  {
    __int16 v13 = 0;
  }

  return v13;
}

- (void)sceneDidInvalidate:(id)a3
{
  objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PUIPosterSceneSnapshotter *)self _mainQueue_finishWithError:v4 result:0];
}

- (void)_mainQueue_captureSnapshotWithScene:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = [(id)objc_opt_class() fileIOQueue];
  id v6 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo logIdentifier];
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    int v7 = PUILogSnapshotter();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      id v8 = "(%{public}@) Aborting capture, Invalidated";
LABEL_10:
      _os_log_impl(&dword_25A0AF000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
    }
  }
  else if ([v4 contentState] == 2)
  {
    id v9 = [v4 clientSettings];
    int v10 = objc_msgSend(v9, "pui_inExtendedRenderSession");

    if (!v10)
    {
      if (self->_mainQueue_complicationRenderingCompleted || !self->_mainQueue_shouldWaitForComplicationRendering)
      {
        long long v11 = PUILogSnapshotter();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v23 = v6;
          _os_log_impl(&dword_25A0AF000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshot is capturing", buf, 0xCu);
        }

        double mainQueue_startTime = self->_mainQueue_startTime;
        if ([(BSAtomicFlag *)self->_isSnapshottingFlag setFlag:1])
        {
          __int16 v13 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo request];
          uint64_t v14 = [v13 snapshotLevelSets];
          __int16 v15 = [v13 legibilityProcessingRequest];
          uint64_t v16 = [v15 determineColorStatistics];
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __65__PUIPosterSceneSnapshotter__mainQueue_captureSnapshotWithScene___block_invoke;
          v17[3] = &unk_265471D48;
          id v18 = v6;
          id v19 = v13;
          double v21 = mainQueue_startTime;
          v20 = self;
          int v7 = v13;
          objc_msgSend(v4, "pui_executeSnapshotForLevelSets:determineColorStatistics:onQueue:completion:", v14, v16, v5, v17);

          goto LABEL_11;
        }
        int v7 = PUILogSnapshotter();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_11;
        }
        *(_DWORD *)buf = 138543362;
        id v23 = v6;
        id v8 = "(%{public}@) Ignoring capture, ~already~ capturing snapshots";
      }
      else
      {
        int v7 = PUILogSnapshotter();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_11;
        }
        *(_DWORD *)buf = 138543362;
        id v23 = v6;
        id v8 = "(%{public}@) Deferring capture, complication rendering not completed";
      }
      goto LABEL_10;
    }
    int v7 = PUILogSnapshotter();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      id v8 = "(%{public}@) Deferring capture, scene is in extended render session";
      goto LABEL_10;
    }
  }
  else
  {
    int v7 = PUILogSnapshotter();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      id v8 = "(%{public}@) Deferring capture, Scene content state not ready";
      goto LABEL_10;
    }
  }
LABEL_11:
}

void __65__PUIPosterSceneSnapshotter__mainQueue_captureSnapshotWithScene___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  id v9 = PUILogSnapshotter();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v10;
    _os_log_impl(&dword_25A0AF000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshot captured", buf, 0xCu);
  }

  if (v6)
  {
    long long v11 = [[PUIPosterSnapshotterResult alloc] initWithRequest:*(void *)(a1 + 40) snapshotBundleBuilder:v6 executionTime:Current - *(double *)(a1 + 56)];
    id v22 = 0;
    [(PUIPosterSnapshotterResult *)v11 finalizeWithError:&v22];
    id v12 = v22;
  }
  else
  {
    long long v11 = 0;
    id v12 = 0;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__PUIPosterSceneSnapshotter__mainQueue_captureSnapshotWithScene___block_invoke_29;
  v17[3] = &unk_265471D20;
  uint64_t v13 = *(void *)(a1 + 48);
  double v21 = Current;
  void v17[4] = v13;
  id v18 = v12;
  id v19 = v7;
  v20 = v11;
  uint64_t v14 = v11;
  id v15 = v7;
  id v16 = v12;
  dispatch_async(MEMORY[0x263EF83A0], v17);
}

uint64_t __65__PUIPosterSceneSnapshotter__mainQueue_captureSnapshotWithScene___block_invoke_29(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 64);
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1) {
    uint64_t v1 = *(void *)(a1 + 48);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_finishWithError:result:", v1, *(void *)(a1 + 56));
}

- (void)_teardownScene:(BOOL)a3
{
  BOOL v3 = a3;
  mainQueue_scene = self->_mainQueue_scene;
  self->_mainQueue_scene = 0;
  v5 = mainQueue_scene;

  [(id)objc_opt_class() teardownScene:v5 sceneWasDeactivated:v3];
}

+ (void)teardownScene:(id)a3 sceneWasDeactivated:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  BSDispatchMain();
}

void *__63__PUIPosterSceneSnapshotter_teardownScene_sceneWasDeactivated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  result = *(void **)(a1 + 32);
  if (result && !*(unsigned char *)(a1 + 40))
  {
    return objc_msgSend(result, "pui_invalidateWithCompletion:", 0);
  }
  return result;
}

- (void)_mainQueue_setupScene
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __50__PUIPosterSceneSnapshotter__mainQueue_setupScene__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__PUIPosterSceneSnapshotter__mainQueue_setupScene__block_invoke_2;
  v3[3] = &unk_265471D70;
  id v4 = *(id *)(a1 + 32);
  [a2 updateSettingsWithBlock:v3];
}

void __50__PUIPosterSceneSnapshotter__mainQueue_setupScene__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "pui_setSnapshot:", 1);
  id v4 = [*(id *)(a1 + 32) otherSettings];
  objc_msgSend(v3, "pui_applyOtherSettings:", v4);

  id v5 = *(id *)(a1 + 32);
  id v6 = v3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v7 = (void (*)(id, id))getFBSceneSettingsApplyPRSceneSettingsSymbolLoc_ptr;
  id v22 = getFBSceneSettingsApplyPRSceneSettingsSymbolLoc_ptr;
  if (!getFBSceneSettingsApplyPRSceneSettingsSymbolLoc_ptr)
  {
    uint64_t v8 = (void *)PosterKitLibrary_0();
    v20[3] = (uint64_t)dlsym(v8, "FBSceneSettingsApplyPRSceneSettings");
    getFBSceneSettingsApplyPRSceneSettingsSymbolLoc_ptr = (_UNKNOWN *)v20[3];
    uint64_t v7 = (void (*)(id, id))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v7)
  {
    __50__PUIPosterSceneSnapshotter__mainQueue_setupScene__block_invoke_2_cold_1();
LABEL_12:
    __50__PUIPosterSceneSnapshotter__mainQueue_setupScene__block_invoke_2_cold_1();
    goto LABEL_13;
  }
  v7(v5, v6);

  id v9 = *(id *)(a1 + 32);
  id v10 = v6;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  long long v11 = (void (*)(id, id))getFBSceneSettingsApplyPRRenderingSceneSettingsSymbolLoc_ptr;
  id v22 = getFBSceneSettingsApplyPRRenderingSceneSettingsSymbolLoc_ptr;
  if (!getFBSceneSettingsApplyPRRenderingSceneSettingsSymbolLoc_ptr)
  {
    id v12 = (void *)PosterKitLibrary_0();
    v20[3] = (uint64_t)dlsym(v12, "FBSceneSettingsApplyPRRenderingSceneSettings");
    getFBSceneSettingsApplyPRRenderingSceneSettingsSymbolLoc_ptr = (_UNKNOWN *)v20[3];
    long long v11 = (void (*)(id, id))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v11) {
    goto LABEL_12;
  }
  v11(v9, v10);

  id v13 = *(id *)(a1 + 32);
  id v14 = v10;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v15 = (void (*)(id, id))getFBSceneSettingsApplyAMUIAmbientPresentationSettingsSymbolLoc_ptr;
  id v22 = getFBSceneSettingsApplyAMUIAmbientPresentationSettingsSymbolLoc_ptr;
  if (!getFBSceneSettingsApplyAMUIAmbientPresentationSettingsSymbolLoc_ptr)
  {
    id v16 = (void *)PosterKitLibrary_0();
    v20[3] = (uint64_t)dlsym(v16, "FBSceneSettingsApplyAMUIAmbientPresentationSettings");
    getFBSceneSettingsApplyAMUIAmbientPresentationSettingsSymbolLoc_ptr = (_UNKNOWN *)v20[3];
    id v15 = (void (*)(id, id))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v15)
  {
LABEL_13:
    id v18 = (_Unwind_Exception *)__50__PUIPosterSceneSnapshotter__mainQueue_setupScene__block_invoke_2_cold_1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v18);
  }
  v15(v13, v14);

  [*(id *)(a1 + 32) frame];
  objc_msgSend(v14, "setFrame:");
  uint64_t v17 = [*(id *)(a1 + 32) displayConfiguration];
  [v14 setDisplayConfiguration:v17];

  objc_msgSend(v14, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));
  [v14 setForeground:1];
}

- (void)_activateTimeoutTimer
{
  id v3 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo request];
  [v3 timeoutInterval];
  double v5 = v4;

  if (v5 > 0.0)
  {
    objc_initWeak(&location, self);
    id v6 = objc_alloc(MEMORY[0x263F29C20]);
    uint64_t v7 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo logIdentifier];
    uint64_t v8 = [@"Timeout timer for " stringByAppendingString:v7];
    id v9 = (BSContinuousMachTimer *)[v6 initWithIdentifier:v8];
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v9;

    long long v11 = self->_timeoutTimer;
    uint64_t v12 = MEMORY[0x263EF83A0];
    id v13 = MEMORY[0x263EF83A0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __50__PUIPosterSceneSnapshotter__activateTimeoutTimer__block_invoke;
    v14[3] = &unk_265471DC0;
    objc_copyWeak(&v15, &location);
    [(BSContinuousMachTimer *)v11 scheduleWithFireInterval:v12 leewayInterval:v14 queue:v5 handler:5.0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __50__PUIPosterSceneSnapshotter__activateTimeoutTimer__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained[6] getFlag])
    {
      id v3 = PUILogSnapshotter();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __50__PUIPosterSceneSnapshotter__activateTimeoutTimer__block_invoke_cold_1((uint64_t)v2);
      }
    }
    else
    {
      id v3 = objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 8);
      objc_msgSend(v2, "_mainQueue_finishWithError:result:", v3, 0);
    }
  }
}

- (void)_mainQueue_finishWithError:(id)a3 result:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  uint64_t v8 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo logIdentifier];
  if ([(BSAtomicFlag *)self->_isCompleteFlag setFlag:1])
  {
    if (self->_mainQueue_endTime != 0.0) {
      self->_mainQueue_endTime = CFAbsoluteTimeGetCurrent();
    }
    [(BSContinuousMachTimer *)self->_timeoutTimer invalidate];
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;

    id v10 = PUILogSnapshotter();
    long long v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        double v12 = self->_mainQueue_endTime - self->_mainQueue_startTime;
        int v17 = 138544130;
        id v18 = v8;
        __int16 v19 = 2114;
        id v20 = v6;
        __int16 v21 = 2112;
        id v22 = v7;
        __int16 v23 = 2048;
        double v24 = v12;
        _os_log_error_impl(&dword_25A0AF000, v11, OS_LOG_TYPE_ERROR, "(%{public}@) _mainQueue_finishWithError:'%{public}@' result:'%@'; runtime: %f",
          (uint8_t *)&v17,
          0x2Au);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = self->_mainQueue_endTime - self->_mainQueue_startTime;
      int v17 = 138544130;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = 0;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2048;
      double v24 = v14;
      _os_log_impl(&dword_25A0AF000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) _mainQueue_finishWithError:'%{public}@' result:'%@'; runtime: %f",
        (uint8_t *)&v17,
        0x2Au);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sceneSnapshotterDidFinish:self result:v7 error:v6];

    [(PUIPosterSceneSnapshotter *)self _teardownScene:v6 != 0];
    id v16 = PUILogSnapshotter();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v8;
      _os_log_impl(&dword_25A0AF000, v16, OS_LOG_TYPE_DEFAULT, "(%{public}@) scene torn down", (uint8_t *)&v17, 0xCu);
    }

    snapshotInfo = self->_snapshotInfo;
    self->_snapshotInfo = 0;
  }
  else
  {
    snapshotInfo = PUILogSnapshotter();
    if (os_log_type_enabled(snapshotInfo, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSceneSnapshotter _mainQueue_finishWithError:result:]();
    }
  }
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (([(BSAtomicFlag *)self->_isCompleteFlag getFlag] & 1) == 0
    && [(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    id v3 = PUILogSnapshotter();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double v4 = [(PUIPosterSceneSnapshotterInfo *)self->_snapshotInfo logIdentifier];
      *(_DWORD *)buf = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_25A0AF000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) PUIPosterSceneSnapshotter invalidated", buf, 0xCu);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__PUIPosterSceneSnapshotter_invalidate__block_invoke;
    block[3] = &unk_265470EC8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __39__PUIPosterSceneSnapshotter_invalidate__block_invoke(uint64_t a1)
{
  SEL v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_mainQueue_finishWithError:result:", v2, 0);
}

- (void)fireSceneDeactivationErrorForTesting:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x25A2F5BF0]("-[PUIPosterSceneSnapshotter fireSceneDeactivationErrorForTesting:]"))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__PUIPosterSceneSnapshotter_fireSceneDeactivationErrorForTesting___block_invoke;
    block[3] = &unk_265471108;
    block[4] = self;
    id v8 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_BSIsInternalInstall(__PRETTY_FUNCTION__)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSceneSnapshotter fireSceneDeactivationErrorForTesting:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __66__PUIPosterSceneSnapshotter_fireSceneDeactivationErrorForTesting___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sceneWillDeactivate:*(void *)(*(void *)(a1 + 32) + 16) withError:*(void *)(a1 + 40)];
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (PUIPosterSceneSnapshotterInfo)snapshotInfo
{
  return self->_snapshotInfo;
}

- (void)setSnapshotInfo:(id)a3
{
}

- (PUIPosterSceneSnapshotterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUIPosterSceneSnapshotterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotInfo, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_storeStrong((id *)&self->_isCompleteFlag, 0);
  objc_storeStrong((id *)&self->_isSnapshottingFlag, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_mainQueue_scene, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

- (void)initWithExtensionInstance:snapshotInfo:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionInstance:(uint64_t)a1 snapshotInfo:.cold.2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = [NSString stringWithUTF8String:"-[PUIPosterSceneSnapshotter initWithExtensionInstance:snapshotInfo:]"];
  OUTLINED_FUNCTION_5_0();
  __int16 v4 = 2114;
  uint64_t v5 = @"PUIPosterSceneSnapshotter.m";
  __int16 v6 = 1024;
  int v7 = 86;
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_25A0AF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v3, 0x26u);
}

uint64_t __50__PUIPosterSceneSnapshotter__mainQueue_setupScene__block_invoke_2_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __50__PUIPosterSceneSnapshotter__activateTimeoutTimer__block_invoke_cold_1(v0);
}

void __50__PUIPosterSceneSnapshotter__activateTimeoutTimer__block_invoke_cold_1(uint64_t a1)
{
  SEL v1 = [*(id *)(a1 + 80) logIdentifier];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_25A0AF000, v2, v3, "(%{public}@) Timeout timer fired but snapshot is no longer active", v4, v5, v6, v7, v8);
}

- (void)_mainQueue_finishWithError:result:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_25A0AF000, v0, OS_LOG_TYPE_ERROR, "(%{public}@) _mainQueue_finishWithError: Called on already-complete snapshot session", v1, 0xCu);
}

- (void)fireSceneDeactivationErrorForTesting:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end