@interface EDMigrationBackgroundTask
@end

@implementation EDMigrationBackgroundTask

uint64_t __69___EDMigrationBackgroundTask_initWithSystemTask_migrator_cancelable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTaskExpiredWithRetryAfter:0 error:300.0];
}

@end