@interface SBAmbientWWDCTestRecipe
+ (BOOL)shouldRegisterTestRecipe;
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
- (void)windowSceneDidUpdate:(id)a3;
@end

@implementation SBAmbientWWDCTestRecipe

- (id)title
{
  return @"Domino WWDC";
}

- (void)windowSceneDidUpdate:(id)a3
{
}

- (void)handleVolumeIncrease
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v2 = [MEMORY[0x1E4F28EA0] notificationWithName:@"com.apple.ambient.autoscroll-widgets" object:0];
  [v3 postNotification:v2];
}

- (void)handleVolumeDecrease
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v5 = [WeakRetained ambientPresentationController];

  if (([v5 isPresented] & 1) == 0)
  {
    id v3 = v5;
    uint64_t v4 = 1;
    goto LABEL_5;
  }
  if ([v5 ambientDisplayStyle])
  {
    [v5 _setAmbientDisplayStyle:0];
    id v3 = v5;
    uint64_t v4 = 0;
LABEL_5:
    [v3 _updateAmbientTriggerState:v4 analogousTriggerEvents:0 withReason:@"SBAmbientPresentationReasonTestRecipe"];
    goto LABEL_7;
  }
  [v5 _setAmbientDisplayStyle:1];
LABEL_7:
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