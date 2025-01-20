@interface SBSApplicationShortcutSystemPrivateIcon(SBHAdditions)
+ (uint64_t)sbh_defaultImage;
- (id)sbh_systemImage;
@end

@implementation SBSApplicationShortcutSystemPrivateIcon(SBHAdditions)

+ (uint64_t)sbh_defaultImage
{
  return objc_msgSend(MEMORY[0x1E4FA69E8], "sbh_defaultImage");
}

- (id)sbh_systemImage
{
  v1 = (void *)MEMORY[0x1E4FB1818];
  v2 = [a1 systemImageName];
  v3 = [v1 _systemImageNamed:v2];

  return v3;
}

@end