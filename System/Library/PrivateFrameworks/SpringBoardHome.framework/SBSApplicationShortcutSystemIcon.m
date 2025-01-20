@interface SBSApplicationShortcutSystemIcon
@end

@implementation SBSApplicationShortcutSystemIcon

void __66__SBSApplicationShortcutSystemIcon_SBHAdditions__sbh_defaultImage__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  SBHBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 imageNamed:@"SBSApplicationShortcutSystemIcon_UnreadDot" inBundle:v3 compatibleWithTraitCollection:0];
  v2 = (void *)sbh_defaultImage___defaultImage;
  sbh_defaultImage___defaultImage = v1;
}

@end