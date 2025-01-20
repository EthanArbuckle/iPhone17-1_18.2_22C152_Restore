@interface SBFullScreenFluidSwitcherRootSwitcherModifier
- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3;
- (Class)_defaultMultitaskingModifierClass;
- (id)_entityRemovalModifierForMainTransitionEvent:(id)a3;
- (id)_newMultitaskingModifier;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)floorModifierForTransitionEvent:(id)a3;
- (id)gestureModifierForGestureEvent:(id)a3;
- (id)insertionModifierForInsertionEvent:(id)a3;
- (id)lowEndHardwareModifier;
- (id)multitaskingModifierForEvent:(id)a3;
- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3;
- (id)removalModifierForRemovalEvent:(id)a3;
- (id)shelfModifierForTransitionEvent:(id)a3;
- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3;
- (id)transitionModifierForMainTransitionEvent:(id)a3;
- (id)userScrollingModifierForScrollEvent:(id)a3;
- (int64_t)_effectiveEnvironmentMode;
@end

@implementation SBFullScreenFluidSwitcherRootSwitcherModifier

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  v3 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self switcherSettings];
  BOOL v4 = [v3 effectiveSwitcherStyle] == 1;

  return v4;
}

- (id)shelfModifierForTransitionEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 toAppLayout];
  uint64_t v6 = [v4 toWindowPickerRole];
  if (SBLayoutRoleIsValidForSplitView(v6) && [v4 toEnvironmentMode] == 3)
  {
    v7 = [v5 leafAppLayoutForRole:v6];
    v8 = [v7 allItems];
    v9 = [v8 firstObject];
    v10 = [v9 bundleIdentifier];

    if (v10)
    {
      v11 = [[SBSwitcherShelf alloc] initWithBundleIdentifier:v10 layoutRole:v6 displayMode:1];
      v12 = [(SBSwitcherShelf *)v11 uniqueIdentifier];
      v13 = [(SBChainableModifier *)self childModifierByKey:v12];

      if (v13)
      {
        v14 = 0;
      }
      else
      {
        unint64_t v15 = +[SBShelfSwitcherModifier contentOptionsForTransitionEvent:v4 context:self];
        v16 = [SBShelfSwitcherModifier alloc];
        v17 = [v4 toFloatingAppLayout];
        v18 = [v4 fromAppLayout];
        v14 = -[SBShelfSwitcherModifier initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:](v16, "initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:", v11, v15, v5, v17, v18, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 toEnvironmentMode];
    switch(v6)
    {
      case 1:
        v7 = objc_alloc_init(SBHomeScreenSwitcherModifier);
LABEL_7:
        v8 = (SBAppUnderFloatingSwitcherSwitcherModifier *)v7;
        if (v7) {
          goto LABEL_9;
        }
        break;
      case 3:
        v10 = [v5 toAppLayout];
        int v11 = [v5 toFloatingSwitcherVisible];
        v12 = [[SBFullScreenAppLayoutSwitcherModifier alloc] initWithActiveAppLayout:v10];
        v13 = v12;
        if (v11)
        {
          v8 = [[SBAppUnderFloatingSwitcherSwitcherModifier alloc] initWithActiveAppLayout:v10];
          [(SBChainableModifier *)v8 addChildModifier:v13];
        }
        else
        {
          v8 = v12;
        }

        if (v8) {
          goto LABEL_9;
        }
        break;
      case 2:
        v7 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
        goto LABEL_7;
    }
  }
  v8 = objc_alloc_init(SBHomeScreenSwitcherModifier);
LABEL_9:

  return v8;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  id v4 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _defaultMultitaskingModifierClass];
  v5 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
  if (([v5 isMemberOfClass:v4] & 1) == 0)
  {
    id v6 = objc_alloc_init(v4);

    v5 = v6;
  }
  return v5;
}

- (Class)_defaultMultitaskingModifierClass
{
  v3 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self switcherSettings];
  [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self isReduceMotionEnabled];
  [v3 effectiveSwitcherStyle];
  id v4 = (id)objc_opt_class();

  return (Class)v4;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self isChamoisWindowingUIEnabled];
  uint64_t v6 = [v4 toEnvironmentMode];
  uint64_t v7 = [v4 fromEnvironmentMode];
  v8 = [v4 toAppLayout];
  v9 = [v4 fromAppLayout];
  v10 = [v4 transitionID];
  int v11 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self switcherSettings];
  uint64_t v12 = [v11 effectiveSwitcherStyle];

  v13 = [v4 toAppExposeBundleID];

  if (v13 && v6 == 2) {
    goto LABEL_3;
  }
  if ([v4 isBannerUnfurlTransition])
  {
    v16 = [v4 bannerUnfurlSourceContext];

    if (v16)
    {
      if (v7 == 2)
      {
        v32 = [SBBannerUnfurlToFullScreenSwitcherModifier alloc];
        v18 = [v4 bannerUnfurlSourceContext];
        v19 = v32;
        v20 = v10;
        v21 = 0;
        goto LABEL_34;
      }
      if (v7 == 3)
      {
        v17 = [SBBannerUnfurlToFullScreenSwitcherModifier alloc];
        v18 = [v4 bannerUnfurlSourceContext];
        v19 = v17;
        v20 = v10;
        v21 = v9;
LABEL_34:
        v27 = [(SBBannerUnfurlToFullScreenSwitcherModifier *)v19 initWithTransitionID:v20 fromAppLayout:v21 toAppLayout:v8 bannerUnfurlSourceContext:v18];
LABEL_35:
        v14 = (SBPIPRestoreToFullScreenSwitcherModifier *)v27;
LABEL_36:

        goto LABEL_4;
      }
LABEL_3:
      v14 = 0;
      goto LABEL_4;
    }
  }
  if ([v4 isBreadcrumbTransition] && v7 == 3 && v6 == 1)
  {
    v22 = [[SBFullScreenToHomeSlideOverSwitcherModifier alloc] initWithTransitionID:v10 appLayout:v9 direction:1];
    goto LABEL_16;
  }
  if (v6 == 3)
  {
    if (v7 == 1) {
      goto LABEL_3;
    }
    if (v7 != 3)
    {
      if (v7 != 2) {
        goto LABEL_3;
      }
      if (v12 != 1)
      {
        v42 = [SBGridToFullScreenSwitcherModifier alloc];
        v18 = objc_alloc_init(SBGridSwitcherModifier);
        v27 = [(SBGridToFullScreenSwitcherModifier *)v42 initWithTransitionID:v10 direction:0 fullScreenAppLayout:v8 gridModifier:v18];
        goto LABEL_35;
      }
      if (![v4 isContinuityTransition]
        || ([(SBFullScreenFluidSwitcherRootSwitcherModifier *)self isAppLayoutVisibleInSwitcherBounds:v8] & 1) != 0)
      {
        v34 = [SBDeckToFullScreenSwitcherModifier alloc];
        v18 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
        v27 = [(SBDeckToFullScreenSwitcherModifier *)v34 initWithTransitionID:v10 direction:0 fullScreenAppLayout:v8 deckModifier:v18];
        goto LABEL_35;
      }
      v37 = [[SBFullScreenAppLayoutSwitcherModifier alloc] initWithActiveAppLayout:v8];
      v44 = [SBDeckContinuityToFullScreenSwitcherModifier alloc];
      id v45 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
      v14 = [(SBDeckContinuityToFullScreenSwitcherModifier *)v44 initWithTransitionID:v10 appLayout:v8 deckModifier:v45 fullscreenModifier:v37];

      goto LABEL_79;
    }
    if (v9)
    {
      if (v8)
      {
        if ([(SBGridSwitcherModifier *)v9 isEqual:v8])
        {
          uint64_t v23 = [v4 fromInterfaceOrientation];
          if (v23 != [v4 toInterfaceOrientation])
          {
            v43 = [SBRotationSwitcherModifier alloc];
            v18 = [v4 toAppLayout];
            v27 = -[SBRotationSwitcherModifier initWithTransitionID:appLayout:fromInterfaceOrientation:toInterfaceOrientation:](v43, "initWithTransitionID:appLayout:fromInterfaceOrientation:toInterfaceOrientation:", v10, v18, [v4 fromInterfaceOrientation], objc_msgSend(v4, "toInterfaceOrientation"));
            goto LABEL_35;
          }
        }
      }
    }
    if ([v4 isMainPulseEvent])
    {
      v24 = [v4 activatingAppLayout];
      v18 = v24;
      if (v24 == v8)
      {
        v27 = [[SBPulseTransitionSwitcherModifier alloc] initWithTransitionID:v10 appLayout:v8];
      }
      else
      {
        v25 = [(SBGridSwitcherModifier *)v24 itemForLayoutRole:1];
        uint64_t v26 = [(SBGridSwitcherModifier *)v8 layoutRoleForItem:v25];

        v27 = [[SBSplitDisplayItemPulseTransitionSwitcherModifier alloc] initWithTransitionID:v10 appLayout:v8 layoutRole:v26 chamoisWindowingUIEnabled:v5];
      }
      goto LABEL_35;
    }
    if (!SBPeekConfigurationIsValid([v4 fromPeekConfiguration])
      && SBPeekConfigurationIsValid([v4 toPeekConfiguration])
      && v9 == v8)
    {
      goto LABEL_3;
    }
    if (SBPeekConfigurationIsValid([v4 fromPeekConfiguration])
      && !SBPeekConfigurationIsValid([v4 toPeekConfiguration])
      && v9 == v8)
    {
      v39 = [SBFullScreenToHomeSlideOverSwitcherModifier alloc];
      v40 = [v4 toAppLayout];
      v14 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)v39 initWithTransitionID:v10 appLayout:v40 direction:0];

      [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setShouldBlurUnreadyScenes:1];
      if (v5)
      {
LABEL_17:
        [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setShouldForceDefaultAnchorPointForTransition:1];
        goto LABEL_4;
      }
      goto LABEL_4;
    }
    if ([v4 isSlideOverToFullScreenEvent]) {
      goto LABEL_3;
    }
    if ([(SBGridSwitcherModifier *)v9 isEqual:v8])
    {
      if (([v4 toFloatingSwitcherVisible] & 1) != 0
        || ![v4 fromFloatingSwitcherVisible])
      {
        goto LABEL_3;
      }
      v35 = SBAppUnderFloatingSwitcherTransitionSwitcherModifier;
      goto LABEL_47;
    }
    if ([v4 isGestureInitiated]) {
      goto LABEL_3;
    }
    if ([v4 isMoveDisplaysTransition])
    {
      uint64_t v46 = 1;
      v129 = [(SBGridSwitcherModifier *)v9 itemForLayoutRole:1];
      v47 = [(SBGridSwitcherModifier *)v9 itemForLayoutRole:2];
      v48 = [(SBGridSwitcherModifier *)v8 itemForLayoutRole:1];
      uint64_t v49 = [(SBGridSwitcherModifier *)v8 itemForLayoutRole:2];
      v50 = (void *)v49;
      v51 = 0;
      if (v47 && !v49)
      {
        if ((BSEqualObjects() & 1) != 0 || (uint64_t v46 = 2, BSEqualObjects())) {
          v51 = [[SBSplitRemovalSwitcherModifier alloc] initWithTransitionID:v10 fromAppLayout:v9 toAppLayout:v8 layoutRoleToRemove:v46 animationStyle:0];
        }
        else {
          v51 = 0;
        }
      }
      v57 = [[SBMoveDisplaysTransitionSwitcherModifier alloc] initWithTransitionEvent:v4];
      v14 = (SBPIPRestoreToFullScreenSwitcherModifier *)v57;
      if (v51) {
        [(SBChainableModifier *)v57 addChildModifier:v51];
      }

      goto LABEL_4;
    }
    if ([v4 isMorphFromPIPTransition])
    {
      v18 = [[SBDosidoSwitcherModifier alloc] initWithTransitionID:v10 fromAppLayout:v9 toAppLayout:v8 direction:0];
      [(SBGridSwitcherModifier *)v18 setShouldSuppressScaleAnimation:1];
      v14 = -[SBPIPRestoreToFullScreenSwitcherModifier initWithTransitionID:transitionModifier:fromAppLayout:toAppLayout:toLayoutRole:]([SBPIPRestoreToFullScreenSwitcherModifier alloc], "initWithTransitionID:transitionModifier:fromAppLayout:toAppLayout:toLayoutRole:", v10, v18, v9, v8, [v4 morphingPIPLayoutRole]);
      [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setShouldForceDefaultAnchorPointForTransition:v5];
      [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setShouldClippingTakeShadowIntoAccount:v5];
      goto LABEL_36;
    }
    if (([v4 isEnteringSplitViewPeekEvent] & 1) != 0
      || ([v4 isAnySplitViewToOrFromSlideOverEvent] & 1) != 0)
    {
      goto LABEL_3;
    }
    if ([v4 isCenterWindowToFullScreenEvent])
    {
      v36 = [[SBCenterWindowToFullScreenSwitcherModifier alloc] initWithTransitionID:v10 fullScreenWithCenterAppLayout:v9];
      goto LABEL_48;
    }
    if ([v4 isCenterWindowToSlideOverEvent]) {
      goto LABEL_3;
    }
    if ([v4 isCenterWindowToNewSplitViewEvent])
    {
      v36 = [[SBCenterWindowToNewSplitViewSwitcherModifier alloc] initWithTransitionID:v10 fromFullScreenAppLayout:v9 toSpaceAppLayout:v8];
      goto LABEL_48;
    }
    if ([v4 isCenterWindowToExistingSplitViewEvent])
    {
      v84 = SBCenterWindowToExistingSplitViewSwitcherModifier;
LABEL_121:
      v36 = (SBCenterWindowToFullScreenSwitcherModifier *)[[v84 alloc] initWithTransitionID:v10 fromAppLayout:v9 toAppLayout:v8];
      goto LABEL_48;
    }
    if ([v4 isCenterWindowRemovalEvent])
    {
      v37 = [v4 removalContextForAppLayout:v9];
      uint64_t v85 = [(SBFullScreenAppLayoutSwitcherModifier *)v37 animationStyle];
      v86 = [(SBFullScreenAppLayoutSwitcherModifier *)v37 displayItem];
      uint64_t v87 = [(SBGridSwitcherModifier *)v9 layoutRoleForItem:v86];

      if (!v87)
      {
        v14 = 0;
        goto LABEL_79;
      }
      if (v85 == 3)
      {
        v88 = SBWindowDeclineSwitcherModifier;
      }
      else
      {
        if (v85 != 2)
        {
          v14 = [[SBWindowDeleteSwitcherModifier alloc] initWithTransitionID:v10 fromAppLayout:v9 layoutRole:v87];
          if (([(SBFullScreenFluidSwitcherRootSwitcherModifier *)self isChamoisWindowingUIEnabled] & 1) == 0&& v87 == 4&& [(SBGridSwitcherModifier *)v9 centerConfiguration] == 2)
          {
            [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setUsePageFullScreenCenterWindowDeletion:1];
          }
          goto LABEL_79;
        }
        v88 = SBWindowCommitSwitcherModifier;
      }
      v38 = (SBHomeToGridSwitcherModifier *)[[v88 alloc] initWithTransitionID:v10 fromAppLayout:v9 layoutRole:v87];
LABEL_78:
      v14 = (SBPIPRestoreToFullScreenSwitcherModifier *)v38;
LABEL_79:

      goto LABEL_4;
    }
    if ([v4 isSplitViewToCenterWindowEvent])
    {
      v84 = SBSplitViewToCenterWindowSwitcherModifier;
      goto LABEL_121;
    }
    if ([v4 isSlideOverToCenterWindowEvent]) {
      goto LABEL_3;
    }
    if ([v4 isFullScreenToCenterWindowEvent])
    {
      v89 = [SBCenterWindowToFullScreenSwitcherModifier alloc];
      v18 = [v4 toAppLayout];
      v27 = [(SBCenterWindowToFullScreenSwitcherModifier *)v89 initWithTransitionID:v10 fullScreenWithCenterAppLayout:v18];
      goto LABEL_35;
    }
    if ([v4 isPresentingPageCenterWindowEvent]
      && (([v4 isNewSceneTransition] & 1) != 0 || objc_msgSend(v4, "isMorphFromInAppView")))
    {
      v90 = [SBCenterWindowPagePresentationSwitcherModifier alloc];
      uint64_t v91 = [v4 isMorphFromInAppView];
      v92 = v90;
      v93 = v10;
      v94 = v8;
LABEL_147:
      v36 = [(SBCenterWindowPagePresentationSwitcherModifier *)v92 initWithTransitionID:v93 toAppLayout:v94 isMorph:v91];
      goto LABEL_48;
    }
    if ([v4 isReplaceCenterWindowWithNewCenterWindowEvent])
    {
      if ([v4 isShelfTransition]) {
        goto LABEL_3;
      }
      v92 = [SBCenterWindowPagePresentationSwitcherModifier alloc];
      v93 = v10;
      v94 = v8;
      uint64_t v91 = 0;
      goto LABEL_147;
    }
    if (!v8) {
      goto LABEL_3;
    }
    v128 = [(SBGridSwitcherModifier *)v9 itemForLayoutRole:1];
    v130 = [(SBGridSwitcherModifier *)v8 itemForLayoutRole:1];
    v127 = [(SBGridSwitcherModifier *)v8 itemForLayoutRole:2];
    v95 = [(SBGridSwitcherModifier *)v9 itemForLayoutRole:2];
    if (!v95)
    {
LABEL_159:
      if (([(SBGridSwitcherModifier *)v9 hasSameItemsInLayoutRoles:16 asAppLayout:v8] & 1) == 0&& [(SBGridSwitcherModifier *)v9 hasSameItemsInLayoutRoles:6 asAppLayout:v8])
      {
        v107 = [v4 toAppExposeBundleID];
        if (v107)
        {
        }
        else
        {
          v120 = [v4 fromAppExposeBundleID];

          if (v120) {
            goto LABEL_185;
          }
        }
      }
      if ([v4 prefersCrossfadeTransition])
      {
LABEL_164:
        v14 = [[SBCrossfadeDosidoSwitcherModifier alloc] initWithTransitionID:v10 fromAppLayout:v9 toAppLayout:v8];
        [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setFullScreenTransition:v5 ^ 1];
        goto LABEL_186;
      }
      if ([(SBFullScreenFluidSwitcherRootSwitcherModifier *)self isDevicePad]
        && [v4 isFullScreenToSplitViewEvent])
      {
        v108 = [(SBGridSwitcherModifier *)v8 itemForLayoutRole:2];
        v109 = [[SBFullScreenToSplitViewSwitcherModifier alloc] initWithTransitionID:v10 fromAppLayout:v9 toAppLayout:v8];
        v14 = [[SBSplitDisplayItemSwitcherModifier alloc] initWithDisplayItem:v108 wrappingModifier:v109];
LABEL_168:

LABEL_174:
        goto LABEL_186;
      }
      if ([v4 isSwappingFullScreenAppSidesEvent])
      {
        v108 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self leafAppLayoutForKeyboardFocusedScene];
        v110 = [(SBGridSwitcherModifier *)v9 leafAppLayoutForRole:1];
        if (v110 == v108) {
          uint64_t v111 = 1;
        }
        else {
          uint64_t v111 = 2;
        }

        v14 = [[SBSwapFullScreenAppSidesSwitcherModifier alloc] initWithTransitionID:v10 fromAppLayout:v9 toAppLayout:v8 layoutRoleToKeepOnTop:v111];
        goto LABEL_174;
      }
      if (([v4 isCenterWindowZoomingUpFromShelfEvent] & 1) == 0)
      {
        if ([(SBFullScreenFluidSwitcherRootSwitcherModifier *)self isDevicePad]
          && ![v4 dosidoTransitionDirection])
        {
          if (BSEqualObjects())
          {
            unsigned int v121 = (v130 != 0) & ~BSEqualObjects();
            if (v127) {
              unsigned int v122 = v121;
            }
            else {
              unsigned int v122 = 0;
            }
          }
          else
          {
            unsigned int v122 = 0;
          }
          if (BSEqualObjects()) {
            unsigned int v123 = (v127 != 0) & ~BSEqualObjects();
          }
          else {
            unsigned int v123 = 0;
          }
          if ((v122 | v123) == 1)
          {
            v124 = [SBSplitDisplayItemCrossblurSwitcherModifier alloc];
            if (v123) {
              uint64_t v125 = 2;
            }
            else {
              uint64_t v125 = 1;
            }
            v126 = [(SBSplitDisplayItemCrossblurSwitcherModifier *)v124 initWithTransitionID:v10 fromAppLayout:v9 toAppLayout:v8 layoutRole:v125];
          }
          else
          {
            v126 = -[SBCrossblurDosidoSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:direction:]([SBCrossblurDosidoSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:direction:", v10, v9, v8, [v4 isBreadcrumbTransition]);
          }
          v14 = (SBPIPRestoreToFullScreenSwitcherModifier *)v126;
          goto LABEL_186;
        }
        v112 = [v4 appLayoutsWithRemovalContexts];
        uint64_t v113 = [v112 count];

        if (v113) {
          goto LABEL_164;
        }
        uint64_t v114 = [v4 dosidoTransitionDirection];
        unsigned int v115 = [v4 isBreadcrumbTransition];
        if (v114 == 2) {
          uint64_t v116 = 1;
        }
        else {
          uint64_t v116 = v115;
        }
        v117 = [[SBDosidoSwitcherModifier alloc] initWithTransitionID:v10 fromAppLayout:v9 toAppLayout:v8 direction:v116];
        [(SBDosidoSwitcherModifier *)v117 setShouldSuppressScaleAnimation:v114 != 0];
        v108 = v117;
        v109 = [v4 zoomFromHardwareButtonPreludeTokenWrapper];
        v14 = (SBPIPRestoreToFullScreenSwitcherModifier *)v108;
        if ([(SBFullScreenToSplitViewSwitcherModifier *)v109 isTokenAvailable])
        {
          v118 = [SBCaptureDropletZoomSwitcherModifier alloc];
          v119 = [(SBFullScreenToSplitViewSwitcherModifier *)v109 consumeToken];
          v14 = [(SBCaptureDropletZoomSwitcherModifier *)v118 initWithTransitionID:v10 zoomModifier:v108 appLayout:v8 launchPreludeAnimationToken:v119];
        }
        goto LABEL_168;
      }
LABEL_185:
      v14 = 0;
      goto LABEL_186;
    }
    v96 = [(SBGridSwitcherModifier *)v8 itemForLayoutRole:2];
    if (v96)
    {
    }
    else if (BSEqualObjects())
    {
      v97 = [SBSplitRemovalSwitcherModifier alloc];
      v98 = [v4 removalContextForAppLayout:v9];
      uint64_t v99 = [v98 animationStyle];
      v100 = v97;
      v101 = v10;
      v102 = v9;
      v103 = v8;
      uint64_t v104 = 1;
      goto LABEL_158;
    }
    v105 = [(SBGridSwitcherModifier *)v8 itemForLayoutRole:2];
    if (v105)
    {

      goto LABEL_159;
    }
    if (!BSEqualObjects()) {
      goto LABEL_159;
    }
    v106 = [SBSplitRemovalSwitcherModifier alloc];
    v98 = [v4 removalContextForAppLayout:v9];
    uint64_t v99 = [v98 animationStyle];
    v100 = v106;
    v101 = v10;
    v102 = v9;
    v103 = v8;
    uint64_t v104 = 2;
LABEL_158:
    v14 = [(SBSplitRemovalSwitcherModifier *)v100 initWithTransitionID:v101 fromAppLayout:v102 toAppLayout:v103 layoutRoleToRemove:v104 animationStyle:v99];

LABEL_186:
    goto LABEL_4;
  }
  if (v6 == 2)
  {
    if (v7 == 2)
    {
      v35 = SBGridSwipeUpToSwitcherSwitcherModifier;
LABEL_47:
      v36 = (SBCenterWindowToFullScreenSwitcherModifier *)[[v35 alloc] initWithTransitionID:v10];
LABEL_48:
      v14 = (SBPIPRestoreToFullScreenSwitcherModifier *)v36;
      goto LABEL_4;
    }
    if (v7 != 1)
    {
      if (v7 != 3) {
        goto LABEL_3;
      }
      if (SBPeekConfigurationIsValid([v4 toPeekConfiguration]))
      {
        v37 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
        v38 = [(SBHomeToSwitcherSwitcherModifier *)[SBHomeToGridSwitcherModifier alloc] initWithTransitionID:v10 direction:1 multitaskingModifier:v37];
      }
      else
      {
        if (v12 != 1) {
          goto LABEL_3;
        }
        v37 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
        v38 = [[SBDeckToFullScreenSwitcherModifier alloc] initWithTransitionID:v10 direction:1 fullScreenAppLayout:v9 deckModifier:v37];
      }
      goto LABEL_78;
    }
    if (v12 != 1) {
      goto LABEL_3;
    }
    v28 = [SBHomeToDeckSwitcherModifier alloc];
    v18 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
    v29 = v28;
    v30 = v10;
    uint64_t v31 = 1;
LABEL_66:
    v27 = [(SBHomeToSwitcherSwitcherModifier *)v29 initWithTransitionID:v30 direction:v31 multitaskingModifier:v18];
    goto LABEL_35;
  }
  if (v6 != 1) {
    goto LABEL_3;
  }
  if (v7 == 2)
  {
    if (SBPeekConfigurationIsValid([v4 toPeekConfiguration]))
    {
      v33 = SBHomeToGridSwitcherModifier;
    }
    else
    {
      if (v12 != 1) {
        goto LABEL_3;
      }
      v33 = SBHomeToDeckSwitcherModifier;
    }
    v41 = (SBHomeToDeckSwitcherModifier *)[v33 alloc];
    v18 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
    v29 = v41;
    v30 = v10;
    uint64_t v31 = 0;
    goto LABEL_66;
  }
  if (v7 != 3
    || ([v4 isEnteringSlideOverPeekEvent] & 1) != 0
    || ([v4 isEnteringAnyPeekEvent] & 1) != 0)
  {
    goto LABEL_3;
  }
  if ([v4 prefersCrossfadeTransition])
  {
    v14 = [[SBCrossfadeDosidoSwitcherModifier alloc] initWithTransitionID:v10 fromAppLayout:v9 toAppLayout:v8];
    [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setFullScreenTransition:v5 ^ 1];
    goto LABEL_4;
  }
  if ([v4 isExitingSplitViewPeekToHomeScreenEvent])
  {
    v52 = [SBPeekToOffscreenSwitcherModifier alloc];
    v18 = [v4 fromAppLayout];
    v27 = -[SBPeekToOffscreenSwitcherModifier initWithTransitionID:peekingAppLayout:peekConfiguration:spaceConfiguration:](v52, "initWithTransitionID:peekingAppLayout:peekConfiguration:spaceConfiguration:", v10, v18, [v4 fromPeekConfiguration], objc_msgSend(v4, "fromSpaceConfiguration"));
    goto LABEL_35;
  }
  if (!v9) {
    goto LABEL_3;
  }
  v14 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _entityRemovalModifierForMainTransitionEvent:v4];
  if (!v14)
  {
    if ([v4 isIconZoomDisabled])
    {
      CGFloat v53 = *MEMORY[0x1E4F1DB20];
      CGFloat v54 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v55 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v56 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    else
    {
      [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self homeScreenIconFrameForAppLayout:v9];
      CGFloat v53 = v58;
      CGFloat v54 = v59;
      CGFloat v55 = v60;
      CGFloat v56 = v61;
    }
    if ([v4 isMorphToPIPTransition])
    {
      v14 = -[SBFullScreenToHomePIPSwitcherModifier initWithTransitionID:appLayout:layoutRole:]([SBFullScreenToHomePIPSwitcherModifier alloc], "initWithTransitionID:appLayout:layoutRole:", v10, v9, [v4 morphingPIPLayoutRole]);
      [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setShouldForceDefaultAnchorPointForTransition:v5];
      [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setShouldClippingTakeShadowIntoAccount:v5];
      goto LABEL_4;
    }
    v62 = [v4 fromAppLayout];
    BOOL v63 = [(SBSwitcherModifier *)self shouldZoomToSystemApertureForEvent:v4 activeLayout:v62];

    if (v63)
    {
      v64 = [[SBFullScreenToHomeIconZoomSwitcherModifier alloc] initWithTransitionID:v10 appLayout:v9 direction:1];
      [(SBFullScreenToHomeIconZoomSwitcherModifier *)v64 setShouldForceDefaultAnchorPointForTransition:v5];
      [(SBFullScreenToHomeIconZoomSwitcherModifier *)v64 setShouldDockOrderFrontDuringTransition:v5];
      v65 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self appLayouts];
      uint64_t v66 = [v65 indexOfObject:v9];

      v67 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self currentVelocityValueForVisibleAppLayout:v9 key:@"position"];
      [v67 CGPointValue];
      double v69 = v68;
      double v71 = v70;

      [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self frameForIndex:v66];
      double v73 = v72;
      double v75 = v74;
      double v77 = v76;
      double v79 = v78;
      [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self scaleForIndex:v66];
      v14 = -[SBFullScreenToHomeSystemApertureSwitcherModifier initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:]([SBFullScreenToHomeSystemApertureSwitcherModifier alloc], "initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:", v10, v64, v9, 1, v73, v75, v77, v79, v80, v69, v71);

      goto LABEL_4;
    }
    if ([v4 isMoveDisplaysTransition])
    {
      v36 = [[SBMoveDisplaysTransitionSwitcherModifier alloc] initWithTransitionEvent:v4];
      goto LABEL_48;
    }
    v132.origin.x = v53;
    v132.origin.y = v54;
    v132.size.width = v55;
    v132.size.height = v56;
    if (CGRectIsNull(v132) || ([v4 isMoveDisplaysTransition] & 1) != 0)
    {
      v81 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self switcherSettings];
      [v81 switcherCenterYOffsetPercentOfScreenHeight];
      double v83 = v82;

      v22 = [[SBFullScreenToHomeCenterZoomDownSwitcherModifier alloc] initWithTransitionID:v10 appLayout:v9 offsetYPercentOfScreenHeight:v83];
LABEL_16:
      v14 = (SBPIPRestoreToFullScreenSwitcherModifier *)v22;
      if (!v5) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
    v14 = [[SBFullScreenToHomeIconZoomSwitcherModifier alloc] initWithTransitionID:v10 appLayout:v9 direction:1];
    [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setShouldForceDefaultAnchorPointForTransition:v5];
    [(SBPIPRestoreToFullScreenSwitcherModifier *)v14 setShouldDockOrderFrontDuringTransition:v5];
  }
LABEL_4:

  return v14;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fromAppLayout];
  uint64_t v5 = [v3 toAppLayout];
  uint64_t v6 = [v3 fromEnvironmentMode];
  uint64_t v7 = [v3 toEnvironmentMode];
  int v8 = BSEqualObjects();
  id v9 = 0;
  BOOL v11 = v6 == 3 || v7 == 3;
  if (!v8 && v11)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = [v3 fromDisplayItemsPendingTermination];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__SBFullScreenFluidSwitcherRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke;
    v16[3] = &unk_1E6AF4B38;
    id v13 = v4;
    id v17 = v13;
    char v14 = objc_msgSend(v12, "bs_containsObjectPassingTest:", v16);

    if (v13 && (v14 & 1) == 0) {
      [v9 addObject:v13];
    }
    if (v5) {
      [v9 addObject:v5];
    }
  }
  return v9;
}

uint64_t __95__SBFullScreenFluidSwitcherRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsItem:a2];
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 gestureID];
  uint64_t v6 = 0;
  switch([v4 gestureType])
  {
    case 1:
      uint64_t v7 = [SBHomeGestureRootSwitcherModifier alloc];
      int64_t v8 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _effectiveEnvironmentMode];
      id v9 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
      uint64_t v6 = [(SBHomeGestureRootSwitcherModifier *)v7 initWithStartingEnvironmentMode:v8 multitaskingModifier:v9];

      [(SBHomeGestureRootSwitcherModifier *)v6 setResignsTransitionIntoAppSwitcher:1];
      break;
    case 2:
      v10 = SBGridSwipeUpGestureSwitcherModifier;
      goto LABEL_5;
    case 4:
      v10 = SBMoveFloatingOverFullScreenGestureSwitcherModifier;
LABEL_5:
      uint64_t v6 = (SBHomeGestureRootSwitcherModifier *)[[v10 alloc] initWithGestureID:v5];
      break;
    case 7:
      BOOL v11 = [v4 selectedAppLayout];
      uint64_t v12 = [v11 configuration];

      uint64_t v13 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(v12);
      char v14 = [SBSceneResizeGestureRootSwitcherModifier alloc];
      unint64_t v15 = [v4 selectedAppLayout];
      uint64_t v6 = [(SBSceneResizeGestureRootSwitcherModifier *)v14 initWithAppLayout:v15 spaceConfiguration:v13];

      break;
    default:
      break;
  }

  return v6;
}

- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3
{
  if ([(SBFullScreenFluidSwitcherRootSwitcherModifier *)self isReduceMotionEnabled])id v3 = objc_alloc_init(SBReduceMotionSwitcherModifier); {
  else
  }
    id v3 = 0;
  return v3;
}

- (id)_entityRemovalModifierForMainTransitionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fromAppLayout];
  if (v5)
  {
    uint64_t v6 = [v4 removalContextForAppLayout:v5];
    if (v6)
    {
      id v7 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _newMultitaskingModifier];
      uint64_t v8 = [v6 animationStyle];
      if (SBReduceMotion() || v8 == 1)
      {
        char v14 = [SBEntityRemovalCrossblurSwitcherModifier alloc];
        unint64_t v15 = [v4 transitionID];
        v16 = [v4 fromAppLayout];
        uint64_t v13 = [(SBEntityRemovalCrossblurSwitcherModifier *)v14 initWithTransitionID:v15 appLayout:v16 multitaskingModifier:v7];
      }
      else
      {
        id v9 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self entityRemovalSettings];
        v10 = v9;
        BOOL v11 = v8 == 2;
        BOOL v12 = v8 != 2;
        if (v11) {
          [v9 dosidoCommitIntentAnimationSettings];
        }
        else {
        unint64_t v15 = [v9 dosidoDeclineIntentAnimationSettings];
        }

        id v17 = [SBEntityRemovalSlideOffscreenSwitcherModifier alloc];
        v16 = [v4 transitionID];
        v18 = [v4 fromAppLayout];
        uint64_t v13 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)v17 initWithTransitionID:v16 appLayout:v18 direction:v12 animationSettings:v15 multitaskingModifier:v7];
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  id v3 = a3;
  id v4 = [SBInsertionSwitcherModifier alloc];
  uint64_t v5 = [v3 appLayout];

  uint64_t v6 = [(SBInsertionSwitcherModifier *)v4 initWithAppLayout:v5];
  return v6;
}

- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3
{
  id v3 = a3;
  id v4 = [SBSwipeToKillSwitcherModifier alloc];
  uint64_t v5 = [v3 layoutRole];
  uint64_t v6 = [v3 appLayout];

  id v7 = [(SBSwipeToKillSwitcherModifier *)v4 initWithLayoutRole:v5 inAppLayout:v6 fadeOutSwipedItems:0];
  return v7;
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

- (id)lowEndHardwareModifier
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = objc_msgSend(v2, "sbf_animatedBlurRadiusGraphicsQuality");

  id v4 = +[SBPlatformController sharedInstance];
  uint64_t v5 = [v4 medusaCapabilities];

  uint64_t v6 = 3;
  if (v3 == 100) {
    uint64_t v6 = 0;
  }
  if (v5 == 1) {
    uint64_t v7 = v6 | 4;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = [[SBLowEndHardwareSwitcherModifier alloc] initWithSimplificationOptions:v7];
  return v8;
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  uint64_t v3 = objc_alloc_init(SBScrollingSwitcherModifier);
  return v3;
}

- (int64_t)_effectiveEnvironmentMode
{
  id v4 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBFullScreenFluidSwitcherRootSwitcherModifier.m" lineNumber:611 description:@"Can't determine the effective environment mode without a floor modifier"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v5 = 3;
    }
    else {
      int64_t v5 = 2 * (v4 != 0);
    }
  }

  return v5;
}

- (id)_newMultitaskingModifier
{
  v2 = [(SBFullScreenFluidSwitcherRootSwitcherModifier *)self _defaultMultitaskingModifierClass];
  return objc_alloc_init(v2);
}

@end