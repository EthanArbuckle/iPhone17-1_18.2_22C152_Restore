@interface UIKeyboardLog
@end

@implementation UIKeyboardLog

void ___UIKeyboardLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "KeyboardUI");
  v1 = (void *)_UIKeyboardLog_log;
  _UIKeyboardLog_log = (uint64_t)v0;
}

@end