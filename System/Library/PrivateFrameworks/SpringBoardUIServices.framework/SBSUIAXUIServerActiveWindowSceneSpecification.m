@interface SBSUIAXUIServerActiveWindowSceneSpecification
- (id)uiSceneSessionRole;
@end

@implementation SBSUIAXUIServerActiveWindowSceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken != -1) {
    dispatch_once(&uiSceneSessionRole_onceToken, &__block_literal_global_1);
  }
  return @"SBSUIWindowSceneSessionRoleAXUIServerActiveWindowScene";
}

void __67__SBSUIAXUIServerActiveWindowSceneSpecification_uiSceneSessionRole__block_invoke()
{
  id v1 = [MEMORY[0x1E4F433E0] sharedFactory];
  v0 = objc_opt_new();
  [v1 _registerBuilder:v0 forRole:@"SBSUIWindowSceneSessionRoleAXUIServerActiveWindowScene"];
}

@end