@interface SharedAssertionLogger
@end

@implementation SharedAssertionLogger

void ___SharedAssertionLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "Assertions");
  v1 = (void *)_MergedGlobals_1112;
  _MergedGlobals_1112 = (uint64_t)v0;
}

@end