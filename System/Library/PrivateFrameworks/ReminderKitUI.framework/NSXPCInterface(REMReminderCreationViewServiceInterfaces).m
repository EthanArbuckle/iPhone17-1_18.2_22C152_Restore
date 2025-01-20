@interface NSXPCInterface(REMReminderCreationViewServiceInterfaces)
+ (id)rem_reminderCreationViewServiceViewControllerExportedInterface;
+ (uint64_t)rem_reminderCreationRemoteViewControllerExportedInterface;
@end

@implementation NSXPCInterface(REMReminderCreationViewServiceInterfaces)

+ (id)rem_reminderCreationViewServiceViewControllerExportedInterface
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C96DE60];
  v1 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v1 forSelector:sel_displayForCreationWithContext_completion_ argumentIndex:0 ofReply:0];

  return v0;
}

+ (uint64_t)rem_reminderCreationRemoteViewControllerExportedInterface
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9651E0];
}

@end