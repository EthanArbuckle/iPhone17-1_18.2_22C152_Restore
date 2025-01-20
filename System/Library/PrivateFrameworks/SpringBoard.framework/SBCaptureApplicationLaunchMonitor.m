@interface SBCaptureApplicationLaunchMonitor
+ (id)TCCServer;
- (BOOL)_hasCaptureApplicationRequirements;
- (BOOL)_isCaptureApplicationLaunchMonitorIgnored;
- (BOOL)_isViewfinderSessionAuditTokenMatching:(id)a3;
- (BOOL)_updateSceneReadyStatusForReason:(id)a3;
- (BOOL)hasCameraCaptureButtonConfiguration;
- (BOOL)hasTCCAccess;
- (BOOL)isCameraInUse;
- (FBScene)scene;
- (SBCameraViewfinderMonitoring)viewfinderMonitoringToken;
- (SBCaptureApplicationLaunchMonitor)initWithScene:(id)a3 delegate:(id)a4;
- (SBFCaptureApplicationLaunchMonitorDelegate)delegate;
- (id)_unmetReason;
- (void)_cameraViewfinderMonitorSessionDetected:(id)a3 auditToken:(id)a4;
- (void)_checkAllRequirementsForScene:(id)a3;
- (void)_checkForButtonConfiguration:(id)a3;
- (void)_checkForCameraInUse;
- (void)_checkForTCCAccess;
- (void)_publishLaunchRequirementsIfNeededForScene:(id)a3 forced:(BOOL)a4;
- (void)_updateMonitorTimerIfNeeded;
- (void)cameraViewfinderMonitorSessionDidBegin:(id)a3 auditToken:(id)a4;
- (void)cameraViewfinderMonitorSessionWillBegin:(id)a3 auditToken:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)setHasCameraCaptureButtonConfiguration:(BOOL)a3;
- (void)setHasTCCAccess:(BOOL)a3;
- (void)setIsCameraInUse:(BOOL)a3;
- (void)setViewfinderMonitoringToken:(id)a3;
- (void)start;
@end

@implementation SBCaptureApplicationLaunchMonitor

- (SBCaptureApplicationLaunchMonitor)initWithScene:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBCaptureApplicationLaunchMonitor;
  v9 = [(SBCaptureApplicationLaunchMonitor *)&v23 init];
  if (v9)
  {
    id v10 = v7;
    if (v10)
    {
      v11 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = NSString;
        v18 = (objc_class *)[v11 classForCoder];
        if (!v18) {
          v18 = (objc_class *)objc_opt_class();
        }
        v19 = NSStringFromClass(v18);
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        v22 = [v17 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"scene", v19, v21];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[SBCaptureApplicationLaunchMonitor initWithScene:delegate:]();
        }
        [v22 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D88EA678);
      }

      if (v8)
      {
        objc_storeStrong((id *)&v9->_scene, a3);
        objc_storeWeak((id *)&v9->_delegate, v8);
        goto LABEL_6;
      }
      v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"delegate != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBCaptureApplicationLaunchMonitor initWithScene:delegate:]();
      }
    }
    else
    {
      v13 = NSString;
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      v16 = [v13 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"scene", v15];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBCaptureApplicationLaunchMonitor initWithScene:delegate:]();
      }
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D88EA5D0);
  }
LABEL_6:

  return v9;
}

- (void)invalidate
{
  if (self->_scene)
  {
    [(SBCaptureApplicationLaunchMonitor *)self cancel];
    scene = self->_scene;
    self->_scene = 0;

    objc_storeWeak((id *)&self->_delegate, 0);
  }
}

- (void)cancel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = SBLogCaptureApplication();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(FBScene *)self->_scene clientHandle];
    v5 = [v4 bundleIdentifier];
    int v11 = 134218242;
    v12 = self;
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "CALM %p stop observing %{public}@", (uint8_t *)&v11, 0x16u);
  }
  v6 = self->_scene;
  [(FBScene *)v6 removeObserver:self];
  monitorTimer = self->_monitorTimer;
  if (monitorTimer)
  {
    [(BSAbsoluteMachTimer *)monitorTimer invalidate];
    id v8 = self->_monitorTimer;
    self->_monitorTimer = 0;
  }
  viewfinderMonitoringToken = self->_viewfinderMonitoringToken;
  if (viewfinderMonitoringToken)
  {
    [(SBCameraViewfinderMonitoring *)viewfinderMonitoringToken cancel];
    id v10 = self->_viewfinderMonitoringToken;
    self->_viewfinderMonitoringToken = 0;
  }
  *(_WORD *)&self->_isCameraInUse = 0;
  *(_DWORD *)&self->_launchRequirementsPublished = 0;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)start
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (BOOL)_updateSceneReadyStatusForReason:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_scene;
  uint64_t v6 = [(FBScene *)v5 contentState];
  uint64_t v7 = [(FBScene *)v5 settings];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [v11 deactivationReasons];
  BOOL v14 = v6 == 2 && v12 == 0;
  uint64_t v15 = SBLogCaptureApplication();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(FBScene *)v5 clientHandle];
    v17 = [v16 bundleIdentifier];
    v18 = NSStringFromFBSceneContentState();
    int v21 = 134219266;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2114;
    v26 = v17;
    __int16 v27 = 1024;
    BOOL v28 = v14;
    __int16 v29 = 2114;
    v30 = v18;
    __int16 v31 = 2048;
    uint64_t v32 = v12;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "CALM %p updateSceneReadyStatus(%@) %{public}@ active:%{BOOL}u contentState:%{public}@ deactivationReasons:%lX", (uint8_t *)&v21, 0x3Au);
  }
  if (self->_sceneIsReadyForWatchdogging == v14 && self->_firstReadyStatusUpdateComplete)
  {
    BOOL v19 = 0;
  }
  else
  {
    BOOL v19 = 1;
    self->_firstReadyStatusUpdateComplete = 1;
    self->_sceneIsReadyForWatchdogging = v14;
  }

  return v19;
}

- (BOOL)_isCaptureApplicationLaunchMonitorIgnored
{
  v2 = +[SBDefaults localDefaults];
  v3 = [v2 captureApplicationDefaults];
  char v4 = [v3 ignoreCaptureApplicationLaunchMonitor];

  return v4;
}

- (BOOL)_isViewfinderSessionAuditTokenMatching:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBScene *)self->_scene clientHandle];
  uint64_t v6 = [v5 processHandle];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F4F6A8];
    [v6 auditToken];
    id v9 = [v8 tokenFromAuditToken:&v12];
    char v10 = [v9 isEqual:v4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)_checkForButtonConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_hasCameraCaptureButtonConfiguration)
  {
    id v4 = [a3 clientSettings];
    uint64_t v5 = [v4 physicalButtonConfigurations];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_behavior", (void)v11))
          {
            self->_hasCameraCaptureButtonConfiguration = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

+ (id)TCCServer
{
  if (TCCServer_onceToken != -1) {
    dispatch_once(&TCCServer_onceToken, &__block_literal_global_101);
  }
  v2 = (void *)TCCServer_tccServer;
  return v2;
}

void __46__SBCaptureApplicationLaunchMonitor_TCCServer__block_invoke()
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.springboard.capture.tccserver", 0);
  uint64_t v0 = tcc_server_create();
  SEL v1 = (void *)TCCServer_tccServer;
  TCCServer_tccServer = v0;
}

- (void)_checkForTCCAccess
{
  if (!self->_hasTCCAccess)
  {
    v3 = [(FBScene *)self->_scene clientHandle];
    id v4 = [v3 processHandle];
    uint64_t v5 = v4;
    if (v4)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      [v4 auditToken];
      id v6 = tcc_service_singleton_for_CF_name();
      uint64_t v7 = (void *)tcc_credential_create_for_process_with_audit_token();
      uint64_t v8 = (void *)tcc_message_options_create();
      tcc_message_options_set_reply_handler_policy();
      tcc_message_options_set_request_prompt_policy();
      uint64_t v10 = 0;
      long long v11 = &v10;
      long long v12 = 0x2020000000uLL;
      uint64_t v9 = [(id)objc_opt_class() TCCServer];
      tcc_server_message_request_authorization();

      self->_hasTCCAccess = v11[3] == 2;
      _Block_object_dispose(&v10, 8);
    }
  }
}

uint64_t __55__SBCaptureApplicationLaunchMonitor__checkForTCCAccess__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3)
    {
      uint64_t v3 = result;
      result = tcc_authorization_record_get_authorization_right();
      *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

- (void)_checkForCameraInUse
{
  if (!self->_isCameraInUse)
  {
    uint64_t v3 = [(SBCameraViewfinderMonitoring *)self->_viewfinderMonitoringToken auditTokenForProcessWithActiveOrImminentViewfinderSession];
    BOOL v4 = [(SBCaptureApplicationLaunchMonitor *)self _isViewfinderSessionAuditTokenMatching:v3];

    if (v4) {
      self->_isCameraInUse = 1;
    }
  }
}

- (BOOL)_hasCaptureApplicationRequirements
{
  return self->_hasTCCAccess && self->_isCameraInUse && self->_hasCameraCaptureButtonConfiguration;
}

- (id)_unmetReason
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = v3;
  if (!self->_hasTCCAccess) {
    [v3 addObject:@"Camera usage not authorized"];
  }
  if (!self->_isCameraInUse) {
    [v4 addObject:@"Camera not actively used"];
  }
  if (!self->_hasCameraCaptureButtonConfiguration) {
    [v4 addObject:@"AVCaptureEventInteraction not installed"];
  }
  if ([v4 count])
  {
    uint64_t v5 = [v4 componentsJoinedByString:@"; "];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_checkAllRequirementsForScene:(id)a3
{
  [(SBCaptureApplicationLaunchMonitor *)self _checkForButtonConfiguration:a3];
  [(SBCaptureApplicationLaunchMonitor *)self _checkForTCCAccess];
  [(SBCaptureApplicationLaunchMonitor *)self _checkForCameraInUse];
}

- (void)_publishLaunchRequirementsIfNeededForScene:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_launchRequirementsPublished)
  {
    [(SBCaptureApplicationLaunchMonitor *)self _checkAllRequirementsForScene:v6];
    BOOL v7 = [(SBCaptureApplicationLaunchMonitor *)self _hasCaptureApplicationRequirements];
    BOOL v8 = [(SBCaptureApplicationLaunchMonitor *)self _isCaptureApplicationLaunchMonitorIgnored];
    uint64_t v9 = v8 | v7;
    uint64_t v10 = SBLogCaptureApplication();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = [v6 clientHandle];
      long long v12 = [v11 bundleIdentifier];
      BOOL hasTCCAccess = self->_hasTCCAccess;
      BOOL isCameraInUse = self->_isCameraInUse;
      BOOL hasCameraCaptureButtonConfiguration = self->_hasCameraCaptureButtonConfiguration;
      int v20 = 138413570;
      int v21 = v12;
      __int16 v22 = 1024;
      int v23 = v9;
      __int16 v24 = 1024;
      BOOL v25 = v8;
      __int16 v26 = 1024;
      BOOL v27 = hasTCCAccess;
      __int16 v28 = 1024;
      BOOL v29 = isCameraInUse;
      __int16 v30 = 1024;
      BOOL v31 = hasCameraCaptureButtonConfiguration;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Capture Application - %@ -: Launch monitor result: hasMetLaunchRequirements: %{BOOL}u, isCaptureApplicationLaunchMonitorIgnored: %{BOOL}u, hasTCCAccess: %{BOOL}u, isCameraInUse: %{BOOL}u, hasCameraCaptureButtonConfiguration: %{BOOL}u", (uint8_t *)&v20, 0x2Au);
    }
    if ((v4 | v9) == 1)
    {
      viewfinderMonitoringToken = self->_viewfinderMonitoringToken;
      if (viewfinderMonitoringToken)
      {
        [(SBCameraViewfinderMonitoring *)viewfinderMonitoringToken cancel];
        v17 = self->_viewfinderMonitoringToken;
        self->_viewfinderMonitoringToken = 0;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        if (v9)
        {
          [WeakRetained captureApplicationMonitor:self hasMetLaunchRequirements:1 unmetReason:0];
        }
        else
        {
          BOOL v19 = [(SBCaptureApplicationLaunchMonitor *)self _unmetReason];
          [WeakRetained captureApplicationMonitor:self hasMetLaunchRequirements:0 unmetReason:v19];
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_14:

          goto LABEL_15;
        }
        [WeakRetained captureApplicationMonitor:self hasMetLaunchRequirements:v9];
      }
      self->_launchRequirementsPublished = 1;
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)_updateMonitorTimerIfNeeded
{
  if (self->_scene && !self->_launchRequirementsPublished)
  {
    if (self->_sceneIsReadyForWatchdogging)
    {
      if (!self->_monitorTimer)
      {
        uint64_t v3 = SBLogCaptureApplication();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Creating a new watchdog timer", (uint8_t *)buf, 2u);
        }

        id v4 = objc_alloc(MEMORY[0x1E4F4F660]);
        uint64_t v5 = [NSString stringWithFormat:@"SBFCaptureApplicationLaunchMonitor.monitorTimer"];
        id v6 = (BSAbsoluteMachTimer *)[v4 initWithIdentifier:v5];
        monitorTimer = self->_monitorTimer;
        self->_monitorTimer = v6;

        objc_initWeak(buf, self);
        BOOL v8 = self->_monitorTimer;
        uint64_t v9 = +[SBCaptureApplicationCenter captureApplicationSettings];
        [v9 launchMonitorDurationInSeconds];
        double v11 = v10;
        uint64_t v12 = MEMORY[0x1E4F14428];
        id v13 = MEMORY[0x1E4F14428];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __64__SBCaptureApplicationLaunchMonitor__updateMonitorTimerIfNeeded__block_invoke;
        v17[3] = &unk_1E6AF5838;
        objc_copyWeak(&v18, buf);
        [(BSAbsoluteMachTimer *)v8 scheduleWithFireInterval:v12 leewayInterval:v17 queue:v11 handler:0.05];

        objc_destroyWeak(&v18);
        objc_destroyWeak(buf);
      }
    }
    else
    {
      long long v14 = SBLogCaptureApplication();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Scene is not ready to start the watchdog timer", (uint8_t *)buf, 2u);
      }

      if (self->_monitorTimer)
      {
        uint64_t v15 = SBLogCaptureApplication();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Invalidating the current watchdog timer", (uint8_t *)buf, 2u);
        }

        [(BSAbsoluteMachTimer *)self->_monitorTimer invalidate];
        uint64_t v16 = self->_monitorTimer;
        self->_monitorTimer = 0;
      }
    }
  }
}

void __64__SBCaptureApplicationLaunchMonitor__updateMonitorTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SEL v1 = [WeakRetained scene];
  [WeakRetained _publishLaunchRequirementsIfNeededForScene:v1 forced:1];
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v5 = (FBScene *)a3;
  id v6 = v5;
  scene = self->_scene;
  if (scene)
  {
    if (scene != v5)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"SBCaptureApplicationLaunchMonitor.m", 313, @"Invalid parameter not satisfying: %@", @"scene == _scene" object file lineNumber description];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__SBCaptureApplicationLaunchMonitor_sceneContentStateDidChange___block_invoke;
    block[3] = &unk_1E6AF5290;
    block[4] = self;
    double v11 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    BOOL v8 = SBLogCaptureApplication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Capture Application - Scene is invalid, ignoring sceneContentStateDidChange call", buf, 2u);
    }
  }
}

void *__64__SBCaptureApplicationLaunchMonitor_sceneContentStateDidChange___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[3])
  {
    [result _updateSceneReadyStatusForReason:@"sceneContentStateDidChange"];
    [*(id *)(a1 + 32) _publishLaunchRequirementsIfNeededForScene:*(void *)(a1 + 40) forced:0];
    uint64_t v3 = *(void **)(a1 + 32);
    return (void *)[v3 _updateMonitorTimerIfNeeded];
  }
  return result;
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogCaptureApplication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 clientHandle];
    BOOL v7 = [v6 bundleIdentifier];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Capture Application - %@ - Launch Monitor state: Scene did invalidate", (uint8_t *)&v8, 0xCu);
  }
  [(SBCaptureApplicationLaunchMonitor *)self invalidate];
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v5 = a3;
  [(SBCaptureApplicationLaunchMonitor *)self _updateSceneReadyStatusForReason:@"didUpdateSettings"];
  [(SBCaptureApplicationLaunchMonitor *)self _publishLaunchRequirementsIfNeededForScene:v5 forced:0];

  [(SBCaptureApplicationLaunchMonitor *)self _updateMonitorTimerIfNeeded];
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v5 = a3;
  [(SBCaptureApplicationLaunchMonitor *)self _updateSceneReadyStatusForReason:@"didUpdateClientSettings"];
  [(SBCaptureApplicationLaunchMonitor *)self _publishLaunchRequirementsIfNeededForScene:v5 forced:0];

  [(SBCaptureApplicationLaunchMonitor *)self _updateMonitorTimerIfNeeded];
}

- (void)_cameraViewfinderMonitorSessionDetected:(id)a3 auditToken:(id)a4
{
  [(SBCaptureApplicationLaunchMonitor *)self _checkForCameraInUse];
  if (self->_isCameraInUse)
  {
    id v5 = [(SBCaptureApplicationLaunchMonitor *)self scene];
    [(SBCaptureApplicationLaunchMonitor *)self _publishLaunchRequirementsIfNeededForScene:v5 forced:0];
  }
}

- (void)cameraViewfinderMonitorSessionWillBegin:(id)a3 auditToken:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  int v8 = [(SBCaptureApplicationLaunchMonitor *)self scene];
  uint64_t v9 = SBLogCaptureApplication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 clientHandle];
    double v11 = [v10 bundleIdentifier];
    int v12 = 138412290;
    id v13 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Capture Application - %@ -: Viewfinder session will begin", (uint8_t *)&v12, 0xCu);
  }
  [(SBCaptureApplicationLaunchMonitor *)self _cameraViewfinderMonitorSessionDetected:v7 auditToken:v6];
}

- (void)cameraViewfinderMonitorSessionDidBegin:(id)a3 auditToken:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  int v8 = [(SBCaptureApplicationLaunchMonitor *)self scene];
  uint64_t v9 = SBLogCaptureApplication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 clientHandle];
    double v11 = [v10 bundleIdentifier];
    int v12 = 138412290;
    id v13 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Capture Application - %@ -: Viewfinder session did begin", (uint8_t *)&v12, 0xCu);
  }
  [(SBCaptureApplicationLaunchMonitor *)self _cameraViewfinderMonitorSessionDetected:v7 auditToken:v6];
}

- (FBScene)scene
{
  return self->_scene;
}

- (SBFCaptureApplicationLaunchMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFCaptureApplicationLaunchMonitorDelegate *)WeakRetained;
}

- (SBCameraViewfinderMonitoring)viewfinderMonitoringToken
{
  return self->_viewfinderMonitoringToken;
}

- (void)setViewfinderMonitoringToken:(id)a3
{
}

- (BOOL)hasCameraCaptureButtonConfiguration
{
  return self->_hasCameraCaptureButtonConfiguration;
}

- (void)setHasCameraCaptureButtonConfiguration:(BOOL)a3
{
  self->_BOOL hasCameraCaptureButtonConfiguration = a3;
}

- (BOOL)isCameraInUse
{
  return self->_isCameraInUse;
}

- (void)setIsCameraInUse:(BOOL)a3
{
  self->_BOOL isCameraInUse = a3;
}

- (BOOL)hasTCCAccess
{
  return self->_hasTCCAccess;
}

- (void)setHasTCCAccess:(BOOL)a3
{
  self->_BOOL hasTCCAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewfinderMonitoringToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_monitorTimer, 0);
}

- (void)initWithScene:delegate:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithScene:delegate:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end