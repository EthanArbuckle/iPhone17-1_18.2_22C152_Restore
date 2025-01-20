@interface SBSystemShellExternalDisplaySceneManager
- (BOOL)_shouldAutoHostScene:(id)a3;
- (BOOL)_shouldFenceTransitionForScene:(id)a3 updatedClientSettingsDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (BOOL)_shouldTrackScenesForDeactivation;
- (BOOL)isSuspendedUnderLock;
- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventSuspendUnderLockForScene:(id)a4 settings:(id)a5;
- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventUnderLockForScene:(id)a4;
- (SBPolicyAggregatorCapabilityQuerying)policyAggregator;
- (SBSystemShellExternalDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5;
- (SBSystemShellExternalDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6;
- (SBWindowScene)_windowScene;
- (id)_appSceneClientSettingsDiffInspector;
- (id)externalApplicationSceneHandles;
- (id)layoutStateManager;
- (id)newSceneIdentifierForBundleIdentifier:(id)a3 supportsMultiwindow:(BOOL)a4;
- (id)sceneSnapshotRequestStrategyForSceneSnapshotRequestor:(id)a3;
- (id)suspendedUnderLockManager:(id)a3 sceneHandleForScene:(id)a4;
- (id)suspendedUnderLockManagerDisplayConfiguration:(id)a3;
- (id)suspendedUnderLockManagerVisibleScenes:(id)a3;
- (id)transientApplicationSceneHandlesForApplication:(id)a3;
- (void)_doObserverCalloutWithBlock:(id)a3;
- (void)_noteDidChangeToVisibility:(unint64_t)a3 previouslyExisted:(BOOL)a4 forScene:(id)a5;
- (void)_noteDidCommitUpdateForScene:(id)a3;
- (void)_reconnectSceneRemnant:(id)a3 forProcess:(id)a4 sceneManager:(id)a5;
- (void)_scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)_scene:(id)a3 interceptUpdateWithNewSettings:(id)a4;
- (void)_scene:(id)a3 willUpdateWithSettings:(id)a4 transitionContext:(id)a5;
- (void)dealloc;
- (void)setSuspendedUnderLock:(BOOL)a3;
- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5;
@end

@implementation SBSystemShellExternalDisplaySceneManager

- (SBSystemShellExternalDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5
{
  return [(SBSystemShellExternalDisplaySceneManager *)self initWithReference:a3 sceneIdentityProvider:a4 presentationBinder:a5 snapshotBehavior:1];
}

- (SBSystemShellExternalDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6
{
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  v11 = [(SBSceneManager *)&v20 initWithReference:a3 sceneIdentityProvider:v10 presentationBinder:a5 snapshotBehavior:a6];
  if (v11)
  {
    [v10 setDataSource:v11];
    v12 = [SBSystemShellExternalDisplayPolicyAggregator alloc];
    v13 = +[SBDefaults localDefaults];
    v14 = [(SBSceneManager *)v11 displayIdentity];
    v15 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    v16 = [v15 policyAggregator];
    uint64_t v17 = [(SBSystemShellExternalDisplayPolicyAggregator *)v12 initWithDefaults:v13 displayIdentity:v14 policyDataSource:v16];
    policyAggregator = v11->_policyAggregator;
    v11->_policyAggregator = (SBPolicyAggregatorCapabilityQuerying *)v17;
  }
  return v11;
}

- (void)dealloc
{
  [(UIApplicationSceneClientSettingsDiffInspector *)self->_appClientSettingsDiffInspector removeAllObservers];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  [(SBSceneManager *)&v3 dealloc];
}

- (SBPolicyAggregatorCapabilityQuerying)policyAggregator
{
  return self->_policyAggregator;
}

- (BOOL)_shouldAutoHostScene:(id)a3
{
  id v3 = a3;
  if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) != 0
    || (v4 = (void *)*MEMORY[0x1E4F71DE8],
        [v3 identifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = [v4 isEqualToString:v5],
        v5,
        (v4 & 1) == 0))
  {
    v7 = [v3 clientProcess];
    BOOL v6 = ![v7 isApplicationProcess] || objc_msgSend(v7, "isCurrentProcess");
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldTrackScenesForDeactivation
{
  return 1;
}

- (void)_doObserverCalloutWithBlock:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  [(SBSceneManager *)&v3 _doObserverCalloutWithBlock:a3];
}

- (void)_reconnectSceneRemnant:(id)a3 forProcess:(id)a4 sceneManager:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  [(SBSceneManager *)&v5 _reconnectSceneRemnant:a3 forProcess:a4 sceneManager:a5];
}

- (void)_scene:(id)a3 interceptUpdateWithNewSettings:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  [(SBSceneManager *)&v4 _scene:a3 interceptUpdateWithNewSettings:a4];
}

- (void)_scene:(id)a3 willUpdateWithSettings:(id)a4 transitionContext:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  [(SBSceneManager *)&v5 _scene:a3 willUpdateWithSettings:a4 transitionContext:a5];
}

- (void)_scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  v6.receiver = self;
  v6.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  [(SBSceneManager *)&v6 _scene:a3 didUpdateClientSettingsWithDiff:a4 oldClientSettings:a5 transitionContext:a6];
}

- (BOOL)_shouldFenceTransitionForScene:(id)a3 updatedClientSettingsDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  return [(SBSceneManager *)&v7 _shouldFenceTransitionForScene:a3 updatedClientSettingsDiff:a4 oldClientSettings:a5 transitionContext:a6];
}

- (void)_noteDidChangeToVisibility:(unint64_t)a3 previouslyExisted:(BOOL)a4 forScene:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  [(SBSceneManager *)&v5 _noteDidChangeToVisibility:a3 previouslyExisted:a4 forScene:a5];
}

- (void)_noteDidCommitUpdateForScene:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  [(SBSceneManager *)&v3 _noteDidCommitUpdateForScene:a3];
}

- (SBWindowScene)_windowScene
{
  objc_super v3 = [(id)SBApp windowSceneManager];
  objc_super v4 = [(SBSceneManager *)self displayIdentity];
  objc_super v5 = [v3 windowSceneForDisplayIdentity:v4];

  return (SBWindowScene *)v5;
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
    v11 = +[SBWorkspace mainWorkspace];
    v12 = [v11 eventQueue];
    v13 = [(SBSuspendedUnderLockManager *)v10 initWithDelegate:self eventQueue:v12];
    v14 = self->_lazy_suspendedUnderLockManager;
    self->_lazy_suspendedUnderLockManager = v13;

    lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  }
  [(SBSuspendedUnderLockManager *)lazy_suspendedUnderLockManager setSuspendedUnderLock:v6 alongsideWillChangeBlock:v15 alongsideDidChangeBlock:v8];
}

- (id)layoutStateManager
{
  objc_super v3 = [(id)SBApp windowSceneManager];
  objc_super v4 = [(SBSceneManager *)self displayIdentity];
  objc_super v5 = [v3 windowSceneForDisplayIdentity:v4];

  BOOL v6 = [v5 layoutStateManager];

  return v6;
}

- (id)externalApplicationSceneHandles
{
  v4.receiver = self;
  v4.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  v2 = [(SBSceneManager *)&v4 externalApplicationSceneHandles];
  return v2;
}

- (id)transientApplicationSceneHandlesForApplication:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  objc_super v3 = [(SBSceneManager *)&v5 transientApplicationSceneHandlesForApplication:a3];
  return v3;
}

- (id)newSceneIdentifierForBundleIdentifier:(id)a3 supportsMultiwindow:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  return [(SBSceneManager *)&v5 newSceneIdentifierForBundleIdentifier:a3 supportsMultiwindow:a4];
}

- (id)suspendedUnderLockManagerDisplayConfiguration:(id)a3
{
  objc_super v3 = [(SBSceneManager *)self displayIdentity];
  objc_super v4 = [v3 currentConfiguration];

  return v4;
}

- (id)suspendedUnderLockManager:(id)a3 sceneHandleForScene:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  objc_super v4 = [(SBSceneManager *)&v6 existingSceneHandleForScene:a4];
  return v4;
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventUnderLockForScene:(id)a4
{
  objc_super v4 = objc_msgSend(a4, "clientHandle", a3);
  objc_super v5 = [v4 bundleIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:@"com.apple.PosterBoard"];
  return (char)v4;
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventSuspendUnderLockForScene:(id)a4 settings:(id)a5
{
  return 0;
}

- (id)suspendedUnderLockManagerVisibleScenes:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
  objc_super v5 = [(SBSystemShellExternalDisplaySceneManager *)self _windowScene];
  objc_super v6 = [v5 switcherController];
  objc_super v7 = [v6 layoutStateApplicationSceneHandles];
  [v4 unionSet:v7];

  return v4;
}

- (id)sceneSnapshotRequestStrategyForSceneSnapshotRequestor:(id)a3
{
  objc_super v3 = objc_alloc_init(SBExternalDisplaySceneSnapshotRequestStrategy);
  return v3;
}

- (id)_appSceneClientSettingsDiffInspector
{
  appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  if (!appClientSettingsDiffInspector)
  {
    objc_super v4 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
    objc_super v5 = self->_appClientSettingsDiffInspector;
    self->_appClientSettingsDiffInspector = v4;

    objc_super v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v9 = self->_appClientSettingsDiffInspector;
      id v10 = __80__SBSystemShellExternalDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v8, &__block_literal_global_38_1);
      [(UIApplicationSceneClientSettingsDiffInspector *)v9 observePreferredPointerLockStateWithBlock:v10];
    }
    appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  }
  return appClientSettingsDiffInspector;
}

id __80__SBSystemShellExternalDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__SBSystemShellExternalDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E6AF4D60;
  id v7 = v2;
  id v3 = v2;
  objc_super v4 = (void *)[v6 copy];

  return v4;
}

uint64_t __80__SBSystemShellExternalDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__SBSystemShellExternalDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v11 = [v2 updatedClientSettings];
  uint64_t v3 = [v11 preferredPointerLockStatus];
  objc_super v4 = [v2 scene];
  objc_super v5 = [v4 identifier];

  objc_super v6 = [(id)SBApp windowSceneManager];
  id v7 = [v2 sceneHandle];

  uint64_t v8 = [v7 displayIdentity];
  v9 = [v6 windowSceneForDisplayIdentity:v8];
  id v10 = [v9 lockedPointerManager];

  [v10 clientWithSceneIdentifier:v5 prefersPointerLockStatus:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyAggregator, 0);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_lazy_suspendedUnderLockManager, 0);
}

@end