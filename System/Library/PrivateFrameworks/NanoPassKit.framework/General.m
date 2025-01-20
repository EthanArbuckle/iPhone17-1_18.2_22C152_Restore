@interface General
@end

@implementation General

void __pk_General_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.passkit", "General");
  v1 = (void *)pk_General_log___logger;
  pk_General_log___logger = (uint64_t)v0;
}

@end