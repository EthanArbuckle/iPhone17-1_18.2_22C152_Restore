@interface SBMedusaWindowDragGestureRootSwitcherModifier
- (SBMedusaWindowDragGestureRootSwitcherModifier)initWithSelectedLeafAppLayout:(id)a3 currentMainAppLayout:(id)a4 currentFloatingAppLayout:(id)a5 currentFloatingConfiguration:(int64_t)a6;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
@end

@implementation SBMedusaWindowDragGestureRootSwitcherModifier

- (SBMedusaWindowDragGestureRootSwitcherModifier)initWithSelectedLeafAppLayout:(id)a3 currentMainAppLayout:(id)a4 currentFloatingAppLayout:(id)a5 currentFloatingConfiguration:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBMedusaWindowDragGestureRootSwitcherModifier;
  v14 = [(SBGestureRootSwitcherModifier *)&v17 initWithStartingEnvironmentMode:3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_selectedLeafAppLayout, a3);
    objc_storeStrong((id *)&v15->_currentMainAppLayout, a4);
    objc_storeStrong((id *)&v15->_currentFloatingAppLayout, a5);
    v15->_currentFloatingConfiguration = a6;
  }

  return v15;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (int64_t)gestureType
{
  return 8;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5 = a3;
  v6 = [SBMedusaWindowDragGestureSwitcherModifier alloc];
  v7 = [v5 gestureID];

  v8 = [(SBMedusaWindowDragGestureSwitcherModifier *)v6 initWithGestureID:v7 selectedLeafAppLayout:self->_selectedLeafAppLayout initialMainAppLayout:self->_currentMainAppLayout initialFloatingAppLayout:self->_currentFloatingAppLayout initialFloatingConfiguration:self->_currentFloatingConfiguration];
  return v8;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;
  v50 = v9;

  id v12 = [MEMORY[0x1E4F1CA80] set];
  id v13 = [MEMORY[0x1E4F1CA80] set];
  v14 = [v6 fromAppLayout];
  v15 = [v14 allItems];
  [v13 addObjectsFromArray:v15];

  v16 = [v6 fromFloatingAppLayout];
  objc_super v17 = [v16 allItems];
  [v13 addObjectsFromArray:v17];

  v18 = [(SBMedusaWindowDragGestureRootSwitcherModifier *)self appLayouts];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __117__SBMedusaWindowDragGestureRootSwitcherModifier_transitionChildModifierForMainTransitionEvent_activeGestureModifier___block_invoke;
  v52[3] = &unk_1E6AFC438;
  id v48 = v18;
  id v53 = v48;
  v54 = self;
  id v51 = v12;
  id v55 = v51;
  v49 = v13;
  objc_msgSend(v13, "bs_each:", v52);
  if ([v6 isEnteringSlideOverPeekEvent]) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = [v6 isEnteringSplitViewPeekEvent];
  }
  v20 = [SBMedusaWindowDragTransitionSwitcherModifier alloc];
  v21 = [v6 transitionID];
  selectedLeafAppLayout = self->_selectedLeafAppLayout;
  [v6 fromAppLayout];
  v23 = v47 = self;
  v24 = [v6 toAppLayout];
  v25 = [v6 toFloatingAppLayout];
  v26 = [v6 toAppExposeBundleID];
  uint64_t v27 = [v11 currentDestination];
  v28 = v11;
  uint64_t v29 = v27;

  v30 = [(SBMedusaWindowDragTransitionSwitcherModifier *)v20 initWithTransitionID:v21 selectedAppLayout:selectedLeafAppLayout fromAppLayout:v23 toAppLayout:v24 toFloatingAppLayout:v25 toHomeScreenPeek:v19 toAppExposeBundleIdentifier:v26 initiallyBlurredDisplayItems:v51 windowDragDestination:v29];
  if (SBPeekConfigurationIsValid([v6 toPeekConfiguration]))
  {
    v31 = [(SBGestureRootSwitcherModifier *)v47 selectedAppLayout];
    if ([v31 environment] == 1)
    {
      v32 = [v6 toFloatingAppLayout];
      v33 = [v31 itemForLayoutRole:1];
      int v34 = [v32 containsItem:v33];

      if (v34)
      {
        uint64_t v35 = [v6 toFloatingAppLayout];

        v31 = (void *)v35;
      }
    }
    if ([v6 isIconZoomDisabled])
    {
      uint64_t v36 = *MEMORY[0x1E4F1DB20];
      uint64_t v37 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
      uint64_t v38 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
      uint64_t v39 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
    }
    else
    {
      [(SBMedusaWindowDragGestureRootSwitcherModifier *)v47 homeScreenIconFrameForAppLayout:v31];
    }
    if (!CGRectIsNull(*(CGRect *)&v36)
      && ([(SBMedusaWindowDragGestureRootSwitcherModifier *)v47 isReduceMotionEnabled] & 1) == 0)
    {
      v40 = [(SBAppLayout *)v47->_selectedLeafAppLayout itemForLayoutRole:1];
      v41 = [v6 toAppLayout];
      int v42 = [v41 containsItem:v40];

      if (v42)
      {
        v43 = [v6 toAppLayout];
        v44 = [v43 leafAppLayoutForItem:v40];

        if (v44)
        {
          v45 = -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier initWithAppLayout:gestureEdge:liftOffVelocity:]([SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier alloc], "initWithAppLayout:gestureEdge:liftOffVelocity:", v44, 1, v47->_gestureVelocity.x, v47->_gestureVelocity.y);
          [(SBChainableModifier *)v30 addChildModifier:v45];
        }
      }
    }
  }

  return v30;
}

void __117__SBMedusaWindowDragGestureRootSwitcherModifier_transitionChildModifierForMainTransitionEvent_activeGestureModifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __117__SBMedusaWindowDragGestureRootSwitcherModifier_transitionChildModifierForMainTransitionEvent_activeGestureModifier___block_invoke_2;
  v15[3] = &unk_1E6AF4B60;
  id v5 = v3;
  id v16 = v5;
  id v6 = objc_msgSend(v4, "bs_filter:", v15);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
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
        if (objc_msgSend(*(id *)(a1 + 40), "isLayoutRoleBlurred:inAppLayout:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "layoutRoleForItem:", v5), *(void *)(*((void *)&v11 + 1) + 8 * v10)))objc_msgSend(*(id *)(a1 + 48), "addObject:", v5); {
        ++v10;
        }
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v8);
  }
}

uint64_t __117__SBMedusaWindowDragGestureRootSwitcherModifier_transitionChildModifierForMainTransitionEvent_activeGestureModifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  if ([v4 phase] == 1)
  {
    id v5 = [v4 toAppLayout];
    currentMainAppLayout = self->_currentMainAppLayout;
    self->_currentMainAppLayout = v5;

    uint64_t v7 = [v4 toFloatingAppLayout];
    currentFloatingAppLayout = self->_currentFloatingAppLayout;
    self->_currentFloatingAppLayout = v7;

    self->_currentFloatingConfiguration = [v4 toFloatingConfiguration];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBMedusaWindowDragGestureRootSwitcherModifier;
  uint64_t v9 = [(SBGestureRootSwitcherModifier *)&v11 handleTransitionEvent:v4];

  return v9;
}

- (id)handleGestureEvent:(id)a3
{
  p_gestureVelocity = &self->_gestureVelocity;
  id v5 = a3;
  [v5 velocityInContainerView];
  p_gestureVelocity->x = v6;
  p_gestureVelocity->y = v7;
  v10.receiver = self;
  v10.super_class = (Class)SBMedusaWindowDragGestureRootSwitcherModifier;
  uint64_t v8 = [(SBGestureRootSwitcherModifier *)&v10 handleGestureEvent:v5];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_currentMainAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedLeafAppLayout, 0);
}

@end