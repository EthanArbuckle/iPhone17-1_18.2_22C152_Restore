@interface SBDashBoardRootSwitcherModifier
- (BOOL)isHomeScreenContentRequired;
- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode;
- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3;
- (Class)_defaultMultitaskingModifierClass;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenScale;
- (id)_newMultitaskingModifier;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)floorModifierForTransitionEvent:(id)a3;
- (id)gestureModifierForGestureEvent:(id)a3;
- (id)multitaskingModifierForEvent:(id)a3;
- (id)transitionModifierForMainTransitionEvent:(id)a3;
@end

@implementation SBDashBoardRootSwitcherModifier

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 fromAppLayout];
  v5 = [v3 toAppLayout];
  uint64_t v6 = [v3 fromEnvironmentMode];
  uint64_t v7 = [v3 toEnvironmentMode];
  int v8 = BSEqualObjects();
  id v9 = 0;
  BOOL v11 = v6 == 3 || v7 == 3;
  if (!v8 && v11)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12 = [v3 fromDisplayItemsPendingTermination];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__SBDashBoardRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke;
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

uint64_t __81__SBDashBoardRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsItem:a2];
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  id v3 = [(SBDashBoardRootSwitcherModifier *)self switcherSettings];
  BOOL v4 = [v3 effectiveSwitcherStyle] == 1;

  return v4;
}

- (double)homeScreenScale
{
  char v3 = [(SBDashBoardRootSwitcherModifier *)self isEphemeralSwitcher];
  double result = 1.0;
  if ((v3 & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBDashBoardRootSwitcherModifier;
    [(SBDashBoardRootSwitcherModifier *)&v5 homeScreenScale];
  }
  return result;
}

- (double)homeScreenBackdropBlurProgress
{
  char v3 = [(SBDashBoardRootSwitcherModifier *)self isEphemeralSwitcher];
  double result = 0.0;
  if ((v3 & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBDashBoardRootSwitcherModifier;
    [(SBDashBoardRootSwitcherModifier *)&v5 homeScreenBackdropBlurProgress];
  }
  return result;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 0;
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  BOOL v4 = [SBHomeGestureRootSwitcherModifier alloc];
  id v5 = [(SBDashBoardRootSwitcherModifier *)self _newMultitaskingModifier];
  uint64_t v6 = [(SBHomeGestureRootSwitcherModifier *)v4 initWithStartingEnvironmentMode:3 multitaskingModifier:v5];

  [(SBHomeGestureRootSwitcherModifier *)v6 setResignsTransitionIntoAppSwitcher:1];
  return v6;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transitionID];
  uint64_t v6 = [v4 fromEnvironmentMode];
  uint64_t v7 = [v4 toEnvironmentMode];
  int v8 = [v4 fromAppLayout];
  id v9 = 0;
  if (v6 == 3 && v7 == 1)
  {
    if ([v4 isIconZoomDisabled])
    {
      uint64_t v10 = *MEMORY[0x1E4F1DB20];
      uint64_t v11 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
      uint64_t v12 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
      uint64_t v13 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
    }
    else
    {
      [(SBDashBoardRootSwitcherModifier *)self homeScreenIconFrameForAppLayout:v8];
    }
    if (CGRectIsNull(*(CGRect *)&v10))
    {
      char v14 = [(SBDashBoardRootSwitcherModifier *)self switcherSettings];
      [v14 switcherCenterYOffsetPercentOfScreenHeight];
      double v16 = v15;

      id v9 = [[SBFullScreenToHomeCenterZoomDownSwitcherModifier alloc] initWithTransitionID:v5 appLayout:v8 offsetYPercentOfScreenHeight:v16];
    }
    else
    {
      id v9 = [[SBFullScreenToHomeIconZoomSwitcherModifier alloc] initWithTransitionID:v5 appLayout:v8 direction:1];
      [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)v9 setShouldForceDefaultAnchorPointForTransition:0];
      [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)v9 setShouldDockOrderFrontDuringTransition:0];
    }
  }

  return v9;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  uint64_t v5 = [v3 toEnvironmentMode];
  if (v5 == 1)
  {
    uint64_t v7 = objc_alloc_init(SBHomeScreenSwitcherModifier);
    if (v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v5 != 3
    || ([v4 toAppLayout],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [[SBFullScreenAppLayoutSwitcherModifier alloc] initWithActiveAppLayout:v6], v6, !v7))
  {
LABEL_7:
    uint64_t v7 = objc_alloc_init(SBHomeScreenSwitcherModifier);
  }
LABEL_8:

  return v7;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  id v4 = [(SBDashBoardRootSwitcherModifier *)self _defaultMultitaskingModifierClass];
  uint64_t v5 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
  if (([v5 isMemberOfClass:v4] & 1) == 0)
  {
    id v6 = [(SBDashBoardRootSwitcherModifier *)self _newMultitaskingModifier];

    uint64_t v5 = v6;
  }
  return v5;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (Class)_defaultMultitaskingModifierClass
{
  id v3 = [(SBDashBoardRootSwitcherModifier *)self switcherSettings];
  [(SBDashBoardRootSwitcherModifier *)self isReduceMotionEnabled];
  [v3 effectiveSwitcherStyle];
  id v4 = (id)objc_opt_class();

  return (Class)v4;
}

- (id)_newMultitaskingModifier
{
  v2 = [(SBDashBoardRootSwitcherModifier *)self _defaultMultitaskingModifierClass];
  return objc_alloc_init(v2);
}

@end