@interface REMSignpost
+ (OS_os_log)database;
+ (OS_os_log)sync;
@end

@implementation REMSignpost

+ (OS_os_log)database
{
  if (database_onceToken != -1) {
    dispatch_once(&database_onceToken, &__block_literal_global_146);
  }
  v2 = (void *)database___log;

  return (OS_os_log *)v2;
}

uint64_t __23__REMSignpost_database__block_invoke()
{
  database___log = (uint64_t)os_log_create("com.apple.reminderkit.signpost", "database");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)sync
{
  if (sync_onceToken != -1) {
    dispatch_once(&sync_onceToken, &__block_literal_global_150);
  }
  v2 = (void *)sync___log;

  return (OS_os_log *)v2;
}

uint64_t __19__REMSignpost_sync__block_invoke()
{
  sync___log = (uint64_t)os_log_create("com.apple.reminderkit.signpost", "sync");

  return MEMORY[0x1F41817F8]();
}

@end