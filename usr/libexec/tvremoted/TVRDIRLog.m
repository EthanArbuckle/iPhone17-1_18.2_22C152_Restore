@interface TVRDIRLog
@end

@implementation TVRDIRLog

void ___TVRDIRLog_block_invoke(id a1)
{
  _TVRDIRLog_log = (uint64_t)os_log_create("com.apple.tvremoted", "IntelligentRouting");

  _objc_release_x1();
}

@end