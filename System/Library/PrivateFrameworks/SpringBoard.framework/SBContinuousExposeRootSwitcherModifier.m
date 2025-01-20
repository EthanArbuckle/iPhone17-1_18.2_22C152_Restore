@interface SBContinuousExposeRootSwitcherModifier
- (BOOL)_isActivatingAppLayoutUnoccludedForEvent:(id)a3;
- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldUseWallpaperGradientTreatment;
- (SBSwitcherContinuousExposeStripTongueAttributes)continuousExposeStripTongueAttributes;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)appLayoutOnStage;
- (id)floorModifierForGestureEvent:(id)a3;
- (id)floorModifierForTransitionEvent:(id)a3;
- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3;
- (id)gestureModifierForGestureEvent:(id)a3;
- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3;
- (id)handleContinuousExposeStripEdgeProtectTongueEvent:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)highlightModifierForHighlightEvent:(id)a3;
- (id)insertionModifierForInsertionEvent:(id)a3;
- (id)lowEndHardwareModifier;
- (id)multitaskingModifierForEvent:(id)a3;
- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3;
- (id)removalModifierForRemovalEvent:(id)a3;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3;
- (id)transitionModifierForMainTransitionEvent:(id)a3;
- (id)userScrollingModifierForScrollEvent:(id)a3;
- (int64_t)_effectiveEnvironmentMode;
- (int64_t)switcherModifierLevelForTransitionEvent:(id)a3;
@end

@implementation SBContinuousExposeRootSwitcherModifier

- (id)floorModifierForTransitionEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
    uint64_t v6 = [v4 toEnvironmentMode];
    v7 = [v4 toAppLayout];
    uint64_t v8 = [v4 toAppExposeBundleID];
    v9 = (void *)v8;
    switch(v6)
    {
      case 1:
        if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
          v16 = v5;
        }
        else {
          v16 = objc_alloc_init(SBHomeScreenContinuousExposeSwitcherModifier);
        }
        break;
      case 2:
        v17 = [v4 toAppExposeBundleID];
        if (v17)
        {
          if (!v5) {
            goto LABEL_37;
          }
          uint64_t v18 = objc_opt_class();
          id v19 = v5;
          if (v18) {
            id v20 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0;
          }
          else {
            id v20 = 0;
          }
          id v25 = v20;

          v26 = [v25 bundleIdentifier];

          LODWORD(v25) = [v26 isEqualToString:v17];
          if (v25) {
            v24 = (SBAppExposeContinuousExposeSwitcherModifier *)v19;
          }
          else {
LABEL_37:
          }
            v24 = [[SBAppExposeContinuousExposeSwitcherModifier alloc] initWithBundleIdentifier:v17];
        }
        else
        {
          v24 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
        }
        v13 = (SBFullScreenContinuousExposeSwitcherModifier *)v24;

        goto LABEL_47;
      case 3:
        if (!v8 && v5)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v5;
            v11 = [v10 fullScreenAppLayout];
            int v12 = [v11 isEqual:v7];

            if (v12) {
              v13 = (SBFullScreenContinuousExposeSwitcherModifier *)v10;
            }
            else {
              v13 = 0;
            }
            objc_msgSend(v10, "setContinuousExposeConfigurationChangeTransition:", objc_msgSend(v4, "isContinuousExposeConfigurationChangeEvent"));
            v15 = [v10 highlightedByTouchAppLayouts];
            v14 = [v10 highlightedByHoverAppLayouts];

            if (!v13) {
              goto LABEL_29;
            }
LABEL_48:

            goto LABEL_49;
          }
LABEL_28:
          v14 = 0;
          v15 = 0;
LABEL_29:
          v13 = [[SBFullScreenContinuousExposeSwitcherModifier alloc] initWithFullScreenAppLayout:v7];
          -[SBFullScreenContinuousExposeSwitcherModifier setContinuousExposeConfigurationChangeTransition:](v13, "setContinuousExposeConfigurationChangeTransition:", [v4 isContinuousExposeConfigurationChangeEvent]);
          if (v15) {
            [(SBFullScreenContinuousExposeSwitcherModifier *)v13 setHighlightedByTouchAppLayouts:v15];
          }
          if (v14) {
            [(SBFullScreenContinuousExposeSwitcherModifier *)v13 setHighlightedByHoverAppLayouts:v14];
          }
          goto LABEL_48;
        }
        if (!v8) {
          goto LABEL_28;
        }
        if (!v5) {
          goto LABEL_45;
        }
        uint64_t v21 = objc_opt_class();
        id v22 = v5;
        if (v21) {
          id v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
        }
        else {
          id v23 = 0;
        }
        id v27 = v23;

        v28 = [v27 appExposeBundleIdentifier];

        LODWORD(v27) = [v28 isEqualToString:v9];
        if (v27) {
          v16 = (SBHomeScreenContinuousExposeSwitcherModifier *)v22;
        }
        else {
LABEL_45:
        }
          v16 = [[SBInlineAppExposeContinuousExposeSwitcherModifier alloc] initWithActiveAppLayout:v7 appExposeBundleIdentifier:v9];
        break;
      default:
        v14 = 0;
        v15 = 0;
        v13 = 0;
        goto LABEL_48;
    }
    v13 = (SBFullScreenContinuousExposeSwitcherModifier *)v16;
LABEL_47:
    v14 = 0;
    v15 = 0;
    goto LABEL_48;
  }
  v13 = objc_alloc_init(SBHomeScreenContinuousExposeSwitcherModifier);
  v14 = 0;
  v15 = 0;
LABEL_49:
  v29 = v13;

  return v29;
}

- (id)floorModifierForGestureEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isWindowDragGestureEvent])
  {
    uint64_t v5 = [v4 phase];
    uint64_t v6 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
    v7 = [v4 selectedAppLayout];
    uint64_t v8 = [(SBContinuousExposeRootSwitcherModifier *)self proposedAppLayoutForWindowDrag];
    int v9 = [v8 containsAnyItemFromAppLayout:v7];
    switch(v5)
    {
      case 3:
        v11 = *(void **)&self->_isStripTonguePresented;
        *(void *)&self->_isStripTonguePresented = 0;

        break;
      case 2:
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v10 = [[SBFullScreenContinuousExposeSwitcherModifier alloc] initWithFullScreenAppLayout:v8];
            goto LABEL_11;
          }
        }
        else if (([v6 isEqual:*(void *)&self->_isStripTonguePresented] & 1) == 0)
        {
          id v12 = *(id *)&self->_isStripTonguePresented;
          [v12 setState:0];
LABEL_12:

          if (v12) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
        break;
      case 1:
        objc_storeStrong((id *)&self->_isStripTonguePresented, v6);
        id v10 = v6;
LABEL_11:
        id v12 = v10;
        goto LABEL_12;
    }
    id v12 = 0;
    goto LABEL_12;
  }
LABEL_13:
  id v12 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
LABEL_14:

  return v12;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  v3 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
  if (!v3) {
    v3 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
  }
  return v3;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isiPadOSWindowingModeChangeEvent])
  {
    uint64_t v5 = 0;
    goto LABEL_81;
  }
  if (([v4 isHandled] & 1) == 0
    && ([v4 isGestureInitiated] & 1) == 0
    && [v4 isAnimated])
  {
    v90 = [v4 transitionID];
    uint64_t v6 = [v4 fromEnvironmentMode];
    uint64_t v7 = [v4 toEnvironmentMode];
    uint64_t v8 = [v4 fromAppLayout];
    v89 = [v4 toAppLayout];
    uint64_t v9 = [v4 fromInterfaceOrientation];
    uint64_t v10 = [v4 toInterfaceOrientation];
    v11 = [v4 removalContextForAppLayout:v8];
    uint64_t v12 = [v11 animationStyle];
    v13 = [v11 displayItem];
    uint64_t v88 = [v8 layoutRoleForItem:v13];

    if (v6 == 3 && v7 == 3)
    {
      v14 = v89;
      if (v8)
      {
        if (v89)
        {
          if ([v8 isEqual:v89])
          {
            uint64_t v15 = [v4 fromInterfaceOrientation];
            if (v15 != [v4 toInterfaceOrientation])
            {
              v42 = [SBRotationSwitcherModifier alloc];
              v43 = [v4 toAppLayout];
              uint64_t v5 = -[SBRotationSwitcherModifier initWithTransitionID:appLayout:fromInterfaceOrientation:toInterfaceOrientation:](v42, "initWithTransitionID:appLayout:fromInterfaceOrientation:toInterfaceOrientation:", v90, v43, [v4 fromInterfaceOrientation], objc_msgSend(v4, "toInterfaceOrientation"));

              [(SBMoveDisplaysTransitionSwitcherModifier *)v5 setShouldNotUseAnchorPointToPinLayoutRolesToSpace:[(SBContinuousExposeRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];
              goto LABEL_53;
            }
          }
        }
      }
      if (objc_msgSend(v4, "isAnyPulseEvent", v14))
      {
        if ([(SBContinuousExposeRootSwitcherModifier *)self _isActivatingAppLayoutUnoccludedForEvent:v4])
        {
          v16 = [v4 activatingAppLayout];
          v17 = v16;
          if (v16 == v89)
          {
            id v20 = [[SBPulseTransitionSwitcherModifier alloc] initWithTransitionID:v90 appLayout:v89];
          }
          else
          {
            uint64_t v18 = [v16 itemForLayoutRole:1];
            uint64_t v19 = [v89 layoutRoleForItem:v18];

            id v20 = [[SBSplitDisplayItemPulseTransitionSwitcherModifier alloc] initWithTransitionID:v90 appLayout:v89 layoutRole:v19 chamoisWindowingUIEnabled:[(SBContinuousExposeRootSwitcherModifier *)self isChamoisWindowingUIEnabled]];
          }
          goto LABEL_51;
        }
LABEL_54:
        v49 = [SBContinuousExposeAppToAppModifier alloc];
        v50 = [v4 fromDisplayItemLayoutAttributesMap];
        v51 = [v4 toDisplayItemLayoutAttributesMap];
        uint64_t v5 = [(SBContinuousExposeAppToAppModifier *)v49 initWithTransitionID:v90 fromAppLayout:v8 fromInterfaceOrientation:v9 toAppLayout:v89 toInterfaceOrientation:v10 fromDisplayItemLayoutAttributesMap:v50 toDisplayItemLayoutAttributesMap:v51];

        -[SBMoveDisplaysTransitionSwitcherModifier setContinuousExposeConfigurationChangeTransition:](v5, "setContinuousExposeConfigurationChangeTransition:", [v4 isContinuousExposeConfigurationChangeEvent]);
        -[SBMoveDisplaysTransitionSwitcherModifier setCommandTabTransition:](v5, "setCommandTabTransition:", [v4 isCommandTabTransition]);
        -[SBMoveDisplaysTransitionSwitcherModifier setLaunchingFromDockTransition:](v5, "setLaunchingFromDockTransition:", [v4 isLaunchingFromDockTransition]);
        -[SBMoveDisplaysTransitionSwitcherModifier setLaunchingFromSpotlightTransition:](v5, "setLaunchingFromSpotlightTransition:", [v4 isSpotlightTransition]);
        -[SBMoveDisplaysTransitionSwitcherModifier setMorphFromInAppViewTransition:](v5, "setMorphFromInAppViewTransition:", [v4 isMorphFromInAppView]);
        if ([v4 isKeyboardShortcutInitiated]) {
          uint64_t v52 = 1;
        }
        else {
          uint64_t v52 = [v4 isTopAffordanceInitiated];
        }
        [(SBMoveDisplaysTransitionSwitcherModifier *)v5 setIsTopAffordanceMenuTransition:v52];
LABEL_58:
        if (v88)
        {
          if ((unint64_t)(v12 - 1) <= 2)
          {
            v53 = (void *)[objc_alloc(*off_1E6B090C8[v12 - 1]) initWithTransitionID:v90 fromAppLayout:v8 layoutRole:v88];
            if (v53)
            {
              v54 = v53;
              [v53 addChildModifier:v5];
              v55 = v54;

              uint64_t v5 = v55;
            }
          }
        }
LABEL_79:

        if (v5) {
          goto LABEL_81;
        }
        goto LABEL_80;
      }
      v34 = [v4 fromAppExposeBundleID];
      v35 = [v4 toAppExposeBundleID];
      if (BSEqualStrings())
      {

        goto LABEL_32;
      }
      v41 = [v4 fromAppExposeBundleID];
      if (v41)
      {
      }
      else
      {
        v45 = [v4 toAppExposeBundleID];

        if (!v45)
        {
LABEL_32:
          if ([v4 isMoveDisplaysTransition])
          {
            uint64_t v5 = [[SBMoveDisplaysTransitionSwitcherModifier alloc] initWithTransitionEvent:v4];
            goto LABEL_53;
          }
          goto LABEL_54;
        }
      }
      v46 = [v4 toAppExposeBundleID];
      BOOL v47 = v46 == 0;

      v48 = [SBContinuousExposeAppToInlineAppExposeSwitcherModifier alloc];
      v17 = [v4 toAppExposeBundleID];
      if (!v17)
      {
        uint64_t v62 = [v4 fromAppExposeBundleID];
        v63 = v48;
        v64 = (void *)v62;
        uint64_t v5 = -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier initWithTransitionID:direction:activeAppLayout:appExposeBundleIdentifier:](v63, "initWithTransitionID:direction:activeAppLayout:appExposeBundleIdentifier:", v90, v47, v8);

        goto LABEL_52;
      }
      id v20 = [(SBContinuousExposeAppToInlineAppExposeSwitcherModifier *)v48 initWithTransitionID:v90 direction:v47 activeAppLayout:v8 appExposeBundleIdentifier:v17];
LABEL_51:
      uint64_t v5 = (SBMoveDisplaysTransitionSwitcherModifier *)v20;
LABEL_52:

LABEL_53:
      if (v5) {
        goto LABEL_58;
      }
      goto LABEL_54;
    }
    if ([v4 fromEnvironmentMode] == 2 && objc_msgSend(v4, "toEnvironmentMode") == 3)
    {
      if (![v4 isMoveDisplaysTransition])
      {
        if (!-[SBContinuousExposeRootSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled")|| (-[SBContinuousExposeRootSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes"), uint64_t v21 = objc_claimAutoreleasedReturnValue(), v22 = [v21 isAdditiveModelEnabled], v21, (v22 & 1) != 0))
        {
          id v23 = [SBContinuousExposeSwitcherToAppModifier alloc];
          v24 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
          id v25 = (void *)[v24 copy];
          v26 = v23;
          id v27 = v90;
          uint64_t v28 = 0;
LABEL_46:
          uint64_t v5 = [(SBContinuousExposeSwitcherToAppModifier *)v26 initWithTransitionID:v27 direction:v28 multitaskingModifier:v25];
LABEL_70:

          goto LABEL_71;
        }
        v65 = [SBGridToFullScreenSwitcherModifier alloc];
        v24 = [v4 toAppLayout];
        id v25 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
        v30 = (void *)[v25 copy];
        v31 = v65;
        v32 = v90;
        uint64_t v33 = 0;
        goto LABEL_69;
      }
LABEL_29:
      uint64_t v5 = [[SBMoveDisplaysTransitionSwitcherModifier alloc] initWithTransitionEvent:v4];
      goto LABEL_79;
    }
    if ([v4 fromEnvironmentMode] == 3 && objc_msgSend(v4, "toEnvironmentMode") == 2)
    {
      if (![(SBContinuousExposeRootSwitcherModifier *)self prefersStripHiddenAndDisabled])
      {
        v44 = [SBContinuousExposeSwitcherToAppModifier alloc];
        v24 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
        id v25 = (void *)[v24 copy];
        v26 = v44;
        id v27 = v90;
        uint64_t v28 = 1;
        goto LABEL_46;
      }
      v29 = [SBGridToFullScreenSwitcherModifier alloc];
      v24 = [v4 toAppLayout];
      id v25 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
      v30 = (void *)[v25 copy];
      v31 = v29;
      v32 = v90;
      uint64_t v33 = 1;
LABEL_69:
      uint64_t v5 = [(SBGridToFullScreenSwitcherModifier *)v31 initWithTransitionID:v32 direction:v33 fullScreenAppLayout:v24 gridModifier:v30];

      goto LABEL_70;
    }
    if ([v4 fromEnvironmentMode] == 3 && objc_msgSend(v4, "toEnvironmentMode") == 1)
    {
      if ([v4 isMoveDisplaysTransition]) {
        goto LABEL_29;
      }
      if (v88)
      {
        uint64_t v56 = v12;
        v57 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
        v58 = (void *)[v57 copy];

        if (SBReduceMotion() || v56 == 1)
        {
          v77 = [SBEntityRemovalCrossblurSwitcherModifier alloc];
          v78 = [v4 transitionID];
          v79 = [v4 fromAppLayout];
          uint64_t v5 = [(SBEntityRemovalCrossblurSwitcherModifier *)v77 initWithTransitionID:v78 appLayout:v79 multitaskingModifier:v58];
        }
        else
        {
          v59 = [(SBContinuousExposeRootSwitcherModifier *)self entityRemovalSettings];
          v60 = v59;
          BOOL v61 = v56 != 2;
          if (v56 == 2) {
            [v59 dosidoCommitIntentAnimationSettings];
          }
          else {
          v78 = [v59 dosidoDeclineIntentAnimationSettings];
          }

          v86 = [SBEntityRemovalSlideOffscreenSwitcherModifier alloc];
          v79 = [v4 transitionID];
          v87 = [v4 fromAppLayout];
          uint64_t v5 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)v86 initWithTransitionID:v79 appLayout:v87 direction:v61 animationSettings:v78 multitaskingModifier:v58];
        }
        goto LABEL_79;
      }
      goto LABEL_78;
    }
    if ([v4 fromEnvironmentMode] == 2 && objc_msgSend(v4, "toEnvironmentMode") == 1)
    {
      v36 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
      v24 = (void *)[v36 copy];

      v37 = [SBContinuousExposeToHomeSwitcherModifier alloc];
      v38 = v90;
      uint64_t v39 = 0;
LABEL_37:
      uint64_t v5 = [(SBContinuousExposeToHomeSwitcherModifier *)v37 initWithTransitionID:v38 direction:v39 continuousExposeModifier:v24];
LABEL_71:

      goto LABEL_79;
    }
    if ([v4 fromEnvironmentMode] == 1 && objc_msgSend(v4, "toEnvironmentMode") == 2)
    {
      v40 = [v4 toAppExposeBundleID];
      if (v40)
      {
      }
      else
      {
        v66 = [v4 fromAppExposeBundleID];

        if (!v66)
        {
          v85 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
          v24 = (void *)[v85 copy];

          v37 = [SBContinuousExposeToHomeSwitcherModifier alloc];
          v38 = v90;
          uint64_t v39 = 1;
          goto LABEL_37;
        }
      }
    }
    if ([v4 fromEnvironmentMode] != 2 && objc_msgSend(v4, "fromEnvironmentMode") != 1
      || [v4 toEnvironmentMode] != 2)
    {
      goto LABEL_78;
    }
    v67 = [v4 fromAppExposeBundleID];
    v68 = [v4 toAppExposeBundleID];
    if (!BSEqualStrings())
    {
      v70 = [v4 fromAppExposeBundleID];
      if (v70)
      {
      }
      else
      {
        v71 = [v4 toAppExposeBundleID];

        if (!v71) {
          goto LABEL_78;
        }
      }
      v72 = [v4 toAppExposeBundleID];
      BOOL v73 = v72 == 0;

      v74 = [v4 toAppExposeBundleID];
      v75 = v74;
      if (v74)
      {
        id v76 = v74;
      }
      else
      {
        id v76 = [v4 fromAppExposeBundleID];
      }
      v80 = v76;

      uint64_t v81 = objc_opt_class();
      v82 = [(SBContinuousExposeRootSwitcherModifier *)self floorModifierForTransitionEvent:v4];
      v83 = (void *)[v82 copy];
      v84 = SBSafeCast(v81, v83);

      uint64_t v5 = [[SBContinuousExposeToAppExposeSwitcherModifier alloc] initWithTransitionID:v90 appExposeBundleID:v80 direction:v73 appExposeModifier:v84];
      goto LABEL_79;
    }

LABEL_78:
    uint64_t v5 = 0;
    goto LABEL_79;
  }
LABEL_80:
  v91.receiver = self;
  v91.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  uint64_t v5 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)&v91 transitionModifierForMainTransitionEvent:v4];
LABEL_81:

  return v5;
}

- (int64_t)switcherModifierLevelForTransitionEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isAppLaunchDuringWindowDragGestureTransition])
  {
    int64_t v5 = 4;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
    int64_t v5 = [(SBFluidSwitcherRootSwitcherModifier *)&v7 switcherModifierLevelForTransitionEvent:v4];
  }

  return v5;
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  id v4 = a3;
  int64_t v5 = 0;
  switch([v4 gestureType])
  {
    case 1:
      if (![(SBContinuousExposeRootSwitcherModifier *)self prefersStripHiddenAndDisabled])
      {
        uint64_t v9 = SBContinuousExposeHomeGestureRootSwitcherModifier;
        goto LABEL_14;
      }
      uint64_t v6 = [SBHomeGestureRootSwitcherModifier alloc];
      int64_t v7 = [(SBContinuousExposeRootSwitcherModifier *)self _effectiveEnvironmentMode];
      uint64_t v8 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
      int64_t v5 = [(SBHomeGestureRootSwitcherModifier *)v6 initWithStartingEnvironmentMode:v7 multitaskingModifier:v8];

      [(SBHomeGestureRootSwitcherModifier *)v5 setEnsuresSelectedAppLayoutUsesAnchorPointSpacePinning:1];
      break;
    case 2:
      uint64_t v9 = SBGridSwipeUpGestureRootSwitcherModifier;
LABEL_14:
      id v14 = [v9 alloc];
      int64_t v15 = [(SBContinuousExposeRootSwitcherModifier *)self _effectiveEnvironmentMode];
      uint64_t v12 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
      v16 = (SBContinuousExposeWindowDragRootSwitcherModifier *)[v14 initWithStartingEnvironmentMode:v15 multitaskingModifier:v12];
      goto LABEL_17;
    case 6:
      uint64_t v10 = [[SBContinuousExposeDragAndDropGestureRootSwitcherModifier alloc] initWithStartingEnvironmentMode:3 appLayout:*(void *)&self->super.super._hasPerformedInitialSetup];
      goto LABEL_12;
    case 8:
      v11 = *(void **)&self->super.super._hasPerformedInitialSetup;
      if (v11)
      {
        uint64_t v12 = v11;
      }
      else
      {
        v17 = +[SBAppLayout homeScreenAppLayout];
        objc_msgSend(v17, "appLayoutByModifyingPreferredDisplayOrdinal:", -[SBContinuousExposeRootSwitcherModifier displayOrdinal](self, "displayOrdinal"));
        uint64_t v12 = (SBAppSwitcherContinuousExposeSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      }
      v16 = [[SBContinuousExposeWindowDragRootSwitcherModifier alloc] initWithStartingEnvironmentMode:[(SBContinuousExposeRootSwitcherModifier *)self _effectiveEnvironmentMode] initialAppLayout:v12];
LABEL_17:
      int64_t v5 = (SBHomeGestureRootSwitcherModifier *)v16;

      break;
    case 9:
      uint64_t v10 = -[SBItemResizeGestureRootSwitcherModifier initWithStartingEnvironmentMode:selectedLayoutRole:]([SBItemResizeGestureRootSwitcherModifier alloc], "initWithStartingEnvironmentMode:selectedLayoutRole:", 3, [v4 selectedLayoutRole]);
      goto LABEL_12;
    case 10:
      v13 = SBRevealContinuousExposeStripsRootSwitcherModifier;
      goto LABEL_11;
    case 11:
      v13 = SBRevealContinuousExposeStripOverflowRootSwitcherModifier;
LABEL_11:
      uint64_t v10 = (SBContinuousExposeDragAndDropGestureRootSwitcherModifier *)[[v13 alloc] initWithInitialAppLayout:*(void *)&self->super.super._hasPerformedInitialSetup];
LABEL_12:
      int64_t v5 = (SBHomeGestureRootSwitcherModifier *)v10;
      break;
    default:
      break;
  }

  return v5;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  return 0;
}

- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3
{
  id v3 = a3;
  id v4 = [SBSwipeToKillSwitcherModifier alloc];
  uint64_t v5 = [v3 layoutRole];
  uint64_t v6 = [v3 appLayout];

  int64_t v7 = [(SBSwipeToKillSwitcherModifier *)v4 initWithLayoutRole:v5 inAppLayout:v6 fadeOutSwipedItems:0];
  return v7;
}

- (id)highlightModifierForHighlightEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isHandled] & 1) != 0 || (objc_msgSend(v3, "isHoverEvent"))
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = [SBHighlightSwitcherModifier alloc];
    uint64_t v6 = [v3 layoutRole];
    int64_t v7 = [v3 appLayout];
    id v4 = [(SBHighlightSwitcherModifier *)v5 initWithLayoutRole:v6 inAppLayout:v7 listensForHighlightEvents:1];
  }
  return v4;
}

- (id)removalModifierForRemovalEvent:(id)a3
{
  id v3 = a3;
  id v4 = [SBRemovalSwitcherModifier alloc];
  uint64_t v5 = [v3 layoutRole];
  uint64_t v6 = [v3 appLayout];
  uint64_t v7 = [v3 reason];

  uint64_t v8 = [(SBRemovalSwitcherModifier *)v4 initWithLayoutRole:v5 inAppLayout:v6 reason:v7];
  return v8;
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  id v3 = objc_alloc_init(SBScrollingSwitcherModifier);
  return v3;
}

- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3
{
  return 0;
}

- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3
{
  id v3 = a3;
  id v4 = [SBFocusedAppLayoutSwitcherModifier alloc];
  uint64_t v5 = [v3 appLayout];

  uint64_t v6 = [(SBFocusedAppLayoutSwitcherModifier *)v4 initWithFocusedAppLayout:v5];
  return v6;
}

- (id)lowEndHardwareModifier
{
  return 0;
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isTransitionEvent])
  {
    uint64_t v5 = (SBSwitcherModifier *)[v4 copy];
    initialFloorModifierForWindowDrag = self->_initialFloorModifierForWindowDrag;
    self->_initialFloorModifierForWindowDrag = v5;
  }
  v28.receiver = self;
  v28.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  uint64_t v7 = [(SBFluidSwitcherRootSwitcherModifier *)&v28 handleEvent:v4];
  uint64_t v8 = self->_initialFloorModifierForWindowDrag;
  if (v8)
  {
    self->_initialFloorModifierForWindowDrag = 0;
  }
  if ([v4 isTransitionEvent])
  {
    id v9 = v4;
    uint64_t v10 = [v9 toAppLayout];
    uint64_t v11 = [v9 fromAppLayout];
    if (v11) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    LOBYTE(self->_unmodifiedCurrentTransitionEvent) = v12;
    uint64_t v13 = [v9 isAnimated];
    int v14 = [v9 isMoveDisplaysTransition];
    if (v11) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    if (v15 == 1 && v10)
    {
      if ([(id)v11 containsAllItemsFromAppLayout:v10]) {
        goto LABEL_50;
      }
    }
    else if (v15)
    {
LABEL_50:
      if ([v9 phase] == 3) {
        LOBYTE(self->_unmodifiedCurrentTransitionEvent) = 0;
      }

      goto LABEL_53;
    }
    if (v10 && v11)
    {
      if ([v9 phase] == 2) {
        char v16 = 0;
      }
      else {
        char v16 = v13;
      }
      if ((v16 & 1) == 0
        && (![(id)v10 isEqual:v11]
         || ![(SBAppLayout *)self->_currentAppLayout isEqual:v10]))
      {
        objc_storeStrong((id *)&self->_currentAppLayout, (id)v10);
        v17 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
        uint64_t v18 = v11;
LABEL_39:
        uint64_t v22 = v10;
LABEL_48:
        v24 = [(SBInvalidateContinuousExposeIdentifiersEventResponse *)v17 initWithTransitioningFromAppLayout:v18 transitioningToAppLayout:v22 animated:v13];
        goto LABEL_49;
      }
      goto LABEL_45;
    }
    if (v12)
    {
      if ([v9 phase] == 3) {
        char v19 = 0;
      }
      else {
        char v19 = v13;
      }
      if (v19) {
        goto LABEL_45;
      }
      currentAppLayout = self->_currentAppLayout;
      self->_currentAppLayout = 0;

      v17 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
      uint64_t v18 = v11;
    }
    else
    {
      if (v10 && !v11)
      {
        if ([v9 phase] == 1) {
          char v21 = 0;
        }
        else {
          char v21 = v13;
        }
        if ((v21 & 1) == 0)
        {
          objc_storeStrong((id *)&self->_currentAppLayout, (id)v10);
          v17 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
          uint64_t v18 = 0;
          goto LABEL_39;
        }
LABEL_45:
        v24 = 0;
LABEL_49:
        uint64_t v26 = SBAppendSwitcherModifierResponse(v24, v7);

        uint64_t v7 = (void *)v26;
        goto LABEL_50;
      }
      if (v10 | v11) {
        goto LABEL_45;
      }
      char v23 = [v9 phase] == 1 ? 0 : v13;
      if (v23) {
        goto LABEL_45;
      }
      id v25 = self->_currentAppLayout;
      self->_currentAppLayout = 0;

      v17 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
      uint64_t v18 = 0;
    }
    uint64_t v22 = 0;
    goto LABEL_48;
  }
LABEL_53:

  return v7;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  uint64_t v5 = [(SBFluidSwitcherRootSwitcherModifier *)&v19 handleTransitionEvent:v4];
  uint64_t v6 = [v4 toAppLayout];
  uint64_t v7 = *(void **)&self->super.super._hasPerformedInitialSetup;
  *(void *)&self->super.super._hasPerformedInitialSetup = v6;

  if (([v4 phase] == 2 || (objc_msgSend(v4, "isAnimated") & 1) == 0)
    && SBPeekConfigurationIsValid([v4 toPeekConfiguration]))
  {
    uint64_t v8 = [(SBChainableModifier *)self childModifierByKey:@"SBContinuousExposePeekModifierKey"];

    if (!v8)
    {
      id v9 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
      uint64_t v10 = SBAppendSwitcherModifierResponse(v5, v9);

      uint64_t v11 = [SBContinuousExposePeekSwitcherModifier alloc];
      BOOL v12 = [v4 toAppLayout];
      uint64_t v13 = -[SBContinuousExposePeekSwitcherModifier initWithAppLayout:configuration:](v11, "initWithAppLayout:configuration:", v12, [v4 toPeekConfiguration]);

      [(SBChainableModifier *)self addChildModifier:v13 atLevel:2 key:@"SBContinuousExposePeekModifierKey"];
      uint64_t v5 = (void *)v10;
    }
  }
  if ([v4 phase] == 2)
  {
    if ([v4 isAppLaunchDuringWindowDragGestureTransition])
    {
      int v14 = *(void **)&self->_isStripTonguePresented;
      int v15 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
      LOBYTE(v14) = [v14 isEqual:v15];

      if ((v14 & 1) == 0)
      {
        uint64_t v16 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
        v17 = *(void **)&self->_isStripTonguePresented;
        *(void *)&self->_isStripTonguePresented = v16;
      }
    }
  }

  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  uint64_t v5 = [(SBFluidSwitcherRootSwitcherModifier *)&v11 handleGestureEvent:v4];
  uint64_t v6 = [(SBContinuousExposeRootSwitcherModifier *)self chamoisLayoutAttributes];
  if (-[SBInvalidateAdjustedAppLayoutsSwitcherEventResponse isAdditiveModelEnabled](v6, "isAdditiveModelEnabled")&& ![v4 phase])
  {
    int unmodifiedCurrentTransitionEvent_low = LOBYTE(self->_unmodifiedCurrentTransitionEvent);

    if (!unmodifiedCurrentTransitionEvent_low) {
      goto LABEL_6;
    }
    currentAppLayout = self->_currentAppLayout;
    self->_currentAppLayout = 0;

    LOBYTE(self->_unmodifiedCurrentTransitionEvent) = 0;
    uint64_t v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v9 = SBAppendSwitcherModifierResponse(v5, v6);

    uint64_t v5 = (void *)v9;
  }

LABEL_6:
  return v5;
}

- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  uint64_t v5 = [(SBSwitcherModifier *)&v55 handleContinuousExposeIdentifiersChangedEvent:v4];
  if ([v4 isAnimated]
    && [(SBContinuousExposeRootSwitcherModifier *)self _effectiveEnvironmentMode] == 3)
  {
    uint64_t v6 = [v4 transitioningFromAppLayout];
    uint64_t v7 = [v4 transitioningToAppLayout];
    uint64_t v8 = (void *)v7;
    if (!v6 || !v7) {
      goto LABEL_28;
    }
    v34 = v5;
    uint64_t v9 = [v4 previousContinuousExposeIdentifiersInSwitcher];
    v35 = v4;
    uint64_t v10 = [v4 previousContinuousExposeIdentifiersInStrip];
    objc_super v11 = [(SBContinuousExposeRootSwitcherModifier *)self continuousExposeIdentifiersInStrip];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __88__SBContinuousExposeRootSwitcherModifier_handleContinuousExposeIdentifiersChangedEvent___block_invoke;
    v52[3] = &unk_1E6B09080;
    id v12 = v11;
    id v53 = v12;
    v38 = v8;
    id v36 = v8;
    id v54 = v36;
    uint64_t v13 = objc_msgSend(v10, "bs_filter:", v52);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __88__SBContinuousExposeRootSwitcherModifier_handleContinuousExposeIdentifiersChangedEvent___block_invoke_2;
    v49[3] = &unk_1E6B09080;
    id v14 = v10;
    id v50 = v14;
    uint64_t v39 = v6;
    id v40 = v6;
    id v51 = v40;
    v37 = v12;
    int v15 = objc_msgSend(v12, "bs_filter:", v49);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v16);
          }
          char v21 = [[SBContinuousExposeIdentifierSlideModifier alloc] initWithContinuousExposeIdentifier:*(void *)(*((void *)&v45 + 1) + 8 * i) previousContinuousExposeIdentifiersInSwitcher:v9 previousContinuousExposeIdentifiersInStrip:v14 direction:1];
          [(SBChainableModifier *)self addChildModifier:v21 atLevel:5 key:0];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v18);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v22 = v15;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v56 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = [[SBContinuousExposeIdentifierSlideModifier alloc] initWithContinuousExposeIdentifier:*(void *)(*((void *)&v41 + 1) + 8 * j) previousContinuousExposeIdentifiersInSwitcher:v9 previousContinuousExposeIdentifiersInStrip:v14 direction:0];
          [(SBChainableModifier *)self addChildModifier:v27 atLevel:5 key:0];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v56 count:16];
      }
      while (v24);
    }

    objc_super v28 = [v40 continuousExposeIdentifier];
    v29 = [v36 continuousExposeIdentifier];
    if (BSEqualStrings())
    {
      char v30 = [v40 containsAnyItemFromAppLayout:v36];

      uint64_t v5 = v34;
      id v4 = v35;
      if (v30)
      {
LABEL_27:

        uint64_t v8 = v38;
        uint64_t v6 = v39;
LABEL_28:

        goto LABEL_29;
      }
      v31 = [v36 continuousExposeIdentifier];
      objc_super v28 = [(SBContinuousExposeRootSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v31];

      if (![v28 containsObject:v40]
        || ([v35 isGestureInitiated] & 1) != 0)
      {
LABEL_26:

        goto LABEL_27;
      }
      v29 = [v28 lastObject];
      v32 = [[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier alloc] initWithAppLayout:v40 behindAppLayout:v29 generationCount:[(SBContinuousExposeRootSwitcherModifier *)self continuousExposeIdentifiersGenerationCount]];
      [(SBChainableModifier *)self addChildModifier:v32 atLevel:5 key:0];
    }
    else
    {
      uint64_t v5 = v34;
      id v4 = v35;
    }

    goto LABEL_26;
  }
LABEL_29:

  return v5;
}

uint64_t __88__SBContinuousExposeRootSwitcherModifier_handleContinuousExposeIdentifiersChangedEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) continuousExposeIdentifier];
    uint64_t v4 = BSEqualStrings() ^ 1;
  }
  return v4;
}

uint64_t __88__SBContinuousExposeRootSwitcherModifier_handleContinuousExposeIdentifiersChangedEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) continuousExposeIdentifier];
    uint64_t v4 = BSEqualStrings() ^ 1;
  }
  return v4;
}

- (id)handleContinuousExposeStripEdgeProtectTongueEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v10 handleContinuousExposeStripEdgeProtectTongueEvent:v4];
  char v6 = objc_msgSend(v4, "isTonguePresented", v10.receiver, v10.super_class);

  LOBYTE(self->_effectiveAppLayoutOnStage) = v6;
  uint64_t v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:2];
  uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

  return v8;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  v21.receiver = self;
  v21.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  char v6 = [(SBFluidSwitcherRootSwitcherModifier *)&v21 responseForProposedChildResponse:a3 childModifier:a4 event:a5];
  initialFloorModifierForWindowDrag = self->_initialFloorModifierForWindowDrag;
  if (initialFloorModifierForWindowDrag)
  {
    uint64_t v8 = [(SBSwitcherModifier *)initialFloorModifierForWindowDrag fromAppLayout];
    uint64_t v9 = [(SBSwitcherModifier *)self->_initialFloorModifierForWindowDrag toAppLayout];
    BOOL IsValid = SBPeekConfigurationIsValid([(SBSwitcherModifier *)self->_initialFloorModifierForWindowDrag fromPeekConfiguration]);
    BOOL v11 = SBPeekConfigurationIsValid([(SBSwitcherModifier *)self->_initialFloorModifierForWindowDrag toPeekConfiguration]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__SBContinuousExposeRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
    v19[3] = &unk_1E6AF4B38;
    id v12 = v8;
    id v20 = v12;
    uint64_t v13 = [v9 appLayoutWithItemsPassingTest:v19];
    if (IsValid && !v11 && ([v9 isEqual:v12] & 1) == 0)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __95__SBContinuousExposeRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_2;
      v16[3] = &unk_1E6B090A8;
      id v17 = v13;
      id v18 = v9;
      uint64_t v14 = [v6 responseByTransformingResponseWithTransformer:v16];

      char v6 = (void *)v14;
    }
  }
  return v6;
}

uint64_t __95__SBContinuousExposeRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsItem:a2] ^ 1;
}

SBIconOverlayVisibilitySwitcherEventResponse *__95__SBContinuousExposeRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 12)
  {
    id v4 = v3;
    uint64_t v5 = [v4 appLayout];
    if ([v5 isEqual:*(void *)(a1 + 32)])
    {
      char v6 = [v4 isVisible];

      if ((v6 & 1) == 0)
      {
        uint64_t v7 = [[SBIconOverlayVisibilitySwitcherEventResponse alloc] initWithAppLayout:*(void *)(a1 + 40) visible:0];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  uint64_t v7 = (SBIconOverlayVisibilitySwitcherEventResponse *)v3;
LABEL_8:

  return v7;
}

- (id)appLayoutOnStage
{
  return self->_currentAppLayout;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBContinuousExposeRootSwitcherModifier *)self chamoisLayoutAttributes];
  char v6 = [v5 isAdditiveModelEnabled];

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
    uint64_t v7 = [(SBContinuousExposeRootSwitcherModifier *)&v11 adjustedAppLayoutsForAppLayouts:v4];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__SBContinuousExposeRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
    v10[3] = &unk_1E6AF9F18;
    v10[4] = self;
    uint64_t v8 = objc_msgSend(v7, "bs_compactMap:", v10);
    id v4 = v7;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
    uint64_t v8 = [(SBContinuousExposeRootSwitcherModifier *)&v12 adjustedAppLayoutsForAppLayouts:v4];
  }

  return v8;
}

id __74__SBContinuousExposeRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__SBContinuousExposeRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2;
  v4[3] = &unk_1E6AF4B38;
  v4[4] = *(void *)(a1 + 32);
  v2 = [a2 appLayoutWithItemsPassingTest:v4];
  return v2;
}

uint64_t __74__SBContinuousExposeRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) appLayoutOnStage];
  if (([v4 containsItem:v3] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 96) containsItem:v3] & 1) != 0)
  {
    uint64_t v5 = 1;
  }
  else
  {
    char v6 = [*(id *)(a1 + 32) draggingAppLayoutsForWindowDrag];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__SBContinuousExposeRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_3;
    v12[3] = &unk_1E6AF4B60;
    id v7 = v3;
    id v13 = v7;
    if (objc_msgSend(v6, "bs_containsObjectPassingTest:", v12))
    {
      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v8 = [*(id *)(a1 + 32) proposedAppLayoutsForWindowDrag];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __74__SBContinuousExposeRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_4;
      v10[3] = &unk_1E6AF4B60;
      id v11 = v7;
      uint64_t v5 = objc_msgSend(v8, "bs_containsObjectPassingTest:", v10);
    }
  }

  return v5;
}

uint64_t __74__SBContinuousExposeRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

uint64_t __74__SBContinuousExposeRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

- (BOOL)shouldUseWallpaperGradientTreatment
{
  return 1;
}

- (SBSwitcherContinuousExposeStripTongueAttributes)continuousExposeStripTongueAttributes
{
  if (LOBYTE(self->_effectiveAppLayoutOnStage)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  if ([(SBContinuousExposeRootSwitcherModifier *)self isRTLEnabled]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  unint64_t v4 = SBSwitcherContinuousExposeStripTongueAttributesMake(v2, v3);
  result.direction = v5;
  result.state = v4;
  return result;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (int64_t)_effectiveEnvironmentMode
{
  uint64_t v2 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v3 = 3;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        int64_t v3 = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int64_t v3 = 2;
        }
        else {
          int64_t v3 = 1;
        }
      }
    }
  }
  else
  {
    int64_t v3 = 1;
  }

  return v3;
}

- (BOOL)_isActivatingAppLayoutUnoccludedForEvent:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 activatingAppLayout];
  unint64_t v5 = v4;
  if (v4)
  {
    char v6 = [v4 itemForLayoutRole:1];
    id v7 = [v3 fromDisplayItemLayoutAttributesMap];
    uint64_t v8 = [v7 objectForKey:v6];
    uint64_t v9 = [v8 occlusionState];

    objc_super v10 = [v3 toDisplayItemLayoutAttributesMap];
    id v11 = [v10 objectForKey:v6];
    uint64_t v12 = [v11 occlusionState];

    BOOL v14 = v9 == 1 && v12 == 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialFloorModifierForWindowDrag, 0);
  objc_storeStrong((id *)&self->_isStripTonguePresented, 0);
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
  objc_storeStrong((id *)&self->super.super._hasPerformedInitialSetup, 0);
}

@end