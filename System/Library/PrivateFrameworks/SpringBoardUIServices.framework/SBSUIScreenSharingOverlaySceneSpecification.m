@interface SBSUIScreenSharingOverlaySceneSpecification
- (id)defaultExtensions;
- (id)uiSceneSessionRole;
@end

@implementation SBSUIScreenSharingOverlaySceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken_0 != -1) {
    dispatch_once(&uiSceneSessionRole_onceToken_0, &__block_literal_global_2);
  }
  return @"SBSUIWindowSceneSessionRoleScreenSharingOverlay";
}

void __65__SBSUIScreenSharingOverlaySceneSpecification_uiSceneSessionRole__block_invoke()
{
  id v1 = [MEMORY[0x1E4F433E0] sharedFactory];
  v0 = objc_opt_new();
  [v1 _registerBuilder:v0 forRole:@"SBSUIWindowSceneSessionRoleScreenSharingOverlay"];
}

- (id)defaultExtensions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBSUIScreenSharingOverlaySceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v7 defaultExtensions];
  uint64_t v3 = [v2 count];
  uint64_t v4 = objc_opt_class();
  if (v3)
  {
    [v2 arrayByAddingObject:v4];
  }
  else
  {
    v8[0] = v4;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5 = };

  return v5;
}

@end