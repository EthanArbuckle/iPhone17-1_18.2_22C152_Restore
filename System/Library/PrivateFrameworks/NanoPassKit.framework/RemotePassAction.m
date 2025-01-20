@interface RemotePassAction
@end

@implementation RemotePassAction

void __pk_RemotePassAction_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.passkit", "RemotePassAction");
  v1 = (void *)pk_RemotePassAction_log___logger;
  pk_RemotePassAction_log___logger = (uint64_t)v0;
}

@end