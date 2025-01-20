@interface SBSUILiquidDetectionSceneSpecification
- (id)uiSceneSessionRole;
@end

@implementation SBSUILiquidDetectionSceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken_5 != -1) {
    dispatch_once(&uiSceneSessionRole_onceToken_5, &__block_literal_global_39);
  }
  return @"SBSUIWindowSceneSessionRoleLiquidDetection";
}

void __60__SBSUILiquidDetectionSceneSpecification_uiSceneSessionRole__block_invoke()
{
  id v1 = [MEMORY[0x1E4F433E0] sharedFactory];
  v0 = objc_opt_new();
  [v1 _registerBuilder:v0 forRole:@"SBSUIWindowSceneSessionRoleLiquidDetection"];
}

@end