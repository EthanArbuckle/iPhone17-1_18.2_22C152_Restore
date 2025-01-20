@interface REMLogStore
+ (OS_os_log)OVERSIZED;
+ (OS_os_log)container;
+ (OS_os_log)read;
+ (OS_os_log)search;
+ (OS_os_log)stagedLightweightCoreDataMigration;
+ (OS_os_log)utility;
+ (OS_os_log)write;
+ (OS_os_log)xpc;
@end

@implementation REMLogStore

+ (OS_os_log)read
{
  if (read_onceToken != -1) {
    dispatch_once(&read_onceToken, &__block_literal_global_171);
  }
  v2 = (void *)read___log;

  return (OS_os_log *)v2;
}

+ (OS_os_log)write
{
  if (write_onceToken != -1) {
    dispatch_once(&write_onceToken, &__block_literal_global_174);
  }
  v2 = (void *)write___log;

  return (OS_os_log *)v2;
}

uint64_t __19__REMLogStore_read__block_invoke()
{
  read___log = (uint64_t)os_log_create("com.apple.reminderkit.store", "read");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)container
{
  if (container_onceToken != -1) {
    dispatch_once(&container_onceToken, &__block_literal_global_161);
  }
  v2 = (void *)container___log;

  return (OS_os_log *)v2;
}

uint64_t __24__REMLogStore_container__block_invoke()
{
  container___log = (uint64_t)os_log_create("com.apple.reminderkit.store", "container");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)stagedLightweightCoreDataMigration
{
  if (stagedLightweightCoreDataMigration_onceToken != -1) {
    dispatch_once(&stagedLightweightCoreDataMigration_onceToken, &__block_literal_global_164);
  }
  v2 = (void *)stagedLightweightCoreDataMigration___log;

  return (OS_os_log *)v2;
}

uint64_t __49__REMLogStore_stagedLightweightCoreDataMigration__block_invoke()
{
  stagedLightweightCoreDataMigration___log = (uint64_t)os_log_create("com.apple.reminderkit.store", "stagedLightweightCoreDataMigration");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)xpc
{
  if (xpc_onceToken_167 != -1) {
    dispatch_once(&xpc_onceToken_167, &__block_literal_global_169);
  }
  v2 = (void *)xpc___log_166;

  return (OS_os_log *)v2;
}

uint64_t __18__REMLogStore_xpc__block_invoke()
{
  xpc___log_166 = (uint64_t)os_log_create("com.apple.reminderkit.store", "xpc");

  return MEMORY[0x1F41817F8]();
}

uint64_t __20__REMLogStore_write__block_invoke()
{
  write___log = (uint64_t)os_log_create("com.apple.reminderkit.store", "write");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)search
{
  if (search_onceToken_177 != -1) {
    dispatch_once(&search_onceToken_177, &__block_literal_global_179);
  }
  v2 = (void *)search___log_176;

  return (OS_os_log *)v2;
}

uint64_t __21__REMLogStore_search__block_invoke()
{
  search___log_176 = (uint64_t)os_log_create("com.apple.reminderkit.store", "search");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)utility
{
  if (utility_onceToken_181 != -1) {
    dispatch_once(&utility_onceToken_181, &__block_literal_global_183);
  }
  v2 = (void *)utility___log_180;

  return (OS_os_log *)v2;
}

uint64_t __22__REMLogStore_utility__block_invoke()
{
  utility___log_180 = (uint64_t)os_log_create("com.apple.reminderkit.store", "utility");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)OVERSIZED
{
  if (OVERSIZED_onceToken != -1) {
    dispatch_once(&OVERSIZED_onceToken, &__block_literal_global_185);
  }
  v2 = (void *)OVERSIZED___log;

  return (OS_os_log *)v2;
}

uint64_t __24__REMLogStore_OVERSIZED__block_invoke()
{
  OVERSIZED___log = (uint64_t)os_log_create("com.apple.reminderkit.store", "OVERSIZED");

  return MEMORY[0x1F41817F8]();
}

@end