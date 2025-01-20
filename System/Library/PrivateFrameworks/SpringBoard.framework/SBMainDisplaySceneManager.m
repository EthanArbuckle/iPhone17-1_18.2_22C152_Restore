@interface SBMainDisplaySceneManager
- (BOOL)_handleAction:(id)a3 forScene:(id)a4;
- (BOOL)_isExternalForegroundScene:(id)a3;
- (BOOL)_isLockscreenHostingApp:(id)a3;
- (BOOL)_shouldAutoHostScene:(id)a3;
- (BOOL)_shouldFenceTransitionForScene:(id)a3 updatedClientSettingsDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (BOOL)_shouldTrackScenesForDeactivation;
- (BOOL)hasIdleTimerBehaviors;
- (BOOL)isSuspendedUnderLock;
- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventSuspendUnderLockForScene:(id)a4 settings:(id)a5;
- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventUnderLockForScene:(id)a4;
- (SBIdleTimerCoordinating)idleTimerCoordinator;
- (SBMainDisplayPolicyAggregator)policyAggregator;
- (SBMainDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5;
- (SBMainDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6;
- (SBPhysicalButtonSceneOverrideManager)physicalButtonSceneOverrideManager;
- (id)_appSceneClientSettingsDiffInspector;
- (id)_externalClientSettingsDiffInspector;
- (id)_internalClientSettingsDiffInspector;
- (id)_proposeIdleTimerBehaviorForReason:(id)a3;
- (id)_windowScene;
- (id)acquireIgnoreSuspendedUnderLockAssertionForSceneIdentifier:(id)a3 reason:(id)a4;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)existingSceneHandleForPersistenceIdentifier:(id)a3;
- (id)existingSceneHandleForScene:(id)a3;
- (id)existingSceneHandleForSceneIdentity:(id)a3;
- (id)externalApplicationSceneHandles;
- (id)externalForegroundApplicationSceneHandles;
- (id)fetchOrCreateApplicationSceneHandleForRequest:(id)a3;
- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5;
- (id)layoutStateManager;
- (id)sceneSnapshotRequestStrategyForSceneSnapshotRequestor:(id)a3;
- (id)suspendedUnderLockManager:(id)a3 sceneHandleForScene:(id)a4;
- (id)suspendedUnderLockManagerDisplayConfiguration:(id)a3;
- (id)suspendedUnderLockManagerVisibleScenes:(id)a3;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_noteDidChangeToVisibility:(unint64_t)a3 previouslyExisted:(BOOL)a4 forScene:(id)a5;
- (void)_noteDidCommitUpdateForScene:(id)a3;
- (void)_scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)_scene:(id)a3 interceptUpdateWithNewSettings:(id)a4;
- (void)_scene:(id)a3 willUpdateWithSettings:(id)a4 transitionContext:(id)a5;
- (void)_updateLevelAndBackgroundSettingsForScene:(id)a3 transitionContext:(id)a4;
- (void)addActionHandler:(id)a3 forScene:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)displayReferenceModeStatusDidChangeForDisplayWithConfiguration:(id)a3 newStatus:(int64_t)a4;
- (void)removeActionHandler:(id)a3 forScene:(id)a4;
- (void)removeObserver:(id)a3;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)sceneManager:(id)a3 didDestroyScene:(id)a4;
- (void)setIdleTimerCoordinator:(id)a3;
- (void)setSuspendedUnderLock:(BOOL)a3;
- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5;
- (void)windowSceneDidConnect:(id)a3;
@end

@implementation SBMainDisplaySceneManager

- (id)existingSceneHandleForScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBMainDisplaySceneManager;
  v3 = [(SBSceneManager *)&v5 existingSceneHandleForScene:a3];
  return v3;
}

- (id)existingSceneHandleForSceneIdentity:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBMainDisplaySceneManager;
  v3 = [(SBSceneManager *)&v5 existingSceneHandleForSceneIdentity:a3];
  return v3;
}

- (void)_noteDidCommitUpdateForScene:(id)a3
{
  id v15 = a3;
  if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) == 0)
  {
    v4 = [v15 identifier];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4F71DE8]];

    if (v5) {
      [(SBMainDisplaySceneManager *)self _updateLevelAndBackgroundSettingsForScene:v15 transitionContext:0];
    }
  }
  if ([(SBMainDisplaySceneManager *)self _isExternalForegroundScene:v15])
  {
    v6 = [v15 clientProcess];
    if ([v6 isApplicationProcess])
    {
      v7 = +[SBApplicationController sharedInstance];
      v8 = [v6 bundleIdentifier];
      v9 = [v7 applicationWithBundleIdentifier:v8];
    }
    else
    {
      v9 = 0;
    }
    v10 = [(id)SBApp appsRegisteredForVolumeEvents];
    int v11 = [v10 containsObject:v9];

    if (v11) {
      [(id)SBApp setAppRegisteredForVolumeEvents:v9 isActive:1];
    }
    v12 = [(id)SBApp appsRegisteredForLockButtonEvents];
    int v13 = [v12 containsObject:v9];

    if (v13) {
      [(id)SBApp setAppRegisteredForLockButtonEvents:v9 isActive:1];
    }
    v14 = [(SBMainDisplaySceneManager *)self existingSceneHandleForScene:v15];
    [v14 setHasMainSceneBeenForegroundAtLeastOnce:1];
  }
  [(SBFaceContactExpectationManager *)self->_faceContactExpectationManager updateFaceContactExpectation];
}

- (BOOL)_isExternalForegroundScene:(id)a3
{
  v4 = [(SBMainDisplaySceneManager *)self existingSceneHandleForScene:a3];
  if (v4)
  {
    int v5 = [(SBMainDisplaySceneManager *)self externalForegroundApplicationSceneHandles];
    char v6 = [v5 containsObject:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(SBSceneManager *)self daemonScenes];
  if ([v14 containsObject:v10])
  {

LABEL_3:
    id v15 = objc_alloc_init(SBClientSettingObserverContext);
    -[SBKeyboardClientSettingObserverContext setScene:]((uint64_t)v15, v10);
    v16 = [(SBMainDisplaySceneManager *)self existingSceneHandleForScene:v10];
    -[SBKeyboardClientSettingObserverContext setOldClientSettings:]((uint64_t)v15, v16);

    -[SBCameraHardwareButton setDispatchingRuleAssertion:]((uint64_t)v15, v12);
    -[SBCameraHardwareButton setDeferringRuleAssertion:]((uint64_t)v15, v13);
    v17 = [(SBMainDisplaySceneManager *)self _externalClientSettingsDiffInspector];
    [v11 evaluateWithInspector:v17 context:v15];
LABEL_4:

    goto LABEL_11;
  }
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
  }
  else
  {
    v18 = [v10 identifier];
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4F71DE8]];

    if (v19) {
      goto LABEL_3;
    }
  }
  id v15 = [v10 clientProcess];
  if ([(SBClientSettingObserverContext *)v15 isCurrentProcess])
  {
    v20 = [v10 clientSettings];
    int v21 = [v20 isUISubclass];

    if (v21)
    {
      v17 = objc_alloc_init(SBInternalClientSettingObserverContext);
      -[SBKeyboardClientSettingObserverContext setScene:]((uint64_t)v17, v10);
      v22 = [(SBMainDisplaySceneManager *)self existingSceneHandleForScene:v10];
      -[SBKeyboardClientSettingObserverContext setOldClientSettings:]((uint64_t)v17, v22);

      -[SBCameraHardwareButton setDispatchingRuleAssertion:]((uint64_t)v17, v12);
      v23 = [v10 uiClientSettings];
      -[SBCameraHardwareButton setDeferringRuleAssertion:]((uint64_t)v17, v23);

      -[SBCameraHardwareButton setPhysicalButtonOverrideObserver:]((uint64_t)v17, v13);
      v24 = [(SBMainDisplaySceneManager *)self _internalClientSettingsDiffInspector];
      [v11 evaluateWithInspector:v24 context:v17];

      goto LABEL_4;
    }
  }
LABEL_11:

  v25.receiver = self;
  v25.super_class = (Class)SBMainDisplaySceneManager;
  [(SBSceneManager *)&v25 _scene:v10 didUpdateClientSettingsWithDiff:v11 oldClientSettings:v12 transitionContext:v13];
}

- (void)_scene:(id)a3 willUpdateWithSettings:(id)a4 transitionContext:(id)a5
{
  id v25 = a3;
  id v7 = a4;
  v8 = (void *)SBApp;
  v9 = NSString;
  id v10 = [v25 identifier];
  id v11 = [v9 stringWithFormat:@"Workspace will update scene with identifier %@", v10];
  [v8 updateMirroredDisplayOrientationWithLogMessage:v11];

  id v12 = [(SBMainDisplaySceneManager *)self existingSceneHandleForScene:v25];
  id v13 = [v25 settings];
  v14 = [(SBMainDisplaySceneManager *)self externalForegroundApplicationSceneHandles];
  int v15 = [v14 containsObject:v12];

  if (v12 && v15)
  {
    int v16 = [v13 isOccluded] ? objc_msgSend(v13, "isIgnoringOcclusions") : 1;
    int v17 = [v7 isOccluded] ? objc_msgSend(v7, "isIgnoringOcclusions") ^ 1 : 0;
    if (((v16 | v17) & 1) == 0) {
      id v18 = [(SBMainDisplaySceneManager *)self _proposeIdleTimerBehaviorForReason:@"SBApplicationSceneHandle"];
    }
  }
  int v19 = [v13 isForeground];
  int v20 = [v7 isForeground];
  if (v12)
  {
    int v21 = v20;
    v22 = [(SBMainDisplaySceneManager *)self externalApplicationSceneHandles];
    int v23 = [v22 containsObject:v12];

    if (((v19 ^ 1 | v21) & 1) == 0 && v23 && ([v12 shouldAlwaysDisplayLiveContent] & 1) == 0)
    {
      v24 = [v25 createSnapshot];
      [v12 saveSuspendSnapshot:v24];
    }
  }
}

- (id)externalForegroundApplicationSceneHandles
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySceneManager;
  v2 = [(SBSceneManager *)&v4 externalForegroundApplicationSceneHandles];
  return v2;
}

- (id)externalApplicationSceneHandles
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySceneManager;
  v2 = [(SBSceneManager *)&v4 externalApplicationSceneHandles];
  return v2;
}

- (void)_scene:(id)a3 interceptUpdateWithNewSettings:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = [(SBMainDisplaySceneManager *)self existingSceneHandleForScene:v23];
  if (v7) {
    [(SBSuspendedUnderLockManager *)self->_lazy_suspendedUnderLockManager interceptUpdateForScene:v23 withNewSettings:v6];
  }
  v8 = [v23 settings];
  char v9 = [v8 isForeground];
  char v10 = v9 ^ [v6 isForeground];

  if (v10)
  {
    if (([v6 isUISubclass] & 1) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
    v8 = [v23 settings];
    if (([v8 isForeground] & 1) == 0 || !objc_msgSend(v6, "isUISubclass"))
    {

      goto LABEL_12;
    }
  }
  id v11 = [(SBSceneManager *)self displayIdentity];
  id v12 = [v11 currentConfiguration];
  BOOL v13 = +[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:v12];

  if (v10)
  {
    if (!v13) {
      goto LABEL_12;
    }
  }
  else
  {

    if (!v13) {
      goto LABEL_12;
    }
  }
  displayReferenceModeMonitor = self->_displayReferenceModeMonitor;
  if (!displayReferenceModeMonitor)
  {
    int v15 = objc_alloc_init(SBDisplayReferenceModeMonitor);
    int v16 = self->_displayReferenceModeMonitor;
    self->_displayReferenceModeMonitor = v15;

    int v17 = self->_displayReferenceModeMonitor;
    id v18 = [(SBSceneManager *)self displayIdentity];
    int v19 = [v18 currentConfiguration];
    [(SBDisplayReferenceModeMonitor *)v17 addReferenceModeStatusObserver:self forDisplayWithConfiguration:v19];

    displayReferenceModeMonitor = self->_displayReferenceModeMonitor;
  }
  int v20 = [(SBSceneManager *)self displayIdentity];
  int v21 = [v20 currentConfiguration];
  uint64_t v22 = [(SBDisplayReferenceModeMonitor *)displayReferenceModeMonitor referenceModeStatusForDisplayWithConfiguration:v21];

  if (objc_opt_respondsToSelector()) {
    [v6 setScreenReferenceDisplayModeStatus:v22];
  }
LABEL_12:
}

- (id)_appSceneClientSettingsDiffInspector
{
  appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  if (!appClientSettingsDiffInspector)
  {
    objc_super v4 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
    int v5 = self->_appClientSettingsDiffInspector;
    self->_appClientSettingsDiffInspector = v4;

    id v6 = self->_appClientSettingsDiffInspector;
    v8 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v7, &__block_literal_global_160_2);
    [(UIApplicationSceneClientSettingsDiffInspector *)v6 observeDefaultStatusBarStyleWithBlock:v8];

    char v9 = self->_appClientSettingsDiffInspector;
    id v11 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v10, &__block_literal_global_162_0);
    [(UIApplicationSceneClientSettingsDiffInspector *)v9 observeDefaultStatusBarHiddenWithBlock:v11];

    id v12 = self->_appClientSettingsDiffInspector;
    v14 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v13, &__block_literal_global_164_1);
    [(UIApplicationSceneClientSettingsDiffInspector *)v12 observeDefaultPNGNameWithBlock:v14];

    int v15 = self->_appClientSettingsDiffInspector;
    int v17 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v16, &__block_literal_global_166_2);
    [(UIApplicationSceneClientSettingsDiffInspector *)v15 observeDefaultPNGExpirationTimeWithBlock:v17];

    id v18 = self->_appClientSettingsDiffInspector;
    int v20 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v19, &__block_literal_global_168);
    [(UIApplicationSceneClientSettingsDiffInspector *)v18 observeIdleTimerDisabledWithBlock:v20];

    int v21 = self->_appClientSettingsDiffInspector;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_177;
    v47[3] = &unk_1E6B0A778;
    v47[4] = self;
    id v23 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v22, v47);
    [(UIApplicationSceneClientSettingsDiffInspector *)v21 observeProximityDetectionModesWithBlock:v23];

    v24 = self->_appClientSettingsDiffInspector;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2_178;
    v46[3] = &unk_1E6B0A778;
    v46[4] = self;
    v26 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v25, v46);
    [(UIApplicationSceneClientSettingsDiffInspector *)v24 observeBackgroundStyleWithBlock:v26];

    v27 = self->_appClientSettingsDiffInspector;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_5_185;
    v45[3] = &unk_1E6B0A778;
    v45[4] = self;
    v29 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v28, v45);
    [(UIApplicationSceneClientSettingsDiffInspector *)v27 observeWindowOverlayInsetsWithBlock:v29];

    v30 = self->_appClientSettingsDiffInspector;
    v32 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v31, &__block_literal_global_188);
    [(UIApplicationSceneClientSettingsDiffInspector *)v30 observeReachabilitySupportedWithBlock:v32];

    v33 = self->_appClientSettingsDiffInspector;
    v35 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v34, &__block_literal_global_192);
    [(UIApplicationSceneClientSettingsDiffInspector *)v33 observeBrightnessLevelWithBlock:v35];

    v36 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v37 = [v36 userInterfaceIdiom];

    if ((v37 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v38 = [(UIApplicationSceneClientSettingsDiffInspector *)self->_appClientSettingsDiffInspector observeActivationConditionsDataWithBlock:&__block_literal_global_194_0];
    }
    v39 = self->_appClientSettingsDiffInspector;
    v40 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v38, &__block_literal_global_199_0);
    [(UIApplicationSceneClientSettingsDiffInspector *)v39 observeCanvasTitleWithBlock:v40];

    v41 = self->_appClientSettingsDiffInspector;
    v43 = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v42, &__block_literal_global_202_0);
    [(UIApplicationSceneClientSettingsDiffInspector *)v41 observePreferredPointerLockStateWithBlock:v43];

    appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  }
  return appClientSettingsDiffInspector;
}

- (id)_internalClientSettingsDiffInspector
{
  internalClientSettingsDiffInspector = self->_internalClientSettingsDiffInspector;
  if (!internalClientSettingsDiffInspector)
  {
    objc_super v4 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
    int v5 = self->_internalClientSettingsDiffInspector;
    self->_internalClientSettingsDiffInspector = v4;

    id v6 = self->_internalClientSettingsDiffInspector;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_3;
    v14[3] = &unk_1E6B0A750;
    v14[4] = self;
    v8 = __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke(v7, v14);
    [(UIApplicationSceneClientSettingsDiffInspector *)v6 observeProximityDetectionModesWithBlock:v8];

    char v9 = self->_internalClientSettingsDiffInspector;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_4;
    v13[3] = &unk_1E6B0A750;
    v13[4] = self;
    id v11 = __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke(v10, v13);
    [(UIApplicationSceneClientSettingsDiffInspector *)v9 observePhysicalButtonConfigurationsWithBlock:v11];

    internalClientSettingsDiffInspector = self->_internalClientSettingsDiffInspector;
  }
  return internalClientSettingsDiffInspector;
}

uint64_t __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SBMainDisplayPolicyAggregator)policyAggregator
{
  return self->_policyAggregator;
}

- (BOOL)_shouldTrackScenesForDeactivation
{
  return 1;
}

- (BOOL)_shouldAutoHostScene:(id)a3
{
  id v3 = a3;
  if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) != 0
    || (objc_super v4 = (void *)*MEMORY[0x1E4F71DE8],
        [v3 identifier],
        int v5 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = [v4 isEqualToString:v5],
        v5,
        (v4 & 1) == 0))
  {
    uint64_t v7 = [v3 clientProcess];
    BOOL v6 = ![v7 isApplicationProcess] || objc_msgSend(v7, "isCurrentProcess");
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)layoutStateManager
{
  id v3 = [(id)SBApp windowSceneManager];
  objc_super v4 = [(SBSceneManager *)self displayIdentity];
  int v5 = [v3 windowSceneForDisplayIdentity:v4];

  BOOL v6 = [v5 layoutStateManager];

  return v6;
}

- (void)_noteDidChangeToVisibility:(unint64_t)a3 previouslyExisted:(BOOL)a4 forScene:(id)a5
{
  BOOL v5 = a4;
  id v21 = a5;
  v8 = [v21 clientProcess];
  if ([v8 isApplicationProcess])
  {
    char v9 = +[SBApplicationController sharedInstance];
    uint64_t v10 = [v8 bundleIdentifier];
    id v11 = [v9 applicationWithBundleIdentifier:v10];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = [(SBMainDisplaySceneManager *)self existingSceneHandleForScene:v21];
  uint64_t v13 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  }
  uint64_t v16 = v15;

  int v17 = +[SBBackgroundActivityAttributionManager sharedInstance];
  [v17 updateForegroundApplicationSceneHandles:v16 withOptions:-1 completion:0];

  if (v11) {
    [v11 setHasProminentlyIndicatedLocationUseWhileForeground:0];
  }
  if (a3 == 1)
  {
    if (v11)
    {
      if ([v11 hasRegisteredBackgroundActivityWithIdentifier:*MEMORY[0x1E4FA95C0]]) {
        [(id)SBApp nowLocatingAppDidEnterForeground:v11];
      }
      [v12 _setIdleTimerCoordinator:self];
      id v20 = [(SBMainDisplaySceneManager *)self _proposeIdleTimerBehaviorForReason:@"SBAppDidEnterForeground"];
    }
  }
  else if (!a3 && v11)
  {
    [v12 _setIdleTimerCoordinator:0];
    if (v5) {
      id v18 = [(SBMainDisplaySceneManager *)self _proposeIdleTimerBehaviorForReason:@"SBAppDidEnterBackground"];
    }
    uint64_t v19 = [(id)SBApp audioRecordingManager];
    [v19 verifyBackgroundAudioActivityForApplication:v11];
  }
}

- (id)_proposeIdleTimerBehaviorForReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBMainDisplaySceneManager *)self coordinatorRequestedIdleTimerBehavior:self];
  BOOL v6 = [(SBMainDisplaySceneManager *)self idleTimerCoordinator];
  uint64_t v7 = [v6 idleTimerProvider:self didProposeBehavior:v5 forReason:v4];

  return v7;
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  return (SBIdleTimerCoordinating *)WeakRetained;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v5 = [(SBMainDisplaySceneManager *)self _windowScene];
  BOOL v6 = [v5 switcherController];
  uint64_t v7 = [v6 layoutStateApplicationSceneHandles];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__SBMainDisplaySceneManager_coordinatorRequestedIdleTimerBehavior___block_invoke;
  v10[3] = &unk_1E6B0A810;
  v10[4] = &v11;
  [v7 enumerateObjectsUsingBlock:v10];

  if (*((unsigned char *)v12 + 24)) {
    +[SBIdleTimerBehavior disabledBehavior];
  }
  else {
  v8 = +[SBIdleTimerBehavior autoLockBehavior];
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (BOOL)hasIdleTimerBehaviors
{
  v2 = [(SBMainDisplaySceneManager *)self _windowScene];
  id v3 = [v2 switcherController];
  id v4 = [v3 layoutStateApplicationSceneHandles];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (id)_windowScene
{
  id v3 = [(id)SBApp windowSceneManager];
  id v4 = [(SBSceneManager *)self displayIdentity];
  BOOL v5 = [v3 windowSceneForDisplayIdentity:v4];

  return v5;
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 updatedClientSettings];
  int v4 = [v3 idleTimerDisabled];

  BOOL v5 = [v2 settings];
  int v6 = [v5 isForeground];

  uint64_t v7 = SBLogIdleTimer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v2 scene];
    char v9 = (void *)v8;
    uint64_t v10 = "NO";
    if (v4) {
      uint64_t v10 = "YES";
    }
    uint64_t v11 = " (ignoring because isBackgrounded)";
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v8;
    id v20 = v10;
    __int16 v19 = 2080;
    if (v6) {
      uint64_t v11 = "";
    }
    __int16 v21 = 2080;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ is setting idleTimerDisabled to: %s%s", buf, 0x20u);
  }
  if (v6)
  {
    id v12 = [v2 scene];
    uint64_t v13 = [v12 clientProcess];
    char v14 = [v13 bundleIdentifier];

    id v15 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    uint64_t v16 = [NSString stringWithFormat:@"%@%@", @"IdleTimerDisableChangedForMainDisplaySceneManager - client:", v14];
    [v15 resetIdleTimerForReason:v16];
  }
}

void __67__SBMainDisplaySceneManager_coordinatorRequestedIdleTimerBehavior___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = [v5 sceneIfExists];
  if ([v6 isValid])
  {
    uint64_t v7 = [v6 uiClientSettings];
    int v8 = [v7 idleTimerDisabled];

    char v9 = [v6 clientProcess];
    if ([v9 isApplicationProcess]) {
      int v10 = [v9 isBeingDebugged];
    }
    else {
      int v10 = 0;
    }
    if ((v8 | v10) == 1)
    {
      uint64_t v11 = SBLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v5 sceneIdentifier];
        v14[0] = 67109890;
        v14[1] = v8;
        __int16 v15 = 1024;
        int v16 = v10;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        __int16 v19 = 2048;
        id v20 = v5;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "found a scene that has disabled the idle timer (idleTimerDisabled: %d, isBeingDebugged: %d): %@ (%p)", (uint8_t *)v14, 0x22u);
      }
      uint64_t v13 = SBLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __67__SBMainDisplaySceneManager_coordinatorRequestedIdleTimerBehavior___block_invoke_cold_1((uint64_t)v5, v13);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_197(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v2 = [v10 updatedClientSettings];
  id v3 = [v2 canvasTitle];

  int v4 = [v10 app];
  id v5 = [v4 _dataStore];
  int v6 = [v10 scene];
  uint64_t v7 = [v6 identifier];
  int v8 = [v5 sceneStoreForIdentifier:v7 creatingIfNecessary:1];

  if (v3) {
    [v8 setObject:v3 forKey:@"canvasTitle"];
  }
  else {
    [v8 removeObjectForKey:@"canvasTitle"];
  }
  char v9 = [v10 sceneHandle];
  [v9 _noteSceneTitleChanged];
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_5_185(uint64_t a1, void *a2)
{
  id v28 = a2;
  id v3 = [v28 updatedClientSettings];
  [v3 primaryWindowOverlayInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [v28 app];

  uint64_t v13 = v28;
  if (v12)
  {
    char v14 = [v28 sceneHandle];
    __int16 v15 = [v14 sceneIdentifier];

    int v16 = [*(id *)(a1 + 32) currentLayoutState];
    __int16 v17 = [v16 elementWithRole:1];
    uint64_t v18 = [v17 uniqueIdentifier];
    char v19 = [v15 isEqualToString:v18];

    if (v19)
    {
      uint64_t v20 = 2;
    }
    else
    {
      uint64_t v21 = [v16 elementWithRole:2];
      uint64_t v22 = [v21 uniqueIdentifier];
      int v23 = [v15 isEqualToString:v22];

      if (!v23)
      {
LABEL_7:

        uint64_t v13 = v28;
        goto LABEL_8;
      }
      uint64_t v20 = 3;
    }
    v24 = [(id)SBApp windowSceneManager];
    uint64_t v25 = [*(id *)(a1 + 32) displayIdentity];
    v26 = [v24 windowSceneForDisplayIdentity:v25];
    v27 = [v26 pictureInPictureManager];

    objc_msgSend(v27, "applyPictureInPictureInsets:forSource:", v20, v5, v7, v9, v11);
    goto LABEL_7;
  }
LABEL_8:
}

- (id)fetchOrCreateApplicationSceneHandleForRequest:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBMainDisplaySceneManager;
  id v3 = [(SBSceneManager *)&v5 fetchOrCreateApplicationSceneHandleForRequest:a3];
  return v3;
}

- (BOOL)_shouldFenceTransitionForScene:(id)a3 updatedClientSettingsDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![(SBMainDisplaySceneManager *)self _isExternalForegroundScene:v10]) {
    goto LABEL_7;
  }
  char v14 = [v10 settings];
  [v14 deactivationReasons];
  if (!UIApplicationSceneDeactivationReasonMaskContainsReason())
  {

LABEL_7:
    v18.receiver = self;
    v18.super_class = (Class)SBMainDisplaySceneManager;
    BOOL v16 = [(SBSceneManager *)&v18 _shouldFenceTransitionForScene:v10 updatedClientSettingsDiff:v11 oldClientSettings:v12 transitionContext:v13];
    goto LABEL_8;
  }
  __int16 v15 = SBLogWorkspace();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v10;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "Not fencing scene transistion with scene: %{public}@ because it is deactivated for system gestures", buf, 0xCu);
  }

  BOOL v16 = 0;
LABEL_8:

  return v16;
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBMainDisplaySceneManager;
  [(SBSceneManager *)&v3 addObserver:a3];
}

- (id)suspendedUnderLockManager:(id)a3 sceneHandleForScene:(id)a4
{
  return [(SBMainDisplaySceneManager *)self existingSceneHandleForScene:a4];
}

void __52__SBMainDisplaySceneManager__handleAction_forScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) canSendResponse]) {
    [*(id *)(a1 + 32) sendResponse:v3];
  }
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_6_186(uint64_t a1, void *a2)
{
  id v2 = [a2 updatedClientSettings];
  char v3 = [v2 isReachabilitySupported];

  if ((v3 & 1) == 0)
  {
    id v4 = +[SBReachabilityManager sharedInstance];
    [v4 deactivateReachability];
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void *)[a4 mutableCopy];
  double v8 = [(NSMapTable *)self->_blsActionHandlersForScenes objectForKey:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) respondToActions:v7 forFBScene:v6];
        [v7 intersectSet:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  v14.receiver = self;
  v14.super_class = (Class)SBMainDisplaySceneManager;
  [(SBSceneManager *)&v14 scene:v6 didReceiveActions:v7];
}

- (BOOL)_handleAction:(id)a3 forScene:(id)a4
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 UIActionType];
  if (v8 > 14)
  {
    if (v8 == 15)
    {
      if (os_variant_has_internal_content())
      {
        id v24 = v6;
        if ([v24 shouldChangeOrientation])
        {
          uint64_t v25 = [v24 orientationRequested];
          if ((unint64_t)(v25 - 1) <= 3)
          {
            v41[0] = *MEMORY[0x1E4F22188];
            v26 = [NSNumber numberWithUnsignedInt:v25];
            v42[0] = v26;
            v41[1] = *MEMORY[0x1E4F22178];
            v27 = [NSNumber numberWithBool:0];
            v42[1] = v27;
            id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];

            v29 = [MEMORY[0x1E4F28C40] defaultCenter];
            [v29 postNotificationName:*MEMORY[0x1E4F22180] object:0 userInfo:v28 deliverImmediately:1];
          }
        }
      }
      goto LABEL_25;
    }
    if (v8 == 43)
    {
      uint64_t v37 = 0;
      uint64_t v38 = &v37;
      uint64_t v39 = 0x2050000000;
      long long v16 = (void *)getLNAppConnectionListenerClass_softClass;
      uint64_t v40 = getLNAppConnectionListenerClass_softClass;
      if (!getLNAppConnectionListenerClass_softClass)
      {
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __getLNAppConnectionListenerClass_block_invoke;
        v36[3] = &unk_1E6AF56B0;
        v36[4] = &v37;
        __getLNAppConnectionListenerClass_block_invoke((uint64_t)v36);
        long long v16 = (void *)v38[3];
      }
      id v17 = v16;
      _Block_object_dispose(&v37, 8);
      long long v18 = [v17 sharedListener];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __52__SBMainDisplaySceneManager__handleAction_forScene___block_invoke;
      v34[3] = &unk_1E6B066F0;
      id v35 = v6;
      [v18 handleAction:v35 completionHandler:v34];

      goto LABEL_25;
    }
LABEL_18:
    v33.receiver = self;
    v33.super_class = (Class)SBMainDisplaySceneManager;
    if ([(SBSceneManager *)&v33 _handleAction:v6 forScene:v7])
    {
LABEL_25:
      BOOL v23 = 1;
      goto LABEL_26;
    }
LABEL_21:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v23 = 0;
      goto LABEL_26;
    }
    v30 = [(SBMainDisplaySceneManager *)self existingSceneHandleForScene:v7];
    uint64_t v31 = v30;
    if (v30) {
      SBWorkspaceSuspendApplicationScene(v30);
    }

    goto LABEL_25;
  }
  if (v8 != 1)
  {
    if (v8 == 7)
    {
      if ([(SBMainDisplaySceneManager *)self _isExternalForegroundScene:v7])
      {
        [v6 statusBarStyleOverride];
        uint64_t v9 = STUIBackgroundActivityIdentifierForStyleOverride();
        uint64_t v10 = +[SBApplicationController sharedInstance];
        uint64_t v11 = [v7 clientProcess];
        uint64_t v12 = [v11 bundleIdentifier];
        id v13 = [v10 applicationWithBundleIdentifier:v12];
        objc_super v14 = [v7 identifier];
        long long v15 = [(SBMainDisplaySceneManager *)self _windowScene];
        SBWorkspaceHandleStatusBarReturnActionFromApp(v13, v14, v9, v15);
      }
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  char v19 = [v7 clientProcess];
  if (![v19 isCurrentProcess])
  {

    goto LABEL_21;
  }
  uint64_t v20 = (void *)SBApp;
  uint64_t v21 = [v6 url];
  uint64_t v22 = [v19 handle];
  BOOL v23 = 1;
  [v20 applicationOpenURL:v21 withApplication:0 animating:1 activationSettings:0 origin:v22 notifyLSOnFailure:1 withResult:0];

LABEL_26:
  return v23;
}

- (SBMainDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5
{
  return [(SBMainDisplaySceneManager *)self initWithReference:a3 sceneIdentityProvider:a4 presentationBinder:a5 snapshotBehavior:1];
}

- (SBMainDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v32.receiver = self;
  v32.super_class = (Class)SBMainDisplaySceneManager;
  id v13 = [(SBSceneManager *)&v32 initWithReference:v10 sceneIdentityProvider:v11 presentationBinder:v12 snapshotBehavior:a6];
  objc_super v14 = v13;
  if (v13)
  {
    v13->_validInterfaceOrientation = 0;
    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v14 selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x1E4F43B70] object:0];
    long long v16 = [SBMainDisplayPolicyAggregator alloc];
    id v17 = +[SBDefaults localDefaults];
    long long v18 = [(SBSceneManager *)v14 displayIdentity];
    uint64_t v19 = [(SBMainDisplayPolicyAggregator *)v16 initWithDefaults:v17 displayIdentity:v18];
    policyAggregator = v14->_policyAggregator;
    v14->_policyAggregator = (SBMainDisplayPolicyAggregator *)v19;

    uint64_t v21 = [[SBFaceContactExpectationManager alloc] initWithSceneManager:v14];
    faceContactExpectationManager = v14->_faceContactExpectationManager;
    v14->_faceContactExpectationManager = v21;

    BOOL v23 = -[SBPhysicalButtonSceneOverrideManager initWithSceneManager:]((id *)[SBPhysicalButtonSceneOverrideManager alloc], v14);
    physicalButtonSceneOverrideManager = v14->_physicalButtonSceneOverrideManager;
    v14->_physicalButtonSceneOverrideManager = (SBPhysicalButtonSceneOverrideManager *)v23;

    objc_initWeak(&location, v14);
    id v25 = MEMORY[0x1E4F14428];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v30, &location);
    uint64_t v26 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureInvalidatable = v14->stateCaptureInvalidatable;
    v14->stateCaptureInvalidatable = (BSInvalidatable *)v26;

    objc_msgSend(v11, "setDataSource:", v14, v29, 3221225472, __105__SBMainDisplaySceneManager_initWithReference_sceneIdentityProvider_presentationBinder_snapshotBehavior___block_invoke, &unk_1E6AF76A8);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v14;
}

id __105__SBMainDisplaySceneManager_initWithReference_sceneIdentityProvider_presentationBinder_snapshotBehavior___block_invoke(uint64_t a1)
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    v17[0] = @"externalApplicationSceneHandles";
    uint64_t v3 = [WeakRetained externalApplicationSceneHandles];
    id v4 = (void *)v3;
    if (v3) {
      objc_super v5 = (__CFString *)v3;
    }
    else {
      objc_super v5 = @"none";
    }
    v18[0] = v5;
    v17[1] = @"externalForegroundApplicationSceneHandles";
    uint64_t v6 = [v2 externalForegroundApplicationSceneHandles];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    else {
      uint64_t v8 = @"none";
    }
    v18[1] = v8;
    v17[2] = @"currentLayoutState";
    uint64_t v9 = [v2 currentLayoutState];
    id v10 = (void *)v9;
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    else {
      id v11 = @"none";
    }
    v18[2] = v11;
    v17[3] = @"hasIdleTimerBehaviors";
    if ([v2 hasIdleTimerBehaviors]) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    v18[3] = v12;
    v17[4] = @"suspendedUnderLock";
    if ([v2 isSuspendedUnderLock]) {
      id v13 = @"YES";
    }
    else {
      id v13 = @"NO";
    }
    v18[4] = v13;
    objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    long long v15 = [v14 description];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(UIApplicationSceneClientSettingsDiffInspector *)self->_internalClientSettingsDiffInspector removeAllObservers];
  [(UIApplicationSceneClientSettingsDiffInspector *)self->_appClientSettingsDiffInspector removeAllObservers];
  [(FBSSceneClientSettingsDiffInspector *)self->_externalClientSettingsDiffInspector removeAllObservers];
  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySceneManager;
  [(SBSceneManager *)&v4 dealloc];
}

- (id)existingSceneHandleForPersistenceIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBMainDisplaySceneManager;
  uint64_t v3 = [(SBSceneManager *)&v5 existingSceneHandleForPersistenceIdentifier:a3];
  return v3;
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBMainDisplaySceneManager;
  [(SBSceneManager *)&v3 removeObserver:a3];
}

- (BOOL)isSuspendedUnderLock
{
  BSDispatchQueueAssertMain();
  lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  return [(SBSuspendedUnderLockManager *)lazy_suspendedUnderLockManager isSuspendedUnderLock];
}

- (void)setSuspendedUnderLock:(BOOL)a3
{
}

- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5
{
  BOOL v6 = a3;
  id v15 = a4;
  id v8 = a5;
  BSDispatchQueueAssertMain();
  lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  if (!lazy_suspendedUnderLockManager)
  {
    id v10 = [SBSuspendedUnderLockManager alloc];
    id v11 = +[SBWorkspace mainWorkspace];
    id v12 = [v11 eventQueue];
    id v13 = [(SBSuspendedUnderLockManager *)v10 initWithDelegate:self eventQueue:v12];
    objc_super v14 = self->_lazy_suspendedUnderLockManager;
    self->_lazy_suspendedUnderLockManager = v13;

    lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  }
  [(SBSuspendedUnderLockManager *)lazy_suspendedUnderLockManager setSuspendedUnderLock:v6 alongsideWillChangeBlock:v15 alongsideDidChangeBlock:v8];
}

- (void)windowSceneDidConnect:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBMainDisplaySceneManager;
  id v4 = a3;
  [(SBSceneManager *)&v5 windowSceneDidConnect:v4];
  -[SBPhysicalButtonSceneOverrideManager windowSceneDidConnect:]((id *)&self->_physicalButtonSceneOverrideManager->super.isa, v4);
}

- (id)acquireIgnoreSuspendedUnderLockAssertionForSceneIdentifier:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F4F838]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__SBMainDisplaySceneManager_acquireIgnoreSuspendedUnderLockAssertionForSceneIdentifier_reason___block_invoke;
  v16[3] = &unk_1E6AFA6D0;
  objc_copyWeak(&v18, &location);
  id v9 = v6;
  id v17 = v9;
  id v10 = (void *)[v8 initWithIdentifier:@"SBMainDisplaySceneManager.IgnoreSuspendedUnderLock" forReason:v7 invalidationBlock:v16];
  id v11 = [(NSMutableDictionary *)self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions objectForKey:v9];
  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    sceneIdentifierToIgnoreSuspendedUnderLockAssertions = self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions;
    if (!sceneIdentifierToIgnoreSuspendedUnderLockAssertions)
    {
      id v13 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      objc_super v14 = self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions;
      self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions = v13;

      sceneIdentifierToIgnoreSuspendedUnderLockAssertions = self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions;
    }
    [(NSMutableDictionary *)sceneIdentifierToIgnoreSuspendedUnderLockAssertions setObject:v11 forKey:v9];
  }
  [v11 addObject:v10];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

void __95__SBMainDisplaySceneManager_acquireIgnoreSuspendedUnderLockAssertionForSceneIdentifier_reason___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v5 = [WeakRetained[40] objectForKey:*(void *)(a1 + 32)];
    [v5 removeObject:v7];
    if (![v5 count])
    {
      [v4[40] removeObjectForKey:*(void *)(a1 + 32)];
      if (![v4[40] count])
      {
        id v6 = v4[40];
        v4[40] = 0;
      }
    }
  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBMainDisplaySceneManager *)self existingSceneHandleForScene:v7];
  if (v8)
  {
    id v9 = [v7 settings];
    int v10 = [v9 isForeground];

    if (v10)
    {
      id v11 = SBLogIdleTimer();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v7;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[SBMainDisplaySceneManager sceneManager:didDestroyScene: %{public}@] - proposing IdleTimerBehavior.", buf, 0xCu);
      }

      id v12 = [(SBMainDisplaySceneManager *)self _proposeIdleTimerBehaviorForReason:@"SBApplicationSceneDestroyed"];
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SBMainDisplaySceneManager;
  [(SBSceneManager *)&v13 sceneManager:v6 didDestroyScene:v7];
}

- (id)suspendedUnderLockManagerDisplayConfiguration:(id)a3
{
  objc_super v3 = [(SBSceneManager *)self displayIdentity];
  id v4 = [v3 currentConfiguration];

  return v4;
}

- (id)suspendedUnderLockManagerVisibleScenes:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
  objc_super v5 = [(SBMainDisplaySceneManager *)self _windowScene];
  id v6 = [v5 switcherController];
  id v7 = [v6 layoutStateApplicationSceneHandles];
  [v4 unionSet:v7];

  id v8 = +[SBWorkspace mainWorkspace];
  id v9 = [v8 pipCoordinator];
  int v10 = [v9 hostedAppSceneHandles];
  [v4 addObjectsFromArray:v10];

  return v4;
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventUnderLockForScene:(id)a4
{
  id v4 = objc_msgSend(a4, "clientHandle", a3);
  objc_super v5 = [v4 bundleIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:@"com.apple.PosterBoard"];
  return (char)v4;
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventSuspendUnderLockForScene:(id)a4 settings:(id)a5
{
  id v7 = a4;
  id v8 = objc_msgSend(a5, "sb_displayIdentityForSceneManagers");
  char v9 = [v8 isContinuityDisplay];

  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    id v11 = [v7 identifier];
    if (v11)
    {
      id v12 = [(NSMutableDictionary *)self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions objectForKey:v11];
      BOOL v10 = [v12 count] != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (void)addActionHandler:(id)a3 forScene:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  if (!blsActionHandlersForScenes)
  {
    id v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    char v9 = self->_blsActionHandlersForScenes;
    self->_blsActionHandlersForScenes = v8;

    blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  }
  id v10 = [(NSMapTable *)blsActionHandlersForScenes objectForKey:v6];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28D30]);
    [(NSMapTable *)self->_blsActionHandlersForScenes setObject:v10 forKey:v6];
  }
  [v10 addObject:v11];
}

- (void)removeActionHandler:(id)a3 forScene:(id)a4
{
  blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  id v6 = a3;
  id v7 = [(NSMapTable *)blsActionHandlersForScenes objectForKey:a4];
  [v7 removeObject:v6];
}

id __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E6AF4D60;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)[v6 copy];

  return v4;
}

uint64_t __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v9 = v3;
  if (v3) {
    id v4 = (void *)v3[3];
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  char v6 = [v5 proximityDetectionModes];
  id v7 = v9;
  if (v9) {
    id v7 = (void *)v9[4];
  }
  char v8 = [v7 proximityDetectionModes] ^ v6;

  if ((v8 & 0xC) != 0) {
    [*(id *)(*(void *)(a1 + 32) + 296) updateFaceContactExpectation];
  }
}

void __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_4(uint64_t a1)
{
}

id __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E6AF4D60;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)[v6 copy];

  return v4;
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 app];
  id v4 = [v3 _dataStore];
  id v5 = [v2 scene];
  char v6 = [v5 identifier];
  id v10 = [v4 sceneStoreForIdentifier:v6 creatingIfNecessary:1];

  id v7 = NSNumber;
  char v8 = [v2 updatedClientSettings];

  char v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "defaultStatusBarStyle"));
  [v10 setObject:v9 forKey:@"statusBarStyle"];
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 app];
  id v4 = [v3 _dataStore];
  id v5 = [v2 scene];
  char v6 = [v5 identifier];
  id v10 = [v4 sceneStoreForIdentifier:v6 creatingIfNecessary:1];

  id v7 = NSNumber;
  char v8 = [v2 updatedClientSettings];

  char v9 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "defaultStatusBarHidden"));
  [v10 setObject:v9 forKey:@"statusBarHidden"];
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_5(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v2 = [v9 updatedClientSettings];
  id v3 = [v2 defaultPNGName];

  if (v3)
  {
    id v4 = [v9 app];
    id v5 = [v4 _dataStore];
    char v6 = [v9 scene];
    id v7 = [v6 identifier];
    char v8 = [v5 sceneStoreForIdentifier:v7 creatingIfNecessary:1];

    [v8 setObject:v3 forKey:@"defaultPNGName"];
  }
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_6(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v2 = [v11 updatedClientSettings];
  [v2 defaultPNGExpirationTime];
  double v4 = v3;

  if (v4 - CFAbsoluteTimeGetCurrent() < 3153600000.0)
  {
    id v5 = [v11 app];
    char v6 = [v5 _dataStore];
    id v7 = [v11 scene];
    char v8 = [v7 identifier];
    id v9 = [v6 sceneStoreForIdentifier:v8 creatingIfNecessary:1];

    id v10 = [NSNumber numberWithDouble:v4];
    [v9 setObject:v10 forKey:@"expirationAbsoluteTime"];
  }
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_177(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 oldClientSettings];
  char v5 = [v4 proximityDetectionModes];
  char v6 = [v3 updatedClientSettings];

  LOBYTE(v3) = [v6 proximityDetectionModes] ^ v5;
  if ((v3 & 0xC) != 0)
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 296);
    [v7 updateFaceContactExpectation];
  }
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2_178(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  double v4 = (void *)MEMORY[0x1E4F4F898];
  char v5 = [v3 transition];
  char v6 = [v5 animationSettings];
  id v7 = [v4 factoryWithSettings:v6];

  char v8 = (void *)MEMORY[0x1E4F4F898];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_3_180;
  v17[3] = &unk_1E6AF52B8;
  id v9 = v3;
  id v18 = v9;
  uint64_t v19 = &v20;
  [v8 animateWithFactory:v7 actions:v17];
  if (*((unsigned char *)v21 + 24))
  {
    uint64_t v13 = 0;
    objc_super v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v10 = [*(id *)(a1 + 32) externalForegroundApplicationSceneHandles];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_4_182;
    v12[3] = &unk_1E6B0A7A0;
    v12[4] = &v13;
    [v10 enumerateObjectsUsingBlock:v12];

    if (*((unsigned char *)v14 + 24))
    {
      id v11 = +[SBWallpaperController sharedInstance];
      [v11 activateOrientationSource:1];
    }
    else
    {
      id v11 = +[SBWallpaperController sharedInstance];
      [v11 deactivateOrientationSource:1];
    }

    _Block_object_dispose(&v13, 8);
  }

  _Block_object_dispose(&v20, 8);
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_3_180(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) app];
  id v3 = [v2 info];
  double v4 = [*(id *)(a1 + 32) oldClientSettings];
  uint64_t v5 = objc_msgSend(v3, "backgroundStyleForRequestedBackgroundStyle:", objc_msgSend(v4, "backgroundStyle"));

  char v6 = [*(id *)(a1 + 32) app];
  id v7 = [v6 info];
  char v8 = [*(id *)(a1 + 32) updatedClientSettings];
  uint64_t v9 = objc_msgSend(v7, "backgroundStyleForRequestedBackgroundStyle:", objc_msgSend(v8, "backgroundStyle"));

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5 != v9;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v10 = [*(id *)(a1 + 32) sceneHandle];
    [v10 _noteMainSceneBackgroundStyleChanged];
  }
}

uint64_t __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_4_182(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isTranslucent];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_7_190(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v2 = [v6 scene];
  id v3 = [v2 settings];
  int v4 = [v3 isForeground];

  if (v4)
  {
    uint64_t v5 = [v6 updatedClientSettings];
    [v5 brightnessLevel];

    BKSDisplayBrightnessSetWithImplicitTransaction();
  }
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 updatedClientSettings];
  int v4 = [v3 activationConditionsData];

  uint64_t v5 = [v2 app];
  id v6 = [v5 _dataStore];
  id v7 = [v2 scene];
  char v8 = [v7 identifier];
  uint64_t v9 = [v6 sceneStoreForIdentifier:v8 creatingIfNecessary:1];

  if (v4)
  {
    id v19 = 0;
    id v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v19];
    id v11 = v19;
    if (v10)
    {
      id v17 = 0;
      id v18 = 0;
      int v12 = [v10 _validateCompileTimeIssues:&v18 runTimeIssues:&v17];
      uint64_t v13 = v18;
      id v14 = v17;
      if (v12)
      {
        [v9 setArchivedObject:v10 forKey:@"activationConditions"];
      }
      else
      {
        uint64_t v15 = SBLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_8_cold_2((uint64_t)v13, (uint64_t)v14, v15);
        }
      }
    }
    else
    {
      uint64_t v13 = SBLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_8_cold_1(v11, v13);
      }
    }
  }
  else
  {
    [v9 removeObjectForKey:@"activationConditions"];
  }
  char v16 = [v2 sceneHandle];
  [v16 _noteActivationConditionsChanged];
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2_200(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v11 = [v2 updatedClientSettings];
  uint64_t v3 = [v11 preferredPointerLockStatus];
  int v4 = [v2 scene];
  uint64_t v5 = [v4 identifier];

  id v6 = [(id)SBApp windowSceneManager];
  id v7 = [v2 sceneHandle];

  char v8 = [v7 displayIdentity];
  uint64_t v9 = [v6 windowSceneForDisplayIdentity:v8];
  id v10 = [v9 lockedPointerManager];

  [v10 clientWithSceneIdentifier:v5 prefersPointerLockStatus:v3];
}

- (BOOL)_isLockscreenHostingApp:(id)a3
{
  id v3 = a3;
  int v4 = +[SBLockScreenManager sharedInstance];
  uint64_t v5 = [v4 lockScreenEnvironment];
  id v6 = [v5 applicationHoster];

  if ([v4 isLockScreenActive])
  {
    int v7 = [v6 isHostingAnApp];
    BOOL v8 = v7;
    if (v3 && v7)
    {
      uint64_t v9 = [v6 hostedAppSceneHandle];
      id v10 = [v9 application];
      BOOL v8 = v10 == v3;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_externalClientSettingsDiffInspector
{
  externalClientSettingsDiffInspector = self->_externalClientSettingsDiffInspector;
  if (!externalClientSettingsDiffInspector)
  {
    int v4 = (FBSSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F62A40]);
    uint64_t v5 = self->_externalClientSettingsDiffInspector;
    self->_externalClientSettingsDiffInspector = v4;

    id v6 = self->_externalClientSettingsDiffInspector;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_3;
    v18[3] = &unk_1E6B0A7E8;
    v18[4] = self;
    BOOL v8 = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke(v7, v18);
    [(FBSSceneClientSettingsDiffInspector *)v6 observePreferredLevelWithBlock:v8];

    uint64_t v9 = self->_externalClientSettingsDiffInspector;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_4;
    v17[3] = &unk_1E6B0A7E8;
    void v17[4] = self;
    id v11 = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke(v10, v17);
    [(FBSSceneClientSettingsDiffInspector *)v9 observePreferredSceneHostIdentifierWithBlock:v11];

    int v12 = self->_externalClientSettingsDiffInspector;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_5;
    v16[3] = &unk_1E6B0A7E8;
    void v16[4] = self;
    id v14 = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke(v13, v16);
    [(FBSSceneClientSettingsDiffInspector *)v12 observePreferredSceneHostIdentityWithBlock:v14];

    externalClientSettingsDiffInspector = self->_externalClientSettingsDiffInspector;
  }
  return externalClientSettingsDiffInspector;
}

id __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E6AF4D60;
  id v7 = v2;
  id v3 = v2;
  int v4 = (void *)[v6 copy];

  return v4;
}

uint64_t __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_3(uint64_t a1, id *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = a2;
    a2 = (id *)a2[1];
    id v4 = v3[4];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = a2;
  [v2 _updateLevelAndBackgroundSettingsForScene:a2 transitionContext:v4];
}

void __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_4(uint64_t a1, id *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = a2;
    a2 = (id *)a2[1];
    id v4 = v3[4];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = a2;
  [v2 _updateLevelAndBackgroundSettingsForScene:a2 transitionContext:v4];
}

void __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_5(uint64_t a1, id *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = a2;
    a2 = (id *)a2[1];
    id v4 = v3[4];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = a2;
  [v2 _updateLevelAndBackgroundSettingsForScene:a2 transitionContext:v4];
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  Class v4 = NSClassFromString(&cfstr_Uikeyboardarbi.isa);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(objc_class *)v4 performSelector:sel_sharedArbiterManager];
    int v6 = [v5 remoteKeyboardUndocked] ^ 1;
  }
  else
  {
    int v6 = 0;
  }
  if (self->_isKeyboardDocked != v6)
  {
    self->_isKeyboardDocked = v6;
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = @"SBKeyboardDockedKey";
    BOOL v8 = [NSNumber numberWithBool:self->_isKeyboardDocked];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 postNotificationName:@"SBKeyboardDockedChangedNotification" object:0 userInfo:v9];
  }
}

- (void)_updateLevelAndBackgroundSettingsForScene:(id)a3 transitionContext:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 clientSettings];
  [v7 preferredLevel];
  double v9 = v8;
  uint64_t v10 = [v5 settings];
  int v11 = [v10 isForeground];

  double v12 = fmax(v9, 0.0);
  if (*MEMORY[0x1E4F62708] <= v12) {
    double v13 = *MEMORY[0x1E4F62708];
  }
  else {
    double v13 = v12;
  }
  id v14 = [v5 settings];
  [v14 level];
  if (v15 == v13)
  {
    char v16 = [v5 settings];
    int v17 = [v16 isForeground];

    if (v11 == v17) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v18 = SBLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = v5;
    __int16 v25 = 2048;
    double v26 = v13;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "Scene %{public}@ is changing level to: %f", buf, 0x16u);
  }

  id v19 = (void *)MEMORY[0x1E4F42D58];
  uint64_t v20 = [v6 animationFence];
  [v19 _synchronizeDrawingWithFence:v20];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__SBMainDisplaySceneManager__updateLevelAndBackgroundSettingsForScene_transitionContext___block_invoke;
  v21[3] = &__block_descriptor_41_e33_v16__0__FBSMutableSceneSettings_8l;
  *(double *)&v21[4] = v13;
  char v22 = v11;
  [v5 updateSettingsWithBlock:v21];
LABEL_11:
}

void __89__SBMainDisplaySceneManager__updateLevelAndBackgroundSettingsForScene_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 setLevel:v3];
  [v4 setForeground:*(unsigned __int8 *)(a1 + 40)];
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  return -[SBMainDisplaySceneManager _proposeIdleTimerBehaviorForReason:](self, "_proposeIdleTimerBehaviorForReason:", a5, a4);
}

- (void)displayReferenceModeStatusDidChangeForDisplayWithConfiguration:(id)a3 newStatus:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(SBMainDisplaySceneManager *)self externalForegroundApplicationSceneHandles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) sceneIfExists];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        void v11[2] = __102__SBMainDisplaySceneManager_displayReferenceModeStatusDidChangeForDisplayWithConfiguration_newStatus___block_invoke;
        v11[3] = &__block_descriptor_40_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
        v11[4] = a4;
        [v10 performUpdate:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void __102__SBMainDisplaySceneManager_displayReferenceModeStatusDidChangeForDisplayWithConfiguration_newStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if [v3 isUISubclass] && (objc_opt_respondsToSelector()) {
    [v3 setScreenReferenceDisplayModeStatus:*(void *)(a1 + 32)];
  }
}

- (id)sceneSnapshotRequestStrategyForSceneSnapshotRequestor:(id)a3
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_3:
      id v3 = off_1E6AEDF78;
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 1) {
      goto LABEL_3;
    }
  }
  id v3 = off_1E6AEF860;
LABEL_6:
  id v6 = objc_alloc_init(*v3);
  return v6;
}

- (void)setIdleTimerCoordinator:(id)a3
{
}

- (SBPhysicalButtonSceneOverrideManager)physicalButtonSceneOverrideManager
{
  return self->_physicalButtonSceneOverrideManager;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_blsActionHandlersForScenes, 0);
  objc_storeStrong((id *)&self->_displayReferenceModeMonitor, 0);
  objc_storeStrong((id *)&self->stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions, 0);
  objc_storeStrong((id *)&self->_lazy_suspendedUnderLockManager, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneOverrideManager, 0);
  objc_storeStrong((id *)&self->_faceContactExpectationManager, 0);
  objc_storeStrong((id *)&self->_externalClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_internalClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_policyAggregator, 0);
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_8_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "error unarchiving activation conditions from scene settings, %{public}@", (uint8_t *)&v4, 0xCu);
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_8_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1) {
    a2 = a1;
  }
  int v4 = 138543362;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "activation conditions from scene settings did not validate, %{public}@", (uint8_t *)&v4, 0xCu);
}

void __67__SBMainDisplaySceneManager_coordinatorRequestedIdleTimerBehavior___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "sceneHandle: %@", (uint8_t *)&v2, 0xCu);
}

@end