@interface UNUserNotificationCenter
@end

@implementation UNUserNotificationCenter

void __64__UNUserNotificationCenter_Workflow__workflowNotificationCenter__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F44680]);
  uint64_t v1 = [v0 initWithBundleIdentifier:*MEMORY[0x1E4FB4BE8]];
  v2 = (void *)workflowNotificationCenter_notificationCenter;
  workflowNotificationCenter_notificationCenter = v1;
}

@end