@interface ToolKitCascadeSyncEngine
- (void)handleToolKitDatabaseChangedNotificationWithNotification:(id)a3;
@end

@implementation ToolKitCascadeSyncEngine

- (void)handleToolKitDatabaseChangedNotificationWithNotification:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1C7E13940(v3);

  swift_release();
}

@end