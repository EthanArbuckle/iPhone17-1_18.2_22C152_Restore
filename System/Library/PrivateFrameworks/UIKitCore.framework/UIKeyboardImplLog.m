@interface UIKeyboardImplLog
@end

@implementation UIKeyboardImplLog

void ___UIKeyboardImplLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIKeyboardImpl");
  v1 = (void *)_UIKeyboardImplLog_log;
  _UIKeyboardImplLog_log = (uint64_t)v0;
}

@end