@interface SBFluidSwitcherLayoutContext
- (BOOL)_shouldUpdateSwitcherModelBasedOnTimeOrUserInteraction;
- (BOOL)hasUserInteractedWithActiveApplication;
- (BOOL)shouldAddAppLayoutToFront:(id)a3 forTransitionWithContext:(id)a4 recentAppLayouts:(id)a5 transitionCompleted:(BOOL)a6;
- (BOOL)shouldAddAppLayoutToFront:(id)a3 whenBeginningGestureOfType:(int64_t)a4 layoutContext:(id)a5;
- (BOOL)shouldAddAppLayoutToFront:(id)a3 whenEndingGestureOfType:(int64_t)a4 layoutContext:(id)a5;
- (NSDate)lastTransitionCompletionDate;
- (NSString)description;
- (SBAppLayout)currentAppLayout;
- (SBAppLayout)transitioningFromAppLayout;
- (SBAppLayout)transitioningToAppLayout;
- (SBFluidSwitcherGesture)activeGesture;
- (SBFluidSwitcherLayoutContext)initWithLayoutState:(id)a3;
- (SBHomeGestureSettings)homeGestureSettings;
- (SBMainDisplayLayoutState)currentLayoutState;
- (SBMainDisplayLayoutState)layoutState;
- (SBMainDisplayLayoutState)previousLayoutState;
- (SBMainDisplayLayoutState)transitioningFromLayoutState;
- (SBMainDisplayLayoutState)transitioningToLayoutState;
- (SBWorkspaceApplicationSceneTransitionContext)activeTransitionContext;
- (double)secondsSinceLastTransitionCompletion;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)previousInterfaceOrientation;
- (unint64_t)supportedOrientationsForGesture;
- (void)dealloc;
- (void)didEndTransitioningToLayoutStateWithContext:(id)a3;
- (void)eventSource:(id)a3 userTouchedApplication:(id)a4;
- (void)setActiveGesture:(id)a3;
- (void)setCurrentAppLayout:(id)a3;
- (void)setCurrentLayoutState:(id)a3;
- (void)setHasUserInteractedWithActiveApplication:(BOOL)a3;
- (void)setHomeGestureSettings:(id)a3;
- (void)setLastTransitionCompletionDate:(id)a3;
- (void)setPreviousInterfaceOrientation:(int64_t)a3;
- (void)setPreviousLayoutState:(id)a3;
- (void)setTransitioningFromAppLayout:(id)a3;
- (void)setTransitioningToAppLayout:(id)a3;
- (void)willBeginTransitioningToLayoutStateWithContext:(id)a3;
@end

@implementation SBFluidSwitcherLayoutContext

- (SBMainDisplayLayoutState)layoutState
{
  return self->_currentLayoutState;
}

- (SBWorkspaceApplicationSceneTransitionContext)activeTransitionContext
{
  return self->_activeTransitionContext;
}

- (SBFluidSwitcherGesture)activeGesture
{
  return self->_activeGesture;
}

- (void)willBeginTransitioningToLayoutStateWithContext:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_activeTransitionContext, a3);
  v5 = [v10 request];
  uint64_t v6 = [v5 source];

  if (v6 != 27 && v6 != 68)
  {
    activeGesture = self->_activeGesture;
    self->_activeGesture = 0;
  }
  v8 = [v10 layoutState];
  v9 = [v10 previousLayoutState];
  objc_storeStrong((id *)&self->_currentLayoutState, v8);
  if (([v8 isEqual:v9] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_previousLayoutState, v9);
    self->_previousInterfaceOrientation = [v9 interfaceOrientation];
  }
  if (![(SBMainDisplayLayoutState *)self->_currentLayoutState isEqual:self->_previousLayoutState]) {
    self->_hasUserInteractedWithActiveApplication = 0;
  }
}

- (void)didEndTransitioningToLayoutStateWithContext:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  uint64_t v6 = [v4 date];
  lastTransitionCompletionDate = self->_lastTransitionCompletionDate;
  self->_lastTransitionCompletionDate = v6;

  id obj = [v5 layoutState];
  v8 = [v5 previousLayoutState];

  objc_storeStrong((id *)&self->_currentLayoutState, obj);
  if (([obj isEqual:v8] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_previousLayoutState, v8);
    self->_previousInterfaceOrientation = [v8 interfaceOrientation];
  }
  if (![(SBMainDisplayLayoutState *)self->_currentLayoutState isEqual:self->_previousLayoutState]) {
    self->_hasUserInteractedWithActiveApplication = 0;
  }
  activeTransitionContext = self->_activeTransitionContext;
  self->_activeTransitionContext = 0;
}

- (BOOL)shouldAddAppLayoutToFront:(id)a3 forTransitionWithContext:(id)a4 recentAppLayouts:(id)a5 transitionCompleted:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v43 = v11;
  if (!v11)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"SBFluidSwitcherLayoutContext.m", 245, @"Invalid parameter not satisfying: %@", @"newAppLayout" object file lineNumber description];
  }
  v40 = self;
  v14 = [v12 request];
  v15 = [v12 layoutState];
  v16 = [v12 previousLayoutState];
  v41 = v14;
  unint64_t v17 = [v14 source];
  if (v17 == 14)
  {
    uint64_t v18 = [v16 interfaceOrientation];
    BOOL v39 = v18 == [v15 interfaceOrientation];
  }
  else
  {
    BOOL v39 = 0;
  }
  uint64_t v19 = [v16 elements];
  v20 = [v15 elements];
  v21 = v13;
  v22 = [v13 firstObject];
  v42 = (void *)v19;
  if (BSEqualObjects())
  {
    char v23 = BSEqualSets();

    if (v23)
    {
LABEL_8:
      LOBYTE(v24) = 0;
LABEL_25:
      v27 = v21;
      goto LABEL_47;
    }
  }
  else
  {
  }
  int v25 = [v12 preventSwitcherRecencyModelUpdates];
  LOBYTE(v24) = 0;
  BOOL v26 = !a6;
  if (v17 != 15) {
    BOOL v26 = 0;
  }
  if (v26) {
    goto LABEL_25;
  }
  v27 = v21;
  if (!v25)
  {
    BOOL v28 = a6;
    if ([v16 unlockedEnvironmentMode] == 2)
    {
      uint64_t v29 = [v15 unlockedEnvironmentMode];
      if (v17 == 27 && v29 == 2) {
        goto LABEL_42;
      }
    }
    if (v17 == 63) {
      goto LABEL_42;
    }
    if (v17 == 56) {
      goto LABEL_46;
    }
    unint64_t v30 = v17 - 11;
    if (v17 == 52)
    {
      v31 = [v15 appLayout];
      v32 = [v31 itemForLayoutRole:4];

      if (!v32) {
        goto LABEL_8;
      }
    }
    else if (v30 < 2)
    {
LABEL_26:
      v27 = v21;
      int v24 = [v21 containsObject:v43] ^ 1;
      if ((v24 | v39)) {
        goto LABEL_47;
      }
      if (v28)
      {
        if (v30 <= 1)
        {
          v33 = [v16 elements];
          if ([v33 count])
          {
            v34 = [v15 elements];
            LOBYTE(v24) = [v34 count] == 0;

            v27 = v21;
            goto LABEL_47;
          }
        }
LABEL_46:
        LOBYTE(v24) = 1;
        goto LABEL_47;
      }
      if ([v43 environment] == 2)
      {
        if (([v16 isFloatingSwitcherVisible] & 1) == 0
          && ([v15 isFloatingSwitcherVisible] & 1) != 0)
        {
          goto LABEL_46;
        }
        v35 = [v16 floatingAppLayout];

        if (!v35) {
          goto LABEL_46;
        }
      }
      if ([v16 unlockedEnvironmentMode] == 1 && objc_msgSend(v15, "unlockedEnvironmentMode") == 3) {
        goto LABEL_46;
      }
      if ([v16 unlockedEnvironmentMode] == 3) {
        int v36 = [v16 isFloatingSwitcherVisible];
      }
      else {
        int v36 = 1;
      }
      if ([v15 unlockedEnvironmentMode] == 3
        && ((v36 | [v15 isFloatingSwitcherVisible]) & 1) == 0)
      {
        if (v17 < 0x10)
        {
          int v24 = (0x67FFu >> v17) & 1;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_42:
      LOBYTE(v24) = 0;
      goto LABEL_47;
    }
    if ([(SBFluidSwitcherLayoutContext *)v40 _shouldUpdateSwitcherModelBasedOnTimeOrUserInteraction])
    {
      LOBYTE(v24) = 1;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
LABEL_47:

  return v24;
}

- (BOOL)_shouldUpdateSwitcherModelBasedOnTimeOrUserInteraction
{
  v3 = [(SBFluidSwitcherLayoutContext *)self layoutState];
  if ([v3 unlockedEnvironmentMode] == 3 && (objc_msgSend(v3, "isFloatingSwitcherVisible") & 1) == 0)
  {
    v4 = [(SBFluidSwitcherLayoutContext *)self activeTransitionContext];
    if (v4)
    {
    }
    else
    {
      id v5 = [(SBFluidSwitcherLayoutContext *)self activeGesture];

      if (!v5)
      {
        v8 = [(SBFluidSwitcherLayoutContext *)self lastTransitionCompletionDate];
        [v8 timeIntervalSinceNow];
        double v10 = -v9;

        [(SBHomeGestureSettings *)self->_homeGestureSettings secondsToResetSwitcherListAfterTransition];
        if (v11 < v10
          || self->_hasUserInteractedWithActiveApplication
          && [(SBHomeGestureSettings *)self->_homeGestureSettings resetSwitcherListAfterAppInteraction])
        {
          BOOL v6 = 1;
          goto LABEL_7;
        }
      }
    }
  }
  BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (double)secondsSinceLastTransitionCompletion
{
  v2 = [(SBFluidSwitcherLayoutContext *)self lastTransitionCompletionDate];
  [v2 timeIntervalSinceNow];
  double v4 = -v3;

  return v4;
}

- (NSDate)lastTransitionCompletionDate
{
  return self->_lastTransitionCompletionDate;
}

- (SBMainDisplayLayoutState)transitioningFromLayoutState
{
  return (SBMainDisplayLayoutState *)[(SBWorkspaceApplicationSceneTransitionContext *)self->_activeTransitionContext previousLayoutState];
}

- (SBFluidSwitcherLayoutContext)initWithLayoutState:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherLayoutContext;
  BOOL v6 = [(SBFluidSwitcherLayoutContext *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentLayoutState, a3);
    objc_storeStrong((id *)&v7->_previousLayoutState, a3);
    v7->_previousInterfaceOrientation = [v5 interfaceOrientation];
    uint64_t v8 = +[SBHomeGestureDomain rootSettings];
    homeGestureSettings = v7->_homeGestureSettings;
    v7->_homeGestureSettings = (SBHomeGestureSettings *)v8;

    double v10 = +[SBAppInteractionEventSourceManager sharedInstance];
    [v10 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  double v3 = +[SBAppInteractionEventSourceManager sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherLayoutContext;
  [(SBFluidSwitcherLayoutContext *)&v4 dealloc];
}

- (SBMainDisplayLayoutState)transitioningToLayoutState
{
  return (SBMainDisplayLayoutState *)[(SBWorkspaceApplicationSceneTransitionContext *)self->_activeTransitionContext layoutState];
}

- (void)setActiveGesture:(id)a3
{
  id v5 = (SBFluidSwitcherGesture *)a3;
  if (self->_activeGesture != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_activeGesture, a3);
    activeTransitionContext = self->_activeTransitionContext;
    self->_activeTransitionContext = 0;

    id v5 = v7;
  }
}

- (unint64_t)supportedOrientationsForGesture
{
  objc_super v4 = [(SBFluidSwitcherLayoutContext *)self layoutState];
  unint64_t v5 = 1 << [v4 interfaceOrientation];

  BOOL v6 = [(SBFluidSwitcherLayoutContext *)self activeTransitionContext];
  [(SBFluidSwitcherLayoutContext *)self secondsSinceLastTransitionCompletion];
  if (!v6)
  {
    double v8 = v7;
    [(SBHomeGestureSettings *)self->_homeGestureSettings secondsToAllowMultipleEdges];
    if (v8 >= v9) {
      goto LABEL_31;
    }
  }
  if (self->_hasUserInteractedWithActiveApplication
    && [(SBHomeGestureSettings *)self->_homeGestureSettings preventMultipleEdgesAfterAppInteraction])
  {
    goto LABEL_31;
  }
  if (v6)
  {
    double v10 = [v6 previousLayoutState];
    double v11 = [v6 layoutState];
    uint64_t v12 = [(SBLayoutState *)v11 interfaceOrientation];
  }
  else
  {
    double v10 = self->_previousLayoutState;
    double v11 = self->_currentLayoutState;
    uint64_t v12 = [(SBLayoutState *)self->_currentLayoutState interfaceOrientation];
  }
  uint64_t v26 = v12;
  id v13 = [(SBLayoutState *)v10 elements];
  if (!v13)
  {
    v2 = [(SBLayoutState *)v11 elements];
    if (![v2 count])
    {
      int v16 = 1;
LABEL_13:

      goto LABEL_14;
    }
  }
  v14 = [(SBLayoutState *)v10 elements];
  v15 = [(SBLayoutState *)v11 elements];
  int v16 = [v14 isEqual:v15];

  if (!v13) {
    goto LABEL_13;
  }
LABEL_14:

  uint64_t v17 = [(SBMainDisplayLayoutState *)v10 unlockedEnvironmentMode];
  uint64_t v18 = [(SBMainDisplayLayoutState *)v11 unlockedEnvironmentMode];
  if (v25 == v26)
  {
    int v19 = 0;
  }
  else if (v17 == 3 && v18 == 3 || v18 == 1)
  {
    int v19 = v16;
  }
  else
  {
    int v19 = 0;
  }
  v22 = [(SBFluidSwitcherLayoutContext *)self layoutState];
  BOOL v23 = [v22 unlockedEnvironmentMode] == 1 && objc_msgSend((id)SBApp, "homeScreenRotationStyle") != 0;

  if (((v19 | v23) & 1) == 0) {
    unint64_t v5 = (int)((1 << v25) | (1 << v26) | v5);
  }

LABEL_31:
  return v5;
}

- (BOOL)shouldAddAppLayoutToFront:(id)a3 whenBeginningGestureOfType:(int64_t)a4 layoutContext:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBFluidSwitcherLayoutContext.m", 193, @"Invalid parameter not satisfying: %@", @"newAppLayout" object file lineNumber description];
  }
  double v11 = [(SBFluidSwitcherLayoutContext *)self layoutState];
  if (a4 == 4) {
    goto LABEL_8;
  }
  if (a4 == 8)
  {
    BOOL v12 = 0;
    goto LABEL_17;
  }
  uint64_t v13 = [v9 environment];
  if (a4 == 6 && v13 == 2)
  {
LABEL_8:
    BOOL v12 = 1;
    goto LABEL_17;
  }
  uint64_t v14 = [v11 windowPickerRole];
  v15 = [v11 bundleIDShowingAppExpose];
  BOOL v12 = [v9 environment] == 2 && v14 == 3
     || [v9 environment] == 1 && SBLayoutRoleIsValidForSplitView(v14)
     || [v9 environment] == 1 && v15
     || [(SBFluidSwitcherLayoutContext *)self _shouldUpdateSwitcherModelBasedOnTimeOrUserInteraction];

LABEL_17:
  return v12;
}

- (BOOL)shouldAddAppLayoutToFront:(id)a3 whenEndingGestureOfType:(int64_t)a4 layoutContext:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [a3 environment];
  id v9 = [v7 previousLayoutState];
  BOOL IsStashed = SBFloatingConfigurationIsStashed([v9 floatingConfiguration]);

  double v11 = [v7 layoutState];

  BOOL v12 = SBFloatingConfigurationIsStashed([v11 floatingConfiguration]);
  BOOL v13 = a4 == 3 && v8 == 2;
  char v14 = !v12;
  if (!v13) {
    char v14 = 1;
  }
  return (v14 | IsStashed) ^ 1;
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(SBFluidSwitcherLayoutContext *)self currentLayoutState];
  id v7 = [v6 elements];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SBFluidSwitcherLayoutContext_eventSource_userTouchedApplication___block_invoke;
  v9[3] = &unk_1E6AFB3C0;
  id v10 = v5;
  double v11 = self;
  id v8 = v5;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __67__SBFluidSwitcherLayoutContext_eventSource_userTouchedApplication___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 workspaceEntity];
  BOOL v6 = [v5 applicationSceneEntity];
  id v7 = [v6 application];
  id v8 = [v7 bundleIdentifier];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 8) = 1;
    *a3 = 1;
  }
}

- (NSString)description
{
  return (NSString *)[(SBFluidSwitcherLayoutContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFluidSwitcherLayoutContext *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(SBFluidSwitcherLayoutContext *)self descriptionBuilderWithMultilinePrefix:a3];
  objc_super v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherLayoutContext *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"currentLayoutState"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"previousLayoutState"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 48);
  id v5 = @"UIInterfaceOrientationLandscapeRight";
  id v6 = @"UIInterfaceOrientationLandscapeLeft";
  id v7 = @"UIInterfaceOrientationPortraitUpsideDown";
  if (v4 != 2) {
    id v7 = 0;
  }
  if (v4 != 4) {
    id v6 = v7;
  }
  if (v4 != 3) {
    id v5 = v6;
  }
  if (v4 == 1) {
    id v8 = @"UIInterfaceOrientationPortrait";
  }
  else {
    id v8 = v5;
  }
  [*(id *)(a1 + 32) appendString:v8 withName:@"previousInterfaceOrientation"];
  id v9 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 80) withName:@"lastTransitionCompletionDate"];
  id v10 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"hasUserInteractedWithActiveApplication"];
  double v11 = *(void **)(a1 + 32);
  BOOL v12 = [v11 activeMultilinePrefix];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  BOOL v28 = &unk_1E6AF5290;
  int8x16_t v24 = *(int8x16_t *)(a1 + 32);
  id v13 = (id)v24.i64[0];
  int8x16_t v29 = vextq_s8(v24, v24, 8uLL);
  [v11 appendBodySectionWithName:@"supportedOrientationsForGesture" multilinePrefix:v12 block:&v25];

  id v14 = (id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 24) != 0 withName:@"isTransitioning"];
  id v15 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"activeTransitionContext" skipIfNil:1];
  int v16 = *(void **)(a1 + 40);
  if (v16[3])
  {
    uint64_t v17 = *(void **)(a1 + 32);
    uint64_t v18 = [v16 transitioningFromLayoutState];
    id v19 = (id)[v17 appendObject:v18 withName:@"transitioningFromLayoutState"];

    v20 = *(void **)(a1 + 32);
    v21 = [*(id *)(a1 + 40) transitioningToLayoutState];
    id v22 = (id)[v20 appendObject:v21 withName:@"transitioningToLayoutState"];

    int v16 = *(void **)(a1 + 40);
  }
  id v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v16[2], @"activeGesture", *(_OWORD *)&v24, v25, v26, v27, v28);
}

void __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  int8x8_t v2 = (int8x8_t)[*(id *)(a1 + 32) supportedOrientationsForGesture];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v8 = __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  id v9 = &unk_1E6AF5510;
  id v10 = *(id *)(a1 + 40);
  id v3 = v7;
  if (v2)
  {
    char v11 = 0;
    uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
    v4.i16[0] = vaddlv_u8(v4);
    int v5 = v4.i32[0];
    if (v4.i32[0])
    {
      unint64_t v6 = 0;
      do
      {
        if (((1 << v6) & *(void *)&v2) != 0)
        {
          v8((uint64_t)v3);
          if (v11) {
            break;
          }
          --v5;
        }
        if (v6 > 0x3E) {
          break;
        }
        ++v6;
      }
      while (v5 > 0);
    }
  }
}

void __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  BSInterfaceOrientationDescription();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = (id)[v1 appendObject:v3 withName:0];
}

- (SBMainDisplayLayoutState)currentLayoutState
{
  return self->_currentLayoutState;
}

- (void)setCurrentLayoutState:(id)a3
{
}

- (SBMainDisplayLayoutState)previousLayoutState
{
  return self->_previousLayoutState;
}

- (void)setPreviousLayoutState:(id)a3
{
}

- (int64_t)previousInterfaceOrientation
{
  return self->_previousInterfaceOrientation;
}

- (void)setPreviousInterfaceOrientation:(int64_t)a3
{
  self->_previousInterfaceOrientation = a3;
}

- (SBAppLayout)currentAppLayout
{
  return self->_currentAppLayout;
}

- (void)setCurrentAppLayout:(id)a3
{
}

- (SBAppLayout)transitioningFromAppLayout
{
  return self->_transitioningFromAppLayout;
}

- (void)setTransitioningFromAppLayout:(id)a3
{
}

- (SBAppLayout)transitioningToAppLayout
{
  return self->_transitioningToAppLayout;
}

- (void)setTransitioningToAppLayout:(id)a3
{
}

- (void)setLastTransitionCompletionDate:(id)a3
{
}

- (BOOL)hasUserInteractedWithActiveApplication
{
  return self->_hasUserInteractedWithActiveApplication;
}

- (void)setHasUserInteractedWithActiveApplication:(BOOL)a3
{
  self->_hasUserInteractedWithActiveApplication = a3;
}

- (SBHomeGestureSettings)homeGestureSettings
{
  return self->_homeGestureSettings;
}

- (void)setHomeGestureSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_storeStrong((id *)&self->_lastTransitionCompletionDate, 0);
  objc_storeStrong((id *)&self->_transitioningToAppLayout, 0);
  objc_storeStrong((id *)&self->_transitioningFromAppLayout, 0);
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
  objc_storeStrong((id *)&self->_previousLayoutState, 0);
  objc_storeStrong((id *)&self->_currentLayoutState, 0);
  objc_storeStrong((id *)&self->_activeTransitionContext, 0);
  objc_storeStrong((id *)&self->_activeGesture, 0);
}

@end