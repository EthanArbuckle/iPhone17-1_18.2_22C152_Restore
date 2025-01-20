@interface TVRDXPCLog
@end

@implementation TVRDXPCLog

void ___TVRDXPCLog_block_invoke(id a1)
{
  _TVRDXPCLog_log = (uint64_t)os_log_create("com.apple.tvremotecore.xpc", "Daemon");

  _objc_release_x1();
}

@end