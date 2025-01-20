@interface ToolKitIndexingScheduler
- (BOOL)reindexWithDebouncer:(id)a3 error:(id *)a4;
- (void)requestReindexAfterFirstUnlock;
- (void)requestReindexForAppIntentsMetadataChangedNotificationWithNotification:(id)a3;
- (void)requestReindexForAppProtectionStateChangeWithNotification:(id)a3;
- (void)requestReindexForDaemonWakeupRequest;
- (void)requestReindexForLanguageChangeWithNotification:(id)a3;
@end

@implementation ToolKitIndexingScheduler

- (void)requestReindexForAppIntentsMetadataChangedNotificationWithNotification:(id)a3
{
}

- (void)requestReindexForAppProtectionStateChangeWithNotification:(id)a3
{
}

- (void)requestReindexForLanguageChangeWithNotification:(id)a3
{
}

- (void)requestReindexAfterFirstUnlock
{
}

- (void)requestReindexForDaemonWakeupRequest
{
}

- (BOOL)reindexWithDebouncer:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  sub_1C7DC3B7C(v4);

  swift_release();
  return 1;
}

@end