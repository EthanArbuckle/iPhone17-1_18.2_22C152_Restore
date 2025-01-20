@interface SBSUIInCallSceneClientSettingsDiffInspector
- (void)observeCallConnectedWithBlock:(id)a3;
- (void)observeExpanseHUDDodgingInsetsWithBlock:(id)a3;
- (void)observePreferredBackgroundActivitiesToSuppressWithBlock:(id)a3;
- (void)observePrefersBannersHiddenFromClonedDisplayWithBlock:(id)a3;
- (void)observePrefersHiddenWhenDismissedWithBlock:(id)a3;
- (void)observePrefersLockedIdleDurationOnCoversheet:(id)a3;
- (void)observeTransientOverlayHomeIndicatorAutoHiddenWithBlock:(id)a3;
@end

@implementation SBSUIInCallSceneClientSettingsDiffInspector

- (void)observePreferredBackgroundActivitiesToSuppressWithBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__SBSUIInCallSceneClientSettingsDiffInspector_observePreferredBackgroundActivitiesToSuppressWithBlock___block_invoke;
    v6[3] = &unk_1E5CCD2D8;
    id v7 = v4;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:2002 withBlock:v6];
  }
}

uint64_t __103__SBSUIInCallSceneClientSettingsDiffInspector_observePreferredBackgroundActivitiesToSuppressWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeTransientOverlayHomeIndicatorAutoHiddenWithBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__SBSUIInCallSceneClientSettingsDiffInspector_observeTransientOverlayHomeIndicatorAutoHiddenWithBlock___block_invoke;
    v6[3] = &unk_1E5CCD2D8;
    id v7 = v4;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:2004 withBlock:v6];
  }
}

uint64_t __103__SBSUIInCallSceneClientSettingsDiffInspector_observeTransientOverlayHomeIndicatorAutoHiddenWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeCallConnectedWithBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__SBSUIInCallSceneClientSettingsDiffInspector_observeCallConnectedWithBlock___block_invoke;
    v6[3] = &unk_1E5CCD2D8;
    id v7 = v4;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:2006 withBlock:v6];
  }
}

uint64_t __77__SBSUIInCallSceneClientSettingsDiffInspector_observeCallConnectedWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeExpanseHUDDodgingInsetsWithBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87__SBSUIInCallSceneClientSettingsDiffInspector_observeExpanseHUDDodgingInsetsWithBlock___block_invoke;
    v6[3] = &unk_1E5CCD2D8;
    id v7 = v4;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:2007 withBlock:v6];
  }
}

uint64_t __87__SBSUIInCallSceneClientSettingsDiffInspector_observeExpanseHUDDodgingInsetsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observePrefersBannersHiddenFromClonedDisplayWithBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __101__SBSUIInCallSceneClientSettingsDiffInspector_observePrefersBannersHiddenFromClonedDisplayWithBlock___block_invoke;
    v6[3] = &unk_1E5CCD2D8;
    id v7 = v4;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:2008 withBlock:v6];
  }
}

uint64_t __101__SBSUIInCallSceneClientSettingsDiffInspector_observePrefersBannersHiddenFromClonedDisplayWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observePrefersHiddenWhenDismissedWithBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90__SBSUIInCallSceneClientSettingsDiffInspector_observePrefersHiddenWhenDismissedWithBlock___block_invoke;
    v6[3] = &unk_1E5CCD2D8;
    id v7 = v4;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:2009 withBlock:v6];
  }
}

uint64_t __90__SBSUIInCallSceneClientSettingsDiffInspector_observePrefersHiddenWhenDismissedWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observePrefersLockedIdleDurationOnCoversheet:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __92__SBSUIInCallSceneClientSettingsDiffInspector_observePrefersLockedIdleDurationOnCoversheet___block_invoke;
    v6[3] = &unk_1E5CCD2D8;
    id v7 = v4;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:2011 withBlock:v6];
  }
}

uint64_t __92__SBSUIInCallSceneClientSettingsDiffInspector_observePrefersLockedIdleDurationOnCoversheet___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end