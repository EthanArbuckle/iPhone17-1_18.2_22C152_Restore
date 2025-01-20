@interface UIKeyboardExtendedLog
@end

@implementation UIKeyboardExtendedLog

void ___UIKeyboardExtendedLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIKeyboardExtended");
  v1 = (void *)_UIKeyboardExtendedLog_log;
  _UIKeyboardExtendedLog_log = (uint64_t)v0;
}

@end