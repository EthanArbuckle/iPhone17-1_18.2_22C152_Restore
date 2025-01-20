@interface SBMainSwitcherRootSwitcherModifier
- (BOOL)_correctFloorModifierToHandleEvent;
- (SBMainSwitcherRootSwitcherModifier)init;
- (id)_createNewDefaultFloorModifier;
- (id)_newMultitaskingModifierForEnvironmentMode:(int64_t)a3;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)floorModifierForTransitionEvent:(id)a3;
- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3;
- (id)gestureModifierForGestureEvent:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)highlightModifierForHighlightEvent:(id)a3;
- (id)insertionModifierForInsertionEvent:(id)a3;
- (id)multitaskingModifierForEvent:(id)a3;
- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3;
- (id)removalModifierForRemovalEvent:(id)a3;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (id)shelfModifierForTransitionEvent:(id)a3;
- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3;
- (id)transitionModifierForMainTransitionEvent:(id)a3;
- (id)userScrollingModifierForScrollEvent:(id)a3;
- (void)_ensureModifier:(id)a3 startsInFinalStateOfEvent:(id)a4;
- (void)_setCardSizesWithEvent:(id)a3;
@end

@implementation SBMainSwitcherRootSwitcherModifier

- (SBMainSwitcherRootSwitcherModifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBMainSwitcherRootSwitcherModifier;
  result = [(SBSwitcherModifier *)&v3 init];
  if (result) {
    *(void *)&result->_floatingCardSize.height = 1;
  }
  return result;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBMainSwitcherRootSwitcherModifier;
  objc_super v3 = [(SBMainSwitcherRootSwitcherModifier *)&v8 adjustedAppLayoutsForAppLayouts:a3];
  v4 = objc_msgSend(v3, "bs_filter:", &__block_literal_global_56);
  v5 = objc_msgSend(v3, "bs_filter:", &__block_literal_global_4);
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return v6;
}

BOOL __70__SBMainSwitcherRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment] == 2;
}

BOOL __70__SBMainSwitcherRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 environment] != 2;
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 gestureID];
  if (-[SBMainSwitcherRootSwitcherModifier _correctFloorModifierToHandleEvent](self, "_correctFloorModifierToHandleEvent")&& [v4 gestureType] == 2)
  {
    v6 = [[SBGridSwipeUpGestureSwitcherModifier alloc] initWithGestureID:v5];
  }
  else
  {
    v6 = 0;
  }
  if ([v4 gestureType] == 6)
  {
    v7 = [[SBDragAndDropGestureRootSwitcherModifier alloc] initWithStartingEnvironmentMode:*(void *)&self->_floatingCardSize.height floatingSwitcherVisible:LOBYTE(self->_environmentMode) fullScreenAppLayout:*(void *)&self->_floatingSwitcherVisible];
  }
  else
  {
    if ([v4 gestureType] != 8) {
      goto LABEL_13;
    }
    objc_super v8 = *(void **)&self->_floatingSwitcherVisible;
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      v10 = +[SBAppLayout homeScreenAppLayout];
      objc_msgSend(v10, "appLayoutByModifyingPreferredDisplayOrdinal:", -[SBMainSwitcherRootSwitcherModifier displayOrdinal](self, "displayOrdinal"));
      v9 = (SBGridSwipeUpGestureSwitcherModifier *)objc_claimAutoreleasedReturnValue();
    }
    v11 = [SBMedusaWindowDragGestureRootSwitcherModifier alloc];
    v12 = [v4 selectedAppLayout];
    v7 = [(SBMedusaWindowDragGestureRootSwitcherModifier *)v11 initWithSelectedLeafAppLayout:v12 currentMainAppLayout:v9 currentFloatingAppLayout:self->_appLayout currentFloatingConfiguration:self->_floatingAppLayout];

    v6 = v9;
  }

  v6 = (SBGridSwipeUpGestureSwitcherModifier *)v7;
LABEL_13:

  return v6;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  *(void *)&self->_floatingCardSize.height = [v4 toEnvironmentMode];
  LOBYTE(self->_environmentMode) = [v4 toFloatingSwitcherVisible];
  BYTE1(self->_environmentMode) = SBPeekConfigurationIsValid([v4 toPeekConfiguration]);
  uint64_t v5 = [v4 toAppLayout];
  v6 = *(void **)&self->_floatingSwitcherVisible;
  *(void *)&self->_floatingSwitcherVisible = v5;

  v7 = [v4 toFloatingAppLayout];
  appLayout = self->_appLayout;
  self->_appLayout = v7;

  self->_floatingAppLayout = (SBAppLayout *)[v4 toFloatingConfiguration];
  [(SBMainSwitcherRootSwitcherModifier *)self _setCardSizesWithEvent:v4];
  v11.receiver = self;
  v11.super_class = (Class)SBMainSwitcherRootSwitcherModifier;
  v9 = [(SBFluidSwitcherRootSwitcherModifier *)&v11 handleTransitionEvent:v4];

  return v9;
}

- (id)handleGestureEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBMainSwitcherRootSwitcherModifier;
  uint64_t v5 = [(SBFluidSwitcherRootSwitcherModifier *)&v19 handleGestureEvent:v4];
  v6 = [(SBMainSwitcherRootSwitcherModifier *)self switcherSettings];
  uint64_t v7 = [v6 effectiveSwitcherStyle];

  if (v7 == 2)
  {
    [(SBMainSwitcherRootSwitcherModifier *)self _setCardSizesWithEvent:0];
    objc_super v8 = NSString;
    v9 = SBStringForFluidSwitcherGestureType([v4 gestureType]);
    v10 = [v8 stringWithFormat:@"%@", v9];

    objc_super v11 = [(SBChainableModifier *)self childModifierByKey:v10];
    if (!v11
      && [v4 gestureType] == 1
      && [v4 phase] == 1
      && !BYTE1(self->_environmentMode))
    {
      v12 = -[SBMixedGridSwitcherModifier initWithFullScreenCardSize:floatingCardSize:]([SBMixedGridSwitcherModifier alloc], "initWithFullScreenCardSize:floatingCardSize:", *(double *)&self->super._hasPerformedInitialSetup, self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, self->_floatingCardSize.width);
      v13 = [[SBMixedGridHomeGestureRootSwitcherModifier alloc] initWithStartingEnvironmentMode:*(void *)&self->_floatingCardSize.height selectedAppLayout:*(void *)&self->_floatingSwitcherVisible mixedGridModifier:v12];
      [(SBChainableModifier *)self addChildModifier:v13 atLevel:3 key:v10];
      v14 = SBLogAppSwitcher();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        v17 = [(SBChainableModifier *)v13 succinctDescription];
        *(_DWORD *)buf = 138412546;
        v21 = v16;
        __int16 v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for gesture %@.", buf, 0x16u);
      }
    }
  }
  return v5;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SBMainSwitcherRootSwitcherModifier;
  v6 = [(SBFluidSwitcherRootSwitcherModifier *)&v10 responseForProposedChildResponse:a3 childModifier:a4 event:a5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__SBMainSwitcherRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
  v9[3] = &unk_1E6AFAF20;
  v9[4] = self;
  uint64_t v7 = [v6 responseByTransformingResponseWithTransformer:v9];

  return v7;
}

id __91__SBMainSwitcherRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 31)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = v3;
    v6 = [v5 modifier];
    uint64_t v7 = [v5 level];
    objc_super v8 = [v5 key];

    [v4 addChildModifier:v6 atLevel:v7 key:v8];
    id v3 = 0;
  }
  return v3;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 transitionID];
  v80 = [v5 fromAppLayout];
  uint64_t v79 = [v5 fromFloatingAppLayout];
  v83 = [v5 toAppLayout];
  v81 = [v5 toFloatingAppLayout];
  uint64_t v7 = [v5 fromAppExposeBundleID];
  v84 = [v5 toAppExposeBundleID];
  uint64_t v82 = [v5 fromEnvironmentMode];
  uint64_t v8 = [v5 toEnvironmentMode];
  uint64_t v9 = [v5 fromFloatingConfiguration];
  uint64_t v10 = [v5 toFloatingConfiguration];
  objc_super v11 = [(SBMainSwitcherRootSwitcherModifier *)self switcherSettings];
  uint64_t v12 = [v11 effectiveSwitcherStyle];

  if (!v7 && v84 && v8 == 2)
  {
    v13 = [(SBMainSwitcherRootSwitcherModifier *)self floorModifierForTransitionEvent:v5];
    v14 = (SBSwitcherShelf *)[v13 copy];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v64 = [MEMORY[0x1E4F28B00] currentHandler];
      [v64 handleFailureInMethod:a2 object:self file:@"SBMainSwitcherRootSwitcherModifier.m" lineNumber:213 description:@"Expected instance of SBAppExposeGridSwitcherModifier"];
    }
    v15 = (void *)v6;
    if (v82 != 1)
    {
      v16 = (void *)v79;
      v17 = v80;
      v18 = v83;
      if (v82 == 2)
      {
        uint64_t v24 = [[SBSwitcherToAppExposeSwitcherModifier alloc] initWithTransitionID:v15 bundleIdentifier:v84 appExposeModifier:v14];
        goto LABEL_35;
      }
      if (v82 != 3)
      {
        uint64_t v24 = 0;
        goto LABEL_35;
      }
      objc_super v19 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
      v20 = (void *)[v19 copy];

      v18 = v83;
      v21 = [[SBAppExposeToFullScreenSwitcherModifier alloc] initWithTransitionID:v15 direction:1 fullScreenAppLayout:v80 floatingAppLayout:v79 bundleIdentifier:v84 appExposeModifier:v14 fullScreenModifier:v20];
LABEL_18:
      uint64_t v24 = (SBSwitcherToAppExposeSwitcherModifier *)v21;

LABEL_35:
      goto LABEL_36;
    }
    v26 = [[SBAppExposeToHomeSwitcherModifier alloc] initWithTransitionID:v6 direction:1 bundleIdentifier:v84 appExposeModifier:v14];
    goto LABEL_26;
  }
  if (v7 && !v84 && v82 == 2)
  {
    __int16 v22 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
    v14 = (SBSwitcherShelf *)[v22 copy];

    objc_opt_class();
    v15 = (void *)v6;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v71 = [MEMORY[0x1E4F28B00] currentHandler];
      [v71 handleFailureInMethod:a2 object:self file:@"SBMainSwitcherRootSwitcherModifier.m" lineNumber:226 description:@"Expected instance of SBAppExposeGridSwitcherModifier"];
    }
    v17 = v80;
    if (v8 != 1)
    {
      v16 = (void *)v79;
      if (v8 == 3)
      {
        v23 = [(SBMainSwitcherRootSwitcherModifier *)self floorModifierForTransitionEvent:v5];
        v20 = (void *)[v23 copy];

        [(SBMainSwitcherRootSwitcherModifier *)self _ensureModifier:v20 startsInFinalStateOfEvent:v5];
        v18 = v83;
        v21 = [[SBAppExposeToFullScreenSwitcherModifier alloc] initWithTransitionID:v15 direction:0 fullScreenAppLayout:v83 floatingAppLayout:v81 bundleIdentifier:v7 appExposeModifier:v14 fullScreenModifier:v20];
        goto LABEL_18;
      }
      uint64_t v24 = 0;
LABEL_34:
      v18 = v83;
      goto LABEL_35;
    }
    uint64_t v24 = [[SBAppExposeToHomeSwitcherModifier alloc] initWithTransitionID:v15 direction:0 bundleIdentifier:v7 appExposeModifier:v14];
LABEL_33:
    v16 = (void *)v79;
    goto LABEL_34;
  }
  v15 = (void *)v6;
  if (v7 && v84 && v8 == 2)
  {
    v25 = [(SBMainSwitcherRootSwitcherModifier *)self floorModifierForTransitionEvent:v5];
    v14 = (SBSwitcherShelf *)[v25 copy];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v75 = [MEMORY[0x1E4F28B00] currentHandler];
      [v75 handleFailureInMethod:a2 object:self file:@"SBMainSwitcherRootSwitcherModifier.m" lineNumber:242 description:@"Expected instance of SBAppExposeGridSwitcherModifier"];
    }
    v26 = [[SBSwitcherToAppExposeSwitcherModifier alloc] initWithTransitionID:v6 bundleIdentifier:v7 appExposeModifier:v14];
    goto LABEL_26;
  }
  uint64_t v78 = v8;
  if ([v5 isCenterWindowZoomingUpFromShelfEvent])
  {
    v14 = [v5 fromShelf];
    v27 = [SBShelfZoomTransitionModifier alloc];
    uint64_t v28 = v6;
    uint64_t v29 = 1;
LABEL_31:
    v17 = v80;
    v18 = v83;
    uint64_t v24 = [(SBShelfZoomTransitionModifier *)v27 initWithTransitionID:v28 direction:v29 fromAppLayout:v80 toAppLayout:v83 shelf:v14];
    v16 = (void *)v79;
    goto LABEL_35;
  }
  uint64_t v31 = v82;
  if (!v7 && v84 && v82 == 3)
  {
    uint64_t v32 = [v80 itemForLayoutRole:4];
    uint64_t v31 = 3;
    if (v32)
    {
      v33 = (void *)v32;
      v34 = [v83 itemForLayoutRole:4];
      if (v34)
      {

        uint64_t v31 = 3;
      }
      else
      {
        int v35 = [v80 hasSameItemsInLayoutRoles:6 asAppLayout:v83];

        uint64_t v31 = 3;
        if (v35)
        {
          v36 = [SBShelfZoomTransitionModifier alloc];
          v14 = [v5 toShelf];
          v27 = v36;
          uint64_t v28 = v6;
          uint64_t v29 = 0;
          goto LABEL_31;
        }
      }
    }
  }
  else if (v7 && !v84 && v82 == 3)
  {
    v14 = [[SBSwitcherShelf alloc] initWithBundleIdentifier:v7 layoutRole:0 displayMode:0];
    v26 = [[SBShelfIconBounceTransitionModifier alloc] initWithTransitionID:v6 shelf:v14];
LABEL_26:
    uint64_t v24 = (SBSwitcherToAppExposeSwitcherModifier *)v26;
    v17 = v80;
    goto LABEL_33;
  }
  if (v12 != 2)
  {
    uint64_t v24 = 0;
    v16 = (void *)v79;
    v17 = v80;
LABEL_59:
    v18 = v83;
    goto LABEL_36;
  }
  if (v31 != 2 || v78 != 3)
  {
    v16 = (void *)v79;
    if (v31 == 2 && v78 == 1)
    {
      v37 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
      v38 = (void *)[v37 copy];

      uint64_t v24 = [[SBMixedGridToHomeSwitcherModifier alloc] initWithTransitionID:v6 direction:0 mixedGridModifier:v38];
LABEL_76:
      v17 = v80;
      goto LABEL_77;
    }
    if (v78 == 2)
    {
      v17 = v80;
      if (SBPeekConfigurationIsValid([v5 toPeekConfiguration]))
      {
LABEL_66:
        uint64_t v24 = 0;
        goto LABEL_77;
      }
      switch(v82)
      {
        case 1:
          id v44 = [(SBMainSwitcherRootSwitcherModifier *)self _newMultitaskingModifierForEnvironmentMode:2];
          v45 = (void *)[v44 copy];

          uint64_t v24 = [[SBMixedGridToHomeSwitcherModifier alloc] initWithTransitionID:v15 direction:1 mixedGridModifier:v45];
          break;
        case 2:
          uint64_t v24 = [(SBTransitionSwitcherModifier *)[SBGridSwipeUpToSwitcherSwitcherModifier alloc] initWithTransitionID:v15];
          goto LABEL_77;
        case 3:
          v61 = [(SBMainSwitcherRootSwitcherModifier *)self floorModifierForTransitionEvent:v5];
          v45 = (void *)[v61 copy];

          id v62 = [(SBMainSwitcherRootSwitcherModifier *)self _newMultitaskingModifierForEnvironmentMode:2];
          uint64_t v24 = [[SBMixedGridToFullScreenSwitcherModifier alloc] initWithTransitionID:v15 direction:1 fullScreenAppLayout:v80 floatingAppLayout:v79 floatingConfiguration:v9 gridModifier:v62 fullScreenModifier:v45];

          break;
        default:
          goto LABEL_66;
      }

      goto LABEL_77;
    }
    if ([v5 isPrimaryToSlideOverEvent])
    {
      v42 = [SBSplitViewToSlideOverSwitcherModifier alloc];
      v43 = &SBLayoutRolePrimary;
LABEL_74:
      uint64_t v46 = *v43;
      v47 = [v5 fromAppLayout];
      v48 = [v5 toFloatingAppLayout];
      v49 = v42;
      uint64_t v50 = v6;
      uint64_t v51 = v46;
      v52 = v47;
      v53 = v48;
      uint64_t v54 = 0;
LABEL_75:
      uint64_t v24 = [(SBSplitViewToSlideOverSwitcherModifier *)v49 initWithTransitionID:v50 transitioningLayoutRole:v51 splitViewAppLayout:v52 slideOverAppLayout:v53 direction:v54];

      v16 = (void *)v79;
      goto LABEL_76;
    }
    if ([v5 isSideToSlideOverEvent])
    {
      v42 = [SBSplitViewToSlideOverSwitcherModifier alloc];
      v43 = &SBLayoutRoleSide;
      goto LABEL_74;
    }
    if ([v5 isSlideOverToSideEvent])
    {
      v59 = [SBSplitViewToSlideOverSwitcherModifier alloc];
      v60 = &SBLayoutRoleSide;
LABEL_92:
      uint64_t v63 = *v60;
      v47 = [v5 toAppLayout];
      v48 = [v5 fromFloatingAppLayout];
      v49 = v59;
      uint64_t v50 = v6;
      uint64_t v51 = v63;
      v52 = v47;
      v53 = v48;
      uint64_t v54 = 1;
      goto LABEL_75;
    }
    if ([v5 isSlideOverToPrimaryEvent])
    {
      v59 = [SBSplitViewToSlideOverSwitcherModifier alloc];
      v60 = &SBLayoutRolePrimary;
      goto LABEL_92;
    }
    if ([v5 isEnteringAnyPeekEvent]
      && ([v5 fromAppLayout],
          v65 = objc_claimAutoreleasedReturnValue(),
          [v65 itemForLayoutRole:2],
          v66 = objc_claimAutoreleasedReturnValue(),
          v66,
          v65,
          !v66))
    {
      if (([(SBMainSwitcherRootSwitcherModifier *)self isReduceMotionEnabled] & 1) == 0)
      {
        v77 = [SBFullScreenToPeekSwitcherModifier alloc];
        v68 = [v5 fromAppLayout];
        v69 = [v5 toAppLayout];
        v70 = [v5 fromFloatingAppLayout];
        v73 = [v5 toFloatingAppLayout];
        uint64_t v74 = -[SBFullScreenToPeekSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:peekConfiguration:](v77, "initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:peekConfiguration:", v6, v68, v69, v70, v73, [v5 toPeekConfiguration]);
        goto LABEL_104;
      }
    }
    else
    {
      if ([v5 isSlideOverToFullScreenEvent])
      {
        v67 = [SBSlideOverToFullScreenSwitcherModifier alloc];
        v68 = [v5 fromFloatingAppLayout];
        v69 = [v5 toAppLayout];
        v70 = [v5 fromAppLayout];
        uint64_t v24 = [(SBSlideOverToFullScreenSwitcherModifier *)v67 initWithTransitionID:v6 slideOverAppLayout:v68 fullScreenAppLayout:v69 replacingMainAppLayout:v70];
LABEL_105:

        goto LABEL_106;
      }
      if ([v5 isCenterWindowToSlideOverEvent])
      {
        v72 = [SBCenterWindowToSlideOverSwitcherModifier alloc];
        v68 = [v5 fromAppLayout];
        v69 = [v5 fromAppLayout];
        v70 = [v5 fromFloatingAppLayout];
        v73 = [v5 toFloatingAppLayout];
        uint64_t v74 = -[SBCenterWindowToSlideOverSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:toFloatingConfiguration:direction:](v72, "initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:toFloatingConfiguration:direction:", v6, v68, v69, v70, v73, [v5 toFloatingConfiguration], 0);
LABEL_104:
        uint64_t v24 = (SBSwitcherToAppExposeSwitcherModifier *)v74;

        v15 = (void *)v6;
        goto LABEL_105;
      }
      if ([v5 isSlideOverToCenterWindowEvent])
      {
        v76 = [SBCenterWindowToSlideOverSwitcherModifier alloc];
        v68 = [v5 fromAppLayout];
        v69 = [v5 toAppLayout];
        v70 = [v5 fromFloatingAppLayout];
        v73 = [v5 toFloatingAppLayout];
        uint64_t v74 = -[SBCenterWindowToSlideOverSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:toFloatingConfiguration:direction:](v76, "initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:toFloatingConfiguration:direction:", v6, v68, v69, v70, v73, [v5 toFloatingConfiguration], 1);
        goto LABEL_104;
      }
    }
    uint64_t v24 = 0;
    v15 = (void *)v6;
LABEL_106:
    v17 = v80;
    goto LABEL_57;
  }
  v17 = v80;
  if (SBPeekConfigurationIsValid([v5 fromPeekConfiguration]))
  {
    uint64_t v24 = 0;
LABEL_57:
    v16 = (void *)v79;
LABEL_77:
    v18 = v83;
    goto LABEL_78;
  }
  id v39 = [(SBMainSwitcherRootSwitcherModifier *)self _newMultitaskingModifierForEnvironmentMode:2];
  [(SBMainSwitcherRootSwitcherModifier *)self _ensureModifier:v39 startsInFinalStateOfEvent:v5];
  v40 = [(SBMainSwitcherRootSwitcherModifier *)self floorModifierForTransitionEvent:v5];
  v41 = (void *)[v40 copy];

  uint64_t v24 = [[SBMixedGridToFullScreenSwitcherModifier alloc] initWithTransitionID:v15 direction:0 fullScreenAppLayout:v83 floatingAppLayout:v81 floatingConfiguration:v10 gridModifier:v39 fullScreenModifier:v41];
  v18 = v83;
  v16 = (void *)v79;
LABEL_78:
  if ([v5 isKeyboardShortcutInitiated]
    && v82 == 3
    && v78 == 1
    && [v5 isEnteringAnyPeekEvent])
  {
    v55 = [v5 fromAppLayout];
    int v56 = [v55 isSplitConfiguration];

    if (v56)
    {
      v57 = [SBSplitViewToPeekTransitionSwitcherModifier alloc];
      v14 = [v5 fromAppLayout];
      uint64_t v58 = [(SBSplitViewToPeekTransitionSwitcherModifier *)v57 initWithTransitionID:v15 fromAppLayout:v14];

      uint64_t v24 = (SBSwitcherToAppExposeSwitcherModifier *)v58;
      goto LABEL_34;
    }
    goto LABEL_59;
  }
LABEL_36:

  return v24;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  id v4 = a3;
  if ([(SBMainSwitcherRootSwitcherModifier *)self _correctFloorModifierToHandleEvent])
  {
    id v5 = [SBInsertionSwitcherModifier alloc];
    uint64_t v6 = [v4 appLayout];
    uint64_t v7 = [(SBInsertionSwitcherModifier *)v5 initWithAppLayout:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3
{
  id v4 = a3;
  if ([(SBMainSwitcherRootSwitcherModifier *)self _correctFloorModifierToHandleEvent])
  {
    id v5 = [SBSwipeToKillSwitcherModifier alloc];
    uint64_t v6 = [v4 layoutRole];
    uint64_t v7 = [v4 appLayout];
    uint64_t v8 = [(SBSwipeToKillSwitcherModifier *)v5 initWithLayoutRole:v6 inAppLayout:v7 fadeOutSwipedItems:0];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)highlightModifierForHighlightEvent:(id)a3
{
  id v4 = a3;
  if (-[SBMainSwitcherRootSwitcherModifier _correctFloorModifierToHandleEvent](self, "_correctFloorModifierToHandleEvent")&& ([v4 isHoverEvent] & 1) == 0)
  {
    uint64_t v6 = [SBHighlightSwitcherModifier alloc];
    uint64_t v7 = [v4 layoutRole];
    uint64_t v8 = [v4 appLayout];
    id v5 = [(SBHighlightSwitcherModifier *)v6 initWithLayoutRole:v7 inAppLayout:v8 listensForHighlightEvents:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)removalModifierForRemovalEvent:(id)a3
{
  id v4 = a3;
  if ([(SBMainSwitcherRootSwitcherModifier *)self _correctFloorModifierToHandleEvent])
  {
    id v5 = [SBRemovalSwitcherModifier alloc];
    uint64_t v6 = [v4 layoutRole];
    uint64_t v7 = [v4 appLayout];
    uint64_t v8 = -[SBRemovalSwitcherModifier initWithLayoutRole:inAppLayout:reason:](v5, "initWithLayoutRole:inAppLayout:reason:", v6, v7, [v4 reason]);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = SBSafeCast(v5, v4);

  uint64_t v7 = [v6 toEnvironmentMode];
  id v8 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
  if (!v6)
  {
    uint64_t v12 = [(SBMainSwitcherRootSwitcherModifier *)self _createNewDefaultFloorModifier];
    uint64_t v9 = v8;
    goto LABEL_18;
  }
  uint64_t v9 = [v6 toAppExposeBundleID];
  if (v9) {
    BOOL v10 = v7 == 2;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v8 bundleIdentifier],
          v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 isEqualToString:v9],
          v13,
          (v14 & 1) == 0))
    {
      objc_super v11 = -[SBAppExposeGridSwitcherModifier initWithBundleIdentifier:fullScreenCardSize:floatingCardSize:]([SBAppExposeGridSwitcherModifier alloc], "initWithBundleIdentifier:fullScreenCardSize:floatingCardSize:", v9, *(double *)&self->super._hasPerformedInitialSetup, self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, self->_floatingCardSize.width);
      goto LABEL_14;
    }
  }
  else if (v7 == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && !SBPeekConfigurationIsValid([v6 toPeekConfiguration]))
    {
      objc_super v11 = -[SBMixedGridSwitcherModifier initWithFullScreenCardSize:floatingCardSize:]([SBMixedGridSwitcherModifier alloc], "initWithFullScreenCardSize:floatingCardSize:", *(double *)&self->super._hasPerformedInitialSetup, self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, self->_floatingCardSize.width);
LABEL_14:
      uint64_t v12 = v11;

      goto LABEL_18;
    }
  }
  else if (!SBPeekConfigurationIsValid([v6 toPeekConfiguration]))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v11 = [(SBMainSwitcherRootSwitcherModifier *)self _createNewDefaultFloorModifier];
      goto LABEL_14;
    }
  }
  uint64_t v12 = v8;
LABEL_18:

  return v12;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  return 0;
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  if ([(SBMainSwitcherRootSwitcherModifier *)self _correctFloorModifierToHandleEvent])
  {
    id v3 = objc_alloc_init(SBScrollingSwitcherModifier);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)shelfModifierForTransitionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 toAppExposeBundleID];
  if (v5 && [v4 toEnvironmentMode] == 3)
  {
    uint64_t v6 = [[SBSwitcherShelf alloc] initWithBundleIdentifier:v5 layoutRole:0 displayMode:0];
    uint64_t v7 = [(SBSwitcherShelf *)v6 uniqueIdentifier];
    id v8 = [(SBChainableModifier *)self childModifierByKey:v7];

    uint64_t v9 = 0;
    if (!v8)
    {
      BOOL v10 = [v4 activatingAppLayout];

      if (v10)
      {
        objc_super v11 = [v4 toAppLayout];
        [(SBMainSwitcherRootSwitcherModifier *)self homeScreenIconFrameForAppLayout:v11];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
      }
      else
      {
        double v13 = *MEMORY[0x1E4F1DB20];
        double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      }
      unint64_t v20 = +[SBShelfSwitcherModifier contentOptionsForTransitionEvent:v4 context:self];
      v21 = [SBShelfSwitcherModifier alloc];
      __int16 v22 = [v4 toAppLayout];
      v23 = [v4 toFloatingAppLayout];
      uint64_t v24 = [v4 fromAppLayout];
      uint64_t v9 = -[SBShelfSwitcherModifier initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:](v21, "initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:", v6, v20, v22, v23, v24, v13, v15, v17, v19);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3
{
  if ([(SBMainSwitcherRootSwitcherModifier *)self isReduceMotionEnabled])
  {
    id v4 = [(SBMainSwitcherRootSwitcherModifier *)self switcherSettings];
    uint64_t v5 = [v4 effectiveSwitcherStyle];

    uint64_t v6 = off_1E6AEFB60;
    if (v5 != 1) {
      uint64_t v6 = off_1E6AEFB78;
    }
    id v7 = objc_alloc_init(*v6);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3
{
  id v3 = a3;
  id v4 = [SBFocusedAppLayoutSwitcherModifier alloc];
  uint64_t v5 = [v3 appLayout];

  uint64_t v6 = [(SBFocusedAppLayoutSwitcherModifier *)v4 initWithFocusedAppLayout:v5];
  return v6;
}

- (id)_createNewDefaultFloorModifier
{
  v2 = objc_alloc_init(SBSplitViewRootSwitcherModifier);
  id v3 = objc_alloc_init(SBFloatingFluidSwitcherRootSwitcherModifier);
  id v4 = [[SBMainSwitcherRoutingSwitcherModifier alloc] initWithMainModifierSubtree:v2 floatingModifierSubtree:v3];

  return v4;
}

- (id)_newMultitaskingModifierForEnvironmentMode:(int64_t)a3
{
  uint64_t v5 = [(SBMainSwitcherRootSwitcherModifier *)self switcherSettings];
  uint64_t v6 = [v5 effectiveSwitcherStyle];

  if (a3 == 2)
  {
    id v7 = [SBMixedGridSwitcherModifier alloc];
    double v8 = *(double *)&self->super._hasPerformedInitialSetup;
    double width = self->_fullScreenCardSize.width;
    double height = self->_fullScreenCardSize.height;
    double v11 = self->_floatingCardSize.width;
    return -[SBMixedGridSwitcherModifier initWithFullScreenCardSize:floatingCardSize:](v7, "initWithFullScreenCardSize:floatingCardSize:", v8, width, height, v11);
  }
  else if (v6 == 1)
  {
    return objc_alloc_init(SBDeckSwitcherModifier);
  }
  else
  {
    [(SBMainSwitcherRootSwitcherModifier *)self _createNewDefaultFloorModifier];
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_setCardSizesWithEvent:(id)a3
{
  id v12 = a3;
  [(SBMainSwitcherRootSwitcherModifier *)self containerViewBounds];
  *(void *)&self->super._hasPerformedInitialSetup = v4;
  self->_fullScreenCardSize.double width = v5;
  if (v12)
  {
    uint64_t v6 = [v12 toInterfaceOrientation];
    uint64_t v7 = [v12 toFloatingConfiguration];
    double v8 = self;
    uint64_t v9 = v6;
  }
  else
  {
    uint64_t v9 = [(SBMainSwitcherRootSwitcherModifier *)self switcherInterfaceOrientation];
    double v8 = self;
    uint64_t v7 = 2;
  }
  [(SBMainSwitcherRootSwitcherModifier *)v8 floatingApplicationFrameInInterfaceOrientation:v9 floatingConfiguration:v7];
  self->_fullScreenCardSize.double height = v10;
  self->_floatingCardSize.double width = v11;
}

- (void)_ensureModifier:(id)a3 startsInFinalStateOfEvent:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 unhandledCopy];
  [v7 setAnimated:0];
  [v7 setPhase:2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__SBMainSwitcherRootSwitcherModifier__ensureModifier_startsInFinalStateOfEvent___block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v9 usingBlock:v10];
}

id __80__SBMainSwitcherRootSwitcherModifier__ensureModifier_startsInFinalStateOfEvent___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) handleEvent:*(void *)(a1 + 40)];
}

- (BOOL)_correctFloorModifierToHandleEvent
{
  id v3 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    CGFloat v5 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_floatingSwitcherVisible, 0);
}

@end