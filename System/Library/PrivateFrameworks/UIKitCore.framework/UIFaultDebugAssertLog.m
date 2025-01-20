@interface UIFaultDebugAssertLog
@end

@implementation UIFaultDebugAssertLog

os_log_t ____UIFaultDebugAssertLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.UIKit", "DebugAssertion");
  qword_1EB264A88 = (uint64_t)result;
  return result;
}

@end