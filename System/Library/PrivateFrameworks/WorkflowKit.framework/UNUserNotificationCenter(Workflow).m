@interface UNUserNotificationCenter(Workflow)
+ (id)workflowNotificationCenter;
@end

@implementation UNUserNotificationCenter(Workflow)

+ (id)workflowNotificationCenter
{
  if (workflowNotificationCenter_onceToken != -1) {
    dispatch_once(&workflowNotificationCenter_onceToken, &__block_literal_global_50065);
  }
  v0 = (void *)workflowNotificationCenter_notificationCenter;
  return v0;
}

@end