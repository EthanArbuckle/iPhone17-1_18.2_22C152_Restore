@interface _SBUISwitcherPageServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
@end

@implementation _SBUISwitcherPageServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD5B200];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD3F570];
}

@end