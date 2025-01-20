@interface SBSystemApertureStatusBarPillElementProvider
- (BOOL)_managesDedicatedElementForBackgroundActivityIdentifier:(id)a3;
- (BOOL)_managesDedicatedElementForBackgroundActivityIdentifiers:(id)a3;
- (BOOL)isActivated;
- (NSHashTable)observers;
- (NSHashTable)suppressionAssertions;
- (NSMutableSet)_registeredElements;
- (NSMutableSet)applicationsWithActiveElements;
- (NSMutableSet)assertionsForApplicationsWithActiveElements;
- (NSSet)currentBackgroundActivityIdentifiers;
- (NSString)resolvedBackgroundActivityIdentifier;
- (NSTimer)applyOverridesDebounceTimer;
- (SBDeviceApplicationSceneHandle)observedSceneHandle;
- (SBSystemApertureController)elementRegistrar;
- (SBSystemApertureSettings)settings;
- (SBSystemApertureStatusBarPillElement)_activeElement;
- (SBSystemApertureStatusBarPillElement)_nowLocatingElement;
- (SBSystemApertureStatusBarPillElement)_nowRecordingElement;
- (SBSystemApertureStatusBarPillElementProvider)init;
- (SBWindowSceneStatusBarAssertionManager)statusBarAssertionManager;
- (UIStatusBarServer)_statusBarServer;
- (id)acquireActiveElementAssertionForApplication:(id)a3 reason:(id)a4;
- (id)acquireSuppressionAssertionForBackgroundActivities:(id)a3 reason:(id)a4;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_invalidateElement:(id)a3 withReason:(id)a4;
- (void)_lockStateChanged;
- (void)_nowLocatingAppsDidChange;
- (void)_nowRecordingAppDidChange;
- (void)_registerElement:(id)a3;
- (void)_updateActiveElementIfNeededForReason:(id)a3;
- (void)_updateActiveElementIfNeededForReason:(id)a3 notifyingObserversIfNecessary:(BOOL)a4;
- (void)_updateActiveElementIfNeededWithLayoutState:(id)a3 reason:(id)a4;
- (void)_updateActiveElementIfNeededWithLayoutState:(id)a3 reason:(id)a4 notifyingObserversIfNecessary:(BOOL)a5;
- (void)_updateCurrentBackgroundActivityIdentifiersWithStatusBarOverrides:(unint64_t)a3;
- (void)_updateNowLocatingElementWithReason:(id)a3;
- (void)_updateNowRecordingAndNowLocatingElementsWithReason:(id)a3;
- (void)_updateNowRecordingElementWithReason:(id)a3;
- (void)activateWithRegistrar:(id)a3;
- (void)activeBackgroundActivitiesDidUpdate:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4;
- (void)removeObserver:(id)a3;
- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4;
- (void)setActivated:(BOOL)a3;
- (void)setApplyOverridesDebounceTimer:(id)a3;
- (void)setCurrentBackgroundActivityIdentifiers:(id)a3;
- (void)setElementRegistrar:(id)a3;
- (void)setObservedSceneHandle:(id)a3;
- (void)setResolvedBackgroundActivityIdentifier:(id)a3;
- (void)setSettings:(id)a3;
- (void)setStatusBarAssertionManager:(id)a3;
- (void)set_registeredElements:(id)a3;
- (void)statusBarAssertionManager:(id)a3 addStatusBarSettingsAssertion:(id)a4;
- (void)statusBarAssertionManager:(id)a3 removeStatusBarSettingsAssertion:(id)a4;
- (void)statusBarAssertionManager:(id)a3 statusBarSettingsDidChange:(id)a4;
- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4;
@end

@implementation SBSystemApertureStatusBarPillElementProvider

- (void)_updateActiveElementIfNeededWithLayoutState:(id)a3 reason:(id)a4 notifyingObserversIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    v46 = [NSString stringWithUTF8String:"-[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededWithLayoutState:reason:notifyingObserversIfNecessary:]"];
    [v45 handleFailureInFunction:v46 file:@"SBSystemApertureStatusBarPillElementProvider.m" lineNumber:332 description:@"this call must be made on the main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedSceneHandle);
  v11 = +[SBLockScreenManager sharedInstanceIfExists];
  if ([v11 isUILocked]) {
    unsigned int v12 = [v11 isUIUnlocking] ^ 1;
  }
  else {
    unsigned int v12 = 0;
  }
  v51 = v9;
  v52 = v8;
  v49 = v11;
  v50 = WeakRetained;
  BOOL v48 = v5;
  if ([v8 unlockedEnvironmentMode] != 3 || (v12 & 1) != 0)
  {
    v19 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v20 = v12;
    v21 = [WeakRetained statusBarStateProvider];
    [v21 removeStatusBarObserver:self];

    [(SBSystemApertureStatusBarPillElementProvider *)self setObservedSceneHandle:0];
  }
  else
  {
    v13 = [v8 elementWithRole:1];
    v14 = [v13 workspaceEntity];
    v15 = [v14 deviceApplicationSceneEntity];

    id v16 = [v15 sceneHandle];
    if (WeakRetained != v16)
    {
      v17 = [WeakRetained statusBarStateProvider];
      [v17 removeStatusBarObserver:self];

      v18 = [v16 statusBarStateProvider];
      [v18 addStatusBarObserver:self];

      [(SBSystemApertureStatusBarPillElementProvider *)self setObservedSceneHandle:v16];
    }
    v19 = [v16 backgroundActivitiesToSuppress];

    uint64_t v20 = 0;
  }
  id v22 = objc_loadWeakRetained((id *)&self->_statusBarAssertionManager);
  v23 = [v22 currentStatusBarSettings];
  v24 = [v23 backgroundActivitiesToSuppress];
  v47 = v19;
  v25 = [v19 setByAddingObjectsFromSet:v24];

  id v26 = v25;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v27 = [(SBSystemApertureStatusBarPillElementProvider *)self suppressionAssertions];
  v28 = [v27 allObjects];

  uint64_t v29 = [v28 countByEnumeratingWithState:&v60 objects:v64 count:16];
  v30 = v26;
  if (v29)
  {
    uint64_t v31 = v29;
    uint64_t v32 = *(void *)v61;
    v30 = v26;
    do
    {
      uint64_t v33 = 0;
      v34 = v30;
      do
      {
        if (*(void *)v61 != v32) {
          objc_enumerationMutation(v28);
        }
        v35 = [*(id *)(*((void *)&v60 + 1) + 8 * v33) backgroundActivitiesToSuppress];
        v30 = [v34 setByAddingObjectsFromSet:v35];

        ++v33;
        v34 = v30;
      }
      while (v31 != v33);
      uint64_t v31 = [v28 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v31);
  }

  if ([(SBSystemApertureSettings *)self->_settings hideRemotePrototypingFallbackPill])
  {
    uint64_t v36 = [v30 setByAddingObject:*MEMORY[0x1E4FA95F0]];

    v30 = (void *)v36;
  }
  v37 = (void *)[(NSSet *)self->_currentBackgroundActivityIdentifiers mutableCopy];
  [v37 minusSet:v30];
  v38 = [MEMORY[0x1E4FA9348] sharedInstance];
  v39 = [v38 resolvedBackgroundActivityFromBackgroundActivities:v37 inPrecedenceScope:v20];

  v40 = [(SBSystemApertureStatusBarPillElementProvider *)self resolvedBackgroundActivityIdentifier];
  if (BSEqualStrings())
  {
    if (v48)
    {
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_3;
      v53[3] = &unk_1E6B07010;
      v53[4] = self;
      [(SBSystemApertureStatusBarPillElementProvider *)self _enumerateObserversRespondingToSelector:sel_statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider_ usingBlock:v53];
    }
  }
  else
  {
    [(SBSystemApertureStatusBarPillElementProvider *)self setResolvedBackgroundActivityIdentifier:v39];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke;
    v56[3] = &unk_1E6AF5B18;
    v56[4] = self;
    id v41 = v39;
    id v57 = v41;
    id v58 = v51;
    BOOL v59 = v48;
    v42 = (void (**)(void))MEMORY[0x1D948C7A0](v56);
    if (v41
      && ![(SBSystemApertureStatusBarPillElementProvider *)self _managesDedicatedElementForBackgroundActivityIdentifier:v41])
    {
      v43 = (void *)MEMORY[0x1E4F1CB00];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_2;
      v54[3] = &unk_1E6AF7330;
      v54[4] = self;
      v55 = v42;
      v44 = [v43 scheduledTimerWithTimeInterval:0 repeats:v54 block:0.75];
      [(SBSystemApertureStatusBarPillElementProvider *)self setApplyOverridesDebounceTimer:v44];
    }
    else
    {
      v42[2](v42);
    }
    if ([(SBSystemApertureStatusBarPillElementProvider *)self _managesDedicatedElementForBackgroundActivityIdentifier:v41]|| [(SBSystemApertureStatusBarPillElementProvider *)self _managesDedicatedElementForBackgroundActivityIdentifier:v40])
    {
      [(SBSystemApertureStatusBarPillElementProvider *)self _updateNowRecordingAndNowLocatingElementsWithReason:@"overrides changed"];
    }
  }
}

- (NSString)resolvedBackgroundActivityIdentifier
{
  return self->_resolvedBackgroundActivityIdentifier;
}

- (NSHashTable)suppressionAssertions
{
  return self->_suppressionAssertions;
}

- (void)setObservedSceneHandle:(id)a3
{
}

- (void)_updateActiveElementIfNeededForReason:(id)a3 notifyingObserversIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"-[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededForReason:notifyingObserversIfNecessary:]"];
    [v17 handleFailureInFunction:v18 file:@"SBSystemApertureStatusBarPillElementProvider.m" lineNumber:317 description:@"this call must be made on the main thread"];
  }
  v6 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  v7 = [v6 currentLayoutState];
  id v8 = [v6 _layoutStateTransitionCoordinator];
  int v9 = [v8 isTransitioning];

  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    v11 = [v6 _layoutStateTransitionCoordinator];
    unsigned int v12 = [v11 transitionContext];
    v13 = [v12 toLayoutState];
    v14 = SBSafeCast(v10, v13);

    if (v14) {
      v15 = v14;
    }
    else {
      v15 = v7;
    }
    id v16 = v15;

    v7 = v16;
  }
  [(SBSystemApertureStatusBarPillElementProvider *)self _updateActiveElementIfNeededWithLayoutState:v7 reason:v19 notifyingObserversIfNecessary:v4];
}

- (void)_updateActiveElementIfNeededForReason:(id)a3
{
}

- (void)statusBarAssertionManager:(id)a3 statusBarSettingsDidChange:(id)a4
{
}

- (void)statusBarAssertionManager:(id)a3 addStatusBarSettingsAssertion:(id)a4
{
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  v7 = [v5 toLayoutState];

  SBSafeCast(v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(SBSystemApertureStatusBarPillElementProvider *)self _updateActiveElementIfNeededWithLayoutState:v8 reason:@"layoutStateTransitionWillEnd"];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  v7 = [v5 toLayoutState];

  SBSafeCast(v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(SBSystemApertureStatusBarPillElementProvider *)self _updateActiveElementIfNeededWithLayoutState:v8 reason:@"layoutStateTransitionDidEnd"];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  v7 = [v5 toLayoutState];

  SBSafeCast(v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(SBSystemApertureStatusBarPillElementProvider *)self _updateActiveElementIfNeededWithLayoutState:v8 reason:@"layoutStateTransitionDidBegin"];
}

- (void)_updateActiveElementIfNeededWithLayoutState:(id)a3 reason:(id)a4
{
}

- (void)_nowRecordingAppDidChange
{
}

- (void)_updateNowRecordingElementWithReason:(id)a3
{
  objc_msgSend((id)SBApp, "audioRecordingManager", a3);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [v12 nowRecordingApplication];
  id v5 = (void *)*MEMORY[0x1E4FA9668];
  uint64_t v6 = [(SBSystemApertureStatusBarPillElementProvider *)self resolvedBackgroundActivityIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (!v7
    || [(NSMutableSet *)self->_applicationsWithActiveElements containsObject:v4])
  {

    BOOL v4 = 0;
  }
  uint64_t v8 = [(SBSystemApertureStatusBarPillElementProvider *)self _nowRecordingElement];
  int v9 = (SBSystemApertureStatusBarPillElement *)v8;
  if (v4)
  {
    if (v8)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
      [(SBSystemApertureStatusBarPillElement *)v9 setAssociatedApplications:v10];
    }
    else
    {
      int v9 = [[SBSystemApertureStatusBarPillElement alloc] initWithBackgroundActivityIdentifier:v5];
      v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
      [(SBSystemApertureStatusBarPillElement *)v9 setAssociatedApplications:v11];

      [(SBSystemApertureStatusBarPillElementProvider *)self _registerElement:v9];
    }
  }
  else
  {
    [(SBSystemApertureStatusBarPillElementProvider *)self _invalidateElement:v8 withReason:@"now recording app did change"];
  }
}

- (SBSystemApertureStatusBarPillElement)_nowRecordingElement
{
  return (SBSystemApertureStatusBarPillElement *)[(NSMutableSet *)self->__registeredElements bs_firstObjectPassingTest:&__block_literal_global_92_0];
}

- (void)_invalidateElement:(id)a3 withReason:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    int v7 = [v9 clientStorage];
    [v7 invalidateWithReason:v6];

    [(NSMutableSet *)self->__registeredElements removeObject:v9];
    if (![(NSMutableSet *)self->__registeredElements count])
    {
      registeredElements = self->__registeredElements;
      self->__registeredElements = 0;
    }
  }
}

- (SBSystemApertureStatusBarPillElementProvider)init
{
  uint64_t v4 = SBFEffectiveArtworkSubtype();
  if (v4 > 2795)
  {
    if (v4 != 2796 && v4 != 2868) {
      goto LABEL_7;
    }
  }
  else if (v4 != 2556 && v4 != 2622)
  {
LABEL_7:
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBSystemApertureStatusBarPillElementProvider.m" lineNumber:89 description:@"Nope. You cannot do this without being on a Jindo device."];
  }
  v20.receiver = self;
  v20.super_class = (Class)SBSystemApertureStatusBarPillElementProvider;
  id v6 = [(SBSystemApertureStatusBarPillElementProvider *)&v20 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F42E40]) initWithStatusBar:0];
    statusBarServer = v6->__statusBarServer;
    v6->__statusBarServer = (UIStatusBarServer *)v7;

    id v9 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
    uint64_t v10 = [v9 assertionManager];
    objc_storeWeak((id *)&v6->_statusBarAssertionManager, v10);

    uint64_t v11 = +[SBSystemApertureDomain rootSettings];
    settings = v6->_settings;
    v6->_settings = (SBSystemApertureSettings *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v13;

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v6 selector:sel__nowLocatingAppsDidChange name:@"SBNowLocatingAppsDidChangeNotification" object:SBApp];

    id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v6 selector:sel__nowRecordingAppDidChange name:@"SBNowRecordingAppDidChangeNotification" object:0];

    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    applicationsWithActiveElements = v6->_applicationsWithActiveElements;
    v6->_applicationsWithActiveElements = (NSMutableSet *)v17;
  }
  return v6;
}

- (void)activateWithRegistrar:(id)a3
{
  id v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a3;
  if (([v5 isMainThread] & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [NSString stringWithUTF8String:"-[SBSystemApertureStatusBarPillElementProvider activateWithRegistrar:]"];
    [v11 handleFailureInFunction:v12 file:@"SBSystemApertureStatusBarPillElementProvider.m" lineNumber:103 description:@"this call must be made on the main thread"];
  }
  if ([(SBSystemApertureStatusBarPillElementProvider *)self isActivated])
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBSystemApertureStatusBarPillElementProvider.m" lineNumber:104 description:@"Must invalidate before reactivation"];
  }
  [(SBSystemApertureStatusBarPillElementProvider *)self setActivated:1];
  [(SBSystemApertureStatusBarPillElementProvider *)self setElementRegistrar:v6];

  [(UIStatusBarServer *)self->__statusBarServer setStatusBar:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarAssertionManager);
  [WeakRetained addObserver:self];

  if (SBStatusBarIsSpeakeasy())
  {
    uint64_t v8 = [MEMORY[0x1E4FA9348] sharedInstance];
    [v8 addBackgroundActivityClient:self];
  }
  else
  {
    -[SBSystemApertureStatusBarPillElementProvider _updateCurrentBackgroundActivityIdentifiersWithStatusBarOverrides:](self, "_updateCurrentBackgroundActivityIdentifiersWithStatusBarOverrides:", [MEMORY[0x1E4F42E40] getStyleOverrides]);
  }
  id v14 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v9 = [v14 _layoutStateTransitionCoordinator];
  [v9 addObserver:self];
  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel__lockStateChanged name:*MEMORY[0x1E4FA7A38] object:0];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_observers;
    objc_sync_enter(v5);
    [(NSHashTable *)self->_observers addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_observers;
    objc_sync_enter(v5);
    [(NSHashTable *)self->_observers removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (id)acquireSuppressionAssertionForBackgroundActivities:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [_SBSystemApertureBackgroundActivitySuppressionAssertion alloc];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __106__SBSystemApertureStatusBarPillElementProvider_acquireSuppressionAssertionForBackgroundActivities_reason___block_invoke;
  id v19 = &unk_1E6AFA6D0;
  objc_copyWeak(&v21, &location);
  id v9 = v7;
  id v20 = v9;
  uint64_t v10 = [(_SBSystemApertureBackgroundActivitySuppressionAssertion *)v8 initWithIdentifier:@"_SBSystemApertureStatusBarPillSuppressionAssertion" forReason:v9 backgroundActivitiesToSuppress:v6 invalidationBlock:&v16];
  if (!self->_suppressionAssertions)
  {
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    suppressionAssertions = self->_suppressionAssertions;
    self->_suppressionAssertions = v11;
  }
  uint64_t v13 = [(SBSystemApertureStatusBarPillElementProvider *)self suppressionAssertions];
  [v13 addObject:v10];

  id v14 = [NSString stringWithFormat:@"Added assertion for %@", v9, v16, v17, v18, v19];
  [(SBSystemApertureStatusBarPillElementProvider *)self _updateActiveElementIfNeededForReason:v14];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v10;
}

void __106__SBSystemApertureStatusBarPillElementProvider_acquireSuppressionAssertionForBackgroundActivities_reason___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained suppressionAssertions];
    [v5 removeObject:v10];

    id v6 = [v4 suppressionAssertions];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      uint64_t v8 = (void *)v4[8];
      v4[8] = 0;
    }
    id v9 = [NSString stringWithFormat:@"Invalidated assertion for %@", *(void *)(a1 + 32)];
    [v4 _updateActiveElementIfNeededForReason:v9];
  }
}

- (id)acquireActiveElementAssertionForApplication:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [(NSMutableSet *)self->_applicationsWithActiveElements addObject:v6];
    if (!self->_assertionsForApplicationsWithActiveElements)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
      assertionsForApplicationsWithActiveElements = self->_assertionsForApplicationsWithActiveElements;
      self->_assertionsForApplicationsWithActiveElements = v8;
    }
    objc_initWeak(&location, self);
    id v10 = [_SBSystemApertureBackgroundActivitySuppressionActiveApplicationAssertion alloc];
    uint64_t v11 = [v6 bundleIdentifier];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __99__SBSystemApertureStatusBarPillElementProvider_acquireActiveElementAssertionForApplication_reason___block_invoke;
    v15[3] = &unk_1E6AFA6D0;
    objc_copyWeak(&v17, &location);
    id v12 = v7;
    id v16 = v12;
    uint64_t v13 = [(BSSimpleAssertion *)v10 initWithIdentifier:v11 forReason:@"client request" invalidationBlock:v15];

    [(_SBSystemApertureBackgroundActivitySuppressionActiveApplicationAssertion *)v13 setApplication:v6];
    [(NSMutableSet *)self->_assertionsForApplicationsWithActiveElements addObject:v13];
    [(SBSystemApertureStatusBarPillElementProvider *)self _updateNowRecordingAndNowLocatingElementsWithReason:v12];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void __99__SBSystemApertureStatusBarPillElementProvider_acquireActiveElementAssertionForApplication_reason___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[10] removeObject:v11];
    uint64_t v5 = [v4[10] count];
    id v6 = v4[10];
    if (v5)
    {
      id v7 = objc_msgSend(v6, "bs_compactMap:", &__block_literal_global_247);
      uint64_t v8 = [v7 mutableCopy];
      id v9 = v4[9];
      v4[9] = (id)v8;
    }
    else
    {
      v4[10] = 0;

      [v4[9] removeAllObjects];
    }
    id v10 = [NSString stringWithFormat:@"invalidated assertion %@", *(void *)(a1 + 32)];
    [v4 _updateNowRecordingAndNowLocatingElementsWithReason:v10];
  }
}

uint64_t __99__SBSystemApertureStatusBarPillElementProvider_acquireActiveElementAssertionForApplication_reason___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 application];
}

- (void)invalidate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [NSString stringWithUTF8String:"-[SBSystemApertureStatusBarPillElementProvider invalidate]"];
    [v14 handleFailureInFunction:v15 file:@"SBSystemApertureStatusBarPillElementProvider.m" lineNumber:191 description:@"this call must be made on the main thread"];
  }
  if (![(SBSystemApertureStatusBarPillElementProvider *)self isActivated])
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBSystemApertureStatusBarPillElementProvider.m" lineNumber:192 description:@"Invalidating an inactive provider."];
  }
  [(SBSystemApertureStatusBarPillElementProvider *)self setActivated:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarAssertionManager);
  [WeakRetained removeObserver:self];

  uint64_t v5 = [MEMORY[0x1E4FA9348] sharedInstance];
  [v5 removeBackgroundActivityClient:self];

  id v6 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v7 = [v6 _layoutStateTransitionCoordinator];
  [v7 removeObserver:self];
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = (void *)[(NSMutableSet *)self->__registeredElements copy];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        [(SBSystemApertureStatusBarPillElementProvider *)self _invalidateElement:*(void *)(*((void *)&v17 + 1) + 8 * v13++) withReason:@"SBSystemApertureStatusBarPillElementProvider invalidated"];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)dealloc
{
  if ([(SBSystemApertureStatusBarPillElementProvider *)self isActivated])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"SBSystemApertureStatusBarPillElementProvider.m", 206, @"Deallocated %@ without first invalidating it.", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBSystemApertureStatusBarPillElementProvider;
  [(SBSystemApertureStatusBarPillElementProvider *)&v5 dealloc];
}

- (void)_updateNowRecordingAndNowLocatingElementsWithReason:(id)a3
{
  id v4 = a3;
  [(SBSystemApertureStatusBarPillElementProvider *)self _updateNowRecordingElementWithReason:v4];
  [(SBSystemApertureStatusBarPillElementProvider *)self _updateNowLocatingElementWithReason:v4];
}

- (void)_nowLocatingAppsDidChange
{
}

- (void)_updateNowLocatingElementWithReason:(id)a3
{
  id v10 = a3;
  id v4 = [(id)SBApp nowLocatingApps];
  if ([v4 count])
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1CA80];
    id v6 = [(id)SBApp nowLocatingApps];
    id v7 = [v5 setWithArray:v6];
  }
  else
  {
    id v7 = 0;
  }

  [v7 minusSet:self->_applicationsWithActiveElements];
  uint64_t v8 = [(SBSystemApertureStatusBarPillElementProvider *)self _nowLocatingElement];
  if ([v7 count])
  {
    if (v8)
    {
      [(SBSystemApertureStatusBarPillElement *)v8 setAssociatedApplications:v7];
    }
    else
    {
      id v9 = [SBSystemApertureStatusBarPillElement alloc];
      uint64_t v8 = [(SBSystemApertureStatusBarPillElement *)v9 initWithBackgroundActivityIdentifier:*MEMORY[0x1E4FA95C0]];
      [(SBSystemApertureStatusBarPillElement *)v8 setAssociatedApplications:v7];
      [(SBSystemApertureStatusBarPillElementProvider *)self _registerElement:v8];
    }
  }
  else
  {
    [(SBSystemApertureStatusBarPillElementProvider *)self _invalidateElement:v8 withReason:v10];
  }
}

- (void)_registerElement:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    objc_super v5 = [v4 clientStorage];

    id v4 = v11;
    if (!v5)
    {
      registeredElements = self->__registeredElements;
      if (!registeredElements)
      {
        id v7 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v8 = self->__registeredElements;
        self->__registeredElements = v7;

        registeredElements = self->__registeredElements;
      }
      [(NSMutableSet *)registeredElements addObject:v11];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_elementRegistrar);
      id v10 = [WeakRetained registerElement:v11];
      [v11 setClientStorage:v10];

      id v4 = v11;
    }
  }
}

- (SBSystemApertureStatusBarPillElement)_activeElement
{
  registeredElements = self->__registeredElements;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SBSystemApertureStatusBarPillElementProvider__activeElement__block_invoke;
  v5[3] = &unk_1E6B06FC8;
  v5[4] = self;
  v3 = [(NSMutableSet *)registeredElements bs_firstObjectPassingTest:v5];
  return (SBSystemApertureStatusBarPillElement *)v3;
}

uint64_t __62__SBSystemApertureStatusBarPillElementProvider__activeElement__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 representedBackgroundActivityIdentifiers];
  uint64_t v4 = [v2 _managesDedicatedElementForBackgroundActivityIdentifiers:v3] ^ 1;

  return v4;
}

- (SBSystemApertureStatusBarPillElement)_nowLocatingElement
{
  return (SBSystemApertureStatusBarPillElement *)[(NSMutableSet *)self->__registeredElements bs_firstObjectPassingTest:&__block_literal_global_90_0];
}

uint64_t __67__SBSystemApertureStatusBarPillElementProvider__nowLocatingElement__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 representedBackgroundActivityIdentifiers];
  uint64_t v3 = [v2 containsObject:*MEMORY[0x1E4FA95C0]];

  return v3;
}

uint64_t __68__SBSystemApertureStatusBarPillElementProvider__nowRecordingElement__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 representedBackgroundActivityIdentifiers];
  uint64_t v3 = [v2 containsObject:*MEMORY[0x1E4FA9668]];

  return v3;
}

- (void)_updateCurrentBackgroundActivityIdentifiersWithStatusBarOverrides:(unint64_t)a3
{
  if ((SBStatusBarIsSpeakeasy() & 1) == 0)
  {
    STUIBackgroundActivityIdentifiersForStyleOverrides();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(SBSystemApertureStatusBarPillElementProvider *)self setCurrentBackgroundActivityIdentifiers:v4];
  }
}

- (void)setCurrentBackgroundActivityIdentifiers:(id)a3
{
  id v8 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"-[SBSystemApertureStatusBarPillElementProvider setCurrentBackgroundActivityIdentifiers:]"];
    [v6 handleFailureInFunction:v7 file:@"SBSystemApertureStatusBarPillElementProvider.m" lineNumber:309 description:@"this call must be made on the main thread"];
  }
  if ((BSEqualSets() & 1) == 0)
  {
    id v4 = (NSSet *)[v8 copy];
    currentBackgroundActivityIdentifiers = self->_currentBackgroundActivityIdentifiers;
    self->_currentBackgroundActivityIdentifiers = v4;

    [(SBSystemApertureStatusBarPillElementProvider *)self _updateActiveElementIfNeededForReason:@"setCurrentStyleOverrides" notifyingObserversIfNecessary:1];
  }
}

void __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _activeElement];
  uint64_t v3 = [v2 representedBackgroundActivityIdentifiers];
  if ([v3 containsObject:*(void *)(a1 + 40)])
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v4 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_103;
      v15[3] = &unk_1E6B07010;
      void v15[4] = v4;
      [v4 _enumerateObserversRespondingToSelector:sel_statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider_ usingBlock:v15];
    }
  }
  else
  {
    objc_super v5 = STBackgroundActivityIdentifiersDescription();
    id v6 = STBackgroundActivityIdentifierDescription();
    id v7 = SBLogSystemAperturePills();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      long long v19 = v5;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "updating active element for reason: %{public}@. Overrides changing from %{public}@ --> %{public}@", buf, 0x20u);
    }

    id v9 = *(void **)(a1 + 32);
    id v10 = [NSString stringWithFormat:@"updating from %@ to %@", v5, v6];
    [v9 _invalidateElement:v2 withReason:v10];

    id v11 = *(void **)(a1 + 40);
    if (v11 && ([v11 isEqualToString:*MEMORY[0x1E4FA95C0]] & 1) == 0)
    {
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = [[SBSystemApertureStatusBarPillElement alloc] initWithBackgroundActivityIdentifier:*(void *)(a1 + 40)];
      [v12 _registerElement:v13];
    }
  }
  id v14 = [*(id *)(a1 + 32) applyOverridesDebounceTimer];
  [v14 invalidate];

  [*(id *)(a1 + 32) setApplyOverridesDebounceTimer:0];
}

uint64_t __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_103(uint64_t a1, void *a2)
{
  return [a2 statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider:*(void *)(a1 + 32)];
}

void __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isValid])
  {
    id v3 = [*(id *)(a1 + 32) applyOverridesDebounceTimer];

    if (v3 == v4) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider:*(void *)(a1 + 32)];
}

- (BOOL)_managesDedicatedElementForBackgroundActivityIdentifier:(id)a3
{
  id v3 = a3;
  if ([(id)*MEMORY[0x1E4FA95C0] isEqualToString:v3]) {
    char v4 = 1;
  }
  else {
    char v4 = [(id)*MEMORY[0x1E4FA9668] isEqualToString:v3];
  }

  return v4;
}

- (BOOL)_managesDedicatedElementForBackgroundActivityIdentifiers:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:*MEMORY[0x1E4FA95C0]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 containsObject:*MEMORY[0x1E4FA9668]];
  }

  return v4;
}

- (void)_lockStateChanged
{
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (void (**)(id, void))a4;
  if (v5)
  {
    id v6 = self->_observers;
    objc_sync_enter(v6);
    id v7 = (void *)[(NSHashTable *)self->_observers copy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v12);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v6);
  }
}

- (void)statusBarAssertionManager:(id)a3 removeStatusBarSettingsAssertion:(id)a4
{
}

- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@ updated background activities to suppress", a4, a3];
  [(SBSystemApertureStatusBarPillElementProvider *)self _updateActiveElementIfNeededForReason:v5];
}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
}

uint64_t __89__SBSystemApertureStatusBarPillElementProvider_statusBarServer_didReceiveStyleOverrides___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentBackgroundActivityIdentifiersWithStatusBarOverrides:*(void *)(a1 + 40)];
}

- (void)activeBackgroundActivitiesDidUpdate:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

uint64_t __84__SBSystemApertureStatusBarPillElementProvider_activeBackgroundActivitiesDidUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentBackgroundActivityIdentifiers:*(void *)(a1 + 40)];
}

- (UIStatusBarServer)_statusBarServer
{
  return self->__statusBarServer;
}

- (SBSystemApertureController)elementRegistrar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementRegistrar);
  return (SBSystemApertureController *)WeakRetained;
}

- (void)setElementRegistrar:(id)a3
{
}

- (SBWindowSceneStatusBarAssertionManager)statusBarAssertionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarAssertionManager);
  return (SBWindowSceneStatusBarAssertionManager *)WeakRetained;
}

- (void)setStatusBarAssertionManager:(id)a3
{
}

- (NSMutableSet)_registeredElements
{
  return self->__registeredElements;
}

- (void)set_registeredElements:(id)a3
{
}

- (NSSet)currentBackgroundActivityIdentifiers
{
  return self->_currentBackgroundActivityIdentifiers;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (SBDeviceApplicationSceneHandle)observedSceneHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedSceneHandle);
  return (SBDeviceApplicationSceneHandle *)WeakRetained;
}

- (NSMutableSet)applicationsWithActiveElements
{
  return self->_applicationsWithActiveElements;
}

- (NSMutableSet)assertionsForApplicationsWithActiveElements
{
  return self->_assertionsForApplicationsWithActiveElements;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setResolvedBackgroundActivityIdentifier:(id)a3
{
}

- (NSTimer)applyOverridesDebounceTimer
{
  return self->_applyOverridesDebounceTimer;
}

- (void)setApplyOverridesDebounceTimer:(id)a3
{
}

- (SBSystemApertureSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_applyOverridesDebounceTimer, 0);
  objc_storeStrong((id *)&self->_resolvedBackgroundActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_assertionsForApplicationsWithActiveElements, 0);
  objc_storeStrong((id *)&self->_applicationsWithActiveElements, 0);
  objc_storeStrong((id *)&self->_suppressionAssertions, 0);
  objc_destroyWeak((id *)&self->_observedSceneHandle);
  objc_storeStrong((id *)&self->_currentBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->__registeredElements, 0);
  objc_destroyWeak((id *)&self->_statusBarAssertionManager);
  objc_destroyWeak((id *)&self->_elementRegistrar);
  objc_storeStrong((id *)&self->__statusBarServer, 0);
}

@end