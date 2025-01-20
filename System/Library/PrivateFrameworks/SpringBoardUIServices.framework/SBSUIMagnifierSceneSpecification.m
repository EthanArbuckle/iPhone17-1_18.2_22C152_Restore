@interface SBSUIMagnifierSceneSpecification
- (id)uiSceneSessionRole;
@end

@implementation SBSUIMagnifierSceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken_1 != -1) {
    dispatch_once(&uiSceneSessionRole_onceToken_1, &__block_literal_global_16);
  }
  return @"SBSUIWindowSceneSessionRoleMagnifier";
}

void __54__SBSUIMagnifierSceneSpecification_uiSceneSessionRole__block_invoke()
{
  id v1 = [MEMORY[0x1E4F433E0] sharedFactory];
  v0 = objc_opt_new();
  [v1 _registerBuilder:v0 forRole:@"SBSUIWindowSceneSessionRoleMagnifier"];
}

@end