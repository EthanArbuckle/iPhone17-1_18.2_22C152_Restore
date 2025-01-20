@interface SBStatusBarForcedHiddenTestRecipe
- (id)title;
- (void)_toggleWithAnimationSettings:(id)a3;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBStatusBarForcedHiddenTestRecipe

- (id)title
{
  return @"Force StatusBar Hidden";
}

- (void)handleVolumeIncrease
{
  id v3 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.4];
  [(SBStatusBarForcedHiddenTestRecipe *)self _toggleWithAnimationSettings:v3];
}

- (void)handleVolumeDecrease
{
}

- (void)_toggleWithAnimationSettings:(id)a3
{
  _toggleWithAnimationSettings__enabled ^= 1u;
  id v3 = a3;
  v4 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
  v5 = [v4 layoutStatePrimaryElement];
  v6 = [v5 workspaceEntity];
  v7 = [v6 applicationSceneEntity];
  id v11 = [v7 sceneHandle];

  uint64_t v8 = _toggleWithAnimationSettings__enabled;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [v11 setStatusBarForceHidden:v8 forReason:v10 animationSettings:v3];
}

@end