@interface SBSUIProximityReaderSceneSpecification
- (id)defaultExtensions;
- (id)uiSceneSessionRole;
@end

@implementation SBSUIProximityReaderSceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken_2 != -1) {
    dispatch_once(&uiSceneSessionRole_onceToken_2, &__block_literal_global_20);
  }
  return @"SBSUIWindowSceneSessionRoleProximityReader";
}

void __60__SBSUIProximityReaderSceneSpecification_uiSceneSessionRole__block_invoke()
{
  id v1 = [MEMORY[0x1E4F433E0] sharedFactory];
  v0 = objc_opt_new();
  [v1 _registerBuilder:v0 forRole:@"SBSUIWindowSceneSessionRoleProximityReader"];
}

- (id)defaultExtensions
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

@end