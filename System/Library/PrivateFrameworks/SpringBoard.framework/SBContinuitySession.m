@interface SBContinuitySession
- (BOOL)isActivelyScreenRecording;
- (BOOL)isMainSceneConnected;
- (BOOL)isSceneConnected;
- (BSInvalidatable)authenticationSessionAssertion;
- (NSSet)reasons;
- (NSString)description;
- (NSString)displayHardwareIdentifier;
- (SBContinuityDisplayLayoutPublisher)displayLayoutPublisher;
- (SBContinuitySession)init;
- (SBContinuitySession)initWithAuthenticationCoordinator:(id)a3 stateMachine:(id)a4 buttonActionsFactory:(id)a5 displayLinkController:(id)a6 launchEventExecutor:(id)a7 uiFlusher:(id)a8 multiDisplayUserInteractionCoordinator:(id)a9 userInterfaceStyleProvider:(id)a10 screenshotManager:(id)a11;
- (SBContinuitySessionOrientationDelegate)orientationDelegate;
- (SBWindowScene)mainWindowScene;
- (id)_newContinuityButtonActionsForWindowScene:(id)a3;
- (id)clientExternallyBlockedReasons;
- (id)sceneManagerforContinuityScreenshotManager:(id)a3;
- (id)succinctDescription;
- (unint64_t)state;
- (void)_clientReportedScreenRecordingActive:(BOOL)a3;
- (void)_handleContinuityButtonEvent:(unint64_t)a3;
- (void)_handlePendedLaunchEventIfNecessaryAnimatedly:(BOOL)a3;
- (void)_invalidateForReasons:(id)a3;
- (void)addOrientationObserver:(id)a3;
- (void)addScreenRecordingObserver:(id)a3;
- (void)addStateObserver:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)continuitySessionServiceClient:(id)a3 handleContinuityButtonEvent:(unint64_t)a4;
- (void)continuitySessionServiceClient:(id)a3 handleLaunchEventOfType:(id)a4 payload:(id)a5;
- (void)continuitySessionServiceClient:(id)a3 setHostedInterfaceOrientation:(int64_t)a4;
- (void)continuitySessionServiceClient:(id)a3 updatedAppearanceSettings:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)continuitySessionServiceClientConnected:(id)a3;
- (void)continuitySessionServiceClientDidCaptureScreenshot:(id)a3;
- (void)continuitySessionServiceClientDidConfigureHIDServices:(id)a3;
- (void)continuitySessionServiceClientDidStartScreenRecording:(id)a3;
- (void)continuitySessionServiceClientDidStopScreenRecording:(id)a3;
- (void)continuitySessionServiceClientDidUpdateExternallyBlockedReasons:(id)a3;
- (void)continuitySessionServiceClientHasAdoptedScreenCaptureNotifications:(id)a3;
- (void)continuitySessionStateMachineDidUpdateState:(id)a3 oldState:(unint64_t)a4;
- (void)noteMainSceneConnected:(id)a3;
- (void)noteMainSceneDisconnected:(id)a3;
- (void)noteSceneConnected:(id)a3;
- (void)noteSceneDisconnected:(id)a3;
- (void)noteSceneHasValidDisplayUUID:(id)a3;
- (void)noteSystemApertureCurtainSceneConnected:(id)a3;
- (void)noteSystemApertureCurtainSceneDisconnected:(id)a3;
- (void)noteSystemApertureCurtainUIIsReady:(id)a3;
- (void)noteSystemApertureSceneConnected:(id)a3;
- (void)noteSystemApertureSceneDisconnected:(id)a3;
- (void)noteSystemApertureUIIsReady:(id)a3;
- (void)noteUIIsReady:(id)a3;
- (void)removeOrientationObserver:(id)a3;
- (void)removeScreenRecordingObserver:(id)a3;
- (void)removeStateObserver:(id)a3;
- (void)setAuthenticationSessionAssertion:(id)a3;
- (void)setDisplayLayoutPublisher:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3 supportedInterfaceOrientations:(unint64_t)a4;
- (void)setOrientationDelegate:(id)a3;
@end

@implementation SBContinuitySession

- (SBContinuitySession)init
{
  v2 = +[SBContinuityDisplayAuthenticationCoordinator sharedInstance];
  v15 = objc_alloc_init(SBContinuitySessionSystemEventMonitor);
  v3 = [[_SBContinuitySessionStateMachine alloc] initWithSystemEventMonitor:v15 continuityDisplayAuthenticationCoordinator:v2];
  v4 = objc_alloc_init(_SBContinuityUIFlusher);
  v5 = objc_alloc_init(SBContinuitySessionLaunchEventExecutor);
  v6 = [(id)SBApp multiDisplayUserInteractionCoordinator];
  v7 = +[SBContinuitySessionManager sharedInstance];
  v8 = [v7 overridableUserInterfaceStyleProvider];

  v9 = objc_alloc_init(SBContinuityScreenshotManager);
  v10 = +[SBBacklightController sharedInstance];
  v11 = [v10 mainDisplayLinkController];
  v12 = [(SBContinuitySession *)self initWithAuthenticationCoordinator:v2 stateMachine:v3 buttonActionsFactory:0 displayLinkController:v11 launchEventExecutor:v5 uiFlusher:v4 multiDisplayUserInteractionCoordinator:v6 userInterfaceStyleProvider:v8 screenshotManager:v9];

  return v12;
}

- (SBContinuitySession)initWithAuthenticationCoordinator:(id)a3 stateMachine:(id)a4 buttonActionsFactory:(id)a5 displayLinkController:(id)a6 launchEventExecutor:(id)a7 uiFlusher:(id)a8 multiDisplayUserInteractionCoordinator:(id)a9 userInterfaceStyleProvider:(id)a10 screenshotManager:(id)a11
{
  id v17 = a3;
  id v41 = a4;
  id v18 = a4;
  id v46 = a5;
  id v39 = a6;
  id v45 = a6;
  id v44 = a7;
  id v40 = a8;
  id v43 = a8;
  id v19 = a9;
  id v42 = a10;
  id v20 = a11;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 113, @"Invalid parameter not satisfying: %@", @"authenticationCoordinator" object file lineNumber description];

    if (v18)
    {
LABEL_3:
      if (v19) {
        goto LABEL_4;
      }
LABEL_12:
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 115, @"Invalid parameter not satisfying: %@", @"multiDisplayUserInteractionCoordinator" object file lineNumber description];

      if (v20) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 114, @"Invalid parameter not satisfying: %@", @"stateMachine" object file lineNumber description];

  if (!v19) {
    goto LABEL_12;
  }
LABEL_4:
  if (v20) {
    goto LABEL_5;
  }
LABEL_13:
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 116, @"Invalid parameter not satisfying: %@", @"screenshotManager" object file lineNumber description];

LABEL_5:
  v48.receiver = self;
  v48.super_class = (Class)SBContinuitySession;
  v21 = [(SBContinuitySession *)&v48 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_authenticationCoordinator, a3);
    uint64_t v23 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v22->_observers;
    v22->_observers = (NSHashTable *)v23;

    objc_storeStrong((id *)&v22->_buttonActionsFactory, a5);
    objc_storeStrong((id *)&v22->_displayLinkController, v39);
    objc_storeStrong((id *)&v22->_launchEventExecutor, a7);
    objc_storeStrong((id *)&v22->_uiFlusher, v40);
    objc_storeStrong((id *)&v22->_multiDisplayUserInteractionCoordinator, a9);
    uint64_t v25 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    orientationObservers = v22->_orientationObservers;
    v22->_orientationObservers = (NSHashTable *)v25;

    objc_storeStrong((id *)&v22->_userInterfaceStyleProvider, a10);
    v27 = (SBUIContinuitySessionAppearanceSettings *)objc_alloc_init(MEMORY[0x1E4FA7C88]);
    appearanceSettings = v22->_appearanceSettings;
    v22->_appearanceSettings = v27;

    uint64_t v29 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    screenRecordingObservers = v22->_screenRecordingObservers;
    v22->_screenRecordingObservers = (NSHashTable *)v29;

    objc_storeStrong((id *)&v22->_screenshotManager, a11);
    [(SBContinuityScreenshotManager *)v22->_screenshotManager setSceneManagerProvider:v22];
    v31 = SBLogContinuitySession();
    if (os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_SESSION", (const char *)&unk_1D8FE2CAB, buf, 2u);
    }

    objc_storeStrong((id *)&v22->_stateMachine, v41);
    [(_SBContinuitySessionStateMachine *)v22->_stateMachine setDelegate:v22];
    [(_SBContinuitySessionStateMachine *)v22->_stateMachine setClientExternallyBlockedReasonsProvider:v22];
    [(SBContinuitySession *)v22 continuitySessionStateMachineDidUpdateState:v22->_stateMachine oldState:0];
  }

  return v22;
}

- (id)_newContinuityButtonActionsForWindowScene:(id)a3
{
  buttonActionsFactory = self->_buttonActionsFactory;
  if (buttonActionsFactory) {
    v5 = (SBContinuityButtonActions *)[(SBContinuityButtonActionsFactory *)buttonActionsFactory newButtonActionsForWindowScene:a3];
  }
  else {
    v5 = [[SBContinuityButtonActions alloc] initWithWindowScene:a3 debugName:@"Continuity"];
  }
  v6 = v5;

  return v6;
}

- (void)addStateObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_observers, "addObject:");
  }
}

- (void)removeStateObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (unint64_t)state
{
  return [(_SBContinuitySessionStateMachine *)self->_stateMachine state];
}

- (NSSet)reasons
{
  return [(_SBContinuitySessionStateMachine *)self->_stateMachine reasons];
}

- (void)setDisplayLayoutPublisher:(id)a3
{
  v5 = (SBContinuityDisplayLayoutPublisher *)a3;
  if (self->_displayLayoutPublisher)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBContinuitySession.m" lineNumber:172 description:@"Already tracking a display layout publisher"];
  }
  displayLayoutPublisher = self->_displayLayoutPublisher;
  self->_displayLayoutPublisher = v5;
}

- (SBContinuityDisplayLayoutPublisher)displayLayoutPublisher
{
  return self->_displayLayoutPublisher;
}

- (BOOL)isActivelyScreenRecording
{
  return !self->_clientAdoptedScreenCaptureNotifications || self->_isBeingScreenRecorded;
}

- (void)addScreenRecordingObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_screenRecordingObservers, "addObject:");
  }
}

- (void)removeScreenRecordingObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_screenRecordingObservers, "removeObject:");
  }
}

- (void)addOrientationObserver:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v4 = v6;
  if (v6)
  {
    BOOL v5 = [(NSHashTable *)self->_orientationObservers containsObject:v6];
    v4 = v6;
    if (!v5)
    {
      [(NSHashTable *)self->_orientationObservers addObject:v6];
      v4 = v6;
    }
  }
}

- (void)removeOrientationObserver:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v4 = v5;
  if (v5)
  {
    [(NSHashTable *)self->_orientationObservers removeObject:v5];
    v4 = v5;
  }
}

- (void)setInterfaceOrientation:(int64_t)a3 supportedInterfaceOrientations:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (*(_OWORD *)&self->_currentInterfaceOrientation != __PAIR128__(a4, a3))
  {
    self->_currentInterfaceOrientation = a3;
    self->_currentSupportedInterfaceOrientation = a4;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v7 = [(NSHashTable *)self->_orientationObservers allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) continuitySession:self didUpdateInterfaceOrientation:self->_currentInterfaceOrientation supportedInterfaceOrientations:self->_currentSupportedInterfaceOrientation];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)isSceneConnected
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (void)noteSceneConnected:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (WeakRetained)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [WeakRetained _sceneIdentifier];
    [v9 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 242, @"Already tracking a window scene: <%p>:%@", WeakRetained, v10 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v12 = v5;
    __int16 v13 = 2114;
    long long v14 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] scene connected: <%p>:%{public}@", buf, 0x16u);
  }
  objc_storeWeak((id *)&self->_windowScene, v5);
  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteSceneConnected];
}

- (void)noteSceneDisconnected:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (WeakRetained != v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = [v5 _sceneIdentifier];
    id v12 = [WeakRetained _sceneIdentifier];
    [v10 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 253, @"scene disconnected: <%p>:%@ is not the one i'm tracking: <%p>:%@", v5, v11, WeakRetained, v12 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v14 = v5;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] scene disconnected: <%p>:%{public}@", buf, 0x16u);
  }
  objc_storeWeak((id *)&self->_windowScene, 0);
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"terminal.scene-disconnected"];
  [(SBContinuitySession *)self _invalidateForReasons:v9];
}

- (BOOL)isMainSceneConnected
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (SBWindowScene)mainWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)noteMainSceneConnected:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  if (WeakRetained)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [WeakRetained _sceneIdentifier];
    [v9 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 274, @"Already tracking a main window scene: <%p>:%@", WeakRetained, v10 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] main scene connected: <%p>:%{public}@", buf, 0x16u);
  }
  objc_storeWeak((id *)&self->_mainSBWindowScene, v5);
  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteMainSceneConnected];
}

- (void)noteUIIsReady:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  if (WeakRetained != v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [v5 _sceneIdentifier];
    uint64_t v11 = [WeakRetained _sceneIdentifier];
    [v9 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 285, @"UI is ready for scene: <%p>:%@ is not the one i'm tracking: <%p>:%@", v5, v10, WeakRetained, v11 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] ui is ready: <%p>:%{public}@", buf, 0x16u);
  }
  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteUIIsReady];
}

- (void)noteSceneHasValidDisplayUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  if (WeakRetained != v5)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = [v5 _sceneIdentifier];
    id v18 = [WeakRetained _sceneIdentifier];
    [v16 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 295, @"main scene is reporting valid displayUUID: <%p>:%@ is not the one i'm tracking: <%p>:%@", v5, v17, WeakRetained, v18 object file lineNumber description];
  }
  v7 = [v5 _FBSScene];
  uint64_t v8 = [v7 settings];
  uint64_t v9 = [v8 displayConfiguration];
  uint64_t v10 = [v9 hardwareIdentifier];
  uint64_t v11 = (NSString *)[v10 copy];
  displayHardwareIdentifier = self->_displayHardwareIdentifier;
  self->_displayHardwareIdentifier = v11;

  if (!self->_displayHardwareIdentifier)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBContinuitySession.m" lineNumber:299 description:@"_displayHardwareIdentifier is nil"];
  }
  id v13 = SBLogContinuitySession();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = [v5 _sceneIdentifier];
    uint64_t v15 = self->_displayHardwareIdentifier;
    *(_DWORD *)buf = 134218498;
    id v21 = v5;
    __int16 v22 = 2114;
    uint64_t v23 = v14;
    __int16 v24 = 2114;
    uint64_t v25 = v15;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[Session] main scene <%p>:%{public}@ has valid displayUUID: %{public}@", buf, 0x20u);
  }
  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteSceneHasValidDisplayUUID];
}

- (void)noteMainSceneDisconnected:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  if (WeakRetained != v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = [v5 _sceneIdentifier];
    id v12 = [WeakRetained _sceneIdentifier];
    [v10 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 309, @"Main scene disconnected: <%p>:%@ is not the one i'm tracking: <%p>:%@", v5, v11, WeakRetained, v12 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v14 = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] main scene disconnected: <%p>:%{public}@", buf, 0x16u);
  }
  objc_storeWeak((id *)&self->_mainSBWindowScene, 0);
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"terminal.scene-disconnected"];
  [(SBContinuitySession *)self _invalidateForReasons:v9];
}

- (void)noteSystemApertureSceneConnected:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureScene);
  if (WeakRetained)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [WeakRetained _sceneIdentifier];
    [v9 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 323, @"Already tracking a system aperture window scene: <%p>:%@", WeakRetained, v10 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture scene connected: <%p>:%{public}@", buf, 0x16u);
  }
  objc_storeWeak((id *)&self->_systemApertureScene, v5);
  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteSystemApertureSceneConnected];
}

- (void)noteSystemApertureUIIsReady:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureScene);
  if (WeakRetained != v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [v5 _sceneIdentifier];
    uint64_t v11 = [WeakRetained _sceneIdentifier];
    [v9 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 334, @"UI is ready for system aperture scene: <%p>:%@ is not the one i'm tracking: <%p>:%@", v5, v10, WeakRetained, v11 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture ui is ready: <%p>:%{public}@", buf, 0x16u);
  }
  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteSystemApertureUIIsReady];
}

- (void)noteSystemApertureSceneDisconnected:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureScene);
  if (WeakRetained != v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = [v5 _sceneIdentifier];
    id v12 = [WeakRetained _sceneIdentifier];
    [v10 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 344, @"System aperture scene disconnected: <%p>:%@ is not the one i'm tracking: <%p>:%@", v5, v11, WeakRetained, v12 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v14 = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture scene disconnected: <%p>:%{public}@", buf, 0x16u);
  }
  objc_storeWeak((id *)&self->_systemApertureScene, 0);
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"terminal.scene-disconnected"];
  [(SBContinuitySession *)self _invalidateForReasons:v9];
}

- (void)noteSystemApertureCurtainSceneConnected:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureCurtainScene);
  if (WeakRetained)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [WeakRetained _sceneIdentifier];
    [v9 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 357, @"Already tracking a system aperture curtain window scene: <%p>:%@", WeakRetained, v10 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture curtain scene connected: <%p>:%{public}@", buf, 0x16u);
  }
  objc_storeWeak((id *)&self->_systemApertureCurtainScene, v5);
  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteSystemApertureCurtainSceneConnected];
}

- (void)noteSystemApertureCurtainUIIsReady:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureCurtainScene);
  if (WeakRetained != v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [v5 _sceneIdentifier];
    uint64_t v11 = [WeakRetained _sceneIdentifier];
    [v9 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 368, @"UI is ready for system aperture curtain scene: <%p>:%@ is not the one i'm tracking: <%p>:%@", v5, v10, WeakRetained, v11 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture curtain ui is ready: <%p>:%{public}@", buf, 0x16u);
  }
  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteSystemApertureCurtainUIIsReady];
}

- (void)noteSystemApertureCurtainSceneDisconnected:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureCurtainScene);
  if (WeakRetained != v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = [v5 _sceneIdentifier];
    id v12 = [WeakRetained _sceneIdentifier];
    [v10 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 378, @"System aperture curtain scene disconnected: <%p>:%@ is not the one i'm tracking: <%p>:%@", v5, v11, WeakRetained, v12 object file lineNumber description];
  }
  v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v14 = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture curtain scene disconnected: <%p>:%{public}@", buf, 0x16u);
  }
  objc_storeWeak((id *)&self->_systemApertureCurtainScene, 0);
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"terminal.scene-disconnected"];
  [(SBContinuitySession *)self _invalidateForReasons:v9];
}

- (id)clientExternallyBlockedReasons
{
  v2 = [(_SBContinuitySessionServiceClient *)self->_continuitySessionServiceClient externallyBlockedReasons];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:@"block.session.client-connected"];
  }
  id v5 = v4;

  return v5;
}

- (void)continuitySessionServiceClientConnected:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (_SBContinuitySessionServiceClient *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(_SBContinuitySessionServiceClient *)v4 externallyBlockedReasons];
  continuitySessionServiceClient = self->_continuitySessionServiceClient;
  self->_continuitySessionServiceClient = v4;
  v7 = v4;

  uint64_t v8 = SBLogContinuitySession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[Session] client connected with initial blocked reasons: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteClientConnectedWithInitialExternallyBlockedReasons:v5];
}

- (void)continuitySessionServiceClient:(id)a3 handleLaunchEventOfType:(id)a4 payload:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int v9 = [[SBContinuitySessionLaunchEvent alloc] initWithType:v8 payload:v7];

  if ([(SBContinuitySession *)self state] == 10)
  {
    uint64_t v10 = SBLogContinuitySession();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v9;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[Session] received a launch event %{public}@ and we are .active so handling it now", buf, 0xCu);
    }

    launchEventExecutor = self->_launchEventExecutor;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__SBContinuitySession_continuitySessionServiceClient_handleLaunchEventOfType_payload___block_invoke;
    v20[3] = &unk_1E6AF4AC0;
    id v21 = v9;
    [(SBContinuitySessionLaunchEventExecutor *)launchEventExecutor executeLaunchEvent:v21 animatedly:1 completion:v20];
    id v12 = v21;
  }
  else
  {
    if (self->_pendingLaunchEvent)
    {
      id v13 = SBLogContinuitySession();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        pendingLaunchEvent = self->_pendingLaunchEvent;
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v9;
        __int16 v24 = 2114;
        uint64_t v25 = pendingLaunchEvent;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[Session] received a launch event %{public}@ but we already have one pended %{public}@, dropping pended event in favor of latest launch event", buf, 0x16u);
      }
    }
    __int16 v15 = SBLogContinuitySession();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v9;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[Session] received a launch event %{public}@ but we aren't in the .active state so saving it for when the time is right", buf, 0xCu);
    }

    id v12 = self->_pendingLaunchEvent;
    objc_storeStrong((id *)&self->_pendingLaunchEvent, v9);
    stateMachine = self->_stateMachine;
    uint64_t v17 = [(SBContinuitySessionLaunchEvent *)v9 identifier];
    [(_SBContinuitySessionStateMachine *)stateMachine didReceiveLaunchEvent:v17];

    if (v12)
    {
      id v18 = self->_stateMachine;
      id v19 = [(SBContinuitySessionLaunchEvent *)v12 identifier];
      [(_SBContinuitySessionStateMachine *)v18 didHandleLaunchEvent:v19];
    }
  }
}

void __86__SBContinuitySession_continuitySessionServiceClient_handleLaunchEventOfType_payload___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = SBLogContinuitySession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[Session] finished handling launch event %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)continuitySessionServiceClient:(id)a3 handleContinuityButtonEvent:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = (_SBContinuitySessionServiceClient *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = self->_continuitySessionServiceClient;

  if (v8 != v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = NSStringFromSBUIContinuityButtonEventType();
    [v11 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 434, @"client asking me to handle button event %@ is not the one i'm tracking: %@", v12, v8 object file lineNumber description];
  }
  int v9 = SBLogContinuitySession();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromSBUIContinuityButtonEventType();
    *(_DWORD *)buf = 138543362;
    id v14 = v10;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[Session] client sent button event: %{public}@", buf, 0xCu);
  }
  [(SBContinuitySession *)self _handleContinuityButtonEvent:a4];
}

- (void)continuitySessionServiceClient:(id)a3 setHostedInterfaceOrientation:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = SBLogContinuitySession();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[Session] client updated hosted interface orientation: %ld", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(SBContinuitySession *)self orientationDelegate];
  [v7 continuitySession:self didUpdateHostedInterfaceOrientation:a4];
}

- (void)continuitySessionServiceClientDidUpdateExternallyBlockedReasons:(id)a3
{
  uint64_t v5 = (_SBContinuitySessionServiceClient *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v6 = self->_continuitySessionServiceClient;

  if (v6 != v5)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 449, @"client updating externally blocked reasons is not the one i'm tracking: %@", v6 object file lineNumber description];
  }
  id v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] client updated externally blocked reasons", buf, 2u);
  }

  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteClientDidUpdateExternallyBlockedReasons];
}

- (void)continuitySessionServiceClientDidConfigureHIDServices:(id)a3
{
  uint64_t v5 = (_SBContinuitySessionServiceClient *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v6 = self->_continuitySessionServiceClient;

  if (v6 != v5)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 458, @"client that configured HID services is not the one i'm tracking: %@", v6 object file lineNumber description];
  }
  id v7 = SBLogContinuitySession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Session] client configured HID services", buf, 2u);
  }

  [(_SBContinuitySessionStateMachine *)self->_stateMachine noteClientConfiguredHIDServices];
}

- (void)continuitySessionServiceClient:(id)a3 updatedAppearanceSettings:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (_SBContinuitySessionServiceClient *)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, uint64_t, void))a6;
  uint64_t v15 = self->_continuitySessionServiceClient;
  if (v15 != v11)
  {
    __int16 v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBContinuitySession.m", 466, @"client that updated appearance settings is not the one i'm tracking: %@", v15 object file lineNumber description];
  }
  uint64_t v16 = SBLogContinuitySession();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v28 = v12;
    __int16 v29 = 2114;
    id v30 = v13;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[Session] updated appearance settings %{public}@ with transitionContext %{public}@", buf, 0x16u);
  }

  uint64_t v17 = self->_appearanceSettings;
  objc_storeStrong((id *)&self->_appearanceSettings, a4);
  uint64_t v18 = [(SBUIContinuitySessionAppearanceSettings *)v17 userInterfaceStyle];
  uint64_t v19 = [v12 userInterfaceStyle];
  id v20 = SBLogContinuitySession();
  id v21 = v20;
  if (v18 == v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "[Session] updated appearance setting - no updates necessary", buf, 2u);
    }

    v14[2](v14, 1, 0);
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[SBContinuitySession continuitySessionServiceClient:updatedAppearanceSettings:transitionContext:completion:](v21);
    }

    userInterfaceStyleProvider = self->_userInterfaceStyleProvider;
    uint64_t v23 = [v12 userInterfaceStyle];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __109__SBContinuitySession_continuitySessionServiceClient_updatedAppearanceSettings_transitionContext_completion___block_invoke;
    v25[3] = &unk_1E6AF5300;
    uint64_t v26 = v14;
    [(SBOverridableUserInterfaceStyleProvider *)userInterfaceStyleProvider setOverrideStyle:v23 completion:v25];
  }
}

uint64_t __109__SBContinuitySession_continuitySessionServiceClient_updatedAppearanceSettings_transitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)continuitySessionServiceClientDidCaptureScreenshot:(id)a3
{
  int v4 = SBLogContinuitySession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[Session] client did capture screenshot", v5, 2u);
  }

  [(SBContinuityScreenshotManager *)self->_screenshotManager noteCapturedScreenshot];
}

- (void)continuitySessionServiceClientDidStartScreenRecording:(id)a3
{
  BOOL isBeingScreenRecorded = self->_isBeingScreenRecorded;
  uint64_t v5 = SBLogContinuitySession();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (isBeingScreenRecorded)
  {
    if (v6)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Session] client said screen recording started - but we already think it started??", v7, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Session] client said screen recording started", buf, 2u);
    }

    [(SBContinuitySession *)self _clientReportedScreenRecordingActive:1];
  }
}

- (void)continuitySessionServiceClientDidStopScreenRecording:(id)a3
{
  BOOL isBeingScreenRecorded = self->_isBeingScreenRecorded;
  uint64_t v5 = SBLogContinuitySession();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (isBeingScreenRecorded)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Session] client said screen recording stopped", buf, 2u);
    }

    [(SBContinuitySession *)self _clientReportedScreenRecordingActive:0];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Session] client said screen recording stopped - but we already think it stopped??", v7, 2u);
    }
  }
}

- (void)_clientReportedScreenRecordingActive:(BOOL)a3
{
  int v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_clientAdoptedScreenCaptureNotifications)
  {
    p_int isBeingScreenRecorded = &self->_isBeingScreenRecorded;
    if (self->_isBeingScreenRecorded == a3) {
      return;
    }
  }
  else
  {
    BOOL v6 = SBLogContinuitySession();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[Session] assuming client has adopted screen catpure API because they used it", buf, 2u);
    }

    p_int isBeingScreenRecorded = &self->_isBeingScreenRecorded;
    int isBeingScreenRecorded = self->_isBeingScreenRecorded;
    self->_clientAdoptedScreenCaptureNotifications = 1;
    if (isBeingScreenRecorded == v3) {
      goto LABEL_8;
    }
  }
  *p_int isBeingScreenRecorded = v3;
LABEL_8:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v8 = [(NSHashTable *)self->_screenRecordingObservers allObjects];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) continuitySessionDidUpdateScreenRecordingState:self];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)continuitySessionServiceClientHasAdoptedScreenCaptureNotifications:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_clientAdoptedScreenCaptureNotifications)
  {
    int v4 = SBLogContinuitySession();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[Session] client notified us they have adopted screen capture notifications", buf, 2u);
    }

    self->_clientAdoptedScreenCaptureNotifications = 1;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(NSHashTable *)self->_screenRecordingObservers allObjects];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
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
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) continuitySessionDidUpdateScreenRecordingState:self];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_handleContinuityButtonEvent:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_invalid)
  {
    id WeakRetained = SBLogContinuitySession();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = NSStringFromSBUIContinuityButtonEventType();
      *(_DWORD *)long long v12 = 138543362;
      *(void *)&v12[4] = v5;
      _os_log_impl(&dword_1D85BA000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[Session] INVALIDATED - Ignoringing continuity button event %{public}@", v12, 0xCu);
    }
    goto LABEL_22;
  }
  continuityButtonActions = self->_continuityButtonActions;
  uint64_t v8 = SBLogContinuitySession();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (continuityButtonActions)
  {
    if (!v9) {
      goto LABEL_10;
    }
    long long v10 = NSStringFromSBUIContinuityButtonEventType();
    *(_DWORD *)long long v12 = 138543362;
    *(void *)&v12[4] = v10;
    long long v11 = "[Session] Received button event %{public}@";
  }
  else
  {
    if (!v9) {
      goto LABEL_10;
    }
    long long v10 = NSStringFromSBUIContinuityButtonEventType();
    *(_DWORD *)long long v12 = 138543362;
    *(void *)&v12[4] = v10;
    long long v11 = "[Session] Not ready to handle button event %{public}@";
  }
  _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, v11, v12, 0xCu);

LABEL_10:
  switch(a3)
  {
    case 3uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
      if (WeakRetained) {
        [(SBMultiDisplayUserInteractionCoordinator *)self->_multiDisplayUserInteractionCoordinator updateActiveWindowScene:WeakRetained forUserInteraction:@"continuity.showSpotlight"];
      }
      [(SBContinuityButtonActions *)self->_continuityButtonActions performSpotlightButtonAction];
      break;
    case 2uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
      if (WeakRetained) {
        [(SBMultiDisplayUserInteractionCoordinator *)self->_multiDisplayUserInteractionCoordinator updateActiveWindowScene:WeakRetained forUserInteraction:@"continuity.enterSwitcher"];
      }
      [(SBContinuityButtonActions *)self->_continuityButtonActions performSwitcherButtonAction];
      break;
    case 1uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
      if (WeakRetained) {
        [(SBMultiDisplayUserInteractionCoordinator *)self->_multiDisplayUserInteractionCoordinator updateActiveWindowScene:WeakRetained forUserInteraction:@"continuity.goToHome"];
      }
      [(SBContinuityButtonActions *)self->_continuityButtonActions performHomeButtonAction];
      break;
    default:
      return;
  }
LABEL_22:
}

- (void)_handlePendedLaunchEventIfNecessaryAnimatedly:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  pendingLaunchEvent = self->_pendingLaunchEvent;
  if (pendingLaunchEvent)
  {
    BOOL v4 = a3;
    uint64_t v6 = pendingLaunchEvent;
    uint64_t v7 = self->_pendingLaunchEvent;
    self->_pendingLaunchEvent = 0;

    uint64_t v8 = SBLogContinuitySession();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[Session] handling pended launch event now %{public}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    launchEventExecutor = self->_launchEventExecutor;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__SBContinuitySession__handlePendedLaunchEventIfNecessaryAnimatedly___block_invoke;
    v11[3] = &unk_1E6AFB8D8;
    objc_copyWeak(&v14, (id *)buf);
    long long v10 = v6;
    long long v12 = v10;
    uint64_t v13 = self;
    [(SBContinuitySessionLaunchEventExecutor *)launchEventExecutor executeLaunchEvent:v10 animatedly:v4 completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __69__SBContinuitySession__handlePendedLaunchEventIfNecessaryAnimatedly___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v3 = SBLogContinuitySession();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[Session] finished handling pended launch event %{public}@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = [v5 identifier];
    [v6 didHandleLaunchEvent:v7];
  }
}

- (void)continuitySessionStateMachineDidUpdateState:(id)a3 oldState:(unint64_t)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 state];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  uint64_t v10 = SBLogContinuitySession();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = NSStringFromSBContinuitySessionState(a4);
    *(_DWORD *)buf = 138543618;
    id v53 = v7;
    __int16 v54 = 2114;
    v55 = v11;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[Session] State machine update - %{public}@ oldState: %{public}@", buf, 0x16u);
  }
  if (v8 != a4)
  {
    switch(v8)
    {
      case 1:
        if (self->_authenticationSessionAssertion)
        {
          uint64_t v16 = SBLogContinuitySession();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[Session] blocked: dropping lock state assertion", buf, 2u);
          }

          [(BSInvalidatable *)self->_authenticationSessionAssertion invalidate];
          authenticationSessionAssertion = self->_authenticationSessionAssertion;
          self->_authenticationSessionAssertion = 0;

          [(_SBContinuitySessionStateMachine *)self->_stateMachine setAutomaticBiometricsDisabled:0];
        }
        break;
      case 2:
        uint64_t v18 = SBLogContinuitySession();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "[Session] preparing: acquiring lock state assertion", buf, 2u);
        }

        if (self->_authenticationSessionAssertion)
        {
          id v41 = [MEMORY[0x1E4F28B00] currentHandler];
          [v41 handleFailureInMethod:a2 object:self file:@"SBContinuitySession.m" lineNumber:625 description:@"already tracking lock state assertion"];
        }
        uint64_t v19 = [(SBContinuityDisplayAuthenticationCoordinator *)self->_authenticationCoordinator acquireContinuityDisplayActiveAssertionForReason:@"ready"];
        id v20 = self->_authenticationSessionAssertion;
        self->_authenticationSessionAssertion = v19;

        [(_SBContinuitySessionStateMachine *)self->_stateMachine setAutomaticBiometricsDisabled:1];
        break;
      case 3:
        id v21 = SBLogContinuitySession();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "[Session] waitingForRemoteUnlock", buf, 2u);
        }
        goto LABEL_30;
      case 4:
        id v21 = SBLogContinuitySession();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "[Session] waitingForScenes", buf, 2u);
        }
        goto LABEL_30;
      case 5:
        id v21 = SBLogContinuitySession();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "[Session] waitingForHIDServices", buf, 2u);
        }
LABEL_30:

        break;
      case 6:
        __int16 v22 = SBLogContinuitySession();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "[Session] activating", buf, 2u);
        }

        if (!self->_keepDisplayLinkActiveAssertion)
        {
          uint64_t v23 = [(SBDisplayLinkController *)self->_displayLinkController maintainDisplayLinkWhenBacklightIsOffForReason:@"SBContinuitySessionStateActivating"];
          keepDisplayLinkActiveAssertion = self->_keepDisplayLinkActiveAssertion;
          self->_keepDisplayLinkActiveAssertion = v23;
        }
        break;
      case 7:
        uint64_t v25 = SBLogContinuitySession();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "[Session] updatingActiveDisplay", buf, 2u);
        }

        id v26 = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
        if (!v26)
        {
          id v42 = [MEMORY[0x1E4F28B00] currentHandler];
          [v42 handleFailureInMethod:a2 object:self file:@"SBContinuitySession.m" lineNumber:652 description:@"Where is the main window scene?"];
        }
        [(SBMultiDisplayUserInteractionCoordinator *)self->_multiDisplayUserInteractionCoordinator updateActiveWindowScene:v26 forUserInteraction:@"continuity.activation"];
        [(_SBContinuitySessionStateMachine *)self->_stateMachine noteActiveDisplayUpdated];

        break;
      case 8:
        v27 = SBLogContinuitySession();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "[Session] launching", buf, 2u);
        }

        [(SBContinuitySession *)self _handlePendedLaunchEventIfNecessaryAnimatedly:0];
        break;
      case 9:
        id v28 = SBLogContinuitySession();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "[Session] flushing: performing flush", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        uiFlusher = self->_uiFlusher;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __76__SBContinuitySession_continuitySessionStateMachineDidUpdateState_oldState___block_invoke;
        v49[3] = &unk_1E6AF4B10;
        objc_copyWeak(&v50, (id *)buf);
        [(SBContinuityUIFlushing *)uiFlusher flushUIWithCompletion:v49];
        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);
        break;
      case 10:
        id v30 = SBLogContinuitySession();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "[Session] Lifecycle event: didActivateSession", buf, 2u);
        }

        if (self->_continuityButtonActions)
        {
          id v43 = [MEMORY[0x1E4F28B00] currentHandler];
          [v43 handleFailureInMethod:a2 object:self file:@"SBContinuitySession.m" lineNumber:677 description:@"already have continuity button actions"];
        }
        if (!WeakRetained)
        {
          id v44 = [MEMORY[0x1E4F28B00] currentHandler];
          [v44 handleFailureInMethod:a2 object:self file:@"SBContinuitySession.m" lineNumber:678 description:@"Where is the window scene???"];
        }
        uint64_t v31 = [(SBContinuitySession *)self _newContinuityButtonActionsForWindowScene:WeakRetained];
        continuityButtonActions = self->_continuityButtonActions;
        self->_continuityButtonActions = v31;

        [(SBContinuityDisplayLayoutPublisher *)self->_displayLayoutPublisher activate];
        [(SBContinuitySession *)self _handlePendedLaunchEventIfNecessaryAnimatedly:1];
        break;
      case 11:
        v33 = SBLogContinuitySession();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_DEFAULT, "[Session] Lifecycle event: didEndSession", buf, 2u);
        }

        v34 = SBLogContinuitySession();
        if (os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D85BA000, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_SESSION", (const char *)&unk_1D8FE2CAB, buf, 2u);
        }

        stateMachine = self->_stateMachine;
        v36 = [(_SBContinuitySessionStateMachine *)stateMachine reasons];
        [(_SBContinuitySessionStateMachine *)stateMachine invalidateForReasons:v36];

        [(BSInvalidatable *)self->_authenticationSessionAssertion invalidate];
        v37 = self->_authenticationSessionAssertion;
        self->_authenticationSessionAssertion = 0;

        [(BSInvalidatable *)self->_keepDisplayLinkActiveAssertion invalidate];
        v38 = self->_keepDisplayLinkActiveAssertion;
        self->_keepDisplayLinkActiveAssertion = 0;

        [(SBContinuityButtonActions *)self->_continuityButtonActions invalidate];
        id v39 = self->_continuityButtonActions;
        self->_continuityButtonActions = 0;

        [(SBContinuityDisplayLayoutPublisher *)self->_displayLayoutPublisher invalidate];
        displayLayoutPublisher = self->_displayLayoutPublisher;
        self->_displayLayoutPublisher = 0;

        self->_invalid = 1;
        break;
      default:
        break;
    }
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v12 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * i) continuitySessionDidUpdateState:self];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v13);
  }
}

void __76__SBContinuitySession_continuitySessionStateMachineDidUpdateState_oldState___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] noteUIFlushed];
    id WeakRetained = v2;
  }
}

- (id)sceneManagerforContinuityScreenshotManager:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  uint64_t v4 = [WeakRetained sceneManager];

  return v4;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  int v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke;
  v33[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v34 = v5;
  v35 = self;
  [v5 appendProem:self block:v33];
  if (([v5 hasSuccinctStyle] & 1) == 0)
  {
    id v6 = (id)[v5 appendObject:self->_stateMachine withName:@"stateMachine"];
    id v7 = (id)[v5 appendObject:self->_continuitySessionServiceClient withName:@"client"];
    int v8 = [v5 hasDebugStyle];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    if (v8)
    {
      id v10 = (id)[v5 appendObject:WeakRetained withName:@"windowScene"];

      id v11 = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
      id v12 = (id)[v5 appendObject:v11 withName:@"mainWindowScene" skipIfNil:1];

      id v13 = objc_loadWeakRetained((id *)&self->_systemApertureScene);
      id v14 = (id)[v5 appendObject:v13 withName:@"systemApertureSceneIdentifier"];

      id v15 = objc_loadWeakRetained((id *)&self->_systemApertureCurtainScene);
      id v16 = (id)[v5 appendObject:v15 withName:@"curtainSceneIdentifier"];
    }
    else
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke_3;
      v30[3] = &unk_1E6AF5290;
      id v17 = v5;
      id v31 = v17;
      id v15 = WeakRetained;
      id v32 = v15;
      [v17 appendProem:v15 block:v30];
      id v18 = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
      if (v18)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke_4;
        v27[3] = &unk_1E6AF5290;
        id v28 = v17;
        id v29 = v18;
        [v28 appendProem:v29 block:v27];
      }
      id v19 = objc_loadWeakRetained((id *)&self->_systemApertureScene);
      if (v19)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke_5;
        v24[3] = &unk_1E6AF5290;
        id v25 = v17;
        id v26 = v19;
        [v25 appendProem:v26 block:v24];
      }
      id v20 = objc_loadWeakRetained((id *)&self->_systemApertureCurtainScene);
      if (v20)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke_6;
        v21[3] = &unk_1E6AF5290;
        id v22 = v17;
        id v23 = v20;
        [v22 appendProem:v23 block:v21];
      }
    }
  }
}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F4F728] collectionLineBreakNoneStyle];
  int v3 = *(void **)(a1 + 32);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __49__SBContinuitySession_appendDescriptionToStream___block_invoke_2;
  id v17 = &unk_1E6AF5290;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  id v18 = v4;
  uint64_t v19 = v5;
  [v4 overlayStyle:v2 block:&v14];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasSuccinctStyle", v14, v15, v16, v17) & 1) == 0)
  {
    id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 216) withName:@"displayHardwareIdentifier" skipIfNil:1];
    id v7 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 184) withName:@"appearanceSettings"];
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = BSInterfaceOrientationDescription();
    id v10 = (id)[v8 appendObject:v9 withName:@"currentInterfaceOrientation"];

    id v11 = *(void **)(a1 + 32);
    id v12 = BSInterfaceOrientationMaskDescription();
    id v13 = (id)[v11 appendObject:v12 withName:@"supportedInterfaceOrientations"];
  }
}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  int v3 = NSStringFromSBContinuitySessionState([*(id *)(a1 + 40) state]);
  [v2 appendString:v3 withName:0];

  id v4 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) reasons];
  id v5 = (id)[v4 appendObject:v6 withName:0];
}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _sceneIdentifier];
  id v2 = (id)[v1 appendObject:v3 withName:@"sceneIdentifier"];
}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _sceneIdentifier];
  id v2 = (id)[v1 appendObject:v3 withName:@"mainSceneIdentifier"];
}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _sceneIdentifier];
  id v2 = (id)[v1 appendObject:v3 withName:@"systemApertureSceneIdentifier"];
}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _sceneIdentifier];
  id v2 = (id)[v1 appendObject:v3 withName:@"curtainSceneIdentifier"];
}

- (void)_invalidateForReasons:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogContinuitySession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = _SBFLoggingMethodProem();
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (!self->_invalid)
  {
    unint64_t v7 = [(SBContinuitySession *)self state];
    [(_SBContinuitySessionStateMachine *)self->_stateMachine invalidateForReasons:v4];
    if (v7 != 11) {
      [(SBContinuitySession *)self continuitySessionStateMachineDidUpdateState:self->_stateMachine oldState:v7];
    }
  }
}

- (NSString)displayHardwareIdentifier
{
  return self->_displayHardwareIdentifier;
}

- (SBContinuitySessionOrientationDelegate)orientationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_orientationDelegate);
  return (SBContinuitySessionOrientationDelegate *)WeakRetained;
}

- (void)setOrientationDelegate:(id)a3
{
}

- (BSInvalidatable)authenticationSessionAssertion
{
  return self->_authenticationSessionAssertion;
}

- (void)setAuthenticationSessionAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationSessionAssertion, 0);
  objc_destroyWeak((id *)&self->_orientationDelegate);
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_screenRecordingObservers, 0);
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_appearanceSettings, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleProvider, 0);
  objc_storeStrong((id *)&self->_keepDisplayLinkActiveAssertion, 0);
  objc_storeStrong((id *)&self->_pendingLaunchEvent, 0);
  objc_storeStrong((id *)&self->_continuitySessionServiceClient, 0);
  objc_storeStrong((id *)&self->_orientationObservers, 0);
  objc_destroyWeak((id *)&self->_systemApertureCurtainScene);
  objc_destroyWeak((id *)&self->_systemApertureScene);
  objc_destroyWeak((id *)&self->_mainSBWindowScene);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_continuityButtonActions, 0);
  objc_storeStrong((id *)&self->_screenshotManager, 0);
  objc_storeStrong((id *)&self->_multiDisplayUserInteractionCoordinator, 0);
  objc_storeStrong((id *)&self->_launchEventExecutor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_uiFlusher, 0);
  objc_storeStrong((id *)&self->_displayLinkController, 0);
  objc_storeStrong((id *)&self->_buttonActionsFactory, 0);
  objc_storeStrong((id *)&self->_authenticationCoordinator, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

- (void)continuitySessionServiceClient:(os_log_t)log updatedAppearanceSettings:transitionContext:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "[Session] updated appearance setting - user interface style", v1, 2u);
}

@end