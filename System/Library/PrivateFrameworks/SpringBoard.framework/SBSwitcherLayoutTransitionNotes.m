@interface SBSwitcherLayoutTransitionNotes
- (BOOL)changingApps;
- (BOOL)fromApp;
- (BOOL)fromAppToHomeScreen;
- (BOOL)fromHomeScreen;
- (BOOL)fromHomeScreenToApp;
- (BOOL)fromManyApps;
- (BOOL)fromNoAppToApp;
- (BOOL)fromSwitcher;
- (BOOL)inAnySwitcher;
- (BOOL)inApp;
- (BOOL)inHomeScreen;
- (BOOL)inManyApps;
- (BOOL)isHomeButtonInitiated;
- (BOOL)isPIPRestore;
- (BOOL)isSystemGesture;
- (BOOL)movingFromManyApps;
- (BOOL)movingToManyApps;
- (BOOL)movingToSingleApp;
- (BOOL)stableInAppOrMovingBetweenSingleApp;
- (BOOL)stableInHomeScreen;
- (BOOL)stableInSameApp;
- (SBAppLayout)fromAppLayout;
- (SBAppLayout)inAppLayout;
- (SBSwitcherLayoutTransitionNotes)initWithFromPreviousState:(id)a3 currentLayoutState:(id)a4 transitionRequest:(id)a5;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation SBSwitcherLayoutTransitionNotes

- (SBSwitcherLayoutTransitionNotes)initWithFromPreviousState:(id)a3 currentLayoutState:(id)a4 transitionRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)SBSwitcherLayoutTransitionNotes;
  v11 = [(SBSwitcherLayoutTransitionNotes *)&v39 init];
  if (v11)
  {
    uint64_t v12 = [v10 source];
    v11->_isPIPRestore = v12 == 45;
    v11->_isSystemGesture = v12 == 11;
    v11->_isHomeButtonInitiated = v12 == 20;
    v13 = [v8 appLayout];
    if ([v8 unlockedEnvironmentMode] == 2) {
      char v14 = 1;
    }
    else {
      char v14 = [v8 isFloatingSwitcherVisible];
    }
    v11->_fromSwitcher = v14;
    v15 = [v8 elements];
    if ([v15 count]) {
      BOOL v16 = !v11->_fromSwitcher;
    }
    else {
      BOOL v16 = 0;
    }
    v11->_BOOL fromApp = v16;

    v11->_BOOL fromHomeScreen = [v8 unlockedEnvironmentMode] == 1;
    v17 = [v8 elements];
    v11->_fromManyApps = (unint64_t)[v17 count] > 1;

    v18 = [v9 appLayout];
    if ([v9 unlockedEnvironmentMode] == 2) {
      char v19 = 1;
    }
    else {
      char v19 = [v9 isFloatingSwitcherVisible];
    }
    v11->_inAnySwitcher = v19;
    v11->_BOOL inHomeScreen = [v9 unlockedEnvironmentMode] == 1;
    v20 = [v9 elements];
    if ([v20 count]) {
      BOOL v21 = !v11->_inAnySwitcher;
    }
    else {
      BOOL v21 = 0;
    }
    v11->_inApp = v21;

    v22 = [v9 elements];
    v11->_BOOL inManyApps = (unint64_t)[v22 count] > 1;

    v23 = [v9 elements];
    if ([v23 count])
    {
      v24 = [v8 elements];
      v11->_fromNoAppToApp = [v24 count] == 0;
    }
    else
    {
      v11->_fromNoAppToApp = 0;
    }

    BOOL fromApp = v11->_fromApp;
    if (fromApp) {
      BOOL fromApp = v11->_inHomeScreen;
    }
    v11->_fromAppToHomeScreen = fromApp;
    BOOL fromHomeScreen = v11->_fromHomeScreen;
    if (fromHomeScreen) {
      BOOL fromHomeScreen = v11->_inApp;
    }
    v11->_fromHomeScreenToApp = fromHomeScreen;
    v27 = [v8 elements];
    if ([v27 count])
    {
      v28 = [v9 elements];
      if ([v28 count])
      {
        v29 = [v8 elements];
        v30 = [v9 elements];
        v11->_changingApps = [v29 isEqual:v30] ^ 1;
      }
      else
      {
        v11->_changingApps = 0;
      }
    }
    else
    {
      v11->_changingApps = 0;
    }

    if (v13 == v18)
    {
      BOOL inManyApps = 0;
      v11->_movingFromManyApps = 0;
    }
    else
    {
      v11->_movingFromManyApps = v11->_fromManyApps;
      BOOL inManyApps = v11->_inManyApps;
    }
    v11->_movingToManyApps = inManyApps;
    v32 = [v9 elements];
    if ([v32 count] == 1)
    {
      v33 = [v8 elements];
      v34 = [v9 elements];
      v35 = [v34 anyObject];
      v11->_movingToSingleApp = [v33 containsObject:v35] ^ 1;
    }
    else
    {
      v11->_movingToSingleApp = 0;
    }

    BOOL inHomeScreen = v11->_fromHomeScreen;
    if (inHomeScreen) {
      BOOL inHomeScreen = v11->_inHomeScreen;
    }
    v11->_stableInHomeScreen = inHomeScreen;
    if (v11->_fromApp && v11->_inApp)
    {
      v11->_stableInAppOrMovingBetweenSingleApp = !v11->_movingToManyApps && !v11->_movingFromManyApps;
      char v37 = [v13 isEqual:v18];
    }
    else
    {
      char v37 = 0;
      v11->_stableInAppOrMovingBetweenSingleApp = 0;
    }
    v11->_stableInSameApp = v37;
    objc_storeWeak((id *)&v11->_fromAppLayout, v13);
    objc_storeWeak((id *)&v11->_inAppLayout, v18);
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inAppLayout);
  objc_destroyWeak((id *)&self->_fromAppLayout);
}

- (BOOL)inApp
{
  return self->_inApp;
}

- (BOOL)inAnySwitcher
{
  return self->_inAnySwitcher;
}

- (BOOL)fromHomeScreen
{
  return self->_fromHomeScreen;
}

- (BOOL)fromHomeScreenToApp
{
  return self->_fromHomeScreenToApp;
}

- (BOOL)inHomeScreen
{
  return self->_inHomeScreen;
}

- (BOOL)movingToSingleApp
{
  return self->_movingToSingleApp;
}

- (BOOL)isSystemGesture
{
  return self->_isSystemGesture;
}

- (BOOL)isPIPRestore
{
  return self->_isPIPRestore;
}

- (BOOL)fromNoAppToApp
{
  return self->_fromNoAppToApp;
}

- (BOOL)stableInHomeScreen
{
  return self->_stableInHomeScreen;
}

- (BOOL)stableInAppOrMovingBetweenSingleApp
{
  return self->_stableInAppOrMovingBetweenSingleApp;
}

- (BOOL)changingApps
{
  return self->_changingApps;
}

- (BOOL)fromAppToHomeScreen
{
  return self->_fromAppToHomeScreen;
}

- (BOOL)fromApp
{
  return self->_fromApp;
}

- (id)succinctDescription
{
  v2 = [(SBSwitcherLayoutTransitionNotes *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke;
  v15[3] = &unk_1E6AF5290;
  id v4 = v3;
  id v16 = v4;
  v17 = self;
  [v4 appendBodySectionWithName:@"Flags" multilinePrefix:0 block:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke_2;
  v12[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v13 = v5;
  char v14 = self;
  [v5 appendBodySectionWithName:@"From AppLayout" multilinePrefix:0 block:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke_3;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:@"In AppLayout" multilinePrefix:0 block:v9];
  id v7 = v6;

  return v7;
}

id __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"fromSwitcher"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9) withName:@"fromApp"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10) withName:@"fromHomeScreen"];
  id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 11) withName:@"fromManyApps"];
  id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 12) withName:@"inAnySwitcher"];
  id v7 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 13) withName:@"inHomeScreen"];
  id v8 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 14) withName:@"inApp"];
  id v9 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 15) withName:@"inManyApps"];
  id v10 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"fromNoAppToApp"];
  id v11 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 17) withName:@"fromHomeScreenToApp"];
  id v12 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 18) withName:@"fromAppToHomeScreen"];
  id v13 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 19) withName:@"stableInHomeScreen"];
  id v14 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 20) withName:@"stableInAppOrMovingBetweenSingleApp"];
  id v15 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 21) withName:@"stableInSameApp"];
  id v16 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 22) withName:@"changingApps"];
  id v17 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 23) withName:@"movingToSingleApp"];
  id v18 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 24) withName:@"movingToManyApps"];
  id v19 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 25) withName:@"movingFromManyApps"];
  id v20 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 26) withName:@"isPIPRestore"];
  id v21 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 27) withName:@"isSystemGesture"];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 28) withName:@"isHomeButtonInitiated"];
}

void __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  id v2 = (id)[v1 appendObject:WeakRetained withName:0 skipIfNil:0];
}

void __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  id v2 = (id)[v1 appendObject:WeakRetained withName:0 skipIfNil:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSwitcherLayoutTransitionNotes *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (SBAppLayout)fromAppLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fromAppLayout);
  return (SBAppLayout *)WeakRetained;
}

- (BOOL)fromSwitcher
{
  return self->_fromSwitcher;
}

- (BOOL)fromManyApps
{
  return self->_fromManyApps;
}

- (SBAppLayout)inAppLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inAppLayout);
  return (SBAppLayout *)WeakRetained;
}

- (BOOL)inManyApps
{
  return self->_inManyApps;
}

- (BOOL)stableInSameApp
{
  return self->_stableInSameApp;
}

- (BOOL)movingToManyApps
{
  return self->_movingToManyApps;
}

- (BOOL)movingFromManyApps
{
  return self->_movingFromManyApps;
}

- (BOOL)isHomeButtonInitiated
{
  return self->_isHomeButtonInitiated;
}

@end