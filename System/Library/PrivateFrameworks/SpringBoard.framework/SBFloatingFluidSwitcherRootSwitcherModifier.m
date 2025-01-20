@interface SBFloatingFluidSwitcherRootSwitcherModifier
- (BOOL)isFloatingSwitcherVisible;
- (CGRect)containerViewBounds;
- (Class)_defaultMultitaskingModifierClass;
- (SBAppLayout)activeAppLayout;
- (SBFloatingFluidSwitcherRootSwitcherModifier)init;
- (id)_entityRemovalModifierForEvent:(id)a3;
- (id)_newMultitaskingModifier;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)appExposeAccessoryButtonsBundleIdentifier;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)floorModifierForTransitionEvent:(id)a3;
- (id)gestureModifierForGestureEvent:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)highlightModifierForHighlightEvent:(id)a3;
- (id)insertionModifierForInsertionEvent:(id)a3;
- (id)lowEndHardwareModifier;
- (id)multitaskingModifierForEvent:(id)a3;
- (id)removalModifierForRemovalEvent:(id)a3;
- (id)shelfModifierForTransitionEvent:(id)a3;
- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transientlyVisibleSlideOverTongueModifierForEvent:(id)a3;
- (id)transitionModifierForMainTransitionEvent:(id)a3;
- (id)userScrollingModifierForScrollEvent:(id)a3;
- (int64_t)floatingConfiguration;
- (int64_t)interfaceOrientation;
- (void)_updateContainerViewBounds;
- (void)setActiveAppLayout:(id)a3;
- (void)setContainerViewBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setFloatingConfiguration:(int64_t)a3;
- (void)setFloatingSwitcherVisible:(BOOL)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
@end

@implementation SBFloatingFluidSwitcherRootSwitcherModifier

- (SBFloatingFluidSwitcherRootSwitcherModifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  v2 = [(SBSwitcherModifier *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)&v2->_floatingSwitcherVisible;
    *(void *)&v2->_floatingSwitcherVisible = 0;

    v3->_activeAppLayout = (SBAppLayout *)1;
    v3->_interfaceOrientation = 4;
    v3->super._hasPerformedInitialSetup = 0;
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier setDelegate:](&v5, sel_setDelegate_);
  if (a3) {
    [(SBFloatingFluidSwitcherRootSwitcherModifier *)self _updateContainerViewBounds];
  }
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] != 1)
  {
    v10 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = objc_opt_class();
  objc_super v6 = SBSafeCast(v5, v4);
  v7 = [v6 toFloatingAppLayout];
  int v8 = [v6 toFloatingSwitcherVisible];
  if ((unint64_t)[v6 phase] >= 2)
  {
    if ((v8 & 1) == 0 && [v6 toEnvironmentMode] != 2) {
      self->_interfaceOrientation = [v6 toFloatingConfiguration];
    }
    self->_activeAppLayout = (SBAppLayout *)[v6 toInterfaceOrientation];
    [(SBFloatingFluidSwitcherRootSwitcherModifier *)self _updateContainerViewBounds];
  }
  if (!BSEqualObjects())
  {
    objc_storeStrong((id *)&self->_floatingSwitcherVisible, v7);
    p_hasPerformedInitialSetup = &self->super._hasPerformedInitialSetup;
    if (self->super._hasPerformedInitialSetup == v8)
    {
LABEL_13:
      v10 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
      goto LABEL_14;
    }
LABEL_12:
    BOOL *p_hasPerformedInitialSetup = v8;
    goto LABEL_13;
  }
  p_hasPerformedInitialSetup = &self->super._hasPerformedInitialSetup;
  if (self->super._hasPerformedInitialSetup != v8) {
    goto LABEL_12;
  }
  v10 = 0;
LABEL_14:

LABEL_15:
  v14.receiver = self;
  v14.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  v11 = [(SBFluidSwitcherRootSwitcherModifier *)&v14 handleEvent:v4];
  v12 = +[SBChainableModifierEventResponse responseByAppendingResponse:v11 toResponse:v10];

  return v12;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  uint64_t v5 = [(SBSwitcherModifier *)&v11 handleTapAppLayoutEvent:v4];
  objc_super v6 = [v4 appLayout];
  if (([v4 isHandled] & 1) == 0
    && [v6 isEqual:*(void *)&self->_floatingSwitcherVisible]
    && [v4 source] == 1)
  {
    v7 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:v4];
    int v8 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v7 gestureInitiated:0];
    uint64_t v9 = SBAppendSwitcherModifierResponse(v8, v5);

    uint64_t v5 = (void *)v9;
  }

  return v5;
}

- (CGRect)containerViewBounds
{
  double v2 = *(double *)&self->_floatingConfiguration;
  double x = self->_containerViewBounds.origin.x;
  double y = self->_containerViewBounds.origin.y;
  double width = self->_containerViewBounds.size.width;
  result.size.height = width;
  result.size.double width = y;
  result.origin.double y = x;
  result.origin.double x = v2;
  return result;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  uint64_t v5 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)&v15 appLayoutsToEnsureExistForMainTransitionEvent:v4];
  objc_super v6 = [v4 fromFloatingAppLayout];
  v7 = [v4 toFloatingAppLayout];
  if ((BSEqualObjects() & 1) != 0
    || ([v4 fromFloatingSwitcherVisible] & 1) != 0
    || ([v4 isDragAndDropTransition] & 1) != 0)
  {
    id v8 = v5;
  }
  else
  {
    id v8 = (id)[v5 mutableCopy];
    if (!v8) {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    v10 = [v4 fromDisplayItemsPendingTermination];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__SBFloatingFluidSwitcherRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke;
    v13[3] = &unk_1E6AF4B38;
    id v11 = v6;
    id v14 = v11;
    char v12 = objc_msgSend(v10, "bs_containsObjectPassingTest:", v13);

    if (v11 && (v12 & 1) == 0) {
      [v8 addObject:v11];
    }
    if (v7) {
      [v8 addObject:v7];
    }
  }
  return v8;
}

uint64_t __93__SBFloatingFluidSwitcherRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsItem:a2];
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  id v4 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)&v13 adjustedAppLayoutsForAppLayouts:a3];
  uint64_t v5 = v4;
  if (self->super._hasPerformedInitialSetup)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [v5 indexOfObject:*(void *)&self->_floatingSwitcherVisible];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0)
    {
      [v6 addObjectsFromArray:v5];
    }
    else
    {
      uint64_t v9 = v7;
      v10 = objc_msgSend(v5, "subarrayWithRange:", v9, objc_msgSend(v5, "count") - v9);
      [v6 addObjectsFromArray:v10];

      id v11 = objc_msgSend(v5, "subarrayWithRange:", 0, v9);
      [v6 addObjectsFromArray:v11];
    }
  }

  return v6;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return 0;
}

- (id)topMostLayoutElements
{
  v18.receiver = self;
  v18.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  v3 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)&v18 switcherDimmingViewLayoutElement];
  v17.receiver = self;
  v17.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  id v4 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)&v17 switcherBackdropLayoutElement];
  v16.receiver = self;
  v16.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  uint64_t v5 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)&v16 slideOverTongueLayoutElement];
  id v6 = (void *)v5;
  if (v3) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v4 == 0;
  }
  if (v7 && v5 == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
    id v12 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)&v14 topMostLayoutElements];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = v9;
    if (v3) {
      [v9 addObject:v3];
    }
    if (v4) {
      [v10 addObject:v4];
    }
    if (v6) {
      [v10 addObject:v6];
    }
    v15.receiver = self;
    v15.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
    id v11 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)&v15 topMostLayoutElements];
    if (v11)
    {
      id v12 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v11];
      [v12 addObjectsFromArray:v10];
    }
    else
    {
      id v12 = v10;
    }
  }
  return v12;
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 gestureType];
  id v6 = [v4 gestureID];
  BOOL v7 = 0;
  switch(v5)
  {
    case 1:
      if (([(SBFloatingFluidSwitcherRootSwitcherModifier *)self isReduceMotionEnabled] & 1) == 0)
      {
        v10 = [[SBExternalHomeGestureFloatingSwitcherModifier alloc] initWithGestureID:v6 initialFloatingConfiguration:self->_interfaceOrientation interfaceOrientation:self->_activeAppLayout];
        goto LABEL_11;
      }
      BOOL v7 = 0;
      break;
    case 3:
      id v8 = [SBHomeGestureRootFloatingSwitcherModifier alloc];
      id v9 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
      BOOL v7 = [(SBHomeGestureRootFloatingSwitcherModifier *)v8 initWithMultitaskingModifier:v9 floatingConfiguration:self->_interfaceOrientation];

      break;
    case 4:
      v10 = [[SBMoveGestureRootFloatingSwitcherModifier alloc] initWithInitialFloatingConfiguration:self->_interfaceOrientation interfaceOrientation:self->_activeAppLayout];
      goto LABEL_11;
    case 5:
      v10 = [[SBSwitcherSwipeUpGestureFloatingSwitcherModifier alloc] initWithGestureID:v6];
LABEL_11:
      BOOL v7 = (SBFloatingDragAndDropGestureSwitcherModifier *)v10;
      break;
    case 6:
      id v11 = v4;
      id v12 = [*(id *)&self->_floatingSwitcherVisible itemForLayoutRole:1];
      objc_super v13 = [v12 uniqueIdentifier];

      if (v13
        && ([v11 draggedSceneIdentifier],
            objc_super v14 = objc_claimAutoreleasedReturnValue(),
            char v15 = [v14 isEqualToString:v13],
            v14,
            (v15 & 1) == 0))
      {
        BOOL v7 = [[SBFloatingDragAndDropGestureSwitcherModifier alloc] initWithGestureID:v6 floatingSwitcherVisible:self->super._hasPerformedInitialSetup floatingConfiguration:self->_interfaceOrientation interfaceOrientation:self->_activeAppLayout];
      }
      else
      {
        BOOL v7 = 0;
      }

      break;
    default:
      break;
  }

  return v7;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fromFloatingAppLayout];
  uint64_t v6 = [v4 toFloatingAppLayout];
  int v7 = [v4 fromFloatingSwitcherVisible];
  int v8 = [v4 toFloatingSwitcherVisible];
  int v9 = [v4 isDragAndDropTransition];
  uint64_t v62 = [v4 fromFloatingConfiguration];
  uint64_t v61 = [v4 toFloatingConfiguration];
  v10 = [v4 transitionID];
  uint64_t v11 = [v4 toAppExposeBundleID];
  if (v11)
  {
    id v12 = (void *)v11;
    uint64_t v13 = v6;
    uint64_t v14 = v5;
    uint64_t v15 = [v4 toEnvironmentMode];

    BOOL v29 = v15 == 2;
    uint64_t v5 = v14;
    uint64_t v6 = v13;
    if (v29) {
      goto LABEL_4;
    }
  }
  if (v8)
  {
    if (v7)
    {
      objc_super v17 = [(SBTransitionSwitcherModifier *)[SBSwitcherSwipeUpToSwitcherFloatingSwitcherModifier alloc] initWithTransitionID:v10];
LABEL_15:
      objc_super v16 = (SBMoveFloatingConfigurationFloatingSwitcherModifier *)v17;
      goto LABEL_16;
    }
    uint64_t v25 = v5;
    v26 = [SBSwitcherToActiveFloatingSwitcherModifier alloc];
    id v20 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
    v21 = v26;
    uint64_t v5 = v25;
    v22 = v10;
    uint64_t v23 = 1;
    uint64_t v24 = v25;
    goto LABEL_11;
  }
  if (v7)
  {
    uint64_t v18 = v5;
    v19 = [SBSwitcherToActiveFloatingSwitcherModifier alloc];
    id v20 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
    v21 = v19;
    uint64_t v5 = v18;
    v22 = v10;
    uint64_t v23 = 0;
    uint64_t v24 = v6;
LABEL_11:
    uint64_t v27 = [(SBSwitcherToActiveFloatingSwitcherModifier *)v21 initWithTransitionID:v22 direction:v23 fullScreenAppLayout:v24 floatingDeckModifier:v20];
LABEL_12:
    objc_super v16 = (SBMoveFloatingConfigurationFloatingSwitcherModifier *)v27;

    goto LABEL_16;
  }
  if (v9)
  {
    objc_super v17 = [[SBDropApplicationFloatingSwitcherModifier alloc] initWithTransitionID:v10 fromAppLayout:v5 toAppLayout:v6];
    goto LABEL_15;
  }
  objc_super v16 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)self _entityRemovalModifierForEvent:v4];
  if (!v16)
  {
    if ([v4 isMoveDisplaysTransition])
    {
      objc_super v17 = [[SBMoveDisplaysTransitionSwitcherModifier alloc] initWithTransitionEvent:v4];
      goto LABEL_15;
    }
    if (([v4 isAnySplitViewToOrFromSlideOverEvent] & 1) == 0
      && ([v4 isSlideOverToFullScreenEvent] & 1) == 0)
    {
      if (v5) {
        BOOL v29 = v6 == 0;
      }
      else {
        BOOL v29 = 1;
      }
      int v30 = !v29;
      if (!v29)
      {
        if ([(id)v5 isEqual:v6])
        {
          uint64_t v31 = v5;
          uint64_t v32 = [v4 fromInterfaceOrientation];
          BOOL v29 = v32 == [v4 toInterfaceOrientation];
          uint64_t v5 = v31;
          if (!v29)
          {
            v38 = [SBRotationSwitcherModifier alloc];
            id v20 = [v4 toFloatingAppLayout];
            uint64_t v39 = [v4 fromInterfaceOrientation];
            uint64_t v40 = [v4 toInterfaceOrientation];
            v41 = v38;
            uint64_t v5 = v31;
            uint64_t v27 = [(SBRotationSwitcherModifier *)v41 initWithTransitionID:v10 appLayout:v20 fromInterfaceOrientation:v39 toInterfaceOrientation:v40];
            goto LABEL_12;
          }
        }
      }
      if (([v4 isEnteringSplitViewPeekEvent] & 1) == 0
        && ([v4 isEnteringSlideOverPeekEvent] & 1) == 0)
      {
        if ([v4 isExitingSlideOverPeekToAppEvent])
        {
          uint64_t v33 = v5;
          v34 = [SBExitSlideOverPeekSwitcherModifier alloc];
          uint64_t v35 = *(void *)&self->_floatingSwitcherVisible;
          uint64_t v36 = [v4 toFloatingConfiguration];
          v37 = v34;
          uint64_t v5 = v33;
          objc_super v17 = [(SBExitSlideOverPeekSwitcherModifier *)v37 initWithTransitionID:v10 floatingAppLayout:v35 floatingConfiguration:v36];
          goto LABEL_15;
        }
        if ([v4 isExitingSlideOverPeekToHomeScreenEvent])
        {
          uint64_t v42 = v5;
          v43 = [SBPeekToOffscreenSwitcherModifier alloc];
          id v20 = [v4 fromFloatingAppLayout];
          uint64_t v44 = [v4 fromPeekConfiguration];
          v45 = v43;
          uint64_t v5 = v42;
          uint64_t v27 = [(SBPeekToOffscreenSwitcherModifier *)v45 initWithTransitionID:v10 peekingAppLayout:v20 peekConfiguration:v44 spaceConfiguration:1];
          goto LABEL_12;
        }
        if (!SBPeekConfigurationIsValid([v4 toPeekConfiguration])
          && ([v4 isSlideOverToCenterWindowEvent] & 1) == 0)
        {
          v46 = (void *)v5;
          if ([v4 isFloatingPulseEvent])
          {
            v47 = [SBPulseTransitionSwitcherModifier alloc];
            v48 = [v4 toFloatingAppLayout];
            objc_super v16 = [(SBPulseTransitionSwitcherModifier *)v47 initWithTransitionID:v10 appLayout:v48];

LABEL_67:
            uint64_t v5 = (uint64_t)v46;
            goto LABEL_16;
          }
          if (v30)
          {
            if (([(id)v5 isEqual:v6] & 1) == 0 && v62 == v61)
            {
              if ([v4 fromWindowPickerRole] == 3)
              {
                uint64_t v49 = [v4 fromWindowPickerRole];
                if (v49 == [v4 toWindowPickerRole])
                {
                  uint64_t v5 = (uint64_t)v46;
                  objc_super v17 = [[SBSplitDisplayItemCrossblurSwitcherModifier alloc] initWithTransitionID:v10 fromAppLayout:v46 toAppLayout:v6 layoutRole:1];
                  goto LABEL_15;
                }
              }
              if (([v4 isNewSceneTransition] & 1) != 0
                || [v4 isMorphFromInAppView])
              {
                uint64_t v5 = (uint64_t)v46;
                objc_super v17 = [[SBSlideFloatingAppFromBottomSwitcherModifier alloc] initWithTransitionID:v10 fromFloatingAppLayout:v46 toFloatingAppLayout:v6];
                goto LABEL_15;
              }
              if (([v4 isCenterWindowToSlideOverEvent] & 1) == 0)
              {
                BOOL v58 = [v4 dosidoTransitionDirection] == 1;
                v59 = [SBArcSwipeFloatingSwitcherModifier alloc];
                BOOL v60 = v58;
                uint64_t v5 = (uint64_t)v46;
                objc_super v17 = [(SBArcSwipeFloatingSwitcherModifier *)v59 initWithTransitionID:v10 fromAppLayout:v46 toAppLayout:v6 floatingConfiguration:v62 direction:v60 needsOvershoot:1];
                goto LABEL_15;
              }
              goto LABEL_66;
            }
          }
          else
          {
            if (!(v5 | v6)) {
              goto LABEL_66;
            }
            if (!v6)
            {
              if (!v5) {
                goto LABEL_61;
              }
              goto LABEL_59;
            }
          }
          v50 = [v4 fromAppLayout];
          v51 = [(id)v6 itemForLayoutRole:1];
          int v52 = [v50 containsItem:v51];

          if (!v46 || v52)
          {
LABEL_60:
            if ((v52 & 1) == 0)
            {
LABEL_61:
              BOOL v55 = [v4 fromWindowPickerRole] == 3;
              uint64_t v56 = [v4 toWindowPickerRole];
              int v57 = v56 == 3 || v55;
              if (v57 != 1 || ((v55 ^ (v56 == 3)) & 1) == 0)
              {
                objc_super v16 = [[SBMoveFloatingConfigurationFloatingSwitcherModifier alloc] initWithTransitionID:v10 fromFloatingConfiguration:v62 toFloatingConfiguration:v61];
                goto LABEL_67;
              }
            }
LABEL_66:
            objc_super v16 = 0;
            goto LABEL_67;
          }
LABEL_59:
          v53 = [v4 toAppLayout];
          v54 = [v46 itemForLayoutRole:1];
          LOBYTE(v52) = [v53 containsItem:v54];

          goto LABEL_60;
        }
      }
    }
LABEL_4:
    objc_super v16 = 0;
  }
LABEL_16:

  return v16;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 toFloatingSwitcherVisible];
  uint64_t v6 = [v4 toFloatingAppLayout];
  uint64_t v7 = [v4 toEnvironmentMode];
  if (v5)
  {
    int v8 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
    goto LABEL_10;
  }
  if (SBPeekConfigurationIsValid([v4 toPeekConfiguration]) && v6)
  {
    int v9 = [v4 toAppLayout];

    if (!v9)
    {
      int v8 = -[SBSlideOverPeekSwitcherModifier initWithAppLayout:peekConfiguration:environmentMode:fromFloatingConfiguration:]([SBSlideOverPeekSwitcherModifier alloc], "initWithAppLayout:peekConfiguration:environmentMode:fromFloatingConfiguration:", v6, [v4 toPeekConfiguration], v7, objc_msgSend(v4, "fromFloatingConfiguration"));
      goto LABEL_10;
    }
  }
  else if (!v6)
  {
    goto LABEL_11;
  }
  if (!SBFloatingConfigurationIsStashed(self->_interfaceOrientation))
  {
    int v8 = [[SBActiveAppLayoutFloatingSwitcherModifier alloc] initWithActiveAppLayout:v6 floatingConfiguration:self->_interfaceOrientation environmentMode:v7];
LABEL_10:
    v10 = (SBStashedFloatingSwitcherModifier *)v8;
    if (v8) {
      goto LABEL_12;
    }
  }
LABEL_11:
  v10 = [[SBStashedFloatingSwitcherModifier alloc] initWithFloatingConfiguration:self->_interfaceOrientation environmentMode:v7];
LABEL_12:

  return v10;
}

- (id)shelfModifierForTransitionEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 toFloatingAppLayout];
  uint64_t v6 = [v4 toWindowPickerRole];
  uint64_t v7 = [v4 fromWindowPickerRole];
  BOOL v8 = v6 != 3 || v7 == 3;
  if (v8 || [v4 toEnvironmentMode] != 3)
  {
    uint64_t v14 = 0;
  }
  else
  {
    int v9 = [v5 itemForLayoutRole:1];
    v10 = [v9 bundleIdentifier];

    uint64_t v11 = [[SBSwitcherShelf alloc] initWithBundleIdentifier:v10 layoutRole:v6 displayMode:1];
    id v12 = [(SBSwitcherShelf *)v11 uniqueIdentifier];
    uint64_t v13 = [(SBChainableModifier *)self childModifierByKey:v12];

    if (v13)
    {
      uint64_t v14 = 0;
    }
    else
    {
      unint64_t v15 = +[SBShelfSwitcherModifier contentOptionsForTransitionEvent:v4 context:self];
      objc_super v16 = [SBShelfSwitcherModifier alloc];
      objc_super v17 = [v4 toAppLayout];
      uint64_t v18 = [v4 fromAppLayout];
      uint64_t v14 = -[SBShelfSwitcherModifier initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:](v16, "initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:", v11, v15, v17, v5, v18, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    }
  }

  return v14;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  id v4 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)self _defaultMultitaskingModifierClass];
  int v5 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
  if (([v5 isMemberOfClass:v4] & 1) == 0)
  {
    id v6 = objc_alloc_init(v4);

    int v5 = v6;
  }
  return v5;
}

- (id)_entityRemovalModifierForEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 fromFloatingAppLayout];
  if (v5)
  {
    id v6 = [v4 removalContextForAppLayout:v5];
    if (v6)
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      if (!SBReduceMotion() && (unint64_t)([v6 animationStyle] - 1) <= 2) {
        uint64_t v7 = (objc_class *)objc_opt_class();
      }
      id v8 = [v7 alloc];
      int v9 = [v4 transitionID];
      v10 = [v4 fromFloatingAppLayout];
      uint64_t v11 = [v4 toFloatingAppLayout];
      id v12 = (void *)[v8 initWithTransitionID:v9 fromAppLayout:v10 toAppLayout:v11 floatingConfiguration:self->_interfaceOrientation];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  id v3 = a3;
  id v4 = [SBInsertionSwitcherModifier alloc];
  int v5 = [v3 appLayout];

  id v6 = [(SBInsertionSwitcherModifier *)v4 initWithAppLayout:v5];
  return v6;
}

- (id)highlightModifierForHighlightEvent:(id)a3
{
  return 0;
}

- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3
{
  id v3 = a3;
  id v4 = [SBSwipeToKillSwitcherModifier alloc];
  uint64_t v5 = [v3 layoutRole];
  id v6 = [v3 appLayout];

  uint64_t v7 = [(SBSwipeToKillSwitcherModifier *)v4 initWithLayoutRole:v5 inAppLayout:v6 fadeOutSwipedItems:0];
  return v7;
}

- (id)removalModifierForRemovalEvent:(id)a3
{
  id v3 = a3;
  id v4 = [SBRemovalSwitcherModifier alloc];
  uint64_t v5 = [v3 layoutRole];
  id v6 = [v3 appLayout];
  uint64_t v7 = [v3 reason];

  id v8 = [(SBRemovalSwitcherModifier *)v4 initWithLayoutRole:v5 inAppLayout:v6 reason:v7];
  return v8;
}

- (id)lowEndHardwareModifier
{
  double v2 = +[SBPlatformController sharedInstance];
  BOOL v3 = [v2 medusaCapabilities] == 1;

  id v4 = [[SBFloatingLowEndHardwareModifier alloc] initWithOptions:v3];
  return v4;
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  BOOL v3 = objc_alloc_init(SBScrollingSwitcherModifier);
  return v3;
}

- (id)transientlyVisibleSlideOverTongueModifierForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = +[SBTransientlyVisibleSlideOverTongueSwitcherModifier slideOverTongueTransientlyVisibleModeForEvent:v4];
    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      int v9 = [(SBFluidSwitcherRootSwitcherModifier *)self transientlyVisibleSlideOverTongueModifier];
      v10 = SBSafeCast(v8, v9);

      if (v10 && (SBTransientlyVisibleSlideOverTongueSwitcherModifier *)[v10 mode] == v7) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = [[SBTransientlyVisibleSlideOverTongueSwitcherModifier alloc] initWithMode:v7];
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (Class)_defaultMultitaskingModifierClass
{
  return (Class)objc_opt_class();
}

- (id)_newMultitaskingModifier
{
  double v2 = [(SBFloatingFluidSwitcherRootSwitcherModifier *)self _defaultMultitaskingModifierClass];
  return objc_alloc_init(v2);
}

- (void)_updateContainerViewBounds
{
  p_floatingConfiguration = &self->_floatingConfiguration;
  [(SBFloatingFluidSwitcherRootSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:self->_activeAppLayout floatingConfiguration:self->_interfaceOrientation];
  int64_t *p_floatingConfiguration = v3;
  p_floatingConfiguration[1] = v4;
  p_floatingConfiguration[2] = v5;
  p_floatingConfiguration[3] = v6;
}

- (SBAppLayout)activeAppLayout
{
  return *(SBAppLayout **)&self->_floatingSwitcherVisible;
}

- (void)setActiveAppLayout:(id)a3
{
}

- (int64_t)interfaceOrientation
{
  return (int64_t)self->_activeAppLayout;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_activeAppLayout = (SBAppLayout *)a3;
}

- (int64_t)floatingConfiguration
{
  return self->_interfaceOrientation;
}

- (void)setFloatingConfiguration:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (BOOL)isFloatingSwitcherVisible
{
  return self->super._hasPerformedInitialSetup;
}

- (void)setFloatingSwitcherVisible:(BOOL)a3
{
  self->super._hasPerformedInitialSetup = a3;
}

- (void)setContainerViewBounds:(CGRect)a3
{
  *(CGRect *)&self->_floatingConfiguration = a3;
}

- (void).cxx_destruct
{
}

@end