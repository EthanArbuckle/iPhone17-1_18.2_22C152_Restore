@interface SBSApplicationShortcutIcon
@end

@implementation SBSApplicationShortcutIcon

void __63__SBSApplicationShortcutIcon_ShortcutUIKit___scui_defaultImage__block_invoke()
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  ShortcutUIKitBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v0 imageNamed:@"UnreadDot" inBundle:v4 compatibleWithTraitCollection:0];
  uint64_t v2 = [v1 imageWithRenderingMode:2];
  v3 = (void *)_scui_defaultImage___defaultImage;
  _scui_defaultImage___defaultImage = v2;
}

@end