@interface UIScene
+ (BKSAnimationFenceHandle)_synchronizedDrawingFence;
+ (BOOL)_hostsWindows;
+ (BOOL)_supportsEventUIWindowRouting;
+ (Class)_implicitSceneFilterClass;
+ (UIScene)_mostActiveScene;
+ (id)_connectionOptionsForScene:(id)a3 withSpecification:(id)a4 transitionContext:(id)a5 actions:(id)a6 sceneSession:(id)a7;
+ (id)_persistenceIdentifierForScene:(id)a3;
+ (id)_sceneForFBSScene:(id)a3;
+ (id)_sceneForFBSScene:(id)a3 create:(BOOL)a4 withSession:(id)a5 connectionOptions:(id)a6;
+ (id)_sceneForFBSScene:(id)a3 usingPredicate:(id)a4;
+ (id)_scenesIncludingInternal:(BOOL)a3;
+ (id)_synchronizeDrawingAndReturnFence;
+ (int64_t)_UIO_sceneType;
+ (int64_t)_activationStateFromSceneSettings:(id)a3;
+ (void)_enumerateAllWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 asCopy:(BOOL)a5 withBlock:(id)a6;
+ (void)_registerSceneComponentClass:(Class)a3 withKey:(id)a4 predicate:(id)a5;
+ (void)_synchronizeDrawing;
+ (void)_synchronizeDrawingUsingFence:(id)a3;
+ (void)_synchronizeDrawingWithFence:(id)a3;
+ (void)_unsafeScenesIncludingInternal;
- (BKSAnimationFenceHandle)_synchronizedDrawingFence;
- (BOOL)_affectsAppLifecycleIfInternal;
- (BOOL)_affectsScreenOrientation;
- (BOOL)_allowsEventUIWindowRouting;
- (BOOL)_canDynamicallySpecifySupportedInterfaceOrientations;
- (BOOL)_discardSessionOnUserDisconnect;
- (BOOL)_hasInvalidated;
- (BOOL)_hasLifecycle;
- (BOOL)_hasSettingsScene;
- (BOOL)_hostsWindows;
- (BOOL)_involvedInMediaPlayback;
- (BOOL)_isActive;
- (BOOL)_isConnected;
- (BOOL)_isConnecting;
- (BOOL)_isEligibleForSuspension;
- (BOOL)_isInternal;
- (BOOL)_isProcessingDiffActionHandlers;
- (BOOL)_isReadyForSuspension;
- (BOOL)_isRespondingToLifecycleEvent;
- (BOOL)_isRunningInTaskSwitcher;
- (BOOL)_isSuspendedEventsOnly;
- (BOOL)_isSuspendedUnderLock;
- (BOOL)_isTargetOfKeyboardEventDeferringEnvironment;
- (BOOL)_isUIKitManaged;
- (BOOL)_pushesTraitCollectionToScreen;
- (BOOL)_sceneSessionRoleIsCarPlayOrNonInteractiveExternal;
- (BOOL)_shouldAllowFencing;
- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnection:(id)a3;
- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnectionAndTrackIfNeeded:(id)a3;
- (BOOL)_shouldRotateSafeAreaInsetsToInterfaceOrientation;
- (BOOL)_tracksWindowsNeedingDeferredInitialUpdates;
- (BOOL)_windowIsFront:(id)a3;
- (CGRect)_boundsForInterfaceOrientation:(int64_t)a3;
- (CGRect)_referenceBounds;
- (FBSScene)_FBSScene;
- (FBSSceneSettings)_oldSettings;
- (FBSSceneSettings)_synthesizedSettings;
- (NSArray)_allWindows;
- (NSArray)_interitingScenes;
- (NSArray)_sceneBSActionResponders;
- (NSArray)_sceneComponents;
- (NSArray)_settingsDiffActions;
- (NSArray)_visibleWindows;
- (NSArray)_windows;
- (NSNumber)_cachedInterfaceOrientation;
- (NSString)_identifier;
- (NSString)_persistenceIdentifier;
- (NSString)_sceneIdentifier;
- (NSString)debugDescription;
- (NSString)subtitle;
- (NSString)title;
- (UIApplicationSceneClientSettings)_effectiveUIClientSettings;
- (UIApplicationSceneSettings)_effectiveUISettings;
- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3;
- (UIPointerLockState)pointerLockState;
- (UIScene)_settingsScene;
- (UIScene)initWithSession:(UISceneSession *)session connectionOptions:(UISceneConnectionOptions *)connectionOptions;
- (UISceneActivationConditions)activationConditions;
- (UISceneActivationState)activationState;
- (UISceneSession)session;
- (UISceneSystemProtectionManager)systemProtectionManager;
- (_UIApplicationSceneDisplayClientComponent)_displayClientComponent;
- (_UIApplicationSceneKeyboardClientComponent)_keyboardClientComponent;
- (_UIChildRemoteContentRegistry)_childRemoteContentRegistry;
- (_UIEventDeferringManager)_eventDeferringManager;
- (_UIFocusSystemSceneComponent)_focusSystemSceneComponent;
- (_UIHDRUsageCoordinatorSceneComponent)_hdrUsageCoordinatorSceneComponent;
- (_UIHomeAffordanceNotifying)_existingHomeAffordanceSceneNotifier;
- (_UIHomeAffordanceNotifying)_homeAffordanceSceneNotifier;
- (_UIInterfaceProtectionSceneComponent)_interfaceProtectionSceneComponent;
- (_UIKeyWindowSceneObserver)_keyWindowSceneObserver;
- (_UIPhysicalButtonInteractionArbiter)_existingPhysicalButtonInteractionArbiter;
- (_UIPhysicalButtonInteractionArbiter)_physicalButtonInteractionArbiter;
- (_UIRenderingEnvironmentSceneComponent)_renderingEnvironmentSceneComponentRegisteringIfNecessary:(void *)a1;
- (_UISceneHostingIntelligenceSupportClient)_intelligenceClientSceneComponent;
- (_UISceneLifecycleMonitor)_lifecycleMonitor;
- (double)_systemMinimumMargin;
- (id)_actionsWithSubstitutionsForTransitionActions:(id)a3 forFBSScene:(id)a4 fromTransitionContext:(id)a5;
- (id)_allWindowsForInvalidation;
- (id)_backlightSceneEnvironment;
- (id)_carPlaySceneComponent;
- (id)_currentOpenApplicationEndpoint;
- (id)_eventDeferringComponent;
- (id)_fbsSceneLayerForWindow:(id)a3;
- (id)_fixupInheritedClientSettings:(id)a3;
- (id)_fixupInheritedSettings:(id)a3;
- (id)_sceneComponentForKey:(id)a3;
- (id)_synchronizeDrawingAndReturnFence;
- (id)_topVisibleWindowEnumeratingAsCopy:(BOOL)a3 passingTest:(id)a4;
- (id)_topVisibleWindowPassingTest:(id)a3;
- (id)_windowHostingScene;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)delegate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)nextResponder;
- (id)renderingEnvironment;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)systemShellHostingEnvironment;
- (void)__captureWindow:(id)a3;
- (void)__releaseWindow:(id)a3;
- (void)_addInheritingScene:(id)a3;
- (void)_applyOverrideSettings:(id)a3 forActions:(id)a4;
- (void)_calculateFlattenedBSActionResponders;
- (void)_calculateFlattenedBSActionSubstitutionProviders;
- (void)_calculateFlattenedDiffActions;
- (void)_compatibilityModeZoomDidChange;
- (void)_completeStateRestoration;
- (void)_computeMetrics:(BOOL)a3;
- (void)_computeMetricsForWindows:(id)a3 animated:(BOOL)a4;
- (void)_emitSceneSettingsUpdateResponseForCompletion:(id)a3 afterSceneUpdateWork:(id)a4;
- (void)_enableOverrideSettingsForActions:(id)a3;
- (void)_enqueuePostSettingsUpdateResponseBlock:(id)a3 inPhase:(id)a4;
- (void)_enumerateWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 asCopy:(BOOL)a5 stopped:(BOOL *)a6 withBlock:(id)a7;
- (void)_extendStateRestoration;
- (void)_finishSceneConnection;
- (void)_getDefaultAudioSessionFromMainThreadWithCompletionHandler:(id)a3;
- (void)_guardedSetOverrideSettings:(id)a3;
- (void)_initializeSceneComponents;
- (void)_invalidate;
- (void)_noteDisplayIdentityDidChangeWithConfiguration:(id)a3;
- (void)_performDeferredInitialWindowUpdateForConnection;
- (void)_performSystemSnapshotWithActions:(id)a3;
- (void)_prepareCommonStateForActionRespondingFromTransitionContext:(id)a3;
- (void)_prepareForResume;
- (void)_prepareForSuspend;
- (void)_refreshActivationConditions;
- (void)_registerBSActionResponderArray:(id)a3 forKey:(id)a4;
- (void)_registerSceneActionsHandlerArray:(id)a3 forKey:(id)a4;
- (void)_registerSceneComponent:(id)a3 forKey:(id)a4;
- (void)_registerSettingsDiffActionArray:(id)a3 forKey:(id)a4;
- (void)_removeInheritingScene:(id)a3;
- (void)_scheduleSceneEventResponseWithResponseBlock:(id)a3;
- (void)_setCachedInterfaceOrientation:(id)a3;
- (void)_setDiscardSessionOnUserDisconnect:(BOOL)a3;
- (void)_setInvolvedInMediaPlayback:(BOOL)a3;
- (void)_setIsRespondingToLifecycleEvent:(BOOL)a3;
- (void)_setSettingsScene:(id)a3;
- (void)_setShouldHoldSceneEventResponses:(BOOL)a3;
- (void)_synchronizeDrawing;
- (void)_synchronizeDrawingUsingFence:(id)a3;
- (void)_synchronizeDrawingWithFence:(id)a3;
- (void)_systemShellOwnsInterfaceOrientation;
- (void)_targetOfKeyboardEventDeferringEnvironmentDidUpdate:(_DWORD *)a1;
- (void)_unregisterBSActionResponderArray:(id)a3;
- (void)_unregisterSceneComponentForKey:(id)a3;
- (void)_unregisterSettingsDiffActionArrayForKey:(id)a3;
- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3;
- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3 callParentWillTransitionToTraitCollection:(BOOL)a4;
- (void)_updateUIClientSettingsWithBlock:(id)a3;
- (void)_updateUIClientSettingsWithTransitionBlock:(id)a3;
- (void)_updateUIClientSettingsWithUITransitionBlock:(id)a3;
- (void)getDefaultAudioSessionWithCompletionHandler:(void *)handler;
- (void)openURL:(NSURL *)url options:(UISceneOpenExternalURLOptions *)options completionHandler:(void *)completion;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4 fromTransitionContext:(id)a5;
- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)setActivationConditions:(UISceneActivationConditions *)activationConditions;
- (void)setDelegate:(id)delegate;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setTitle:(NSString *)title;
@end

@implementation UIScene

- (UISceneActivationState)activationState
{
  if (!_uiScenes || ![(id)_uiScenes containsObject:self]) {
    return -1;
  }
  if (![(UIScene *)self _hasLifecycle]) {
    return 0;
  }
  v3 = [(UIScene *)self _lifecycleMonitor];
  UISceneActivationState v4 = [v3 currentActivationState];

  return v4;
}

- (BOOL)_hasLifecycle
{
  return self->_lifecycleMonitor != 0;
}

- (_UISceneLifecycleMonitor)_lifecycleMonitor
{
  return self->_lifecycleMonitor;
}

- (UIApplicationSceneSettings)_effectiveUISettings
{
  id v2 = __UISceneEffectiveSettings((uint64_t)self);
  if ([v2 isUISubclass]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  return (UIApplicationSceneSettings *)v3;
}

+ (int64_t)_activationStateFromSceneSettings:(id)a3
{
  id v3 = a3;
  UISceneActivationState v4 = v3;
  if (v3)
  {
    if (_UISceneLifecycleStateIsSEO(v3)) {
      int v5 = [v4 underLock];
    }
    else {
      int v5 = 0;
    }
    if (([v4 isForeground] & 1) != 0
      || ((_UISceneLifecycleStateIsSEO(v4) ^ 1 | v5) & 1) == 0)
    {
      int64_t v6 = ([v4 deactivationReasons] & 0xFFFFFFFFFFFFFEFFLL) != 0;
    }
    else
    {
      int64_t v6 = 2;
    }
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (void)_calculateFlattenedDiffActions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSArray *)self->_initialSettingsDiffActions mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  UISceneActivationState v4 = [(NSDictionary *)self->_registeredComponents allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v10 = [v9 _settingsDiffActionsForScene:self];
          [v3 addObjectsFromArray:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  additionalSettingsDiffActions = self->_additionalSettingsDiffActions;
  if (additionalSettingsDiffActions)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v12 = [(NSDictionary *)additionalSettingsDiffActions allValues];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          [v3 addObjectsFromArray:*(void *)(*((void *)&v19 + 1) + 8 * j)];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
  v17 = [v3 arrayByAddingObjectsFromArray:self->_finalSettingsDiffActions];
  flattenedDiffActions = self->_flattenedDiffActions;
  self->_flattenedDiffActions = v17;
}

- (void)setActivationConditions:(UISceneActivationConditions *)activationConditions
{
  uint64_t v5 = activationConditions;
  uint64_t v6 = self->_activationConditions;
  if (v6 != v5)
  {
    v8 = v5;
    BOOL v7 = [(UISceneActivationConditions *)v6 isEqual:v5];
    [(UISceneActivationConditions *)self->_activationConditions _setUIScene:0];
    [(UISceneActivationConditions *)v8 _setUIScene:self];
    objc_storeStrong((id *)&self->_activationConditions, activationConditions);
    uint64_t v5 = v8;
    if (!v7)
    {
      [(UIScene *)self _refreshActivationConditions];
      uint64_t v5 = v8;
    }
  }
}

void __39__UIScene__refreshActivationConditions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  UISceneActivationState v4 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v5 = objc_alloc_init(UISceneActivationConditions);
  LOBYTE(v4) = [v4 isEqual:v5];

  if (v4)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 56);
    id v10 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v10];
    id v8 = v10;
    if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = [v8 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v12 = "-[UIScene _refreshActivationConditions]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Unable to encode activation conditions %@", buf, 0x16u);
    }
  }
  [v3 setActivationConditionsData:v6];
}

- (void)_refreshActivationConditions
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__UIScene__refreshActivationConditions__block_invoke;
  v2[3] = &unk_1E52DAE80;
  v2[4] = self;
  [(UIScene *)self _updateUIClientSettingsWithBlock:v2];
}

- (void)_updateUIClientSettingsWithBlock:(id)a3
{
}

- (UISceneSession)session
{
  return self->_session;
}

- (id)_sceneComponentForKey:(id)a3
{
  return [(NSDictionary *)self->_registeredComponents objectForKey:a3];
}

- (_UIFocusSystemSceneComponent)_focusSystemSceneComponent
{
  return (_UIFocusSystemSceneComponent *)[(UIScene *)self _sceneComponentForKey:_UIFocusSystemSceneComponentKey];
}

- (BOOL)_hasInvalidated
{
  return *((unsigned __int8 *)&self->_sceneFlags + 1) >> 7;
}

- (_UIPhysicalButtonInteractionArbiter)_existingPhysicalButtonInteractionArbiter
{
  return (_UIPhysicalButtonInteractionArbiter *)[(UIScene *)self _sceneComponentForKey:@"_UIPhysicalButtonInteractionArbiterComponentKey"];
}

- (BOOL)_hostsWindows
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 1) >> 4) & 1;
}

void __78__UIScene__emitSceneSettingsUpdateResponseForCompletion_afterSceneUpdateWork___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(a1 + 32) + 216) |= 0x20000u;
  id v2 = *(id *)(a1 + 40);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 216) &= ~0x20000u;
}

- (BOOL)_sceneSessionRoleIsCarPlayOrNonInteractiveExternal
{
  uint64_t v3 = [(UIScene *)self session];
  uint64_t v4 = [v3 role];

  if (([v4 isEqualToString:@"UIWindowSceneSessionRoleCarPlay"] & 1) != 0
    || ([v4 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    if ([(UIScene *)self _hostsWindows]) {
      uint64_t v6 = self;
    }
    else {
      uint64_t v6 = 0;
    }
    long long v7 = [(UIScene *)v6 _traitCollection];
    BOOL v5 = [v7 userInterfaceIdiom] == 3;
  }
  return v5;
}

+ (void)_synchronizeDrawing
{
}

uint64_t __36__UIScene__scenesIncludingInternal___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _isInternal])
  {
    char isKindOfClass = 0;
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    char isKindOfClass = 1;
  }
  else
  {
    [*(id *)(a1 + 32) _implicitSceneFilterClass];
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)_isInternal
{
  return *((unsigned char *)&self->_sceneFlags + 1) & 1;
}

- (BOOL)_affectsAppLifecycleIfInternal
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 1) >> 1) & 1;
}

- (BOOL)_canDynamicallySpecifySupportedInterfaceOrientations
{
  id v2 = [(UIScene *)self _effectiveUISettings];
  BOOL v3 = [v2 interfaceOrientationMode] == 1;

  return v3;
}

- (UIScene)_settingsScene
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsScene);
  uint64_t v4 = WeakRetained;
  if (!WeakRetained) {
    WeakRetained = self;
  }
  BOOL v5 = WeakRetained;

  return v5;
}

- (_UIApplicationSceneDisplayClientComponent)_displayClientComponent
{
  id v2 = [(UIScene *)self _FBSScene];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v2 componentForExtension:v3 ofClass:objc_opt_class()];

  return (_UIApplicationSceneDisplayClientComponent *)v4;
}

- (FBSScene)_FBSScene
{
  return self->_scene;
}

+ (void)_enumerateAllWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 asCopy:(BOOL)a5 withBlock:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v11 = (void *)[a1 _unsafeScenesIncludingInternal];
  if (v10 && v11)
  {
    if (v6) {
      id v12 = (id)[v11 copy];
    }
    else {
      id v12 = v11;
    }
    __int16 v13 = v12;
    [a1 _implicitSceneFilterClass];
    char v24 = 0;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
LABEL_8:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v19, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:", v8, v7, v6, &v24, v10, (void)v20);
          if (v24) {
            break;
          }
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v16) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
  }
}

+ (void)_unsafeScenesIncludingInternal
{
  return (void *)_uiScenes;
}

+ (id)_sceneForFBSScene:(id)a3
{
  uint64_t v4 = [a1 _sceneForFBSScene:a3 create:0 withSession:0 connectionOptions:0];
  [a1 _implicitSceneFilterClass];
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  return v6;
}

uint64_t __36__UIScene__scenesIncludingInternal___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 _implicitSceneFilterClass];
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

+ (Class)_implicitSceneFilterClass
{
  id v3 = self;
  int v4 = [a1 isSubclassOfClass:v3];

  if (v4) {
    a1 = self;
  }
  return (Class)a1;
}

+ (id)_sceneForFBSScene:(id)a3 create:(BOOL)a4 withSession:(id)a5 connectionOptions:(id)a6
{
  BOOL v8 = a4;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    long long v19 = 0;
    goto LABEL_33;
  }
  id v14 = (void *)_uiScenes;
  uint64_t v15 = (void *)MEMORY[0x1E4F28F60];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke;
  v76[3] = &unk_1E52DAC28;
  id v16 = v11;
  id v77 = v16;
  uint64_t v17 = [v15 predicateWithBlock:v76];
  uint64_t v18 = [v14 filteredArrayUsingPredicate:v17];

  long long v19 = [v18 firstObject];
  if (v19) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = !v8;
  }
  if (!v20)
  {
    v63 = v18;
    long long v21 = [v16 specification];
    if ((objc_msgSend((id)objc_msgSend(v21, "uiSceneMinimumClass"), "isSubclassOfClass:", a1) & 1) == 0)
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      v51 = NSStringFromClass((Class)[v21 uiSceneMinimumClass]);
      v52 = NSStringFromClass((Class)a1);
      [v50 handleFailureInMethod:a2, a1, @"UIScene.m", 1406, @"Attempting to initialize instance with a scene specification without a valid minimumClass (is %@, should be %@)", v51, v52 object file lineNumber description];
    }
    long long v22 = [v12 configuration];
    long long v23 = (objc_class *)[v22 sceneClass];
    if (!v23) {
      long long v23 = (objc_class *)[v21 uiSceneMinimumClass];
    }

    if ((-[objc_class isSubclassOfClass:](v23, "isSubclassOfClass:", [v21 uiSceneMinimumClass]) & 1) == 0)
    {
      v62 = [MEMORY[0x1E4F28B00] currentHandler];
      v60 = NSStringFromClass(v23);
      v53 = [v12 role];
      v54 = NSStringFromClass((Class)[v21 uiSceneMinimumClass]);
      [v62 handleFailureInMethod:a2, a1, @"UIScene.m", 1410, @"description specified a class of %@, but systemType %@ requires a minimum class of %@", v60, v53, v54 object file lineNumber description];
    }
    if ([(objc_class *)v23 isSubclassOfClass:a1])
    {
      if (v13)
      {
LABEL_14:
        char v24 = (void *)[[v23 alloc] initWithSession:v12 connectionOptions:v13];
        long long v25 = [v12 configuration];
        if (UIApp) {
          BOOL v26 = [*(id *)(UIApp + 248) count] != 0;
        }
        else {
          BOOL v26 = 0;
        }
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke_2;
        v73[3] = &unk_1E52DAC50;
        id v61 = v25;
        id v74 = v61;
        BOOL v75 = v26;
        [v24 _updateUIClientSettingsWithBlock:v73];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke_3;
        aBlock[3] = &unk_1E52DAC78;
        SEL v71 = a2;
        id v72 = a1;
        id v27 = v21;
        id v69 = v27;
        long long v19 = v24;
        id v70 = v19;
        v28 = _Block_copy(aBlock);
        uint64_t v29 = [v27 coreSceneComponentClassDictionary];
        [v29 enumerateKeysAndObjectsUsingBlock:v28];

        v30 = [v27 baseSceneComponentClassDictionary];
        v59 = v28;
        [v30 enumerateKeysAndObjectsUsingBlock:v28];

        [v19 _initializeSceneComponents];
        v31 = [v27 connectionHandlers];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v64 objects:v78 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v65 != v34) {
                objc_enumerationMutation(v31);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v64 + 1) + 8 * i) + 16))();
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v64 objects:v78 count:16];
          }
          while (v33);
        }
        v36 = +[_UICanvasUserActivityManager _userActivityManagerForScene:v19];
        [v19 _readySceneForConnection];
        v37 = [v16 identifier];
        if ((v19[216] & 2) != 0)
        {
          kdebug_trace();
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v38 = v19;
          }
          else {
            v38 = 0;
          }
          id v39 = v38;
          if (v38)
          {
            v40 = v39;
            v58 = v36;
            v41 = v37;
            uint64_t v42 = _UISetCurrentFallbackEnvironment(v39);
            v43 = [v19 delegate];
            [v43 scene:v19 willConnectToSession:v12 options:v13];

            v44 = (void *)v42;
            v37 = v41;
            v36 = v58;
            _UIRestorePreviousFallbackEnvironment(v44);
          }
          else
          {
            v45 = [v19 delegate];
            [v45 scene:v19 willConnectToSession:v12 options:v13];
          }
        }
        kdebug_trace();
        v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v46 postNotificationName:@"UISceneWillConnectNotification" object:v19];

        [v19 _performDeferredInitialWindowUpdateForConnection];
        v47 = [v19 session];
        [v47 _setScene:v19];

        v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v48 postNotificationName:@"UICanvasDidConnectNotification" object:v19];

        [v13 performPostConnectionCleanup];
        uint64_t v18 = v63;
        goto LABEL_32;
      }
    }
    else
    {
      v55 = [MEMORY[0x1E4F28B00] currentHandler];
      v56 = NSStringFromSelector(a2);
      [v55 handleFailureInMethod:a2, a1, @"UIScene.m", 1411, @"Called %@, on class of %@, but attempted to construct a UIScene instance of class %@", v56, a1, v23 object file lineNumber description];

      if (v13) {
        goto LABEL_14;
      }
    }
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2 object:a1 file:@"UIScene.m" lineNumber:1412 description:@"UISceneConnectionOptions cannot be nil when creating a new UIScene!"];

    goto LABEL_14;
  }
LABEL_32:

LABEL_33:
  return v19;
}

- (void)_initializeSceneComponents
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__UIScene__initializeSceneComponents__block_invoke;
  v2[3] = &unk_1E52DA850;
  v2[4] = self;
  __UISceneAccessClassComponentArray(0, v2);
}

+ (id)_scenesIncludingInternal:(BOOL)a3
{
  BOOL v3 = a3;
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = (void *)_uiScenes;
  if (!_uiScenes)
  {
    long long v9 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_9;
  }
  if (!v3)
  {
    BOOL v7 = (void *)MEMORY[0x1E4F28F60];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36__UIScene__scenesIncludingInternal___block_invoke_2;
    v12[3] = &__block_descriptor_41_e34_B24__0__UIScene_8__NSDictionary_16l;
    BOOL v13 = v5 == a1;
    v12[4] = a1;
    BOOL v8 = v12;
    goto LABEL_7;
  }
  if (v5 != a1)
  {
    BOOL v7 = (void *)MEMORY[0x1E4F28F60];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__UIScene__scenesIncludingInternal___block_invoke;
    v14[3] = &__block_descriptor_40_e37_B24__0___NSObject__8__NSDictionary_16l;
    v14[4] = a1;
    BOOL v8 = v14;
LABEL_7:
    id v10 = [v7 predicateWithBlock:v8];
    long long v9 = [v6 filteredArrayUsingPredicate:v10];

    goto LABEL_9;
  }
  long long v9 = (void *)[(id)_uiScenes copy];
LABEL_9:
  return v9;
}

- (NSString)_sceneIdentifier
{
  sceneIdentifier = self->_sceneIdentifier;
  if (!sceneIdentifier)
  {
    int v4 = [(UIScene *)self _FBSScene];
    id v5 = [v4 identifier];
    id v6 = self->_sceneIdentifier;
    self->_sceneIdentifier = v5;

    sceneIdentifier = self->_sceneIdentifier;
    if (!sceneIdentifier)
    {
      BOOL v7 = [MEMORY[0x1E4F29128] UUID];
      BOOL v8 = [v7 UUIDString];
      long long v9 = self->_sceneIdentifier;
      self->_sceneIdentifier = v8;

      sceneIdentifier = self->_sceneIdentifier;
    }
  }
  return sceneIdentifier;
}

- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3 callParentWillTransitionToTraitCollection:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([(UIScene *)self _hostsWindows]) {
    BOOL v7 = self;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v8 = v7;
  if (v8)
  {
    long long v9 = [(UIScene *)self _FBSScene];
    id v10 = [v9 settings];
    int v11 = [v10 isUISubclass];

    if (v11)
    {
      id v12 = [v9 uiSettings];
      uint64_t v13 = [v12 userInterfaceStyle];

      if (v5 && [(UIScene *)self _pushesTraitCollectionToScreen])
      {
        id v14 = [(UIScene *)v8 _screen];
        [v14 _setUserInterfaceStyleIfNecessary:v13 firstTimeOnly:0];
      }
      uint64_t v15 = *(id *)(__UILogGetCategoryCachedImpl("InterfaceStyle", &_MergedGlobals_31) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          id v16 = @"Push";
        }
        else {
          id v16 = @"Not push";
        }
        if (self)
        {
          uint64_t v17 = NSString;
          uint64_t v18 = self;
          long long v19 = (objc_class *)objc_opt_class();
          BOOL v20 = NSStringFromClass(v19);
          long long v21 = [v17 stringWithFormat:@"<%@: %p>", v20, v18];
        }
        else
        {
          long long v21 = @"(nil)";
        }
        long long v25 = v21;
        BOOL v26 = [(UIScene *)self _persistenceIdentifier];
        *(_DWORD *)buf = 138544130;
        id v40 = v16;
        __int16 v41 = 2050;
        uint64_t v42 = v13;
        __int16 v43 = 2114;
        v44 = v21;
        __int16 v45 = 2114;
        v46 = v26;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ traits update to screen for new style %{public}ld, %{public}@ (%{public}@)", buf, 0x2Au);
      }
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v27 = [(UIScene *)self _allWindows];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v35 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (v4)
          {
            uint64_t v33 = [(UIScene *)v8 _traitCollection];
            [v32 _parentWillTransitionToTraitCollection:v33];
          }
          [v32 _updateWindowTraits];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v29);
    }
  }
  else
  {
    long long v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("TraitCollection", &qword_1EB25EC18) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v23 = v22;
      *(_DWORD *)buf = 138543362;
      id v40 = (id)objc_opt_class();
      id v24 = v40;
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Can't update scene traits, %{public}@ does not conform to _UISceneUIWindowHosting", buf, 0xCu);
    }
  }
}

- (NSString)_persistenceIdentifier
{
  persistenceIdentifier = self->_persistenceIdentifier;
  if (!persistenceIdentifier)
  {
    BOOL v4 = [(UIScene *)self session];
    BOOL v5 = [v4 persistentIdentifier];
    id v6 = self->_persistenceIdentifier;
    self->_persistenceIdentifier = v5;

    persistenceIdentifier = self->_persistenceIdentifier;
    if (!persistenceIdentifier)
    {
      BOOL v7 = [(UIScene *)self _FBSScene];
      BOOL v8 = [v7 uiSettings];
      long long v9 = [v8 persistenceIdentifier];
      id v10 = self->_persistenceIdentifier;
      self->_persistenceIdentifier = v9;

      persistenceIdentifier = self->_persistenceIdentifier;
    }
  }
  return persistenceIdentifier;
}

- (BOOL)_pushesTraitCollectionToScreen
{
  return (*((unsigned char *)&self->_sceneFlags + 1) & 1) == 0;
}

- (void)_calculateFlattenedBSActionResponders
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[(NSArray *)self->_initialSceneBSActionHandlers mutableCopy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v4 = [(NSDictionary *)self->_registeredComponents allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = [v9 _actionHandlersForScene:self];
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
          uint64_t v10 = [v9 _actionRespondersForScene:self];
        }
        int v11 = (void *)v10;
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  additionalBSActionResponders = self->_additionalBSActionResponders;
  if (additionalBSActionResponders)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v13 = [(NSDictionary *)additionalBSActionResponders allValues];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          [v3 addObjectsFromArray:*(void *)(*((void *)&v20 + 1) + 8 * j)];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }
  }
  uint64_t v18 = [v3 arrayByAddingObjectsFromArray:self->_finalSceneBSActionHandlers];
  flattenedBSActionResponders = self->_flattenedBSActionResponders;
  self->_flattenedBSActionResponders = v18;

  [(UIScene *)self _calculateFlattenedBSActionSubstitutionProviders];
}

uint64_t __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 _FBSScene];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (_UIEventDeferringManager)_eventDeferringManager
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!_UIEventDeferringManagerIsAvailableForScene(self))
  {
    uint64_t v10 = 0;
    goto LABEL_42;
  }
  BOOL v3 = self;
  uint64_t v4 = v3;
  if (!+[_UIRemoteKeyboards enabled]) {
    goto LABEL_8;
  }
  BOOL v5 = [(UIScene *)v3 _hasSettingsScene];
  int v6 = [(id)UIApp isFrontBoard];
  uint64_t v7 = [(UIScene *)v3 _screen];
  uint64_t v8 = [v7 _userInterfaceIdiom];

  int v9 = v8 == 3 ? 0 : v6;
  if (!v5)
  {
    uint64_t v4 = v3;
    if (!v9)
    {
LABEL_8:
      if (v4) {
        goto LABEL_9;
      }
LABEL_38:
      uint64_t v32 = (objc_class *)objc_opt_class();
      Name = class_getName(v32);
      long long v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &_eventDeferringManager___s_category) + 8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        int v36 = 136315650;
        long long v37 = "-[UIScene(EventDeferring) _eventDeferringManager]";
        __int16 v38 = 2082;
        id v39 = Name;
        __int16 v40 = 2050;
        __int16 v41 = v3;
        _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "%s: No viable event deferring manager found for scene, returning nil: <%{public}s: %{public}p>", (uint8_t *)&v36, 0x20u);
      }
      uint64_t v10 = 0;
      goto LABEL_41;
    }
  }
  if ([(UIScene *)v3 _allowsEventUIWindowRouting]) {
    int v11 = v3;
  }
  else {
    int v11 = 0;
  }
  id v12 = v11;
  uint64_t v13 = [(UIScene *)v12 _sceneForKeyboardDisplay];
  uint64_t v14 = (void *)v13;
  uint64_t v4 = v3;
  if (v12)
  {
    uint64_t v4 = v3;
    if (v12 == (UIScene *)v13)
    {
      uint64_t v15 = +[UIWindowScene _keyWindowScene]();
      uint64_t v16 = (void *)v15;
      if (v5)
      {
        uint64_t v17 = [(UIScene *)v3 _settingsScene];
        uint64_t v18 = v17;
        if (v17 == v12)
        {
          long long v19 = 0;
        }
        else if (_UIEventDeferringManagerIsAvailableForScene(v17))
        {
          long long v19 = v18;
        }
        else
        {
          long long v19 = 0;
        }
        uint64_t v4 = v19;
      }
      else
      {
        if (v15) {
          int v20 = v6;
        }
        else {
          int v20 = 0;
        }
        uint64_t v4 = v3;
        if (v20 != 1) {
          goto LABEL_36;
        }
        long long v21 = [(UIScene *)v12 _screen];
        long long v22 = [v16 screen];

        if (v21 == v22) {
          goto LABEL_47;
        }
        long long v23 = [(UIScene *)v12 _screen];
        long long v24 = [v23 displayConfiguration];
        long long v25 = [v24 identity];
        long long v26 = [v25 rootIdentity];

        long long v27 = [v16 screen];
        uint64_t v28 = [v27 displayConfiguration];
        uint64_t v29 = [v28 identity];
        uint64_t v30 = [v29 rootIdentity];

        LODWORD(v27) = [v26 isEqual:v30];
        if (v27)
        {
LABEL_47:
          if (_UIEventDeferringManagerIsAvailableForScene(v16)) {
            v31 = v16;
          }
          else {
            v31 = 0;
          }
        }
        else
        {
          v31 = 0;
        }
        uint64_t v4 = v31;
        uint64_t v18 = v3;
      }

LABEL_36:
    }
  }

  if (!v4) {
    goto LABEL_38;
  }
LABEL_9:
  uint64_t v10 = [(UIScene *)v4 _sceneComponentForKey:_UIEventDeferringSceneComponentKey];
  if (!v10)
  {
    uint64_t v10 = [[_UIEventDeferringManager alloc] initWithScene:v4];
    [(UIScene *)v4 _registerSceneComponent:v10 forKey:_UIEventDeferringSceneComponentKey];
  }
LABEL_41:

LABEL_42:
  return v10;
}

- (BOOL)_hasSettingsScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsScene);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

+ (void)_synchronizeDrawingWithFence:(id)a3
{
}

- (void)_setIsRespondingToLifecycleEvent:(BOOL)a3
{
  self->_respondingToLifecycleEvent = a3;
}

- (BOOL)_isRespondingToLifecycleEvent
{
  return self->_respondingToLifecycleEvent;
}

- (id)_backlightSceneEnvironment
{
  id v2 = [(UIScene *)self _FBSScene];
  BOOL v3 = [v2 backlightSceneEnvironment];

  return v3;
}

void __37__UIScene__initializeSceneComponents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v9 = [v8 objectForKeyedSubscript:@"_UISceneComponentClassPredicate"];
        uint64_t v10 = [*(id *)(a1 + 32) session];
        int v11 = [v9 evaluateWithObject:v10];

        if (v11)
        {
          id v12 = (objc_class *)(id)[v8 objectForKeyedSubscript:@"_UISceneComponentClass"];
          uint64_t v13 = [v8 objectForKeyedSubscript:@"_UISceneComponentKeyname"];
          uint64_t v14 = *(void **)(a1 + 32);
          uint64_t v15 = (void *)[[v12 alloc] initWithScene:v14];
          [v14 _registerSceneComponent:v15 forKey:v13];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

void __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke_3(uint64_t a1, void *a2, objc_class *a3)
{
  id v5 = a2;
  if (([(objc_class *)a3 conformsToProtocol:&unk_1ED464328] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    int v9 = NSStringFromClass(a3);
    uint64_t v10 = (objc_class *)objc_opt_class();
    int v11 = NSStringFromClass(v10);
    [v6 handleFailureInMethod:v7, v8, @"UIScene.m", 1438, @"class: \"%@\" included in component class dictionary of %@ but does not conform to _UISceneComponentProviding!", v9, v11 object file lineNumber description];
  }
  id v12 = (id)[[a3 alloc] initWithScene:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) _registerSceneComponent:v12 forKey:v5];
}

- (void)_registerSceneComponent:(id)a3 forKey:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (UIScene *)a3;
  id v8 = a4;
  if (self != v7) {
    goto LABEL_2;
  }
  _UIIsPrivateMainBundle();
  if (!dyld_program_sdk_at_least())
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v21 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        goto LABEL_18;
      }
      if (self)
      {
        long long v27 = NSString;
        uint64_t v28 = self;
        uint64_t v29 = (objc_class *)objc_opt_class();
        uint64_t v30 = NSStringFromClass(v29);
        long long v26 = [v27 stringWithFormat:@"<%@: %p>", v30, v28];
      }
      else
      {
        long long v26 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v26;
      __int16 v33 = 2080;
      long long v34 = "-[UIScene _registerSceneComponent:forKey:]";
      _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.  This will become an assert in a future version.", buf, 0x16u);
    }
    else
    {
      uint64_t v21 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &_registerSceneComponent_forKey____s_category)+ 8);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        goto LABEL_2;
      }
      if (self)
      {
        long long v22 = NSString;
        long long v23 = self;
        long long v24 = (objc_class *)objc_opt_class();
        long long v25 = NSStringFromClass(v24);
        long long v26 = [v22 stringWithFormat:@"<%@: %p>", v25, v23];
      }
      else
      {
        long long v26 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v26;
      __int16 v33 = 2080;
      long long v34 = "-[UIScene _registerSceneComponent:forKey:]";
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.  This will become an assert in a future version.", buf, 0x16u);
    }

    goto LABEL_18;
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  if (self)
  {
    long long v16 = NSString;
    long long v17 = self;
    long long v18 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v18);
    int v20 = [v16 stringWithFormat:@"<%@: %p>", v19, v17];
  }
  else
  {
    int v20 = @"(nil)";
  }
  [v15 handleFailureInMethod:a2, self, @"UIScene.m", 760, @"BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.", v20, "-[UIScene _registerSceneComponent:forKey:]" object file lineNumber description];

LABEL_2:
  int v9 = (void *)[(NSDictionary *)self->_registeredComponents mutableCopy];
  uint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  [v12 setObject:v7 forKey:v8];
  uint64_t v13 = (NSDictionary *)[v12 copy];
  registeredComponents = self->_registeredComponents;
  self->_registeredComponents = v13;

  [(UIScene *)self _calculateFlattenedDiffActions];
  [(UIScene *)self _calculateFlattenedBSActionResponders];
  [(UIScene *)v7 _setScene:self];
}

- (NSArray)_sceneComponents
{
  return [(NSDictionary *)self->_registeredComponents allValues];
}

- (id)delegate
{
  return self->_delegate;
}

void __59__UIScene__calculateFlattenedBSActionSubstitutionProviders__block_invoke(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v6 = [v4 objectForKey:v5];

  if (v6)
  {
    uint64_t v7 = [v6 arrayByAddingObject:*(void *)(a1 + 40)];
  }
  else
  {
    v10[0] = *(void *)(a1 + 40);
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  id v8 = *(void **)(a1 + 32);
  int v9 = [NSNumber numberWithUnsignedInteger:a2];
  [v8 setObject:v7 forKey:v9];
}

- (_UISceneHostingIntelligenceSupportClient)_intelligenceClientSceneComponent
{
  id v2 = [(UIScene *)self _FBSScene];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v2 componentForExtension:v3 ofClass:objc_opt_class()];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
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
  id v8 = v7;

  return (_UISceneHostingIntelligenceSupportClient *)v8;
}

- (id)_windowHostingScene
{
  if ([(UIScene *)self _hostsWindows]) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)setDelegate:(id)delegate
{
  uint64_t v5 = (UISceneDelegate *)delegate;
  if (self->_delegate != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_delegate, delegate);
    _UISceneInspectDelegateSuport((unsigned int *)&self->_sceneFlags, self->_delegate);
    uint64_t v5 = v6;
  }
}

- (FBSSceneSettings)_oldSettings
{
  return self->_oldSettings;
}

- (NSArray)_interitingScenes
{
  return [(NSPointerArray *)self->_inheritingScenes allObjects];
}

- (BOOL)_isActive
{
  id v2 = [(UIScene *)self _effectiveSettings];
  char IsForegroundActive = _UISceneLifecycleStateIsForegroundActive(v2);

  return IsForegroundActive;
}

- (BOOL)_isSuspendedEventsOnly
{
  id v2 = [(UIScene *)self _effectiveSettings];
  char IsSEO = _UISceneLifecycleStateIsSEO(v2);

  return IsSEO;
}

- (_UIHomeAffordanceNotifying)_homeAffordanceSceneNotifier
{
  if (!_UIDeviceSupportsGlobalEdgeSwipeTouches()) {
    goto LABEL_6;
  }
  int v3 = _UIApplicationSupportsHomeAffordanceObservation();
  uint64_t v4 = 0;
  if (self && v3)
  {
    if (![(UIScene *)self _hostsWindows] || [(UIScene *)self _hasInvalidated])
    {
LABEL_6:
      uint64_t v4 = 0;
      goto LABEL_7;
    }
    uint64_t v4 = [(UIScene *)self _existingHomeAffordanceSceneNotifier];
    if (!v4)
    {
      uint64_t v4 = [[_UIHomeAffordanceSceneNotifier alloc] initWithScene:self];
      [(UIScene *)self _registerSceneComponent:v4 forKey:@"_UIHomeAffordanceSceneNotifierComponentKey"];
    }
  }
LABEL_7:
  return (_UIHomeAffordanceNotifying *)v4;
}

- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (([(id)UIApp _hasCalledRunWithMainScene] & 1) == 0
    && scene_didUpdateWithDiff_transitionContext_completion__once != -1)
  {
    dispatch_once(&scene_didUpdateWithDiff_transitionContext_completion__once, &__block_literal_global_227);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__UIScene_scene_didUpdateWithDiff_transitionContext_completion___block_invoke_229;
  v20[3] = &unk_1E52DAD48;
  v20[4] = self;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  id v17 = v13;
  id v23 = v17;
  SEL v24 = a2;
  [(UIScene *)self _emitSceneSettingsUpdateResponseForCompletion:v14 afterSceneUpdateWork:v20];
  if (v14)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__UIScene_scene_didUpdateWithDiff_transitionContext_completion___block_invoke_2;
    v18[3] = &unk_1E52DA040;
    id v19 = v14;
    [(UIScene *)self _scheduleSceneEventResponseWithResponseBlock:v18];
  }
}

- (void)_scheduleSceneEventResponseWithResponseBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _holdSceneEventResponsesQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__UIScene__scheduleSceneEventResponseWithResponseBlock___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (_UIHomeAffordanceNotifying)_existingHomeAffordanceSceneNotifier
{
  if (!_UIDeviceSupportsGlobalEdgeSwipeTouches()) {
    goto LABEL_6;
  }
  int v3 = _UIApplicationSupportsHomeAffordanceObservation();
  id v4 = 0;
  if (self && v3)
  {
    if (![(UIScene *)self _hostsWindows] || [(UIScene *)self _hasInvalidated])
    {
LABEL_6:
      id v4 = 0;
      goto LABEL_7;
    }
    id v4 = [(UIScene *)self _sceneComponentForKey:@"_UIHomeAffordanceSceneNotifierComponentKey"];
  }
LABEL_7:
  return (_UIHomeAffordanceNotifying *)v4;
}

void __56__UIScene__scheduleSceneEventResponseWithResponseBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = (void *)v2[28];
  if (v3)
  {
    id v5 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v3, "addObject:");
  }
  else
  {
    id v4 = (void *)UIApp;
    id v5 = [v2 _FBSScene];
    objc_msgSend(v4, "_scheduleSceneEventResponseForScene:withResponseBlock:");
  }
}

- (void)_emitSceneSettingsUpdateResponseForCompletion:(id)a3 afterSceneUpdateWork:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  objc_initWeak(&location, self);
  postSettingsUpdateResponseBlocks = self->_postSettingsUpdateResponseBlocks;
  if (!postSettingsUpdateResponseBlocks)
  {
    int v9 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v10 = self->_postSettingsUpdateResponseBlocks;
    self->_postSettingsUpdateResponseBlocks = v9;
  }
  if (v7)
  {
    id v11 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v13 = (void *)_UISetCurrentFallbackEnvironment(self);
      v7[2](v7);
      _UIRestorePreviousFallbackEnvironment(v13);
    }
    else
    {
      v7[2](v7);
    }
  }
  id v14 = (id)MEMORY[0x1E4F1CBF0];
  if (!postSettingsUpdateResponseBlocks)
  {
    id v15 = self->_postSettingsUpdateResponseBlocks;
    id v16 = self->_postSettingsUpdateResponseBlocks;
    self->_postSettingsUpdateResponseBlocks = 0;

    *(_DWORD *)&self->_sceneFlags |= 0x20000u;
    id v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:@"_UIScenePostSettingsUpdateResponsePhaseDefault"];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(v17);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * i) + 16))();
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v18);
    }

    id v21 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:@"_UIScenePostSettingsUpdateResponsePhaseSnapshot"];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v42 != v23) {
            objc_enumerationMutation(v21);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * j) + 16))();
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v22);
    }

    id v25 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:@"_UIScenePostSettingsUpdateResponsePhaseContextMutation"];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v42 != v27) {
            objc_enumerationMutation(v25);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * k) + 16))();
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v26);
    }

    id v29 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:@"_UIScenePostSettingsUpdateResponsePhaseScreenDisconnect"];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v42;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(v29);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * m) + 16))();
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v30);
    }

    *(_DWORD *)&self->_sceneFlags &= ~0x20000u;
    uint64_t v33 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:@"_UIScenePostSettingsUpdateResponsePhaseAfterCommit"];
    long long v34 = (void *)v33;
    if (v33) {
      uint64_t v35 = (void *)v33;
    }
    else {
      uint64_t v35 = v14;
    }
    id v14 = v35;
  }
  int v36 = (void *)UIApp;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __78__UIScene__emitSceneSettingsUpdateResponseForCompletion_afterSceneUpdateWork___block_invoke;
  v38[3] = &unk_1E52D9F98;
  v38[4] = self;
  id v37 = v14;
  id v39 = v37;
  [v36 _performBlockAfterCATransactionCommits:v38];

  objc_destroyWeak(&location);
}

void __64__UIScene_scene_didUpdateWithDiff_transitionContext_completion___block_invoke_229(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  *(_DWORD *)(*(void *)(a1 + 32) + 216) |= 0x40000u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 208);
  int v3 = [*(id *)(a1 + 40) settings];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 displayIdentity];
  id v6 = [*(id *)(a1 + 40) settings];
  uint64_t v7 = [v6 displayConfiguration];

  if (v4)
  {
    id v8 = [v7 identity];
    char v9 = [v5 isEqual:v8];

    if ((v9 & 1) == 0) {
      [*(id *)(a1 + 32) _noteDisplayIdentityDidChangeWithConfiguration:v7];
    }
  }
  uint64_t v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 56) actions];
  uint64_t v12 = [v10 _actionsWithSubstitutionsForTransitionActions:v11 forFBSScene:*(void *)(a1 + 40) fromTransitionContext:*(void *)(a1 + 56)];

  uint64_t v28 = (void *)v12;
  [*(id *)(a1 + 32) scene:*(void *)(a1 + 40) didReceiveActions:v12 fromTransitionContext:*(void *)(a1 + 56)];
  id v29 = v7;
  if (v2)
  {
    id v13 = *(void **)(a1 + 32);
    id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "interfaceOrientation"));
    [v13 _setCachedInterfaceOrientation:v14];
  }
  if ([v3 isUISubclass])
  {
    uint64_t v15 = [(id)objc_opt_class() _activationStateFromSceneSettings:v2];
    uint64_t v16 = [(id)objc_opt_class() _activationStateFromSceneSettings:v3];
    uint64_t v17 = _UISceneLifecycleCompositeActionMaskHighestLifecycleActionType(_UISceneLifecycleCompositeActionMaskFromStateToState__staticStateMap[4 * v15 + 5 + v16]);
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v30 = v5;
  uint64_t v18 = *(void **)(a1 + 56);
  if (v18 && ([v18 isUISubclass] & 1) == 0)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"UIScene.m", 2103, @"transitionContext is of an unexpected class : %@", *(void *)(a1 + 56) object file lineNumber description];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v19 = [*(id *)(a1 + 32) _settingsDiffActions];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v32;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * v23++) _performActionsForUIScene:*(void *)(a1 + 32) withUpdatedFBSScene:*(void *)(a1 + 40) settingsDiff:*(void *)(a1 + 48) fromSettings:v2 transitionContext:*(void *)(a1 + 56) lifecycleActionType:v17];
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v21);
  }

  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = *(void **)(v24 + 208);
  *(void *)(v24 + 208) = v3;
  id v26 = v3;

  [*(id *)(a1 + 32) _setCachedInterfaceOrientation:0];
  *(_DWORD *)(*(void *)(a1 + 32) + 216) &= ~0x40000u;

  kdebug_trace();
}

- (void)_setCachedInterfaceOrientation:(id)a3
{
}

- (void)scene:(id)a3 didReceiveActions:(id)a4 fromTransitionContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    [(UIScene *)self _prepareCommonStateForActionRespondingFromTransitionContext:v10];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = [(UIScene *)self _sceneBSActionResponders];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
LABEL_4:
      uint64_t v15 = 0;
      uint64_t v16 = v9;
      while (1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v9 = [*(id *)(*((void *)&v17 + 1) + 8 * v15) _respondToActions:v16 forFBSScene:v8 inUIScene:self fromTransitionContext:v10];

        if (![v9 count]) {
          break;
        }
        ++v15;
        uint64_t v16 = v9;
        if (v13 == v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v13) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (NSArray)_settingsDiffActions
{
  return self->_flattenedDiffActions;
}

- (id)_actionsWithSubstitutionsForTransitionActions:(id)a3 forFBSScene:(id)a4 fromTransitionContext:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v8;
  uint64_t v29 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  id v11 = 0;
  if (v29)
  {
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        flattenedBSActionSubstitutionProvidersByActionType = self->_flattenedBSActionSubstitutionProvidersByActionType;
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "UIActionType"));
        uint64_t v16 = [(NSDictionary *)flattenedBSActionSubstitutionProvidersByActionType objectForKey:v15];

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v30 = v11;
          uint64_t v20 = *(void *)v32;
          while (2)
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v32 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = [*(id *)(*((void *)&v31 + 1) + 8 * j) _substituteActionsForAction:v13 forFBSScene:v9 inUIScene:self fromTransitionContext:v10];
              if (v22)
              {
                uint64_t v23 = (void *)v22;
                id v11 = v30;
                if (!v30) {
                  id v11 = (void *)[obj mutableCopy];
                }
                [v11 removeObject:v13];
                [v11 unionSet:v23];

                goto LABEL_18;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v19) {
              continue;
            }
            break;
          }
          id v11 = v30;
        }
LABEL_18:
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v29);
  }
  if (v11) {
    uint64_t v24 = v11;
  }
  else {
    uint64_t v24 = obj;
  }
  id v25 = v24;

  return v25;
}

- (UISceneSystemProtectionManager)systemProtectionManager
{
  id v2 = [(UIScene *)self _interfaceProtectionSceneComponent];
  int v3 = -[UIBarButtonItemGroup _customizationIdentifier](v2);

  return (UISceneSystemProtectionManager *)v3;
}

- (_UIInterfaceProtectionSceneComponent)_interfaceProtectionSceneComponent
{
  return (_UIInterfaceProtectionSceneComponent *)[(UIScene *)self _sceneComponentForKey:_UIInterfaceProtectionSceneComponentKey];
}

- (_UIHDRUsageCoordinatorSceneComponent)_hdrUsageCoordinatorSceneComponent
{
  int v3 = [(UIScene *)self _sceneComponentForKey:_UIHDRUsageCoordinatorSceneComponentKey];
  if (!v3)
  {
    int v3 = [[_UIHDRUsageCoordinatorSceneComponent alloc] initWithScene:self];
    [(UIScene *)self _registerSceneComponent:v3 forKey:_UIHDRUsageCoordinatorSceneComponentKey];
  }
  return v3;
}

- (void)_prepareForResume
{
  *(_DWORD *)&self->_sceneFlags &= ~0x80000u;
}

- (UIApplicationSceneClientSettings)_effectiveUIClientSettings
{
  id v2 = __UISceneEffectiveClientSettings((id *)&self->super.super.isa);
  if ([v2 isUISubclass]) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  return (UIApplicationSceneClientSettings *)v3;
}

- (void)_systemShellOwnsInterfaceOrientation
{
  if (result)
  {
    v1 = [result _effectiveUISettings];
    uint64_t v2 = [v1 interfaceOrientationMode];

    return (void *)((unint64_t)(v2 - 1) < 2);
  }
  return result;
}

- (void)_calculateFlattenedBSActionSubstitutionProviders
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = self->_flattenedBSActionResponders;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v10 = [v9 _UIActionTypesForSubstitution];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __59__UIScene__calculateFlattenedBSActionSubstitutionProviders__block_invoke;
          v13[3] = &unk_1E52DADC0;
          id v14 = v3;
          uint64_t v15 = v9;
          [v10 enumerateIndexesUsingBlock:v13];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  id v11 = (NSDictionary *)[v3 copy];
  flattenedBSActionSubstitutionProvidersByActionType = self->_flattenedBSActionSubstitutionProvidersByActionType;
  self->_flattenedBSActionSubstitutionProvidersByActionType = v11;
}

- (id)nextResponder
{
  return (id)UIApp;
}

- (void)_synchronizeDrawingWithFence:(id)a3
{
  id v4 = a3;
  if ([(UIScene *)self _shouldAllowFencing]) {
    +[UIScene _synchronizeDrawingWithFence:v4];
  }
}

- (BOOL)_shouldAllowFencing
{
  if (![(UIScene *)self _hostsWindows]
    || [(UIScene *)self _isReadyForSuspension])
  {
    return 0;
  }
  id v4 = [(UIScene *)self _effectiveUISettings];
  char v5 = [v4 isForeground];

  return v5;
}

- (BOOL)_affectsScreenOrientation
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 1) >> 2) & 1;
}

- (void)_updateUIClientSettingsWithUITransitionBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIScene.m", 819, @"Invalid parameter not satisfying: %@", @"updaterBlock" object file lineNumber description];
  }
  scene = self->_scene;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__UIScene__updateUIClientSettingsWithUITransitionBlock___block_invoke;
  v9[3] = &unk_1E52DAB80;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v7 = v5;
  [(FBSScene *)scene updateUIClientSettingsWithTransitionBlock:v9];
}

void __64__UIScene_scene_didUpdateWithDiff_transitionContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x1E4F62B30]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_enqueuePostSettingsUpdateResponseBlock:(id)a3 inPhase:(id)a4
{
  uint64_t v6 = (void (**)(void))a3;
  id v7 = a4;
  if ((*((unsigned char *)&self->_sceneFlags + 2) & 2) != 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v21 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v25 = 0;
        _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "Attempted to enqueue post settings update response block while processing current response blocks", v25, 2u);
      }
    }
    else
    {
      long long v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25EC20) + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Attempted to enqueue post settings update response block while processing current response blocks", buf, 2u);
      }
    }
  }
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  int v9 = pthread_main_np();
  if (has_internal_diagnostics)
  {
    if (v9 != 1)
    {
      long long v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Attempting to enqueue a post settings update response block from a background thread.", v23, 2u);
      }
    }
  }
  else if (v9 != 1)
  {
    long long v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25EC28) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Attempting to enqueue a post settings update response block from a background thread.", v22, 2u);
    }
  }
  postSettingsUpdateResponseBlocks = self->_postSettingsUpdateResponseBlocks;
  if (postSettingsUpdateResponseBlocks)
  {
    uint64_t v11 = [(NSMutableDictionary *)postSettingsUpdateResponseBlocks objectForKeyedSubscript:v7];
    uint64_t v12 = (void *)v11;
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
    if (v11) {
      uint64_t v13 = (void *)v11;
    }
    id v14 = v13;

    uint64_t v15 = _Block_copy(v6);
    long long v16 = [v14 arrayByAddingObject:v15];

    [(NSMutableDictionary *)self->_postSettingsUpdateResponseBlocks setObject:v16 forKeyedSubscript:v7];
  }
  else
  {
    v6[2](v6);
  }
}

- (_UIApplicationSceneKeyboardClientComponent)_keyboardClientComponent
{
  id v2 = [(UIScene *)self _FBSScene];
  uint64_t v3 = objc_opt_class();
  id v4 = [v2 componentForExtension:v3 ofClass:objc_opt_class()];

  return (_UIApplicationSceneKeyboardClientComponent *)v4;
}

- (BOOL)_isConnecting
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 1) >> 3) & 1;
}

- (BOOL)_isSuspendedUnderLock
{
  id v2 = [(UIScene *)self _effectiveSettings];
  char v3 = [v2 underLock];

  return v3;
}

- (BOOL)_isTargetOfKeyboardEventDeferringEnvironment
{
  int IsPossibleForScene = _UISceneSystemShellManagesKeyboardFocusIsPossibleForScene(self);
  if (IsPossibleForScene)
  {
    int IsPossibleForScene = [(UIScene *)self _allowsEventUIWindowRouting];
    if (IsPossibleForScene) {
      return (*((unsigned __int8 *)&self->_sceneFlags + 2) >> 6) & 1;
    }
  }
  return IsPossibleForScene;
}

- (BKSAnimationFenceHandle)_synchronizedDrawingFence
{
  if ([(UIScene *)self _shouldAllowFencing])
  {
    id v2 = +[UIScene _synchronizedDrawingFence];
  }
  else
  {
    id v2 = 0;
  }
  return (BKSAnimationFenceHandle *)v2;
}

+ (id)_synchronizeDrawingAndReturnFence
{
  id v2 = [a1 _synchronizedDrawingFence];
  char v3 = [v2 CAFenceHandle];
  id v4 = (void *)[v3 copy];

  [v2 invalidate];
  return v4;
}

+ (BKSAnimationFenceHandle)_synchronizedDrawingFence
{
  if ([(id)UIApp _isActivating])
  {
    id v2 = 0;
  }
  else
  {
    id v2 = [(id)UIApp _systemAnimationFenceCreatingIfNecessary:1];
    if (v2) {
      +[UIWindow _synchronizeDrawingWithFence:v2 preCommitHandler:0];
    }
  }
  return (BKSAnimationFenceHandle *)v2;
}

- (_UIChildRemoteContentRegistry)_childRemoteContentRegistry
{
  if (!self->_childRemoteContentRegistry)
  {
    char v3 = [(UIScene *)self _FBSScene];

    if (v3)
    {
      id v4 = [_UIChildRemoteContentRegistry alloc];
      id v5 = [(UIScene *)self _FBSScene];
      uint64_t v6 = [(_UIChildRemoteContentRegistry *)v4 initWithParentScene:v5];
      childRemoteContentRegistry = self->_childRemoteContentRegistry;
      self->_childRemoteContentRegistry = v6;
    }
  }
  id v8 = self->_childRemoteContentRegistry;
  return v8;
}

void __58__UIScene__registerSceneComponentClass_withKey_predicate___block_invoke(void *a1, void *a2)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v9[0] = a1[6];
  v8[0] = @"_UISceneComponentClass";
  v8[1] = @"_UISceneComponentClassPredicate";
  id v4 = (void *)a1[4];
  id v5 = v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }
  v8[2] = @"_UISceneComponentKeyname";
  uint64_t v6 = a1[5];
  v9[1] = v5;
  v9[2] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  [v3 addObject:v7];

  if (!v4) {
}
  }

- (id)succinctDescription
{
  id v2 = [(UIScene *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [(UIScene *)self session];
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [v3 role];
  [v4 appendString:v5 withName:@"role"];

  uint64_t v6 = [v3 persistentIdentifier];
  [v4 appendString:v6 withName:@"persistentIdentifier"];

  UISceneActivationState v7 = [(UIScene *)self activationState];
  if ((unint64_t)v7 > UISceneActivationStateBackground) {
    id v8 = @"UISceneActivationStateUnattached";
  }
  else {
    id v8 = off_1E52DAEA8[v7];
  }
  [v4 appendString:v8 withName:@"activationState"];

  return v4;
}

id __56__UIScene__updateUIClientSettingsWithUITransitionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isUISubclass] & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"UIScene.m", 823, @"Invalid parameter not satisfying: %@", @"[mutableClientSettings isUISubclass]" object file lineNumber description];
  }
  id v4 = v3;
  id v5 = +[FBSSceneTransitionContext transitionContext];
  uint64_t v6 = [*(id *)(a1 + 32) _effectiveUISettings];
  if ([v6 isForeground]
    && ([*(id *)(a1 + 32) _isReadyForSuspension] & 1) == 0)
  {
    char v7 = [*(id *)(a1 + 32) _isConnected] ^ 1;
  }
  else
  {
    char v7 = 1;
  }

  int v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if ((v7 & 1) == 0 && v8)
  {
    int v9 = [*(id *)(a1 + 32) _synchronizedDrawingFence];
    [v5 setAnimationFence:v9];
  }
  return v5;
}

- (BOOL)_isReadyForSuspension
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 2) >> 3) & 1;
}

- (BOOL)_isConnected
{
  return [(UIScene *)self activationState] != UISceneActivationStateUnattached;
}

uint64_t __20__UIScene_setTitle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCanvasTitle:*(void *)(a1 + 32)];
}

void __66__UIScene__sceneForFBSScene_create_withSession_connectionOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  if ([v3 _fromPlist])
  {
    if ([*(id *)(a1 + 32) _isDefault]) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v5 setSceneActivationBias:v4];
  [v5 setIdleTimerDisabled:*(unsigned __int8 *)(a1 + 40)];
}

- (UIScene)initWithSession:(UISceneSession *)session connectionOptions:(UISceneConnectionOptions *)connectionOptions
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  int v8 = session;
  int v9 = connectionOptions;
  v72.receiver = self;
  v72.super_class = (Class)UIScene;
  id v10 = [(UIScene *)&v72 init];
  uint64_t v11 = v10;
  if (v10)
  {
    SEL v69 = a2;
    uint64_t v12 = (unsigned int *)(v10 + 216);
    *((_DWORD *)v10 + 54) |= 0x800u;
    int v13 = [(id)objc_opt_class() _hostsWindows];
    if (v13) {
      int v14 = 4096;
    }
    else {
      int v14 = 0;
    }
    unsigned int *v12 = *v12 & 0xFFFFEFFF | v14;
    if (v13)
    {
      if (objc_opt_respondsToSelector()) {
        int v15 = 0x2000;
      }
      else {
        int v15 = 0;
      }
      unsigned int *v12 = *v12 & 0xFFFFDFFF | v15;
    }
    if ([(id)objc_opt_class() _supportsEventUIWindowRouting]) {
      int v16 = 0x200000;
    }
    else {
      int v16 = 0;
    }
    unsigned int *v12 = *v12 & 0xFFCF7FFF | v16;
    uint64_t v17 = [(UISceneConnectionOptions *)v9 _fbsScene];
    long long v18 = (void *)*((void *)v11 + 8);
    *((void *)v11 + 8) = v17;

    long long v19 = [(UISceneConnectionOptions *)v9 _specification];
    objc_storeStrong((id *)v11 + 3, session);
    uint64_t v20 = [v11 _effectiveUIClientSettings];
    uint64_t v21 = [v20 activationConditionsData];

    if (!v21) {
      goto LABEL_19;
    }
    id v71 = 0;
    uint64_t v22 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v21 error:&v71];
    id v23 = v71;
    if (v23 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      [v23 localizedDescription];
      long long v64 = v63 = v22;
      *(_DWORD *)buf = 136315394;
      id v74 = "-[UIScene initWithSession:connectionOptions:]";
      __int16 v75 = 2112;
      v76 = v64;
      _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Unable to decode activation conditions %@", buf, 0x16u);

      uint64_t v22 = v63;
    }

    if (v22)
    {
      int v24 = 0;
      id v70 = (void *)v22;
      id v25 = (void *)v22;
    }
    else
    {
LABEL_19:
      id v25 = objc_opt_new();
      id v70 = 0;
      int v24 = 1;
    }
    objc_storeStrong((id *)v11 + 7, v25);
    if (v24) {

    }
    [*((id *)v11 + 7) _setUIScene:v11];
    id v26 = [(UISceneSession *)v8 configuration];
    uint64_t v27 = (void *)[v26 delegateClass];

    if (v27)
    {
      if (([v27 conformsToProtocol:&unk_1ED6D0780] & 1) == 0
        && ([v27 conformsToProtocol:&unk_1ED700690] & 1) == 0)
      {
        long long v67 = [MEMORY[0x1E4F28B00] currentHandler];
        [v67 handleFailureInMethod:v69 object:v11 file:@"UIScene.m" lineNumber:391 description:@"representation's delegateClass must conform to UISceneDelegate protocol"];
      }
      id v28 = objc_alloc_init((Class)v27);
    }
    else
    {
      id v28 = 0;
    }
    objc_storeStrong((id *)v11 + 4, v28);
    if (v27) {

    }
    uint64_t v29 = (void *)*((void *)v11 + 26);
    *((void *)v11 + 26) = 0;

    _UISceneInspectDelegateSuport((unsigned int *)v11 + 54, *((void **)v11 + 4));
    uint64_t v30 = [v19 initialSettingsDiffActions];
    long long v31 = (void *)*((void *)v11 + 9);
    *((void *)v11 + 9) = v30;

    uint64_t v32 = [v19 finalSettingsDiffActions];
    long long v33 = (void *)*((void *)v11 + 10);
    *((void *)v11 + 10) = v32;

    long long v34 = (void *)*((void *)v11 + 13);
    uint64_t v35 = MEMORY[0x1E4F1CC08];
    *((void *)v11 + 13) = MEMORY[0x1E4F1CC08];

    uint64_t v36 = [*((id *)v11 + 9) arrayByAddingObjectsFromArray:*((void *)v11 + 10)];
    long long v37 = (void *)*((void *)v11 + 14);
    *((void *)v11 + 14) = v36;

    uint64_t v38 = [v19 initialActionHandlers];
    id v39 = (void *)*((void *)v11 + 11);
    *((void *)v11 + 11) = v38;

    uint64_t v40 = [v19 finalActionHandlers];
    uint64_t v41 = (void *)*((void *)v11 + 12);
    *((void *)v11 + 12) = v40;

    long long v42 = (void *)*((void *)v11 + 15);
    *((void *)v11 + 15) = v35;

    uint64_t v43 = [*((id *)v11 + 11) arrayByAddingObjectsFromArray:*((void *)v11 + 12)];
    long long v44 = (void *)*((void *)v11 + 16);
    *((void *)v11 + 16) = v43;

    uint64_t v45 = [v19 lifecycleMonitorClass];
    if (v45)
    {
      uint64_t v46 = (void *)v45;
      uint64_t v47 = self;
      char v48 = [v46 isSubclassOfClass:v47];

      if ((v48 & 1) == 0)
      {
        v68 = [MEMORY[0x1E4F28B00] currentHandler];
        self;
        long long v65 = (objc_class *)objc_claimAutoreleasedReturnValue();
        long long v66 = NSStringFromClass(v65);
        [v68 handleFailureInMethod:v69, v11, @"UIScene.m", 411, @"Lifecycle monitor must at least be a %@", v66 object file lineNumber description];
      }
      uint64_t v49 = [objc_alloc((Class)v46) initWithScene:v11];
      v50 = (void *)*((void *)v11 + 19);
      *((void *)v11 + 19) = v49;
    }
    [v11 setTitle:&stru_1ED0E84C0];
    uint64_t v51 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    v52 = (void *)*((void *)v11 + 23);
    *((void *)v11 + 23) = v51;

    int v53 = [v19 isUIKitManaged];
    if (v53) {
      int v54 = 128;
    }
    else {
      int v54 = 0;
    }
    unsigned int *v12 = *v12 & 0xFFFFFF7F | v54;
    if (v53) {
      [*((id *)v11 + 8) setDelegate:v11];
    }
    if ([v19 isInternal]) {
      int v55 = 256;
    }
    else {
      int v55 = 0;
    }
    unsigned int *v12 = *v12 & 0xFFFFFEFF | v55;
    if ([v19 affectsAppLifecycleIfInternal]) {
      int v56 = 512;
    }
    else {
      int v56 = 0;
    }
    unsigned int *v12 = *v12 & 0xFFFFFDFF | v56;
    if ([v19 affectsScreenOrientation]) {
      int v57 = 1024;
    }
    else {
      int v57 = 0;
    }
    unsigned int *v12 = *v12 & 0xFFFFFBFF | v57;
    v58 = v11;
    v59 = (void *)_uiScenes;
    if (!_uiScenes)
    {
      uint64_t v60 = objc_opt_new();
      id v61 = (void *)_uiScenes;
      _uiScenes = v60;

      v59 = (void *)_uiScenes;
    }
    [v59 insertObject:v58 atIndex:0];

    _UISceneUpdateSystemShellManagesKeyboardFocusIfNeededFromScene(v58);
  }

  return (UIScene *)v11;
}

- (void)setTitle:(NSString *)title
{
  uint64_t v4 = title;
  if (v4) {
    id v5 = (__CFString *)v4;
  }
  else {
    id v5 = &stru_1ED0E84C0;
  }
  if (([(__CFString *)v5 isEqualToString:self->_title] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, v5);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __20__UIScene_setTitle___block_invoke;
    v6[3] = &unk_1E52DAE80;
    char v7 = v5;
    [(UIScene *)self _updateUIClientSettingsWithBlock:v6];
  }
}

- (void)_targetOfKeyboardEventDeferringEnvironmentDidUpdate:(_DWORD *)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1
    && _UISceneSystemShellManagesKeyboardFocusIsPossibleForScene(a1)
    && [a1 _allowsEventUIWindowRouting])
  {
    int v4 = a1[54];
    int v5 = a2 ? 0x400000 : 0;
    a1[54] = v4 & 0xFFBFFFFF | v5;
    _UISceneUpdateSystemShellManagesKeyboardFocusIfNeededFromScene(a1);
    char v6 = (v4 & 0x400000) != 0 ? a2 : 1;
    int v7 = (v4 & 0x400000) != 0 ? 0 : a2;
    if (a2 != (v4 & 0x400000u) >> 22)
    {
      int v8 = (objc_class *)objc_opt_class();
      Name = class_getName(v8);
      id v10 = [a1 _FBSScene];
      uint64_t v11 = [v10 identityToken];
      id v12 = [v11 stringRepresentation];
      uint64_t v13 = [v12 UTF8String];

      int v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyWindow", &_targetOfKeyboardEventDeferringEnvironmentDidUpdate____s_category)+ 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 67240962;
        v17[1] = a2;
        __int16 v18 = 2082;
        long long v19 = Name;
        __int16 v20 = 2050;
        uint64_t v21 = a1;
        __int16 v22 = 2080;
        uint64_t v23 = v13;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "Scene target of keyboard event deferring environment did change: %{public}d; scene: %{public}s: %{public}p; sc"
          "ene identity: %s",
          (uint8_t *)v17,
          0x26u);
      }
      int v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v16 = v15;
      if ((v6 & 1) == 0) {
        [v15 postNotificationName:@"_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification" object:a1];
      }
      if (v7) {
        [v16 postNotificationName:@"_UISceneDidBecomeTargetOfKeyboardEventDeferringEnvironmentNotification" object:a1];
      }
    }
  }
}

+ (id)_persistenceIdentifierForScene:(id)a3
{
  id v3 = a3;
  int v4 = [v3 settings];
  int v5 = [v4 isUISubclass];

  if (!v5
    || ([v3 uiSettings],
        char v6 = objc_claimAutoreleasedReturnValue(),
        [v6 persistenceIdentifier],
        int v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    int v7 = [v3 identifier];
  }

  return v7;
}

- (void)__captureWindow:(id)a3
{
  id v4 = a3;
  if ([(UIScene *)self _hostsWindows]) {
    -[UIWindow __setWindowHostingScene:]((uint64_t)v4, self);
  }
}

+ (void)_registerSceneComponentClass:(Class)a3 withKey:(id)a4 predicate:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if ([(objc_class *)a3 conformsToProtocol:&unk_1ED464328])
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __58__UIScene__registerSceneComponentClass_withKey_predicate___block_invoke;
    v30[3] = &unk_1E52DAB58;
    Class v33 = a3;
    id v24 = v10;
    id v11 = v10;
    id v31 = v11;
    id v25 = v9;
    id v12 = v9;
    id v32 = v12;
    __UISceneAccessClassComponentArray(1, v30);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v13 = [a1 _scenesIncludingInternal:1];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v19 = [v18 session];
          int v20 = [v11 evaluateWithObject:v19];

          if (v20)
          {
            uint64_t v21 = (void *)[[a3 alloc] initWithScene:v18];
            [v18 _registerSceneComponent:v21 forKey:v12];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v15);
    }

    id v10 = v24;
    id v9 = v25;
  }
  else
  {
    __int16 v22 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v23 = NSStringFromClass(a3);
    [v22 handleFailureInMethod:a2, a1, @"UIScene.m", 741, @"Attempted to register UIScene component class \"%@\", which does not conform to _UISceneComponentProviding", v23 object file lineNumber description];
  }
}

- (void)_performDeferredInitialWindowUpdateForConnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  $9341EDE2B60720950DEE76519EAE5484 sceneFlags = self->_sceneFlags;
  if ((*(_WORD *)&sceneFlags & 0x4000) == 0)
  {
    self->_$9341EDE2B60720950DEE76519EAE5484 sceneFlags = ($9341EDE2B60720950DEE76519EAE5484)(*(_DWORD *)&sceneFlags | 0x4000);
    if (![(UIScene *)self _subclassTracksWindowsNeedingDeferredInitialUpdates])
    {
      if ([(UIScene *)self _hostsWindows])
      {
        long long v11 = 0u;
        long long v12 = 0u;
        long long v9 = 0u;
        long long v10 = 0u;
        id v4 = [(UIScene *)self _allWindows];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v10;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v10 != v7) {
                objc_enumerationMutation(v4);
              }
              [*(id *)(*((void *)&v9 + 1) + 8 * i) _executeDeferredOrientationUpdate];
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
          }
          while (v6);
        }
      }
    }
  }
}

- (void)_finishSceneConnection
{
  *(_DWORD *)&self->_sceneFlags &= ~0x800u;
}

+ (id)_connectionOptionsForScene:(id)a3 withSpecification:(id)a4 transitionContext:(id)a5 actions:(id)a6 sceneSession:(id)a7
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x3032000000;
  long long v65 = __Block_byref_object_copy__9;
  long long v66 = __Block_byref_object_dispose__9;
  id v39 = v14;
  id v67 = v39;
  uint64_t v56 = 0;
  int v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__9;
  uint64_t v60 = __Block_byref_object_dispose__9;
  id v61 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__UIScene__connectionOptionsForScene_withSpecification_transitionContext_actions_sceneSession___block_invoke;
  aBlock[3] = &unk_1E52DACE8;
  int v54 = &v62;
  id v37 = v11;
  id v49 = v37;
  id v18 = v15;
  id v50 = v18;
  id v38 = v13;
  id v51 = v38;
  id v19 = v16;
  id v52 = v19;
  id v20 = v17;
  id v53 = v20;
  int v55 = &v56;
  uint64_t v21 = (void (**)(void *, void))_Block_copy(aBlock);
  if ([(id)v63[5] count])
  {
    __int16 v22 = [v12 initialActionHandlers];
    uint64_t v23 = [v12 finalActionHandlers];
    id v24 = [v22 arrayByAddingObjectsFromArray:v23];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v69 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v45;
LABEL_4:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v25);
        }
        v21[2](v21, *(void *)(*((void *)&v44 + 1) + 8 * v28));
        if (![(id)v63[5] count]) {
          break;
        }
        if (v26 == ++v28)
        {
          uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v69 count:16];
          if (v26) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  [v12 _transitionContextHandlers];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v68 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(v29);
        }
        v21[2](v21, *(void *)(*((void *)&v40 + 1) + 8 * i));
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v68 count:16];
    }
    while (v30);
  }

  Class v33 = objc_alloc_init(_UISceneConnectionOptionsContext);
  long long v34 = (void *)[v19 copy];
  [(_UISceneConnectionOptionsContext *)v33 setLaunchOptionsDictionary:v34];

  [(_UISceneConnectionOptionsContext *)v33 setUnprocessedActions:v63[5]];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v33, (void *)v57[5]);
  if (v33) {
    objc_setProperty_nonatomic_copy(v33, v35, v20, 24);
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  return v33;
}

void __95__UIScene__connectionOptionsForScene_withSpecification_transitionContext_actions_sceneSession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v34 = v3;
    Class v33 = [v3 _launchOptionsFromActions:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forFBSScene:*(void *)(a1 + 32) uiSceneSession:*(void *)(a1 + 40) transitionContext:*(void *)(a1 + 48)];
    id v4 = [v33 launchOptionsDictionary];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v5 = [v4 allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          id v11 = [*(id *)(a1 + 56) objectForKeyedSubscript:v10];
          id v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }
          else
          {
            id v13 = [MEMORY[0x1E4F1CAD0] set];
          }
          id v14 = v13;

          id v15 = [v4 objectForKeyedSubscript:v10];
          uint64_t v16 = [v14 setByAddingObjectsFromSet:v15];
          [*(id *)(a1 + 56) setObject:v16 forKeyedSubscript:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v7);
    }

    if (v33) {
      uint64_t v17 = (void *)v33[3];
    }
    else {
      uint64_t v17 = 0;
    }
    id v3 = v34;
    id v18 = v17;

    if (v18)
    {
      id v19 = *(void **)(a1 + 64);
      if (v33) {
        id v20 = (void *)v33[3];
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;
      [v19 unionSet:v21];
    }
    if (v33) {
      __int16 v22 = (void *)v33[4];
    }
    else {
      __int16 v22 = 0;
    }
    id v23 = v22;

    if (v23)
    {
      if (v33) {
        id v24 = (void *)v33[4];
      }
      else {
        id v24 = 0;
      }
      id v25 = v24;
      uint64_t v26 = *(void *)(*(void *)(a1 + 80) + 8);
      id v29 = *(void **)(v26 + 40);
      uint64_t v27 = (id *)(v26 + 40);
      uint64_t v28 = v29;
      if (v29) {
        [v28 applyValuesFromOtherStorage:v25];
      }
      else {
        objc_storeStrong(v27, v24);
      }
    }
    uint64_t v30 = [v33 unprocessedActions];
    uint64_t v31 = *(void *)(*(void *)(a1 + 72) + 8);
    id v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;
  }
}

- (NSArray)_windows
{
  if ([(UIScene *)self _hostsWindows])
  {
    id v3 = [(UIScene *)self _allWindowsIncludingInternalWindows:0 onlyVisibleWindows:0];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (UISceneActivationConditions)activationConditions
{
  return self->_activationConditions;
}

- (_UIPhysicalButtonInteractionArbiter)_physicalButtonInteractionArbiter
{
  BOOL v3 = [(UIScene *)self _hasInvalidated];
  BOOL v4 = [(UIScene *)self _allowsEventUIWindowRouting];
  uint64_t v5 = [(UIScene *)self session];
  uint64_t v6 = [v5 role];
  char v7 = [v6 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"];

  uint64_t v8 = 0;
  if (!v3 && v4 && (v7 & 1) == 0)
  {
    uint64_t v8 = [(UIScene *)self _existingPhysicalButtonInteractionArbiter];
    if (!v8)
    {
      uint64_t v8 = [[_UIPhysicalButtonInteractionArbiter alloc] initWithScene:self];
      [(UIScene *)self _registerSceneComponent:v8 forKey:@"_UIPhysicalButtonInteractionArbiterComponentKey"];
    }
  }
  return v8;
}

- (id)_currentOpenApplicationEndpoint
{
  id v2 = [(FBSScene *)self->_scene identityToken];
  BOOL v3 = v2;
  if (v2)
  {
    BOOL v4 = (void *)UIApp;
    uint64_t v5 = [v2 stringRepresentation];
    uint64_t v6 = _UISVisibilityEnvironmentForSceneIdentityTokenString();
    char v7 = [v4 _currentOpenApplicationEndpointForEnvironment:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)openURL:(NSURL *)url options:(UISceneOpenExternalURLOptions *)options completionHandler:(void *)completion
{
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
  long long v9 = completion;
  uint64_t v10 = options;
  id v11 = url;
  id v16 = [v8 dictionary];
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", -[UISceneOpenExternalURLOptions universalLinksOnly](v10, "universalLinksOnly"));
  [v16 setValue:v12 forKey:@"UIApplicationOpenURLOptionUniversalLinksOnly"];

  id v13 = [(UISceneOpenExternalURLOptions *)v10 eventAttribution];

  [v16 setValue:v13 forKey:@"UIApplicationOpenExternalURLOptionsEventAttributionKey"];
  id v14 = (void *)UIApp;
  id v15 = [(UIScene *)self _currentOpenApplicationEndpoint];
  [v14 _openURL:v11 options:v16 openApplicationEndpoint:v15 completionHandler:v9];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(NSString *)subtitle
{
  BOOL v4 = subtitle;
  if (!v4) {
    BOOL v4 = &stru_1ED0E84C0;
  }
  p_subtitle = &self->_subtitle;
  obuint64_t j = v4;
  if (([(__CFString *)v4 isEqualToString:*p_subtitle] & 1) == 0) {
    objc_storeStrong((id *)p_subtitle, obj);
  }
}

+ (id)_sceneForFBSScene:(id)a3 usingPredicate:(id)a4
{
  id v6 = a4;
  char v7 = [a1 _sceneForFBSScene:a3];
  LODWORD(a1) = [v6 evaluateWithObject:v7];

  if (a1) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (NSString)_identifier
{
  BOOL v3 = [(UIScene *)self _persistenceIdentifier];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIScene *)self _sceneIdentifier];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (void)_setDiscardSessionOnUserDisconnect:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__UIScene__setDiscardSessionOnUserDisconnect___block_invoke;
  v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  BOOL v4 = a3;
  [(UIScene *)self _updateUIClientSettingsWithBlock:v3];
}

uint64_t __46__UIScene__setDiscardSessionOnUserDisconnect___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDiscardSessionOnUserDisconnect:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)_discardSessionOnUserDisconnect
{
  id v2 = [(UIScene *)self _effectiveUIClientSettings];
  char v3 = [v2 discardSessionOnUserDisconnect];

  return v3;
}

- (void)_registerSettingsDiffActionArray:(id)a3 forKey:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!os_variant_has_internal_diagnostics()
    || !_UIIsPrivateMainBundle()
    || ![v7 containsObject:self])
  {
    goto LABEL_4;
  }
  _UIIsPrivateMainBundle();
  if (!dyld_program_sdk_at_least())
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v21 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        goto LABEL_20;
      }
      if (self)
      {
        uint64_t v27 = NSString;
        uint64_t v28 = self;
        id v29 = (objc_class *)objc_opt_class();
        uint64_t v30 = NSStringFromClass(v29);
        uint64_t v26 = [v27 stringWithFormat:@"<%@: %p>", v30, v28];
      }
      else
      {
        uint64_t v26 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      id v32 = v26;
      __int16 v33 = 2080;
      id v34 = "-[UIScene _registerSettingsDiffActionArray:forKey:]";
      _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.  This will become an assert in a future version.", buf, 0x16u);
    }
    else
    {
      id v21 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &_registerSettingsDiffActionArray_forKey____s_category)+ 8);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
LABEL_20:

        goto LABEL_4;
      }
      if (self)
      {
        __int16 v22 = NSString;
        id v23 = self;
        id v24 = (objc_class *)objc_opt_class();
        id v25 = NSStringFromClass(v24);
        uint64_t v26 = [v22 stringWithFormat:@"<%@: %p>", v25, v23];
      }
      else
      {
        uint64_t v26 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      id v32 = v26;
      __int16 v33 = 2080;
      id v34 = "-[UIScene _registerSettingsDiffActionArray:forKey:]";
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.  This will become an assert in a future version.", buf, 0x16u);
    }

    goto LABEL_20;
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  if (self)
  {
    id v16 = NSString;
    uint64_t v17 = self;
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    id v20 = [v16 stringWithFormat:@"<%@: %p>", v19, v17];
  }
  else
  {
    id v20 = @"(nil)";
  }
  [v15 handleFailureInMethod:a2, self, @"UIScene.m", 672, @"BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.", v20, "-[UIScene _registerSettingsDiffActionArray:forKey:]" object file lineNumber description];

LABEL_4:
  long long v9 = (void *)[(NSDictionary *)self->_additionalSettingsDiffActions mutableCopy];
  uint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  [v12 setObject:v7 forKey:v8];
  id v13 = (NSDictionary *)[v12 copy];
  additionalSettingsDiffActions = self->_additionalSettingsDiffActions;
  self->_additionalSettingsDiffActions = v13;

  [(UIScene *)self _calculateFlattenedDiffActions];
}

- (void)_unregisterSettingsDiffActionArrayForKey:(id)a3
{
  additionalSettingsDiffActions = self->_additionalSettingsDiffActions;
  id v5 = a3;
  id v6 = (void *)[(NSDictionary *)additionalSettingsDiffActions mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v11 = v8;

  [v11 removeObjectForKey:v5];
  long long v9 = (NSDictionary *)[v11 copy];
  uint64_t v10 = self->_additionalSettingsDiffActions;
  self->_additionalSettingsDiffActions = v9;

  [(UIScene *)self _calculateFlattenedDiffActions];
}

- (void)_registerSceneActionsHandlerArray:(id)a3 forKey:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!os_variant_has_internal_diagnostics()
    || !_UIIsPrivateMainBundle()
    || ![v7 containsObject:self])
  {
    goto LABEL_4;
  }
  _UIIsPrivateMainBundle();
  if (!dyld_program_sdk_at_least())
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v15 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        goto LABEL_17;
      }
      if (self)
      {
        id v21 = NSString;
        __int16 v22 = self;
        id v23 = (objc_class *)objc_opt_class();
        id v24 = NSStringFromClass(v23);
        id v20 = [v21 stringWithFormat:@"<%@: %p>", v24, v22];
      }
      else
      {
        id v20 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v20;
      __int16 v27 = 2080;
      uint64_t v28 = "-[UIScene _registerSceneActionsHandlerArray:forKey:]";
      _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.  This will become an assert in a future version.", buf, 0x16u);
    }
    else
    {
      id v15 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &_registerSceneActionsHandlerArray_forKey____s_category)+ 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        goto LABEL_4;
      }
      if (self)
      {
        id v16 = NSString;
        uint64_t v17 = self;
        id v18 = (objc_class *)objc_opt_class();
        id v19 = NSStringFromClass(v18);
        id v20 = [v16 stringWithFormat:@"<%@: %p>", v19, v17];
      }
      else
      {
        id v20 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v20;
      __int16 v27 = 2080;
      uint64_t v28 = "-[UIScene _registerSceneActionsHandlerArray:forKey:]";
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.  This will become an assert in a future version.", buf, 0x16u);
    }

    goto LABEL_17;
  }
  long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
  if (self)
  {
    uint64_t v10 = NSString;
    id v11 = self;
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    id v14 = [v10 stringWithFormat:@"<%@: %p>", v13, v11];
  }
  else
  {
    id v14 = @"(nil)";
  }
  [v9 handleFailureInMethod:a2, self, @"UIScene.m", 689, @"BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.", v14, "-[UIScene _registerSceneActionsHandlerArray:forKey:]" object file lineNumber description];

LABEL_4:
  [(UIScene *)self _registerBSActionResponderArray:v7 forKey:v8];
}

- (void)_registerBSActionResponderArray:(id)a3 forKey:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!os_variant_has_internal_diagnostics()
    || !_UIIsPrivateMainBundle()
    || ![v7 containsObject:self])
  {
    goto LABEL_4;
  }
  _UIIsPrivateMainBundle();
  if (!dyld_program_sdk_at_least())
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v21 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        goto LABEL_20;
      }
      if (self)
      {
        __int16 v27 = NSString;
        uint64_t v28 = self;
        uint64_t v29 = (objc_class *)objc_opt_class();
        uint64_t v30 = NSStringFromClass(v29);
        uint64_t v26 = [v27 stringWithFormat:@"<%@: %p>", v30, v28];
      }
      else
      {
        uint64_t v26 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      id v32 = v26;
      __int16 v33 = 2080;
      id v34 = "-[UIScene _registerBSActionResponderArray:forKey:]";
      _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.  This will become an assert in a future version.", buf, 0x16u);
    }
    else
    {
      id v21 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &_registerBSActionResponderArray_forKey____s_category)+ 8);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
LABEL_20:

        goto LABEL_4;
      }
      if (self)
      {
        __int16 v22 = NSString;
        id v23 = self;
        id v24 = (objc_class *)objc_opt_class();
        id v25 = NSStringFromClass(v24);
        uint64_t v26 = [v22 stringWithFormat:@"<%@: %p>", v25, v23];
      }
      else
      {
        uint64_t v26 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      id v32 = v26;
      __int16 v33 = 2080;
      id v34 = "-[UIScene _registerBSActionResponderArray:forKey:]";
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.  This will become an assert in a future version.", buf, 0x16u);
    }

    goto LABEL_20;
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  if (self)
  {
    id v16 = NSString;
    uint64_t v17 = self;
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    id v20 = [v16 stringWithFormat:@"<%@: %p>", v19, v17];
  }
  else
  {
    id v20 = @"(nil)";
  }
  [v15 handleFailureInMethod:a2, self, @"UIScene.m", 694, @"BUG IN CLIENT OF UIKIT: %@ %s: Registering the scene itself results in a retain cycle.", v20, "-[UIScene _registerBSActionResponderArray:forKey:]" object file lineNumber description];

LABEL_4:
  long long v9 = (void *)[(NSDictionary *)self->_additionalBSActionResponders mutableCopy];
  uint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  [v12 setObject:v7 forKey:v8];
  id v13 = (NSDictionary *)[v12 copy];
  additionalBSActionResponders = self->_additionalBSActionResponders;
  self->_additionalBSActionResponders = v13;

  [(UIScene *)self _calculateFlattenedBSActionResponders];
}

- (void)_unregisterBSActionResponderArray:(id)a3
{
  additionalBSActionResponders = self->_additionalBSActionResponders;
  id v5 = a3;
  id v6 = (void *)[(NSDictionary *)additionalBSActionResponders mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v11 = v8;

  [v11 removeObjectForKey:v5];
  long long v9 = (NSDictionary *)[v11 copy];
  uint64_t v10 = self->_additionalBSActionResponders;
  self->_additionalBSActionResponders = v9;

  [(UIScene *)self _calculateFlattenedBSActionResponders];
}

- (void)_unregisterSceneComponentForKey:(id)a3
{
  id v9 = a3;
  BOOL v4 = -[NSDictionary objectForKey:](self->_registeredComponents, "objectForKey:");
  id v5 = v4;
  if (v4)
  {
    [v4 _setScene:0];
    id v6 = (void *)[(NSDictionary *)self->_registeredComponents mutableCopy];
    [v6 removeObjectForKey:v9];
    id v7 = (NSDictionary *)[v6 copy];
    registeredComponents = self->_registeredComponents;
    self->_registeredComponents = v7;

    [(UIScene *)self _calculateFlattenedDiffActions];
    [(UIScene *)self _calculateFlattenedBSActionResponders];
  }
}

- (void)_updateUIClientSettingsWithTransitionBlock:(id)a3
{
}

- (void)_compatibilityModeZoomDidChange
{
}

uint64_t __42__UIScene__compatibilityModeZoomDidChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return [(id)UIApp _setCompatibilityModeOnSettings:a2];
}

- (void)_synchronizeDrawing
{
  if ([(UIScene *)self _shouldAllowFencing])
  {
    +[UIScene _synchronizeDrawing];
  }
}

- (id)_synchronizeDrawingAndReturnFence
{
  id v2 = [(UIScene *)self _synchronizedDrawingFence];
  char v3 = [v2 CAFenceHandle];
  BOOL v4 = (void *)[v3 copy];

  [v2 invalidate];
  return v4;
}

- (void)_synchronizeDrawingUsingFence:(id)a3
{
  id v4 = a3;
  if ([(UIScene *)self _shouldAllowFencing]) {
    +[UIScene _synchronizeDrawingUsingFence:v4];
  }
}

+ (void)_synchronizeDrawingUsingFence:(id)a3
{
}

- (void)_noteDisplayIdentityDidChangeWithConfiguration:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(UIScene *)self _hostsWindows])
  {
    id v5 = self;
    id v6 = [(UIScene *)v5 _oldSettings];
    id v7 = [v6 displayIdentity];

    id v8 = +[UIScreen _screenWithFBSDisplayIdentity:v7];
    id v9 = [(UIScene *)v5 _FBSScene];
    if (v4) {
      +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v4, [(id)UIApp _hasCalledRunWithMainScene]);
    }
    uint64_t v10 = +[UIScreen _screenForScene:v9];
    if (v8 != v10)
    {
      id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v12 = objc_opt_new();
      id v13 = v12;
      if (v8) {
        [v12 setObject:v8 forKey:@"_UIWindowHostingSceneOldScreenUserInfoKey"];
      }
      uint64_t v29 = v9;
      if (v10) {
        [v13 setObject:v10 forKey:@"_UIWindowHostingSceneNewScreenUserInfoKey"];
      }
      id v30 = v4;
      objc_msgSend(v11, "postNotificationName:object:userInfo:", @"_UIWindowHostingSceneWillMoveToScreenNotification", v5, v13, v13, v11);
      id v14 = [(NSDictionary *)v5->_registeredComponents allValues];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v38 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v19 _windowHostingScene:v5 willMoveFromScreen:v8 toScreen:v10];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v16);
      }
      if ((*((unsigned char *)&v5->_sceneFlags + 1) & 0x20) != 0) {
        [(UIScene *)v5 _screenDidChangeFromScreen:v8 toScreen:v10];
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v20 = v14;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            if (objc_opt_respondsToSelector()) {
              [v25 _windowHostingScene:v5 didMoveFromScreen:v8 toScreen:v10];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v22);
      }

      [v28 postNotificationName:@"_UIWindowHostingSceneDidMoveToScreenNotification" object:v5 userInfo:v27];
      id v9 = v29;
      id v4 = v30;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__UIScene__noteDisplayIdentityDidChangeWithConfiguration___block_invoke;
    v31[3] = &unk_1E52D9F70;
    id v32 = v7;
    id v26 = v7;
    [(UIScene *)v5 _enqueuePostSettingsUpdateResponseBlock:v31 inPhase:@"_UIScenePostSettingsUpdateResponsePhaseScreenDisconnect"];
  }
}

uint64_t __58__UIScene__noteDisplayIdentityDidChangeWithConfiguration___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return +[UIScreen _FBSDisplayIdentityDisconnected:](UIScreen, "_FBSDisplayIdentityDisconnected:");
  }
  return result;
}

- (void)_invalidate
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  $9341EDE2B60720950DEE76519EAE5484 sceneFlags = self->_sceneFlags;
  if ((*(_WORD *)&sceneFlags & 0x8000) == 0)
  {
    self->_$9341EDE2B60720950DEE76519EAE5484 sceneFlags = ($9341EDE2B60720950DEE76519EAE5484)(*(_DWORD *)&sceneFlags | 0x8000);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v4 = [(NSDictionary *)self->_registeredComponents allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v44 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v9 _sceneWillInvalidate:self];
          }
          [v9 _setScene:0];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v6);
    }

    registeredComponents = self->_registeredComponents;
    self->_registeredComponents = 0;

    [(UIScene *)self _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:0 asCopy:1 stopped:0 withBlock:&__block_literal_global_180];
    if ([(UIScene *)self _allowsEventUIWindowRouting]) {
      [(id)UIApp _cancelAllInputsOnEventRoutingScene:self];
    }
    [(UIScene *)self _prepareForSuspend];
    if (_uiScenes) {
      [(id)_uiScenes removeObject:self];
    }
    [(UISceneSession *)self->_session _setScene:0];
    kdebug_trace();
    if ((*(unsigned char *)&self->_sceneFlags & 4) != 0)
    {
      id v11 = [(UIScene *)self delegate];
      [v11 sceneDidDisconnect:self];
    }
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"UISceneDidDisconnectNotification" object:self];

    if ([(UIScene *)self _hasLifecycle])
    {
      id v13 = +[_UISceneLifecycleMultiplexer sharedInstance];
      int v14 = [v13 isTrackingScene:self];

      if (v14)
      {
        [(UIScene *)self _setIsRespondingToLifecycleEvent:1];
        uint64_t v15 = +[_UISceneLifecycleMultiplexer sharedInstance];
        uint64_t v16 = [(UIScene *)self _effectiveUISettings];
        [v15 uiScene:self transitionedFromState:v16 withTransitionContext:0];

        [(UIScene *)self _setIsRespondingToLifecycleEvent:0];
      }
    }
    scene = self->_scene;
    if (scene)
    {
      id v18 = [(FBSScene *)scene specification];
      id v19 = [v18 disconnectionHandlers];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v40;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v40 != v23) {
              objc_enumerationMutation(v20);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v39 + 1) + 8 * j) + 16))();
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
        }
        while (v22);
      }
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v25 = [(UIScene *)self _allWindowsForInvalidation];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v35 + 1) + 8 * v29);
          if (v30) {
            uint64_t v31 = *(void **)(v30 + 800);
          }
          else {
            uint64_t v31 = 0;
          }
          id v32 = v31;

          if (v32 == self)
          {
            [(UIScene *)self _detachWindow:v30];
            -[UIWindow __setWindowHostingScene:](v30, 0);
          }
          ++v29;
        }
        while (v27 != v29);
        uint64_t v33 = [v25 countByEnumeratingWithState:&v35 objects:v47 count:16];
        uint64_t v27 = v33;
      }
      while (v33);
    }

    long long v34 = self->_scene;
    self->_scene = 0;

    kdebug_trace();
  }
}

uint64_t __22__UIScene__invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _prepareHierarchyForWindowHostingSceneRemoval];
}

- (id)_allWindowsForInvalidation
{
  if ([(UIScene *)self _hostsWindows])
  {
    char v3 = [(UIScene *)self _allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

+ (BOOL)_hostsWindows
{
  return 0;
}

- (NSArray)_visibleWindows
{
  if ([(UIScene *)self _hostsWindows])
  {
    char v3 = [(UIScene *)self _allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
  }
  else
  {
    char v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (NSArray)_allWindows
{
  if ([(UIScene *)self _hostsWindows])
  {
    char v3 = [(UIScene *)self _allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  }
  else
  {
    char v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (void)_enumerateWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 asCopy:(BOOL)a5 stopped:(BOOL *)a6 withBlock:(id)a7
{
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = (void (**)(id, void, char *))a7;
  if ([(UIScene *)self _hostsWindows])
  {
    char v21 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = -[UIScene _allWindowsIncludingInternalWindows:onlyVisibleWindows:](self, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", v9, v8, 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          v11[2](v11, *(void *)(*((void *)&v17 + 1) + 8 * i), &v21);
          if (v21)
          {
            if (a6) {
              *a6 = 1;
            }
            goto LABEL_13;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (BOOL)_windowIsFront:(id)a3
{
  return 0;
}

- (id)_topVisibleWindowPassingTest:(id)a3
{
  return [(UIScene *)self _topVisibleWindowEnumeratingAsCopy:0 passingTest:a3];
}

- (id)_topVisibleWindowEnumeratingAsCopy:(BOOL)a3 passingTest:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__9;
  uint64_t v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  if ([(UIScene *)self _hostsWindows])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__UIScene__topVisibleWindowEnumeratingAsCopy_passingTest___block_invoke;
    v9[3] = &unk_1E52DABF0;
    id v11 = &v12;
    id v10 = v6;
    [(UIScene *)self _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 asCopy:v4 stopped:0 withBlock:v9];
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__UIScene__topVisibleWindowEnumeratingAsCopy_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v11 = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || ([v4 windowLevel],
        double v6 = v5,
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) windowLevel],
        id v7 = v11,
        v6 > v8))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (!v9 || (v10 = (*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v11), id v7 = v11, v10))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      id v7 = v11;
    }
  }
}

- (id)_fbsSceneLayerForWindow:(id)a3
{
  return 0;
}

- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnection:(id)a3
{
  return 0;
}

- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnectionAndTrackIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(UIScene *)self _hostsWindows]) {
    BOOL v5 = [(UIScene *)self _shouldDeferInitialWindowUpdateBeforeConnection:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_tracksWindowsNeedingDeferredInitialUpdates
{
  return 0;
}

- (CGRect)_referenceBounds
{
  if ([(UIScene *)self _hostsWindows])
  {
    char v3 = [(UIScene *)self _screen];
    [v3 _referenceBounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB20];
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_boundsForInterfaceOrientation:(int64_t)a3
{
  if ([(UIScene *)self _hostsWindows])
  {
    [(UIScene *)self _referenceBounds];
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    CGFloat Height = v7;
    CGFloat v12 = v8;
    if ((unint64_t)(a3 - 3) <= 1)
    {
      CGFloat Width = CGRectGetWidth(*(CGRect *)&v5);
      v18.origin.x = v9;
      v18.origin.y = v10;
      v18.size.width = Height;
      v18.size.height = v12;
      CGFloat Height = CGRectGetHeight(v18);
      CGFloat v12 = Width;
    }
  }
  else
  {
    CGFloat v9 = *MEMORY[0x1E4F1DB20];
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat Height = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v14 = v9;
  double v15 = v10;
  double v16 = Height;
  double v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_computeMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIScene *)self _allWindows];
  [(UIScene *)self _computeMetricsForWindows:v5 animated:v3];
}

- (void)_computeMetricsForWindows:(id)a3 animated:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(UIScene *)self _hostsWindows])
  {
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
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_sceneBoundsDidChange", (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (double)_systemMinimumMargin
{
  return 0.0;
}

- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottouint64_t m = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)_shouldRotateSafeAreaInsetsToInterfaceOrientation
{
  return 0;
}

- (void)__releaseWindow:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(UIScene *)self _hostsWindows];
  double v5 = v8;
  if (v4)
  {
    double v6 = v8 ? (void *)*((void *)v8 + 100) : 0;
    uint64_t v7 = v6;

    double v5 = v8;
    if (v7 == self)
    {
      -[UIWindow __setWindowHostingScene:]((uint64_t)v8, 0);
      double v5 = v8;
    }
  }
}

- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3
{
}

+ (BOOL)_supportsEventUIWindowRouting
{
  return 0;
}

- (BOOL)_allowsEventUIWindowRouting
{
  return 0;
}

+ (UIScene)_mostActiveScene
{
  return +[_UISceneLifecycleMultiplexer mostActiveScene];
}

- (BOOL)_involvedInMediaPlayback
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 2) >> 4) & 1;
}

- (void)_setInvolvedInMediaPlayback:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$9341EDE2B60720950DEE76519EAE5484 sceneFlags = ($9341EDE2B60720950DEE76519EAE5484)(*(_DWORD *)&self->_sceneFlags & 0xFFEFFFFF | v3);
}

- (void)_prepareForSuspend
{
  *(_DWORD *)&self->_sceneFlags |= 0x80000u;
}

- (BOOL)_isEligibleForSuspension
{
  id v2 = [(UIScene *)self _effectiveUISettings];
  char v3 = [v2 isForeground] ^ 1;

  return v3;
}

- (void)_setSettingsScene:(id)a3
{
  uint64_t v9 = (UIScene *)a3;
  id WeakRetained = (UIScene *)objc_loadWeakRetained((id *)&self->_settingsScene);

  if (WeakRetained != v9)
  {
    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"_UISceneWillChangeSettingsSceneNotification" object:self];
    id v6 = objc_loadWeakRetained((id *)&self->_settingsScene);
    [v6 _removeInheritingScene:self];

    if (v9 == self) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v9;
    }
    id v8 = objc_storeWeak((id *)&self->_settingsScene, v7);
    [(UIScene *)v7 _addInheritingScene:self];

    [v5 postNotificationName:@"_UISceneDidChangeSettingsSceneNotification" object:self];
  }
}

- (id)_fixupInheritedSettings:(id)a3
{
  return a3;
}

- (id)_fixupInheritedClientSettings:(id)a3
{
  return a3;
}

- (FBSSceneSettings)_synthesizedSettings
{
  return 0;
}

- (void)_guardedSetOverrideSettings:(id)a3
{
  double v5 = (FBSSceneSettings *)a3;
  if ((*((unsigned char *)&self->_sceneFlags + 2) & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIScene.m" lineNumber:1886 description:@"Attempted to set an override settings outside _enableOverrideSettingsForActions:"];
  }
  overrideSettings = self->_overrideSettings;
  self->_overrideSettings = v5;

  if ([(UIScene *)self _hostsWindows])
  {
    uint64_t v7 = self;
    id v9 = [(UIScene *)v7 _effectiveSettings];
    _UIWindowHostingScenePerformUpdateWithEffectiveSettings(v7, v9);
  }
}

- (void)_enableOverrideSettingsForActions:(id)a3
{
  *(_DWORD *)&self->_sceneFlags |= 0x10000u;
  (*((void (**)(id, UIScene *))a3 + 2))(a3, self);
  *(_DWORD *)&self->_sceneFlags &= ~0x10000u;
  overrideSettings = self->_overrideSettings;
  self->_overrideSettings = 0;

  BOOL v5 = [(UIScene *)self _hostsWindows];
  if (self && v5)
  {
    id v6 = self;
    id v7 = [(UIScene *)v6 _effectiveSettings];
    _UIWindowHostingScenePerformUpdateWithEffectiveSettings(v6, v7);
  }
}

- (void)_applyOverrideSettings:(id)a3 forActions:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, UIScene *))a4;
  if (v6)
  {
    [(UIScene *)self _guardedSetOverrideSettings:v6];
  }
  else if (*((unsigned char *)&self->_sceneFlags + 2))
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Attempted to perform actions without override settings within _enableOverrideSettingsForActions! This is probably a visiual glitch, please explicitly specify settings for these actions!", buf, 2u);
      }
    }
    else
    {
      id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_applyOverrideSettings_forActions____s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Attempted to perform actions without override settings within _enableOverrideSettingsForActions! This is probably a visiual glitch, please explicitly specify settings for these actions!", v10, 2u);
      }
    }
  }
  v7[2](v7, self);
}

- (void)_performSystemSnapshotWithActions:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 postNotificationName:@"UISceneWillBeginSystemSnapshotSequence" object:self];
  [(UIScene *)self _enableOverrideSettingsForActions:v5];

  [v6 postNotificationName:@"UISceneDidCompleteSystemSnapshotSequence" object:self];
}

- (BOOL)_isRunningInTaskSwitcher
{
  id v2 = [(UIScene *)self _effectiveSettings];
  unint64_t v3 = ((unint64_t)[v2 deactivationReasons] >> 3) & 1;

  return v3;
}

- (BOOL)_isUIKitManaged
{
  return *(unsigned char *)&self->_sceneFlags >> 7;
}

- (BOOL)_isProcessingDiffActionHandlers
{
  return (*((unsigned __int8 *)&self->_sceneFlags + 2) >> 2) & 1;
}

void __64__UIScene_scene_didUpdateWithDiff_transitionContext_completion___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationLifecycle", &_UISceneComponentKeynameKey_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_FAULT, "Invalid system behavior. A scene update was received prior to finishing initial application activation.", v1, 2u);
  }
}

- (void)_setShouldHoldSceneEventResponses:(BOOL)a3
{
  id v5 = _holdSceneEventResponsesQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__UIScene__setShouldHoldSceneEventResponses___block_invoke;
  v6[3] = &unk_1E52D9FC0;
  BOOL v7 = a3;
  void v6[4] = self;
  dispatch_sync(v5, v6);
}

void __45__UIScene__setShouldHoldSceneEventResponses___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 224);
  if (v2)
  {
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v6 = *(void *)(a1 + 32);
      BOOL v7 = *(void **)(v6 + 224);
      *(void *)(v6 + 224) = v5;
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __45__UIScene__setShouldHoldSceneEventResponses___block_invoke_2;
    v10[3] = &unk_1E52DAD70;
    v10[4] = v3;
    [v4 enumerateObjectsUsingBlock:v10];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 224);
    *(void *)(v8 + 224) = 0;
  }
}

void __45__UIScene__setShouldHoldSceneEventResponses___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = (void *)UIApp;
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _FBSScene];
  [v2 _scheduleSceneEventResponseForScene:v5 withResponseBlock:v4];
}

- (void)_prepareCommonStateForActionRespondingFromTransitionContext:(id)a3
{
  id v6 = a3;
  int v3 = [v6 isUISubclass];
  id v4 = v6;
  if (v3)
  {
    id v5 = [v6 pasteSharingToken];
    if (v5) {
      +[UIPasteboard setPasteSharingTokenFromOpenURL:v5];
    }

    id v4 = v6;
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6 = (void *)UIApp;
  id v7 = a4;
  id v8 = a3;
  if (([v6 _hasCalledRunWithMainScene] & 1) == 0 && scene_didReceiveActions__once != -1) {
    dispatch_once(&scene_didReceiveActions__once, &__block_literal_global_238);
  }
  kdebug_trace();
  [(UIScene *)self scene:v8 didReceiveActions:v7 fromTransitionContext:0];

  kdebug_trace();
}

void __35__UIScene_scene_didReceiveActions___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationLifecycle", &_UISceneComponentKeynameKey_block_invoke_2___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_FAULT, "Invalid system behavior. Scene actions were received prior to finishing initial application activation.", v1, 2u);
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(UIScene *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(UIScene *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(UIScene *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  char has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = [(UIScene *)self _hostsWindows];
  id v7 = [(UIScene *)self session];
  id v8 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v8 setActiveMultilinePrefix:v4];

  id v9 = [v7 role];
  [v8 appendString:v9 withName:@"role"];

  UISceneActivationState v10 = [(UIScene *)self activationState];
  if ((unint64_t)v10 > UISceneActivationStateBackground) {
    long long v11 = @"UISceneActivationStateUnattached";
  }
  else {
    long long v11 = off_1E52DAEA8[v10];
  }
  [v8 appendString:v11 withName:@"activationState"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke;
  v18[3] = &unk_1E52DAD98;
  id v12 = v8;
  char v22 = has_internal_diagnostics;
  id v19 = v12;
  long long v20 = self;
  char v21 = v7;
  BOOL v23 = v6;
  id v13 = v7;
  id v14 = (id)[v12 modifyBody:v18];
  double v15 = v21;
  id v16 = v12;

  return v16;
}

void __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  int v3 = [v2 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v7[3] = &unk_1E52DAD98;
  char v11 = *(unsigned char *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v6 = *(void **)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  char v12 = *(unsigned char *)(a1 + 57);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v7];
}

void __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    int v2 = *(void **)(a1 + 32);
    int v3 = [v2 activeMultilinePrefix];
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    char v48 = __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    id v49 = &unk_1E52D9F98;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v50 = v4;
    uint64_t v51 = v5;
    [v2 appendBodySectionWithName:@"flags" multilinePrefix:v3 block:&v46];

    BOOL v6 = [*(id *)(a1 + 40) _FBSScene];
    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) _FBSScene];
    if (v8)
    {
      uint64_t v9 = NSString;
      id v10 = (objc_class *)objc_opt_class();
      char v11 = NSStringFromClass(v10);
      char v12 = [v9 stringWithFormat:@"<%@: %p>", v11, v8, v46, v47, v48, v49];
    }
    else
    {
      char v12 = @"(nil)";
    }
    id v13 = (id)[v7 appendObject:v12 withName:@"fbsScene"];

    id v14 = *(void **)(a1 + 32);
    double v15 = [v6 identifier];
    [v14 appendString:v15 withName:@"fbsScene.identifier"];

    if ([*(id *)(a1 + 40) _hasSettingsScene])
    {
      id v16 = *(void **)(a1 + 32);
      double v17 = [*(id *)(a1 + 40) _settingsScene];
      if (v17)
      {
        CGRect v18 = NSString;
        id v19 = (objc_class *)objc_opt_class();
        long long v20 = NSStringFromClass(v19);
        char v21 = [v18 stringWithFormat:@"<%@: %p>", v20, v17];
      }
      else
      {
        char v21 = @"(nil)";
      }
      id v22 = (id)[v16 appendObject:v21 withName:@"settingsScene"];
    }
    id v23 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 240) withName:@"remoteContentRegistry" skipIfNil:1];
  }
  id v24 = [*(id *)(a1 + 32) activeMultilinePrefix];
  id v25 = *(id *)(a1 + 48);
  uint64_t v26 = [MEMORY[0x1E4F4F718] builderWithObject:v25];
  [v26 setActiveMultilinePrefix:v24];
  uint64_t v27 = [v25 persistentIdentifier];
  [v26 appendString:v27 withName:@"persistentIdentifier"];

  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = ___UISceneSessionDescriptionWithMultilinePrefix_block_invoke;
  v52[3] = &unk_1E52D9F98;
  id v53 = v26;
  id v54 = v25;
  id v28 = v26;
  id v29 = v25;
  id v30 = (id)[v28 modifyBody:v52];
  uint64_t v31 = [v28 build];

  id v32 = (id)[*(id *)(a1 + 32) appendObject:v31 withName:@"session"];
  uint64_t v33 = *(void **)(a1 + 32);
  long long v34 = [*(id *)(a1 + 40) delegate];
  if (v34)
  {
    long long v35 = NSString;
    long long v36 = (objc_class *)objc_opt_class();
    long long v37 = NSStringFromClass(v36);
    long long v38 = [v35 stringWithFormat:@"<%@: %p>", v37, v34];
  }
  else
  {
    long long v38 = @"(nil)";
  }
  id v39 = (id)[v33 appendObject:v38 withName:@"delegate"];

  [*(id *)(a1 + 40) _addSubclassDebugDescriptionWithBuilder:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 57))
  {
    id v40 = *(id *)(a1 + 40);
    long long v41 = *(void **)(a1 + 32);
    long long v42 = [v40 _screen];
    id v43 = (id)[v41 appendObject:v42 withName:@"screen"];

    if (*(unsigned char *)(a1 + 56)) {
      [v40 _allWindows];
    }
    else {
    long long v44 = [v40 _windows];
    }
    long long v45 = [v44 sortedArrayUsingFunction:_UIWindowCompareWindowsUsingLevel context:0];

    [*(id *)(a1 + 32) appendArraySection:v45 withName:@"windows" skipIfEmpty:1];
  }
}

uint64_t __49__UIScene_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:(*(_DWORD *)(*(void *)(a1 + 40) + 216) >> 8) & 1 withName:@"isInternal"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:(*(_DWORD *)(*(void *)(a1 + 40) + 216) >> 15) & 1 withName:@"hasInvalidated"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:(*(_DWORD *)(*(void *)(a1 + 40) + 216) >> 22) & 1 withName:@"isSystemKeyboardFocused"];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  return [v5 _addSubclassFlagsToDebugDescriptionWithBuilder:v6];
}

- (NSArray)_sceneBSActionResponders
{
  return self->_flattenedBSActionResponders;
}

- (void)_addInheritingScene:(id)a3
{
}

- (void)_removeInheritingScene:(id)a3
{
  id v6 = a3;
  inheritingScenes = self->_inheritingScenes;
  if ([(NSPointerArray *)inheritingScenes count])
  {
    uint64_t v5 = 0;
    while ([(NSPointerArray *)inheritingScenes pointerAtIndex:v5] != v6)
    {
      if (++v5 >= [(NSPointerArray *)inheritingScenes count]) {
        goto LABEL_8;
      }
    }
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSPointerArray *)inheritingScenes removePointerAtIndex:v5];
    }
  }
LABEL_8:
}

- (NSNumber)_cachedInterfaceOrientation
{
  return self->__cachedInterfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedInterfaceOrientation, 0);
  objc_storeStrong((id *)&self->_childRemoteContentRegistry, 0);
  objc_storeStrong((id *)&self->_heldSceneEventResponseBlocks, 0);
  objc_storeStrong((id *)&self->_oldSettings, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_inheritingScenes, 0);
  objc_destroyWeak((id *)&self->_settingsScene);
  objc_storeStrong((id *)&self->_postSettingsUpdateResponseBlocks, 0);
  objc_storeStrong((id *)&self->_overrideSettings, 0);
  objc_storeStrong((id *)&self->_lifecycleMonitor, 0);
  objc_storeStrong((id *)&self->_registeredComponents, 0);
  objc_storeStrong((id *)&self->_flattenedBSActionSubstitutionProvidersByActionType, 0);
  objc_storeStrong((id *)&self->_flattenedBSActionResponders, 0);
  objc_storeStrong((id *)&self->_additionalBSActionResponders, 0);
  objc_storeStrong((id *)&self->_flattenedDiffActions, 0);
  objc_storeStrong((id *)&self->_additionalSettingsDiffActions, 0);
  objc_storeStrong((id *)&self->_finalSceneBSActionHandlers, 0);
  objc_storeStrong((id *)&self->_initialSceneBSActionHandlers, 0);
  objc_storeStrong((id *)&self->_finalSettingsDiffActions, 0);
  objc_storeStrong((id *)&self->_initialSettingsDiffActions, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_activationConditions, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (id)_eventDeferringComponent
{
  id v2 = [(UIScene *)self _FBSScene];
  uint64_t v3 = objc_opt_class();
  id v4 = [v2 componentForExtension:v3 ofClass:objc_opt_class()];

  return v4;
}

- (void)_getDefaultAudioSessionFromMainThreadWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIScene *)self _sceneComponentForKey:@"_MRUIAudioSessionSceneComponentKey"];
  id v6 = dispatch_get_global_queue(25, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__UIScene_AVAudioSession___getDefaultAudioSessionFromMainThreadWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E52DB330;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, v9);
}

void __86__UIScene_AVAudioSession___getDefaultAudioSessionFromMainThreadWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  if (v2 && (SEL v3 = NSSelectorFromString(&cfstr_Defaultaudiose.isa), (objc_opt_respondsToSelector() & 1) != 0))
  {
    id v4 = [v2 performSelector:v3];
  }
  else
  {
    id v4 = 0;
  }

  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
}

- (void)getDefaultAudioSessionWithCompletionHandler:(void *)handler
{
  id v4 = handler;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(UIScene *)self _getDefaultAudioSessionFromMainThreadWithCompletionHandler:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__UIScene_AVAudioSession__getDefaultAudioSessionWithCompletionHandler___block_invoke;
    block[3] = &unk_1E52E95A0;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __71__UIScene_AVAudioSession__getDefaultAudioSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _getDefaultAudioSessionFromMainThreadWithCompletionHandler:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (UIPointerLockState)pointerLockState
{
  if (_UIPointerLockStateIsAvailableForScene(self))
  {
    id v3 = [(UIScene *)self _sceneComponentForKey:@"_UIPointerLockStateSceneComponentKey"];
    if (!v3)
    {
      id v3 = [[UIPointerLockState alloc] initWithScene:self];
      [(UIScene *)self _registerSceneComponent:v3 forKey:@"_UIPointerLockStateSceneComponentKey"];
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (_UIKeyWindowSceneObserver)_keyWindowSceneObserver
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = _UIKeyWindowSceneObserverForScene(self);
  }
  else
  {
    id v3 = 0;
  }
  return (_UIKeyWindowSceneObserver *)v3;
}

- (_UIRenderingEnvironmentSceneComponent)_renderingEnvironmentSceneComponentRegisteringIfNecessary:(void *)a1
{
  if (a1)
  {
    id v4 = [a1 _sceneComponentForKey:_UIRenderingEnvironmentSceneComponentKey];
    if (v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = a2 == 0;
    }
    if (!v5)
    {
      id v4 = [[_UIRenderingEnvironmentSceneComponent alloc] initWithScene:a1];
      [a1 _registerSceneComponent:v4 forKey:_UIRenderingEnvironmentSceneComponentKey];
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (int64_t)_UIO_sceneType
{
  return 0;
}

- (id)_carPlaySceneComponent
{
  return [(UIScene *)self _sceneComponentForKey:_UICarPlaySceneComponentKey];
}

- (id)systemShellHostingEnvironment
{
  id v2 = [(UIScene *)self _FBSScene];
  uint64_t v3 = objc_opt_class();
  id v4 = [v2 componentForExtension:v3 ofClass:objc_opt_class()];

  return v4;
}

- (id)renderingEnvironment
{
  id v2 = [(UIScene *)self _FBSScene];
  uint64_t v3 = [v2 renderingEnvironment];

  return v3;
}

- (void)_extendStateRestoration
{
  id v4 = _extendStateRestorationQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__UIScene__UISceneEnhancedStateRestoration_Private___extendStateRestoration__block_invoke;
  v5[3] = &unk_1E52D9CD0;
  v5[4] = self;
  v5[5] = a2;
  dispatch_sync(v4, v5);
}

void __76__UIScene__UISceneEnhancedStateRestoration_Private___extendStateRestoration__block_invoke(uint64_t a1)
{
  id v2 = (void *)_sceneToCount;
  if (!_sceneToCount)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v4 = (void *)_sceneToCount;
    _sceneToCount = v3;

    id v2 = (void *)_sceneToCount;
  }
  BOOL v5 = [v2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v6 = [v5 integerValue];

  id v7 = (void *)_sceneToCount;
  id v8 = [NSNumber numberWithInteger:v6 + 1];
  [v7 setObject:v8 forKey:*(void *)(a1 + 32)];

  if (!v6)
  {
    kdebug_trace();
    id v10 = +[_UICanvasUserActivityManager _userActivityManagerForScene:*(void *)(a1 + 32)];
    if ([v10 _initialRestorationIsFinished])
    {
      if ([v10 _initialRestorationIsFinished])
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_UISceneEnhancedStateRestoration.m" lineNumber:50 description:@"Attempt to extend state restoration made after restoration is finalized."];
      }
    }
    else
    {
      [*(id *)(a1 + 32) _setShouldHoldSceneEventResponses:1];
    }
  }
}

- (void)_completeStateRestoration
{
  id v4 = _extendStateRestorationQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__UIScene__UISceneEnhancedStateRestoration_Private___completeStateRestoration__block_invoke;
  v5[3] = &unk_1E52D9CD0;
  v5[4] = self;
  v5[5] = a2;
  dispatch_sync(v4, v5);
}

void __78__UIScene__UISceneEnhancedStateRestoration_Private___completeStateRestoration__block_invoke(uint64_t a1)
{
  id v2 = [(id)_sceneToCount objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 integerValue];

  if (v3 <= 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_UISceneEnhancedStateRestoration.m" lineNumber:61 description:@"UIScene._completeStateRestoration called without corresponding call toUIScene._extendStateRestoration"];

    goto LABEL_3;
  }
  if (v3 != 1)
  {
LABEL_3:
    id v4 = (void *)_sceneToCount;
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v7 forKey:*(void *)(a1 + 32)];

    return;
  }
  [(id)_sceneToCount removeObjectForKey:*(void *)(a1 + 32)];
  if (![(id)_sceneToCount count])
  {
    BOOL v5 = (void *)_sceneToCount;
    _sceneToCount = 0;
  }
  [*(id *)(a1 + 32) _setShouldHoldSceneEventResponses:0];
  kdebug_trace();
}

@end