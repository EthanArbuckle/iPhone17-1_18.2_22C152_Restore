@interface SBAmbientPresentationTestRecipe
+ (BOOL)shouldRegisterTestRecipe;
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
- (void)windowSceneDidUpdate:(id)a3;
@end

@implementation SBAmbientPresentationTestRecipe

- (id)title
{
  return @"Domino Presentation";
}

- (void)windowSceneDidUpdate:(id)a3
{
}

- (void)handleVolumeIncrease
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v3 = [WeakRetained ambientPresentationController];

  objc_msgSend(v3, "_updateAmbientTriggerState:analogousTriggerEvents:withReason:", objc_msgSend(v3, "isPresented") ^ 1, 0, @"SBAmbientPresentationReasonTestRecipe");
}

- (void)handleVolumeDecrease
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v3 = [WeakRetained ambientPresentationController];

  objc_msgSend(v3, "_setAmbientDisplayStyle:forReason:", objc_msgSend(v3, "ambientDisplayStyle") == 0, @"Test Recipe");
}

+ (BOOL)shouldRegisterTestRecipe
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  if (__sb__runningInSpringBoard()) {
    return SBFEffectiveDeviceClass() != 2;
  }
  id v3 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v2 = [v3 userInterfaceIdiom] != 1;

  return v2;
}

- (void).cxx_destruct
{
}

@end