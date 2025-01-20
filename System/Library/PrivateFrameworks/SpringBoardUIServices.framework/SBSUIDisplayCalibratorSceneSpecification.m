@interface SBSUIDisplayCalibratorSceneSpecification
- (id)uiSceneSessionRole;
@end

@implementation SBSUIDisplayCalibratorSceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken_3 != -1) {
    dispatch_once(&uiSceneSessionRole_onceToken_3, &__block_literal_global_27);
  }
  return @"SBSUIWindowSceneSessionRoleDisplayCalibrator";
}

void __62__SBSUIDisplayCalibratorSceneSpecification_uiSceneSessionRole__block_invoke()
{
  id v1 = [MEMORY[0x1E4F433E0] sharedFactory];
  v0 = objc_opt_new();
  [v1 _registerBuilder:v0 forRole:@"SBSUIWindowSceneSessionRoleDisplayCalibrator"];
}

@end