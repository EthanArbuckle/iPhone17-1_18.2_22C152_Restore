@interface SBSceneManager
+ (Class)_applicationSceneHandleClass;
+ (id)_globalRegistry;
+ (id)existingSceneHandleForSceneIdentity:(id)a3;
- (BOOL)_handleAction:(id)a3 forScene:(id)a4;
- (BOOL)_shouldAutoHostScene:(id)a3;
- (BOOL)_shouldFenceTransitionForScene:(id)a3 updatedClientSettingsDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (BOOL)_shouldTrackScenesForDeactivation;
- (BOOL)isHidden;
- (BOOL)isValid;
- (FBSDisplayIdentity)displayIdentity;
- (NSSet)boundPointerUIScenes;
- (NSString)debugDescription;
- (SBLayoutState)currentLayoutState;
- (SBLayoutStateTransitionCoordinator)_layoutStateTransitionCoordinator;
- (SBPolicyAggregatorCapabilityQuerying)policyAggregator;
- (SBSceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5;
- (SBSceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6;
- (SBWindowScene)_windowScene;
- (id)_appSceneClientSettingsDiffInspector;
- (id)_sbWindowScene;
- (id)allScenes;
- (id)assertBackgroundedStatusForScenes:(id)a3;
- (id)childTransactionsForTransitionRequest:(id)a3;
- (id)daemonScenes;
- (id)debugNameForSceneSnapshotRequestor:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)existingSceneHandleForPersistenceIdentifier:(id)a3;
- (id)existingSceneHandleForScene:(id)a3;
- (id)existingSceneHandleForSceneIdentity:(id)a3;
- (id)externalApplicationSceneHandles;
- (id)externalApplicationSceneHandlesForBundleIdentifiers:(id)a3;
- (id)externalForegroundApplicationSceneHandles;
- (id)fetchOrCreateApplicationSceneHandleForRequest:(id)a3;
- (id)newSceneIdentifierForBundleIdentifier:(id)a3;
- (id)newSceneIdentifierForBundleIdentifier:(id)a3 supportsMultiwindow:(BOOL)a4;
- (id)newSceneIdentityForApplication:(id)a3;
- (id)preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:(id)a3;
- (id)sceneIdentifierForBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4;
- (id)sceneIdentityForApplication:(id)a3;
- (id)sceneIdentityForApplication:(id)a3 createPrimaryIfRequired:(BOOL)a4 sceneSessionRole:(id)a5;
- (id)sceneIdentityForApplication:(id)a3 excludingIdentifiers:(id)a4;
- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4;
- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 allowSceneCreation:(BOOL)a7 visibleIdentifiers:(id)a8 preferredDisplay:(id)a9;
- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleIdentifiers:(id)a7;
- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4;
- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5;
- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 sceneSessionRole:(id)a6;
- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4;
- (id)sceneSnapshotRequestContextForSceneSnapshotRequestor:(id)a3;
- (id)sceneSnapshotRequestStrategyForSceneSnapshotRequestor:(id)a3;
- (id)scenesForWorkspaceWithID:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)topmostForegroundUIScenesMatching:(id)a3;
- (id)transientApplicationSceneHandlesForApplication:(id)a3;
- (id)windowScene;
- (int64_t)userInterfaceStyle;
- (void)_addReportedForegroundExternalApplicationSceneHandle:(id)a3;
- (void)_addScene:(id)a3;
- (void)_addSceneToPresentationBinder:(id)a3 trackedCollection:(id)a4;
- (void)_doObserverCalloutWithBlock:(id)a3;
- (void)_noteObserversDidInvalidate;
- (void)_prepareToRemoveScene:(id)a3 withReason:(int64_t)a4;
- (void)_prepareToRemoveSceneHandle:(id)a3 withReason:(int64_t)a4;
- (void)_reconnectSceneRemnant:(id)a3 forProcess:(id)a4 sceneManager:(id)a5;
- (void)_removeReportedForegroundExternalApplicationSceneHandle:(id)a3;
- (void)_removeScene:(id)a3 withReason:(int64_t)a4;
- (void)_removeSceneFromPresentationBinder:(id)a3 trackedCollection:(id)a4;
- (void)_removeSceneHandle:(id)a3 withReason:(int64_t)a4;
- (void)_scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)_updateIconStyleSettingsOnScene:(id)a3;
- (void)_updateStateForScene:(id)a3 withSettings:(id)a4;
- (void)addChildTransactionProvider:(id)a3;
- (void)addObserver:(id)a3;
- (void)addPointerUISceneToPresentationBinder:(id)a3;
- (void)addSystemUISceneToPresentationBinder:(id)a3;
- (void)addUserInterfaceStyleObserver:(id)a3;
- (void)bootCompleted:(id)a3;
- (void)dealloc;
- (void)iconStyleProvider:(id)a3 didUpdateIconStyleConfiguration:(id)a4;
- (void)invalidate;
- (void)removeChildTransactionProvider:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removePointerUISceneFromPresentationBinder:(id)a3;
- (void)removeSystemUISceneFromPresentationBinder:(id)a3;
- (void)removeUserInterfaceStyleObserver:(id)a3;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 didDestroyScene:(id)a4;
- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5;
- (void)sceneManager:(id)a3 willDestroyScene:(id)a4;
- (void)setHidden:(BOOL)a3;
- (void)startTrackingSystemUISceneForInterfaceStyleUpdatePurposes:(id)a3;
- (void)stopTrackingSystemUISceneForInterfaceStyleUpdatePurposes:(id)a3;
- (void)transferOwnershipOfSceneWithIdentity:(id)a3 toSceneManager:(id)a4;
- (void)updatePresentationBinder:(id)a3;
- (void)userInterfaceStyleProvider:(id)a3 didUpdateStyle:(int64_t)a4 preferredAnimationSettings:(id)a5 completion:(id)a6;
@end

@implementation SBSceneManager

- (id)existingSceneHandleForScene:(id)a3
{
  v4 = [a3 definition];
  v5 = [v4 identity];
  v6 = [(SBSceneManager *)self existingSceneHandleForSceneIdentity:v5];

  return v6;
}

- (id)existingSceneHandleForSceneIdentity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMapTable *)self->_persistentMapSceneIdentityToSceneHandle objectForKey:v4];
    if (!v5)
    {
      v5 = [(NSMapTable *)self->_transientMapSceneIdentityToSceneHandle objectForKey:v4];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4
{
  return (id)[(SBApplicationSceneIdentityProviding *)self->_sceneIdentityProvider sceneIdentityForApplication:a3 uniqueIdentifier:a4];
}

- (id)windowScene
{
  v3 = [(id)SBApp windowSceneManager];
  id v4 = [(SBSceneManager *)self displayIdentity];
  v5 = [v3 windowSceneForDisplayIdentity:v4];

  return v5;
}

- (BOOL)isValid
{
  return self->_state != 2;
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v12 = a3;
  v10 = [(SBSceneManager *)self windowScene];
  v11 = [v10 medusaHostedKeyboardWindowController];
  [v11 scene:v12 didCompleteUpdateWithContext:v9 error:v8];

  [(SBSceneManager *)self _noteDidCommitUpdateForScene:v12];
}

- (id)topmostForegroundUIScenesMatching:(id)a3
{
  id v4 = a3;
  v5 = [(SBSceneManager *)self allScenes];
  v6 = [MEMORY[0x1E4F1CA80] set];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__SBSceneManager_topmostForegroundUIScenesMatching___block_invoke;
  v12[3] = &unk_1E6AF87E8;
  id v7 = v4;
  id v14 = v7;
  v15 = v16;
  id v8 = v6;
  id v13 = v8;
  [v5 enumerateObjectsUsingBlock:v12];
  id v9 = v13;
  id v10 = v8;

  _Block_object_dispose(v16, 8);
  return v10;
}

- (id)allScenes
{
  return (id)[(BSCopyingCacheSet *)self->_allScenes immutableSet];
}

- (void)_updateStateForScene:(id)a3 withSettings:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(SBSceneManager *)self existingSceneHandleForScene:v19];
  id v8 = [v19 clientProcess];
  id v9 = [v8 bundleIdentifier];
  int v10 = [v9 isEqualToString:@"com.apple.PosterBoard"];

  if (v7
    && (([(BSCopyingCacheSet *)self->_externalApplicationSceneHandles containsObject:v7] ^ 1 | v10) & 1) == 0)
  {
    allScenes = self->_allScenes;
    id v12 = [v7 sceneIfExists];
    uint64_t v13 = [(BSCopyingCacheSet *)allScenes containsObject:v12];

    if (v13)
    {
      int v14 = [(BSCopyingCacheSet *)self->_reportedExternalForegroundApplicationSceneHandles containsObject:v7] ^ 1;
      int v15 = v14;
    }
    else
    {
      int v14 = 0;
      int v15 = 1;
    }
    if ([v6 isForeground])
    {
      int v16 = [(NSCountedSet *)self->_assertedBackgroundScenes containsObject:v19];
      v17 = [v19 clientProcess];
      if (([v17 isCurrentProcess] & 1) == 0)
      {
        [(BSCopyingCacheSet *)self->_externalForegroundApplicationSceneHandles addObject:v7];
        if (v16) {
          [(SBSceneManager *)self _removeReportedForegroundExternalApplicationSceneHandle:v7];
        }
        else {
          [(SBSceneManager *)self _addReportedForegroundExternalApplicationSceneHandle:v7];
        }
      }
    }
    else
    {
      [(SBSceneManager *)self _removeReportedForegroundExternalApplicationSceneHandle:v7];
      [(BSCopyingCacheSet *)self->_externalForegroundApplicationSceneHandles removeObject:v7];
    }
    unsigned int v18 = [(BSCopyingCacheSet *)self->_reportedExternalForegroundApplicationSceneHandles containsObject:v7];
    if ((v15 | v18) != 1 || (v14 & v18 & 1) != 0 || v13 != 1) {
      [(SBSceneManager *)self _noteDidChangeToVisibility:v18 previouslyExisted:v13 forScene:v19];
    }
  }
}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  id v19 = a3;
  id v7 = a4;
  id v8 = [v7 transitionContext];
  id v9 = [v7 settings];
  if (self->_state)
  {
    unsigned int v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBSceneManager.m" lineNumber:1453 description:@"cannot respond to non-destruction scene events after invalidation"];
  }
  [(SBSceneManager *)self _updateStateForScene:v19 withSettings:v9];
  [(SBSceneManager *)self _scene:v19 willUpdateWithSettings:v9 transitionContext:v8];
  externalApplicationSceneHandles = self->_externalApplicationSceneHandles;
  v11 = [(SBSceneManager *)self existingSceneHandleForScene:v19];
  LODWORD(externalApplicationSceneHandles) = [(BSCopyingCacheSet *)externalApplicationSceneHandles containsObject:v11];

  if (externalApplicationSceneHandles)
  {
    id v12 = [(SBSceneManager *)self existingSceneHandleForScene:v19];
    if ([(BSCopyingCacheSet *)self->_externalApplicationSceneHandles containsObject:v12])
    {
      uint64_t v13 = objc_opt_class();
      id v14 = v12;
      if (v13) {
        id v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
      }
      else {
        id v15 = 0;
      }
      id v16 = v15;

      char v17 = [v16 shouldAlwaysDisplayLiveContent];
      if ((v17 & 1) == 0) {
        [(SBSceneSnapshotRequestor *)self->_snapshotRequestor requestSnapshotsForSceneHandle:v14 updatingToNewSettings:v9 withUpdateContext:v7];
      }
    }
  }
}

- (void)_addReportedForegroundExternalApplicationSceneHandle:(id)a3
{
  id v4 = a3;
  if (([(BSCopyingCacheSet *)self->_reportedExternalForegroundApplicationSceneHandles containsObject:v4] & 1) == 0)
  {
    [(BSCopyingCacheSet *)self->_reportedExternalForegroundApplicationSceneHandles addObject:v4];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__SBSceneManager__addReportedForegroundExternalApplicationSceneHandle___block_invoke;
    v5[3] = &unk_1E6AF8998;
    v5[4] = self;
    id v6 = v4;
    [(SBSceneManager *)self _doObserverCalloutWithBlock:v5];
  }
}

- (id)externalForegroundApplicationSceneHandles
{
  return (id)[(BSCopyingCacheSet *)self->_reportedExternalForegroundApplicationSceneHandles immutableSet];
}

- (id)externalApplicationSceneHandles
{
  return (id)[(BSCopyingCacheSet *)self->_externalApplicationSceneHandles immutableSet];
}

- (FBSDisplayIdentity)displayIdentity
{
  return [(SBSceneManagerReference *)self->_selfReference displayIdentity];
}

void __52__SBSceneManager_topmostForegroundUIScenesMatching___block_invoke(void *a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 settings];
  id v4 = [v10 clientSettings];
  if ([v3 isForeground]
    && [v4 isUISubclass]
    && (*(unsigned int (**)(void))(a1[5] + 16))())
  {
    [v3 level];
    uint64_t v6 = *(void *)(a1[6] + 8);
    double v7 = *(double *)(v6 + 24);
    if (v5 <= v7)
    {
      if (v5 != v7) {
        goto LABEL_9;
      }
      id v8 = (id *)(a1 + 4);
    }
    else
    {
      *(double *)(v6 + 24) = v5;
      id v9 = (void *)a1[4];
      id v8 = (id *)(a1 + 4);
      [v9 removeAllObjects];
    }
    [*v8 addObject:v10];
  }
LABEL_9:
}

- (id)daemonScenes
{
  return (id)[(BSCopyingCacheSet *)self->_daemonScenes immutableSet];
}

- (void)_scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v22 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v22 clientProcess];
  if ([v14 isApplicationProcess] && (objc_msgSend(v14, "isCurrentProcess") & 1) == 0)
  {
    if (([v12 isUISubclass] & 1) == 0)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"SBSceneManager.m" lineNumber:840 description:@"expected oldClientSettings to be a UISubclass"];
    }
    id v15 = [(SBSceneManager *)self existingSceneHandleForScene:v22];
    id v16 = objc_alloc_init(SBAppClientSettingObserverContext);
    [(SBAppClientSettingObserverContext *)v16 setScene:v22];
    char v17 = [v15 application];
    [(SBAppClientSettingObserverContext *)v16 setApp:v17];

    [(SBAppClientSettingObserverContext *)v16 setSceneHandle:v15];
    unsigned int v18 = [v22 uiSettings];
    [(SBAppClientSettingObserverContext *)v16 setSettings:v18];

    [(SBAppClientSettingObserverContext *)v16 setOldClientSettings:v12];
    id v19 = [v22 uiClientSettings];
    [(SBAppClientSettingObserverContext *)v16 setUpdatedClientSettings:v19];

    [(SBAppClientSettingObserverContext *)v16 setTransition:v13];
    v20 = [(SBSceneManager *)self _appSceneClientSettingsDiffInspector];
    [v11 evaluateWithInspector:v20 context:v16];
  }
}

- (void)_addScene:(id)a3
{
  id v5 = a3;
  id v28 = v5;
  if (self->_state)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"SBSceneManager.m" lineNumber:1321 description:@"cannot respond to non-destruction scene events after invalidation"];

    id v5 = v28;
  }
  [(SBSceneManagerReference *)self->_selfReference retainForScene:v5];
  if ([(SBSceneManager *)self _shouldAutoHostScene:v28])
  {
    [(BSCopyingCacheSet *)self->_boundScenes addObject:v28];
    [(UIScenePresentationBinder *)self->_presentationBinder addScene:v28];
  }
  uint64_t v6 = [v28 clientProcess];
  double v7 = [v28 workspaceIdentifier];
  if (v7)
  {
    workspaceScenes = self->_workspaceScenes;
LABEL_17:
    [(BSCopyingCacheSet *)workspaceScenes addObject:v28];
    goto LABEL_18;
  }
  if (![v6 isApplicationProcess])
  {
    workspaceScenes = self->_daemonScenes;
    goto LABEL_17;
  }
  if (([v6 isCurrentProcess] & 1) == 0)
  {
    id v9 = +[SBApplicationController sharedInstance];
    id v10 = [v28 clientProcess];
    id v11 = [v10 bundleIdentifier];
    id v12 = [v9 applicationWithBundleIdentifier:v11];

    if (!v12)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"SBSceneManager.m", 1337, @"Unable to fetch SBApplication for scene: %@", v28 object file lineNumber description];
    }
    id v13 = [SBApplicationSceneHandleRequest alloc];
    id v14 = [v28 definition];
    id v15 = [(SBSceneManager *)self displayIdentity];
    id v16 = [(SBApplicationSceneHandleRequest *)v13 initWithApplication:v12 sceneDefinition:v14 displayIdentity:v15];

    [(SBApplicationSceneHandleRequest *)v16 setExistingScene:v28];
    char v17 = [(SBSceneManager *)self fetchOrCreateApplicationSceneHandleForRequest:v16];
    if (!v17)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:self file:@"SBSceneManager.m" lineNumber:1341 description:@"Unable to fetch or create a scene handle."];
    }
    unsigned int v18 = [v17 _definition];
    id v19 = [v18 identity];

    [(NSMapTable *)self->_persistentMapSceneIdentityToSceneHandle setObject:v17 forKey:v19];
    [(NSMapTable *)self->_transientMapSceneIdentityToSceneHandle removeObjectForKey:v19];
    [(BSCopyingCacheSet *)self->_externalApplicationSceneHandles addObject:v17];
    if ([v6 hasEntitlement:@"com.apple.springboard.homeScreenIconStyle"])
    {
      v20 = self;
      [v28 addExtension:v20];
    }
  }
LABEL_18:
  v21 = [(SBSceneManager *)self existingSceneHandleForScene:v28];
  id v22 = [v21 sceneIfExists];

  v23 = v28;
  if (v22 != v28)
  {
    [v21 _noteSceneCreated:v28];
    v23 = v28;
  }
  v24 = [v23 settings];
  [(SBSceneManager *)self _updateStateForScene:v28 withSettings:v24];

  [(SBSceneManager *)self _updateIconStyleSettingsOnScene:v28];
  [(BSCopyingCacheSet *)self->_allScenes addObject:v28];
}

- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5
{
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
}

- (void)_updateIconStyleSettingsOnScene:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconStyleProvider *)self->_iconStyleProvider currentIconStyleConfiguration];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v6 = [v4 clientProcess];
    int v7 = [v6 pid];
    pid_t v8 = getpid();

    if (v7 != v8)
    {
      uint64_t v9 = [MEMORY[0x1E4FA6AB8] automaticStyleConfiguration];

      id v5 = (void *)v9;
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__SBSceneManager__updateIconStyleSettingsOnScene___block_invoke;
  v11[3] = &unk_1E6AF8970;
  id v12 = v5;
  id v10 = v5;
  [v4 performUpdate:v11];
}

- (void)_doObserverCalloutWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

void __71__SBSceneManager__addReportedForegroundExternalApplicationSceneHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneManager:*(void *)(a1 + 32) didAddExternalForegroundApplicationSceneHandle:*(void *)(a1 + 40)];
  }
}

- (id)newSceneIdentifierForBundleIdentifier:(id)a3 supportsMultiwindow:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v7 UUIDString];
  }
  else
  {
    uint64_t v8 = @"default";
  }
  uint64_t v9 = [(SBSceneManager *)self sceneIdentifierForBundleIdentifier:v6 uniqueIdentifier:v8];

  return v9;
}

- (id)sceneIdentifierForBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@:%@-%@", @"sceneID", a3, a4];
}

- (id)newSceneIdentityForApplication:(id)a3
{
  return (id)[(SBApplicationSceneIdentityProviding *)self->_sceneIdentityProvider newSceneIdentityForApplication:a3];
}

- (id)transientApplicationSceneHandlesForApplication:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  uint64_t v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  transientMapSceneIdentityToSceneHandle = self->_transientMapSceneIdentityToSceneHandle;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__SBSceneManager_transientApplicationSceneHandlesForApplication___block_invoke;
  v9[3] = &unk_1E6AF88D0;
  id v6 = v4;
  id v10 = v6;
  long long v11 = &v12;
  [(NSMapTable *)transientMapSceneIdentityToSceneHandle bs_each:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (SBLayoutStateTransitionCoordinator)_layoutStateTransitionCoordinator
{
  id v4 = [(SBSceneManager *)self _sbWindowScene];
  id v5 = [v4 layoutStateTransitionCoordinator];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBSceneManager.m", 1519, @"%@ has no layout state transition coordinator- does your corresponding window scene exist yet?", self object file lineNumber description];
  }
  return (SBLayoutStateTransitionCoordinator *)v5;
}

- (id)_sbWindowScene
{
  id v3 = [(id)SBApp windowSceneManager];
  id v4 = [(SBSceneManager *)self displayIdentity];
  id v5 = [v3 windowSceneForDisplayIdentity:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 embeddedDisplayWindowScene];
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)assertBackgroundedStatusForScenes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [SBSceneBackgroundedStatusAssertion alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke;
    v9[3] = &unk_1E6AF88A8;
    void v9[4] = self;
    id v6 = [(SBSceneBackgroundedStatusAssertion *)v5 initWithScenes:v4 invalidationHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke_67;
    v8[3] = &unk_1E6AF87C0;
    v8[4] = self;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:(id)a3
{
  return [(SBSceneSnapshotRequestor *)self->_snapshotRequestor preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:a3];
}

- (id)sceneIdentityForApplication:(id)a3 createPrimaryIfRequired:(BOOL)a4 sceneSessionRole:(id)a5
{
  return (id)[(SBApplicationSceneIdentityProviding *)self->_sceneIdentityProvider sceneIdentityForApplication:a3 createPrimaryIfRequired:a4 sceneSessionRole:a5];
}

- (id)fetchOrCreateApplicationSceneHandleForRequest:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 application];
  if (!v6)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2 object:self file:@"SBSceneManager.m" lineNumber:1258 description:@"Application is required for creating an application scene handle."];
  }
  id v7 = [v5 sceneDefinition];
  uint64_t v8 = [v7 identity];

  id v9 = [(SBSceneManager *)self existingSceneHandleForSceneIdentity:v8];
  id v10 = +[SBSceneManager _globalRegistry];
  long long v11 = [v10 existingSceneHandleForSceneIdentity:v8];

  if (v9 || !v11)
  {
    if (v9)
    {
      v21 = SBLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        id v22 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543618;
        v43 = v22;
        __int16 v44 = 2112;
        id v45 = v9;
        _os_log_debug_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] Fetched existing sceneHandle: %@", buf, 0x16u);
      }
    }
    else
    {
      v23 = v11;
      v24 = (objc_class *)[(id)objc_opt_class() _applicationSceneHandleClass];
      v21 = [v5 existingScene];
      id v25 = [v24 alloc];
      if (v21)
      {
        v26 = [(SBSceneManager *)self displayIdentity];
        id v9 = (id)[v25 _initWithApplication:v6 scene:v21 displayIdentity:v26];

        [(NSMapTable *)self->_persistentMapSceneIdentityToSceneHandle setObject:v9 forKey:v8];
        v27 = SBLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v28 = _SBFLoggingMethodProem();
          *(_DWORD *)buf = 138543618;
          v43 = v28;
          __int16 v44 = 2112;
          id v45 = v9;
          _os_log_debug_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEBUG, "[%{public}@] Created PERSISTENT sceneHandle: %@", buf, 0x16u);
        }
      }
      else
      {
        v29 = [v5 sceneDefinition];
        uint64_t v30 = [(SBSceneManager *)self displayIdentity];
        v31 = v6;
        v32 = (void *)v30;
        v40 = v31;
        id v9 = (id)objc_msgSend(v25, "_initWithApplication:sceneDefinition:displayIdentity:");

        [(NSMapTable *)self->_transientMapSceneIdentityToSceneHandle setObject:v9 forKey:v8];
        v27 = SBLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v37 = _SBFLoggingMethodProem();
          *(_DWORD *)buf = 138543618;
          v43 = v37;
          __int16 v44 = 2112;
          id v45 = v9;
          _os_log_debug_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEBUG, "[%{public}@] Created TRANSIENT sceneHandle: %@", buf, 0x16u);
        }
        id v6 = v40;
      }

      v33 = +[SBSceneManager _globalRegistry];
      [v33 addSceneHandle:v9 forSceneIdentity:v8];

      [v9 _setManuallyControlsLifecycle:1];
      [v9 setSceneManager:self];
      long long v11 = v23;
    }
  }
  else
  {
    uint64_t v12 = self;
    [v5 existingScene];
    uint64_t v41 = v39 = v11;
    id v9 = v11;
    long long v13 = [v9 sceneManager];
    uint64_t v14 = [v5 sceneDefinition];
    [v14 identity];
    v16 = id v15 = v6;
    id v17 = [v13 existingSceneHandleForSceneIdentity:v16];

    id v6 = v15;
    if (v17 != v9)
    {
      unsigned int v18 = SBLogCommon();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
      if (v41)
      {
        if (v19)
        {
          v35 = _SBFLoggingMethodProem();
          *(_DWORD *)buf = 138543618;
          v43 = v35;
          __int16 v44 = 2112;
          id v45 = v9;
          _os_log_debug_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEBUG, "[%{public}@] Storing existing global PERSISTENT sceneHandle: %@", buf, 0x16u);
        }
        uint64_t v20 = 80;
      }
      else
      {
        if (v19)
        {
          v36 = _SBFLoggingMethodProem();
          *(_DWORD *)buf = 138543618;
          v43 = v36;
          __int16 v44 = 2112;
          id v45 = v9;
          _os_log_debug_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEBUG, "[%{public}@] Storing existing global TRANSIENT sceneHandle: %@", buf, 0x16u);
        }
        uint64_t v20 = 88;
      }

      [*(id *)((char *)&v12->super.isa + v20) setObject:v9 forKey:v8];
    }

    long long v11 = v39;
    v21 = v41;
  }

  return v9;
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5
{
  return (id)[(SBApplicationSceneIdentityProviding *)self->_sceneIdentityProvider sceneIdentityForApplication:a3 uniqueIdentifier:a4 targetContentIdentifier:a5];
}

- (id)childTransactionsForTransitionRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_childTransactionProviders;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "childTransactionsForTransitionRequest:", v4, (void)v13);
        if ([v11 count])
        {
          if (v8) {
            [v8 unionSet:v11];
          }
          else {
            uint64_t v8 = (void *)[v11 mutableCopy];
          }
        }
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v18 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_state)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBSceneManager.m" lineNumber:1438 description:@"cannot respond to scene events after invalidation"];
  }
  long long v14 = [v13 animationFence];
  if (v14
    && [(SBSceneManager *)self _shouldFenceTransitionForScene:v18 updatedClientSettingsDiff:v11 oldClientSettings:v12 transitionContext:v13])
  {
    [MEMORY[0x1E4F42D58] _synchronizeDrawingWithFence:v14];
  }
  [(SBSceneManager *)self _scene:v18 didUpdateClientSettingsWithDiff:v11 oldClientSettings:v12 transitionContext:v13];
  long long v15 = [(SBSceneManager *)self windowScene];
  long long v16 = [v15 medusaHostedKeyboardWindowController];
  [v16 scene:v18 didUpdateClientSettingsWithDiff:v11 oldClientSettings:v12 transitionContext:v13];
}

- (BOOL)_shouldFenceTransitionForScene:(id)a3 updatedClientSettingsDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 settings];
  char v8 = [v7 isForeground];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = SBLogWorkspace();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Not fencing scene transistion with scene: %@ because it is backgrounded", (uint8_t *)&v11, 0xCu);
    }
  }
  return v8;
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 allowSceneCreation:(BOOL)a7 visibleIdentifiers:(id)a8 preferredDisplay:(id)a9
{
  return (id)-[SBApplicationSceneIdentityProviding sceneIdentityForApplication:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:preferredDisplay:](self->_sceneIdentityProvider, "sceneIdentityForApplication:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:preferredDisplay:", a3, a4, a5, a6, a7, a8);
}

void __50__SBSceneManager__updateIconStyleSettingsOnScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F35B14D8]) {
    [v3 setIconStyleConfiguration:*(void *)(a1 + 32)];
  }
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  BSDispatchQueueAssertMain();
  id v4 = v8;
  if (v8)
  {
    observers = self->_observers;
    if (!observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

void __65__SBSceneManager_transientApplicationSceneHandlesForApplication___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id v4 = [v10 application];
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 addObject:v10];
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self->_state)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBSceneManager.m" lineNumber:1429 description:@"cannot respond to scene events after invalidation"];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v21;
    *(void *)&long long v11 = 138543618;
    long long v19 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (!-[SBSceneManager _handleAction:forScene:](self, "_handleAction:forScene:", v15, v7, v19, (void)v20))
        {
          long long v16 = SBLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v17 = [v7 identifier];
            *(_DWORD *)buf = v19;
            id v25 = v17;
            __int16 v26 = 2112;
            uint64_t v27 = v15;
            _os_log_error_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_ERROR, "Ignoring unhandled action directed at scene %{public}@: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v12);
  }
}

- (BOOL)_handleAction:(id)a3 forScene:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 isValid])
    {
      id v8 = [(SBSceneManager *)self existingSceneHandleForScene:v7];
      char v9 = [(SBSceneSnapshotRequestor *)self->_snapshotRequestor handleSnapshotRequestAction:v6 forSceneHandle:v8];
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v15 = XBLogCapture();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v31 = [(SBSceneManager *)self displayIdentity];
      v32 = [v7 identifier];
      *(_DWORD *)buf = 138412802;
      v65 = v31;
      __int16 v66 = 2112;
      v67 = v32;
      __int16 v68 = 2112;
      id v69 = v6;
      _os_log_debug_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEBUG, "[display:%@] [%@] Ignoring invalid snapshot action: %@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = objc_opt_class();
    long long v11 = [(SBSceneManager *)self _windowScene];
    uint64_t v12 = [v11 switcherController];
    uint64_t v13 = [v12 contentViewController];
    long long v14 = SBSafeCast(v10, v13);

    if (v14) {
      [v14 prepareForIncomingCenterWindowAnimationWithAction:v6];
    }
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = objc_opt_class();
    id v17 = [(SBSceneManager *)self _windowScene];
    id v18 = [v17 switcherController];
    long long v19 = [v18 contentViewController];
    long long v14 = SBSafeCast(v16, v19);

    if (v14) {
      [v14 cleanUpAfterCompletingCenterWindowAnimationWithAction:v6];
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v20 = [(SBSceneManager *)self _windowScene];
    id v8 = [v20 lockedPointerManager];

    long long v21 = [v7 identifier];
    char v9 = 1;
    [v8 clientWithSceneIdentifier:v21 suppressPreferredLockStatus:1];

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 dispatchToHostGestureRecognizer];
  }
  else
  {
    uint64_t v23 = [v6 UIActionType];
    if (v23 == 48)
    {
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v60 = @"SBSceneResizeLayoutDidFinishNotificationSceneIdentifierKey";
      v33 = [v7 identifier];
      v61 = v33;
      char v9 = 1;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      [v8 postNotificationName:@"SBSceneResizeLayoutDidFinishNotification" object:self userInfo:v34];

      goto LABEL_17;
    }
    if (v23 != 35) {
      goto LABEL_41;
    }
    v24 = [(SBSceneManager *)self existingSceneHandleForScene:v7];
    if (v24)
    {
      uint64_t v25 = objc_opt_class();
      __int16 v26 = __BSSafeCast(v6, v25);
      uint64_t v27 = [v26 persistedIdentifiers];

      if (v27) {
        id v28 = {;
      }
        char v29 = 0;
        uint64_t v30 = 1;
      }
      else
      {
        int v35 = [v26 isUserOriginatedRequest];
        v36 = [v24 application];
        v37 = +[SBWorkspace mainWorkspace];
        int v38 = [v37 isApplicationRunningAsViewService:v36];

        v57 = v36;
        uint64_t v39 = [v36 bundleIdentifier];
        v56 = (void *)v39;
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = +[SBIconController sharedInstance];
          [v41 model];
          v43 = int v42 = v35;

          __int16 v44 = [v43 expectedIconForDisplayIdentifier:v40];
          LODWORD(v40) = [v43 isIconVisible:v44];

          int v35 = v42;
          int v45 = v40 ^ 1;
        }
        else
        {
          int v45 = 1;
        }
        int v46 = v35 & (v38 | v45);
        if (v46 == 1) {
          id v28 = {;
        }
          uint64_t v30 = 3;
        }
        else
        {
          v47 = SBApplicationSceneEntityDestructionMakeIntent([v26 preferredAnimationType], objc_msgSend(v26, "destroySceneSession"));
          v48 = [MEMORY[0x1E4F1CAD0] setWithObject:v24];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __41__SBSceneManager__handleAction_forScene___block_invoke;
          v58[3] = &unk_1E6AF8948;
          id v59 = v6;
          SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v48, v47, v58);

          uint64_t v30 = 0;
          id v28 = 0;
        }
        char v29 = v46 ^ 1;
      }
    }
    else {
      id v28 = {;
    }
      char v29 = 0;
      uint64_t v30 = 2;
    }
    if (v28)
    {
      v49 = SBLogCommon();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        -[SBSceneManager _handleAction:forScene:]((uint64_t)v28, v49);
      }

      v50 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = SBSceneManagerErrorDomain;
      uint64_t v62 = *MEMORY[0x1E4F28228];
      v63 = v28;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      v53 = [v50 errorWithDomain:v51 code:v30 userInfo:v52];

      v54 = (void *)[objc_alloc(MEMORY[0x1E4F42940]) initWithInfo:0 error:v53];
      [v6 sendResponse:v54];
    }
    if ((v29 & 1) == 0)
    {
LABEL_41:
      v55 = [(SBSceneManager *)self existingSceneHandleForScene:v7];
      char v9 = [v55 _handleSceneAction:v6];

      goto LABEL_18;
    }
  }
LABEL_14:
  char v9 = 1;
LABEL_18:

  return v9;
}

+ (Class)_applicationSceneHandleClass
{
  return (Class)objc_opt_class();
}

+ (id)_globalRegistry
{
  if (_globalRegistry_onceToken != -1) {
    dispatch_once(&_globalRegistry_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)_globalRegistry_globalRegistry;
  return v2;
}

void __33__SBSceneManager__globalRegistry__block_invoke()
{
  v0 = objc_alloc_init(SBSceneManagerSceneHandleWeakRegistry);
  v1 = (void *)_globalRegistry_globalRegistry;
  _globalRegistry_globalRegistry = (uint64_t)v0;
}

+ (id)existingSceneHandleForSceneIdentity:(id)a3
{
  id v3 = a3;
  id v4 = +[SBSceneManager _globalRegistry];
  int v5 = [v4 existingSceneHandleForSceneIdentity:v3];

  return v5;
}

- (SBSceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5
{
  return [(SBSceneManager *)self initWithReference:a3 sceneIdentityProvider:a4 presentationBinder:a5 snapshotBehavior:0];
}

- (SBSceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"SBSceneManager.m", 198, @"Invalid parameter not satisfying: %@", @"reference" object file lineNumber description];
  }
  uint64_t v15 = [v12 displayIdentity];

  if (v15)
  {
    if (v13) {
      goto LABEL_5;
    }
  }
  else
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, self, @"SBSceneManager.m", 199, @"Invalid parameter not satisfying: %@", @"[reference displayIdentity]" object file lineNumber description];

    if (v13) {
      goto LABEL_5;
    }
  }
  v55 = [MEMORY[0x1E4F28B00] currentHandler];
  [v55 handleFailureInMethod:a2, self, @"SBSceneManager.m", 200, @"Invalid parameter not satisfying: %@", @"sceneIdentityProvider" object file lineNumber description];

LABEL_5:
  v56.receiver = self;
  v56.super_class = (Class)SBSceneManager;
  uint64_t v16 = [(SBSceneManager *)&v56 init];
  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F62490] sharedInstance];
    sceneManager = v16->_sceneManager;
    v16->_sceneManager = (FBSceneManager *)v17;

    objc_storeStrong((id *)&v16->_selfReference, a3);
    long long v19 = objc_alloc_init(SBPolicyAggregator);
    policyAggregator = v16->_policyAggregator;
    v16->_policyAggregator = v19;

    objc_storeStrong((id *)&v16->_presentationBinder, a5);
    uint64_t v21 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    transientMapSceneIdentityToSceneHandle = v16->_transientMapSceneIdentityToSceneHandle;
    v16->_transientMapSceneIdentityToSceneHandle = (NSMapTable *)v21;

    uint64_t v23 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    persistentMapSceneIdentityToSceneHandle = v16->_persistentMapSceneIdentityToSceneHandle;
    v16->_persistentMapSceneIdentityToSceneHandle = (NSMapTable *)v23;

    uint64_t v25 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E4F4F6F8]);
    boundScenes = v16->_boundScenes;
    v16->_boundScenes = v25;

    uint64_t v27 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E4F4F6F8]);
    boundSingleScenes = v16->_boundSingleScenes;
    v16->_boundSingleScenes = v27;

    char v29 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E4F4F6F8]);
    boundPointerUIScenes = v16->_boundPointerUIScenes;
    v16->_boundPointerUIScenes = v29;

    v31 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E4F4F6F8]);
    allScenes = v16->_allScenes;
    v16->_allScenes = v31;

    v33 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E4F4F6F8]);
    externalApplicationSceneHandles = v16->_externalApplicationSceneHandles;
    v16->_externalApplicationSceneHandles = v33;

    int v35 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E4F4F6F8]);
    externalForegroundApplicationSceneHandles = v16->_externalForegroundApplicationSceneHandles;
    v16->_externalForegroundApplicationSceneHandles = v35;

    v37 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E4F4F6F8]);
    reportedExternalForegroundApplicationSceneHandles = v16->_reportedExternalForegroundApplicationSceneHandles;
    v16->_reportedExternalForegroundApplicationSceneHandles = v37;

    uint64_t v39 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E4F4F6F8]);
    daemonScenes = v16->_daemonScenes;
    v16->_daemonScenes = v39;

    uint64_t v41 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E4F4F6F8]);
    workspaceScenes = v16->_workspaceScenes;
    v16->_workspaceScenes = v41;

    v43 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    assertedBackgroundScenes = v16->_assertedBackgroundScenes;
    v16->_assertedBackgroundScenes = v43;

    objc_storeStrong((id *)&v16->_sceneIdentityProvider, a4);
    if (a6 == 1)
    {
      int v45 = [[SBSceneSnapshotRequestor alloc] initWithDelegate:v16];
      snapshotRequestor = v16->_snapshotRequestor;
      v16->_snapshotRequestor = v45;
    }
    v47 = (void *)SBApp;
    v48 = [v12 displayIdentity];
    uint64_t v49 = [v47 userInterfaceStyleProviderForDisplay:v48];
    userInterfaceStyleProvider = v16->_userInterfaceStyleProvider;
    v16->_userInterfaceStyleProvider = (SBUserInterfaceStyleProvider *)v49;

    [(SBUserInterfaceStyleProvider *)v16->_userInterfaceStyleProvider addObserver:v16];
    uint64_t v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v51 addObserver:v16 selector:sel_bootCompleted_ name:@"SBBootCompleteNotification" object:0];
  }
  return v16;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(UIScenePresentationBinder *)self->_presentationBinder invalidate];
  [(SBSceneSnapshotRequestor *)self->_snapshotRequestor invalidate];
  [(SBUserInterfaceStyleProvider *)self->_userInterfaceStyleProvider removeObserver:self];
  id v4 = self->_selfReference;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  char v9 = __25__SBSceneManager_dealloc__block_invoke;
  uint64_t v10 = &unk_1E6AF4AC0;
  long long v11 = v4;
  int v5 = v4;
  BSDispatchMain();

  v6.receiver = self;
  v6.super_class = (Class)SBSceneManager;
  [(SBSceneManager *)&v6 dealloc];
}

uint64_t __25__SBSceneManager_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)invalidate
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v11 = [NSString stringWithUTF8String:"-[SBSceneManager invalidate]"];
    [v10 handleFailureInFunction:v11 file:@"SBSceneManager.m" lineNumber:260 description:@"this call must be made on the main thread"];
  }
  if (!self->_state)
  {
    self->_state = 1;
    id v3 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E4F4F6F8]);
    boundScenes = self->_boundScenes;
    self->_boundScenes = v3;

    [(UIScenePresentationBinder *)self->_presentationBinder invalidate];
    presentationBinder = self->_presentationBinder;
    self->_presentationBinder = 0;

    [(SBSceneSnapshotRequestor *)self->_snapshotRequestor invalidate];
    snapshotRequestor = self->_snapshotRequestor;
    self->_snapshotRequestor = 0;

    [(SBUserInterfaceStyleProvider *)self->_userInterfaceStyleProvider removeObserver:self];
    uint64_t v7 = [(BSCopyingCacheSet *)self->_allScenes immutableSet];
    uint64_t v8 = (void *)MEMORY[0x1E4F62490];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __28__SBSceneManager_invalidate__block_invoke;
    uint64_t v15 = &unk_1E6AF5290;
    id v16 = v7;
    uint64_t v17 = self;
    id v9 = v7;
    [v8 synchronizeChanges:&v12];
    self->_state = 2;
    [(SBSceneManagerReference *)self->_selfReference invalidate];
    [(SBSceneManager *)self _noteObserversDidInvalidate];
  }
}

uint64_t __28__SBSceneManager_invalidate__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__SBSceneManager_invalidate__block_invoke_2;
  v3[3] = &unk_1E6AF87C0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __28__SBSceneManager_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = [a2 identifier];
  [v2 destroyScene:v3 withTransitionContext:0];
}

- (SBPolicyAggregatorCapabilityQuerying)policyAggregator
{
  return (SBPolicyAggregatorCapabilityQuerying *)self->_policyAggregator;
}

- (id)scenesForWorkspaceWithID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v6 = [(BSCopyingCacheSet *)self->_workspaceScenes immutableSet];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 workspaceIdentifier];
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)transferOwnershipOfSceneWithIdentity:(id)a3 toSceneManager:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  uint64_t v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138413058;
    uint64_t v41 = v10;
    __int16 v42 = 2048;
    v43 = self;
    __int16 v44 = 2114;
    id v45 = v6;
    __int16 v46 = 2114;
    v47 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[%@-%p] Transferring ownership of scene %{public}@ to %{public}@", buf, 0x2Au);
  }
  long long v11 = [(SBSceneManager *)self existingSceneHandleForSceneIdentity:v6];
  uint64_t v12 = [v11 sceneIfExists];
  int v13 = v12;
  if (v12)
  {
    id v34 = v6;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __70__SBSceneManager_transferOwnershipOfSceneWithIdentity_toSceneManager___block_invoke;
    v37[3] = &unk_1E6AF8810;
    v37[4] = self;
    id v14 = v12;
    id v38 = v14;
    long long v15 = v7;
    uint64_t v39 = v15;
    [(SBSceneManager *)self _doObserverCalloutWithBlock:v37];
    [(SBSceneManager *)self _prepareToRemoveScene:v14 withReason:1];
    [(SBSceneManager *)self _removeScene:v14 withReason:1];
    [v15 _addScene:v14];
    long long v16 = [v15 displayIdentity];
    long long v17 = [v16 currentConfiguration];

    long long v18 = [v14 settings];
    long long v19 = [v18 displayConfiguration];

    if ([v17 isEqual:v19])
    {
      [v14 updateSettingsWithBlock:&__block_literal_global_61];
      uint64_t v20 = SBLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = (objc_class *)objc_opt_class();
        long long v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138412802;
        uint64_t v41 = v22;
        __int16 v42 = 2048;
        v43 = self;
        __int16 v44 = 2114;
        id v45 = v17;
        _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "[%@-%p] Clearing displayConfigurationForSceneManagers because the scene's displayConfiguration matches the sceneManager's displayConfiguration: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __70__SBSceneManager_transferOwnershipOfSceneWithIdentity_toSceneManager___block_invoke_62;
      v35[3] = &unk_1E6AF8858;
      char v29 = v17;
      v36 = v29;
      [v14 updateSettingsWithBlock:v35];
      uint64_t v30 = SBLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v31);
        *(_DWORD *)buf = 138413058;
        uint64_t v41 = v33;
        __int16 v42 = 2048;
        v43 = self;
        __int16 v44 = 2114;
        id v45 = v19;
        __int16 v46 = 2114;
        v47 = v29;
        _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "[%@-%p] Setting displayConfigurationForSceneManagers because the scene's displayConfiguration %{public}@ does NOT match the sceneManager's displayConfiguration: %{public}@", buf, 0x2Au);
      }
      uint64_t v20 = v36;
    }

    v32 = [v15 existingSceneHandleForScene:v14];
    [v32 setSceneManager:v15];
    if (v32 && v11 != v32) {
      [v11 _noteReplacedWithSceneHandle:v32];
    }

    id v6 = v34;
  }
  else
  {
    [(SBSceneManager *)self _prepareToRemoveSceneHandle:v11 withReason:1];
    [(SBSceneManager *)self _removeSceneHandle:v11 withReason:1];
    uint64_t v23 = [SBApplicationSceneHandleRequest alloc];
    v24 = [v11 application];
    uint64_t v25 = [v11 _definition];
    __int16 v26 = [v7 displayIdentity];
    uint64_t v27 = [(SBApplicationSceneHandleRequest *)v23 initWithApplication:v24 sceneDefinition:v25 displayIdentity:v26];

    id v28 = [v7 fetchOrCreateApplicationSceneHandleForRequest:v27];
    [v28 setSceneManager:v7];
  }
}

void __70__SBSceneManager_transferOwnershipOfSceneWithIdentity_toSceneManager___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneManager:a1[4] willMoveScene:a1[5] toSceneManager:a1[6]];
  }
}

uint64_t __70__SBSceneManager_transferOwnershipOfSceneWithIdentity_toSceneManager___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sb_setDisplayConfigurationForSceneManagers:", 0);
}

uint64_t __70__SBSceneManager_transferOwnershipOfSceneWithIdentity_toSceneManager___block_invoke_62(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sb_setDisplayConfigurationForSceneManagers:", *(void *)(a1 + 32));
}

- (id)existingSceneHandleForPersistenceIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__SBSceneManager_existingSceneHandleForPersistenceIdentifier___block_invoke;
    v9[3] = &unk_1E6AF8880;
    id v10 = v4;
    id v6 = (void (**)(void, void))MEMORY[0x1D948C7A0](v9);
    uint64_t v7 = ((void (**)(void, NSMapTable *))v6)[2](v6, self->_persistentMapSceneIdentityToSceneHandle);
    if (!v7)
    {
      uint64_t v7 = ((void (**)(void, NSMapTable *))v6)[2](v6, self->_transientMapSceneIdentityToSceneHandle);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __62__SBSceneManager_existingSceneHandleForPersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectEnumerator];
  id v4 = 0;
  do
  {
    int v5 = v4;
    id v4 = [v3 nextObject];

    if (!v4) {
      break;
    }
    id v6 = [v4 persistenceIdentifier];
    int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  }
  while (!v7);

  return v4;
}

- (id)externalApplicationSceneHandlesForBundleIdentifiers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(SBSceneManager *)self externalApplicationSceneHandles];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 application];
        int v13 = [v12 bundleIdentifier];
        int v14 = [v4 containsObject:v13];

        if (v14)
        {
          uint64_t v15 = objc_opt_class();
          id v16 = v11;
          if (v15)
          {
            if (objc_opt_isKindOfClass()) {
              long long v17 = v16;
            }
            else {
              long long v17 = 0;
            }
          }
          else
          {
            long long v17 = 0;
          }
          id v18 = v17;

          [v5 addObject:v18];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v5;
}

uint64_t __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke_2;
  v3[3] = &unk_1E6AF87C0;
  v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateObjectsUsingBlock:v3];
}

void __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogWorkspace();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Background status assertion invalidated for scene: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 168) removeObject:v3];
  if ([v3 isValid])
  {
    int v5 = *(void **)(*(void *)(a1 + 32) + 16);
    id v6 = [v3 identifier];
    id v7 = [v5 sceneWithIdentifier:v6];

    if (v7 == v3)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v3 settings];
      [v8 _updateStateForScene:v3 withSettings:v9];
    }
  }
}

void __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogWorkspace();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Asserting background status for scenes: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 168) addObject:v3];
  int v5 = *(void **)(a1 + 32);
  id v6 = [v3 settings];
  [v5 _updateStateForScene:v3 withSettings:v6];
}

- (void)addChildTransactionProvider:(id)a3
{
  id v8 = a3;
  BSDispatchQueueAssertMain();
  id v4 = v8;
  if (v8)
  {
    childTransactionProviders = self->_childTransactionProviders;
    if (!childTransactionProviders)
    {
      id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      int v7 = self->_childTransactionProviders;
      self->_childTransactionProviders = v6;

      childTransactionProviders = self->_childTransactionProviders;
    }
    [(NSMutableSet *)childTransactionProviders addObject:v8];
    id v4 = v8;
  }
}

- (void)removeChildTransactionProvider:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  id v4 = v7;
  if (v7)
  {
    [(NSMutableSet *)self->_childTransactionProviders removeObject:v7];
    uint64_t v5 = [(NSMutableSet *)self->_childTransactionProviders count];
    id v4 = v7;
    if (!v5)
    {
      childTransactionProviders = self->_childTransactionProviders;
      self->_childTransactionProviders = 0;

      id v4 = v7;
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  id v4 = v5;
  if (v5)
  {
    [(NSHashTable *)self->_observers removeObject:v5];
    id v4 = v5;
  }
}

- (id)newSceneIdentifierForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[SBApplicationController sharedInstance];
  id v6 = [v5 applicationWithBundleIdentifier:v4];

  id v7 = [v6 info];
  id v8 = -[SBSceneManager newSceneIdentifierForBundleIdentifier:supportsMultiwindow:](self, "newSceneIdentifierForBundleIdentifier:supportsMultiwindow:", v4, [v7 supportsMultiwindow]);

  return v8;
}

- (void)bootCompleted:(id)a3
{
  id v4 = +[SBIconController sharedInstance];
  iconStyleProvider = self->_iconStyleProvider;
  self->_iconStyleProvider = v4;

  [(SBIconStyleProvider *)self->_iconStyleProvider addIconStyleObserver:self];
  id v6 = self->_iconStyleProvider;
  id v7 = [(SBIconStyleProvider *)v6 currentIconStyleConfiguration];
  [(SBSceneManager *)self iconStyleProvider:v6 didUpdateIconStyleConfiguration:v7];
}

- (NSString)debugDescription
{
  return (NSString *)[(SBSceneManager *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSceneManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSceneManager *)self succinctDescriptionBuilder];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v16[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v17 = v6;
  id v18 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v14[3] = &unk_1E6AF5290;
  v14[4] = self;
  id v7 = v6;
  id v15 = v7;
  [v7 appendBodySectionWithName:@"TransientScenes" multilinePrefix:0 block:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v12[3] = &unk_1E6AF5290;
  void v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [v8 appendBodySectionWithName:@"Scenes" multilinePrefix:0 block:v12];
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) displayIdentity];
  id v2 = (id)[v1 appendObject:v3 withName:@"display"];
}

void __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "objectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v6) succinctDescription];
        id v9 = (id)[v7 appendObject:v8 withName:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 120) immutableSet];
  uint64_t v3 = (void *)[v2 mutableCopy];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v13[3] = &unk_1E6AF88F8;
  id v14 = v3;
  id v15 = *(id *)(a1 + 40);
  id v4 = v3;
  uint64_t v5 = (void (**)(void, void, void, void))MEMORY[0x1D948C7A0](v13);
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 160) immutableSet];
  ((void (**)(void, __CFString *, void *, void))v5)[2](v5, @"externalForegroundAppSceneHandles", v6, 0);
  id v7 = [*(id *)(*(void *)(a1 + 32) + 144) immutableSet];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_5;
  v11[3] = &unk_1E6AF8920;
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 objectsPassingTest:v11];
  ((void (**)(void, __CFString *, void *, void))v5)[2](v5, @"externalBackgroundAppSceneHandles", v9, 0);

  long long v10 = [*(id *)(*(void *)(a1 + 32) + 136) immutableSet];
  ((void (**)(void, __CFString *, void, void *))v5)[2](v5, @"otherWorkspace", 0, v10);

  ((void (**)(void, __CFString *, void, void))v5)[2](v5, @"assertedBackground", 0, *(void *)(*(void *)(a1 + 32) + 168));
  ((void (**)(void, __CFString *, void, id))v5)[2](v5, @"uncategorized", 0, v4);
}

void __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = [MEMORY[0x1E4F1CA48] array];
  if ([v8 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v30 = v9;
      uint64_t v31 = a1;
      id v33 = v8;
      id v15 = v7;
      id v16 = 0;
      uint64_t v17 = *(void *)v39;
      do
      {
        uint64_t v18 = 0;
        long long v19 = v16;
        do
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v12);
          }
          long long v20 = *(void **)(*((void *)&v38 + 1) + 8 * v18);
          long long v21 = [v20 succinctDescription];
          [v10 addObject:v21];

          id v16 = [v20 sceneIfExists];

          if (v16) {
            [v11 addObject:v16];
          }
          ++v18;
          long long v19 = v16;
        }
        while (v14 != v18);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v14);

      id v7 = v15;
      a1 = v31;
      id v8 = v33;
      id v9 = v30;
    }
  }
  else if ([v9 count])
  {
    uint64_t v32 = a1;
    id v29 = v7;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v22 = v9;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v27 succinctDescription];
          }
          else {
          id v28 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), v27];
          }
          [v10 addObject:v28];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v24);
    }

    id v11 = v22;
    id v7 = v29;
    a1 = v32;
  }
  else
  {
    id v11 = 0;
  }
  [*(id *)(a1 + 32) minusSet:v11];
  [*(id *)(a1 + 40) appendArraySection:v10 withName:v7 skipIfEmpty:1];
}

uint64_t __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)succinctDescription
{
  id v2 = [(SBSceneManager *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = v3;
  int64_t state = self->_state;
  if (state == 1)
  {
    uint64_t v6 = @"invalidating";
  }
  else
  {
    if (state != 2) {
      goto LABEL_6;
    }
    uint64_t v6 = @"invalidated";
  }
  [v3 appendString:v6 withName:0];
LABEL_6:
  return v4;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3) {
    self->_hidden = a3;
  }
}

- (BOOL)_shouldAutoHostScene:(id)a3
{
  return 0;
}

- (BOOL)_shouldTrackScenesForDeactivation
{
  return 0;
}

void __41__SBSceneManager__handleAction_forScene___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x1E4F42940];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithInfo:0 error:v5];

  [*(id *)(a1 + 32) sendResponse:v6];
}

- (SBWindowScene)_windowScene
{
  uint64_t v3 = [(id)SBApp windowSceneManager];
  id v4 = [(SBSceneManager *)self displayIdentity];
  id v5 = [v3 windowSceneForDisplayIdentity:v4];

  return (SBWindowScene *)v5;
}

- (void)_reconnectSceneRemnant:(id)a3 forProcess:(id)a4 sceneManager:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 lastSettings];
  id v12 = [v9 createLegacySceneFromRemnant:v10 withSettings:v11 transitionContext:0];

  if (v12)
  {
    uint64_t v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v16 = FBSProcessPrettyDescription();
      uint64_t v17 = [MEMORY[0x1E4F4F718] succinctDescriptionForObject:v12];
      int v23 = 138413058;
      uint64_t v24 = v15;
      __int16 v25 = 2048;
      __int16 v26 = self;
      __int16 v27 = 2112;
      id v28 = v16;
      __int16 v29 = 2112;
      id v30 = v17;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[%@-%p] Connected to remnant from %@: %@", (uint8_t *)&v23, 0x2Au);
    }
    uint64_t v18 = [v12 settings];
    int v19 = [v18 isForeground];

    if (v19)
    {
      long long v20 = SBLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        int v23 = 138412546;
        uint64_t v24 = v22;
        __int16 v25 = 2048;
        __int16 v26 = self;
        _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "[%@-%p] Sending foreground scene remnant to the background.", (uint8_t *)&v23, 0x16u);
      }
      [v12 updateSettingsWithBlock:&__block_literal_global_138];
    }
  }
}

uint64_t __65__SBSceneManager__reconnectSceneRemnant_forProcess_sceneManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (id)_appSceneClientSettingsDiffInspector
{
  return 0;
}

- (id)debugNameForSceneSnapshotRequestor:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F62420], "sharedInstance", a3);
  id v5 = [(SBSceneManager *)self displayIdentity];
  id v6 = [v4 configurationForIdentity:v5];

  id v7 = [v6 name];

  return v7;
}

- (id)sceneSnapshotRequestContextForSceneSnapshotRequestor:(id)a3
{
  id v4 = objc_msgSend((id)SBApp, "windowSceneManager", a3);
  id v5 = [(SBSceneManager *)self displayIdentity];
  id v6 = [v4 windowSceneForDisplayIdentity:v5];

  id v7 = [v6 switcherController];
  uint64_t v8 = [v7 windowManagementStyle];
  id v9 = [v6 layoutStateTransitionCoordinator];
  id v10 = [v9 transitionContext];

  id v11 = [(id)SBApp windowSceneManager];
  id v12 = [MEMORY[0x1E4F62420] mainIdentity];
  uint64_t v13 = [v11 windowSceneForDisplayIdentity:v12];

  uint64_t v14 = [v13 switcherController];
  id v15 = objc_alloc_init(SBMutableSceneSnapshotRequestContext);
  [(SBSceneSnapshotRequestContext *)v15 setSceneDisplayReferenceFrameProvider:v7];
  [(SBSceneSnapshotRequestContext *)v15 setSceneDisplayWindowManagementStyle:v8];
  [(SBSceneSnapshotRequestContext *)v15 setSceneDisplayLayoutStateTransitionContext:v10];
  [(SBSceneSnapshotRequestContext *)v15 setEmbeddedDisplayReferenceFrameProvider:v14];

  return v15;
}

- (id)sceneSnapshotRequestStrategyForSceneSnapshotRequestor:(id)a3
{
  if (self->_snapshotRequestor)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  }
  return 0;
}

- (void)_removeReportedForegroundExternalApplicationSceneHandle:(id)a3
{
  id v4 = a3;
  if ([(BSCopyingCacheSet *)self->_reportedExternalForegroundApplicationSceneHandles containsObject:v4])
  {
    [(BSCopyingCacheSet *)self->_reportedExternalForegroundApplicationSceneHandles removeObject:v4];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74__SBSceneManager__removeReportedForegroundExternalApplicationSceneHandle___block_invoke;
    v5[3] = &unk_1E6AF8998;
    v5[4] = self;
    id v6 = v4;
    [(SBSceneManager *)self _doObserverCalloutWithBlock:v5];
  }
}

void __74__SBSceneManager__removeReportedForegroundExternalApplicationSceneHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneManager:*(void *)(a1 + 32) didRemoveExternalForegroundApplicationSceneHandle:*(void *)(a1 + 40)];
  }
}

- (void)_noteObserversDidInvalidate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__SBSceneManager__noteObserversDidInvalidate__block_invoke;
  v2[3] = &unk_1E6AF89C0;
  v2[4] = self;
  [(SBSceneManager *)self _doObserverCalloutWithBlock:v2];
}

void __45__SBSceneManager__noteObserversDidInvalidate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneManagerDidInvalidate:*(void *)(a1 + 32)];
  }
}

- (int64_t)userInterfaceStyle
{
  return [(SBUserInterfaceStyleProvider *)self->_userInterfaceStyleProvider currentStyle];
}

- (void)addUserInterfaceStyleObserver:(id)a3
{
  id v8 = a3;
  BSDispatchQueueAssertMain();
  id v4 = v8;
  if (v8)
  {
    userInterfaceStyleObservers = self->_userInterfaceStyleObservers;
    if (!userInterfaceStyleObservers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_userInterfaceStyleObservers;
      self->_userInterfaceStyleObservers = v6;

      userInterfaceStyleObservers = self->_userInterfaceStyleObservers;
    }
    [(NSHashTable *)userInterfaceStyleObservers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeUserInterfaceStyleObserver:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  id v4 = v5;
  if (v5)
  {
    [(NSHashTable *)self->_userInterfaceStyleObservers removeObject:v5];
    id v4 = v5;
  }
}

- (void)userInterfaceStyleProvider:(id)a3 didUpdateStyle:(int64_t)a4 preferredAnimationSettings:(id)a5 completion:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  id v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = SBFStringForUIUserInterfaceStyle();
    *(_DWORD *)buf = 138543362;
    long long v20 = v12;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Got a user interface style change, forwarding %{public}@ to scenes", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke;
  v15[3] = &unk_1E6AF74C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  int64_t v18 = a4;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

void __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x1E4F624E0] sharedInstance];
  id v3 = (void *)MEMORY[0x1E4F624D8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_2;
  v11[3] = &unk_1E6AF6260;
  uint64_t v4 = a1[4];
  id v5 = (void *)a1[5];
  id v12 = v2;
  uint64_t v13 = v4;
  id v6 = v5;
  id v8 = (void *)a1[6];
  uint64_t v7 = a1[7];
  id v14 = v6;
  uint64_t v16 = v7;
  id v15 = v8;
  id v9 = v2;
  id v10 = [v3 eventWithName:@"Forward user interface style change to scenes" handler:v11];
  [v9 executeOrAppendEvent:v10];
}

void __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v64[3] = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__6;
  v62[4] = __Block_byref_object_dispose__6;
  id v63 = [*(id *)(a1 + 32) acquireLockForReason:@"Forward user interface style change to scenes"];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_3;
  v61[3] = &unk_1E6AF56B0;
  v61[4] = v64;
  __int16 v29 = (void (**)(void))MEMORY[0x1D948C7A0](v61);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_4;
  v57[3] = &unk_1E6AF89E8;
  id v59 = v64;
  v60 = v62;
  id v58 = *(id *)(a1 + 32);
  id v28 = (void (**)(void))MEMORY[0x1D948C7A0](v57);
  v29[2]();
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  id v2 = [(id)SBApp systemUIScenesCoordinator];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_5;
  v52[3] = &unk_1E6AF8A10;
  v52[4] = &v53;
  [v2 enumerateScenesWithBlock:v52];

  id v3 = [*(id *)(a1 + 40) allScenes];
  if ([v3 count] || *((unsigned char *)v54 + 24))
  {
  }
  else
  {
    BOOL v26 = [*(id *)(*(void *)(a1 + 40) + 216) count] == 0;

    if (v26)
    {
      id v5 = 0;
      uint64_t v4 = 0;
      goto LABEL_5;
    }
  }
  uint64_t v4 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
  id v5 = *(id *)(a1 + 48);
LABEL_5:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v6 = [*(id *)(a1 + 40) allScenes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v67 count:16];
  if (!v7) {
    goto LABEL_18;
  }
  uint64_t v8 = *(void *)v49;
  __int16 v27 = v42;
  obuint64_t j = v6;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v49 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      id v11 = objc_msgSend(v10, "settings", v27);
      if ([v11 isUISubclass])
      {
        id v12 = objc_msgSend(v11, "sb_displayIdentityForSceneManagers");
        if (v12)
        {
          if ([v11 isForeground])
          {
          }
          else
          {
            int v13 = [v11 underLock];

            if (!v13) {
              goto LABEL_16;
            }
          }
          v29[2]();
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v42[0] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_6;
          v42[1] = &unk_1E6AF8A38;
          uint64_t v47 = *(void *)(a1 + 64);
          id v43 = v4;
          uint64_t v44 = v10;
          id v45 = v5;
          __int16 v46 = v28;
          [v10 performUpdate:v41];
        }
      }
LABEL_16:
    }
    id v6 = obj;
    uint64_t v7 = [obj countByEnumeratingWithState:&v48 objects:v67 count:16];
  }
  while (v7);
LABEL_18:

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = *(id *)(*(void *)(a1 + 40) + 216);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v66 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * j) sceneManager:*(void *)(a1 + 40) didUpdateUserInterfaceStyle:*(void *)(a1 + 64) withAnimationSettings:v5 fence:v4];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v66 count:16];
    }
    while (v15);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  int64_t v18 = [(id)SBApp windowSceneManager];
  int v19 = [v18 connectedWindowScenes];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v65 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v19);
        }
        int v23 = [*(id *)(*((void *)&v33 + 1) + 8 * k) traitsPipelineManager];
        [v23 userInterfaceStyleDidUpdateWithAnimationSettings:v5 fence:v4];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v65 count:16];
    }
    while (v20);
  }

  if (v4)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F39CF8];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_7;
    v31[3] = &unk_1E6AF5300;
    id v32 = *(id *)(a1 + 56);
    objc_msgSend(v24, "bs_performAfterSynchronizedCommit:", v31);
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 56);
    if (v25) {
      (*(void (**)(void))(v25 + 16))();
    }
  }
  v28[2]();

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(v62, 8);

  _Block_object_dispose(v64, 8);
}

uint64_t __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_3(uint64_t result)
{
  return result;
}

void __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_4(uint64_t a1)
{
  if (!--*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "relinquishLock:");
    uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
}

uint64_t __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_5(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  [a2 setUserInterfaceStyle:*(void *)(a1 + 64)];
  [v12 setAnimationFence:*(void *)(a1 + 32)];
  id v5 = [(id)SBApp systemUIScenesCoordinator];
  id v6 = [v5 accessibilityUIServerUISceneController];
  uint64_t v7 = [v6 jobLabel];

  uint64_t v8 = [*(id *)(a1 + 40) clientHandle];
  id v9 = [v8 bundleIdentifier];
  int v10 = [v9 isEqualToString:v7];

  if (v10 && (_AXSClassicInvertColorsEnabled() || _AXSInvertColorsEnabled()))
  {
    id v11 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.0];
    [v12 setAnimationSettings:v11];
  }
  else
  {
    [v12 setAnimationSettings:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)iconStyleProvider:(id)a3 didUpdateIconStyleConfiguration:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Got an icon style change, forwarding %{public}@ to scenes", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke;
  v8[3] = &unk_1E6AF5290;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F624E0] sharedInstance];
  id v3 = (void *)MEMORY[0x1E4F624D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_2;
  v8[3] = &unk_1E6AF4E00;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v9 = v2;
  uint64_t v10 = v4;
  id v11 = v5;
  id v6 = v2;
  id v7 = [v3 eventWithName:@"Forward icon style change to scenes" handler:v8];
  [v6 executeOrAppendEvent:v7];
}

void __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_2(id *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__6;
  void v31[4] = __Block_byref_object_dispose__6;
  id v32 = [a1[4] acquireLockForReason:@"Forward icon style change to scenes"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_3;
  v30[3] = &unk_1E6AF56B0;
  v30[4] = v33;
  v1 = (void (**)(void))MEMORY[0x1D948C7A0](v30);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_4;
  v26[3] = &unk_1E6AF89E8;
  id v28 = v33;
  __int16 v29 = v31;
  id v27 = a1[4];
  id v11 = (void (**)(void))MEMORY[0x1D948C7A0](v26);
  v1[2](v1);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  uint64_t v2 = [(id)SBApp systemUIScenesCoordinator];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_5;
  v23[3] = &unk_1E6AF8A10;
  v23[4] = v24;
  [v2 enumerateScenesWithBlock:v23];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [a1[5] allScenes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v8 = [v7 settings];
        if ([v8 isUISubclass])
        {
          id v9 = objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
          if (v9)
          {
            if ([v8 isForeground])
            {
            }
            else
            {
              int v10 = [v8 underLock];

              if (!v10) {
                goto LABEL_12;
              }
            }
            v1[2](v1);
            v13[0] = MEMORY[0x1E4F143A8];
            v13[1] = 3221225472;
            v13[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_6;
            v13[3] = &unk_1E6AF8A60;
            id v14 = a1[6];
            uint64_t v15 = v7;
            id v16 = 0;
            id v17 = 0;
            int64_t v18 = v11;
            [v7 performUpdate:v13];
          }
        }
LABEL_12:
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v34 count:16];
    }
    while (v4);
  }

  v11[2](v11);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

uint64_t __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_3(uint64_t result)
{
  return result;
}

void __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_4(uint64_t a1)
{
  if (!--*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "relinquishLock:");
    uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
}

uint64_t __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_5(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if ([v18 conformsToProtocol:&unk_1F35B14D8])
  {
    id v6 = *(id *)(a1 + 32);
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      id v7 = [*(id *)(a1 + 40) clientProcess];
      int v8 = [v7 pid];
      pid_t v9 = getpid();

      if (v8 != v9)
      {
        uint64_t v10 = [MEMORY[0x1E4FA6AB8] automaticStyleConfiguration];

        id v6 = (id)v10;
      }
    }
    [v18 setIconStyleConfiguration:v6];
  }
  [v5 setAnimationFence:*(void *)(a1 + 48)];
  id v11 = [(id)SBApp systemUIScenesCoordinator];
  uint64_t v12 = [v11 accessibilityUIServerUISceneController];
  int v13 = [v12 jobLabel];

  id v14 = [*(id *)(a1 + 40) clientHandle];
  uint64_t v15 = [v14 bundleIdentifier];
  int v16 = [v15 isEqualToString:v13];

  if (v16 && (_AXSClassicInvertColorsEnabled() || _AXSInvertColorsEnabled()))
  {
    id v17 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.0];
    [v5 setAnimationSettings:v17];
  }
  else
  {
    [v5 setAnimationSettings:*(void *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (id)sceneIdentityForApplication:(id)a3
{
  return (id)[(SBApplicationSceneIdentityProviding *)self->_sceneIdentityProvider sceneIdentityForApplication:a3];
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4
{
  return (id)[(SBApplicationSceneIdentityProviding *)self->_sceneIdentityProvider sceneIdentityForApplication:a3 targetContentIdentifier:a4];
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleIdentifiers:(id)a7
{
  return (id)[(SBApplicationSceneIdentityProviding *)self->_sceneIdentityProvider sceneIdentityForApplication:a3 targetContentIdentifier:a4 allowCanMatches:a5 preferNewScene:a6 visibleIdentifiers:a7];
}

- (id)sceneIdentityForApplication:(id)a3 excludingIdentifiers:(id)a4
{
  return (id)[(SBApplicationSceneIdentityProviding *)self->_sceneIdentityProvider sceneIdentityForApplication:a3 excludingIdentifiers:a4];
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 sceneSessionRole:(id)a6
{
  return (id)[(SBApplicationSceneIdentityProviding *)self->_sceneIdentityProvider sceneIdentityForApplication:a3 uniqueIdentifier:a4 targetContentIdentifier:a5 sceneSessionRole:a6];
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
}

- (void)_prepareToRemoveScene:(id)a3 withReason:(int64_t)a4
{
  snapshotRequestor = self->_snapshotRequestor;
  id v7 = a3;
  int v8 = [v7 identifier];
  [(SBSceneSnapshotRequestor *)snapshotRequestor invalidatePendingSnapshotsForSceneID:v8];

  id v10 = [(SBSceneManager *)self existingSceneHandleForScene:v7];

  pid_t v9 = v10;
  if (v10)
  {
    [(SBSceneManager *)self _prepareToRemoveSceneHandle:v10 withReason:a4];
    pid_t v9 = v10;
  }
}

- (void)_prepareToRemoveSceneHandle:(id)a3 withReason:(int64_t)a4
{
  id v6 = a3;
  if ([(BSCopyingCacheSet *)self->_reportedExternalForegroundApplicationSceneHandles containsObject:v6])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__SBSceneManager__prepareToRemoveSceneHandle_withReason___block_invoke;
    v7[3] = &unk_1E6AF8A88;
    v7[4] = self;
    id v8 = v6;
    int64_t v9 = a4;
    [(SBSceneManager *)self _doObserverCalloutWithBlock:v7];
  }
}

void __57__SBSceneManager__prepareToRemoveSceneHandle_withReason___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneManager:a1[4] willRemoveExternalForegroundApplicationSceneHandle:a1[5] withReason:a1[6]];
  }
}

- (void)_removeScene:(id)a3 withReason:(int64_t)a4
{
  id v7 = a3;
  [(BSCopyingCacheSet *)self->_allScenes removeObject:v7];
  [(BSCopyingCacheSet *)self->_daemonScenes removeObject:v7];
  [(BSCopyingCacheSet *)self->_workspaceScenes removeObject:v7];
  id v6 = [(SBSceneManager *)self existingSceneHandleForScene:v7];
  if (v6) {
    [(SBSceneManager *)self _removeSceneHandle:v6 withReason:a4];
  }
  [(SBSceneManagerReference *)self->_selfReference releaseForScene:v7];
  [(BSCopyingCacheSet *)self->_boundScenes removeObject:v7];
  [(UIScenePresentationBinder *)self->_presentationBinder removeScene:v7];
}

- (void)_removeSceneHandle:(id)a3 withReason:(int64_t)a4
{
  id v9 = a3;
  [(BSCopyingCacheSet *)self->_externalApplicationSceneHandles removeObject:v9];
  [(BSCopyingCacheSet *)self->_externalForegroundApplicationSceneHandles removeObject:v9];
  [(SBSceneManager *)self _removeReportedForegroundExternalApplicationSceneHandle:v9];
  id v6 = [v9 _definition];
  id v7 = [v6 identity];

  if (a4 == 1)
  {
    [(NSMapTable *)self->_transientMapSceneIdentityToSceneHandle removeObjectForKey:v7];
    [(NSMapTable *)self->_persistentMapSceneIdentityToSceneHandle removeObjectForKey:v7];
  }
  else if (!a4)
  {
    [(NSMapTable *)self->_transientMapSceneIdentityToSceneHandle setObject:v9 forKey:v7];
    [(NSMapTable *)self->_persistentMapSceneIdentityToSceneHandle removeObjectForKey:v7];
    id v8 = [v9 sceneIfExists];
    [v9 _noteSceneDestroyed:v8];
  }
}

- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_state)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBSceneManager.m" lineNumber:1483 description:@"cannot answer scene questions after invalidation"];
  }
  id v9 = [v8 clientProcess];
  if ([v9 isApplicationProcess] && (objc_msgSend(v9, "isCurrentProcess") & 1) == 0)
  {
    uint64_t v12 = [v8 definition];
    int v13 = [v12 specification];
    id v10 = objc_alloc_init((Class)[v13 transitionContextClass]);

    if (!v10) {
      id v10 = objc_alloc_init(MEMORY[0x1E4F42790]);
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (SBLayoutState)currentLayoutState
{
  return self->_currentLayoutState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayoutState, 0);
  objc_storeStrong((id *)&self->_iconStyleProvider, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleObservers, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleProvider, 0);
  objc_storeStrong((id *)&self->_sceneIdentityProvider, 0);
  objc_storeStrong((id *)&self->_childTransactionProviders, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_assertedBackgroundScenes, 0);
  objc_storeStrong((id *)&self->_reportedExternalForegroundApplicationSceneHandles, 0);
  objc_storeStrong((id *)&self->_externalForegroundApplicationSceneHandles, 0);
  objc_storeStrong((id *)&self->_externalApplicationSceneHandles, 0);
  objc_storeStrong((id *)&self->_workspaceScenes, 0);
  objc_storeStrong((id *)&self->_daemonScenes, 0);
  objc_storeStrong((id *)&self->_allScenes, 0);
  objc_storeStrong((id *)&self->_boundPointerUIScenes, 0);
  objc_storeStrong((id *)&self->_boundSingleScenes, 0);
  objc_storeStrong((id *)&self->_boundScenes, 0);
  objc_storeStrong((id *)&self->_transientMapSceneIdentityToSceneHandle, 0);
  objc_storeStrong((id *)&self->_persistentMapSceneIdentityToSceneHandle, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_layoutStateManager, 0);
  objc_storeStrong((id *)&self->_snapshotRequestor, 0);
  objc_storeStrong((id *)&self->_presentationBinder, 0);
  objc_storeStrong((id *)&self->_policyAggregator, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (NSSet)boundPointerUIScenes
{
  return (NSSet *)[(BSCopyingCacheSet *)self->_boundPointerUIScenes immutableSet];
}

- (void)startTrackingSystemUISceneForInterfaceStyleUpdatePurposes:(id)a3
{
}

- (void)stopTrackingSystemUISceneForInterfaceStyleUpdatePurposes:(id)a3
{
}

- (void)addSystemUISceneToPresentationBinder:(id)a3
{
  boundSingleScenes = self->_boundSingleScenes;
  id v5 = a3;
  [(SBSceneManager *)self _addSceneToPresentationBinder:v5 trackedCollection:boundSingleScenes];
  [(BSCopyingCacheSet *)self->_allScenes removeObject:v5];
}

- (void)removeSystemUISceneFromPresentationBinder:(id)a3
{
}

- (void)addPointerUISceneToPresentationBinder:(id)a3
{
}

- (void)removePointerUISceneFromPresentationBinder:(id)a3
{
}

- (void)_addSceneToPresentationBinder:(id)a3 trackedCollection:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (self->_state)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBSceneManager.m" lineNumber:1555 description:@"cannot respond to non-destruction scene events after invalidation"];
  }
  [(BSCopyingCacheSet *)self->_boundScenes addObject:v10];
  [(UIScenePresentationBinder *)self->_presentationBinder addScene:v10];
  [v7 addObject:v10];
  id v8 = [v10 workspaceIdentifier];
  if (v8) {
    [(BSCopyingCacheSet *)self->_workspaceScenes addObject:v10];
  }
  [(BSCopyingCacheSet *)self->_allScenes addObject:v10];
}

- (void)_removeSceneFromPresentationBinder:(id)a3 trackedCollection:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (self->_state)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBSceneManager.m" lineNumber:1570 description:@"cannot respond to non-destruction scene events after invalidation"];
  }
  [(BSCopyingCacheSet *)self->_boundScenes removeObject:v10];
  [(UIScenePresentationBinder *)self->_presentationBinder removeScene:v10];
  [v7 removeObject:v10];
  id v8 = [v10 workspaceIdentifier];
  if (v8) {
    [(BSCopyingCacheSet *)self->_workspaceScenes removeObject:v10];
  }
  [(BSCopyingCacheSet *)self->_allScenes removeObject:v10];
}

- (void)updatePresentationBinder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = (UIScenePresentationBinder *)a3;
  p_presentationBinder = &self->_presentationBinder;
  presentationBinder = self->_presentationBinder;
  if (presentationBinder != v5)
  {
    id v8 = presentationBinder;
    objc_storeStrong((id *)&self->_presentationBinder, a3);
    [(UIScenePresentationBinder *)v8 invalidate];
    id v9 = [(BSCopyingCacheSet *)self->_boundScenes immutableSet];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          [(UIScenePresentationBinder *)*p_presentationBinder addScene:v14];
          [(UIScenePresentationBinder *)v8 removeScene:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)_handleAction:(uint64_t)a1 forScene:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end