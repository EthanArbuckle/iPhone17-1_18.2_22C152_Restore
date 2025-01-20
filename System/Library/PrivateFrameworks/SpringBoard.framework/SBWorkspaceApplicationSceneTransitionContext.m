@interface SBWorkspaceApplicationSceneTransitionContext
- (BKSAnimationFenceHandle)animationFence;
- (BOOL)_alreadyPopulatedRequestedWorkspaceEntities;
- (BOOL)alwaysRunsWatchdog;
- (BOOL)disablesAutoPIP;
- (BOOL)fencesAnimations;
- (BOOL)isBackground;
- (BOOL)isInLiveResize;
- (BOOL)isSceneless;
- (BOOL)needsToSendActivationResult;
- (BOOL)prefersCenterZoomTransition;
- (BOOL)prefersCrossfadeTransition;
- (BOOL)prefersTouchCancellationDisabled;
- (BOOL)preventSwitcherRecencyModelUpdates;
- (BOOL)retainsSiri;
- (BOOL)waitsForSceneUpdates;
- (CGRect)frameForApplicationSceneEntity:(id)a3;
- (FBSDisplayIdentity)displayIdentity;
- (NSArray)entitiesWithRemovalContexts;
- (NSDictionary)requestedEntityIdentifierToLayoutAttributes;
- (NSSet)applicationSceneEntities;
- (NSSet)previousApplicationSceneEntities;
- (NSString)requestedAppExposeBundleID;
- (SBConsumableTokenWrapper)preludeAnimationTokenWrapper;
- (SBLayoutState)layoutState;
- (SBLayoutState)previousLayoutState;
- (SBWorkspaceApplicationSceneTransitionContext)init;
- (SBWorkspaceApplicationSceneTransitionContextDelegate)delegate;
- (SBWorkspaceEntity)activatingEntity;
- (SBWorkspaceEntity)deactivatingEntity;
- (SBWorkspaceEntity)requestedActivatingWorkspaceEntity;
- (SBWorkspaceEntity)resolvedActivatingWorkspaceEntity;
- (double)watchdogScaleFactor;
- (id)_displayConfiguration;
- (id)appClipPlaceholderEntities;
- (id)appClipPlaceholderEntityForBundleID:(id)a3;
- (id)applicationSceneEntityForBundleID:(id)a3;
- (id)applicationSceneEntityForLayoutRole:(int64_t)a3;
- (id)compactDescriptionBuilderWithMultilinePrefix:(id)a3;
- (id)entityForLayoutRole:(int64_t)a3;
- (id)previousAppClipPlaceholderEntities;
- (id)previousAppClipPlaceholderEntityForBundleID:(id)a3;
- (id)previousApplicationSceneEntityForBundleID:(id)a3;
- (id)previousApplicationSceneEntityForLayoutRole:(int64_t)a3;
- (id)previousEntityForLayoutRole:(int64_t)a3;
- (id)removalContextForEntity:(id)a3;
- (id)requestedLayoutAttributesForEntity:(id)a3;
- (id)requestedWorkspaceEntityForLayoutRole:(int64_t)a3;
- (id)resultBlock;
- (id)succinctDescriptionBuilder;
- (int64_t)_lockedInterfaceOrientation;
- (int64_t)interfaceOrientation;
- (int64_t)interfaceOrientationOrPreferredOrientation;
- (int64_t)isTransitioningToLessRecentSpace;
- (int64_t)preferredInterfaceOrientation;
- (int64_t)requestedCenterConfiguration;
- (int64_t)requestedCenterEntityModal;
- (int64_t)requestedFloatingConfiguration;
- (int64_t)requestedFloatingSwitcherVisible;
- (int64_t)requestedPeekConfiguration;
- (int64_t)requestedSpaceConfiguration;
- (int64_t)requestedUnlockedEnvironmentMode;
- (int64_t)requestedWindowPickerRole;
- (void)_setAlreadyPopulatedRequestedWorkspaceEntities:(BOOL)a3;
- (void)_setRequestedActivatingWorkspaceEntity:(id)a3;
- (void)_setRequestedFrontmostEntity:(id)a3;
- (void)_setRequestedWorkspaceEntity:(id)a3 forLayoutRole:(int64_t)a4;
- (void)dealloc;
- (void)finalize;
- (void)sendActivationResultError:(id)a3;
- (void)setActivatingEntity:(id)a3;
- (void)setAlwaysRunsWatchdog:(BOOL)a3;
- (void)setAnimationFence:(id)a3;
- (void)setBackground:(BOOL)a3;
- (void)setDeactivatingEntity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisablesAutoPIP:(BOOL)a3;
- (void)setEntities:(id)a3 startingAtLayoutRole:(int64_t)a4 withPolicy:(int64_t)a5 centerEntity:(id)a6 floatingEntity:(id)a7;
- (void)setEntities:(id)a3 withPolicy:(int64_t)a4 centerEntity:(id)a5 floatingEntity:(id)a6;
- (void)setEntitiesWithRemovalContexts:(id)a3;
- (void)setEntity:(id)a3 forLayoutRole:(int64_t)a4;
- (void)setFencesAnimations:(BOOL)a3;
- (void)setInLiveResize:(BOOL)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setPreferredInterfaceOrientation:(int64_t)a3;
- (void)setPrefersCenterZoomTransition:(BOOL)a3;
- (void)setPrefersCrossfadeTransition:(BOOL)a3;
- (void)setPrefersTouchCancellationDisabled:(BOOL)a3;
- (void)setPreludeAnimationTokenWrapper:(id)a3;
- (void)setPreventSwitcherRecencyModelUpdates:(BOOL)a3;
- (void)setPreviousEntity:(id)a3 forLayoutRole:(int64_t)a4;
- (void)setRemovalContext:(id)a3 forEntity:(id)a4;
- (void)setRequestedAppExposeBundleID:(id)a3;
- (void)setRequestedCenterConfiguration:(int64_t)a3;
- (void)setRequestedCenterEntityModal:(int64_t)a3;
- (void)setRequestedEntityIdentifierToLayoutAttributes:(id)a3;
- (void)setRequestedFloatingConfiguration:(int64_t)a3;
- (void)setRequestedFloatingSwitcherVisible:(int64_t)a3;
- (void)setRequestedLayoutAttributes:(id)a3 forEntity:(id)a4;
- (void)setRequestedPeekConfiguration:(int64_t)a3;
- (void)setRequestedSpaceConfiguration:(int64_t)a3;
- (void)setRequestedUnlockedEnvironmentMode:(int64_t)a3;
- (void)setRequestedWindowPickerRole:(int64_t)a3;
- (void)setResultBlock:(id)a3;
- (void)setRetainsSiri:(BOOL)a3;
- (void)setSceneless:(BOOL)a3;
- (void)setTransitioningToLessRecentSpace:(int64_t)a3;
- (void)setWaitsForSceneUpdates:(BOOL)a3;
@end

@implementation SBWorkspaceApplicationSceneTransitionContext

uint64_t __72__SBWorkspaceApplicationSceneTransitionContext_applicationSceneEntities__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isApplicationSceneEntity];
}

- (void)_setRequestedWorkspaceEntity:(id)a3 forLayoutRole:(int64_t)a4
{
  requestedWorkspaceEntityForLayoutRoleMutableDictionary = self->_requestedWorkspaceEntityForLayoutRoleMutableDictionary;
  id v6 = a3;
  SBLayoutRoleIdentifierForRole(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)requestedWorkspaceEntityForLayoutRoleMutableDictionary setObject:v6 forKeyedSubscript:v7];
}

- (void)setPreviousEntity:(id)a3 forLayoutRole:(int64_t)a4
{
  id v10 = a3;
  id v7 = SBLayoutRoleIdentifierForRole(a4);
  [(SBWorkspaceTransitionContext *)self setPreviousEntity:v10 forKey:v7];
  id v8 = [(SBWorkspaceTransitionContext *)self previousEntityForKey:v7];
  if (v8)
  {
    if (v8 == v10)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SBWorkspaceApplicationSceneTransitionContext.m" lineNumber:233 description:@"this entity is supposed to be a copy"];
    }
    [v8 setLayoutRole:a4];
    if ([v8 isApplicationSceneEntity]) {
      [v8 clearProcessSettings];
    }
  }
}

- (id)previousEntityForLayoutRole:(int64_t)a3
{
  v4 = SBLayoutRoleIdentifierForRole(a3);
  v5 = [(SBWorkspaceTransitionContext *)self previousEntityForKey:v4];

  return v5;
}

- (id)entityForLayoutRole:(int64_t)a3
{
  v4 = SBLayoutRoleIdentifierForRole(a3);
  v5 = [(SBWorkspaceTransitionContext *)self entityForKey:v4];

  return v5;
}

uint64_t __80__SBWorkspaceApplicationSceneTransitionContext_previousApplicationSceneEntities__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isApplicationSceneEntity];
}

- (SBWorkspaceEntity)activatingEntity
{
  return (SBWorkspaceEntity *)[(SBWorkspaceTransitionContext *)self entityForKey:@"activating"];
}

- (BOOL)prefersCrossfadeTransition
{
  return self->_prefersCrossfadeTransition;
}

- (BOOL)prefersCenterZoomTransition
{
  return self->_prefersCenterZoomTransition;
}

- (int64_t)isTransitioningToLessRecentSpace
{
  return self->_transitioningToLessRecentSpace;
}

- (SBConsumableTokenWrapper)preludeAnimationTokenWrapper
{
  return self->_preludeAnimationTokenWrapper;
}

- (SBLayoutState)layoutState
{
  layoutState = self->_layoutState;
  if (!layoutState)
  {
    v4 = [(SBWorkspaceApplicationSceneTransitionContext *)self delegate];
    v5 = [v4 layoutStateForApplicationTransitionContext:self];
    id v6 = self->_layoutState;
    self->_layoutState = v5;

    layoutState = self->_layoutState;
  }
  return layoutState;
}

- (SBLayoutState)previousLayoutState
{
  previousLayoutState = self->_previousLayoutState;
  if (!previousLayoutState)
  {
    v4 = [(SBWorkspaceApplicationSceneTransitionContext *)self delegate];
    v5 = [v4 previousLayoutStateForApplicationTransitionContext:self];
    id v6 = self->_previousLayoutState;
    self->_previousLayoutState = v5;

    previousLayoutState = self->_previousLayoutState;
  }
  return previousLayoutState;
}

- (SBWorkspaceApplicationSceneTransitionContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    id v5 = [(SBWorkspaceTransitionContext *)self request];
  }
  id v6 = v5;

  return (SBWorkspaceApplicationSceneTransitionContextDelegate *)v6;
}

- (id)previousApplicationSceneEntityForLayoutRole:(int64_t)a3
{
  v3 = [(SBWorkspaceApplicationSceneTransitionContext *)self previousEntityForLayoutRole:a3];
  if ([v3 isApplicationSceneEntity]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)applicationSceneEntityForBundleID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(SBWorkspaceApplicationSceneTransitionContext *)self applicationSceneEntities];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 application];
        v11 = [v10 bundleIdentifier];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSSet)applicationSceneEntities
{
  v2 = [(SBWorkspaceTransitionContext *)self entities];
  v3 = [v2 objectsPassingTest:&__block_literal_global_170];

  return (NSSet *)v3;
}

- (NSSet)previousApplicationSceneEntities
{
  v2 = [(SBWorkspaceTransitionContext *)self previousEntities];
  v3 = [v2 objectsPassingTest:&__block_literal_global_42];

  return (NSSet *)v3;
}

- (SBWorkspaceEntity)requestedActivatingWorkspaceEntity
{
  return (SBWorkspaceEntity *)[(NSMutableDictionary *)self->_requestedWorkspaceEntityForLayoutRoleMutableDictionary objectForKeyedSubscript:@"activating"];
}

- (BOOL)needsToSendActivationResult
{
  return !self->_sentActivationResult && self->_resultBlock != 0;
}

- (int64_t)interfaceOrientationOrPreferredOrientation
{
  int64_t result = [(SBWorkspaceApplicationSceneTransitionContext *)self interfaceOrientation];
  if (!result)
  {
    return [(SBWorkspaceApplicationSceneTransitionContext *)self preferredInterfaceOrientation];
  }
  return result;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setEntity:(id)a3 forLayoutRole:(int64_t)a4
{
  id v10 = a3;
  uint64_t v6 = SBLayoutRoleIdentifierForRole(a4);
  id v7 = v10;
  id v8 = (void *)v6;
  if (v10)
  {
    [v10 setLayoutRole:a4];
    id v9 = [(SBWorkspaceApplicationSceneTransitionContext *)self activatingEntity];

    id v7 = v10;
    if (v9 == v10)
    {
      [(SBWorkspaceApplicationSceneTransitionContext *)self setActivatingEntity:0];
      id v7 = v10;
    }
  }
  [(SBWorkspaceTransitionContext *)self setEntity:v7 forKey:v8];
}

- (int64_t)requestedUnlockedEnvironmentMode
{
  return self->_requestedUnlockedEnvironmentMode;
}

- (void)setActivatingEntity:(id)a3
{
}

- (BOOL)waitsForSceneUpdates
{
  return self->_waitsForSceneUpdates;
}

- (NSString)requestedAppExposeBundleID
{
  return self->_requestedAppExposeBundleID;
}

- (void)setRetainsSiri:(BOOL)a3
{
  self->_retainsSiri = a3;
}

- (int64_t)requestedPeekConfiguration
{
  return self->_requestedPeekConfiguration;
}

- (int64_t)requestedFloatingSwitcherVisible
{
  return self->_requestedFloatingSwitcherVisible;
}

- (int64_t)requestedFloatingConfiguration
{
  return self->_requestedFloatingConfiguration;
}

- (NSDictionary)requestedEntityIdentifierToLayoutAttributes
{
  v2 = (void *)[(NSMutableDictionary *)self->_requestedEntityIdentifierToLayoutAttributes copy];
  return (NSDictionary *)v2;
}

- (int64_t)requestedCenterEntityModal
{
  return self->_requestedCenterEntityModal;
}

- (int64_t)requestedCenterConfiguration
{
  return self->_requestedCenterConfiguration;
}

- (BOOL)retainsSiri
{
  return self->_retainsSiri;
}

- (int64_t)preferredInterfaceOrientation
{
  return self->_preferredInterfaceOrientation;
}

- (NSArray)entitiesWithRemovalContexts
{
  v2 = [(NSMapTable *)self->_entityToRemovalContext keyEnumerator];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (BOOL)disablesAutoPIP
{
  return self->_disablesAutoPIP;
}

- (void)setWaitsForSceneUpdates:(BOOL)a3
{
  self->_waitsForSceneUpdates = a3;
}

- (void)setPrefersCrossfadeTransition:(BOOL)a3
{
  self->_prefersCrossfadeTransition = a3;
}

- (void)setPrefersCenterZoomTransition:(BOOL)a3
{
  self->_prefersCenterZoomTransition = a3;
}

- (void)setTransitioningToLessRecentSpace:(int64_t)a3
{
  self->_transitioningToLessRecentSpace = a3;
}

- (void)setRequestedUnlockedEnvironmentMode:(int64_t)a3
{
  if (self->_requestedUnlockedEnvironmentMode != a3) {
    self->_requestedUnlockedEnvironmentMode = a3;
  }
}

- (void)setRequestedPeekConfiguration:(int64_t)a3
{
  self->_requestedPeekConfiguration = a3;
}

- (void)setRequestedFloatingSwitcherVisible:(int64_t)a3
{
  if (self->_requestedFloatingSwitcherVisible != a3) {
    self->_requestedFloatingSwitcherVisible = a3;
  }
}

- (void)setRequestedFloatingConfiguration:(int64_t)a3
{
  if (self->_requestedFloatingConfiguration != a3) {
    self->_requestedFloatingConfiguration = a3;
  }
}

- (void)setRequestedCenterEntityModal:(int64_t)a3
{
  self->_requestedCenterEntityModal = a3;
}

- (void)setRequestedCenterConfiguration:(int64_t)a3
{
  if (self->_requestedCenterConfiguration != a3) {
    self->_requestedCenterConfiguration = a3;
  }
}

- (void)setRequestedAppExposeBundleID:(id)a3
{
  if (self->_requestedAppExposeBundleID != a3)
  {
    id v4 = (NSString *)[a3 copy];
    requestedAppExposeBundleID = self->_requestedAppExposeBundleID;
    self->_requestedAppExposeBundleID = v4;
  }
}

- (void)setPreferredInterfaceOrientation:(int64_t)a3
{
  self->_preferredInterfaceOrientation = a3;
}

- (void)setDisablesAutoPIP:(BOOL)a3
{
  self->_disablesAutoPIP = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)finalize
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBWorkspaceApplicationSceneTransitionContext *)self delegate];

  if (!v4)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBWorkspaceApplicationSceneTransitionContext.m" lineNumber:576 description:@"we have no delegate"];
  }
  if (![(SBWorkspaceTransitionContext *)self isFinalized])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [(SBWorkspaceApplicationSceneTransitionContext *)self applicationSceneEntities];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v9++) translateActivationSettingsToActions];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    id v10 = [(SBWorkspaceApplicationSceneTransitionContext *)self activatingEntity];
    v11 = [v10 applicationSceneEntity];

    if (v11) {
      [(SBWorkspaceApplicationSceneTransitionContext *)self _setRequestedFrontmostEntity:v11];
    }
    previousLayoutState = self->_previousLayoutState;
    self->_previousLayoutState = 0;

    layoutState = self->_layoutState;
    self->_layoutState = 0;

    id v14 = [(SBWorkspaceApplicationSceneTransitionContext *)self previousLayoutState];
    id v15 = [(SBWorkspaceApplicationSceneTransitionContext *)self layoutState];
  }
  v17.receiver = self;
  v17.super_class = (Class)SBWorkspaceApplicationSceneTransitionContext;
  [(SBWorkspaceTransitionContext *)&v17 finalize];
}

- (void)setRequestedEntityIdentifierToLayoutAttributes:(id)a3
{
  int v12 = (NSMutableDictionary *)a3;
  if ([(SBWorkspaceTransitionContext *)self isFinalized])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"SBWorkspaceApplicationSceneTransitionContext.m", 254, @"%@ already finalized!", v11 object file lineNumber description];
  }
  id v5 = v12;
  if (self->_requestedEntityIdentifierToLayoutAttributes != v12)
  {
    uint64_t v6 = v12;
    if (!v12) {
      uint64_t v6 = (NSMutableDictionary *)MEMORY[0x1E4F1CC08];
    }
    uint64_t v7 = (NSMutableDictionary *)[(NSMutableDictionary *)v6 mutableCopy];
    requestedEntityIdentifierToLayoutAttributes = self->_requestedEntityIdentifierToLayoutAttributes;
    self->_requestedEntityIdentifierToLayoutAttributes = v7;

    id v5 = v12;
  }
}

- (id)applicationSceneEntityForLayoutRole:(int64_t)a3
{
  v3 = [(SBWorkspaceApplicationSceneTransitionContext *)self entityForLayoutRole:a3];
  if ([v3 isApplicationSceneEntity]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isInLiveResize
{
  return self->_inLiveResize;
}

- (SBWorkspaceEntity)resolvedActivatingWorkspaceEntity
{
  v3 = [(SBWorkspaceApplicationSceneTransitionContext *)self activatingEntity];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(SBWorkspaceApplicationSceneTransitionContext *)self entityForLayoutRole:1];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(SBWorkspaceApplicationSceneTransitionContext *)self entityForLayoutRole:2];
    }
    id v5 = v8;
  }
  return (SBWorkspaceEntity *)v5;
}

- (void)sendActivationResultError:(id)a3
{
  id v4 = a3;
  if (!self->_sentActivationResult)
  {
    self->_sentActivationResult = 1;
    resultBlock = (void (**)(void))self->_resultBlock;
    if (resultBlock)
    {
      id v7 = v4;
      resultBlock[2]();
      id v6 = self->_resultBlock;
      self->_resultBlock = 0;

      id v4 = v7;
    }
  }
}

- (id)succinctDescriptionBuilder
{
  v24.receiver = self;
  v24.super_class = (Class)SBWorkspaceApplicationSceneTransitionContext;
  v3 = [(SBWorkspaceTransitionContext *)&v24 succinctDescriptionBuilder];
  id v4 = (id)[v3 appendBool:self->_background withName:@"background"];
  id v5 = (id)[v3 appendBool:self->_fencesAnimations withName:@"fenceAnimations" ifEqualTo:1];
  id v6 = (id)[v3 appendBool:self->_inLiveResize withName:@"isInLiveResize" ifEqualTo:1];
  id v7 = (id)[v3 appendBool:self->_alwaysRunsWatchdog withName:@"alwaysWatchdog" ifEqualTo:1];
  id v8 = (id)[v3 appendBool:self->_waitsForSceneUpdates withName:@"waitForScenes"];
  uint64_t v9 = [(SBWorkspaceApplicationSceneTransitionContext *)self displayIdentity];
  id v10 = (id)[v3 appendObject:v9 withName:@"display"];

  if ([(SBWorkspaceApplicationSceneTransitionContext *)self interfaceOrientation])
  {
    v11 = objc_msgSend(MEMORY[0x1E4F42738], "stringForInterfaceOrientation:", -[SBWorkspaceApplicationSceneTransitionContext interfaceOrientation](self, "interfaceOrientation"));
    id v12 = (id)[v3 appendObject:v11 withName:@"interfaceOrientation"];
  }
  if ([(SBWorkspaceApplicationSceneTransitionContext *)self requestedUnlockedEnvironmentMode])
  {
    v13 = SBStringForUnlockedEnvironmentMode([(SBWorkspaceApplicationSceneTransitionContext *)self requestedUnlockedEnvironmentMode]);
    id v14 = (id)[v3 appendObject:v13 withName:@"unlockedEnvironmentMode"];
  }
  id v15 = [(SBWorkspaceApplicationSceneTransitionContext *)self requestedAppExposeBundleID];

  if (v15)
  {
    long long v16 = [(SBWorkspaceApplicationSceneTransitionContext *)self requestedAppExposeBundleID];
    id v17 = (id)[v3 appendObject:v16 withName:@"appExposeBundleID"];
  }
  id v18 = (id)[v3 appendObject:self->_layoutState withName:@"layoutState"];
  id v19 = (id)[v3 appendObject:self->_previousLayoutState withName:@"previousLayoutState"];
  long long v20 = [(SBWorkspaceApplicationSceneTransitionContext *)self delegate];
  if (v20)
  {
    long long v21 = [MEMORY[0x1E4F4F718] descriptionForObject:v20];
    id v22 = (id)[v3 appendObject:v21 withName:@"delegate"];
  }
  return v3;
}

- (FBSDisplayIdentity)displayIdentity
{
  id v4 = [(SBWorkspaceTransitionContext *)self request];
  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBWorkspaceApplicationSceneTransitionContext.m", 105, @"no valid transitionRequest to query for display -> %@", self object file lineNumber description];
  }
  id v5 = [v4 displayIdentity];

  return (FBSDisplayIdentity *)v5;
}

- (BOOL)isBackground
{
  return self->_background;
}

- (void)setResultBlock:(id)a3
{
}

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

- (void)_setRequestedActivatingWorkspaceEntity:(id)a3
{
}

- (void)_setAlreadyPopulatedRequestedWorkspaceEntities:(BOOL)a3
{
  self->__alreadyPopulatedRequestedWorkspaceEntities = a3;
}

- (BOOL)_alreadyPopulatedRequestedWorkspaceEntities
{
  return self->__alreadyPopulatedRequestedWorkspaceEntities;
}

- (SBWorkspaceApplicationSceneTransitionContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBWorkspaceApplicationSceneTransitionContext;
  v2 = [(SBWorkspaceTransitionContext *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_fencesAnimations = 0;
    v2->_inLiveResize = 0;
    v2->_alwaysRunsWatchdog = 0;
    v2->_waitsForSceneUpdates = 1;
    v2->_sceneless = 0;
    v2->_requestedSpaceConfiguration = 0;
    v2->_requestedFloatingConfiguration = 0;
    v2->_requestedCenterConfiguration = 0;
    v2->_requestedUnlockedEnvironmentMode = 0;
    v2->_requestedFloatingSwitcherVisible = 0x7FFFFFFFFFFFFFFFLL;
    v2->_requestedCenterEntityModal = 0x7FFFFFFFFFFFFFFFLL;
    v2->_transitioningToLessRecentSpace = 0x7FFFFFFFFFFFFFFFLL;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestedWorkspaceEntityForLayoutRoleMutableDictionary = v3->_requestedWorkspaceEntityForLayoutRoleMutableDictionary;
    v3->_requestedWorkspaceEntityForLayoutRoleMutableDictionary = v4;
  }
  return v3;
}

- (void)dealloc
{
  id v4 = [(SBConsumableTokenWrapper *)self->_preludeAnimationTokenWrapper consumeToken];
  [v4 cancel];
  if (self->_resultBlock)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBWorkspaceApplicationSceneTransitionContext.m" lineNumber:88 description:@"request deallocated without executing result block"];
  }
  v6.receiver = self;
  v6.super_class = (Class)SBWorkspaceApplicationSceneTransitionContext;
  [(SBWorkspaceApplicationSceneTransitionContext *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitiesWithRemovalContexts, 0);
  objc_storeStrong((id *)&self->_requestedAppExposeBundleID, 0);
  objc_storeStrong((id *)&self->_deactivatingEntity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationFence, 0);
  objc_storeStrong((id *)&self->_preludeAnimationTokenWrapper, 0);
  objc_storeStrong((id *)&self->_entityToRemovalContext, 0);
  objc_storeStrong((id *)&self->_requestedEntityIdentifierToLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_requestedWorkspaceEntityForLayoutRoleMutableDictionary, 0);
  objc_storeStrong((id *)&self->_previousLayoutState, 0);
  objc_storeStrong((id *)&self->_layoutState, 0);
  objc_storeStrong(&self->_resultBlock, 0);
}

- (CGRect)frameForApplicationSceneEntity:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWorkspaceApplicationSceneTransitionContext *)self delegate];
  [v5 applicationTransitionContext:self frameForApplicationSceneEntity:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)removalContextForEntity:(id)a3
{
  return [(NSMapTable *)self->_entityToRemovalContext objectForKey:a3];
}

- (BOOL)preventSwitcherRecencyModelUpdates
{
  return self->_preventSwitcherRecencyModelUpdates;
}

uint64_t __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)compactDescriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBWorkspaceApplicationSceneTransitionContext;
  uint64_t v4 = [(SBWorkspaceTransitionContext *)&v9 compactDescriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendBool:self->_background withName:@"background"];
  if ([(SBWorkspaceApplicationSceneTransitionContext *)self interfaceOrientation])
  {
    double v6 = objc_msgSend(MEMORY[0x1E4F42738], "stringForInterfaceOrientation:", -[SBWorkspaceApplicationSceneTransitionContext interfaceOrientation](self, "interfaceOrientation"));
    id v7 = (id)[v4 appendObject:v6 withName:@"interfaceOrientation"];
  }
  return v4;
}

- (double)watchdogScaleFactor
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(SBWorkspaceApplicationSceneTransitionContext *)self applicationSceneEntities];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v4)
  {

    goto LABEL_11;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v3);
      }
      objc_super v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) application];
      double v10 = [v9 processState];
      int v11 = [v10 isRunning];

      v6 += v11 ^ 1u;
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v5);

  if (v6 <= 1)
  {
LABEL_11:
    double v12 = [(SBWorkspaceTransitionContext *)self request];
    double v13 = [v12 workspace];
    double v14 = [v13 pipCoordinator];
    int v15 = [v14 isAnyPictureInPictureWindowVisible];

    double result = 1.0;
    if (!v15) {
      return result;
    }
  }
  return 2.0;
}

- (BOOL)alwaysRunsWatchdog
{
  return self->_alwaysRunsWatchdog;
}

- (BOOL)fencesAnimations
{
  return self->_fencesAnimations;
}

- (BKSAnimationFenceHandle)animationFence
{
  return self->_animationFence;
}

- (BOOL)isSceneless
{
  return self->_sceneless;
}

- (void)_setRequestedFrontmostEntity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 applicationSceneEntity];
  if (v5)
  {
    v44 = +[SBLayoutElement elementWithDescriptor:v4];
    uint64_t v6 = [v44 uniqueIdentifier];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke;
    v56[3] = &unk_1E6AF4B38;
    id v46 = v6;
    id v57 = v46;
    uint64_t v7 = (void *)MEMORY[0x1D948C7A0](v56);
    double v8 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    objc_super v9 = [v8 _recentAppLayoutsController];

    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_2;
    v54[3] = &unk_1E6B02840;
    id v10 = v7;
    id v55 = v10;
    int v11 = [v9 mostRecentAppLayoutIncludingHiddenAppLayouts:1 passingTest:v54];
    double v12 = [(SBWorkspaceApplicationSceneTransitionContext *)self previousLayoutState];
    uint64_t v13 = objc_opt_class();
    id v14 = v12;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        int v15 = v14;
      }
      else {
        int v15 = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
    id v16 = v15;

    v45 = [v16 elementIdentifiersToLayoutAttributes];

    long long v17 = [(SBWorkspaceApplicationSceneTransitionContext *)self requestedLayoutAttributesForEntity:v4];
    if (v17) {
      goto LABEL_24;
    }
    long long v17 = [v45 objectForKey:v46];
    if (!v17 && v11)
    {
      long long v18 = [(SBWorkspaceApplicationSceneTransitionContext *)self previousLayoutState];
      uint64_t v19 = objc_opt_class();
      id v20 = v18;
      if (v19)
      {
        if (objc_opt_isKindOfClass()) {
          long long v21 = v20;
        }
        else {
          long long v21 = 0;
        }
      }
      else
      {
        long long v21 = 0;
      }
      id v22 = v21;

      if (v22 && (uint64_t v23 = [v22 displayOrdinal], objc_msgSend(v11, "preferredDisplayOrdinal") != v23))
      {
        objc_super v24 = [v11 allItems];
        uint64_t v25 = objc_msgSend(v24, "bs_firstObjectPassingTest:", v10);

        v26 = [v9 bestLastDisplayItemLayoutAttributesMapForAppLayout:v11 displayOrdinal:v23];
        v27 = (void *)v25;
        long long v17 = [v26 objectForKey:v25];
      }
      else
      {
        long long v17 = 0;
      }
    }
    if (!v17 && v11)
    {
      v28 = [v11 allItems];
      v29 = objc_msgSend(v28, "bs_firstObjectPassingTest:", v10);
      long long v17 = [v11 layoutAttributesForItem:v29];
    }
    if (v17)
    {
LABEL_24:
      if (v11)
      {
LABEL_25:
        v30 = v44;
LABEL_40:
        v41 = -[SBDisplayItemLayoutAttributes attributesByModifyingLastInteractionTime:](v17, "attributesByModifyingLastInteractionTime:", [v9 _nextInteractionTime]);

        [(SBWorkspaceApplicationSceneTransitionContext *)self setRequestedLayoutAttributes:v41 forEntity:v4];
        goto LABEL_41;
      }
    }
    else
    {
      long long v17 = objc_alloc_init(SBDisplayItemLayoutAttributes);
      if (v11) {
        goto LABEL_25;
      }
    }
    v31 = [v5 application];
    v32 = [v31 bundleIdentifier];

    if (v32)
    {
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_3;
      v52[3] = &unk_1E6AF4B60;
      id v33 = v32;
      id v53 = v33;
      uint64_t v34 = [v9 mostRecentAppLayoutIncludingHiddenAppLayouts:1 passingTest:v52];
      v43 = (void *)v34;
      if (v34)
      {
        v35 = (void *)v34;
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_4;
        v50[3] = &unk_1E6AF4B38;
        id v51 = v33;
        v36 = [v35 latestItemPassingTest:v50];
        if (v36)
        {
          v42 = v36;
          v37 = [v35 layoutAttributesForItem:v36];
          if (v37)
          {
            v38 = v37;
            [v37 attributedSize];
          }
          else
          {
            uint64_t v49 = 0;
            memset(v48, 0, sizeof(v48));
            v38 = 0;
          }
          v39 = [(SBDisplayItemLayoutAttributes *)v17 attributesByModifyingAttributedSize:v48];

          objc_msgSend(v39, "attributesByModifyingSizingPolicy:", objc_msgSend(v38, "sizingPolicy"));
          long long v17 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();

          v36 = v42;
        }
      }
      v30 = v44;
      if ([v4 layoutRole] == 4)
      {
        v40 = -[SBDisplayItemLayoutAttributes attributesByModifyingAttributedSize:](v17, "attributesByModifyingAttributedSize:", v47, SBDisplayItemAttributedSizeUnspecified((uint64_t)v47).n128_f64[0]);

        long long v17 = [v40 attributesByModifyingSizingPolicy:0];
      }
    }
    else
    {
      v30 = v44;
    }

    goto LABEL_40;
  }
LABEL_41:
}

- (void)setRequestedLayoutAttributes:(id)a3 forEntity:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  if (v17)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBWorkspaceApplicationSceneTransitionContext.m", 266, @"Invalid parameter not satisfying: %@", @"layoutAttributes" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"SBWorkspaceApplicationSceneTransitionContext.m", 267, @"Invalid parameter not satisfying: %@", @"entity" object file lineNumber description];

LABEL_3:
  if ([(SBWorkspaceTransitionContext *)self isFinalized])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    int v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"SBWorkspaceApplicationSceneTransitionContext.m", 268, @"%@ already finalized!", v16 object file lineNumber description];
  }
  requestedEntityIdentifierToLayoutAttributes = self->_requestedEntityIdentifierToLayoutAttributes;
  if (!requestedEntityIdentifierToLayoutAttributes)
  {
    objc_super v9 = (NSMutableDictionary *)objc_opt_new();
    id v10 = self->_requestedEntityIdentifierToLayoutAttributes;
    self->_requestedEntityIdentifierToLayoutAttributes = v9;

    requestedEntityIdentifierToLayoutAttributes = self->_requestedEntityIdentifierToLayoutAttributes;
  }
  int v11 = [v7 uniqueIdentifier];
  [(NSMutableDictionary *)requestedEntityIdentifierToLayoutAttributes setObject:v17 forKey:v11];
}

- (id)requestedLayoutAttributesForEntity:(id)a3
{
  requestedEntityIdentifierToLayoutAttributes = self->_requestedEntityIdentifierToLayoutAttributes;
  id v4 = [a3 uniqueIdentifier];
  uint64_t v5 = [(NSMutableDictionary *)requestedEntityIdentifierToLayoutAttributes objectForKey:v4];

  return v5;
}

- (int64_t)requestedWindowPickerRole
{
  return self->_requestedWindowPickerRole;
}

- (int64_t)requestedSpaceConfiguration
{
  return self->_requestedSpaceConfiguration;
}

uint64_t __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 allItems];
  uint64_t v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", *(void *)(a1 + 32));

  return v4;
}

uint64_t __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [v3 containsItemWithBundleIdentifier:*(void *)(a1 + 32)];
  }

  return v4;
}

- (void)setEntities:(id)a3 withPolicy:(int64_t)a4 centerEntity:(id)a5 floatingEntity:(id)a6
{
}

- (void)setEntities:(id)a3 startingAtLayoutRole:(int64_t)a4 withPolicy:(int64_t)a5 centerEntity:(id)a6 floatingEntity:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if (SBLayoutRoleIsValidForSplitView(a4))
  {
    if (v14)
    {
LABEL_3:
      [(SBWorkspaceApplicationSceneTransitionContext *)self setEntity:v14 forLayoutRole:4];
      objc_msgSend(v13, "sb_arrayByRemovingObject:", v14);
      id v16 = v13;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v18 = SBLayoutRoleIdentifierForRole(a4);
    [v17 handleFailureInMethod:a2, self, @"SBWorkspaceApplicationSceneTransitionContext.m", 153, @"startLayoutRole %@ isn't valid for Split View", v18 object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  id v16 = +[SBWorkspaceEntity entity];
  [(SBWorkspaceApplicationSceneTransitionContext *)self setEntity:v16 forLayoutRole:4];
LABEL_6:

  if (v15)
  {
    [(SBWorkspaceApplicationSceneTransitionContext *)self setEntity:v15 forLayoutRole:3];
    objc_msgSend(v13, "sb_arrayByRemovingObject:", v15);
    uint64_t v19 = v13;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v19 = +[SBWorkspaceEntity entity];
    [(SBWorkspaceApplicationSceneTransitionContext *)self setEntity:v19 forLayoutRole:3];
  }

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = a4;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __120__SBWorkspaceApplicationSceneTransitionContext_setEntities_startingAtLayoutRole_withPolicy_centerEntity_floatingEntity___block_invoke;
  v21[3] = &unk_1E6B02818;
  int64_t v25 = a5;
  int64_t v26 = a4;
  v21[4] = self;
  uint64_t v23 = v28;
  id v20 = v13;
  id v22 = v20;
  objc_super v24 = v27;
  SBLayoutRoleEnumerateValidRoles(v21);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
}

void __120__SBWorkspaceApplicationSceneTransitionContext_setEntities_startingAtLayoutRole_withPolicy_centerEntity_floatingEntity___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!SBLayoutRoleIsValidForSplitView(a2)) {
    return;
  }
  if (*(void *)(a1 + 64) == 1 && *(void *)(a1 + 72) > a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = SBPreviousWorkspaceEntity;
LABEL_15:
    id v15 = [(__objc2_class *)v5 entity];
    [v4 setEntity:v15 forLayoutRole:a2];
LABEL_16:

    return;
  }
  unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v6 < [*(id *)(a1 + 40) count])
  {
    id v15 = [*(id *)(a1 + 40) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    id v7 = [*(id *)(a1 + 32) entityForLayoutRole:a2];
    if (!v7 || !*(void *)(a1 + 64))
    {
      double v8 = objc_msgSend(*(id *)(a1 + 32), "entityForLayoutRole:", objc_msgSend(v15, "layoutRole"));
      int v9 = [v15 isEqual:v8];

      if (v9) {
        objc_msgSend(*(id *)(a1 + 32), "setEntity:forLayoutRole:", 0, objc_msgSend(v15, "layoutRole"));
      }
      [v7 setLayoutRole:0];
      [*(id *)(a1 + 32) setEntity:v15 forLayoutRole:a2];
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }

    goto LABEL_16;
  }
  uint64_t v10 = *(void *)(a1 + 64);
  if (v10 != 1)
  {
    if (v10) {
      return;
    }
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = SBEmptyWorkspaceEntity;
    goto LABEL_15;
  }
  int v11 = *(void **)(a1 + 32);
  double v12 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v11 setEntity:v12 forLayoutRole:a2];

  do
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v14 = *(void *)(v13 + 24) + 1;
    *(void *)(v13 + 24) = v14;
  }
  while (!SBLayoutRoleIsValidForSplitView(v14)
       && SBLayoutRoleIsValid(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)));
}

- (void)setRequestedSpaceConfiguration:(int64_t)a3
{
  if ([(SBWorkspaceTransitionContext *)self isFinalized])
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"SBWorkspaceApplicationSceneTransitionContext.m", 242, @"%@ already finalized!", v8 object file lineNumber description];
  }
  if (self->_requestedSpaceConfiguration != a3) {
    self->_requestedSpaceConfiguration = a3;
  }
}

uint64_t __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)previousApplicationSceneEntityForBundleID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(SBWorkspaceApplicationSceneTransitionContext *)self previousApplicationSceneEntities];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 application];
        int v11 = [v10 bundleIdentifier];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)appClipPlaceholderEntities
{
  v2 = [(SBWorkspaceTransitionContext *)self entities];
  id v3 = [v2 objectsPassingTest:&__block_literal_global_44_0];

  return v3;
}

uint64_t __74__SBWorkspaceApplicationSceneTransitionContext_appClipPlaceholderEntities__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAppClipPlaceholderEntity];
}

- (id)previousAppClipPlaceholderEntities
{
  v2 = [(SBWorkspaceTransitionContext *)self previousEntities];
  id v3 = [v2 objectsPassingTest:&__block_literal_global_46_0];

  return v3;
}

uint64_t __82__SBWorkspaceApplicationSceneTransitionContext_previousAppClipPlaceholderEntities__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAppClipPlaceholderEntity];
}

- (id)appClipPlaceholderEntityForBundleID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(SBWorkspaceApplicationSceneTransitionContext *)self appClipPlaceholderEntities];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 bundleIdentifier];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)previousAppClipPlaceholderEntityForBundleID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(SBWorkspaceApplicationSceneTransitionContext *)self previousAppClipPlaceholderEntities];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 bundleIdentifier];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)requestedWorkspaceEntityForLayoutRole:(int64_t)a3
{
  requestedWorkspaceEntityForLayoutRoleMutableDictionary = self->_requestedWorkspaceEntityForLayoutRoleMutableDictionary;
  id v4 = SBLayoutRoleIdentifierForRole(a3);
  uint64_t v5 = [(NSMutableDictionary *)requestedWorkspaceEntityForLayoutRoleMutableDictionary objectForKeyedSubscript:v4];

  return v5;
}

- (int64_t)_lockedInterfaceOrientation
{
  v2 = [(SBWorkspaceApplicationSceneTransitionContext *)self displayIdentity];
  int v3 = [v2 isMainDisplay];

  if (!v3) {
    return 0;
  }
  id v4 = +[SBOrientationLockManager sharedInstance];
  int64_t v5 = [v4 userLockOrientation];

  return v5;
}

- (void)setRemovalContext:(id)a3 forEntity:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v13;
  id v8 = v6;
  entityToRemovalContext = self->_entityToRemovalContext;
  if (v13)
  {
    if (!entityToRemovalContext)
    {
      uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      int v11 = self->_entityToRemovalContext;
      self->_entityToRemovalContext = v10;

      id v7 = v13;
      entityToRemovalContext = self->_entityToRemovalContext;
    }
    [(NSMapTable *)entityToRemovalContext setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMapTable *)entityToRemovalContext removeObjectForKey:v8];
    if (![(NSMapTable *)self->_entityToRemovalContext count])
    {
      int v12 = self->_entityToRemovalContext;
      self->_entityToRemovalContext = 0;
    }
  }
}

- (id)_displayConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._request);
  if (!WeakRetained)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBWorkspaceApplicationSceneTransitionContext.m", 652, @"no valid transitionRequest to query for displayConfiguration -> %@", self object file lineNumber description];
  }
  int64_t v5 = [WeakRetained displayConfiguration];

  return v5;
}

- (void)setFencesAnimations:(BOOL)a3
{
  self->_fencesAnimations = a3;
}

- (void)setInLiveResize:(BOOL)a3
{
  self->_inLiveResize = a3;
}

- (void)setAlwaysRunsWatchdog:(BOOL)a3
{
  self->_alwaysRunsWatchdog = a3;
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setPreludeAnimationTokenWrapper:(id)a3
{
}

- (void)setAnimationFence:(id)a3
{
}

- (void)setSceneless:(BOOL)a3
{
  self->_sceneless = a3;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (BOOL)prefersTouchCancellationDisabled
{
  return self->_prefersTouchCancellationDisabled;
}

- (void)setPrefersTouchCancellationDisabled:(BOOL)a3
{
  self->_prefersTouchCancellationDisabled = a3;
}

- (void)setPreventSwitcherRecencyModelUpdates:(BOOL)a3
{
  self->_preventSwitcherRecencyModelUpdates = a3;
}

- (SBWorkspaceEntity)deactivatingEntity
{
  return self->_deactivatingEntity;
}

- (void)setDeactivatingEntity:(id)a3
{
}

- (void)setRequestedWindowPickerRole:(int64_t)a3
{
  self->_requestedWindowPickerRole = a3;
}

- (void)setEntitiesWithRemovalContexts:(id)a3
{
}

@end