@interface SBSUICameraOverlaySceneSpecification
- (id)defaultExtensions;
- (id)uiSceneSessionRole;
@end

@implementation SBSUICameraOverlaySceneSpecification

- (id)defaultExtensions
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken_4 != -1) {
    dispatch_once(&uiSceneSessionRole_onceToken_4, &__block_literal_global_33);
  }
  return @"SBSUIWindowSceneSessionRoleCameraOverlay";
}

void __58__SBSUICameraOverlaySceneSpecification_uiSceneSessionRole__block_invoke()
{
  id v1 = [MEMORY[0x1E4F433E0] sharedFactory];
  v0 = objc_opt_new();
  [v1 _registerBuilder:v0 forRole:@"SBSUIWindowSceneSessionRoleCameraOverlay"];
}

@end