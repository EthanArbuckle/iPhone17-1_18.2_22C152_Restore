@interface UICatalystFaultLog
@end

@implementation UICatalystFaultLog

void ___UICatalystFaultLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "CatalystUnsupportedIdiom");
  v1 = (void *)_MergedGlobals_1283;
  _MergedGlobals_1283 = (uint64_t)v0;
}

@end