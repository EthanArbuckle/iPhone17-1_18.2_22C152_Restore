@interface SBAppSwitcherPageServiceRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)__shouldRemoteViewControllerFenceOperations;
@end

@implementation SBAppSwitcherPageServiceRemoteViewController

- (BOOL)__shouldRemoteViewControllerFenceOperations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33AAD28];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F35B1560];
}

@end