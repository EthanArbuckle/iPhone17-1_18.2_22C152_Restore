@interface Sync
@end

@implementation Sync

void __pk_Sync_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.passkit", "Sync");
  v1 = (void *)pk_Sync_log___logger;
  pk_Sync_log___logger = (uint64_t)v0;
}

@end